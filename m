Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC698A453
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2024 15:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD9B10E4D2;
	Mon, 30 Sep 2024 13:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="a3xKeUsm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AYhX+9Yu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k9IwZsQB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g/Po6yVG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3A610E4B9;
 Mon, 30 Sep 2024 13:09:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE70121A55;
 Mon, 30 Sep 2024 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK97qS+C5esqOi+w4ad0OepqyE7Gl6fdZHrNzZST+Io=;
 b=a3xKeUsmZ7DmTs0iR0Dbdb7KIVtsJS13ch9HoXZHnPyo+lK+rcQQ5eUW+Ma/8oDRbqez8n
 3hD8VC42d3rLHwL+NfY5YM6NvqrNXfhGM8bpnup6m64OdsOh6Y7Vfbx26WzRMaBSkKgRK9
 3K9dXNVk5vA4cDT7sYWXS6zhbatopnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK97qS+C5esqOi+w4ad0OepqyE7Gl6fdZHrNzZST+Io=;
 b=AYhX+9YuhUZusSvn2s2xDl1V91lweZjiamoBM355TG0GGUg7D+PU810jTufw2sqNZPgEw3
 JkOTvH3vlcOYhXAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK97qS+C5esqOi+w4ad0OepqyE7Gl6fdZHrNzZST+Io=;
 b=k9IwZsQBpDhbJN36CYaza+4sxCG64BJK8dtRQ6KrmUVoJZsjCsUa9dtTi7IyLvqVuDwE+j
 GxUJbiGhuVB6dR6aN454Kywip/u1f4A9wbf1My12qRBbvbulR7LGeOwNG0ge25ocynCjuB
 kZcdi/2Wqyka1jY66mYZ7A5Uf9oprWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701773;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK97qS+C5esqOi+w4ad0OepqyE7Gl6fdZHrNzZST+Io=;
 b=g/Po6yVGCstkqwNoqQo8r4oUx46mFrerp0PDyU2EfY8K8LyOkN/ytWlNXDkuuDiSHo2oYk
 pwVIKlblIJ4MAZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A76C136CB;
 Mon, 30 Sep 2024 13:09:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aEp0JA2j+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 26/28] drm/vmwgfx: Use video aperture helpers
Date: Mon, 30 Sep 2024 15:03:24 +0200
Message-ID: <20240930130921.689876-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
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

DRM's aperture functions have long been implemented as helpers
under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
calling the video functions directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index cf7a89d002e4..36f6ce022a73 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -35,7 +35,6 @@
 #include "vmwgfx_vkms.h"
 #include "ttm_object.h"
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
@@ -50,6 +49,8 @@
 #ifdef CONFIG_X86
 #include <asm/hypervisor.h>
 #endif
+
+#include <linux/aperture.h>
 #include <linux/cc_platform.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -1656,7 +1657,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct vmw_private *vmw;
 	int ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
+	ret = aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (ret)
 		goto out_error;
 
-- 
2.46.0

