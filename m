Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4998A440
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2024 15:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345ED10E462;
	Mon, 30 Sep 2024 13:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aIKV3X7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Vojai3y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zGd8d2aa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6IoW9d7H";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBAA10E48F;
 Mon, 30 Sep 2024 13:09:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DEF171FBA4;
 Mon, 30 Sep 2024 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6aYIdIg+gJrZ9jhLtCCMKS4P7YSRpQMqE4wmCnJjtA=;
 b=aIKV3X7IL0/pG24292UoietDXQdrPPhZLqfbI/DWxybQMpiwjHpiV+KWX05c2rDq4PX9K8
 VnvVubg0i+l2OOFM54ihX722wEYUGh+eX3B0kcB6oOJZqzsaRFsh+RCOdTAXkg0LCfc8s5
 m7DRi39AWCE+dtPu5VYDZnFuokmI5YM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701773;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6aYIdIg+gJrZ9jhLtCCMKS4P7YSRpQMqE4wmCnJjtA=;
 b=2Vojai3yvZApJ3+314txj5i0/cI5JMRCbc/w88QpH2wKCpR+fL+BgQ2OhjUHFDWuFMPvdR
 uR9Sbmkq4jkvjQAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6aYIdIg+gJrZ9jhLtCCMKS4P7YSRpQMqE4wmCnJjtA=;
 b=zGd8d2aa8TgFe1luEQ8XDWvWEdiBrgO0OklwKC6h25Bwd2fde9uBdIckmwYujUd9Gg7teg
 w1DzoVApYfs5g5vkldZ+JHFOE+duqg0h2RqBfufgkza5CPwAL/JJNq9WNXw/mnuiMPatn1
 nNoLHuZ5+v3mKpAMP7+ZpYW4T5NI2fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6aYIdIg+gJrZ9jhLtCCMKS4P7YSRpQMqE4wmCnJjtA=;
 b=6IoW9d7HBoq0M+nysYOxcrROG4oTaX5Snk5KvjCafqkWk8SRiKz71NEt7LIK3ruHkCRE0A
 xmY42tt+3lNcp+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89D4D13AAA;
 Mon, 30 Sep 2024 13:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uFFYIAyj+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 23/28] drm/vboxvideo: Use video aperture helpers
Date: Mon, 30 Sep 2024 15:03:21 +0200
Message-ID: <20240930130921.689876-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 49dc337b3e01..a536c467e2b2 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -7,11 +7,12 @@
  *          Michael Thayer <michael.thayer@oracle.com,
  *          Hans de Goede <hdegoede@redhat.com>
  */
+
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vt_kern.h>
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
@@ -45,7 +46,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!vbox_check_supported(VBE_DISPI_ID_HGSMI))
 		return -ENODEV;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
+	ret = aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (ret)
 		return ret;
 
-- 
2.46.0

