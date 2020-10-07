Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D128646F
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05696E97E;
	Wed,  7 Oct 2020 16:33:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10D6E97E
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:59 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id s4so3469896qkf.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTlXpKk487cHl5vL4Uj1vnQpn5miNY73iDu572F6wWM=;
 b=Tns+AHnTPrypBbj5t+g8zboKIwX4vW3Llx45yO84CtAwWoOh0jaLZlnJQlRhF19iY1
 223XumNKV7NdAAxBgEasQAbXoT61knWR2SulWBiIX02Ki2wmj0D9Eqhd15+M917g+6pz
 SVwTzdhGm2BQBJDe8YiyoEEsO7ZuZ2/fzBusgy0z9AHrh2NZCfjxjMRE+XT4SlwvDWLd
 JXueab01QwrgS/M4yEsKTQFFMmqmJS6MjjaE8woTXh62l8lX1PzoHYFvMQLmX7eRusHt
 Tq9H1IzeUF7CfEiqfPgDwL/pVCQ2Ix+klhMssJg4QJ7A0uqzuvtOvFyUHbcZylkeY6TF
 buUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTlXpKk487cHl5vL4Uj1vnQpn5miNY73iDu572F6wWM=;
 b=Q+4cYcWo1RrmSKR64VPP6TYTJ3dDGhghZZVeDGLzf6fNeYeHVaimh4WdB9W9UDiZ00
 iSHaatRpgT9hb9TXITZV9e1N2eBHZDl8hJo+2SrA/AdkQnk6Cjf4IKMRKNVeqrEGIO79
 RU6nD/Kdv0a9iVGIoY7bVFSIfSytSGBk744jflZo6BCvtnih8QqviZlmHtHrn6VUvvnK
 nN0CfcmAJznzwc0FwG/zWl5S0EgF+kaUIWRtfa148jc6CO5bbtVYnHiDkPiWLP7s9DqG
 nUGp0w1s/0TMNiMinRsMsZq0BIBHKgVpo53hYYlR86nlLsXQJ1eM8GOa255mn42eEIEz
 LDAA==
X-Gm-Message-State: AOAM532ZHF9s3qN6Ic/yShojdvSYbMcRKKWEglS0gTX+pn8hrPWlUDq+
 XN0gOoVkP4C95Ap2okN9RSrRdXbcgOA=
X-Google-Smtp-Source: ABdhPJzywUXLxYVRL+VTiFyr1RnV2OUkJgEwWMGP9KIvP0MZsChXpNdnectz2mqE9tOp01H0lhj9LQ==
X-Received: by 2002:a05:620a:a4c:: with SMTP id
 j12mr2439081qka.263.1602088376266; 
 Wed, 07 Oct 2020 09:32:56 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 49/50] drm/amd/display: Add support for DCN302 (v2)
Date: Wed,  7 Oct 2020 12:31:34 -0400
Message-Id: <20201007163135.1944186-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007163135.1944186-1-alexander.deucher@amd.com>
References: <20201007163135.1944186-1-alexander.deucher@amd.com>
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
 Joshua Aberback <joshua.aberback@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

 - add DCN302 resource, irq service, dmub loader,
 - handle  DC_VERSION_DCN_3_02
 - define DCN302 power gating functions
 - handle DCN302 in GPIO files
 - define I2C regs
 - add CONFIG_DRM_AMD_DC_DCN3_02 guard

v2: rebase fixes (Alex)

Signed-off-by: Joshua Aberback <joshua.aberback@amd.com>
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/Kconfig           |    7 +
 drivers/gpu/drm/amd/display/dc/Makefile       |    5 +
 .../display/dc/bios/command_table_helper2.c   |    5 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |    6 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   13 +
 .../drm/amd/display/dc/dce/dce_clock_source.h |   20 +
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  134 ++
 .../gpu/drm/amd/display/dc/dcn302/Makefile    |   17 +
 .../drm/amd/display/dc/dcn302/dcn302_dccg.h   |   41 +
 .../drm/amd/display/dc/dcn302/dcn302_hwseq.c  |  233 +++
 .../drm/amd/display/dc/dcn302/dcn302_hwseq.h  |   35 +
 .../drm/amd/display/dc/dcn302/dcn302_init.c   |   39 +
 .../drm/amd/display/dc/dcn302/dcn302_init.h   |   33 +
 .../amd/display/dc/dcn302/dcn302_resource.c   | 1619 +++++++++++++++++
 .../amd/display/dc/dcn302/dcn302_resource.h   |   33 +
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |    3 +
 .../drm/amd/display/dc/gpio/hw_translate.c    |    3 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile   |   10 +
 .../dc/irq/dcn302/irq_service_dcn302.c        |  344 ++++
 .../dc/irq/dcn302/irq_service_dcn302.h        |   33 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |    3 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile |    3 +
 .../drm/amd/display/dmub/src/dmub_dcn302.c    |   55 +
 .../drm/amd/display/dmub/src/dmub_dcn302.h    |   37 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |   14 +
 .../gpu/drm/amd/display/include/dal_asic_id.h |    6 +-
 .../gpu/drm/amd/display/include/dal_types.h   |    3 +
 27 files changed, 2753 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.h

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index c2283e6ea734..6ff878c8e454 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -34,6 +34,13 @@ config DRM_AMD_DC_DCN3_01
 	    Choose this option if you want to have
 	    Van Gogh support for display engine
 
+config DRM_AMD_DC_DCN3_02
+        bool "DCN 3.02 family"
+        depends on DRM_AMD_DC_DCN3_0
+        help
+            Choose this option if you want to have
+            Dimgrey_cavefish support for display engine
+
 config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
 	depends on DRM_AMD_DC
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 6e6ec1d92488..c3bd2b51e92c 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -40,6 +40,11 @@ ifdef CONFIG_DRM_AMD_DC_DCN3_01
 DC_LIBS += dcn301
 endif
 
+ifdef CONFIG_DRM_AMD_DC_DCN3_02
+DC_LIBS += dcn302
+
+endif
+
 DC_LIBS += dce120
 
 DC_LIBS += dce112
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index 515dac743ae0..eb34f2e4aa0f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -82,6 +82,11 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 	case DCN_VERSION_3_01:
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+	case DCN_VERSION_3_02:
+		*h = dal_cmd_tbl_helper_dce112_get_table2();
+		return true;
 #endif
 	default:
 		/* Unsupported DCE */
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 270a8182682d..0b0b840a006c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -186,6 +186,12 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 			break;
 		}
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev)) {
+			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			break;
+		}
+#endif
 #endif
 		dcn20_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index f240576a87a2..78e0a5e20aba 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -61,6 +61,9 @@
 #if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #include "../dcn301/dcn301_resource.h"
 #endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#include "../dcn302/dcn302_resource.h"
+#endif
 
 #define DC_LOGGER_INIT(logger)
 
@@ -131,6 +134,10 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		if (ASICREV_IS_SIENNA_CICHLID_P(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_3_0;
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev))
+			dc_version = DCN_VERSION_3_02;
 #endif
 		break;
 
@@ -223,6 +230,12 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_3_01:
 		res_pool = dcn301_create_resource_pool(init_data, dc);
 		break;
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+	case DCN_VERSION_3_02:
+		res_pool = dcn302_create_resource_pool(init_data, dc);
+		break;
+
 #endif
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
index 41e6f7ea2138..09d25775d71f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -125,6 +125,26 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#define CS_COMMON_REG_LIST_DCN3_02(index, pllid) \
+		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
+		SRII(PHASE, DP_DTO, 0),\
+		SRII(PHASE, DP_DTO, 1),\
+		SRII(PHASE, DP_DTO, 2),\
+		SRII(PHASE, DP_DTO, 3),\
+		SRII(PHASE, DP_DTO, 4),\
+		SRII(MODULO, DP_DTO, 0),\
+		SRII(MODULO, DP_DTO, 1),\
+		SRII(MODULO, DP_DTO, 2),\
+		SRII(MODULO, DP_DTO, 3),\
+		SRII(MODULO, DP_DTO, 4),\
+		SRII(PIXEL_RATE_CNTL, OTG, 0),\
+		SRII(PIXEL_RATE_CNTL, OTG, 1),\
+		SRII(PIXEL_RATE_CNTL, OTG, 2),\
+		SRII(PIXEL_RATE_CNTL, OTG, 3),\
+		SRII(PIXEL_RATE_CNTL, OTG, 4)
+
+#endif
 #define CS_COMMON_MASK_SH_LIST_DCN2_0(mask_sh)\
 	CS_SF(DP_DTO0_PHASE, DP_DTO0_PHASE, mask_sh),\
 	CS_SF(DP_DTO0_MODULO, DP_DTO0_MODULO, mask_sh),\
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index 49e1a4c72684..b77e22bf6aec 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -426,6 +426,86 @@
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#define HWSEQ_DCN302_REG_LIST()\
+	HWSEQ_DCN_REG_LIST(), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 0), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 1), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 2), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 3), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 4), \
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
+	SR(DOMAIN8_PG_CONFIG), \
+	SR(DOMAIN9_PG_CONFIG), \
+	SR(DOMAIN16_PG_CONFIG), \
+	SR(DOMAIN17_PG_CONFIG), \
+	SR(DOMAIN18_PG_CONFIG), \
+	SR(DOMAIN19_PG_CONFIG), \
+	SR(DOMAIN20_PG_CONFIG), \
+	SR(DOMAIN0_PG_STATUS), \
+	SR(DOMAIN1_PG_STATUS), \
+	SR(DOMAIN2_PG_STATUS), \
+	SR(DOMAIN3_PG_STATUS), \
+	SR(DOMAIN4_PG_STATUS), \
+	SR(DOMAIN5_PG_STATUS), \
+	SR(DOMAIN6_PG_STATUS), \
+	SR(DOMAIN7_PG_STATUS), \
+	SR(DOMAIN8_PG_STATUS), \
+	SR(DOMAIN9_PG_STATUS), \
+	SR(DOMAIN16_PG_STATUS), \
+	SR(DOMAIN17_PG_STATUS), \
+	SR(DOMAIN18_PG_STATUS), \
+	SR(DOMAIN19_PG_STATUS), \
+	SR(DOMAIN20_PG_STATUS), \
+	SR(D1VGA_CONTROL), \
+	SR(D2VGA_CONTROL), \
+	SR(D3VGA_CONTROL), \
+	SR(D4VGA_CONTROL), \
+	SR(D5VGA_CONTROL), \
+	SR(D6VGA_CONTROL), \
+	SR(DC_IP_REQUEST_CNTL), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING)
+
+#endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+
+#define HWSEQ_PIXEL_RATE_REG_LIST_302(blk) \
+	SRII(PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PIXEL_RATE_CNTL, blk, 1),\
+	SRII(PIXEL_RATE_CNTL, blk, 2),\
+	SRII(PIXEL_RATE_CNTL, blk, 3), \
+	SRII(PIXEL_RATE_CNTL, blk, 4)
+
+#define HWSEQ_PHYPLL_REG_LIST_302(blk) \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 1),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 2),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 3), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4)
+#endif
+
 struct dce_hwseq_registers {
 	uint32_t DCFE_CLOCK_CONTROL[6];
 	uint32_t DCFEV_CLOCK_CONTROL;
@@ -813,6 +893,60 @@ struct dce_hwseq_registers {
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
 #endif
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#define HWSEQ_DCN302_MASK_SH_LIST(mask_sh)\
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
+	HWS_SF(, DOMAIN8_PG_CONFIG, DOMAIN8_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN8_PG_CONFIG, DOMAIN8_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN9_PG_CONFIG, DOMAIN9_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN9_PG_CONFIG, DOMAIN9_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN16_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN16_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN17_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN17_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN18_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN18_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN19_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN19_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN20_PG_CONFIG, DOMAIN20_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN20_PG_CONFIG, DOMAIN20_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN0_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN1_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN2_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN3_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN4_PG_STATUS, DOMAIN4_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN5_PG_STATUS, DOMAIN5_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN6_PG_STATUS, DOMAIN6_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN7_PG_STATUS, DOMAIN7_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN8_PG_STATUS, DOMAIN8_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN9_PG_STATUS, DOMAIN9_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN16_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN17_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN18_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_STATUS, DOMAIN19_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN20_PG_STATUS, DOMAIN20_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
+
+#endif
+
 #define HWSEQ_REG_FIELD_LIST(type) \
 	type DCFE_CLOCK_ENABLE; \
 	type DCFEV_CLOCK_ENABLE; \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/Makefile b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
new file mode 100644
index 000000000000..3ea9bff27912
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
@@ -0,0 +1,17 @@
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
+# Makefile for dcn302.
+
+DCN3_02 = dcn302_init.o dcn302_hwseq.o dcn302_resource.o
+
+AMD_DAL_DCN3_02 = $(addprefix $(AMDDALPATH)/dc/dcn302/,$(DCN3_02))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN3_02)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_dccg.h
new file mode 100644
index 000000000000..c884dde1bb25
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_dccg.h
@@ -0,0 +1,41 @@
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
+#ifndef __DCN302_DCCG_H__
+#define __DCN302_DCCG_H__
+
+#include "dcn30/dcn30_dccg.h"
+
+
+#define DCCG_REG_LIST_DCN3_02() \
+	DCCG_COMMON_REG_LIST_DCN_BASE(),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 4)
+
+#define DCCG_MASK_SH_LIST_DCN3_02(mask_sh) \
+	DCCG_COMMON_MASK_SH_LIST_DCN_COMMON_BASE(mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 4, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 4, mask_sh)
+
+#endif //__DCN302_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c
new file mode 100644
index 000000000000..e8580cccbebf
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c
@@ -0,0 +1,233 @@
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
+#include "dcn302_hwseq.h"
+
+#include "dce/dce_hwseq.h"
+
+#include "reg_helper.h"
+#include "dc.h"
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
+void dcn302_dpp_pg_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+
+	if (hws->ctx->dc->debug.disable_dpp_power_gate)
+		return;
+	if (REG(DOMAIN1_PG_CONFIG) == 0)
+		return;
+
+	switch (dpp_inst) {
+	case 0: /* DPP0 */
+		REG_UPDATE(DOMAIN1_PG_CONFIG,
+				DOMAIN1_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN1_PG_STATUS,
+				DOMAIN1_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 1: /* DPP1 */
+		REG_UPDATE(DOMAIN3_PG_CONFIG,
+				DOMAIN3_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN3_PG_STATUS,
+				DOMAIN3_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 2: /* DPP2 */
+		REG_UPDATE(DOMAIN5_PG_CONFIG,
+				DOMAIN5_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN5_PG_STATUS,
+				DOMAIN5_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 3: /* DPP3 */
+		REG_UPDATE(DOMAIN7_PG_CONFIG,
+				DOMAIN7_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN7_PG_STATUS,
+				DOMAIN7_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 4: /* DPP4 */
+		/*
+		 * Do not power gate DPP4, should be left at HW default, power on permanently.
+		 * PG on Pipe4 is De-featured, attempting to put it to PG state may result in hard
+		 * reset.
+		 * REG_UPDATE(DOMAIN9_PG_CONFIG,
+		 *		DOMAIN9_POWER_GATE, power_gate);
+		 *
+		 * REG_WAIT(DOMAIN9_PG_STATUS,
+		 *		DOMAIN9_PGFSM_PWR_STATUS, pwr_status,
+		 *		1, 1000);
+		 */
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+}
+
+void dcn302_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+
+	if (hws->ctx->dc->debug.disable_hubp_power_gate)
+		return;
+	if (REG(DOMAIN0_PG_CONFIG) == 0)
+		return;
+
+	switch (hubp_inst) {
+	case 0: /* DCHUBP0 */
+		REG_UPDATE(DOMAIN0_PG_CONFIG,
+				DOMAIN0_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN0_PG_STATUS,
+				DOMAIN0_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 1: /* DCHUBP1 */
+		REG_UPDATE(DOMAIN2_PG_CONFIG,
+				DOMAIN2_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN2_PG_STATUS,
+				DOMAIN2_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 2: /* DCHUBP2 */
+		REG_UPDATE(DOMAIN4_PG_CONFIG,
+				DOMAIN4_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN4_PG_STATUS,
+				DOMAIN4_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 3: /* DCHUBP3 */
+		REG_UPDATE(DOMAIN6_PG_CONFIG,
+				DOMAIN6_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN6_PG_STATUS,
+				DOMAIN6_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 4: /* DCHUBP4 */
+		/*
+		 * Do not power gate DCHUB4, should be left at HW default, power on permanently.
+		 * PG on Pipe4 is De-featured, attempting to put it to PG state may result in hard
+		 * reset.
+		 * REG_UPDATE(DOMAIN8_PG_CONFIG,
+		 *		DOMAIN8_POWER_GATE, power_gate);
+		 *
+		 * REG_WAIT(DOMAIN8_PG_STATUS,
+		 *		DOMAIN8_PGFSM_PWR_STATUS, pwr_status,
+		 *		1, 1000);
+		 */
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+}
+
+void dcn302_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+	uint32_t org_ip_request_cntl = 0;
+
+	if (hws->ctx->dc->debug.disable_dsc_power_gate)
+		return;
+
+	if (REG(DOMAIN16_PG_CONFIG) == 0)
+		return;
+
+	REG_GET(DC_IP_REQUEST_CNTL, IP_REQUEST_EN, &org_ip_request_cntl);
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 1);
+
+	switch (dsc_inst) {
+	case 0: /* DSC0 */
+		REG_UPDATE(DOMAIN16_PG_CONFIG,
+				DOMAIN16_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN16_PG_STATUS,
+				DOMAIN16_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 1: /* DSC1 */
+		REG_UPDATE(DOMAIN17_PG_CONFIG,
+				DOMAIN17_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN17_PG_STATUS,
+				DOMAIN17_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 2: /* DSC2 */
+		REG_UPDATE(DOMAIN18_PG_CONFIG,
+				DOMAIN18_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN18_PG_STATUS,
+				DOMAIN18_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 3: /* DSC3 */
+		REG_UPDATE(DOMAIN19_PG_CONFIG,
+				DOMAIN19_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN19_PG_STATUS,
+				DOMAIN19_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 4: /* DSC4 */
+		REG_UPDATE(DOMAIN20_PG_CONFIG,
+				DOMAIN20_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN20_PG_STATUS,
+				DOMAIN20_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 0);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.h
new file mode 100644
index 000000000000..1e5126a0e695
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.h
@@ -0,0 +1,35 @@
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
+#ifndef __DC_HWSS_DCN302_H__
+#define __DC_HWSS_DCN302_H__
+
+#include "hw_sequencer_private.h"
+
+void dcn302_dpp_pg_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool power_on);
+void dcn302_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on);
+void dcn302_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool power_on);
+
+#endif /* __DC_HWSS_DCN302_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.c
new file mode 100644
index 000000000000..d88b9011c502
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.c
@@ -0,0 +1,39 @@
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
+#include "dcn302_hwseq.h"
+
+#include "dcn30/dcn30_init.h"
+
+#include "dc.h"
+
+void dcn302_hw_sequencer_construct(struct dc *dc)
+{
+	dcn30_hw_sequencer_construct(dc);
+
+	dc->hwseq->funcs.dpp_pg_control = dcn302_dpp_pg_control;
+	dc->hwseq->funcs.hubp_pg_control = dcn302_hubp_pg_control;
+	dc->hwseq->funcs.dsc_pg_control = dcn302_dsc_pg_control;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.h b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.h
new file mode 100644
index 000000000000..899587b93aa1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_init.h
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
+#ifndef __DC_DCN302_INIT_H__
+#define __DC_DCN302_INIT_H__
+
+struct dc;
+
+void dcn302_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_DCN302_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
new file mode 100644
index 000000000000..b8b3152ec613
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -0,0 +1,1619 @@
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
+#include "dcn302_init.h"
+#include "dcn302_resource.h"
+#include "dcn302_dccg.h"
+#include "irq/dcn302/irq_service_dcn302.h"
+
+#include "dcn30/dcn30_dio_link_encoder.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn30/dcn30_dwb.h"
+#include "dcn30/dcn30_dpp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn30/dcn30_hubp.h"
+#include "dcn30/dcn30_mmhubbub.h"
+#include "dcn30/dcn30_mpc.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn30/dcn30_optc.h"
+#include "dcn30/dcn30_resource.h"
+
+#include "dcn20/dcn20_dsc.h"
+#include "dcn20/dcn20_resource.h"
+
+#include "dcn10/dcn10_resource.h"
+
+#include "dce/dce_abm.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_hwseq.h"
+#include "dce/dce_i2c_hw.h"
+#include "dce/dce_panel_cntl.h"
+#include "dce/dmub_abm.h"
+
+#include "hw_sequencer_private.h"
+#include "reg_helper.h"
+#include "resource.h"
+#include "vm_helper.h"
+
+#include "dimgrey_cavefish_ip_offset.h"
+#include "dcn/dcn_3_0_0_offset.h"
+#include "dcn/dcn_3_0_0_sh_mask.h"
+#include "dcn/dpcs_3_0_0_offset.h"
+#include "dcn/dpcs_3_0_0_sh_mask.h"
+#include "nbio/nbio_7_4_offset.h"
+
+#define DC_LOGGER_INIT(logger)
+
+struct gpu_info_voltage_scaling_v1_0 {
+	int state;
+	uint32_t dscclk_mhz;
+	uint32_t dcfclk_mhz;
+	uint32_t socclk_mhz;
+	uint32_t dram_speed_mts;
+	uint32_t fabricclk_mhz;
+	uint32_t dispclk_mhz;
+	uint32_t phyclk_mhz;
+	uint32_t dppclk_mhz;
+};
+
+struct gpu_info_soc_bounding_box_v1_0 {
+	uint32_t sr_exit_time_us;
+	uint32_t sr_enter_plus_exit_time_us;
+	uint32_t urgent_latency_us;
+	uint32_t urgent_latency_pixel_data_only_us;
+	uint32_t urgent_latency_pixel_mixed_with_vm_data_us;
+	uint32_t urgent_latency_vm_data_only_us;
+	uint32_t writeback_latency_us;
+	uint32_t ideal_dram_bw_after_urgent_percent;
+	// PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly
+	uint32_t pct_ideal_dram_sdp_bw_after_urgent_pixel_only;
+	uint32_t pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm;
+	uint32_t pct_ideal_dram_sdp_bw_after_urgent_vm_only;
+	uint32_t max_avg_sdp_bw_use_normal_percent;
+	uint32_t max_avg_dram_bw_use_normal_percent;
+	unsigned int max_request_size_bytes;
+	uint32_t downspread_percent;
+	uint32_t dram_page_open_time_ns;
+	uint32_t dram_rw_turnaround_time_ns;
+	uint32_t dram_return_buffer_per_channel_bytes;
+	uint32_t dram_channel_width_bytes;
+	uint32_t fabric_datapath_to_dcn_data_return_bytes;
+	uint32_t dcn_downspread_percent;
+	uint32_t dispclk_dppclk_vco_speed_mhz;
+	uint32_t dfs_vco_period_ps;
+	unsigned int urgent_out_of_order_return_per_channel_pixel_only_bytes;
+	unsigned int urgent_out_of_order_return_per_channel_pixel_and_vm_bytes;
+	unsigned int urgent_out_of_order_return_per_channel_vm_only_bytes;
+	unsigned int round_trip_ping_latency_dcfclk_cycles;
+	unsigned int urgent_out_of_order_return_per_channel_bytes;
+	unsigned int channel_interleave_bytes;
+	unsigned int num_banks;
+	unsigned int num_chans;
+	unsigned int vmm_page_size_bytes;
+	uint32_t dram_clock_change_latency_us;
+	uint32_t writeback_dram_clock_change_latency_us;
+	unsigned int return_bus_width_bytes;
+	unsigned int voltage_override;
+	uint32_t xfc_bus_transport_time_us;
+	uint32_t xfc_xbuf_latency_tolerance_us;
+	int use_urgent_burst_bw;
+	unsigned int num_states;
+	struct gpu_info_voltage_scaling_v1_0 clock_limits[8];
+};
+
+struct _vcs_dpi_ip_params_st dcn3_02_ip = {
+		.use_min_dcfclk = 0,
+		.clamp_min_dcfclk = 0,
+		.odm_capable = 1,
+		.gpuvm_enable = 1,
+		.hostvm_enable = 0,
+		.gpuvm_max_page_table_levels = 4,
+		.hostvm_max_page_table_levels = 4,
+		.hostvm_cached_page_table_levels = 0,
+		.pte_group_size_bytes = 2048,
+		.num_dsc = 5,
+		.rob_buffer_size_kbytes = 184,
+		.det_buffer_size_kbytes = 184,
+		.dpte_buffer_size_in_pte_reqs_luma = 64,
+		.dpte_buffer_size_in_pte_reqs_chroma = 34,
+		.pde_proc_buffer_size_64k_reqs = 48,
+		.dpp_output_buffer_pixels = 2560,
+		.opp_output_buffer_lines = 1,
+		.pixel_chunk_size_kbytes = 8,
+		.pte_enable = 1,
+		.max_page_table_levels = 2,
+		.pte_chunk_size_kbytes = 2,  // ?
+		.meta_chunk_size_kbytes = 2,
+		.writeback_chunk_size_kbytes = 8,
+		.line_buffer_size_bits = 789504,
+		.is_line_buffer_bpp_fixed = 0,  // ?
+		.line_buffer_fixed_bpp = 0,     // ?
+		.dcc_supported = true,
+		.writeback_interface_buffer_size_kbytes = 90,
+		.writeback_line_buffer_buffer_size = 0,
+		.max_line_buffer_lines = 12,
+		.writeback_luma_buffer_size_kbytes = 12,  // writeback_line_buffer_buffer_size = 656640
+		.writeback_chroma_buffer_size_kbytes = 8,
+		.writeback_chroma_line_buffer_width_pixels = 4,
+		.writeback_max_hscl_ratio = 1,
+		.writeback_max_vscl_ratio = 1,
+		.writeback_min_hscl_ratio = 1,
+		.writeback_min_vscl_ratio = 1,
+		.writeback_max_hscl_taps = 1,
+		.writeback_max_vscl_taps = 1,
+		.writeback_line_buffer_luma_buffer_size = 0,
+		.writeback_line_buffer_chroma_buffer_size = 14643,
+		.cursor_buffer_size = 8,
+		.cursor_chunk_size = 2,
+		.max_num_otg = 5,
+		.max_num_dpp = 5,
+		.max_num_wb = 1,
+		.max_dchub_pscl_bw_pix_per_clk = 4,
+		.max_pscl_lb_bw_pix_per_clk = 2,
+		.max_lb_vscl_bw_pix_per_clk = 4,
+		.max_vscl_hscl_bw_pix_per_clk = 4,
+		.max_hscl_ratio = 6,
+		.max_vscl_ratio = 6,
+		.hscl_mults = 4,
+		.vscl_mults = 4,
+		.max_hscl_taps = 8,
+		.max_vscl_taps = 8,
+		.dispclk_ramp_margin_percent = 1,
+		.underscan_factor = 1.11,
+		.min_vblank_lines = 32,
+		.dppclk_delay_subtotal = 46,
+		.dynamic_metadata_vm_enabled = true,
+		.dppclk_delay_scl_lb_only = 16,
+		.dppclk_delay_scl = 50,
+		.dppclk_delay_cnvc_formatter = 27,
+		.dppclk_delay_cnvc_cursor = 6,
+		.dispclk_delay_subtotal = 119,
+		.dcfclk_cstate_latency = 5.2, // SRExitTime
+		.max_inter_dcn_tile_repeaters = 8,
+		.max_num_hdmi_frl_outputs = 1,
+		.odm_combine_4to1_supported = true,
+
+		.xfc_supported = false,
+		.xfc_fill_bw_overhead_percent = 10.0,
+		.xfc_fill_constant_bytes = 0,
+		.gfx7_compat_tiling_supported = 0,
+		.number_of_cursors = 1,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_02_soc = {
+		.clock_limits = {
+				{
+						.state = 0,
+						.dispclk_mhz = 562.0,
+						.dppclk_mhz = 300.0,
+						.phyclk_mhz = 300.0,
+						.phyclk_d18_mhz = 667.0,
+						.dscclk_mhz = 405.6,
+				},
+		},
+
+		.min_dcfclk = 500.0, /* TODO: set this to actual min DCFCLK */
+		.num_states = 1,
+		.sr_exit_time_us = 5.20,
+		.sr_enter_plus_exit_time_us = 9.60,
+		.urgent_latency_us = 4.0,
+		.urgent_latency_pixel_data_only_us = 4.0,
+		.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+		.urgent_latency_vm_data_only_us = 4.0,
+		.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+		.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+		.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+		.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
+		.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+		.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+		.max_avg_sdp_bw_use_normal_percent = 60.0,
+		.max_avg_dram_bw_use_normal_percent = 40.0,
+		.writeback_latency_us = 12.0,
+		.max_request_size_bytes = 256,
+		.fabric_datapath_to_dcn_data_return_bytes = 64,
+		.dcn_downspread_percent = 0.5,
+		.downspread_percent = 0.38,
+		.dram_page_open_time_ns = 50.0,
+		.dram_rw_turnaround_time_ns = 17.5,
+		.dram_return_buffer_per_channel_bytes = 8192,
+		.round_trip_ping_latency_dcfclk_cycles = 156,
+		.urgent_out_of_order_return_per_channel_bytes = 4096,
+		.channel_interleave_bytes = 256,
+		.num_banks = 8,
+		.gpuvm_min_page_size_bytes = 4096,
+		.hostvm_min_page_size_bytes = 4096,
+		.dram_clock_change_latency_us = 350,
+		.dummy_pstate_latency_us = 5,
+		.writeback_dram_clock_change_latency_us = 23.0,
+		.return_bus_width_bytes = 64,
+		.dispclk_dppclk_vco_speed_mhz = 3650,
+		.xfc_bus_transport_time_us = 20,      // ?
+		.xfc_xbuf_latency_tolerance_us = 4,  // ?
+		.use_urgent_burst_bw = 1,            // ?
+		.do_urgent_latency_adjustment = true,
+		.urgent_latency_adjustment_fabric_clock_component_us = 1.0,
+		.urgent_latency_adjustment_fabric_clock_reference_mhz = 1000,
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+		.disable_dmcu = true,
+		.force_abm_enable = false,
+		.timing_trace = false,
+		.clock_trace = true,
+		.disable_pplib_clock_request = true,
+		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
+		.force_single_disp_pipe_split = false,
+		.disable_dcc = DCC_ENABLE,
+		.vsr_support = true,
+		.performance_trace = false,
+		.max_downscale_src_width = 7680,/*upto 8K*/
+		.disable_pplib_wm_range = false,
+		.scl_reset_length10 = true,
+		.sanity_checks = false,
+		.underflow_assert_delay_us = 0xFFFFFFFF,
+		.dwb_fi_phase = -1, // -1 = disable,
+		.dmub_command_table = true,
+};
+
+static const struct dc_debug_options debug_defaults_diags = {
+		.disable_dmcu = true,
+		.force_abm_enable = false,
+		.timing_trace = true,
+		.clock_trace = true,
+		.disable_dpp_power_gate = true,
+		.disable_hubp_power_gate = true,
+		.disable_clock_gate = true,
+		.disable_pplib_clock_request = true,
+		.disable_pplib_wm_range = true,
+		.disable_stutter = false,
+		.scl_reset_length10 = true,
+		.dwb_fi_phase = -1, // -1 = disable
+		.dmub_command_table = true,
+		.enable_tri_buf = true,
+};
+
+enum dcn302_clk_src_array_id {
+	DCN302_CLK_SRC_PLL0,
+	DCN302_CLK_SRC_PLL1,
+	DCN302_CLK_SRC_PLL2,
+	DCN302_CLK_SRC_PLL3,
+	DCN302_CLK_SRC_PLL4,
+	DCN302_CLK_SRC_TOTAL
+};
+
+static const struct resource_caps res_cap_dcn302 = {
+		.num_timing_generator = 5,
+		.num_opp = 5,
+		.num_video_plane = 5,
+		.num_audio = 5,
+		.num_stream_encoder = 5,
+		.num_dwb = 1,
+		.num_ddc = 5,
+		.num_vmid = 16,
+		.num_mpc_3dlut = 2,
+		.num_dsc = 5,
+};
+
+static const struct dc_plane_cap plane_cap = {
+		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+		.blends_with_above = true,
+		.blends_with_below = true,
+		.per_pixel_alpha = true,
+		.pixel_format_support = {
+				.argb8888 = true,
+				.nv12 = true,
+				.fp16 = true,
+				.p010 = false,
+				.ayuv = false,
+		},
+		.max_upscale_factor = {
+				.argb8888 = 16000,
+				.nv12 = 16000,
+				.fp16 = 16000
+		},
+		.max_downscale_factor = {
+				.argb8888 = 600,
+				.nv12 = 600,
+				.fp16 = 600
+		},
+		16,
+		16
+};
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) \
+		NBIO_BASE__INST0_SEG ## seg
+
+#define NBIO_BASE(seg) \
+		NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+		.reg_name = NBIO_BASE(mm ## reg_name ## _BASE_IDX) + \
+		mm ## reg_name
+
+/* DCN */
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) + mm ## reg_name
+
+#define SF(reg_name, field_name, post_fix)\
+		.field_name = reg_name ## __ ## field_name ## post_fix
+
+#define SRI(reg_name, block, id)\
+		.reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + mm ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) + mm ## reg_name
+
+#define SRII(reg_name, block, id)\
+		.reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+#define DCCG_SRII(reg_name, block, id)\
+		.block ## _ ## reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+		.reg_name[id] = BASE(mm ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+		mm ## reg_name ## _ ## block ## id
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+		.reg_name[id] = BASE(mm ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## temp_name
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+		.RMU##_##reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+static const struct dcn_hubbub_registers hubbub_reg = {
+		HUBBUB_REG_LIST_DCN30(0)
+};
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define vmid_regs(id)\
+		[id] = { DCN20_VMID_REG_LIST(id) }
+
+static const struct dcn_vmid_registers vmid_regs[] = {
+		vmid_regs(0),
+		vmid_regs(1),
+		vmid_regs(2),
+		vmid_regs(3),
+		vmid_regs(4),
+		vmid_regs(5),
+		vmid_regs(6),
+		vmid_regs(7),
+		vmid_regs(8),
+		vmid_regs(9),
+		vmid_regs(10),
+		vmid_regs(11),
+		vmid_regs(12),
+		vmid_regs(13),
+		vmid_regs(14),
+		vmid_regs(15)
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
+static struct hubbub *dcn302_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub), GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+	hubbub3_construct(hubbub3, ctx, &hubbub_reg, &hubbub_shift, &hubbub_mask);
+
+	for (i = 0; i < res_cap_dcn302.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub3->base;
+}
+
+#define vpg_regs(id)\
+		[id] = { VPG_DCN3_REG_LIST(id) }
+
+static const struct dcn30_vpg_registers vpg_regs[] = {
+		vpg_regs(0),
+		vpg_regs(1),
+		vpg_regs(2),
+		vpg_regs(3),
+		vpg_regs(4),
+		vpg_regs(5)
+};
+
+static const struct dcn30_vpg_shift vpg_shift = {
+		DCN3_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_vpg_mask vpg_mask = {
+		DCN3_VPG_MASK_SH_LIST(_MASK)
+};
+
+static struct vpg *dcn302_vpg_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn30_vpg *vpg3 = kzalloc(sizeof(struct dcn30_vpg), GFP_KERNEL);
+
+	if (!vpg3)
+		return NULL;
+
+	vpg3_construct(vpg3, ctx, inst, &vpg_regs[inst], &vpg_shift, &vpg_mask);
+
+	return &vpg3->base;
+}
+
+#define afmt_regs(id)\
+		[id] = { AFMT_DCN3_REG_LIST(id) }
+
+static const struct dcn30_afmt_registers afmt_regs[] = {
+		afmt_regs(0),
+		afmt_regs(1),
+		afmt_regs(2),
+		afmt_regs(3),
+		afmt_regs(4),
+		afmt_regs(5)
+};
+
+static const struct dcn30_afmt_shift afmt_shift = {
+		DCN3_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_afmt_mask afmt_mask = {
+		DCN3_AFMT_MASK_SH_LIST(_MASK)
+};
+
+static struct afmt *dcn302_afmt_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn30_afmt *afmt3 = kzalloc(sizeof(struct dcn30_afmt), GFP_KERNEL);
+
+	if (!afmt3)
+		return NULL;
+
+	afmt3_construct(afmt3, ctx, inst, &afmt_regs[inst], &afmt_shift, &afmt_mask);
+
+	return &afmt3->base;
+}
+
+#define audio_regs(id)\
+		[id] = { AUD_COMMON_REG_LIST(id) }
+
+static const struct dce_audio_registers audio_regs[] = {
+		audio_regs(0),
+		audio_regs(1),
+		audio_regs(2),
+		audio_regs(3),
+		audio_regs(4),
+		audio_regs(5),
+		audio_regs(6)
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
+static struct audio *dcn302_create_audio(struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst, &audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+#define stream_enc_regs(id)\
+		[id] = { SE_DCN3_REG_LIST(id) }
+
+static const struct dcn10_stream_enc_registers stream_enc_regs[] = {
+		stream_enc_regs(0),
+		stream_enc_regs(1),
+		stream_enc_regs(2),
+		stream_enc_regs(3),
+		stream_enc_regs(4)
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
+static struct stream_encoder *dcn302_stream_encoder_create(enum engine_id eng_id, struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGE) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn302_vpg_create(ctx, vpg_inst);
+	afmt = dcn302_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt)
+		return NULL;
+
+	dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios, eng_id, vpg, afmt, &stream_enc_regs[eng_id],
+			&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+#define clk_src_regs(index, pllid)\
+		[index] = { CS_COMMON_REG_LIST_DCN3_02(index, pllid) }
+
+static const struct dce110_clk_src_regs clk_src_regs[] = {
+		clk_src_regs(0, A),
+		clk_src_regs(1, B),
+		clk_src_regs(2, C),
+		clk_src_regs(3, D),
+		clk_src_regs(4, E)
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
+static struct clock_source *dcn302_clock_source_create(struct dc_context *ctx, struct dc_bios *bios,
+		enum clock_source_id id, const struct dce110_clk_src_regs *regs, bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src = kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn3_clk_src_construct(clk_src, ctx, bios, id, regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCN302_REG_LIST()
+};
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN302_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN302_MASK_SH_LIST(_MASK)
+};
+
+static struct dce_hwseq *dcn302_hwseq_create(struct dc_context *ctx)
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
+
+#define hubp_regs(id)\
+		[id] = { HUBP_REG_LIST_DCN30(id) }
+
+static const struct dcn_hubp2_registers hubp_regs[] = {
+		hubp_regs(0),
+		hubp_regs(1),
+		hubp_regs(2),
+		hubp_regs(3),
+		hubp_regs(4)
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
+static struct hubp *dcn302_hubp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 = kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+	if (hubp3_construct(hubp2, ctx, inst, &hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+#define dpp_regs(id)\
+		[id] = { DPP_REG_LIST_DCN30(id) }
+
+static const struct dcn3_dpp_registers dpp_regs[] = {
+		dpp_regs(0),
+		dpp_regs(1),
+		dpp_regs(2),
+		dpp_regs(3),
+		dpp_regs(4)
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
+static struct dpp *dcn302_dpp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn3_dpp *dpp = kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+
+	if (!dpp)
+		return NULL;
+
+	if (dpp3_construct(dpp, ctx, inst, &dpp_regs[inst], &tf_shift, &tf_mask))
+		return &dpp->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+
+#define opp_regs(id)\
+		[id] = { OPP_REG_LIST_DCN30(id) }
+
+static const struct dcn20_opp_registers opp_regs[] = {
+		opp_regs(0),
+		opp_regs(1),
+		opp_regs(2),
+		opp_regs(3),
+		opp_regs(4)
+};
+
+static const struct dcn20_opp_shift opp_shift = {
+		OPP_MASK_SH_LIST_DCN20(__SHIFT)
+};
+
+static const struct dcn20_opp_mask opp_mask = {
+		OPP_MASK_SH_LIST_DCN20(_MASK)
+};
+
+static struct output_pixel_processor *dcn302_opp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp = kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dcn20_opp_construct(opp, ctx, inst, &opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp->base;
+}
+
+#define optc_regs(id)\
+		[id] = { OPTC_COMMON_REG_LIST_DCN3_0(id) }
+
+static const struct dcn_optc_registers optc_regs[] = {
+		optc_regs(0),
+		optc_regs(1),
+		optc_regs(2),
+		optc_regs(3),
+		optc_regs(4)
+};
+
+static const struct dcn_optc_shift optc_shift = {
+		OPTC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+		OPTC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct timing_generator *dcn302_timing_generator_create(struct dc_context *ctx, uint32_t instance)
+{
+	struct optc *tgn10 = kzalloc(sizeof(struct optc), GFP_KERNEL);
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
+static const struct dcn30_mpc_registers mpc_regs = {
+		MPC_REG_LIST_DCN3_0(0),
+		MPC_REG_LIST_DCN3_0(1),
+		MPC_REG_LIST_DCN3_0(2),
+		MPC_REG_LIST_DCN3_0(3),
+		MPC_REG_LIST_DCN3_0(4),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(0),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(1),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(2),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(3),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(4),
+		MPC_RMU_GLOBAL_REG_LIST_DCN3AG,
+		MPC_RMU_REG_LIST_DCN3AG(0),
+		MPC_RMU_REG_LIST_DCN3AG(1),
+		MPC_RMU_REG_LIST_DCN3AG(2),
+		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
+};
+
+static const struct dcn30_mpc_shift mpc_shift = {
+		MPC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+		MPC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct mpc *dcn302_mpc_create(struct dc_context *ctx, int num_mpcc, int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc), GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+	dcn30_mpc_construct(mpc30, ctx, &mpc_regs, &mpc_shift, &mpc_mask, num_mpcc, num_rmu);
+
+	return &mpc30->base;
+}
+
+#define dsc_regsDCN20(id)\
+[id] = { DSC_REG_LIST_DCN20(id) }
+
+static const struct dcn20_dsc_registers dsc_regs[] = {
+		dsc_regsDCN20(0),
+		dsc_regsDCN20(1),
+		dsc_regsDCN20(2),
+		dsc_regsDCN20(3),
+		dsc_regsDCN20(4)
+};
+
+static const struct dcn20_dsc_shift dsc_shift = {
+		DSC_REG_LIST_SH_MASK_DCN20(__SHIFT)
+};
+
+static const struct dcn20_dsc_mask dsc_mask = {
+		DSC_REG_LIST_SH_MASK_DCN20(_MASK)
+};
+
+static struct display_stream_compressor *dcn302_dsc_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc = kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
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
+#define dwbc_regs_dcn3(id)\
+[id] = { DWBC_COMMON_REG_LIST_DCN30(id) }
+
+static const struct dcn30_dwbc_registers dwbc30_regs[] = {
+		dwbc_regs_dcn3(0)
+};
+
+static const struct dcn30_dwbc_shift dwbc30_shift = {
+		DWBC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_dwbc_mask dwbc30_mask = {
+		DWBC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static bool dcn302_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc), GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+		dcn30_dwbc_construct(dwbc30, ctx, &dwbc30_regs[i], &dwbc30_shift, &dwbc30_mask, i);
+
+		pool->dwbc[i] = &dwbc30->base;
+	}
+	return true;
+}
+
+#define mcif_wb_regs_dcn3(id)\
+[id] = { MCIF_WB_COMMON_REG_LIST_DCN30(id) }
+
+static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
+		mcif_wb_regs_dcn3(0)
+};
+
+static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
+		MCIF_WB_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
+		MCIF_WB_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static bool dcn302_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub), GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+		dcn30_mmhubbub_construct(mcif_wb30, ctx, &mcif_wb30_regs[i], &mcif_wb30_shift, &mcif_wb30_mask, i);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+#define aux_engine_regs(id)\
+[id] = {\
+		AUX_COMMON_REG_LIST0(id), \
+		.AUXN_IMPCAL = 0, \
+		.AUXP_IMPCAL = 0, \
+		.AUX_RESET_MASK = DP_AUX0_AUX_CONTROL__AUX_RESET_MASK, \
+}
+
+static const struct dce110_aux_registers aux_engine_regs[] = {
+		aux_engine_regs(0),
+		aux_engine_regs(1),
+		aux_engine_regs(2),
+		aux_engine_regs(3),
+		aux_engine_regs(4)
+};
+
+static const struct dce110_aux_registers_shift aux_shift = {
+		DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+		DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+static struct dce_aux *dcn302_aux_engine_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine = kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst, SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+			&aux_engine_regs[inst], &aux_mask, &aux_shift, ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+
+#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST(id) }
+
+static const struct dce_i2c_registers i2c_hw_regs[] = {
+		i2c_inst_regs(1),
+		i2c_inst_regs(2),
+		i2c_inst_regs(3),
+		i2c_inst_regs(4),
+		i2c_inst_regs(5)
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
+static struct dce_i2c_hw *dcn302_i2c_hw_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw = kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst, &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
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
+#define link_regs(id, phyid)\
+		[id] = {\
+				LE_DCN3_REG_LIST(id), \
+				UNIPHY_DCN2_REG_LIST(phyid), \
+				DPCS_DCN2_REG_LIST(id), \
+		}
+
+static const struct dcn10_link_enc_registers link_enc_regs[] = {
+		link_regs(0, A),
+		link_regs(1, B),
+		link_regs(2, C),
+		link_regs(3, D),
+		link_regs(4, E)
+};
+
+static const struct dcn10_link_enc_shift le_shift = {
+		LINK_ENCODER_MASK_SH_LIST_DCN30(__SHIFT),
+		DPCS_DCN2_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+		LINK_ENCODER_MASK_SH_LIST_DCN30(_MASK),
+		DPCS_DCN2_MASK_SH_LIST(_MASK)
+};
+
+#define aux_regs(id)\
+		[id] = { DCN2_AUX_REG_LIST(id) }
+
+static const struct dcn10_link_enc_aux_registers link_enc_aux_regs[] = {
+		aux_regs(0),
+		aux_regs(1),
+		aux_regs(2),
+		aux_regs(3),
+		aux_regs(4)
+};
+
+#define hpd_regs(id)\
+		[id] = { HPD_REG_LIST(id) }
+
+static const struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[] = {
+		hpd_regs(0),
+		hpd_regs(1),
+		hpd_regs(2),
+		hpd_regs(3),
+		hpd_regs(4)
+};
+
+static struct link_encoder *dcn302_link_encoder_create(const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 = kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+	dcn30_link_encoder_construct(enc20, enc_init_data, &link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter], &link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source], &le_shift, &le_mask);
+
+	return &enc20->enc10.base;
+}
+
+static const struct dce_panel_cntl_registers panel_cntl_regs[] = {
+		{ DCN_PANEL_CNTL_REG_LIST() }
+};
+
+static const struct dce_panel_cntl_shift panel_cntl_shift = {
+		DCE_PANEL_CNTL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_cntl_mask panel_cntl_mask = {
+		DCE_PANEL_CNTL_MASK_SH_LIST(_MASK)
+};
+
+static struct panel_cntl *dcn302_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dce_panel_cntl *panel_cntl = kzalloc(sizeof(struct dce_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dce_panel_cntl_construct(panel_cntl, init_data, &panel_cntl_regs[init_data->inst],
+			&panel_cntl_shift, &panel_cntl_mask);
+
+	return &panel_cntl->base;
+}
+
+static void read_dce_straps(struct dc_context *ctx, struct resource_straps *straps)
+{
+	generic_reg_get(ctx, mmDC_PINSTRAPS + BASE(mmDC_PINSTRAPS_BASE_IDX),
+			FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+}
+
+static const struct resource_create_funcs res_create_funcs = {
+		.read_dce_straps = read_dce_straps,
+		.create_audio = dcn302_create_audio,
+		.create_stream_encoder = dcn302_stream_encoder_create,
+		.create_hwseq = dcn302_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+		.read_dce_straps = NULL,
+		.create_audio = NULL,
+		.create_stream_encoder = NULL,
+		.create_hwseq = dcn302_hwseq_create,
+};
+
+static bool is_soc_bounding_box_valid(struct dc *dc)
+{
+	uint32_t hw_internal_rev = dc->ctx->asic_id.hw_internal_rev;
+
+	if (ASICREV_IS_DIMGREY_CAVEFISH_P(hw_internal_rev))
+		return true;
+
+	return false;
+}
+
+static bool init_soc_bounding_box(struct dc *dc,  struct resource_pool *pool)
+{
+	struct _vcs_dpi_soc_bounding_box_st *loaded_bb = &dcn3_02_soc;
+	struct _vcs_dpi_ip_params_st *loaded_ip = &dcn3_02_ip;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!is_soc_bounding_box_valid(dc)) {
+		DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
+		return false;
+	}
+
+	loaded_ip->max_num_otg = pool->pipe_count;
+	loaded_ip->max_num_dpp = pool->pipe_count;
+	loaded_ip->clamp_min_dcfclk = dc->config.clamp_min_dcfclk;
+	dcn20_patch_bounding_box(dc, loaded_bb);
+	return true;
+}
+
+static void dcn302_resource_destruct(struct resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->stream_enc_count; i++) {
+		if (pool->stream_enc[i] != NULL) {
+			if (pool->stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->stream_enc[i]->vpg));
+				pool->stream_enc[i]->vpg = NULL;
+			}
+			if (pool->stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->stream_enc[i]->afmt));
+				pool->stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->stream_enc[i]));
+			pool->stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_dsc; i++) {
+		if (pool->dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->dscs[i]);
+	}
+
+	if (pool->mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->mpc));
+		pool->mpc = NULL;
+	}
+
+	if (pool->hubbub != NULL) {
+		kfree(pool->hubbub);
+		pool->hubbub = NULL;
+	}
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		if (pool->dpps[i] != NULL) {
+			kfree(TO_DCN20_DPP(pool->dpps[i]));
+			pool->dpps[i] = NULL;
+		}
+
+		if (pool->hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->hubps[i]));
+			pool->hubps[i] = NULL;
+		}
+
+		if (pool->irqs != NULL)
+			dal_irq_service_destroy(&pool->irqs);
+	}
+
+	for (i = 0; i < pool->res_cap->num_ddc; i++) {
+		if (pool->engines[i] != NULL)
+			dce110_engine_destroy(&pool->engines[i]);
+		if (pool->hw_i2cs[i] != NULL) {
+			kfree(pool->hw_i2cs[i]);
+			pool->hw_i2cs[i] = NULL;
+		}
+		if (pool->sw_i2cs[i] != NULL) {
+			kfree(pool->sw_i2cs[i]);
+			pool->sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_opp; i++) {
+		if (pool->opps[i] != NULL)
+			pool->opps[i]->funcs->opp_destroy(&pool->opps[i]);
+	}
+
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		if (pool->timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->timing_generators[i]));
+			pool->timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_dwb; i++) {
+		if (pool->dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->dwbc[i]));
+			pool->dwbc[i] = NULL;
+		}
+		if (pool->mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->mcif_wb[i]));
+			pool->mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->audio_count; i++) {
+		if (pool->audios[i])
+			dce_aud_destroy(&pool->audios[i]);
+	}
+
+	for (i = 0; i < pool->clk_src_count; i++) {
+		if (pool->clock_sources[i] != NULL)
+			dcn20_clock_source_destroy(&pool->clock_sources[i]);
+	}
+
+	if (pool->dp_clock_source != NULL)
+		dcn20_clock_source_destroy(&pool->dp_clock_source);
+
+	for (i = 0; i < pool->res_cap->num_mpc_3dlut; i++) {
+		if (pool->mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->mpc_lut[i]);
+			pool->mpc_lut[i] = NULL;
+		}
+		if (pool->mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->mpc_shaper[i]);
+			pool->mpc_shaper[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		if (pool->multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->multiple_abms[i]);
+	}
+
+	if (pool->dccg != NULL)
+		dcn_dccg_destroy(&pool->dccg);
+}
+
+static void dcn302_destroy_resource_pool(struct resource_pool **pool)
+{
+	dcn302_resource_destruct(*pool);
+	kfree(*pool);
+	*pool = NULL;
+}
+
+static struct resource_funcs dcn302_res_pool_funcs = {
+		.destroy = dcn302_destroy_resource_pool,
+		.link_enc_create = dcn302_link_encoder_create,
+		.panel_cntl_create = dcn302_panel_cntl_create,
+		.validate_bandwidth = dcn30_validate_bandwidth,
+		.calculate_wm_and_dlg = dcn30_calculate_wm_and_dlg,
+		.populate_dml_pipes = dcn30_populate_dml_pipes_from_context,
+		.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+		.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+		.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+		.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+		.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+		.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+		.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+		.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+		.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+		.update_bw_bounding_box = dcn30_update_bw_bounding_box,
+		.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+};
+
+static struct dc_cap_funcs cap_funcs = {
+		.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+static const struct bios_registers bios_regs = {
+		NBIO_SR(BIOS_SCRATCH_3),
+		NBIO_SR(BIOS_SCRATCH_6)
+};
+
+static const struct dccg_registers dccg_regs = {
+		DCCG_REG_LIST_DCN3_02()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN3_02(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN3_02(_MASK)
+};
+
+#define abm_regs(id)\
+		[id] = { ABM_DCN301_REG_LIST(id) }
+
+static const struct dce_abm_registers abm_regs[] = {
+		abm_regs(0),
+		abm_regs(1),
+		abm_regs(2),
+		abm_regs(3),
+		abm_regs(4)
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
+static bool dcn302_resource_construct(
+		uint8_t num_virtual_links,
+		struct dc *dc,
+		struct resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->res_cap = &res_cap_dcn302;
+
+	pool->funcs = &dcn302_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->pipe_count = pool->res_cap->num_timing_generator;
+	pool->mpcc_count = pool->res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.max_cursor_size = 256;
+	dc->caps.dmdata_alloc_size = 2048;
+
+	dc->caps.max_slave_planes = 1;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
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
+	// no OGAM ROM on DCN3
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->res_cap->num_mpc_3dlut; //3
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
+	else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS)
+		dc->debug = debug_defaults_diags;
+	else
+		dc->debug = debug_defaults_diags;
+
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->clock_sources[DCN302_CLK_SRC_PLL0] =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL0,
+					&clk_src_regs[0], false);
+	pool->clock_sources[DCN302_CLK_SRC_PLL1] =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL1,
+					&clk_src_regs[1], false);
+	pool->clock_sources[DCN302_CLK_SRC_PLL2] =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL2,
+					&clk_src_regs[2], false);
+	pool->clock_sources[DCN302_CLK_SRC_PLL3] =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL3,
+					&clk_src_regs[3], false);
+	pool->clock_sources[DCN302_CLK_SRC_PLL4] =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL4,
+					&clk_src_regs[4], false);
+
+	pool->clk_src_count = DCN302_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->dp_clock_source =
+			dcn302_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_ID_DP_DTO,
+					&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->clk_src_count; i++) {
+		if (pool->clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* DCCG */
+	pool->dccg = dccg30_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* PP Lib and SMU interfaces */
+	init_soc_bounding_box(dc, pool);
+
+	/* DML */
+	dml_init_instance(&dc->dml, &dcn3_02_soc, &dcn3_02_ip, DML_PROJECT_DCN30);
+
+	/* IRQ */
+	init_data.ctx = dc->ctx;
+	pool->irqs = dal_irq_service_dcn302_create(&init_data);
+	if (!pool->irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->hubbub = dcn302_hubbub_create(ctx);
+	if (pool->hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->pipe_count; i++) {
+		pool->hubps[i] = dcn302_hubp_create(ctx, i);
+		if (pool->hubps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->dpps[i] = dcn302_dpp_create(ctx, i);
+		if (pool->dpps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_opp; i++) {
+		pool->opps[i] = dcn302_opp_create(ctx, i);
+		if (pool->opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		pool->timing_generators[i] = dcn302_timing_generator_create(ctx, i);
+		if (pool->timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+	}
+	pool->timing_generator_count = i;
+
+	/* ABMs */
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		pool->multiple_abms[i] = dmub_abm_create(ctx, &abm_regs[i], &abm_shift, &abm_mask);
+		if (pool->multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->mpc = dcn302_mpc_create(ctx, pool->mpcc_count, pool->res_cap->num_mpc_3dlut);
+	if (pool->mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->res_cap->num_dsc; i++) {
+		pool->dscs[i] = dcn302_dsc_create(ctx, i);
+		if (pool->dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn302_dwbc_create(ctx, pool)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn302_mmhubbub_create(ctx, pool)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->res_cap->num_ddc; i++) {
+		pool->engines[i] = dcn302_aux_engine_create(ctx, i);
+		if (pool->engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->hw_i2cs[i] = dcn302_i2c_hw_create(ctx, i);
+		if (pool->hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->sw_i2cs[i] = NULL;
+	}
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, pool,
+			(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+					&res_create_funcs : &res_create_maximus_funcs)))
+		goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn302_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->pipe_count;
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
+	dcn302_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn302_create_resource_pool(const struct dc_init_data *init_data, struct dc *dc)
+{
+	struct resource_pool *pool = kzalloc(sizeof(struct resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn302_resource_construct(init_data->num_virtual_links, dc, pool))
+		return pool;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.h b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.h
new file mode 100644
index 000000000000..71f7deed18e3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.h
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
+#ifndef _DCN302_RESOURCE_H_
+#define _DCN302_RESOURCE_H_
+
+#include "core_types.h"
+
+struct resource_pool *dcn302_create_resource_pool(const struct dc_init_data *init_data, struct dc *dc);
+
+#endif /* _DCN302_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
index f9ed80c48980..90b6cc2f431b 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
@@ -116,6 +116,9 @@ bool dal_hw_factory_init(
 	case DCN_VERSION_3_0:
 #if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+	case DCN_VERSION_3_02:
 #endif
 		dal_hw_factory_dcn30_init(factory);
 		return true;
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
index 8abc4b0a961c..6e62850a031e 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -111,6 +111,9 @@ bool dal_hw_translate_init(
 	case DCN_VERSION_3_0:
 #if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	case DCN_VERSION_3_01:
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+	case DCN_VERSION_3_02:
 #endif
 		dal_hw_translate_dcn30_init(translate);
 		return true;
diff --git a/drivers/gpu/drm/amd/display/dc/irq/Makefile b/drivers/gpu/drm/amd/display/dc/irq/Makefile
index 405c25322607..b279dd71d9b3 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/irq/Makefile
@@ -104,3 +104,13 @@ AMD_DAL_IRQ_DCN3 = $(addprefix $(AMDDALPATH)/dc/irq/dcn30/,$(IRQ_DCN3))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3)
 endif
+ifdef CONFIG_DRM_AMD_DC_DCN3_02
+###############################################################################
+# DCN 3_02
+###############################################################################
+IRQ_DCN3_02 = irq_service_dcn302.o
+
+AMD_DAL_IRQ_DCN3_02 = $(addprefix $(AMDDALPATH)/dc/irq/dcn302/,$(IRQ_DCN3_02))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3_02)
+endif
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
new file mode 100644
index 000000000000..927fdc43fb9f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
@@ -0,0 +1,344 @@
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
+ * * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
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
+#include "dm_services.h"
+
+#include "irq_service_dcn302.h"
+
+#include "../dce110/irq_service_dce110.h"
+
+#include "dimgrey_cavefish_ip_offset.h"
+#include "dcn/dcn_3_0_0_offset.h"
+#include "dcn/dcn_3_0_0_sh_mask.h"
+
+#include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
+
+static enum dc_irq_source to_dal_irq_source_dcn302(struct irq_service *irq_service, uint32_t src_id, uint32_t ext_id)
+{
+	switch (src_id) {
+	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK1;
+	case DCN_1_0__SRCID__DC_D2_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK2;
+	case DCN_1_0__SRCID__DC_D3_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK3;
+	case DCN_1_0__SRCID__DC_D4_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK4;
+	case DCN_1_0__SRCID__DC_D5_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK5;
+	case DCN_1_0__SRCID__DC_D6_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK6;
+	case DCN_1_0__SRCID__HUBP0_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP1;
+	case DCN_1_0__SRCID__HUBP1_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP2;
+	case DCN_1_0__SRCID__HUBP2_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP3;
+	case DCN_1_0__SRCID__HUBP3_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP4;
+	case DCN_1_0__SRCID__HUBP4_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP5;
+	case DCN_1_0__SRCID__HUBP5_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP6;
+	case DCN_1_0__SRCID__OTG0_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE1;
+	case DCN_1_0__SRCID__OTG1_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE2;
+	case DCN_1_0__SRCID__OTG2_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE3;
+	case DCN_1_0__SRCID__OTG3_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE4;
+	case DCN_1_0__SRCID__OTG4_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE5;
+	case DCN_1_0__SRCID__OTG5_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE6;
+
+	case DCN_1_0__SRCID__DC_HPD1_INT:
+		/* generic src_id for all HPD and HPDRX interrupts */
+		switch (ext_id) {
+		case DCN_1_0__CTXID__DC_HPD1_INT:
+			return DC_IRQ_SOURCE_HPD1;
+		case DCN_1_0__CTXID__DC_HPD2_INT:
+			return DC_IRQ_SOURCE_HPD2;
+		case DCN_1_0__CTXID__DC_HPD3_INT:
+			return DC_IRQ_SOURCE_HPD3;
+		case DCN_1_0__CTXID__DC_HPD4_INT:
+			return DC_IRQ_SOURCE_HPD4;
+		case DCN_1_0__CTXID__DC_HPD5_INT:
+			return DC_IRQ_SOURCE_HPD5;
+		case DCN_1_0__CTXID__DC_HPD6_INT:
+			return DC_IRQ_SOURCE_HPD6;
+		case DCN_1_0__CTXID__DC_HPD1_RX_INT:
+			return DC_IRQ_SOURCE_HPD1RX;
+		case DCN_1_0__CTXID__DC_HPD2_RX_INT:
+			return DC_IRQ_SOURCE_HPD2RX;
+		case DCN_1_0__CTXID__DC_HPD3_RX_INT:
+			return DC_IRQ_SOURCE_HPD3RX;
+		case DCN_1_0__CTXID__DC_HPD4_RX_INT:
+			return DC_IRQ_SOURCE_HPD4RX;
+		case DCN_1_0__CTXID__DC_HPD5_RX_INT:
+			return DC_IRQ_SOURCE_HPD5RX;
+		case DCN_1_0__CTXID__DC_HPD6_RX_INT:
+			return DC_IRQ_SOURCE_HPD6RX;
+		default:
+			return DC_IRQ_SOURCE_INVALID;
+		}
+		break;
+
+	default:
+		return DC_IRQ_SOURCE_INVALID;
+	}
+}
+
+static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
+{
+	uint32_t addr = info->status_reg;
+	uint32_t value = dm_read_reg(irq_service->ctx, addr);
+	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
+
+	dal_irq_service_ack_generic(irq_service, info);
+
+	value = dm_read_reg(irq_service->ctx, info->enable_reg);
+
+	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
+
+	dm_write_reg(irq_service->ctx, info->enable_reg, value);
+
+	return true;
+}
+
+static const struct irq_source_info_funcs hpd_irq_info_funcs = {
+		.set = NULL,
+		.ack = hpd_ack
+};
+
+static const struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+static const struct irq_source_info_funcs pflip_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
+static const struct irq_source_info_funcs vblank_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+/* compile time expand base address. */
+#define BASE(seg) BASE_INNER(seg)
+
+#define SRI(reg_name, block, id)\
+		BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+
+#define IRQ_REG_ENTRY(block, reg_num, reg1, mask1, reg2, mask2)\
+		.enable_reg = SRI(reg1, block, reg_num),\
+		.enable_mask = block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK,\
+		.enable_value = {\
+				block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK,\
+				~block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK \
+		},\
+		.ack_reg = SRI(reg2, block, reg_num),\
+		.ack_mask = block ## reg_num ## _ ## reg2 ## __ ## mask2 ## _MASK,\
+		.ack_value = block ## reg_num ## _ ## reg2 ## __ ## mask2 ## _MASK \
+
+
+
+#define hpd_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_HPD1 + reg_num] = {\
+				IRQ_REG_ENTRY(HPD, reg_num,\
+						DC_HPD_INT_CONTROL, DC_HPD_INT_EN,\
+						DC_HPD_INT_CONTROL, DC_HPD_INT_ACK),\
+						.status_reg = SRI(DC_HPD_INT_STATUS, HPD, reg_num),\
+						.funcs = &hpd_irq_info_funcs\
+}
+
+#define hpd_rx_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_HPD1RX + reg_num] = {\
+				IRQ_REG_ENTRY(HPD, reg_num,\
+						DC_HPD_INT_CONTROL, DC_HPD_RX_INT_EN,\
+						DC_HPD_INT_CONTROL, DC_HPD_RX_INT_ACK),\
+						.status_reg = SRI(DC_HPD_INT_STATUS, HPD, reg_num),\
+						.funcs = &hpd_rx_irq_info_funcs\
+}
+#define pflip_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_PFLIP1 + reg_num] = {\
+				IRQ_REG_ENTRY(HUBPREQ, reg_num,\
+						DCSURF_SURFACE_FLIP_INTERRUPT, SURFACE_FLIP_INT_MASK,\
+						DCSURF_SURFACE_FLIP_INTERRUPT, SURFACE_FLIP_CLEAR),\
+						.funcs = &pflip_irq_info_funcs\
+}
+
+/* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match semantic
+ * of DCE's DC_IRQ_SOURCE_VUPDATEx.
+ */
+#define vupdate_no_lock_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VUPDATE_NO_LOCK_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VUPDATE_NO_LOCK_EVENT_CLEAR),\
+		.funcs = &vupdate_no_lock_irq_info_funcs\
+	}
+
+#define vblank_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
+		.funcs = &vblank_irq_info_funcs\
+	}
+
+#define dummy_irq_entry() { .funcs = &dummy_irq_info_funcs }
+
+#define i2c_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_I2C_DDC ## reg_num] = dummy_irq_entry()
+
+#define dp_sink_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_DPSINK ## reg_num] = dummy_irq_entry()
+
+#define gpio_pad_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_GPIOPAD ## reg_num] = dummy_irq_entry()
+
+#define dc_underflow_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_DC ## reg_num ## UNDERFLOW] = dummy_irq_entry()
+
+static const struct irq_source_info_funcs dummy_irq_info_funcs = {
+		.set = dal_irq_service_dummy_set,
+		.ack = dal_irq_service_dummy_ack
+};
+
+static const struct irq_source_info irq_source_info_dcn302[DAL_IRQ_SOURCES_NUMBER] = {
+		[DC_IRQ_SOURCE_INVALID] = dummy_irq_entry(),
+		hpd_int_entry(0),
+		hpd_int_entry(1),
+		hpd_int_entry(2),
+		hpd_int_entry(3),
+		hpd_int_entry(4),
+		hpd_rx_int_entry(0),
+		hpd_rx_int_entry(1),
+		hpd_rx_int_entry(2),
+		hpd_rx_int_entry(3),
+		hpd_rx_int_entry(4),
+		i2c_int_entry(1),
+		i2c_int_entry(2),
+		i2c_int_entry(3),
+		i2c_int_entry(4),
+		i2c_int_entry(5),
+		dp_sink_int_entry(1),
+		dp_sink_int_entry(2),
+		dp_sink_int_entry(3),
+		dp_sink_int_entry(4),
+		dp_sink_int_entry(5),
+		[DC_IRQ_SOURCE_TIMER] = dummy_irq_entry(),
+		pflip_int_entry(0),
+		pflip_int_entry(1),
+		pflip_int_entry(2),
+		pflip_int_entry(3),
+		pflip_int_entry(4),
+		[DC_IRQ_SOURCE_PFLIP_UNDERLAY0] = dummy_irq_entry(),
+		gpio_pad_int_entry(0),
+		gpio_pad_int_entry(1),
+		gpio_pad_int_entry(2),
+		gpio_pad_int_entry(3),
+		gpio_pad_int_entry(4),
+		gpio_pad_int_entry(5),
+		gpio_pad_int_entry(6),
+		gpio_pad_int_entry(7),
+		gpio_pad_int_entry(8),
+		gpio_pad_int_entry(9),
+		gpio_pad_int_entry(10),
+		gpio_pad_int_entry(11),
+		gpio_pad_int_entry(12),
+		gpio_pad_int_entry(13),
+		gpio_pad_int_entry(14),
+		gpio_pad_int_entry(15),
+		gpio_pad_int_entry(16),
+		gpio_pad_int_entry(17),
+		gpio_pad_int_entry(18),
+		gpio_pad_int_entry(19),
+		gpio_pad_int_entry(20),
+		gpio_pad_int_entry(21),
+		gpio_pad_int_entry(22),
+		gpio_pad_int_entry(23),
+		gpio_pad_int_entry(24),
+		gpio_pad_int_entry(25),
+		gpio_pad_int_entry(26),
+		gpio_pad_int_entry(27),
+		gpio_pad_int_entry(28),
+		gpio_pad_int_entry(29),
+		gpio_pad_int_entry(30),
+		dc_underflow_int_entry(1),
+		dc_underflow_int_entry(2),
+		dc_underflow_int_entry(3),
+		dc_underflow_int_entry(4),
+		dc_underflow_int_entry(5),
+		[DC_IRQ_SOURCE_DMCU_SCP] = dummy_irq_entry(),
+		[DC_IRQ_SOURCE_VBIOS_SW] = dummy_irq_entry(),
+		vupdate_no_lock_int_entry(0),
+		vupdate_no_lock_int_entry(1),
+		vupdate_no_lock_int_entry(2),
+		vupdate_no_lock_int_entry(3),
+		vupdate_no_lock_int_entry(4),
+		vblank_int_entry(0),
+		vblank_int_entry(1),
+		vblank_int_entry(2),
+		vblank_int_entry(3),
+		vblank_int_entry(4),
+};
+
+static const struct irq_service_funcs irq_service_funcs_dcn302 = {
+		.to_dal_irq_source = to_dal_irq_source_dcn302
+};
+
+static void dcn302_irq_construct(struct irq_service *irq_service, struct irq_service_init_data *init_data)
+{
+	dal_irq_service_construct(irq_service, init_data);
+
+	irq_service->info = irq_source_info_dcn302;
+	irq_service->funcs = &irq_service_funcs_dcn302;
+}
+
+struct irq_service *dal_irq_service_dcn302_create(struct irq_service_init_data *init_data)
+{
+	struct irq_service *irq_service = kzalloc(sizeof(*irq_service), GFP_KERNEL);
+
+	if (!irq_service)
+		return NULL;
+
+	dcn302_irq_construct(irq_service, init_data);
+	return irq_service;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.h b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.h
new file mode 100644
index 000000000000..c8cd41bc7757
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.h
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
+#ifndef __DAL_IRQ_SERVICE_DCN302_H__
+#define __DAL_IRQ_SERVICE_DCN302_H__
+
+#include "../irq_service.h"
+
+struct irq_service *dal_irq_service_dcn302_create(struct irq_service_init_data *init_data);
+
+#endif /* __DAL_IRQ_SERVICE_DCN302_H__ */
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 47c1da263d9d..9896fbf31e16 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -93,6 +93,9 @@ enum dmub_asic {
 #endif
 #ifdef CONFIG_DRM_AMD_DC_DCN3_01
 	DMUB_ASIC_DCN301,
+#endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_02
+	DMUB_ASIC_DCN302,
 #endif
 	DMUB_ASIC_MAX,
 };
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index f40d82e19e59..71f1231cd278 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -24,6 +24,9 @@ DMUB = dmub_srv.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
 ifdef CONFIG_DRM_AMD_DC_DCN3_0
 DMUB += dmub_dcn30.o dmub_dcn301.o
 endif
+ifdef CONFIG_DRM_AMD_DC_DCN3_02
+DMUB += dmub_dcn302.o
+endif
 
 AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c
new file mode 100644
index 000000000000..f5db4437a882
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c
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
+#include "dmub_dcn302.h"
+
+#include "dimgrey_cavefish_ip_offset.h"
+#include "dcn/dcn_3_0_0_offset.h"
+#include "dcn/dcn_3_0_0_sh_mask.h"
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG##seg
+#define CTX dmub
+#define REGS dmub->regs
+
+/* Registers. */
+
+const struct dmub_srv_common_regs dmub_srv_dcn302_regs = {
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
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.h
new file mode 100644
index 000000000000..e2102c865d91
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.h
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
+#ifndef _DMUB_DCN302_H_
+#define _DMUB_DCN302_H_
+
+#include "dmub_dcn20.h"
+
+/* Registers. */
+
+extern const struct dmub_srv_common_regs dmub_srv_dcn302_regs;
+
+/* Hardware functions. */
+
+#endif /* _DMUB_DCN302_H_ */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index f50d26a318d4..dbfb8ec2c76d 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -33,6 +33,9 @@
 #ifdef CONFIG_DRM_AMD_DC_DCN3_01
 #include "dmub_dcn301.h"
 #endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_02
+#include "dmub_dcn302.h"
+#endif
 #include "os_types.h"
 /*
  * Note: the DMUB service is standalone. No additional headers should be
@@ -144,6 +147,9 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 #endif
 #ifdef CONFIG_DRM_AMD_DC_DCN3_01
 	case DMUB_ASIC_DCN301:
+#endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_02
+	case DMUB_ASIC_DCN302:
 #endif
 		dmub->regs = &dmub_srv_dcn20_regs;
 
@@ -183,6 +189,14 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
 #endif
+#ifdef CONFIG_DRM_AMD_DC_DCN3_02
+		if (asic == DMUB_ASIC_DCN302) {
+			dmub->regs = &dmub_srv_dcn302_regs;
+
+			funcs->backdoor_load = dmub_dcn30_backdoor_load;
+			funcs->setup_windows = dmub_dcn30_setup_windows;
+		}
+#endif
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index b6b60a9c0509..e4f24dbb2572 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -195,6 +195,7 @@ enum {
 	NV_NAVI12_P_A0      = 10,
 	NV_NAVI14_M_A0      = 20,
 	NV_SIENNA_CICHLID_P_A0      = 40,
+	NV_DIMGREY_CAVEFISH_P_A0      = 60,
 	NV_UNKNOWN          = 0xFF
 };
 
@@ -203,7 +204,10 @@ enum {
 #define ASICREV_IS_NAVI14_M(eChipRev)        ((eChipRev >= NV_NAVI14_M_A0) && (eChipRev < NV_UNKNOWN))
 #define ASICREV_IS_RENOIR(eChipRev) ((eChipRev >= RENOIR_A0) && (eChipRev < RAVEN1_F0))
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
-#define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0))
+#define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0) && (eChipRev < NV_DIMGREY_CAVEFISH_P_A0))
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+#define ASICREV_IS_DIMGREY_CAVEFISH_P(eChipRev)        ((eChipRev >= NV_DIMGREY_CAVEFISH_P_A0) && (eChipRev < NV_UNKNOWN))
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 #define FAMILY_VGH 144
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 9cf6853193f8..3ed7b066a925 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -56,6 +56,9 @@ enum dce_version {
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN3_01)
 	DCN_VERSION_3_01,
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_02)
+	DCN_VERSION_3_02,
 #endif
 	DCN_VERSION_MAX
 };
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
