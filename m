Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB05154C78
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Feb 2020 20:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC06E2E5;
	Thu,  6 Feb 2020 19:55:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBA06E2E5
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Feb 2020 19:55:27 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id 10so5624627ywv.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Feb 2020 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+Z507ROSaGp3BC5kRI9O4usB60z/vdz1/ly7mJw7v0=;
 b=H8S6WOcVp7Po2m0UM28S3ZGOpeNFJZtJDs+B9oqg5goro4Bvwn1gKkZH2cACeNNboY
 Xiir+USzb45nYsK1dBr/LD8zNJ2/lqwL3fLauZf0d1Uxtwb+xIMrBHh8M4/lx0vxku6r
 qN4KeVRag5ztCRgCyiU2hi/x3CB2doOcrZKqWsxWi06rBrUOqdo4/lRMvYJ0/YQ2ulkO
 qZJKD7+bhSEqpfXcxDzU0wJoxUbo7MqGjewq8vyWxXRB/kJu37DHRq6SooQjhw2F36l2
 E5L1mOwSnoKUORb2pQdGhh5bTElPqwLh/Q9MYo4zbWQRSAwRyqF9dg+i3APjNvHerDgV
 v1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+Z507ROSaGp3BC5kRI9O4usB60z/vdz1/ly7mJw7v0=;
 b=gDqkR4BqqvNlSKh4vEofE/JtpM3sCAfioe1QDNtvh+KE+zy2BZMGBl2cx1/rVApurX
 xYHOgC2H6XNaAGDWdhzMDmK0EOGUX6IfI/ydsM23jQRC4L5QGfe0cRZyYd20oi+kT0KY
 iMY9+6ITNGiXQogQDe7rRSPkAw5DIVaJEPIbS3xe0/S8G6BaJHo9F9QENRJH5ZOhNtH8
 RtnwQPjZCm72lmlT5IJJoZZEjM4+r1Mmi5xhjhCzyX2YgzImOwrEGG3V+eU25DSfvKZR
 af/SGT3T/poghYVxKgzWFuyizOroWHS9Kqgav1g0/YYgF0BoGGeoGQWmDMp0hGXx3enF
 kToQ==
X-Gm-Message-State: APjAAAVUkHcn5m6GjeTRv3V4x1cHwfbQ7v/uqEy5ZOvTe9A54F0Xthxy
 GtESeb5fkoGHOfSFsHVgmtchj7ef
X-Google-Smtp-Source: APXvYqxyxVW0MnulX00Qil391swxcWID6p2fr/mviU7JCs/+ejjVmW49Psv7NaWQiTXPqMkD4dmuoA==
X-Received: by 2002:a81:5d5:: with SMTP id 204mr4242907ywf.46.1581018926235;
 Thu, 06 Feb 2020 11:55:26 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id e63sm179870ywd.64.2020.02.06.11.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:55:25 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu:/navi10: use the ODCAP enum to index the caps
 array
Date: Thu,  6 Feb 2020 14:55:16 -0500
Message-Id: <20200206195516.302101-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206195516.302101-1-alexander.deucher@amd.com>
References: <20200206195516.302101-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Aleksandr Mezin <mezin.alexander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rather than the FEATURE_ID flags.  Avoids a possible reading past
the end of the array.

Reported-by: Aleksandr Mezin <mezin.alexander@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 19a9846b730e..0d73a49166af 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -736,9 +736,9 @@ static bool navi10_is_support_fine_grained_dpm(struct smu_context *smu, enum smu
 	return dpm_desc->SnapToDiscrete == 0 ? true : false;
 }
 
-static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODFEATURE_ID feature)
+static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)
 {
-	return od_table->cap[feature];
+	return od_table->cap[cap];
 }
 
 static void navi10_od_setting_get_range(struct smu_11_0_overdrive_table *od_table,
@@ -846,7 +846,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 	case SMU_OD_SCLK:
 		if (!smu->od_enabled || !od_table || !od_settings)
 			break;
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_LIMITS))
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_LIMITS))
 			break;
 		size += sprintf(buf + size, "OD_SCLK:\n");
 		size += sprintf(buf + size, "0: %uMhz\n1: %uMhz\n", od_table->GfxclkFmin, od_table->GfxclkFmax);
@@ -854,7 +854,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 	case SMU_OD_MCLK:
 		if (!smu->od_enabled || !od_table || !od_settings)
 			break;
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_UCLK_MAX))
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_UCLK_MAX))
 			break;
 		size += sprintf(buf + size, "OD_MCLK:\n");
 		size += sprintf(buf + size, "1: %uMHz\n", od_table->UclkFmax);
@@ -862,7 +862,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 	case SMU_OD_VDDC_CURVE:
 		if (!smu->od_enabled || !od_table || !od_settings)
 			break;
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_CURVE))
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_CURVE))
 			break;
 		size += sprintf(buf + size, "OD_VDDC_CURVE:\n");
 		for (i = 0; i < 3; i++) {
@@ -887,7 +887,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 			break;
 		size = sprintf(buf, "%s:\n", "OD_RANGE");
 
-		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_LIMITS)) {
+		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_LIMITS)) {
 			navi10_od_setting_get_range(od_settings, SMU_11_0_ODSETTING_GFXCLKFMIN,
 						    &min_value, NULL);
 			navi10_od_setting_get_range(od_settings, SMU_11_0_ODSETTING_GFXCLKFMAX,
@@ -896,14 +896,14 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 					min_value, max_value);
 		}
 
-		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_UCLK_MAX)) {
+		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_UCLK_MAX)) {
 			navi10_od_setting_get_range(od_settings, SMU_11_0_ODSETTING_UCLKFMAX,
 						    &min_value, &max_value);
 			size += sprintf(buf + size, "MCLK: %7uMhz %10uMhz\n",
 					min_value, max_value);
 		}
 
-		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_CURVE)) {
+		if (navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_CURVE)) {
 			navi10_od_setting_get_range(od_settings, SMU_11_0_ODSETTING_VDDGFXCURVEFREQ_P1,
 						    &min_value, &max_value);
 			size += sprintf(buf + size, "VDDC_CURVE_SCLK[0]: %7uMhz %10uMhz\n",
@@ -2056,7 +2056,7 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 
 	switch (type) {
 	case PP_OD_EDIT_SCLK_VDDC_TABLE:
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_LIMITS)) {
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_LIMITS)) {
 			pr_warn("GFXCLK_LIMITS not supported!\n");
 			return -ENOTSUPP;
 		}
@@ -2102,7 +2102,7 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 		}
 		break;
 	case PP_OD_EDIT_MCLK_VDDC_TABLE:
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_UCLK_MAX)) {
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_UCLK_MAX)) {
 			pr_warn("UCLK_MAX not supported!\n");
 			return -ENOTSUPP;
 		}
@@ -2143,7 +2143,7 @@ static int navi10_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABL
 		}
 		break;
 	case PP_OD_EDIT_VDDC_CURVE:
-		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_GFXCLK_CURVE)) {
+		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODCAP_GFXCLK_CURVE)) {
 			pr_warn("GFXCLK_CURVE not supported!\n");
 			return -ENOTSUPP;
 		}
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
