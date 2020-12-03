Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2652CDF7F
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Dec 2020 21:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAE76E03D;
	Thu,  3 Dec 2020 20:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C186E03D
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 20:15:38 +0000 (UTC)
Date: Thu, 03 Dec 2020 20:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607026536;
 bh=dQRaL6zjtBhuQnId89EMhjdrob21NccxS7MUTMVUGxs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bbeULpfNkLDrDT3LsTB9uLUNdg8eCf7rQG5gZ7Mc8gzpBO1N0XPiSYK9R7FRGFIK3
 1dzwbEkH7RGQzoF6sHirsu0hQQdPZokjnYR3i8Sby5jqPdsqxC6aoFvAM9NTkS8lI4
 Gy7r8XafCXE43GCD+iGTcaa4OW/1OmGOQUn4JzGgAhSsgldc+Ym0jgSJCSwi6EVYH/
 7ujVhScAITtp9c287xMr+R3Oh8vidcv9TbOWQD04lVmQ4XuumKt6bkEmP96WaN3AVr
 hJY5c7b4xPnb4tUghHvlxw2gS+ZBkXixy52AWBUUw+JTTu7s5u3on4RgnP4rVZM3bu
 saddXKaO8Uk1A==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/amd: print error on convert_tiling_flags_to_modifier
 failure
Message-ID: <j1fYvGbEZdykS0AhDWeyCo79c5aqNmrQBIuTcljx8@cp3-web-016.plabs.ch>
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

If this function fails, it means the tiling flags didn't make sense.
This likely indicates a user-space bug. Log the error alongside with the
provided tiling flags to make debugging easier.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 2ef9734eb119..467ff1655341 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -901,8 +901,11 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (dev->mode_config.allow_fb_modifiers &&
 	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
 		ret = convert_tiling_flags_to_modifier(rfb);
-		if (ret)
+		if (ret) {
+			dev_err(&dev->pdev->dev, "Failed to convert tiling flags 0x%llX to a modifier",
+				rfb->tiling_flags);
 			goto fail;
+		}
 	}
 
 	for (i = 1; i < rfb->base.format->num_planes; ++i) {
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
