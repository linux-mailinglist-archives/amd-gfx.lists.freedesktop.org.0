Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5E4441C3
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Nov 2021 13:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9147348A;
	Wed,  3 Nov 2021 12:42:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0B689654
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Nov 2021 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635942515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMBR7qwQMQJqr7Dlw7abQOf+iOK8Ykm5cCAW8eaAHHk=;
 b=JsZ7U+XzzpoKDqmF5uGvdgDeZJscSWkQU8TwzWW4zooyl7KcT42CLtl3UbtzQjLz/tTonY
 1L1jWXWfF4qH1iPGGHc+0kgDMproSzW2wq4k4S3t+kYGkVV/4cimSDV+dTbmzx+vmvnsF7
 GYn/soVxJ8MrSs7OerU6QoyjlQcllPE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-MrnKSSC2OSCBeQKh1VhX_g-1; Wed, 03 Nov 2021 08:28:34 -0400
X-MC-Unique: MrnKSSC2OSCBeQKh1VhX_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 a186-20020a1c7fc3000000b00332f1a308e7so2686097wmd.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Nov 2021 05:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMBR7qwQMQJqr7Dlw7abQOf+iOK8Ykm5cCAW8eaAHHk=;
 b=6UbTYzKRtuUUKwwB7LdBmFOph1a+h7jdnUAKdvSLVuJx3k4tz4qCOE1R1XMgu9sdYf
 rAGaczdJBIm99Xa+u0Ieinf6JkEtmLLmif4XtmTkXMkoZ9ptS6jen/56IAr2tmb3sMY8
 6aOeGJwr0iFukmtWaSiL3e5QqnMqGmJ+nYoNy5gtK8Y1hnXiwnyotq1PdYAOQdXMRjhN
 sl1xKuI22dZRkhavJy6paVDiQlZor+svZ7n3lVrGI2M0IIB+dWoOMRyMZ+eajX4CZzHa
 1Fn0jkeQs4PF5f+//nkXshKLUw+1L0BtV9Hc0ZfLALRKFATOuqkeEEb3LnbpnW2RW6gZ
 /Ebg==
X-Gm-Message-State: AOAM530/7QjCi82H/BUEeCmEdtQd5anjOHkZeAa40mMrL6+QXCEQlIZV
 UaCRCaNrI1jcGKzR9BlCL5Sr2jdvNah6J3FL6qBFBDxMMRGOEQMV8vqyrdU0e3jyHzsF3Zc7s5z
 HrsHtG/o0NOp15/37P0N4toKmXQ==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr15333399wmk.66.1635942512991; 
 Wed, 03 Nov 2021 05:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvsPev8wG3Y0Uyw82bZuVS2rYIwAeulpX6APfdp8vc4iBlRYy1SD4tRI2oTJAnsrskHBScNQ==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr15333370wmk.66.1635942512793; 
 Wed, 03 Nov 2021 05:28:32 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id w7sm1868400wru.51.2021.11.03.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:28:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 3/5] drm: Rename vgacon_text_force() function to
 drm_modeset_disabled()
Date: Wed,  3 Nov 2021 13:28:07 +0100
Message-Id: <20211103122809.1040754-4-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103122809.1040754-1-javierm@redhat.com>
References: <20211103122809.1040754-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Wed, 03 Nov 2021 12:42:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This function is used by some DRM drivers to determine if the "nomodeset"
kernel command line parameter was set and prevent these drivers to probe.

But the function name is quite confusing and does not reflect what really
the drivers are testing when calling it. Use a better naming now that it
is part of the DRM subsystem.

Also, vgacon_text_force() is guarded by #ifdef CONFIG_VGA_CONSOLE already
so there is no need to do the same when calling the function.

Suggested-by: Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 +-
 drivers/gpu/drm/ast/ast_drv.c           |  2 +-
 drivers/gpu/drm/drm_nomodeset.c         | 16 ++++++++--------
 drivers/gpu/drm/i915/i915_module.c      |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c     |  2 +-
 drivers/gpu/drm/tiny/bochs.c            |  2 +-
 drivers/gpu/drm/tiny/cirrus.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c    |  4 +---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  2 +-
 include/drm/drm_mode_config.h           |  4 ++--
 14 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2680a2aaa877..f7bd2616cf23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2513,7 +2513,7 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (vgacon_text_force()) {
+	if (drm_modeset_disabled()) {
 		DRM_ERROR("amdgpu kernel modesetting disabled.\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 048be607b182..6706050414c3 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -232,7 +232,7 @@ static struct pci_driver ast_pci_driver = {
 
 static int __init ast_init(void)
 {
-	if (vgacon_text_force() && ast_modeset == -1)
+	if (drm_modeset_disabled() && ast_modeset == -1)
 		return -EINVAL;
 
 	if (ast_modeset == 0)
diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
index 1ac9a8d5a8fe..dfc8b30f0625 100644
--- a/drivers/gpu/drm/drm_nomodeset.c
+++ b/drivers/gpu/drm/drm_nomodeset.c
@@ -3,17 +3,17 @@
 #include <linux/module.h>
 #include <linux/types.h>
 
-static bool vgacon_text_mode_force;
+static bool drm_nomodeset;
 
-bool vgacon_text_force(void)
+bool drm_modeset_disabled(void)
 {
-	return vgacon_text_mode_force;
+	return drm_nomodeset;
 }
-EXPORT_SYMBOL(vgacon_text_force);
+EXPORT_SYMBOL(drm_modeset_disabled);
 
-static int __init text_mode(char *str)
+static int __init disable_modeset(char *str)
 {
-	vgacon_text_mode_force = true;
+	drm_nomodeset = true;
 
 	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
 	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
@@ -22,5 +22,5 @@ static int __init text_mode(char *str)
 	return 1;
 }
 
-/* force text mode - used by kernel modesetting */
-__setup("nomodeset", text_mode);
+/* Disable kernel modesetting */
+__setup("nomodeset", disable_modeset);
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 14a59226519d..3e5531040e4d 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -29,7 +29,7 @@ static int i915_check_nomodeset(void)
 	if (i915_modparams.modeset == 0)
 		use_kms = false;
 
-	if (vgacon_text_force() && i915_modparams.modeset == -1)
+	if (drm_modeset_disabled() && i915_modparams.modeset == -1)
 		use_kms = false;
 
 	if (!use_kms) {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 685e766db6a4..7ee87564bade 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -377,7 +377,7 @@ static struct pci_driver mgag200_pci_driver = {
 
 static int __init mgag200_init(void)
 {
-	if (vgacon_text_force() && mgag200_modeset == -1)
+	if (drm_modeset_disabled() && mgag200_modeset == -1)
 		return -EINVAL;
 
 	if (mgag200_modeset == 0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 029997f50d1a..903d0e626954 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1321,7 +1321,7 @@ nouveau_drm_init(void)
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
-		if (vgacon_text_force())
+		if (drm_modeset_disabled())
 			nouveau_modeset = 0;
 	}
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 3cd6bd9f059d..e4ab16837fad 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -294,7 +294,7 @@ static struct drm_driver qxl_driver = {
 
 static int __init qxl_init(void)
 {
-	if (vgacon_text_force() && qxl_modeset == -1)
+	if (drm_modeset_disabled() && qxl_modeset == -1)
 		return -EINVAL;
 
 	if (qxl_modeset == 0)
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 9b606c1b11ec..36c8dac68cca 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -636,7 +636,7 @@ static struct pci_driver radeon_kms_pci_driver = {
 
 static int __init radeon_module_init(void)
 {
-	if (vgacon_text_force() && radeon_modeset == -1) {
+	if (drm_modeset_disabled() && radeon_modeset == -1) {
 		DRM_INFO("VGACON disable radeon kernel modesetting.\n");
 		radeon_modeset = 0;
 	}
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 04333f78be55..59189f7c1840 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -718,7 +718,7 @@ static struct pci_driver bochs_pci_driver = {
 
 static int __init bochs_init(void)
 {
-	if (vgacon_text_force() && bochs_modeset == -1)
+	if (drm_modeset_disabled() && bochs_modeset == -1)
 		return -EINVAL;
 
 	if (bochs_modeset == 0)
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 8bd674f0d682..fcf98379c641 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -635,7 +635,7 @@ static struct pci_driver cirrus_pci_driver = {
 
 static int __init cirrus_init(void)
 {
-	if (vgacon_text_force())
+	if (drm_modeset_disabled())
 		return -EINVAL;
 	return pci_register_driver(&cirrus_pci_driver);
 }
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index e6d983121d0b..09356dbd69b2 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -192,10 +192,8 @@ static const struct drm_driver driver = {
 
 static int __init vbox_init(void)
 {
-#ifdef CONFIG_VGA_CONSOLE
-	if (vgacon_text_force() && vbox_modeset == -1)
+	if (drm_modeset_disabled() && vbox_modeset == -1)
 		return -EINVAL;
-#endif
 
 	if (vbox_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index cd4c170236f1..d96797d70fae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -103,7 +103,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	struct drm_device *dev;
 	int ret;
 
-	if (vgacon_text_force() && virtio_gpu_modeset == -1)
+	if (drm_modeset_disabled() && virtio_gpu_modeset == -1)
 		return -EINVAL;
 
 	if (virtio_gpu_modeset == 0)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index fcc4b5a7f639..22dab9beea03 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1650,7 +1650,7 @@ static int __init vmwgfx_init(void)
 {
 	int ret;
 
-	if (vgacon_text_force())
+	if (drm_modeset_disabled())
 		return -EINVAL;
 
 	ret = pci_register_driver(&vmw_pci_driver);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e1d2042a7b77..a5a2dc02e892 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -970,9 +970,9 @@ void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
 #ifdef CONFIG_VGA_CONSOLE
-extern bool vgacon_text_force(void);
+extern bool drm_modeset_disabled(void);
 #else
-static inline bool vgacon_text_force(void) { return false; }
+static inline bool drm_modeset_disabled(void) { return false; }
 #endif
 
 #endif
-- 
2.33.1

