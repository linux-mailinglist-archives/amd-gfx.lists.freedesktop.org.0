Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C482E2BB65D
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361446E914;
	Fri, 20 Nov 2020 20:19:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219836E914
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:19:03 +0000 (UTC)
Date: Fri, 20 Nov 2020 20:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605903541;
 bh=5mxZETC08cpOJGsVN/MJRlIF+AtmnzucoULt0FGBE8U=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=IBSKaENzKuFB/cLCfHyOHB5WnMgu6bpz44mxNIPkpZTYYi9hgDoKYLEuqPo0SsVXE
 /rvMQ2Hg5KMQbnDy2eJofHVL1/PD8yvLpgykq0sFBM230fV9yC30gPZHRVl1J0/qzZ
 p4ozI6j/Fw96NEAmntN6jCt8JdfA1Icx5sWcsTCJmv4et+TgGCHKpfGI24Qpw1SWxm
 7NU0i32pwBBnDno6gEJ7GPbNo3JycmlBZFc6Z2szXCU2CusVKlF26E9XVrz5G7VjrZ
 Xlbmp67toKsb26WcsLhQFKKlON6sA6mYu6G3e+Jf6TftpR0ciJr9+9OyLAXA+OI4Gk
 l+Gqk5FyHFkBg==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/4] drm/amd/display: add cursor FB size check
Message-ID: <P5iZhKB1vEj9b6kWD41KhDPb7BvvEr72fMg2Kke4PI@cp7-web-039.plabs.ch>
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
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This patch expands the cursor checks added in "drm/amd/display: add basic
atomic check for cursor plane" to also include a FB size check. Without
this patch, setting a FB smaller than max_cursor_size with an invalid
width would result in amdgpu error messages and a fallback to a 64-byte
width:

    [drm:hubp1_cursor_set_attributes [amdgpu]] *ERROR* Invalid cursor pitch of 100. Only 64/128/256 is supported on DCN.

Note that DC uses the word "pitch" when actually checking the FB width.
Indeed, the function handle_cursor_update does this:

    attributes.pitch = attributes.width;

In my tests, the cursor FB actually had a pitch of 512 bytes.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reported-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2855bb918535..bd63f1c4ae79 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8902,6 +8902,28 @@ static int dm_update_plane_state(struct dc *dc,
 			return -EINVAL;
 		}
 
+		if (new_plane_state->fb) {
+			if (new_plane_state->fb->width > new_acrtc->max_cursor_width ||
+			    new_plane_state->fb->height > new_acrtc->max_cursor_height) {
+				DRM_DEBUG_ATOMIC("Bad cursor FB size %dx%d\n",
+						 new_plane_state->fb->width,
+						 new_plane_state->fb->height);
+				return -EINVAL;
+			}
+
+			switch (new_plane_state->fb->width) {
+			case 64:
+			case 128:
+			case 256:
+				/* FB width is supported by cursor plane */
+				break;
+			default:
+				DRM_DEBUG_ATOMIC("Bad cursor FB width %d\n",
+						 new_plane_state->fb->width);
+				return -EINVAL;
+			}
+		}
+
 		return 0;
 	}
 
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
