Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F33DE969
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Aug 2021 11:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81406E824;
	Tue,  3 Aug 2021 09:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECAC6E54C;
 Tue,  3 Aug 2021 09:07:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61ECC200B6;
 Tue,  3 Aug 2021 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0MWEmqp/odGDRId4WG7e0QMIj5lLradWee7c+5Zd0I=;
 b=UiYpQlHi4eKYMfWI8U531tKWTwEIg+m9gdiFTAZfBr3T3OW92J1t1kPDAipOEebQ9BJhCI
 pu2rMZHJQMUxYVd0VaYhkfgMgNAPOApj5YoHcGINFFjBrpkmrFvipl4/PVF2E3ljB/WFzx
 szQbpbmP7aWM58VDCj0ogoxybQN07cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981634;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0MWEmqp/odGDRId4WG7e0QMIj5lLradWee7c+5Zd0I=;
 b=EVFfDi/Lwuiu6fhU1bwYpigYI5c+Dv0SwPup3+UwHf2UxsxZDdkMUlwfs/V/gVxtmsbI3q
 sfWL13LUhEgpHwAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DC2513CCA;
 Tue,  3 Aug 2021 09:07:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wHlZIUEHCWFVJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 Dan.Sneddon@microchip.com, tomi.valkeinen@ideasonboard.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/14] drm/radeon: Convert to Linux IRQ interfaces
Date: Tue,  3 Aug 2021 11:06:59 +0200
Message-Id: <20210803090704.32152-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c     |  4 ---
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 44 +++++++++++++++++++++----
 drivers/gpu/drm/radeon/radeon_kms.h     |  4 ---
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index c8dd68152d65..b74cebca1f89 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -607,10 +607,6 @@ static const struct drm_driver kms_driver = {
 	.postclose = radeon_driver_postclose_kms,
 	.lastclose = radeon_driver_lastclose_kms,
 	.unload = radeon_driver_unload_kms,
-	.irq_preinstall = radeon_driver_irq_preinstall_kms,
-	.irq_postinstall = radeon_driver_irq_postinstall_kms,
-	.irq_uninstall = radeon_driver_irq_uninstall_kms,
-	.irq_handler = radeon_driver_irq_handler_kms,
 	.ioctls = radeon_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
 	.dumb_create = radeon_mode_dumb_create,
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index a36ce826d0c0..3907785d0798 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -31,7 +31,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_irq.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/radeon_drm.h>
@@ -51,7 +51,7 @@
  * radeon_irq_process is a macro that points to the per-asic
  * irq handler callback.
  */
-irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg)
+static irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *) arg;
 	struct radeon_device *rdev = dev->dev_private;
@@ -118,7 +118,7 @@ static void radeon_dp_work_func(struct work_struct *work)
  * Gets the hw ready to enable irqs (all asics).
  * This function disables all interrupt sources on the GPU.
  */
-void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
+static void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
 {
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
@@ -150,7 +150,7 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev)
  * Handles stuff to be done after enabling irqs (all asics).
  * Returns 0 on success.
  */
-int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
+static int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
 {
 	struct radeon_device *rdev = dev->dev_private;
 
@@ -169,7 +169,7 @@ int radeon_driver_irq_postinstall_kms(struct drm_device *dev)
  *
  * This function disables all interrupt sources on the GPU (all asics).
  */
-void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
+static void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
 {
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
@@ -194,6 +194,36 @@ void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
 	spin_unlock_irqrestore(&rdev->irq.lock, irqflags);
 }
 
+static int radeon_irq_install(struct radeon_device *rdev, int irq)
+{
+	struct drm_device *dev = rdev->ddev;
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	radeon_driver_irq_preinstall_kms(dev);
+
+	/* PCI devices require shared interrupts. */
+	ret = request_irq(irq, radeon_driver_irq_handler_kms,
+			  IRQF_SHARED, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	radeon_driver_irq_postinstall_kms(dev);
+
+	return 0;
+}
+
+static void radeon_irq_uninstall(struct radeon_device *rdev)
+{
+	struct drm_device *dev = rdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	radeon_driver_irq_uninstall_kms(dev);
+	free_irq(pdev->irq, dev);
+}
+
 /**
  * radeon_msi_ok - asic specific msi checks
  *
@@ -314,7 +344,7 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
 	INIT_WORK(&rdev->audio_work, r600_audio_update_hdmi);
 
 	rdev->irq.installed = true;
-	r = drm_irq_install(rdev->ddev, rdev->pdev->irq);
+	r = radeon_irq_install(rdev, rdev->pdev->irq);
 	if (r) {
 		rdev->irq.installed = false;
 		flush_delayed_work(&rdev->hotplug_work);
@@ -335,7 +365,7 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
 void radeon_irq_kms_fini(struct radeon_device *rdev)
 {
 	if (rdev->irq.installed) {
-		drm_irq_uninstall(rdev->ddev);
+		radeon_irq_uninstall(rdev);
 		rdev->irq.installed = false;
 		if (rdev->msi_enabled)
 			pci_disable_msi(rdev->pdev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.h b/drivers/gpu/drm/radeon/radeon_kms.h
index 9b97bf38acd4..36e73cea9215 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.h
+++ b/drivers/gpu/drm/radeon/radeon_kms.h
@@ -31,9 +31,5 @@
 u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
 int radeon_enable_vblank_kms(struct drm_crtc *crtc);
 void radeon_disable_vblank_kms(struct drm_crtc *crtc);
-irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
-void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
-int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
-void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
 
 #endif				/* __RADEON_KMS_H__ */
-- 
2.32.0

