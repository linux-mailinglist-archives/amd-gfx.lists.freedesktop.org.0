Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4898572683
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jul 2022 21:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141411BADE;
	Tue, 12 Jul 2022 19:48:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C59964B1
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Jul 2022 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tm6jMPVycKydgq3WZrq/Jda/tvRxwWE3Xj77RCx9x/Q=;
 b=BxyLqzk2QvVhso/+LpFi2iwTkVoECYHGdMmNFyG5Mkqqcrfij9pIz8ujzpHbFgCXkuvlId
 WAEvGELqyGY9SANsStOx4IO+oegeMnzefDl3+AzPIQCuOCjIlLcTLLYUgkB6tjfqgcBZDN
 DHoPrbAq+BbRDuW4YPeL8x1EVPkP3i0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-Snu9z6XIP-O3BJUxI2K8Ng-1; Tue, 12 Jul 2022 15:41:00 -0400
X-MC-Unique: Snu9z6XIP-O3BJUxI2K8Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8F6B101A586;
 Tue, 12 Jul 2022 19:40:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E815B40E80E0;
 Tue, 12 Jul 2022 19:40:55 +0000 (UTC)
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
Subject: [PATCH v2 24/29] platform/x86: samsung-laptop: Move
 acpi_backlight=[vendor|native] quirks to ACPI video_detect.c
Date: Tue, 12 Jul 2022 21:39:05 +0200
Message-Id: <20220712193910.439171-25-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-1-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 12 Jul 2022 19:48:24 +0000
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Len Brown <lenb@kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Move all the acpi_backlight=[vendor|native] quirks from samsung-laptop to
drivers/acpi/video_detect.c .

Note the X360 -> acpi_backlight=native quirk is not moved because that
already was present in drivers/acpi/video_detect.c .

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c           | 54 +++++++++++++++++
 drivers/platform/x86/samsung-laptop.c | 87 ---------------------------
 2 files changed, 54 insertions(+), 87 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index a92322f4caff..84dce2c113ef 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -220,6 +220,33 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "GB-BXBT-2807"),
 		},
 	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Samsung N150/N210/N220 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
+		DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Samsung NF110/NF210/NF310 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "NF110/NF210/NF310"),
+		DMI_MATCH(DMI_BOARD_NAME, "NF110/NF210/NF310"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Samsung NC210 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
+		DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
+		},
+	},
 	{
 	.callback = video_detect_force_vendor,
 	/* Sony VPCEH3U1E */
@@ -562,6 +589,33 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Samsung N150P */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "N150P"),
+		DMI_MATCH(DMI_BOARD_NAME, "N150P"),
+		},
+	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Samsung N145P/N250P/N260P */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
+		DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
+		},
+	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Samsung N250P */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "N250P"),
+		DMI_MATCH(DMI_BOARD_NAME, "N250P"),
+		},
+	},
 	/*
 	 * Clevo NL5xRU and NL5xNU/TUXEDO Aura 15 Gen1 and Gen2 have both a
 	 * working native and video interface. However the default detection
diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index c187dcdf82f0..cc30cf08f32d 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -356,23 +356,13 @@ struct samsung_laptop {
 };
 
 struct samsung_quirks {
-	bool broken_acpi_video;
 	bool four_kbd_backlight_levels;
 	bool enable_kbd_backlight;
-	bool use_native_backlight;
 	bool lid_handling;
 };
 
 static struct samsung_quirks samsung_unknown = {};
 
-static struct samsung_quirks samsung_broken_acpi_video = {
-	.broken_acpi_video = true,
-};
-
-static struct samsung_quirks samsung_use_native_backlight = {
-	.use_native_backlight = true,
-};
-
 static struct samsung_quirks samsung_np740u3e = {
 	.four_kbd_backlight_levels = true,
 	.enable_kbd_backlight = true,
@@ -1540,76 +1530,6 @@ static const struct dmi_system_id samsung_dmi_table[] __initconst = {
 		},
 	},
 	/* Specific DMI ids for laptop with quirks */
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "N150P",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "N150P"),
-		DMI_MATCH(DMI_BOARD_NAME, "N150P"),
-		},
-	 .driver_data = &samsung_use_native_backlight,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "N145P/N250P/N260P",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
-		DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
-		},
-	 .driver_data = &samsung_use_native_backlight,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "N150/N210/N220",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
-		DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
-		},
-	 .driver_data = &samsung_broken_acpi_video,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "NF110/NF210/NF310",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "NF110/NF210/NF310"),
-		DMI_MATCH(DMI_BOARD_NAME, "NF110/NF210/NF310"),
-		},
-	 .driver_data = &samsung_broken_acpi_video,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "X360",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "X360"),
-		DMI_MATCH(DMI_BOARD_NAME, "X360"),
-		},
-	 .driver_data = &samsung_broken_acpi_video,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "N250P",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "N250P"),
-		DMI_MATCH(DMI_BOARD_NAME, "N250P"),
-		},
-	 .driver_data = &samsung_use_native_backlight,
-	},
-	{
-	 .callback = samsung_dmi_matched,
-	 .ident = "NC210",
-	 .matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-		DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
-		DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
-		},
-	 .driver_data = &samsung_broken_acpi_video,
-	},
 	{
 	 .callback = samsung_dmi_matched,
 	 .ident = "730U3E/740U3E",
@@ -1654,15 +1574,8 @@ static int __init samsung_init(void)
 	samsung->handle_backlight = true;
 	samsung->quirks = quirks;
 
-#ifdef CONFIG_ACPI
-	if (samsung->quirks->broken_acpi_video)
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-	if (samsung->quirks->use_native_backlight)
-		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
-
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		samsung->handle_backlight = false;
-#endif
 
 	ret = samsung_platform_init(samsung);
 	if (ret)
-- 
2.36.0

