Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A193F1EABFC
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCB46E5A1;
	Mon,  1 Jun 2020 18:29:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB76E593
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:42 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f18so10079321qkh.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlctOtGFMQ+L33Jq/b0oMzLwx+MmlDjfhPCXi16QQz0=;
 b=td6zNdUCkup3GI5GexcwYxOtWYARKRboyyVKXoSBrJiURCivMvbMqpnbdXWGIf75km
 Z948FMp5qRy0CA+peB5ZNzlWEhRVE3UybDP1aAhyKLGSelSvhUaDJLUeM3AEaa6cqy1J
 ulrCSxLILqRt3NxcgYhGG5MaqecA5E3BMXTLm/OIcQ/XHu7X3naijnaJH+H8a7Mw1v6N
 WlDxtMf2SLgXOZRCGEygkEIFQQn6gCl8AU0q6a7tXvE4pO6yAouhNcKfJ8pJLZ+bbHNP
 od75IpfJbUZAb1O36AUik1/6S8c2EsyUGRd5kmsqjJTxmQVd8SppvTnm3kKyYmwfz5D8
 lnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlctOtGFMQ+L33Jq/b0oMzLwx+MmlDjfhPCXi16QQz0=;
 b=BVHy5zkPH0MrJlfOYonuuJysVew9ctaynoP5fcWWm13M+m3dL3gz04ggxVYBPne01q
 t5s9gXI72CcYehk1h/VMfSNShRIFqNcRkEmkSctdzhIA2HX0d50Kl+EDFPBlgCUrsu4o
 tYbKShYR+qbasHQb23sEQdeJj15dN16MoDqfiguH9lACDB3ozkoLRAOpDrJPzVofj/UI
 alxJc8h5B2F7/Fju6doof8Vqv2KdjCL7m/xzf0pSupZAw01K6SI9INC6retFwXQgdjvj
 J6ldPudlhwpWCcrA5jESMbDnNvLrvyP3n1hOPKsRaqWJP7UwmiRDBEeuRhUXf0qCYB4V
 tJEA==
X-Gm-Message-State: AOAM5335p+8XL9I+QDXLTGwFFTW4/UG2lWZqrkmbdbpv0dibs0XibBFS
 7tz73Eso7IbdznJVSx/JTlI+gxyF
X-Google-Smtp-Source: ABdhPJySEmy1RgRc9kyz/L043CrNkmGPBO/WqwqkXNnrNkMiXgNqIoo2HrtZ3HNMGt+zzX4DibzWVQ==
X-Received: by 2002:a05:620a:2290:: with SMTP id
 o16mr21623683qkh.205.1591036180324; 
 Mon, 01 Jun 2020 11:29:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 181/207] drm/amd/display: Add DCN3 CLK_MGR
Date: Mon,  1 Jun 2020 14:29:00 -0400
Message-Id: <20200601182926.1267958-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182926.1267958-1-alexander.deucher@amd.com>
References: <20200601182926.1267958-1-alexander.deucher@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Adds support for handling of clocking relevant to the DCN3 block

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  10 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  22 +
 .../drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h |  60 ++
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  | 543 ++++++++++++++++++
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h  |  38 ++
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c  | 255 ++++++++
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h  | 108 ++++
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  51 ++
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  37 ++
 drivers/gpu/drm/amd/display/dc/dc.h           |  26 +
 .../drm/amd/display/dc/dce/dce_clock_source.c | 153 ++++-
 .../drm/amd/display/dc/dce/dce_clock_source.h |  42 ++
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |  69 +++
 .../amd/display/dc/inc/hw/clk_mgr_internal.h  |  14 +
 14 files changed, 1421 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index c0f6a8c7de7d..6874276bb2a1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -97,3 +97,13 @@ AMD_DAL_CLK_MGR_DCN21 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn21/,$(CLK_MGR_DC
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
 endif
+ifdef CONFIG_DRM_AMD_DC_DCN3_0
+###############################################################################
+# DCN30
+###############################################################################
+CLK_MGR_DCN30 = dcn30_clk_mgr.o dcn30_clk_mgr_smu_msg.o
+
+AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DCN30))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
+endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index a5c2114e4292..f376058b5df6 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -38,6 +38,9 @@
 #include "dcn10/rv2_clk_mgr.h"
 #include "dcn20/dcn20_clk_mgr.h"
 #include "dcn21/rn_clk_mgr.h"
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#include "dcn30/dcn30_clk_mgr.h"
+#endif
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -169,6 +172,15 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		break;
 
 	case FAMILY_NV:
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+		if (ASICREV_IS_SIENNA_CICHLID_P(asic_id.hw_internal_rev)) {
+			/* TODO: to add SIENNA_CICHLID clk_mgr support, once CLK IP header files are available,
+			 * for now use DCN3AG clk mgr.
+			 */
+			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			break;
+		}
+#endif
 		dcn20_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		break;
 #endif	/* Family RV and NV*/
@@ -184,6 +196,16 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+
+	switch (clk_mgr_base->ctx->asic_id.chip_family) {
+	case FAMILY_NV:
+		if (ASICREV_IS_SIENNA_CICHLID_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
+			dcn3_clk_mgr_destroy(clk_mgr);
+			break;
+		}
+	}
+#endif
 
 	kfree(clk_mgr);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h
new file mode 100644
index 000000000000..5ed03287aaaf
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h
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
+
+// TEMPORARY until this exists in the proper location
+#ifndef DALSMC_H
+#define DALSMC_H
+
+#define DALSMC_VERSION 0x1
+
+// SMU Response Codes:
+#define DALSMC_Result_OK                   0x1
+#define DALSMC_Result_Failed               0xFF
+#define DALSMC_Result_UnknownCmd           0xFE
+#define DALSMC_Result_CmdRejectedPrereq    0xFD
+#define DALSMC_Result_CmdRejectedBusy      0xFC
+
+
+
+// Message Definitions:
+#define DALSMC_MSG_TestMessage                    0x1
+#define DALSMC_MSG_GetSmuVersion                  0x2
+#define DALSMC_MSG_GetDriverIfVersion             0x3
+#define DALSMC_MSG_GetMsgHeaderVersion            0x4
+#define DALSMC_MSG_SetDalDramAddrHigh             0x5
+#define DALSMC_MSG_SetDalDramAddrLow              0x6
+#define DALSMC_MSG_TransferTableSmu2Dram          0x7
+#define DALSMC_MSG_TransferTableDram2Smu          0x8
+#define DALSMC_MSG_SetHardMinByFreq               0x9
+#define DALSMC_MSG_SetHardMaxByFreq               0xA
+#define DALSMC_MSG_GetDpmFreqByIndex              0xB
+#define DALSMC_MSG_GetDcModeMaxDpmFreq            0xC
+#define DALSMC_MSG_SetMinDeepSleepDcefclk         0xD
+#define DALSMC_MSG_NumOfDisplays                  0xE
+#define DALSMC_MSG_SetExternalClientDfCstateAllow 0x10
+#define DALSMC_MSG_BacoAudioD3PME                 0x11
+#define DALSMC_Message_Count                      0x12
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
new file mode 100644
index 000000000000..b27cb52903f5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -0,0 +1,543 @@
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
+#include "dcn30_clk_mgr_smu_msg.h"
+#include "dcn20/dcn20_clk_mgr.h"
+#include "dce100/dce_clk_mgr.h"
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dm_helpers.h"
+
+#include "atomfirmware.h"
+
+
+#include "sienna_cichlid_ip_offset.h"
+#include "dcn/dcn_3_0_0_offset.h"
+#include "dcn/dcn_3_0_0_sh_mask.h"
+
+#include "nbio/nbio_7_4_offset.h"
+
+#include "dcn/dpcs_3_0_0_offset.h"
+#include "dcn/dpcs_3_0_0_sh_mask.h"
+
+#include "mmhub/mmhub_2_0_0_offset.h"
+#include "mmhub/mmhub_2_0_0_sh_mask.h"
+/*we don't have clk folder yet*/
+#include "dcn30/dcn30_clk_mgr.h"
+
+#undef FN
+#define FN(reg_name, field_name) \
+	clk_mgr->clk_mgr_shift->field_name, clk_mgr->clk_mgr_mask->field_name
+
+#define REG(reg) \
+	(clk_mgr->regs->reg)
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) +  \
+					mm ## reg_name
+
+#undef CLK_SRI
+#define CLK_SRI(reg_name, block, inst)\
+	.reg_name = mm ## block ## _ ## reg_name
+
+static const struct clk_mgr_registers clk_mgr_regs = {
+	CLK_REG_LIST_DCN3()
+};
+
+static const struct clk_mgr_shift clk_mgr_shift = {
+	CLK_COMMON_MASK_SH_LIST_DCN20_BASE(__SHIFT)
+};
+
+static const struct clk_mgr_mask clk_mgr_mask = {
+	CLK_COMMON_MASK_SH_LIST_DCN20_BASE(_MASK)
+};
+
+
+/* Query SMU for all clock states for a particular clock */
+static void dcn3_init_single_clock(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, unsigned int *entry_0, unsigned int *num_levels)
+{
+	unsigned int i;
+	char *entry_i = (char *)entry_0;
+	uint32_t ret = dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, 0xFF);
+
+	if (ret & (1 << 31))
+		/* fine-grained, only min and max */
+		*num_levels = 2;
+	else
+		/* discrete, a number of fixed states */
+		/* will set num_levels to 0 on failure */
+		*num_levels = ret & 0xFF;
+
+	/* if the initial message failed, num_levels will be 0 */
+	for (i = 0; i < *num_levels; i++) {
+		*((unsigned int *)entry_i) = (dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, i) & 0xFFFF);
+		entry_i += sizeof(clk_mgr->base.bw_params->clk_table.entries[0]);
+	}
+}
+
+static void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
+{
+	/* defaults */
+	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
+	double sr_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_exit_time_us;
+	double sr_enter_plus_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
+	uint16_t min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
+
+	/* Set A - Normal - default values*/
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set B - Performance - higher minimum clocks */
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].valid = true;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
+//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dummy_pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
+
+}
+
+void dcn3_init_clocks(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	unsigned int num_levels;
+
+	memset(&(clk_mgr_base->clks), 0, sizeof(struct dc_clocks));
+	clk_mgr_base->clks.p_state_change_support = true;
+	clk_mgr_base->clks.prev_p_state_change_support = true;
+	clk_mgr->smu_present = false;
+
+	if (!clk_mgr_base->bw_params)
+		return;
+
+	if (!clk_mgr_base->force_smu_not_present && dcn30_smu_get_smu_version(clk_mgr, &clk_mgr->smu_ver))
+		clk_mgr->smu_present = true;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	// do we fail if these fail? if so, how? do we not care to check?
+	dcn30_smu_check_driver_if_version(clk_mgr);
+	dcn30_smu_check_msg_header_version(clk_mgr);
+
+	/* DCFCLK */
+	dcn3_init_single_clock(clk_mgr, PPCLK_DCEFCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dcfclk_mhz,
+			&num_levels);
+
+	/* DTBCLK */
+	dcn3_init_single_clock(clk_mgr, PPCLK_DTBCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dtbclk_mhz,
+			&num_levels);
+
+	// DPREFCLK ???
+
+	/* DISPCLK */
+	dcn3_init_single_clock(clk_mgr, PPCLK_DISPCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dispclk_mhz,
+			&num_levels);
+
+	/* DPPCLK */
+	dcn3_init_single_clock(clk_mgr, PPCLK_PIXCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dppclk_mhz,
+			&num_levels);
+
+	/* PHYCLK */
+	dcn3_init_single_clock(clk_mgr, PPCLK_PHYCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].phyclk_mhz,
+			&num_levels);
+
+	/* Get UCLK, update bounding box */
+	clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
+
+	/* WM range table */
+	dcn3_build_wm_range_table(clk_mgr);
+}
+
+static int dcn30_get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
+{
+	/* get FbMult value */
+	struct fixed31_32 pll_req;
+	/* get FbMult value */
+	uint32_t pll_req_reg = REG_READ(CLK0_CLK_PLL_REQ);
+
+	/* set up a fixed-point number
+	 * this works because the int part is on the right edge of the register
+	 * and the frac part is on the left edge
+	 */
+	pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
+	pll_req.value |= pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_frac;
+
+	/* multiply by REFCLK period */
+	pll_req = dc_fixpt_mul_int(pll_req, clk_mgr->dfs_ref_freq_khz);
+
+	return dc_fixpt_floor(pll_req);
+}
+
+static void dcn3_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int display_count;
+	bool update_dppclk = false;
+	bool update_dispclk = false;
+	bool enter_display_off = false;
+	bool dpp_clock_lowered = false;
+	struct dmcu *dmcu = clk_mgr_base->ctx->dc->res_pool->dmcu;
+	bool force_reset = false;
+	bool update_uclk = false;
+
+	if (dc->work_arounds.skip_clock_update || !clk_mgr->smu_present)
+		return;
+
+	if (clk_mgr_base->clks.dispclk_khz == 0 ||
+			(dc->debug.force_clock_mode & 0x1)) {
+		/* this is from resume or boot up, if forced_clock cfg option used, we bypass program dispclk and DPPCLK, but need set them for S3. */
+		force_reset = true;
+
+		dcn2_read_clocks_from_hw_dentist(clk_mgr_base);
+
+		/* force_clock_mode 0x1:  force reset the clock even it is the same clock as long as it is in Passive level. */
+	}
+	display_count = clk_mgr_helper_get_active_display_cnt(dc, context);
+
+	if (display_count == 0)
+		enter_display_off = true;
+
+	if (enter_display_off == safe_to_lower)
+		dcn30_smu_set_num_of_displays(clk_mgr, display_count);
+
+	if (should_set_clock(safe_to_lower, new_clocks->phyclk_khz, clk_mgr_base->clks.phyclk_khz)) {
+		clk_mgr_base->clks.phyclk_khz = new_clocks->phyclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_PHYCLK, clk_mgr_base->clks.phyclk_khz / 1000);
+	}
+
+	if (dc->debug.force_min_dcfclk_mhz > 0)
+		new_clocks->dcfclk_khz = (new_clocks->dcfclk_khz > (dc->debug.force_min_dcfclk_mhz * 1000)) ?
+				new_clocks->dcfclk_khz : (dc->debug.force_min_dcfclk_mhz * 1000);
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DCEFCLK, clk_mgr_base->clks.dcfclk_khz / 1000);
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn30_smu_set_min_deep_sleep_dcef_clk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz / 1000);
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->socclk_khz, clk_mgr_base->clks.socclk_khz))
+		/* We don't actually care about socclk, don't notify SMU of hard min */
+		clk_mgr_base->clks.socclk_khz = new_clocks->socclk_khz;
+
+	clk_mgr_base->clks.prev_p_state_change_support = clk_mgr_base->clks.p_state_change_support;
+	if (should_update_pstate_support(safe_to_lower, new_clocks->p_state_change_support, clk_mgr_base->clks.p_state_change_support)) {
+		clk_mgr_base->clks.p_state_change_support = new_clocks->p_state_change_support;
+
+		/* to disable P-State switching, set UCLK min = max */
+		if (!clk_mgr_base->clks.p_state_change_support)
+			dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+					clk_mgr_base->bw_params->clk_table.entries[clk_mgr_base->bw_params->clk_table.num_entries - 1].memclk_mhz);
+	}
+
+	/* Always update saved value, even if new value not set due to P-State switching unsupported */
+	if (should_set_clock(safe_to_lower, new_clocks->dramclk_khz, clk_mgr_base->clks.dramclk_khz)) {
+		clk_mgr_base->clks.dramclk_khz = new_clocks->dramclk_khz;
+		update_uclk = true;
+	}
+
+	/* set UCLK to requested value if P-State switching is supported, or to re-enable P-State switching */
+	if (clk_mgr_base->clks.p_state_change_support &&
+			(update_uclk || !clk_mgr_base->clks.prev_p_state_change_support))
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK, clk_mgr_base->clks.dramclk_khz / 1000);
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr_base->clks.dppclk_khz)) {
+		if (clk_mgr_base->clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_PIXCLK, clk_mgr_base->clks.dppclk_khz / 1000);
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DISPCLK, clk_mgr_base->clks.dispclk_khz / 1000);
+		update_dispclk = true;
+	}
+
+	if (dc->config.forced_clocks == false || (force_reset && safe_to_lower)) {
+		if (dpp_clock_lowered) {
+			/* if clock is being lowered, increase DTO before lowering refclk */
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+			dcn20_update_clocks_update_dentist(clk_mgr);
+		} else {
+			/* if clock is being raised, increase refclk before lowering DTO */
+			if (update_dppclk || update_dispclk)
+				dcn20_update_clocks_update_dentist(clk_mgr);
+			/* always update dtos unless clock is lowered and not safe to lower */
+			if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
+				dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		}
+	}
+
+	if (update_dispclk && dmcu && dmcu->funcs->is_dmcu_initialized(dmcu))
+		/*update dmcu for wait_loop count*/
+		dmcu->funcs->set_psr_wait_loop(dmcu,
+				clk_mgr_base->clks.dispclk_khz / 1000 / 7);
+}
+
+
+static void dcn3_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	unsigned int i;
+	long long table_addr;
+	WatermarksExternal_t *table;
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	/* need physical address of table to give to PMFW */
+	table = (WatermarksExternal_t *) dm_helpers_allocate_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART, sizeof(WatermarksExternal_t), &table_addr);
+
+	if (!table)
+		// should log failure
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	/* collect valid ranges, place in pmfw table */
+	for (i = 0; i < WM_SET_COUNT; i++)
+		if (clk_mgr->base.bw_params->wm_table.nv_entries[i].valid) {
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].MinClock = clk_mgr->base.bw_params->wm_table.nv_entries[i].pmfw_breakdown.min_dcfclk;
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].MaxClock = clk_mgr->base.bw_params->wm_table.nv_entries[i].pmfw_breakdown.max_dcfclk;
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].MinUclk = clk_mgr->base.bw_params->wm_table.nv_entries[i].pmfw_breakdown.min_uclk;
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].MaxUclk = clk_mgr->base.bw_params->wm_table.nv_entries[i].pmfw_breakdown.max_uclk;
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].WmSetting = i;
+			table->Watermarks.WatermarkRow[WM_DCEFCLK][i].Flags = clk_mgr->base.bw_params->wm_table.nv_entries[i].pmfw_breakdown.wm_type;
+		}
+
+	dcn30_smu_set_dram_addr_high(clk_mgr, table_addr >> 32);
+	dcn30_smu_set_dram_addr_low(clk_mgr, table_addr & 0xFFFFFFFF);
+	dcn30_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+
+	dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART, table);
+}
+
+/* Set min memclk to minimum, either constrained by the current mode or DPM0 */
+static void dcn3_set_hard_min_memclk(struct clk_mgr *clk_mgr_base, bool current_mode)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (current_mode)
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+				clk_mgr_base->clks.dramclk_khz / 1000);
+	else
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+				clk_mgr_base->bw_params->clk_table.entries[0].memclk_mhz);
+}
+
+/* Set max memclk to highest DPM value */
+static void dcn3_set_hard_max_memclk(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn30_smu_set_hard_max_by_freq(clk_mgr, PPCLK_UCLK,
+			clk_mgr_base->bw_params->clk_table.entries[clk_mgr_base->bw_params->clk_table.num_entries - 1].memclk_mhz);
+}
+
+/* Get current memclk states, update bounding box */
+static void dcn3_get_memclk_states_from_smu(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	unsigned int num_levels;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	/* Refresh memclk states */
+	dcn3_init_single_clock(clk_mgr, PPCLK_UCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].memclk_mhz,
+			&num_levels);
+	clk_mgr_base->bw_params->clk_table.num_entries = num_levels ? num_levels : 1;
+
+	/* Refresh bounding box */
+	clk_mgr_base->ctx->dc->res_pool->funcs->update_bw_bounding_box(
+			clk_mgr->base.ctx->dc, clk_mgr_base->bw_params);
+}
+
+static bool dcn3_are_clock_states_equal(struct dc_clocks *a,
+					struct dc_clocks *b)
+{
+	if (a->dispclk_khz != b->dispclk_khz)
+		return false;
+	else if (a->dppclk_khz != b->dppclk_khz)
+		return false;
+	else if (a->dcfclk_khz != b->dcfclk_khz)
+		return false;
+	else if (a->dcfclk_deep_sleep_khz != b->dcfclk_deep_sleep_khz)
+		return false;
+	else if (a->phyclk_khz != b->phyclk_khz)
+		return false;
+	else if (a->dramclk_khz != b->dramclk_khz)
+		return false;
+	else if (a->p_state_change_support != b->p_state_change_support)
+		return false;
+
+	return true;
+}
+
+static void dcn3_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn30_smu_set_pme_workaround(clk_mgr);
+}
+
+static struct clk_mgr_funcs dcn3_funcs = {
+		.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+		.update_clocks = dcn3_update_clocks,
+		.init_clocks = dcn3_init_clocks,
+		.notify_wm_ranges = dcn3_notify_wm_ranges,
+		.set_hard_min_memclk = dcn3_set_hard_min_memclk,
+		.set_hard_max_memclk = dcn3_set_hard_max_memclk,
+		.get_memclk_states_from_smu = dcn3_get_memclk_states_from_smu,
+		.are_clock_states_equal = dcn3_are_clock_states_equal,
+		.enable_pme_wa = dcn3_enable_pme_wa
+};
+
+static void dcn3_init_clocks_fpga(struct clk_mgr *clk_mgr)
+{
+	dcn2_init_clocks(clk_mgr);
+
+/* TODO: Implement the functions and remove the ifndef guard */
+}
+
+static struct clk_mgr_funcs dcn3_fpga_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = dcn2_update_clocks_fpga,
+	.init_clocks = dcn3_init_clocks_fpga,
+};
+
+/*todo for dcn30 for clk register offset*/
+void dcn3_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	clk_mgr->base.ctx = ctx;
+	clk_mgr->base.funcs = &dcn3_funcs;
+	clk_mgr->regs = &clk_mgr_regs;
+	clk_mgr->clk_mgr_shift = &clk_mgr_shift;
+	clk_mgr->clk_mgr_mask = &clk_mgr_mask;
+
+	clk_mgr->dccg = dccg;
+	clk_mgr->dfs_bypass_disp_clk = 0;
+
+	clk_mgr->dprefclk_ss_percentage = 0;
+	clk_mgr->dprefclk_ss_divider = 1000;
+	clk_mgr->ss_on_dprefclk = false;
+	clk_mgr->dfs_ref_freq_khz = 100000;
+
+	clk_mgr->base.dprefclk_khz = 730000; // 700 MHz planned if VCO is 3.85 GHz, will be retrieved
+
+	if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment)) {
+		clk_mgr->base.funcs  = &dcn3_fpga_funcs;
+		clk_mgr->base.dentist_vco_freq_khz = 3650000;
+
+	} else {
+		struct clk_state_registers_and_bypass s = { 0 };
+
+		/* integer part is now VCO frequency in kHz */
+		clk_mgr->base.dentist_vco_freq_khz = dcn30_get_vco_frequency_from_reg(clk_mgr);
+
+		/* in case we don't get a value from the register, use default */
+		if (clk_mgr->base.dentist_vco_freq_khz == 0)
+			clk_mgr->base.dentist_vco_freq_khz = 3650000;
+		/* Convert dprefclk units from MHz to KHz */
+		/* Value already divided by 10, some resolution lost */
+
+		/*TODO: uncomment assert once dcn3_dump_clk_registers is implemented */
+		//ASSERT(s.dprefclk != 0);
+		if (s.dprefclk != 0)
+			clk_mgr->base.dprefclk_khz = s.dprefclk * 1000;
+	}
+
+	clk_mgr->dfs_bypass_enabled = false;
+
+	clk_mgr->smu_present = false;
+
+	dce_clock_read_ss_info(clk_mgr);
+
+	clk_mgr->base.bw_params = kzalloc(sizeof(*clk_mgr->base.bw_params), GFP_KERNEL);
+}
+
+void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
+{
+	if (clk_mgr->base.bw_params)
+		kfree(clk_mgr->base.bw_params);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
new file mode 100644
index 000000000000..dd4a0bd72458
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
@@ -0,0 +1,38 @@
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
+#ifndef __DCN30_CLK_MGR_H__
+#define __DCN30_CLK_MGR_H__
+
+void dcn3_init_clocks(struct clk_mgr *clk_mgr_base);
+
+void dcn3_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr);
+
+#endif //__DCN30_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c
new file mode 100644
index 000000000000..986c53a3b6a8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c
@@ -0,0 +1,255 @@
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
+#include <linux/delay.h>
+#include "dcn30_clk_mgr_smu_msg.h"
+
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include "dalsmc.h"
+
+#define mmDAL_MSG_REG  0x1628A
+#define mmDAL_ARG_REG  0x16273
+#define mmDAL_RESP_REG 0x16274
+
+#define REG(reg_name) \
+	mm ## reg_name
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn30_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t reg = 0;
+
+	do {
+		reg = REG_READ(DAL_RESP_REG);
+		if (reg)
+			break;
+
+		if (delay_us >= 1000)
+			msleep(delay_us/1000);
+		else if (delay_us > 0)
+			udelay(delay_us);
+	} while (max_retries--);
+
+	/* handle DALSMC_Result_CmdRejectedBusy? */
+
+	/* Log? */
+
+	return reg;
+}
+
+static bool dcn30_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr, uint32_t msg_id, uint32_t param_in, uint32_t *param_out)
+{
+	/* Wait for response register to be ready */
+	dcn30_smu_wait_for_response(clk_mgr, 10, 200000);
+
+	/* Clear response register */
+	REG_WRITE(DAL_RESP_REG, 0);
+
+	/* Set the parameter register for the SMU message */
+	REG_WRITE(DAL_ARG_REG, param_in);
+
+	/* Trigger the message transaction by writing the message ID */
+	REG_WRITE(DAL_MSG_REG, msg_id);
+
+	/* Wait for response */
+	if (dcn30_smu_wait_for_response(clk_mgr, 10, 200000) == DALSMC_Result_OK) {
+		if (param_out)
+			*param_out = REG_READ(DAL_ARG_REG);
+
+		return true;
+	}
+
+	return false;
+}
+
+/* Test message should return input + 1 */
+bool dcn30_smu_test_message(struct clk_mgr_internal *clk_mgr, uint32_t input)
+{
+	uint32_t response = 0;
+
+	if (dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_TestMessage, input, &response))
+		if (response == input + 1)
+			return true;
+
+	return false;
+}
+
+bool dcn30_smu_get_smu_version(struct clk_mgr_internal *clk_mgr, unsigned int *version)
+{
+	if (dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_GetSmuVersion, 0, version))
+		return true;
+
+	return false;
+}
+
+/* Message output should match SMU11_DRIVER_IF_VERSION in smu11_driver_if.h */
+bool dcn30_smu_check_driver_if_version(struct clk_mgr_internal *clk_mgr)
+{
+	uint32_t response = 0;
+
+	if (dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_GetDriverIfVersion, 0, &response))
+		if (response == SMU11_DRIVER_IF_VERSION)
+			return true;
+
+	return false;
+}
+
+/* Message output should match DALSMC_VERSION in dalsmc.h */
+bool dcn30_smu_check_msg_header_version(struct clk_mgr_internal *clk_mgr)
+{
+	uint32_t response = 0;
+
+	if (dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_GetMsgHeaderVersion, 0, &response))
+		if (response == DALSMC_VERSION)
+			return true;
+
+	return false;
+}
+
+void dcn30_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetDalDramAddrHigh, addr_high, NULL);
+}
+
+void dcn30_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetDalDramAddrLow, addr_low, NULL);
+}
+
+void dcn30_smu_transfer_wm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_TransferTableSmu2Dram, TABLE_WATERMARKS, NULL);
+}
+
+void dcn30_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS, NULL);
+}
+
+/* Returns the actual frequency that was set in MHz, 0 on failure */
+unsigned int dcn30_smu_set_hard_min_by_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint16_t freq_mhz)
+{
+	uint32_t response = 0;
+
+	/* bits 23:16 for clock type, lower 16 bits for frequency in MHz */
+	uint32_t param = (clk << 16) | freq_mhz;
+
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetHardMinByFreq, param, &response);
+
+	return response;
+}
+
+/* Returns the actual frequency that was set in MHz, 0 on failure */
+unsigned int dcn30_smu_set_hard_max_by_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint16_t freq_mhz)
+{
+	uint32_t response = 0;
+
+	/* bits 23:16 for clock type, lower 16 bits for frequency in MHz */
+	uint32_t param = (clk << 16) | freq_mhz;
+
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetHardMaxByFreq, param, &response);
+
+	return response;
+}
+
+/*
+ * Frequency in MHz returned in lower 16 bits for valid DPM level
+ *
+ * Call with dpm_level = 0xFF to query features, return value will be:
+ *     Bits 7:0 - number of DPM levels
+ *     Bit   28 - 1 = auto DPM on
+ *     Bit   29 - 1 = sweep DPM on
+ *     Bit   30 - 1 = forced DPM on
+ *     Bit   31 - 0 = discrete, 1 = fine-grained
+ *
+ * With fine-grained DPM, only min and max frequencies will be reported
+ *
+ * Returns 0 on failure
+ */
+unsigned int dcn30_smu_get_dpm_freq_by_index(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint8_t dpm_level)
+{
+	uint32_t response = 0;
+
+	/* bits 23:16 for clock type, lower 8 bits for DPM level */
+	uint32_t param = (clk << 16) | dpm_level;
+
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_GetDpmFreqByIndex, param, &response);
+
+	return response;
+}
+
+/* Returns the max DPM frequency in DC mode in MHz, 0 on failure */
+unsigned int dcn30_smu_get_dc_mode_max_dpm_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk)
+{
+	uint32_t response = 0;
+
+	/* bits 23:16 for clock type */
+	uint32_t param = clk << 16;
+
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_GetDcModeMaxDpmFreq, param, &response);
+
+	return response;
+}
+
+void dcn30_smu_set_min_deep_sleep_dcef_clk(struct clk_mgr_internal *clk_mgr, uint32_t freq_mhz)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetMinDeepSleepDcefclk, freq_mhz, NULL);
+}
+
+void dcn30_smu_set_num_of_displays(struct clk_mgr_internal *clk_mgr, uint32_t num_displays)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_NumOfDisplays, num_displays, NULL);
+}
+
+void dcn30_smu_set_external_client_df_cstate_allow(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetExternalClientDfCstateAllow, enable ? 1 : 0, NULL);
+}
+
+void dcn30_smu_set_pme_workaround(struct clk_mgr_internal *clk_mgr)
+{
+	dcn30_smu_send_msg_with_param(clk_mgr,
+	DALSMC_MSG_BacoAudioD3PME, 0, NULL);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h
new file mode 100644
index 000000000000..236f20ec90d4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h
@@ -0,0 +1,108 @@
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
+#ifndef DAL_DC_DCN30_CLK_MGR_SMU_MSG_H_
+#define DAL_DC_DCN30_CLK_MGR_SMU_MSG_H_
+
+#include "core_types.h"
+
+#define SMU11_DRIVER_IF_VERSION 0x1F
+
+typedef enum {
+	PPCLK_GFXCLK = 0,
+	PPCLK_SOCCLK,
+	PPCLK_UCLK,
+	PPCLK_FCLK,
+	PPCLK_DCLK_0,
+	PPCLK_VCLK_0,
+	PPCLK_DCLK_1,
+	PPCLK_VCLK_1,
+	PPCLK_DCEFCLK,
+	PPCLK_DISPCLK,
+	PPCLK_PIXCLK,
+	PPCLK_PHYCLK,
+	PPCLK_DTBCLK,
+	PPCLK_COUNT,
+} PPCLK_e;
+
+typedef struct {
+	uint16_t MinClock; // This is either DCEFCLK or SOCCLK (in MHz)
+	uint16_t MaxClock; // This is either DCEFCLK or SOCCLK (in MHz)
+	uint16_t MinUclk;
+	uint16_t MaxUclk;
+
+	uint8_t  WmSetting;
+	uint8_t  Flags;
+	uint8_t  Padding[2];
+
+} WatermarkRowGeneric_t;
+
+#define NUM_WM_RANGES 4
+
+typedef enum {
+	WM_SOCCLK = 0,
+	WM_DCEFCLK,
+	WM_COUNT,
+} WM_CLOCK_e;
+
+typedef enum {
+	WATERMARKS_CLOCK_RANGE = 0,
+	WATERMARKS_DUMMY_PSTATE,
+	WATERMARKS_COUNT,
+} WATERMARKS_FLAGS_e;
+
+typedef struct {
+	// Watermarks
+	WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+} Watermarks_t;
+
+typedef struct {
+	Watermarks_t Watermarks;
+
+	uint32_t     MmHubPadding[8]; // SMU internal use
+} WatermarksExternal_t;
+
+#define TABLE_WATERMARKS 1
+
+struct clk_mgr_internal;
+
+bool         dcn30_smu_test_message(struct clk_mgr_internal *clk_mgr, uint32_t input);
+bool         dcn30_smu_get_smu_version(struct clk_mgr_internal *clk_mgr, unsigned int *version);
+bool         dcn30_smu_check_driver_if_version(struct clk_mgr_internal *clk_mgr);
+bool         dcn30_smu_check_msg_header_version(struct clk_mgr_internal *clk_mgr);
+void         dcn30_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void         dcn30_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void         dcn30_smu_transfer_wm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void         dcn30_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+unsigned int dcn30_smu_set_hard_min_by_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint16_t freq_mhz);
+unsigned int dcn30_smu_set_hard_max_by_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint16_t freq_mhz);
+unsigned int dcn30_smu_get_dpm_freq_by_index(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, uint8_t dpm_level);
+unsigned int dcn30_smu_get_dc_mode_max_dpm_freq(struct clk_mgr_internal *clk_mgr, PPCLK_e clk);
+void         dcn30_smu_set_min_deep_sleep_dcef_clk(struct clk_mgr_internal *clk_mgr, uint32_t freq_mhz);
+void         dcn30_smu_set_num_of_displays(struct clk_mgr_internal *clk_mgr, uint32_t num_displays);
+void         dcn30_smu_set_external_client_df_cstate_allow(struct clk_mgr_internal *clk_mgr, bool enable);
+void         dcn30_smu_set_pme_workaround(struct clk_mgr_internal *clk_mgr);
+
+#endif /* DAL_DC_DCN30_CLK_MGR_SMU_MSG_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 04c3d9f7e323..82f63c2dc72c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -729,6 +729,9 @@ static bool dc_construct(struct dc *dc,
 	dc->clk_mgr = dc_clk_mgr_create(dc->ctx, dc->res_pool->pp_smu, dc->res_pool->dccg);
 	if (!dc->clk_mgr)
 		goto fail;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	dc->clk_mgr->force_smu_not_present = init_params->force_smu_not_present;
+#endif
 
 	if (dc->res_pool->funcs->update_bw_bounding_box)
 		dc->res_pool->funcs->update_bw_bounding_box(dc, dc->clk_mgr->bw_params);
@@ -2819,3 +2822,51 @@ void dc_get_clock(struct dc *dc, enum dc_clock_type clock_type, struct dc_clock_
 	if (dc->hwss.get_clock)
 		dc->hwss.get_clock(dc, clock_type, clock_cfg);
 }
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+void dc_allow_idle_optimizations(struct dc *dc, bool allow)
+{
+	if (dc->debug.disable_idle_power_optimizations)
+		return;
+
+	if (allow == dc->idle_optimizations_allowed)
+		return;
+
+	if (dc->hwss.apply_idle_power_optimizations && dc->hwss.apply_idle_power_optimizations(dc, allow))
+		dc->idle_optimizations_allowed = allow;
+}
+
+/*
+ * blank all streams, and set min and max memory clock to
+ * lowest and highest DPM level, respectively
+ */
+void dc_unlock_memory_clock_frequency(struct dc *dc)
+{
+	unsigned int i;
+
+	for (i = 0; i < MAX_PIPES; i++)
+		if (dc->current_state->res_ctx.pipe_ctx[i].plane_state)
+			core_link_disable_stream(&dc->current_state->res_ctx.pipe_ctx[i]);
+
+	dc->clk_mgr->funcs->set_hard_min_memclk(dc->clk_mgr, false);
+	dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+}
+
+/*
+ * set min memory clock to the min required for current mode,
+ * max to maxDPM, and unblank streams
+ */
+void dc_lock_memory_clock_frequency(struct dc *dc)
+{
+	unsigned int i;
+
+	dc->clk_mgr->funcs->get_memclk_states_from_smu(dc->clk_mgr);
+	dc->clk_mgr->funcs->set_hard_min_memclk(dc->clk_mgr, true);
+	dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+
+	for (i = 0; i < MAX_PIPES; i++)
+		if (dc->current_state->res_ctx.pipe_ctx[i].plane_state)
+			core_link_enable_stream(dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
+}
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 4f0e7203dba4..3b897372ed27 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -243,6 +243,9 @@ bool dc_stream_set_cursor_attributes(
 	struct dc  *dc;
 	struct resource_context *res_ctx;
 	struct pipe_ctx *pipe_to_program = NULL;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool reset_idle_optimizations = false;
+#endif
 
 	if (NULL == stream) {
 		dm_error("DC: dc_stream is NULL!\n");
@@ -262,6 +265,15 @@ bool dc_stream_set_cursor_attributes(
 	res_ctx = &dc->current_state->res_ctx;
 	stream->cursor_attributes = *attributes;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	/* disable idle optimizations while updating cursor */
+	if (dc->idle_optimizations_allowed) {
+		dc->hwss.apply_idle_power_optimizations(dc, false);
+		reset_idle_optimizations = true;
+	}
+
+#endif
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx *pipe_ctx = &res_ctx->pipe_ctx[i];
 
@@ -281,6 +293,12 @@ bool dc_stream_set_cursor_attributes(
 	if (pipe_to_program)
 		dc->hwss.cursor_lock(dc, pipe_to_program, false);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	/* re-enable idle optimizations if necessary */
+	if (reset_idle_optimizations)
+		dc->hwss.apply_idle_power_optimizations(dc, true);
+
+#endif
 	return true;
 }
 
@@ -292,6 +310,9 @@ bool dc_stream_set_cursor_position(
 	struct dc  *dc;
 	struct resource_context *res_ctx;
 	struct pipe_ctx *pipe_to_program = NULL;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool reset_idle_optimizations = false;
+#endif
 
 	if (NULL == stream) {
 		dm_error("DC: dc_stream is NULL!\n");
@@ -305,6 +326,16 @@ bool dc_stream_set_cursor_position(
 
 	dc = stream->ctx->dc;
 	res_ctx = &dc->current_state->res_ctx;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+	/* disable idle optimizations if enabling cursor */
+	if (dc->idle_optimizations_allowed &&
+			!stream->cursor_position.enable && position->enable) {
+		dc->hwss.apply_idle_power_optimizations(dc, false);
+		reset_idle_optimizations = true;
+	}
+
+#endif
 	stream->cursor_position = *position;
 
 	for (i = 0; i < MAX_PIPES; i++) {
@@ -328,6 +359,12 @@ bool dc_stream_set_cursor_position(
 	if (pipe_to_program)
 		dc->hwss.cursor_lock(dc, pipe_to_program, false);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	/* re-enable idle optimizations if necessary */
+	if (reset_idle_optimizations)
+		dc->hwss.apply_idle_power_optimizations(dc, true);
+
+#endif
 	return true;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ecbdca6d4a79..262da8a4b518 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -459,6 +459,9 @@ struct dc_debug_options {
 	bool disable_tri_buf;
 	bool dmub_offload_enabled;
 	bool dmcub_emulation;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool disable_idle_power_optimizations;
+#endif
 	bool dmub_command_table; /* for testing only */
 	struct dc_bw_validation_profile bw_val_profile;
 	bool disable_fec;
@@ -572,6 +575,9 @@ struct dc {
 	/* Require to optimize clocks and bandwidth for added/removed planes */
 	bool optimized_required;
 	bool wm_optimized_required;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool idle_optimizations_allowed;
+#endif
 
 	/* Require to maintain clocks and bandwidth for UEFI enabled HW */
 	int optimize_seamless_boot_streams;
@@ -628,6 +634,9 @@ struct dc_init_data {
 	 */
 	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
 	struct dpcd_vendor_signature vendor_signature;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	bool force_smu_not_present;
+#endif
 };
 
 struct dc_callback_init {
@@ -1198,6 +1207,23 @@ bool dc_is_dmcu_initialized(struct dc *dc);
 
 enum dc_status dc_set_clock(struct dc *dc, enum dc_clock_type clock_type, uint32_t clk_khz, uint32_t stepping);
 void dc_get_clock(struct dc *dc, enum dc_clock_type clock_type, struct dc_clock_config *clock_cfg);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+
+void dc_allow_idle_optimizations(struct dc *dc, bool allow);
+
+/*
+ * blank all streams, and set min and max memory clock to
+ * lowest and highest DPM level, respectively
+ */
+void dc_unlock_memory_clock_frequency(struct dc *dc);
+
+/*
+ * set min memory clock to the min required for current mode,
+ * max to maxDPM, and unblank streams
+ */
+void dc_lock_memory_clock_frequency(struct dc *dc);
+
+#endif
 /*******************************************************************************
  * DSC Interfaces
  ******************************************************************************/
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index d2ad0504b0de..9cc65dc1970f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -1004,16 +1004,58 @@ static bool get_pixel_clk_frequency_100hz(
 	return false;
 }
 
-
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 /* this table is use to find *1.001 and /1.001 pixel rates from non-precise pixel rate */
-struct pixel_rate_range_table_entry {
-	unsigned int range_min_khz;
-	unsigned int range_max_khz;
-	unsigned int target_pixel_rate_khz;
-	unsigned short mult_factor;
-	unsigned short div_factor;
+const struct pixel_rate_range_table_entry video_optimized_pixel_rates[] = {
+	// /1.001 rates
+	{25170, 25180, 25200, 1000, 1001},	//25.2MHz   ->   25.17
+	{59340, 59350, 59400, 1000, 1001},	//59.4Mhz   ->   59.340
+	{74170, 74180, 74250, 1000, 1001},	//74.25Mhz  ->   74.1758
+	{125870, 125880, 126000, 1000, 1001},	//126Mhz    ->  125.87
+	{148350, 148360, 148500, 1000, 1001},	//148.5Mhz  ->  148.3516
+	{167830, 167840, 168000, 1000, 1001},	//168Mhz    ->  167.83
+	{222520, 222530, 222750, 1000, 1001},	//222.75Mhz ->  222.527
+	{257140, 257150, 257400, 1000, 1001},	//257.4Mhz  ->  257.1429
+	{296700, 296710, 297000, 1000, 1001},	//297Mhz    ->  296.7033
+	{342850, 342860, 343200, 1000, 1001},	//343.2Mhz  ->  342.857
+	{395600, 395610, 396000, 1000, 1001},	//396Mhz    ->  395.6
+	{409090, 409100, 409500, 1000, 1001},	//409.5Mhz  ->  409.091
+	{445050, 445060, 445500, 1000, 1001},	//445.5Mhz  ->  445.055
+	{467530, 467540, 468000, 1000, 1001},	//468Mhz    ->  467.5325
+	{519230, 519240, 519750, 1000, 1001},	//519.75Mhz ->  519.231
+	{525970, 525980, 526500, 1000, 1001},	//526.5Mhz  ->  525.974
+	{545450, 545460, 546000, 1000, 1001},	//546Mhz    ->  545.455
+	{593400, 593410, 594000, 1000, 1001},	//594Mhz    ->  593.4066
+	{623370, 623380, 624000, 1000, 1001},	//624Mhz    ->  623.377
+	{692300, 692310, 693000, 1000, 1001},	//693Mhz    ->  692.308
+	{701290, 701300, 702000, 1000, 1001},	//702Mhz    ->  701.2987
+	{791200, 791210, 792000, 1000, 1001},	//792Mhz    ->  791.209
+	{890100, 890110, 891000, 1000, 1001},	//891Mhz    ->  890.1099
+	{1186810, 1186820, 1188000, 1000, 1001},//1188Mhz   -> 1186.8131
+
+	// *1.001 rates
+	{27020, 27030, 27000, 1001, 1000}, //27Mhz
+	{54050, 54060, 54000, 1001, 1000}, //54Mhz
+	{108100, 108110, 108000, 1001, 1000},//108Mhz
 };
 
+const struct pixel_rate_range_table_entry *look_up_in_video_optimized_rate_tlb(
+		unsigned int pixel_rate_khz)
+{
+	int i;
+
+	for (i = 0; i < NUM_ELEMENTS(video_optimized_pixel_rates); i++) {
+		const struct pixel_rate_range_table_entry *e = &video_optimized_pixel_rates[i];
+
+		if (e->range_min_khz <= pixel_rate_khz && pixel_rate_khz <= e->range_max_khz) {
+			return e;
+		}
+	}
+
+	return NULL;
+}
+#endif
+
 static bool dcn20_program_pix_clk(
 		struct clock_source *clock_source,
 		struct pixel_clk_params *pix_clk_params,
@@ -1031,6 +1073,85 @@ static const struct clock_source_funcs dcn20_clk_src_funcs = {
 	.get_pixel_clk_frequency_100hz = get_pixel_clk_frequency_100hz
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+static bool dcn3_program_pix_clk(
+		struct clock_source *clock_source,
+		struct pixel_clk_params *pix_clk_params,
+		struct pll_settings *pll_settings)
+{
+	struct dce110_clk_src *clk_src = TO_DCE110_CLK_SRC(clock_source);
+	unsigned int inst = pix_clk_params->controller_id - CONTROLLER_ID_D0;
+	unsigned int dp_dto_ref_khz = clock_source->ctx->dc->clk_mgr->dprefclk_khz;
+	const struct pixel_rate_range_table_entry *e =
+			look_up_in_video_optimized_rate_tlb(pix_clk_params->requested_pix_clk_100hz / 10);
+
+	// For these signal types Driver to program DP_DTO without calling VBIOS Command table
+	if (dc_is_dp_signal(pix_clk_params->signal_type)) {
+		if (e) {
+			/* Set DTO values: phase = target clock, modulo = reference clock*/
+			REG_WRITE(PHASE[inst], e->target_pixel_rate_khz * e->mult_factor);
+			REG_WRITE(MODULO[inst], dp_dto_ref_khz * e->div_factor);
+		} else {
+			/* Set DTO values: phase = target clock, modulo = reference clock*/
+			REG_WRITE(PHASE[inst], pll_settings->actual_pix_clk_100hz * 100);
+			REG_WRITE(MODULO[inst], dp_dto_ref_khz * 1000);
+		}
+		REG_UPDATE(PIXEL_RATE_CNTL[inst], DP_DTO0_ENABLE, 1);
+	} else
+		// For other signal types(HDMI_TYPE_A, DVI) Driver still to call VBIOS Command table
+		dce112_program_pix_clk(clock_source, pix_clk_params, pll_settings);
+
+	return true;
+}
+
+static uint32_t dcn3_get_pix_clk_dividers(
+		struct clock_source *cs,
+		struct pixel_clk_params *pix_clk_params,
+		struct pll_settings *pll_settings)
+{
+	unsigned long long actual_pix_clk_100Hz = pix_clk_params->requested_pix_clk_100hz;
+	struct dce110_clk_src *clk_src;
+
+	clk_src = TO_DCE110_CLK_SRC(cs);
+	DC_LOGGER_INIT();
+
+	if (pix_clk_params == NULL || pll_settings == NULL
+			|| pix_clk_params->requested_pix_clk_100hz == 0) {
+		DC_LOG_ERROR(
+			"%s: Invalid parameters!!\n", __func__);
+		return -1;
+	}
+
+	memset(pll_settings, 0, sizeof(*pll_settings));
+	/* Adjust for HDMI Type A deep color */
+	if (pix_clk_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A) {
+		switch (pix_clk_params->color_depth) {
+		case COLOR_DEPTH_101010:
+			actual_pix_clk_100Hz = (actual_pix_clk_100Hz * 5) >> 2;
+			break;
+		case COLOR_DEPTH_121212:
+			actual_pix_clk_100Hz = (actual_pix_clk_100Hz * 6) >> 2;
+			break;
+		case COLOR_DEPTH_161616:
+			actual_pix_clk_100Hz = actual_pix_clk_100Hz * 2;
+			break;
+		default:
+			break;
+		}
+	}
+	pll_settings->actual_pix_clk_100hz = (unsigned int) actual_pix_clk_100Hz;
+	pll_settings->adjusted_pix_clk_100hz = (unsigned int) actual_pix_clk_100Hz;
+	pll_settings->calculated_pix_clk_100hz = (unsigned int) actual_pix_clk_100Hz;
+
+	return 0;
+}
+
+static const struct clock_source_funcs dcn3_clk_src_funcs = {
+	.cs_power_down = dce110_clock_source_power_down,
+	.program_pix_clk = dcn3_program_pix_clk,
+	.get_pix_clk_dividers = dcn3_get_pix_clk_dividers
+};
+#endif
 /*****************************************/
 /* Constructor                           */
 /*****************************************/
@@ -1415,3 +1536,21 @@ bool dcn20_clk_src_construct(
 
 	return ret;
 }
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+bool dcn3_clk_src_construct(
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
index 51bd25079606..69b904ab8151 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -91,6 +91,23 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 2),\
 		SRII(PIXEL_RATE_CNTL, OTG, 3)
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define CS_COMMON_REG_LIST_DCN3_0(index, pllid) \
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
@@ -204,4 +221,29 @@ bool dcn20_clk_src_construct(
 	const struct dce110_clk_src_shift *cs_shift,
 	const struct dce110_clk_src_mask *cs_mask);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+bool dcn3_clk_src_construct(
+	struct dce110_clk_src *clk_src,
+	struct dc_context *ctx,
+	struct dc_bios *bios,
+	enum clock_source_id id,
+	const struct dce110_clk_src_regs *regs,
+	const struct dce110_clk_src_shift *cs_shift,
+	const struct dce110_clk_src_mask *cs_mask);
+#endif
+
+/* this table is use to find *1.001 and /1.001 pixel rates from non-precise pixel rate */
+struct pixel_rate_range_table_entry {
+	unsigned int range_min_khz;
+	unsigned int range_max_khz;
+	unsigned int target_pixel_rate_khz;
+	unsigned short mult_factor;
+	unsigned short div_factor;
+};
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+extern const struct pixel_rate_range_table_entry video_optimized_pixel_rates[];
+const struct pixel_rate_range_table_entry *look_up_in_video_optimized_rate_tlb(
+		unsigned int pixel_rate_khz);
+#endif
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index ce65678c03b2..49c50af9cd9e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -43,6 +43,25 @@
 #define DCN_MINIMUM_DISPCLK_Khz 100000
 #define DCN_MINIMUM_DPPCLK_Khz 100000
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+struct dcn3_clk_internal {
+	int dummy;
+	/*TODO:
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
+	*/
+};
+
+#endif
 /* Will these bw structures be ASIC specific? */
 
 #define MAX_NUM_DPM_LVL		8
@@ -55,6 +74,12 @@ struct clk_limit_table_entry {
 	unsigned int fclk_mhz;
 	unsigned int memclk_mhz;
 	unsigned int socclk_mhz;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	unsigned int dtbclk_mhz;
+	unsigned int dispclk_mhz;
+	unsigned int dppclk_mhz;
+	unsigned int phyclk_mhz;
+#endif
 };
 
 /* This table is contiguous */
@@ -72,6 +97,26 @@ struct wm_range_table_entry {
 	bool valid;
 };
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+
+struct nv_wm_range_entry {
+	bool valid;
+
+	struct {
+		uint8_t wm_type;
+		uint16_t min_dcfclk;
+		uint16_t max_dcfclk;
+		uint16_t min_uclk;
+		uint16_t max_uclk;
+	} pmfw_breakdown;
+
+	struct {
+		double pstate_latency_us;
+		double sr_exit_time_us;
+		double sr_enter_plus_exit_time_us;
+	} dml_input;
+};
+#endif
 
 struct clk_log_info {
 	bool enabled;
@@ -143,7 +188,14 @@ struct clk_bypass {
  * D occupied, C will be emptry.
  */
 struct wm_table {
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	union {
+		struct nv_wm_range_entry nv_entries[WM_SET_COUNT];
+#endif
 	struct wm_range_table_entry entries[WM_SET_COUNT];
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	};
+#endif
 };
 
 struct clk_bw_params {
@@ -183,6 +235,20 @@ struct clk_mgr_funcs {
 	bool (*are_clock_states_equal) (struct dc_clocks *a,
 			struct dc_clocks *b);
 	void (*notify_wm_ranges)(struct clk_mgr *clk_mgr);
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	/*
+	 * Send message to PMFW to set hard min memclk frequency
+	 * When current_mode = false, set DPM0
+	 * When current_mode = true, set required clock for current mode
+	 */
+	void (*set_hard_min_memclk)(struct clk_mgr *clk_mgr, bool current_mode);
+
+	/* Send message to PMFW to set hard max memclk frequency to highest DPM */
+	void (*set_hard_max_memclk)(struct clk_mgr *clk_mgr);
+
+	/* Get current memclk states from PMFW, update relevant structures */
+	void (*get_memclk_states_from_smu)(struct clk_mgr *clk_mgr);
+#endif
 };
 
 struct clk_mgr {
@@ -190,6 +256,9 @@ struct clk_mgr {
 	struct clk_mgr_funcs *funcs;
 	struct dc_clocks clks;
 	bool psr_allow_active_cache;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	bool force_smu_not_present;
+#endif
 	int dprefclk_khz; // Used by program pixel clock in clock source funcs, need to figureout where this goes
 	int dentist_vco_freq_khz;
 	struct clk_state_registers_and_bypass boot_snapshot;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
index 9311d0de377f..c3c151be7d03 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
@@ -101,6 +101,12 @@ enum dentist_divider_range {
 	CLK_SRI(CLK3_CLK_PLL_REQ, CLK3, 0), \
 	CLK_SRI(CLK3_CLK2_DFS_CNTL, CLK3, 0)
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+// TODO:
+#define CLK_REG_LIST_DCN3()	  \
+	SR(DENTIST_DISPCLK_CNTL)
+#endif
+
 #define CLK_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
 
@@ -167,6 +173,10 @@ struct clk_mgr_registers {
 	uint32_t CLK3_CLK2_DFS_CNTL;
 	uint32_t CLK3_CLK_PLL_REQ;
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	uint32_t CLK0_CLK2_DFS_CNTL;
+	uint32_t CLK0_CLK_PLL_REQ;
+#endif
 	uint32_t MP1_SMN_C2PMSG_67;
 	uint32_t MP1_SMN_C2PMSG_83;
 	uint32_t MP1_SMN_C2PMSG_91;
@@ -260,6 +270,10 @@ struct clk_mgr_internal {
 
 	enum dm_pp_clocks_state max_clks_state;
 	enum dm_pp_clocks_state cur_min_clks_state;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+
+	bool smu_present;
+#endif
 };
 
 struct clk_mgr_internal_funcs {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
