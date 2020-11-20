Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3392BB661
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828C6E91E;
	Fri, 20 Nov 2020 20:19:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2844B6E918
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:19:09 +0000 (UTC)
Date: Fri, 20 Nov 2020 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605903547;
 bh=sMfh3iOJGnG1mljnQVsg8XfWrLmhuFBaVZbDFcl4rnU=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=da4wJtDoijWcgzpK1shJZdpFG72/Z5BTAThs1tHuFTjbl55LXLHcH6AItjP11EVkm
 209oJtgTfkxCQEPqwTMDyGuFNRN9ehbI3tB56aFv+3Z15BVJGepb+f9rhBRy6Ob2kr
 jLE+VhobfK3pKwNmlfQLmXxprvd7dF4ohCTatNVuXBta0761ceJ+5m1FVlDqlL1sKr
 xR+I16tA+4KG7zRZ9D9984BHE5hH1LCksZKw0owXVog7jqbStFZ4bwL5VJa0ecTVHI
 X2f7TC4HRJ1jD/zDTo3/LjNlGFOuEBZOVMKNyUU6Fen30BmAcTuWz7lyLP2vUed1NV
 7/A3QMUzc+Rbg==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/4] drm/amd/display: check cursor scaling
Message-ID: <46pdTAk5WPvV2adoTn9iMNgPCp0rIwAjHsRSFWfsv8@cp4-web-028.plabs.ch>
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

Don't allow user-space to set different scaling parameters for the
cursor plane and for the primary plane. Because of DCE/DCN design,
it's not possible to have a mismatch.

The old check in dm_update_plane_state is superseded by this new
check.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 51 ++++++++++++++++---
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a7e1af7081cb..2542571a8993 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8895,13 +8895,6 @@ static int dm_update_plane_state(struct dc *dc,
 
 		new_acrtc = to_amdgpu_crtc(new_plane_crtc);
 
-		if ((new_plane_state->crtc_w > new_acrtc->max_cursor_width) ||
-			(new_plane_state->crtc_h > new_acrtc->max_cursor_height)) {
-			DRM_DEBUG_ATOMIC("Bad cursor size %d x %d\n",
-							 new_plane_state->crtc_w, new_plane_state->crtc_h);
-			return -EINVAL;
-		}
-
 		if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
 			DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
 			return -EINVAL;
@@ -9055,6 +9048,43 @@ static int dm_update_plane_state(struct dc *dc,
 	return ret;
 }
 
+static int dm_check_crtc_cursor(struct drm_atomic_state *state,
+				struct drm_crtc *crtc,
+				struct drm_crtc_state *new_crtc_state)
+{
+	struct drm_plane_state *new_cursor_state, *new_primary_state;
+	int cursor_scale_w, cursor_scale_h, primary_scale_w, primary_scale_h;
+
+	/* On DCE and DCN there is no dedicated hardware cursor plane. We get a
+	 * cursor per pipe but it's going to inherit the scaling and
+	 * positioning from the underlying pipe. Check the cursor plane's
+	 * blending properties match the primary plane's. */
+
+	new_cursor_state = drm_atomic_get_new_plane_state(state, crtc->cursor);
+	new_primary_state = drm_atomic_get_new_plane_state(state, crtc->primary);
+	if (!new_cursor_state || !new_primary_state || !new_cursor_state->fb) {
+		return 0;
+	}
+
+	cursor_scale_w = new_cursor_state->crtc_w * 1000 /
+			 (new_cursor_state->src_w >> 16);
+	cursor_scale_h = new_cursor_state->crtc_h * 1000 /
+			 (new_cursor_state->src_h >> 16);
+
+	primary_scale_w = new_primary_state->crtc_w * 1000 /
+			 (new_primary_state->src_w >> 16);
+	primary_scale_h = new_primary_state->crtc_h * 1000 /
+			 (new_primary_state->src_h >> 16);
+
+	if (cursor_scale_w != primary_scale_w ||
+	    cursor_scale_h != primary_scale_h) {
+		DRM_DEBUG_ATOMIC("Cursor plane scaling doesn't match primary plane\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm_crtc *crtc)
 {
@@ -9267,6 +9297,13 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	/* Check cursor planes scaling */
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		ret = dm_check_crtc_cursor(state, crtc, new_crtc_state);
+		if (ret)
+			goto fail;
+	}
+
 	if (state->legacy_cursor_update) {
 		/*
 		 * This is a fast cursor update coming from the plane update
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
