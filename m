Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E9C2909F9
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Oct 2020 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991E6EE29;
	Fri, 16 Oct 2020 16:50:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748C26EE29
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Oct 2020 16:50:20 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id h12so2015998qtu.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Oct 2020 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yYmdgZqSWyhZtnW745BrHJJaoEjv6loocPCjCGDoxQ=;
 b=t07WNo5bfy8E00NzEGBNlVJ6t9BsqiC+JbtTwajZ5gRybgmT5jsYUC9X5FXkKzQuys
 N9XGtjGsnRbu3wj4O1BxxXGl2I92v4Yeht5eXkPAPuiLlqE9nl/srgV0pcaRAMtjSv7f
 il7m77etAPkIl3KpASKT+uWhB7zPobDdUg/iStrgmc7C6tG/7ie6IFXBMq1EU9etTvEE
 v6x77bthESThsPSVDNeBqlXRGxKML/dC3t2l7GF29nRrgl7N9CgLE/g+deY1NYL1B8bV
 1hMKhWzGbG6HjmRw+C9eLFPnMfbu/swDerzPaQL0et96xYWycD9oq1j5b9Sz04ISF+6t
 2I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yYmdgZqSWyhZtnW745BrHJJaoEjv6loocPCjCGDoxQ=;
 b=FWr7SHIpBTxLpCf1JqNWMD1jUWzKR4Y10EF62o7P5yog+BEqaNNimrZA/mfmNs3tlS
 CPiJA/rSgKsQPNN7lGE+ldg40gghi4L8XsUYNPEbu1f/UqwLxVLz+tx1f+1KyBzCo0uZ
 Deh80yZ6VABFnEqURMQaw86fJOqccQXY0SMfJBQ81ETEGhEwpOn1xW8xFtC8zRcSN3nG
 89jisH3gbHoaqtwgkoQfjL54n1+iB+Ybv4+hvjy0z0hV3vUDENPDlncgbNeu4yj6YkLz
 Pa3Ox2bJHYqVNrnhkLWB6FYQX7Y0KHhAC7gpHqPCJTlEhdx0PipfJRIu1Di7XKCqiZou
 T/Fw==
X-Gm-Message-State: AOAM532TU5n/cPV3RAxjk0pt7/dz4zYNhUH9jtnEKVI0D83fGJ7pLxdK
 BVZ8ALjAMTYVb/+OKfE9vYmo9TNzqAw=
X-Google-Smtp-Source: ABdhPJwQfSoOXG5y8klq2ZZteNgfwfR3eZI8lePvuHe0Gsrg7TrllWwrshmNwujsJ6tt/8q1/Ue2Cg==
X-Received: by 2002:aed:3163:: with SMTP id 90mr4318993qtg.225.1602867017212; 
 Fri, 16 Oct 2020 09:50:17 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q9sm1193726qta.70.2020.10.16.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 09:50:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: fold CONFIG_DRM_AMD_DC_DCN3* into
 CONFIG_DRM_AMD_DC_DCN
Date: Fri, 16 Oct 2020 12:50:04 -0400
Message-Id: <20201016165004.1218352-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201016165004.1218352-1-alexander.deucher@amd.com>
References: <20201016165004.1218352-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Avoids confusion in configurations.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 -
 drivers/gpu/drm/amd/display/Kconfig           | 27 +--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 60 +++----------------
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 -
 drivers/gpu/drm/amd/display/dc/Makefile       | 10 ----
 .../drm/amd/display/dc/bios/bios_parser2.c    | 18 ------
 .../display/dc/bios/command_table_helper2.c   | 12 ----
 .../gpu/drm/amd/display/dc/calcs/dcn_calcs.c  |  2 -
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  4 --
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  | 14 +----
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 12 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  4 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 34 ++---------
 .../gpu/drm/amd/display/dc/core/dc_stream.c   | 12 ++--
 drivers/gpu/drm/amd/display/dc/dc.h           | 22 +++----
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  | 18 ------
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  6 --
 drivers/gpu/drm/amd/display/dc/dc_types.h     | 10 +---
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h  |  6 --
 .../drm/amd/display/dc/dce/dce_clock_source.c |  8 +--
 .../drm/amd/display/dc/dce/dce_clock_source.h | 12 ++--
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    | 31 ----------
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c |  2 -
 .../amd/display/dc/dcn10/dcn10_link_encoder.h |  9 ---
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.c |  5 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.h | 31 ----------
 .../display/dc/dcn10/dcn10_stream_encoder.h   |  8 ---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h |  8 ---
 .../drm/amd/display/dc/dcn20/dcn20_hubbub.c   |  4 --
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c |  6 --
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h | 18 ------
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 13 +---
 .../amd/display/dc/dcn20/dcn20_link_encoder.h |  2 -
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 23 +------
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  7 ---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h |  2 -
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 -
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h    |  6 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |  5 --
 .../dc/dml/dcn30/display_mode_vba_30.c        |  4 +-
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     |  2 +-
 .../drm/amd/display/dc/dml/display_mode_lib.c | 10 +---
 .../drm/amd/display/dc/dml/display_mode_lib.h |  4 --
 .../amd/display/dc/dml/display_mode_structs.h |  2 -
 .../drm/amd/display/dc/dml/display_mode_vba.c |  2 -
 .../drm/amd/display/dc/dml/display_mode_vba.h |  2 -
 drivers/gpu/drm/amd/display/dc/gpio/Makefile  |  5 +-
 .../display/dc/gpio/dcn30/hw_factory_dcn30.c  |  2 +-
 .../display/dc/gpio/dcn30/hw_factory_dcn30.h  |  2 +-
 .../dc/gpio/dcn30/hw_translate_dcn30.c        |  2 +-
 .../dc/gpio/dcn30/hw_translate_dcn30.h        |  2 +-
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |  9 ---
 .../drm/amd/display/dc/gpio/hw_translate.c    |  9 ---
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  8 +--
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   | 26 +-------
 .../amd/display/dc/inc/hw/clk_mgr_internal.h  |  7 +--
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |  6 --
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h   |  6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  4 --
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |  2 -
 .../gpu/drm/amd/display/dc/inc/hw/mcif_wb.h   |  4 --
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 19 +-----
 .../amd/display/dc/inc/hw/stream_encoder.h    |  2 -
 .../amd/display/dc/inc/hw/timing_generator.h  |  6 --
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  4 --
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  2 -
 drivers/gpu/drm/amd/display/dc/irq/Makefile   |  4 --
 .../display/dc/irq/dcn30/irq_service_dcn30.c  |  2 +-
 .../display/dc/irq/dcn30/irq_service_dcn30.h  |  2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |  6 --
 drivers/gpu/drm/amd/display/dmub/src/Makefile |  4 --
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   | 18 ------
 .../gpu/drm/amd/display/include/dal_asic_id.h |  6 --
 .../gpu/drm/amd/display/include/dal_types.h   |  6 --
 .../display/include/grph_object_ctrl_defs.h   |  4 --
 .../amd/display/modules/power/power_helpers.c | 11 +---
 77 files changed, 81 insertions(+), 614 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fb9e61f861e9..13955d6ec113 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3002,8 +3002,6 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_RENOIR:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
 	case CHIP_DIMGREY_CAVEFISH:
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index cf87133f88e6..513c3e25387f 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -15,32 +15,7 @@ config DRM_AMD_DC
 config DRM_AMD_DC_DCN
 	def_bool n
 	help
-	  Raven, Navi and Renoir family support for display engine
-
-config DRM_AMD_DC_DCN3_0
-        bool "DCN 3.0 family"
-        depends on DRM_AMD_DC && X86
-        depends on DRM_AMD_DC_DCN
-        help
-            Choose this option if you want to have
-            sienna_cichlid support for display engine
-
-config DRM_AMD_DC_DCN3_01
-	bool "DCN 3.01 family"
-	depends on DRM_AMD_DC && X86
-	depends on DRM_AMD_DC_DCN
-	depends on DRM_AMD_DC_DCN3_0
-	help
-	    Choose this option if you want to have
-	    Van Gogh support for display engine
-
-config DRM_AMD_DC_DCN3_02
-        bool "DCN 3.02 family"
-        depends on DRM_AMD_DC_DCN3_0
-        depends on DRM_AMD_DC_DCN3_01
-        help
-            Choose this option if you want to have
-            Dimgrey_cavefish support for display engine
+	  Raven, Navi, and newer family support for display engine
 
 config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2aa810d3554b..a20bdd783875 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -94,22 +94,16 @@
 
 #define FIRMWARE_RENOIR_DMUB "amdgpu/renoir_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_RENOIR_DMUB);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define FIRMWARE_SIENNA_CICHLID_DMUB "amdgpu/sienna_cichlid_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_SIENNA_CICHLID_DMUB);
 #define FIRMWARE_NAVY_FLOUNDER_DMUB "amdgpu/navy_flounder_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_NAVY_FLOUNDER_DMUB);
-#endif
 #define FIRMWARE_GREEN_SARDINE_DMUB "amdgpu/green_sardine_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_GREEN_SARDINE_DMUB);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define FIRMWARE_VANGOGH_DMUB "amdgpu/vangogh_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_VANGOGH_DMUB);
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 #define FIRMWARE_DIMGREY_CAVEFISH_DMUB "amdgpu/dimgrey_cavefish_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_DIMGREY_CAVEFISH_DMUB);
-#endif
 
 #define FIRMWARE_RAVEN_DMCU		"amdgpu/raven_dmcu.bin"
 MODULE_FIRMWARE(FIRMWARE_RAVEN_DMCU);
@@ -1180,16 +1174,10 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_RENOIR:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case CHIP_DIMGREY_CAVEFISH:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case CHIP_VANGOGH:
-#endif
 		return 0;
 	case CHIP_NAVI12:
 		fw_name_dmcu = FIRMWARE_NAVI12_DMCU;
@@ -1288,7 +1276,6 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
 			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
 		dmub_asic = DMUB_ASIC_DCN30;
 		fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
@@ -1297,19 +1284,14 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 		dmub_asic = DMUB_ASIC_DCN30;
 		fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
 		break;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case CHIP_VANGOGH:
 		dmub_asic = DMUB_ASIC_DCN301;
 		fw_name_dmub = FIRMWARE_VANGOGH_DMUB;
 		break;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case CHIP_DIMGREY_CAVEFISH:
 		dmub_asic = DMUB_ASIC_DCN302;
 		fw_name_dmub = FIRMWARE_DIMGREY_CAVEFISH_DMUB;
 		break;
-#endif
 
 	default:
 		/* ASIC doesn't support DMUB. */
@@ -3428,16 +3410,10 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_RENOIR:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case CHIP_DIMGREY_CAVEFISH:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case CHIP_VANGOGH:
-#endif
 		if (dcn10_register_irq_handlers(dm->adev)) {
 			DRM_ERROR("DM: Failed to initialize IRQ\n");
 			goto fail;
@@ -3596,41 +3572,27 @@ static int dm_early_init(void *handle)
 		break;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	case CHIP_RAVEN:
+	case CHIP_RENOIR:
+	case CHIP_VANGOGH:
 		adev->mode_info.num_crtc = 4;
 		adev->mode_info.num_hpd = 4;
 		adev->mode_info.num_dig = 4;
 		break;
-#endif
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
-#endif
 		adev->mode_info.num_crtc = 6;
 		adev->mode_info.num_hpd = 6;
 		adev->mode_info.num_dig = 6;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
-	case CHIP_VANGOGH:
-		adev->mode_info.num_crtc = 4;
-		adev->mode_info.num_hpd = 4;
-		adev->mode_info.num_dig = 4;
-		break;
-#endif
 	case CHIP_NAVI14:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case CHIP_DIMGREY_CAVEFISH:
-#endif
 		adev->mode_info.num_crtc = 5;
 		adev->mode_info.num_hpd = 5;
 		adev->mode_info.num_dig = 5;
 		break;
-	case CHIP_RENOIR:
-		adev->mode_info.num_crtc = 4;
-		adev->mode_info.num_hpd = 4;
-		adev->mode_info.num_dig = 4;
-		break;
+#endif
 	default:
 		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
 		return -EINVAL;
@@ -3937,16 +3899,10 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 	    adev->asic_type == CHIP_NAVI10 ||
 	    adev->asic_type == CHIP_NAVI14 ||
 	    adev->asic_type == CHIP_NAVI12 ||
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-		adev->asic_type == CHIP_SIENNA_CICHLID ||
-		adev->asic_type == CHIP_NAVY_FLOUNDER ||
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
-		adev->asic_type == CHIP_DIMGREY_CAVEFISH ||
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
-		adev->asic_type == CHIP_VANGOGH ||
-#endif
+	    adev->asic_type == CHIP_SIENNA_CICHLID ||
+	    adev->asic_type == CHIP_NAVY_FLOUNDER ||
+	    adev->asic_type == CHIP_DIMGREY_CAVEFISH ||
+	    adev->asic_type == CHIP_VANGOGH ||
 	    adev->asic_type == CHIP_RENOIR ||
 	    adev->asic_type == CHIP_RAVEN) {
 		/* Fill GFX9 params */
@@ -3966,12 +3922,10 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 			AMDGPU_TILING_GET(tiling_flags, SWIZZLE_MODE);
 		tiling_info->gfx9.shaderEnable = 1;
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 		if (adev->asic_type == CHIP_SIENNA_CICHLID ||
 		    adev->asic_type == CHIP_NAVY_FLOUNDER ||
 		    adev->asic_type == CHIP_DIMGREY_CAVEFISH)
 			tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
-#endif
 		ret = fill_plane_dcc_attributes(adev, afb, format, rotation,
 						plane_size, tiling_info,
 						tiling_flags, dcc, address,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d839eb14e3f0..b7d7ec3ba00d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -627,7 +627,6 @@ void dm_set_dcn_clocks(struct dc_context *ctx, struct dc_clocks *clks)
 {
 	/* TODO: something */
 }
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 
 void *dm_helpers_allocate_gpu_mem(
 		struct dc_context *ctx,
@@ -646,4 +645,3 @@ void dm_helpers_free_gpu_mem(
 {
 	// TODO
 }
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index c3bd2b51e92c..bf8fe0471b8f 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -30,19 +30,9 @@ DC_LIBS += dcn20
 DC_LIBS += dsc
 DC_LIBS += dcn10 dml
 DC_LIBS += dcn21
-endif
-
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 DC_LIBS += dcn30
-endif
-
-ifdef CONFIG_DRM_AMD_DC_DCN3_01
 DC_LIBS += dcn301
-endif
-
-ifdef CONFIG_DRM_AMD_DC_DCN3_02
 DC_LIBS += dcn302
-
 endif
 
 DC_LIBS += dce120
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 8fa002ec6969..43922fa358a9 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1230,12 +1230,8 @@ static enum bp_result bios_parser_get_firmware_info(
 				result = get_firmware_info_v3_1(bp, info);
 				break;
 			case 2:
-				result = get_firmware_info_v3_2(bp, info);
-				break;
 			case 3:
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 			case 4:
-#endif
 				result = get_firmware_info_v3_2(bp, info);
 				break;
 			default:
@@ -1743,7 +1739,6 @@ static enum bp_result get_integrated_info_v11(
 	return BP_RESULT_OK;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 static enum bp_result get_integrated_info_v2_1(
 	struct bios_parser *bp,
 	struct integrated_info *info)
@@ -1903,7 +1898,6 @@ static enum bp_result get_integrated_info_v2_1(
 
 	return BP_RESULT_OK;
 }
-#endif
 
 /*
  * construct_integrated_info
@@ -1936,7 +1930,6 @@ static enum bp_result construct_integrated_info(
 
 		get_atom_data_table_revision(header, &revision);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 		switch (revision.major) {
 		case 1:
 			switch (revision.minor) {
@@ -1960,17 +1953,6 @@ static enum bp_result construct_integrated_info(
 		default:
 			return result;
 		}
-#else
-		/* Don't need to check major revision as they are all 1 */
-		switch (revision.minor) {
-		case 11:
-		case 12:
-			result = get_integrated_info_v11(bp, info);
-			break;
-		default:
-			return result;
-		}
-#endif
 	}
 
 	if (result != BP_RESULT_OK)
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index eb34f2e4aa0f..7736c92d55c4 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -70,20 +70,8 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 	case DCN_VERSION_1_01:
 	case DCN_VERSION_2_0:
 	case DCN_VERSION_2_1:
-		*h = dal_cmd_tbl_helper_dce112_get_table2();
-		return true;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
-		*h = dal_cmd_tbl_helper_dce112_get_table2();
-		return true;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
-		*h = dal_cmd_tbl_helper_dce112_get_table2();
-		return true;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case DCN_VERSION_3_02:
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
index 51397b565ddf..cebc4ec6bbc0 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
@@ -381,13 +381,11 @@ static void pipe_ctx_to_e2e_pipe_params (
 		input->src.viewport_width_c    = input->src.viewport_width;
 		input->src.viewport_height_c   = input->src.viewport_height;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
 		input->src.source_format = dm_rgbe_alpha;
 		input->src.viewport_width_c    = input->src.viewport_width;
 		input->src.viewport_height_c   = input->src.viewport_height;
 		break;
-#endif
 	default:
 		input->src.source_format = dm_444_32;
 		input->src.viewport_width_c    = input->src.viewport_width;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 8c6d0a2acba4..facc8b970300 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -114,8 +114,6 @@ endif
 AMD_DAL_CLK_MGR_DCN21 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn21/,$(CLK_MGR_DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
-endif
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 ###############################################################################
 # DCN30
 ###############################################################################
@@ -124,8 +122,6 @@ CLK_MGR_DCN30 = dcn30_clk_mgr.o dcn30_clk_mgr_smu_msg.o
 AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DCN30))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
-endif
-ifdef CONFIG_DRM_AMD_DC_DCN3_01
 ###############################################################################
 # DCN301
 ###############################################################################
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 19d97ed6beb8..73c91027572b 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -39,12 +39,8 @@
 #include "dcn10/rv2_clk_mgr.h"
 #include "dcn20/dcn20_clk_mgr.h"
 #include "dcn21/rn_clk_mgr.h"
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #include "dcn30/dcn30_clk_mgr.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #include "dcn301/vg_clk_mgr.h"
-#endif
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -186,23 +182,17 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		break;
 
 	case FAMILY_NV:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		if (ASICREV_IS_SIENNA_CICHLID_P(asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 			break;
 		}
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 			break;
 		}
-#endif
-#endif
 		dcn20_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		break;
-#endif	/* Family RV and NV*/
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case FAMILY_VGH:
 		if (ASICREV_IS_VANGOGH(asic_id.hw_internal_rev))
 			vg_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
@@ -219,8 +209,8 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 
+#ifdef CONFIG_DRM_AMD_DC_DCN
 	switch (clk_mgr_base->ctx->asic_id.chip_family) {
 	case FAMILY_NV:
 		if (ASICREV_IS_SIENNA_CICHLID_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
@@ -228,12 +218,10 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		}
 		break;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case FAMILY_VGH:
 		if (ASICREV_IS_VANGOGH(clk_mgr_base->ctx->asic_id.hw_internal_rev))
 			vg_clk_mgr_destroy(clk_mgr);
 		break;
-#endif
 
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 72819cf19b5b..7ff029143722 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -731,7 +731,7 @@ static bool dc_construct(struct dc *dc,
 	dc->clk_mgr = dc_clk_mgr_create(dc->ctx, dc->res_pool->pp_smu, dc->res_pool->dccg);
 	if (!dc->clk_mgr)
 		goto fail;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+#ifdef CONFIG_DRM_AMD_DC_DCN
 	dc->clk_mgr->force_smu_not_present = init_params->force_smu_not_present;
 #endif
 
@@ -1322,7 +1322,7 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 	int i, k, l;
 	struct dc_stream_state *dc_streams[MAX_STREAMS] = {0};
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	dc_allow_idle_optimizations(dc, false);
 #endif
 
@@ -1468,7 +1468,7 @@ bool dc_commit_state(struct dc *dc, struct dc_state *context)
 	return (result == DC_OK);
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 bool dc_acquire_release_mpc_3dlut(
 		struct dc *dc, bool acquire,
 		struct dc_stream_state *stream,
@@ -1922,7 +1922,7 @@ static enum surface_update_type check_update_surfaces_for_stream(
 	int i;
 	enum surface_update_type overall_type = UPDATE_TYPE_FAST;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dc->idle_optimizations_allowed)
 		overall_type = UPDATE_TYPE_FULL;
 
@@ -2396,7 +2396,7 @@ static void commit_planes_for_stream(struct dc *dc,
 	}
 
 	if (update_type == UPDATE_TYPE_FULL) {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 		dc_allow_idle_optimizations(dc, false);
 
 #endif
@@ -3038,7 +3038,7 @@ bool dc_set_psr_allow_active(struct dc *dc, bool enable)
 	return true;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 void dc_allow_idle_optimizations(struct dc *dc, bool allow)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index fec87a2e210c..acb79d2b42c8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3106,7 +3106,7 @@ void core_link_enable_stream(
 	struct dc *dc = pipe_ctx->stream->ctx->dc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	enum dc_status status;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
 #endif
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
@@ -3142,7 +3142,7 @@ void core_link_enable_stream(
 
 	pipe_ctx->stream->link->link_state_valid = true;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
 		pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, otg_out_dest);
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 419c0df08602..8da73129601f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -54,15 +54,9 @@
 #include "dcn10/dcn10_resource.h"
 #include "dcn20/dcn20_resource.h"
 #include "dcn21/dcn21_resource.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-#include "../dcn30/dcn30_resource.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
-#include "../dcn301/dcn301_resource.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
-#include "../dcn302/dcn302_resource.h"
+#include "dcn30/dcn30_resource.h"
+#include "dcn301/dcn301_resource.h"
+#include "dcn302/dcn302_resource.h"
 #endif
 
 #define DC_LOGGER_INIT(logger)
@@ -129,21 +123,15 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 		if (ASICREV_IS_GREEN_SARDINE(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_2_1;
 		break;
-#endif
 
 	case FAMILY_NV:
 		dc_version = DCN_VERSION_2_0;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		if (ASICREV_IS_SIENNA_CICHLID_P(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_3_0;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_3_02;
-#endif
 		break;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case FAMILY_VGH:
 		dc_version = DCN_VERSION_3_01;
 		break;
@@ -213,31 +201,21 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_1_01:
 		res_pool = dcn10_create_resource_pool(init_data, dc);
 		break;
-
-
 	case DCN_VERSION_2_0:
 		res_pool = dcn20_create_resource_pool(init_data, dc);
 		break;
 	case DCN_VERSION_2_1:
 		res_pool = dcn21_create_resource_pool(init_data, dc);
 		break;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
 		res_pool = dcn30_create_resource_pool(init_data, dc);
 		break;
-#endif
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
 		res_pool = dcn301_create_resource_pool(init_data, dc);
 		break;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case DCN_VERSION_3_02:
 		res_pool = dcn302_create_resource_pool(init_data, dc);
 		break;
-
 #endif
 	default:
 		break;
@@ -352,7 +330,7 @@ bool resource_construct(
 		}
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	for (i = 0; i < caps->num_mpc_3dlut; i++) {
 		pool->mpc_lut[i] = dc_create_3dlut_func();
 		if (pool->mpc_lut[i] == NULL)
@@ -2157,7 +2135,7 @@ enum dc_status resource_map_pool_resources(
 
 	/* Add ABM to the resource if on EDP */
 	if (pipe_ctx->stream && dc_is_embedded_signal(pipe_ctx->stream->signal)) {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (pool->abm)
 			pipe_ctx->stream_res.abm = pool->abm;
 		else
@@ -2982,7 +2960,7 @@ unsigned int resource_pixel_format_to_bpp(enum surface_pixel_format format)
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB2101010:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index d48fd87d3b95..c103f858375d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -272,7 +272,7 @@ bool dc_stream_set_cursor_attributes(
 	struct dc  *dc;
 	struct resource_context *res_ctx;
 	struct pipe_ctx *pipe_to_program = NULL;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool reset_idle_optimizations = false;
 #endif
 
@@ -294,7 +294,7 @@ bool dc_stream_set_cursor_attributes(
 	res_ctx = &dc->current_state->res_ctx;
 	stream->cursor_attributes = *attributes;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* disable idle optimizations while updating cursor */
 	if (dc->idle_optimizations_allowed) {
 		dc_allow_idle_optimizations(dc, false);
@@ -322,7 +322,7 @@ bool dc_stream_set_cursor_attributes(
 	if (pipe_to_program)
 		dc->hwss.cursor_lock(dc, pipe_to_program, false);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* re-enable idle optimizations if necessary */
 	if (reset_idle_optimizations)
 		dc_allow_idle_optimizations(dc, true);
@@ -339,7 +339,7 @@ bool dc_stream_set_cursor_position(
 	struct dc  *dc;
 	struct resource_context *res_ctx;
 	struct pipe_ctx *pipe_to_program = NULL;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool reset_idle_optimizations = false;
 #endif
 
@@ -355,7 +355,7 @@ bool dc_stream_set_cursor_position(
 
 	dc = stream->ctx->dc;
 	res_ctx = &dc->current_state->res_ctx;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 	/* disable idle optimizations if enabling cursor */
 	if (dc->idle_optimizations_allowed && !stream->cursor_position.enable && position->enable) {
@@ -387,7 +387,7 @@ bool dc_stream_set_cursor_position(
 	if (pipe_to_program)
 		dc->hwss.cursor_lock(dc, pipe_to_program, false);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* re-enable idle optimizations if necessary */
 	if (reset_idle_optimizations)
 		dc_allow_idle_optimizations(dc, true);
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 024fd4b17f3a..3560f7a04367 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -190,7 +190,7 @@ struct dc_dcc_setting {
 	unsigned int max_compressed_blk_size;
 	unsigned int max_uncompressed_blk_size;
 	bool independent_64b_blks;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	//These bitfields to be used starting with DCN 3.0
 	struct {
 		uint32_t dcc_256_64_64 : 1;//available in ASICs before DCN 3.0 (the worst compression case)
@@ -291,7 +291,7 @@ struct dc_config {
 	bool multi_mon_pp_mclk_switch;
 	bool disable_dmcu;
 	bool enable_4to1MPC;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool clamp_min_dcfclk;
 #endif
 };
@@ -473,14 +473,14 @@ struct dc_debug_options {
 	bool edid_read_retry_times;
 	bool remove_disconnect_edp;
 	unsigned int force_odm_combine; //bit vector based on otg inst
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	unsigned int force_odm_combine_4to1; //bit vector based on otg inst
 #endif
 	unsigned int force_fclk_khz;
 	bool enable_tri_buf;
 	bool dmub_offload_enabled;
 	bool dmcub_emulation;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool disable_idle_power_optimizations;
 #endif
 	bool dmub_command_table; /* for testing only */
@@ -491,7 +491,7 @@ struct dc_debug_options {
 	 * watermarks are not affected.
 	 */
 	unsigned int force_min_dcfclk_mhz;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	int dwb_fi_phase;
 #endif
 	bool disable_timing_sync;
@@ -600,7 +600,7 @@ struct dc {
 	/* Require to optimize clocks and bandwidth for added/removed planes */
 	bool optimized_required;
 	bool wm_optimized_required;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool idle_optimizations_allowed;
 #endif
 
@@ -659,7 +659,7 @@ struct dc_init_data {
 	 */
 	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
 	struct dpcd_vendor_signature vendor_signature;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool force_smu_not_present;
 #endif
 	bool force_ignore_link_settings;
@@ -854,7 +854,7 @@ struct dc_plane_state {
 	struct dc_transfer_func *in_shaper_func;
 	struct dc_transfer_func *blend_tf;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_transfer_func *gamcor_tf;
 #endif
 	enum surface_pixel_format format;
@@ -1002,7 +1002,7 @@ void dc_resource_state_construct(
 		const struct dc *dc,
 		struct dc_state *dst_ctx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 bool dc_acquire_release_mpc_3dlut(
 		struct dc *dc, bool acquire,
 		struct dc_stream_state *stream,
@@ -1130,7 +1130,7 @@ struct hdcp_caps {
 
 #include "dc_link.h"
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 uint32_t dc_get_opp_for_plane(struct dc *dc, struct dc_plane_state *plane);
 
 #endif
@@ -1249,7 +1249,7 @@ bool dc_is_dmcu_initialized(struct dc *dc);
 
 enum dc_status dc_set_clock(struct dc *dc, enum dc_clock_type clock_type, uint32_t clk_khz, uint32_t stepping);
 void dc_get_clock(struct dc *dc, enum dc_clock_type clock_type, struct dc_clock_config *clock_cfg);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 bool dc_is_plane_eligible_for_idle_optimizations(struct dc *dc,
 						 struct dc_plane_state *plane);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 1a87bc3da826..701aa7178a89 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -62,9 +62,7 @@ enum dc_plane_addr_type {
 	PLN_ADDR_TYPE_GRAPHICS = 0,
 	PLN_ADDR_TYPE_GRPH_STEREO,
 	PLN_ADDR_TYPE_VIDEO_PROGRESSIVE,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	PLN_ADDR_TYPE_RGBEA
-#endif
 };
 
 struct dc_plane_address {
@@ -87,7 +85,6 @@ struct dc_plane_address {
 			PHYSICAL_ADDRESS_LOC right_meta_addr;
 			union large_integer right_dcc_const_color;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 			PHYSICAL_ADDRESS_LOC left_alpha_addr;
 			PHYSICAL_ADDRESS_LOC left_alpha_meta_addr;
 			union large_integer left_alpha_dcc_const_color;
@@ -95,7 +92,6 @@ struct dc_plane_address {
 			PHYSICAL_ADDRESS_LOC right_alpha_addr;
 			PHYSICAL_ADDRESS_LOC right_alpha_meta_addr;
 			union large_integer right_alpha_dcc_const_color;
-#endif
 
 		} grph_stereo;
 
@@ -110,7 +106,6 @@ struct dc_plane_address {
 			union large_integer chroma_dcc_const_color;
 		} video_progressive;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		struct {
 			PHYSICAL_ADDRESS_LOC addr;
 			PHYSICAL_ADDRESS_LOC meta_addr;
@@ -120,7 +115,6 @@ struct dc_plane_address {
 			PHYSICAL_ADDRESS_LOC alpha_meta_addr;
 			union large_integer alpha_dcc_const_color;
 		} rgbea;
-#endif
 	};
 
 	union large_integer page_table_base;
@@ -156,15 +150,11 @@ struct dc_plane_dcc_param {
 
 	int meta_pitch;
 	bool independent_64b_blks;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint8_t dcc_ind_blk;
-#endif
 
 	int meta_pitch_c;
 	bool independent_64b_blks_c;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint8_t dcc_ind_blk_c;
-#endif
 };
 
 /*Displayable pixel format in fb*/
@@ -200,10 +190,8 @@ enum surface_pixel_format {
 	SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FIX,
 	SURFACE_PIXEL_FORMAT_GRPH_RGB111110_FLOAT,
 	SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FLOAT,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	SURFACE_PIXEL_FORMAT_GRPH_RGBE,
 	SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA,
-#endif
 	SURFACE_PIXEL_FORMAT_VIDEO_BEGIN,
 	SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr =
 		SURFACE_PIXEL_FORMAT_VIDEO_BEGIN,
@@ -856,8 +844,6 @@ enum dwb_stereo_type {
 	DWB_STEREO_TYPE_FRAME_SEQUENTIAL = 3,	/* Frame sequential */
 };
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
-
 enum dwb_out_format {
 	DWB_OUT_FORMAT_32BPP_ARGB = 0,
 	DWB_OUT_FORMAT_32BPP_RGBA = 1,
@@ -890,8 +876,6 @@ struct mcif_warmup_params {
 	unsigned int		p_vmid;
 };
 
-#endif
-
 #define MCIF_BUF_COUNT	4
 
 struct mcif_buf_params {
@@ -901,9 +885,7 @@ struct mcif_buf_params {
 	unsigned int		chroma_pitch;
 	unsigned int		warmup_pitch;
 	unsigned int		swlock;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	unsigned int		p_vmid;
-#endif
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 82a35d008094..e3fe0c38beac 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -88,13 +88,11 @@ struct dc_writeback_info {
 	int dwb_pipe_inst;
 	struct dc_dwb_params dwb_params;
 	struct mcif_buf_params mcif_buf_params;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	struct mcif_warmup_params mcif_warmup_params;
 	/* the plane that is the input to TOP_MUX for MPCC that is the DWB source */
 	struct dc_plane_state *writeback_source_plane;
 	/* source MPCC instance.  for use by internally by dc */
 	int mpcc_inst;
-#endif
 };
 
 struct dc_writeback_update {
@@ -208,10 +206,8 @@ struct dc_stream_state {
 	/* writeback */
 	unsigned int num_wb_info;
 	struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	const struct dc_transfer_func *func_shaper;
 	const struct dc_3dlut *lut3d_func;
-#endif
 	/* Computed state bits */
 	bool mode_changed : 1;
 
@@ -263,10 +259,8 @@ struct dc_stream_update {
 
 	struct dc_writeback_update *wb_update;
 	struct dc_dsc_config *dsc_config;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	struct dc_transfer_func *func_shaper;
 	struct dc_3dlut *lut3d_func;
-#endif
 };
 
 bool dc_is_stream_unchanged(
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index c47a19719de2..f0e491444211 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -479,7 +479,6 @@ enum display_content_type {
 	DISPLAY_CONTENT_TYPE_GAME = 8
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 enum cm_gamut_adjust_type {
 	CM_GAMUT_ADJUST_TYPE_BYPASS = 0,
 	CM_GAMUT_ADJUST_TYPE_HW, /* without adjustments */
@@ -491,7 +490,7 @@ struct cm_grph_csc_adjustment {
 	enum cm_gamut_adjust_type gamut_adjust_type;
 	enum cm_gamut_coef_format gamut_coef_format;
 };
-#endif
+
 /* writeback */
 struct dwb_stereo_params {
 	bool				stereo_enabled;		/* false: normal mode, true: 3D stereo */
@@ -509,21 +508,17 @@ struct dc_dwb_cnv_params {
 	unsigned int		crop_x;		/* cropped window start x value at cnv output */
 	unsigned int		crop_y;		/* cropped window start y value at cnv output */
 	enum dwb_cnv_out_bpc cnv_out_bpc;	/* cnv output pixel depth - 8bpc or 10bpc */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	enum dwb_out_format	fc_out_format;	/* dwb output pixel format - 2101010 or 16161616 and ARGB or RGBA */
 	enum dwb_out_denorm	out_denorm_mode;/* dwb output denormalization mode */
 	unsigned int		out_max_pix_val;/* pixel values greater than out_max_pix_val are clamped to out_max_pix_val */
 	unsigned int		out_min_pix_val;/* pixel values less than out_min_pix_val are clamped to out_min_pix_val */
-#endif
 };
 
 struct dc_dwb_params {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	unsigned int			dwbscl_black_color; /* must be in FP1.5.10 */
 	unsigned int			hdr_mult;	/* must be in FP1.6.12 */
 	struct cm_grph_csc_adjustment	csc_params;
 	struct dwb_stereo_params	stereo_params;
-#endif
 	struct dc_dwb_cnv_params	cnv_params;	/* CNV source size and cropping window parameters */
 	unsigned int			dest_width;	/* Destination width */
 	unsigned int			dest_height;	/* Destination height */
@@ -904,8 +899,6 @@ struct dc_golden_table {
 	uint32_t dc_gpio_aux_ctrl_5_val;
 };
 
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 enum dc_gpu_mem_alloc_type {
 	DC_MEM_ALLOC_TYPE_GART,
 	DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
@@ -913,7 +906,6 @@ enum dc_gpu_mem_alloc_type {
 	DC_MEM_ALLOC_TYPE_AGP
 };
 
-#endif
 enum dc_psr_version {
 	DC_PSR_VERSION_1			= 0,
 	DC_PSR_VERSION_UNSUPPORTED		= 0xFFFFFFFF,
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
index 829cd9a93ba9..943e10facadc 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
@@ -82,7 +82,6 @@
 	SR(DC_ABM1_ACE_THRES_12), \
 	NBIO_SR(BIOS_SCRATCH_2)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define ABM_DCN301_REG_LIST(id)\
 	ABM_COMMON_REG_LIST_DCE_BASE(), \
 	SRI(DC_ABM1_HG_SAMPLE_RATE, ABM, id), \
@@ -96,9 +95,7 @@
 	SRI(DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, ABM, id), \
 	SRI(DC_ABM1_HGLS_REG_READ_PROGRESS, ABM, id), \
 	NBIO_SR(BIOS_SCRATCH_2)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define ABM_DCN30_REG_LIST(id)\
 	ABM_COMMON_REG_LIST_DCE_BASE(), \
 	SRI(DC_ABM1_HG_SAMPLE_RATE, ABM, id), \
@@ -114,7 +111,6 @@
 	SRI(DC_ABM1_ACE_OFFSET_SLOPE_0, ABM, id), \
 	SRI(DC_ABM1_ACE_THRES_12, ABM, id), \
 	NBIO_SR(BIOS_SCRATCH_2)
-#endif
 
 #define ABM_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
@@ -189,9 +185,7 @@
 
 #define ABM_MASK_SH_LIST_DCN20(mask_sh) ABM_MASK_SH_LIST_DCE110(mask_sh)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0) || defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define ABM_MASK_SH_LIST_DCN301(mask_sh) ABM_MASK_SH_LIST_DCN10(mask_sh)
-#endif
 
 #define ABM_REG_FIELD_LIST(type) \
 	type ABM1_HG_NUM_OF_BINS_SEL; \
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 512b26b3e3fd..da72a016db7f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -1004,7 +1004,7 @@ static bool get_pixel_clk_frequency_100hz(
 	return false;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 /* this table is use to find *1.001 and /1.001 pixel rates from non-precise pixel rate */
 const struct pixel_rate_range_table_entry video_optimized_pixel_rates[] = {
 	// /1.001 rates
@@ -1073,7 +1073,7 @@ static const struct clock_source_funcs dcn20_clk_src_funcs = {
 	.get_pixel_clk_frequency_100hz = get_pixel_clk_frequency_100hz
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 static bool dcn3_program_pix_clk(
 		struct clock_source *clock_source,
 		struct pixel_clk_params *pix_clk_params,
@@ -1537,7 +1537,7 @@ bool dcn20_clk_src_construct(
 	return ret;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 bool dcn3_clk_src_construct(
 	struct dce110_clk_src *clk_src,
 	struct dc_context *ctx,
@@ -1555,7 +1555,7 @@ bool dcn3_clk_src_construct(
 }
 #endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 bool dcn301_clk_src_construct(
 	struct dce110_clk_src *clk_src,
 	struct dc_context *ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
index 09d25775d71f..7fe5a07e2233 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -91,7 +91,7 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 2),\
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #define CS_COMMON_REG_LIST_DCN3_0(index, pllid) \
 		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
 		SRII(PHASE, DP_DTO, 0),\
@@ -106,9 +106,7 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 1),\
 		SRII(PIXEL_RATE_CNTL, OTG, 2),\
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define CS_COMMON_REG_LIST_DCN3_01(index, pllid) \
 		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
 		SRII(PHASE, DP_DTO, 0),\
@@ -125,7 +123,7 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
 #endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #define CS_COMMON_REG_LIST_DCN3_02(index, pllid) \
 		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
 		SRII(PHASE, DP_DTO, 0),\
@@ -258,7 +256,7 @@ bool dcn20_clk_src_construct(
 	const struct dce110_clk_src_shift *cs_shift,
 	const struct dce110_clk_src_mask *cs_mask);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 bool dcn3_clk_src_construct(
 	struct dce110_clk_src *clk_src,
 	struct dc_context *ctx,
@@ -267,9 +265,7 @@ bool dcn3_clk_src_construct(
 	const struct dce110_clk_src_regs *regs,
 	const struct dce110_clk_src_shift *cs_shift,
 	const struct dce110_clk_src_mask *cs_mask);
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 bool dcn301_clk_src_construct(
 	struct dce110_clk_src *clk_src,
 	struct dc_context *ctx,
@@ -289,7 +285,7 @@ struct pixel_rate_range_table_entry {
 	unsigned short div_factor;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 extern const struct pixel_rate_range_table_entry video_optimized_pixel_rates[];
 const struct pixel_rate_range_table_entry *look_up_in_video_optimized_rate_tlb(
 		unsigned int pixel_rate_khz);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index b77e22bf6aec..c83e677ad86b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -78,7 +78,6 @@
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 5)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define HWSEQ_PIXEL_RATE_REG_LIST_3(blk) \
 	SRII(PIXEL_RATE_CNTL, blk, 0), \
 	SRII(PIXEL_RATE_CNTL, blk, 1),\
@@ -94,7 +93,6 @@
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 3), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 5)
-#endif
 
 #define HWSEQ_DCE11_REG_LIST_BASE() \
 	SR(DC_MEM_GLOBAL_PWR_REQ_CNTL), \
@@ -339,7 +337,6 @@
 	SR(D6VGA_CONTROL), \
 	SR(DC_IP_REQUEST_CNTL)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define HWSEQ_DCN30_REG_LIST()\
 	HWSEQ_DCN2_REG_LIST(),\
 	HWSEQ_DCN_REG_LIST(), \
@@ -360,9 +357,7 @@
 	SR(MPC_CRC_RESULT_AR), \
 	SR(AZALIA_AUDIO_DTO), \
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define HWSEQ_DCN301_REG_LIST()\
 	SR(REFCLK_CNTL), \
 	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
@@ -424,9 +419,7 @@
 	SR(DC_IP_REQUEST_CNTL), \
 	SR(AZALIA_AUDIO_DTO), \
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 #define HWSEQ_DCN302_REG_LIST()\
 	HWSEQ_DCN_REG_LIST(), \
 	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 0), \
@@ -487,10 +480,6 @@
 	SR(AZALIA_AUDIO_DTO), \
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
 
-#endif
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
-
 #define HWSEQ_PIXEL_RATE_REG_LIST_302(blk) \
 	SRII(PIXEL_RATE_CNTL, blk, 0), \
 	SRII(PIXEL_RATE_CNTL, blk, 1),\
@@ -504,7 +493,6 @@
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 2),\
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 3), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4)
-#endif
 
 struct dce_hwseq_registers {
 	uint32_t DCFE_CLOCK_CONTROL[6];
@@ -842,13 +830,10 @@ struct dce_hwseq_registers {
 	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN18_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define HWSEQ_DCN30_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN2_MASK_SH_LIST(mask_sh), \
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define HWSEQ_DCN301_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
 	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
@@ -891,9 +876,7 @@ struct dce_hwseq_registers {
 	HWS_SF(, PANEL_PWRSEQ0_CNTL, PANEL_DIGON_OVRD, mask_sh),\
 	HWS_SF(, PANEL_PWRSEQ0_STATE, PANEL_PWRSEQ_TARGET_STATE_R, mask_sh),\
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 #define HWSEQ_DCN302_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
 	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
@@ -945,8 +928,6 @@ struct dce_hwseq_registers {
 	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
 
-#endif
-
 #define HWSEQ_REG_FIELD_LIST(type) \
 	type DCFE_CLOCK_ENABLE; \
 	type DCFEV_CLOCK_ENABLE; \
@@ -1061,39 +1042,27 @@ struct dce_hwseq_registers {
 	type D4VGA_MODE_ENABLE; \
 	type AZALIA_AUDIO_DTO_MODULE;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define HWSEQ_DCN3_REG_FIELD_LIST(type) \
 	type HPO_HDMISTREAMCLK_GATE_DIS;
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define HWSEQ_DCN301_REG_FIELD_LIST(type) \
 	type PANEL_BLON;\
 	type PANEL_DIGON;\
 	type PANEL_DIGON_OVRD;\
 	type PANEL_PWRSEQ_TARGET_STATE_R;
-#endif
 
 struct dce_hwseq_shift {
 	HWSEQ_REG_FIELD_LIST(uint8_t)
 	HWSEQ_DCN_REG_FIELD_LIST(uint8_t)
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	HWSEQ_DCN3_REG_FIELD_LIST(uint8_t)
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	HWSEQ_DCN301_REG_FIELD_LIST(uint8_t)
-#endif
 };
 
 struct dce_hwseq_mask {
 	HWSEQ_REG_FIELD_LIST(uint32_t)
 	HWSEQ_DCN_REG_FIELD_LIST(uint32_t)
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	HWSEQ_DCN3_REG_FIELD_LIST(uint32_t)
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	HWSEQ_DCN301_REG_FIELD_LIST(uint32_t)
-#endif
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
index db5615a51fea..41679ad531c5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
@@ -326,7 +326,6 @@ void hubp1_program_pixel_format(
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 119);
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
 		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 116,
@@ -337,7 +336,6 @@ void hubp1_program_pixel_format(
 				SURFACE_PIXEL_FORMAT, 116,
 				ALPHA_PLANE_EN, 1);
 		break;
-#endif
 	default:
 		BREAK_TO_DEBUGGER();
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
index 1ac734d0d5e8..d4caad670855 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
@@ -154,12 +154,10 @@ struct dcn10_link_enc_registers {
 	uint32_t RAWLANE2_DIG_PCS_XF_RX_OVRD_IN_3;
 	uint32_t RAWLANE3_DIG_PCS_XF_RX_OVRD_IN_2;
 	uint32_t RAWLANE3_DIG_PCS_XF_RX_OVRD_IN_3;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint32_t TMDS_DCBALANCER_CONTROL;
 	uint32_t PHYA_LINK_CNTL2;
 	uint32_t PHYB_LINK_CNTL2;
 	uint32_t PHYC_LINK_CNTL2;
-#endif
 };
 
 #define LE_SF(reg_name, field_name, post_fix)\
@@ -449,8 +447,6 @@ struct dcn10_link_enc_registers {
 	type AUX_RX_TIMEOUT_LEN;\
 	type AUX_RX_TIMEOUT_LEN_MUL
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-
 #define DCN30_LINK_ENCODER_REG_FIELD_LIST(type) \
 	type TMDS_SYNC_DCBAL_EN;\
 	type PHY_HPO_DIG_SRC_SEL;\
@@ -459,22 +455,17 @@ struct dcn10_link_enc_registers {
 	type DPCS_TX_DATA_SWAP_10_BIT;\
 	type DPCS_TX_DATA_ORDER_INVERT_18_BIT;\
 	type RDPCS_TX_CLK_EN
-#endif
 
 struct dcn10_link_enc_shift {
 	DCN_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
 	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
-#endif
 };
 
 struct dcn10_link_enc_mask {
 	DCN_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
 	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
-#endif
 };
 
 struct dcn10_link_encoder {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index 800be2693fac..a125d3f05c81 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -299,16 +299,13 @@ void optc1_program_timing(
 		REG_UPDATE(OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, data_fmt);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	if (optc1->tg_mask->OTG_H_TIMING_DIV_MODE != 0) {
 		if (optc1->opp_count == 4)
 			h_div = H_TIMING_DIV_BY4;
 
 		REG_UPDATE(OTG_H_TIMING_CNTL,
 		OTG_H_TIMING_DIV_MODE, h_div);
-	} else
-#endif
-	{
+	} else {
 		REG_UPDATE(OTG_H_TIMING_CNTL,
 		OTG_H_TIMING_DIV_BY2, h_div);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
index b38475285835..344eb487219e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
@@ -171,7 +171,6 @@ struct dcn_optc_registers {
 	uint32_t OPTC_DATA_FORMAT_CONTROL;
 	uint32_t OPTC_BYTES_PER_PIXEL;
 	uint32_t OPTC_WIDTH_CONTROL;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint32_t OTG_BLANK_DATA_COLOR;
 	uint32_t OTG_BLANK_DATA_COLOR_EXT;
 	uint32_t OTG_DRR_TRIGGER_WINDOW;
@@ -179,7 +178,6 @@ struct dcn_optc_registers {
 	uint32_t OTG_M_CONST_DTO1;
 	uint32_t OTG_DRR_V_TOTAL_CHANGE;
 	uint32_t OTG_GLOBAL_CONTROL4;
-#endif
 };
 
 #define TG_COMMON_MASK_SH_LIST_DCN(mask_sh)\
@@ -474,8 +472,6 @@ struct dcn_optc_registers {
 	type MANUAL_FLOW_CONTROL;\
 	type MANUAL_FLOW_CONTROL_SEL;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-
 #define TG_REG_FIELD_LIST(type) \
 	TG_REG_FIELD_LIST_DCN1_0(type)\
 	type OTG_V_SYNC_MODE;\
@@ -517,33 +513,6 @@ struct dcn_optc_registers {
 	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
 	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
 	type OTG_CRC_DATA_FORMAT;
-#else
-
-#define TG_REG_FIELD_LIST(type) \
-	TG_REG_FIELD_LIST_DCN1_0(type)\
-	type MASTER_UPDATE_LOCK_DB_X;\
-	type MASTER_UPDATE_LOCK_DB_Y;\
-	type MASTER_UPDATE_LOCK_DB_EN;\
-	type GLOBAL_UPDATE_LOCK_EN;\
-	type DIG_UPDATE_LOCATION;\
-	type OTG_DSC_START_POSITION_X;\
-	type OTG_DSC_START_POSITION_LINE_NUM;\
-	type OPTC_NUM_OF_INPUT_SEGMENT;\
-	type OPTC_SEG0_SRC_SEL;\
-	type OPTC_SEG1_SRC_SEL;\
-	type OPTC_MEM_SEL;\
-	type OPTC_DATA_FORMAT;\
-	type OPTC_DSC_MODE;\
-	type OPTC_DSC_BYTES_PER_PIXEL;\
-	type OPTC_DSC_SLICE_WIDTH;\
-	type OPTC_SEGMENT_WIDTH;\
-	type OPTC_DWB0_SOURCE_SELECT;\
-	type OPTC_DWB1_SOURCE_SELECT;\
-	type OTG_CRC_DSC_MODE;\
-	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
-	type OTG_CRC_DATA_STREAM_SPLIT_MODE;\
-	type OTG_CRC_DATA_FORMAT;
-#endif
 
 
 struct dcn_optc_shift {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
index b99d2527cf03..9e38c37c1d73 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
@@ -169,14 +169,12 @@ struct dcn10_stream_enc_registers {
 	uint32_t DP_SEC_METADATA_TRANSMISSION;
 	uint32_t HDMI_METADATA_PACKET_CONTROL;
 	uint32_t DP_SEC_FRAMING4;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint32_t DP_GSP11_CNTL;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL6;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL7;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL8;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL9;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL10;
-#endif
 	uint32_t DIG_CLOCK_PATTERN;
 };
 
@@ -505,7 +503,6 @@ struct dcn10_stream_enc_registers {
 	type DP_PIXEL_COMBINE;\
 	type DP_SST_SDP_SPLITTING
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define SE_REG_FIELD_LIST_DCN3_0(type) \
 	type HDMI_GENERIC8_CONT;\
 	type HDMI_GENERIC8_SEND;\
@@ -531,22 +528,17 @@ struct dcn10_stream_enc_registers {
 	type DP_SEC_GSP11_PPS;\
 	type DP_SEC_GSP11_ENABLE;\
 	type DP_SEC_GSP11_LINE_NUM
-#endif
 
 struct dcn10_stream_encoder_shift {
 	SE_REG_FIELD_LIST_DCN1_0(uint8_t);
 	SE_REG_FIELD_LIST_DCN2_0(uint8_t);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	SE_REG_FIELD_LIST_DCN3_0(uint8_t);
-#endif
 };
 
 struct dcn10_stream_encoder_mask {
 	SE_REG_FIELD_LIST_DCN1_0(uint32_t);
 	SE_REG_FIELD_LIST_DCN2_0(uint32_t);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	SE_REG_FIELD_LIST_DCN3_0(uint32_t);
-#endif
 };
 
 struct dcn10_stream_encoder {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
index 06daf35bb587..d407f33308b9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
@@ -76,7 +76,6 @@
 	type REFCLK_CLOCK_EN;\
 	type REFCLK_SRC_SEL;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define DCCG3_REG_FIELD_LIST(type) \
 	type PHYASYMCLK_FORCE_EN;\
 	type PHYASYMCLK_FORCE_SRC_SEL;\
@@ -84,32 +83,25 @@
 	type PHYBSYMCLK_FORCE_SRC_SEL;\
 	type PHYCSYMCLK_FORCE_EN;\
 	type PHYCSYMCLK_FORCE_SRC_SEL;
-#endif
 
 struct dccg_shift {
 	DCCG_REG_FIELD_LIST(uint8_t)
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCCG3_REG_FIELD_LIST(uint8_t)
-#endif
 };
 
 struct dccg_mask {
 	DCCG_REG_FIELD_LIST(uint32_t)
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCCG3_REG_FIELD_LIST(uint32_t)
-#endif
 };
 
 struct dccg_registers {
 	uint32_t DPPCLK_DTO_CTRL;
 	uint32_t DPPCLK_DTO_PARAM[6];
 	uint32_t REFCLK_CNTL;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint32_t HDMICHARCLK_CLOCK_CNTL[6];
 	uint32_t PHYASYMCLK_CLOCK_CNTL;
 	uint32_t PHYBSYMCLK_CLOCK_CNTL;
 	uint32_t PHYCSYMCLK_CLOCK_CNTL;
-#endif
 };
 
 struct dcn_dccg {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
index 69d49551ab5d..6d03d98fca22 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
@@ -153,10 +153,8 @@ bool hubbub2_dcc_support_pixel_format(
 	case SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FIX:
 	case SURFACE_PIXEL_FORMAT_GRPH_RGB111110_FLOAT:
 	case SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FLOAT:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
-#endif
 		*bytes_per_element = 4;
 		return true;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
@@ -343,11 +341,9 @@ static enum dcn_hubbub_page_table_block_size page_table_block_size_to_hw(unsigne
 	case 65536:
 		block_size = DCN_PAGE_TABLE_BLOCK_SIZE_64KB;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case 32768:
 		block_size = DCN_PAGE_TABLE_BLOCK_SIZE_32KB;
 		break;
-#endif
 	default:
 		ASSERT(false);
 		block_size = page_table_block_size;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 368818d2dfc6..b7e44e53a342 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -336,10 +336,8 @@ void hubp2_program_size(
 	 */
 	use_pitch_c = format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN
 		&& format < SURFACE_PIXEL_FORMAT_SUBSAMPLE_END;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	use_pitch_c = use_pitch_c
 		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
-#endif
 	if (use_pitch_c) {
 		ASSERT(plane_size->chroma_pitch != 0);
 		/* Chroma pitch zero can cause system hang! */
@@ -364,10 +362,8 @@ void hubp2_program_size(
 			PITCH, pitch, META_PITCH, meta_pitch);
 
 	use_pitch_c = format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	use_pitch_c = use_pitch_c
 		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
-#endif
 	if (use_pitch_c)
 		REG_UPDATE_2(DCSURF_SURFACE_PITCH_C,
 			PITCH_C, pitch_c, META_PITCH_C, meta_pitch_c);
@@ -513,7 +509,6 @@ void hubp2_program_pixel_format(
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 119);
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
 		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 116,
@@ -524,7 +519,6 @@ void hubp2_program_pixel_format(
 				SURFACE_PIXEL_FORMAT, 116,
 				ALPHA_PLANE_EN, 1);
 		break;
-#endif
 	default:
 		BREAK_TO_DEBUGGER();
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
index 4a2c93087459..f501c02c244b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
@@ -157,11 +157,9 @@
 	uint32_t VBLANK_PARAMETERS_5;\
 	uint32_t VBLANK_PARAMETERS_6
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define DCN30_HUBP_REG_COMMON_VARIABLE_LIST \
 	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
 	uint32_t DCN_DMDATA_VM_CNTL
-#endif
 
 #define DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type) \
 	DCN_HUBP_REG_FIELD_BASE_LIST(type); \
@@ -198,7 +196,6 @@
 	type REFCYC_PER_META_CHUNK_FLIP_C; \
 	type VM_GROUP_SIZE
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define DCN30_HUBP_REG_FIELD_VARIABLE_LIST(type) \
 	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
 	type PRIMARY_SURFACE_DCC_IND_BLK;\
@@ -218,32 +215,17 @@
 	type PACK_3TO2_ELEMENT_DISABLE; \
 	type ROW_TTU_MODE; \
 	type NUM_PKRS
-#endif
 
 struct dcn_hubp2_registers {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
-#else
-	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;
-#endif
 };
 
 struct dcn_hubp2_shift {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
-#else
-	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
-#endif
-
 };
 
 struct dcn_hubp2_mask {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
-#else
-	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
-#endif
-
 };
 
 struct dcn20_hubp {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 04b939f3cdcc..c1dbe5eb75e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -611,7 +611,6 @@ void dcn20_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
 					pipe_ctx->pipe_idx);
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
 		int opp_cnt)
 {
@@ -634,7 +633,6 @@ static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
 
 	return flow_ctrl_cnt;
 }
-#endif
 
 enum dc_status dcn20_enable_stream_timing(
 		struct pipe_ctx *pipe_ctx,
@@ -648,16 +646,12 @@ enum dc_status dcn20_enable_stream_timing(
 	struct pipe_ctx *odm_pipe;
 	int opp_cnt = 1;
 	int opp_inst[MAX_PIPES] = { pipe_ctx->stream_res.opp->inst };
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	bool interlace = stream->timing.flags.INTERLACE;
 	int i;
-
 	struct mpc_dwb_flow_control flow_control;
 	struct mpc *mpc = dc->res_pool->mpc;
 	bool rate_control_2x_pclk = (interlace || optc2_is_two_pixels_per_containter(&stream->timing));
 
-#endif
 	/* by upper caller loop, pipe0 is parent pipe and be called first.
 	 * back end is set up by for pipe0. Other children pipe share back end
 	 * with pipe 0. No program is needed.
@@ -704,7 +698,6 @@ enum dc_status dcn20_enable_stream_timing(
 			pipe_ctx->stream->signal,
 			true);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	rate_control_2x_pclk = rate_control_2x_pclk || opp_cnt > 1;
 	flow_control.flow_ctrl_mode = 0;
 	flow_control.flow_ctrl_cnt0 = 0x80;
@@ -718,7 +711,7 @@ enum dc_status dcn20_enable_stream_timing(
 					&flow_control);
 		}
 	}
-#endif
+
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		odm_pipe->stream_res.opp->funcs->opp_pipe_clock_control(
 				odm_pipe->stream_res.opp,
@@ -1478,7 +1471,6 @@ static void dcn20_update_dchubp_dpp(
 	if (pipe_ctx->update_flags.bits.enable || pipe_ctx->update_flags.bits.opp_changed
 			|| pipe_ctx->stream->update_flags.bits.gamut_remap
 			|| pipe_ctx->stream->update_flags.bits.out_csc) {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
 
 		if (mpc->funcs->set_gamut_remap) {
@@ -1509,7 +1501,6 @@ static void dcn20_update_dchubp_dpp(
 			}
 			mpc->funcs->set_gamut_remap(mpc, mpcc_id, &adjust);
 		} else
-#endif
 			/* dpp/cm gamut remap*/
 			dc->hwss.program_gamut_remap(pipe_ctx);
 
@@ -2284,11 +2275,9 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	blnd_cfg.bottom_inside_gain = 0x1f000;
 	blnd_cfg.bottom_outside_gain = 0x1f000;
 	blnd_cfg.pre_multiplied_alpha = per_pixel_alpha;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	if (pipe_ctx->plane_state->format
 			== SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
 		blnd_cfg.pre_multiplied_alpha = false;
-#endif
 
 	/*
 	 * TODO: remove hack
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
index 864acd695cbb..b2b266953d18 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.h
@@ -276,10 +276,8 @@ struct mpll_cfg {
 	bool dp_tx1_vergdrv_byp;
 	bool dp_tx2_vergdrv_byp;
 	bool dp_tx3_vergdrv_byp;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	uint32_t tx_peaking_lvl;
 	uint32_t ctr_reqs_pll;
-#endif
 
 
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 1b3b6ba20d18..a9ed28c5ec3b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2033,10 +2033,8 @@ int dcn20_populate_dml_pipes_from_context(
 		unsigned int v_total;
 		unsigned int front_porch;
 		int output_bpc;
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		struct audio_check aud_check = {0};
-#endif
+
 		if (!res_ctx->pipe_ctx[i].stream)
 			continue;
 
@@ -2091,11 +2089,9 @@ int dcn20_populate_dml_pipes_from_context(
 		case 1:
 			pipes[pipe_cnt].pipe.dest.odm_combine = dm_odm_combine_mode_2to1;
 			break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		case 3:
 			pipes[pipe_cnt].pipe.dest.odm_combine = dm_odm_combine_mode_4to1;
 			break;
-#endif
 		default:
 			pipes[pipe_cnt].pipe.dest.odm_combine = dm_odm_combine_mode_disabled;
 		}
@@ -2201,11 +2197,9 @@ int dcn20_populate_dml_pipes_from_context(
 
 		/* todo: default max for now, until there is logic reflecting this in dc*/
 		pipes[pipe_cnt].dout.output_bpc = 12;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		/*fill up the audio sample rate (unit in kHz)*/
 		get_audio_check(&res_ctx->pipe_ctx[i].stream->audio_info, &aud_check);
 		pipes[pipe_cnt].dout.max_audio_sample_rate = aud_check.max_audiosample_rate / 1000;
-#endif
 		/*
 		 * For graphic plane, cursor number is 1, nv12 is 0
 		 * bw calculations due to cursor on/off
@@ -2252,13 +2246,10 @@ int dcn20_populate_dml_pipes_from_context(
 			if (pipes[pipe_cnt].pipe.dest.odm_combine == dm_odm_combine_mode_2to1) {
 				pipes[pipe_cnt].pipe.src.viewport_width /= 2;
 				pipes[pipe_cnt].pipe.dest.recout_width /= 2;
-			}
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-			else if (pipes[pipe_cnt].pipe.dest.odm_combine == dm_odm_combine_mode_4to1) {
+			} else if (pipes[pipe_cnt].pipe.dest.odm_combine == dm_odm_combine_mode_4to1) {
 				pipes[pipe_cnt].pipe.src.viewport_width /= 4;
 				pipes[pipe_cnt].pipe.dest.recout_width /= 4;
 			}
-#endif
 		} else {
 			struct dc_plane_state *pln = res_ctx->pipe_ctx[i].plane_state;
 			struct scaler_data *scl = &res_ctx->pipe_ctx[i].plane_res.scl_data;
@@ -2287,12 +2278,8 @@ int dcn20_populate_dml_pipes_from_context(
 			pipes[pipe_cnt].pipe.src.surface_height_y = pln->plane_size.surface_size.height;
 			pipes[pipe_cnt].pipe.src.surface_width_c = pln->plane_size.chroma_size.width;
 			pipes[pipe_cnt].pipe.src.surface_height_c = pln->plane_size.chroma_size.height;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 			if (pln->format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA
 					|| pln->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
-#else
-			if (pln->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
-#endif
 				pipes[pipe_cnt].pipe.src.data_pitch = pln->plane_size.surface_pitch;
 				pipes[pipe_cnt].pipe.src.data_pitch_c = pln->plane_size.chroma_pitch;
 				pipes[pipe_cnt].pipe.src.meta_pitch = pln->dcc.meta_pitch;
@@ -2308,10 +2295,8 @@ int dcn20_populate_dml_pipes_from_context(
 			pipes[pipe_cnt].pipe.dest.full_recout_width = scl->recout.width;
 			if (pipes[pipe_cnt].pipe.dest.odm_combine == dm_odm_combine_mode_2to1)
 				pipes[pipe_cnt].pipe.dest.full_recout_width *= 2;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 			else if (pipes[pipe_cnt].pipe.dest.odm_combine == dm_odm_combine_mode_4to1)
 				pipes[pipe_cnt].pipe.dest.full_recout_width *= 4;
-#endif
 			else {
 				struct pipe_ctx *split_pipe = res_ctx->pipe_ctx[i].bottom_pipe;
 
@@ -2368,11 +2353,9 @@ int dcn20_populate_dml_pipes_from_context(
 			case SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS:
 				pipes[pipe_cnt].pipe.src.source_format = dm_444_8;
 				break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 			case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
 				pipes[pipe_cnt].pipe.src.source_format = dm_rgbe_alpha;
 				break;
-#endif
 			default:
 				pipes[pipe_cnt].pipe.src.source_format = dm_444_32;
 				break;
@@ -2749,7 +2732,6 @@ int dcn20_validate_apply_pipe_split_flags(
 			split[i] = 2;
 			v->ODMCombineEnablePerState[vlevel][pipe_plane] = dm_odm_combine_mode_2to1;
 		}
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		if (dc->debug.force_odm_combine_4to1 & (1 << pipe->stream_res.tg->inst)) {
 			split[i] = 4;
 			v->ODMCombineEnablePerState[vlevel][pipe_plane] = dm_odm_combine_mode_4to1;
@@ -2759,7 +2741,6 @@ int dcn20_validate_apply_pipe_split_flags(
 				pipe->stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
 			split[i] = 4;
 		}
-#endif
 		v->ODMCombineEnabled[pipe_plane] =
 			v->ODMCombineEnablePerState[vlevel][pipe_plane];
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 0eb881f2e0d6..29231528f052 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -1358,16 +1358,9 @@ static struct dpp_funcs dcn30_dpp_funcs = {
 	.dpp_program_degamma_pwl	= NULL,
 	.dpp_program_cm_dealpha = dpp3_program_cm_dealpha,
 	.dpp_program_cm_bias = dpp3_program_cm_bias,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	.dpp_program_blnd_lut = dpp3_program_blnd_lut,
 	.dpp_program_shaper_lut = dpp3_program_shaper,
 	.dpp_program_3dlut = dpp3_program_3dlut,
-#else
-	.dpp_program_blnd_lut		= NULL,
-	.dpp_program_shaper_lut		= NULL,
-	.dpp_program_3dlut		= NULL,
-#endif
-
 	.dpp_program_bias_and_scale	= NULL,
 	.dpp_cnv_set_alpha_keyer	= dpp2_cnv_set_alpha_keyer,
 	.set_cursor_attributes		= dpp3_set_cursor_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
index 67f5776b5f3a..5fa150f34c60 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
@@ -251,10 +251,8 @@ bool hubp3_construct(
 		const struct dcn_hubp2_shift *hubp_shift,
 		const struct dcn_hubp2_mask *hubp_mask);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
 	struct vm_system_aperture_param *apt);
-#endif
 
 bool hubp3_program_surface_flip_and_addr(
 	struct hubp *hubp,
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index b2cc2bf95712..b2cd8491c707 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -35,7 +35,6 @@
 
 struct dp_mst_stream_allocation_table;
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 /*
  * Allocate memory accessible by the GPU
  *
@@ -57,7 +56,6 @@ void dm_helpers_free_gpu_mem(
 		enum dc_gpu_mem_alloc_type type,
 		void *pvMem);
 
-#endif
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_context *ctx,
 	const struct dc_edid *edid,
diff --git a/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h b/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
index e05273d4739d..fb41140e8381 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
@@ -278,7 +278,7 @@ struct pp_smu_funcs_rn {
 	enum pp_smu_status (*get_dpm_clock_table) (struct pp_smu *pp,
 			struct dpm_clocks *clock_table);
 };
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+
 struct pp_smu_funcs_vgh {
 	struct pp_smu pp_smu;
 
@@ -300,16 +300,14 @@ struct pp_smu_funcs_vgh {
 
 	enum pp_smu_status (*notify_smu_timeout) (struct pp_smu *pp);
 };
-#endif
+
 struct pp_smu_funcs {
 	struct pp_smu ctx;
 	union {
 		struct pp_smu_funcs_rv rv_funcs;
 		struct pp_smu_funcs_nv nv_funcs;
 		struct pp_smu_funcs_rn rn_funcs;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 		struct pp_smu_funcs_vgh vgh_funcs;
-#endif
 	};
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index dbc7e2abe379..879a930358a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -71,8 +71,6 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflag
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_rcflags)
-endif
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
 endif
@@ -87,9 +85,6 @@ ifdef CONFIG_DRM_AMD_DC_DCN
 DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_20.o
 DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
-endif
-
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
 endif
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 9e0ae18e71fa..b27df0b409a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -23,7 +23,7 @@
  *
  */
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+#ifdef CONFIG_DRM_AMD_DC_DCN
 #include "dc.h"
 #include "dc_link.h"
 #include "../display_mode_lib.h"
@@ -6870,4 +6870,4 @@ static void UseMinimumDCFCLK(
 	}
 }
 
-#endif /* CONFIG_DRM_AMD_DC_DCN3_0 */
+#endif /* CONFIG_DRM_AMD_DC_DCN */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 416bf6fb67bd..5b5916b5bc71 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -23,7 +23,7 @@
  *
  */
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+#ifdef CONFIG_DRM_AMD_DC_DCN
 
 #include "../display_mode_lib.h"
 #include "../display_mode_vba.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
index 950ba04d7503..098d6433f7f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
@@ -31,11 +31,9 @@
 #include "dcn20/display_rq_dlg_calc_20v2.h"
 #include "dcn21/display_mode_vba_21.h"
 #include "dcn21/display_rq_dlg_calc_21.h"
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 #include "dcn30/display_mode_vba_30.h"
 #include "dcn30/display_rq_dlg_calc_30.h"
 #include "dml_logger.h"
-#endif
 
 const struct dml_funcs dml20_funcs = {
 	.validate = dml20_ModeSupportAndSystemConfigurationFull,
@@ -58,14 +56,13 @@ const struct dml_funcs dml21_funcs = {
         .rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 const struct dml_funcs dml30_funcs = {
 	.validate = dml30_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml30_recalculate,
 	.rq_dlg_get_dlg_reg = dml30_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml30_rq_dlg_get_rq_reg
 };
-#endif
+
 void dml_init_instance(struct display_mode_lib *lib,
 		const struct _vcs_dpi_soc_bounding_box_st *soc_bb,
 		const struct _vcs_dpi_ip_params_st *ip_params,
@@ -84,11 +81,9 @@ void dml_init_instance(struct display_mode_lib *lib,
         case DML_PROJECT_DCN21:
                 lib->funcs = dml21_funcs;
                 break;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DML_PROJECT_DCN30:
 		lib->funcs = dml30_funcs;
 		break;
-#endif
 
 	default:
 		break;
@@ -123,7 +118,7 @@ const char *dml_get_status_message(enum dm_validation_status status)
 	default:                                  return "Unknown Status";
 	}
 }
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
 void dml_log_pipe_params(
 		struct display_mode_lib *mode_lib,
 		display_e2e_pipe_params_st *pipes,
@@ -285,4 +280,3 @@ void dml_log_mode_support_params(struct display_mode_lib *mode_lib)
 		dml_print("DML SUPPORT:     ImmediateFlipSupportedForState      : [%d, %d]\n", mode_lib->vba.ImmediateFlipSupportedForState[i][0], mode_lib->vba.ImmediateFlipSupportedForState[i][1]);
 	}
 }
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
index 6adee8a9ee56..6ae5df58a4fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
@@ -37,9 +37,7 @@ enum dml_project {
 	DML_PROJECT_NAVI10,
 	DML_PROJECT_NAVI10v2,
 	DML_PROJECT_DCN21,
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	DML_PROJECT_DCN30,
-#endif
 };
 
 struct display_mode_lib;
@@ -81,12 +79,10 @@ void dml_init_instance(struct display_mode_lib *lib,
 
 const char *dml_get_status_message(enum dm_validation_status status);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 void dml_log_pipe_params(
 		struct display_mode_lib *mode_lib,
 		display_e2e_pipe_params_st *pipes,
 		int pipe_cnt);
 
 void dml_log_mode_support_params(struct display_mode_lib *mode_lib);
-#endif  // CONFIG_DRM_AMD_DC_DCN3_0
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index 6ab74640c0da..162464261205 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -126,9 +126,7 @@ struct _vcs_dpi_soc_bounding_box_st {
 
 struct _vcs_dpi_ip_params_st {
 	bool use_min_dcfclk;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	bool clamp_min_dcfclk;
-#endif
 	bool gpuvm_enable;
 	bool hostvm_enable;
 	bool dsc422_native_support;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index b32093136089..62740d4e423d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -288,9 +288,7 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
 
 	// IP Parameters
 	mode_lib->vba.UseMinimumRequiredDCFCLK = ip->use_min_dcfclk;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	mode_lib->vba.ClampMinDCFCLK = ip->clamp_min_dcfclk;
-#endif
 	mode_lib->vba.MaxNumDPP = ip->max_num_dpp;
 	mode_lib->vba.MaxNumOTG = ip->max_num_otg;
 	mode_lib->vba.MaxNumHDMIFRLOutputs = ip->max_num_hdmi_frl_outputs;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 21e5111ea7a0..4d4ed1287673 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -919,9 +919,7 @@ struct vba_vars_st {
 	double BPP;
 	enum odm_combine_policy ODMCombinePolicy;
 	bool UseMinimumRequiredDCFCLK;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	bool ClampMinDCFCLK;
-#endif
 	bool AllowDramClockChangeOneDisplayVactive;
 	bool SynchronizeTimingsIfSingleRefreshRate;
 
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/Makefile b/drivers/gpu/drm/amd/display/dc/gpio/Makefile
index 74c0943ed644..c5ddade8b187 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/gpio/Makefile
@@ -47,7 +47,7 @@ endif
 ###############################################################################
 # all DCE8.x are derived from DCE8.0
 GPIO_DCE80 = hw_translate_dce80.o hw_factory_dce80.o
-	
+
 AMD_DAL_GPIO_DCE80 = $(addprefix $(AMDDALPATH)/dc/gpio/dce80/,$(GPIO_DCE80))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_GPIO_DCE80)
@@ -97,11 +97,10 @@ GPIO_DCN21 = hw_translate_dcn21.o hw_factory_dcn21.o
 AMD_DAL_GPIO_DCN21 = $(addprefix $(AMDDALPATH)/dc/gpio/dcn21/,$(GPIO_DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_GPIO_DCN21)
-endif
+
 ###############################################################################
 # DCN 3
 ###############################################################################
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 GPIO_DCN30 = hw_translate_dcn30.o hw_factory_dcn30.o
 
 AMD_DAL_GPIO_DCN30 = $(addprefix $(AMDDALPATH)/dc/gpio/dcn30/,$(GPIO_DCN30))
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
index 3be2c90b0c61..39bd560d2839 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
@@ -22,7 +22,7 @@
  * Authors: AMD
  *
  */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "dm_services.h"
 #include "include/gpio_types.h"
 #include "../hw_factory.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.h b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.h
index 7ad15f5aa95f..131e742b050a 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.h
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.h
@@ -22,7 +22,7 @@
  * Authors: AMD
  *
  */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #ifndef __DAL_HW_FACTORY_DCN30_H__
 #define __DAL_HW_FACTORY_DCN30_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.c
index c2f42e0248b3..0046219a1cc7 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.c
@@ -26,7 +26,7 @@
 /*
  * Pre-requisites: headers required by header of this unit
  */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "hw_translate_dcn30.h"
 
 #include "dm_services.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.h b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.h
index fe6c3f84aef9..ed55410b7a4e 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.h
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.h
@@ -22,7 +22,7 @@
  * Authors: AMD
  *
  */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 #ifndef __DAL_HW_TRANSLATE_DCN30_H__
 #define __DAL_HW_TRANSLATE_DCN30_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
index 90b6cc2f431b..da73bfb3cacd 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
@@ -52,8 +52,6 @@
 #include "dcn10/hw_factory_dcn10.h"
 #include "dcn20/hw_factory_dcn20.h"
 #include "dcn21/hw_factory_dcn21.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #include "dcn30/hw_factory_dcn30.h"
 #endif
 
@@ -104,22 +102,15 @@ bool dal_hw_factory_init(
 	case DCN_VERSION_1_01:
 		dal_hw_factory_dcn10_init(factory);
 		return true;
-
 	case DCN_VERSION_2_0:
 		dal_hw_factory_dcn20_init(factory);
 		return true;
 	case DCN_VERSION_2_1:
 		dal_hw_factory_dcn21_init(factory);
 		return true;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case DCN_VERSION_3_02:
-#endif
 		dal_hw_factory_dcn30_init(factory);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
index 6e62850a031e..da9499c09a11 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -50,8 +50,6 @@
 #include "dcn10/hw_translate_dcn10.h"
 #include "dcn20/hw_translate_dcn20.h"
 #include "dcn21/hw_translate_dcn21.h"
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #include "dcn30/hw_translate_dcn30.h"
 #endif
 
@@ -99,22 +97,15 @@ bool dal_hw_translate_init(
 	case DCN_VERSION_1_01:
 		dal_hw_translate_dcn10_init(translate);
 		return true;
-
 	case DCN_VERSION_2_0:
 		dal_hw_translate_dcn20_init(translate);
 		return true;
 	case DCN_VERSION_2_1:
 		dal_hw_translate_dcn21_init(translate);
 		return true;
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	case DCN_VERSION_3_02:
-#endif
 		dal_hw_translate_dcn30_init(translate);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 6e6bc66e49f0..2ce8c39ca6f5 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -151,7 +151,7 @@ struct resource_funcs {
 	void (*update_bw_bounding_box)(
 			struct dc *dc,
 			struct clk_bw_params *bw_params);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool (*acquire_post_bldn_3dlut)(
 			struct resource_context *res_ctx,
 			const struct resource_pool *pool,
@@ -209,7 +209,7 @@ struct resource_pool {
 	unsigned int underlay_pipe_index;
 	unsigned int stream_enc_count;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_3dlut *mpc_lut[MAX_PIPES];
 	struct dc_transfer_func *mpc_shaper[MAX_PIPES];
 #endif
@@ -241,7 +241,7 @@ struct resource_pool {
 	struct dmcu *dmcu;
 	struct dmub_psr *psr;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct abm *multiple_abms[MAX_PIPES];
 #endif
 
@@ -341,7 +341,7 @@ struct resource_context {
 	uint8_t clock_source_ref_count[MAX_CLOCK_SOURCES];
 	uint8_t dp_clock_source_ref_count;
 	bool is_dsc_acquired[MAX_PIPES];
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool is_mpc_3dlut_acquired[MAX_PIPES];
 #endif
 };
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 35d1b85713b2..3a29f379d0c8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -43,7 +43,6 @@
 #define DCN_MINIMUM_DISPCLK_Khz 100000
 #define DCN_MINIMUM_DPPCLK_Khz 100000
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 struct dcn3_clk_internal {
 	int dummy;
 	/*TODO:
@@ -61,9 +60,6 @@ struct dcn3_clk_internal {
 	*/
 };
 
-#endif
-
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 struct dcn301_clk_internal {
 	int dummy;
 	uint32_t CLK1_CLK0_CURRENT_CNT; //dispclk
@@ -79,8 +75,6 @@ struct dcn301_clk_internal {
 	uint32_t CLK1_CLK3_BYPASS_CNTL; //dcfclk bypass
 };
 
-#endif
-
 /* Will these bw structures be ASIC specific? */
 
 #define MAX_NUM_DPM_LVL		8
@@ -93,12 +87,10 @@ struct clk_limit_table_entry {
 	unsigned int fclk_mhz;
 	unsigned int memclk_mhz;
 	unsigned int socclk_mhz;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	unsigned int dtbclk_mhz;
 	unsigned int dispclk_mhz;
 	unsigned int dppclk_mhz;
 	unsigned int phyclk_mhz;
-#endif
 };
 
 /* This table is contiguous */
@@ -116,8 +108,6 @@ struct wm_range_table_entry {
 	bool valid;
 };
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
-
 struct nv_wm_range_entry {
 	bool valid;
 
@@ -135,7 +125,6 @@ struct nv_wm_range_entry {
 		double sr_enter_plus_exit_time_us;
 	} dml_input;
 };
-#endif
 
 struct clk_log_info {
 	bool enabled;
@@ -207,14 +196,10 @@ struct clk_bypass {
  * D occupied, C will be emptry.
  */
 struct wm_table {
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	union {
 		struct nv_wm_range_entry nv_entries[WM_SET_COUNT];
-#endif
-	struct wm_range_table_entry entries[WM_SET_COUNT];
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+		struct wm_range_table_entry entries[WM_SET_COUNT];
 	};
-#endif
 };
 
 struct dummy_pstate_entry {
@@ -265,7 +250,6 @@ struct clk_mgr_funcs {
 
 	/* Notify clk_mgr of a change in link rate, update phyclk frequency if necessary */
 	void (*notify_link_rate_change)(struct clk_mgr *clk_mgr, struct dc_link *link);
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	/*
 	 * Send message to PMFW to set hard min memclk frequency
 	 * When current_mode = false, set DPM0
@@ -278,10 +262,8 @@ struct clk_mgr_funcs {
 
 	/* Get current memclk states from PMFW, update relevant structures */
 	void (*get_memclk_states_from_smu)(struct clk_mgr *clk_mgr);
-#endif
 };
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 struct dpm_clocks;
 struct wartermarks;
 
@@ -290,24 +272,18 @@ struct smu_watermark_set {
 	union large_integer mc_address;
 };
 
-#endif
-
 struct clk_mgr {
 	struct dc_context *ctx;
 	struct clk_mgr_funcs *funcs;
 	struct dc_clocks clks;
 	bool psr_allow_active_cache;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	bool force_smu_not_present;
-#endif
 	int dprefclk_khz; // Used by program pixel clock in clock source funcs, need to figureout where this goes
 	int dentist_vco_freq_khz;
 	struct clk_state_registers_and_bypass boot_snapshot;
 	struct clk_bw_params *bw_params;
 	struct pp_smu_wm_range_sets ranges;
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 	struct smu_watermark_set smu_wm_set;
-#endif
 };
 
 /* forward declarations */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
index 949b61351ede..ffd37696b6b9 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
@@ -107,11 +107,9 @@ enum dentist_divider_range {
 	CLK_SRI(CLK3_CLK_PLL_REQ, CLK3, 0), \
 	CLK_SRI(CLK3_CLK2_DFS_CNTL, CLK3, 0)
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 // TODO:
 #define CLK_REG_LIST_DCN3()	  \
 	SR(DENTIST_DISPCLK_CNTL)
-#endif
 
 #define CLK_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
@@ -185,10 +183,9 @@ struct clk_mgr_registers {
 	uint32_t CLK3_CLK2_DFS_CNTL;
 	uint32_t CLK3_CLK_PLL_REQ;
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	uint32_t CLK0_CLK2_DFS_CNTL;
 	uint32_t CLK0_CLK_PLL_REQ;
-#endif
+
 	uint32_t MP1_SMN_C2PMSG_67;
 	uint32_t MP1_SMN_C2PMSG_83;
 	uint32_t MP1_SMN_C2PMSG_91;
@@ -285,12 +282,10 @@ struct clk_mgr_internal {
 	bool periodic_retraining_disabled;
 
 	unsigned int cur_phyclk_req_table[MAX_PIPES * 2];
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 
 	bool smu_present;
 	void *wm_range_table;
 	long long wm_range_table_addr;
-#endif
 };
 
 struct clk_mgr_internal_funcs {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index bf4d6190dd00..5425e92efcb8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -31,9 +31,7 @@ enum dcc_control {
 	dcc_control__256_256_xxx,
 	dcc_control__128_128_xxx,
 	dcc_control__256_64_64,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	dcc_control__256_128_128,
-#endif
 };
 
 enum segment_order {
@@ -65,9 +63,7 @@ enum dcn_hubbub_page_table_depth {
 enum dcn_hubbub_page_table_block_size {
 	DCN_PAGE_TABLE_BLOCK_SIZE_4KB = 0,
 	DCN_PAGE_TABLE_BLOCK_SIZE_64KB = 4,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN_PAGE_TABLE_BLOCK_SIZE_32KB = 3
-#endif
 };
 
 struct dcn_hubbub_phys_addr_config {
@@ -152,12 +148,10 @@ struct hubbub_funcs {
 	void (*apply_DEDCN21_147_wa)(struct hubbub *hubbub);
 
 	void (*force_wm_propagate_to_pipes)(struct hubbub *hubbub);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 
 	void (*force_pstate_change_control)(struct hubbub *hubbub, bool force, bool allow);
 
 	void (*init_watermarks)(struct hubbub *hubbub);
-#endif
 };
 
 struct hubbub {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 0491720c5fe9..6751186f6f90 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -121,13 +121,11 @@ struct CM_bias_params {
 };
 
 struct dpp_funcs {
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	bool (*dpp_program_gamcor_lut)(
 		struct dpp *dpp_base, const struct pwl_params *params);
 
 	void (*dpp_set_pre_degam)(struct dpp *dpp_base,
 			enum dc_transfer_func_predefined tr);
-#endif
 
 	void (*dpp_program_cm_dealpha)(struct dpp *dpp_base,
 		uint32_t enable, uint32_t additive_blending);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
index 3407e5da5534..ec28cb9c3a8e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h
@@ -72,14 +72,14 @@ enum wbscl_coef_filter_type_sel {
 };
 
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dwb_boundary_mode {
 	DWBSCL_BOUNDARY_MODE_EDGE  = 0,
 	DWBSCL_BOUNDARY_MODE_BLACK = 1
 };
 #endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dwb_output_csc_mode {
 	DWB_OUTPUT_CSC_DISABLE = 0,
 	DWB_OUTPUT_CSC_COEF_A = 1,
@@ -209,7 +209,7 @@ struct dwbc_funcs {
 		struct dwb_warmup_params *warmup_params);
 
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 	void (*dwb_program_output_csc)(
 		struct dwbc *dwbc,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index 0dbd5a55de33..315e3061c592 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -48,10 +48,8 @@ enum cursor_lines_per_chunk {
 enum hubp_ind_block_size {
 	hubp_ind_block_unconstrained = 0,
 	hubp_ind_block_64b,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	hubp_ind_block_128b,
 	hubp_ind_block_64b_no_128bcl,
-#endif
 };
 
 struct hubp {
@@ -187,11 +185,9 @@ struct hubp_funcs {
 			struct _vcs_dpi_display_rq_regs_st *dml_rq_regs,
 			struct _vcs_dpi_display_dlg_regs_st *dml_dlg_attr,
 			struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	void (*set_unbounded_requesting)(
 		struct hubp *hubp,
 		bool enable);
-#endif
 
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
index f62ccf242f56..a3a27c16aa2f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
@@ -150,14 +150,12 @@ enum ipp_degamma_mode {
 	IPP_DEGAMMA_MODE_USER_PWL
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 enum gamcor_mode {
 	GAMCOR_MODE_BYPASS,
 	GAMCOR_MODE_RESERVED_1,
 	GAMCOR_MODE_USER_PWL,
 	GAMCOR_MODE_RESERVED_3
 };
-#endif
 
 enum ipp_output_format {
 	IPP_OUTPUT_FORMAT_12_BIT_FIX,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
index aeab7fd782b8..15cb782f129b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h
@@ -43,9 +43,7 @@ struct mcif_arb_params {
 	unsigned int		arbitration_slice;
 	unsigned int		slice_lines;
 	unsigned int		max_scaled_time;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	unsigned int		dram_speed_change_duration;
-#endif
 };
 
 struct mcif_irq_params {
@@ -75,11 +73,9 @@ struct mcif_wb {
 
 struct mcif_wb_funcs {
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	void (*warmup_mcif)(
 		struct mcif_wb *mcif_wb,
 		struct mcif_warmup_params *params);
-#endif
 	void (*enable_mcif)(struct mcif_wb *mcif_wb);
 
 	void (*disable_mcif)(struct mcif_wb *mcif_wb);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index b2892eab5e02..879f502ae530 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -32,11 +32,7 @@
 #define MAX_MPCC 6
 #define MAX_OPP 6
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define MAX_DWB		2
-#else
-#define MAX_DWB		1
-#endif
 
 enum mpc_output_csc_mode {
 	MPC_OUTPUT_CSC_DISABLE = 0,
@@ -77,12 +73,11 @@ struct mpcc_blnd_cfg {
 	int bottom_outside_gain;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 struct mpc_grph_gamut_adjustment {
 	struct fixed31_32 temperature_matrix[CSC_TEMPERATURE_MATRIX_SIZE];
 	enum graphics_gamut_adjust_type gamut_adjust_type;
 };
-#endif
+
 struct mpcc_sm_cfg {
 	bool enable;
 	/* 0-single plane,2-row subsampling,4-column subsampling,6-checkboard subsampling */
@@ -106,13 +101,12 @@ struct mpc_denorm_clamp {
 	int clamp_min_b_cb;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 struct mpc_dwb_flow_control {
 	int flow_ctrl_mode;
 	int flow_ctrl_cnt0;
 	int flow_ctrl_cnt1;
 };
-#endif
+
 /*
  * MPCC connection and blending configuration for a single MPCC instance.
  * This struct is used as a node in an MPC tree.
@@ -123,9 +117,7 @@ struct mpcc {
 	struct mpcc *mpcc_bot;		/* pointer to bottom layer MPCC.  NULL when not connected */
 	struct mpcc_blnd_cfg blnd_cfg;	/* The blending configuration for this MPCC */
 	struct mpcc_sm_cfg sm_cfg;	/* stereo mix setting for this MPCC */
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	bool shared_bottom;		/* TRUE if MPCC output to both OPP and DWB endpoints, else FALSE */
-#endif
 };
 
 /*
@@ -247,7 +239,6 @@ struct mpc_funcs {
 			int opp_id,
 			bool lock);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	/*
 	 * Add DPP into 'secondary' MPC tree based on specified blending position.
 	 * Only used for planes that are part of blending chain for DWB output
@@ -290,7 +281,6 @@ struct mpc_funcs {
 	struct mpcc* (*get_mpcc_for_dpp_from_secondary)(
 			struct mpc_tree *tree,
 			int dpp_id);
-#endif
 	struct mpcc* (*get_mpcc_for_dpp)(
 			struct mpc_tree *tree,
 			int dpp_id);
@@ -330,7 +320,6 @@ struct mpc_funcs {
 			struct mpc *mpc,
 			int mpcc_id,
 			bool power_on);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	void (*set_dwb_mux)(
 			struct mpc *mpc,
 			int dwb_id,
@@ -350,9 +339,7 @@ struct mpc_funcs {
 		bool enable,
 		bool rate_2x_mode,
 		struct mpc_dwb_flow_control *flow_control);
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	void (*set_gamut_remap)(
 			struct mpc *mpc,
 			int mpcc_id,
@@ -372,8 +359,6 @@ struct mpc_funcs {
 
 	int (*release_rmu)(struct mpc *mpc, int mpcc_id);
 
-#endif
-
 };
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index 0184cefb083b..47c7e4c3a51b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -104,10 +104,8 @@ struct stream_encoder {
 	struct dc_bios *bp;
 	enum engine_id id;
 	uint32_t stream_enc_inst;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	struct vpg *vpg;
 	struct afmt *afmt;
-#endif
 };
 
 struct enc_state {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index 084432132b16..12d5718caea8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -98,19 +98,15 @@ enum crc_selection {
 	INTERSECT_WINDOW_NOT_A_NOT_B,
 };
 
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 enum otg_out_mux_dest {
 	OUT_MUX_DIO = 0,
 };
-#endif
 
 enum h_timing_div_mode {
 	H_TIMING_NO_DIV,
 	H_TIMING_DIV_BY2,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	H_TIMING_RESERVED,
 	H_TIMING_DIV_BY4,
-#endif
 };
 
 struct crc_params {
@@ -288,7 +284,6 @@ struct timing_generator_funcs {
 	void (*set_gsl_source_select)(struct timing_generator *optc,
 			int group_idx,
 			uint32_t gsl_ready_signal);
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	void (*set_out_mux)(struct timing_generator *tg, enum otg_out_mux_dest dest);
 	void (*set_vrr_m_const)(struct timing_generator *optc,
 			double vtotal_avg);
@@ -296,7 +291,6 @@ struct timing_generator_funcs {
 			uint32_t window_start, uint32_t window_end);
 	void (*set_vtotal_change_limit)(struct timing_generator *optc,
 			uint32_t limit);
-#endif
 };
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index e9ef782e63a8..7ba33414fce2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -50,9 +50,7 @@ struct dpp;
 struct dce_hwseq;
 
 struct hw_sequencer_funcs {
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	void (*hardware_release)(struct dc *dc);
-#endif
 	/* Embedded Display Related */
 	void (*edp_power_control)(struct dc_link *link, bool enable);
 	void (*edp_wait_for_hpd_ready)(struct dc_link *link, bool power_up);
@@ -218,10 +216,8 @@ struct hw_sequencer_funcs {
 
 	void (*set_pipe)(struct pipe_ctx *pipe_ctx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	/* Idle Optimization Related */
 	bool (*apply_idle_power_optimizations)(struct dc *dc, bool enable);
-#endif
 
 	bool (*is_abm_supported)(struct dc *dc,
 			struct dc_state *context, struct dc_stream_state *stream);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index dbd74d548de3..d89815a46190 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -48,9 +48,7 @@ struct resource_caps {
 	int num_ddc;
 	int num_vmid;
 	int num_dsc;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	int num_mpc_3dlut;
-#endif
 };
 
 struct resource_straps {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/Makefile b/drivers/gpu/drm/amd/display/dc/irq/Makefile
index b279dd71d9b3..ca8168726324 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/irq/Makefile
@@ -93,18 +93,14 @@ IRQ_DCN21 = irq_service_dcn21.o
 AMD_DAL_IRQ_DCN21= $(addprefix $(AMDDALPATH)/dc/irq/dcn21/,$(IRQ_DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN21)
-endif
 ###############################################################################
 # DCN 30
 ###############################################################################
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 IRQ_DCN3 = irq_service_dcn30.o
 
 AMD_DAL_IRQ_DCN3 = $(addprefix $(AMDDALPATH)/dc/irq/dcn30/,$(IRQ_DCN3))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3)
-endif
-ifdef CONFIG_DRM_AMD_DC_DCN3_02
 ###############################################################################
 # DCN 3_02
 ###############################################################################
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
index 49689f71f4f1..abf7d07ea7d1 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
@@ -22,7 +22,7 @@
  *
  */
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 #include "dm_services.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.h b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.h
index 5a00acaa1a18..080e21239688 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.h
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.h
@@ -23,7 +23,7 @@
  *
  */
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 
 #ifndef __DAL_IRQ_SERVICE_DCN30_H__
 #define __DAL_IRQ_SERVICE_DCN30_H__
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 9896fbf31e16..ac41ae2d261b 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -88,15 +88,9 @@ enum dmub_asic {
 	DMUB_ASIC_NONE = 0,
 	DMUB_ASIC_DCN20,
 	DMUB_ASIC_DCN21,
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	DMUB_ASIC_DCN30,
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 	DMUB_ASIC_DCN301,
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_02
 	DMUB_ASIC_DCN302,
-#endif
 	DMUB_ASIC_MAX,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index 71f1231cd278..945287164cf2 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -21,12 +21,8 @@
 #
 
 DMUB = dmub_srv.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
-ifdef CONFIG_DRM_AMD_DC_DCN3_0
 DMUB += dmub_dcn30.o dmub_dcn301.o
-endif
-ifdef CONFIG_DRM_AMD_DC_DCN3_02
 DMUB += dmub_dcn302.o
-endif
 
 AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index dbfb8ec2c76d..d11b96d132ad 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -27,15 +27,9 @@
 #include "dmub_dcn20.h"
 #include "dmub_dcn21.h"
 #include "dmub_cmd.h"
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 #include "dmub_dcn30.h"
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 #include "dmub_dcn301.h"
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_02
 #include "dmub_dcn302.h"
-#endif
 #include "os_types.h"
 /*
  * Note: the DMUB service is standalone. No additional headers should be
@@ -142,15 +136,9 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 	switch (asic) {
 	case DMUB_ASIC_DCN20:
 	case DMUB_ASIC_DCN21:
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	case DMUB_ASIC_DCN30:
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 	case DMUB_ASIC_DCN301:
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_02
 	case DMUB_ASIC_DCN302:
-#endif
 		dmub->regs = &dmub_srv_dcn20_regs;
 
 		funcs->reset = dmub_dcn20_reset;
@@ -172,7 +160,6 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 			funcs->is_auto_load_done = dmub_dcn21_is_auto_load_done;
 			funcs->is_phy_init = dmub_dcn21_is_phy_init;
 		}
-#ifdef CONFIG_DRM_AMD_DC_DCN3_0
 		if (asic == DMUB_ASIC_DCN30) {
 			dmub->regs = &dmub_srv_dcn30_regs;
 
@@ -180,23 +167,18 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 			funcs->backdoor_load = dmub_dcn30_backdoor_load;
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_01
 		if (asic == DMUB_ASIC_DCN301) {
 			dmub->regs = &dmub_srv_dcn301_regs;
 
 			funcs->backdoor_load = dmub_dcn30_backdoor_load;
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
-#endif
-#ifdef CONFIG_DRM_AMD_DC_DCN3_02
 		if (asic == DMUB_ASIC_DCN302) {
 			dmub->regs = &dmub_srv_dcn302_regs;
 
 			funcs->backdoor_load = dmub_dcn30_backdoor_load;
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
-#endif
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index 2bf60ac2974f..33128ebbeb9f 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -203,17 +203,12 @@ enum {
 #define ASICREV_IS_NAVI12_P(eChipRev)        ((eChipRev >= NV_NAVI12_P_A0) && (eChipRev < NV_NAVI14_M_A0))
 #define ASICREV_IS_NAVI14_M(eChipRev)        ((eChipRev >= NV_NAVI14_M_A0) && (eChipRev < NV_UNKNOWN))
 #define ASICREV_IS_RENOIR(eChipRev) ((eChipRev >= RENOIR_A0) && (eChipRev < RAVEN1_F0))
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0) && (eChipRev < NV_DIMGREY_CAVEFISH_P_A0))
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 #define ASICREV_IS_DIMGREY_CAVEFISH_P(eChipRev)        ((eChipRev >= NV_DIMGREY_CAVEFISH_P_A0) && (eChipRev < NV_UNKNOWN))
-#endif
 #define GREEN_SARDINE_A0 0xA1
 #ifndef ASICREV_IS_GREEN_SARDINE
 #define ASICREV_IS_GREEN_SARDINE(eChipRev) ((eChipRev >= GREEN_SARDINE_A0) && (eChipRev < 0xFF))
 #endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define FAMILY_VGH 144
 #define DEVICE_ID_VGH_163F 0x163F
 #define VANGOGH_A0 0x01
@@ -222,7 +217,6 @@ enum {
 #ifndef ASICREV_IS_VANGOGH
 #define ASICREV_IS_VANGOGH(eChipRev) ((eChipRev >= VANGOGH_A0) && (eChipRev < VANGOGH_UNKNOWN))
 #endif
-#endif
 
 /*
  * ASIC chip ID
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 3ed7b066a925..0d485802a2d0 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -51,15 +51,9 @@ enum dce_version {
 	DCN_VERSION_1_01,
 	DCN_VERSION_2_0,
 	DCN_VERSION_2_1,
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN_VERSION_3_0,
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	DCN_VERSION_3_01,
-#endif
-#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
 	DCN_VERSION_3_02,
-#endif
 	DCN_VERSION_MAX
 };
 
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 04dd546a143c..792652236c61 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -284,7 +284,6 @@ struct ext_hdmi_settings {
 	struct i2c_reg_info      reg_settings_6g[3];
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 struct edp_info {
 	uint16_t edp_backlight_pwm_hz;
 	uint16_t edp_ss_percentage;
@@ -295,7 +294,6 @@ struct edp_info {
 	uint8_t  edp_panel_bpc;
 	uint8_t  edp_bootup_bl_level;
 };
-#endif
 
 /* V6 */
 struct integrated_info {
@@ -415,11 +413,9 @@ struct integrated_info {
 	struct i2c_reg_info dp3_ext_hdmi_6g_reg_settings[3];
 	/* V11 */
 	uint32_t dp_ss_control;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	/* V2.1 */
 	struct edp_info edp1_info;
 	struct edp_info edp2_info;
-#endif
 };
 
 /**
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 61497954e67e..7883e2770786 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -665,13 +665,8 @@ bool dmub_init_abm_config(struct resource_pool *res_pool,
 	bool result = false;
 	uint32_t i, j = 0;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	if (res_pool->abm == NULL && res_pool->multiple_abms[0] == NULL)
 		return false;
-#else
-	if (res_pool->abm == NULL)
-		return false;
-#endif
 
 	memset(&ram_table, 0, sizeof(ram_table));
 	memset(&config, 0, sizeof(config));
@@ -712,12 +707,10 @@ bool dmub_init_abm_config(struct resource_pool *res_pool,
 
 	config.min_abm_backlight = ram_table.min_abm_backlight;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-	if (res_pool->multiple_abms[0]) {
+	if (res_pool->multiple_abms[0])
 		result = res_pool->multiple_abms[0]->funcs->init_abm_config(
 			res_pool->multiple_abms[0], (char *)(&config), sizeof(struct abm_config_table));
-	} else
-#endif
+	else
 		result = res_pool->abm->funcs->init_abm_config(
 			res_pool->abm, (char *)(&config), sizeof(struct abm_config_table));
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
