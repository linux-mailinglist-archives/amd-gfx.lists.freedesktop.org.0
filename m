Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152AE959E0F
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2024 15:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270510EA97;
	Wed, 21 Aug 2024 13:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LRHjAkvi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VtMOqkbV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRHjAkvi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VtMOqkbV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA110EA3B;
 Wed, 21 Aug 2024 13:04:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92408200AA;
 Wed, 21 Aug 2024 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVhOzDdQkXEf5dojjelO+6j83QESiAqdvi25AFRez60=;
 b=LRHjAkviRUcseShpQ7sKGNw2mtT0v1/j/3o30hdgE6NLzo0Ooz9S3UjzXMw8suwU16pgX7
 EM+Hl1Zhe8HfT4hLn30251TlkOtkx3WwFu31IYYfr0ONDfMtwwvP3Kq6I2ZsjfXPSSF5O1
 nSxoF1NW75Vr6UMmegeOQ4LP+cCtmMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVhOzDdQkXEf5dojjelO+6j83QESiAqdvi25AFRez60=;
 b=VtMOqkbVh6c0JAFAniGxhODDFMS31IU1c9OVzsaa980itrw0ibNf0AeN72br1o+rjNjfv6
 DuaOV2e9PhFegUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVhOzDdQkXEf5dojjelO+6j83QESiAqdvi25AFRez60=;
 b=LRHjAkviRUcseShpQ7sKGNw2mtT0v1/j/3o30hdgE6NLzo0Ooz9S3UjzXMw8suwU16pgX7
 EM+Hl1Zhe8HfT4hLn30251TlkOtkx3WwFu31IYYfr0ONDfMtwwvP3Kq6I2ZsjfXPSSF5O1
 nSxoF1NW75Vr6UMmegeOQ4LP+cCtmMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVhOzDdQkXEf5dojjelO+6j83QESiAqdvi25AFRez60=;
 b=VtMOqkbVh6c0JAFAniGxhODDFMS31IU1c9OVzsaa980itrw0ibNf0AeN72br1o+rjNjfv6
 DuaOV2e9PhFegUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B97E13B18;
 Wed, 21 Aug 2024 13:04:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uIBCEdjlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 84/86] drm/omapdrm: Remove struct drm_fb_helper from struct
 omap_fbdev.
Date: Wed, 21 Aug 2024 15:00:21 +0200
Message-ID: <20240821130348.73038-85-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza),to(RLazpx1r3qpnsfr8nfakn)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Store instances of drm_fb_helper and struct omap_fbdev separately.
This will allow omapdrm to use the common fbdev client, which allocates
its own instance of struct drm_fb_helper.

There is at most one instance of each per DRM device, so both can be
referenced directly from the omap and DRM device structures. A later
patchset might rework the common fbdev client to allow for storing
both, drm_fb_helper and omap_fbdev, together in the same place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.h   |  3 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 42 +++++++++++++++-------------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 4c7217b35f6b..d903568fd8cc 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -32,6 +32,7 @@
 #define MODULE_NAME     "omapdrm"
 
 struct omap_drm_usergart;
+struct omap_fbdev;
 
 struct omap_drm_pipeline {
 	struct drm_crtc *crtc;
@@ -97,6 +98,8 @@ struct omap_drm_private {
 
 	/* memory bandwidth limit if it is needed on the platform */
 	unsigned int max_bandwidth;
+
+	struct omap_fbdev *fbdev;
 };
 
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 523be34682ca..044e80403c3b 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -13,6 +13,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_util.h>
 
 #include "omap_drv.h"
@@ -26,10 +27,8 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
 
-#define to_omap_fbdev(x) container_of(x, struct omap_fbdev, base)
-
 struct omap_fbdev {
-	struct drm_fb_helper base;
+	struct drm_device *dev;
 	bool ywrap_enabled;
 
 	/* for deferred dmm roll when getting called in atomic ctx */
@@ -41,7 +40,7 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi);
 static void pan_worker(struct work_struct *work)
 {
 	struct omap_fbdev *fbdev = container_of(work, struct omap_fbdev, work);
-	struct drm_fb_helper *helper = &fbdev->base;
+	struct drm_fb_helper *helper = fbdev->dev->fb_helper;
 	struct fb_info *fbi = helper->info;
 	struct drm_gem_object *bo = drm_gem_fb_get_obj(helper->fb, 0);
 	int npages;
@@ -55,24 +54,25 @@ FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(omap_fbdev,
 				   drm_fb_helper_damage_range,
 				   drm_fb_helper_damage_area)
 
-static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
-		struct fb_info *fbi)
+static int omap_fbdev_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
 {
 	struct drm_fb_helper *helper = get_fb(fbi);
-	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
+	struct omap_drm_private *priv;
+	struct omap_fbdev *fbdev;
 
 	if (!helper)
 		goto fallback;
 
+	priv = helper->dev->dev_private;
+	fbdev = priv->fbdev;
+
 	if (!fbdev->ywrap_enabled)
 		goto fallback;
 
-	if (drm_can_sleep()) {
+	if (drm_can_sleep())
 		pan_worker(&fbdev->work);
-	} else {
-		struct omap_drm_private *priv = helper->dev->dev_private;
+	else
 		queue_work(priv->wq, &fbdev->work);
-	}
 
 	return 0;
 
@@ -92,7 +92,6 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 	struct drm_fb_helper *helper = info->par;
 	struct drm_framebuffer *fb = helper->fb;
 	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
-	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
 
 	DBG();
 
@@ -104,7 +103,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 	drm_client_release(&helper->client);
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	kfree(helper);
 }
 
 /*
@@ -128,9 +127,9 @@ static const struct fb_ops omap_fb_ops = {
 static int omap_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
-	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
 	struct drm_device *dev = helper->dev;
 	struct omap_drm_private *priv = dev->dev_private;
+	struct omap_fbdev *fbdev = priv->fbdev;
 	struct drm_framebuffer *fb = NULL;
 	union omap_gem_size gsize;
 	struct fb_info *fbi = NULL;
@@ -338,6 +337,7 @@ static const struct drm_client_funcs omap_fbdev_client_funcs = {
 
 void omap_fbdev_setup(struct drm_device *dev)
 {
+	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_fbdev *fbdev;
 	struct drm_fb_helper *helper;
 	int ret;
@@ -345,24 +345,28 @@ void omap_fbdev_setup(struct drm_device *dev)
 	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
 	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
+	fbdev = drmm_kzalloc(dev, sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
 		return;
-	helper = &fbdev->base;
+	fbdev->dev = dev;
+	INIT_WORK(&fbdev->work, pan_worker);
+
+	priv->fbdev = fbdev;
 
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper)
+		return;
 	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
 
 	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
 	if (ret)
 		goto err_drm_client_init;
 
-	INIT_WORK(&fbdev->work, pan_worker);
-
 	drm_client_register(&helper->client);
 
 	return;
 
 err_drm_client_init:
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	kfree(helper);
 }
-- 
2.46.0

