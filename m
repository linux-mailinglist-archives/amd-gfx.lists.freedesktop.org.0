Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D83D7D9B
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jul 2021 20:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F816EC63;
	Tue, 27 Jul 2021 18:27:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BF76EC1A;
 Tue, 27 Jul 2021 18:27:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A0F620177;
 Tue, 27 Jul 2021 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4qvJrqmMgEPSGfiww0cO2Abn6QQrkvG5duDhJXnGmk=;
 b=Yo77msN4V0o0sOWe+Z3KHwhp7mQNqNyBRBuU5aIU53qXhJJ/7H1f4vVQvE7J41IlHwxN8t
 zvtkQmwjVa5aG8uJDRW96uVb1btQqaO6pfexB6wMy9MivPKpDNGQsaH9rUk+dVEyKudbQG
 XkoI//oCWp0iDSE7+qVniSxDG2qldsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4qvJrqmMgEPSGfiww0cO2Abn6QQrkvG5duDhJXnGmk=;
 b=kvYeyd+4FZYrzzg0++TZ8wBj8Y1XpZ/cOU+oCKnBMEFWQFuljXPgVV9KqyIG1eMUqJyi/a
 fIqOx8gUnYSw20Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1838113E9D;
 Tue, 27 Jul 2021 18:27:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QDD0BBFQAGGwGQAAMHmgww
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
Subject: [PATCH 11/14] drm/tilcdc: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:18 +0200
Message-Id: <20210727182721.17981-12-tzimmermann@suse.de>
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
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 51 ++++++++++++++++++++++-------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h |  3 ++
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index f1d3a9f919fd..6b03f89a98d4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -20,7 +20,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_mm.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -124,6 +123,39 @@ static int cpufreq_transition(struct notifier_block *nb,
 }
 #endif
 
+static irqreturn_t tilcdc_irq(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct tilcdc_drm_private *priv = dev->dev_private;
+
+	return tilcdc_crtc_irq(priv->crtc);
+}
+
+static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	struct tilcdc_drm_private *priv = dev->dev_private;
+	int ret;
+
+	ret = request_irq(irq, tilcdc_irq, 0, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	priv->irq_enabled = false;
+
+	return 0;
+}
+
+static void tilcdc_irq_uninstall(struct drm_device *dev)
+{
+	struct tilcdc_drm_private *priv = dev->dev_private;
+
+	if (!priv->irq_enabled)
+		return;
+
+	free_irq(priv->irq, dev);
+	priv->irq_enabled = false;
+}
+
 /*
  * DRM operations:
  */
@@ -145,7 +177,7 @@ static void tilcdc_fini(struct drm_device *dev)
 		drm_dev_unregister(dev);
 
 	drm_kms_helper_poll_fini(dev);
-	drm_irq_uninstall(dev);
+	tilcdc_irq_uninstall(dev);
 	drm_mode_config_cleanup(dev);
 
 	if (priv->clk)
@@ -336,7 +368,12 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 		goto init_failed;
 	}
 
-	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto init_failed;
+	priv->irq = ret;
+
+	ret = tilcdc_irq_install(ddev, priv->irq);
 	if (ret < 0) {
 		dev_err(dev, "failed to install IRQ handler\n");
 		goto init_failed;
@@ -360,13 +397,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	return ret;
 }
 
-static irqreturn_t tilcdc_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	return tilcdc_crtc_irq(priv->crtc);
-}
-
 #if defined(CONFIG_DEBUG_FS)
 static const struct {
 	const char *name;
@@ -454,7 +484,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver tilcdc_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler        = tilcdc_irq,
 	DRM_GEM_CMA_DRIVER_OPS,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = tilcdc_debugfs_init,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index d29806ca8817..b818448c83f6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -46,6 +46,8 @@ struct tilcdc_drm_private {
 	struct clk *clk;         /* functional clock */
 	int rev;                 /* IP revision */
 
+	unsigned int irq;
+
 	/* don't attempt resolutions w/ higher W * H * Hz: */
 	uint32_t max_bandwidth;
 	/*
@@ -82,6 +84,7 @@ struct tilcdc_drm_private {
 
 	bool is_registered;
 	bool is_componentized;
+	bool irq_enabled;
 };
 
 /* Sub-module for display.  Since we don't know at compile time what panels
-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
