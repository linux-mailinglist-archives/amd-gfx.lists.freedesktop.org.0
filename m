Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0E404280
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Sep 2021 03:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5076E402;
	Thu,  9 Sep 2021 01:00:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F786E3F9
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 01:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2S8kh2xH9RJk2ZZZm/ulfhlU6PQd6zKtIMursuIeOYND/+HRhi/EjLSGP607QwUtn8d8WGKpHCelB817W9BiV71itKakq7YQ1ABxAeim6N5xXjSftp5rxKCee7OHB4iDV6op5unKHS45nyqo8jvIg0lw+2pOW8c0Sw7iDI6RO5Ye4itgmYr/ysBctq+81V61sOPk/JUfsHbiX1LaykxE06A8uT12284IjaJWnaxH577EITB5DqTVYUP8QqNnQjooIok4nai07N0k7wBPBjR9aOWMKIvRU8tzYyc9LYmur4adNTFWubO5NgbBJTD1Gp4LtrTjYWkmdgKRZPOZros5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ulWmJ/Yb4ur55vv0gnTADZPSqTE/CaTR98P5Dl5p2/0=;
 b=UuqiykEr61VWDp1jcLLyHgO0yZvc7ElX72jhAslht3tItD6C7y7Nn/d9oemEEAM4HT+yf8ilxnsjIE1cxijfR088eXyyskb09HoY2Xmxx/gg22Y7wQj+24XL7+6ZO6NQrRmhpXMuaAfBr10hzvcg6Qqid+EYwIqCTgrTlPpb4P8+HPWG0INgrgdi+tXB5h7g8BQ5pIUPVWrnkYkhnpfJ85VmtE2+FIMwuWuQ8GrKnIdveV8wqPkyZf1FIaeNHUUXGcPKOIMuUYesGiSm4WFwI5MJERWn7MFRfPuVkP3sKmVYtF0rrtKYX1qS8GXG3kLtEC/S7+TP6nglp6IqQtXibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulWmJ/Yb4ur55vv0gnTADZPSqTE/CaTR98P5Dl5p2/0=;
 b=1CnGnaBmxou5GS/kFBRzYLZ/9rMGiN3o2XuF9FXYYOqPRVzBtgsRxQGt6bxzX6ZWc8aAObdfoRoDYsanPL+hj21GnC1iLVO4gIFD/x+YdqMfj9bE6eCG+gJfp4H2WKl1bBE4wt34WsZ60dRpYFuEaR8Dqhs2ape5yISy1kz5byo=
Received: from CO2PR04CA0122.namprd04.prod.outlook.com (2603:10b6:104:7::24)
 by MWHPR1201MB2495.namprd12.prod.outlook.com (2603:10b6:300:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 9 Sep
 2021 01:00:31 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::89) by CO2PR04CA0122.outlook.office365.com
 (2603:10b6:104:7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 01:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 01:00:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 8 Sep 2021
 20:00:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 8 Sep 2021
 18:00:28 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Wed, 8 Sep 2021 20:00:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <ndesaulniers@google.com>, <torvalds@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <arnd@kernel.org>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <nathan@kernel.org>, <linux@roeck-us.net>,
 <llvm@lists.linux.dev>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 3/4] drm/amd/display: Fix rest of pass-by-value structs in DML
Date: Wed, 8 Sep 2021 21:00:22 -0400
Message-ID: <20210909010023.29110-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210909010023.29110-1-harry.wentland@amd.com>
References: <20210909010023.29110-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c1a6e85-7061-45df-77c2-08d9732d38bc
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2495:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2495C09879C2A390AC7E346A8CD59@MWHPR1201MB2495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0icBb2JCAgqE9pJQeiSwsYXwQcJIVHvy55DT+Fzxz84DMV86/0hjD6BRxpsv2064P0ZVNKHbdzQ6kLb/6WrDFItlGG3EpRmyDFISDB8IPCtMhkiKlHRqD3UVrpH4GA4Uuz03mH2NT1LABaAPQN2ZiqH0QS45ebVMjx21WDNjo8SPJ2LhQOaHi6DMPQ69wLfu3q9jkKrz/nx8bYvfb0wMk/LMG4jaOwgDfiaMeokCvp9ZL5jI99Y+58OXyw5lmZBEwB/YILJr7rch+qwKM6aGwKZCGcZVgliNww62V+fwsZmT0+PBxb/T/H7HvNnZZ6+pY4kZEifmqZx2mq4lRKBU7UDyF3TKVjdgbMxIdNBNqPjN34Kkanu6yXgY54hrcToVJ2BVzvBsQ8mKCwzkn3UuK6v+0mQJP2bQRk9vYdBv6s+rvVHpGDt6FMwZGr5TKOvoFjFhdPMx5caVoXwyVCNMAhQIS/K+UHBXZERcwK4IILv5/XaWzK9EP5awTxNItUDd5NgijLF0hrRtwuB81Vuj7AWgrpgtC1z/Vezc3ngDpF2EcNF6rYFtoSSl3t+SV4uMSg8MSDvqlbcHBcpQ7Z75MUmybseMC5hQN4bnian9gvmhndqdigaVOKiucACjP5TkKwhfptZSfSDTEQr8wMSWrH799hjIpHoK1ZAt6YfTvdNDy+I/ZtmUctWkHHdyyCMYDTUENCd5TqOmcastk8duSkhNd5Rum4K0w2GVe4XSnE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(4326008)(54906003)(81166007)(356005)(70206006)(47076005)(70586007)(36756003)(6916009)(82310400003)(66574015)(6666004)(2906002)(44832011)(1076003)(30864003)(8936002)(316002)(508600001)(7696005)(8676002)(5660300002)(186003)(36860700001)(26005)(83380400001)(336012)(426003)(2616005)(86362001)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 01:00:31.0524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1a6e85-7061-45df-77c2-08d9732d38bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2495
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Passing structs adds a lot of overhead. We don't ever want to pass
anything bigger than primitives by value.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev
---
 .../gpu/drm/amd/display/dc/calcs/dcn_calcs.c  |  10 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 126 +++++-----
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 124 +++++-----
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     |  68 +++---
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     |  34 +--
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  72 +++---
 .../display/dc/dml/dml1_display_rq_dlg_calc.c | 222 +++++++++---------
 .../display/dc/dml/dml1_display_rq_dlg_calc.h |  10 +-
 8 files changed, 333 insertions(+), 333 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
index 0e18df1283b6..8e3a9294be3a 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
@@ -502,15 +502,15 @@ static void dcn_bw_calc_rq_dlg_ttu(
 	/*todo: soc->sr_enter_plus_exit_time??*/
 	dlg_sys_param.t_srx_delay_us = dc->dcn_ip->dcfclk_cstate_latency / v->dcf_clk_deep_sleep;
 
-	dml1_rq_dlg_get_rq_params(dml, &rq_param, input.pipe.src);
-	dml1_extract_rq_regs(dml, rq_regs, rq_param);
+	dml1_rq_dlg_get_rq_params(dml, &rq_param, &input.pipe.src);
+	dml1_extract_rq_regs(dml, rq_regs, &rq_param);
 	dml1_rq_dlg_get_dlg_params(
 			dml,
 			dlg_regs,
 			ttu_regs,
-			rq_param.dlg,
-			dlg_sys_param,
-			input,
+			&rq_param.dlg,
+			&dlg_sys_param,
+			&input,
 			true,
 			true,
 			v->pte_enable == dcn_bw_yes,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 6a4f479c5aab..246071c72f6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -37,8 +37,8 @@
 //
 static void dml20_rq_dlg_get_rq_params(
 		struct display_mode_lib *mode_lib,
-		display_rq_params_st * rq_param,
-		const display_pipe_source_params_st pipe_src_param);
+		display_rq_params_st *rq_param,
+		const display_pipe_source_params_st *pipe_src_param);
 
 // Function: dml20_rq_dlg_get_dlg_params
 //  Calculate deadline related parameters
@@ -49,8 +49,8 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en);
 /*
@@ -188,28 +188,28 @@ static void extract_rq_sizing_regs(struct display_mode_lib *mode_lib,
 
 static void extract_rq_regs(struct display_mode_lib *mode_lib,
 		display_rq_regs_st *rq_regs,
-		const display_rq_params_st rq_param)
+		const display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
 
-	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_l.dpte_row_height),
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_l.dpte_row_height),
 			1) - 3;
 
-	if (rq_param.yuv420) {
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
-		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_c.dpte_row_height),
+	if (rq_param->yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_c.dpte_row_height),
 				1) - 3;
 	}
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	// TODO: take the max between luma, chroma chunk size?
 	// okay for now, as we are setting chunk_bytes to 8kb anyways
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -218,9 +218,9 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 	rq_regs->mrq_expansion_mode = 1;
 	rq_regs->crq_expansion_mode = 1;
 
-	if (rq_param.yuv420) {
-		if ((double) rq_param.misc.rq_l.stored_swath_bytes
-				/ (double) rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+		if ((double) rq_param->misc.rq_l.stored_swath_bytes
+				/ (double) rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); // half to chroma
 		} else {
 			detile_buf_plane1_addr = dml_round_to_multiple((unsigned int) ((2.0 * detile_buf_size_in_bytes) / 3.0),
@@ -233,7 +233,7 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 
 static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 		display_rq_params_st *rq_param,
-		const display_pipe_source_params_st pipe_src_param)
+		const display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -242,8 +242,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = false;
 	bool req128_c = false;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -685,7 +685,7 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 		display_data_rq_sizing_params_st *rq_sizing_param,
 		display_data_rq_dlg_params_st *rq_dlg_param,
 		display_data_rq_misc_params_st *rq_misc_param,
-		const display_pipe_source_params_st pipe_src_param,
+		const display_pipe_source_params_st *pipe_src_param,
 		bool is_chroma)
 {
 	bool mode_422 = false;
@@ -697,15 +697,15 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 
 	// TODO check if ppe apply for both luma and chroma in 422 case
 	if (is_chroma) {
-		vp_width = pipe_src_param.viewport_width_c / ppe;
-		vp_height = pipe_src_param.viewport_height_c;
-		data_pitch = pipe_src_param.data_pitch_c;
-		meta_pitch = pipe_src_param.meta_pitch_c;
+		vp_width = pipe_src_param->viewport_width_c / ppe;
+		vp_height = pipe_src_param->viewport_height_c;
+		data_pitch = pipe_src_param->data_pitch_c;
+		meta_pitch = pipe_src_param->meta_pitch_c;
 	} else {
-		vp_width = pipe_src_param.viewport_width / ppe;
-		vp_height = pipe_src_param.viewport_height;
-		data_pitch = pipe_src_param.data_pitch;
-		meta_pitch = pipe_src_param.meta_pitch;
+		vp_width = pipe_src_param->viewport_width / ppe;
+		vp_height = pipe_src_param->viewport_height;
+		data_pitch = pipe_src_param->data_pitch;
+		meta_pitch = pipe_src_param->meta_pitch;
 	}
 
 	rq_sizing_param->chunk_bytes = 8192;
@@ -728,21 +728,21 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 			vp_height,
 			data_pitch,
 			meta_pitch,
-			pipe_src_param.source_format,
-			pipe_src_param.sw_mode,
-			pipe_src_param.macro_tile_size,
-			pipe_src_param.source_scan,
+			pipe_src_param->source_format,
+			pipe_src_param->sw_mode,
+			pipe_src_param->macro_tile_size,
+			pipe_src_param->source_scan,
 			is_chroma);
 }
 
 static void dml20_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
 		display_rq_params_st *rq_param,
-		const display_pipe_source_params_st pipe_src_param)
+		const display_pipe_source_params_st *pipe_src_param)
 {
 	// get param for luma surface
-	rq_param->yuv420 = pipe_src_param.source_format == dm_420_8
-			|| pipe_src_param.source_format == dm_420_10;
-	rq_param->yuv420_10bpc = pipe_src_param.source_format == dm_420_10;
+	rq_param->yuv420 = pipe_src_param->source_format == dm_420_8
+			|| pipe_src_param->source_format == dm_420_10;
+	rq_param->yuv420_10bpc = pipe_src_param->source_format == dm_420_10;
 
 	get_surf_rq_param(mode_lib,
 			&(rq_param->sizing.rq_l),
@@ -751,7 +751,7 @@ static void dml20_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
 			pipe_src_param,
 			0);
 
-	if (is_dual_plane((enum source_format_class)(pipe_src_param.source_format))) {
+	if (is_dual_plane((enum source_format_class)(pipe_src_param->source_format))) {
 		// get param for chroma surface
 		get_surf_rq_param(mode_lib,
 				&(rq_param->sizing.rq_c),
@@ -773,8 +773,8 @@ void dml20_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib,
 	display_rq_params_st rq_param = {0};
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
-	dml20_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param->src);
-	extract_rq_regs(mode_lib, rq_regs, rq_param);
+	dml20_rq_dlg_get_rq_params(mode_lib, &rq_param, &pipe_param->src);
+	extract_rq_regs(mode_lib, rq_regs, &rq_param);
 
 	print__rq_regs_st(mode_lib, rq_regs);
 }
@@ -787,8 +787,8 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en)
 {
@@ -935,7 +935,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			* (double) ref_freq_to_pix_freq);
 	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
 
-	min_dcfclk_mhz = dlg_sys_param.deepsleep_dcfclk_mhz;
+	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
 	min_ttu_vblank = get_min_ttu_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
 
@@ -995,20 +995,20 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 //     vinit_bot_l     = scl.vinit_bot;
 //     vinit_bot_c     = scl.vinit_bot_c;
 
-//    unsigned int swath_height_l                 = rq_dlg_param.rq_l.swath_height;
-	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
-//    unsigned int dpte_bytes_per_row_ub_l        = rq_dlg_param.rq_l.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
-//    unsigned int meta_pte_bytes_per_frame_ub_l  = rq_dlg_param.rq_l.meta_pte_bytes_per_frame_ub;
-//    unsigned int meta_bytes_per_row_ub_l        = rq_dlg_param.rq_l.meta_bytes_per_row_ub;
+//    unsigned int swath_height_l                 = rq_dlg_param->rq_l.swath_height;
+	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
+//    unsigned int dpte_bytes_per_row_ub_l        = rq_dlg_param->rq_l.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
+//    unsigned int meta_pte_bytes_per_frame_ub_l  = rq_dlg_param->rq_l.meta_pte_bytes_per_frame_ub;
+//    unsigned int meta_bytes_per_row_ub_l        = rq_dlg_param->rq_l.meta_bytes_per_row_ub;
 
-//    unsigned int swath_height_c                 = rq_dlg_param.rq_c.swath_height;
-	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
-	//   dpte_bytes_per_row_ub_c        = rq_dlg_param.rq_c.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
+//    unsigned int swath_height_c                 = rq_dlg_param->rq_c.swath_height;
+	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
+	//   dpte_bytes_per_row_ub_c        = rq_dlg_param->rq_c.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
 
-	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
-	meta_chunks_per_row_ub_c = rq_dlg_param.rq_c.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
@@ -1137,16 +1137,16 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
 
 	// Active
-	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
-	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
-	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
-	meta_row_height_c = rq_dlg_param.rq_c.meta_row_height;
+	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
+	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
 	swath_width_pixels_ub_l = 0;
 	swath_width_pixels_ub_c = 0;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
-	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
-	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
 
 	if (mode_422) {
 		swath_width_pixels_ub_l = swath_width_ub_l * 2;  // *2 for 2 pixel per element
@@ -1584,15 +1584,15 @@ void dml20_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	// system parameter calculation done
 
 	dml_print("DML_DLG: Calculation for pipe[%d] start\n\n", pipe_idx);
-	dml20_rq_dlg_get_rq_params(mode_lib, &rq_param, e2e_pipe_param[pipe_idx].pipe.src);
+	dml20_rq_dlg_get_rq_params(mode_lib, &rq_param, &e2e_pipe_param[pipe_idx].pipe.src);
 	dml20_rq_dlg_get_dlg_params(mode_lib,
 			e2e_pipe_param,
 			num_pipes,
 			pipe_idx,
 			dlg_regs,
 			ttu_regs,
-			rq_param.dlg,
-			dlg_sys_param,
+			&rq_param.dlg,
+			&dlg_sys_param,
 			cstate_en,
 			pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
index b5f33f05c8e8..015e7f2c0b16 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
@@ -38,7 +38,7 @@
 static void dml20v2_rq_dlg_get_rq_params(
 		struct display_mode_lib *mode_lib,
 		display_rq_params_st * rq_param,
-		const display_pipe_source_params_st pipe_src_param);
+		const display_pipe_source_params_st *pipe_src_param);
 
 // Function: dml20v2_rq_dlg_get_dlg_params
 //  Calculate deadline related parameters
@@ -49,8 +49,8 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en);
 /*
@@ -188,28 +188,28 @@ static void extract_rq_sizing_regs(struct display_mode_lib *mode_lib,
 
 static void extract_rq_regs(struct display_mode_lib *mode_lib,
 		display_rq_regs_st *rq_regs,
-		const display_rq_params_st rq_param)
+		const display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
 
-	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_l.dpte_row_height),
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_l.dpte_row_height),
 			1) - 3;
 
-	if (rq_param.yuv420) {
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
-		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_c.dpte_row_height),
+	if (rq_param->yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_c.dpte_row_height),
 				1) - 3;
 	}
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	// TODO: take the max between luma, chroma chunk size?
 	// okay for now, as we are setting chunk_bytes to 8kb anyways
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -218,9 +218,9 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 	rq_regs->mrq_expansion_mode = 1;
 	rq_regs->crq_expansion_mode = 1;
 
-	if (rq_param.yuv420) {
-		if ((double) rq_param.misc.rq_l.stored_swath_bytes
-				/ (double) rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+		if ((double) rq_param->misc.rq_l.stored_swath_bytes
+				/ (double) rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); // half to chroma
 		} else {
 			detile_buf_plane1_addr = dml_round_to_multiple((unsigned int) ((2.0 * detile_buf_size_in_bytes) / 3.0),
@@ -233,7 +233,7 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 
 static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 		display_rq_params_st *rq_param,
-		const display_pipe_source_params_st pipe_src_param)
+		const display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -242,8 +242,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = false;
 	bool req128_c = false;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -685,7 +685,7 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 		display_data_rq_sizing_params_st *rq_sizing_param,
 		display_data_rq_dlg_params_st *rq_dlg_param,
 		display_data_rq_misc_params_st *rq_misc_param,
-		const display_pipe_source_params_st pipe_src_param,
+		const display_pipe_source_params_st *pipe_src_param,
 		bool is_chroma)
 {
 	bool mode_422 = false;
@@ -697,15 +697,15 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 
 	// TODO check if ppe apply for both luma and chroma in 422 case
 	if (is_chroma) {
-		vp_width = pipe_src_param.viewport_width_c / ppe;
-		vp_height = pipe_src_param.viewport_height_c;
-		data_pitch = pipe_src_param.data_pitch_c;
-		meta_pitch = pipe_src_param.meta_pitch_c;
+		vp_width = pipe_src_param->viewport_width_c / ppe;
+		vp_height = pipe_src_param->viewport_height_c;
+		data_pitch = pipe_src_param->data_pitch_c;
+		meta_pitch = pipe_src_param->meta_pitch_c;
 	} else {
-		vp_width = pipe_src_param.viewport_width / ppe;
-		vp_height = pipe_src_param.viewport_height;
-		data_pitch = pipe_src_param.data_pitch;
-		meta_pitch = pipe_src_param.meta_pitch;
+		vp_width = pipe_src_param->viewport_width / ppe;
+		vp_height = pipe_src_param->viewport_height;
+		data_pitch = pipe_src_param->data_pitch;
+		meta_pitch = pipe_src_param->meta_pitch;
 	}
 
 	rq_sizing_param->chunk_bytes = 8192;
@@ -728,21 +728,21 @@ static void get_surf_rq_param(struct display_mode_lib *mode_lib,
 			vp_height,
 			data_pitch,
 			meta_pitch,
-			pipe_src_param.source_format,
-			pipe_src_param.sw_mode,
-			pipe_src_param.macro_tile_size,
-			pipe_src_param.source_scan,
+			pipe_src_param->source_format,
+			pipe_src_param->sw_mode,
+			pipe_src_param->macro_tile_size,
+			pipe_src_param->source_scan,
 			is_chroma);
 }
 
 static void dml20v2_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
 		display_rq_params_st *rq_param,
-		const display_pipe_source_params_st pipe_src_param)
+		const display_pipe_source_params_st *pipe_src_param)
 {
 	// get param for luma surface
-	rq_param->yuv420 = pipe_src_param.source_format == dm_420_8
-			|| pipe_src_param.source_format == dm_420_10;
-	rq_param->yuv420_10bpc = pipe_src_param.source_format == dm_420_10;
+	rq_param->yuv420 = pipe_src_param->source_format == dm_420_8
+			|| pipe_src_param->source_format == dm_420_10;
+	rq_param->yuv420_10bpc = pipe_src_param->source_format == dm_420_10;
 
 	get_surf_rq_param(mode_lib,
 			&(rq_param->sizing.rq_l),
@@ -751,7 +751,7 @@ static void dml20v2_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
 			pipe_src_param,
 			0);
 
-	if (is_dual_plane((enum source_format_class)(pipe_src_param.source_format))) {
+	if (is_dual_plane((enum source_format_class)(pipe_src_param->source_format))) {
 		// get param for chroma surface
 		get_surf_rq_param(mode_lib,
 				&(rq_param->sizing.rq_c),
@@ -773,8 +773,8 @@ void dml20v2_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib,
 	display_rq_params_st rq_param = {0};
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
-	dml20v2_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param->src);
-	extract_rq_regs(mode_lib, rq_regs, rq_param);
+	dml20v2_rq_dlg_get_rq_params(mode_lib, &rq_param, &pipe_param->src);
+	extract_rq_regs(mode_lib, rq_regs, &rq_param);
 
 	print__rq_regs_st(mode_lib, rq_regs);
 }
@@ -787,8 +787,8 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en)
 {
@@ -935,7 +935,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			* (double) ref_freq_to_pix_freq);
 	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
 
-	min_dcfclk_mhz = dlg_sys_param.deepsleep_dcfclk_mhz;
+	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
 	min_ttu_vblank = get_min_ttu_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
 
@@ -996,20 +996,20 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 //     vinit_bot_l     = scl.vinit_bot;
 //     vinit_bot_c     = scl.vinit_bot_c;
 
-//    unsigned int swath_height_l                 = rq_dlg_param.rq_l.swath_height;
-	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
-//    unsigned int dpte_bytes_per_row_ub_l        = rq_dlg_param.rq_l.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
-//    unsigned int meta_pte_bytes_per_frame_ub_l  = rq_dlg_param.rq_l.meta_pte_bytes_per_frame_ub;
-//    unsigned int meta_bytes_per_row_ub_l        = rq_dlg_param.rq_l.meta_bytes_per_row_ub;
+//    unsigned int swath_height_l                 = rq_dlg_param->rq_l.swath_height;
+	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
+//    unsigned int dpte_bytes_per_row_ub_l        = rq_dlg_param->rq_l.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
+//    unsigned int meta_pte_bytes_per_frame_ub_l  = rq_dlg_param->rq_l.meta_pte_bytes_per_frame_ub;
+//    unsigned int meta_bytes_per_row_ub_l        = rq_dlg_param->rq_l.meta_bytes_per_row_ub;
 
-//    unsigned int swath_height_c                 = rq_dlg_param.rq_c.swath_height;
-	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
-	//   dpte_bytes_per_row_ub_c        = rq_dlg_param.rq_c.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
+//    unsigned int swath_height_c                 = rq_dlg_param->rq_c.swath_height;
+	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
+	//   dpte_bytes_per_row_ub_c        = rq_dlg_param->rq_c.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
 
-	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
-	meta_chunks_per_row_ub_c = rq_dlg_param.rq_c.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
@@ -1138,16 +1138,16 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
 
 	// Active
-	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
-	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
-	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
-	meta_row_height_c = rq_dlg_param.rq_c.meta_row_height;
+	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
+	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
 	swath_width_pixels_ub_l = 0;
 	swath_width_pixels_ub_c = 0;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
-	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
-	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
 
 	if (mode_422) {
 		swath_width_pixels_ub_l = swath_width_ub_l * 2;  // *2 for 2 pixel per element
@@ -1585,15 +1585,15 @@ void dml20v2_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	// system parameter calculation done
 
 	dml_print("DML_DLG: Calculation for pipe[%d] start\n\n", pipe_idx);
-	dml20v2_rq_dlg_get_rq_params(mode_lib, &rq_param, e2e_pipe_param[pipe_idx].pipe.src);
+	dml20v2_rq_dlg_get_rq_params(mode_lib, &rq_param, &e2e_pipe_param[pipe_idx].pipe.src);
 	dml20v2_rq_dlg_get_dlg_params(mode_lib,
 			e2e_pipe_param,
 			num_pipes,
 			pipe_idx,
 			dlg_regs,
 			ttu_regs,
-			rq_param.dlg,
-			dlg_sys_param,
+			&rq_param.dlg,
+			&dlg_sys_param,
 			cstate_en,
 			pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index 661fbb622824..46c433c0bcb0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -166,30 +166,30 @@ static void extract_rq_sizing_regs(
 static void extract_rq_regs(
 		struct display_mode_lib *mode_lib,
 		display_rq_regs_st *rq_regs,
-		const display_rq_params_st rq_param)
+		const display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
 
 	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(
-			dml_log2(rq_param.dlg.rq_l.dpte_row_height),
+			dml_log2(rq_param->dlg.rq_l.dpte_row_height),
 			1) - 3;
 
-	if (rq_param.yuv420) {
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
+	if (rq_param->yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
 		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(
-				dml_log2(rq_param.dlg.rq_c.dpte_row_height),
+				dml_log2(rq_param->dlg.rq_c.dpte_row_height),
 				1) - 3;
 	}
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	// FIXME: take the max between luma, chroma chunk size?
 	// okay for now, as we are setting chunk_bytes to 8kb anyways
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024) { //32kb
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -198,9 +198,9 @@ static void extract_rq_regs(
 	rq_regs->mrq_expansion_mode = 1;
 	rq_regs->crq_expansion_mode = 1;
 
-	if (rq_param.yuv420) {
-		if ((double) rq_param.misc.rq_l.stored_swath_bytes
-				/ (double) rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+		if ((double) rq_param->misc.rq_l.stored_swath_bytes
+				/ (double) rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); // half to chroma
 		} else {
 			detile_buf_plane1_addr = dml_round_to_multiple(
@@ -215,7 +215,7 @@ static void extract_rq_regs(
 static void handle_det_buf_split(
 		struct display_mode_lib *mode_lib,
 		display_rq_params_st *rq_param,
-		const display_pipe_source_params_st pipe_src_param)
+		const display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -224,8 +224,8 @@ static void handle_det_buf_split(
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = false;
 	bool req128_c = false;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -806,7 +806,7 @@ static void dml_rq_dlg_get_rq_params(
 	}
 
 	// calculate how to split the det buffer space between luma and chroma
-	handle_det_buf_split(mode_lib, rq_param, pipe_param->src);
+	handle_det_buf_split(mode_lib, rq_param, &pipe_param->src);
 	print__rq_params_st(mode_lib, rq_param);
 }
 
@@ -819,7 +819,7 @@ void dml21_rq_dlg_get_rq_reg(
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
 	dml_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param);
-	extract_rq_regs(mode_lib, rq_regs, rq_param);
+	extract_rq_regs(mode_lib, rq_regs, &rq_param);
 
 	print__rq_regs_st(mode_lib, rq_regs);
 }
@@ -833,8 +833,8 @@ static void dml_rq_dlg_get_dlg_params(
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en)
 {
@@ -981,7 +981,7 @@ static void dml_rq_dlg_get_dlg_params(
 			* (double) ref_freq_to_pix_freq);
 	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
-	min_dcfclk_mhz = dlg_sys_param.deepsleep_dcfclk_mhz;
+	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
 	min_ttu_vblank = get_min_ttu_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
 
@@ -1042,13 +1042,13 @@ static void dml_rq_dlg_get_dlg_params(
 	scl_enable = scl->scl_enable;
 
 	line_time_in_us = (htotal / pclk_freq_in_mhz);
-	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
-	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
-	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
-	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
+	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
+	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
 
-	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
-	meta_chunks_per_row_ub_c = rq_dlg_param.rq_c.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
@@ -1189,16 +1189,16 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
 
 	// Active
-	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
-	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
-	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
-	meta_row_height_c = rq_dlg_param.rq_c.meta_row_height;
+	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
+	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
 	swath_width_pixels_ub_l = 0;
 	swath_width_pixels_ub_c = 0;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
-	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
-	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
 
 	if (mode_422) {
 		swath_width_pixels_ub_l = swath_width_ub_l * 2;  // *2 for 2 pixel per element
@@ -1704,8 +1704,8 @@ void dml21_rq_dlg_get_dlg_reg(
 			pipe_idx,
 			dlg_regs,
 			ttu_regs,
-			rq_param.dlg,
-			dlg_sys_param,
+			&rq_param.dlg,
+			&dlg_sys_param,
 			cstate_en,
 			pstate_en);
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 1535b01a8c5d..aef854270054 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -113,28 +113,28 @@ static void extract_rq_sizing_regs(struct display_mode_lib *mode_lib,
 
 static void extract_rq_regs(struct display_mode_lib *mode_lib,
 	display_rq_regs_st *rq_regs,
-	const display_rq_params_st rq_param)
+	const display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
 
-	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_l.dpte_row_height),
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_l.dpte_row_height),
 		1) - 3;
 
-	if (rq_param.yuv420) {
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
-		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_c.dpte_row_height),
+	if (rq_param->yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_c.dpte_row_height),
 			1) - 3;
 	}
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	// FIXME: take the max between luma, chroma chunk size?
 	// okay for now, as we are setting chunk_bytes to 8kb anyways
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024 || (rq_param.yuv420 && rq_param.sizing.rq_c.chunk_bytes >= 32 * 1024)) { //32kb
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024 || (rq_param->yuv420 && rq_param->sizing.rq_c.chunk_bytes >= 32 * 1024)) { //32kb
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -143,9 +143,9 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 	rq_regs->mrq_expansion_mode = 1;
 	rq_regs->crq_expansion_mode = 1;
 
-	if (rq_param.yuv420) {
-	if ((double)rq_param.misc.rq_l.stored_swath_bytes
-			/ (double)rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+	if ((double)rq_param->misc.rq_l.stored_swath_bytes
+			/ (double)rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); // half to chroma
 		} else {
 			detile_buf_plane1_addr = dml_round_to_multiple((unsigned int)((2.0 * detile_buf_size_in_bytes) / 3.0),
@@ -158,7 +158,7 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib,
 
 static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 	display_rq_params_st *rq_param,
-	const display_pipe_source_params_st pipe_src_param)
+	const display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -167,8 +167,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = false;
 	bool req128_c = false;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -871,7 +871,7 @@ static void dml_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
 	}
 
 	// calculate how to split the det buffer space between luma and chroma
-	handle_det_buf_split(mode_lib, rq_param, pipe_param->src);
+	handle_det_buf_split(mode_lib, rq_param, &pipe_param->src);
 	print__rq_params_st(mode_lib, rq_param);
 }
 
@@ -883,7 +883,7 @@ void dml30_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib,
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
 	dml_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param);
-	extract_rq_regs(mode_lib, rq_regs, rq_param);
+	extract_rq_regs(mode_lib, rq_regs, &rq_param);
 
 	print__rq_regs_st(mode_lib, rq_regs);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
index 442abae4bc8c..e0fecf127bd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
@@ -196,26 +196,26 @@ static void extract_rq_sizing_regs(struct display_mode_lib *mode_lib, display_da
 	rq_regs->mpte_group_size = dml_log2(rq_sizing->mpte_group_bytes) - 6;
 }
 
-static void extract_rq_regs(struct display_mode_lib *mode_lib, display_rq_regs_st *rq_regs, const display_rq_params_st rq_param)
+static void extract_rq_regs(struct display_mode_lib *mode_lib, display_rq_regs_st *rq_regs, const display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
 
-	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_l.dpte_row_height), 1) - 3;
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_l.dpte_row_height), 1) - 3;
 
-	if (rq_param.yuv420) {
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
-		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_c.dpte_row_height), 1) - 3;
+	if (rq_param->yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param->dlg.rq_c.dpte_row_height), 1) - 3;
 	}
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	// FIXME: take the max between luma, chroma chunk size?
 	// okay for now, as we are setting chunk_bytes to 8kb anyways
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024 || (rq_param.yuv420 && rq_param.sizing.rq_c.chunk_bytes >= 32 * 1024)) { //32kb
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024 || (rq_param->yuv420 && rq_param->sizing.rq_c.chunk_bytes >= 32 * 1024)) { //32kb
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -225,8 +225,8 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib, display_rq_regs_s
 	rq_regs->crq_expansion_mode = 1;
 
 	// Note: detile_buf_plane1_addr is in unit of 1KB
-	if (rq_param.yuv420) {
-		if ((double) rq_param.misc.rq_l.stored_swath_bytes / (double) rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+		if ((double) rq_param->misc.rq_l.stored_swath_bytes / (double) rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 1024.0); // half to chroma
 #ifdef __DML_RQ_DLG_CALC_DEBUG__
 					dml_print("DML_DLG: %s: detile_buf_plane1_addr = %0d (1/2 to chroma)\n", __func__, detile_buf_plane1_addr);
@@ -244,14 +244,14 @@ static void extract_rq_regs(struct display_mode_lib *mode_lib, display_rq_regs_s
 	dml_print("DML_DLG: %s: detile_buf_size_in_bytes = %0d\n", __func__, detile_buf_size_in_bytes);
 	dml_print("DML_DLG: %s: detile_buf_plane1_addr = %0d\n", __func__, detile_buf_plane1_addr);
 	dml_print("DML_DLG: %s: plane1_base_address = %0d\n", __func__, rq_regs->plane1_base_address);
-	dml_print("DML_DLG: %s: rq_l.stored_swath_bytes = %0d\n", __func__, rq_param.misc.rq_l.stored_swath_bytes);
-	dml_print("DML_DLG: %s: rq_c.stored_swath_bytes = %0d\n", __func__, rq_param.misc.rq_c.stored_swath_bytes);
-	dml_print("DML_DLG: %s: rq_l.swath_height = %0d\n", __func__, rq_param.dlg.rq_l.swath_height);
-	dml_print("DML_DLG: %s: rq_c.swath_height = %0d\n", __func__, rq_param.dlg.rq_c.swath_height);
+	dml_print("DML_DLG: %s: rq_l.stored_swath_bytes = %0d\n", __func__, rq_param->misc.rq_l.stored_swath_bytes);
+	dml_print("DML_DLG: %s: rq_c.stored_swath_bytes = %0d\n", __func__, rq_param->misc.rq_c.stored_swath_bytes);
+	dml_print("DML_DLG: %s: rq_l.swath_height = %0d\n", __func__, rq_param->dlg.rq_l.swath_height);
+	dml_print("DML_DLG: %s: rq_c.swath_height = %0d\n", __func__, rq_param->dlg.rq_c.swath_height);
 #endif
 }
 
-static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_params_st *rq_param, const display_pipe_source_params_st pipe_src_param)
+static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_params_st *rq_param, const display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -260,8 +260,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_p
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = 0;
 	bool req128_c = 0;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -849,7 +849,7 @@ static void dml_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib, display_
 	}
 
 	// calculate how to split the det buffer space between luma and chroma
-	handle_det_buf_split(mode_lib, rq_param, pipe_param->src);
+	handle_det_buf_split(mode_lib, rq_param, &pipe_param->src);
 	print__rq_params_st(mode_lib, rq_param);
 }
 
@@ -859,7 +859,7 @@ void dml31_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib, display_rq_regs_
 
 	memset(rq_regs, 0, sizeof(*rq_regs));
 	dml_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param);
-	extract_rq_regs(mode_lib, rq_regs, rq_param);
+	extract_rq_regs(mode_lib, rq_regs, &rq_param);
 
 	print__rq_regs_st(mode_lib, rq_regs);
 }
@@ -943,8 +943,8 @@ static void dml_rq_dlg_get_dlg_params(
 		const unsigned int pipe_idx,
 		display_dlg_regs_st *disp_dlg_regs,
 		display_ttu_regs_st *disp_ttu_regs,
-		const display_rq_dlg_params_st rq_dlg_param,
-		const display_dlg_sys_params_st dlg_sys_param,
+		const display_rq_dlg_params_st *rq_dlg_param,
+		const display_dlg_sys_params_st *dlg_sys_param,
 		const bool cstate_en,
 		const bool pstate_en,
 		const bool vm_en,
@@ -1112,13 +1112,13 @@ static void dml_rq_dlg_get_dlg_params(
 	vratio_c = scl->vscl_ratio_c;
 	scl_enable = scl->scl_enable;
 
-	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
-	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
-	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
-	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
+	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
+	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
 
-	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
-	meta_chunks_per_row_ub_c = rq_dlg_param.rq_c.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_c = rq_dlg_param->rq_c.meta_chunks_per_row_ub;
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
@@ -1239,16 +1239,16 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: vratio_pre_c = %3.2f\n", __func__, vratio_pre_c);
 
 	// Active
-	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
-	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
-	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
-	meta_row_height_c = rq_dlg_param.rq_c.meta_row_height;
+	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
+	meta_row_height_c = rq_dlg_param->rq_c.meta_row_height;
 	swath_width_pixels_ub_l = 0;
 	swath_width_pixels_ub_c = 0;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
-	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
-	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
 
 	if (mode_422) {
 		swath_width_pixels_ub_l = swath_width_ub_l * 2;  // *2 for 2 pixel per element
@@ -1712,8 +1712,8 @@ void dml31_rq_dlg_get_dlg_reg(
 			pipe_idx,
 			dlg_regs,
 			ttu_regs,
-			rq_param.dlg,
-			dlg_sys_param,
+			&rq_param.dlg,
+			&dlg_sys_param,
 			cstate_en,
 			pstate_en,
 			vm_en,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
index 9bde3f961409..59dc2c5b58dd 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
@@ -231,22 +231,22 @@ static void extract_rq_sizing_regs(
 void dml1_extract_rq_regs(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_rq_regs_st *rq_regs,
-		const struct _vcs_dpi_display_rq_params_st rq_param)
+		const struct _vcs_dpi_display_rq_params_st *rq_param)
 {
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 	unsigned int detile_buf_plane1_addr = 0;
 
-	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param.sizing.rq_l);
-	if (rq_param.yuv420)
-		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param.sizing.rq_c);
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), &rq_param->sizing.rq_l);
+	if (rq_param->yuv420)
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), &rq_param->sizing.rq_c);
 
-	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
-	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param->dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param->dlg.rq_c.swath_height);
 
 	/* TODO: take the max between luma, chroma chunk size?
 	 * okay for now, as we are setting chunk_bytes to 8kb anyways
 	 */
-	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024) { /*32kb */
+	if (rq_param->sizing.rq_l.chunk_bytes >= 32 * 1024) { /*32kb */
 		rq_regs->drq_expansion_mode = 0;
 	} else {
 		rq_regs->drq_expansion_mode = 2;
@@ -255,9 +255,9 @@ void dml1_extract_rq_regs(
 	rq_regs->mrq_expansion_mode = 1;
 	rq_regs->crq_expansion_mode = 1;
 
-	if (rq_param.yuv420) {
-		if ((double) rq_param.misc.rq_l.stored_swath_bytes
-				/ (double) rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+	if (rq_param->yuv420) {
+		if ((double) rq_param->misc.rq_l.stored_swath_bytes
+				/ (double) rq_param->misc.rq_c.stored_swath_bytes <= 1.5) {
 			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); /* half to chroma */
 		} else {
 			detile_buf_plane1_addr = dml_round_to_multiple(
@@ -272,7 +272,7 @@ void dml1_extract_rq_regs(
 static void handle_det_buf_split(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_rq_params_st *rq_param,
-		const struct _vcs_dpi_display_pipe_source_params_st pipe_src_param)
+		const struct _vcs_dpi_display_pipe_source_params_st *pipe_src_param)
 {
 	unsigned int total_swath_bytes = 0;
 	unsigned int swath_bytes_l = 0;
@@ -281,8 +281,8 @@ static void handle_det_buf_split(
 	unsigned int full_swath_bytes_packed_c = 0;
 	bool req128_l = 0;
 	bool req128_c = 0;
-	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
 	unsigned int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
@@ -556,7 +556,7 @@ static void get_surf_rq_param(
 		struct _vcs_dpi_display_data_rq_sizing_params_st *rq_sizing_param,
 		struct _vcs_dpi_display_data_rq_dlg_params_st *rq_dlg_param,
 		struct _vcs_dpi_display_data_rq_misc_params_st *rq_misc_param,
-		const struct _vcs_dpi_display_pipe_source_params_st pipe_src_param,
+		const struct _vcs_dpi_display_pipe_source_params_st *pipe_src_param,
 		bool is_chroma)
 {
 	bool mode_422 = 0;
@@ -622,15 +622,15 @@ static void get_surf_rq_param(
 
 	/* TODO check if ppe apply for both luma and chroma in 422 case */
 	if (is_chroma) {
-		vp_width = pipe_src_param.viewport_width_c / ppe;
-		vp_height = pipe_src_param.viewport_height_c;
-		data_pitch = pipe_src_param.data_pitch_c;
-		meta_pitch = pipe_src_param.meta_pitch_c;
+		vp_width = pipe_src_param->viewport_width_c / ppe;
+		vp_height = pipe_src_param->viewport_height_c;
+		data_pitch = pipe_src_param->data_pitch_c;
+		meta_pitch = pipe_src_param->meta_pitch_c;
 	} else {
-		vp_width = pipe_src_param.viewport_width / ppe;
-		vp_height = pipe_src_param.viewport_height;
-		data_pitch = pipe_src_param.data_pitch;
-		meta_pitch = pipe_src_param.meta_pitch;
+		vp_width = pipe_src_param->viewport_width / ppe;
+		vp_height = pipe_src_param->viewport_height;
+		data_pitch = pipe_src_param->data_pitch;
+		meta_pitch = pipe_src_param->meta_pitch;
 	}
 
 	rq_sizing_param->chunk_bytes = 8192;
@@ -645,11 +645,11 @@ static void get_surf_rq_param(
 
 	rq_sizing_param->mpte_group_bytes = 2048;
 
-	surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
-	surf_vert = (pipe_src_param.source_scan == dm_vert);
+	surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
+	surf_vert = (pipe_src_param->source_scan == dm_vert);
 
 	bytes_per_element = get_bytes_per_element(
-			(enum source_format_class) pipe_src_param.source_format,
+			(enum source_format_class) pipe_src_param->source_format,
 			is_chroma);
 	log2_bytes_per_element = dml_log2(bytes_per_element);
 	blk256_width = 0;
@@ -671,7 +671,7 @@ static void get_surf_rq_param(
 	log2_blk256_height = dml_log2((double) blk256_height);
 	blk_bytes =
 			surf_linear ? 256 : get_blk_size_bytes(
-							(enum source_macro_tile_size) pipe_src_param.macro_tile_size);
+							(enum source_macro_tile_size) pipe_src_param->macro_tile_size);
 	log2_blk_bytes = dml_log2((double) blk_bytes);
 	log2_blk_height = 0;
 	log2_blk_width = 0;
@@ -682,7 +682,7 @@ static void get_surf_rq_param(
 	 * "/2" is like square root
 	 * blk is vertical biased
 	 */
-	if (pipe_src_param.sw_mode != dm_sw_linear)
+	if (pipe_src_param->sw_mode != dm_sw_linear)
 		log2_blk_height = log2_blk256_height
 				+ dml_ceil((double) (log2_blk_bytes - 8) / 2.0, 1);
 	else
@@ -930,10 +930,10 @@ static void get_surf_rq_param(
 			&func_meta_row_height,
 			vp_width,
 			data_pitch,
-			pipe_src_param.source_format,
-			pipe_src_param.sw_mode,
-			pipe_src_param.macro_tile_size,
-			pipe_src_param.source_scan,
+			pipe_src_param->source_format,
+			pipe_src_param->sw_mode,
+			pipe_src_param->macro_tile_size,
+			pipe_src_param->source_scan,
 			is_chroma);
 
 	/* Just a check to make sure this function and the new one give the same
@@ -960,12 +960,12 @@ static void get_surf_rq_param(
 void dml1_rq_dlg_get_rq_params(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_rq_params_st *rq_param,
-		const struct _vcs_dpi_display_pipe_source_params_st pipe_src_param)
+		const struct _vcs_dpi_display_pipe_source_params_st *pipe_src_param)
 {
 	/* get param for luma surface */
-	rq_param->yuv420 = pipe_src_param.source_format == dm_420_8
-			|| pipe_src_param.source_format == dm_420_10;
-	rq_param->yuv420_10bpc = pipe_src_param.source_format == dm_420_10;
+	rq_param->yuv420 = pipe_src_param->source_format == dm_420_8
+			|| pipe_src_param->source_format == dm_420_10;
+	rq_param->yuv420_10bpc = pipe_src_param->source_format == dm_420_10;
 
 	get_surf_rq_param(
 			mode_lib,
@@ -975,7 +975,7 @@ void dml1_rq_dlg_get_rq_params(
 			pipe_src_param,
 			0);
 
-	if (is_dual_plane((enum source_format_class) pipe_src_param.source_format)) {
+	if (is_dual_plane((enum source_format_class) pipe_src_param->source_format)) {
 		/* get param for chroma surface */
 		get_surf_rq_param(
 				mode_lib,
@@ -998,26 +998,26 @@ void dml1_rq_dlg_get_dlg_params(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_dlg_regs_st *disp_dlg_regs,
 		struct _vcs_dpi_display_ttu_regs_st *disp_ttu_regs,
-		const struct _vcs_dpi_display_rq_dlg_params_st rq_dlg_param,
-		const struct _vcs_dpi_display_dlg_sys_params_st dlg_sys_param,
-		const struct _vcs_dpi_display_e2e_pipe_params_st e2e_pipe_param,
+		const struct _vcs_dpi_display_rq_dlg_params_st *rq_dlg_param,
+		const struct _vcs_dpi_display_dlg_sys_params_st *dlg_sys_param,
+		const struct _vcs_dpi_display_e2e_pipe_params_st *e2e_pipe_param,
 		const bool cstate_en,
 		const bool pstate_en,
 		const bool vm_en,
 		const bool iflip_en)
 {
 	/* Timing */
-	unsigned int htotal = e2e_pipe_param.pipe.dest.htotal;
-	unsigned int hblank_end = e2e_pipe_param.pipe.dest.hblank_end;
-	unsigned int vblank_start = e2e_pipe_param.pipe.dest.vblank_start;
-	unsigned int vblank_end = e2e_pipe_param.pipe.dest.vblank_end;
-	bool interlaced = e2e_pipe_param.pipe.dest.interlaced;
+	unsigned int htotal = e2e_pipe_param->pipe.dest.htotal;
+	unsigned int hblank_end = e2e_pipe_param->pipe.dest.hblank_end;
+	unsigned int vblank_start = e2e_pipe_param->pipe.dest.vblank_start;
+	unsigned int vblank_end = e2e_pipe_param->pipe.dest.vblank_end;
+	bool interlaced = e2e_pipe_param->pipe.dest.interlaced;
 	unsigned int min_vblank = mode_lib->ip.min_vblank_lines;
 
-	double pclk_freq_in_mhz = e2e_pipe_param.pipe.dest.pixel_rate_mhz;
-	double refclk_freq_in_mhz = e2e_pipe_param.clks_cfg.refclk_mhz;
-	double dppclk_freq_in_mhz = e2e_pipe_param.clks_cfg.dppclk_mhz;
-	double dispclk_freq_in_mhz = e2e_pipe_param.clks_cfg.dispclk_mhz;
+	double pclk_freq_in_mhz = e2e_pipe_param->pipe.dest.pixel_rate_mhz;
+	double refclk_freq_in_mhz = e2e_pipe_param->clks_cfg.refclk_mhz;
+	double dppclk_freq_in_mhz = e2e_pipe_param->clks_cfg.dppclk_mhz;
+	double dispclk_freq_in_mhz = e2e_pipe_param->clks_cfg.dispclk_mhz;
 
 	double ref_freq_to_pix_freq;
 	double prefetch_xy_calc_in_dcfclk;
@@ -1160,13 +1160,13 @@ void dml1_rq_dlg_get_dlg_params(
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; /* 15 bits */
 
 	prefetch_xy_calc_in_dcfclk = 24.0; /* TODO: ip_param */
-	min_dcfclk_mhz = dlg_sys_param.deepsleep_dcfclk_mhz;
+	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = prefetch_xy_calc_in_dcfclk / min_dcfclk_mhz;
-	min_ttu_vblank = dlg_sys_param.t_urg_wm_us;
+	min_ttu_vblank = dlg_sys_param->t_urg_wm_us;
 	if (cstate_en)
-		min_ttu_vblank = dml_max(dlg_sys_param.t_sr_wm_us, min_ttu_vblank);
+		min_ttu_vblank = dml_max(dlg_sys_param->t_sr_wm_us, min_ttu_vblank);
 	if (pstate_en)
-		min_ttu_vblank = dml_max(dlg_sys_param.t_mclk_wm_us, min_ttu_vblank);
+		min_ttu_vblank = dml_max(dlg_sys_param->t_mclk_wm_us, min_ttu_vblank);
 	min_ttu_vblank = min_ttu_vblank + t_calc_us;
 
 	min_dst_y_ttu_vblank = min_ttu_vblank * pclk_freq_in_mhz / (double) htotal;
@@ -1197,59 +1197,59 @@ void dml1_rq_dlg_get_dlg_params(
 	/* ------------------------- */
 	/* Prefetch Calc */
 	/* Source */
-	dcc_en = e2e_pipe_param.pipe.src.dcc;
+	dcc_en = e2e_pipe_param->pipe.src.dcc;
 	dual_plane = is_dual_plane(
-			(enum source_format_class) e2e_pipe_param.pipe.src.source_format);
+			(enum source_format_class) e2e_pipe_param->pipe.src.source_format);
 	mode_422 = 0; /* TODO */
-	access_dir = (e2e_pipe_param.pipe.src.source_scan == dm_vert); /* vp access direction: horizontal or vertical accessed */
+	access_dir = (e2e_pipe_param->pipe.src.source_scan == dm_vert); /* vp access direction: horizontal or vertical accessed */
 	bytes_per_element_l = get_bytes_per_element(
-			(enum source_format_class) e2e_pipe_param.pipe.src.source_format,
+			(enum source_format_class) e2e_pipe_param->pipe.src.source_format,
 			0);
 	bytes_per_element_c = get_bytes_per_element(
-			(enum source_format_class) e2e_pipe_param.pipe.src.source_format,
+			(enum source_format_class) e2e_pipe_param->pipe.src.source_format,
 			1);
-	vp_height_l = e2e_pipe_param.pipe.src.viewport_height;
-	vp_width_l = e2e_pipe_param.pipe.src.viewport_width;
-	vp_height_c = e2e_pipe_param.pipe.src.viewport_height_c;
-	vp_width_c = e2e_pipe_param.pipe.src.viewport_width_c;
+	vp_height_l = e2e_pipe_param->pipe.src.viewport_height;
+	vp_width_l = e2e_pipe_param->pipe.src.viewport_width;
+	vp_height_c = e2e_pipe_param->pipe.src.viewport_height_c;
+	vp_width_c = e2e_pipe_param->pipe.src.viewport_width_c;
 
 	/* Scaling */
-	htaps_l = e2e_pipe_param.pipe.scale_taps.htaps;
-	htaps_c = e2e_pipe_param.pipe.scale_taps.htaps_c;
-	hratios_l = e2e_pipe_param.pipe.scale_ratio_depth.hscl_ratio;
-	hratios_c = e2e_pipe_param.pipe.scale_ratio_depth.hscl_ratio_c;
-	vratio_l = e2e_pipe_param.pipe.scale_ratio_depth.vscl_ratio;
-	vratio_c = e2e_pipe_param.pipe.scale_ratio_depth.vscl_ratio_c;
+	htaps_l = e2e_pipe_param->pipe.scale_taps.htaps;
+	htaps_c = e2e_pipe_param->pipe.scale_taps.htaps_c;
+	hratios_l = e2e_pipe_param->pipe.scale_ratio_depth.hscl_ratio;
+	hratios_c = e2e_pipe_param->pipe.scale_ratio_depth.hscl_ratio_c;
+	vratio_l = e2e_pipe_param->pipe.scale_ratio_depth.vscl_ratio;
+	vratio_c = e2e_pipe_param->pipe.scale_ratio_depth.vscl_ratio_c;
 
 	line_time_in_us = (htotal / pclk_freq_in_mhz);
-	vinit_l = e2e_pipe_param.pipe.scale_ratio_depth.vinit;
-	vinit_c = e2e_pipe_param.pipe.scale_ratio_depth.vinit_c;
-	vinit_bot_l = e2e_pipe_param.pipe.scale_ratio_depth.vinit_bot;
-	vinit_bot_c = e2e_pipe_param.pipe.scale_ratio_depth.vinit_bot_c;
-
-	swath_height_l = rq_dlg_param.rq_l.swath_height;
-	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
-	dpte_bytes_per_row_ub_l = rq_dlg_param.rq_l.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
-	meta_pte_bytes_per_frame_ub_l = rq_dlg_param.rq_l.meta_pte_bytes_per_frame_ub;
-	meta_bytes_per_row_ub_l = rq_dlg_param.rq_l.meta_bytes_per_row_ub;
-
-	swath_height_c = rq_dlg_param.rq_c.swath_height;
-	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
-	dpte_bytes_per_row_ub_c = rq_dlg_param.rq_c.dpte_bytes_per_row_ub;
-	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
-
-	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
-	vupdate_offset = e2e_pipe_param.pipe.dest.vupdate_offset;
-	vupdate_width = e2e_pipe_param.pipe.dest.vupdate_width;
-	vready_offset = e2e_pipe_param.pipe.dest.vready_offset;
+	vinit_l = e2e_pipe_param->pipe.scale_ratio_depth.vinit;
+	vinit_c = e2e_pipe_param->pipe.scale_ratio_depth.vinit_c;
+	vinit_bot_l = e2e_pipe_param->pipe.scale_ratio_depth.vinit_bot;
+	vinit_bot_c = e2e_pipe_param->pipe.scale_ratio_depth.vinit_bot_c;
+
+	swath_height_l = rq_dlg_param->rq_l.swath_height;
+	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
+	dpte_bytes_per_row_ub_l = rq_dlg_param->rq_l.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
+	meta_pte_bytes_per_frame_ub_l = rq_dlg_param->rq_l.meta_pte_bytes_per_frame_ub;
+	meta_bytes_per_row_ub_l = rq_dlg_param->rq_l.meta_bytes_per_row_ub;
+
+	swath_height_c = rq_dlg_param->rq_c.swath_height;
+	swath_width_ub_c = rq_dlg_param->rq_c.swath_width_ub;
+	dpte_bytes_per_row_ub_c = rq_dlg_param->rq_c.dpte_bytes_per_row_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param->rq_c.dpte_groups_per_row_ub;
+
+	meta_chunks_per_row_ub_l = rq_dlg_param->rq_l.meta_chunks_per_row_ub;
+	vupdate_offset = e2e_pipe_param->pipe.dest.vupdate_offset;
+	vupdate_width = e2e_pipe_param->pipe.dest.vupdate_width;
+	vready_offset = e2e_pipe_param->pipe.dest.vready_offset;
 
 	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
 	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
 	pixel_rate_delay_subtotal = dppclk_delay_subtotal * pclk_freq_in_mhz / dppclk_freq_in_mhz
 			+ dispclk_delay_subtotal * pclk_freq_in_mhz / dispclk_freq_in_mhz;
 
-	vstartup_start = e2e_pipe_param.pipe.dest.vstartup_start;
+	vstartup_start = e2e_pipe_param->pipe.dest.vstartup_start;
 
 	if (interlaced)
 		vstartup_start = vstartup_start / 2;
@@ -1276,13 +1276,13 @@ void dml1_rq_dlg_get_dlg_params(
 	dst_x_after_scaler = 0;
 	dst_y_after_scaler = 0;
 
-	if (e2e_pipe_param.pipe.src.is_hsplit)
+	if (e2e_pipe_param->pipe.src.is_hsplit)
 		dst_x_after_scaler = pixel_rate_delay_subtotal
-				+ e2e_pipe_param.pipe.dest.recout_width;
+				+ e2e_pipe_param->pipe.dest.recout_width;
 	else
 		dst_x_after_scaler = pixel_rate_delay_subtotal;
 
-	if (e2e_pipe_param.dout.output_format == dm_420)
+	if (e2e_pipe_param->dout.output_format == dm_420)
 		dst_y_after_scaler = 1;
 	else
 		dst_y_after_scaler = 0;
@@ -1334,7 +1334,7 @@ void dml1_rq_dlg_get_dlg_params(
 	DTRACE(
 			"DLG: %s: t_srx_delay_us     = %3.2f",
 			__func__,
-			(double) dlg_sys_param.t_srx_delay_us);
+			(double) dlg_sys_param->t_srx_delay_us);
 	DTRACE("DLG: %s: line_time_in_us    = %3.2f", __func__, (double) line_time_in_us);
 	DTRACE("DLG: %s: vupdate_offset     = %d", __func__, vupdate_offset);
 	DTRACE("DLG: %s: vupdate_width      = %d", __func__, vupdate_width);
@@ -1408,12 +1408,12 @@ void dml1_rq_dlg_get_dlg_params(
 	DTRACE("DLG: %s: dpte_row_bytes          = %d", __func__, dpte_row_bytes);
 
 	prefetch_bw = (vm_bytes + 2 * dpte_row_bytes + 2 * meta_row_bytes + sw_bytes) / t_pre_us;
-	flip_bw = ((vm_bytes + dpte_row_bytes + meta_row_bytes) * dlg_sys_param.total_flip_bw)
-			/ (double) dlg_sys_param.total_flip_bytes;
+	flip_bw = ((vm_bytes + dpte_row_bytes + meta_row_bytes) * dlg_sys_param->total_flip_bw)
+			/ (double) dlg_sys_param->total_flip_bytes;
 	t_vm_us = line_time_in_us / 4.0;
 	if (vm_en && dcc_en) {
 		t_vm_us = dml_max(
-				dlg_sys_param.t_extra_us,
+				dlg_sys_param->t_extra_us,
 				dml_max((double) vm_bytes / prefetch_bw, t_vm_us));
 
 		if (iflip_en && !dual_plane) {
@@ -1423,12 +1423,12 @@ void dml1_rq_dlg_get_dlg_params(
 		}
 	}
 
-	t_r0_us = dml_max(dlg_sys_param.t_extra_us - t_vm_us, line_time_in_us - t_vm_us);
+	t_r0_us = dml_max(dlg_sys_param->t_extra_us - t_vm_us, line_time_in_us - t_vm_us);
 
 	if (vm_en || dcc_en) {
 		t_r0_us = dml_max(
 				(double) (dpte_row_bytes + meta_row_bytes) / prefetch_bw,
-				dlg_sys_param.t_extra_us);
+				dlg_sys_param->t_extra_us);
 		t_r0_us = dml_max((double) (line_time_in_us - t_vm_us), t_r0_us);
 
 		if (iflip_en && !dual_plane) {
@@ -1550,15 +1550,15 @@ void dml1_rq_dlg_get_dlg_params(
 			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l;/* dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now */
 
 	/* Active */
-	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
-	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
-	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
+	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
 	swath_width_pixels_ub_l = 0;
 	swath_width_pixels_ub_c = 0;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
-	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
-	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param->rq_c.dpte_row_height;
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
@@ -1650,14 +1650,14 @@ void dml1_rq_dlg_get_dlg_params(
 	refcyc_per_req_delivery_cur0 = 0.;
 
 	full_recout_width = 0;
-	if (e2e_pipe_param.pipe.src.is_hsplit) {
-		if (e2e_pipe_param.pipe.dest.full_recout_width == 0) {
+	if (e2e_pipe_param->pipe.src.is_hsplit) {
+		if (e2e_pipe_param->pipe.dest.full_recout_width == 0) {
 			DTRACE("DLG: %s: Warningfull_recout_width not set in hsplit mode", __func__);
-			full_recout_width = e2e_pipe_param.pipe.dest.recout_width * 2; /* assume half split for dcn1 */
+			full_recout_width = e2e_pipe_param->pipe.dest.recout_width * 2; /* assume half split for dcn1 */
 		} else
-			full_recout_width = e2e_pipe_param.pipe.dest.full_recout_width;
+			full_recout_width = e2e_pipe_param->pipe.dest.full_recout_width;
 	} else
-		full_recout_width = e2e_pipe_param.pipe.dest.recout_width;
+		full_recout_width = e2e_pipe_param->pipe.dest.recout_width;
 
 	refcyc_per_line_delivery_pre_l = get_refcyc_per_delivery(
 			mode_lib,
@@ -1824,9 +1824,9 @@ void dml1_rq_dlg_get_dlg_params(
 	}
 
 	/* TTU - Cursor */
-	hratios_cur0 = e2e_pipe_param.pipe.scale_ratio_depth.hscl_ratio;
-	cur0_src_width = e2e_pipe_param.pipe.src.cur0_src_width; /* cursor source width */
-	cur0_bpp = (enum cursor_bpp) e2e_pipe_param.pipe.src.cur0_bpp;
+	hratios_cur0 = e2e_pipe_param->pipe.scale_ratio_depth.hscl_ratio;
+	cur0_src_width = e2e_pipe_param->pipe.src.cur0_src_width; /* cursor source width */
+	cur0_bpp = (enum cursor_bpp) e2e_pipe_param->pipe.src.cur0_bpp;
 	cur0_req_size = 0;
 	cur0_req_width = 0;
 	cur0_width_ub = 0.0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.h b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.h
index 9c06913ad767..e19ee3bde45f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.h
@@ -33,7 +33,7 @@ struct display_mode_lib;
 void dml1_extract_rq_regs(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_rq_regs_st *rq_regs,
-		const struct _vcs_dpi_display_rq_params_st rq_param);
+		const struct _vcs_dpi_display_rq_params_st *rq_param);
 /* Function: dml_rq_dlg_get_rq_params
  *  Calculate requestor related parameters that register definition agnostic
  *  (i.e. this layer does try to separate real values from register definition)
@@ -45,7 +45,7 @@ void dml1_extract_rq_regs(
 void dml1_rq_dlg_get_rq_params(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_rq_params_st *rq_param,
-		const struct _vcs_dpi_display_pipe_source_params_st pipe_src_param);
+		const struct _vcs_dpi_display_pipe_source_params_st *pipe_src_param);
 
 
 /* Function: dml_rq_dlg_get_dlg_params
@@ -55,9 +55,9 @@ void dml1_rq_dlg_get_dlg_params(
 		struct display_mode_lib *mode_lib,
 		struct _vcs_dpi_display_dlg_regs_st *dlg_regs,
 		struct _vcs_dpi_display_ttu_regs_st *ttu_regs,
-		const struct _vcs_dpi_display_rq_dlg_params_st rq_dlg_param,
-		const struct _vcs_dpi_display_dlg_sys_params_st dlg_sys_param,
-		const struct _vcs_dpi_display_e2e_pipe_params_st e2e_pipe_param,
+		const struct _vcs_dpi_display_rq_dlg_params_st *rq_dlg_param,
+		const struct _vcs_dpi_display_dlg_sys_params_st *dlg_sys_param,
+		const struct _vcs_dpi_display_e2e_pipe_params_st *e2e_pipe_param,
 		const bool cstate_en,
 		const bool pstate_en,
 		const bool vm_en,
-- 
2.33.0

