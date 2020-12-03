Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC72CDF9C
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Dec 2020 21:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD66E03D;
	Thu,  3 Dec 2020 20:19:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538C96E03D
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 20:19:51 +0000 (UTC)
Date: Thu, 03 Dec 2020 20:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607026789;
 bh=/LgdJvHC0qi73sVZWTR1w8NxS5Zjvc9fARLcbDg0AW8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Ewk7dK1KthzwITBZxZQCtBq3hL3wXmFyDIsPItjIc5XtLf0d1L7wXeSpe8lu52X7/
 sRneKwvW9fxYmx95OD3AKqiYoC+VYdxaHMN5WhWk9ADE3ob5CF1iojmsaV8zA99Y9k
 cXpQLwn608laxuHN8gwe9wyoKHnN7kHSGLO0aK/AiLTBssnHeWE2q7MyrWG/rfcWvT
 2w6uKwQ6Afm7R9l5j7vg2dwAaNZgL+MHWmrR5G2WcckFBoieEeF4Jq4PceAqCYwl8t
 Hc6Fi9MOS3SfzmfoP9envP7/RIwuuBNkrCZp8388bhrNTImyuBheASagnXwO48h4JG
 z5lwuecJ8ZQfQ==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm/amd/display: check cursor FB is linear
Message-ID: <JrpTBOVYpzRt8W1KDK3aNwqf6dwNpfPQKZOEnJgND0@cp3-web-020.plabs.ch>
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Previously we accepted non-linear buffers for the cursor plane. This
results in bad output, DC validation failures and oops.

Make sure the FB uses a linear layout in the atomic check function.

The GFX8- check is inspired from ac_surface_set_bo_metadata in Mesa.
The GFX9+ check comes from convert_tiling_flags_to_modifier.

Signed-off-by: Simon Ser <contact@emersion.fr>
References: https://gitlab.freedesktop.org/drm/amd/-/issues/1390
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 070bb55ec4e1..b46b188588b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8978,7 +8978,10 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 			      struct drm_plane_state *new_plane_state,
 			      struct drm_framebuffer *fb)
 {
+	struct amdgpu_device *adev = drm_to_adev(new_acrtc->base.dev);
+	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(fb);
 	unsigned int pitch;
+	bool linear;
 
 	if (fb->width > new_acrtc->max_cursor_width ||
 	    fb->height > new_acrtc->max_cursor_height) {
@@ -9013,6 +9016,22 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 		return -EINVAL;
 	}
 
+	/* Core DRM takes care of checking FB modifiers, so we only need to
+	 * check tiling flags when the FB doesn't have a modifier. */
+	if (!(fb->flags & DRM_MODE_FB_MODIFIERS)) {
+		if (adev->family < AMDGPU_FAMILY_AI) {
+			linear = AMDGPU_TILING_GET(afb->tiling_flags, ARRAY_MODE) != DC_ARRAY_2D_TILED_THIN1 &&
+			         AMDGPU_TILING_GET(afb->tiling_flags, ARRAY_MODE) != DC_ARRAY_1D_TILED_THIN1 &&
+				 AMDGPU_TILING_GET(afb->tiling_flags, MICRO_TILE_MODE) == 0;
+		} else {
+			linear = AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE) == 0;
+		}
+		if (!linear) {
+			DRM_DEBUG_ATOMIC("Cursor FB not linear");
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
