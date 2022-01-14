Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A548E828
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jan 2022 11:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAEC10E3E1;
	Fri, 14 Jan 2022 10:18:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBFC10E3CA
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 10:18:18 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so21552737pja.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 02:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUJXFXBOp87QX53W1MJLT6jvZlCBoBy6LJsPyWEuKxE=;
 b=i4kHgW1Tx4qnqctn7mdqp7vHBalP+GEkgKs6Et5Ac5Ngxfh8xct+4YJh/wnM+he1qz
 5IhvJ/xfWrTTKqh1jf5TWT1+KQPwXq+uKrSPNMjbzdAwftOLoWQOWoz2i+8q3DKSAUpW
 Vu74JR+0dM0iNFRm2YTfuybGszQZLPSNxsbmGooYcLyG70XLxoblfaxslhMMWG6prz3o
 sPqRIlQYHguN2gx/iOVJGKLDKUc5F8X9NGtXKi9ZttalOFz52be8doCr0UpRgSwW4CqJ
 awQrvS/G+aWb9bjmUVvcFqk8VNuhbLS6aBizPy3MTJey+Mo5FnP8Twiw/WKr3ptDu16Y
 MgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUJXFXBOp87QX53W1MJLT6jvZlCBoBy6LJsPyWEuKxE=;
 b=hzXl4ekf+s5k0rgwKqPqhPSI/Eax0KiMUEC52/SBQQ/6huj3RGizrkWPL1yRhV2k22
 raACcUjfk52QAti22MJBcjXXSGO1TvY3Rh6VCqMd7XgsNaRBUHI6gF8k6FEYBopP+fq4
 t8G2fl67x/SkcfPyEAw0iF/DYdmDjyHF9+XjmNoYmQOK5tJYW1bLsif1h+rniWXNOOZi
 8QJWA+PQDbroOh50QqopuhACDIrcBjVKIYko6XKQGROzao+QxmtE6g6MA56aS4Aphkf1
 NivMETvlRSbVkh5Buy5Bu0K09QolvEHKD04rXigJoUE6eZ9FUx7QMD1o4LBRBYmXPq3L
 LhuA==
X-Gm-Message-State: AOAM533YqUTsEAo6K8bWbFeF6c/SddfV0Rk8/jzatqYpLl/ylrcJmvEV
 cuVZIAkS3/+qx/nMsPeyVCwauw==
X-Google-Smtp-Source: ABdhPJy/UDQhpupvUk83aY0nMurd57v8ZWQbjLCoPvg9ZhE30wyDbkehvy4hysWEstqIUri7m9EU4Q==
X-Received: by 2002:a17:902:c10c:b0:14a:8def:dc2f with SMTP id
 12-20020a170902c10c00b0014a8defdc2fmr2709752pli.98.1642155497977; 
 Fri, 14 Jan 2022 02:18:17 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id 13sm5555970pfm.161.2022.01.14.02.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:18:17 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 1/3] drm: introduce fb_modifiers_not_supported flag in
 mode_config
Date: Fri, 14 Jan 2022 19:17:51 +0900
Message-Id: <20220114101753.24996-2-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114101753.24996-1-etom@igel.co.jp>
References: <20220114101753.24996-1-etom@igel.co.jp>
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
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Tomohito Esaki <etom@igel.co.jp>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

If only linear modifier is advertised, since there are many drivers that
only linear supported, the DRM core should handle this rather than
open-coding in every driver. However, there are legacy drivers such as
radeon that do not support modifiers but infer the actual layout of the
underlying buffer. Therefore, a new flag fb_modifiers_not_supported is
introduced for these legacy drivers, and allow_fb_modifiers is replaced
with this new flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  2 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
 drivers/gpu/drm/drm_framebuffer.c                 |  6 +++---
 drivers/gpu/drm/drm_ioctl.c                       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c         |  6 ++++--
 drivers/gpu/drm/radeon/radeon_display.c           |  2 ++
 include/drm/drm_mode_config.h                     | 10 ++++++++++
 11 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 82011e75ed85..edbb30d47b8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -954,7 +954,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
 	int ret;
 	unsigned int i, block_width, block_height, block_size_log2;
 
-	if (!rfb->base.dev->mode_config.allow_fb_modifiers)
+	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
 		return 0;
 
 	for (i = 0; i < format_info->num_planes; ++i) {
@@ -1141,7 +1141,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	if (!dev->mode_config.allow_fb_modifiers) {
+	if (dev->mode_config.fb_modifiers_not_supported) {
 		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
 			      "GFX9+ requires FB check based on format modifier\n");
 		ret = check_tiling_flags_gfx6(rfb);
@@ -1149,7 +1149,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
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
index 8318ee8339f1..de11fbe5aba2 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2695,6 +2695,8 @@ static int dce_v8_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2f0b14f8f833..61cb41766fae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7868,6 +7868,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	if (res)
 		return res;
 
+	if (modifiers == NULL)
+		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
+
 	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
 				       modifiers, plane->type, NULL);
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e9..4562a8b86579 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -309,7 +309,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 	}
 
 	if (r->flags & DRM_MODE_FB_MODIFIERS &&
-	    !dev->mode_config.allow_fb_modifiers) {
+	    dev->mode_config.fb_modifiers_not_supported) {
 		DRM_DEBUG_KMS("driver does not support fb modifiers\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -594,7 +594,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	r->pixel_format = fb->format->format;
 
 	r->flags = 0;
-	if (dev->mode_config.allow_fb_modifiers)
+	if (!dev->mode_config.fb_modifiers_not_supported)
 		r->flags |= DRM_MODE_FB_MODIFIERS;
 
 	for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
@@ -607,7 +607,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	for (i = 0; i < fb->format->num_planes; i++) {
 		r->pitches[i] = fb->pitches[i];
 		r->offsets[i] = fb->offsets[i];
-		if (dev->mode_config.allow_fb_modifiers)
+		if (!dev->mode_config.fb_modifiers_not_supported)
 			r->modifier[i] = fb->modifier;
 	}
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8b8744dcf691..51fcf1298023 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -297,7 +297,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 			req->value = 64;
 		break;
 	case DRM_CAP_ADDFB2_MODIFIERS:
-		req->value = dev->mode_config.allow_fb_modifiers;
+		req->value = !dev->mode_config.fb_modifiers_not_supported;
 		break;
 	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 		req->value = 1;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 2b460835a438..2cd0932b3d68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -708,10 +708,12 @@ nouveau_display_create(struct drm_device *dev)
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
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 91ca575a78de..da82f45351c7 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -933,6 +933,16 @@ struct drm_mode_config {
 	 */
 	bool allow_fb_modifiers;
 
+	/**
+	 * @fb_modifiers_not_supported:
+	 *
+	 * This flag is for legacy drivers such as radeon that do not support
+	 * modifiers but infer the actual layout of the underlying buffer.
+	 * Generally, each drivers must support modifiers, this flag should not
+	 * be set.
+	 */
+	bool fb_modifiers_not_supported;
+
 	/**
 	 * @normalize_zpos:
 	 *
-- 
2.25.1

