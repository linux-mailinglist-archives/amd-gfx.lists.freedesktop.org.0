Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BB75227C
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jul 2023 15:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00D610E176;
	Thu, 13 Jul 2023 13:03:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2A510E69D;
 Thu, 13 Jul 2023 13:03:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 190B722187;
 Thu, 13 Jul 2023 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689253424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQy7IRLR1TOKL9CWR4s4UjAmdlpCGcqx8o5nwFR3s+c=;
 b=rArgeOswNzLTg35GXHb9uK2lCME0+nUFEQDK4rDhXl8WIXybHiA7VinKOHeZak+ceJprti
 A/BIFjVE2TnLP6qMr4B4HvCasGrHP2+Y43m84p+BkjhoKoJFJ25In9gVAACZ2sxAxuXLuy
 Sk4n/4roCeGkBPOCzPaE4WEdNJ8qneM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689253424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQy7IRLR1TOKL9CWR4s4UjAmdlpCGcqx8o5nwFR3s+c=;
 b=QjoJciKTR24U0F5RVD4MCEu1Gr20hX4+PujpMVGUE19rSDezM02wc0uD5Yk57pKFTRZhUt
 v8fxAYLM1m4vEfCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 650CC13A94;
 Thu, 13 Jul 2023 13:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uAfEFy/2r2TVPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v2 05/18] fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
Date: Thu, 13 Jul 2023 14:58:25 +0200
Message-ID: <20230713130338.31086-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713130338.31086-1-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-nvidia@lists.surfsouth.com, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sam Ravnborg <sam@ravnborg.org>, Wei Liu <wei.liu@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Antonino Daplas <adaplas@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Maik Broemme <mbroemme@libmpq.org>, linux-geode@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Bernie Thompson <bernie@plugable.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by framebuffer_alloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Maik Broemme <mbroemme@libmpq.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
Cc: Bernie Thompson <bernie@plugable.com>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
---
 drivers/video/fbdev/amifb.c                  | 5 ++---
 drivers/video/fbdev/asiliantfb.c             | 1 -
 drivers/video/fbdev/atmel_lcdfb.c            | 2 +-
 drivers/video/fbdev/aty/atyfb_base.c         | 3 +--
 drivers/video/fbdev/aty/radeon_base.c        | 3 +--
 drivers/video/fbdev/bw2.c                    | 1 -
 drivers/video/fbdev/carminefb.c              | 1 -
 drivers/video/fbdev/cg14.c                   | 2 +-
 drivers/video/fbdev/cg3.c                    | 1 -
 drivers/video/fbdev/cg6.c                    | 2 +-
 drivers/video/fbdev/chipsfb.c                | 1 -
 drivers/video/fbdev/cirrusfb.c               | 3 +--
 drivers/video/fbdev/clps711x-fb.c            | 1 -
 drivers/video/fbdev/cobalt_lcdfb.c           | 1 -
 drivers/video/fbdev/ep93xx-fb.c              | 1 -
 drivers/video/fbdev/ffb.c                    | 3 +--
 drivers/video/fbdev/fm2fb.c                  | 1 -
 drivers/video/fbdev/gbefb.c                  | 1 -
 drivers/video/fbdev/geode/gx1fb_core.c       | 1 -
 drivers/video/fbdev/geode/gxfb_core.c        | 1 -
 drivers/video/fbdev/geode/lxfb_core.c        | 1 -
 drivers/video/fbdev/grvga.c                  | 2 +-
 drivers/video/fbdev/hgafb.c                  | 2 +-
 drivers/video/fbdev/hitfb.c                  | 2 +-
 drivers/video/fbdev/hyperv_fb.c              | 2 --
 drivers/video/fbdev/i740fb.c                 | 2 +-
 drivers/video/fbdev/i810/i810_main.c         | 4 ++--
 drivers/video/fbdev/imsttfb.c                | 3 +--
 drivers/video/fbdev/intelfb/intelfbdrv.c     | 4 ++--
 drivers/video/fbdev/kyro/fbdev.c             | 1 -
 drivers/video/fbdev/leo.c                    | 1 -
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   | 2 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c           | 2 +-
 drivers/video/fbdev/neofb.c                  | 2 +-
 drivers/video/fbdev/nvidia/nvidia.c          | 4 ++--
 drivers/video/fbdev/offb.c                   | 2 +-
 drivers/video/fbdev/p9100.c                  | 1 -
 drivers/video/fbdev/platinumfb.c             | 1 -
 drivers/video/fbdev/pm2fb.c                  | 3 +--
 drivers/video/fbdev/pm3fb.c                  | 3 +--
 drivers/video/fbdev/pmag-aa-fb.c             | 1 -
 drivers/video/fbdev/pmag-ba-fb.c             | 1 -
 drivers/video/fbdev/pmagb-b-fb.c             | 1 -
 drivers/video/fbdev/ps3fb.c                  | 2 +-
 drivers/video/fbdev/pvr2fb.c                 | 2 +-
 drivers/video/fbdev/pxa168fb.c               | 2 +-
 drivers/video/fbdev/q40fb.c                  | 1 -
 drivers/video/fbdev/riva/fbdev.c             | 3 +--
 drivers/video/fbdev/s1d13xxxfb.c             | 4 ++--
 drivers/video/fbdev/savage/savagefb_driver.c | 3 +--
 drivers/video/fbdev/simplefb.c               | 1 -
 drivers/video/fbdev/sis/sis_main.c           | 3 +--
 drivers/video/fbdev/skeletonfb.c             | 2 +-
 drivers/video/fbdev/smscufx.c                | 2 +-
 drivers/video/fbdev/sstfb.c                  | 1 -
 drivers/video/fbdev/sunxvr1000.c             | 1 -
 drivers/video/fbdev/sunxvr2500.c             | 1 -
 drivers/video/fbdev/sunxvr500.c              | 1 -
 drivers/video/fbdev/tcx.c                    | 1 -
 drivers/video/fbdev/tdfxfb.c                 | 2 +-
 drivers/video/fbdev/tgafb.c                  | 2 +-
 drivers/video/fbdev/tridentfb.c              | 2 +-
 drivers/video/fbdev/udlfb.c                  | 2 +-
 drivers/video/fbdev/via/viafbdev.c           | 2 +-
 64 files changed, 41 insertions(+), 81 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index d88265dbebf4..cea782283b9c 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -2427,7 +2427,7 @@ static int amifb_set_par(struct fb_info *info)
 		info->fix.ywrapstep = 1;
 		info->fix.xpanstep = 0;
 		info->fix.ypanstep = 0;
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YWRAP |
+		info->flags = FBINFO_HWACCEL_YWRAP |
 			FBINFO_READS_FAST; /* override SCROLL_REDRAW */
 	} else {
 		info->fix.ywrapstep = 0;
@@ -2436,7 +2436,7 @@ static int amifb_set_par(struct fb_info *info)
 		else
 			info->fix.xpanstep = 16 << maxfmode;
 		info->fix.ypanstep = 1;
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+		info->flags = FBINFO_HWACCEL_YPAN;
 	}
 	return 0;
 }
@@ -3660,7 +3660,6 @@ static int __init amifb_probe(struct platform_device *pdev)
 	}
 
 	info->fbops = &amifb_ops;
-	info->flags = FBINFO_DEFAULT;
 	info->device = &pdev->dev;
 
 	if (!fb_find_mode(&info->var, info, mode_option, ami_modedb,
diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 8383468f5577..29c232809d5e 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -516,7 +516,6 @@ static int init_asiliant(struct fb_info *p, unsigned long addr)
 	p->fix.smem_start	= addr;
 	p->var			= asiliantfb_var;
 	p->fbops		= &asiliantfb_ops;
-	p->flags		= FBINFO_DEFAULT;
 
 	err = fb_alloc_cmap(&p->cmap, 256, 0);
 	if (err) {
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 987c5f5f0241..3021660b3e87 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1059,7 +1059,7 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
 	if (IS_ERR(sinfo->reg_lcd))
 		sinfo->reg_lcd = NULL;
 
-	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK |
+	info->flags = FBINFO_PARTIAL_PAN_OK |
 		      FBINFO_HWACCEL_YPAN;
 	info->pseudo_palette = sinfo->pseudo_palette;
 	info->fbops = &atmel_lcdfb_ops;
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index e1602e3fbc66..5c87817a4f4c 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2637,8 +2637,7 @@ static int aty_init(struct fb_info *info)
 
 	info->fbops = &atyfb_ops;
 	info->pseudo_palette = par->pseudo_palette;
-	info->flags = FBINFO_DEFAULT           |
-		      FBINFO_HWACCEL_IMAGEBLIT |
+	info->flags = FBINFO_HWACCEL_IMAGEBLIT |
 		      FBINFO_HWACCEL_FILLRECT  |
 		      FBINFO_HWACCEL_COPYAREA  |
 		      FBINFO_HWACCEL_YPAN      |
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 8f2a527c26eb..93fd1773402c 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1972,8 +1972,7 @@ static int radeon_set_fbinfo(struct radeonfb_info *rinfo)
 
 	info->par = rinfo;
 	info->pseudo_palette = rinfo->pseudo_palette;
-	info->flags = FBINFO_DEFAULT
-		    | FBINFO_HWACCEL_COPYAREA
+	info->flags = FBINFO_HWACCEL_COPYAREA
 		    | FBINFO_HWACCEL_FILLRECT
 		    | FBINFO_HWACCEL_XPAN
 		    | FBINFO_HWACCEL_YPAN;
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 025d663dc6fd..6da22044cbc5 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -314,7 +314,6 @@ static int bw2_probe(struct platform_device *op)
 
 	info->fix.smem_len = PAGE_ALIGN(linebytes * info->var.yres);
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &bw2_ops;
 
 	info->screen_base = of_ioremap(&op->resource[0], 0,
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 4ae21dbdb8ca..33a03f4ae025 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -561,7 +561,6 @@ static int alloc_carmine_fb(void __iomem *regs, void __iomem *smem_base,
 
 	info->fix = carminefb_fix;
 	info->pseudo_palette = par->pseudo_palette;
-	info->flags = FBINFO_DEFAULT;
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 1);
 	if (ret < 0)
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index 832a82f45c80..b2ecd9ff2a61 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -533,7 +533,7 @@ static int cg14_probe(struct platform_device *op)
 	par->mode = MDI_8_PIX;
 	par->ramsize = (is_8mb ? 0x800000 : 0x400000);
 
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 	info->fbops = &cg14_ops;
 
 	__cg14_reset(par);
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 6335cd364c74..c0e6179c66a1 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -384,7 +384,6 @@ static int cg3_probe(struct platform_device *op)
 	if (!par->regs)
 		goto out_release_fb;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &cg3_ops;
 	info->screen_base = of_ioremap(&op->resource[0], CG3_RAM_OFFSET,
 				       info->fix.smem_len, "cg3 ram");
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 6884572efea1..e6cb55be7d8b 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -782,7 +782,7 @@ static int cg6_probe(struct platform_device *op)
 	par->fhc = of_ioremap(&op->resource[0], CG6_FHC_OFFSET,
 				sizeof(u32), "cgsix fhc");
 
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_IMAGEBLIT |
+	info->flags = FBINFO_HWACCEL_IMAGEBLIT |
 			FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT |
 			FBINFO_READS_FAST;
 	info->fbops = &cg6_ops;
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 2a27ba94f652..d5f43454ccd7 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -340,7 +340,6 @@ static void init_chips(struct fb_info *p, unsigned long addr)
 	p->var = chipsfb_var;
 
 	p->fbops = &chipsfb_ops;
-	p->flags = FBINFO_DEFAULT;
 
 	fb_alloc_cmap(&p->cmap, 256, 0);
 
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index ba45e2147c52..9d369b6a4dcc 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -1978,8 +1978,7 @@ static int cirrusfb_set_fbinfo(struct fb_info *info)
 	struct fb_var_screeninfo *var = &info->var;
 
 	info->pseudo_palette = cinfo->pseudo_palette;
-	info->flags = FBINFO_DEFAULT
-		    | FBINFO_HWACCEL_XPAN
+	info->flags = FBINFO_HWACCEL_XPAN
 		    | FBINFO_HWACCEL_YPAN
 		    | FBINFO_HWACCEL_FILLRECT
 		    | FBINFO_HWACCEL_IMAGEBLIT
diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index ac0d058152a3..e956c90efcdc 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -310,7 +310,6 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 	}
 
 	info->fbops = &clps711x_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 	info->var.activate = FB_ACTIVATE_FORCE | FB_ACTIVATE_NOW;
 	info->var.height = -1;
 	info->var.width = -1;
diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
index 3d59a01ec677..b94e7c97264c 100644
--- a/drivers/video/fbdev/cobalt_lcdfb.c
+++ b/drivers/video/fbdev/cobalt_lcdfb.c
@@ -313,7 +313,6 @@ static int cobalt_lcdfb_probe(struct platform_device *dev)
 	info->fix.smem_len = info->screen_size;
 	info->pseudo_palette = NULL;
 	info->par = NULL;
-	info->flags = FBINFO_DEFAULT;
 
 	retval = register_framebuffer(info);
 	if (retval < 0) {
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 37309f9dbe82..037df9cb9675 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -515,7 +515,6 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	info->fix.accel		= FB_ACCEL_NONE;
 	info->var.activate	= FB_ACTIVATE_NOW;
 	info->var.vmode		= FB_VMODE_NONINTERLACED;
-	info->flags		= FBINFO_DEFAULT;
 	info->node		= -1;
 	info->state		= FBINFO_STATE_RUNNING;
 	info->pseudo_palette	= &fbi->pseudo_palette;
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index c6d3111dcbb0..e4fe13059ad5 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -929,8 +929,7 @@ static int ffb_probe(struct platform_device *op)
 	/* Don't mention copyarea, so SCROLL_REDRAW is always
 	 * used.  It is the fastest on this chip.
 	 */
-	info->flags = (FBINFO_DEFAULT |
-		       /* FBINFO_HWACCEL_COPYAREA | */
+	info->flags = (/* FBINFO_HWACCEL_COPYAREA | */
 		       FBINFO_HWACCEL_FILLRECT |
 		       FBINFO_HWACCEL_IMAGEBLIT);
 
diff --git a/drivers/video/fbdev/fm2fb.c b/drivers/video/fbdev/fm2fb.c
index 942e382cf1cf..4dcb9dd79bf8 100644
--- a/drivers/video/fbdev/fm2fb.c
+++ b/drivers/video/fbdev/fm2fb.c
@@ -280,7 +280,6 @@ static int fm2fb_probe(struct zorro_dev *z, const struct zorro_device_id *id)
 	info->pseudo_palette = info->par;
 	info->par = NULL;
 	info->fix = fb_fix;
-	info->flags = FBINFO_DEFAULT;
 
 	if (register_framebuffer(info) < 0) {
 		fb_dealloc_cmap(&info->cmap);
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 3f141e21b7e0..4fccdccbc364 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1194,7 +1194,6 @@ static int gbefb_probe(struct platform_device *p_dev)
 
 	info->fbops = &gbefb_ops;
 	info->pseudo_palette = pseudo_palette;
-	info->flags = FBINFO_DEFAULT;
 	info->screen_base = gbe_mem;
 	fb_alloc_cmap(&info->cmap, 256, 0);
 
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 9c942001ac10..ddec35e3bbeb 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -294,7 +294,6 @@ static struct fb_info *gx1fb_init_fbinfo(struct device *dev)
 	info->var.vmode	= FB_VMODE_NONINTERLACED;
 
 	info->fbops		= &gx1fb_ops;
-	info->flags		= FBINFO_DEFAULT;
 	info->node		= -1;
 
 	info->pseudo_palette	= (void *)par + sizeof(struct geodefb_par);
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 8e05e76de075..4fb13790c528 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -308,7 +308,6 @@ static struct fb_info *gxfb_init_fbinfo(struct device *dev)
 	info->var.vmode	= FB_VMODE_NONINTERLACED;
 
 	info->fbops		= &gxfb_ops;
-	info->flags		= FBINFO_DEFAULT;
 	info->node		= -1;
 
 	info->pseudo_palette	= (void *)par + sizeof(struct gxfb_par);
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 556d8b1a9e06..b70b286f43e4 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -432,7 +432,6 @@ static struct fb_info *lxfb_init_fbinfo(struct device *dev)
 	info->var.vmode	= FB_VMODE_NONINTERLACED;
 
 	info->fbops		= &lxfb_ops;
-	info->flags		= FBINFO_DEFAULT;
 	info->node		= -1;
 
 	info->pseudo_palette	= (void *)par + sizeof(struct lxfb_par);
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 9aa15be29ea9..894ecfa45124 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -377,7 +377,7 @@ static int grvga_probe(struct platform_device *dev)
 	info->fbops = &grvga_ops;
 	info->fix = grvga_fix;
 	info->pseudo_palette = par->color_palette;
-	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_PARTIAL_PAN_OK | FBINFO_HWACCEL_YPAN;
 	info->fix.smem_len = grvga_mem_size;
 
 	if (!devm_request_mem_region(&dev->dev, dev->resource[0].start,
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index 0af58018441d..6a64e6d7255e 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -573,7 +573,7 @@ static int hgafb_probe(struct platform_device *pdev)
 	hga_fix.smem_start = (unsigned long)hga_vram;
 	hga_fix.smem_len = hga_vram_len;
 
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 	info->var = hga_default_var;
 	info->fix = hga_fix;
 	info->monspecs.hfmin = 0;
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index 7737923b7a0a..61882eac7b92 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -405,7 +405,7 @@ static int hitfb_probe(struct platform_device *dev)
 	info->var = hitfb_var;
 	info->fix = hitfb_fix;
 	info->pseudo_palette = info->par;
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN |
+	info->flags = FBINFO_HWACCEL_YPAN |
 		FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_COPYAREA;
 
 	info->screen_base = (void *)hitfb_fix.smem_start;
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index b331452aab4f..b9965cbdd764 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1159,8 +1159,6 @@ static int hvfb_probe(struct hv_device *hdev,
 	}
 
 	/* Set up fb_info */
-	info->flags = FBINFO_DEFAULT;
-
 	info->var.xres_virtual = info->var.xres = screen_width;
 	info->var.yres_virtual = info->var.yres = screen_height;
 	info->var.bits_per_pixel = screen_depth;
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 3860b137b86a..3f5becfe9fd5 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1077,7 +1077,7 @@ static int i740fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	info->fix.mmio_len = pci_resource_len(dev, 1);
 	info->fix.smem_start = pci_resource_start(dev, 0);
 	info->fix.smem_len = info->screen_size;
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 
 	if (i740fb_setup_ddc_bus(info) == 0) {
 		par->ddc_registered = true;
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 85abb65f07d7..f5511bb4fadc 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1442,13 +1442,13 @@ static int i810fb_set_par(struct fb_info *info)
 	encode_fix(&info->fix, info);
 
 	if (info->var.accel_flags && !(par->dev_flags & LOCKUP)) {
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN |
+		info->flags = FBINFO_HWACCEL_YPAN |
 		FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT |
 		FBINFO_HWACCEL_IMAGEBLIT;
 		info->pixmap.scan_align = 2;
 	} else {
 		info->pixmap.scan_align = 1;
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+		info->flags = FBINFO_HWACCEL_YPAN;
 	}
 	return 0;
 }
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index ee7d01ad1406..f4c8677488fb 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1447,8 +1447,7 @@ static int init_imstt(struct fb_info *info)
 	info->var.pixclock = 1000000 / getclkMHz(par);
 
 	info->fbops = &imsttfb_ops;
-	info->flags = FBINFO_DEFAULT |
-                      FBINFO_HWACCEL_COPYAREA |
+	info->flags = FBINFO_HWACCEL_COPYAREA |
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;
 
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index a81095b2b1ea..85a6341b8ac0 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -1372,11 +1372,11 @@ static int intelfb_set_par(struct fb_info *info)
 	intelfb_blank(FB_BLANK_UNBLANK, info);
 
 	if (ACCEL(dinfo, info)) {
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN |
+		info->flags = FBINFO_HWACCEL_YPAN |
 		FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT |
 		FBINFO_HWACCEL_IMAGEBLIT;
 	} else
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+		info->flags = FBINFO_HWACCEL_YPAN;
 
 	kfree(hw);
 	return 0;
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 3f277bdb3a32..1109326ca3c4 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -716,7 +716,6 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	info->fbops		= &kyrofb_ops;
 	info->fix		= kyro_fix;
 	info->pseudo_palette	= currentpar->palette;
-	info->flags		= FBINFO_DEFAULT;
 
 	SetCoreClockPLL(deviceInfo.pSTGReg, pdev);
 
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 3ffc0a725f89..a1a40ea3b22a 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -600,7 +600,6 @@ static int leo_probe(struct platform_device *op)
 	    !info->screen_base)
 		goto out_unmap_regs;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &leo_ops;
 	info->pseudo_palette = par->clut_data;
 
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index 119c2a582ecb..daaa5880601f 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -501,7 +501,7 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
 	fbi->var.accel_flags = 0;
 	fbi->var.vmode = FB_VMODE_NONINTERLACED;
 	fbi->var.activate = FB_ACTIVATE_NOW;
-	fbi->flags = FBINFO_DEFAULT |
+	fbi->flags =
 #ifdef __BIG_ENDIAN
 		     FBINFO_FOREIGN_ENDIAN |
 #endif
diff --git a/drivers/video/fbdev/mmp/fb/mmpfb.c b/drivers/video/fbdev/mmp/fb/mmpfb.c
index 39ebbe026ddf..ac9db01f29f2 100644
--- a/drivers/video/fbdev/mmp/fb/mmpfb.c
+++ b/drivers/video/fbdev/mmp/fb/mmpfb.c
@@ -502,7 +502,7 @@ static int fb_info_setup(struct fb_info *info,
 {
 	int ret = 0;
 	/* Initialise static fb parameters.*/
-	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK |
+	info->flags = FBINFO_PARTIAL_PAN_OK |
 		FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
 	info->node = -1;
 	strcpy(info->fix.id, fbi->name);
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 39d8cdef5c97..d2f622b4c372 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1944,7 +1944,7 @@ static struct fb_info *neo_alloc_fb_info(struct pci_dev *dev,
 
 	par->internal_display = internal;
 	par->external_display = external;
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 
 	switch (info->fix.accel) {
 	case FB_ACCEL_NEOMAGIC_NM2070:
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 039e886346fa..907c22408652 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1111,8 +1111,8 @@ static int nvidia_set_fbinfo(struct fb_info *info)
 	int lpitch;
 
 	NVTRACE_ENTER();
-	info->flags = FBINFO_DEFAULT
-	    | FBINFO_HWACCEL_IMAGEBLIT
+	info->flags =
+	      FBINFO_HWACCEL_IMAGEBLIT
 	    | FBINFO_HWACCEL_FILLRECT
 	    | FBINFO_HWACCEL_COPYAREA
 	    | FBINFO_HWACCEL_YPAN;
diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index 0065a77b6dbc..17f8238262be 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -514,7 +514,7 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 	info->fbops = &offb_ops;
 	info->screen_base = ioremap(address, fix->smem_len);
 	info->pseudo_palette = par->pseudo_palette;
-	info->flags = FBINFO_DEFAULT | foreign_endian;
+	info->flags = foreign_endian;
 
 	fb_alloc_cmap(&info->cmap, 256, 0);
 
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 0876962c52eb..41d124862a00 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -283,7 +283,6 @@ static int p9100_probe(struct platform_device *op)
 	if (!par->regs)
 		goto out_release_fb;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &p9100_ops;
 	info->screen_base = of_ioremap(&op->resource[2], 0,
 				       info->fix.smem_len, "p9100 ram");
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index f8283fcd5edb..b5af45e80fe1 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -317,7 +317,6 @@ static void platinum_init_info(struct fb_info *info,
 	/* Fill fb_info */
 	info->fbops = &platinumfb_ops;
 	info->pseudo_palette = pinfo->pseudo_palette;
-        info->flags = FBINFO_DEFAULT;
 	info->screen_base = pinfo->frame_buffer + 0x20;
 
 	fb_alloc_cmap(&info->cmap, 256, 0);
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 47d212944f30..5a79a12efd8e 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1657,8 +1657,7 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	info->fbops		= &pm2fb_ops;
 	info->fix		= pm2fb_fix;
 	info->pseudo_palette	= default_par->palette;
-	info->flags		= FBINFO_DEFAULT |
-				  FBINFO_HWACCEL_YPAN |
+	info->flags		= FBINFO_HWACCEL_YPAN |
 				  FBINFO_HWACCEL_COPYAREA |
 				  FBINFO_HWACCEL_IMAGEBLIT |
 				  FBINFO_HWACCEL_FILLRECT;
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index b46a471df9ae..16577d0e41b1 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -1390,8 +1390,7 @@ static int pm3fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 
 	info->fix = pm3fb_fix;
 	info->pseudo_palette = par->palette;
-	info->flags = FBINFO_DEFAULT |
-			FBINFO_HWACCEL_XPAN |
+	info->flags = FBINFO_HWACCEL_XPAN |
 			FBINFO_HWACCEL_YPAN |
 			FBINFO_HWACCEL_COPYAREA |
 			FBINFO_HWACCEL_IMAGEBLIT |
diff --git a/drivers/video/fbdev/pmag-aa-fb.c b/drivers/video/fbdev/pmag-aa-fb.c
index 62c8de99af0b..7ee20db9ceb8 100644
--- a/drivers/video/fbdev/pmag-aa-fb.c
+++ b/drivers/video/fbdev/pmag-aa-fb.c
@@ -174,7 +174,6 @@ static int pmagaafb_probe(struct device *dev)
 	info->fbops = &aafb_ops;
 	info->fix = aafb_fix;
 	info->var = aafb_defined;
-	info->flags = FBINFO_DEFAULT;
 
 	/* Request the I/O MEM resource. */
 	start = tdev->resource.start;
diff --git a/drivers/video/fbdev/pmag-ba-fb.c b/drivers/video/fbdev/pmag-ba-fb.c
index 1296f9b370c2..20a1815279f7 100644
--- a/drivers/video/fbdev/pmag-ba-fb.c
+++ b/drivers/video/fbdev/pmag-ba-fb.c
@@ -166,7 +166,6 @@ static int pmagbafb_probe(struct device *dev)
 	info->fbops = &pmagbafb_ops;
 	info->fix = pmagbafb_fix;
 	info->var = pmagbafb_defined;
-	info->flags = FBINFO_DEFAULT;
 
 	/* Request the I/O MEM resource.  */
 	start = tdev->resource.start;
diff --git a/drivers/video/fbdev/pmagb-b-fb.c b/drivers/video/fbdev/pmagb-b-fb.c
index 9dccd51ee65a..4ab4d6c7a975 100644
--- a/drivers/video/fbdev/pmagb-b-fb.c
+++ b/drivers/video/fbdev/pmagb-b-fb.c
@@ -273,7 +273,6 @@ static int pmagbbfb_probe(struct device *dev)
 	info->fbops = &pmagbbfb_ops;
 	info->fix = pmagbbfb_fix;
 	info->var = pmagbbfb_defined;
-	info->flags = FBINFO_DEFAULT;
 
 	/* Request the I/O MEM resource.  */
 	start = tdev->resource.start;
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index d4abcf8aff75..5aedc30c5f7e 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -1145,7 +1145,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
 	info->fix.smem_len = ps3fb_videomemory.size - GPU_FB_START;
 
 	info->pseudo_palette = par->pseudo_palette;
-	info->flags = FBINFO_DEFAULT | FBINFO_READS_FAST |
+	info->flags = FBINFO_READS_FAST |
 		      FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
 
 	retval = fb_alloc_cmap(&info->cmap, 256, 0);
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index c692cd597ce3..6307364e4a49 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -810,7 +810,7 @@ static int __maybe_unused pvr2fb_common_init(void)
 	fb_info->fix		= pvr2_fix;
 	fb_info->par		= currentpar;
 	fb_info->pseudo_palette	= currentpar->palette;
-	fb_info->flags		= FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	fb_info->flags		= FBINFO_HWACCEL_YPAN;
 
 	if (video_output == VO_VGA)
 		defmode = DEFMODE_VGA;
diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 82cb9ffe5290..790aa231a593 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -637,7 +637,7 @@ static int pxa168fb_probe(struct platform_device *pdev)
 	/*
 	 * Initialise static fb parameters.
 	 */
-	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK |
+	info->flags = FBINFO_PARTIAL_PAN_OK |
 		      FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
 	info->node = -1;
 	strscpy(info->fix.id, mi->id, 16);
diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 964bc88bb89c..b180f0f6940e 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -99,7 +99,6 @@ static int q40fb_probe(struct platform_device *dev)
 	info->var = q40fb_var;
 	info->fix = q40fb_fix;
 	info->fbops = &q40fb_ops;
-	info->flags = FBINFO_DEFAULT;  /* not as module for now */
 	info->pseudo_palette = info->par;
 	info->par = NULL;
 	info->screen_base = (char *) q40fb_fix.smem_start;
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 6ade8de5df4a..99576ba3ce6e 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1688,8 +1688,7 @@ static int riva_set_fbinfo(struct fb_info *info)
 	struct riva_par *par = info->par;
 
 	NVTRACE_ENTER();
-	info->flags = FBINFO_DEFAULT
-		    | FBINFO_HWACCEL_XPAN
+	info->flags = FBINFO_HWACCEL_XPAN
 		    | FBINFO_HWACCEL_YPAN
 		    | FBINFO_HWACCEL_COPYAREA
 		    | FBINFO_HWACCEL_FILLRECT
diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 8f2edccdba46..c7d221cce06d 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -869,14 +869,14 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	       default_par->regs, info->fix.smem_len / 1024, info->screen_base);
 
 	info->par = default_par;
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 	info->fbops = &s1d13xxxfb_fbops;
 
 	switch(prod_id) {
 	case S1D13506_PROD_ID:	/* activate acceleration */
 		s1d13xxxfb_fbops.fb_fillrect = s1d13xxxfb_bitblt_solidfill;
 		s1d13xxxfb_fbops.fb_copyarea = s1d13xxxfb_bitblt_copyarea;
-		info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN |
+		info->flags = FBINFO_HWACCEL_YPAN |
 			FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_COPYAREA;
 		break;
 	default:
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 4a27b68798bf..b5f84bd4804b 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2135,8 +2135,7 @@ static int savage_init_fb_info(struct fb_info *info, struct pci_dev *dev,
 	info->var.accel_flags = 0;
 
 	info->fbops          = &savagefb_ops;
-	info->flags          = FBINFO_DEFAULT |
-		               FBINFO_HWACCEL_YPAN |
+	info->flags          = FBINFO_HWACCEL_YPAN |
 		               FBINFO_HWACCEL_XPAN;
 
 	info->pseudo_palette = par->pseudo_palette;
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index e4a13871bca6..461e50c8dd1b 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -479,7 +479,6 @@ static int simplefb_probe(struct platform_device *pdev)
 	par->size = info->fix.smem_len;
 
 	info->fbops = &simplefb_ops;
-	info->flags = FBINFO_DEFAULT;
 	info->screen_base = ioremap_wc(info->fix.smem_start,
 				       info->fix.smem_len);
 	if (!info->screen_base) {
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index cfba776afcea..2beb3512a853 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6472,8 +6472,7 @@ error_3:	vfree(ivideo->bios_abase);
 		sisfb_initaccel(ivideo);
 
 #if defined(FBINFO_HWACCEL_DISABLED) && defined(FBINFO_HWACCEL_XPAN)
-		sis_fb_info->flags = FBINFO_DEFAULT 		|
-				     FBINFO_HWACCEL_YPAN 	|
+		sis_fb_info->flags = FBINFO_HWACCEL_YPAN	|
 				     FBINFO_HWACCEL_XPAN 	|
 				     FBINFO_HWACCEL_COPYAREA 	|
 				     FBINFO_HWACCEL_FILLRECT 	|
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 40c130ab6b38..7e98850d9bde 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -716,7 +716,7 @@ static int xxxfb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
      *
      * NOTE: These are for fbcon use only.
      */
-    info->flags = FBINFO_DEFAULT;
+    info->flags = 0;
 
 /********************* This stage is optional ******************************/
      /*
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index adb2b1fe8383..387d18706fec 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -114,7 +114,7 @@ static struct fb_fix_screeninfo ufx_fix = {
 	.accel =        FB_ACCEL_NONE,
 };
 
-static const u32 smscufx_info_flags = FBINFO_DEFAULT | FBINFO_READS_FAST |
+static const u32 smscufx_info_flags = FBINFO_READS_FAST |
 	FBINFO_VIRTFB |	FBINFO_HWACCEL_IMAGEBLIT | FBINFO_HWACCEL_FILLRECT |
 	FBINFO_HWACCEL_COPYAREA | FBINFO_MISC_ALWAYS_SETPAR;
 
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 582324f5d869..8d2b1d60dd2e 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1399,7 +1399,6 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	f_ddprintk("membase_phys: %#lx\n", fix->smem_start);
 	f_ddprintk("fbbase_virt: %p\n", info->screen_base);
 
-	info->flags	= FBINFO_DEFAULT;
 	info->fbops	= &sstfb_ops;
 	info->pseudo_palette = par->palette;
 
diff --git a/drivers/video/fbdev/sunxvr1000.c b/drivers/video/fbdev/sunxvr1000.c
index 490bd9a14763..76ff6375a659 100644
--- a/drivers/video/fbdev/sunxvr1000.c
+++ b/drivers/video/fbdev/sunxvr1000.c
@@ -72,7 +72,6 @@ static int gfb_set_fbinfo(struct gfb_info *gp)
 	struct fb_info *info = gp->info;
 	struct fb_var_screeninfo *var = &info->var;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &gfb_ops;
 	info->screen_base = gp->fb_base;
 	info->screen_size = gp->fb_size;
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 2cab4b9be68a..8765add3a5be 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -77,7 +77,6 @@ static int s3d_set_fbinfo(struct s3d_info *sp)
 	struct fb_info *info = sp->info;
 	struct fb_var_screeninfo *var = &info->var;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &s3d_ops;
 	info->screen_base = sp->fb_base;
 	info->screen_size = sp->fb_size;
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 6ec358af1256..28a5e2251119 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -200,7 +200,6 @@ static int e3d_set_fbinfo(struct e3d_info *ep)
 	struct fb_info *info = ep->info;
 	struct fb_var_screeninfo *var = &info->var;
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &e3d_ops;
 	info->screen_base = ep->fb_base;
 	info->screen_size = ep->fb_size;
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index fc3ac2301b45..3572766de89c 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -438,7 +438,6 @@ static int tcx_probe(struct platform_device *op)
 		par->mmap_map[i].poff = op->resource[j].start;
 	}
 
-	info->flags = FBINFO_DEFAULT;
 	info->fbops = &tcx_ops;
 
 	/* Initialize brooktree DAC. */
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index dd0fa42eceb9..68e2a82220f3 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1468,7 +1468,7 @@ static int tdfxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	info->fbops		= &tdfxfb_ops;
 	info->pseudo_palette	= default_par->palette;
-	info->flags		= FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags		= FBINFO_HWACCEL_YPAN;
 #ifdef CONFIG_FB_3DFX_ACCEL
 	info->flags		|= FBINFO_HWACCEL_FILLRECT |
 				   FBINFO_HWACCEL_COPYAREA |
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index b44004880f0d..fc2d08dd1b45 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -1470,7 +1470,7 @@ static int tgafb_register(struct device *dev)
 		par->tga_chip_rev = TGA_READ_REG(par, TGA_START_REG) & 0xff;
 
 	/* Setup framebuffer.  */
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_COPYAREA |
+	info->flags = FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_HWACCEL_IMAGEBLIT | FBINFO_HWACCEL_FILLRECT;
 	info->fbops = &tgafb_ops;
 	info->screen_base = par->tga_fb_base;
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 6099b9768ba1..1ba157530af2 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1600,7 +1600,7 @@ static int trident_pci_probe(struct pci_dev *dev,
 	info->fbops = &tridentfb_ops;
 	info->pseudo_palette = default_par->pseudo_pal;
 
-	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 	if (!noaccel && default_par->init_accel) {
 		info->flags &= ~FBINFO_HWACCEL_DISABLED;
 		info->flags |= FBINFO_HWACCEL_COPYAREA;
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index a4a21b4ac28c..b70762ead13c 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -39,7 +39,7 @@ static const struct fb_fix_screeninfo dlfb_fix = {
 	.accel =        FB_ACCEL_NONE,
 };
 
-static const u32 udlfb_info_flags = FBINFO_DEFAULT | FBINFO_READS_FAST |
+static const u32 udlfb_info_flags = FBINFO_READS_FAST |
 		FBINFO_VIRTFB |
 		FBINFO_HWACCEL_IMAGEBLIT | FBINFO_HWACCEL_FILLRECT |
 		FBINFO_HWACCEL_COPYAREA | FBINFO_MISC_ALWAYS_SETPAR;
diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 2d67c92c5774..190fddee62e6 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -1770,7 +1770,7 @@ int via_fb_pci_probe(struct viafb_dev *vdev)
 	viafbinfo->fix.mmio_len = vdev->engine_len;
 	viafbinfo->node = 0;
 	viafbinfo->fbops = &viafb_ops;
-	viafbinfo->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	viafbinfo->flags = FBINFO_HWACCEL_YPAN;
 
 	viafbinfo->pseudo_palette = pseudo_pal;
 	if (viafb_accel && !viafb_setup_engine(viafbinfo)) {
-- 
2.41.0

