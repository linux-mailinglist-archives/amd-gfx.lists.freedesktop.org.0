Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F841CC4E
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Sep 2021 21:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461D86E0B8;
	Wed, 29 Sep 2021 19:06:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62796E0B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Sep 2021 19:06:29 +0000 (UTC)
Date: Wed, 29 Sep 2021 19:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632942383;
 bh=2zRpPMSYOwEMoHucti8MQE7oGxlNAJZdR1g7TPhcoqM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=OwUlANPVGYMKyjG1lCTIBmfsyi5C0mpavD9KUedDhKQnnF8644/Nh6ZKtFOGfBcco
 n2VMILwu9d9Uig7WO2QrUn/aAbrACfKX40tzxXH+pbY+3nAtoT1tPPhtBG3oZEB0WK
 yc2pjZ1lfa+3YfqXtvLWxyGKSt4qGfowIRi+LoAmlWcmaqOLCM9q8xi7sZOqezicNj
 3qfLTAnrKULxzlkFBeezjouWaeVKXpv/vFG4EwF2VtXpLaRWOiz0jtbLoVMLrSjXh0
 jERY93jSn2ZmTxJZhVhEig6IatrVLV/EHBaJCNPmhEjRO7yM3AhO6RKpqLawg4zq/4
 FJ+0dyHV7xDCA==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: [PATCH v3 1/2] amd/display: check cursor plane matches underlying
 plane
Message-ID: <20210929190603.48890-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The current logic checks whether the cursor plane blending
properties match the primary plane's. However that's wrong,
because the cursor is painted on all planes underneath. If
the cursor is over the primary plane and the cursor plane,
it's painted on both pipes.

Iterate over the CRTC planes and check their scaling match
the cursor's.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 49 +++++++++++++------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3c7a8f869b40..6472c0032b54 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10505,18 +10505,18 @@ static int dm_check_crtc_cursor(struct drm_atomic=
_state *state,
 =09=09=09=09struct drm_crtc *crtc,
 =09=09=09=09struct drm_crtc_state *new_crtc_state)
 {
-=09struct drm_plane_state *new_cursor_state, *new_primary_state;
-=09int cursor_scale_w, cursor_scale_h, primary_scale_w, primary_scale_h;
+=09struct drm_plane *cursor =3D crtc->cursor, *underlying;
+=09struct drm_plane_state *new_cursor_state, *new_underlying_state;
+=09int i;
+=09int cursor_scale_w, cursor_scale_h, underlying_scale_w, underlying_scal=
e_h;
=20
 =09/* On DCE and DCN there is no dedicated hardware cursor plane. We get a
 =09 * cursor per pipe but it's going to inherit the scaling and
 =09 * positioning from the underlying pipe. Check the cursor plane's
-=09 * blending properties match the primary plane's. */
+=09 * blending properties match the underlying planes'. */
=20
-=09new_cursor_state =3D drm_atomic_get_new_plane_state(state, crtc->cursor=
);
-=09new_primary_state =3D drm_atomic_get_new_plane_state(state, crtc->prima=
ry);
-=09if (!new_cursor_state || !new_primary_state ||
-=09    !new_cursor_state->fb || !new_primary_state->fb) {
+=09new_cursor_state =3D drm_atomic_get_new_plane_state(state, cursor);
+=09if (!new_cursor_state || !new_cursor_state->fb) {
 =09=09return 0;
 =09}
=20
@@ -10525,15 +10525,34 @@ static int dm_check_crtc_cursor(struct drm_atomic=
_state *state,
 =09cursor_scale_h =3D new_cursor_state->crtc_h * 1000 /
 =09=09=09 (new_cursor_state->src_h >> 16);
=20
-=09primary_scale_w =3D new_primary_state->crtc_w * 1000 /
-=09=09=09 (new_primary_state->src_w >> 16);
-=09primary_scale_h =3D new_primary_state->crtc_h * 1000 /
-=09=09=09 (new_primary_state->src_h >> 16);
+=09for_each_new_plane_in_state_reverse(state, underlying, new_underlying_s=
tate, i) {
+=09=09/* Narrow down to non-cursor planes on the same CRTC as the cursor *=
/
+=09=09if (new_underlying_state->crtc !=3D crtc || underlying =3D=3D crtc->=
cursor)
+=09=09=09continue;
=20
-=09if (cursor_scale_w !=3D primary_scale_w ||
-=09    cursor_scale_h !=3D primary_scale_h) {
-=09=09drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match primar=
y plane\n");
-=09=09return -EINVAL;
+=09=09/* Ignore disabled planes */
+=09=09if (!new_underlying_state->fb)
+=09=09=09continue;
+
+=09=09underlying_scale_w =3D new_underlying_state->crtc_w * 1000 /
+=09=09=09=09     (new_underlying_state->src_w >> 16);
+=09=09underlying_scale_h =3D new_underlying_state->crtc_h * 1000 /
+=09=09=09=09     (new_underlying_state->src_h >> 16);
+
+=09=09if (cursor_scale_w !=3D underlying_scale_w ||
+=09=09    cursor_scale_h !=3D underlying_scale_h) {
+=09=09=09drm_dbg_atomic(crtc->dev,
+=09=09=09=09       "Cursor [PLANE:%d:%s] scaling doesn't match underlying =
[PLANE:%d:%s]\n",
+=09=09=09=09       cursor->base.id, cursor->name, underlying->base.id, und=
erlying->name);
+=09=09=09return -EINVAL;
+=09=09}
+
+=09=09/* If this plane covers the whole CRTC, no need to check planes unde=
rneath */
+=09=09if (new_underlying_state->crtc_x <=3D 0 &&
+=09=09    new_underlying_state->crtc_y <=3D 0 &&
+=09=09    new_underlying_state->crtc_x + new_underlying_state->crtc_w >=3D=
 new_crtc_state->mode.hdisplay &&
+=09=09    new_underlying_state->crtc_y + new_underlying_state->crtc_h >=3D=
 new_crtc_state->mode.vdisplay)
+=09=09=09break;
 =09}
=20
 =09return 0;
--=20
2.33.0


