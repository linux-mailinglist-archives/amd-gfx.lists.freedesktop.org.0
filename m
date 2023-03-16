Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D46BCB0D
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Mar 2023 10:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F8210E141;
	Thu, 16 Mar 2023 09:37:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4264710E085;
 Thu, 16 Mar 2023 09:37:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0A6A1FE04;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXaYLLXX7Vd8AeoL4m5iR5gtpaDkzxegCv41ClB2fYY=;
 b=L8502IWmur+8EpP+jBU1uq6/vvgE1IN56k3vVQoqctzDrA80n7tbvXc7eGZrUE5tCkXwaN
 0CBNh+bs1PgkXJ/3NIwGvJbzRX61TeI5eake744etToNgMyOldPa7PnmKWblzQ9lnSPckA
 IEM7Pft4Rlh/zWjRIMWsl4aQi6SdVek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXaYLLXX7Vd8AeoL4m5iR5gtpaDkzxegCv41ClB2fYY=;
 b=z0sUV6QvqPGBTxFyje6HFdQfSRmA0Ho5xYoVSMSai5jA+QZvqaUCXb5eK0PoN9UcKwiXU2
 b8Y55/yduv7lVjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96AE113A71;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wLj+I2TjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 04/10] drm/radeon: Remove test for !screen_base in fbdev
 probing
Date: Thu, 16 Mar 2023 10:37:32 +0100
Message-Id: <20230316093738.28866-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The screen_base field comes from the fbdev BO and contains the fbdev
framebuffer base address. We get the BO memory via radeon_bo_kmap(),
which already reports the error -ENOMEM if the buffer could not be
mapped. So remove the later test for screen_base, which will never
be NULL at this point.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index cab10c40b49c..7af038ed0d2d 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -247,11 +247,6 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
-	if (info->screen_base == NULL) {
-		ret = -ENOSPC;
-		goto out;
-	}
-
 	DRM_INFO("fb mappable at 0x%lX\n",  info->fix.smem_start);
 	DRM_INFO("vram apper at 0x%lX\n",  (unsigned long)rdev->mc.aper_base);
 	DRM_INFO("size %lu\n", (unsigned long)radeon_bo_size(rbo));
-- 
2.39.2

