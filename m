Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2333413B
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Mar 2021 16:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141486EA37;
	Wed, 10 Mar 2021 15:12:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34166EA37
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 15:12:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id F06ED3A764D
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 14:50:50 +0000 (UTC)
X-Originating-IP: 82.65.230.196
Received: from localhost.localdomain (82-65-230-196.subs.proxad.net
 [82.65.230.196]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E96EF20004;
 Wed, 10 Mar 2021 14:50:27 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/5] amd/display: check cursor plane matches underlying
 plane
Date: Wed, 10 Mar 2021 15:50:16 +0100
Message-Id: <20210310145019.2877-3-contact@emersion.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310145019.2877-1-contact@emersion.fr>
References: <20210310145019.2877-1-contact@emersion.fr>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The current logic checks whether the cursor plane blending
properties match the primary plane's. However that's wrong,
because the cursor uses the topmost pipe.

Instead, grab the topmost enabled plane, and check that the
cursor plane blending properties matches it.

Fixes: 12f4849a1cfd ("drm/amd/display: check cursor scaling")
Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f736c1fa1fb4..b54ed708e114 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9458,33 +9458,39 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 				struct drm_crtc *crtc,
 				struct drm_crtc_state *new_crtc_state)
 {
-	struct drm_plane_state *new_cursor_state, *new_primary_state;
-	int cursor_scale_w, cursor_scale_h, primary_scale_w, primary_scale_h;
+	int i;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_cursor_state, *new_underlying_state, *new_plane_state;
+	int cursor_scale_w, cursor_scale_h, underlying_scale_w, underlying_scale_h;
 
 	/* On DCE and DCN there is no dedicated hardware cursor plane. We get a
 	 * cursor per pipe but it's going to inherit the scaling and
 	 * positioning from the underlying pipe. Check the cursor plane's
-	 * blending properties match the primary plane's. */
+	 * blending properties match the underlying plane's. */
+
+	new_underlying_state = NULL;
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		if (new_plane_state->crtc == crtc && plane != crtc->cursor)
+			new_underlying_state = new_plane_state;
+	}
 
 	new_cursor_state = drm_atomic_get_new_plane_state(state, crtc->cursor);
-	new_primary_state = drm_atomic_get_new_plane_state(state, crtc->primary);
-	if (!new_cursor_state || !new_primary_state || !new_cursor_state->fb) {
+	if (!new_cursor_state || !new_underlying_state || !new_cursor_state->fb)
 		return 0;
-	}
 
 	cursor_scale_w = new_cursor_state->crtc_w * 1000 /
 			 (new_cursor_state->src_w >> 16);
 	cursor_scale_h = new_cursor_state->crtc_h * 1000 /
 			 (new_cursor_state->src_h >> 16);
 
-	primary_scale_w = new_primary_state->crtc_w * 1000 /
-			 (new_primary_state->src_w >> 16);
-	primary_scale_h = new_primary_state->crtc_h * 1000 /
-			 (new_primary_state->src_h >> 16);
+	underlying_scale_w = new_underlying_state->crtc_w * 1000 /
+			 (new_underlying_state->src_w >> 16);
+	underlying_scale_h = new_underlying_state->crtc_h * 1000 /
+			 (new_underlying_state->src_h >> 16);
 
-	if (cursor_scale_w != primary_scale_w ||
-	    cursor_scale_h != primary_scale_h) {
-		drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match primary plane\n");
+	if (cursor_scale_w != underlying_scale_w ||
+	    cursor_scale_h != underlying_scale_h) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match underlying plane\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
