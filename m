Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B23754AEA
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jul 2023 20:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270D10E182;
	Sat, 15 Jul 2023 18:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3695110E155;
 Sat, 15 Jul 2023 18:53:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD5EB21AB1;
 Sat, 15 Jul 2023 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689447226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2J9osIBjziSBvYjqJRuY3hx6gZ+n0EagAzqtJtaDujc=;
 b=d+psqWeUUCVfcE4r23QFl9LBE5068B3nH1TzUrWvC1qZJQrVGRwGU2+t2PGHsbW9VpkmIw
 EEDX7msXSAntfZimcuIm9Cib95YW0sBqtfUfGDYc5FmCEZjIDLvsZuoSwfP8Sh+HzSr5OF
 FMUH3B8f+7FV8Lb2C1TwujpcfC5P+mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689447226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2J9osIBjziSBvYjqJRuY3hx6gZ+n0EagAzqtJtaDujc=;
 b=leD8INTeZe/fX0rwE+ZVIF1awTohtjmBICEQJyIxyhgzeXXG/rOQTQGxax57m1L2RqPbd2
 VAMrZzy2R6VS3ABw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 616EA133F7;
 Sat, 15 Jul 2023 18:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SH/HFjrrsmQCBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 dan.carpenter@linaro.org
Subject: [PATCH v4 03/18] fbdev: Remove FBINFO_DEFAULT from kzalloc()'ed
 structs
Date: Sat, 15 Jul 2023 20:51:45 +0200
Message-ID: <20230715185343.7193-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by kzalloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v4:
	* clarify commit message (Geert, Dan)
v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/video/fbdev/controlfb.c           | 2 +-
 drivers/video/fbdev/cyber2000fb.c         | 2 +-
 drivers/video/fbdev/valkyriefb.c          | 1 -
 drivers/video/fbdev/vermilion/vermilion.c | 2 +-
 drivers/video/fbdev/vt8500lcdfb.c         | 3 +--
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 82eeb139c4eb..717134c141ff 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -775,7 +775,7 @@ static void __init control_init_info(struct fb_info *info, struct fb_info_contro
 	info->par = &p->par;
 	info->fbops = &controlfb_ops;
 	info->pseudo_palette = p->pseudo_palette;
-        info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	info->flags = FBINFO_HWACCEL_YPAN;
 	info->screen_base = p->frame_buffer + CTRLFB_OFF;
 
 	fb_alloc_cmap(&info->cmap, 256, 0);
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 38c0a6866d76..98ea56a9abf1 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1459,7 +1459,7 @@ static struct cfb_info *cyberpro_alloc_fb_info(unsigned int id, char *name)
 	cfb->fb.var.accel_flags	= FB_ACCELF_TEXT;
 
 	cfb->fb.fbops		= &cyber2000fb_ops;
-	cfb->fb.flags		= FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	cfb->fb.flags		= FBINFO_HWACCEL_YPAN;
 	cfb->fb.pseudo_palette	= cfb->pseudo_palette;
 
 	spin_lock_init(&cfb->reg_b0_lock);
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index b166b7cfe0e5..fd4488777032 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -535,7 +535,6 @@ static int __init valkyrie_init_info(struct fb_info *info,
 {
 	info->fbops = &valkyriefb_ops;
 	info->screen_base = p->frame_buffer + 0x1000;
-	info->flags = FBINFO_DEFAULT;
 	info->pseudo_palette = p->pseudo_palette;
 	info->par = &p->par;
 	return fb_alloc_cmap(&info->cmap, 256, 0);
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index 32e74e02a02f..71584c775efd 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -477,7 +477,7 @@ static int vml_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	info = &vinfo->info;
-	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK;
+	info->flags = FBINFO_PARTIAL_PAN_OK;
 
 	err = vmlfb_enable_mmio(par);
 	if (err)
diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index 31d4e85b220c..42d39a9d5130 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -300,8 +300,7 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 	fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
 
 	fbi->fb.fbops		= &vt8500lcd_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT
-				| FBINFO_HWACCEL_COPYAREA
+	fbi->fb.flags		= FBINFO_HWACCEL_COPYAREA
 				| FBINFO_HWACCEL_FILLRECT
 				| FBINFO_HWACCEL_YPAN
 				| FBINFO_VIRTFB
-- 
2.41.0

