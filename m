Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281382A5A70
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Nov 2020 00:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718766E909;
	Tue,  3 Nov 2020 23:10:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C506E909
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 23:10:50 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id b11so8864092qvr.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Nov 2020 15:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UiG/chzYD/fgnxw9e4WewTjcKO+wDoo/gpebH13iJ40=;
 b=AtINDd6+kGc3JWHdwltwlElgg3MaVWOTiXybKgHqa1KcdxCRRxtlalT6mLLLLpffCG
 EArGb4bukaNa48ImZf+lQ7XuwYc83kSX0qRlyrrtX7zwM+nr/lxQFBbvf2UNrER5pY7M
 gsKyEcknpDNUfaZdnu2LRxVZrMmJFMhx2g6LeNDvIDql9yB4tnk3J7hVt2iTfjsA5Fbh
 Y/dWKEMNBAgfQMsTHErjn6vTXZ6IgAIbBIoAE8gHqd2ZNUf/PJB3njukGKv06GIgllbk
 hgeZi+7zAMxu1T/gS92FrtztwhOHUkIrVW3l1gqEqNgBY6bJ6nd2Px3GSs6smvkUTkYF
 KooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UiG/chzYD/fgnxw9e4WewTjcKO+wDoo/gpebH13iJ40=;
 b=FkV3PKQdnwlOhgcEBKFH2dsJG0XC0kTr+A6WUwHVKRk8X9eLb4e5JKO8qEE4aRreh3
 3mVKdLI8FrKGqY9bIRqQpzMUdT98hOsi0foUumDuQMSDCoYcigrvKhZIYvT/NOppEwcG
 KQ+97oYc0Ag8EymM8Yishv6D0AeyNkkadh9AVZEPBeotgPO7xDwdeNE1Oqj6nBeNlTrn
 ZQPEvjP8UwnANk0yX/z9qc65GmxjrH1VaJMQ0VNl1YmQeDdsAyCO9XRdsEHtdiand15s
 vKMtG9kbJKDR6zb2AfCno8A2AoL4XS1gaRHwDjMdpvAtxwmh2WMW5FjURHAd7EFkZZHJ
 ugnQ==
X-Gm-Message-State: AOAM530tObdWmDdwmwohChJokjfau8cEbeJtGeGq3Zb0BD23Tja4v4SD
 v6xLKrtS7nSSyn4EAhEub1ScV0bhkDw=
X-Google-Smtp-Source: ABdhPJxuG4KKhG5AfrQRtVP/xahDZOgp40Yz9eEbHR/AuI74K+++k/WVb5GXVEMhvnZH2P1sTMJfLQ==
X-Received: by 2002:a05:6214:184c:: with SMTP id
 d12mr29772933qvy.11.1604445047999; 
 Tue, 03 Nov 2020 15:10:47 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id p127sm363137qkc.37.2020.11.03.15.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 15:10:47 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: FP fixes for DCN3.x (v4)
Date: Tue,  3 Nov 2020 18:10:39 -0500
Message-Id: <20201103231039.831948-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add proper FP_START/END handling and adjust Makefiles per
previous asics.

v2: fix up harder.
v3: fix clkmgr Makefile for dcn30
v4: fix old gcc handling is only required for x86

Reviewed-by: Harry Wentland <harry.wentland@amd.com> (v1)
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   | 26 +++++++
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile |  2 +
 .../drm/amd/display/dc/dcn30/dcn30_resource.c | 71 +++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |  8 ++-
 5 files changed, 104 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index facc8b970300..d59b380e7b7f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -119,6 +119,19 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
 ###############################################################################
 CLK_MGR_DCN30 = dcn30_clk_mgr.o dcn30_clk_mgr_smu_msg.o
 
+# prevent build errors regarding soft-float vs hard-float FP ABI tags
+# this code is currently unused on ppc64, as it applies to VanGogh APUs only
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn30/dcn30_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
+endif
+
+# prevent build errors:
+# ...: '-mgeneral-regs-only' is incompatible with the use of floating-point types
+# this file is unused on arm64, just like on ppc64
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn30/dcn30_clk_mgr.o := -mgeneral-regs-only
+endif
+
 AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DCN30))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
@@ -127,6 +140,19 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
 ###############################################################################
 CLK_MGR_DCN301 = vg_clk_mgr.o dcn301_smu.o
 
+# prevent build errors regarding soft-float vs hard-float FP ABI tags
+# this code is currently unused on ppc64, as it applies to VanGogh APUs only
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn301/vg_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
+endif
+
+# prevent build errors:
+# ...: '-mgeneral-regs-only' is incompatible with the use of floating-point types
+# this file is unused on arm64, just like on ppc64
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn301/vg_clk_mgr.o := -mgeneral-regs-only
+endif
+
 AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_DCN301))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index 7bad73b2d146..82cb688ba5e0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -104,7 +104,7 @@ static void dcn3_init_single_clock(struct clk_mgr_internal *clk_mgr, PPCLK_e clk
 	}
 }
 
-static void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
+static noinline void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
 {
 	/* defaults */
 	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
@@ -211,7 +211,9 @@ void dcn3_init_clocks(struct clk_mgr *clk_mgr_base)
 	clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
 
 	/* WM range table */
+	DC_FP_START();
 	dcn3_build_wm_range_table(clk_mgr);
+	DC_FP_END();
 }
 
 static int dcn30_get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
index bd2a068f9863..248c2711aace 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
@@ -52,6 +52,7 @@ IS_OLD_GCC = 1
 endif
 endif
 
+ifdef CONFIG_X86
 ifdef IS_OLD_GCC
 # Stack alignment mismatch, proceed with caution.
 # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
@@ -62,6 +63,7 @@ else
 CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o += -msse2
 CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o += -msse2
 endif
+endif
 
 AMD_DAL_DCN30 = $(addprefix $(AMDDALPATH)/dc/dcn30/,$(DCN30))
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index d65496917e93..01ac8b2921c6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -1469,7 +1469,19 @@ int dcn30_populate_dml_pipes_from_context(
 	return pipe_cnt;
 }
 
-void dcn30_populate_dml_writeback_from_context(
+/*
+ * This must be noinline to ensure anything that deals with FP registers
+ * is contained within this call; previously our compiling with hard-float
+ * would result in fp instructions being emitted outside of the boundaries
+ * of the DC_FP_START/END macros, which makes sense as the compiler has no
+ * idea about what is wrapped and what is not
+ *
+ * This is largely just a workaround to avoid breakage introduced with 5.6,
+ * ideally all fp-using code should be moved into its own file, only that
+ * should be compiled with hard-float, and all code exported from there
+ * should be strictly wrapped with DC_FP_START/END
+ */
+static noinline void dcn30_populate_dml_writeback_from_context_fp(
 		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
 {
 	int pipe_cnt, i, j;
@@ -1558,6 +1570,14 @@ void dcn30_populate_dml_writeback_from_context(
 
 }
 
+void dcn30_populate_dml_writeback_from_context(
+		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	DC_FP_START();
+	dcn30_populate_dml_writeback_from_context_fp(dc, res_ctx, pipes);
+	DC_FP_END();
+}
+
 unsigned int dcn30_calc_max_scaled_time(
 		unsigned int time_per_pixel,
 		enum mmhubbub_wbif_mode mode,
@@ -2204,7 +2224,19 @@ static bool dcn30_internal_validate_bw(
 	return out;
 }
 
-void dcn30_calculate_wm_and_dlg(
+/*
+ * This must be noinline to ensure anything that deals with FP registers
+ * is contained within this call; previously our compiling with hard-float
+ * would result in fp instructions being emitted outside of the boundaries
+ * of the DC_FP_START/END macros, which makes sense as the compiler has no
+ * idea about what is wrapped and what is not
+ *
+ * This is largely just a workaround to avoid breakage introduced with 5.6,
+ * ideally all fp-using code should be moved into its own file, only that
+ * should be compiled with hard-float, and all code exported from there
+ * should be strictly wrapped with DC_FP_START/END
+ */
+static noinline void dcn30_calculate_wm_and_dlg_fp(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int pipe_cnt,
@@ -2360,7 +2392,18 @@ void dcn30_calculate_wm_and_dlg(
 				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
 }
 
-bool dcn30_validate_bandwidth(struct dc *dc,
+void dcn30_calculate_wm_and_dlg(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel)
+{
+	DC_FP_START();
+	dcn30_calculate_wm_and_dlg_fp(dc, context, pipes, pipe_cnt, vlevel);
+	DC_FP_END();
+}
+
+static noinline bool dcn30_validate_bandwidth_fp(struct dc *dc,
 		struct dc_state *context,
 		bool fast_validate)
 {
@@ -2411,7 +2454,20 @@ bool dcn30_validate_bandwidth(struct dc *dc,
 	return out;
 }
 
-static void get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+bool dcn30_validate_bandwidth(struct dc *dc,
+		struct dc_state *context,
+		bool fast_validate)
+{
+	bool out;
+
+	DC_FP_START();
+	out = dcn30_validate_bandwidth_fp(dc, context, fast_validate);
+	DC_FP_END();
+
+	return out;
+}
+
+static noinline void get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
                                                        unsigned int *optimal_dcfclk,
                                                        unsigned int *optimal_fclk)
 {
@@ -2478,8 +2534,10 @@ void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 
 		// Calculate optimal dcfclk for each uclk
 		for (i = 0; i < num_uclk_states; i++) {
+			DC_FP_START();
 			get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
 					&optimal_dcfclk_for_uclk[i], NULL);
+			DC_FP_END();
 			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
 				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
 			}
@@ -2583,6 +2641,8 @@ static bool dcn30_resource_construct(
 	struct irq_service_init_data init_data;
 	struct ddc_service_init_data ddc_init_data;
 
+	DC_FP_START();
+
 	ctx->dc_bios->regs = &bios_regs;
 
 	pool->base.res_cap = &res_cap_dcn3;
@@ -2860,10 +2920,13 @@ static bool dcn30_resource_construct(
 		pool->base.oem_device = NULL;
 	}
 
+	DC_FP_END();
+
 	return true;
 
 create_fail:
 
+	DC_FP_END();
 	dcn30_resource_destruct(pool);
 
 	return false;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 879a930358a5..a02a33dcd70b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -64,6 +64,9 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_rcflags)
@@ -71,8 +74,9 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflag
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_rcflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_rcflags)
 endif
 CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
