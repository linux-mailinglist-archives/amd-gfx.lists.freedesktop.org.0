Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5742BB65E
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF376E913;
	Fri, 20 Nov 2020 20:19:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4646E913
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:19:02 +0000 (UTC)
Date: Fri, 20 Nov 2020 20:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605903541;
 bh=oh4LzVL5NvWExNRvEsjFatUhgwgfjNH+dUyYauMNNVQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=IzFxUmssdxbbKUnaKfr/DMt36wCNtD9yfOfAeY8tORSlymwULwLnLbvtPGGgszUkJ
 OPT6IResMIdki4TImZw+/i6v+FX0ncmIYCksyuyGSzBRq22omYZKOnx2+HoOgLGy59
 AU6dFBJpvpPyUuwLIDzZx/lDGAIUYHs5B0kgbHlRYRWlcuUL/J8zeoQWCFRIBx5WPl
 tKYhb0SRTiuqXrHYDsnAQx5+3oCtdpcleOc6HD1ESoxmb7vYuvbTPNE1O++5fm9KZz
 hGg8lvP9IPDzHSWrWJ05GPDLykuJlSUDtsa1DKzi1XcWyGmkmoJ00T4LU9R49eowsU
 5ky4fiyR5KqLw==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/4] drm/amd/display: disallow cropping for cursor plane
Message-ID: <As6KCS7DdieNSOQZdQIDvxEm1MBTsCIFKGJW3m06FUo@cp3-web-033.plabs.ch>
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

Looking at handle_cursor_update, it doesn't seem like src_{x,y,w,h}
are picked up by DC. I also tried to change these parameters via a
test KMS client, and amdgpu ignored them. Instead of displaying the
wrong result, reject the atomic commit.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bd63f1c4ae79..a7e1af7081cb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8902,6 +8902,11 @@ static int dm_update_plane_state(struct dc *dc,
 			return -EINVAL;
 		}
 
+		if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
+			DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
+			return -EINVAL;
+		}
+
 		if (new_plane_state->fb) {
 			if (new_plane_state->fb->width > new_acrtc->max_cursor_width ||
 			    new_plane_state->fb->height > new_acrtc->max_cursor_height) {
@@ -8910,6 +8915,11 @@ static int dm_update_plane_state(struct dc *dc,
 						 new_plane_state->fb->height);
 				return -EINVAL;
 			}
+			if (new_plane_state->src_w != new_plane_state->fb->width << 16 ||
+			    new_plane_state->src_h != new_plane_state->fb->height << 16) {
+				DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
+				return -EINVAL;
+			}
 
 			switch (new_plane_state->fb->width) {
 			case 64:
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
