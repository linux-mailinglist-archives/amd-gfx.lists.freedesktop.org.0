Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A757BDAF
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Jul 2022 20:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E56418B0EB;
	Wed, 20 Jul 2022 18:23:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F84D8B719
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Jul 2022 18:23:02 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Lp3wP3VtRz9swt;
 Wed, 20 Jul 2022 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1658341381; bh=aTOGqGL/lNXBPHM+fF+dQRAQdo+nK1nbIFoy2ZChBEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDK8eL5QQYgRxoygXwlgK0FN/yg+RFdFnioV2BLoZfDYXM/QjyDAgelw97lXBW0wo
 j2VnjWMtdbxYluxn0PMSYOw6+lO/kkA77Cms9Owtj9XUWbb4yaD1RNqM7oCJ0gz4I1
 EUocP8n5onYf1YAuOxPuUi6PSdNyW4tl8lua8mSo=
X-Riseup-User-ID: 5B97EE95298B518CAE5B45A27B90C4E2EF19B5053C7DBD827D3208E7C9157898
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Lp3wH414lz5vgM;
 Wed, 20 Jul 2022 18:22:55 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [PATCH 3/4] drm/amd/display: Remove parameters from rq_dlg_get_dlg_reg
Date: Wed, 20 Jul 2022 15:22:27 -0300
Message-Id: <20220720182228.259119-3-mairacanal@riseup.net>
In-Reply-To: <20220720182228.259119-1-mairacanal@riseup.net>
References: <20220720182228.259119-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Across all DCN's (except DCN32, that has a separate
rq_dlg_get_dlg_reg), the parameters const bool vm_en, const bool
ignore_viewport_pos, and const bool immediate_flip_support are not used
on the function. Therefore, the rq_dlg_get_dlg_reg signature is changed
by deleting those parameters.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |  3 +--
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  5 +----
 .../dc/dml/dcn20/display_rq_dlg_calc_20.h     |  5 +----
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   |  5 +----
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h   |  5 +----
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     |  5 +----
 .../dc/dml/dcn21/display_rq_dlg_calc_21.h     |  5 +----
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 18 +++---------------
 .../dc/dml/dcn30/display_rq_dlg_calc_30.h     |  5 +----
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 19 +++----------------
 .../dc/dml/dcn31/display_rq_dlg_calc_31.h     |  5 +----
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 15 ++-------------
 .../dc/dml/dcn314/display_rq_dlg_calc_314.h   |  5 +----
 .../drm/amd/display/dc/dml/display_mode_lib.h |  5 +----
 .../gpu/drm/amd/display/dc/dml/dml_wrapper.c  |  3 +--
 15 files changed, 20 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index dc60b835e938..d9cfb29a2651 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -857,8 +857,7 @@ void dcn20_calculate_dlg_params(
 				pipe_cnt,
 				pipe_idx,
 				cstate_en,
-				context->bw_ctx.bw.dcn.clk.p_state_change_support,
-				false, false, true);
+				context->bw_ctx.bw.dcn.clk.p_state_change_support);
 
 		context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ctx.dml,
 				&context->res_ctx.pipe_ctx[i].rq_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 548cdef8a8ad..d0a4c69b47c8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -1553,10 +1553,7 @@ void dml20_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool pstate_en)
 {
 	display_rq_params_st rq_param = {0};
 	display_dlg_sys_params_st dlg_sys_param = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
index 8b23867e97c1..36c3692e53b8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
@@ -65,9 +65,6 @@ void dml20_rq_dlg_get_dlg_reg(
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support);
+		const bool pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
index 0fc9f3e3ffae..17df9d31c11f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
@@ -1554,10 +1554,7 @@ void dml20v2_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool pstate_en)
 {
 	display_rq_params_st rq_param = {0};
 	display_dlg_sys_params_st dlg_sys_param = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
index 2b4e46ea1c3d..f524f1ccfe41 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
@@ -65,9 +65,6 @@ void dml20v2_rq_dlg_get_dlg_reg(
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support);
+		const bool pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index 618f4b682ab1..502dafc6dd79 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -1662,10 +1662,7 @@ void dml21_rq_dlg_get_dlg_reg(
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool pstate_en)
 {
 	display_rq_params_st rq_param = {0};
 	display_dlg_sys_params_st dlg_sys_param = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.h b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.h
index af6ad0ca9cf8..822c68089ca8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.h
@@ -65,9 +65,6 @@ void dml21_rq_dlg_get_dlg_reg(
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support);
+		const bool pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 8179be1f34bb..b3bdb7283a7e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -898,10 +898,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	const display_rq_dlg_params_st rq_dlg_param,
 	const display_dlg_sys_params_st dlg_sys_param,
 	const bool cstate_en,
-	const bool pstate_en,
-	const bool vm_en,
-	const bool ignore_viewport_pos,
-	const bool immediate_flip_support)
+	const bool pstate_en)
 {
 	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
 	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
@@ -1031,9 +1028,6 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	dml_print("DML_DLG: %s:  cstate_en = %d\n", __func__, cstate_en);
 	dml_print("DML_DLG: %s:  pstate_en = %d\n", __func__, pstate_en);
-	dml_print("DML_DLG: %s:  vm_en     = %d\n", __func__, vm_en);
-	dml_print("DML_DLG: %s:  ignore_viewport_pos  = %d\n", __func__, ignore_viewport_pos);
-	dml_print("DML_DLG: %s:  immediate_flip_support  = %d\n", __func__, immediate_flip_support);
 
 	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: dispclk_freq_in_mhz    = %3.2f\n", __func__, dispclk_freq_in_mhz);
@@ -1746,10 +1740,7 @@ void dml30_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	const unsigned int num_pipes,
 	const unsigned int pipe_idx,
 	const bool cstate_en,
-	const bool pstate_en,
-	const bool vm_en,
-	const bool ignore_viewport_pos,
-	const bool immediate_flip_support)
+	const bool pstate_en)
 {
 	display_rq_params_st rq_param = { 0 };
 	display_dlg_sys_params_st dlg_sys_param = { 0 };
@@ -1785,10 +1776,7 @@ void dml30_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 		rq_param.dlg,
 		dlg_sys_param,
 		cstate_en,
-		pstate_en,
-		vm_en,
-		ignore_viewport_pos,
-		immediate_flip_support);
+		pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
index 625e41f8d575..d28ed3ae3f94 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
@@ -61,9 +61,6 @@ void dml30_rq_dlg_get_dlg_reg(struct display_mode_lib             *mode_lib,
 		const unsigned int            num_pipes,
 		const unsigned int            pipe_idx,
 		const bool                    cstate_en,
-		const bool                    pstate_en,
-		const bool                    vm_en,
-		const bool                    ignore_viewport_pos,
-		const bool                    immediate_flip_support);
+		const bool                    pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
index 66b82e4f05c6..c36dd3a79871 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
@@ -859,10 +859,7 @@ static void dml_rq_dlg_get_dlg_params(
 		const display_rq_dlg_params_st *rq_dlg_param,
 		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool pstate_en)
 {
 	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
 	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
@@ -970,9 +967,6 @@ static void dml_rq_dlg_get_dlg_params(
 
 	dml_print("DML_DLG: %s: cstate_en = %d\n", __func__, cstate_en);
 	dml_print("DML_DLG: %s: pstate_en = %d\n", __func__, pstate_en);
-	dml_print("DML_DLG: %s: vm_en     = %d\n", __func__, vm_en);
-	dml_print("DML_DLG: %s: ignore_viewport_pos  = %d\n", __func__, ignore_viewport_pos);
-	dml_print("DML_DLG: %s: immediate_flip_support  = %d\n", __func__, immediate_flip_support);
 
 	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
@@ -983,7 +977,6 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end;	// 15 bits
 
-	//set_prefetch_mode(mode_lib, cstate_en, pstate_en, ignore_viewport_pos, immediate_flip_support);
 	min_ttu_vblank = get_min_ttu_vblank_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);	// From VBA
 
 	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
@@ -1576,10 +1569,7 @@ void dml31_rq_dlg_get_dlg_reg(
 		const unsigned int num_pipes,
 		const unsigned int pipe_idx,
 		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool pstate_en)
 {
 	display_rq_params_st rq_param = {0};
 	display_dlg_sys_params_st dlg_sys_param = {0};
@@ -1610,10 +1600,7 @@ void dml31_rq_dlg_get_dlg_reg(
 			&rq_param.dlg,
 			&dlg_sys_param,
 			cstate_en,
-			pstate_en,
-			vm_en,
-			ignore_viewport_pos,
-			immediate_flip_support);
+			pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h
index 8ee991351699..5b0b438a9804 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h
@@ -61,9 +61,6 @@ void dml31_rq_dlg_get_dlg_reg(struct display_mode_lib             *mode_lib,
 		const unsigned int            num_pipes,
 		const unsigned int            pipe_idx,
 		const bool                    cstate_en,
-		const bool                    pstate_en,
-		const bool                    vm_en,
-		const bool                    ignore_viewport_pos,
-		const bool                    immediate_flip_support);
+		const bool                    pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index 61ee9ba063a7..37ecc4a6ae11 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -943,11 +943,7 @@ static void dml_rq_dlg_get_dlg_params(
 		display_ttu_regs_st *disp_ttu_regs,
 		const display_rq_dlg_params_st *rq_dlg_param,
 		const display_dlg_sys_params_st *dlg_sys_param,
-		const bool cstate_en,
-		const bool pstate_en,
-		const bool vm_en,
-		const bool ignore_viewport_pos,
-		const bool immediate_flip_support)
+		const bool cstate_en)
 {
 	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
 	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
@@ -1060,9 +1056,6 @@ static void dml_rq_dlg_get_dlg_params(
 
 	dml_print("DML_DLG: %s: cstate_en = %d\n", __func__, cstate_en);
 	dml_print("DML_DLG: %s: pstate_en = %d\n", __func__, pstate_en);
-	dml_print("DML_DLG: %s: vm_en     = %d\n", __func__, vm_en);
-	dml_print("DML_DLG: %s: ignore_viewport_pos  = %d\n", __func__, ignore_viewport_pos);
-	dml_print("DML_DLG: %s: immediate_flip_support  = %d\n", __func__, immediate_flip_support);
 
 	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
@@ -1073,7 +1066,6 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end;	// 15 bits
 
-	//set_prefetch_mode(mode_lib, cstate_en, pstate_en, ignore_viewport_pos, immediate_flip_support);
 	min_ttu_vblank = get_min_ttu_vblank_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);	// From VBA
 
 	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
@@ -1725,9 +1717,6 @@ void dml314_rq_dlg_get_dlg_reg(
 			&rq_param.dlg,
 			&dlg_sys_param,
 			cstate_en,
-			pstate_en,
-			vm_en,
-			ignore_viewport_pos,
-			immediate_flip_support);
+			pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h
index 49cb85d1056c..d2c1ba8b7ebf 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h
@@ -62,9 +62,6 @@ void dml314_rq_dlg_get_dlg_reg(struct display_mode_lib             *mode_lib,
 		const unsigned int            num_pipes,
 		const unsigned int            pipe_idx,
 		const bool                    cstate_en,
-		const bool                    pstate_en,
-		const bool                    vm_en,
-		const bool                    ignore_viewport_pos,
-		const bool                    immediate_flip_support);
+		const bool                    pstate_en);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
index 2bdd6ed22611..8a4b60a278b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
@@ -55,10 +55,7 @@ struct dml_funcs {
 			const unsigned int num_pipes,
 			const unsigned int pipe_idx,
 			const bool cstate_en,
-			const bool pstate_en,
-			const bool vm_en,
-			const bool ignore_viewport_pos,
-			const bool immediate_flip_support);
+			const bool pstate_en);
 	void (*rq_dlg_get_rq_reg)(
 		struct display_mode_lib *mode_lib,
 		display_rq_regs_st *rq_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
index b4b51e51fc25..e39e2363ea0a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
@@ -1647,8 +1647,7 @@ static void dml_calculate_dlg_params(
 				pipe_cnt,
 				pipe_idx,
 				cstate_en,
-				context->bw_ctx.bw.dcn.clk.p_state_change_support,
-				false, false, true);
+				context->bw_ctx.bw.dcn.clk.p_state_change_support);
 
 		context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ctx.dml,
 				&context->res_ctx.pipe_ctx[i].rq_regs,
-- 
2.36.1

