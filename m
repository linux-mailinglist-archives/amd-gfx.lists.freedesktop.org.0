Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305547CCAB
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Dec 2021 06:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F3310E710;
	Wed, 22 Dec 2021 05:27:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2510E959
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Dec 2021 05:27:50 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso4640095pjc.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Dec 2021 21:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtiLXwAmgBFuHLKtXrWSQQgzSxpFM+VEIGudevL41xs=;
 b=I6r0aT7tT9SkOQVoh/ryKm46cLIGKp/KSznXpCYYtx6J3V8EX/UxsQq91aoIH8dk9p
 hWlGSEssGZmy8hHlBX8S70wDDC7eFw/Bnqgnk/9Sy+R6NyRMybJcxYxZlZiTde65ulM6
 985aQyvmD/PaTl2i6SSf33KFD67D0iJa9D5bnr7R3fw7Kgxqh6x2avRrx42KE0eS1hC3
 SXNm8Hzr34az69jSepkL/2sm+H6iKMPU7aG2flTy82WtcR+qVSMRCUoHUZaPSP9K87/5
 n2D0CyduLbQJHiZ/Bfym3w/scUYPUfXGcKJht1VPM7wwSoJtNHKf12L6t2moI9h6fNHP
 wQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JtiLXwAmgBFuHLKtXrWSQQgzSxpFM+VEIGudevL41xs=;
 b=60HaEEP2xNLoT7H+mQqUU7J3wSe0NFIizDN8+5jMKHWRpIhCPW9FuUBO464n8Dd9VV
 MdL3UHvt3WfTHzaQDUyP6k3Rg8NAUH0Esb1hs8aGYVFR46PIoenWWHg0xt9nJ4kHUCAv
 pXV3fERSjGfL+M4VxdVpKKaIfzkvd3RYlJi9VCjFn5J5/AMhUGPz57ePB5HrZi6UGsjh
 c/46aTH4HDkWxbcTe2/ARwKCRrRMn6NyI6DD7Dh2E4gzENJiA6s/A6BoDagrqkV/xvjl
 r98fN4QhPkj+cEk/8z7rfITv9hzOKH1FH+EV7J/RLhSgjtU3ffEuMMVtXRa/ihAXewjp
 wUzg==
X-Gm-Message-State: AOAM533VPU1+ywlkDTG9P3FWXxvC1pibXzmwo+JNoBgeDLxNUi8DBhLT
 tRkmA8zVBGEIj1QmHQxDVNB+GQ==
X-Google-Smtp-Source: ABdhPJwtgmgANrL6PCusAuav1tvNpAlzWxXsIiooGWNFKODabt+qEfFqvKf6bxJrM1ZZX37yyf9Ohg==
X-Received: by 2002:a17:90b:f82:: with SMTP id
 ft2mr1670262pjb.203.1640150869899; 
 Tue, 21 Dec 2021 21:27:49 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id v63sm737465pgv.71.2021.12.21.21.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 21:27:49 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATH 2/3] drm: set fb_modifiers_not_supported flag in legacy
 drivers
Date: Wed, 22 Dec 2021 14:27:26 +0900
Message-Id: <20211222052727.19725-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222052727.19725-1-etom@igel.co.jp>
References: <20211222052727.19725-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Set fb_modifiers_not_supported flag in legacy drivers whose planes
support non-linear layouts but does not support modifiers, and replace
allow_fb_modifiers with fb_modifiers_not_supported.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      | 2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c      | 2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       | 2 ++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 6 ++++--
 drivers/gpu/drm/radeon/radeon_display.c     | 2 ++
 7 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..cbaea9c6cfda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -958,7 +958,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
 	int ret;
 	unsigned int i, block_width, block_height, block_size_log2;
 
-	if (!rfb->base.dev->mode_config.allow_fb_modifiers)
+	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
 		return 0;
 
 	for (i = 0; i < format_info->num_planes; ++i) {
@@ -1145,7 +1145,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	if (!dev->mode_config.allow_fb_modifiers) {
+	if (dev->mode_config.fb_modifiers_not_supported) {
 		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
 			      "GFX9+ requires FB check based on format modifier\n");
 		ret = check_tiling_flags_gfx6(rfb);
@@ -1153,7 +1153,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 			return ret;
 	}
 
-	if (dev->mode_config.allow_fb_modifiers &&
+	if (!dev->mode_config.fb_modifiers_not_supported &&
 	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
 		ret = convert_tiling_flags_to_modifier(rfb);
 		if (ret) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index d1570a462a51..fb61c0814115 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2798,6 +2798,8 @@ static int dce_v10_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 18a7b3bd633b..17942a11366d 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2916,6 +2916,8 @@ static int dce_v11_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index c7803dc2b2d5..2ec99ec8e1a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2674,6 +2674,7 @@ static int dce_v6_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.max_height = 16384;
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index b200b9e722d9..8369336cec90 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2699,6 +2699,8 @@ static int dce_v8_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 929de41c281f..1ecad7fa3e8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -711,10 +711,12 @@ nouveau_display_create(struct drm_device *dev)
 				     &disp->disp);
 		if (ret == 0) {
 			nouveau_display_create_properties(dev);
-			if (disp->disp.object.oclass < NV50_DISP)
+			if (disp->disp.object.oclass < NV50_DISP) {
+				dev->mode_config.fb_modifiers_not_supported = true;
 				ret = nv04_display_create(dev);
-			else
+			} else {
 				ret = nv50_display_create(dev);
+			}
 		}
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..b9a07677a71e 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1596,6 +1596,8 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	rdev->ddev->mode_config.preferred_depth = 24;
 	rdev->ddev->mode_config.prefer_shadow = 1;
 
+	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
+
 	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
 
 	ret = radeon_modeset_create_props(rdev);
-- 
2.17.1

