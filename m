Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AA3D7D9D
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jul 2021 20:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9886ECAE;
	Tue, 27 Jul 2021 18:27:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D266EC55;
 Tue, 27 Jul 2021 18:27:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 394EC2223A;
 Tue, 27 Jul 2021 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fzx9d4PDafM0RlfVZrKlRGj6TTaOkt5cDv+r1liQ+SY=;
 b=fLfH9Lxut/iP0gJawthG598wg+s7XrroifRGPIDeMrC8kKcuZobr7txi1lOo0CNKg/33CZ
 DYShcFbVwMPG770TYRSOVb1OXLqFnhh1wIqerx8Y8/H/s4JDm66wh/bekJdxh2zEVPYOxV
 3os3sKxEsQYRHZaDVis4SPxdrpnXww0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fzx9d4PDafM0RlfVZrKlRGj6TTaOkt5cDv+r1liQ+SY=;
 b=3Xqk0wzUmq5RLJcODPcGK8F9iShqqXSvoaCbt0v1hZKfJSz0Qp0+R3FvOEVPaEkQjeFXug
 NFd/t0FCQha3etAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E29013B86;
 Tue, 27 Jul 2021 18:27:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKCZJRFQAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 12/14] drm/vc4: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:19 +0200
Message-Id: <20210727182721.17981-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
References: <20210727182721.17981-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

Calls to platform_get_irq() can fail with a negative errno code.
Abort initialization in this case. The DRM IRQ midlayer does not
handle this case correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_drv.c |  4 ---
 drivers/gpu/drm/vc4/vc4_drv.h |  8 +++---
 drivers/gpu/drm/vc4/vc4_irq.c | 48 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_v3d.c | 17 ++++++++-----
 4 files changed, 53 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 73335feb712f..f6c16c5aee68 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -168,10 +168,6 @@ static struct drm_driver vc4_drm_driver = {
 			    DRIVER_SYNCOBJ),
 	.open = vc4_open,
 	.postclose = vc4_close,
-	.irq_handler = vc4_irq,
-	.irq_preinstall = vc4_irq_preinstall,
-	.irq_postinstall = vc4_irq_postinstall,
-	.irq_uninstall = vc4_irq_uninstall,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = vc4_debugfs_init,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5dceadc61600..ef73e0aaf726 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -74,6 +74,8 @@ struct vc4_perfmon {
 struct vc4_dev {
 	struct drm_device base;
 
+	unsigned int irq;
+
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_dpi *dpi;
@@ -895,9 +897,9 @@ extern struct platform_driver vc4_vec_driver;
 extern struct platform_driver vc4_txp_driver;
 
 /* vc4_irq.c */
-irqreturn_t vc4_irq(int irq, void *arg);
-void vc4_irq_preinstall(struct drm_device *dev);
-int vc4_irq_postinstall(struct drm_device *dev);
+void vc4_irq_enable(struct drm_device *dev);
+void vc4_irq_disable(struct drm_device *dev);
+int vc4_irq_install(struct drm_device *dev, int irq);
 void vc4_irq_uninstall(struct drm_device *dev);
 void vc4_irq_reset(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index e226c24e543f..20fa8e34c20b 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -45,6 +45,10 @@
  * current job can make progress.
  */
 
+#include <linux/platform_device.h>
+
+#include <drm/drm_drv.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -192,7 +196,7 @@ vc4_irq_finish_render_job(struct drm_device *dev)
 	schedule_work(&vc4->job_done_work);
 }
 
-irqreturn_t
+static irqreturn_t
 vc4_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
@@ -234,8 +238,8 @@ vc4_irq(int irq, void *arg)
 	return status;
 }
 
-void
-vc4_irq_preinstall(struct drm_device *dev)
+static void
+vc4_irq_prepare(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
@@ -251,24 +255,22 @@ vc4_irq_preinstall(struct drm_device *dev)
 	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
 }
 
-int
-vc4_irq_postinstall(struct drm_device *dev)
+void
+vc4_irq_enable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
 	if (!vc4->v3d)
-		return 0;
+		return;
 
 	/* Enable the render done interrupts. The out-of-memory interrupt is
 	 * enabled as soon as we have a binner BO allocated.
 	 */
 	V3D_WRITE(V3D_INTENA, V3D_INT_FLDONE | V3D_INT_FRDONE);
-
-	return 0;
 }
 
 void
-vc4_irq_uninstall(struct drm_device *dev)
+vc4_irq_disable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
@@ -282,11 +284,37 @@ vc4_irq_uninstall(struct drm_device *dev)
 	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
 
 	/* Finish any interrupt handler still in flight. */
-	disable_irq(dev->irq);
+	disable_irq(vc4->irq);
 
 	cancel_work_sync(&vc4->overflow_mem_work);
 }
 
+int vc4_irq_install(struct drm_device *dev, int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	vc4_irq_prepare(dev);
+
+	ret = request_irq(irq, vc4_irq, 0, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	vc4_irq_enable(dev);
+
+	return 0;
+}
+
+void vc4_irq_uninstall(struct drm_device *dev)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	vc4_irq_disable(dev);
+	free_irq(vc4->irq, dev);
+}
+
 /** Reinitializes interrupt registers when a GPU reset is performed. */
 void vc4_irq_reset(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 73d63d72575b..7bb3067f8425 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -10,8 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/drm_irq.h>
-
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -361,7 +359,7 @@ static int vc4_v3d_runtime_suspend(struct device *dev)
 	struct vc4_v3d *v3d = dev_get_drvdata(dev);
 	struct vc4_dev *vc4 = v3d->vc4;
 
-	vc4_irq_uninstall(&vc4->base);
+	vc4_irq_disable(&vc4->base);
 
 	clk_disable_unprepare(v3d->clk);
 
@@ -381,8 +379,8 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 	vc4_v3d_init_hw(&vc4->base);
 
 	/* We disabled the IRQ as part of vc4_irq_uninstall in suspend. */
-	enable_irq(vc4->base.irq);
-	vc4_irq_postinstall(&vc4->base);
+	enable_irq(vc4->irq);
+	vc4_irq_enable(&vc4->base);
 
 	return 0;
 }
@@ -448,7 +446,12 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_v3d_init_hw(drm);
 
-	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	vc4->irq = ret;
+
+	ret = vc4_irq_install(drm, vc4->irq);
 	if (ret) {
 		DRM_ERROR("Failed to install IRQ handler\n");
 		return ret;
@@ -473,7 +476,7 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 
 	pm_runtime_disable(dev);
 
-	drm_irq_uninstall(drm);
+	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
 	 * driver probe (if any) doesn't try to reuse our old
-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
