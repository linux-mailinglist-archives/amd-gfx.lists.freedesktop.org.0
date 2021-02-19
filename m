Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D871C31FF0C
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 19:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A616EB82;
	Fri, 19 Feb 2021 18:58:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D946EB82
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 18:58:28 +0000 (UTC)
Date: Fri, 19 Feb 2021 18:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613761106;
 bh=s3NJy5LlvSBXcfkveg7FrGxPYcrk2ChsISSSpuaDCSs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=ex6qem2BTr+sCc20IjBSTIm0ojk5Xxt1U4q1djy7EYi2LCi7S7QcvH4oRSnwp4L0r
 qB01Idh/zAxLm5fZ02DPG7Mp1TmjamGpAKz3m9Zaz5g5oL0EeWRXila8jA0h407v11
 HQ65QP0GHcxa4aLXQV7mMrW7GyA4QEYlH8nONIQu/J7mnRCn5hR9puqCrOSFGM8Ibk
 EjN6AVBlfi69nlJAQsKmOeMlfXSTiHg+mj7vaSZ9pyaRcD3UzV1vjwakC4/DOmOilc
 t+R1pXv8DXXC/cttTrrxikcyWuHa/8PCii0PFkLi6Mwu/GCnLPfrkW4VAweZZnmaNo
 vXjhS9KUW6fTQ==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 5/6] amd/display: add cursor alpha and blend mode checks
Message-ID: <JVRjVX9zimfbucSCTpvq8Dh3yVs3koHwxdz8spTP5o@cp7-web-041.plabs.ch>
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

We don't want a semi-transparent overlay to make the cursor plane
semi-transparent as well. Same for the pixel blend mode.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6e7f4a182e89..d6ecc5826be9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9257,6 +9257,16 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 		return -EINVAL;
 	}
 
+	if (new_underlying_state->alpha != DRM_BLEND_ALPHA_OPAQUE) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be used with non-opaque underlying plane\n");
+		return -EINVAL;
+	}
+
+	if (new_underlying_state->pixel_blend_mode != DRM_MODE_BLEND_PREMULTI) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be used with non-premultiplied underlying plane\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.30.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
