Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAE971800
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2024 13:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A343410E497;
	Mon,  9 Sep 2024 11:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BTkWL1ei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zZMDTA+k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTkWL1ei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zZMDTA+k";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7B10E478;
 Mon,  9 Sep 2024 11:37:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0CAD21BF3;
 Mon,  9 Sep 2024 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/4uIxxQTLDaNo3I9ja8klmfZNT/db+rf+EJouHFuJc=;
 b=BTkWL1eilTOUPB15giDAMNus2aQVKsJIvfooX1V0VontcFwMeFZtrlz5Kb/PqWClenZqaZ
 pUy1vlZAwlv91fTIYU8MQV1ADawgxdGIXHnh8qtkmVJfsVbm36KD97sPtsSFFwsGyhR+LS
 sp2gaV5qdwCyuo2IWaZdYSK9aL/kpBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881824;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/4uIxxQTLDaNo3I9ja8klmfZNT/db+rf+EJouHFuJc=;
 b=zZMDTA+k7goWsL5KtbSnHrbRdG2ZCjh1XTen5G0xLS2xv1ZmOn3hxT0Jbfqm6jihgSSEBU
 ZOtAUj7JRrPUlfCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/4uIxxQTLDaNo3I9ja8klmfZNT/db+rf+EJouHFuJc=;
 b=BTkWL1eilTOUPB15giDAMNus2aQVKsJIvfooX1V0VontcFwMeFZtrlz5Kb/PqWClenZqaZ
 pUy1vlZAwlv91fTIYU8MQV1ADawgxdGIXHnh8qtkmVJfsVbm36KD97sPtsSFFwsGyhR+LS
 sp2gaV5qdwCyuo2IWaZdYSK9aL/kpBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881824;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/4uIxxQTLDaNo3I9ja8klmfZNT/db+rf+EJouHFuJc=;
 b=zZMDTA+k7goWsL5KtbSnHrbRdG2ZCjh1XTen5G0xLS2xv1ZmOn3hxT0Jbfqm6jihgSSEBU
 ZOtAUj7JRrPUlfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80CC513312;
 Mon,  9 Sep 2024 11:37:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kKE8HuDd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:37:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 72/80] drm/fbdev-ttm: Remove obsolete setup function
Date: Mon,  9 Sep 2024 13:31:18 +0200
Message-ID: <20240909113633.595465-73-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

The old setup function drm_fbdev_ttm_setup() is unused. Remove it and
its internal callbacks. New drivers should call drm_client_setup()
instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_ttm.c | 119 --------------------------------
 include/drm/drm_fbdev_ttm.h     |   6 --
 2 files changed, 125 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index d799cbe944cd..73d35d59590c 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -65,15 +65,6 @@ static const struct fb_ops drm_fbdev_ttm_fb_ops = {
 	.fb_destroy	= drm_fbdev_ttm_fb_destroy,
 };
 
-/*
- * This function uses the client API to create a framebuffer backed by a dumb buffer.
- */
-static int drm_fbdev_ttm_helper_fb_probe(struct drm_fb_helper *fb_helper,
-					     struct drm_fb_helper_surface_size *sizes)
-{
-	return drm_fbdev_ttm_driver_fbdev_probe(fb_helper, sizes);
-}
-
 static void drm_fbdev_ttm_damage_blit_real(struct drm_fb_helper *fb_helper,
 					   struct drm_clip_rect *clip,
 					   struct iosys_map *dst)
@@ -172,7 +163,6 @@ static int drm_fbdev_ttm_helper_fb_dirty(struct drm_fb_helper *helper,
 }
 
 static const struct drm_fb_helper_funcs drm_fbdev_ttm_helper_funcs = {
-	.fb_probe = drm_fbdev_ttm_helper_fb_probe,
 	.fb_dirty = drm_fbdev_ttm_helper_fb_dirty,
 };
 
@@ -251,112 +241,3 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_ttm_driver_fbdev_probe);
-
-static void drm_fbdev_ttm_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int drm_fbdev_ttm_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int drm_fbdev_ttm_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "fbdev: Failed to setup emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs drm_fbdev_ttm_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_ttm_client_unregister,
-	.restore	= drm_fbdev_ttm_client_restore,
-	.hotplug	= drm_fbdev_ttm_client_hotplug,
-};
-
-/**
- * drm_fbdev_ttm_setup() - Setup fbdev emulation for TTM-based drivers
- * @dev: DRM device
- * @preferred_bpp: Preferred bits per pixel for the device.
- *
- * This function sets up fbdev emulation for TTM-based drivers that support
- * dumb buffers with a virtual address and that can be mmap'ed.
- * drm_fbdev_ttm_setup() shall be called after the DRM driver registered
- * the new DRM device with drm_dev_register().
- *
- * Restore, hotplug events and teardown are all taken care of. Drivers that do
- * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
- * Simple drivers might use drm_mode_config_helper_suspend().
- *
- * In order to provide fixed mmap-able memory ranges, fbdev emulation
- * uses a shadow buffer in system memory. The implementation blits the shadow
- * fbdev buffer onto the real buffer in regular intervals.
- *
- * This function is safe to call even when there are no connectors present.
- * Setup will be retried on the next hotplug event.
- *
- * The fbdev is destroyed by drm_dev_unregister().
- */
-void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{
-	struct drm_fb_helper *fb_helper;
-	int ret;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_ttm_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_ttm_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		goto err_drm_client_init;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-	return;
-}
-EXPORT_SYMBOL(drm_fbdev_ttm_setup);
diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
index 243685d02eb1..ad4a10bb4c78 100644
--- a/include/drm/drm_fbdev_ttm.h
+++ b/include/drm/drm_fbdev_ttm.h
@@ -5,7 +5,6 @@
 
 #include <linux/stddef.h>
 
-struct drm_device;
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 
@@ -15,14 +14,9 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 #define DRM_FBDEV_TTM_DRIVER_OPS \
 	.fbdev_probe = drm_fbdev_ttm_driver_fbdev_probe
-
-void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
 #define DRM_FBDEV_TTM_DRIVER_OPS \
 	.fbdev_probe = NULL
-
-static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{ }
 #endif
 
 #endif
-- 
2.46.0

