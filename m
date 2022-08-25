Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D35A14B5
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Aug 2022 16:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0F510E441;
	Thu, 25 Aug 2022 14:44:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E31B10E559
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Aug 2022 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSViiSuhKNAdrLrYepEenjnf4H0dVHKO/KroQUbHaXc=;
 b=EuPXCJS4VeXs1pKkhIVCBtnILzkx97iVVo4J0Np03Qg/NeWMJt7wRAs3dNiucD1F6h0TEc
 xL69PBlcPA2kwy6h2ENw3W34ltHbYkV4qPGagM8gHCgdt9VTccAE0gL4kJ5FGFjdD6dKkG
 cA0aRn0nbRP7a1wM0BB7ZmvmxlycXps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-bI0-f0_SMi69Q3m9OI_V0A-1; Thu, 25 Aug 2022 10:39:21 -0400
X-MC-Unique: bI0-f0_SMi69Q3m9OI_V0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C79B185A794;
 Thu, 25 Aug 2022 14:39:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2ACA2166B26;
 Thu, 25 Aug 2022 14:39:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v5 27/31] ACPI: video: Remove
 acpi_video_set_dmi_backlight_type()
Date: Thu, 25 Aug 2022 16:37:22 +0200
Message-Id: <20220825143726.269890-28-hdegoede@redhat.com>
In-Reply-To: <20220825143726.269890-1-hdegoede@redhat.com>
References: <20220825143726.269890-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Thu, 25 Aug 2022 14:43:48 +0000
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
Cc: linux-acpi@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

acpi_video_set_dmi_backlight_type() is troublesome because it may end
up getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

In case of the acpi_video backlight, acpi_video_set_dmi_backlight_type()
actually calls acpi_video_unregister_backlight() since that is often
probed earlier, leading to userspace seeing the acpi_video0 class
device being briefly available, leading to races in userspace where
udev probe-rules try to access the device and it is already gone.

All callers have been fixed to no longer call it, so remove
acpi_video_set_dmi_backlight_type() now.

This means we now also no longer need acpi_video_unregister_backlight()
for the remove acpi_video backlight after it was wrongly registered hack,
so remove that too.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c   | 10 ----------
 drivers/acpi/video_detect.c | 16 ----------------
 include/acpi/video.h        |  4 ----
 3 files changed, 30 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index d1e41f30c004..a7c3d11e0dac 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -2296,16 +2296,6 @@ void acpi_video_register_backlight(void)
 }
 EXPORT_SYMBOL(acpi_video_register_backlight);
 
-void acpi_video_unregister_backlight(void)
-{
-	struct acpi_video_bus *video;
-
-	mutex_lock(&video_list_lock);
-	list_for_each_entry(video, &video_bus_head, entry)
-		acpi_video_bus_unregister_backlight(video);
-	mutex_unlock(&video_list_lock);
-}
-
 bool acpi_video_handles_brightness_key_presses(void)
 {
 	return may_report_brightness_keys &&
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 3861d4121172..67a0211c07b4 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -38,8 +38,6 @@
 #include <linux/workqueue.h>
 #include <acpi/video.h>
 
-void acpi_video_unregister_backlight(void);
-
 static enum acpi_backlight_type acpi_backlight_cmdline = acpi_backlight_undef;
 static enum acpi_backlight_type acpi_backlight_dmi = acpi_backlight_undef;
 
@@ -817,17 +815,3 @@ bool acpi_video_backlight_use_native(void)
 	return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
 }
 EXPORT_SYMBOL(acpi_video_backlight_use_native);
-
-/*
- * Set the preferred backlight interface type based on DMI info.
- * This function allows DMI blacklists to be implemented by external
- * platform drivers instead of putting a big blacklist in video_detect.c
- */
-void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
-{
-	acpi_backlight_dmi = type;
-	/* Remove acpi-video backlight interface if it is no longer desired */
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
-		acpi_video_unregister_backlight();
-}
-EXPORT_SYMBOL(acpi_video_set_dmi_backlight_type);
diff --git a/include/acpi/video.h b/include/acpi/video.h
index dbd48cb8bd23..a275c35e5249 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -60,7 +60,6 @@ extern int acpi_video_get_edid(struct acpi_device *device, int type,
 			       int device_id, void **edid);
 extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
 extern bool acpi_video_backlight_use_native(void);
-extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
 /*
  * Note: The value returned by acpi_video_handles_brightness_key_presses()
  * may change over time and should not be cached.
@@ -86,9 +85,6 @@ static inline bool acpi_video_backlight_use_native(void)
 {
 	return true;
 }
-static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
-{
-}
 static inline bool acpi_video_handles_brightness_key_presses(void)
 {
 	return false;
-- 
2.37.2

