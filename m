Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0A2791C1
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445F96ED81;
	Fri, 25 Sep 2020 20:12:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B676ED81
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:59 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id 16so4123355qkf.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4AIFspxBdYUjWA1seod2H8I8Z7ARvoW3W/w/NGOCEkQ=;
 b=MlbmX2PmOBkX/twvUyzetwOh8TvQqthKkjN7Cu2r1pjM2XSOZyqXWxtZvDxSkK8hkT
 xziUKOe5CLSKg5rCfHe3XNeyq8nrsrejBOVb2KXIxyqQVGh9viQYICPlDsVaW0/M7Hj8
 YDM+wmKX1RztaLJnWaSy34AtuNtD6bHPs6KYDs7LHu9nkLE9ShnSthfCLo1SIQZfjYOA
 T+iiGJHzxAZ7jy4XGUenzwwIwIpBK04cgtRVsCm4nesv7+2oNROLijvs/B5d1BRupttH
 uOk7FR4XYELzxsmkLR5jD7ZQ1iskusU2UvNsRUtpcwWVo34q9oS5tZ9YdG9Sse4yhQq5
 XpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AIFspxBdYUjWA1seod2H8I8Z7ARvoW3W/w/NGOCEkQ=;
 b=DD7HZi3eB0vkaoyAq8hMs7MK1M5YNXOKwYlfoorBrd1iYzkSw83yQRHGKtp6Q4Imat
 YmCKNuRCmsicAewe183oAr4bFM28OQdYhHOGxjfRIFrXAp/txjAUnJqi7Ri/BHlLCWRu
 J3TzhPxTVfmZi/DnwOgZXCUScfsnnJ2jVdzdDjfyXglcZ7v04avZzFTcD3TUUawv/yuU
 gBsnEU2HMfKPBu4vcyuQON2JnIiG8bNasdfHgdGlI4Kbdzav5E934eKGjZViT1HGKyAb
 0zUp5jUiTR33g5vnDA35AoNjCz+BP03ZR+8757CR+vuo/tdt85JNkrtVkJT0ztkXf4Qt
 1YKg==
X-Gm-Message-State: AOAM5316diqpvYNGFQMtVddB+GQnFypygcNKyVekgohE/J2nmAzyWwdW
 Q94dypJhW1/Clu9R4hy7uOdIHgSNH1A=
X-Google-Smtp-Source: ABdhPJzpQXGP1Rwcio1H8buY4AEGtTkgSmmGI5Xd2zm3ujUKH62PPEiEZ2MX6wG/WjkFJlfFnFsZdg==
X-Received: by 2002:a05:620a:53a:: with SMTP id
 h26mr1778291qkh.232.1601064716342; 
 Fri, 25 Sep 2020 13:11:56 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 43/45] drm/amd/display: Add dcn3.01 support to DC
Date: Fri, 25 Sep 2020 16:10:27 -0400
Message-Id: <20200925201029.1738724-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200925201029.1738724-1-alexander.deucher@amd.com>
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

Update dc for vangogh support.

Signed-off-by: Roman Li <Roman.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/Kconfig           |    9 +
 drivers/gpu/drm/amd/display/dc/Makefile       |    4 +
 .../drm/amd/display/dc/bios/bios_parser2.c    |  187 ++
 .../display/dc/bios/command_table_helper2.c   |    6 +-
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   10 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   21 +-
 .../display/dc/clk_mgr/dcn301/dcn301_smu.c    |  241 ++
 .../display/dc/clk_mgr/dcn301/dcn301_smu.h    |  164 ++
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    |  834 +++++++
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.h    |   43 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   14 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h  |   18 +-
 .../drm/amd/display/dc/dce/dce_clock_source.c |   18 +
 .../drm/amd/display/dc/dce/dce_clock_source.h |   29 +
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  191 +-
 .../amd/display/dc/dcn10/dcn10_link_encoder.h |   18 +
 .../drm/amd/display/dc/dcn30/dcn30_hubbub.c   |   11 +
 .../drm/amd/display/dc/dcn30/dcn30_hubbub.h   |    3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h |    5 +
 .../drm/amd/display/dc/dcn30/dcn30_resource.c |    2 +-
 .../drm/amd/display/dc/dcn30/dcn30_resource.h |    5 +
 .../gpu/drm/amd/display/dc/dcn301/Makefile    |   47 +
 .../drm/amd/display/dc/dcn301/dcn301_dccg.c   |   75 +
 .../drm/amd/display/dc/dcn301/dcn301_dccg.h   |   65 +
 .../dc/dcn301/dcn301_dio_link_encoder.c       |  192 ++
 .../dc/dcn301/dcn301_dio_link_encoder.h       |   82 +
 .../drm/amd/display/dc/dcn301/dcn301_hubbub.c |   81 +
 .../drm/amd/display/dc/dcn301/dcn301_hubbub.h |   60 +
 .../drm/amd/display/dc/dcn301/dcn301_hwseq.c  |   42 +
 .../drm/amd/display/dc/dcn301/dcn301_hwseq.h  |   32 +
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |  145 ++
 .../drm/amd/display/dc/dcn301/dcn301_init.h   |   33 +
 .../amd/display/dc/dcn301/dcn301_panel_cntl.c |  218 ++
 .../amd/display/dc/dcn301/dcn301_panel_cntl.h |   97 +
 .../amd/display/dc/dcn301/dcn301_resource.c   | 2011 +++++++++++++++++
 .../amd/display/dc/dcn301/dcn301_resource.h   |   42 +
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h    |   26 +-
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |    3 +
 .../drm/amd/display/dc/gpio/hw_translate.c    |    3 +
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |   33 +
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |    4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |    5 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |    3 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile |    2 +-
 .../drm/amd/display/dmub/src/dmub_dcn301.c    |   55 +
 .../drm/amd/display/dmub/src/dmub_dcn301.h    |   37 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |   14 +
 .../gpu/drm/amd/display/include/dal_asic_id.h |   10 +
 .../gpu/drm/amd/display/include/dal_types.h   |    5 +
 .../display/include/grph_object_ctrl_defs.h   |   17 +
 50 files changed, 5238 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.h

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index f24abf428534..c2283e6ea734 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -25,6 +25,15 @@ config DRM_AMD_DC_DCN3_0
             Choose this option if you want to have
             sienna_cichlid support for display engine
 
+config DRM_AMD_DC_DCN3_01
+	bool "DCN 3.01 family"
+	depends on DRM_AMD_DC && X86
+	depends on DRM_AMD_DC_DCN
+	depends on DRM_AMD_DC_DCN3_0
+	help
+	    Choose this option if you want to have
+	    Van Gogh support for display engine
+
 config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
 	depends on DRM_AMD_DC
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 047b1e2dd8f1..6e6ec1d92488 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -36,6 +36,10 @@ ifdef CONFIG_DRM_AMD_DC_DCN3_0
 DC_LIBS += dcn30
 endif
 
+ifdef CONFIG_DRM_AMD_DC_DCN3_01
+DC_LIBS += dcn301
+endif
+
 DC_LIBS += dce120
 
 DC_LIBS += dce112
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 29d64e7e304f..8fa002ec6969 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1743,6 +1743,167 @@ static enum bp_result get_integrated_info_v11(
 	return BP_RESULT_OK;
 }
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+static enum bp_result get_integrated_info_v2_1(
+	struct bios_parser *bp,
+	struct integrated_info *info)
+{
+	struct atom_integrated_system_info_v2_1 *info_v2_1;
+	uint32_t i;
+
+	info_v2_1 = GET_IMAGE(struct atom_integrated_system_info_v2_1,
+					DATA_TABLES(integratedsysteminfo));
+
+	if (info_v2_1 == NULL)
+		return BP_RESULT_BADBIOSTABLE;
+
+	info->gpu_cap_info =
+	le32_to_cpu(info_v2_1->gpucapinfo);
+	/*
+	* system_config: Bit[0] = 0 : PCIE power gating disabled
+	*                       = 1 : PCIE power gating enabled
+	*                Bit[1] = 0 : DDR-PLL shut down disabled
+	*                       = 1 : DDR-PLL shut down enabled
+	*                Bit[2] = 0 : DDR-PLL power down disabled
+	*                       = 1 : DDR-PLL power down enabled
+	*/
+	info->system_config = le32_to_cpu(info_v2_1->system_config);
+	info->cpu_cap_info = le32_to_cpu(info_v2_1->cpucapinfo);
+	info->memory_type = info_v2_1->memorytype;
+	info->ma_channel_number = info_v2_1->umachannelnumber;
+	info->dp_ss_control =
+		le16_to_cpu(info_v2_1->reserved1);
+
+	for (i = 0; i < NUMBER_OF_UCHAR_FOR_GUID; ++i) {
+		info->ext_disp_conn_info.gu_id[i] =
+				info_v2_1->extdispconninfo.guid[i];
+	}
+
+	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; ++i) {
+		info->ext_disp_conn_info.path[i].device_connector_id =
+		object_id_from_bios_object_id(
+		le16_to_cpu(info_v2_1->extdispconninfo.path[i].connectorobjid));
+
+		info->ext_disp_conn_info.path[i].ext_encoder_obj_id =
+		object_id_from_bios_object_id(
+			le16_to_cpu(
+			info_v2_1->extdispconninfo.path[i].ext_encoder_objid));
+
+		info->ext_disp_conn_info.path[i].device_tag =
+			le16_to_cpu(
+				info_v2_1->extdispconninfo.path[i].device_tag);
+		info->ext_disp_conn_info.path[i].device_acpi_enum =
+		le16_to_cpu(
+			info_v2_1->extdispconninfo.path[i].device_acpi_enum);
+		info->ext_disp_conn_info.path[i].ext_aux_ddc_lut_index =
+			info_v2_1->extdispconninfo.path[i].auxddclut_index;
+		info->ext_disp_conn_info.path[i].ext_hpd_pin_lut_index =
+			info_v2_1->extdispconninfo.path[i].hpdlut_index;
+		info->ext_disp_conn_info.path[i].channel_mapping.raw =
+			info_v2_1->extdispconninfo.path[i].channelmapping;
+		info->ext_disp_conn_info.path[i].caps =
+				le16_to_cpu(info_v2_1->extdispconninfo.path[i].caps);
+	}
+
+	info->ext_disp_conn_info.checksum =
+		info_v2_1->extdispconninfo.checksum;
+	info->dp0_ext_hdmi_slv_addr = info_v2_1->dp0_retimer_set.HdmiSlvAddr;
+	info->dp0_ext_hdmi_reg_num = info_v2_1->dp0_retimer_set.HdmiRegNum;
+	for (i = 0; i < info->dp0_ext_hdmi_reg_num; i++) {
+		info->dp0_ext_hdmi_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp0_retimer_set.HdmiRegSetting[i].ucI2cRegIndex;
+		info->dp0_ext_hdmi_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp0_retimer_set.HdmiRegSetting[i].ucI2cRegVal;
+	}
+	info->dp0_ext_hdmi_6g_reg_num = info_v2_1->dp0_retimer_set.Hdmi6GRegNum;
+	for (i = 0; i < info->dp0_ext_hdmi_6g_reg_num; i++) {
+		info->dp0_ext_hdmi_6g_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp0_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegIndex;
+		info->dp0_ext_hdmi_6g_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp0_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegVal;
+	}
+	info->dp1_ext_hdmi_slv_addr = info_v2_1->dp1_retimer_set.HdmiSlvAddr;
+	info->dp1_ext_hdmi_reg_num = info_v2_1->dp1_retimer_set.HdmiRegNum;
+	for (i = 0; i < info->dp1_ext_hdmi_reg_num; i++) {
+		info->dp1_ext_hdmi_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp1_retimer_set.HdmiRegSetting[i].ucI2cRegIndex;
+		info->dp1_ext_hdmi_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp1_retimer_set.HdmiRegSetting[i].ucI2cRegVal;
+	}
+	info->dp1_ext_hdmi_6g_reg_num = info_v2_1->dp1_retimer_set.Hdmi6GRegNum;
+	for (i = 0; i < info->dp1_ext_hdmi_6g_reg_num; i++) {
+		info->dp1_ext_hdmi_6g_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp1_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegIndex;
+		info->dp1_ext_hdmi_6g_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp1_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegVal;
+	}
+	info->dp2_ext_hdmi_slv_addr = info_v2_1->dp2_retimer_set.HdmiSlvAddr;
+	info->dp2_ext_hdmi_reg_num = info_v2_1->dp2_retimer_set.HdmiRegNum;
+	for (i = 0; i < info->dp2_ext_hdmi_reg_num; i++) {
+		info->dp2_ext_hdmi_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp2_retimer_set.HdmiRegSetting[i].ucI2cRegIndex;
+		info->dp2_ext_hdmi_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp2_retimer_set.HdmiRegSetting[i].ucI2cRegVal;
+	}
+	info->dp2_ext_hdmi_6g_reg_num = info_v2_1->dp2_retimer_set.Hdmi6GRegNum;
+	for (i = 0; i < info->dp2_ext_hdmi_6g_reg_num; i++) {
+		info->dp2_ext_hdmi_6g_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp2_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegIndex;
+		info->dp2_ext_hdmi_6g_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp2_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegVal;
+	}
+	info->dp3_ext_hdmi_slv_addr = info_v2_1->dp3_retimer_set.HdmiSlvAddr;
+	info->dp3_ext_hdmi_reg_num = info_v2_1->dp3_retimer_set.HdmiRegNum;
+	for (i = 0; i < info->dp3_ext_hdmi_reg_num; i++) {
+		info->dp3_ext_hdmi_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp3_retimer_set.HdmiRegSetting[i].ucI2cRegIndex;
+		info->dp3_ext_hdmi_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp3_retimer_set.HdmiRegSetting[i].ucI2cRegVal;
+	}
+	info->dp3_ext_hdmi_6g_reg_num = info_v2_1->dp3_retimer_set.Hdmi6GRegNum;
+	for (i = 0; i < info->dp3_ext_hdmi_6g_reg_num; i++) {
+		info->dp3_ext_hdmi_6g_reg_settings[i].i2c_reg_index =
+				info_v2_1->dp3_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegIndex;
+		info->dp3_ext_hdmi_6g_reg_settings[i].i2c_reg_val =
+				info_v2_1->dp3_retimer_set.Hdmi6GhzRegSetting[i].ucI2cRegVal;
+	}
+
+	info->edp1_info.edp_backlight_pwm_hz =
+	le16_to_cpu(info_v2_1->edp1_info.edp_backlight_pwm_hz);
+	info->edp1_info.edp_ss_percentage =
+	le16_to_cpu(info_v2_1->edp1_info.edp_ss_percentage);
+	info->edp1_info.edp_ss_rate_10hz =
+	le16_to_cpu(info_v2_1->edp1_info.edp_ss_rate_10hz);
+	info->edp1_info.edp_pwr_on_off_delay =
+		info_v2_1->edp1_info.edp_pwr_on_off_delay;
+	info->edp1_info.edp_pwr_on_vary_bl_to_blon =
+		info_v2_1->edp1_info.edp_pwr_on_vary_bl_to_blon;
+	info->edp1_info.edp_pwr_down_bloff_to_vary_bloff =
+		info_v2_1->edp1_info.edp_pwr_down_bloff_to_vary_bloff;
+	info->edp1_info.edp_panel_bpc =
+		info_v2_1->edp1_info.edp_panel_bpc;
+	info->edp1_info.edp_bootup_bl_level =
+
+	info->edp2_info.edp_backlight_pwm_hz =
+	le16_to_cpu(info_v2_1->edp2_info.edp_backlight_pwm_hz);
+	info->edp2_info.edp_ss_percentage =
+	le16_to_cpu(info_v2_1->edp2_info.edp_ss_percentage);
+	info->edp2_info.edp_ss_rate_10hz =
+	le16_to_cpu(info_v2_1->edp2_info.edp_ss_rate_10hz);
+	info->edp2_info.edp_pwr_on_off_delay =
+		info_v2_1->edp2_info.edp_pwr_on_off_delay;
+	info->edp2_info.edp_pwr_on_vary_bl_to_blon =
+		info_v2_1->edp2_info.edp_pwr_on_vary_bl_to_blon;
+	info->edp2_info.edp_pwr_down_bloff_to_vary_bloff =
+		info_v2_1->edp2_info.edp_pwr_down_bloff_to_vary_bloff;
+	info->edp2_info.edp_panel_bpc =
+		info_v2_1->edp2_info.edp_panel_bpc;
+	info->edp2_info.edp_bootup_bl_level =
+		info_v2_1->edp2_info.edp_bootup_bl_level;
+
+	return BP_RESULT_OK;
+}
+#endif
 
 /*
  * construct_integrated_info
@@ -1775,6 +1936,31 @@ static enum bp_result construct_integrated_info(
 
 		get_atom_data_table_revision(header, &revision);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+		switch (revision.major) {
+		case 1:
+			switch (revision.minor) {
+			case 11:
+			case 12:
+				result = get_integrated_info_v11(bp, info);
+				break;
+			default:
+				return result;
+			}
+			break;
+		case 2:
+			switch (revision.minor) {
+			case 1:
+				result = get_integrated_info_v2_1(bp, info);
+				break;
+			default:
+				return result;
+			}
+			break;
+		default:
+			return result;
+		}
+#else
 		/* Don't need to check major revision as they are all 1 */
 		switch (revision.minor) {
 		case 11:
@@ -1784,6 +1970,7 @@ static enum bp_result construct_integrated_info(
 		default:
 			return result;
 		}
+#endif
 	}
 
 	if (result != BP_RESULT_OK)
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index 74c498b6774d..515dac743ae0 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -78,7 +78,11 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
 #endif
-
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case DCN_VERSION_3_01:
+		*h = dal_cmd_tbl_helper_dce112_get_table2();
+		return true;
+#endif
 	default:
 		/* Unsupported DCE */
 		BREAK_TO_DEBUGGER();
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 1a495759a034..8c6d0a2acba4 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -125,3 +125,13 @@ AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DC
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
 endif
+ifdef CONFIG_DRM_AMD_DC_DCN3_01
+###############################################################################
+# DCN301
+###############################################################################
+CLK_MGR_DCN301 = vg_clk_mgr.o dcn301_smu.o
+
+AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_DCN301))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
+endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index efb909ef7a0f..270a8182682d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -42,6 +42,9 @@
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #include "dcn30/dcn30_clk_mgr.h"
 #endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#include "dcn301/vg_clk_mgr.h"
+#endif
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -188,6 +191,12 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		break;
 #endif	/* Family RV and NV*/
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case FAMILY_VGH:
+		if (ASICREV_IS_VANGOGH(asic_id.hw_internal_rev))
+			vg_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+		break;
+#endif
 	default:
 		ASSERT(0); /* Unknown Asic */
 		break;
@@ -205,8 +214,18 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 	case FAMILY_NV:
 		if (ASICREV_IS_SIENNA_CICHLID_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_destroy(clk_mgr);
-			break;
 		}
+		break;
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case FAMILY_VGH:
+		if (ASICREV_IS_VANGOGH(clk_mgr_base->ctx->asic_id.hw_internal_rev))
+			vg_clk_mgr_destroy(clk_mgr);
+		break;
+#endif
+
+	default:
+		break;
 	}
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
new file mode 100644
index 000000000000..cfa8e02cf103
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
@@ -0,0 +1,241 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "core_types.h"
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include <linux/delay.h>
+
+#include "dcn301_smu.h"
+
+#include "vangogh_ip_offset.h"
+
+#include "mp/mp_11_5_0_offset.h"
+#include "mp/mp_11_5_0_sh_mask.h"
+
+#define REG(reg_name) \
+	(MP0_BASE.instance[0].segment[mm ## reg_name ## _BASE_IDX] + mm ## reg_name)
+
+#define FN(reg_name, field) \
+	FD(reg_name##__##field)
+
+#define VBIOSSMC_MSG_GetSmuVersion                0x2
+#define VBIOSSMC_MSG_SetDispclkFreq               0x4
+#define VBIOSSMC_MSG_SetDprefclkFreq              0x5
+#define VBIOSSMC_MSG_SetDppclkFreq                0x6
+#define VBIOSSMC_MSG_SetHardMinDcfclkByFreq       0x7
+#define VBIOSSMC_MSG_SetMinDeepSleepDcfclk        0x8
+//#define VBIOSSMC_MSG_SetPhyclkVoltageByFreq       0xA
+#define VBIOSSMC_MSG_GetFclkFrequency             0xA
+//#define VBIOSSMC_MSG_SetDisplayCount              0xC
+//#define VBIOSSMC_MSG_EnableTmdp48MHzRefclkPwrDown 0xD
+#define VBIOSSMC_MSG_UpdatePmeRestore			  0xD
+#define VBIOSSMC_MSG_SetVbiosDramAddrHigh         0xE   //Used for WM table txfr
+#define VBIOSSMC_MSG_SetVbiosDramAddrLow          0xF
+#define VBIOSSMC_MSG_TransferTableSmu2Dram        0x10
+#define VBIOSSMC_MSG_TransferTableDram2Smu        0x11
+#define VBIOSSMC_MSG_SetDisplayIdleOptimizations  0x12
+
+#define VBIOSSMC_Status_BUSY                      0x0
+#define VBIOSSMC_Result_OK                        0x1
+#define VBIOSSMC_Result_Failed                    0xFF
+#define VBIOSSMC_Result_UnknownCmd                0xFE
+#define VBIOSSMC_Result_CmdRejectedPrereq         0xFD
+#define VBIOSSMC_Result_CmdRejectedBusy           0xFC
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn301_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t res_val = VBIOSSMC_Status_BUSY;
+
+	do {
+		res_val = REG_READ(MP1_SMN_C2PMSG_91);
+		if (res_val != VBIOSSMC_Status_BUSY)
+			break;
+
+		if (delay_us >= 1000)
+			msleep(delay_us/1000);
+		else if (delay_us > 0)
+			udelay(delay_us);
+	} while (max_retries--);
+
+	return res_val;
+}
+
+int dcn301_smu_send_msg_with_param(
+		struct clk_mgr_internal *clk_mgr,
+		unsigned int msg_id, unsigned int param)
+{
+	uint32_t result;
+
+	/* First clear response register */
+	REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Status_BUSY);
+
+	/* Set the parameter register for the SMU message, unit is Mhz */
+	REG_WRITE(MP1_SMN_C2PMSG_83, param);
+
+	/* Trigger the message transaction by writing the message ID */
+	REG_WRITE(MP1_SMN_C2PMSG_67, msg_id);
+
+	result = dcn301_smu_wait_for_response(clk_mgr, 10, 1000);
+
+	ASSERT(result == VBIOSSMC_Result_OK);
+
+	/* Actual dispclk set is returned in the parameter register */
+	return REG_READ(MP1_SMN_C2PMSG_83);
+}
+
+int dcn301_smu_get_smu_version(struct clk_mgr_internal *clk_mgr)
+{
+	return dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_GetSmuVersion,
+			0);
+}
+
+
+int dcn301_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+{
+	int actual_dispclk_set_mhz = -1;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_dispclk_set_mhz = dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDispclkFreq,
+			requested_dispclk_khz / 1000);
+
+	return actual_dispclk_set_mhz * 1000;
+}
+
+int dcn301_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
+{
+	int actual_dprefclk_set_mhz = -1;
+
+	actual_dprefclk_set_mhz = dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDprefclkFreq,
+			clk_mgr->base.dprefclk_khz / 1000);
+
+	/* TODO: add code for programing DP DTO, currently this is down by command table */
+
+	return actual_dprefclk_set_mhz * 1000;
+}
+
+int dcn301_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
+{
+	int actual_dcfclk_set_mhz = -1;
+
+	actual_dcfclk_set_mhz = dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetHardMinDcfclkByFreq,
+			requested_dcfclk_khz / 1000);
+
+	return actual_dcfclk_set_mhz * 1000;
+}
+
+int dcn301_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
+{
+	int actual_min_ds_dcfclk_mhz = -1;
+
+	actual_min_ds_dcfclk_mhz = dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetMinDeepSleepDcfclk,
+			requested_min_ds_dcfclk_khz / 1000);
+
+	return actual_min_ds_dcfclk_mhz * 1000;
+}
+
+int dcn301_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
+{
+	int actual_dppclk_set_mhz = -1;
+
+	actual_dppclk_set_mhz = dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDppclkFreq,
+			requested_dpp_khz / 1000);
+
+	return actual_dppclk_set_mhz * 1000;
+}
+
+void dcn301_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
+{
+	//TODO: Work with smu team to define optimization options.
+
+	dcn301_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+		idle_info);
+}
+
+void dcn301_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	union display_idle_optimization_u idle_info = { 0 };
+
+	if (enable) {
+		idle_info.idle_info.df_request_disabled = 1;
+		idle_info.idle_info.phy_ref_clk_off = 1;
+	}
+
+	dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+			idle_info.data);
+}
+
+void dcn301_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr)
+{
+	dcn301_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_UpdatePmeRestore,
+			0);
+}
+
+void dcn301_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	dcn301_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrHigh, addr_high);
+}
+
+void dcn301_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	dcn301_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrLow, addr_low);
+}
+
+void dcn301_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	dcn301_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableSmu2Dram, TABLE_DPMCLOCKS);
+}
+
+void dcn301_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	dcn301_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.h
new file mode 100644
index 000000000000..b640df85a17f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.h
@@ -0,0 +1,164 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef DAL_DC_301_SMU_H_
+#define DAL_DC_301_SMU_H_
+
+#define SMU13_DRIVER_IF_VERSION 2
+
+typedef struct {
+	uint32_t fclk;
+	uint32_t memclk;
+	uint32_t voltage;
+} df_pstate_t;
+
+typedef struct {
+	uint32_t vclk;
+	uint32_t dclk;
+} vcn_clk_t;
+
+typedef enum {
+	DSPCLK_DCFCLK = 0,
+	DSPCLK_DISPCLK,
+	DSPCLK_PIXCLK,
+	DSPCLK_PHYCLK,
+	DSPCLK_COUNT,
+} DSPCLK_e;
+
+typedef struct {
+	uint16_t Freq; // in MHz
+	uint16_t Vid;  // min voltage in SVI2 VID
+} DisplayClockTable_t;
+
+typedef struct {
+	uint16_t MinClock; // This is either DCFCLK or SOCCLK (in MHz)
+	uint16_t MaxClock; // This is either DCFCLK or SOCCLK (in MHz)
+	uint16_t MinMclk;
+	uint16_t MaxMclk;
+
+	uint8_t  WmSetting;
+	uint8_t  WmType;  // Used for normal pstate change or memory retraining
+	uint8_t  Padding[2];
+} WatermarkRowGeneric_t;
+
+
+#define NUM_WM_RANGES 4
+
+typedef enum {
+	WM_SOCCLK = 0,
+	WM_DCFCLK,
+	WM_COUNT,
+} WM_CLOCK_e;
+
+typedef struct {
+  // Watermarks
+	WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+	uint32_t     MmHubPadding[7]; // SMU internal use
+} Watermarks_t;
+
+
+#define TABLE_WATERMARKS         1
+#define TABLE_DPMCLOCKS          4 // Called by Driver
+
+
+#define VG_NUM_DCFCLK_DPM_LEVELS   7
+#define VG_NUM_DISPCLK_DPM_LEVELS  7
+#define VG_NUM_DPPCLK_DPM_LEVELS   7
+#define VG_NUM_SOCCLK_DPM_LEVELS   7
+#define VG_NUM_ISPICLK_DPM_LEVELS  7
+#define VG_NUM_ISPXCLK_DPM_LEVELS  7
+#define VG_NUM_VCN_DPM_LEVELS      5
+#define VG_NUM_FCLK_DPM_LEVELS     4
+#define VG_NUM_SOC_VOLTAGE_LEVELS  8
+
+// copy from vgh/vangogh/pmfw_driver_if.h
+struct vg_dpm_clocks {
+	uint32_t DcfClocks[VG_NUM_DCFCLK_DPM_LEVELS];
+	uint32_t DispClocks[VG_NUM_DISPCLK_DPM_LEVELS];
+	uint32_t DppClocks[VG_NUM_DPPCLK_DPM_LEVELS];
+	uint32_t SocClocks[VG_NUM_SOCCLK_DPM_LEVELS];
+	uint32_t IspiClocks[VG_NUM_ISPICLK_DPM_LEVELS];
+	uint32_t IspxClocks[VG_NUM_ISPXCLK_DPM_LEVELS];
+	vcn_clk_t VcnClocks[VG_NUM_VCN_DPM_LEVELS];
+
+	uint32_t SocVoltage[VG_NUM_SOC_VOLTAGE_LEVELS];
+
+	df_pstate_t DfPstateTable[VG_NUM_FCLK_DPM_LEVELS];
+
+	uint32_t MinGfxClk;
+	uint32_t MaxGfxClk;
+
+	uint8_t NumDfPstatesEnabled;
+	uint8_t NumDcfclkLevelsEnabled;
+	uint8_t NumDispClkLevelsEnabled;  //applies to both dispclk and dppclk
+	uint8_t NumSocClkLevelsEnabled;
+
+	uint8_t IspClkLevelsEnabled;  //applies to both ispiclk and ispxclk
+	uint8_t VcnClkLevelsEnabled;  //applies to both vclk/dclk
+	uint8_t spare[2];
+};
+
+struct smu_dpm_clks {
+	struct vg_dpm_clocks *dpm_clks;
+	union large_integer mc_address;
+};
+
+struct watermarks {
+  // Watermarks
+	WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+	uint32_t     MmHubPadding[7]; // SMU internal use
+};
+
+
+struct display_idle_optimization {
+	unsigned int df_request_disabled : 1;
+	unsigned int phy_ref_clk_off     : 1;
+	unsigned int s0i2_rdy            : 1;
+	unsigned int reserved            : 29;
+};
+
+union display_idle_optimization_u {
+	struct display_idle_optimization idle_info;
+	uint32_t data;
+};
+
+
+int dcn301_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
+int dcn301_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int dcn301_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
+int dcn301_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
+int dcn301_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
+int dcn301_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
+void dcn301_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info);
+void dcn301_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn301_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
+void dcn301_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void dcn301_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void dcn301_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void dcn301_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+
+#endif /* DAL_DC_301_SMU_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
new file mode 100644
index 000000000000..98cbb0ac095c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -0,0 +1,834 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+// For dce12_get_dp_ref_freq_khz
+#include "dce100/dce_clk_mgr.h"
+
+// For dcn20_update_clocks_update_dpp_dto
+#include "dcn20/dcn20_clk_mgr.h"
+
+#include "vg_clk_mgr.h"
+
+#include "dcn301_smu.h"
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dm_helpers.h"
+
+#include "atomfirmware.h"
+#include "vangogh_ip_offset.h"
+#include "clk/clk_11_5_0_offset.h"
+#include "clk/clk_11_5_0_sh_mask.h"
+
+/* Constants */
+
+#define LPDDR_MEM_RETRAIN_LATENCY 4.977 /* Number obtained from LPDDR4 Training Counter Requirement doc */
+
+/* Macros */
+
+#define REG(reg_name) \
+	(CLK_BASE.instance[0].segment[mm ## reg_name ## _BASE_IDX] + mm ## reg_name)
+
+/* TODO: evaluate how to lower or disable all dcn clocks in screen off case */
+int vg_get_active_display_cnt_wa(
+		struct dc *dc,
+		struct dc_state *context)
+{
+	int i, display_count;
+	bool tmds_present = false;
+
+	display_count = 0;
+	for (i = 0; i < context->stream_count; i++) {
+		const struct dc_stream_state *stream = context->streams[i];
+
+		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A ||
+				stream->signal == SIGNAL_TYPE_DVI_SINGLE_LINK ||
+				stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK)
+			tmds_present = true;
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		const struct dc_link *link = dc->links[i];
+
+		/*
+		 * Only notify active stream or virtual stream.
+		 * Need to notify virtual stream to work around
+		 * headless case. HPD does not fire when system is in
+		 * S0i2.
+		 */
+		/* abusing the fact that the dig and phy are coupled to see if the phy is enabled */
+		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL ||
+				link->link_enc->funcs->is_dig_enabled(link->link_enc))
+			display_count++;
+	}
+
+	/* WA for hang on HDMI after display off back back on*/
+	if (display_count == 0 && tmds_present)
+		display_count = 1;
+
+	return display_count;
+}
+
+void vg_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int display_count;
+	bool update_dppclk = false;
+	bool update_dispclk = false;
+	bool dpp_clock_lowered = false;
+
+	if (dc->work_arounds.skip_clock_update)
+		return;
+
+	/*
+	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
+	 * also if safe to lower is false, we just go in the higher state
+	 */
+	if (safe_to_lower) {
+		/* check that we're not already in lower */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+
+			display_count = vg_get_active_display_cnt_wa(dc, context);
+			/* if we can go lower, go lower */
+			if (display_count == 0) {
+				union display_idle_optimization_u idle_info = { 0 };
+
+				idle_info.idle_info.df_request_disabled = 1;
+				idle_info.idle_info.phy_ref_clk_off = 1;
+
+				dcn301_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+				/* update power state */
+				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+			}
+		}
+	} else {
+		/* check that we're not already in D0 */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
+			union display_idle_optimization_u idle_info = { 0 };
+
+			dcn301_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+			/* update power state */
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
+		}
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn301_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn301_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
+	}
+
+	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+		if (new_clocks->dppclk_khz < 100000)
+			new_clocks->dppclk_khz = 100000;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
+		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn301_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+
+		update_dispclk = true;
+	}
+
+	if (dpp_clock_lowered) {
+		// increase per DPP DTO before lowering global dppclk
+		dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		dcn301_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	} else {
+		// increase global DPPCLK before lowering per DPP DTO
+		if (update_dppclk || update_dispclk)
+			dcn301_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+		// always update dtos unless clock is lowered and not safe to lower
+		if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+	}
+}
+
+
+static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
+{
+	/* get FbMult value */
+	struct fixed31_32 pll_req;
+	unsigned int fbmult_frac_val = 0;
+	unsigned int fbmult_int_val = 0;
+
+
+	/*
+	 * Register value of fbmult is in 8.16 format, we are converting to 31.32
+	 * to leverage the fix point operations available in driver
+	 */
+
+	REG_GET(CLK1_0_CLK1_CLK_PLL_REQ, FbMult_frac, &fbmult_frac_val); /* 16 bit fractional part*/
+	REG_GET(CLK1_0_CLK1_CLK_PLL_REQ, FbMult_int, &fbmult_int_val); /* 8 bit integer part */
+
+	pll_req = dc_fixpt_from_int(fbmult_int_val);
+
+	/*
+	 * since fractional part is only 16 bit in register definition but is 32 bit
+	 * in our fix point definiton, need to shift left by 16 to obtain correct value
+	 */
+	pll_req.value |= fbmult_frac_val << 16;
+
+	/* multiply by REFCLK period */
+	pll_req = dc_fixpt_mul_int(pll_req, clk_mgr->dfs_ref_freq_khz);
+
+	/* integer part is now VCO frequency in kHz */
+	return dc_fixpt_floor(pll_req);
+}
+
+static void vg_dump_clk_registers_internal(struct dcn301_clk_internal *internal, struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	internal->CLK1_CLK3_CURRENT_CNT = REG_READ(CLK1_0_CLK1_CLK3_CURRENT_CNT);
+	internal->CLK1_CLK3_BYPASS_CNTL = REG_READ(CLK1_0_CLK1_CLK3_BYPASS_CNTL);
+
+	internal->CLK1_CLK3_DS_CNTL = REG_READ(CLK1_0_CLK1_CLK3_DS_CNTL);	//dcf deep sleep divider
+	internal->CLK1_CLK3_ALLOW_DS = REG_READ(CLK1_0_CLK1_CLK3_ALLOW_DS);
+
+	internal->CLK1_CLK1_CURRENT_CNT = REG_READ(CLK1_0_CLK1_CLK1_CURRENT_CNT);
+	internal->CLK1_CLK1_BYPASS_CNTL = REG_READ(CLK1_0_CLK1_CLK1_BYPASS_CNTL);
+
+	internal->CLK1_CLK2_CURRENT_CNT = REG_READ(CLK1_0_CLK1_CLK2_CURRENT_CNT);
+	internal->CLK1_CLK2_BYPASS_CNTL = REG_READ(CLK1_0_CLK1_CLK2_BYPASS_CNTL);
+
+	internal->CLK1_CLK0_CURRENT_CNT = REG_READ(CLK1_0_CLK1_CLK0_CURRENT_CNT);
+	internal->CLK1_CLK0_BYPASS_CNTL = REG_READ(CLK1_0_CLK1_CLK0_BYPASS_CNTL);
+}
+
+/* This function collect raw clk register values */
+static void vg_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
+		struct clk_mgr *clk_mgr_base, struct clk_log_info *log_info)
+{
+	struct dcn301_clk_internal internal = {0};
+	char *bypass_clks[5] = {"0x0 DFS", "0x1 REFCLK", "0x2 ERROR", "0x3 400 FCH", "0x4 600 FCH"};
+	unsigned int chars_printed = 0;
+	unsigned int remaining_buffer = log_info->bufSize;
+
+	vg_dump_clk_registers_internal(&internal, clk_mgr_base);
+
+	regs_and_bypass->dcfclk = internal.CLK1_CLK3_CURRENT_CNT / 10;
+	regs_and_bypass->dcf_deep_sleep_divider = internal.CLK1_CLK3_DS_CNTL / 10;
+	regs_and_bypass->dcf_deep_sleep_allow = internal.CLK1_CLK3_ALLOW_DS;
+	regs_and_bypass->dprefclk = internal.CLK1_CLK2_CURRENT_CNT / 10;
+	regs_and_bypass->dispclk = internal.CLK1_CLK0_CURRENT_CNT / 10;
+	regs_and_bypass->dppclk = internal.CLK1_CLK1_CURRENT_CNT / 10;
+
+	regs_and_bypass->dppclk_bypass = internal.CLK1_CLK1_BYPASS_CNTL & 0x0007;
+	if (regs_and_bypass->dppclk_bypass < 0 || regs_and_bypass->dppclk_bypass > 4)
+		regs_and_bypass->dppclk_bypass = 0;
+	regs_and_bypass->dcfclk_bypass = internal.CLK1_CLK3_BYPASS_CNTL & 0x0007;
+	if (regs_and_bypass->dcfclk_bypass < 0 || regs_and_bypass->dcfclk_bypass > 4)
+		regs_and_bypass->dcfclk_bypass = 0;
+	regs_and_bypass->dispclk_bypass = internal.CLK1_CLK0_BYPASS_CNTL & 0x0007;
+	if (regs_and_bypass->dispclk_bypass < 0 || regs_and_bypass->dispclk_bypass > 4)
+		regs_and_bypass->dispclk_bypass = 0;
+	regs_and_bypass->dprefclk_bypass = internal.CLK1_CLK2_BYPASS_CNTL & 0x0007;
+	if (regs_and_bypass->dprefclk_bypass < 0 || regs_and_bypass->dprefclk_bypass > 4)
+		regs_and_bypass->dprefclk_bypass = 0;
+
+	if (log_info->enabled) {
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "clk_type,clk_value,deepsleep_cntl,deepsleep_allow,bypass\n");
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "dcfclk,%d,%d,%d,%s\n",
+			regs_and_bypass->dcfclk,
+			regs_and_bypass->dcf_deep_sleep_divider,
+			regs_and_bypass->dcf_deep_sleep_allow,
+			bypass_clks[(int) regs_and_bypass->dcfclk_bypass]);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "dprefclk,%d,N/A,N/A,%s\n",
+			regs_and_bypass->dprefclk,
+			bypass_clks[(int) regs_and_bypass->dprefclk_bypass]);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "dispclk,%d,N/A,N/A,%s\n",
+			regs_and_bypass->dispclk,
+			bypass_clks[(int) regs_and_bypass->dispclk_bypass]);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		//split
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "SPLIT\n");
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		// REGISTER VALUES
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "reg_name,value,clk_type\n");
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK3_CURRENT_CNT,%d,dcfclk\n",
+				internal.CLK1_CLK3_CURRENT_CNT);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK3_DS_CNTL,%d,dcf_deep_sleep_divider\n",
+					internal.CLK1_CLK3_DS_CNTL);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK3_ALLOW_DS,%d,dcf_deep_sleep_allow\n",
+					internal.CLK1_CLK3_ALLOW_DS);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK2_CURRENT_CNT,%d,dprefclk\n",
+					internal.CLK1_CLK2_CURRENT_CNT);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK0_CURRENT_CNT,%d,dispclk\n",
+					internal.CLK1_CLK0_CURRENT_CNT);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK1_CURRENT_CNT,%d,dppclk\n",
+					internal.CLK1_CLK1_CURRENT_CNT);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK3_BYPASS_CNTL,%d,dcfclk_bypass\n",
+					internal.CLK1_CLK3_BYPASS_CNTL);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK2_BYPASS_CNTL,%d,dprefclk_bypass\n",
+					internal.CLK1_CLK2_BYPASS_CNTL);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK0_BYPASS_CNTL,%d,dispclk_bypass\n",
+					internal.CLK1_CLK0_BYPASS_CNTL);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+
+		chars_printed = snprintf_count(log_info->pBuf, remaining_buffer, "CLK1_CLK1_BYPASS_CNTL,%d,dppclk_bypass\n",
+					internal.CLK1_CLK1_BYPASS_CNTL);
+		remaining_buffer -= chars_printed;
+		*log_info->sum_chars_printed += chars_printed;
+		log_info->pBuf += chars_printed;
+	}
+}
+
+/* This function produce translated logical clk state values*/
+void vg_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *s)
+{
+
+	struct clk_state_registers_and_bypass sb = { 0 };
+	struct clk_log_info log_info = { 0 };
+
+	vg_dump_clk_registers(&sb, clk_mgr_base, &log_info);
+
+	s->dprefclk_khz = sb.dprefclk * 1000;
+}
+
+void vg_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	dcn301_smu_enable_pme_wa(clk_mgr);
+}
+
+void vg_init_clocks(struct clk_mgr *clk_mgr)
+{
+	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
+	// Assumption is that boot state always supports pstate
+	clk_mgr->clks.p_state_change_support = true;
+	clk_mgr->clks.prev_p_state_change_support = true;
+	clk_mgr->clks.pwr_state = DCN_PWR_STATE_UNKNOWN;
+}
+
+static void vg_build_watermark_ranges(struct clk_bw_params *bw_params, struct watermarks *table)
+{
+	int i, num_valid_sets;
+
+	num_valid_sets = 0;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		/* skip empty entries, the smu array has no holes*/
+		if (!bw_params->wm_table.entries[i].valid)
+			continue;
+
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmSetting = bw_params->wm_table.entries[i].wm_inst;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType = bw_params->wm_table.entries[i].wm_type;
+		/* We will not select WM based on fclk, so leave it as unconstrained */
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+		if (table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType == WM_TYPE_PSTATE_CHG) {
+			if (i == 0)
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk = 0;
+			else {
+				/* add 1 to make it non-overlapping with next lvl */
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk =
+						bw_params->clk_table.entries[i - 1].dcfclk_mhz + 1;
+			}
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxMclk =
+					bw_params->clk_table.entries[i].dcfclk_mhz;
+
+		} else {
+			/* unconstrained for memory retraining */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+			/* Modify previous watermark range to cover up to max */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+		}
+		num_valid_sets++;
+	}
+
+	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+
+	/* modify the min and max to make sure we cover the whole range*/
+	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_DCFCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxMclk = 0xFFFF;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+
+	/* This is for writeback only, does not matter currently as no writeback support*/
+	table->WatermarkRow[WM_SOCCLK][0].WmSetting = WM_A;
+	table->WatermarkRow[WM_SOCCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxClock = 0xFFFF;
+	table->WatermarkRow[WM_SOCCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxMclk = 0xFFFF;
+}
+
+
+void vg_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct watermarks *table = clk_mgr_base->smu_wm_set.wm_set;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || clk_mgr_base->smu_wm_set.mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	vg_build_watermark_ranges(clk_mgr_base->bw_params, table);
+
+	dcn301_smu_set_dram_addr_high(clk_mgr,
+			clk_mgr_base->smu_wm_set.mc_address.high_part);
+	dcn301_smu_set_dram_addr_low(clk_mgr,
+			clk_mgr_base->smu_wm_set.mc_address.low_part);
+	dcn301_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+static bool vg_are_clock_states_equal(struct dc_clocks *a,
+		struct dc_clocks *b)
+{
+	if (a->dispclk_khz != b->dispclk_khz)
+		return false;
+	else if (a->dppclk_khz != b->dppclk_khz)
+		return false;
+	else if (a->dcfclk_khz != b->dcfclk_khz)
+		return false;
+	else if (a->dcfclk_deep_sleep_khz != b->dcfclk_deep_sleep_khz)
+		return false;
+
+	return true;
+}
+
+
+static struct clk_mgr_funcs vg_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = vg_update_clocks,
+	.init_clocks = vg_init_clocks,
+	.enable_pme_wa = vg_enable_pme_wa,
+	.are_clock_states_equal = vg_are_clock_states_equal,
+	.notify_wm_ranges = vg_notify_wm_ranges
+};
+
+static struct clk_bw_params vg_bw_params = {
+	.vram_type = Ddr4MemType,
+	.num_channels = 1,
+	.clk_table = {
+		.entries = {
+			{
+				.voltage = 0,
+				.dcfclk_mhz = 400,
+				.fclk_mhz = 400,
+				.memclk_mhz = 800,
+				.socclk_mhz = 0,
+			},
+			{
+				.voltage = 0,
+				.dcfclk_mhz = 483,
+				.fclk_mhz = 800,
+				.memclk_mhz = 1600,
+				.socclk_mhz = 0,
+			},
+			{
+				.voltage = 0,
+				.dcfclk_mhz = 602,
+				.fclk_mhz = 1067,
+				.memclk_mhz = 1067,
+				.socclk_mhz = 0,
+			},
+			{
+				.voltage = 0,
+				.dcfclk_mhz = 738,
+				.fclk_mhz = 1333,
+				.memclk_mhz = 1600,
+				.socclk_mhz = 0,
+			},
+		},
+
+		.num_entries = 4,
+	},
+
+};
+
+static struct wm_table ddr4_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 6.09,
+			.sr_enter_plus_exit_time_us = 7.14,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+	}
+};
+
+static struct wm_table lpddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 5.32,
+			.sr_enter_plus_exit_time_us = 6.38,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.82,
+			.sr_enter_plus_exit_time_us = 11.196,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.89,
+			.sr_enter_plus_exit_time_us = 11.24,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.748,
+			.sr_enter_plus_exit_time_us = 11.102,
+			.valid = true,
+		},
+	}
+};
+
+
+static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_table,
+		unsigned int voltage)
+{
+	int i;
+
+	for (i = 0; i < VG_NUM_SOC_VOLTAGE_LEVELS; i++) {
+		if (clock_table->SocVoltage[i] == voltage)
+			return clock_table->DcfClocks[i];
+	}
+
+	ASSERT(0);
+	return 0;
+}
+
+static void vg_clk_mgr_helper_populate_bw_params(
+		struct clk_mgr_internal *clk_mgr,
+		struct integrated_info *bios_info,
+		const struct vg_dpm_clocks *clock_table)
+{
+	int i, j;
+	struct clk_bw_params *bw_params = clk_mgr->base.bw_params;
+
+	j = -1;
+
+	ASSERT(VG_NUM_FCLK_DPM_LEVELS <= MAX_NUM_DPM_LVL);
+
+	/* Find lowest DPM, FCLK is filled in reverse order*/
+
+	for (i = VG_NUM_FCLK_DPM_LEVELS - 1; i >= 0; i--) {
+		if (clock_table->DfPstateTable[i].fclk != 0) {
+			j = i;
+			break;
+		}
+	}
+
+	if (j == -1) {
+		/* clock table is all 0s, just use our own hardcode */
+		ASSERT(0);
+		return;
+	}
+
+	bw_params->clk_table.num_entries = j + 1;
+
+	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
+		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].fclk;
+		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].memclk;
+		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].voltage;
+		bw_params->clk_table.entries[i].dcfclk_mhz = find_dcfclk_for_voltage(clock_table, clock_table->DfPstateTable[j].voltage);
+	}
+
+	bw_params->vram_type = bios_info->memory_type;
+	bw_params->num_channels = bios_info->ma_channel_number;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		bw_params->wm_table.entries[i].wm_inst = i;
+
+		if (i >= bw_params->clk_table.num_entries) {
+			bw_params->wm_table.entries[i].valid = false;
+			continue;
+		}
+
+		bw_params->wm_table.entries[i].wm_type = WM_TYPE_PSTATE_CHG;
+		bw_params->wm_table.entries[i].valid = true;
+	}
+
+	if (bw_params->vram_type == LpDdr4MemType) {
+		/*
+		 * WM set D will be re-purposed for memory retraining
+		 */
+		bw_params->wm_table.entries[WM_D].pstate_latency_us = LPDDR_MEM_RETRAIN_LATENCY;
+		bw_params->wm_table.entries[WM_D].wm_inst = WM_D;
+		bw_params->wm_table.entries[WM_D].wm_type = WM_TYPE_RETRAINING;
+		bw_params->wm_table.entries[WM_D].valid = true;
+	}
+
+}
+
+/* Temporary Place holder until we can get them from fuse */
+static struct vg_dpm_clocks dummy_clocks = {
+		.DcfClocks = { 201, 403, 403, 403, 403, 403, 403 },
+		.SocClocks = { 400, 600, 600, 600, 600, 600, 600 },
+		.SocVoltage = { 2800, 2860, 2860, 2860, 2860, 2860, 2860, 2860 },
+		.DfPstateTable = {
+				{ .fclk = 400,  .memclk = 400, .voltage = 2800 },
+				{ .fclk = 400,  .memclk = 400, .voltage = 2800 },
+				{ .fclk = 400,  .memclk = 400, .voltage = 2800 },
+				{ .fclk = 400,  .memclk = 400, .voltage = 2800 }
+		}
+};
+
+static struct watermarks dummy_wms = { 0 };
+
+static void vg_get_dpm_table_from_smu(struct clk_mgr_internal *clk_mgr,
+		struct smu_dpm_clks *smu_dpm_clks)
+{
+	struct vg_dpm_clocks *table = smu_dpm_clks->dpm_clks;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || smu_dpm_clks->mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn301_smu_set_dram_addr_high(clk_mgr,
+			smu_dpm_clks->mc_address.high_part);
+	dcn301_smu_set_dram_addr_low(clk_mgr,
+			smu_dpm_clks->mc_address.low_part);
+	dcn301_smu_transfer_dpm_table_smu_2_dram(clk_mgr);
+}
+
+void vg_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	struct smu_dpm_clks smu_dpm_clks = { 0 };
+
+	clk_mgr->base.ctx = ctx;
+	clk_mgr->base.funcs = &vg_funcs;
+
+	clk_mgr->pp_smu = pp_smu;
+
+	clk_mgr->dccg = dccg;
+	clk_mgr->dfs_bypass_disp_clk = 0;
+
+	clk_mgr->dprefclk_ss_percentage = 0;
+	clk_mgr->dprefclk_ss_divider = 1000;
+	clk_mgr->ss_on_dprefclk = false;
+	clk_mgr->dfs_ref_freq_khz = 48000;
+
+	clk_mgr->base.smu_wm_set.wm_set = (struct watermarks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct watermarks),
+				&clk_mgr->base.smu_wm_set.mc_address.quad_part);
+
+	if (clk_mgr->base.smu_wm_set.wm_set == 0) {
+		clk_mgr->base.smu_wm_set.wm_set = &dummy_wms;
+		clk_mgr->base.smu_wm_set.mc_address.quad_part = 0;
+	}
+	ASSERT(clk_mgr->base.smu_wm_set.wm_set);
+
+	smu_dpm_clks.dpm_clks = (struct vg_dpm_clocks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct vg_dpm_clocks),
+				&smu_dpm_clks.mc_address.quad_part);
+
+	if (smu_dpm_clks.dpm_clks == NULL) {
+		smu_dpm_clks.dpm_clks = &dummy_clocks;
+		smu_dpm_clks.mc_address.quad_part = 0;
+	}
+
+	ASSERT(smu_dpm_clks.dpm_clks);
+
+	if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment)) {
+		vg_funcs.update_clocks = dcn2_update_clocks_fpga;
+		clk_mgr->base.dentist_vco_freq_khz = 3600000;
+	} else {
+		struct clk_log_info log_info = {0};
+
+		clk_mgr->smu_ver = dcn301_smu_get_smu_version(clk_mgr);
+
+		if (clk_mgr->smu_ver)
+			clk_mgr->smu_present = true;
+
+		/* TODO: Check we get what we expect during bringup */
+		clk_mgr->base.dentist_vco_freq_khz = get_vco_frequency_from_reg(clk_mgr);
+
+		/* in case we don't get a value from the register, use default */
+		if (clk_mgr->base.dentist_vco_freq_khz == 0)
+			clk_mgr->base.dentist_vco_freq_khz = 3600000;
+
+		if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType) {
+			vg_bw_params.wm_table = lpddr5_wm_table;
+		} else {
+			vg_bw_params.wm_table = ddr4_wm_table;
+		}
+		/* Saved clocks configured at boot for debug purposes */
+		vg_dump_clk_registers(&clk_mgr->base.boot_snapshot, &clk_mgr->base, &log_info);
+	}
+
+	clk_mgr->base.dprefclk_khz = 600000;
+	dce_clock_read_ss_info(clk_mgr);
+
+	clk_mgr->base.bw_params = &vg_bw_params;
+
+	vg_get_dpm_table_from_smu(clk_mgr, &smu_dpm_clks);
+	if (ctx->dc_bios && ctx->dc_bios->integrated_info) {
+		vg_clk_mgr_helper_populate_bw_params(
+				clk_mgr,
+				ctx->dc_bios->integrated_info,
+				smu_dpm_clks.dpm_clks);
+	}
+
+	if (smu_dpm_clks.dpm_clks && smu_dpm_clks.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				smu_dpm_clks.dpm_clks);
+/*
+	if (!IS_FPGA_MAXIMUS_DC(ctx->dce_environment) && clk_mgr->smu_ver) {
+		 enable powerfeatures when displaycount goes to 0
+		dcn301_smu_enable_phy_refclk_pwrdwn(clk_mgr, !debug->disable_48mhz_pwrdwn);
+	}
+*/
+}
+
+void vg_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
+{
+	if (clk_mgr->base.smu_wm_set.wm_set && clk_mgr->base.smu_wm_set.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				clk_mgr->base.smu_wm_set.wm_set);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
new file mode 100644
index 000000000000..80497df20ba7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
@@ -0,0 +1,43 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __VG_CLK_MGR_H__
+#define __VG_CLK_MGR_H__
+
+int vg_get_active_display_cnt_wa(
+		struct dc *dc,
+		struct dc_state *context);
+
+void vg_enable_pme_wa(struct clk_mgr *clk_mgr_base);
+
+void vg_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void vg_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr);
+
+void vg_notify_wm_ranges(struct clk_mgr *clk_mgr_base);
+#endif //__VG_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index e430148e47cf..f240576a87a2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -58,6 +58,9 @@
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #include "../dcn30/dcn30_resource.h"
 #endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#include "../dcn301/dcn301_resource.h"
+#endif
 
 #define DC_LOGGER_INIT(logger)
 
@@ -130,6 +133,12 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 			dc_version = DCN_VERSION_3_0;
 #endif
 		break;
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case FAMILY_VGH:
+		dc_version = DCN_VERSION_3_01;
+		break;
+#endif
 	default:
 		dc_version = DCE_VERSION_UNKNOWN;
 		break;
@@ -210,6 +219,11 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 		break;
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case DCN_VERSION_3_01:
+		res_pool = dcn301_create_resource_pool(init_data, dc);
+		break;
+#endif
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
index e84d21605854..389ca0d54d1b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
@@ -82,6 +82,22 @@
 	SR(DC_ABM1_ACE_THRES_12), \
 	NBIO_SR(BIOS_SCRATCH_2)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define ABM_DCN301_REG_LIST(id)\
+	ABM_COMMON_REG_LIST_DCE_BASE(), \
+	SRI(DC_ABM1_HG_SAMPLE_RATE, ABM, id), \
+	SRI(DC_ABM1_LS_SAMPLE_RATE, ABM, id), \
+	SRI(BL1_PWM_BL_UPDATE_SAMPLE_RATE, ABM, id), \
+	SRI(DC_ABM1_HG_MISC_CTRL, ABM, id), \
+	SRI(DC_ABM1_IPCSC_COEFF_SEL, ABM, id), \
+	SRI(BL1_PWM_CURRENT_ABM_LEVEL, ABM, id), \
+	SRI(BL1_PWM_TARGET_ABM_LEVEL, ABM, id), \
+	SRI(BL1_PWM_USER_LEVEL, ABM, id), \
+	SRI(DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, ABM, id), \
+	SRI(DC_ABM1_HGLS_REG_READ_PROGRESS, ABM, id), \
+	NBIO_SR(BIOS_SCRATCH_2)
+#endif
+
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define ABM_DCN30_REG_LIST(id)\
 	ABM_COMMON_REG_LIST_DCE_BASE(), \
@@ -173,7 +189,7 @@
 
 #define ABM_MASK_SH_LIST_DCN20(mask_sh) ABM_MASK_SH_LIST_DCE110(mask_sh)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define ABM_MASK_SH_LIST_DCN301(mask_sh) ABM_MASK_SH_LIST_DCN10(mask_sh)
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 9cc65dc1970f..512b26b3e3fd 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -1554,3 +1554,21 @@ bool dcn3_clk_src_construct(
 	return ret;
 }
 #endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+bool dcn301_clk_src_construct(
+	struct dce110_clk_src *clk_src,
+	struct dc_context *ctx,
+	struct dc_bios *bios,
+	enum clock_source_id id,
+	const struct dce110_clk_src_regs *regs,
+	const struct dce110_clk_src_shift *cs_shift,
+	const struct dce110_clk_src_mask *cs_mask)
+{
+	bool ret = dce112_clk_src_construct(clk_src, ctx, bios, id, regs, cs_shift, cs_mask);
+
+	clk_src->base.funcs = &dcn3_clk_src_funcs;
+
+	return ret;
+}
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
index 69b904ab8151..41e6f7ea2138 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -108,6 +108,23 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define CS_COMMON_REG_LIST_DCN3_01(index, pllid) \
+		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
+		SRII(PHASE, DP_DTO, 0),\
+		SRII(PHASE, DP_DTO, 1),\
+		SRII(PHASE, DP_DTO, 2),\
+		SRII(PHASE, DP_DTO, 3),\
+		SRII(MODULO, DP_DTO, 0),\
+		SRII(MODULO, DP_DTO, 1),\
+		SRII(MODULO, DP_DTO, 2),\
+		SRII(MODULO, DP_DTO, 3),\
+		SRII(PIXEL_RATE_CNTL, OTG, 0),\
+		SRII(PIXEL_RATE_CNTL, OTG, 1),\
+		SRII(PIXEL_RATE_CNTL, OTG, 2),\
+		SRII(PIXEL_RATE_CNTL, OTG, 3)
+#endif
+
 #define CS_COMMON_MASK_SH_LIST_DCN2_0(mask_sh)\
 	CS_SF(DP_DTO0_PHASE, DP_DTO0_PHASE, mask_sh),\
 	CS_SF(DP_DTO0_MODULO, DP_DTO0_MODULO, mask_sh),\
@@ -232,6 +249,17 @@ bool dcn3_clk_src_construct(
 	const struct dce110_clk_src_mask *cs_mask);
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+bool dcn301_clk_src_construct(
+	struct dce110_clk_src *clk_src,
+	struct dc_context *ctx,
+	struct dc_bios *bios,
+	enum clock_source_id id,
+	const struct dce110_clk_src_regs *regs,
+	const struct dce110_clk_src_shift *cs_shift,
+	const struct dce110_clk_src_mask *cs_mask);
+#endif
+
 /* this table is use to find *1.001 and /1.001 pixel rates from non-precise pixel rate */
 struct pixel_rate_range_table_entry {
 	unsigned int range_min_khz;
@@ -246,4 +274,5 @@ extern const struct pixel_rate_range_table_entry video_optimized_pixel_rates[];
 const struct pixel_rate_range_table_entry *look_up_in_video_optimized_rate_tlb(
 		unsigned int pixel_rate_khz);
 #endif
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index 70bbc1311327..49e1a4c72684 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -224,28 +224,6 @@
 	SR(VGA_TEST_CONTROL), \
 	SR(DC_IP_REQUEST_CNTL)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-#define HWSEQ_DCN30_REG_LIST()\
-	HWSEQ_DCN2_REG_LIST(),\
-	HWSEQ_DCN_REG_LIST(), \
-	HWSEQ_PIXEL_RATE_REG_LIST_3(OTG), \
-	HWSEQ_PHYPLL_REG_LIST_3(OTG), \
-	SR(MICROSECOND_TIME_BASE_DIV), \
-	SR(MILLISECOND_TIME_BASE_DIV), \
-	SR(DISPCLK_FREQ_CHANGE_CNTL), \
-	SR(RBBMIF_TIMEOUT_DIS), \
-	SR(RBBMIF_TIMEOUT_DIS_2), \
-	SR(DCHUBBUB_CRC_CTRL), \
-	SR(DPP_TOP0_DPP_CRC_CTRL), \
-	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
-	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
-	SR(MPC_CRC_CTRL), \
-	SR(MPC_CRC_RESULT_GB), \
-	SR(MPC_CRC_RESULT_C), \
-	SR(MPC_CRC_RESULT_AR), \
-	SR(AZALIA_AUDIO_DTO), \
-	SR(AZALIA_CONTROLLER_CLOCK_GATING)
-#endif
 #define HWSEQ_DCN2_REG_LIST()\
 	HWSEQ_DCN_REG_LIST(), \
 	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 0), \
@@ -361,6 +339,93 @@
 	SR(D6VGA_CONTROL), \
 	SR(DC_IP_REQUEST_CNTL)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_DCN30_REG_LIST()\
+	HWSEQ_DCN2_REG_LIST(),\
+	HWSEQ_DCN_REG_LIST(), \
+	HWSEQ_PIXEL_RATE_REG_LIST_3(OTG), \
+	HWSEQ_PHYPLL_REG_LIST_3(OTG), \
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING)
+#endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define HWSEQ_DCN301_REG_LIST()\
+	SR(REFCLK_CNTL), \
+	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
+	SR(DIO_MEM_PWR_CTRL), \
+	SR(DCCG_GATE_DISABLE_CNTL), \
+	SR(DCCG_GATE_DISABLE_CNTL2), \
+	SR(DCFCLK_CNTL),\
+	SR(DCFCLK_CNTL), \
+	SR(DC_MEM_GLOBAL_PWR_REQ_CNTL), \
+	SRII(PIXEL_RATE_CNTL, OTG, 0), \
+	SRII(PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PIXEL_RATE_CNTL, OTG, 3),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 0),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 3),\
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(DOMAIN0_PG_CONFIG), \
+	SR(DOMAIN1_PG_CONFIG), \
+	SR(DOMAIN2_PG_CONFIG), \
+	SR(DOMAIN3_PG_CONFIG), \
+	SR(DOMAIN4_PG_CONFIG), \
+	SR(DOMAIN5_PG_CONFIG), \
+	SR(DOMAIN6_PG_CONFIG), \
+	SR(DOMAIN7_PG_CONFIG), \
+	SR(DOMAIN16_PG_CONFIG), \
+	SR(DOMAIN17_PG_CONFIG), \
+	SR(DOMAIN18_PG_CONFIG), \
+	SR(DOMAIN0_PG_STATUS), \
+	SR(DOMAIN1_PG_STATUS), \
+	SR(DOMAIN2_PG_STATUS), \
+	SR(DOMAIN3_PG_STATUS), \
+	SR(DOMAIN4_PG_STATUS), \
+	SR(DOMAIN5_PG_STATUS), \
+	SR(DOMAIN6_PG_STATUS), \
+	SR(DOMAIN7_PG_STATUS), \
+	SR(DOMAIN16_PG_STATUS), \
+	SR(DOMAIN17_PG_STATUS), \
+	SR(DOMAIN18_PG_STATUS), \
+	SR(D1VGA_CONTROL), \
+	SR(D2VGA_CONTROL), \
+	SR(D3VGA_CONTROL), \
+	SR(D4VGA_CONTROL), \
+	SR(D5VGA_CONTROL), \
+	SR(D6VGA_CONTROL), \
+	SR(DC_IP_REQUEST_CNTL), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING)
+#endif
+
 struct dce_hwseq_registers {
 	uint32_t DCFE_CLOCK_CONTROL[6];
 	uint32_t DCFEV_CLOCK_CONTROL;
@@ -598,12 +663,6 @@ struct dce_hwseq_registers {
 	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_ENABLE, mask_sh),\
 	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_RENDER_START, mask_sh)
 
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-#define HWSEQ_DCN30_MASK_SH_LIST(mask_sh)\
-	HWSEQ_DCN2_MASK_SH_LIST(mask_sh), \
-	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
-#endif
-
 #define HWSEQ_DCN2_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
 	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
@@ -703,6 +762,57 @@ struct dce_hwseq_registers {
 	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN18_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_DCN30_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN2_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
+#endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define HWSEQ_DCN301_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN0_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN0_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN1_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN1_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN2_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN2_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN3_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN3_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN4_PG_CONFIG, DOMAIN4_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN4_PG_CONFIG, DOMAIN4_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN5_PG_CONFIG, DOMAIN5_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN5_PG_CONFIG, DOMAIN5_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN6_PG_CONFIG, DOMAIN6_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN6_PG_CONFIG, DOMAIN6_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN7_PG_CONFIG, DOMAIN7_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN7_PG_CONFIG, DOMAIN7_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN16_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN16_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN17_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN17_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN18_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN18_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN0_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN1_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN2_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN3_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN4_PG_STATUS, DOMAIN4_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN5_PG_STATUS, DOMAIN5_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN6_PG_STATUS, DOMAIN6_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN7_PG_STATUS, DOMAIN7_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN16_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN17_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN18_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, PANEL_PWRSEQ0_CNTL, PANEL_BLON, mask_sh),\
+	HWS_SF(, PANEL_PWRSEQ0_CNTL, PANEL_DIGON, mask_sh),\
+	HWS_SF(, PANEL_PWRSEQ0_CNTL, PANEL_DIGON_OVRD, mask_sh),\
+	HWS_SF(, PANEL_PWRSEQ0_STATE, PANEL_PWRSEQ_TARGET_STATE_R, mask_sh),\
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
+#endif
+
 #define HWSEQ_REG_FIELD_LIST(type) \
 	type DCFE_CLOCK_ENABLE; \
 	type DCFEV_CLOCK_ENABLE; \
@@ -817,14 +927,39 @@ struct dce_hwseq_registers {
 	type D4VGA_MODE_ENABLE; \
 	type AZALIA_AUDIO_DTO_MODULE;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define HWSEQ_DCN3_REG_FIELD_LIST(type) \
+	type HPO_HDMISTREAMCLK_GATE_DIS;
+#endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define HWSEQ_DCN301_REG_FIELD_LIST(type) \
+	type PANEL_BLON;\
+	type PANEL_DIGON;\
+	type PANEL_DIGON_OVRD;\
+	type PANEL_PWRSEQ_TARGET_STATE_R;
+#endif
+
 struct dce_hwseq_shift {
 	HWSEQ_REG_FIELD_LIST(uint8_t)
 	HWSEQ_DCN_REG_FIELD_LIST(uint8_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	HWSEQ_DCN3_REG_FIELD_LIST(uint8_t)
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	HWSEQ_DCN301_REG_FIELD_LIST(uint8_t)
+#endif
 };
 
 struct dce_hwseq_mask {
 	HWSEQ_REG_FIELD_LIST(uint32_t)
 	HWSEQ_DCN_REG_FIELD_LIST(uint32_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	HWSEQ_DCN3_REG_FIELD_LIST(uint32_t)
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	HWSEQ_DCN301_REG_FIELD_LIST(uint32_t)
+#endif
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
index 04dabed5f1c5..1ac734d0d5e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
@@ -449,14 +449,32 @@ struct dcn10_link_enc_registers {
 	type AUX_RX_TIMEOUT_LEN;\
 	type AUX_RX_TIMEOUT_LEN_MUL
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+#define DCN30_LINK_ENCODER_REG_FIELD_LIST(type) \
+	type TMDS_SYNC_DCBAL_EN;\
+	type PHY_HPO_DIG_SRC_SEL;\
+	type PHY_HPO_ENC_SRC_SEL;\
+	type DPCS_TX_HDMI_FRL_MODE;\
+	type DPCS_TX_DATA_SWAP_10_BIT;\
+	type DPCS_TX_DATA_ORDER_INVERT_18_BIT;\
+	type RDPCS_TX_CLK_EN
+#endif
+
 struct dcn10_link_enc_shift {
 	DCN_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
 	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
+#endif
 };
 
 struct dcn10_link_enc_mask {
 	DCN_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
 	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
+#endif
 };
 
 struct dcn10_link_encoder {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c
index 982732dec133..2c68a246fa83 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c
@@ -384,6 +384,16 @@ void hubbub3_force_wm_propagate_to_pipes(struct hubbub *hubbub)
 			DCHUBBUB_ARB_VM_ROW_URGENCY_WATERMARK_A, prog_wm_value);
 }
 
+void hubbub3_force_pstate_change_control(struct hubbub *hubbub,
+		bool force, bool allow)
+{
+	struct dcn20_hubbub *hubbub1 = TO_DCN20_HUBBUB(hubbub);
+
+	REG_UPDATE_2(DCHUBBUB_ARB_DRAM_STATE_CNTL,
+			DCHUBBUB_ARB_ALLOW_PSTATE_CHANGE_FORCE_VALUE, allow,
+			DCHUBBUB_ARB_ALLOW_PSTATE_CHANGE_FORCE_ENABLE, force);
+}
+
 static const struct hubbub_funcs hubbub30_funcs = {
 	.update_dchub = hubbub2_update_dchub,
 	.init_dchub_sys_ctx = hubbub3_init_dchub_sys_ctx,
@@ -397,6 +407,7 @@ static const struct hubbub_funcs hubbub30_funcs = {
 	.allow_self_refresh_control = hubbub1_allow_self_refresh_control,
 	.is_allow_self_refresh_enabled = hubbub1_is_allow_self_refresh_enabled,
 	.force_wm_propagate_to_pipes = hubbub3_force_wm_propagate_to_pipes,
+	.force_pstate_change_control = hubbub3_force_pstate_change_control,
 };
 
 void hubbub3_construct(struct dcn20_hubbub *hubbub3,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h
index 790baa00672b..38f1d2fd939b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h
@@ -116,4 +116,7 @@ bool hubbub3_program_watermarks(
 		unsigned int refclk_mhz,
 		bool safe_to_lower);
 
+void hubbub3_force_pstate_change_control(struct hubbub *hubbub,
+		bool force, bool allow);
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
index fd1fb3c531d1..67f5776b5f3a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
@@ -251,6 +251,11 @@ bool hubp3_construct(
 		const struct dcn_hubp2_shift *hubp_shift,
 		const struct dcn_hubp2_mask *hubp_mask);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
+	struct vm_system_aperture_param *apt);
+#endif
+
 bool hubp3_program_surface_flip_and_addr(
 	struct hubp *hubp,
 	const struct dc_plane_address *address,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index dde87baf1370..ac57c3b14bc5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -2127,7 +2127,7 @@ static bool dcn30_internal_validate_bw(
 	return out;
 }
 
-static void dcn30_calculate_wm(
+void dcn30_calculate_wm(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int pipe_cnt,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
index c9d5f94092a0..1773df07e30a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
@@ -55,6 +55,11 @@ unsigned int dcn30_calc_max_scaled_time(
 
 bool dcn30_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		bool fast_validate);
+void dcn30_calculate_wm(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel);
 void dcn30_populate_dml_writeback_from_context(
 		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/Makefile b/drivers/gpu/drm/amd/display/dc/dcn301/Makefile
new file mode 100644
index 000000000000..2fd5d34e4ba6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/Makefile
@@ -0,0 +1,47 @@
+#
+# (c) Copyright 2020 Advanced Micro Devices, Inc. All the rights reserved
+#
+#  All rights reserved.  This notice is intended as a precaution against
+#  inadvertent publication and does not imply publication or any waiver
+#  of confidentiality.  The year included in the foregoing notice is the
+#  year of creation of the work.
+#
+#  Authors: AMD
+#
+# Makefile for dcn30.
+
+DCN301 = dcn301_init.o dcn301_resource.o dcn301_dccg.o \
+		dcn301_dio_link_encoder.o dcn301_hwseq.o dcn301_panel_cntl.o dcn301_hubbub.o
+
+ifdef CONFIG_X86
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o := -mgeneral-regs-only
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o += -msse2
+endif
+endif
+
+AMD_DAL_DCN301 = $(addprefix $(AMDDALPATH)/dc/dcn301/,$(DCN301))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN301)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c
new file mode 100644
index 000000000000..420da414929c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c
@@ -0,0 +1,75 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dcn301_dccg.h"
+
+#define TO_DCN_DCCG(dccg)\
+	container_of(dccg, struct dcn_dccg, base)
+
+#define REG(reg) \
+	(dccg_dcn->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dccg_dcn->dccg_shift->field_name, dccg_dcn->dccg_mask->field_name
+
+#define CTX \
+	dccg_dcn->base.ctx
+#define DC_LOGGER \
+	dccg->ctx->logger
+
+static const struct dccg_funcs dccg301_funcs = {
+	.update_dpp_dto = dccg2_update_dpp_dto,
+	.get_dccg_ref_freq = dccg2_get_dccg_ref_freq,
+	.dccg_init = dccg2_init
+};
+
+struct dccg *dccg301_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask)
+{
+	struct dcn_dccg *dccg_dcn = kzalloc(sizeof(*dccg_dcn), GFP_KERNEL);
+	struct dccg *base;
+
+	if (dccg_dcn == NULL) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	base = &dccg_dcn->base;
+	base->ctx = ctx;
+	base->funcs = &dccg301_funcs;
+
+	dccg_dcn->regs = regs;
+	dccg_dcn->dccg_shift = dccg_shift;
+	dccg_dcn->dccg_mask = dccg_mask;
+
+	return &dccg_dcn->base;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
new file mode 100644
index 000000000000..73db962dbc03
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN301_DCCG_H__
+#define __DCN301_DCCG_H__
+
+#include "dcn20/dcn20_dccg.h"
+
+#define DCCG_REG_LIST_DCN301() \
+	SR(DPPCLK_DTO_CTRL),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 0),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 1),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 2),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 3),\
+	SR(REFCLK_CNTL)
+
+#define DCCG_MASK_SH_LIST_DCN301(mask_sh) \
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 0, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 0, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 1, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 1, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 2, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 2, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 3, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 3, mask_sh),\
+	DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_PHASE, mask_sh),\
+	DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_MODULO, mask_sh),\
+	DCCG_SF(REFCLK_CNTL, REFCLK_CLOCK_EN, mask_sh),\
+	DCCG_SF(REFCLK_CNTL, REFCLK_SRC_SEL, mask_sh)
+
+struct dccg *dccg301_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask);
+
+struct dccg *dccg301_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask);
+
+#endif //__DCN301_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
new file mode 100644
index 000000000000..c9fbaed23965
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
@@ -0,0 +1,192 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "reg_helper.h"
+
+#include "core_types.h"
+#include "link_encoder.h"
+#include "dcn301_dio_link_encoder.h"
+#include "stream_encoder.h"
+#include "i2caux_interface.h"
+#include "dc_bios_types.h"
+#include "gpio_service_interface.h"
+
+#define CTX \
+	enc10->base.ctx
+#define DC_LOGGER \
+	enc10->base.ctx->logger
+
+#define REG(reg)\
+	(enc10->link_regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc10->link_shift->field_name, enc10->link_mask->field_name
+
+#define IND_REG(index) \
+	(enc10->link_regs->index)
+
+static const struct link_encoder_funcs dcn301_link_enc_funcs = {
+	.read_state = link_enc2_read_state,
+	.validate_output_with_stream = dcn10_link_encoder_validate_output_with_stream,
+	.hw_init = enc3_hw_init,
+	.setup = dcn10_link_encoder_setup,
+	.enable_tmds_output = dcn10_link_encoder_enable_tmds_output,
+	.enable_dp_output = dcn20_link_encoder_enable_dp_output,
+	.enable_dp_mst_output = dcn10_link_encoder_enable_dp_mst_output,
+	.disable_output = dcn10_link_encoder_disable_output,
+	.dp_set_lane_settings = dcn10_link_encoder_dp_set_lane_settings,
+	.dp_set_phy_pattern = dcn10_link_encoder_dp_set_phy_pattern,
+	.update_mst_stream_allocation_table = dcn10_link_encoder_update_mst_stream_allocation_table,
+	.psr_program_dp_dphy_fast_training = dcn10_psr_program_dp_dphy_fast_training,
+	.psr_program_secondary_packet = dcn10_psr_program_secondary_packet,
+	.connect_dig_be_to_fe = dcn10_link_encoder_connect_dig_be_to_fe,
+	.enable_hpd = dcn10_link_encoder_enable_hpd,
+	.disable_hpd = dcn10_link_encoder_disable_hpd,
+	.is_dig_enabled = dcn10_is_dig_enabled,
+	.destroy = dcn10_link_encoder_destroy,
+	.fec_set_enable = enc2_fec_set_enable,
+	.fec_set_ready = enc2_fec_set_ready,
+	.fec_is_active = enc2_fec_is_active,
+	.get_dig_frontend = dcn10_get_dig_frontend,
+	.get_dig_mode = dcn10_get_dig_mode,
+	.is_in_alt_mode = dcn20_link_encoder_is_in_alt_mode,
+	.get_max_link_cap = dcn20_link_encoder_get_max_link_cap,
+};
+
+void dcn301_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask)
+{
+	struct bp_encoder_cap_info bp_cap_info = {0};
+	const struct dc_vbios_funcs *bp_funcs = init_data->ctx->dc_bios->funcs;
+	enum bp_result result = BP_RESULT_OK;
+	struct dcn10_link_encoder *enc10 = &enc20->enc10;
+
+	enc10->base.funcs = &dcn301_link_enc_funcs;
+	enc10->base.ctx = init_data->ctx;
+	enc10->base.id = init_data->encoder;
+
+	enc10->base.hpd_source = init_data->hpd_source;
+	enc10->base.connector = init_data->connector;
+
+	enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+
+	enc10->base.features = *enc_features;
+
+	enc10->base.transmitter = init_data->transmitter;
+
+	/* set the flag to indicate whether driver poll the I2C data pin
+	 * while doing the DP sink detect
+	 */
+
+/*	if (dal_adapter_service_is_feature_supported(as,
+		FEATURE_DP_SINK_DETECT_POLL_DATA_PIN))
+		enc10->base.features.flags.bits.
+			DP_SINK_DETECT_POLL_DATA_PIN = true;*/
+
+	enc10->base.output_signals =
+		SIGNAL_TYPE_DVI_SINGLE_LINK |
+		SIGNAL_TYPE_DVI_DUAL_LINK |
+		SIGNAL_TYPE_LVDS |
+		SIGNAL_TYPE_DISPLAY_PORT |
+		SIGNAL_TYPE_DISPLAY_PORT_MST |
+		SIGNAL_TYPE_EDP |
+		SIGNAL_TYPE_HDMI_TYPE_A;
+
+	/* For DCE 8.0 and 8.1, by design, UNIPHY is hardwired to DIG_BE.
+	 * SW always assign DIG_FE 1:1 mapped to DIG_FE for non-MST UNIPHY.
+	 * SW assign DIG_FE to non-MST UNIPHY first and MST last. So prefer
+	 * DIG is per UNIPHY and used by SST DP, eDP, HDMI, DVI and LVDS.
+	 * Prefer DIG assignment is decided by board design.
+	 * For DCE 8.0, there are only max 6 UNIPHYs, we assume board design
+	 * and VBIOS will filter out 7 UNIPHY for DCE 8.0.
+	 * By this, adding DIGG should not hurt DCE 8.0.
+	 * This will let DCE 8.1 share DCE 8.0 as much as possible
+	 */
+
+	enc10->link_regs = link_regs;
+	enc10->aux_regs = aux_regs;
+	enc10->hpd_regs = hpd_regs;
+	enc10->link_shift = link_shift;
+	enc10->link_mask = link_mask;
+
+	switch (enc10->base.transmitter) {
+	case TRANSMITTER_UNIPHY_A:
+		enc10->base.preferred_engine = ENGINE_ID_DIGA;
+	break;
+	case TRANSMITTER_UNIPHY_B:
+		enc10->base.preferred_engine = ENGINE_ID_DIGB;
+	break;
+	case TRANSMITTER_UNIPHY_C:
+		enc10->base.preferred_engine = ENGINE_ID_DIGC;
+	break;
+	case TRANSMITTER_UNIPHY_D:
+		enc10->base.preferred_engine = ENGINE_ID_DIGD;
+	break;
+	case TRANSMITTER_UNIPHY_E:
+		enc10->base.preferred_engine = ENGINE_ID_DIGE;
+	break;
+	case TRANSMITTER_UNIPHY_F:
+		enc10->base.preferred_engine = ENGINE_ID_DIGF;
+	break;
+	case TRANSMITTER_UNIPHY_G:
+		enc10->base.preferred_engine = ENGINE_ID_DIGG;
+	break;
+	default:
+		ASSERT_CRITICAL(false);
+		enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+	}
+
+	/* default to one to mirror Windows behavior */
+	enc10->base.features.flags.bits.HDMI_6GB_EN = 1;
+
+	result = bp_funcs->get_encoder_cap_info(enc10->base.ctx->dc_bios,
+						enc10->base.id, &bp_cap_info);
+
+	/* Override features with DCE-specific values */
+	if (result == BP_RESULT_OK) {
+		enc10->base.features.flags.bits.IS_HBR2_CAPABLE =
+				bp_cap_info.DP_HBR2_EN;
+		enc10->base.features.flags.bits.IS_HBR3_CAPABLE =
+				bp_cap_info.DP_HBR3_EN;
+		enc10->base.features.flags.bits.HDMI_6GB_EN = bp_cap_info.HDMI_6GB_EN;
+		enc10->base.features.flags.bits.DP_IS_USB_C =
+				bp_cap_info.DP_IS_USB_C;
+	} else {
+		DC_LOG_WARNING("%s: Failed to get encoder_cap_info from VBIOS with error code %d!\n",
+				__func__,
+				result);
+	}
+	if (enc10->base.ctx->dc->debug.hdmi20_disable) {
+		enc10->base.features.flags.bits.HDMI_6GB_EN = 0;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.h
new file mode 100644
index 000000000000..49f8d91d4951
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.h
@@ -0,0 +1,82 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_LINK_ENCODER__DCN301_H__
+#define __DC_LINK_ENCODER__DCN301_H__
+
+#include "dcn20/dcn20_link_encoder.h"
+
+
+#define LE_DCN301_REG_LIST(id)\
+	SRI(DIG_BE_CNTL, DIG, id), \
+	SRI(DIG_BE_EN_CNTL, DIG, id), \
+	SRI(TMDS_CTL_BITS, DIG, id), \
+	SRI(TMDS_DCBALANCER_CONTROL, DIG, id), \
+	SRI(DP_CONFIG, DP, id), \
+	SRI(DP_DPHY_CNTL, DP, id), \
+	SRI(DP_DPHY_PRBS_CNTL, DP, id), \
+	SRI(DP_DPHY_SCRAM_CNTL, DP, id),\
+	SRI(DP_DPHY_SYM0, DP, id), \
+	SRI(DP_DPHY_SYM1, DP, id), \
+	SRI(DP_DPHY_SYM2, DP, id), \
+	SRI(DP_DPHY_TRAINING_PATTERN_SEL, DP, id), \
+	SRI(DP_LINK_CNTL, DP, id), \
+	SRI(DP_LINK_FRAMING_CNTL, DP, id), \
+	SRI(DP_MSE_SAT0, DP, id), \
+	SRI(DP_MSE_SAT1, DP, id), \
+	SRI(DP_MSE_SAT2, DP, id), \
+	SRI(DP_MSE_SAT_UPDATE, DP, id), \
+	SRI(DP_SEC_CNTL, DP, id), \
+	SRI(DP_VID_STREAM_CNTL, DP, id), \
+	SRI(DP_DPHY_FAST_TRAINING, DP, id), \
+	SRI(DP_SEC_CNTL1, DP, id), \
+	SRI(DP_DPHY_BS_SR_SWAP_CNTL, DP, id), \
+	SRI(DP_DPHY_HBR2_PATTERN_CONTROL, DP, id)
+
+#define LINK_ENCODER_MASK_SH_LIST_DCN301(mask_sh) \
+	LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh),\
+	LE_SF(DIG0_TMDS_DCBALANCER_CONTROL, TMDS_SYNC_DCBAL_EN, mask_sh)
+
+#define DPCS_DCN301_MASK_SH_LIST(mask_sh)\
+	DPCS_DCN2_MASK_SH_LIST(mask_sh),\
+	LE_SF(DPCSTX0_DPCSTX_TX_CNTL, DPCS_TX_HDMI_FRL_MODE, mask_sh),\
+	LE_SF(DPCSTX0_DPCSTX_TX_CNTL, DPCS_TX_DATA_SWAP_10_BIT, mask_sh),\
+	LE_SF(DPCSTX0_DPCSTX_TX_CNTL, DPCS_TX_DATA_ORDER_INVERT_18_BIT, mask_sh),\
+	LE_SF(RDPCSTX0_RDPCSTX_PHY_CNTL0, RDPCS_PHY_TX_VBOOST_LVL, mask_sh),\
+	LE_SF(RDPCSTX0_RDPCSTX_CLOCK_CNTL, RDPCS_TX_CLK_EN, mask_sh)
+
+void dcn301_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask);
+
+void enc3_hw_init(struct link_encoder *enc);
+
+#endif /* __DC_LINK_ENCODER__DCN301_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c
new file mode 100644
index 000000000000..a0b96b3c083f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c
@@ -0,0 +1,81 @@
+/*
+* Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+#include "dm_services.h"
+#include "dcn301_hubbub.h"
+#include "reg_helper.h"
+
+#define REG(reg)\
+	hubbub1->regs->reg
+#define DC_LOGGER \
+	hubbub1->base.ctx->logger
+#define CTX \
+	hubbub1->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubbub1->shifts->field_name, hubbub1->masks->field_name
+
+#define REG(reg)\
+	hubbub1->regs->reg
+
+#define CTX \
+	hubbub1->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubbub1->shifts->field_name, hubbub1->masks->field_name
+
+
+static const struct hubbub_funcs hubbub301_funcs = {
+	.update_dchub = hubbub2_update_dchub,
+	.init_dchub_sys_ctx = hubbub21_init_dchub,
+	.init_vm_ctx = hubbub2_init_vm_ctx,
+	.dcc_support_swizzle = hubbub3_dcc_support_swizzle,
+	.dcc_support_pixel_format = hubbub2_dcc_support_pixel_format,
+	.get_dcc_compression_cap = hubbub3_get_dcc_compression_cap,
+	.wm_read_state = hubbub21_wm_read_state,
+	.get_dchub_ref_freq = hubbub2_get_dchub_ref_freq,
+	.program_watermarks = hubbub3_program_watermarks,
+	.allow_self_refresh_control = hubbub1_allow_self_refresh_control,
+	.is_allow_self_refresh_enabled = hubbub1_is_allow_self_refresh_enabled,
+	.force_wm_propagate_to_pipes = hubbub3_force_wm_propagate_to_pipes,
+	.force_pstate_change_control = hubbub3_force_pstate_change_control,
+};
+
+void hubbub301_construct(struct dcn20_hubbub *hubbub3,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask)
+{
+	hubbub3->base.ctx = ctx;
+	hubbub3->base.funcs = &hubbub301_funcs;
+	hubbub3->regs = hubbub_regs;
+	hubbub3->shifts = hubbub_shift;
+	hubbub3->masks = hubbub_mask;
+
+	hubbub3->debug_test_index_pstate = 0xB;
+	hubbub3->detile_buf_size = 184 * 1024; /* 184KB for DCN3 */
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.h
new file mode 100644
index 000000000000..b599f4475479
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.h
@@ -0,0 +1,60 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+#ifndef DAL_DC_DCN301_DCN301_HUBBUB_H_
+#define DAL_DC_DCN301_DCN301_HUBBUB_H_
+
+#include "dcn30/dcn30_hubbub.h"
+
+
+#define HUBBUB_REG_LIST_DCN301(id)\
+	HUBBUB_REG_LIST_DCN30(id), \
+	HUBBUB_HVM_REG_LIST()
+
+
+#define HUBBUB_MASK_SH_LIST_DCN301(mask_sh)\
+	HUBBUB_MASK_SH_LIST_DCN30(mask_sh), \
+	HUBBUB_SF(DCHVM_CTRL0, HOSTVM_INIT_REQ, mask_sh), \
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_PWR_REQ_DIS, mask_sh), \
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_FORCE_REQ, mask_sh), \
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_POWER_STATUS, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DISPCLK_R_GATE_DIS, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DISPCLK_G_GATE_DIS, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DCFCLK_R_GATE_DIS, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DCFCLK_G_GATE_DIS, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, TR_REQ_REQCLKREQ_MODE, mask_sh), \
+	HUBBUB_SF(DCHVM_CLK_CTRL, TW_RSP_COMPCLKREQ_MODE, mask_sh), \
+	HUBBUB_SF(DCHVM_RIOMMU_CTRL0, HOSTVM_PREFETCH_REQ, mask_sh), \
+	HUBBUB_SF(DCHVM_RIOMMU_CTRL0, HOSTVM_POWERSTATUS, mask_sh), \
+	HUBBUB_SF(DCHVM_RIOMMU_STAT0, RIOMMU_ACTIVE, mask_sh), \
+	HUBBUB_SF(DCHVM_RIOMMU_STAT0, HOSTVM_PREFETCH_DONE, mask_sh)
+
+void hubbub301_construct(struct dcn20_hubbub *hubbub3,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask);
+
+
+#endif /* DAL_DC_DCN301_DCN301_HUBBUB_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.c
new file mode 100644
index 000000000000..10bedb2ea62a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.c
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "core_types.h"
+#include "dce/dce_hwseq.h"
+#include "dcn301_hwseq.h"
+#include "reg_helper.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define CTX \
+	hws->ctx
+#define REG(reg)\
+	hws->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hws->shifts->field_name, hws->masks->field_name
+
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.h
new file mode 100644
index 000000000000..aa3df3f77108
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_hwseq.h
@@ -0,0 +1,32 @@
+/*
+* Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HWSS_DCN301_H__
+#define __DC_HWSS_DCN301_H__
+
+#include "hw_sequencer_private.h"
+
+
+#endif /* __DC_HWSS_DCN301_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
new file mode 100644
index 000000000000..d4bebb3a52e4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
@@ -0,0 +1,145 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn10/dcn10_hw_sequencer.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn21/dcn21_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dcn301_hwseq.h"
+
+static const struct hw_sequencer_funcs dcn301_funcs = {
+	.program_gamut_remap = dcn10_program_gamut_remap,
+	.init_hw = dcn10_init_hw,
+	.power_down_on_boot = dcn10_power_down_on_boot,
+	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
+	.apply_ctx_for_surface = NULL,
+	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
+	.disconnect_pipes = dcn10_disconnect_pipes,
+	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
+	.post_unlock_program_front_end = dcn20_post_unlock_program_front_end,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.update_dchub = dcn10_update_dchub,
+	.update_pending_status = dcn10_update_pending_status,
+	.program_output_csc = dcn20_program_output_csc,
+	.enable_accelerated_mode = dce110_enable_accelerated_mode,
+	.enable_timing_synchronization = dcn10_enable_timing_synchronization,
+	.enable_per_frame_crtc_position_reset = dcn10_enable_per_frame_crtc_position_reset,
+	.update_info_frame = dcn30_update_info_frame,
+	.send_immediate_sdp_message = dcn10_send_immediate_sdp_message,
+	.enable_stream = dcn20_enable_stream,
+	.disable_stream = dce110_disable_stream,
+	.unblank_stream = dcn20_unblank_stream,
+#ifdef FREESYNC_POWER_OPTIMIZE
+	.are_streams_coarse_grain_aligned = dcn20_are_streams_coarse_grain_aligned,
+#endif
+	.blank_stream = dce110_blank_stream,
+	.enable_audio_stream = dce110_enable_audio_stream,
+	.disable_audio_stream = dce110_disable_audio_stream,
+	.disable_plane = dcn20_disable_plane,
+	.pipe_control_lock = dcn20_pipe_control_lock,
+	.interdependent_update_lock = dcn10_lock_all_pipes,
+	.cursor_lock = dcn10_cursor_lock,
+	.prepare_bandwidth = dcn20_prepare_bandwidth,
+	.optimize_bandwidth = dcn20_optimize_bandwidth,
+	.update_bandwidth = dcn20_update_bandwidth,
+	.set_drr = dcn10_set_drr,
+	.get_position = dcn10_get_position,
+	.set_static_screen_control = dcn10_set_static_screen_control,
+	.setup_stereo = dcn10_setup_stereo,
+	.set_avmute = dcn30_set_avmute,
+	.log_hw_state = dcn10_log_hw_state,
+	.get_hw_state = dcn10_get_hw_state,
+	.clear_status_bits = dcn10_clear_status_bits,
+	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
+	.edp_power_control = dce110_edp_power_control,
+	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
+	.set_cursor_position = dcn10_set_cursor_position,
+	.set_cursor_attribute = dcn10_set_cursor_attribute,
+	.set_cursor_sdr_white_level = dcn10_set_cursor_sdr_white_level,
+	.setup_periodic_interrupt = dcn10_setup_periodic_interrupt,
+	.set_clock = dcn10_set_clock,
+	.get_clock = dcn10_get_clock,
+	.program_triplebuffer = dcn20_program_triple_buffer,
+	.enable_writeback = dcn30_enable_writeback,
+	.disable_writeback = dcn30_disable_writeback,
+	.update_writeback = dcn30_update_writeback,
+	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
+	.dmdata_status_done = dcn20_dmdata_status_done,
+	.program_dmdata_engine = dcn30_program_dmdata_engine,
+	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
+	.init_sys_ctx = dcn20_init_sys_ctx,
+	.init_vm_ctx = dcn20_init_vm_ctx,
+	.set_flip_control_gsl = dcn20_set_flip_control_gsl,
+	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
+	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.set_backlight_level = dcn21_set_backlight_level,
+	.set_abm_immediate_disable = dcn21_set_abm_immediate_disable,
+	.set_pipe = dcn21_set_pipe,
+};
+
+static const struct hwseq_private_funcs dcn301_private_funcs = {
+	.init_pipes = dcn10_init_pipes,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.plane_atomic_disconnect = dcn10_plane_atomic_disconnect,
+	.update_mpcc = dcn20_update_mpcc,
+	.set_input_transfer_func = dcn30_set_input_transfer_func,
+	.set_output_transfer_func = dcn30_set_output_transfer_func,
+	.power_down = dce110_power_down,
+	.enable_display_power_gating = dcn10_dummy_display_power_gating,
+	.blank_pixel_data = dcn20_blank_pixel_data,
+	.reset_hw_ctx_wrap = dcn20_reset_hw_ctx_wrap,
+	.enable_stream_timing = dcn20_enable_stream_timing,
+	.edp_backlight_control = dce110_edp_backlight_control,
+	.disable_stream_gating = dcn20_disable_stream_gating,
+	.enable_stream_gating = dcn20_enable_stream_gating,
+	.setup_vupdate_interrupt = dcn20_setup_vupdate_interrupt,
+	.did_underflow_occur = dcn10_did_underflow_occur,
+	.init_blank = dcn20_init_blank,
+	.disable_vga = dcn20_disable_vga,
+	.bios_golden_init = dcn10_bios_golden_init,
+	.plane_atomic_disable = dcn20_plane_atomic_disable,
+	.plane_atomic_power_down = dcn10_plane_atomic_power_down,
+	.enable_power_gating_plane = dcn20_enable_power_gating_plane,
+	.dpp_pg_control = dcn20_dpp_pg_control,
+	.hubp_pg_control = dcn20_hubp_pg_control,
+	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
+	.update_odm = dcn20_update_odm,
+	.dsc_pg_control = dcn20_dsc_pg_control,
+	.get_surface_visual_confirm_color = dcn10_get_surface_visual_confirm_color,
+	.get_hdr_visual_confirm_color = dcn10_get_hdr_visual_confirm_color,
+	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
+	.verify_allow_pstate_change_high = dcn10_verify_allow_pstate_change_high,
+	.wait_for_blank_complete = dcn20_wait_for_blank_complete,
+	.dccg_init = dcn20_dccg_init,
+	.set_blend_lut = dcn30_set_blend_lut,
+	.set_shaper_3dlut = dcn20_set_shaper_3dlut,
+};
+
+void dcn301_hw_sequencer_construct(struct dc *dc)
+{
+	dc->hwss = dcn301_funcs;
+	dc->hwseq->funcs = dcn301_private_funcs;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.h
new file mode 100644
index 000000000000..0bca48ccbfa2
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_DCN30_INIT_H__
+#define __DC_DCN30_INIT_H__
+
+struct dc;
+
+void dcn301_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_DCN30_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
new file mode 100644
index 000000000000..736bda30abc3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
@@ -0,0 +1,218 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dc_dmub_srv.h"
+#include "dcn301_panel_cntl.h"
+#include "atom.h"
+
+#define TO_DCN301_PANEL_CNTL(panel_cntl)\
+	container_of(panel_cntl, struct dcn301_panel_cntl, base)
+
+#define CTX \
+	dcn301_panel_cntl->base.ctx
+
+#define DC_LOGGER \
+	dcn301_panel_cntl->base.ctx->logger
+
+#define REG(reg)\
+	dcn301_panel_cntl->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dcn301_panel_cntl->shift->field_name, dcn301_panel_cntl->mask->field_name
+
+static unsigned int dcn301_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_cntl)
+{
+	uint64_t current_backlight;
+	uint32_t round_result;
+	uint32_t bl_period, bl_int_count;
+	uint32_t bl_pwm, fractional_duty_cycle_en;
+	uint32_t bl_period_mask, bl_pwm_mask;
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
+
+	REG_GET(BL_PWM_PERIOD_CNTL, BL_PWM_PERIOD, &bl_period);
+	REG_GET(BL_PWM_PERIOD_CNTL, BL_PWM_PERIOD_BITCNT, &bl_int_count);
+
+	REG_GET(BL_PWM_CNTL, BL_ACTIVE_INT_FRAC_CNT, &bl_pwm);
+	REG_GET(BL_PWM_CNTL, BL_PWM_FRACTIONAL_EN, &fractional_duty_cycle_en);
+
+	if (bl_int_count == 0)
+		bl_int_count = 16;
+
+	bl_period_mask = (1 << bl_int_count) - 1;
+	bl_period &= bl_period_mask;
+
+	bl_pwm_mask = bl_period_mask << (16 - bl_int_count);
+
+	if (fractional_duty_cycle_en == 0)
+		bl_pwm &= bl_pwm_mask;
+	else
+		bl_pwm &= 0xFFFF;
+
+	current_backlight = (uint64_t)bl_pwm << (1 + bl_int_count);
+
+	if (bl_period == 0)
+		bl_period = 0xFFFF;
+
+	current_backlight = div_u64(current_backlight, bl_period);
+	current_backlight = (current_backlight + 1) >> 1;
+
+	current_backlight = (uint64_t)(current_backlight) * bl_period;
+
+	round_result = (uint32_t)(current_backlight & 0xFFFFFFFF);
+
+	round_result = (round_result >> (bl_int_count-1)) & 1;
+
+	current_backlight >>= bl_int_count;
+	current_backlight += round_result;
+
+	return (uint32_t)(current_backlight);
+}
+
+uint32_t dcn301_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
+{
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
+	uint32_t value;
+	uint32_t current_backlight;
+
+	/* It must not be 0, so we have to restore them
+	 * Bios bug w/a - period resets to zero,
+	 * restoring to cache values which is always correct
+	 */
+	REG_GET(BL_PWM_CNTL, BL_ACTIVE_INT_FRAC_CNT, &value);
+
+	if (value == 0 || value == 1) {
+		if (panel_cntl->stored_backlight_registers.BL_PWM_CNTL != 0) {
+			REG_WRITE(BL_PWM_CNTL,
+					panel_cntl->stored_backlight_registers.BL_PWM_CNTL);
+			REG_WRITE(BL_PWM_CNTL2,
+					panel_cntl->stored_backlight_registers.BL_PWM_CNTL2);
+			REG_WRITE(BL_PWM_PERIOD_CNTL,
+					panel_cntl->stored_backlight_registers.BL_PWM_PERIOD_CNTL);
+			REG_UPDATE(PWRSEQ_REF_DIV,
+				BL_PWM_REF_DIV,
+				panel_cntl->stored_backlight_registers.LVTMA_PWRSEQ_REF_DIV_BL_PWM_REF_DIV);
+		} else {
+			/* TODO: Note: This should not really happen since VBIOS
+			 * should have initialized PWM registers on boot.
+			 */
+			REG_WRITE(BL_PWM_CNTL, 0xC000FA00);
+			REG_WRITE(BL_PWM_PERIOD_CNTL, 0x000C0FA0);
+		}
+	} else {
+		panel_cntl->stored_backlight_registers.BL_PWM_CNTL =
+				REG_READ(BL_PWM_CNTL);
+		panel_cntl->stored_backlight_registers.BL_PWM_CNTL2 =
+				REG_READ(BL_PWM_CNTL2);
+		panel_cntl->stored_backlight_registers.BL_PWM_PERIOD_CNTL =
+				REG_READ(BL_PWM_PERIOD_CNTL);
+
+		REG_GET(PWRSEQ_REF_DIV, BL_PWM_REF_DIV,
+				&panel_cntl->stored_backlight_registers.LVTMA_PWRSEQ_REF_DIV_BL_PWM_REF_DIV);
+	}
+
+	// Enable the backlight output
+	REG_UPDATE(BL_PWM_CNTL, BL_PWM_EN, 1);
+
+	// Unlock group 2 backlight registers
+	REG_UPDATE(BL_PWM_GRP1_REG_LOCK,
+			BL_PWM_GRP1_REG_LOCK, 0);
+
+	current_backlight = dcn301_get_16_bit_backlight_from_pwm(panel_cntl);
+
+	return current_backlight;
+}
+
+void dcn301_panel_cntl_destroy(struct panel_cntl **panel_cntl)
+{
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(*panel_cntl);
+
+	kfree(dcn301_panel_cntl);
+	*panel_cntl = NULL;
+}
+
+bool dcn301_is_panel_backlight_on(struct panel_cntl *panel_cntl)
+{
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
+	uint32_t value;
+
+	REG_GET(PWRSEQ_CNTL, PANEL_BLON, &value);
+
+	return value;
+}
+
+bool dcn301_is_panel_powered_on(struct panel_cntl *panel_cntl)
+{
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
+	uint32_t pwr_seq_state, dig_on, dig_on_ovrd;
+
+	REG_GET(PWRSEQ_STATE, PANEL_PWRSEQ_TARGET_STATE_R, &pwr_seq_state);
+
+	REG_GET_2(PWRSEQ_CNTL, PANEL_DIGON, &dig_on, PANEL_DIGON_OVRD, &dig_on_ovrd);
+
+	return (pwr_seq_state == 1) || (dig_on == 1 && dig_on_ovrd == 1);
+}
+
+void dcn301_store_backlight_level(struct panel_cntl *panel_cntl)
+{
+	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
+
+	panel_cntl->stored_backlight_registers.BL_PWM_CNTL =
+		REG_READ(BL_PWM_CNTL);
+	panel_cntl->stored_backlight_registers.BL_PWM_CNTL2 =
+		REG_READ(BL_PWM_CNTL2);
+	panel_cntl->stored_backlight_registers.BL_PWM_PERIOD_CNTL =
+		REG_READ(BL_PWM_PERIOD_CNTL);
+
+	REG_GET(PWRSEQ_REF_DIV, BL_PWM_REF_DIV,
+		&panel_cntl->stored_backlight_registers.LVTMA_PWRSEQ_REF_DIV_BL_PWM_REF_DIV);
+}
+
+static const struct panel_cntl_funcs dcn301_link_panel_cntl_funcs = {
+	.destroy = dcn301_panel_cntl_destroy,
+	.hw_init = dcn301_panel_cntl_hw_init,
+	.is_panel_backlight_on = dcn301_is_panel_backlight_on,
+	.is_panel_powered_on = dcn301_is_panel_powered_on,
+	.store_backlight_level = dcn301_store_backlight_level,
+	.get_current_backlight = dcn301_get_16_bit_backlight_from_pwm,
+};
+
+void dcn301_panel_cntl_construct(
+	struct dcn301_panel_cntl *dcn301_panel_cntl,
+	const struct panel_cntl_init_data *init_data,
+	const struct dce_panel_cntl_registers *regs,
+	const struct dcn301_panel_cntl_shift *shift,
+	const struct dcn301_panel_cntl_mask *mask)
+{
+	dcn301_panel_cntl->regs = regs;
+	dcn301_panel_cntl->shift = shift;
+	dcn301_panel_cntl->mask = mask;
+
+	dcn301_panel_cntl->base.funcs = &dcn301_link_panel_cntl_funcs;
+	dcn301_panel_cntl->base.ctx = init_data->ctx;
+	dcn301_panel_cntl->base.inst = init_data->inst;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.h
new file mode 100644
index 000000000000..ffc875da7467
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.h
@@ -0,0 +1,97 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_PANEL_CNTL__DCN301_H__
+#define __DC_PANEL_CNTL__DCN301_H__
+
+#include "panel_cntl.h"
+#include "dce/dce_panel_cntl.h"
+
+
+#define DCN301_PANEL_CNTL_REG_LIST(id)\
+	SRIR(PWRSEQ_CNTL, CNTL, PANEL_PWRSEQ, id), \
+	SRIR(PWRSEQ_STATE, STATE, PANEL_PWRSEQ, id), \
+	SRIR(PWRSEQ_REF_DIV, REF_DIV, PANEL_PWRSEQ, id), \
+	SRIR(BL_PWM_CNTL, CNTL, BL_PWM, id), \
+	SRIR(BL_PWM_CNTL2, CNTL2, BL_PWM, id), \
+	SRIR(BL_PWM_PERIOD_CNTL, PERIOD_CNTL, BL_PWM, id), \
+	SRIR(BL_PWM_GRP1_REG_LOCK, GRP1_REG_LOCK, BL_PWM, id)
+
+#define DCN301_PANEL_CNTL_SF(reg_name, field_name, post_fix)\
+	.field_name = reg_name ## __ ## field_name ## post_fix
+
+#define DCN301_PANEL_CNTL_MASK_SH_LIST(mask_sh) \
+	DCN301_PANEL_CNTL_SF(PANEL_PWRSEQ0_CNTL, PANEL_BLON, mask_sh),\
+	DCN301_PANEL_CNTL_SF(PANEL_PWRSEQ0_CNTL, PANEL_DIGON, mask_sh),\
+	DCN301_PANEL_CNTL_SF(PANEL_PWRSEQ0_CNTL, PANEL_DIGON_OVRD, mask_sh),\
+	DCN301_PANEL_CNTL_SF(PANEL_PWRSEQ0_STATE, PANEL_PWRSEQ_TARGET_STATE_R, mask_sh), \
+	DCN301_PANEL_CNTL_SF(PANEL_PWRSEQ0_REF_DIV, BL_PWM_REF_DIV, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_PERIOD_CNTL, BL_PWM_PERIOD, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_PERIOD_CNTL, BL_PWM_PERIOD_BITCNT, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_CNTL, BL_ACTIVE_INT_FRAC_CNT, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_CNTL, BL_PWM_FRACTIONAL_EN, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_CNTL, BL_PWM_EN, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_GRP1_REG_LOCK, BL_PWM_GRP1_IGNORE_MASTER_LOCK_EN, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_GRP1_REG_LOCK, BL_PWM_GRP1_REG_LOCK, mask_sh), \
+	DCN301_PANEL_CNTL_SF(BL_PWM0_GRP1_REG_LOCK, BL_PWM_GRP1_REG_UPDATE_PENDING, mask_sh)
+
+#define DCN301_PANEL_CNTL_REG_FIELD_LIST(type) \
+	type PANEL_BLON;\
+	type PANEL_DIGON;\
+	type PANEL_DIGON_OVRD;\
+	type PANEL_PWRSEQ_TARGET_STATE_R; \
+	type BL_PWM_EN; \
+	type BL_ACTIVE_INT_FRAC_CNT; \
+	type BL_PWM_FRACTIONAL_EN; \
+	type BL_PWM_PERIOD; \
+	type BL_PWM_PERIOD_BITCNT; \
+	type BL_PWM_GRP1_IGNORE_MASTER_LOCK_EN; \
+	type BL_PWM_GRP1_REG_LOCK; \
+	type BL_PWM_GRP1_REG_UPDATE_PENDING; \
+	type BL_PWM_REF_DIV
+
+struct dcn301_panel_cntl_shift {
+	DCN301_PANEL_CNTL_REG_FIELD_LIST(uint8_t);
+};
+
+struct dcn301_panel_cntl_mask {
+	DCN301_PANEL_CNTL_REG_FIELD_LIST(uint32_t);
+};
+
+struct dcn301_panel_cntl {
+	struct panel_cntl base;
+	const struct dce_panel_cntl_registers *regs;
+	const struct dcn301_panel_cntl_shift *shift;
+	const struct dcn301_panel_cntl_mask *mask;
+};
+
+void dcn301_panel_cntl_construct(
+	struct dcn301_panel_cntl *panel_cntl,
+	const struct panel_cntl_init_data *init_data,
+	const struct dce_panel_cntl_registers *regs,
+	const struct dcn301_panel_cntl_shift *shift,
+	const struct dcn301_panel_cntl_mask *mask);
+
+#endif /* __DC_PANEL_CNTL__DCN301_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
new file mode 100644
index 000000000000..9f0ca41ef1b2
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -0,0 +1,2011 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn301_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn30/dcn30_resource.h"
+#include "dcn301_resource.h"
+
+#include "dcn20/dcn20_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn301/dcn301_hubbub.h"
+#include "dcn30/dcn30_mpc.h"
+#include "dcn30/dcn30_hubp.h"
+#include "irq/dcn30/irq_service_dcn30.h"
+#include "dcn30/dcn30_dpp.h"
+#include "dcn30/dcn30_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn20/dcn20_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "virtual/virtual_stream_encoder.h"
+#include "dce110/dce110_resource.h"
+#include "dml/display_mode_vba.h"
+#include "dcn301/dcn301_dccg.h"
+#include "dcn10/dcn10_resource.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn301/dcn301_dio_link_encoder.h"
+#include "dcn301_panel_cntl.h"
+
+#include "vangogh_ip_offset.h"
+
+#include "dcn30/dcn30_dwb.h"
+#include "dcn30/dcn30_mmhubbub.h"
+
+#include "dcn/dcn_3_0_1_offset.h"
+#include "dcn/dcn_3_0_1_sh_mask.h"
+
+#include "nbio/nbio_7_2_0_offset.h"
+
+#include "reg_helper.h"
+#include "dce/dmub_abm.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_i2c.h"
+
+#include "dml/dcn30/display_mode_vba_30.h"
+#include "vm_helper.h"
+#include "dcn20/dcn20_vmid.h"
+#include "amdgpu_socbb.h"
+
+#define TO_DCN301_RES_POOL(pool)\
+	container_of(pool, struct dcn301_resource_pool, base)
+
+#define DC_LOGGER_INIT(logger)
+
+struct _vcs_dpi_ip_params_st dcn3_01_ip = {
+	.odm_capable = 1,
+	.gpuvm_enable = 1,
+	.hostvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_max_page_table_levels = 2,
+	.hostvm_cached_page_table_levels = 0,
+	.pte_group_size_bytes = 2048,
+	.num_dsc = 3,
+	.rob_buffer_size_kbytes = 184,
+	.det_buffer_size_kbytes = 184,
+	.dpte_buffer_size_in_pte_reqs_luma = 64,
+	.dpte_buffer_size_in_pte_reqs_chroma = 32,
+	.pde_proc_buffer_size_64k_reqs = 48,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.meta_chunk_size_kbytes = 2,
+	.writeback_chunk_size_kbytes = 8,
+	.line_buffer_size_bits = 789504,
+	.is_line_buffer_bpp_fixed = 0,  // ?
+	.line_buffer_fixed_bpp = 48,     // ?
+	.dcc_supported = true,
+	.writeback_interface_buffer_size_kbytes = 90,
+	.writeback_line_buffer_buffer_size = 656640,
+	.max_line_buffer_lines = 12,
+	.writeback_luma_buffer_size_kbytes = 12,  // writeback_line_buffer_buffer_size = 656640
+	.writeback_chroma_buffer_size_kbytes = 8,
+	.writeback_chroma_line_buffer_width_pixels = 4,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.writeback_line_buffer_luma_buffer_size = 0,
+	.writeback_line_buffer_chroma_buffer_size = 14643,
+	.cursor_buffer_size = 8,
+	.cursor_chunk_size = 2,
+	.max_num_otg = 4,
+	.max_num_dpp = 4,
+	.max_num_wb = 1,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.hscl_mults = 4,
+	.vscl_mults = 4,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dispclk_ramp_margin_percent = 1,
+	.underscan_factor = 1.11,
+	.min_vblank_lines = 32,
+	.dppclk_delay_subtotal = 46,
+	.dynamic_metadata_vm_enabled = true,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_cnvc_formatter = 27,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 119,
+	.dcfclk_cstate_latency = 5.2, // SRExitTime
+	.max_inter_dcn_tile_repeaters = 8,
+	.max_num_hdmi_frl_outputs = 0,
+	.odm_combine_4to1_supported = true,
+
+	.xfc_supported = false,
+	.xfc_fill_bw_overhead_percent = 10.0,
+	.xfc_fill_constant_bytes = 0,
+	.gfx7_compat_tiling_supported = 0,
+	.number_of_cursors = 1,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_01_soc = {
+	.clock_limits = {
+			/*TODO: fill out defaults once wm plociy is settled*/
+			{
+				.state = 0,
+				.dcfclk_mhz = 810.0,
+				.fabricclk_mhz = 1200.0,
+				.dispclk_mhz = 1015.0,
+				.dppclk_mhz = 1015.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1000.0,
+				.dscclk_mhz = 338.0,
+				.dram_speed_mts = 4266.0,
+			},
+			{
+				.state = 1,
+				.dcfclk_mhz = 810.0,
+				.fabricclk_mhz = 1200.0,
+				.dispclk_mhz = 1015.0,
+				.dppclk_mhz = 1015.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1000.0,
+				.dscclk_mhz = 338.0,
+				.dram_speed_mts = 4266.0,
+			}
+		},
+
+	.sr_exit_time_us = 9.0,
+	.sr_enter_plus_exit_time_us = 11.0,
+	.urgent_latency_us = 4.0,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 75.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 60.0,
+	.writeback_latency_us = 12.0,
+	.max_request_size_bytes = 256,
+	.dram_channel_width_bytes = 4,
+	.fabric_datapath_to_dcn_data_return_bytes = 32,
+	.dcn_downspread_percent = 0.5,
+	.downspread_percent = 0.38,
+	.dram_page_open_time_ns = 50.0,
+	.dram_rw_turnaround_time_ns = 17.5,
+	.dram_return_buffer_per_channel_bytes = 8192,
+	.round_trip_ping_latency_dcfclk_cycles = 191,
+	.urgent_out_of_order_return_per_channel_bytes = 4096,
+	.channel_interleave_bytes = 256,
+	.num_banks = 8,
+	.num_chans = 4,
+	.gpuvm_min_page_size_bytes = 4096,
+	.hostvm_min_page_size_bytes = 4096,
+	.dram_clock_change_latency_us = 23.84,
+	.writeback_dram_clock_change_latency_us = 23.0,
+	.return_bus_width_bytes = 64,
+	.dispclk_dppclk_vco_speed_mhz = 3550,
+	.xfc_bus_transport_time_us = 20,      // ?
+	.xfc_xbuf_latency_tolerance_us = 4,  // ?
+	.use_urgent_burst_bw = 1,            // ?
+	.num_states = 2,
+	.do_urgent_latency_adjustment = false,
+	.urgent_latency_adjustment_fabric_clock_component_us = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+};
+
+enum dcn301_clk_src_array_id {
+	DCN301_CLK_SRC_PLL0,
+	DCN301_CLK_SRC_PLL1,
+	DCN301_CLK_SRC_PLL2,
+	DCN301_CLK_SRC_PLL3,
+	DCN301_CLK_SRC_TOTAL
+};
+
+/* begin *********************
+ * macros to expend register list macro defined in HW object header file
+ */
+
+/* DCN */
+/* TODO awful hack. fixup dcn20_dwb.h */
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) +  \
+					mm ## reg_name
+
+#define SRI(reg_name, block, id)\
+	.reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+	.reg_name = BASE(mm ## reg_name ## _BASE_IDX) + \
+					mm ## reg_name
+
+#define SRIR(var_name, reg_name, block, id)\
+	.var_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## reg_name
+
+#define SRII(reg_name, block, id)\
+	.reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## reg_name
+
+#define SRII2(reg_name_pre, reg_name_post, id)\
+	.reg_name_pre ## _ ##  reg_name_post[id] = BASE(mm ## reg_name_pre \
+			## id ## _ ## reg_name_post ## _BASE_IDX) + \
+			mm ## reg_name_pre ## id ## _ ## reg_name_post
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+	.RMU##_##reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## reg_name
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+	.reg_name[id] = BASE(mm ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## temp_name
+
+#define DCCG_SRII(reg_name, block, id)\
+	.block ## _ ## reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+	.reg_name[id] = BASE(mm ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+					mm ## reg_name ## _ ## block ## id
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) \
+	NBIO_BASE__INST0_SEG ## seg
+
+#define NBIO_BASE(seg) \
+	NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+		.reg_name = NBIO_BASE(regBIF_BX0_ ## reg_name ## _BASE_IDX) + \
+					regBIF_BX0_ ## reg_name
+
+/* MMHUB */
+#define MMHUB_BASE_INNER(seg) \
+	MMHUB_BASE__INST0_SEG ## seg
+
+#define MMHUB_BASE(seg) \
+	MMHUB_BASE_INNER(seg)
+
+#define MMHUB_SR(reg_name)\
+		.reg_name = MMHUB_BASE(regMM ## reg_name ## _BASE_IDX) + \
+					regMM ## reg_name
+
+/* CLOCK */
+#define CLK_BASE_INNER(seg) \
+	CLK_BASE__INST0_SEG ## seg
+
+#define CLK_BASE(seg) \
+	CLK_BASE_INNER(seg)
+
+#define CLK_SRI(reg_name, block, inst)\
+	.reg_name = CLK_BASE(mm ## block ## _ ## inst ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## _ ## inst ## _ ## reg_name
+
+static const struct bios_registers bios_regs = {
+		NBIO_SR(BIOS_SCRATCH_3),
+		NBIO_SR(BIOS_SCRATCH_6)
+};
+
+#define clk_src_regs(index, pllid)\
+[index] = {\
+	CS_COMMON_REG_LIST_DCN3_01(index, pllid),\
+}
+
+static const struct dce110_clk_src_regs clk_src_regs[] = {
+	clk_src_regs(0, A),
+	clk_src_regs(1, B),
+	clk_src_regs(2, C),
+	clk_src_regs(3, D)
+};
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
+};
+
+#define abm_regs(id)\
+[id] = {\
+		ABM_DCN301_REG_LIST(id)\
+}
+
+static const struct dce_abm_registers abm_regs[] = {
+		abm_regs(0),
+		abm_regs(1),
+		abm_regs(2),
+		abm_regs(3),
+};
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCN301(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN301(_MASK)
+};
+
+#define audio_regs(id)\
+[id] = {\
+		AUD_COMMON_REG_LIST(id)\
+}
+
+static const struct dce_audio_registers audio_regs[] = {
+	audio_regs(0),
+	audio_regs(1),
+	audio_regs(2),
+	audio_regs(3),
+	audio_regs(4),
+	audio_regs(5),
+	audio_regs(6)
+};
+
+#define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA, AZALIA_ENDPOINT_REG_DATA, mask_sh),\
+		AUD_COMMON_MASK_SH_LIST_BASE(mask_sh)
+
+static const struct dce_audio_shift audio_shift = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define vpg_regs(id)\
+[id] = {\
+	VPG_DCN3_REG_LIST(id)\
+}
+
+static const struct dcn30_vpg_registers vpg_regs[] = {
+	vpg_regs(0),
+	vpg_regs(1),
+	vpg_regs(2),
+	vpg_regs(3),
+};
+
+static const struct dcn30_vpg_shift vpg_shift = {
+	DCN3_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_vpg_mask vpg_mask = {
+	DCN3_VPG_MASK_SH_LIST(_MASK)
+};
+
+#define afmt_regs(id)\
+[id] = {\
+	AFMT_DCN3_REG_LIST(id)\
+}
+
+static const struct dcn30_afmt_registers afmt_regs[] = {
+	afmt_regs(0),
+	afmt_regs(1),
+	afmt_regs(2),
+	afmt_regs(3),
+};
+
+static const struct dcn30_afmt_shift afmt_shift = {
+	DCN3_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_afmt_mask afmt_mask = {
+	DCN3_AFMT_MASK_SH_LIST(_MASK)
+};
+
+#define stream_enc_regs(id)\
+[id] = {\
+	SE_DCN3_REG_LIST(id)\
+}
+
+static const struct dcn10_stream_enc_registers stream_enc_regs[] = {
+	stream_enc_regs(0),
+	stream_enc_regs(1),
+	stream_enc_regs(2),
+	stream_enc_regs(3),
+};
+
+static const struct dcn10_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+
+#define aux_regs(id)\
+[id] = {\
+	DCN2_AUX_REG_LIST(id)\
+}
+
+static const struct dcn10_link_enc_aux_registers link_enc_aux_regs[] = {
+		aux_regs(0),
+		aux_regs(1),
+		aux_regs(2),
+		aux_regs(3),
+};
+
+#define hpd_regs(id)\
+[id] = {\
+	HPD_REG_LIST(id)\
+}
+
+static const struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[] = {
+		hpd_regs(0),
+		hpd_regs(1),
+		hpd_regs(2),
+		hpd_regs(3),
+};
+
+#define link_regs(id, phyid)\
+[id] = {\
+	LE_DCN301_REG_LIST(id), \
+	UNIPHY_DCN2_REG_LIST(phyid), \
+}
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+static const struct dcn10_link_enc_registers link_enc_regs[] = {
+	link_regs(0, A),
+	link_regs(1, B),
+	link_regs(2, C),
+	link_regs(3, D),
+};
+
+static const struct dcn10_link_enc_shift le_shift = {
+	LINK_ENCODER_MASK_SH_LIST_DCN301(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN301(_MASK)
+};
+
+#define panel_cntl_regs(id)\
+[id] = {\
+	DCN301_PANEL_CNTL_REG_LIST(id),\
+}
+
+static const struct dce_panel_cntl_registers panel_cntl_regs[] = {
+	panel_cntl_regs(0),
+	panel_cntl_regs(1),
+};
+
+static const struct dcn301_panel_cntl_shift panel_cntl_shift = {
+	DCN301_PANEL_CNTL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn301_panel_cntl_mask panel_cntl_mask = {
+	DCN301_PANEL_CNTL_MASK_SH_LIST(_MASK)
+};
+
+#define dpp_regs(id)\
+[id] = {\
+	DPP_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn3_dpp_registers dpp_regs[] = {
+	dpp_regs(0),
+	dpp_regs(1),
+	dpp_regs(2),
+	dpp_regs(3),
+};
+
+static const struct dcn3_dpp_shift tf_shift = {
+		DPP_REG_LIST_SH_MASK_DCN30(__SHIFT)
+};
+
+static const struct dcn3_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN30(_MASK)
+};
+
+#define opp_regs(id)\
+[id] = {\
+	OPP_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn20_opp_registers opp_regs[] = {
+	opp_regs(0),
+	opp_regs(1),
+	opp_regs(2),
+	opp_regs(3),
+};
+
+static const struct dcn20_opp_shift opp_shift = {
+	OPP_MASK_SH_LIST_DCN20(__SHIFT)
+};
+
+static const struct dcn20_opp_mask opp_mask = {
+	OPP_MASK_SH_LIST_DCN20(_MASK)
+};
+
+#define aux_engine_regs(id)\
+[id] = {\
+	AUX_COMMON_REG_LIST0(id), \
+	.AUXN_IMPCAL = 0, \
+	.AUXP_IMPCAL = 0, \
+	.AUX_RESET_MASK = DP_AUX0_AUX_CONTROL__AUX_RESET_MASK, \
+}
+
+static const struct dce110_aux_registers aux_engine_regs[] = {
+		aux_engine_regs(0),
+		aux_engine_regs(1),
+		aux_engine_regs(2),
+		aux_engine_regs(3),
+};
+
+#define dwbc_regs_dcn3(id)\
+[id] = {\
+	DWBC_COMMON_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn30_dwbc_registers dwbc30_regs[] = {
+	dwbc_regs_dcn3(0),
+};
+
+static const struct dcn30_dwbc_shift dwbc30_shift = {
+	DWBC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_dwbc_mask dwbc30_mask = {
+	DWBC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define mcif_wb_regs_dcn3(id)\
+[id] = {\
+	MCIF_WB_COMMON_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
+	mcif_wb_regs_dcn3(0)
+};
+
+static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define dsc_regsDCN20(id)\
+[id] = {\
+	DSC_REG_LIST_DCN20(id)\
+}
+
+static const struct dcn20_dsc_registers dsc_regs[] = {
+	dsc_regsDCN20(0),
+	dsc_regsDCN20(1),
+	dsc_regsDCN20(2),
+};
+
+static const struct dcn20_dsc_shift dsc_shift = {
+	DSC_REG_LIST_SH_MASK_DCN20(__SHIFT)
+};
+
+static const struct dcn20_dsc_mask dsc_mask = {
+	DSC_REG_LIST_SH_MASK_DCN20(_MASK)
+};
+
+static const struct dcn30_mpc_registers mpc_regs = {
+		MPC_REG_LIST_DCN3_0(0),
+		MPC_REG_LIST_DCN3_0(1),
+		MPC_REG_LIST_DCN3_0(2),
+		MPC_REG_LIST_DCN3_0(3),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(0),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(1),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(2),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(3),
+		MPC_RMU_GLOBAL_REG_LIST_DCN3AG,
+		MPC_RMU_REG_LIST_DCN3AG(0),
+		MPC_RMU_REG_LIST_DCN3AG(1),
+		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
+};
+
+static const struct dcn30_mpc_shift mpc_shift = {
+	MPC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+	MPC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define optc_regs(id)\
+[id] = {OPTC_COMMON_REG_LIST_DCN3_0(id)}
+
+
+static const struct dcn_optc_registers optc_regs[] = {
+	optc_regs(0),
+	optc_regs(1),
+	optc_regs(2),
+	optc_regs(3),
+};
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define hubp_regs(id)\
+[id] = {\
+	HUBP_REG_LIST_DCN30(id)\
+}
+
+static const struct dcn_hubp2_registers hubp_regs[] = {
+		hubp_regs(0),
+		hubp_regs(1),
+		hubp_regs(2),
+		hubp_regs(3),
+};
+
+static const struct dcn_hubp2_shift hubp_shift = {
+		HUBP_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static const struct dcn_hubbub_registers hubbub_reg = {
+		HUBBUB_REG_LIST_DCN301(0)
+};
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN301(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN301(_MASK)
+};
+
+static const struct dccg_registers dccg_regs = {
+		DCCG_REG_LIST_DCN301()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN301(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN301(_MASK)
+};
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCN301_REG_LIST()
+};
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN301_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN301_MASK_SH_LIST(_MASK)
+};
+#define vmid_regs(id)\
+[id] = {\
+		DCN20_VMID_REG_LIST(id)\
+}
+
+static const struct dcn_vmid_registers vmid_regs[] = {
+	vmid_regs(0),
+	vmid_regs(1),
+	vmid_regs(2),
+	vmid_regs(3),
+	vmid_regs(4),
+	vmid_regs(5),
+	vmid_regs(6),
+	vmid_regs(7),
+	vmid_regs(8),
+	vmid_regs(9),
+	vmid_regs(10),
+	vmid_regs(11),
+	vmid_regs(12),
+	vmid_regs(13),
+	vmid_regs(14),
+	vmid_regs(15)
+};
+
+static const struct dcn20_vmid_shift vmid_shifts = {
+		DCN20_VMID_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn20_vmid_mask vmid_masks = {
+		DCN20_VMID_MASK_SH_LIST(_MASK)
+};
+
+static const struct resource_caps res_cap_dcn301 = {
+	.num_timing_generator = 4,
+	.num_opp = 4,
+	.num_video_plane = 4,
+	.num_audio = 4,
+	.num_stream_encoder = 4,
+	.num_pll = 4,
+	.num_dwb = 1,
+	.num_ddc = 4,
+	.num_vmid = 16,
+	.num_mpc_3dlut = 2,
+	.num_dsc = 3,
+};
+
+static const struct dc_plane_cap plane_cap = {
+	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+	.blends_with_above = true,
+	.blends_with_below = true,
+	.per_pixel_alpha = true,
+
+	.pixel_format_support = {
+			.argb8888 = true,
+			.nv12 = true,
+			.fp16 = true,
+			.p010 = false,
+			.ayuv = false,
+	},
+
+	.max_upscale_factor = {
+			.argb8888 = 16000,
+			.nv12 = 16000,
+			.fp16 = 16000
+	},
+
+	.max_downscale_factor = {
+			.argb8888 = 600,
+			.nv12 = 600,
+			.fp16 = 600
+	},
+	64,
+	64
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = false,
+	.clock_trace = true,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_clock_gate = true,
+	.disable_pplib_clock_request = true,
+	.disable_pplib_wm_range = true,
+	.disable_stutter = true,
+	.pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
+	.force_single_disp_pipe_split = false,
+	.disable_dcc = DCC_ENABLE,
+	.vsr_support = true,
+	.performance_trace = false,
+	.max_downscale_src_width = 7680,/*upto 8K*/
+	.scl_reset_length10 = true,
+	.sanity_checks = false,
+	.underflow_assert_delay_us = 0xFFFFFFFF,
+	.dwb_fi_phase = -1, // -1 = disable
+	.dmub_command_table = true,
+};
+
+static const struct dc_debug_options debug_defaults_diags = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = true,
+	.clock_trace = true,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_clock_gate = true,
+	.disable_pplib_clock_request = true,
+	.disable_pplib_wm_range = true,
+	.disable_stutter = true,
+	.scl_reset_length10 = true,
+	.dwb_fi_phase = -1, // -1 = disable
+	.dmub_command_table = true,
+};
+
+void dcn301_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN20_DPP(*dpp));
+	*dpp = NULL;
+}
+
+struct dpp *dcn301_dpp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn3_dpp *dpp =
+		kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+
+	if (!dpp)
+		return NULL;
+
+	if (dpp3_construct(dpp, ctx, inst,
+			&dpp_regs[inst], &tf_shift, &tf_mask))
+		return &dpp->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+struct output_pixel_processor *dcn301_opp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp =
+		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dcn20_opp_construct(opp, ctx, inst,
+			&opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp->base;
+}
+
+struct dce_aux *dcn301_aux_engine_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine =
+		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst,
+				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+				    &aux_engine_regs[inst],
+					&aux_mask,
+					&aux_shift,
+					ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST(id) }
+
+static const struct dce_i2c_registers i2c_hw_regs[] = {
+		i2c_inst_regs(1),
+		i2c_inst_regs(2),
+		i2c_inst_regs(3),
+		i2c_inst_regs(4),
+};
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCN2(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCN2(_MASK)
+};
+
+struct dce_i2c_hw *dcn301_i2c_hw_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw =
+		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
+				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+static struct mpc *dcn301_mpc_create(
+		struct dc_context *ctx,
+		int num_mpcc,
+		int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc),
+					  GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+	dcn30_mpc_construct(mpc30, ctx,
+			&mpc_regs,
+			&mpc_shift,
+			&mpc_mask,
+			num_mpcc,
+			num_rmu);
+
+	return &mpc30->base;
+}
+
+struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub),
+					  GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+	hubbub301_construct(hubbub3, ctx,
+			&hubbub_reg,
+			&hubbub_shift,
+			&hubbub_mask);
+
+
+	for (i = 0; i < res_cap_dcn301.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	 hubbub3->num_vmid = res_cap_dcn301.num_vmid;
+
+	return &hubbub3->base;
+}
+
+struct timing_generator *dcn301_timing_generator_create(
+		struct dc_context *ctx,
+		uint32_t instance)
+{
+	struct optc *tgn10 =
+		kzalloc(sizeof(struct optc), GFP_KERNEL);
+
+	if (!tgn10)
+		return NULL;
+
+	tgn10->base.inst = instance;
+	tgn10->base.ctx = ctx;
+
+	tgn10->tg_regs = &optc_regs[instance];
+	tgn10->tg_shift = &optc_shift;
+	tgn10->tg_mask = &optc_mask;
+
+	dcn30_timing_generator_init(tgn10);
+
+	return &tgn10->base;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 600000,
+		.hdmi_ycbcr420_supported = true,
+		.dp_ycbcr420_supported = true,
+		.fec_supported = true,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_HBR3_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true,
+		.flags.bits.IS_TPS4_CAPABLE = true
+};
+
+struct link_encoder *dcn301_link_encoder_create(
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 =
+		kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+	dcn301_link_encoder_construct(enc20,
+			enc_init_data,
+			&link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter],
+			&link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source],
+			&le_shift,
+			&le_mask);
+
+	return &enc20->enc10.base;
+}
+
+struct panel_cntl *dcn301_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dcn301_panel_cntl *panel_cntl =
+		kzalloc(sizeof(struct dcn301_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dcn301_panel_cntl_construct(panel_cntl,
+			init_data,
+			&panel_cntl_regs[init_data->inst],
+			&panel_cntl_shift,
+			&panel_cntl_mask);
+
+	return &panel_cntl->base;
+}
+
+
+#define CTX ctx
+
+#define REG(reg_name) \
+	(DCN_BASE.instance[0].segment[mm ## reg_name ## _BASE_IDX] + mm ## reg_name)
+
+static uint32_t read_pipe_fuses(struct dc_context *ctx)
+{
+	uint32_t value = REG_READ(CC_DC_PIPE_DIS);
+	/* RV1 support max 4 pipes */
+	value = value & 0xf;
+	return value;
+}
+
+
+static void read_dce_straps(
+	struct dc_context *ctx,
+	struct resource_straps *straps)
+{
+	generic_reg_get(ctx, mmDC_PINSTRAPS + BASE(mmDC_PINSTRAPS_BASE_IDX),
+		FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+
+}
+
+static struct audio *dcn301_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn301_vpg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn30_vpg *vpg3 = kzalloc(sizeof(struct dcn30_vpg), GFP_KERNEL);
+
+	if (!vpg3)
+		return NULL;
+
+	vpg3_construct(vpg3, ctx, inst,
+			&vpg_regs[inst],
+			&vpg_shift,
+			&vpg_mask);
+
+	return &vpg3->base;
+}
+
+static struct afmt *dcn301_afmt_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn30_afmt *afmt3 = kzalloc(sizeof(struct dcn30_afmt), GFP_KERNEL);
+
+	if (!afmt3)
+		return NULL;
+
+	afmt3_construct(afmt3, ctx, inst,
+			&afmt_regs[inst],
+			&afmt_shift,
+			&afmt_mask);
+
+	return &afmt3->base;
+}
+
+struct stream_encoder *dcn301_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGF) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn301_vpg_create(ctx, vpg_inst);
+	afmt = dcn301_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt)
+		return NULL;
+
+	dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+struct dce_hwseq *dcn301_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = dcn301_create_audio,
+	.create_stream_encoder = dcn301_stream_encoder_create,
+	.create_hwseq = dcn301_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+	.read_dce_straps = NULL,
+	.create_audio = NULL,
+	.create_stream_encoder = NULL,
+	.create_hwseq = dcn301_hwseq_create,
+};
+
+static void dcn301_pp_smu_destroy(struct pp_smu_funcs **pp_smu);
+
+static void dcn301_destruct(struct dcn301_resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->base.stream_enc_count; i++) {
+		if (pool->base.stream_enc[i] != NULL) {
+			if (pool->base.stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.stream_enc[i]->vpg));
+				pool->base.stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->base.stream_enc[i]->afmt));
+				pool->base.stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+			pool->base.stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		if (pool->base.dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->base.dscs[i]);
+	}
+
+	if (pool->base.mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->base.mpc));
+		pool->base.mpc = NULL;
+	}
+	if (pool->base.hubbub != NULL) {
+		kfree(pool->base.hubbub);
+		pool->base.hubbub = NULL;
+	}
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.dpps[i] != NULL)
+			dcn301_dpp_destroy(&pool->base.dpps[i]);
+
+		if (pool->base.ipps[i] != NULL)
+			pool->base.ipps[i]->funcs->ipp_destroy(&pool->base.ipps[i]);
+
+		if (pool->base.hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->base.hubps[i]));
+			pool->base.hubps[i] = NULL;
+		}
+
+		if (pool->base.irqs != NULL) {
+			dal_irq_service_destroy(&pool->base.irqs);
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		if (pool->base.engines[i] != NULL)
+			dce110_engine_destroy(&pool->base.engines[i]);
+		if (pool->base.hw_i2cs[i] != NULL) {
+			kfree(pool->base.hw_i2cs[i]);
+			pool->base.hw_i2cs[i] = NULL;
+		}
+		if (pool->base.sw_i2cs[i] != NULL) {
+			kfree(pool->base.sw_i2cs[i]);
+			pool->base.sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		if (pool->base.opps[i] != NULL)
+			pool->base.opps[i]->funcs->opp_destroy(&pool->base.opps[i]);
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->base.timing_generators[i]));
+			pool->base.timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dwb; i++) {
+		if (pool->base.dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->base.dwbc[i]));
+			pool->base.dwbc[i] = NULL;
+		}
+		if (pool->base.mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->base.mcif_wb[i]));
+			pool->base.mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.audio_count; i++) {
+		if (pool->base.audios[i])
+			dce_aud_destroy(&pool->base.audios[i]);
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] != NULL) {
+			dcn20_clock_source_destroy(&pool->base.clock_sources[i]);
+			pool->base.clock_sources[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_mpc_3dlut; i++) {
+		if (pool->base.mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->base.mpc_lut[i]);
+			pool->base.mpc_lut[i] = NULL;
+		}
+		if (pool->base.mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->base.mpc_shaper[i]);
+			pool->base.mpc_shaper[i] = NULL;
+		}
+	}
+
+	if (pool->base.dp_clock_source != NULL) {
+		dcn20_clock_source_destroy(&pool->base.dp_clock_source);
+		pool->base.dp_clock_source = NULL;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->base.multiple_abms[i]);
+	}
+
+	if (pool->base.dccg != NULL)
+		dcn_dccg_destroy(&pool->base.dccg);
+
+	if (pool->base.pp_smu != NULL)
+		dcn301_pp_smu_destroy(&pool->base.pp_smu);
+}
+
+struct hubp *dcn301_hubp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 =
+		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+	if (hubp3_construct(hubp2, ctx, inst,
+			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc),
+						    GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+		dcn30_dwbc_construct(dwbc30, ctx,
+				&dwbc30_regs[i],
+				&dwbc30_shift,
+				&dwbc30_mask,
+				i);
+
+		pool->dwbc[i] = &dwbc30->base;
+	}
+	return true;
+}
+
+bool dcn301_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub),
+						    GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+		dcn30_mmhubbub_construct(mcif_wb30, ctx,
+				&mcif_wb30_regs[i],
+				&mcif_wb30_shift,
+				&mcif_wb30_mask,
+				i);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+static struct display_stream_compressor *dcn301_dsc_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc =
+		kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
+
+	if (!dsc) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dsc2_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
+	return &dsc->base;
+}
+
+
+static void dcn301_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn301_resource_pool *dcn301_pool = TO_DCN301_RES_POOL(*pool);
+
+	dcn301_destruct(dcn301_pool);
+	kfree(dcn301_pool);
+	*pool = NULL;
+}
+
+static struct clock_source *dcn301_clock_source_create(
+		struct dc_context *ctx,
+		struct dc_bios *bios,
+		enum clock_source_id id,
+		const struct dce110_clk_src_regs *regs,
+		bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src =
+		kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn301_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+#define fixed16_to_double(x) (((double) x) / ((double) (1 << 16)))
+#define fixed16_to_double_to_cpu(x) fixed16_to_double(le32_to_cpu(x))
+
+static bool is_soc_bounding_box_valid(struct dc *dc)
+{
+	uint32_t hw_internal_rev = dc->ctx->asic_id.hw_internal_rev;
+
+	if (ASICREV_IS_VANGOGH(hw_internal_rev))
+		return true;
+
+	return false;
+}
+
+static bool init_soc_bounding_box(struct dc *dc,
+				  struct dcn301_resource_pool *pool)
+{
+	const struct gpu_info_soc_bounding_box_v1_0 *bb = dc->soc_bounding_box;
+	struct _vcs_dpi_soc_bounding_box_st *loaded_bb = &dcn3_01_soc;
+	struct _vcs_dpi_ip_params_st *loaded_ip = &dcn3_01_ip;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!bb && !is_soc_bounding_box_valid(dc)) {
+		DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
+		return false;
+	}
+
+	if (bb && !is_soc_bounding_box_valid(dc)) {
+		int i;
+
+		dcn3_01_soc.sr_exit_time_us =
+				fixed16_to_double_to_cpu(bb->sr_exit_time_us);
+		dcn3_01_soc.sr_enter_plus_exit_time_us =
+				fixed16_to_double_to_cpu(bb->sr_enter_plus_exit_time_us);
+		dcn3_01_soc.urgent_latency_us =
+				fixed16_to_double_to_cpu(bb->urgent_latency_us);
+		dcn3_01_soc.urgent_latency_pixel_data_only_us =
+				fixed16_to_double_to_cpu(bb->urgent_latency_pixel_data_only_us);
+		dcn3_01_soc.urgent_latency_pixel_mixed_with_vm_data_us =
+				fixed16_to_double_to_cpu(bb->urgent_latency_pixel_mixed_with_vm_data_us);
+		dcn3_01_soc.urgent_latency_vm_data_only_us =
+				fixed16_to_double_to_cpu(bb->urgent_latency_vm_data_only_us);
+		dcn3_01_soc.urgent_out_of_order_return_per_channel_pixel_only_bytes =
+				le32_to_cpu(bb->urgent_out_of_order_return_per_channel_pixel_only_bytes);
+		dcn3_01_soc.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =
+				le32_to_cpu(bb->urgent_out_of_order_return_per_channel_pixel_and_vm_bytes);
+		dcn3_01_soc.urgent_out_of_order_return_per_channel_vm_only_bytes =
+				le32_to_cpu(bb->urgent_out_of_order_return_per_channel_vm_only_bytes);
+		dcn3_01_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only =
+				fixed16_to_double_to_cpu(bb->pct_ideal_dram_sdp_bw_after_urgent_pixel_only);
+		dcn3_01_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =
+				fixed16_to_double_to_cpu(bb->pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm);
+		dcn3_01_soc.pct_ideal_dram_sdp_bw_after_urgent_vm_only =
+				fixed16_to_double_to_cpu(bb->pct_ideal_dram_sdp_bw_after_urgent_vm_only);
+		dcn3_01_soc.max_avg_sdp_bw_use_normal_percent =
+				fixed16_to_double_to_cpu(bb->max_avg_sdp_bw_use_normal_percent);
+		dcn3_01_soc.max_avg_dram_bw_use_normal_percent =
+				fixed16_to_double_to_cpu(bb->max_avg_dram_bw_use_normal_percent);
+		dcn3_01_soc.writeback_latency_us =
+				fixed16_to_double_to_cpu(bb->writeback_latency_us);
+		dcn3_01_soc.ideal_dram_bw_after_urgent_percent =
+				fixed16_to_double_to_cpu(bb->ideal_dram_bw_after_urgent_percent);
+		dcn3_01_soc.max_request_size_bytes =
+				le32_to_cpu(bb->max_request_size_bytes);
+		dcn3_01_soc.dram_channel_width_bytes =
+				le32_to_cpu(bb->dram_channel_width_bytes);
+		dcn3_01_soc.fabric_datapath_to_dcn_data_return_bytes =
+				le32_to_cpu(bb->fabric_datapath_to_dcn_data_return_bytes);
+		dcn3_01_soc.dcn_downspread_percent =
+				fixed16_to_double_to_cpu(bb->dcn_downspread_percent);
+		dcn3_01_soc.downspread_percent =
+				fixed16_to_double_to_cpu(bb->downspread_percent);
+		dcn3_01_soc.dram_page_open_time_ns =
+				fixed16_to_double_to_cpu(bb->dram_page_open_time_ns);
+		dcn3_01_soc.dram_rw_turnaround_time_ns =
+				fixed16_to_double_to_cpu(bb->dram_rw_turnaround_time_ns);
+		dcn3_01_soc.dram_return_buffer_per_channel_bytes =
+				le32_to_cpu(bb->dram_return_buffer_per_channel_bytes);
+		dcn3_01_soc.round_trip_ping_latency_dcfclk_cycles =
+				le32_to_cpu(bb->round_trip_ping_latency_dcfclk_cycles);
+		dcn3_01_soc.urgent_out_of_order_return_per_channel_bytes =
+				le32_to_cpu(bb->urgent_out_of_order_return_per_channel_bytes);
+		dcn3_01_soc.channel_interleave_bytes =
+				le32_to_cpu(bb->channel_interleave_bytes);
+		dcn3_01_soc.num_banks =
+				le32_to_cpu(bb->num_banks);
+		dcn3_01_soc.num_chans =
+				le32_to_cpu(bb->num_chans);
+		dcn3_01_soc.gpuvm_min_page_size_bytes =
+				le32_to_cpu(bb->vmm_page_size_bytes);
+		dcn3_01_soc.dram_clock_change_latency_us =
+				fixed16_to_double_to_cpu(bb->dram_clock_change_latency_us);
+		dcn3_01_soc.writeback_dram_clock_change_latency_us =
+				fixed16_to_double_to_cpu(bb->writeback_dram_clock_change_latency_us);
+		dcn3_01_soc.return_bus_width_bytes =
+				le32_to_cpu(bb->return_bus_width_bytes);
+		dcn3_01_soc.dispclk_dppclk_vco_speed_mhz =
+				le32_to_cpu(bb->dispclk_dppclk_vco_speed_mhz);
+		dcn3_01_soc.xfc_bus_transport_time_us =
+				le32_to_cpu(bb->xfc_bus_transport_time_us);
+		dcn3_01_soc.xfc_xbuf_latency_tolerance_us =
+				le32_to_cpu(bb->xfc_xbuf_latency_tolerance_us);
+		dcn3_01_soc.use_urgent_burst_bw =
+				le32_to_cpu(bb->use_urgent_burst_bw);
+		dcn3_01_soc.num_states =
+				le32_to_cpu(bb->num_states);
+
+		for (i = 0; i < dcn3_01_soc.num_states; i++) {
+			dcn3_01_soc.clock_limits[i].state =
+					le32_to_cpu(bb->clock_limits[i].state);
+			dcn3_01_soc.clock_limits[i].dcfclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].dcfclk_mhz);
+			dcn3_01_soc.clock_limits[i].fabricclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].fabricclk_mhz);
+			dcn3_01_soc.clock_limits[i].dispclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].dispclk_mhz);
+			dcn3_01_soc.clock_limits[i].dppclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].dppclk_mhz);
+			dcn3_01_soc.clock_limits[i].phyclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].phyclk_mhz);
+			dcn3_01_soc.clock_limits[i].socclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].socclk_mhz);
+			dcn3_01_soc.clock_limits[i].dscclk_mhz =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].dscclk_mhz);
+			dcn3_01_soc.clock_limits[i].dram_speed_mts =
+					fixed16_to_double_to_cpu(bb->clock_limits[i].dram_speed_mts);
+		}
+	}
+
+	if (pool->base.pp_smu) {
+		struct pp_smu_nv_clock_table max_clocks = {0};
+		unsigned int uclk_states[8] = {0};
+		unsigned int num_states = 0;
+		enum pp_smu_status status;
+		bool clock_limits_available = false;
+		bool uclk_states_available = false;
+
+		if (pool->base.pp_smu->nv_funcs.get_uclk_dpm_states) {
+			status = (pool->base.pp_smu->nv_funcs.get_uclk_dpm_states)
+				(&pool->base.pp_smu->nv_funcs.pp_smu, uclk_states, &num_states);
+
+			uclk_states_available = (status == PP_SMU_RESULT_OK);
+		}
+
+		if (pool->base.pp_smu->nv_funcs.get_maximum_sustainable_clocks) {
+			status = (*pool->base.pp_smu->nv_funcs.get_maximum_sustainable_clocks)
+					(&pool->base.pp_smu->nv_funcs.pp_smu, &max_clocks);
+			/* SMU cannot set DCF clock to anything equal to or higher than SOC clock
+			 */
+			if (max_clocks.dcfClockInKhz >= max_clocks.socClockInKhz)
+				max_clocks.dcfClockInKhz = max_clocks.socClockInKhz - 1000;
+			clock_limits_available = (status == PP_SMU_RESULT_OK);
+		}
+
+		if (clock_limits_available && uclk_states_available && num_states)
+			dcn20_update_bounding_box(dc, loaded_bb, &max_clocks, uclk_states, num_states);
+		else if (clock_limits_available)
+			dcn20_cap_soc_clocks(loaded_bb, max_clocks);
+	}
+
+	loaded_ip->max_num_otg = pool->base.res_cap->num_timing_generator;
+	loaded_ip->max_num_dpp = pool->base.pipe_count;
+	dcn20_patch_bounding_box(dc, loaded_bb);
+
+	return true;
+}
+
+static void set_wm_ranges(
+		struct pp_smu_funcs *pp_smu,
+		struct _vcs_dpi_soc_bounding_box_st *loaded_bb)
+{
+	struct pp_smu_wm_range_sets ranges = {0};
+	int i;
+
+	ranges.num_reader_wm_sets = 0;
+
+	if (loaded_bb->num_states == 1) {
+		ranges.reader_wm_sets[0].wm_inst = 0;
+		ranges.reader_wm_sets[0].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+		ranges.reader_wm_sets[0].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+		ranges.reader_wm_sets[0].min_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+		ranges.reader_wm_sets[0].max_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+
+		ranges.num_reader_wm_sets = 1;
+	} else if (loaded_bb->num_states > 1) {
+		for (i = 0; i < 4 && i < loaded_bb->num_states; i++) {
+			ranges.reader_wm_sets[i].wm_inst = i;
+			ranges.reader_wm_sets[i].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+			ranges.reader_wm_sets[i].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+			ranges.reader_wm_sets[i].min_fill_clk_mhz = (i > 0) ? (loaded_bb->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
+			ranges.reader_wm_sets[i].max_fill_clk_mhz = loaded_bb->clock_limits[i].dram_speed_mts / 16;
+
+			ranges.num_reader_wm_sets = i + 1;
+		}
+
+		ranges.reader_wm_sets[0].min_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+		ranges.reader_wm_sets[ranges.num_reader_wm_sets - 1].max_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+	}
+
+	ranges.num_writer_wm_sets = 1;
+
+	ranges.writer_wm_sets[0].wm_inst = 0;
+	ranges.writer_wm_sets[0].min_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+	ranges.writer_wm_sets[0].max_fill_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+	ranges.writer_wm_sets[0].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
+	ranges.writer_wm_sets[0].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+
+	/* Notify PP Lib/SMU which Watermarks to use for which clock ranges */
+	pp_smu->nv_funcs.set_wm_ranges(&pp_smu->nv_funcs.pp_smu, &ranges);
+}
+
+static struct pp_smu_funcs *dcn301_pp_smu_create(struct dc_context *ctx)
+{
+	struct pp_smu_funcs *pp_smu = kzalloc(sizeof(*pp_smu), GFP_KERNEL);
+
+	if (!pp_smu)
+		return pp_smu;
+
+	if (!IS_FPGA_MAXIMUS_DC(ctx->dce_environment) && !IS_DIAG_DC(ctx->dce_environment)) {
+		dm_pp_get_funcs(ctx, pp_smu);
+
+		/* TODO: update once we have n21 smu*/
+		if (pp_smu->ctx.ver != PP_SMU_VER_NV)
+			pp_smu = memset(pp_smu, 0, sizeof(struct pp_smu_funcs));
+	}
+
+	return pp_smu;
+}
+
+static void dcn301_pp_smu_destroy(struct pp_smu_funcs **pp_smu)
+{
+	if (pp_smu && *pp_smu) {
+		kfree(*pp_smu);
+		*pp_smu = NULL;
+	}
+}
+
+static void dcn301_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	dcn3_01_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+}
+
+static struct resource_funcs dcn301_res_pool_funcs = {
+	.destroy = dcn301_destroy_resource_pool,
+	.link_enc_create = dcn301_link_encoder_create,
+	.panel_cntl_create = dcn301_panel_cntl_create,
+	.validate_bandwidth = dcn30_validate_bandwidth,
+	.calculate_wm = dcn30_calculate_wm,
+	.populate_dml_pipes = dcn30_populate_dml_pipes_from_context,
+	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn301_update_bw_bounding_box
+};
+
+static bool dcn301_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn301_resource_pool *pool)
+{
+	int i, j;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+	uint32_t pipe_fuses = read_pipe_fuses(ctx);
+	uint32_t num_pipes = 0;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn301;
+
+	pool->base.funcs = &dcn301_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
+	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.max_cursor_size = 256;
+	dc->caps.dmdata_alloc_size = 2048;
+	dc->caps.max_slave_planes = 1;
+	dc->caps.is_apu = true;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	dc->caps.extended_aux_timeout_support = true;
+#ifdef CONFIG_DRM_AMD_DC_DMUB
+	dc->caps.dmcub_support = true;
+#endif
+
+	/* Color pipeline capabilities */
+	dc->caps.color.dpp.dcn_arch = 1;
+	dc->caps.color.dpp.input_lut_shared = 0;
+	dc->caps.color.dpp.icsc = 1;
+	dc->caps.color.dpp.dgam_ram = 0; // must use gamma_corr
+	dc->caps.color.dpp.dgam_rom_caps.srgb = 1;
+	dc->caps.color.dpp.dgam_rom_caps.bt2020 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.gamma2_2 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.pq = 1;
+	dc->caps.color.dpp.dgam_rom_caps.hlg = 1;
+	dc->caps.color.dpp.post_csc = 1;
+	dc->caps.color.dpp.gamma_corr = 1;
+
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 1;
+	// no OGAM ROM on DCN301
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->base.res_cap->num_mpc_3dlut; //2
+	dc->caps.color.mpc.ogam_ram = 1;
+	dc->caps.color.mpc.ogam_rom_caps.srgb = 0;
+	dc->caps.color.mpc.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.pq = 0;
+	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
+	dc->caps.color.mpc.ocsc = 1;
+
+	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
+		dc->debug = debug_defaults_drv;
+	else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS) {
+		dc->debug = debug_defaults_diags;
+	} else
+		dc->debug = debug_defaults_diags;
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->base.clock_sources[DCN301_CLK_SRC_PLL0] =
+			dcn301_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN301_CLK_SRC_PLL1] =
+			dcn301_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN301_CLK_SRC_PLL2] =
+			dcn301_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN301_CLK_SRC_PLL3] =
+			dcn301_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+
+	pool->base.clk_src_count = DCN301_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn301_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_ID_DP_DTO,
+				&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* DCCG */
+	pool->base.dccg = dccg301_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* PP Lib and SMU interfaces */
+	pool->base.pp_smu = dcn301_pp_smu_create(ctx);
+	init_soc_bounding_box(dc, pool);
+	if (!dc->debug.disable_pplib_wm_range && pool->base.pp_smu->nv_funcs.set_wm_ranges)
+		set_wm_ranges(pool->base.pp_smu, &dcn3_01_soc);
+
+	num_pipes = dcn3_01_ip.max_num_dpp;
+
+	for (i = 0; i < dcn3_01_ip.max_num_dpp; i++)
+		if (pipe_fuses & 1 << i)
+			num_pipes--;
+	dcn3_01_ip.max_num_dpp = num_pipes;
+	dcn3_01_ip.max_num_otg = num_pipes;
+
+
+	dml_init_instance(&dc->dml, &dcn3_01_soc, &dcn3_01_ip, DML_PROJECT_DCN30);
+
+	/* IRQ */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn30_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn301_hubbub_create(ctx);
+	if (pool->base.hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	j = 0;
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->base.pipe_count; i++) {
+
+		/* if pipe is disabled, skip instance of HW pipe,
+		 * i.e, skip ASIC register instance
+		 */
+		if ((pipe_fuses & (1 << i)) != 0) {
+			DC_LOG_DEBUG("%s: fusing pipe %d\n", __func__, i);
+			continue;
+		}
+
+		pool->base.hubps[j] = dcn301_hubp_create(ctx, i);
+		if (pool->base.hubps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->base.dpps[j] = dcn301_dpp_create(ctx, i);
+		if (pool->base.dpps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+
+		pool->base.opps[j] = dcn301_opp_create(ctx, i);
+		if (pool->base.opps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+
+		pool->base.timing_generators[j] = dcn301_timing_generator_create(ctx, i);
+		if (pool->base.timing_generators[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+		j++;
+	}
+	pool->base.timing_generator_count = j;
+	pool->base.pipe_count = j;
+	pool->base.mpcc_count = j;
+
+	/* ABM (or ABMs for NV2x) */
+	/* TODO: */
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.multiple_abms[i] = dce_abm_create(ctx,
+				&abm_regs[i],
+				&abm_shift,
+				&abm_mask);
+		if (pool->base.multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->base.mpc = dcn301_mpc_create(ctx, pool->base.mpcc_count, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn301_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn301_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn301_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn301_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn301_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->base.sw_i2cs[i] = NULL;
+	}
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+			&res_create_funcs : &res_create_maximus_funcs)))
+			goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn301_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+	return true;
+
+create_fail:
+
+	dcn301_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn301_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn301_resource_pool *pool =
+		kzalloc(sizeof(struct dcn301_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn301_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.h
new file mode 100644
index 000000000000..17e4e91ff4b8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DCN301_RESOURCE_H_
+#define _DCN301_RESOURCE_H_
+
+#include "core_types.h"
+
+struct dc;
+struct resource_pool;
+struct _vcs_dpi_display_pipe_params_st;
+
+struct dcn301_resource_pool {
+	struct resource_pool base;
+};
+struct resource_pool *dcn301_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+#endif /* _DCN301_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h b/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
index 3586934df25f..e05273d4739d 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_pp_smu.h
@@ -278,14 +278,38 @@ struct pp_smu_funcs_rn {
 	enum pp_smu_status (*get_dpm_clock_table) (struct pp_smu *pp,
 			struct dpm_clocks *clock_table);
 };
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+struct pp_smu_funcs_vgh {
+	struct pp_smu pp_smu;
 
+	/*
+	 * reader and writer WM's are sent together as part of one table
+	 *
+	 * PPSMC_MSG_SetDriverDramAddrHigh
+	 * PPSMC_MSG_SetDriverDramAddrLow
+	 * PPSMC_MSG_TransferTableDram2Smu
+	 *
+	 */
+	// TODO: Check whether this is moved to DAL, and remove as needed
+	enum pp_smu_status (*set_wm_ranges)(struct pp_smu *pp,
+			struct pp_smu_wm_range_sets *ranges);
+
+	// TODO: Check whether this is moved to DAL, and remove as needed
+	enum pp_smu_status (*get_dpm_clock_table) (struct pp_smu *pp,
+			struct dpm_clocks *clock_table);
+
+	enum pp_smu_status (*notify_smu_timeout) (struct pp_smu *pp);
+};
+#endif
 struct pp_smu_funcs {
 	struct pp_smu ctx;
 	union {
 		struct pp_smu_funcs_rv rv_funcs;
 		struct pp_smu_funcs_nv nv_funcs;
 		struct pp_smu_funcs_rn rn_funcs;
-
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+		struct pp_smu_funcs_vgh vgh_funcs;
+#endif
 	};
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
index 6fc8a6e9dc15..f9ed80c48980 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
@@ -114,6 +114,9 @@ bool dal_hw_factory_init(
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case DCN_VERSION_3_01:
+#endif
 		dal_hw_factory_dcn30_init(factory);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
index 3a93c945e57d..8abc4b0a961c 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -109,6 +109,9 @@ bool dal_hw_translate_init(
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case DCN_VERSION_3_0:
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	case DCN_VERSION_3_01:
+#endif
 		dal_hw_translate_dcn30_init(translate);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 947d6106f341..35d1b85713b2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -62,6 +62,25 @@ struct dcn3_clk_internal {
 };
 
 #endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+struct dcn301_clk_internal {
+	int dummy;
+	uint32_t CLK1_CLK0_CURRENT_CNT; //dispclk
+	uint32_t CLK1_CLK1_CURRENT_CNT; //dppclk
+	uint32_t CLK1_CLK2_CURRENT_CNT; //dprefclk
+	uint32_t CLK1_CLK3_CURRENT_CNT; //dcfclk
+	uint32_t CLK1_CLK3_DS_CNTL;	//dcf_deep_sleep_divider
+	uint32_t CLK1_CLK3_ALLOW_DS;	//dcf_deep_sleep_allow
+
+	uint32_t CLK1_CLK0_BYPASS_CNTL; //dispclk bypass
+	uint32_t CLK1_CLK1_BYPASS_CNTL; //dppclk bypass
+	uint32_t CLK1_CLK2_BYPASS_CNTL; //dprefclk bypass
+	uint32_t CLK1_CLK3_BYPASS_CNTL; //dcfclk bypass
+};
+
+#endif
+
 /* Will these bw structures be ASIC specific? */
 
 #define MAX_NUM_DPM_LVL		8
@@ -262,6 +281,17 @@ struct clk_mgr_funcs {
 #endif
 };
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+struct dpm_clocks;
+struct wartermarks;
+
+struct smu_watermark_set {
+	struct watermarks *wm_set;
+	union large_integer mc_address;
+};
+
+#endif
+
 struct clk_mgr {
 	struct dc_context *ctx;
 	struct clk_mgr_funcs *funcs;
@@ -275,6 +305,9 @@ struct clk_mgr {
 	struct clk_state_registers_and_bypass boot_snapshot;
 	struct clk_bw_params *bw_params;
 	struct pp_smu_wm_range_sets ranges;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+	struct smu_watermark_set smu_wm_set;
+#endif
 };
 
 /* forward declarations */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index 65f182c8bf14..371da657c8a4 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -152,6 +152,10 @@ struct hubbub_funcs {
 	void (*apply_DEDCN21_147_wa)(struct hubbub *hubbub);
 
 	void (*force_wm_propagate_to_pipes)(struct hubbub *hubbub);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+	void (*force_pstate_change_control)(struct hubbub *hubbub, bool force, bool allow);
+#endif
 };
 
 struct hubbub {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index 286cceeb9c24..0dbd5a55de33 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -187,6 +187,11 @@ struct hubp_funcs {
 			struct _vcs_dpi_display_rq_regs_st *dml_rq_regs,
 			struct _vcs_dpi_display_dlg_regs_st *dml_dlg_attr,
 			struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	void (*set_unbounded_requesting)(
+		struct hubp *hubp,
+		bool enable);
+#endif
 
 };
 
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index c6a8d6c54621..47c1da263d9d 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -90,6 +90,9 @@ enum dmub_asic {
 	DMUB_ASIC_DCN21,
 #ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	DMUB_ASIC_DCN30,
+#endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+	DMUB_ASIC_DCN301,
 #endif
 	DMUB_ASIC_MAX,
 };
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index bb584f39cad0..f40d82e19e59 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -22,7 +22,7 @@
 
 DMUB = dmub_srv.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
 ifdef CONFIG_DRM_AMD_DC_DCN3_0
-DMUB += dmub_dcn30.o
+DMUB += dmub_dcn30.o dmub_dcn301.o
 endif
 
 AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c
new file mode 100644
index 000000000000..197398257692
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c
@@ -0,0 +1,55 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "../dmub_srv.h"
+#include "dmub_reg.h"
+#include "dmub_dcn301.h"
+
+#include "dcn/dcn_3_0_1_offset.h"
+#include "dcn/dcn_3_0_1_sh_mask.h"
+#include "vangogh_ip_offset.h"
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG##seg
+#define CTX dmub
+#define REGS dmub->regs
+
+/* Registers. */
+
+const struct dmub_srv_common_regs dmub_srv_dcn301_regs = {
+#define DMUB_SR(reg) REG_OFFSET(reg),
+	{ DMUB_COMMON_REGS() },
+#undef DMUB_SR
+
+#define DMUB_SF(reg, field) FD_MASK(reg, field),
+	{ DMUB_COMMON_FIELDS() },
+#undef DMUB_SF
+
+#define DMUB_SF(reg, field) FD_SHIFT(reg, field),
+	{ DMUB_COMMON_FIELDS() },
+#undef DMUB_SF
+};
+
+/* Shared functions. */
+
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.h
new file mode 100644
index 000000000000..faafaf300583
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DMUB_DCN301_H_
+#define _DMUB_DCN301_H_
+
+#include "dmub_dcn20.h"
+
+/* Registers. */
+
+extern const struct dmub_srv_common_regs dmub_srv_dcn301_regs;
+
+/* Hardware functions. */
+
+#endif /* _DMUB_DCN301_H_ */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 08da423b24a1..8ba7ecd29665 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -30,6 +30,9 @@
 #ifdef CONFIG_DRM_AMD_DC_DCN3_0
 #include "dmub_dcn30.h"
 #endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+#include "dmub_dcn301.h"
+#endif
 #include "os_types.h"
 /*
  * Note: the DMUB service is standalone. No additional headers should be
@@ -138,6 +141,9 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 	case DMUB_ASIC_DCN21:
 #ifdef CONFIG_DRM_AMD_DC_DCN3_0
 	case DMUB_ASIC_DCN30:
+#endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+	case DMUB_ASIC_DCN301:
 #endif
 		dmub->regs = &dmub_srv_dcn20_regs;
 
@@ -169,6 +175,14 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
 #endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_01
+		if (asic == DMUB_ASIC_DCN301) {
+			dmub->regs = &dmub_srv_dcn301_regs;
+
+			funcs->backdoor_load = dmub_dcn30_backdoor_load;
+			funcs->setup_windows = dmub_dcn30_setup_windows;
+		}
+#endif
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index b267987aed06..b6b60a9c0509 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -205,6 +205,16 @@ enum {
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 #define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0))
 #endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+#define FAMILY_VGH 144
+#define DEVICE_ID_VGH_163F 0x163F
+#define VANGOGH_A0 0x01
+#define VANGOGH_UNKNOWN 0xFF
+
+#ifndef ASICREV_IS_VANGOGH
+#define ASICREV_IS_VANGOGH(eChipRev) ((eChipRev >= VANGOGH_A0) && (eChipRev < VANGOGH_UNKNOWN))
+#endif
+#endif
 
 /*
  * ASIC chip ID
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 8aaa3af69202..9cf6853193f8 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -51,7 +51,12 @@ enum dce_version {
 	DCN_VERSION_1_01,
 	DCN_VERSION_2_0,
 	DCN_VERSION_2_1,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	DCN_VERSION_3_0,
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	DCN_VERSION_3_01,
+#endif
 	DCN_VERSION_MAX
 };
 
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 7a06e3914c00..04dd546a143c 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -284,6 +284,18 @@ struct ext_hdmi_settings {
 	struct i2c_reg_info      reg_settings_6g[3];
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+struct edp_info {
+	uint16_t edp_backlight_pwm_hz;
+	uint16_t edp_ss_percentage;
+	uint16_t edp_ss_rate_10hz;
+	uint8_t  edp_pwr_on_off_delay;
+	uint8_t  edp_pwr_on_vary_bl_to_blon;
+	uint8_t  edp_pwr_down_bloff_to_vary_bloff;
+	uint8_t  edp_panel_bpc;
+	uint8_t  edp_bootup_bl_level;
+};
+#endif
 
 /* V6 */
 struct integrated_info {
@@ -403,6 +415,11 @@ struct integrated_info {
 	struct i2c_reg_info dp3_ext_hdmi_6g_reg_settings[3];
 	/* V11 */
 	uint32_t dp_ss_control;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_01)
+	/* V2.1 */
+	struct edp_info edp1_info;
+	struct edp_info edp2_info;
+#endif
 };
 
 /**
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
