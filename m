Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37973665C03
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Jan 2023 14:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC1410E72A;
	Wed, 11 Jan 2023 13:02:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F3110E092;
 Wed, 11 Jan 2023 13:02:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4B7A77260;
 Wed, 11 Jan 2023 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c8+MaiAA5v5RRpnrm/ha/8VjIF8LD2DW7L3xgqprMY=;
 b=Z8cSx8GzuIWCMpsUteZanWch89ZEYZf/WjU2naTl9HT7Jpz8A9PPJtUfsYoTnDcgZgssKg
 KxFxTYapGXPkZoPSYK5+wznD4B5xVF/ta76IAHWzwQVduOWskht1n5gvUxHRthUfKy8VAB
 1mHIzm3MLO9S8Efox2NpuouXKA5eYwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c8+MaiAA5v5RRpnrm/ha/8VjIF8LD2DW7L3xgqprMY=;
 b=bb0iFtSJwab7s5phk7m4iw3IeRirPdR7TlrMzvDwLksxs23+qrtkzKaKNTrp8avP2U3xjX
 M00pvrqsplVEk2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5959813594;
 Wed, 11 Jan 2023 13:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UNX8FFOzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 05/10] drm/panel: Do not include <linux/fb.h>
Date: Wed, 11 Jan 2023 14:02:01 +0100
Message-Id: <20230111130206.29974-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111130206.29974-1-tzimmermann@suse.de>
References: <20230111130206.29974-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <linux/fb.h>. No functional
changes. Include <linux/of.h> where the driver got the header file via
<linux/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 1 -
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c          | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index cbb68caa36f2..1ec696adf9de 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -7,7 +7,6 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 79f852465a84..35d568da342f 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -43,7 +43,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/i2c.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 866d1bf5530e..2ef5ea5eaeeb 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -11,7 +11,6 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
-- 
2.39.0

