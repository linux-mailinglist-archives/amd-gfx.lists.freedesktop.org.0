Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EB2CC8A4
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Dec 2020 22:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2656EADA;
	Wed,  2 Dec 2020 21:09:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9A6EAC1
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Dec 2020 21:09:15 +0000 (UTC)
Date: Wed, 02 Dec 2020 21:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606943354;
 bh=8hK96fOCQt5046pRTpW/cGEczrDW1wi2oTkHZbehs1U=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Sks0U1PcCoSmwNCXhtwR52WnRh4Era6OfZe7ZSas0/BRb/e8MdoGBSk8TaN0zaNYi
 1McLbP6176uK6ByrtoO0lOqgvMiet9QLEW02qJ9UtBZcAWsNVt8obMvZPgC0S921Rl
 RSWddrLAXGTpHtk3UaKo6r6JrJ9bFg5ufwfkSAh2H8wU2vHaIsjygcwFzBvHu4dimy
 Jef3/5HmeWx7v6ZvmfxlT8R9ORm5QLvfYqw2A/KPwmxulE5Cw76T2GrFWU2uxjOpnf
 yrRrea4TwC2ZFkULygaVksyECX/5Iyqr2dQVseoOOeNmbzA0Pc0R8jGO5i4rtAnVpC
 gMWnS8lSfQl8A==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] drm/amd/display: use FB pitch to fill dc_cursor_attributes
Message-ID: <MQH1AMaxxGNHvDgSEtK2JNe5VY7eXXhv0M8d9w2WD8@cp4-web-027.plabs.ch>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Instead of relying on pitch (in pixels) == width, use the FB pitch. This
is less confusing to readers, and works correctly if we ever support FBs
with a pitch (in pixels) != width.

This also makes the code symmetrical with fill_plane_buffer_attributes.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 35920e5c73e7..9e328101187e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7432,7 +7432,7 @@ static void handle_cursor_update(struct drm_plane *plane,
 	attributes.rotation_angle    = 0;
 	attributes.attribute_flags.value = 0;
 
-	attributes.pitch = attributes.width;
+	attributes.pitch = afb->base.pitches[0] / afb->base.format->cpp[0];
 
 	if (crtc_state->stream) {
 		mutex_lock(&adev->dm.dc_lock);
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
