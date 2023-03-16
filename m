Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E06BCB0F
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Mar 2023 10:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BE510E103;
	Thu, 16 Mar 2023 09:37:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21910E0BD;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92C951FE03;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxrx2Y0uScYHK/SlRnKQsLlGTnscPWevxpfUXKH9kUU=;
 b=Z52CXVRUAu199IUeq3kX86cG2OGH7wiZNU960TymxByNoCNpo4YZD4nXxvhAzca/ewY7v9
 T44aWmxS9qjCsHOe4yGw+YfMgDv35UNGA8ONEb3A4vlQbtYaZ5H6qy/2upAKQbdAO9WFlU
 n0ppgUoIcKdW4/JBQVFKoH/w5WUvYNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxrx2Y0uScYHK/SlRnKQsLlGTnscPWevxpfUXKH9kUU=;
 b=F+Wea01/oNZLs4SG8NVZE+IWgYdyafdczhvWcUH2RYUfACI0yZdKxbv6QXgyCcDcEoQxlo
 4UXmEWpb1sflBYAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65BB2133E0;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0EENGGTjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 03/10] drm/radeon: Remove struct radeon_fbdev
Date: Thu, 16 Mar 2023 10:37:31 +0100
Message-Id: <20230316093738.28866-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Both data fields in struct radeon_fbdev, the framebuffer and the
device, are already available in struct drm_fb_helper. Simplify
radeon by converting all callers and removing struct radeon_fbdev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c   | 100 ++++++++++++---------------
 drivers/gpu/drm/radeon/radeon_mode.h |   4 --
 2 files changed, 46 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index b1700ce8166a..cab10c40b49c 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -40,21 +40,11 @@
 
 #include "radeon.h"
 
-/* object hierarchy -
- * this contains a helper + a radeon fb
- * the helper contains a pointer to radeon framebuffer baseclass.
- */
-struct radeon_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	struct drm_framebuffer fb;
-	struct radeon_device *rdev;
-};
-
 static int
 radeonfb_open(struct fb_info *info, int user)
 {
-	struct radeon_fbdev *rfbdev = info->par;
-	struct radeon_device *rdev = rfbdev->rdev;
+	struct drm_fb_helper *fb_helper = info->par;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	int ret = pm_runtime_get_sync(rdev->ddev->dev);
 
 	if (ret < 0 && ret != -EACCES) {
@@ -68,8 +58,8 @@ radeonfb_open(struct fb_info *info, int user)
 static int
 radeonfb_release(struct fb_info *info, int user)
 {
-	struct radeon_fbdev *rfbdev = info->par;
-	struct radeon_device *rdev = rfbdev->rdev;
+	struct drm_fb_helper *fb_helper = info->par;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
 	pm_runtime_mark_last_busy(rdev->ddev->dev);
 	pm_runtime_put_autosuspend(rdev->ddev->dev);
@@ -102,12 +92,12 @@ static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
 	drm_gem_object_put(gobj);
 }
 
-static int radeonfb_create_pinned_object(struct radeon_fbdev *rfbdev,
+static int radeonfb_create_pinned_object(struct drm_fb_helper *fb_helper,
 					 struct drm_mode_fb_cmd2 *mode_cmd,
 					 struct drm_gem_object **gobj_p)
 {
 	const struct drm_format_info *info;
-	struct radeon_device *rdev = rfbdev->rdev;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct drm_gem_object *gobj = NULL;
 	struct radeon_bo *rbo = NULL;
 	bool fb_tiled = false; /* useful for testing */
@@ -191,9 +181,7 @@ static int radeonfb_create_pinned_object(struct radeon_fbdev *rfbdev,
 static int radeonfb_create(struct drm_fb_helper *helper,
 			   struct drm_fb_helper_surface_size *sizes)
 {
-	struct radeon_fbdev *rfbdev =
-		container_of(helper, struct radeon_fbdev, helper);
-	struct radeon_device *rdev = rfbdev->rdev;
+	struct radeon_device *rdev = helper->dev->dev_private;
 	struct fb_info *info;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_mode_fb_cmd2 mode_cmd;
@@ -212,7 +200,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
-	ret = radeonfb_create_pinned_object(rfbdev, &mode_cmd, &gobj);
+	ret = radeonfb_create_pinned_object(helper, &mode_cmd, &gobj);
 	if (ret) {
 		DRM_ERROR("failed to create fbcon object %d\n", ret);
 		return ret;
@@ -230,16 +218,20 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	/* radeon resume is fragile and needs a vt switch to help it along */
 	info->skip_vt_switch = false;
 
-	ret = radeon_framebuffer_init(rdev->ddev, &rfbdev->fb, &mode_cmd, gobj);
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = radeon_framebuffer_init(rdev->ddev, fb, &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
 		goto out;
 	}
 
-	fb = &rfbdev->fb;
-
 	/* setup helper */
-	rfbdev->helper.fb = fb;
+	helper->fb = fb;
 
 	memset_io(rbo->kptr, 0x0, radeon_bo_size(rbo));
 
@@ -251,7 +243,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	info->screen_base = rbo->kptr;
 	info->screen_size = radeon_bo_size(rbo);
 
-	drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
+	drm_fb_helper_fill_info(info, helper, sizes);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
@@ -279,19 +271,23 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
-static int radeon_fbdev_destroy(struct drm_device *dev, struct radeon_fbdev *rfbdev)
+static int radeon_fbdev_destroy(struct drm_device *dev, struct drm_fb_helper *fb_helper)
 {
-	struct drm_framebuffer *fb = &rfbdev->fb;
+	struct drm_framebuffer *fb = fb_helper->fb;
 
-	drm_fb_helper_unregister_info(&rfbdev->helper);
+	drm_fb_helper_unregister_info(fb_helper);
 
-	if (fb->obj[0]) {
-		radeonfb_destroy_pinned_object(fb->obj[0]);
-		fb->obj[0] = NULL;
-		drm_framebuffer_unregister_private(fb);
-		drm_framebuffer_cleanup(fb);
+	if (fb) {
+		if (fb->obj[0]) {
+			radeonfb_destroy_pinned_object(fb->obj[0]);
+			fb->obj[0] = NULL;
+			drm_framebuffer_unregister_private(fb);
+			drm_framebuffer_cleanup(fb);
+		}
+		kfree(fb);
+		fb_helper->fb = NULL;
 	}
-	drm_fb_helper_fini(&rfbdev->helper);
+	drm_fb_helper_fini(fb_helper);
 
 	return 0;
 }
@@ -302,7 +298,7 @@ static const struct drm_fb_helper_funcs radeon_fb_helper_funcs = {
 
 int radeon_fbdev_init(struct radeon_device *rdev)
 {
-	struct radeon_fbdev *rfbdev;
+	struct drm_fb_helper *fb_helper;
 	int bpp_sel = 32;
 	int ret;
 
@@ -317,52 +313,48 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 		 rdev->mc.real_vram_size <= (32*1024*1024))
 		bpp_sel = 16;
 
-	rfbdev = kzalloc(sizeof(struct radeon_fbdev), GFP_KERNEL);
-	if (!rfbdev)
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
 		return -ENOMEM;
 
-	rfbdev->rdev = rdev;
-	rdev->mode_info.rfbdev = rfbdev;
-
-	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper, bpp_sel,
-			      &radeon_fb_helper_funcs);
+	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
+	ret = drm_fb_helper_init(rdev->ddev, fb_helper);
 	if (ret)
 		goto free;
 
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(rdev->ddev);
 
-	ret = drm_fb_helper_initial_config(&rfbdev->helper);
+	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
 		goto fini;
 
 	return 0;
 
 fini:
-	drm_fb_helper_fini(&rfbdev->helper);
+	drm_fb_helper_fini(fb_helper);
 free:
-	drm_fb_helper_unprepare(&rfbdev->helper);
-	kfree(rfbdev);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 	return ret;
 }
 
 void radeon_fbdev_fini(struct radeon_device *rdev)
 {
-	if (!rdev->mode_info.rfbdev)
+	if (!rdev->ddev->fb_helper)
 		return;
 
-	radeon_fbdev_destroy(rdev->ddev, rdev->mode_info.rfbdev);
-	drm_fb_helper_unprepare(&rdev->mode_info.rfbdev->helper);
-	kfree(rdev->mode_info.rfbdev);
-	rdev->mode_info.rfbdev = NULL;
+	radeon_fbdev_destroy(rdev->ddev, rdev->ddev->fb_helper);
+	drm_fb_helper_unprepare(rdev->ddev->fb_helper);
+	kfree(rdev->ddev->fb_helper);
+	rdev->ddev->fb_helper = NULL;
 }
 
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 {
-	if (rdev->mode_info.rfbdev)
-		drm_fb_helper_set_suspend(&rdev->mode_info.rfbdev->helper, state);
+	if (rdev->ddev->fb_helper)
+		drm_fb_helper_set_suspend(rdev->ddev->fb_helper, state);
 }
 
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 63724ecb8d1b..64cf263ae646 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -229,8 +229,6 @@ enum radeon_dvo_chip {
 	DVO_SIL1178,
 };
 
-struct radeon_fbdev;
-
 struct radeon_afmt {
 	bool enabled;
 	int offset;
@@ -267,8 +265,6 @@ struct radeon_mode_info {
 	struct edid *bios_hardcoded_edid;
 	int bios_hardcoded_edid_size;
 
-	/* pointer to fbdev info structure */
-	struct radeon_fbdev *rfbdev;
 	/* firmware flags */
 	u16 firmware_flags;
 	/* pointer to backlight encoder */
-- 
2.39.2

