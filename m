Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2947965ABB
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2024 10:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5919210E886;
	Fri, 30 Aug 2024 08:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sr+WoAYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8I5XYVwv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sr+WoAYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8I5XYVwv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6ED10E85D;
 Fri, 30 Aug 2024 08:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9E1E1F7B7;
 Fri, 30 Aug 2024 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+02KtzuL/0apGbJHEoOc1Au4F649MzG1OdyHtZYcJ4M=;
 b=sr+WoAYbZd2KBd492JyNxh1FqnKcnu8JSxZ/1Cl+4K36JPiSFRx81sCYMFQafqIhI6i0JX
 N/qEOwh6hoSI9lA6EhPh4GgRuON3wS97zD8Sa3qRHeWMTGL0l5u+VqM74Uj4gISsUjaMmc
 Spp5TF5xGlLLbt6qKqT0tBLXZaqtTVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+02KtzuL/0apGbJHEoOc1Au4F649MzG1OdyHtZYcJ4M=;
 b=8I5XYVwvTBYKslGPR/G7grjN7FUM7YQBqEyIjrhut+roLG1P7HlZPjO1nKuDx8Ec1fm23W
 VaJt7eml7IULk+Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+02KtzuL/0apGbJHEoOc1Au4F649MzG1OdyHtZYcJ4M=;
 b=sr+WoAYbZd2KBd492JyNxh1FqnKcnu8JSxZ/1Cl+4K36JPiSFRx81sCYMFQafqIhI6i0JX
 N/qEOwh6hoSI9lA6EhPh4GgRuON3wS97zD8Sa3qRHeWMTGL0l5u+VqM74Uj4gISsUjaMmc
 Spp5TF5xGlLLbt6qKqT0tBLXZaqtTVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+02KtzuL/0apGbJHEoOc1Au4F649MzG1OdyHtZYcJ4M=;
 b=8I5XYVwvTBYKslGPR/G7grjN7FUM7YQBqEyIjrhut+roLG1P7HlZPjO1nKuDx8Ec1fm23W
 VaJt7eml7IULk+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73AA513A3D;
 Fri, 30 Aug 2024 08:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kOfvGouG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:44:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/81] drm/fbdev-helper: Set and clear VGA switcheroo
 client from fb_info
Date: Fri, 30 Aug 2024 10:39:46 +0200
Message-ID: <20240830084456.77630-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Call vga_switcheroo_client_fb_set() with the PCI device from the
instance of struct fb_info. All fbdev clients now run these calls.
For non-PCI devices or drivers without vga-switcheroo, this does
nothing. For i915 and radeon, it allows these drivers to use a
common fbdev client.

The device is the same as the one stored in struct drm_client and
struct drm_fb_helper, so there is no difference in behavior. Some
NULL-pointer checks are being removed, where those pointers cannot
be NULL.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index af1fe79c701d..13095d38aa42 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -562,8 +562,12 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
  */
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
-	if (fb_helper && fb_helper->info)
-		unregister_framebuffer(fb_helper->info);
+	struct fb_info *info = fb_helper->info;
+	struct device *dev = info->device;
+
+	if (dev_is_pci(dev))
+		vga_switcheroo_client_fb_set(to_pci_dev(dev), NULL);
+	unregister_framebuffer(fb_helper->info);
 }
 EXPORT_SYMBOL(drm_fb_helper_unregister_info);
 
@@ -1615,6 +1619,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
+	struct fb_info *info;
 	int ret;
 
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
@@ -1632,9 +1637,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
+	info = fb_helper->info;
+
 	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(dev->dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
+	if (dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
 
 	return 0;
 }
-- 
2.46.0

