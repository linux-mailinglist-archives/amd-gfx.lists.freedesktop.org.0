Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35313C01F
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2020 13:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488A6E961;
	Wed, 15 Jan 2020 12:17:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69E6E942;
 Wed, 15 Jan 2020 12:17:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5EDFCAFD8;
 Wed, 15 Jan 2020 12:17:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v2 06/21] drm/gma500: Convert to CRTC VBLANK callbacks
Date: Wed, 15 Jan 2020 13:16:37 +0100
Message-Id: <20200115121652.7050-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert gma500 over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c |  3 +++
 drivers/gpu/drm/gma500/psb_drv.c           |  4 ----
 drivers/gpu/drm/gma500/psb_drv.h           |  6 +++---
 drivers/gpu/drm/gma500/psb_intel_display.c |  3 +++
 drivers/gpu/drm/gma500/psb_irq.c           | 12 +++++++++---
 drivers/gpu/drm/gma500/psb_irq.h           |  7 ++++---
 6 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 1ed854f498b7..686385a66167 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -977,6 +977,9 @@ const struct drm_crtc_funcs cdv_intel_crtc_funcs = {
 	.set_config = gma_crtc_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
+	.enable_vblank = psb_enable_vblank,
+	.disable_vblank = psb_disable_vblank,
+	.get_vblank_counter = psb_get_vblank_counter,
 };
 
 const struct gma_clock_funcs cdv_clock_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 52591416f8fe..36cb292fdebe 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -363,7 +363,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	drm_irq_install(dev, dev->pdev->irq);
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
-	dev->driver->get_vblank_counter = psb_get_vblank_counter;
 
 	psb_modeset_init(dev);
 	psb_fbdev_init(dev);
@@ -507,9 +506,6 @@ static struct drm_driver driver = {
 	.irq_postinstall = psb_irq_postinstall,
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
-	.enable_vblank = psb_enable_vblank,
-	.disable_vblank = psb_disable_vblank,
-	.get_vblank_counter = psb_get_vblank_counter,
 
 	.gem_free_object = psb_gem_free_object,
 	.gem_vm_ops = &psb_gem_vm_ops,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 3d4ef3071d45..956926341316 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -681,15 +681,15 @@ extern void psb_irq_turn_off_dpst(struct drm_device *dev);
 extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
 extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
 extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
-extern int psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
-extern void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
+extern int psb_enable_vblank(struct drm_crtc *crtc);
+extern void psb_disable_vblank(struct drm_crtc *crtc);
 void
 psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
 void
 psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
-extern u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
+extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
 
 /* framebuffer.c */
 extern int psbfb_probed(struct drm_device *dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index fed3b563e62e..531c5485be17 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -433,6 +433,9 @@ const struct drm_crtc_funcs psb_intel_crtc_funcs = {
 	.set_config = gma_crtc_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
+	.enable_vblank = psb_enable_vblank,
+	.disable_vblank = psb_disable_vblank,
+	.get_vblank_counter = psb_get_vblank_counter,
 };
 
 const struct gma_clock_funcs psb_clock_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 91f90016dba9..15eb3770d817 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -506,8 +506,10 @@ int psb_irq_disable_dpst(struct drm_device *dev)
 /*
  * It is used to enable VBLANK interrupt
  */
-int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
+int psb_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
 	uint32_t reg_val = 0;
@@ -545,8 +547,10 @@ int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
 /*
  * It is used to disable VBLANK interrupt
  */
-void psb_disable_vblank(struct drm_device *dev, unsigned int pipe)
+void psb_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
 
@@ -618,8 +622,10 @@ void mdfld_disable_te(struct drm_device *dev, int pipe)
 /* Called from drm generic code, passed a 'crtc', which
  * we use as a pipe index
  */
-u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
+u32 psb_get_vblank_counter(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	uint32_t high_frame = PIPEAFRAMEHIGH;
 	uint32_t low_frame = PIPEAFRAMEPIXEL;
 	uint32_t pipeconf_reg = PIPEACONF;
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index 58fd502e3b9d..4f73998848d1 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -12,6 +12,7 @@
 #ifndef _PSB_IRQ_H_
 #define _PSB_IRQ_H_
 
+struct drm_crtc;
 struct drm_device;
 
 bool sysirq_init(struct drm_device *dev);
@@ -26,9 +27,9 @@ int psb_irq_enable_dpst(struct drm_device *dev);
 int psb_irq_disable_dpst(struct drm_device *dev);
 void psb_irq_turn_on_dpst(struct drm_device *dev);
 void psb_irq_turn_off_dpst(struct drm_device *dev);
-int  psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
-void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
-u32  psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
+int  psb_enable_vblank(struct drm_crtc *crtc);
+void psb_disable_vblank(struct drm_crtc *crtc);
+u32  psb_get_vblank_counter(struct drm_crtc *crtc);
 
 int mdfld_enable_te(struct drm_device *dev, int pipe);
 void mdfld_disable_te(struct drm_device *dev, int pipe);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
