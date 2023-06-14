Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCF70F352
	for <lists+amd-gfx@lfdr.de>; Wed, 24 May 2023 11:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3711010E633;
	Wed, 24 May 2023 09:46:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868AE10E574
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 May 2023 04:05:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VjMa8J0_1684900809; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VjMa8J0_1684900809) by smtp.aliyun-inc.com;
 Wed, 24 May 2023 12:00:09 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 08/13] drm/amd/display: remove unused definition
Date: Wed, 24 May 2023 11:59:47 +0800
Message-Id: <20230524035952.123590-8-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
References: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 May 2023 09:46:48 +0000
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
Cc: sunpeng.li@amd.com, harry.wentland@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Eliminate the following warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:884:43: warning: unused variable 'res_create_maximus_funcs'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:84:38: warning: unused variable 'debug_defaults_diags'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5296
Fixes: 00df97e1df57 ("drm/amd/display: Clean FPGA code in dc")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../amd/display/dc/dcn303/dcn303_resource.c   | 24 -------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index fcd126602178..f35514188a5c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -81,23 +81,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.disable_idle_power_optimizations = false,
 };
 
-static const struct dc_debug_options debug_defaults_diags = {
-		.disable_dmcu = true,
-		.force_abm_enable = false,
-		.timing_trace = true,
-		.clock_trace = true,
-		.disable_dpp_power_gate = true,
-		.disable_hubp_power_gate = true,
-		.disable_clock_gate = true,
-		.disable_pplib_clock_request = true,
-		.disable_pplib_wm_range = true,
-		.disable_stutter = false,
-		.scl_reset_length10 = true,
-		.dwb_fi_phase = -1, // -1 = disable
-		.dmub_command_table = true,
-		.enable_tri_buf = true,
-};
-
 static const struct dc_panel_config panel_config_defaults = {
 		.psr = {
 			.disable_psr = false,
@@ -881,13 +864,6 @@ static const struct resource_create_funcs res_create_funcs = {
 		.create_hwseq = dcn303_hwseq_create,
 };
 
-static const struct resource_create_funcs res_create_maximus_funcs = {
-		.read_dce_straps = NULL,
-		.create_audio = NULL,
-		.create_stream_encoder = NULL,
-		.create_hwseq = dcn303_hwseq_create,
-};
-
 static bool is_soc_bounding_box_valid(struct dc *dc)
 {
 	uint32_t hw_internal_rev = dc->ctx->asic_id.hw_internal_rev;
-- 
2.20.1.7.g153144c

