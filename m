Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F572913497
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2024 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2A10E16F;
	Sat, 22 Jun 2024 15:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xj/P13yf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305A910F1AA;
 Fri, 21 Jun 2024 14:17:51 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7979198531fso140241985a.0; 
 Fri, 21 Jun 2024 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979470; x=1719584270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jnFb5e+iCdzCXfFXdFhRois2xa9dEKoNI2aRPBGt45Q=;
 b=Xj/P13yfu41bgpNgW+lrcLbEW2j0b21QpcIoFq5uS1qeP+JbeyqHn0qPYZmFOe+wBQ
 a6uGa+EtWhX2ASawiC4huf9aC5h8xjug46swnDyTAzM3fbyNLFBE/I9JJPu4UMvchDo7
 hZdQzzOuEG7gFrxIAnD35PHWaqIXUwrvSJBOJAutH7+0jQ2VNxXxuM06YRvx9qYVRMLD
 sV/BaJj4xQh0v1Uq30v9D9A3k4Z/65vza5VS0P8uf1Q8V5DSvb4J2J2j8+dfnAAgfQ5o
 1tIZvfj1wu560zRgFvfInsl5TsYDmROha8EKsl9GDsFXdbhjdRbG411bFIAQmOc9vSyl
 E7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979470; x=1719584270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jnFb5e+iCdzCXfFXdFhRois2xa9dEKoNI2aRPBGt45Q=;
 b=IqAD+eol0qWged3DfF+k2jJ244dJHhUzRaV4rpQ9Fl1bnNpoxB6lqboaWoKrEo6ygI
 N3lcvSU1qWifSRD9lSp3Oy17wEWOccY54wRJNvXi4jTNNXplvselWE7EKHPLzFm5JraR
 ru5DOXu6tBcpNs/gnSJzs5EgU1KEyGxb8ENfqduaclq9dXU+lenEEVyjmB37bDePNp+z
 pCZpbLjwC041WfnZyHxBdgkvVC16TF9cVwBIr/FJxslyXY0oQV1WT7I+QihNiaIXRvVF
 1m+r3Swl1AUVE+k3f16SceB+u6ER0nOxX7+EXp1bkzf9ii+/UBADW5hGFgtteME490a2
 GOgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBGY3/tnmZbnZZbC2ob9g3lXIYVlBWOPGm0ZQB1hKjYiO26K2zpKrEkMSa5c2V/SKZifeq57QNInaS1jJdv6IAURPjlt5FytXsZ2k+Cse3fXkPuVxHzqOwgJa4MKaflWe16ztHFJRLb0EhWQGAMg==
X-Gm-Message-State: AOJu0YyagcD2FHJqHEWCgKafWK5m92Vd0vF0nmN7C2MjteANGOZ19O70
 PmBmHPama1JhEa8fsyEFXgm5VilAb87fT3hrARlAUxG9s2kXd2KV
X-Google-Smtp-Source: AGHT+IGdnVmWU9l5+qqHQUfgB9c0heO7EoebAC0NVdL9mQ4UeO8Xo7MI3cGD3kpJqqh6tdJD6nNB8g==
X-Received: by 2002:a05:6214:14ad:b0:6b0:9479:cdc9 with SMTP id
 6a1803df08f44-6b501eb40d3mr83721496d6.49.1718979469677; 
 Fri, 21 Jun 2024 07:17:49 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef312b3sm9140586d6.88.2024.06.21.07.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:17:49 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 1
Date: Fri, 21 Jun 2024 10:17:23 -0400
Message-ID: <20240621141725.19913-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jun 2024 15:01:11 +0000
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

Please see Patch v2 1/7 for details.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
 drivers/gpu/drm/radeon/cik.c               | 14 ++++++-------
 drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
 drivers/gpu/drm/radeon/evergreen.c         | 12 +++++------
 drivers/gpu/drm/radeon/ni.c                |  2 +-
 drivers/gpu/drm/radeon/r100.c              | 24 +++++++++++-----------
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 03e6871b3065..c82e0fbc49b4 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -2179,7 +2179,7 @@ int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx)
 void
 radeon_atom_encoder_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_encoder *encoder;
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index b5e96a8fc2c1..11a492f21157 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -7585,7 +7585,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[0]) {
-					drm_handle_vblank(rdev->ddev, 0);
+					drm_handle_vblank(rdev_to_drm(rdev), 0);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -7615,7 +7615,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[1]) {
-					drm_handle_vblank(rdev->ddev, 1);
+					drm_handle_vblank(rdev_to_drm(rdev), 1);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -7645,7 +7645,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[2]) {
-					drm_handle_vblank(rdev->ddev, 2);
+					drm_handle_vblank(rdev_to_drm(rdev), 2);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -7675,7 +7675,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[3]) {
-					drm_handle_vblank(rdev->ddev, 3);
+					drm_handle_vblank(rdev_to_drm(rdev), 3);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -7705,7 +7705,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[4]) {
-					drm_handle_vblank(rdev->ddev, 4);
+					drm_handle_vblank(rdev_to_drm(rdev), 4);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -7735,7 +7735,7 @@ int cik_irq_process(struct radeon_device *rdev)
 					DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 				if (rdev->irq.crtc_vblank_int[5]) {
-					drm_handle_vblank(rdev->ddev, 5);
+					drm_handle_vblank(rdev_to_drm(rdev), 5);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -8581,7 +8581,7 @@ int cik_init(struct radeon_device *rdev)
 	/* Initialize surface registers */
 	radeon_surface_init(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 
 	/* Fence driver */
 	radeon_fence_driver_init(rdev);
diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
index 4c06f47453fd..d6ab93ed9ec4 100644
--- a/drivers/gpu/drm/radeon/dce6_afmt.c
+++ b/drivers/gpu/drm/radeon/dce6_afmt.c
@@ -91,7 +91,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev)
 			pin = &rdev->audio.pin[i];
 			pin_count = 0;
 
-			list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
+			list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
 				if (radeon_encoder_is_digital(encoder)) {
 					radeon_encoder = to_radeon_encoder(encoder);
 					dig = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index c634dc28e6c3..bc4ab71613a5 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -1673,7 +1673,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
  */
 void evergreen_pm_prepare(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -1698,7 +1698,7 @@ void evergreen_pm_prepare(struct radeon_device *rdev)
  */
 void evergreen_pm_finish(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -1763,7 +1763,7 @@ void evergreen_hpd_set_polarity(struct radeon_device *rdev,
  */
 void evergreen_hpd_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned enabled = 0;
 	u32 tmp = DC_HPDx_CONNECTION_TIMER(0x9c4) |
@@ -1804,7 +1804,7 @@ void evergreen_hpd_init(struct radeon_device *rdev)
  */
 void evergreen_hpd_fini(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned disabled = 0;
 
@@ -4753,7 +4753,7 @@ int evergreen_irq_process(struct radeon_device *rdev)
 				event_name = "vblank";
 
 				if (rdev->irq.crtc_vblank_int[crtc_idx]) {
-					drm_handle_vblank(rdev->ddev, crtc_idx);
+					drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -5211,7 +5211,7 @@ int evergreen_init(struct radeon_device *rdev)
 	/* Initialize surface registers */
 	radeon_surface_init(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* Fence driver */
 	radeon_fence_driver_init(rdev);
 	/* initialize AGP */
diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
index 77aee99e473a..3890911fe693 100644
--- a/drivers/gpu/drm/radeon/ni.c
+++ b/drivers/gpu/drm/radeon/ni.c
@@ -2360,7 +2360,7 @@ int cayman_init(struct radeon_device *rdev)
 	/* Initialize surface registers */
 	radeon_surface_init(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* Fence driver */
 	radeon_fence_driver_init(rdev);
 	/* initialize memory controller */
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 0b1e19345f43..d7d7d23bf9a1 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -459,7 +459,7 @@ void r100_pm_misc(struct radeon_device *rdev)
  */
 void r100_pm_prepare(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -490,7 +490,7 @@ void r100_pm_prepare(struct radeon_device *rdev)
  */
 void r100_pm_finish(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -603,7 +603,7 @@ void r100_hpd_set_polarity(struct radeon_device *rdev,
  */
 void r100_hpd_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned enable = 0;
 
@@ -626,7 +626,7 @@ void r100_hpd_init(struct radeon_device *rdev)
  */
 void r100_hpd_fini(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned disable = 0;
 
@@ -798,7 +798,7 @@ int r100_irq_process(struct radeon_device *rdev)
 		/* Vertical blank interrupts */
 		if (status & RADEON_CRTC_VBLANK_STAT) {
 			if (rdev->irq.crtc_vblank_int[0]) {
-				drm_handle_vblank(rdev->ddev, 0);
+				drm_handle_vblank(rdev_to_drm(rdev), 0);
 				rdev->pm.vblank_sync = true;
 				wake_up(&rdev->irq.vblank_queue);
 			}
@@ -807,7 +807,7 @@ int r100_irq_process(struct radeon_device *rdev)
 		}
 		if (status & RADEON_CRTC2_VBLANK_STAT) {
 			if (rdev->irq.crtc_vblank_int[1]) {
-				drm_handle_vblank(rdev->ddev, 1);
+				drm_handle_vblank(rdev_to_drm(rdev), 1);
 				rdev->pm.vblank_sync = true;
 				wake_up(&rdev->irq.vblank_queue);
 			}
@@ -1471,7 +1471,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
 	header = radeon_get_ib_value(p, h_idx);
 	crtc_id = radeon_get_ib_value(p, h_idx + 5);
 	reg = R100_CP_PACKET0_GET_REG(header);
-	crtc = drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
+	crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
 	if (!crtc) {
 		DRM_ERROR("cannot find crtc %d\n", crtc_id);
 		return -ENOENT;
@@ -3059,7 +3059,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);
 void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
 			    &r100_debugfs_rbbm_info_fops);
@@ -3069,7 +3069,7 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
 void r100_debugfs_cp_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
 			    &r100_debugfs_cp_ring_info_fops);
@@ -3081,7 +3081,7 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
 void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("r100_mc_info", 0444, root, rdev,
 			    &r100_debugfs_mc_info_fops);
@@ -3947,7 +3947,7 @@ int r100_resume(struct radeon_device *rdev)
 			RREG32(R_0007C0_CP_STAT));
 	}
 	/* post */
-	radeon_combios_asic_init(rdev->ddev);
+	radeon_combios_asic_init(rdev_to_drm(rdev));
 	/* Resume clock after posting */
 	r100_clock_startup(rdev);
 	/* Initialize surface registers */
@@ -4056,7 +4056,7 @@ int r100_init(struct radeon_device *rdev)
 	/* Set asic errata */
 	r100_errata(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* initialize AGP */
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
-- 
2.45.2

