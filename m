Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30046646D3
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Jan 2023 17:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7185910E61E;
	Tue, 10 Jan 2023 16:58:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7000D10E61D
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Jan 2023 16:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN0he9oTWqwjD+gl5NSgLU4IIlvQHuUhGcSdswtmIhGb5DU5/jpDH/r3nduUACelwNuZUoo1YodCGXDECr0MWbD++vx8s54HzeJey/1r8yWjL/CoGmiIcMhSx9LTioAeFXB5vPSXEiBFLRRtyDwgx+k37OuE86gW8FdzEVtIxELZWLYDaQnLoXAREFgVc7vQCHV1PVl9b1HyZZ0sTUod0LafY8lwENWUesJTXcvxGkkPjAPTGj9exkTEoIb/ZHtENRMSfegSDCrm56SIITI+L9xiUk9wlXFLSJkJnrY6be6Do0ElDEiWHExHMmdkZtGLOHP7FX9XkzuSirPd9EdoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJVoPOQTdZVFDZ/MV0Geh9Oiod4j4eEaWz+XkZTF8HY=;
 b=f5XlTffTxV3pmEi3+/DELjRFwHayyrpa3QU45xDkNGjlSxD/qHCxgEvv0zxIl0s+OPcbSpj7omudD3lUY+c40zQxy5mrs+6kBAkGw1R+wNbldfWK2Nl6wIofTnYAfqGlf3U0GcG6wPzPD3bdR7RaThHaEher5cynLjZzYDstRxw2hKUmF96Wm5S5ujmZXcSGhLwJhr2pTVYGMzqPgM4IkwvYYekZa6gMCAawXkSN/nruQJqcGQBjNby1tdu3npJ571v2UZyVX+r9hAK/s2dau1hNViebLi/lvducF0Hzz22d8FrAwSTzklQ9e4bu34HYbkqRTp8tP2Z9toT685ZYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJVoPOQTdZVFDZ/MV0Geh9Oiod4j4eEaWz+XkZTF8HY=;
 b=2qNCJNZg/xfgGWpkY6ZyYodClVVL+2RA4LO3gvcx9DnvscMlGhy7Uld0KG7qHObVN30jrcfTRc3jDRlmkmcaSjl8Bb05WYPrc32PWNX7Xoxl7hgZIQPlr9Ey0u2QLXS4hPd7zI5ytQptymo2BCV5Ww/0G+RLQ2MgyDDIGH6u2LY=
Received: from MW4PR04CA0125.namprd04.prod.outlook.com (2603:10b6:303:84::10)
 by MN2PR12MB4517.namprd12.prod.outlook.com (2603:10b6:208:267::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:58:23 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::9f) by MW4PR04CA0125.outlook.office365.com
 (2603:10b6:303:84::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 16:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 16:58:23 +0000
Received: from atma-again.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 10 Jan
 2023 10:58:01 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/37] drm/amd/display: move dp capability related logic to
 link_dp_capability
Date: Tue, 10 Jan 2023 11:55:19 -0500
Message-ID: <20230110165535.3358492-22-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110165535.3358492-1-Rodrigo.Siqueira@amd.com>
References: <20230110165535.3358492-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|MN2PR12MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b05807c-48f2-4603-eb32-08daf32be25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6mMJVMAvh43fH7w+rP4VLY89bECvSxeqn/LE++2nZvcRVuxC+klp6OFY9MJk/7UOPi3RAgFqMMAvW8CuwqNggTxg1lHKiqcIIAsMBlu36OtRkkfN3n56vYbSIKo77YaoLE6DgT6EMp0/dPwiRALOb2TW6A/vdkiRpwpILATpEdziuDrRhRT+0/b6v1t66J+/0cEGwXpj0WxkUWqRkFJPmMMF4CqTeiIELimOKixRTiI6VPIMGA8OQZ2Jo/iOKRGN9uZq5ToIhKIag4EaIe2n5t0ttToE8HLTynwC2EPjDhh5OYLWPQynaXOqJBpREzSd9lvAPd0QTQUscUrJuYsxX0/bBNz4I3I0BBk81BpLHwPhO03wx4GkaWjOjhX+d1ZVxzvOi7oIYriOxBNEnXMXygIHXXk7FUGWiApkzxC1FocTWbT5H6EE5RqB/PHbsFocJjR5I4RnvtAqFhRYQYIbOtM2vtuL9OjWdYt1reEPnzo/BQtu26NmkZujkNthfDONzPoUbwoSeCbGozEf1fYgaDA8/WRAzIlLV6exwCURRGoly2T62dQVxCUz2q4U4tXSkUcLLb5VOHrDVtHubLXLFJLWmOCTj7Vw9pOdvvtmhQ8CKTyp/v6AIbQjeShvecJnb4WrL19QEAtO5M2neiN5uzQNQDEI/xId5pUSG8cAkgi53FFWYUDwRsCXSGQ9aBn51d5aIXZEaLEaAn2hFG3D/vIas48uKmZfytsqN+6IXdQlIL8sAhs5NftWwdt1WQAmImKMja/nIbRhyYzACbAog==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(82740400003)(6666004)(81166007)(2906002)(356005)(66899015)(478600001)(2616005)(1076003)(30864003)(19627235002)(16526019)(26005)(7696005)(186003)(5660300002)(316002)(40480700001)(83380400001)(8936002)(82310400005)(36756003)(86362001)(40460700003)(47076005)(426003)(41300700001)(8676002)(336012)(54906003)(70586007)(4326008)(6916009)(70206006)(21314003)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:58:23.1708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b05807c-48f2-4603-eb32-08daf32be25f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4517
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
Cc: stylon.wang@amd.com, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

Reviewed-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  110 +-
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 2508 ++---------------
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c |    3 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h      |    4 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |   18 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |    3 +-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |    9 +-
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |    8 +-
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  |    3 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |    9 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |    5 +-
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |    3 +-
 .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |   41 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h     |    8 +
 drivers/gpu/drm/amd/display/dc/link/Makefile  |    3 +-
 .../gpu/drm/amd/display/dc/link/link_ddc.h    |    1 +
 .../amd/display/dc/link/link_dp_capability.c  | 2169 ++++++++++++++
 .../amd/display/dc/link/link_dp_capability.h  |   66 +
 .../gpu/drm/amd/display/dc/link/link_dp_phy.c |    3 +-
 .../amd/display/dc/link/link_dp_training.c    |   41 +-
 .../dc/link/link_dp_training_128b_132b.c      |    3 +-
 .../display/dc/link/link_dp_training_8b_10b.c |   17 +-
 .../display/dc/link/link_dp_training_dpia.c   |    9 +-
 .../link_dp_training_fixed_vs_pe_retimer.c    |   11 +-
 26 files changed, 2592 insertions(+), 2475 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.h

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index ba9814f88f48..791a788c52f2 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -34,6 +34,7 @@
 #include "core_types.h"
 #include "dm_helpers.h"
 #include "dc_link_dp.h"
+#include "link.h"
 
 #include "atomfirmware.h"
 #include "smu13_driver_if.h"
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 957e1bc8981b..5cd81348a88b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -56,6 +56,7 @@
 #include "link/link_hpd.h"
 #include "link/link_dp_training.h"
 #include "link/link_dp_phy.h"
+#include "link/link_dp_capability.h"
 
 #include "dc/dcn30/dcn30_vpg.h"
 
@@ -1032,7 +1033,7 @@ static bool should_verify_link_capability_destructively(struct dc_link *link,
 				dc_is_embedded_signal(link->local_sink->sink_signal) ||
 				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
 			destrictive = false;
-		} else if (dp_get_link_encoding_format(&max_link_cap) ==
+		} else if (link_dp_get_encoding_format(&max_link_cap) ==
 				DP_8b_10b_ENCODING) {
 			if (link->dpcd_caps.is_mst_capable ||
 					is_link_enc_unavailable) {
@@ -2005,7 +2006,7 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 	 * Temporary w/a to get DP2.0 link rates to work with SST.
 	 * TODO DP2.0 - Workaround: Remove w/a if and when the issue is resolved.
 	 */
-	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING &&
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING &&
 			pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
 			link->dc->debug.set_mst_en_for_sst) {
 		dp_enable_mst_on_sink(link, true);
@@ -2018,7 +2019,7 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
 	}
 
-	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		/* TODO - DP2.0 HW: calculate 32 symbol clock for HPO encoder */
 	} else {
 		pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
@@ -2059,7 +2060,7 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 	else
 		fec_enable = true;
 
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
+	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING)
 		dp_set_fec_enable(link, fec_enable);
 
 	// during mode set we do DP_SET_POWER off then on, aux writes are lost
@@ -2640,7 +2641,7 @@ static void disable_link(struct dc_link *link, const struct link_resource *link_
 
 		if (dc_is_dp_sst_signal(signal) ||
 				link->mst_stream_alloc_table.stream_count == 0) {
-			if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
+			if (link_dp_get_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
 				dp_set_fec_enable(link, false);
 				dp_set_fec_ready(link, link_res, false);
 			}
@@ -3688,7 +3689,7 @@ static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
 	}
 
 	/* slot X.Y for SST payload allocate */
-	if (allocate && dp_get_link_encoding_format(&link->cur_link_settings) ==
+	if (allocate && link_dp_get_encoding_format(&link->cur_link_settings) ==
 			DP_128b_132b_ENCODING) {
 		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, link);
 
@@ -3771,7 +3772,7 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 
 	/* program DP source TX for payload */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			dp_get_link_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
@@ -3887,7 +3888,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 
 	/* update mst stream allocation table hardware state */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			dp_get_link_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
@@ -3954,7 +3955,7 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 
 	/* update mst stream allocation table hardware state */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			dp_get_link_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
@@ -4067,7 +4068,7 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 
 	/* update mst stream allocation table hardware state */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			dp_get_link_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
 		DC_LOG_DEBUG("Unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
@@ -4115,7 +4116,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 
 	/* stream encoder index */
 	config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
-	if (is_dp_128b_132b_signal(pipe_ctx))
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
 		config.stream_enc_idx =
 				pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
 
@@ -4124,7 +4125,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 
 	/* link encoder index */
 	config.link_enc_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
-	if (is_dp_128b_132b_signal(pipe_ctx))
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
 		config.link_enc_idx = pipe_ctx->link_res.hpo_dp_link_enc->inst;
 
 	/* dio output index is dpia index for DPIA endpoint & dcio index by default */
@@ -4145,7 +4146,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 	config.assr_enabled = (panel_mode == DP_PANEL_MODE_EDP) ? 1 : 0;
 	config.mst_enabled = (pipe_ctx->stream->signal ==
 			SIGNAL_TYPE_DISPLAY_PORT_MST) ? 1 : 0;
-	config.dp2_enabled = is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
+	config.dp2_enabled = link_is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
 	config.usb4_enabled = (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) ?
 			1 : 0;
 	config.dpms_off = dpms_off;
@@ -4248,7 +4249,7 @@ void core_link_enable_stream(
 	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 
-	if (is_dp_128b_132b_signal(pipe_ctx))
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
@@ -4270,7 +4271,7 @@ void core_link_enable_stream(
 	ASSERT(link_enc);
 
 	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
-			&& !is_dp_128b_132b_signal(pipe_ctx)) {
+			&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
 		if (link_enc)
 			link_enc->funcs->setup(
 				link_enc,
@@ -4280,7 +4281,7 @@ void core_link_enable_stream(
 	pipe_ctx->stream->link->link_state_valid = true;
 
 	if (pipe_ctx->stream_res.tg->funcs->set_out_mux) {
-		if (is_dp_128b_132b_signal(pipe_ctx))
+		if (link_is_dp_128b_132b_signal(pipe_ctx))
 			otg_out_dest = OUT_MUX_HPO_DP;
 		else
 			otg_out_dest = OUT_MUX_DIO;
@@ -4382,7 +4383,7 @@ void core_link_enable_stream(
 		 * from transmitter control.
 		 */
 		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
-				is_dp_128b_132b_signal(pipe_ctx)))
+				link_is_dp_128b_132b_signal(pipe_ctx)))
 			if (link_enc)
 				link_enc->funcs->setup(
 					link_enc,
@@ -4402,7 +4403,7 @@ void core_link_enable_stream(
 		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 			dc_link_allocate_mst_payload(pipe_ctx);
 		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-				is_dp_128b_132b_signal(pipe_ctx))
+				link_is_dp_128b_132b_signal(pipe_ctx))
 			dc_link_update_sst_payload(pipe_ctx, true);
 
 		dc->hwss.unblank_stream(pipe_ctx,
@@ -4420,7 +4421,7 @@ void core_link_enable_stream(
 		dc->hwss.enable_audio_stream(pipe_ctx);
 
 	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-		if (is_dp_128b_132b_signal(pipe_ctx))
+		if (link_is_dp_128b_132b_signal(pipe_ctx))
 			fpga_dp_hpo_enable_link_and_stream(state, pipe_ctx);
 		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
 				dc_is_virtual_signal(pipe_ctx->stream->signal))
@@ -4439,7 +4440,7 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->sink->link;
 	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 
-	if (is_dp_128b_132b_signal(pipe_ctx))
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
@@ -4472,7 +4473,7 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 		deallocate_mst_payload(pipe_ctx);
 	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			is_dp_128b_132b_signal(pipe_ctx))
+			link_is_dp_128b_132b_signal(pipe_ctx))
 		dc_link_update_sst_payload(pipe_ctx, false);
 
 	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
@@ -4501,7 +4502,7 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 	}
 
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			!is_dp_128b_132b_signal(pipe_ctx)) {
+			!link_is_dp_128b_132b_signal(pipe_ctx)) {
 
 		/* In DP1.x SST mode, our encoder will go to TPS1
 		 * when link is on but stream is off.
@@ -4521,7 +4522,7 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
 			dp_set_dsc_enable(pipe_ctx, false);
 	}
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
 			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
 	}
@@ -4596,7 +4597,7 @@ void dc_link_set_preferred_link_settings(struct dc *dc,
 	if (link_stream->dpms_off)
 		return;
 
-	if (decide_link_settings(link_stream, &store_settings))
+	if (link_decide_link_settings(link_stream, &store_settings))
 		dp_retrain_link_dp_test(link, &store_settings, false);
 }
 
@@ -4651,7 +4652,7 @@ uint32_t dc_link_bandwidth_kbps(
 	uint32_t total_data_bw_efficiency_x10000 = 0;
 	uint32_t link_rate_per_lane_kbps = 0;
 
-	switch (dp_get_link_encoding_format(link_setting)) {
+	switch (link_dp_get_encoding_format(link_setting)) {
 	case DP_8b_10b_ENCODING:
 		/* For 8b/10b encoding:
 		 * link rate is defined in the unit of LINK_RATE_REF_FREQ_IN_KHZ per DP byte per lane.
@@ -4680,57 +4681,6 @@ uint32_t dc_link_bandwidth_kbps(
 	return link_rate_per_lane_kbps * link_setting->lane_count / 10000 * total_data_bw_efficiency_x10000;
 }
 
-const struct dc_link_settings *dc_link_get_link_cap(
-		const struct dc_link *link)
-{
-	if (link->preferred_link_setting.lane_count != LANE_COUNT_UNKNOWN &&
-			link->preferred_link_setting.link_rate != LINK_RATE_UNKNOWN)
-		return &link->preferred_link_setting;
-	return &link->verified_link_cap;
-}
-
-void dc_link_overwrite_extended_receiver_cap(
-		struct dc_link *link)
-{
-	dp_overwrite_extended_receiver_cap(link);
-}
-
-bool dc_link_is_fec_supported(const struct dc_link *link)
-{
-	/* TODO - use asic cap instead of link_enc->features
-	 * we no longer know which link enc to use for this link before commit
-	 */
-	struct link_encoder *link_enc = NULL;
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	return (dc_is_dp_signal(link->connector_signal) && link_enc &&
-			link_enc->features.fec_supported &&
-			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE &&
-			!IS_FPGA_MAXIMUS_DC(link->ctx->dce_environment));
-}
-
-bool dc_link_should_enable_fec(const struct dc_link *link)
-{
-	bool force_disable = false;
-
-	if (link->fec_state == dc_link_fec_enabled)
-		force_disable = false;
-	else if (link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT_MST &&
-			link->local_sink &&
-			link->local_sink->edid_caps.panel_patch.disable_fec)
-		force_disable = true;
-	else if (link->connector_signal == SIGNAL_TYPE_EDP
-			&& (link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.
-			 dsc_support.DSC_SUPPORT == false
-				|| link->panel_config.dsc.disable_dsc_edp
-				|| !link->dc->caps.edp_dsc_support))
-		force_disable = true;
-
-	return !force_disable && dc_link_is_fec_supported(link);
-}
-
 uint32_t dc_bandwidth_in_kbps_from_timing(
 		const struct dc_crtc_timing *timing)
 {
@@ -4835,8 +4785,8 @@ void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
 		for (i = 0; i < dc->caps.max_links; i++) {
 			link = dc->links[i];
 			if (link->link_status.link_active &&
-					dp_get_link_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING &&
-					dp_get_link_encoding_format(&link->cur_link_settings) != DP_128b_132b_ENCODING)
+					link_dp_get_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING &&
+					link_dp_get_encoding_format(&link->cur_link_settings) != DP_128b_132b_ENCODING)
 				/* hpo dp link encoder is considered as recycled, when RX reports 128b/132b encoding capability
 				 * but current link doesn't use it.
 				 */
@@ -4879,7 +4829,7 @@ void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
 			if ((hpo_dp_recycle_map & (1 << i)) == 0) {
 				link = dc->links[i];
 				if (link->type != dc_connection_none &&
-						dp_get_link_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
+						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
 					if (available_hpo_dp_count > 0)
 						available_hpo_dp_count--;
 					else
@@ -4893,7 +4843,7 @@ void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
 			if ((hpo_dp_recycle_map & (1 << i)) != 0) {
 				link = dc->links[i];
 				if (link->type != dc_connection_none &&
-						dp_get_link_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
+						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
 					if (available_hpo_dp_count > 0)
 						available_hpo_dp_count--;
 					else
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index cef89519c12e..1e60827911c6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -46,6 +46,7 @@
 #include "link/link_dp_training_dpia.h"
 #include "link/link_dp_training_auxless.h"
 #include "link/link_dp_phy.h"
+#include "link/link_dp_capability.h"
 #include "resource.h"
 #define DC_LOGGER \
 	link->ctx->logger
@@ -53,54 +54,6 @@
 #define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
 #include "link/link_dpcd.h"
 
-#ifndef MAX
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
-#endif
-#ifndef MIN
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#endif
-
-struct dp_lt_fallback_entry {
-	enum dc_lane_count lane_count;
-	enum dc_link_rate link_rate;
-};
-
-static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
-		/* This link training fallback array is ordered by
-		 * link bandwidth from highest to lowest.
-		 * DP specs makes it a normative policy to always
-		 * choose the next highest link bandwidth during
-		 * link training fallback.
-		 */
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR20},
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR20},
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR10},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH3},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR20},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR10},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH2},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH3},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR10},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH2},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH3},
-		{LANE_COUNT_FOUR, LINK_RATE_LOW},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH2},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH},
-		{LANE_COUNT_TWO, LINK_RATE_LOW},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH},
-		{LANE_COUNT_ONE, LINK_RATE_LOW},
-};
-
-static const struct dc_link_settings fail_safe_link_settings = {
-		.lane_count = LANE_COUNT_ONE,
-		.link_rate = LINK_RATE_LOW,
-		.link_spread = LINK_SPREAD_DISABLED,
-};
-
 static uint8_t get_nibble_at_index(const uint8_t *buf,
 	uint32_t index)
 {
@@ -115,174 +68,7 @@ static uint8_t get_nibble_at_index(const uint8_t *buf,
 	return nibble;
 }
 
-uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count)
-{
-	switch (lttpr_repeater_count) {
-	case 0x80: // 1 lttpr repeater
-		return 1;
-	case 0x40: // 2 lttpr repeaters
-		return 2;
-	case 0x20: // 3 lttpr repeaters
-		return 3;
-	case 0x10: // 4 lttpr repeaters
-		return 4;
-	case 0x08: // 5 lttpr repeaters
-		return 5;
-	case 0x04: // 6 lttpr repeaters
-		return 6;
-	case 0x02: // 7 lttpr repeaters
-		return 7;
-	case 0x01: // 8 lttpr repeaters
-		return 8;
-	default:
-		break;
-	}
-	return 0; // invalid value
-}
-
-static enum clock_source_id get_clock_source_id(struct dc_link *link)
-{
-	enum clock_source_id dp_cs_id = CLOCK_SOURCE_ID_UNDEFINED;
-	struct clock_source *dp_cs = link->dc->res_pool->dp_clock_source;
-
-	if (dp_cs != NULL) {
-		dp_cs_id = dp_cs->id;
-	} else {
-		/*
-		 * dp clock source is not initialized for some reason.
-		 * Should not happen, CLOCK_SOURCE_ID_EXTERNAL will be used
-		 */
-		ASSERT(dp_cs);
-	}
-
-	return dp_cs_id;
-}
-
-static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
-{
-	enum dc_link_rate lttpr_max_link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
-
-	if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR20)
-		lttpr_max_link_rate = LINK_RATE_UHBR20;
-	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR13_5)
-		lttpr_max_link_rate = LINK_RATE_UHBR13_5;
-	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR10)
-		lttpr_max_link_rate = LINK_RATE_UHBR10;
-
-	return lttpr_max_link_rate;
-}
-
-static enum dc_link_rate get_cable_max_link_rate(struct dc_link *link)
-{
-	enum dc_link_rate cable_max_link_rate = LINK_RATE_UNKNOWN;
-
-	if (link->dpcd_caps.cable_id.bits.UHBR10_20_CAPABILITY & DP_UHBR20)
-		cable_max_link_rate = LINK_RATE_UHBR20;
-	else if (link->dpcd_caps.cable_id.bits.UHBR13_5_CAPABILITY)
-		cable_max_link_rate = LINK_RATE_UHBR13_5;
-	else if (link->dpcd_caps.cable_id.bits.UHBR10_20_CAPABILITY & DP_UHBR10)
-		cable_max_link_rate = LINK_RATE_UHBR10;
-
-	return cable_max_link_rate;
-}
-
-bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
-{
-	struct link_encoder *link_enc = NULL;
-
-	if (!max_link_enc_cap) {
-		DC_LOG_ERROR("%s: Could not return max link encoder caps", __func__);
-		return false;
-	}
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	if (link_enc && link_enc->funcs->get_max_link_cap) {
-		link_enc->funcs->get_max_link_cap(link_enc, max_link_enc_cap);
-		return true;
-	}
-
-	DC_LOG_ERROR("%s: Max link encoder caps unknown", __func__);
-	max_link_enc_cap->lane_count = 1;
-	max_link_enc_cap->link_rate = 6;
-	return false;
-}
-
-struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
-{
-	struct dc_link_settings max_link_cap = {0};
-	enum dc_link_rate lttpr_max_link_rate;
-	enum dc_link_rate cable_max_link_rate;
-	struct link_encoder *link_enc = NULL;
-
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	/* get max link encoder capability */
-	if (link_enc)
-		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
-
-	/* Lower link settings based on sink's link cap */
-	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
-		max_link_cap.lane_count =
-				link->reported_link_cap.lane_count;
-	if (link->reported_link_cap.link_rate < max_link_cap.link_rate)
-		max_link_cap.link_rate =
-				link->reported_link_cap.link_rate;
-	if (link->reported_link_cap.link_spread <
-			max_link_cap.link_spread)
-		max_link_cap.link_spread =
-				link->reported_link_cap.link_spread;
-
-	/* Lower link settings based on cable attributes
-	 * Cable ID is a DP2 feature to identify max certified link rate that
-	 * a cable can carry. The cable identification method requires both
-	 * cable and display hardware support. Since the specs comes late, it is
-	 * anticipated that the first round of DP2 cables and displays may not
-	 * be fully compatible to reliably return cable ID data. Therefore the
-	 * decision of our cable id policy is that if the cable can return non
-	 * zero cable id data, we will take cable's link rate capability into
-	 * account. However if we get zero data, the cable link rate capability
-	 * is considered inconclusive. In this case, we will not take cable's
-	 * capability into account to avoid of over limiting hardware capability
-	 * from users. The max overall link rate capability is still determined
-	 * after actual dp pre-training. Cable id is considered as an auxiliary
-	 * method of determining max link bandwidth capability.
-	 */
-	cable_max_link_rate = get_cable_max_link_rate(link);
-
-	if (!link->dc->debug.ignore_cable_id &&
-			cable_max_link_rate != LINK_RATE_UNKNOWN &&
-			cable_max_link_rate < max_link_cap.link_rate)
-		max_link_cap.link_rate = cable_max_link_rate;
-
-	/* account for lttpr repeaters cap
-	 * notes: repeaters do not snoop in the DPRX Capabilities addresses (3.6.3).
-	 */
-	if (dp_is_lttpr_present(link)) {
-		if (link->dpcd_caps.lttpr_caps.max_lane_count < max_link_cap.lane_count)
-			max_link_cap.lane_count = link->dpcd_caps.lttpr_caps.max_lane_count;
-		lttpr_max_link_rate = get_lttpr_max_link_rate(link);
-
-		if (lttpr_max_link_rate < max_link_cap.link_rate)
-			max_link_cap.link_rate = lttpr_max_link_rate;
-
-		DC_LOG_HW_LINK_TRAINING("%s\n Training with LTTPR,  max_lane count %d max_link rate %d \n",
-						__func__,
-						max_link_cap.lane_count,
-						max_link_cap.link_rate);
-	}
-
-	if (dp_get_link_encoding_format(&max_link_cap) == DP_128b_132b_ENCODING &&
-			link->dc->debug.disable_uhbr)
-		max_link_cap.link_rate = LINK_RATE_HIGH3;
-
-	return max_link_cap;
-}
-
-static enum dc_status read_hpd_rx_irq_data(
+enum dc_status read_hpd_rx_irq_data(
 	struct dc_link *link,
 	union hpd_irq_data *irq_data)
 {
@@ -397,372 +183,6 @@ bool hpd_rx_irq_check_link_loss_status(
 	return return_code;
 }
 
-static bool dp_verify_link_cap(
-	struct dc_link *link,
-	struct dc_link_settings *known_limit_link_setting,
-	int *fail_count)
-{
-	struct dc_link_settings cur_link_settings = {0};
-	struct dc_link_settings max_link_settings = *known_limit_link_setting;
-	bool success = false;
-	bool skip_video_pattern;
-	enum clock_source_id dp_cs_id = get_clock_source_id(link);
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-	union hpd_irq_data irq_data;
-	struct link_resource link_res;
-
-	memset(&irq_data, 0, sizeof(irq_data));
-	cur_link_settings = max_link_settings;
-
-	/* Grant extended timeout request */
-	if (dp_is_lttpr_present(link) && link->dpcd_caps.lttpr_caps.max_ext_timeout > 0) {
-		uint8_t grant = link->dpcd_caps.lttpr_caps.max_ext_timeout & 0x80;
-
-		core_link_write_dpcd(link, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &grant, sizeof(grant));
-	}
-
-	do {
-		if (!get_temp_dp_link_res(link, &link_res, &cur_link_settings))
-			continue;
-
-		skip_video_pattern = cur_link_settings.link_rate != LINK_RATE_LOW;
-		dp_enable_link_phy(
-				link,
-				&link_res,
-				link->connector_signal,
-				dp_cs_id,
-				&cur_link_settings);
-
-		status = dp_perform_link_training(
-				link,
-				&link_res,
-				&cur_link_settings,
-				skip_video_pattern);
-
-		if (status == LINK_TRAINING_SUCCESS) {
-			success = true;
-			udelay(1000);
-			if (read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
-					hpd_rx_irq_check_link_loss_status(
-							link,
-							&irq_data))
-				(*fail_count)++;
-
-		} else {
-			(*fail_count)++;
-		}
-		dp_trace_lt_total_count_increment(link, true);
-		dp_trace_lt_result_update(link, status, true);
-		dp_disable_link_phy(link, &link_res, link->connector_signal);
-	} while (!success && decide_fallback_link_setting(link,
-			&max_link_settings, &cur_link_settings, status));
-
-	link->verified_link_cap = success ?
-			cur_link_settings : fail_safe_link_settings;
-	return success;
-}
-
-static void apply_usbc_combo_phy_reset_wa(struct dc_link *link,
-		struct dc_link_settings *link_settings)
-{
-	/* Temporary Renoir-specific workaround PHY will sometimes be in bad
-	 * state on hotplugging display from certain USB-C dongle, so add extra
-	 * cycle of enabling and disabling the PHY before first link training.
-	 */
-	struct link_resource link_res = {0};
-	enum clock_source_id dp_cs_id = get_clock_source_id(link);
-
-	dp_enable_link_phy(link, &link_res, link->connector_signal,
-			dp_cs_id, link_settings);
-	dp_disable_link_phy(link, &link_res, link->connector_signal);
-}
-
-bool dp_verify_link_cap_with_retries(
-	struct dc_link *link,
-	struct dc_link_settings *known_limit_link_setting,
-	int attempts)
-{
-	int i = 0;
-	bool success = false;
-	int fail_count = 0;
-
-	dp_trace_detect_lt_init(link);
-
-	if (link->link_enc && link->link_enc->features.flags.bits.DP_IS_USB_C &&
-			link->dc->debug.usbc_combo_phy_reset_wa)
-		apply_usbc_combo_phy_reset_wa(link, known_limit_link_setting);
-
-	dp_trace_set_lt_start_timestamp(link, false);
-	for (i = 0; i < attempts; i++) {
-		enum dc_connection_type type = dc_connection_none;
-
-		memset(&link->verified_link_cap, 0,
-				sizeof(struct dc_link_settings));
-		if (!dc_link_detect_sink(link, &type) || type == dc_connection_none) {
-			link->verified_link_cap = fail_safe_link_settings;
-			break;
-		} else if (dp_verify_link_cap(link, known_limit_link_setting,
-				&fail_count) && fail_count == 0) {
-			success = true;
-			break;
-		}
-		msleep(10);
-	}
-
-	dp_trace_lt_fail_count_update(link, fail_count, true);
-	dp_trace_set_lt_end_timestamp(link, true);
-
-	return success;
-}
-
-/* in DP compliance test, DPR-120 may have
- * a random value in its MAX_LINK_BW dpcd field.
- * We map it to the maximum supported link rate that
- * is smaller than MAX_LINK_BW in this case.
- */
-static enum dc_link_rate get_link_rate_from_max_link_bw(
-		 uint8_t max_link_bw)
-{
-	enum dc_link_rate link_rate;
-
-	if (max_link_bw >= LINK_RATE_HIGH3) {
-		link_rate = LINK_RATE_HIGH3;
-	} else if (max_link_bw < LINK_RATE_HIGH3
-			&& max_link_bw >= LINK_RATE_HIGH2) {
-		link_rate = LINK_RATE_HIGH2;
-	} else if (max_link_bw < LINK_RATE_HIGH2
-			&& max_link_bw >= LINK_RATE_HIGH) {
-		link_rate = LINK_RATE_HIGH;
-	} else if (max_link_bw < LINK_RATE_HIGH
-			&& max_link_bw >= LINK_RATE_LOW) {
-		link_rate = LINK_RATE_LOW;
-	} else {
-		link_rate = LINK_RATE_UNKNOWN;
-	}
-
-	return link_rate;
-}
-
-static inline bool reached_minimum_lane_count(enum dc_lane_count lane_count)
-{
-	return lane_count <= LANE_COUNT_ONE;
-}
-
-static inline bool reached_minimum_link_rate(enum dc_link_rate link_rate)
-{
-	return link_rate <= LINK_RATE_LOW;
-}
-
-static enum dc_lane_count reduce_lane_count(enum dc_lane_count lane_count)
-{
-	switch (lane_count) {
-	case LANE_COUNT_FOUR:
-		return LANE_COUNT_TWO;
-	case LANE_COUNT_TWO:
-		return LANE_COUNT_ONE;
-	case LANE_COUNT_ONE:
-		return LANE_COUNT_UNKNOWN;
-	default:
-		return LANE_COUNT_UNKNOWN;
-	}
-}
-
-static enum dc_link_rate reduce_link_rate(enum dc_link_rate link_rate)
-{
-	switch (link_rate) {
-	case LINK_RATE_UHBR20:
-		return LINK_RATE_UHBR13_5;
-	case LINK_RATE_UHBR13_5:
-		return LINK_RATE_UHBR10;
-	case LINK_RATE_UHBR10:
-		return LINK_RATE_HIGH3;
-	case LINK_RATE_HIGH3:
-		return LINK_RATE_HIGH2;
-	case LINK_RATE_HIGH2:
-		return LINK_RATE_HIGH;
-	case LINK_RATE_HIGH:
-		return LINK_RATE_LOW;
-	case LINK_RATE_LOW:
-		return LINK_RATE_UNKNOWN;
-	default:
-		return LINK_RATE_UNKNOWN;
-	}
-}
-
-static enum dc_lane_count increase_lane_count(enum dc_lane_count lane_count)
-{
-	switch (lane_count) {
-	case LANE_COUNT_ONE:
-		return LANE_COUNT_TWO;
-	case LANE_COUNT_TWO:
-		return LANE_COUNT_FOUR;
-	default:
-		return LANE_COUNT_UNKNOWN;
-	}
-}
-
-static enum dc_link_rate increase_link_rate(struct dc_link *link,
-		enum dc_link_rate link_rate)
-{
-	switch (link_rate) {
-	case LINK_RATE_LOW:
-		return LINK_RATE_HIGH;
-	case LINK_RATE_HIGH:
-		return LINK_RATE_HIGH2;
-	case LINK_RATE_HIGH2:
-		return LINK_RATE_HIGH3;
-	case LINK_RATE_HIGH3:
-		return LINK_RATE_UHBR10;
-	case LINK_RATE_UHBR10:
-		/* upto DP2.x specs UHBR13.5 is the only link rate that could be
-		 * not supported by DPRX when higher link rate is supported.
-		 * so we treat it as a special case for code simplicity. When we
-		 * have new specs with more link rates like this, we should
-		 * consider a more generic solution to handle discrete link
-		 * rate capabilities.
-		 */
-		return link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5 ?
-				LINK_RATE_UHBR13_5 : LINK_RATE_UHBR20;
-	case LINK_RATE_UHBR13_5:
-		return LINK_RATE_UHBR20;
-	default:
-		return LINK_RATE_UNKNOWN;
-	}
-}
-
-static bool decide_fallback_link_setting_max_bw_policy(
-		struct dc_link *link,
-		const struct dc_link_settings *max,
-		struct dc_link_settings *cur,
-		enum link_training_result training_result)
-{
-	uint8_t cur_idx = 0, next_idx;
-	bool found = false;
-
-	if (training_result == LINK_TRAINING_ABORT)
-		return false;
-
-	while (cur_idx < ARRAY_SIZE(dp_lt_fallbacks))
-		/* find current index */
-		if (dp_lt_fallbacks[cur_idx].lane_count == cur->lane_count &&
-				dp_lt_fallbacks[cur_idx].link_rate == cur->link_rate)
-			break;
-		else
-			cur_idx++;
-
-	next_idx = cur_idx + 1;
-
-	while (next_idx < ARRAY_SIZE(dp_lt_fallbacks))
-		/* find next index */
-		if (dp_lt_fallbacks[next_idx].lane_count > max->lane_count ||
-				dp_lt_fallbacks[next_idx].link_rate > max->link_rate)
-			next_idx++;
-		else if (dp_lt_fallbacks[next_idx].link_rate == LINK_RATE_UHBR13_5 &&
-				link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5 == 0)
-			/* upto DP2.x specs UHBR13.5 is the only link rate that
-			 * could be not supported by DPRX when higher link rate
-			 * is supported. so we treat it as a special case for
-			 * code simplicity. When we have new specs with more
-			 * link rates like this, we should consider a more
-			 * generic solution to handle discrete link rate
-			 * capabilities.
-			 */
-			next_idx++;
-		else
-			break;
-
-	if (next_idx < ARRAY_SIZE(dp_lt_fallbacks)) {
-		cur->lane_count = dp_lt_fallbacks[next_idx].lane_count;
-		cur->link_rate = dp_lt_fallbacks[next_idx].link_rate;
-		found = true;
-	}
-
-	return found;
-}
-
-/*
- * function: set link rate and lane count fallback based
- * on current link setting and last link training result
- * return value:
- *			true - link setting could be set
- *			false - has reached minimum setting
- *					and no further fallback could be done
- */
-bool decide_fallback_link_setting(
-		struct dc_link *link,
-		struct dc_link_settings *max,
-		struct dc_link_settings *cur,
-		enum link_training_result training_result)
-{
-	if (dp_get_link_encoding_format(max) == DP_128b_132b_ENCODING ||
-			link->dc->debug.force_dp2_lt_fallback_method)
-		return decide_fallback_link_setting_max_bw_policy(link, max,
-				cur, training_result);
-
-	switch (training_result) {
-	case LINK_TRAINING_CR_FAIL_LANE0:
-	case LINK_TRAINING_CR_FAIL_LANE1:
-	case LINK_TRAINING_CR_FAIL_LANE23:
-	case LINK_TRAINING_LQA_FAIL:
-	{
-		if (!reached_minimum_link_rate(cur->link_rate)) {
-			cur->link_rate = reduce_link_rate(cur->link_rate);
-		} else if (!reached_minimum_lane_count(cur->lane_count)) {
-			cur->link_rate = max->link_rate;
-			if (training_result == LINK_TRAINING_CR_FAIL_LANE0)
-				return false;
-			else if (training_result == LINK_TRAINING_CR_FAIL_LANE1)
-				cur->lane_count = LANE_COUNT_ONE;
-			else if (training_result == LINK_TRAINING_CR_FAIL_LANE23)
-				cur->lane_count = LANE_COUNT_TWO;
-			else
-				cur->lane_count = reduce_lane_count(cur->lane_count);
-		} else {
-			return false;
-		}
-		break;
-	}
-	case LINK_TRAINING_EQ_FAIL_EQ:
-	case LINK_TRAINING_EQ_FAIL_CR_PARTIAL:
-	{
-		if (!reached_minimum_lane_count(cur->lane_count)) {
-			cur->lane_count = reduce_lane_count(cur->lane_count);
-		} else if (!reached_minimum_link_rate(cur->link_rate)) {
-			cur->link_rate = reduce_link_rate(cur->link_rate);
-			/* Reduce max link rate to avoid potential infinite loop.
-			 * Needed so that any subsequent CR_FAIL fallback can't
-			 * re-set the link rate higher than the link rate from
-			 * the latest EQ_FAIL fallback.
-			 */
-			max->link_rate = cur->link_rate;
-			cur->lane_count = max->lane_count;
-		} else {
-			return false;
-		}
-		break;
-	}
-	case LINK_TRAINING_EQ_FAIL_CR:
-	{
-		if (!reached_minimum_link_rate(cur->link_rate)) {
-			cur->link_rate = reduce_link_rate(cur->link_rate);
-			/* Reduce max link rate to avoid potential infinite loop.
-			 * Needed so that any subsequent CR_FAIL fallback can't
-			 * re-set the link rate higher than the link rate from
-			 * the latest EQ_FAIL fallback.
-			 */
-			max->link_rate = cur->link_rate;
-			cur->lane_count = max->lane_count;
-		} else {
-			return false;
-		}
-		break;
-	}
-	default:
-		return false;
-	}
-	return true;
-}
-
 bool dp_validate_mode_timing(
 	struct dc_link *link,
 	const struct dc_crtc_timing *timing)
@@ -814,357 +234,57 @@ bool dp_validate_mode_timing(
 		return false;
 }
 
-static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_settings *link_setting, uint32_t req_bw)
+/*************************Short Pulse IRQ***************************/
+bool dc_link_dp_allow_hpd_rx_irq(const struct dc_link *link)
 {
-	struct dc_link_settings initial_link_setting = {
-		LANE_COUNT_ONE, LINK_RATE_LOW, LINK_SPREAD_DISABLED, false, 0};
-	struct dc_link_settings current_link_setting =
-			initial_link_setting;
-	uint32_t link_bw;
-
-	if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
-		return false;
-
-	/* search for the minimum link setting that:
-	 * 1. is supported according to the link training result
-	 * 2. could support the b/w requested by the timing
+	/*
+	 * Don't handle RX IRQ unless one of following is met:
+	 * 1) The link is established (cur_link_settings != unknown)
+	 * 2) We know we're dealing with a branch device, SST or MST
 	 */
-	while (current_link_setting.link_rate <=
-			link->verified_link_cap.link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
-				link,
-				&current_link_setting);
-		if (req_bw <= link_bw) {
-			*link_setting = current_link_setting;
-			return true;
-		}
 
-		if (current_link_setting.lane_count <
-				link->verified_link_cap.lane_count) {
-			current_link_setting.lane_count =
-					increase_lane_count(
-							current_link_setting.lane_count);
-		} else {
-			current_link_setting.link_rate =
-					increase_link_rate(link,
-							current_link_setting.link_rate);
-			current_link_setting.lane_count =
-					initial_link_setting.lane_count;
-		}
-	}
+	if ((link->cur_link_settings.lane_count != LANE_COUNT_UNKNOWN) ||
+		is_dp_branch_device(link))
+		return true;
 
 	return false;
 }
 
-bool decide_edp_link_settings(struct dc_link *link, struct dc_link_settings *link_setting, uint32_t req_bw)
+static bool handle_hpd_irq_psr_sink(struct dc_link *link)
 {
-	struct dc_link_settings initial_link_setting;
-	struct dc_link_settings current_link_setting;
-	uint32_t link_bw;
+	union dpcd_psr_configuration psr_configuration;
 
-	/*
-	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
-	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
-	 */
-	if (link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
-			link->dpcd_caps.edp_supported_link_rates_count == 0) {
-		*link_setting = link->verified_link_cap;
-		return true;
-	}
+	if (!link->psr_settings.psr_feature_enabled)
+		return false;
 
-	memset(&initial_link_setting, 0, sizeof(initial_link_setting));
-	initial_link_setting.lane_count = LANE_COUNT_ONE;
-	initial_link_setting.link_rate = link->dpcd_caps.edp_supported_link_rates[0];
-	initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
-	initial_link_setting.use_link_rate_set = true;
-	initial_link_setting.link_rate_set = 0;
-	current_link_setting = initial_link_setting;
-
-	/* search for the minimum link setting that:
-	 * 1. is supported according to the link training result
-	 * 2. could support the b/w requested by the timing
-	 */
-	while (current_link_setting.link_rate <=
-			link->verified_link_cap.link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
-				link,
-				&current_link_setting);
-		if (req_bw <= link_bw) {
-			*link_setting = current_link_setting;
-			return true;
-		}
+	dm_helpers_dp_read_dpcd(
+		link->ctx,
+		link,
+		368,/*DpcdAddress_PSR_Enable_Cfg*/
+		&psr_configuration.raw,
+		sizeof(psr_configuration.raw));
 
-		if (current_link_setting.lane_count <
-				link->verified_link_cap.lane_count) {
-			current_link_setting.lane_count =
-					increase_lane_count(
-							current_link_setting.lane_count);
-		} else {
-			if (current_link_setting.link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
-				current_link_setting.link_rate_set++;
-				current_link_setting.link_rate =
-					link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
-				current_link_setting.lane_count =
-									initial_link_setting.lane_count;
-			} else
-				break;
-		}
-	}
-	return false;
-}
+	if (psr_configuration.bits.ENABLE) {
+		unsigned char dpcdbuf[3] = {0};
+		union psr_error_status psr_error_status;
+		union psr_sink_psr_status psr_sink_psr_status;
 
-static bool decide_edp_link_settings_with_dsc(struct dc_link *link,
-		struct dc_link_settings *link_setting,
-		uint32_t req_bw,
-		enum dc_link_rate max_link_rate)
-{
-	struct dc_link_settings initial_link_setting;
-	struct dc_link_settings current_link_setting;
-	uint32_t link_bw;
+		dm_helpers_dp_read_dpcd(
+			link->ctx,
+			link,
+			0x2006, /*DpcdAddress_PSR_Error_Status*/
+			(unsigned char *) dpcdbuf,
+			sizeof(dpcdbuf));
 
-	unsigned int policy = 0;
+		/*DPCD 2006h   ERROR STATUS*/
+		psr_error_status.raw = dpcdbuf[0];
+		/*DPCD 2008h   SINK PANEL SELF REFRESH STATUS*/
+		psr_sink_psr_status.raw = dpcdbuf[2];
 
-	policy = link->panel_config.dsc.force_dsc_edp_policy;
-	if (max_link_rate == LINK_RATE_UNKNOWN)
-		max_link_rate = link->verified_link_cap.link_rate;
-	/*
-	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
-	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
-	 */
-	if ((link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
-			link->dpcd_caps.edp_supported_link_rates_count == 0)) {
-		/* for DSC enabled case, we search for minimum lane count */
-		memset(&initial_link_setting, 0, sizeof(initial_link_setting));
-		initial_link_setting.lane_count = LANE_COUNT_ONE;
-		initial_link_setting.link_rate = LINK_RATE_LOW;
-		initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
-		initial_link_setting.use_link_rate_set = false;
-		initial_link_setting.link_rate_set = 0;
-		current_link_setting = initial_link_setting;
-		if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
-			return false;
-
-		/* search for the minimum link setting that:
-		 * 1. is supported according to the link training result
-		 * 2. could support the b/w requested by the timing
-		 */
-		while (current_link_setting.link_rate <=
-				max_link_rate) {
-			link_bw = dc_link_bandwidth_kbps(
-					link,
-					&current_link_setting);
-			if (req_bw <= link_bw) {
-				*link_setting = current_link_setting;
-				return true;
-			}
-			if (policy) {
-				/* minimize lane */
-				if (current_link_setting.link_rate < max_link_rate) {
-					current_link_setting.link_rate =
-							increase_link_rate(link,
-									current_link_setting.link_rate);
-				} else {
-					if (current_link_setting.lane_count <
-									link->verified_link_cap.lane_count) {
-						current_link_setting.lane_count =
-								increase_lane_count(
-										current_link_setting.lane_count);
-						current_link_setting.link_rate = initial_link_setting.link_rate;
-					} else
-						break;
-				}
-			} else {
-				/* minimize link rate */
-				if (current_link_setting.lane_count <
-						link->verified_link_cap.lane_count) {
-					current_link_setting.lane_count =
-							increase_lane_count(
-									current_link_setting.lane_count);
-				} else {
-					current_link_setting.link_rate =
-							increase_link_rate(link,
-									current_link_setting.link_rate);
-					current_link_setting.lane_count =
-							initial_link_setting.lane_count;
-				}
-			}
-		}
-		return false;
-	}
-
-	/* if optimize edp link is supported */
-	memset(&initial_link_setting, 0, sizeof(initial_link_setting));
-	initial_link_setting.lane_count = LANE_COUNT_ONE;
-	initial_link_setting.link_rate = link->dpcd_caps.edp_supported_link_rates[0];
-	initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
-	initial_link_setting.use_link_rate_set = true;
-	initial_link_setting.link_rate_set = 0;
-	current_link_setting = initial_link_setting;
-
-	/* search for the minimum link setting that:
-	 * 1. is supported according to the link training result
-	 * 2. could support the b/w requested by the timing
-	 */
-	while (current_link_setting.link_rate <=
-			max_link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
-				link,
-				&current_link_setting);
-		if (req_bw <= link_bw) {
-			*link_setting = current_link_setting;
-			return true;
-		}
-		if (policy) {
-			/* minimize lane */
-			if (current_link_setting.link_rate_set <
-					link->dpcd_caps.edp_supported_link_rates_count
-					&& current_link_setting.link_rate < max_link_rate) {
-				current_link_setting.link_rate_set++;
-				current_link_setting.link_rate =
-					link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
-			} else {
-				if (current_link_setting.lane_count < link->verified_link_cap.lane_count) {
-					current_link_setting.lane_count =
-							increase_lane_count(
-									current_link_setting.lane_count);
-					current_link_setting.link_rate_set = initial_link_setting.link_rate_set;
-					current_link_setting.link_rate =
-						link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
-				} else
-					break;
-			}
-		} else {
-			/* minimize link rate */
-			if (current_link_setting.lane_count <
-					link->verified_link_cap.lane_count) {
-				current_link_setting.lane_count =
-						increase_lane_count(
-								current_link_setting.lane_count);
-			} else {
-				if (current_link_setting.link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
-					current_link_setting.link_rate_set++;
-					current_link_setting.link_rate =
-						link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
-					current_link_setting.lane_count =
-						initial_link_setting.lane_count;
-				} else
-					break;
-			}
-		}
-	}
-	return false;
-}
-
-static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_settings *link_setting)
-{
-	*link_setting = link->verified_link_cap;
-	return true;
-}
-
-bool decide_link_settings(struct dc_stream_state *stream,
-	struct dc_link_settings *link_setting)
-{
-	struct dc_link *link = stream->link;
-	uint32_t req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
-
-	memset(link_setting, 0, sizeof(*link_setting));
-
-	/* if preferred is specified through AMDDP, use it, if it's enough
-	 * to drive the mode
-	 */
-	if (link->preferred_link_setting.lane_count !=
-			LANE_COUNT_UNKNOWN &&
-			link->preferred_link_setting.link_rate !=
-					LINK_RATE_UNKNOWN) {
-		*link_setting = link->preferred_link_setting;
-		return true;
-	}
-
-	/* MST doesn't perform link training for now
-	 * TODO: add MST specific link training routine
-	 */
-	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		decide_mst_link_settings(link, link_setting);
-	} else if (link->connector_signal == SIGNAL_TYPE_EDP) {
-		/* enable edp link optimization for DSC eDP case */
-		if (stream->timing.flags.DSC) {
-			enum dc_link_rate max_link_rate = LINK_RATE_UNKNOWN;
-
-			if (link->panel_config.dsc.force_dsc_edp_policy) {
-				/* calculate link max link rate cap*/
-				struct dc_link_settings tmp_link_setting;
-				struct dc_crtc_timing tmp_timing = stream->timing;
-				uint32_t orig_req_bw;
-
-				tmp_link_setting.link_rate = LINK_RATE_UNKNOWN;
-				tmp_timing.flags.DSC = 0;
-				orig_req_bw = dc_bandwidth_in_kbps_from_timing(&tmp_timing);
-				decide_edp_link_settings(link, &tmp_link_setting, orig_req_bw);
-				max_link_rate = tmp_link_setting.link_rate;
-			}
-			decide_edp_link_settings_with_dsc(link, link_setting, req_bw, max_link_rate);
-		} else {
-			decide_edp_link_settings(link, link_setting, req_bw);
-		}
-	} else {
-		decide_dp_link_settings(link, link_setting, req_bw);
-	}
-
-	return link_setting->lane_count != LANE_COUNT_UNKNOWN &&
-			link_setting->link_rate != LINK_RATE_UNKNOWN;
-}
-
-/*************************Short Pulse IRQ***************************/
-bool dc_link_dp_allow_hpd_rx_irq(const struct dc_link *link)
-{
-	/*
-	 * Don't handle RX IRQ unless one of following is met:
-	 * 1) The link is established (cur_link_settings != unknown)
-	 * 2) We know we're dealing with a branch device, SST or MST
-	 */
-
-	if ((link->cur_link_settings.lane_count != LANE_COUNT_UNKNOWN) ||
-		is_dp_branch_device(link))
-		return true;
-
-	return false;
-}
-
-static bool handle_hpd_irq_psr_sink(struct dc_link *link)
-{
-	union dpcd_psr_configuration psr_configuration;
-
-	if (!link->psr_settings.psr_feature_enabled)
-		return false;
-
-	dm_helpers_dp_read_dpcd(
-		link->ctx,
-		link,
-		368,/*DpcdAddress_PSR_Enable_Cfg*/
-		&psr_configuration.raw,
-		sizeof(psr_configuration.raw));
-
-	if (psr_configuration.bits.ENABLE) {
-		unsigned char dpcdbuf[3] = {0};
-		union psr_error_status psr_error_status;
-		union psr_sink_psr_status psr_sink_psr_status;
-
-		dm_helpers_dp_read_dpcd(
-			link->ctx,
-			link,
-			0x2006, /*DpcdAddress_PSR_Error_Status*/
-			(unsigned char *) dpcdbuf,
-			sizeof(dpcdbuf));
-
-		/*DPCD 2006h   ERROR STATUS*/
-		psr_error_status.raw = dpcdbuf[0];
-		/*DPCD 2008h   SINK PANEL SELF REFRESH STATUS*/
-		psr_sink_psr_status.raw = dpcdbuf[2];
-
-		if (psr_error_status.bits.LINK_CRC_ERROR ||
-				psr_error_status.bits.RFB_STORAGE_ERROR ||
-				psr_error_status.bits.VSC_SDP_ERROR) {
-			bool allow_active;
+		if (psr_error_status.bits.LINK_CRC_ERROR ||
+				psr_error_status.bits.RFB_STORAGE_ERROR ||
+				psr_error_status.bits.VSC_SDP_ERROR) {
+			bool allow_active;
 
 			/* Acknowledge and clear error bits */
 			dm_helpers_dp_write_dpcd(
@@ -1415,7 +535,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 		lane++) {
 		dpcd_lane_adjust.raw =
 			get_nibble_at_index(&dpcd_lane_adjustment[0].raw, lane);
-		if (dp_get_link_encoding_format(&link->cur_link_settings) ==
+		if (link_dp_get_encoding_format(&link->cur_link_settings) ==
 				DP_8b_10b_ENCODING) {
 			link_training_settings.hw_lane_settings[lane].VOLTAGE_SWING =
 				(enum dc_voltage_swing)
@@ -1426,7 +546,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 			link_training_settings.hw_lane_settings[lane].POST_CURSOR2 =
 				(enum dc_post_cursor2)
 				((dpcd_post_cursor_2_adjustment >> (lane * 2)) & 0x03);
-		} else if (dp_get_link_encoding_format(&link->cur_link_settings) ==
+		} else if (link_dp_get_encoding_format(&link->cur_link_settings) ==
 				DP_128b_132b_ENCODING) {
 			link_training_settings.hw_lane_settings[lane].FFE_PRESET.settings.level =
 					dpcd_lane_adjust.tx_ffe.PRESET_VALUE;
@@ -1652,1289 +772,224 @@ static void dp_test_get_audio_test_data(struct dc_link *link, bool disable_video
 	link->audio_test_data.pattern_type = test_pattern;
 
 	if (test_pattern == DP_TEST_PATTERN_AUDIO_SAWTOOTH) {
-		for (modes = 0; modes < pipe_ctx->stream->audio_info.mode_count; modes++) {
-			link->audio_test_data.pattern_period[modes] = dpcd_pattern_period[modes].bits.pattern_period;
-		}
-	}
-}
-
-void dc_link_dp_handle_automated_test(struct dc_link *link)
-{
-	union test_request test_request;
-	union test_response test_response;
-
-	memset(&test_request, 0, sizeof(test_request));
-	memset(&test_response, 0, sizeof(test_response));
-
-	core_link_read_dpcd(
-		link,
-		DP_TEST_REQUEST,
-		&test_request.raw,
-		sizeof(union test_request));
-	if (test_request.bits.LINK_TRAINING) {
-		/* ACK first to let DP RX test box monitor LT sequence */
-		test_response.bits.ACK = 1;
-		core_link_write_dpcd(
-			link,
-			DP_TEST_RESPONSE,
-			&test_response.raw,
-			sizeof(test_response));
-		dp_test_send_link_training(link);
-		/* no acknowledge request is needed again */
-		test_response.bits.ACK = 0;
-	}
-	if (test_request.bits.LINK_TEST_PATTRN) {
-		dp_test_send_link_test_pattern(link);
-		test_response.bits.ACK = 1;
-	}
-
-	if (test_request.bits.AUDIO_TEST_PATTERN) {
-		dp_test_get_audio_test_data(link, test_request.bits.TEST_AUDIO_DISABLED_VIDEO);
-		test_response.bits.ACK = 1;
-	}
-
-	if (test_request.bits.PHY_TEST_PATTERN) {
-		dp_test_send_phy_test_pattern(link);
-		test_response.bits.ACK = 1;
-	}
-
-	/* send request acknowledgment */
-	if (test_response.bits.ACK)
-		core_link_write_dpcd(
-			link,
-			DP_TEST_RESPONSE,
-			&test_response.raw,
-			sizeof(test_response));
-}
-
-void dc_link_dp_handle_link_loss(struct dc_link *link)
-{
-	int i;
-	struct pipe_ctx *pipe_ctx;
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
-		if (pipe_ctx && pipe_ctx->stream && pipe_ctx->stream->link == link)
-			break;
-	}
-
-	if (pipe_ctx == NULL || pipe_ctx->stream == NULL)
-		return;
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
-		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
-				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe)
-			core_link_disable_stream(pipe_ctx);
-	}
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
-		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off
-				&& pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe) {
-			// Always use max settings here for DP 1.4a LL Compliance CTS
-			if (link->is_automated) {
-				pipe_ctx->link_config.dp_link_settings.lane_count =
-						link->verified_link_cap.lane_count;
-				pipe_ctx->link_config.dp_link_settings.link_rate =
-						link->verified_link_cap.link_rate;
-				pipe_ctx->link_config.dp_link_settings.link_spread =
-						link->verified_link_cap.link_spread;
-			}
-			core_link_enable_stream(link->dc->current_state, pipe_ctx);
-		}
-	}
-}
-
-bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd_irq_dpcd_data, bool *out_link_loss,
-							bool defer_handling, bool *has_left_work)
-{
-	union hpd_irq_data hpd_irq_dpcd_data = {0};
-	union device_service_irq device_service_clear = {0};
-	enum dc_status result;
-	bool status = false;
-
-	if (out_link_loss)
-		*out_link_loss = false;
-
-	if (has_left_work)
-		*has_left_work = false;
-	/* For use cases related to down stream connection status change,
-	 * PSR and device auto test, refer to function handle_sst_hpd_irq
-	 * in DAL2.1*/
-
-	DC_LOG_HW_HPD_IRQ("%s: Got short pulse HPD on link %d\n",
-		__func__, link->link_index);
-
-
-	 /* All the "handle_hpd_irq_xxx()" methods
-		 * should be called only after
-		 * dal_dpsst_ls_read_hpd_irq_data
-		 * Order of calls is important too
-		 */
-	result = read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
-	if (out_hpd_irq_dpcd_data)
-		*out_hpd_irq_dpcd_data = hpd_irq_dpcd_data;
-
-	if (result != DC_OK) {
-		DC_LOG_HW_HPD_IRQ("%s: DPCD read failed to obtain irq data\n",
-			__func__);
-		return false;
-	}
-
-	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.AUTOMATED_TEST) {
-		// Workaround for DP 1.4a LL Compliance CTS as USB4 has to share encoders unlike DP and USBC
-		link->is_automated = true;
-		device_service_clear.bits.AUTOMATED_TEST = 1;
-		core_link_write_dpcd(
-			link,
-			DP_DEVICE_SERVICE_IRQ_VECTOR,
-			&device_service_clear.raw,
-			sizeof(device_service_clear.raw));
-		device_service_clear.raw = 0;
-		if (defer_handling && has_left_work)
-			*has_left_work = true;
-		else
-			dc_link_dp_handle_automated_test(link);
-		return false;
-	}
-
-	if (!dc_link_dp_allow_hpd_rx_irq(link)) {
-		DC_LOG_HW_HPD_IRQ("%s: skipping HPD handling on %d\n",
-			__func__, link->link_index);
-		return false;
-	}
-
-	if (handle_hpd_irq_psr_sink(link))
-		/* PSR-related error was detected and handled */
-		return true;
-
-	/* If PSR-related error handled, Main link may be off,
-	 * so do not handle as a normal sink status change interrupt.
-	 */
-
-	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.UP_REQ_MSG_RDY) {
-		if (defer_handling && has_left_work)
-			*has_left_work = true;
-		return true;
-	}
-
-	/* check if we have MST msg and return since we poll for it */
-	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.DOWN_REP_MSG_RDY) {
-		if (defer_handling && has_left_work)
-			*has_left_work = true;
-		return false;
-	}
-
-	/* For now we only handle 'Downstream port status' case.
-	 * If we got sink count changed it means
-	 * Downstream port status changed,
-	 * then DM should call DC to do the detection.
-	 * NOTE: Do not handle link loss on eDP since it is internal link*/
-	if ((link->connector_signal != SIGNAL_TYPE_EDP) &&
-		hpd_rx_irq_check_link_loss_status(
-			link,
-			&hpd_irq_dpcd_data)) {
-		/* Connectivity log: link loss */
-		CONN_DATA_LINK_LOSS(link,
-					hpd_irq_dpcd_data.raw,
-					sizeof(hpd_irq_dpcd_data),
-					"Status: ");
-
-		if (defer_handling && has_left_work)
-			*has_left_work = true;
-		else
-			dc_link_dp_handle_link_loss(link);
-
-		status = false;
-		if (out_link_loss)
-			*out_link_loss = true;
-
-		dp_trace_link_loss_increment(link);
-	}
-
-	if (link->type == dc_connection_sst_branch &&
-		hpd_irq_dpcd_data.bytes.sink_cnt.bits.SINK_COUNT
-			!= link->dpcd_sink_count)
-		status = true;
-
-	/* reasons for HPD RX:
-	 * 1. Link Loss - ie Re-train the Link
-	 * 2. MST sideband message
-	 * 3. Automated Test - ie. Internal Commit
-	 * 4. CP (copy protection) - (not interesting for DM???)
-	 * 5. DRR
-	 * 6. Downstream Port status changed
-	 * -ie. Detect - this the only one
-	 * which is interesting for DM because
-	 * it must call dc_link_detect.
-	 */
-	return status;
-}
-
-/*query dpcd for version and mst cap addresses*/
-bool is_mst_supported(struct dc_link *link)
-{
-	bool mst          = false;
-	enum dc_status st = DC_OK;
-	union dpcd_rev rev;
-	union mstm_cap cap;
-
-	if (link->preferred_training_settings.mst_enable &&
-		*link->preferred_training_settings.mst_enable == false) {
-		return false;
-	}
-
-	rev.raw  = 0;
-	cap.raw  = 0;
-
-	st = core_link_read_dpcd(link, DP_DPCD_REV, &rev.raw,
-			sizeof(rev));
-
-	if (st == DC_OK && rev.raw >= DPCD_REV_12) {
-
-		st = core_link_read_dpcd(link, DP_MSTM_CAP,
-				&cap.raw, sizeof(cap));
-		if (st == DC_OK && cap.bits.MST_CAP == 1)
-			mst = true;
-	}
-	return mst;
-
-}
-
-bool is_dp_active_dongle(const struct dc_link *link)
-{
-	return (link->dpcd_caps.dongle_type >= DISPLAY_DONGLE_DP_VGA_CONVERTER) &&
-				(link->dpcd_caps.dongle_type <= DISPLAY_DONGLE_DP_HDMI_CONVERTER);
-}
-
-bool is_dp_branch_device(const struct dc_link *link)
-{
-	return link->dpcd_caps.is_branch_dev;
-}
-
-static int translate_dpcd_max_bpc(enum dpcd_downstream_port_max_bpc bpc)
-{
-	switch (bpc) {
-	case DOWN_STREAM_MAX_8BPC:
-		return 8;
-	case DOWN_STREAM_MAX_10BPC:
-		return 10;
-	case DOWN_STREAM_MAX_12BPC:
-		return 12;
-	case DOWN_STREAM_MAX_16BPC:
-		return 16;
-	default:
-		break;
-	}
-
-	return -1;
-}
-uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw)
-{
-	switch (bw) {
-	case 0b001:
-		return 9000000;
-	case 0b010:
-		return 18000000;
-	case 0b011:
-		return 24000000;
-	case 0b100:
-		return 32000000;
-	case 0b101:
-		return 40000000;
-	case 0b110:
-		return 48000000;
-	}
-
-	return 0;
-}
-
-/*
- * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
- */
-static uint32_t intersect_frl_link_bw_support(
-	const uint32_t max_supported_frl_bw_in_kbps,
-	const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
-{
-	uint32_t supported_bw_in_kbps = max_supported_frl_bw_in_kbps;
-
-	// HDMI_ENCODED_LINK_BW bits are only valid if HDMI Link Configuration bit is 1 (FRL mode)
-	if (hdmi_encoded_link_bw.bits.FRL_MODE) {
-		if (hdmi_encoded_link_bw.bits.BW_48Gbps)
-			supported_bw_in_kbps = 48000000;
-		else if (hdmi_encoded_link_bw.bits.BW_40Gbps)
-			supported_bw_in_kbps = 40000000;
-		else if (hdmi_encoded_link_bw.bits.BW_32Gbps)
-			supported_bw_in_kbps = 32000000;
-		else if (hdmi_encoded_link_bw.bits.BW_24Gbps)
-			supported_bw_in_kbps = 24000000;
-		else if (hdmi_encoded_link_bw.bits.BW_18Gbps)
-			supported_bw_in_kbps = 18000000;
-		else if (hdmi_encoded_link_bw.bits.BW_9Gbps)
-			supported_bw_in_kbps = 9000000;
-	}
-
-	return supported_bw_in_kbps;
-}
-
-static void read_dp_device_vendor_id(struct dc_link *link)
-{
-	struct dp_device_vendor_id dp_id;
-
-	/* read IEEE branch device id */
-	core_link_read_dpcd(
-		link,
-		DP_BRANCH_OUI,
-		(uint8_t *)&dp_id,
-		sizeof(dp_id));
-
-	link->dpcd_caps.branch_dev_id =
-		(dp_id.ieee_oui[0] << 16) +
-		(dp_id.ieee_oui[1] << 8) +
-		dp_id.ieee_oui[2];
-
-	memmove(
-		link->dpcd_caps.branch_dev_name,
-		dp_id.ieee_device_id,
-		sizeof(dp_id.ieee_device_id));
-}
-
-
-
-static void get_active_converter_info(
-	uint8_t data, struct dc_link *link)
-{
-	union dp_downstream_port_present ds_port = { .byte = data };
-	memset(&link->dpcd_caps.dongle_caps, 0, sizeof(link->dpcd_caps.dongle_caps));
-
-	/* decode converter info*/
-	if (!ds_port.fields.PORT_PRESENT) {
-		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
-		set_dongle_type(link->ddc,
-				link->dpcd_caps.dongle_type);
-		link->dpcd_caps.is_branch_dev = false;
-		return;
-	}
-
-	/* DPCD 0x5 bit 0 = 1, it indicate it's branch device */
-	link->dpcd_caps.is_branch_dev = ds_port.fields.PORT_PRESENT;
-
-	switch (ds_port.fields.PORT_TYPE) {
-	case DOWNSTREAM_VGA:
-		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_VGA_CONVERTER;
-		break;
-	case DOWNSTREAM_DVI_HDMI_DP_PLUS_PLUS:
-		/* At this point we don't know is it DVI or HDMI or DP++,
-		 * assume DVI.*/
-		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_DVI_CONVERTER;
-		break;
-	default:
-		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
-		break;
-	}
-
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_11) {
-		uint8_t det_caps[16]; /* CTS 4.2.2.7 expects source to read Detailed Capabilities Info : 00080h-0008F.*/
-		union dwnstream_port_caps_byte0 *port_caps =
-			(union dwnstream_port_caps_byte0 *)det_caps;
-		if (core_link_read_dpcd(link, DP_DOWNSTREAM_PORT_0,
-				det_caps, sizeof(det_caps)) == DC_OK) {
-
-			switch (port_caps->bits.DWN_STRM_PORTX_TYPE) {
-			/*Handle DP case as DONGLE_NONE*/
-			case DOWN_STREAM_DETAILED_DP:
-				link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
-				break;
-			case DOWN_STREAM_DETAILED_VGA:
-				link->dpcd_caps.dongle_type =
-					DISPLAY_DONGLE_DP_VGA_CONVERTER;
-				break;
-			case DOWN_STREAM_DETAILED_DVI:
-				link->dpcd_caps.dongle_type =
-					DISPLAY_DONGLE_DP_DVI_CONVERTER;
-				break;
-			case DOWN_STREAM_DETAILED_HDMI:
-			case DOWN_STREAM_DETAILED_DP_PLUS_PLUS:
-				/*Handle DP++ active converter case, process DP++ case as HDMI case according DP1.4 spec*/
-				link->dpcd_caps.dongle_type =
-					DISPLAY_DONGLE_DP_HDMI_CONVERTER;
-
-				link->dpcd_caps.dongle_caps.dongle_type = link->dpcd_caps.dongle_type;
-				if (ds_port.fields.DETAILED_CAPS) {
-
-					union dwnstream_port_caps_byte3_hdmi
-						hdmi_caps = {.raw = det_caps[3] };
-					union dwnstream_port_caps_byte2
-						hdmi_color_caps = {.raw = det_caps[2] };
-					link->dpcd_caps.dongle_caps.dp_hdmi_max_pixel_clk_in_khz =
-						det_caps[1] * 2500;
-
-					link->dpcd_caps.dongle_caps.is_dp_hdmi_s3d_converter =
-						hdmi_caps.bits.FRAME_SEQ_TO_FRAME_PACK;
-					/*YCBCR capability only for HDMI case*/
-					if (port_caps->bits.DWN_STRM_PORTX_TYPE
-							== DOWN_STREAM_DETAILED_HDMI) {
-						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr422_pass_through =
-								hdmi_caps.bits.YCrCr422_PASS_THROUGH;
-						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr420_pass_through =
-								hdmi_caps.bits.YCrCr420_PASS_THROUGH;
-						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr422_converter =
-								hdmi_caps.bits.YCrCr422_CONVERSION;
-						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr420_converter =
-								hdmi_caps.bits.YCrCr420_CONVERSION;
-					}
-
-					link->dpcd_caps.dongle_caps.dp_hdmi_max_bpc =
-						translate_dpcd_max_bpc(
-							hdmi_color_caps.bits.MAX_BITS_PER_COLOR_COMPONENT);
-
-					if (link->dc->caps.dp_hdmi21_pcon_support) {
-						union hdmi_encoded_link_bw hdmi_encoded_link_bw;
-
-						link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps =
-								dc_link_bw_kbps_from_raw_frl_link_rate_data(
-										hdmi_color_caps.bits.MAX_ENCODED_LINK_BW_SUPPORT);
-
-						// Intersect reported max link bw support with the supported link rate post FRL link training
-						if (core_link_read_dpcd(link, DP_PCON_HDMI_POST_FRL_STATUS,
-								&hdmi_encoded_link_bw.raw, sizeof(hdmi_encoded_link_bw)) == DC_OK) {
-							link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps = intersect_frl_link_bw_support(
-									link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps,
-									hdmi_encoded_link_bw);
-						}
-
-						if (link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps > 0)
-							link->dpcd_caps.dongle_caps.extendedCapValid = true;
-					}
-
-					if (link->dpcd_caps.dongle_caps.dp_hdmi_max_pixel_clk_in_khz != 0)
-						link->dpcd_caps.dongle_caps.extendedCapValid = true;
-				}
-
-				break;
-			}
-		}
-	}
-
-	set_dongle_type(link->ddc, link->dpcd_caps.dongle_type);
-
-	{
-		struct dp_sink_hw_fw_revision dp_hw_fw_revision;
-
-		core_link_read_dpcd(
-			link,
-			DP_BRANCH_REVISION_START,
-			(uint8_t *)&dp_hw_fw_revision,
-			sizeof(dp_hw_fw_revision));
-
-		link->dpcd_caps.branch_hw_revision =
-			dp_hw_fw_revision.ieee_hw_rev;
-
-		memmove(
-			link->dpcd_caps.branch_fw_revision,
-			dp_hw_fw_revision.ieee_fw_rev,
-			sizeof(dp_hw_fw_revision.ieee_fw_rev));
-	}
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14 &&
-			link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
-		union dp_dfp_cap_ext dfp_cap_ext;
-		memset(&dfp_cap_ext, '\0', sizeof (dfp_cap_ext));
-		core_link_read_dpcd(
-				link,
-				DP_DFP_CAPABILITY_EXTENSION_SUPPORT,
-				dfp_cap_ext.raw,
-				sizeof(dfp_cap_ext.raw));
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.supported = dfp_cap_ext.fields.supported;
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps =
-				dfp_cap_ext.fields.max_pixel_rate_in_mps[0] +
-				(dfp_cap_ext.fields.max_pixel_rate_in_mps[1] << 8);
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width =
-				dfp_cap_ext.fields.max_video_h_active_width[0] +
-				(dfp_cap_ext.fields.max_video_h_active_width[1] << 8);
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height =
-				dfp_cap_ext.fields.max_video_v_active_height[0] +
-				(dfp_cap_ext.fields.max_video_v_active_height[1] << 8);
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.encoding_format_caps =
-				dfp_cap_ext.fields.encoding_format_caps;
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.rgb_color_depth_caps =
-				dfp_cap_ext.fields.rgb_color_depth_caps;
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr444_color_depth_caps =
-				dfp_cap_ext.fields.ycbcr444_color_depth_caps;
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr422_color_depth_caps =
-				dfp_cap_ext.fields.ycbcr422_color_depth_caps;
-		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr420_color_depth_caps =
-				dfp_cap_ext.fields.ycbcr420_color_depth_caps;
-		DC_LOG_DP2("DFP capability extension is read at link %d", link->link_index);
-		DC_LOG_DP2("\tdfp_cap_ext.supported = %s", link->dpcd_caps.dongle_caps.dfp_cap_ext.supported ? "true" : "false");
-		DC_LOG_DP2("\tdfp_cap_ext.max_pixel_rate_in_mps = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps);
-		DC_LOG_DP2("\tdfp_cap_ext.max_video_h_active_width = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width);
-		DC_LOG_DP2("\tdfp_cap_ext.max_video_v_active_height = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height);
-	}
-}
-
-static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
-		int length)
-{
-	int retry = 0;
-	union dp_downstream_port_present ds_port = { 0 };
-
-	if (!link->dpcd_caps.dpcd_rev.raw) {
-		do {
-			dc_link_dp_receiver_power_ctrl(link, true);
-			core_link_read_dpcd(link, DP_DPCD_REV,
-							dpcd_data, length);
-			link->dpcd_caps.dpcd_rev.raw = dpcd_data[
-				DP_DPCD_REV -
-				DP_DPCD_REV];
-		} while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
-	}
-
-	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
-				 DP_DPCD_REV];
-
-	if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
-		switch (link->dpcd_caps.branch_dev_id) {
-		/* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
-		 * all internal circuits including AUX communication preventing
-		 * reading DPCD table and EDID (spec violation).
-		 * Encoder will skip DP RX power down on disable_output to
-		 * keep receiver powered all the time.*/
-		case DP_BRANCH_DEVICE_ID_0010FA:
-		case DP_BRANCH_DEVICE_ID_0080E1:
-		case DP_BRANCH_DEVICE_ID_00E04C:
-			link->wa_flags.dp_keep_receiver_powered = true;
-			break;
-
-		/* TODO: May need work around for other dongles. */
-		default:
-			link->wa_flags.dp_keep_receiver_powered = false;
-			break;
-		}
-	} else
-		link->wa_flags.dp_keep_receiver_powered = false;
-}
-
-/* Read additional sink caps defined in source specific DPCD area
- * This function currently only reads from SinkCapability address (DP_SOURCE_SINK_CAP)
- * TODO: Add FS caps and read from DP_SOURCE_SINK_FS_CAP as well
- */
-static bool dpcd_read_sink_ext_caps(struct dc_link *link)
-{
-	uint8_t dpcd_data;
-
-	if (!link)
-		return false;
-
-	if (core_link_read_dpcd(link, DP_SOURCE_SINK_CAP, &dpcd_data, 1) != DC_OK)
-		return false;
-
-	link->dpcd_sink_ext_caps.raw = dpcd_data;
-	return true;
-}
-
-enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
-{
-	uint8_t lttpr_dpcd_data[8];
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	bool is_lttpr_present = false;
-
-	/* Logic to determine LTTPR support*/
-	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
-
-	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
-		return false;
-
-	/* By reading LTTPR capability, RX assumes that we will enable
-	 * LTTPR extended aux timeout if LTTPR is present.
-	 */
-	status = core_link_read_dpcd(
-			link,
-			DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
-			lttpr_dpcd_data,
-			sizeof(lttpr_dpcd_data));
-
-	link->dpcd_caps.lttpr_caps.revision.raw =
-			lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.max_link_rate =
-			lttpr_dpcd_data[DP_MAX_LINK_RATE_PHY_REPEATER -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.phy_repeater_cnt =
-			lttpr_dpcd_data[DP_PHY_REPEATER_CNT -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.max_lane_count =
-			lttpr_dpcd_data[DP_MAX_LANE_COUNT_PHY_REPEATER -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.mode =
-			lttpr_dpcd_data[DP_PHY_REPEATER_MODE -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.max_ext_timeout =
-			lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-	link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
-			lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
-			lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-
-	/* If this chip cap is set, at least one retimer must exist in the chain
-	 * Override count to 1 if we receive a known bad count (0 or an invalid value) */
-	if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN &&
-			(dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) == 0)) {
-		ASSERT(0);
-		link->dpcd_caps.lttpr_caps.phy_repeater_cnt = 0x80;
-		DC_LOG_DC("lttpr_caps forced phy_repeater_cnt = %d\n", link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-	}
-
-	/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
-	is_lttpr_present = dp_is_lttpr_present(link);
-
-	if (is_lttpr_present)
-		CONN_DATA_DETECT(link, lttpr_dpcd_data, sizeof(lttpr_dpcd_data), "LTTPR Caps: ");
-
-	DC_LOG_DC("is_lttpr_present = %d\n", is_lttpr_present);
-	return status;
-}
-
-bool dp_is_lttpr_present(struct dc_link *link)
-{
-	return (dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) != 0 &&
-			link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
-			link->dpcd_caps.lttpr_caps.max_lane_count <= 4 &&
-			link->dpcd_caps.lttpr_caps.revision.raw >= 0x14);
-}
-
-static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
-{
-	union dmub_rb_cmd cmd;
-
-	if (!link->ctx->dmub_srv ||
-			link->ep_type != DISPLAY_ENDPOINT_PHY ||
-			link->link_enc->features.flags.bits.DP_IS_USB_C == 0)
-		return false;
-
-	memset(&cmd, 0, sizeof(cmd));
-	cmd.cable_id.header.type = DMUB_CMD_GET_USBC_CABLE_ID;
-	cmd.cable_id.header.payload_bytes = sizeof(cmd.cable_id.data);
-	cmd.cable_id.data.input.phy_inst = resource_transmitter_to_phy_idx(
-			link->dc, link->link_enc->transmitter);
-	if (dc_dmub_srv_cmd_with_reply_data(link->ctx->dmub_srv, &cmd) &&
-			cmd.cable_id.header.ret_status == 1) {
-		cable_id->raw = cmd.cable_id.data.output_raw;
-		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
-	}
-	return cmd.cable_id.header.ret_status == 1;
-}
-
-static union dp_cable_id intersect_cable_id(
-		union dp_cable_id *a, union dp_cable_id *b)
-{
-	union dp_cable_id out;
-
-	out.bits.UHBR10_20_CAPABILITY = MIN(a->bits.UHBR10_20_CAPABILITY,
-			b->bits.UHBR10_20_CAPABILITY);
-	out.bits.UHBR13_5_CAPABILITY = MIN(a->bits.UHBR13_5_CAPABILITY,
-			b->bits.UHBR13_5_CAPABILITY);
-	out.bits.CABLE_TYPE = MAX(a->bits.CABLE_TYPE, b->bits.CABLE_TYPE);
-
-	return out;
-}
-
-static void retrieve_cable_id(struct dc_link *link)
-{
-	union dp_cable_id usbc_cable_id;
-
-	link->dpcd_caps.cable_id.raw = 0;
-	core_link_read_dpcd(link, DP_CABLE_ATTRIBUTES_UPDATED_BY_DPRX,
-			&link->dpcd_caps.cable_id.raw, sizeof(uint8_t));
-
-	if (get_usbc_cable_id(link, &usbc_cable_id))
-		link->dpcd_caps.cable_id = intersect_cable_id(
-				&link->dpcd_caps.cable_id, &usbc_cable_id);
-}
-
-static enum dc_status wake_up_aux_channel(struct dc_link *link)
-{
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	uint32_t aux_channel_retry_cnt = 0;
-	uint8_t dpcd_power_state = '\0';
-
-	while (status != DC_OK && aux_channel_retry_cnt < 10) {
-		status = core_link_read_dpcd(link, DP_SET_POWER,
-				&dpcd_power_state, sizeof(dpcd_power_state));
-
-		/* Delay 1 ms if AUX CH is in power down state. Based on spec
-		 * section 2.3.1.2, if AUX CH may be powered down due to
-		 * write to DPCD 600h = 2. Sink AUX CH is monitoring differential
-		 * signal and may need up to 1 ms before being able to reply.
-		 */
-		if (status != DC_OK || dpcd_power_state == DP_SET_POWER_D3) {
-			udelay(1000);
-			aux_channel_retry_cnt++;
-		}
-	}
-
-	if (status != DC_OK) {
-		dpcd_power_state = DP_SET_POWER_D0;
-		status = core_link_write_dpcd(
-				link,
-				DP_SET_POWER,
-				&dpcd_power_state,
-				sizeof(dpcd_power_state));
-
-		dpcd_power_state = DP_SET_POWER_D3;
-		status = core_link_write_dpcd(
-				link,
-				DP_SET_POWER,
-				&dpcd_power_state,
-				sizeof(dpcd_power_state));
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	return DC_OK;
-}
-
-static bool retrieve_link_cap(struct dc_link *link)
-{
-	/* DP_ADAPTER_CAP - DP_DPCD_REV + 1 == 16 and also DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT + 1 == 16,
-	 * which means size 16 will be good for both of those DPCD register block reads
-	 */
-	uint8_t dpcd_data[16];
-	/*Only need to read 1 byte starting from DP_DPRX_FEATURE_ENUMERATION_LIST.
-	 */
-	uint8_t dpcd_dprx_data = '\0';
-
-	struct dp_device_vendor_id sink_id;
-	union down_stream_port_count down_strm_port_count;
-	union edp_configuration_cap edp_config_cap;
-	union dp_downstream_port_present ds_port = { 0 };
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	uint32_t read_dpcd_retry_cnt = 3;
-	int i;
-	struct dp_sink_hw_fw_revision dp_hw_fw_revision;
-	const uint32_t post_oui_delay = 30; // 30ms
-
-	memset(dpcd_data, '\0', sizeof(dpcd_data));
-	memset(&down_strm_port_count,
-		'\0', sizeof(union down_stream_port_count));
-	memset(&edp_config_cap, '\0',
-		sizeof(union edp_configuration_cap));
-
-	/* if extended timeout is supported in hardware,
-	 * default to LTTPR timeout (3.2ms) first as a W/A for DP link layer
-	 * CTS 4.2.1.1 regression introduced by CTS specs requirement update.
-	 */
-	try_to_configure_aux_timeout(link->ddc,
-			LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD);
-
-	status = dp_retrieve_lttpr_cap(link);
-
-	if (status != DC_OK) {
-		status = wake_up_aux_channel(link);
-		if (status == DC_OK)
-			dp_retrieve_lttpr_cap(link);
-		else
-			return false;
-	}
-
-	if (dp_is_lttpr_present(link))
-		configure_lttpr_mode_transparent(link);
-
-	/* Read DP tunneling information. */
-	status = dpcd_get_tunneling_device_data(link);
-
-	dpcd_set_source_specific_data(link);
-	/* Sink may need to configure internals based on vendor, so allow some
-	 * time before proceeding with possibly vendor specific transactions
-	 */
-	msleep(post_oui_delay);
-
-	for (i = 0; i < read_dpcd_retry_cnt; i++) {
-		status = core_link_read_dpcd(
-				link,
-				DP_DPCD_REV,
-				dpcd_data,
-				sizeof(dpcd_data));
-		if (status == DC_OK)
-			break;
-	}
-
-
-	if (status != DC_OK) {
-		dm_error("%s: Read receiver caps dpcd data failed.\n", __func__);
-		return false;
-	}
-
-	if (!dp_is_lttpr_present(link))
-		try_to_configure_aux_timeout(link->ddc, LINK_AUX_DEFAULT_TIMEOUT_PERIOD);
-
-
-	{
-		union training_aux_rd_interval aux_rd_interval;
-
-		aux_rd_interval.raw =
-			dpcd_data[DP_TRAINING_AUX_RD_INTERVAL];
-
-		link->dpcd_caps.ext_receiver_cap_field_present =
-				aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1 ? true:false;
-
-		if (aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1) {
-			uint8_t ext_cap_data[16];
-
-			memset(ext_cap_data, '\0', sizeof(ext_cap_data));
-			for (i = 0; i < read_dpcd_retry_cnt; i++) {
-				status = core_link_read_dpcd(
-				link,
-				DP_DP13_DPCD_REV,
-				ext_cap_data,
-				sizeof(ext_cap_data));
-				if (status == DC_OK) {
-					memcpy(dpcd_data, ext_cap_data, sizeof(dpcd_data));
-					break;
-				}
-			}
-			if (status != DC_OK)
-				dm_error("%s: Read extend caps data failed, use cap from dpcd 0.\n", __func__);
-		}
-	}
-
-	link->dpcd_caps.dpcd_rev.raw =
-			dpcd_data[DP_DPCD_REV - DP_DPCD_REV];
-
-	if (link->dpcd_caps.ext_receiver_cap_field_present) {
-		for (i = 0; i < read_dpcd_retry_cnt; i++) {
-			status = core_link_read_dpcd(
-					link,
-					DP_DPRX_FEATURE_ENUMERATION_LIST,
-					&dpcd_dprx_data,
-					sizeof(dpcd_dprx_data));
-			if (status == DC_OK)
-				break;
-		}
-
-		link->dpcd_caps.dprx_feature.raw = dpcd_dprx_data;
-
-		if (status != DC_OK)
-			dm_error("%s: Read DPRX caps data failed.\n", __func__);
-	}
-
-	else {
-		link->dpcd_caps.dprx_feature.raw = 0;
-	}
-
-
-	/* Error condition checking...
-	 * It is impossible for Sink to report Max Lane Count = 0.
-	 * It is possible for Sink to report Max Link Rate = 0, if it is
-	 * an eDP device that is reporting specialized link rates in the
-	 * SUPPORTED_LINK_RATE table.
-	 */
-	if (dpcd_data[DP_MAX_LANE_COUNT - DP_DPCD_REV] == 0)
-		return false;
-
-	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
-				 DP_DPCD_REV];
-
-	read_dp_device_vendor_id(link);
-
-	/* TODO - decouple raw mst capability from policy decision */
-	link->dpcd_caps.is_mst_capable = is_mst_supported(link);
-
-	get_active_converter_info(ds_port.byte, link);
-
-	dp_wa_power_up_0010FA(link, dpcd_data, sizeof(dpcd_data));
-
-	down_strm_port_count.raw = dpcd_data[DP_DOWN_STREAM_PORT_COUNT -
-				 DP_DPCD_REV];
-
-	link->dpcd_caps.allow_invalid_MSA_timing_param =
-		down_strm_port_count.bits.IGNORE_MSA_TIMING_PARAM;
-
-	link->dpcd_caps.max_ln_count.raw = dpcd_data[
-		DP_MAX_LANE_COUNT - DP_DPCD_REV];
-
-	link->dpcd_caps.max_down_spread.raw = dpcd_data[
-		DP_MAX_DOWNSPREAD - DP_DPCD_REV];
-
-	link->reported_link_cap.lane_count =
-		link->dpcd_caps.max_ln_count.bits.MAX_LANE_COUNT;
-	link->reported_link_cap.link_rate = get_link_rate_from_max_link_bw(
-			dpcd_data[DP_MAX_LINK_RATE - DP_DPCD_REV]);
-	link->reported_link_cap.link_spread =
-		link->dpcd_caps.max_down_spread.bits.MAX_DOWN_SPREAD ?
-		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
-
-	edp_config_cap.raw = dpcd_data[
-		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV];
-	link->dpcd_caps.panel_mode_edp =
-		edp_config_cap.bits.ALT_SCRAMBLER_RESET;
-	link->dpcd_caps.dpcd_display_control_capable =
-		edp_config_cap.bits.DPCD_DISPLAY_CONTROL_CAPABLE;
-	link->dpcd_caps.channel_coding_cap.raw =
-			dpcd_data[DP_MAIN_LINK_CHANNEL_CODING - DP_DPCD_REV];
-	link->test_pattern_enabled = false;
-	link->compliance_test_state.raw = 0;
-
-	/* read sink count */
-	core_link_read_dpcd(link,
-			DP_SINK_COUNT,
-			&link->dpcd_caps.sink_count.raw,
-			sizeof(link->dpcd_caps.sink_count.raw));
-
-	/* read sink ieee oui */
-	core_link_read_dpcd(link,
-			DP_SINK_OUI,
-			(uint8_t *)(&sink_id),
-			sizeof(sink_id));
+		for (modes = 0; modes < pipe_ctx->stream->audio_info.mode_count; modes++) {
+			link->audio_test_data.pattern_period[modes] = dpcd_pattern_period[modes].bits.pattern_period;
+		}
+	}
+}
 
-	link->dpcd_caps.sink_dev_id =
-			(sink_id.ieee_oui[0] << 16) +
-			(sink_id.ieee_oui[1] << 8) +
-			(sink_id.ieee_oui[2]);
+void dc_link_dp_handle_automated_test(struct dc_link *link)
+{
+	union test_request test_request;
+	union test_response test_response;
 
-	memmove(
-		link->dpcd_caps.sink_dev_id_str,
-		sink_id.ieee_device_id,
-		sizeof(sink_id.ieee_device_id));
+	memset(&test_request, 0, sizeof(test_request));
+	memset(&test_response, 0, sizeof(test_response));
 
 	core_link_read_dpcd(
 		link,
-		DP_SINK_HW_REVISION_START,
-		(uint8_t *)&dp_hw_fw_revision,
-		sizeof(dp_hw_fw_revision));
-
-	link->dpcd_caps.sink_hw_revision =
-		dp_hw_fw_revision.ieee_hw_rev;
-
-	memmove(
-		link->dpcd_caps.sink_fw_revision,
-		dp_hw_fw_revision.ieee_fw_rev,
-		sizeof(dp_hw_fw_revision.ieee_fw_rev));
-
-	/* Quirk for Apple MBP 2018 15" Retina panels: wrong DP_MAX_LINK_RATE */
-	{
-		uint8_t str_mbp_2018[] = { 101, 68, 21, 103, 98, 97 };
-		uint8_t fwrev_mbp_2018[] = { 7, 4 };
-		uint8_t fwrev_mbp_2018_vega[] = { 8, 4 };
-
-		/* We also check for the firmware revision as 16,1 models have an
-		 * identical device id and are incorrectly quirked otherwise.
-		 */
-		if ((link->dpcd_caps.sink_dev_id == 0x0010fa) &&
-		    !memcmp(link->dpcd_caps.sink_dev_id_str, str_mbp_2018,
-			     sizeof(str_mbp_2018)) &&
-		    (!memcmp(link->dpcd_caps.sink_fw_revision, fwrev_mbp_2018,
-			     sizeof(fwrev_mbp_2018)) ||
-		    !memcmp(link->dpcd_caps.sink_fw_revision, fwrev_mbp_2018_vega,
-			     sizeof(fwrev_mbp_2018_vega)))) {
-			link->reported_link_cap.link_rate = LINK_RATE_RBR2;
-		}
+		DP_TEST_REQUEST,
+		&test_request.raw,
+		sizeof(union test_request));
+	if (test_request.bits.LINK_TRAINING) {
+		/* ACK first to let DP RX test box monitor LT sequence */
+		test_response.bits.ACK = 1;
+		core_link_write_dpcd(
+			link,
+			DP_TEST_RESPONSE,
+			&test_response.raw,
+			sizeof(test_response));
+		dp_test_send_link_training(link);
+		/* no acknowledge request is needed again */
+		test_response.bits.ACK = 0;
 	}
-
-	memset(&link->dpcd_caps.dsc_caps, '\0',
-			sizeof(link->dpcd_caps.dsc_caps));
-	memset(&link->dpcd_caps.fec_cap, '\0', sizeof(link->dpcd_caps.fec_cap));
-	/* Read DSC and FEC sink capabilities if DP revision is 1.4 and up */
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14) {
-		status = core_link_read_dpcd(
-				link,
-				DP_FEC_CAPABILITY,
-				&link->dpcd_caps.fec_cap.raw,
-				sizeof(link->dpcd_caps.fec_cap.raw));
-		status = core_link_read_dpcd(
-				link,
-				DP_DSC_SUPPORT,
-				link->dpcd_caps.dsc_caps.dsc_basic_caps.raw,
-				sizeof(link->dpcd_caps.dsc_caps.dsc_basic_caps.raw));
-		if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
-			status = core_link_read_dpcd(
-					link,
-					DP_DSC_BRANCH_OVERALL_THROUGHPUT_0,
-					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw,
-					sizeof(link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw));
-			DC_LOG_DSC("DSC branch decoder capability is read at link %d", link->link_index);
-			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_0 = 0x%02x",
-					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_0);
-			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_1 = 0x%02x",
-					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_1);
-			DC_LOG_DSC("\tBRANCH_MAX_LINE_WIDTH 0x%02x",
-					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_MAX_LINE_WIDTH);
-		}
-
-		/* Apply work around to disable FEC and DSC for USB4 tunneling in TBT3 compatibility mode
-		 * only if required.
-		 */
-		if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
-				link->dc->debug.dpia_debug.bits.enable_force_tbt3_work_around &&
-				link->dpcd_caps.is_branch_dev &&
-				link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
-				link->dpcd_caps.branch_hw_revision == DP_BRANCH_HW_REV_10 &&
-				(link->dpcd_caps.fec_cap.bits.FEC_CAPABLE ||
-				link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT)) {
-			/* A TBT3 device is expected to report no support for FEC or DSC to a USB4 DPIA.
-			 * Clear FEC and DSC capabilities as a work around if that is not the case.
-			 */
-			link->wa_flags.dpia_forced_tbt3_mode = true;
-			memset(&link->dpcd_caps.dsc_caps, '\0', sizeof(link->dpcd_caps.dsc_caps));
-			memset(&link->dpcd_caps.fec_cap, '\0', sizeof(link->dpcd_caps.fec_cap));
-			DC_LOG_DSC("Clear DSC SUPPORT for USB4 link(%d) in TBT3 compatibility mode", link->link_index);
-		} else
-			link->wa_flags.dpia_forced_tbt3_mode = false;
+	if (test_request.bits.LINK_TEST_PATTRN) {
+		dp_test_send_link_test_pattern(link);
+		test_response.bits.ACK = 1;
 	}
 
-	if (!dpcd_read_sink_ext_caps(link))
-		link->dpcd_sink_ext_caps.raw = 0;
-
-	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
-		DC_LOG_DP2("128b/132b encoding is supported at link %d", link->link_index);
-
-		core_link_read_dpcd(link,
-				DP_128B132B_SUPPORTED_LINK_RATES,
-				&link->dpcd_caps.dp_128b_132b_supported_link_rates.raw,
-				sizeof(link->dpcd_caps.dp_128b_132b_supported_link_rates.raw));
-		if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR20)
-			link->reported_link_cap.link_rate = LINK_RATE_UHBR20;
-		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5)
-			link->reported_link_cap.link_rate = LINK_RATE_UHBR13_5;
-		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR10)
-			link->reported_link_cap.link_rate = LINK_RATE_UHBR10;
-		else
-			dm_error("%s: Invalid RX 128b_132b_supported_link_rates\n", __func__);
-		DC_LOG_DP2("128b/132b supported link rates is read at link %d", link->link_index);
-		DC_LOG_DP2("\tmax 128b/132b link rate support is %d.%d GHz",
-				link->reported_link_cap.link_rate / 100,
-				link->reported_link_cap.link_rate % 100);
-
-		core_link_read_dpcd(link,
-				DP_SINK_VIDEO_FALLBACK_FORMATS,
-				&link->dpcd_caps.fallback_formats.raw,
-				sizeof(link->dpcd_caps.fallback_formats.raw));
-		DC_LOG_DP2("sink video fallback format is read at link %d", link->link_index);
-		if (link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support)
-			DC_LOG_DP2("\t1920x1080@60Hz 24bpp fallback format supported");
-		if (link->dpcd_caps.fallback_formats.bits.dp_1280x720_60Hz_24bpp_support)
-			DC_LOG_DP2("\t1280x720@60Hz 24bpp fallback format supported");
-		if (link->dpcd_caps.fallback_formats.bits.dp_1024x768_60Hz_24bpp_support)
-			DC_LOG_DP2("\t1024x768@60Hz 24bpp fallback format supported");
-		if (link->dpcd_caps.fallback_formats.raw == 0) {
-			DC_LOG_DP2("\tno supported fallback formats, assume 1920x1080@60Hz 24bpp is supported");
-			link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support = 1;
-		}
-
-		core_link_read_dpcd(link,
-				DP_FEC_CAPABILITY_1,
-				&link->dpcd_caps.fec_cap1.raw,
-				sizeof(link->dpcd_caps.fec_cap1.raw));
-		DC_LOG_DP2("FEC CAPABILITY 1 is read at link %d", link->link_index);
-		if (link->dpcd_caps.fec_cap1.bits.AGGREGATED_ERROR_COUNTERS_CAPABLE)
-			DC_LOG_DP2("\tFEC aggregated error counters are supported");
+	if (test_request.bits.AUDIO_TEST_PATTERN) {
+		dp_test_get_audio_test_data(link, test_request.bits.TEST_AUDIO_DISABLED_VIDEO);
+		test_response.bits.ACK = 1;
 	}
 
-	retrieve_cable_id(link);
-	dpcd_write_cable_id_to_dprx(link);
-
-	/* Connectivity log: detection */
-	CONN_DATA_DETECT(link, dpcd_data, sizeof(dpcd_data), "Rx Caps: ");
+	if (test_request.bits.PHY_TEST_PATTERN) {
+		dp_test_send_phy_test_pattern(link);
+		test_response.bits.ACK = 1;
+	}
 
-	return true;
+	/* send request acknowledgment */
+	if (test_response.bits.ACK)
+		core_link_write_dpcd(
+			link,
+			DP_TEST_RESPONSE,
+			&test_response.raw,
+			sizeof(test_response));
 }
 
-bool dp_overwrite_extended_receiver_cap(struct dc_link *link)
+void dc_link_dp_handle_link_loss(struct dc_link *link)
 {
-	uint8_t dpcd_data[16];
-	uint32_t read_dpcd_retry_cnt = 3;
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	union dp_downstream_port_present ds_port = { 0 };
-	union down_stream_port_count down_strm_port_count;
-	union edp_configuration_cap edp_config_cap;
-
 	int i;
+	struct pipe_ctx *pipe_ctx;
 
-	for (i = 0; i < read_dpcd_retry_cnt; i++) {
-		status = core_link_read_dpcd(
-				link,
-				DP_DPCD_REV,
-				dpcd_data,
-				sizeof(dpcd_data));
-		if (status == DC_OK)
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe_ctx && pipe_ctx->stream && pipe_ctx->stream->link == link)
 			break;
 	}
 
-	link->dpcd_caps.dpcd_rev.raw =
-		dpcd_data[DP_DPCD_REV - DP_DPCD_REV];
-
-	if (dpcd_data[DP_MAX_LANE_COUNT - DP_DPCD_REV] == 0)
-		return false;
-
-	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
-			DP_DPCD_REV];
+	if (pipe_ctx == NULL || pipe_ctx->stream == NULL)
+		return;
 
-	get_active_converter_info(ds_port.byte, link);
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
+				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe)
+			core_link_disable_stream(pipe_ctx);
+	}
 
-	down_strm_port_count.raw = dpcd_data[DP_DOWN_STREAM_PORT_COUNT -
-			DP_DPCD_REV];
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off
+				&& pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe) {
+			// Always use max settings here for DP 1.4a LL Compliance CTS
+			if (link->is_automated) {
+				pipe_ctx->link_config.dp_link_settings.lane_count =
+						link->verified_link_cap.lane_count;
+				pipe_ctx->link_config.dp_link_settings.link_rate =
+						link->verified_link_cap.link_rate;
+				pipe_ctx->link_config.dp_link_settings.link_spread =
+						link->verified_link_cap.link_spread;
+			}
+			core_link_enable_stream(link->dc->current_state, pipe_ctx);
+		}
+	}
+}
 
-	link->dpcd_caps.allow_invalid_MSA_timing_param =
-		down_strm_port_count.bits.IGNORE_MSA_TIMING_PARAM;
+bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd_irq_dpcd_data, bool *out_link_loss,
+							bool defer_handling, bool *has_left_work)
+{
+	union hpd_irq_data hpd_irq_dpcd_data = {0};
+	union device_service_irq device_service_clear = {0};
+	enum dc_status result;
+	bool status = false;
 
-	link->dpcd_caps.max_ln_count.raw = dpcd_data[
-		DP_MAX_LANE_COUNT - DP_DPCD_REV];
+	if (out_link_loss)
+		*out_link_loss = false;
 
-	link->dpcd_caps.max_down_spread.raw = dpcd_data[
-		DP_MAX_DOWNSPREAD - DP_DPCD_REV];
+	if (has_left_work)
+		*has_left_work = false;
+	/* For use cases related to down stream connection status change,
+	 * PSR and device auto test, refer to function handle_sst_hpd_irq
+	 * in DAL2.1*/
 
-	link->reported_link_cap.lane_count =
-		link->dpcd_caps.max_ln_count.bits.MAX_LANE_COUNT;
-	link->reported_link_cap.link_rate = dpcd_data[
-		DP_MAX_LINK_RATE - DP_DPCD_REV];
-	link->reported_link_cap.link_spread =
-		link->dpcd_caps.max_down_spread.bits.MAX_DOWN_SPREAD ?
-		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
+	DC_LOG_HW_HPD_IRQ("%s: Got short pulse HPD on link %d\n",
+		__func__, link->link_index);
 
-	edp_config_cap.raw = dpcd_data[
-		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV];
-	link->dpcd_caps.panel_mode_edp =
-		edp_config_cap.bits.ALT_SCRAMBLER_RESET;
-	link->dpcd_caps.dpcd_display_control_capable =
-		edp_config_cap.bits.DPCD_DISPLAY_CONTROL_CAPABLE;
 
-	return true;
-}
+	 /* All the "handle_hpd_irq_xxx()" methods
+		 * should be called only after
+		 * dal_dpsst_ls_read_hpd_irq_data
+		 * Order of calls is important too
+		 */
+	result = read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
+	if (out_hpd_irq_dpcd_data)
+		*out_hpd_irq_dpcd_data = hpd_irq_dpcd_data;
 
-bool detect_dp_sink_caps(struct dc_link *link)
-{
-	return retrieve_link_cap(link);
-}
+	if (result != DC_OK) {
+		DC_LOG_HW_HPD_IRQ("%s: DPCD read failed to obtain irq data\n",
+			__func__);
+		return false;
+	}
 
-enum dc_link_rate linkRateInKHzToLinkRateMultiplier(uint32_t link_rate_in_khz)
-{
-	enum dc_link_rate link_rate;
-	// LinkRate is normally stored as a multiplier of 0.27 Gbps per lane. Do the translation.
-	switch (link_rate_in_khz) {
-	case 1620000:
-		link_rate = LINK_RATE_LOW;		// Rate_1 (RBR)		- 1.62 Gbps/Lane
-		break;
-	case 2160000:
-		link_rate = LINK_RATE_RATE_2;	// Rate_2			- 2.16 Gbps/Lane
-		break;
-	case 2430000:
-		link_rate = LINK_RATE_RATE_3;	// Rate_3			- 2.43 Gbps/Lane
-		break;
-	case 2700000:
-		link_rate = LINK_RATE_HIGH;		// Rate_4 (HBR)		- 2.70 Gbps/Lane
-		break;
-	case 3240000:
-		link_rate = LINK_RATE_RBR2;		// Rate_5 (RBR2)	- 3.24 Gbps/Lane
-		break;
-	case 4320000:
-		link_rate = LINK_RATE_RATE_6;	// Rate_6			- 4.32 Gbps/Lane
-		break;
-	case 5400000:
-		link_rate = LINK_RATE_HIGH2;	// Rate_7 (HBR2)	- 5.40 Gbps/Lane
-		break;
-	case 8100000:
-		link_rate = LINK_RATE_HIGH3;	// Rate_8 (HBR3)	- 8.10 Gbps/Lane
-		break;
-	default:
-		link_rate = LINK_RATE_UNKNOWN;
-		break;
+	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.AUTOMATED_TEST) {
+		// Workaround for DP 1.4a LL Compliance CTS as USB4 has to share encoders unlike DP and USBC
+		link->is_automated = true;
+		device_service_clear.bits.AUTOMATED_TEST = 1;
+		core_link_write_dpcd(
+			link,
+			DP_DEVICE_SERVICE_IRQ_VECTOR,
+			&device_service_clear.raw,
+			sizeof(device_service_clear.raw));
+		device_service_clear.raw = 0;
+		if (defer_handling && has_left_work)
+			*has_left_work = true;
+		else
+			dc_link_dp_handle_automated_test(link);
+		return false;
 	}
-	return link_rate;
-}
 
-void detect_edp_sink_caps(struct dc_link *link)
-{
-	uint8_t supported_link_rates[16];
-	uint32_t entry;
-	uint32_t link_rate_in_khz;
-	enum dc_link_rate link_rate = LINK_RATE_UNKNOWN;
-	uint8_t backlight_adj_cap;
-	uint8_t general_edp_cap;
+	if (!dc_link_dp_allow_hpd_rx_irq(link)) {
+		DC_LOG_HW_HPD_IRQ("%s: skipping HPD handling on %d\n",
+			__func__, link->link_index);
+		return false;
+	}
 
-	retrieve_link_cap(link);
-	link->dpcd_caps.edp_supported_link_rates_count = 0;
-	memset(supported_link_rates, 0, sizeof(supported_link_rates));
+	if (handle_hpd_irq_psr_sink(link))
+		/* PSR-related error was detected and handled */
+		return true;
 
-	/*
-	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
-	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
+	/* If PSR-related error handled, Main link may be off,
+	 * so do not handle as a normal sink status change interrupt.
 	 */
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_13 &&
-			(link->panel_config.ilr.optimize_edp_link_rate ||
-			link->reported_link_cap.link_rate == LINK_RATE_UNKNOWN)) {
-		// Read DPCD 00010h - 0001Fh 16 bytes at one shot
-		core_link_read_dpcd(link, DP_SUPPORTED_LINK_RATES,
-							supported_link_rates, sizeof(supported_link_rates));
-
-		for (entry = 0; entry < 16; entry += 2) {
-			// DPCD register reports per-lane link rate = 16-bit link rate capability
-			// value X 200 kHz. Need multiplier to find link rate in kHz.
-			link_rate_in_khz = (supported_link_rates[entry+1] * 0x100 +
-										supported_link_rates[entry]) * 200;
-
-			if (link_rate_in_khz != 0) {
-				link_rate = linkRateInKHzToLinkRateMultiplier(link_rate_in_khz);
-				link->dpcd_caps.edp_supported_link_rates[link->dpcd_caps.edp_supported_link_rates_count] = link_rate;
-				link->dpcd_caps.edp_supported_link_rates_count++;
-
-				if (link->reported_link_cap.link_rate < link_rate)
-					link->reported_link_cap.link_rate = link_rate;
-			}
-		}
+
+	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.UP_REQ_MSG_RDY) {
+		if (defer_handling && has_left_work)
+			*has_left_work = true;
+		return true;
 	}
-	core_link_read_dpcd(link, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP,
-						&backlight_adj_cap, sizeof(backlight_adj_cap));
 
-	link->dpcd_caps.dynamic_backlight_capable_edp =
-				(backlight_adj_cap & DP_EDP_DYNAMIC_BACKLIGHT_CAP) ? true:false;
+	/* check if we have MST msg and return since we poll for it */
+	if (hpd_irq_dpcd_data.bytes.device_service_irq.bits.DOWN_REP_MSG_RDY) {
+		if (defer_handling && has_left_work)
+			*has_left_work = true;
+		return false;
+	}
 
-	core_link_read_dpcd(link, DP_EDP_GENERAL_CAP_1,
-						&general_edp_cap, sizeof(general_edp_cap));
+	/* For now we only handle 'Downstream port status' case.
+	 * If we got sink count changed it means
+	 * Downstream port status changed,
+	 * then DM should call DC to do the detection.
+	 * NOTE: Do not handle link loss on eDP since it is internal link*/
+	if ((link->connector_signal != SIGNAL_TYPE_EDP) &&
+		hpd_rx_irq_check_link_loss_status(
+			link,
+			&hpd_irq_dpcd_data)) {
+		/* Connectivity log: link loss */
+		CONN_DATA_LINK_LOSS(link,
+					hpd_irq_dpcd_data.raw,
+					sizeof(hpd_irq_dpcd_data),
+					"Status: ");
 
-	link->dpcd_caps.set_power_state_capable_edp =
-				(general_edp_cap & DP_EDP_SET_POWER_CAP) ? true:false;
+		if (defer_handling && has_left_work)
+			*has_left_work = true;
+		else
+			dc_link_dp_handle_link_loss(link);
 
-	dc_link_set_default_brightness_aux(link);
+		status = false;
+		if (out_link_loss)
+			*out_link_loss = true;
 
-	core_link_read_dpcd(link, DP_EDP_DPCD_REV,
-		&link->dpcd_caps.edp_rev,
-		sizeof(link->dpcd_caps.edp_rev));
-	/*
-	 * PSR is only valid for eDP v1.3 or higher.
-	 */
-	if (link->dpcd_caps.edp_rev >= DP_EDP_13) {
-		core_link_read_dpcd(link, DP_PSR_SUPPORT,
-			&link->dpcd_caps.psr_info.psr_version,
-			sizeof(link->dpcd_caps.psr_info.psr_version));
-		if (link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_001CF8)
-			core_link_read_dpcd(link, DP_FORCE_PSRSU_CAPABILITY,
-						&link->dpcd_caps.psr_info.force_psrsu_cap,
-						sizeof(link->dpcd_caps.psr_info.force_psrsu_cap));
-		core_link_read_dpcd(link, DP_PSR_CAPS,
-			&link->dpcd_caps.psr_info.psr_dpcd_caps.raw,
-			sizeof(link->dpcd_caps.psr_info.psr_dpcd_caps.raw));
-		if (link->dpcd_caps.psr_info.psr_dpcd_caps.bits.Y_COORDINATE_REQUIRED) {
-			core_link_read_dpcd(link, DP_PSR2_SU_Y_GRANULARITY,
-				&link->dpcd_caps.psr_info.psr2_su_y_granularity_cap,
-				sizeof(link->dpcd_caps.psr_info.psr2_su_y_granularity_cap));
-		}
+		dp_trace_link_loss_increment(link);
 	}
 
-	/*
-	 * ALPM is only valid for eDP v1.4 or higher.
+	if (link->type == dc_connection_sst_branch &&
+		hpd_irq_dpcd_data.bytes.sink_cnt.bits.SINK_COUNT
+			!= link->dpcd_sink_count)
+		status = true;
+
+	/* reasons for HPD RX:
+	 * 1. Link Loss - ie Re-train the Link
+	 * 2. MST sideband message
+	 * 3. Automated Test - ie. Internal Commit
+	 * 4. CP (copy protection) - (not interesting for DM???)
+	 * 5. DRR
+	 * 6. Downstream Port status changed
+	 * -ie. Detect - this the only one
+	 * which is interesting for DM because
+	 * it must call dc_link_detect.
 	 */
-	if (link->dpcd_caps.dpcd_rev.raw >= DP_EDP_14)
-		core_link_read_dpcd(link, DP_RECEIVER_ALPM_CAP,
-			&link->dpcd_caps.alpm_caps.raw,
-			sizeof(link->dpcd_caps.alpm_caps.raw));
+	return status;
 }
 
 static bool is_dp_phy_pattern(enum dp_test_pattern test_pattern)
@@ -3597,88 +1652,6 @@ void dp_set_fec_enable(struct dc_link *link, bool enable)
 	}
 }
 
-void dpcd_set_source_specific_data(struct dc_link *link)
-{
-	if (!link->dc->vendor_signature.is_valid) {
-		enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
-		struct dpcd_amd_signature amd_signature = {0};
-		struct dpcd_amd_device_id amd_device_id = {0};
-
-		amd_device_id.device_id_byte1 =
-				(uint8_t)(link->ctx->asic_id.chip_id);
-		amd_device_id.device_id_byte2 =
-				(uint8_t)(link->ctx->asic_id.chip_id >> 8);
-		amd_device_id.dce_version =
-				(uint8_t)(link->ctx->dce_version);
-		amd_device_id.dal_version_byte1 = 0x0; // needed? where to get?
-		amd_device_id.dal_version_byte2 = 0x0; // needed? where to get?
-
-		core_link_read_dpcd(link, DP_SOURCE_OUI,
-				(uint8_t *)(&amd_signature),
-				sizeof(amd_signature));
-
-		if (!((amd_signature.AMD_IEEE_TxSignature_byte1 == 0x0) &&
-			(amd_signature.AMD_IEEE_TxSignature_byte2 == 0x0) &&
-			(amd_signature.AMD_IEEE_TxSignature_byte3 == 0x1A))) {
-
-			amd_signature.AMD_IEEE_TxSignature_byte1 = 0x0;
-			amd_signature.AMD_IEEE_TxSignature_byte2 = 0x0;
-			amd_signature.AMD_IEEE_TxSignature_byte3 = 0x1A;
-
-			core_link_write_dpcd(link, DP_SOURCE_OUI,
-				(uint8_t *)(&amd_signature),
-				sizeof(amd_signature));
-		}
-
-		core_link_write_dpcd(link, DP_SOURCE_OUI+0x03,
-				(uint8_t *)(&amd_device_id),
-				sizeof(amd_device_id));
-
-		if (link->ctx->dce_version >= DCN_VERSION_2_0 &&
-			link->dc->caps.min_horizontal_blanking_period != 0) {
-
-			uint8_t hblank_size = (uint8_t)link->dc->caps.min_horizontal_blanking_period;
-
-			result_write_min_hblank = core_link_write_dpcd(link,
-				DP_SOURCE_MINIMUM_HBLANK_SUPPORTED, (uint8_t *)(&hblank_size),
-				sizeof(hblank_size));
-		}
-		DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_INFORMATION,
-							WPP_BIT_FLAG_DC_DETECTION_DP_CAPS,
-							"result=%u link_index=%u enum dce_version=%d DPCD=0x%04X min_hblank=%u branch_dev_id=0x%x branch_dev_name='%c%c%c%c%c%c'",
-							result_write_min_hblank,
-							link->link_index,
-							link->ctx->dce_version,
-							DP_SOURCE_MINIMUM_HBLANK_SUPPORTED,
-							link->dc->caps.min_horizontal_blanking_period,
-							link->dpcd_caps.branch_dev_id,
-							link->dpcd_caps.branch_dev_name[0],
-							link->dpcd_caps.branch_dev_name[1],
-							link->dpcd_caps.branch_dev_name[2],
-							link->dpcd_caps.branch_dev_name[3],
-							link->dpcd_caps.branch_dev_name[4],
-							link->dpcd_caps.branch_dev_name[5]);
-	} else {
-		core_link_write_dpcd(link, DP_SOURCE_OUI,
-				link->dc->vendor_signature.data.raw,
-				sizeof(link->dc->vendor_signature.data.raw));
-	}
-}
-
-void dpcd_write_cable_id_to_dprx(struct dc_link *link)
-{
-	if (!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED ||
-			link->dpcd_caps.cable_id.raw == 0 ||
-			link->dprx_states.cable_id_written)
-		return;
-
-	core_link_write_dpcd(link, DP_CABLE_ATTRIBUTES_UPDATED_BY_DPTX,
-			&link->dpcd_caps.cable_id.raw,
-			sizeof(link->dpcd_caps.cable_id.raw));
-
-	link->dprx_states.cable_id_written = 1;
-}
-
 bool dc_link_set_backlight_level_nits(struct dc_link *link,
 		bool isHDR,
 		uint32_t backlight_millinits,
@@ -3824,7 +1797,7 @@ bool is_edp_ilr_optimization_required(struct dc_link *link, struct dc_crtc_timin
 	req_bw = dc_bandwidth_in_kbps_from_timing(crtc_timing);
 
 	if (!crtc_timing->flags.DSC)
-		decide_edp_link_settings(link, &link_setting, req_bw);
+		dc_link_decide_edp_link_settings(link, &link_setting, req_bw);
 	else
 		decide_edp_link_settings_with_dsc(link, &link_setting, req_bw, LINK_RATE_UNKNOWN);
 
@@ -3839,36 +1812,6 @@ bool is_edp_ilr_optimization_required(struct dc_link *link, struct dc_crtc_timin
 }
 
 
-enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings *link_settings)
-{
-	if ((link_settings->link_rate >= LINK_RATE_LOW) &&
-			(link_settings->link_rate <= LINK_RATE_HIGH3))
-		return DP_8b_10b_ENCODING;
-	else if ((link_settings->link_rate >= LINK_RATE_UHBR10) &&
-			(link_settings->link_rate <= LINK_RATE_UHBR20))
-		return DP_128b_132b_ENCODING;
-	return DP_UNKNOWN_ENCODING;
-}
-
-enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
-{
-	struct dc_link_settings link_settings = {0};
-
-	if (!dc_is_dp_signal(link->connector_signal))
-		return DP_UNKNOWN_ENCODING;
-
-	if (link->preferred_link_setting.lane_count !=
-			LANE_COUNT_UNKNOWN &&
-			link->preferred_link_setting.link_rate !=
-					LINK_RATE_UNKNOWN) {
-		link_settings = link->preferred_link_setting;
-	} else {
-		decide_mst_link_settings(link, &link_settings);
-	}
-
-	return dp_get_link_encoding_format(&link_settings);
-}
-
 // TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
 static void get_lane_status(
 	struct dc_link *link,
@@ -4066,15 +2009,6 @@ struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
 	return avg_time_slots_per_mtp;
 }
 
-bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
-{
-	/* If this assert is hit then we have a link encoder dynamic management issue */
-	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
-	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
-			pipe_ctx->link_res.hpo_dp_link_enc &&
-			dc_is_dp_signal(pipe_ctx->stream->signal));
-}
-
 void edp_panel_backlight_power_on(struct dc_link *link, bool wait_for_hpd)
 {
 	if (link->connector_signal != SIGNAL_TYPE_EDP)
@@ -4282,7 +2216,7 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 		/* Enable DSC in encoder */
 		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
-				&& !is_dp_128b_132b_signal(pipe_ctx)) {
+				&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
 			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
 			dsc_optc_config_log(dsc, &dsc_optc_cfg);
 			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
@@ -4308,7 +2242,7 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 		/* disable DSC in stream encoder */
 		if (dc_is_dp_signal(stream->signal)) {
-			if (is_dp_128b_132b_signal(pipe_ctx))
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										false,
@@ -4390,7 +2324,7 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 		memcpy(&stream->dsc_packed_pps[0], &dsc_packed_pps[0], sizeof(stream->dsc_packed_pps));
 		if (dc_is_dp_signal(stream->signal)) {
 			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
-			if (is_dp_128b_132b_signal(pipe_ctx))
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										true,
@@ -4407,7 +2341,7 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 		/* disable DSC PPS in stream encoder */
 		memset(&stream->dsc_packed_pps[0], 0, sizeof(stream->dsc_packed_pps));
 		if (dc_is_dp_signal(stream->signal)) {
-			if (is_dp_128b_132b_signal(pipe_ctx))
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										false,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 049e755792e6..fa2ba3fc683b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -25,6 +25,7 @@
 #include "link_enc_cfg.h"
 #include "resource.h"
 #include "dc_link_dp.h"
+#include "link.h"
 
 #define DC_LOGGER dc->ctx->logger
 
@@ -48,7 +49,7 @@ static bool is_dig_link_enc_stream(struct dc_stream_state *stream)
 					/* DIGs do not support DP2.0 streams with 128b/132b encoding. */
 					struct dc_link_settings link_settings = {0};
 
-					decide_link_settings(stream, &link_settings);
+					link_decide_link_settings(stream, &link_settings);
 					if ((link_settings.link_rate >= LINK_RATE_LOW) &&
 							link_settings.link_rate <= LINK_RATE_HIGH3) {
 						is_dig_stream = true;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 06b5f49e0954..efbfb880f390 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -41,6 +41,7 @@
 #include "dpcd_defs.h"
 #include "link_enc_cfg.h"
 #include "dc_link_dp.h"
+#include "link.h"
 #include "virtual/virtual_link_hwss.h"
 #include "link/link_hwss_dio.h"
 #include "link/link_hwss_dpia.h"
@@ -2213,7 +2214,7 @@ enum dc_status dc_remove_stream_from_ctx(
 			del_pipe->stream_res.stream_enc,
 			false);
 
-	if (is_dp_128b_132b_signal(del_pipe)) {
+	if (link_is_dp_128b_132b_signal(del_pipe)) {
 		update_hpo_dp_stream_engine_usage(
 			&new_ctx->res_ctx, dc->res_pool,
 			del_pipe->stream_res.hpo_dp_stream_enc,
@@ -2513,9 +2514,9 @@ enum dc_status resource_map_pool_resources(
 	 * and link settings
 	 */
 	if (dc_is_dp_signal(stream->signal)) {
-		if (!decide_link_settings(stream, &pipe_ctx->link_config.dp_link_settings))
+		if (!link_decide_link_settings(stream, &pipe_ctx->link_config.dp_link_settings))
 			return DC_FAIL_DP_LINK_BANDWIDTH;
-		if (dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
+		if (link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
 			pipe_ctx->stream_res.hpo_dp_stream_enc =
 					find_first_free_match_hpo_dp_stream_enc_for_link(
 							&context->res_ctx, pool, stream);
@@ -3763,7 +3764,7 @@ bool get_temp_dp_link_res(struct dc_link *link,
 
 	memset(link_res, 0, sizeof(*link_res));
 
-	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		link_res->hpo_dp_link_enc = get_temp_hpo_dp_link_enc(res_ctx,
 				dc->res_pool, link);
 		if (!link_res->hpo_dp_link_enc)
@@ -3995,7 +3996,7 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 		struct dc_state *context,
 		struct pipe_ctx *pipe_ctx)
 {
-	if (dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
+	if (link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
 		if (pipe_ctx->stream_res.hpo_dp_stream_enc == NULL) {
 			pipe_ctx->stream_res.hpo_dp_stream_enc =
 					find_first_free_match_hpo_dp_stream_enc_for_link(
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index b89093e14195..63fe60dd3ea3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -584,5 +584,7 @@ int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 enum lttpr_mode dc_link_decide_lttpr_mode(struct dc_link *link,
 		struct dc_link_settings *link_setting);
 void dc_link_dp_receiver_power_ctrl(struct dc_link *link, bool on);
-
+bool dc_link_decide_edp_link_settings(struct dc_link *link,
+		struct dc_link_settings *link_setting,
+		uint32_t req_bw);
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 833a1c37cbe4..94be3ffcdea0 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1154,7 +1154,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc);
 	}
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->stop_dp_info_packets(
 					pipe_ctx->stream_res.hpo_dp_stream_enc);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal))
@@ -1165,7 +1165,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 
 	link_hwss->reset_stream_encoder(pipe_ctx);
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		dto_params.otg_inst = tg->inst;
 		dto_params.timing = &pipe_ctx->stream->timing;
 		dp_hpo_inst = pipe_ctx->stream_res.hpo_dp_stream_enc->inst;
@@ -1174,7 +1174,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 		dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst, dp_hpo_inst);
 	}
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		/* TODO: This looks like a bug to me as we are disabling HPO IO when
 		 * we are just disabling a single HPO stream. Shouldn't we disable HPO
 		 * HW control only when HPOs for all streams are disabled?
@@ -1216,7 +1216,7 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
 	}
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_blank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc);
@@ -1421,7 +1421,7 @@ static enum dc_status dce110_enable_stream_timing(
 		if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 				pipe_ctx->clock_source,
 				&pipe_ctx->stream_res.pix_clk_params,
-				dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+				link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 				&pipe_ctx->pll_settings)) {
 			BREAK_TO_DEBUGGER();
 			return DC_ERROR_UNEXPECTED;
@@ -1525,7 +1525,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
 	 * function core_link_enable_stream
 	 */
-	if (!(hws->wa.dp_hpo_and_otg_sequence && is_dp_128b_132b_signal(pipe_ctx)))
+	if (!(hws->wa.dp_hpo_and_otg_sequence && link_is_dp_128b_132b_signal(pipe_ctx)))
 		/*  */
 		/* Do not touch stream timing on seamless boot optimization. */
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
@@ -1567,7 +1567,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
 	 * function core_link_enable_stream
 	 */
-	if (hws->wa.dp_hpo_and_otg_sequence && is_dp_128b_132b_signal(pipe_ctx)) {
+	if (hws->wa.dp_hpo_and_otg_sequence && link_is_dp_128b_132b_signal(pipe_ctx)) {
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
 			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
 	}
@@ -3047,13 +3047,13 @@ void dce110_enable_dp_link_output(
 				pipes[i].clock_source->funcs->program_pix_clk(
 						pipes[i].clock_source,
 						&pipes[i].stream_res.pix_clk_params,
-						dp_get_link_encoding_format(link_settings),
+						link_dp_get_encoding_format(link_settings),
 						&pipes[i].pll_settings);
 			}
 		}
 	}
 
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
+	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 		if (dc->clk_mgr->funcs->notify_link_rate_change)
 			dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index c1d4e66b413f..0a0c930c1626 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -57,6 +57,7 @@
 #include "dc_trace.h"
 #include "dce/dmub_outbox.h"
 #include "inc/dc_link_dp.h"
+#include "link.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -920,7 +921,7 @@ enum dc_status dcn10_enable_stream_timing(
 	if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 			pipe_ctx->clock_source,
 			&pipe_ctx->stream_res.pix_clk_params,
-			dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+			link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 			&pipe_ctx->pll_settings)) {
 		BREAK_TO_DEBUGGER();
 		return DC_ERROR_UNEXPECTED;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index c2066a5057e8..6bfa16d9135f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -55,6 +55,7 @@
 #include "dpcd_defs.h"
 #include "inc/link_enc_cfg.h"
 #include "link_hwss.h"
+#include "link.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -711,7 +712,7 @@ enum dc_status dcn20_enable_stream_timing(
 	if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 			pipe_ctx->clock_source,
 			&pipe_ctx->stream_res.pix_clk_params,
-			dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+			link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 			&pipe_ctx->pll_settings)) {
 		BREAK_TO_DEBUGGER();
 		return DC_ERROR_UNEXPECTED;
@@ -2382,7 +2383,7 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 
 	params.link_settings.link_rate = link_settings->link_rate;
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_unblank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -2690,12 +2691,12 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 	unsigned int k1_div = PIXEL_RATE_DIV_NA;
 	unsigned int k2_div = PIXEL_RATE_DIV_NA;
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		if (dc->hwseq->funcs.setup_hpo_hw_control)
 			dc->hwseq->funcs.setup_hpo_hw_control(dc->hwseq, true);
 	}
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		dp_hpo_inst = pipe_ctx->stream_res.hpo_dp_stream_enc->inst;
 		dccg->funcs->set_dpstreamclk(dccg, DTBCLK0, tg->inst, dp_hpo_inst);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 3b354f0db2a5..0e1949d9ea58 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -46,6 +46,7 @@
 #include "dpcd_defs.h"
 #include "dce/dmub_outbox.h"
 #include "dc_link_dp.h"
+#include "link.h"
 #include "dcn10/dcn10_hw_sequencer.h"
 #include "inc/link_enc_cfg.h"
 #include "dcn30/dcn30_vpg.h"
@@ -414,7 +415,12 @@ void dcn31_update_info_frame(struct pipe_ctx *pipe_ctx)
 		pipe_ctx->stream_res.stream_enc->funcs->update_hdmi_info_packets(
 			pipe_ctx->stream_res.stream_enc,
 			&pipe_ctx->stream_res.encoder_info_frame);
-	else {
+	else if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->update_dp_info_packets(
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&pipe_ctx->stream_res.encoder_info_frame);
+		return;
+	} else {
 		pipe_ctx->stream_res.stream_enc->funcs->update_dp_info_packets(
 			pipe_ctx->stream_res.stream_enc,
 			&pipe_ctx->stream_res.encoder_info_frame);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index edc2c08939b0..7980462e3abe 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -47,6 +47,7 @@
 #include "dpcd_defs.h"
 #include "dce/dmub_outbox.h"
 #include "dc_link_dp.h"
+#include "link.h"
 #include "inc/dc_link_dp.h"
 #include "dcn10/dcn10_hw_sequencer.h"
 #include "inc/link_enc_cfg.h"
@@ -347,7 +348,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) || dc_is_dvi_signal(pipe_ctx->stream->signal)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 07362c66f023..478412220360 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -50,6 +50,7 @@
 #include "dmub_subvp_state.h"
 #include "dce/dmub_hw_lock_mgr.h"
 #include "dcn32_resource.h"
+#include "link.h"
 #include "dc_link_dp.h"
 #include "dmub/inc/dmub_subvp_state.h"
 
@@ -1056,7 +1057,7 @@ unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsign
 	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) || dc_is_dvi_signal(pipe_ctx->stream->signal)) {
@@ -1120,7 +1121,7 @@ void dcn32_unblank_stream(struct pipe_ctx *pipe_ctx,
 
 	params.link_settings.link_rate = link_settings->link_rate;
 
-	if (is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_unblank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -1147,7 +1148,7 @@ bool dcn32_is_dp_dig_pixel_rate_div_policy(struct pipe_ctx *pipe_ctx)
 	if (!is_h_timing_divisible_by_2(pipe_ctx->stream))
 		return false;
 
-	if (dc_is_dp_signal(pipe_ctx->stream->signal) && !is_dp_128b_132b_signal(pipe_ctx) &&
+	if (dc_is_dp_signal(pipe_ctx->stream->signal) && !link_is_dp_128b_132b_signal(pipe_ctx) &&
 		dc->debug.enable_dp_dig_pixel_rate_div_policy)
 		return true;
 	return false;
@@ -1181,7 +1182,7 @@ static void apply_symclk_on_tx_off_wa(struct dc_link *link)
 				pipe_ctx->clock_source->funcs->program_pix_clk(
 						pipe_ctx->clock_source,
 						&pipe_ctx->stream_res.pix_clk_params,
-						dp_get_link_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+						link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 						&pipe_ctx->pll_settings);
 				link->phy_state.symclk_state = SYMCLK_ON_TX_OFF;
 				break;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index c26da3bb2892..d2b89c50be2a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -32,6 +32,7 @@
 #include "dcn21/dcn21_resource.h"
 #include "clk_mgr/dcn21/rn_clk_mgr.h"
 
+#include "link.h"
 #include "dcn20_fpu.h"
 
 #define DC_LOGGER_INIT(logger)
@@ -938,7 +939,7 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (!context->res_ctx.pipe_ctx[i].stream)
 			continue;
-		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+		if (link_is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
 			return true;
 	}
 	return false;
@@ -1302,7 +1303,7 @@ int dcn20_populate_dml_pipes_from_context(
 		case SIGNAL_TYPE_DISPLAY_PORT_MST:
 		case SIGNAL_TYPE_DISPLAY_PORT:
 			pipes[pipe_cnt].dout.output_type = dm_dp;
-			if (is_dp_128b_132b_signal(&res_ctx->pipe_ctx[i]))
+			if (link_is_dp_128b_132b_signal(&res_ctx->pipe_ctx[i]))
 				pipes[pipe_cnt].dout.output_type = dm_dp2p0;
 			break;
 		case SIGNAL_TYPE_EDP:
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index f2597c966510..2e22600ad5df 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -31,6 +31,7 @@
 // We need this includes for WATERMARKS_* defines
 #include "clk_mgr/dcn32/dcn32_smu13_driver_if.h"
 #include "dcn30/dcn30_resource.h"
+#include "link.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -1263,7 +1264,7 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (!context->res_ctx.pipe_ctx[i].stream)
 			continue;
-		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+		if (link_is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
 			return true;
 	}
 	return false;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
index 31159a86b28c..52e1aad1fce8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
@@ -28,8 +28,6 @@
 
 #define LINK_TRAINING_ATTEMPTS 4
 #define LINK_TRAINING_RETRY_DELAY 50 /* ms */
-#define LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD 3200 /*us*/
-#define LINK_AUX_DEFAULT_TIMEOUT_PERIOD 552 /*us*/
 #define MAX_MTP_SLOT_COUNT 64
 #define TRAINING_AUX_RD_INTERVAL 100 //us
 #define LINK_AUX_WAKE_TIMEOUT_MS 1500 // Timeout when trying to wake unresponsive DPRX.
@@ -49,7 +47,6 @@ enum {
 	PEAK_FACTOR_X1000 = 1006,
 };
 
-struct dc_link_settings dp_get_max_link_cap(struct dc_link *link);
 
 bool dp_verify_link_cap_with_retries(
 	struct dc_link *link,
@@ -60,26 +57,11 @@ bool dp_validate_mode_timing(
 	struct dc_link *link,
 	const struct dc_crtc_timing *timing);
 
-bool decide_edp_link_settings(struct dc_link *link,
-		struct dc_link_settings *link_setting,
-		uint32_t req_bw);
-
-bool decide_link_settings(
-	struct dc_stream_state *stream,
-	struct dc_link_settings *link_setting);
-
 bool hpd_rx_irq_check_link_loss_status(struct dc_link *link,
 				       union hpd_irq_data *hpd_irq_dpcd_data);
-
-bool is_mst_supported(struct dc_link *link);
-
-bool detect_dp_sink_caps(struct dc_link *link);
-
-void detect_edp_sink_caps(struct dc_link *link);
-
-bool is_dp_active_dongle(const struct dc_link *link);
-
-bool is_dp_branch_device(const struct dc_link *link);
+enum dc_status read_hpd_rx_irq_data(
+	struct dc_link *link,
+	union hpd_irq_data *irq_data);
 
 bool is_edp_ilr_optimization_required(struct dc_link *link, struct dc_crtc_timing *crtc_timing);
 
@@ -88,10 +70,6 @@ void dp_enable_mst_on_sink(struct dc_link *link, bool enable);
 enum dp_panel_mode dp_get_panel_mode(struct dc_link *link);
 void dp_set_panel_mode(struct dc_link *link, enum dp_panel_mode panel_mode);
 
-bool dp_overwrite_extended_receiver_cap(struct dc_link *link);
-
-void dpcd_set_source_specific_data(struct dc_link *link);
-
 void dpcd_write_cable_id_to_dprx(struct dc_link *link);
 
 enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready);
@@ -108,12 +86,6 @@ void dp_decide_training_settings(
 	const struct dc_link_settings *link_setting,
 	struct link_training_settings *lt_settings);
 
-/* Convert PHY repeater count read from DPCD uint8_t. */
-uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count);
-
-enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings *link_settings);
-enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link);
-bool dp_is_lttpr_present(struct dc_link *link);
 bool dpcd_write_128b_132b_sst_payload_allocation_table(
 		const struct dc_stream_state *stream,
 		struct dc_link *link,
@@ -132,7 +104,6 @@ void disable_dp_hpo_output(struct dc_link *link,
 		const struct link_resource *link_res,
 		enum signal_type signal);
 void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
-bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
 void edp_panel_backlight_power_on(struct dc_link *link, bool wait_for_hpd);
 void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode);
 void edp_add_delay_for_T9(struct dc_link *link);
@@ -143,10 +114,4 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 		struct dc_link_settings *link_setting,
 		bool skip_video_pattern);
 
-bool decide_fallback_link_setting(
-		struct dc_link *link,
-		struct dc_link_settings *max,
-		struct dc_link_settings *cur,
-		enum link_training_result training_result);
-
 #endif /* __DC_LINK_DP_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 8774d3a39f05..3945522fb798 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -80,5 +80,13 @@ bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
 
 uint32_t link_get_aux_defer_delay(struct ddc_service *ddc);
 
+bool link_is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
+
+enum dp_link_encoding link_dp_get_encoding_format(
+		const struct dc_link_settings *link_settings);
+
+bool link_decide_link_settings(
+	struct dc_stream_state *stream,
+	struct dc_link_settings *link_setting);
 
 #endif /* __DC_LINK_HPD_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/Makefile b/drivers/gpu/drm/amd/display/dc/link/Makefile
index c2d9b3d29994..4dee0e6248b1 100644
--- a/drivers/gpu/drm/amd/display/dc/link/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/link/Makefile
@@ -26,7 +26,8 @@
 LINK = link_hwss_dio.o link_hwss_dpia.o link_hwss_hpo_dp.o link_dp_trace.o \
 link_hpd.o link_ddc.o link_dpcd.o link_dp_dpia.o link_dp_training.o \
 link_dp_training_8b_10b.o link_dp_training_128b_132b.o link_dp_training_dpia.o \
-link_dp_training_auxless.o link_dp_training_fixed_vs_pe_retimer.o link_dp_phy.o
+link_dp_training_auxless.o link_dp_training_fixed_vs_pe_retimer.o link_dp_phy.o \
+link_dp_capability.o
 
 AMD_DAL_LINK = $(addprefix $(AMDDALPATH)/dc/link/,$(LINK))
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_ddc.h b/drivers/gpu/drm/amd/display/dc/link/link_ddc.h
index 71a342d0395e..86e9d2e886d6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_ddc.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_ddc.h
@@ -32,6 +32,7 @@
 #define I2C_OVER_AUX_DEFER_WA_DELAY 70
 #define DPVGA_DONGLE_AUX_DEFER_WA_DELAY 40
 #define I2C_OVER_AUX_DEFER_WA_DELAY_1MS 1
+#define LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD 3200 /*us*/
 
 #define EDID_SEGMENT_SIZE 256
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
new file mode 100644
index 000000000000..088f4291bfbf
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
@@ -0,0 +1,2169 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements dp specific link capability retrieval sequence. It is
+ * responsible for retrieving, parsing, overriding, deciding capability obtained
+ * from dp link. Link capability consists of encoders, DPRXs, cables, retimers,
+ * usb and all other possible backend capabilities. Other components should
+ * include this header file in order to access link capability. Accessing link
+ * capability by dereferencing dc_link outside dp_link_capability is not a
+ * recommended method as it makes the component dependent on the underlying data
+ * structure used to represent link capability instead of function interfaces.
+ */
+
+#include "link_dp_capability.h"
+#include "link_ddc.h"
+#include "link_dpcd.h"
+#include "link_dp_dpia.h"
+#include "link_dp_phy.h"
+#include "link_dp_trace.h"
+#include "link_dp_training.h"
+#include "atomfirmware.h"
+#include "resource.h"
+#include "link_enc_cfg.h"
+#include "dc_link_dp.h"
+#include "dc_dmub_srv.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
+
+#ifndef MAX
+#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
+#endif
+#ifndef MIN
+#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
+#endif
+
+#define LINK_AUX_DEFAULT_TIMEOUT_PERIOD 552 /*us*/
+
+struct dp_lt_fallback_entry {
+	enum dc_lane_count lane_count;
+	enum dc_link_rate link_rate;
+};
+
+static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
+		/* This link training fallback array is ordered by
+		 * link bandwidth from highest to lowest.
+		 * DP specs makes it a normative policy to always
+		 * choose the next highest link bandwidth during
+		 * link training fallback.
+		 */
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR20},
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR20},
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR10},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH3},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR20},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR10},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH2},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH3},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR10},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH2},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH3},
+		{LANE_COUNT_FOUR, LINK_RATE_LOW},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH2},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH},
+		{LANE_COUNT_TWO, LINK_RATE_LOW},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH},
+		{LANE_COUNT_ONE, LINK_RATE_LOW},
+};
+
+static const struct dc_link_settings fail_safe_link_settings = {
+		.lane_count = LANE_COUNT_ONE,
+		.link_rate = LINK_RATE_LOW,
+		.link_spread = LINK_SPREAD_DISABLED,
+};
+
+bool is_dp_active_dongle(const struct dc_link *link)
+{
+	return (link->dpcd_caps.dongle_type >= DISPLAY_DONGLE_DP_VGA_CONVERTER) &&
+				(link->dpcd_caps.dongle_type <= DISPLAY_DONGLE_DP_HDMI_CONVERTER);
+}
+
+bool is_dp_branch_device(const struct dc_link *link)
+{
+	return link->dpcd_caps.is_branch_dev;
+}
+
+static int translate_dpcd_max_bpc(enum dpcd_downstream_port_max_bpc bpc)
+{
+	switch (bpc) {
+	case DOWN_STREAM_MAX_8BPC:
+		return 8;
+	case DOWN_STREAM_MAX_10BPC:
+		return 10;
+	case DOWN_STREAM_MAX_12BPC:
+		return 12;
+	case DOWN_STREAM_MAX_16BPC:
+		return 16;
+	default:
+		break;
+	}
+
+	return -1;
+}
+
+uint8_t dp_parse_lttpr_repeater_count(uint8_t lttpr_repeater_count)
+{
+	switch (lttpr_repeater_count) {
+	case 0x80: // 1 lttpr repeater
+		return 1;
+	case 0x40: // 2 lttpr repeaters
+		return 2;
+	case 0x20: // 3 lttpr repeaters
+		return 3;
+	case 0x10: // 4 lttpr repeaters
+		return 4;
+	case 0x08: // 5 lttpr repeaters
+		return 5;
+	case 0x04: // 6 lttpr repeaters
+		return 6;
+	case 0x02: // 7 lttpr repeaters
+		return 7;
+	case 0x01: // 8 lttpr repeaters
+		return 8;
+	default:
+		break;
+	}
+	return 0; // invalid value
+}
+
+uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw)
+{
+	switch (bw) {
+	case 0b001:
+		return 9000000;
+	case 0b010:
+		return 18000000;
+	case 0b011:
+		return 24000000;
+	case 0b100:
+		return 32000000;
+	case 0b101:
+		return 40000000;
+	case 0b110:
+		return 48000000;
+	}
+
+	return 0;
+}
+
+static enum dc_link_rate linkRateInKHzToLinkRateMultiplier(uint32_t link_rate_in_khz)
+{
+	enum dc_link_rate link_rate;
+	// LinkRate is normally stored as a multiplier of 0.27 Gbps per lane. Do the translation.
+	switch (link_rate_in_khz) {
+	case 1620000:
+		link_rate = LINK_RATE_LOW;	// Rate_1 (RBR)	- 1.62 Gbps/Lane
+		break;
+	case 2160000:
+		link_rate = LINK_RATE_RATE_2;	// Rate_2	- 2.16 Gbps/Lane
+		break;
+	case 2430000:
+		link_rate = LINK_RATE_RATE_3;	// Rate_3	- 2.43 Gbps/Lane
+		break;
+	case 2700000:
+		link_rate = LINK_RATE_HIGH;	// Rate_4 (HBR)	- 2.70 Gbps/Lane
+		break;
+	case 3240000:
+		link_rate = LINK_RATE_RBR2;	// Rate_5 (RBR2)- 3.24 Gbps/Lane
+		break;
+	case 4320000:
+		link_rate = LINK_RATE_RATE_6;	// Rate_6	- 4.32 Gbps/Lane
+		break;
+	case 5400000:
+		link_rate = LINK_RATE_HIGH2;	// Rate_7 (HBR2)- 5.40 Gbps/Lane
+		break;
+	case 8100000:
+		link_rate = LINK_RATE_HIGH3;	// Rate_8 (HBR3)- 8.10 Gbps/Lane
+		break;
+	default:
+		link_rate = LINK_RATE_UNKNOWN;
+		break;
+	}
+	return link_rate;
+}
+
+static union dp_cable_id intersect_cable_id(
+		union dp_cable_id *a, union dp_cable_id *b)
+{
+	union dp_cable_id out;
+
+	out.bits.UHBR10_20_CAPABILITY = MIN(a->bits.UHBR10_20_CAPABILITY,
+			b->bits.UHBR10_20_CAPABILITY);
+	out.bits.UHBR13_5_CAPABILITY = MIN(a->bits.UHBR13_5_CAPABILITY,
+			b->bits.UHBR13_5_CAPABILITY);
+	out.bits.CABLE_TYPE = MAX(a->bits.CABLE_TYPE, b->bits.CABLE_TYPE);
+
+	return out;
+}
+
+/*
+ * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
+ */
+static uint32_t intersect_frl_link_bw_support(
+	const uint32_t max_supported_frl_bw_in_kbps,
+	const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
+{
+	uint32_t supported_bw_in_kbps = max_supported_frl_bw_in_kbps;
+
+	// HDMI_ENCODED_LINK_BW bits are only valid if HDMI Link Configuration bit is 1 (FRL mode)
+	if (hdmi_encoded_link_bw.bits.FRL_MODE) {
+		if (hdmi_encoded_link_bw.bits.BW_48Gbps)
+			supported_bw_in_kbps = 48000000;
+		else if (hdmi_encoded_link_bw.bits.BW_40Gbps)
+			supported_bw_in_kbps = 40000000;
+		else if (hdmi_encoded_link_bw.bits.BW_32Gbps)
+			supported_bw_in_kbps = 32000000;
+		else if (hdmi_encoded_link_bw.bits.BW_24Gbps)
+			supported_bw_in_kbps = 24000000;
+		else if (hdmi_encoded_link_bw.bits.BW_18Gbps)
+			supported_bw_in_kbps = 18000000;
+		else if (hdmi_encoded_link_bw.bits.BW_9Gbps)
+			supported_bw_in_kbps = 9000000;
+	}
+
+	return supported_bw_in_kbps;
+}
+
+static enum clock_source_id get_clock_source_id(struct dc_link *link)
+{
+	enum clock_source_id dp_cs_id = CLOCK_SOURCE_ID_UNDEFINED;
+	struct clock_source *dp_cs = link->dc->res_pool->dp_clock_source;
+
+	if (dp_cs != NULL) {
+		dp_cs_id = dp_cs->id;
+	} else {
+		/*
+		 * dp clock source is not initialized for some reason.
+		 * Should not happen, CLOCK_SOURCE_ID_EXTERNAL will be used
+		 */
+		ASSERT(dp_cs);
+	}
+
+	return dp_cs_id;
+}
+
+static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
+		int length)
+{
+	int retry = 0;
+	union dp_downstream_port_present ds_port = { 0 };
+
+	if (!link->dpcd_caps.dpcd_rev.raw) {
+		do {
+			dc_link_dp_receiver_power_ctrl(link, true);
+			core_link_read_dpcd(link, DP_DPCD_REV,
+							dpcd_data, length);
+			link->dpcd_caps.dpcd_rev.raw = dpcd_data[
+				DP_DPCD_REV -
+				DP_DPCD_REV];
+		} while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
+	}
+
+	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
+				 DP_DPCD_REV];
+
+	if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
+		switch (link->dpcd_caps.branch_dev_id) {
+		/* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
+		 * all internal circuits including AUX communication preventing
+		 * reading DPCD table and EDID (spec violation).
+		 * Encoder will skip DP RX power down on disable_output to
+		 * keep receiver powered all the time.*/
+		case DP_BRANCH_DEVICE_ID_0010FA:
+		case DP_BRANCH_DEVICE_ID_0080E1:
+		case DP_BRANCH_DEVICE_ID_00E04C:
+			link->wa_flags.dp_keep_receiver_powered = true;
+			break;
+
+		/* TODO: May need work around for other dongles. */
+		default:
+			link->wa_flags.dp_keep_receiver_powered = false;
+			break;
+		}
+	} else
+		link->wa_flags.dp_keep_receiver_powered = false;
+}
+
+bool dc_link_is_fec_supported(const struct dc_link *link)
+{
+	/* TODO - use asic cap instead of link_enc->features
+	 * we no longer know which link enc to use for this link before commit
+	 */
+	struct link_encoder *link_enc = NULL;
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	return (dc_is_dp_signal(link->connector_signal) && link_enc &&
+			link_enc->features.fec_supported &&
+			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE &&
+			!IS_FPGA_MAXIMUS_DC(link->ctx->dce_environment));
+}
+
+bool dc_link_should_enable_fec(const struct dc_link *link)
+{
+	bool force_disable = false;
+
+	if (link->fec_state == dc_link_fec_enabled)
+		force_disable = false;
+	else if (link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT_MST &&
+			link->local_sink &&
+			link->local_sink->edid_caps.panel_patch.disable_fec)
+		force_disable = true;
+	else if (link->connector_signal == SIGNAL_TYPE_EDP
+			&& (link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.
+			 dsc_support.DSC_SUPPORT == false
+				|| link->panel_config.dsc.disable_dsc_edp
+				|| !link->dc->caps.edp_dsc_support))
+		force_disable = true;
+
+	return !force_disable && dc_link_is_fec_supported(link);
+}
+
+bool link_is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
+{
+	/* If this assert is hit then we have a link encoder dynamic management issue */
+	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
+	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
+			pipe_ctx->link_res.hpo_dp_link_enc &&
+			dc_is_dp_signal(pipe_ctx->stream->signal));
+}
+
+bool dp_is_lttpr_present(struct dc_link *link)
+{
+	return (dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) != 0 &&
+			link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
+			link->dpcd_caps.lttpr_caps.max_lane_count <= 4 &&
+			link->dpcd_caps.lttpr_caps.revision.raw >= 0x14);
+}
+
+/* in DP compliance test, DPR-120 may have
+ * a random value in its MAX_LINK_BW dpcd field.
+ * We map it to the maximum supported link rate that
+ * is smaller than MAX_LINK_BW in this case.
+ */
+static enum dc_link_rate get_link_rate_from_max_link_bw(
+		 uint8_t max_link_bw)
+{
+	enum dc_link_rate link_rate;
+
+	if (max_link_bw >= LINK_RATE_HIGH3) {
+		link_rate = LINK_RATE_HIGH3;
+	} else if (max_link_bw < LINK_RATE_HIGH3
+			&& max_link_bw >= LINK_RATE_HIGH2) {
+		link_rate = LINK_RATE_HIGH2;
+	} else if (max_link_bw < LINK_RATE_HIGH2
+			&& max_link_bw >= LINK_RATE_HIGH) {
+		link_rate = LINK_RATE_HIGH;
+	} else if (max_link_bw < LINK_RATE_HIGH
+			&& max_link_bw >= LINK_RATE_LOW) {
+		link_rate = LINK_RATE_LOW;
+	} else {
+		link_rate = LINK_RATE_UNKNOWN;
+	}
+
+	return link_rate;
+}
+
+static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
+{
+	enum dc_link_rate lttpr_max_link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
+
+	if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR20)
+		lttpr_max_link_rate = LINK_RATE_UHBR20;
+	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR13_5)
+		lttpr_max_link_rate = LINK_RATE_UHBR13_5;
+	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR10)
+		lttpr_max_link_rate = LINK_RATE_UHBR10;
+
+	return lttpr_max_link_rate;
+}
+
+static enum dc_link_rate get_cable_max_link_rate(struct dc_link *link)
+{
+	enum dc_link_rate cable_max_link_rate = LINK_RATE_UNKNOWN;
+
+	if (link->dpcd_caps.cable_id.bits.UHBR10_20_CAPABILITY & DP_UHBR20)
+		cable_max_link_rate = LINK_RATE_UHBR20;
+	else if (link->dpcd_caps.cable_id.bits.UHBR13_5_CAPABILITY)
+		cable_max_link_rate = LINK_RATE_UHBR13_5;
+	else if (link->dpcd_caps.cable_id.bits.UHBR10_20_CAPABILITY & DP_UHBR10)
+		cable_max_link_rate = LINK_RATE_UHBR10;
+
+	return cable_max_link_rate;
+}
+
+static inline bool reached_minimum_lane_count(enum dc_lane_count lane_count)
+{
+	return lane_count <= LANE_COUNT_ONE;
+}
+
+static inline bool reached_minimum_link_rate(enum dc_link_rate link_rate)
+{
+	return link_rate <= LINK_RATE_LOW;
+}
+
+static enum dc_lane_count reduce_lane_count(enum dc_lane_count lane_count)
+{
+	switch (lane_count) {
+	case LANE_COUNT_FOUR:
+		return LANE_COUNT_TWO;
+	case LANE_COUNT_TWO:
+		return LANE_COUNT_ONE;
+	case LANE_COUNT_ONE:
+		return LANE_COUNT_UNKNOWN;
+	default:
+		return LANE_COUNT_UNKNOWN;
+	}
+}
+
+static enum dc_link_rate reduce_link_rate(enum dc_link_rate link_rate)
+{
+	switch (link_rate) {
+	case LINK_RATE_UHBR20:
+		return LINK_RATE_UHBR13_5;
+	case LINK_RATE_UHBR13_5:
+		return LINK_RATE_UHBR10;
+	case LINK_RATE_UHBR10:
+		return LINK_RATE_HIGH3;
+	case LINK_RATE_HIGH3:
+		return LINK_RATE_HIGH2;
+	case LINK_RATE_HIGH2:
+		return LINK_RATE_HIGH;
+	case LINK_RATE_HIGH:
+		return LINK_RATE_LOW;
+	case LINK_RATE_LOW:
+		return LINK_RATE_UNKNOWN;
+	default:
+		return LINK_RATE_UNKNOWN;
+	}
+}
+
+static enum dc_lane_count increase_lane_count(enum dc_lane_count lane_count)
+{
+	switch (lane_count) {
+	case LANE_COUNT_ONE:
+		return LANE_COUNT_TWO;
+	case LANE_COUNT_TWO:
+		return LANE_COUNT_FOUR;
+	default:
+		return LANE_COUNT_UNKNOWN;
+	}
+}
+
+static enum dc_link_rate increase_link_rate(struct dc_link *link,
+		enum dc_link_rate link_rate)
+{
+	switch (link_rate) {
+	case LINK_RATE_LOW:
+		return LINK_RATE_HIGH;
+	case LINK_RATE_HIGH:
+		return LINK_RATE_HIGH2;
+	case LINK_RATE_HIGH2:
+		return LINK_RATE_HIGH3;
+	case LINK_RATE_HIGH3:
+		return LINK_RATE_UHBR10;
+	case LINK_RATE_UHBR10:
+		/* upto DP2.x specs UHBR13.5 is the only link rate that could be
+		 * not supported by DPRX when higher link rate is supported.
+		 * so we treat it as a special case for code simplicity. When we
+		 * have new specs with more link rates like this, we should
+		 * consider a more generic solution to handle discrete link
+		 * rate capabilities.
+		 */
+		return link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5 ?
+				LINK_RATE_UHBR13_5 : LINK_RATE_UHBR20;
+	case LINK_RATE_UHBR13_5:
+		return LINK_RATE_UHBR20;
+	default:
+		return LINK_RATE_UNKNOWN;
+	}
+}
+
+static bool decide_fallback_link_setting_max_bw_policy(
+		struct dc_link *link,
+		const struct dc_link_settings *max,
+		struct dc_link_settings *cur,
+		enum link_training_result training_result)
+{
+	uint8_t cur_idx = 0, next_idx;
+	bool found = false;
+
+	if (training_result == LINK_TRAINING_ABORT)
+		return false;
+
+	while (cur_idx < ARRAY_SIZE(dp_lt_fallbacks))
+		/* find current index */
+		if (dp_lt_fallbacks[cur_idx].lane_count == cur->lane_count &&
+				dp_lt_fallbacks[cur_idx].link_rate == cur->link_rate)
+			break;
+		else
+			cur_idx++;
+
+	next_idx = cur_idx + 1;
+
+	while (next_idx < ARRAY_SIZE(dp_lt_fallbacks))
+		/* find next index */
+		if (dp_lt_fallbacks[next_idx].lane_count > max->lane_count ||
+				dp_lt_fallbacks[next_idx].link_rate > max->link_rate)
+			next_idx++;
+		else if (dp_lt_fallbacks[next_idx].link_rate == LINK_RATE_UHBR13_5 &&
+				link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5 == 0)
+			/* upto DP2.x specs UHBR13.5 is the only link rate that
+			 * could be not supported by DPRX when higher link rate
+			 * is supported. so we treat it as a special case for
+			 * code simplicity. When we have new specs with more
+			 * link rates like this, we should consider a more
+			 * generic solution to handle discrete link rate
+			 * capabilities.
+			 */
+			next_idx++;
+		else
+			break;
+
+	if (next_idx < ARRAY_SIZE(dp_lt_fallbacks)) {
+		cur->lane_count = dp_lt_fallbacks[next_idx].lane_count;
+		cur->link_rate = dp_lt_fallbacks[next_idx].link_rate;
+		found = true;
+	}
+
+	return found;
+}
+
+/*
+ * function: set link rate and lane count fallback based
+ * on current link setting and last link training result
+ * return value:
+ *			true - link setting could be set
+ *			false - has reached minimum setting
+ *					and no further fallback could be done
+ */
+bool decide_fallback_link_setting(
+		struct dc_link *link,
+		struct dc_link_settings *max,
+		struct dc_link_settings *cur,
+		enum link_training_result training_result)
+{
+	if (link_dp_get_encoding_format(max) == DP_128b_132b_ENCODING ||
+			link->dc->debug.force_dp2_lt_fallback_method)
+		return decide_fallback_link_setting_max_bw_policy(link, max,
+				cur, training_result);
+
+	switch (training_result) {
+	case LINK_TRAINING_CR_FAIL_LANE0:
+	case LINK_TRAINING_CR_FAIL_LANE1:
+	case LINK_TRAINING_CR_FAIL_LANE23:
+	case LINK_TRAINING_LQA_FAIL:
+	{
+		if (!reached_minimum_link_rate(cur->link_rate)) {
+			cur->link_rate = reduce_link_rate(cur->link_rate);
+		} else if (!reached_minimum_lane_count(cur->lane_count)) {
+			cur->link_rate = max->link_rate;
+			if (training_result == LINK_TRAINING_CR_FAIL_LANE0)
+				return false;
+			else if (training_result == LINK_TRAINING_CR_FAIL_LANE1)
+				cur->lane_count = LANE_COUNT_ONE;
+			else if (training_result == LINK_TRAINING_CR_FAIL_LANE23)
+				cur->lane_count = LANE_COUNT_TWO;
+			else
+				cur->lane_count = reduce_lane_count(cur->lane_count);
+		} else {
+			return false;
+		}
+		break;
+	}
+	case LINK_TRAINING_EQ_FAIL_EQ:
+	case LINK_TRAINING_EQ_FAIL_CR_PARTIAL:
+	{
+		if (!reached_minimum_lane_count(cur->lane_count)) {
+			cur->lane_count = reduce_lane_count(cur->lane_count);
+		} else if (!reached_minimum_link_rate(cur->link_rate)) {
+			cur->link_rate = reduce_link_rate(cur->link_rate);
+			/* Reduce max link rate to avoid potential infinite loop.
+			 * Needed so that any subsequent CR_FAIL fallback can't
+			 * re-set the link rate higher than the link rate from
+			 * the latest EQ_FAIL fallback.
+			 */
+			max->link_rate = cur->link_rate;
+			cur->lane_count = max->lane_count;
+		} else {
+			return false;
+		}
+		break;
+	}
+	case LINK_TRAINING_EQ_FAIL_CR:
+	{
+		if (!reached_minimum_link_rate(cur->link_rate)) {
+			cur->link_rate = reduce_link_rate(cur->link_rate);
+			/* Reduce max link rate to avoid potential infinite loop.
+			 * Needed so that any subsequent CR_FAIL fallback can't
+			 * re-set the link rate higher than the link rate from
+			 * the latest EQ_FAIL fallback.
+			 */
+			max->link_rate = cur->link_rate;
+			cur->lane_count = max->lane_count;
+		} else {
+			return false;
+		}
+		break;
+	}
+	default:
+		return false;
+	}
+	return true;
+}
+static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_settings *link_setting, uint32_t req_bw)
+{
+	struct dc_link_settings initial_link_setting = {
+		LANE_COUNT_ONE, LINK_RATE_LOW, LINK_SPREAD_DISABLED, false, 0};
+	struct dc_link_settings current_link_setting =
+			initial_link_setting;
+	uint32_t link_bw;
+
+	if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
+		return false;
+
+	/* search for the minimum link setting that:
+	 * 1. is supported according to the link training result
+	 * 2. could support the b/w requested by the timing
+	 */
+	while (current_link_setting.link_rate <=
+			link->verified_link_cap.link_rate) {
+		link_bw = dc_link_bandwidth_kbps(
+				link,
+				&current_link_setting);
+		if (req_bw <= link_bw) {
+			*link_setting = current_link_setting;
+			return true;
+		}
+
+		if (current_link_setting.lane_count <
+				link->verified_link_cap.lane_count) {
+			current_link_setting.lane_count =
+					increase_lane_count(
+							current_link_setting.lane_count);
+		} else {
+			current_link_setting.link_rate =
+					increase_link_rate(link,
+							current_link_setting.link_rate);
+			current_link_setting.lane_count =
+					initial_link_setting.lane_count;
+		}
+	}
+
+	return false;
+}
+
+bool dc_link_decide_edp_link_settings(struct dc_link *link, struct dc_link_settings *link_setting, uint32_t req_bw)
+{
+	struct dc_link_settings initial_link_setting;
+	struct dc_link_settings current_link_setting;
+	uint32_t link_bw;
+
+	/*
+	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
+	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
+	 */
+	if (link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
+			link->dpcd_caps.edp_supported_link_rates_count == 0) {
+		*link_setting = link->verified_link_cap;
+		return true;
+	}
+
+	memset(&initial_link_setting, 0, sizeof(initial_link_setting));
+	initial_link_setting.lane_count = LANE_COUNT_ONE;
+	initial_link_setting.link_rate = link->dpcd_caps.edp_supported_link_rates[0];
+	initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
+	initial_link_setting.use_link_rate_set = true;
+	initial_link_setting.link_rate_set = 0;
+	current_link_setting = initial_link_setting;
+
+	/* search for the minimum link setting that:
+	 * 1. is supported according to the link training result
+	 * 2. could support the b/w requested by the timing
+	 */
+	while (current_link_setting.link_rate <=
+			link->verified_link_cap.link_rate) {
+		link_bw = dc_link_bandwidth_kbps(
+				link,
+				&current_link_setting);
+		if (req_bw <= link_bw) {
+			*link_setting = current_link_setting;
+			return true;
+		}
+
+		if (current_link_setting.lane_count <
+				link->verified_link_cap.lane_count) {
+			current_link_setting.lane_count =
+					increase_lane_count(
+							current_link_setting.lane_count);
+		} else {
+			if (current_link_setting.link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
+				current_link_setting.link_rate_set++;
+				current_link_setting.link_rate =
+					link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
+				current_link_setting.lane_count =
+									initial_link_setting.lane_count;
+			} else
+				break;
+		}
+	}
+	return false;
+}
+
+bool decide_edp_link_settings_with_dsc(struct dc_link *link,
+		struct dc_link_settings *link_setting,
+		uint32_t req_bw,
+		enum dc_link_rate max_link_rate)
+{
+	struct dc_link_settings initial_link_setting;
+	struct dc_link_settings current_link_setting;
+	uint32_t link_bw;
+
+	unsigned int policy = 0;
+
+	policy = link->panel_config.dsc.force_dsc_edp_policy;
+	if (max_link_rate == LINK_RATE_UNKNOWN)
+		max_link_rate = link->verified_link_cap.link_rate;
+	/*
+	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
+	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
+	 */
+	if ((link->dpcd_caps.dpcd_rev.raw < DPCD_REV_13 ||
+			link->dpcd_caps.edp_supported_link_rates_count == 0)) {
+		/* for DSC enabled case, we search for minimum lane count */
+		memset(&initial_link_setting, 0, sizeof(initial_link_setting));
+		initial_link_setting.lane_count = LANE_COUNT_ONE;
+		initial_link_setting.link_rate = LINK_RATE_LOW;
+		initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
+		initial_link_setting.use_link_rate_set = false;
+		initial_link_setting.link_rate_set = 0;
+		current_link_setting = initial_link_setting;
+		if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
+			return false;
+
+		/* search for the minimum link setting that:
+		 * 1. is supported according to the link training result
+		 * 2. could support the b/w requested by the timing
+		 */
+		while (current_link_setting.link_rate <=
+				max_link_rate) {
+			link_bw = dc_link_bandwidth_kbps(
+					link,
+					&current_link_setting);
+			if (req_bw <= link_bw) {
+				*link_setting = current_link_setting;
+				return true;
+			}
+			if (policy) {
+				/* minimize lane */
+				if (current_link_setting.link_rate < max_link_rate) {
+					current_link_setting.link_rate =
+							increase_link_rate(link,
+									current_link_setting.link_rate);
+				} else {
+					if (current_link_setting.lane_count <
+									link->verified_link_cap.lane_count) {
+						current_link_setting.lane_count =
+								increase_lane_count(
+										current_link_setting.lane_count);
+						current_link_setting.link_rate = initial_link_setting.link_rate;
+					} else
+						break;
+				}
+			} else {
+				/* minimize link rate */
+				if (current_link_setting.lane_count <
+						link->verified_link_cap.lane_count) {
+					current_link_setting.lane_count =
+							increase_lane_count(
+									current_link_setting.lane_count);
+				} else {
+					current_link_setting.link_rate =
+							increase_link_rate(link,
+									current_link_setting.link_rate);
+					current_link_setting.lane_count =
+							initial_link_setting.lane_count;
+				}
+			}
+		}
+		return false;
+	}
+
+	/* if optimize edp link is supported */
+	memset(&initial_link_setting, 0, sizeof(initial_link_setting));
+	initial_link_setting.lane_count = LANE_COUNT_ONE;
+	initial_link_setting.link_rate = link->dpcd_caps.edp_supported_link_rates[0];
+	initial_link_setting.link_spread = LINK_SPREAD_DISABLED;
+	initial_link_setting.use_link_rate_set = true;
+	initial_link_setting.link_rate_set = 0;
+	current_link_setting = initial_link_setting;
+
+	/* search for the minimum link setting that:
+	 * 1. is supported according to the link training result
+	 * 2. could support the b/w requested by the timing
+	 */
+	while (current_link_setting.link_rate <=
+			max_link_rate) {
+		link_bw = dc_link_bandwidth_kbps(
+				link,
+				&current_link_setting);
+		if (req_bw <= link_bw) {
+			*link_setting = current_link_setting;
+			return true;
+		}
+		if (policy) {
+			/* minimize lane */
+			if (current_link_setting.link_rate_set <
+					link->dpcd_caps.edp_supported_link_rates_count
+					&& current_link_setting.link_rate < max_link_rate) {
+				current_link_setting.link_rate_set++;
+				current_link_setting.link_rate =
+					link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
+			} else {
+				if (current_link_setting.lane_count < link->verified_link_cap.lane_count) {
+					current_link_setting.lane_count =
+							increase_lane_count(
+									current_link_setting.lane_count);
+					current_link_setting.link_rate_set = initial_link_setting.link_rate_set;
+					current_link_setting.link_rate =
+						link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
+				} else
+					break;
+			}
+		} else {
+			/* minimize link rate */
+			if (current_link_setting.lane_count <
+					link->verified_link_cap.lane_count) {
+				current_link_setting.lane_count =
+						increase_lane_count(
+								current_link_setting.lane_count);
+			} else {
+				if (current_link_setting.link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
+					current_link_setting.link_rate_set++;
+					current_link_setting.link_rate =
+						link->dpcd_caps.edp_supported_link_rates[current_link_setting.link_rate_set];
+					current_link_setting.lane_count =
+						initial_link_setting.lane_count;
+				} else
+					break;
+			}
+		}
+	}
+	return false;
+}
+
+static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_settings *link_setting)
+{
+	*link_setting = link->verified_link_cap;
+	return true;
+}
+
+bool link_decide_link_settings(struct dc_stream_state *stream,
+	struct dc_link_settings *link_setting)
+{
+	struct dc_link *link = stream->link;
+	uint32_t req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
+
+	memset(link_setting, 0, sizeof(*link_setting));
+
+	/* if preferred is specified through AMDDP, use it, if it's enough
+	 * to drive the mode
+	 */
+	if (link->preferred_link_setting.lane_count !=
+			LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate !=
+					LINK_RATE_UNKNOWN) {
+		*link_setting = link->preferred_link_setting;
+		return true;
+	}
+
+	/* MST doesn't perform link training for now
+	 * TODO: add MST specific link training routine
+	 */
+	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		decide_mst_link_settings(link, link_setting);
+	} else if (link->connector_signal == SIGNAL_TYPE_EDP) {
+		/* enable edp link optimization for DSC eDP case */
+		if (stream->timing.flags.DSC) {
+			enum dc_link_rate max_link_rate = LINK_RATE_UNKNOWN;
+
+			if (link->panel_config.dsc.force_dsc_edp_policy) {
+				/* calculate link max link rate cap*/
+				struct dc_link_settings tmp_link_setting;
+				struct dc_crtc_timing tmp_timing = stream->timing;
+				uint32_t orig_req_bw;
+
+				tmp_link_setting.link_rate = LINK_RATE_UNKNOWN;
+				tmp_timing.flags.DSC = 0;
+				orig_req_bw = dc_bandwidth_in_kbps_from_timing(&tmp_timing);
+				dc_link_decide_edp_link_settings(link, &tmp_link_setting, orig_req_bw);
+				max_link_rate = tmp_link_setting.link_rate;
+			}
+			decide_edp_link_settings_with_dsc(link, link_setting, req_bw, max_link_rate);
+		} else {
+			dc_link_decide_edp_link_settings(link, link_setting, req_bw);
+		}
+	} else {
+		decide_dp_link_settings(link, link_setting, req_bw);
+	}
+
+	return link_setting->lane_count != LANE_COUNT_UNKNOWN &&
+			link_setting->link_rate != LINK_RATE_UNKNOWN;
+}
+
+enum dp_link_encoding link_dp_get_encoding_format(const struct dc_link_settings *link_settings)
+{
+	if ((link_settings->link_rate >= LINK_RATE_LOW) &&
+			(link_settings->link_rate <= LINK_RATE_HIGH3))
+		return DP_8b_10b_ENCODING;
+	else if ((link_settings->link_rate >= LINK_RATE_UHBR10) &&
+			(link_settings->link_rate <= LINK_RATE_UHBR20))
+		return DP_128b_132b_ENCODING;
+	return DP_UNKNOWN_ENCODING;
+}
+
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
+{
+	struct dc_link_settings link_settings = {0};
+
+	if (!dc_is_dp_signal(link->connector_signal))
+		return DP_UNKNOWN_ENCODING;
+
+	if (link->preferred_link_setting.lane_count !=
+			LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate !=
+					LINK_RATE_UNKNOWN) {
+		link_settings = link->preferred_link_setting;
+	} else {
+		decide_mst_link_settings(link, &link_settings);
+	}
+
+	return link_dp_get_encoding_format(&link_settings);
+}
+
+static void read_dp_device_vendor_id(struct dc_link *link)
+{
+	struct dp_device_vendor_id dp_id;
+
+	/* read IEEE branch device id */
+	core_link_read_dpcd(
+		link,
+		DP_BRANCH_OUI,
+		(uint8_t *)&dp_id,
+		sizeof(dp_id));
+
+	link->dpcd_caps.branch_dev_id =
+		(dp_id.ieee_oui[0] << 16) +
+		(dp_id.ieee_oui[1] << 8) +
+		dp_id.ieee_oui[2];
+
+	memmove(
+		link->dpcd_caps.branch_dev_name,
+		dp_id.ieee_device_id,
+		sizeof(dp_id.ieee_device_id));
+}
+
+static enum dc_status wake_up_aux_channel(struct dc_link *link)
+{
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	uint32_t aux_channel_retry_cnt = 0;
+	uint8_t dpcd_power_state = '\0';
+
+	while (status != DC_OK && aux_channel_retry_cnt < 10) {
+		status = core_link_read_dpcd(link, DP_SET_POWER,
+				&dpcd_power_state, sizeof(dpcd_power_state));
+
+		/* Delay 1 ms if AUX CH is in power down state. Based on spec
+		 * section 2.3.1.2, if AUX CH may be powered down due to
+		 * write to DPCD 600h = 2. Sink AUX CH is monitoring differential
+		 * signal and may need up to 1 ms before being able to reply.
+		 */
+		if (status != DC_OK || dpcd_power_state == DP_SET_POWER_D3) {
+			udelay(1000);
+			aux_channel_retry_cnt++;
+		}
+	}
+
+	if (status != DC_OK) {
+		dpcd_power_state = DP_SET_POWER_D0;
+		status = core_link_write_dpcd(
+				link,
+				DP_SET_POWER,
+				&dpcd_power_state,
+				sizeof(dpcd_power_state));
+
+		dpcd_power_state = DP_SET_POWER_D3;
+		status = core_link_write_dpcd(
+				link,
+				DP_SET_POWER,
+				&dpcd_power_state,
+				sizeof(dpcd_power_state));
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	return DC_OK;
+}
+
+static void get_active_converter_info(
+	uint8_t data, struct dc_link *link)
+{
+	union dp_downstream_port_present ds_port = { .byte = data };
+	memset(&link->dpcd_caps.dongle_caps, 0, sizeof(link->dpcd_caps.dongle_caps));
+
+	/* decode converter info*/
+	if (!ds_port.fields.PORT_PRESENT) {
+		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
+		set_dongle_type(link->ddc,
+				link->dpcd_caps.dongle_type);
+		link->dpcd_caps.is_branch_dev = false;
+		return;
+	}
+
+	/* DPCD 0x5 bit 0 = 1, it indicate it's branch device */
+	link->dpcd_caps.is_branch_dev = ds_port.fields.PORT_PRESENT;
+
+	switch (ds_port.fields.PORT_TYPE) {
+	case DOWNSTREAM_VGA:
+		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_VGA_CONVERTER;
+		break;
+	case DOWNSTREAM_DVI_HDMI_DP_PLUS_PLUS:
+		/* At this point we don't know is it DVI or HDMI or DP++,
+		 * assume DVI.*/
+		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_DVI_CONVERTER;
+		break;
+	default:
+		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
+		break;
+	}
+
+	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_11) {
+		uint8_t det_caps[16]; /* CTS 4.2.2.7 expects source to read Detailed Capabilities Info : 00080h-0008F.*/
+		union dwnstream_port_caps_byte0 *port_caps =
+			(union dwnstream_port_caps_byte0 *)det_caps;
+		if (core_link_read_dpcd(link, DP_DOWNSTREAM_PORT_0,
+				det_caps, sizeof(det_caps)) == DC_OK) {
+
+			switch (port_caps->bits.DWN_STRM_PORTX_TYPE) {
+			/*Handle DP case as DONGLE_NONE*/
+			case DOWN_STREAM_DETAILED_DP:
+				link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
+				break;
+			case DOWN_STREAM_DETAILED_VGA:
+				link->dpcd_caps.dongle_type =
+					DISPLAY_DONGLE_DP_VGA_CONVERTER;
+				break;
+			case DOWN_STREAM_DETAILED_DVI:
+				link->dpcd_caps.dongle_type =
+					DISPLAY_DONGLE_DP_DVI_CONVERTER;
+				break;
+			case DOWN_STREAM_DETAILED_HDMI:
+			case DOWN_STREAM_DETAILED_DP_PLUS_PLUS:
+				/*Handle DP++ active converter case, process DP++ case as HDMI case according DP1.4 spec*/
+				link->dpcd_caps.dongle_type =
+					DISPLAY_DONGLE_DP_HDMI_CONVERTER;
+
+				link->dpcd_caps.dongle_caps.dongle_type = link->dpcd_caps.dongle_type;
+				if (ds_port.fields.DETAILED_CAPS) {
+
+					union dwnstream_port_caps_byte3_hdmi
+						hdmi_caps = {.raw = det_caps[3] };
+					union dwnstream_port_caps_byte2
+						hdmi_color_caps = {.raw = det_caps[2] };
+					link->dpcd_caps.dongle_caps.dp_hdmi_max_pixel_clk_in_khz =
+						det_caps[1] * 2500;
+
+					link->dpcd_caps.dongle_caps.is_dp_hdmi_s3d_converter =
+						hdmi_caps.bits.FRAME_SEQ_TO_FRAME_PACK;
+					/*YCBCR capability only for HDMI case*/
+					if (port_caps->bits.DWN_STRM_PORTX_TYPE
+							== DOWN_STREAM_DETAILED_HDMI) {
+						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr422_pass_through =
+								hdmi_caps.bits.YCrCr422_PASS_THROUGH;
+						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr420_pass_through =
+								hdmi_caps.bits.YCrCr420_PASS_THROUGH;
+						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr422_converter =
+								hdmi_caps.bits.YCrCr422_CONVERSION;
+						link->dpcd_caps.dongle_caps.is_dp_hdmi_ycbcr420_converter =
+								hdmi_caps.bits.YCrCr420_CONVERSION;
+					}
+
+					link->dpcd_caps.dongle_caps.dp_hdmi_max_bpc =
+						translate_dpcd_max_bpc(
+							hdmi_color_caps.bits.MAX_BITS_PER_COLOR_COMPONENT);
+
+					if (link->dc->caps.dp_hdmi21_pcon_support) {
+						union hdmi_encoded_link_bw hdmi_encoded_link_bw;
+
+						link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps =
+								dc_link_bw_kbps_from_raw_frl_link_rate_data(
+										hdmi_color_caps.bits.MAX_ENCODED_LINK_BW_SUPPORT);
+
+						// Intersect reported max link bw support with the supported link rate post FRL link training
+						if (core_link_read_dpcd(link, DP_PCON_HDMI_POST_FRL_STATUS,
+								&hdmi_encoded_link_bw.raw, sizeof(hdmi_encoded_link_bw)) == DC_OK) {
+							link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps = intersect_frl_link_bw_support(
+									link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps,
+									hdmi_encoded_link_bw);
+						}
+
+						if (link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps > 0)
+							link->dpcd_caps.dongle_caps.extendedCapValid = true;
+					}
+
+					if (link->dpcd_caps.dongle_caps.dp_hdmi_max_pixel_clk_in_khz != 0)
+						link->dpcd_caps.dongle_caps.extendedCapValid = true;
+				}
+
+				break;
+			}
+		}
+	}
+
+	set_dongle_type(link->ddc, link->dpcd_caps.dongle_type);
+
+	{
+		struct dp_sink_hw_fw_revision dp_hw_fw_revision;
+
+		core_link_read_dpcd(
+			link,
+			DP_BRANCH_REVISION_START,
+			(uint8_t *)&dp_hw_fw_revision,
+			sizeof(dp_hw_fw_revision));
+
+		link->dpcd_caps.branch_hw_revision =
+			dp_hw_fw_revision.ieee_hw_rev;
+
+		memmove(
+			link->dpcd_caps.branch_fw_revision,
+			dp_hw_fw_revision.ieee_fw_rev,
+			sizeof(dp_hw_fw_revision.ieee_fw_rev));
+	}
+	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14 &&
+			link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
+		union dp_dfp_cap_ext dfp_cap_ext;
+		memset(&dfp_cap_ext, '\0', sizeof (dfp_cap_ext));
+		core_link_read_dpcd(
+				link,
+				DP_DFP_CAPABILITY_EXTENSION_SUPPORT,
+				dfp_cap_ext.raw,
+				sizeof(dfp_cap_ext.raw));
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.supported = dfp_cap_ext.fields.supported;
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps =
+				dfp_cap_ext.fields.max_pixel_rate_in_mps[0] +
+				(dfp_cap_ext.fields.max_pixel_rate_in_mps[1] << 8);
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width =
+				dfp_cap_ext.fields.max_video_h_active_width[0] +
+				(dfp_cap_ext.fields.max_video_h_active_width[1] << 8);
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height =
+				dfp_cap_ext.fields.max_video_v_active_height[0] +
+				(dfp_cap_ext.fields.max_video_v_active_height[1] << 8);
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.encoding_format_caps =
+				dfp_cap_ext.fields.encoding_format_caps;
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.rgb_color_depth_caps =
+				dfp_cap_ext.fields.rgb_color_depth_caps;
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr444_color_depth_caps =
+				dfp_cap_ext.fields.ycbcr444_color_depth_caps;
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr422_color_depth_caps =
+				dfp_cap_ext.fields.ycbcr422_color_depth_caps;
+		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr420_color_depth_caps =
+				dfp_cap_ext.fields.ycbcr420_color_depth_caps;
+		DC_LOG_DP2("DFP capability extension is read at link %d", link->link_index);
+		DC_LOG_DP2("\tdfp_cap_ext.supported = %s", link->dpcd_caps.dongle_caps.dfp_cap_ext.supported ? "true" : "false");
+		DC_LOG_DP2("\tdfp_cap_ext.max_pixel_rate_in_mps = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps);
+		DC_LOG_DP2("\tdfp_cap_ext.max_video_h_active_width = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width);
+		DC_LOG_DP2("\tdfp_cap_ext.max_video_v_active_height = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height);
+	}
+}
+
+static void apply_usbc_combo_phy_reset_wa(struct dc_link *link,
+		struct dc_link_settings *link_settings)
+{
+	/* Temporary Renoir-specific workaround PHY will sometimes be in bad
+	 * state on hotplugging display from certain USB-C dongle, so add extra
+	 * cycle of enabling and disabling the PHY before first link training.
+	 */
+	struct link_resource link_res = {0};
+	enum clock_source_id dp_cs_id = get_clock_source_id(link);
+
+	dp_enable_link_phy(link, &link_res, link->connector_signal,
+			dp_cs_id, link_settings);
+	dp_disable_link_phy(link, &link_res, link->connector_signal);
+}
+
+static bool dp_overwrite_extended_receiver_cap(struct dc_link *link)
+{
+	uint8_t dpcd_data[16];
+	uint32_t read_dpcd_retry_cnt = 3;
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	union dp_downstream_port_present ds_port = { 0 };
+	union down_stream_port_count down_strm_port_count;
+	union edp_configuration_cap edp_config_cap;
+
+	int i;
+
+	for (i = 0; i < read_dpcd_retry_cnt; i++) {
+		status = core_link_read_dpcd(
+				link,
+				DP_DPCD_REV,
+				dpcd_data,
+				sizeof(dpcd_data));
+		if (status == DC_OK)
+			break;
+	}
+
+	link->dpcd_caps.dpcd_rev.raw =
+		dpcd_data[DP_DPCD_REV - DP_DPCD_REV];
+
+	if (dpcd_data[DP_MAX_LANE_COUNT - DP_DPCD_REV] == 0)
+		return false;
+
+	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
+			DP_DPCD_REV];
+
+	get_active_converter_info(ds_port.byte, link);
+
+	down_strm_port_count.raw = dpcd_data[DP_DOWN_STREAM_PORT_COUNT -
+			DP_DPCD_REV];
+
+	link->dpcd_caps.allow_invalid_MSA_timing_param =
+		down_strm_port_count.bits.IGNORE_MSA_TIMING_PARAM;
+
+	link->dpcd_caps.max_ln_count.raw = dpcd_data[
+		DP_MAX_LANE_COUNT - DP_DPCD_REV];
+
+	link->dpcd_caps.max_down_spread.raw = dpcd_data[
+		DP_MAX_DOWNSPREAD - DP_DPCD_REV];
+
+	link->reported_link_cap.lane_count =
+		link->dpcd_caps.max_ln_count.bits.MAX_LANE_COUNT;
+	link->reported_link_cap.link_rate = dpcd_data[
+		DP_MAX_LINK_RATE - DP_DPCD_REV];
+	link->reported_link_cap.link_spread =
+		link->dpcd_caps.max_down_spread.bits.MAX_DOWN_SPREAD ?
+		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
+
+	edp_config_cap.raw = dpcd_data[
+		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV];
+	link->dpcd_caps.panel_mode_edp =
+		edp_config_cap.bits.ALT_SCRAMBLER_RESET;
+	link->dpcd_caps.dpcd_display_control_capable =
+		edp_config_cap.bits.DPCD_DISPLAY_CONTROL_CAPABLE;
+
+	return true;
+}
+
+void dc_link_overwrite_extended_receiver_cap(
+		struct dc_link *link)
+{
+	dp_overwrite_extended_receiver_cap(link);
+}
+
+void dpcd_set_source_specific_data(struct dc_link *link)
+{
+	if (!link->dc->vendor_signature.is_valid) {
+		enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
+		struct dpcd_amd_signature amd_signature = {0};
+		struct dpcd_amd_device_id amd_device_id = {0};
+
+		amd_device_id.device_id_byte1 =
+				(uint8_t)(link->ctx->asic_id.chip_id);
+		amd_device_id.device_id_byte2 =
+				(uint8_t)(link->ctx->asic_id.chip_id >> 8);
+		amd_device_id.dce_version =
+				(uint8_t)(link->ctx->dce_version);
+		amd_device_id.dal_version_byte1 = 0x0; // needed? where to get?
+		amd_device_id.dal_version_byte2 = 0x0; // needed? where to get?
+
+		core_link_read_dpcd(link, DP_SOURCE_OUI,
+				(uint8_t *)(&amd_signature),
+				sizeof(amd_signature));
+
+		if (!((amd_signature.AMD_IEEE_TxSignature_byte1 == 0x0) &&
+			(amd_signature.AMD_IEEE_TxSignature_byte2 == 0x0) &&
+			(amd_signature.AMD_IEEE_TxSignature_byte3 == 0x1A))) {
+
+			amd_signature.AMD_IEEE_TxSignature_byte1 = 0x0;
+			amd_signature.AMD_IEEE_TxSignature_byte2 = 0x0;
+			amd_signature.AMD_IEEE_TxSignature_byte3 = 0x1A;
+
+			core_link_write_dpcd(link, DP_SOURCE_OUI,
+				(uint8_t *)(&amd_signature),
+				sizeof(amd_signature));
+		}
+
+		core_link_write_dpcd(link, DP_SOURCE_OUI+0x03,
+				(uint8_t *)(&amd_device_id),
+				sizeof(amd_device_id));
+
+		if (link->ctx->dce_version >= DCN_VERSION_2_0 &&
+			link->dc->caps.min_horizontal_blanking_period != 0) {
+
+			uint8_t hblank_size = (uint8_t)link->dc->caps.min_horizontal_blanking_period;
+
+			result_write_min_hblank = core_link_write_dpcd(link,
+				DP_SOURCE_MINIMUM_HBLANK_SUPPORTED, (uint8_t *)(&hblank_size),
+				sizeof(hblank_size));
+		}
+		DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_INFORMATION,
+							WPP_BIT_FLAG_DC_DETECTION_DP_CAPS,
+							"result=%u link_index=%u enum dce_version=%d DPCD=0x%04X min_hblank=%u branch_dev_id=0x%x branch_dev_name='%c%c%c%c%c%c'",
+							result_write_min_hblank,
+							link->link_index,
+							link->ctx->dce_version,
+							DP_SOURCE_MINIMUM_HBLANK_SUPPORTED,
+							link->dc->caps.min_horizontal_blanking_period,
+							link->dpcd_caps.branch_dev_id,
+							link->dpcd_caps.branch_dev_name[0],
+							link->dpcd_caps.branch_dev_name[1],
+							link->dpcd_caps.branch_dev_name[2],
+							link->dpcd_caps.branch_dev_name[3],
+							link->dpcd_caps.branch_dev_name[4],
+							link->dpcd_caps.branch_dev_name[5]);
+	} else {
+		core_link_write_dpcd(link, DP_SOURCE_OUI,
+				link->dc->vendor_signature.data.raw,
+				sizeof(link->dc->vendor_signature.data.raw));
+	}
+}
+
+void dpcd_write_cable_id_to_dprx(struct dc_link *link)
+{
+	if (!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED ||
+			link->dpcd_caps.cable_id.raw == 0 ||
+			link->dprx_states.cable_id_written)
+		return;
+
+	core_link_write_dpcd(link, DP_CABLE_ATTRIBUTES_UPDATED_BY_DPTX,
+			&link->dpcd_caps.cable_id.raw,
+			sizeof(link->dpcd_caps.cable_id.raw));
+
+	link->dprx_states.cable_id_written = 1;
+}
+
+static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
+{
+	union dmub_rb_cmd cmd;
+
+	if (!link->ctx->dmub_srv ||
+			link->ep_type != DISPLAY_ENDPOINT_PHY ||
+			link->link_enc->features.flags.bits.DP_IS_USB_C == 0)
+		return false;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.cable_id.header.type = DMUB_CMD_GET_USBC_CABLE_ID;
+	cmd.cable_id.header.payload_bytes = sizeof(cmd.cable_id.data);
+	cmd.cable_id.data.input.phy_inst = resource_transmitter_to_phy_idx(
+			link->dc, link->link_enc->transmitter);
+	if (dc_dmub_srv_cmd_with_reply_data(link->ctx->dmub_srv, &cmd) &&
+			cmd.cable_id.header.ret_status == 1) {
+		cable_id->raw = cmd.cable_id.data.output_raw;
+		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
+	}
+	return cmd.cable_id.header.ret_status == 1;
+}
+
+static void retrieve_cable_id(struct dc_link *link)
+{
+	union dp_cable_id usbc_cable_id;
+
+	link->dpcd_caps.cable_id.raw = 0;
+	core_link_read_dpcd(link, DP_CABLE_ATTRIBUTES_UPDATED_BY_DPRX,
+			&link->dpcd_caps.cable_id.raw, sizeof(uint8_t));
+
+	if (get_usbc_cable_id(link, &usbc_cable_id))
+		link->dpcd_caps.cable_id = intersect_cable_id(
+				&link->dpcd_caps.cable_id, &usbc_cable_id);
+}
+
+bool read_is_mst_supported(struct dc_link *link)
+{
+	bool mst          = false;
+	enum dc_status st = DC_OK;
+	union dpcd_rev rev;
+	union mstm_cap cap;
+
+	if (link->preferred_training_settings.mst_enable &&
+		*link->preferred_training_settings.mst_enable == false) {
+		return false;
+	}
+
+	rev.raw  = 0;
+	cap.raw  = 0;
+
+	st = core_link_read_dpcd(link, DP_DPCD_REV, &rev.raw,
+			sizeof(rev));
+
+	if (st == DC_OK && rev.raw >= DPCD_REV_12) {
+
+		st = core_link_read_dpcd(link, DP_MSTM_CAP,
+				&cap.raw, sizeof(cap));
+		if (st == DC_OK && cap.bits.MST_CAP == 1)
+			mst = true;
+	}
+	return mst;
+
+}
+
+/* Read additional sink caps defined in source specific DPCD area
+ * This function currently only reads from SinkCapability address (DP_SOURCE_SINK_CAP)
+ * TODO: Add FS caps and read from DP_SOURCE_SINK_FS_CAP as well
+ */
+static bool dpcd_read_sink_ext_caps(struct dc_link *link)
+{
+	uint8_t dpcd_data;
+
+	if (!link)
+		return false;
+
+	if (core_link_read_dpcd(link, DP_SOURCE_SINK_CAP, &dpcd_data, 1) != DC_OK)
+		return false;
+
+	link->dpcd_sink_ext_caps.raw = dpcd_data;
+	return true;
+}
+
+enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
+{
+	uint8_t lttpr_dpcd_data[8];
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	bool is_lttpr_present = false;
+
+	/* Logic to determine LTTPR support*/
+	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
+
+	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
+		return false;
+
+	/* By reading LTTPR capability, RX assumes that we will enable
+	 * LTTPR extended aux timeout if LTTPR is present.
+	 */
+	status = core_link_read_dpcd(
+			link,
+			DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
+			lttpr_dpcd_data,
+			sizeof(lttpr_dpcd_data));
+
+	link->dpcd_caps.lttpr_caps.revision.raw =
+			lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.max_link_rate =
+			lttpr_dpcd_data[DP_MAX_LINK_RATE_PHY_REPEATER -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.phy_repeater_cnt =
+			lttpr_dpcd_data[DP_PHY_REPEATER_CNT -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.max_lane_count =
+			lttpr_dpcd_data[DP_MAX_LANE_COUNT_PHY_REPEATER -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.mode =
+			lttpr_dpcd_data[DP_PHY_REPEATER_MODE -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.max_ext_timeout =
+			lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+	link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
+			lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
+			lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
+							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+
+	/* If this chip cap is set, at least one retimer must exist in the chain
+	 * Override count to 1 if we receive a known bad count (0 or an invalid value) */
+	if ((link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
+			(dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) == 0)) {
+		ASSERT(0);
+		link->dpcd_caps.lttpr_caps.phy_repeater_cnt = 0x80;
+		DC_LOG_DC("lttpr_caps forced phy_repeater_cnt = %d\n", link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	}
+
+	/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
+	is_lttpr_present = dp_is_lttpr_present(link);
+
+	if (is_lttpr_present)
+		CONN_DATA_DETECT(link, lttpr_dpcd_data, sizeof(lttpr_dpcd_data), "LTTPR Caps: ");
+
+	DC_LOG_DC("is_lttpr_present = %d\n", is_lttpr_present);
+	return status;
+}
+
+static bool retrieve_link_cap(struct dc_link *link)
+{
+	/* DP_ADAPTER_CAP - DP_DPCD_REV + 1 == 16 and also DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT + 1 == 16,
+	 * which means size 16 will be good for both of those DPCD register block reads
+	 */
+	uint8_t dpcd_data[16];
+	/*Only need to read 1 byte starting from DP_DPRX_FEATURE_ENUMERATION_LIST.
+	 */
+	uint8_t dpcd_dprx_data = '\0';
+
+	struct dp_device_vendor_id sink_id;
+	union down_stream_port_count down_strm_port_count;
+	union edp_configuration_cap edp_config_cap;
+	union dp_downstream_port_present ds_port = { 0 };
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	uint32_t read_dpcd_retry_cnt = 3;
+	int i;
+	struct dp_sink_hw_fw_revision dp_hw_fw_revision;
+	const uint32_t post_oui_delay = 30; // 30ms
+
+	memset(dpcd_data, '\0', sizeof(dpcd_data));
+	memset(&down_strm_port_count,
+		'\0', sizeof(union down_stream_port_count));
+	memset(&edp_config_cap, '\0',
+		sizeof(union edp_configuration_cap));
+
+	/* if extended timeout is supported in hardware,
+	 * default to LTTPR timeout (3.2ms) first as a W/A for DP link layer
+	 * CTS 4.2.1.1 regression introduced by CTS specs requirement update.
+	 */
+	try_to_configure_aux_timeout(link->ddc,
+			LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD);
+
+	status = dp_retrieve_lttpr_cap(link);
+
+	if (status != DC_OK) {
+		status = wake_up_aux_channel(link);
+		if (status == DC_OK)
+			dp_retrieve_lttpr_cap(link);
+		else
+			return false;
+	}
+
+	if (dp_is_lttpr_present(link))
+		configure_lttpr_mode_transparent(link);
+
+	/* Read DP tunneling information. */
+	status = dpcd_get_tunneling_device_data(link);
+
+	dpcd_set_source_specific_data(link);
+	/* Sink may need to configure internals based on vendor, so allow some
+	 * time before proceeding with possibly vendor specific transactions
+	 */
+	msleep(post_oui_delay);
+
+	for (i = 0; i < read_dpcd_retry_cnt; i++) {
+		status = core_link_read_dpcd(
+				link,
+				DP_DPCD_REV,
+				dpcd_data,
+				sizeof(dpcd_data));
+		if (status == DC_OK)
+			break;
+	}
+
+
+	if (status != DC_OK) {
+		dm_error("%s: Read receiver caps dpcd data failed.\n", __func__);
+		return false;
+	}
+
+	if (!dp_is_lttpr_present(link))
+		try_to_configure_aux_timeout(link->ddc, LINK_AUX_DEFAULT_TIMEOUT_PERIOD);
+
+
+	{
+		union training_aux_rd_interval aux_rd_interval;
+
+		aux_rd_interval.raw =
+			dpcd_data[DP_TRAINING_AUX_RD_INTERVAL];
+
+		link->dpcd_caps.ext_receiver_cap_field_present =
+				aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1 ? true:false;
+
+		if (aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1) {
+			uint8_t ext_cap_data[16];
+
+			memset(ext_cap_data, '\0', sizeof(ext_cap_data));
+			for (i = 0; i < read_dpcd_retry_cnt; i++) {
+				status = core_link_read_dpcd(
+				link,
+				DP_DP13_DPCD_REV,
+				ext_cap_data,
+				sizeof(ext_cap_data));
+				if (status == DC_OK) {
+					memcpy(dpcd_data, ext_cap_data, sizeof(dpcd_data));
+					break;
+				}
+			}
+			if (status != DC_OK)
+				dm_error("%s: Read extend caps data failed, use cap from dpcd 0.\n", __func__);
+		}
+	}
+
+	link->dpcd_caps.dpcd_rev.raw =
+			dpcd_data[DP_DPCD_REV - DP_DPCD_REV];
+
+	if (link->dpcd_caps.ext_receiver_cap_field_present) {
+		for (i = 0; i < read_dpcd_retry_cnt; i++) {
+			status = core_link_read_dpcd(
+					link,
+					DP_DPRX_FEATURE_ENUMERATION_LIST,
+					&dpcd_dprx_data,
+					sizeof(dpcd_dprx_data));
+			if (status == DC_OK)
+				break;
+		}
+
+		link->dpcd_caps.dprx_feature.raw = dpcd_dprx_data;
+
+		if (status != DC_OK)
+			dm_error("%s: Read DPRX caps data failed.\n", __func__);
+	}
+
+	else {
+		link->dpcd_caps.dprx_feature.raw = 0;
+	}
+
+
+	/* Error condition checking...
+	 * It is impossible for Sink to report Max Lane Count = 0.
+	 * It is possible for Sink to report Max Link Rate = 0, if it is
+	 * an eDP device that is reporting specialized link rates in the
+	 * SUPPORTED_LINK_RATE table.
+	 */
+	if (dpcd_data[DP_MAX_LANE_COUNT - DP_DPCD_REV] == 0)
+		return false;
+
+	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
+				 DP_DPCD_REV];
+
+	read_dp_device_vendor_id(link);
+
+	/* TODO - decouple raw mst capability from policy decision */
+	link->dpcd_caps.is_mst_capable = read_is_mst_supported(link);
+
+	get_active_converter_info(ds_port.byte, link);
+
+	dp_wa_power_up_0010FA(link, dpcd_data, sizeof(dpcd_data));
+
+	down_strm_port_count.raw = dpcd_data[DP_DOWN_STREAM_PORT_COUNT -
+				 DP_DPCD_REV];
+
+	link->dpcd_caps.allow_invalid_MSA_timing_param =
+		down_strm_port_count.bits.IGNORE_MSA_TIMING_PARAM;
+
+	link->dpcd_caps.max_ln_count.raw = dpcd_data[
+		DP_MAX_LANE_COUNT - DP_DPCD_REV];
+
+	link->dpcd_caps.max_down_spread.raw = dpcd_data[
+		DP_MAX_DOWNSPREAD - DP_DPCD_REV];
+
+	link->reported_link_cap.lane_count =
+		link->dpcd_caps.max_ln_count.bits.MAX_LANE_COUNT;
+	link->reported_link_cap.link_rate = get_link_rate_from_max_link_bw(
+			dpcd_data[DP_MAX_LINK_RATE - DP_DPCD_REV]);
+	link->reported_link_cap.link_spread =
+		link->dpcd_caps.max_down_spread.bits.MAX_DOWN_SPREAD ?
+		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
+
+	edp_config_cap.raw = dpcd_data[
+		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV];
+	link->dpcd_caps.panel_mode_edp =
+		edp_config_cap.bits.ALT_SCRAMBLER_RESET;
+	link->dpcd_caps.dpcd_display_control_capable =
+		edp_config_cap.bits.DPCD_DISPLAY_CONTROL_CAPABLE;
+	link->dpcd_caps.channel_coding_cap.raw =
+			dpcd_data[DP_MAIN_LINK_CHANNEL_CODING - DP_DPCD_REV];
+	link->test_pattern_enabled = false;
+	link->compliance_test_state.raw = 0;
+
+	/* read sink count */
+	core_link_read_dpcd(link,
+			DP_SINK_COUNT,
+			&link->dpcd_caps.sink_count.raw,
+			sizeof(link->dpcd_caps.sink_count.raw));
+
+	/* read sink ieee oui */
+	core_link_read_dpcd(link,
+			DP_SINK_OUI,
+			(uint8_t *)(&sink_id),
+			sizeof(sink_id));
+
+	link->dpcd_caps.sink_dev_id =
+			(sink_id.ieee_oui[0] << 16) +
+			(sink_id.ieee_oui[1] << 8) +
+			(sink_id.ieee_oui[2]);
+
+	memmove(
+		link->dpcd_caps.sink_dev_id_str,
+		sink_id.ieee_device_id,
+		sizeof(sink_id.ieee_device_id));
+
+	core_link_read_dpcd(
+		link,
+		DP_SINK_HW_REVISION_START,
+		(uint8_t *)&dp_hw_fw_revision,
+		sizeof(dp_hw_fw_revision));
+
+	link->dpcd_caps.sink_hw_revision =
+		dp_hw_fw_revision.ieee_hw_rev;
+
+	memmove(
+		link->dpcd_caps.sink_fw_revision,
+		dp_hw_fw_revision.ieee_fw_rev,
+		sizeof(dp_hw_fw_revision.ieee_fw_rev));
+
+	/* Quirk for Retina panels: wrong DP_MAX_LINK_RATE */
+	{
+		uint8_t str_mbp_2018[] = { 101, 68, 21, 103, 98, 97 };
+		uint8_t fwrev_mbp_2018[] = { 7, 4 };
+		uint8_t fwrev_mbp_2018_vega[] = { 8, 4 };
+
+		/* We also check for the firmware revision as 16,1 models have an
+		 * identical device id and are incorrectly quirked otherwise.
+		 */
+		if ((link->dpcd_caps.sink_dev_id == 0x0010fa) &&
+		    !memcmp(link->dpcd_caps.sink_dev_id_str, str_mbp_2018,
+			     sizeof(str_mbp_2018)) &&
+		    (!memcmp(link->dpcd_caps.sink_fw_revision, fwrev_mbp_2018,
+			     sizeof(fwrev_mbp_2018)) ||
+		    !memcmp(link->dpcd_caps.sink_fw_revision, fwrev_mbp_2018_vega,
+			     sizeof(fwrev_mbp_2018_vega)))) {
+			link->reported_link_cap.link_rate = LINK_RATE_RBR2;
+		}
+	}
+
+	memset(&link->dpcd_caps.dsc_caps, '\0',
+			sizeof(link->dpcd_caps.dsc_caps));
+	memset(&link->dpcd_caps.fec_cap, '\0', sizeof(link->dpcd_caps.fec_cap));
+	/* Read DSC and FEC sink capabilities if DP revision is 1.4 and up */
+	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14) {
+		status = core_link_read_dpcd(
+				link,
+				DP_FEC_CAPABILITY,
+				&link->dpcd_caps.fec_cap.raw,
+				sizeof(link->dpcd_caps.fec_cap.raw));
+		status = core_link_read_dpcd(
+				link,
+				DP_DSC_SUPPORT,
+				link->dpcd_caps.dsc_caps.dsc_basic_caps.raw,
+				sizeof(link->dpcd_caps.dsc_caps.dsc_basic_caps.raw));
+		if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
+			status = core_link_read_dpcd(
+					link,
+					DP_DSC_BRANCH_OVERALL_THROUGHPUT_0,
+					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw,
+					sizeof(link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw));
+			DC_LOG_DSC("DSC branch decoder capability is read at link %d", link->link_index);
+			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_0 = 0x%02x",
+					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_0);
+			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_1 = 0x%02x",
+					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_1);
+			DC_LOG_DSC("\tBRANCH_MAX_LINE_WIDTH 0x%02x",
+					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_MAX_LINE_WIDTH);
+		}
+
+		/* Apply work around to disable FEC and DSC for USB4 tunneling in TBT3 compatibility mode
+		 * only if required.
+		 */
+		if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
+				link->dc->debug.dpia_debug.bits.enable_force_tbt3_work_around &&
+				link->dpcd_caps.is_branch_dev &&
+				link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
+				link->dpcd_caps.branch_hw_revision == DP_BRANCH_HW_REV_10 &&
+				(link->dpcd_caps.fec_cap.bits.FEC_CAPABLE ||
+				link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT)) {
+			/* A TBT3 device is expected to report no support for FEC or DSC to a USB4 DPIA.
+			 * Clear FEC and DSC capabilities as a work around if that is not the case.
+			 */
+			link->wa_flags.dpia_forced_tbt3_mode = true;
+			memset(&link->dpcd_caps.dsc_caps, '\0', sizeof(link->dpcd_caps.dsc_caps));
+			memset(&link->dpcd_caps.fec_cap, '\0', sizeof(link->dpcd_caps.fec_cap));
+			DC_LOG_DSC("Clear DSC SUPPORT for USB4 link(%d) in TBT3 compatibility mode", link->link_index);
+		} else
+			link->wa_flags.dpia_forced_tbt3_mode = false;
+	}
+
+	if (!dpcd_read_sink_ext_caps(link))
+		link->dpcd_sink_ext_caps.raw = 0;
+
+	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
+		DC_LOG_DP2("128b/132b encoding is supported at link %d", link->link_index);
+
+		core_link_read_dpcd(link,
+				DP_128B132B_SUPPORTED_LINK_RATES,
+				&link->dpcd_caps.dp_128b_132b_supported_link_rates.raw,
+				sizeof(link->dpcd_caps.dp_128b_132b_supported_link_rates.raw));
+		if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR20)
+			link->reported_link_cap.link_rate = LINK_RATE_UHBR20;
+		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5)
+			link->reported_link_cap.link_rate = LINK_RATE_UHBR13_5;
+		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR10)
+			link->reported_link_cap.link_rate = LINK_RATE_UHBR10;
+		else
+			dm_error("%s: Invalid RX 128b_132b_supported_link_rates\n", __func__);
+		DC_LOG_DP2("128b/132b supported link rates is read at link %d", link->link_index);
+		DC_LOG_DP2("\tmax 128b/132b link rate support is %d.%d GHz",
+				link->reported_link_cap.link_rate / 100,
+				link->reported_link_cap.link_rate % 100);
+
+		core_link_read_dpcd(link,
+				DP_SINK_VIDEO_FALLBACK_FORMATS,
+				&link->dpcd_caps.fallback_formats.raw,
+				sizeof(link->dpcd_caps.fallback_formats.raw));
+		DC_LOG_DP2("sink video fallback format is read at link %d", link->link_index);
+		if (link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support)
+			DC_LOG_DP2("\t1920x1080@60Hz 24bpp fallback format supported");
+		if (link->dpcd_caps.fallback_formats.bits.dp_1280x720_60Hz_24bpp_support)
+			DC_LOG_DP2("\t1280x720@60Hz 24bpp fallback format supported");
+		if (link->dpcd_caps.fallback_formats.bits.dp_1024x768_60Hz_24bpp_support)
+			DC_LOG_DP2("\t1024x768@60Hz 24bpp fallback format supported");
+		if (link->dpcd_caps.fallback_formats.raw == 0) {
+			DC_LOG_DP2("\tno supported fallback formats, assume 1920x1080@60Hz 24bpp is supported");
+			link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support = 1;
+		}
+
+		core_link_read_dpcd(link,
+				DP_FEC_CAPABILITY_1,
+				&link->dpcd_caps.fec_cap1.raw,
+				sizeof(link->dpcd_caps.fec_cap1.raw));
+		DC_LOG_DP2("FEC CAPABILITY 1 is read at link %d", link->link_index);
+		if (link->dpcd_caps.fec_cap1.bits.AGGREGATED_ERROR_COUNTERS_CAPABLE)
+			DC_LOG_DP2("\tFEC aggregated error counters are supported");
+	}
+
+	retrieve_cable_id(link);
+	dpcd_write_cable_id_to_dprx(link);
+
+	/* Connectivity log: detection */
+	CONN_DATA_DETECT(link, dpcd_data, sizeof(dpcd_data), "Rx Caps: ");
+
+	return true;
+}
+
+bool detect_dp_sink_caps(struct dc_link *link)
+{
+	return retrieve_link_cap(link);
+}
+
+void detect_edp_sink_caps(struct dc_link *link)
+{
+	uint8_t supported_link_rates[16];
+	uint32_t entry;
+	uint32_t link_rate_in_khz;
+	enum dc_link_rate link_rate = LINK_RATE_UNKNOWN;
+	uint8_t backlight_adj_cap;
+	uint8_t general_edp_cap;
+
+	retrieve_link_cap(link);
+	link->dpcd_caps.edp_supported_link_rates_count = 0;
+	memset(supported_link_rates, 0, sizeof(supported_link_rates));
+
+	/*
+	 * edp_supported_link_rates_count is only valid for eDP v1.4 or higher.
+	 * Per VESA eDP spec, "The DPCD revision for eDP v1.4 is 13h"
+	 */
+	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_13 &&
+			(link->panel_config.ilr.optimize_edp_link_rate ||
+			link->reported_link_cap.link_rate == LINK_RATE_UNKNOWN)) {
+		// Read DPCD 00010h - 0001Fh 16 bytes at one shot
+		core_link_read_dpcd(link, DP_SUPPORTED_LINK_RATES,
+							supported_link_rates, sizeof(supported_link_rates));
+
+		for (entry = 0; entry < 16; entry += 2) {
+			// DPCD register reports per-lane link rate = 16-bit link rate capability
+			// value X 200 kHz. Need multiplier to find link rate in kHz.
+			link_rate_in_khz = (supported_link_rates[entry+1] * 0x100 +
+										supported_link_rates[entry]) * 200;
+
+			if (link_rate_in_khz != 0) {
+				link_rate = linkRateInKHzToLinkRateMultiplier(link_rate_in_khz);
+				link->dpcd_caps.edp_supported_link_rates[link->dpcd_caps.edp_supported_link_rates_count] = link_rate;
+				link->dpcd_caps.edp_supported_link_rates_count++;
+
+				if (link->reported_link_cap.link_rate < link_rate)
+					link->reported_link_cap.link_rate = link_rate;
+			}
+		}
+	}
+	core_link_read_dpcd(link, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP,
+						&backlight_adj_cap, sizeof(backlight_adj_cap));
+
+	link->dpcd_caps.dynamic_backlight_capable_edp =
+				(backlight_adj_cap & DP_EDP_DYNAMIC_BACKLIGHT_CAP) ? true:false;
+
+	core_link_read_dpcd(link, DP_EDP_GENERAL_CAP_1,
+						&general_edp_cap, sizeof(general_edp_cap));
+
+	link->dpcd_caps.set_power_state_capable_edp =
+				(general_edp_cap & DP_EDP_SET_POWER_CAP) ? true:false;
+
+	dc_link_set_default_brightness_aux(link);
+
+	core_link_read_dpcd(link, DP_EDP_DPCD_REV,
+		&link->dpcd_caps.edp_rev,
+		sizeof(link->dpcd_caps.edp_rev));
+	/*
+	 * PSR is only valid for eDP v1.3 or higher.
+	 */
+	if (link->dpcd_caps.edp_rev >= DP_EDP_13) {
+		core_link_read_dpcd(link, DP_PSR_SUPPORT,
+			&link->dpcd_caps.psr_info.psr_version,
+			sizeof(link->dpcd_caps.psr_info.psr_version));
+		if (link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_001CF8)
+			core_link_read_dpcd(link, DP_FORCE_PSRSU_CAPABILITY,
+						&link->dpcd_caps.psr_info.force_psrsu_cap,
+						sizeof(link->dpcd_caps.psr_info.force_psrsu_cap));
+		core_link_read_dpcd(link, DP_PSR_CAPS,
+			&link->dpcd_caps.psr_info.psr_dpcd_caps.raw,
+			sizeof(link->dpcd_caps.psr_info.psr_dpcd_caps.raw));
+		if (link->dpcd_caps.psr_info.psr_dpcd_caps.bits.Y_COORDINATE_REQUIRED) {
+			core_link_read_dpcd(link, DP_PSR2_SU_Y_GRANULARITY,
+				&link->dpcd_caps.psr_info.psr2_su_y_granularity_cap,
+				sizeof(link->dpcd_caps.psr_info.psr2_su_y_granularity_cap));
+		}
+	}
+
+	/*
+	 * ALPM is only valid for eDP v1.4 or higher.
+	 */
+	if (link->dpcd_caps.dpcd_rev.raw >= DP_EDP_14)
+		core_link_read_dpcd(link, DP_RECEIVER_ALPM_CAP,
+			&link->dpcd_caps.alpm_caps.raw,
+			sizeof(link->dpcd_caps.alpm_caps.raw));
+}
+
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
+{
+	struct link_encoder *link_enc = NULL;
+
+	if (!max_link_enc_cap) {
+		DC_LOG_ERROR("%s: Could not return max link encoder caps", __func__);
+		return false;
+	}
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	if (link_enc && link_enc->funcs->get_max_link_cap) {
+		link_enc->funcs->get_max_link_cap(link_enc, max_link_enc_cap);
+		return true;
+	}
+
+	DC_LOG_ERROR("%s: Max link encoder caps unknown", __func__);
+	max_link_enc_cap->lane_count = 1;
+	max_link_enc_cap->link_rate = 6;
+	return false;
+}
+
+const struct dc_link_settings *dc_link_get_link_cap(
+		const struct dc_link *link)
+{
+	if (link->preferred_link_setting.lane_count != LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate != LINK_RATE_UNKNOWN)
+		return &link->preferred_link_setting;
+	return &link->verified_link_cap;
+}
+
+struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
+{
+	struct dc_link_settings max_link_cap = {0};
+	enum dc_link_rate lttpr_max_link_rate;
+	enum dc_link_rate cable_max_link_rate;
+	struct link_encoder *link_enc = NULL;
+
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	/* get max link encoder capability */
+	if (link_enc)
+		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
+
+	/* Lower link settings based on sink's link cap */
+	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
+		max_link_cap.lane_count =
+				link->reported_link_cap.lane_count;
+	if (link->reported_link_cap.link_rate < max_link_cap.link_rate)
+		max_link_cap.link_rate =
+				link->reported_link_cap.link_rate;
+	if (link->reported_link_cap.link_spread <
+			max_link_cap.link_spread)
+		max_link_cap.link_spread =
+				link->reported_link_cap.link_spread;
+
+	/* Lower link settings based on cable attributes
+	 * Cable ID is a DP2 feature to identify max certified link rate that
+	 * a cable can carry. The cable identification method requires both
+	 * cable and display hardware support. Since the specs comes late, it is
+	 * anticipated that the first round of DP2 cables and displays may not
+	 * be fully compatible to reliably return cable ID data. Therefore the
+	 * decision of our cable id policy is that if the cable can return non
+	 * zero cable id data, we will take cable's link rate capability into
+	 * account. However if we get zero data, the cable link rate capability
+	 * is considered inconclusive. In this case, we will not take cable's
+	 * capability into account to avoid of over limiting hardware capability
+	 * from users. The max overall link rate capability is still determined
+	 * after actual dp pre-training. Cable id is considered as an auxiliary
+	 * method of determining max link bandwidth capability.
+	 */
+	cable_max_link_rate = get_cable_max_link_rate(link);
+
+	if (!link->dc->debug.ignore_cable_id &&
+			cable_max_link_rate != LINK_RATE_UNKNOWN &&
+			cable_max_link_rate < max_link_cap.link_rate)
+		max_link_cap.link_rate = cable_max_link_rate;
+
+	/* account for lttpr repeaters cap
+	 * notes: repeaters do not snoop in the DPRX Capabilities addresses (3.6.3).
+	 */
+	if (dp_is_lttpr_present(link)) {
+		if (link->dpcd_caps.lttpr_caps.max_lane_count < max_link_cap.lane_count)
+			max_link_cap.lane_count = link->dpcd_caps.lttpr_caps.max_lane_count;
+		lttpr_max_link_rate = get_lttpr_max_link_rate(link);
+
+		if (lttpr_max_link_rate < max_link_cap.link_rate)
+			max_link_cap.link_rate = lttpr_max_link_rate;
+
+		DC_LOG_HW_LINK_TRAINING("%s\n Training with LTTPR,  max_lane count %d max_link rate %d \n",
+						__func__,
+						max_link_cap.lane_count,
+						max_link_cap.link_rate);
+	}
+
+	if (link_dp_get_encoding_format(&max_link_cap) == DP_128b_132b_ENCODING &&
+			link->dc->debug.disable_uhbr)
+		max_link_cap.link_rate = LINK_RATE_HIGH3;
+
+	return max_link_cap;
+}
+
+static bool dp_verify_link_cap(
+	struct dc_link *link,
+	struct dc_link_settings *known_limit_link_setting,
+	int *fail_count)
+{
+	struct dc_link_settings cur_link_settings = {0};
+	struct dc_link_settings max_link_settings = *known_limit_link_setting;
+	bool success = false;
+	bool skip_video_pattern;
+	enum clock_source_id dp_cs_id = get_clock_source_id(link);
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+	union hpd_irq_data irq_data;
+	struct link_resource link_res;
+
+	memset(&irq_data, 0, sizeof(irq_data));
+	cur_link_settings = max_link_settings;
+
+	/* Grant extended timeout request */
+	if (dp_is_lttpr_present(link) && link->dpcd_caps.lttpr_caps.max_ext_timeout > 0) {
+		uint8_t grant = link->dpcd_caps.lttpr_caps.max_ext_timeout & 0x80;
+
+		core_link_write_dpcd(link, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &grant, sizeof(grant));
+	}
+
+	do {
+		if (!get_temp_dp_link_res(link, &link_res, &cur_link_settings))
+			continue;
+
+		skip_video_pattern = cur_link_settings.link_rate != LINK_RATE_LOW;
+		dp_enable_link_phy(
+				link,
+				&link_res,
+				link->connector_signal,
+				dp_cs_id,
+				&cur_link_settings);
+
+		status = dp_perform_link_training(
+				link,
+				&link_res,
+				&cur_link_settings,
+				skip_video_pattern);
+
+		if (status == LINK_TRAINING_SUCCESS) {
+			success = true;
+			udelay(1000);
+			if (read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
+					hpd_rx_irq_check_link_loss_status(
+							link,
+							&irq_data))
+				(*fail_count)++;
+
+		} else {
+			(*fail_count)++;
+		}
+		dp_trace_lt_total_count_increment(link, true);
+		dp_trace_lt_result_update(link, status, true);
+		dp_disable_link_phy(link, &link_res, link->connector_signal);
+	} while (!success && decide_fallback_link_setting(link,
+			&max_link_settings, &cur_link_settings, status));
+
+	link->verified_link_cap = success ?
+			cur_link_settings : fail_safe_link_settings;
+	return success;
+}
+
+bool dp_verify_link_cap_with_retries(
+	struct dc_link *link,
+	struct dc_link_settings *known_limit_link_setting,
+	int attempts)
+{
+	int i = 0;
+	bool success = false;
+	int fail_count = 0;
+
+	dp_trace_detect_lt_init(link);
+
+	if (link->link_enc && link->link_enc->features.flags.bits.DP_IS_USB_C &&
+			link->dc->debug.usbc_combo_phy_reset_wa)
+		apply_usbc_combo_phy_reset_wa(link, known_limit_link_setting);
+
+	dp_trace_set_lt_start_timestamp(link, false);
+	for (i = 0; i < attempts; i++) {
+		enum dc_connection_type type = dc_connection_none;
+
+		memset(&link->verified_link_cap, 0,
+				sizeof(struct dc_link_settings));
+		if (!dc_link_detect_sink(link, &type) || type == dc_connection_none) {
+			link->verified_link_cap = fail_safe_link_settings;
+			break;
+		} else if (dp_verify_link_cap(link, known_limit_link_setting,
+				&fail_count) && fail_count == 0) {
+			success = true;
+			break;
+		}
+		msleep(10);
+	}
+
+	dp_trace_lt_fail_count_update(link, fail_count, true);
+	dp_trace_set_lt_end_timestamp(link, true);
+
+	return success;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.h
new file mode 100644
index 000000000000..5500744d2e47
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.h
@@ -0,0 +1,66 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#ifndef __DC_LINK_DP_CAPABILITY_H__
+#define __DC_LINK_DP_CAPABILITY_H__
+
+#include "link.h"
+
+bool detect_dp_sink_caps(struct dc_link *link);
+
+void detect_edp_sink_caps(struct dc_link *link);
+
+struct dc_link_settings dp_get_max_link_cap(struct dc_link *link);
+
+
+enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link);
+
+/* Convert PHY repeater count read from DPCD uint8_t. */
+uint8_t dp_parse_lttpr_repeater_count(uint8_t lttpr_repeater_count);
+
+bool dp_is_lttpr_present(struct dc_link *link);
+
+bool is_dp_active_dongle(const struct dc_link *link);
+
+bool is_dp_branch_device(const struct dc_link *link);
+
+bool decide_edp_link_settings_with_dsc(struct dc_link *link,
+		struct dc_link_settings *link_setting,
+		uint32_t req_bw,
+		enum dc_link_rate max_link_rate);
+
+void dpcd_set_source_specific_data(struct dc_link *link);
+
+/*query dpcd for version and mst cap addresses*/
+bool read_is_mst_supported(struct dc_link *link);
+
+bool decide_fallback_link_setting(
+		struct dc_link *link,
+		struct dc_link_settings *max,
+		struct dc_link_settings *cur,
+		enum link_training_result training_result);
+
+
+#endif /* __DC_LINK_DP_CAPABILITY_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c
index 422365ac67e9..afe3b21335c2 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_phy.c
@@ -33,6 +33,7 @@
 #include "link_dp_phy.h"
 #include "link_dpcd.h"
 #include "link_dp_training.h"
+#include "link_dp_capability.h"
 #include "clk_mgr.h"
 #include "resource.h"
 #include "dc_link_dp.h"
@@ -117,7 +118,7 @@ void dp_disable_link_phy_mst(struct dc_link *link,
 
 static inline bool is_immediate_downstream(struct dc_link *link, uint32_t offset)
 {
-	return (dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) ==
+	return (dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) ==
 			offset);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
index 60db0939492b..e49e0258a1bd 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
@@ -39,6 +39,7 @@
 #include "link_dpcd.h"
 #include "link_dp_trace.h"
 #include "link_dp_phy.h"
+#include "link_dp_capability.h"
 #include "dc_link_dp.h"
 #include "atomfirmware.h"
 #include "link_enc_cfg.h"
@@ -342,7 +343,7 @@ void dp_hw_to_dpcd_lane_settings(
 	uint8_t lane = 0;
 
 	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING) {
 			dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET =
 					(uint8_t)(hw_lane_settings[lane].VOLTAGE_SWING);
@@ -354,7 +355,7 @@ void dp_hw_to_dpcd_lane_settings(
 			dpcd_lane_settings[lane].bits.MAX_PRE_EMPHASIS_REACHED =
 					(hw_lane_settings[lane].PRE_EMPHASIS ==
 							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
-		} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		} else if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING) {
 			dpcd_lane_settings[lane].tx_ffe.PRESET_VALUE =
 					hw_lane_settings[lane].FFE_PRESET.settings.level;
@@ -365,7 +366,7 @@ void dp_hw_to_dpcd_lane_settings(
 uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
 {
 	uint8_t link_rate = 0;
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_settings);
+	enum dp_link_encoding encoding = link_dp_get_encoding_format(link_settings);
 
 	if (encoding == DP_128b_132b_ENCODING)
 		switch (link_settings->link_rate) {
@@ -736,7 +737,7 @@ void override_training_settings(
 enum dc_dp_training_pattern decide_cr_training_pattern(
 		const struct dc_link_settings *link_settings)
 {
-	switch (dp_get_link_encoding_format(link_settings)) {
+	switch (link_dp_get_encoding_format(link_settings)) {
 	case DP_8b_10b_ENCODING:
 	default:
 		return DP_TRAINING_PATTERN_SEQUENCE_1;
@@ -757,7 +758,7 @@ enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
 	ASSERT(link_enc);
 	enc_caps = &link_enc->features;
 
-	switch (dp_get_link_encoding_format(link_settings)) {
+	switch (link_dp_get_encoding_format(link_settings)) {
 	case DP_8b_10b_ENCODING:
 		if (enc_caps->flags.bits.IS_TPS4_CAPABLE &&
 				rx_caps->max_down_spread.bits.TPS4_SUPPORTED)
@@ -781,7 +782,7 @@ enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
 enum lttpr_mode dc_link_decide_lttpr_mode(struct dc_link *link,
 		struct dc_link_settings *link_setting)
 {
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_setting);
+	enum dp_link_encoding encoding = link_dp_get_encoding_format(link_setting);
 
 	if (encoding == DP_8b_10b_ENCODING)
 		return dp_decide_8b_10b_lttpr_mode(link);
@@ -801,7 +802,7 @@ void dp_decide_lane_settings(
 	uint32_t lane;
 
 	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING) {
 			hw_lane_settings[lane].VOLTAGE_SWING =
 					(enum dc_voltage_swing)(ln_adjust[lane].bits.
@@ -809,7 +810,7 @@ void dp_decide_lane_settings(
 			hw_lane_settings[lane].PRE_EMPHASIS =
 					(enum dc_pre_emphasis)(ln_adjust[lane].bits.
 							PRE_EMPHASIS_LANE);
-		} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		} else if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING) {
 			hw_lane_settings[lane].FFE_PRESET.raw =
 					ln_adjust[lane].tx_ffe.PRESET_VALUE;
@@ -834,9 +835,9 @@ void dp_decide_training_settings(
 		const struct dc_link_settings *link_settings,
 		struct link_training_settings *lt_settings)
 {
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
+	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING)
 		decide_8b_10b_training_settings(link, link_settings, lt_settings);
-	else if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING)
+	else if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING)
 		decide_128b_132b_training_settings(link, link_settings, lt_settings);
 }
 
@@ -864,7 +865,7 @@ static enum dc_status configure_lttpr_mode_non_transparent(
 	enum dc_status result = DC_ERROR_UNEXPECTED;
 	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
 
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(&lt_settings->link_settings);
+	enum dp_link_encoding encoding = link_dp_get_encoding_format(&lt_settings->link_settings);
 
 	if (encoding == DP_8b_10b_ENCODING) {
 		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
@@ -894,7 +895,7 @@ static enum dc_status configure_lttpr_mode_non_transparent(
 		}
 
 		if (encoding == DP_8b_10b_ENCODING) {
-			repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+			repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 			/* Driver does not need to train the first hop. Skip DPCD read and clear
 			 * AUX_RD_INTERVAL for DPTX-to-DPIA hop.
@@ -977,7 +978,7 @@ enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
 		struct link_training_settings *lt_settings)
 {
 	enum dp_link_encoding encoding =
-			dp_get_link_encoding_format(
+			link_dp_get_encoding_format(
 					&lt_settings->link_settings);
 	enum dc_status status;
 
@@ -1190,7 +1191,7 @@ void dpcd_set_lt_pattern_and_lane_settings(
 		size_in_bytes);
 
 	if (is_repeater(lt_settings, offset)) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
 					" 0x%X TX_FFE_PRESET_VALUE = %x\n",
@@ -1198,7 +1199,7 @@ void dpcd_set_lt_pattern_and_lane_settings(
 					offset,
 					dpcd_base_lt_offset,
 					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		else if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING)
 		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
 				" 0x%X VS set = %x PE set = %x max VS Reached = %x  max PE Reached = %x\n",
@@ -1210,13 +1211,13 @@ void dpcd_set_lt_pattern_and_lane_settings(
 			lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
 			lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
 	} else {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
 					__func__,
 					dpcd_base_lt_offset,
 					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		else if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
 					__func__,
@@ -1242,7 +1243,7 @@ void dpcd_set_lt_pattern_and_lane_settings(
 			(uint8_t *)(lt_settings->dpcd_lane_settings),
 			size_in_bytes);
 
-	} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+	} else if (link_dp_get_encoding_format(&lt_settings->link_settings) ==
 			DP_128b_132b_ENCODING) {
 		core_link_write_dpcd(
 				link,
@@ -1467,7 +1468,7 @@ enum link_training_result dp_perform_link_training(
 	enum link_training_result status = LINK_TRAINING_SUCCESS;
 	struct link_training_settings lt_settings = {0};
 	enum dp_link_encoding encoding =
-			dp_get_link_encoding_format(link_settings);
+			link_dp_get_encoding_format(link_settings);
 
 	/* decide training settings */
 	dp_decide_training_settings(
@@ -1544,7 +1545,7 @@ bool perform_link_training_with_retries(
 	dp_trace_commit_lt_init(link);
 
 
-	if (dp_get_link_encoding_format(&cur_link_settings) == DP_8b_10b_ENCODING)
+	if (link_dp_get_encoding_format(&cur_link_settings) == DP_8b_10b_ENCODING)
 		/* We need to do this before the link training to ensure the idle
 		 * pattern in SST mode will be sent right after the link training
 		 */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
index f0811557668a..bfabebed5868 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
@@ -31,6 +31,7 @@
 #include "link_dp_training_8b_10b.h"
 #include "link_dpcd.h"
 #include "link_dp_phy.h"
+#include "link_dp_capability.h"
 #include "dc_link_dp.h"
 
 #define DC_LOGGER \
@@ -238,7 +239,7 @@ void decide_128b_132b_training_settings(struct dc_link *link,
 	lt_settings->eq_loop_count_limit = 20;
 	lt_settings->pattern_for_cds = DP_128b_132b_TPS2_CDS;
 	lt_settings->cds_pattern_time = 2500;
-	lt_settings->cds_wait_time_limit = (dp_convert_to_count(
+	lt_settings->cds_wait_time_limit = (dp_parse_lttpr_repeater_count(
 			link->dpcd_caps.lttpr_caps.phy_repeater_cnt) + 1) * 20000;
 	lt_settings->disallow_per_lane_settings = true;
 	lt_settings->lttpr_mode = dp_decide_128b_132b_lttpr_mode(link);
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
index c3eeed9303b3..ec8b619d51c5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
@@ -30,6 +30,7 @@
 #include "link_dp_training_8b_10b.h"
 #include "link_dpcd.h"
 #include "link_dp_phy.h"
+#include "link_dp_capability.h"
 #include "dc_link_dp.h"
 
 #define DC_LOGGER \
@@ -42,7 +43,7 @@ static int32_t get_cr_training_aux_rd_interval(struct dc_link *link,
 	uint32_t wait_in_micro_secs = 100;
 
 	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
+	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
 			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
 		core_link_read_dpcd(
 				link,
@@ -62,13 +63,13 @@ static uint32_t get_eq_training_aux_rd_interval(
 	union training_aux_rd_interval training_rd_interval;
 
 	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
-	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		core_link_read_dpcd(
 				link,
 				DP_128B132B_TRAINING_AUX_RD_INTERVAL,
 				(uint8_t *)&training_rd_interval,
 				sizeof(training_rd_interval));
-	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
+	} else if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
 			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
 		core_link_read_dpcd(
 				link,
@@ -229,7 +230,7 @@ enum link_training_result perform_8b_10b_clock_recovery_sequence(
 			return LINK_TRAINING_SUCCESS;
 
 		/* 6. max VS reached*/
-		if ((dp_get_link_encoding_format(&lt_settings->link_settings) ==
+		if ((link_dp_get_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING) &&
 				dp_is_max_vs_reached(lt_settings))
 			break;
@@ -237,11 +238,11 @@ enum link_training_result perform_8b_10b_clock_recovery_sequence(
 		/* 7. same lane settings*/
 		/* Note: settings are the same for all lanes,
 		 * so comparing first lane is sufficient*/
-		if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING) &&
+		if ((link_dp_get_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING) &&
 				lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
 						dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
 			retries_cr++;
-		else if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
+		else if ((link_dp_get_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
 				lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE ==
 						dpcd_lane_adjust[0].tx_ffe.PRESET_VALUE)
 			retries_cr++;
@@ -282,7 +283,7 @@ enum link_training_result perform_8b_10b_channel_equalization_sequence(
 	/* Note: also check that TPS4 is a supported feature*/
 	tr_pattern = lt_settings->pattern_for_eq;
 
-	if (is_repeater(lt_settings, offset) && dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
+	if (is_repeater(lt_settings, offset) && link_dp_get_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
 		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
 
 	dp_set_hw_training_pattern(link, link_res, tr_pattern, offset);
@@ -371,7 +372,7 @@ enum link_training_result dp_perform_8b_10b_link_training(
 		/* 2. perform link training (set link training done
 		 *  to false is done as well)
 		 */
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+		repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
 				repeater_id--) {
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
index 7f005d053595..cf47db1c2141 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
@@ -39,6 +39,7 @@
 #include "dmub/inc/dmub_cmd.h"
 #include "link_dpcd.h"
 #include "link_dp_training_8b_10b.h"
+#include "link_dp_capability.h"
 #include "dc_dmub_srv.h"
 #define DC_LOGGER \
 	link->ctx->logger
@@ -300,7 +301,7 @@ static enum link_training_result dpia_training_cr_non_transparent(
 	uint8_t set_cfg_data;
 	enum dpia_set_config_ts ts;
 
-	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 	/* Cap of LINK_TRAINING_MAX_CR_RETRY attempts at clock recovery.
 	 * Fix inherited from perform_clock_recovery_sequence() -
@@ -631,7 +632,7 @@ static enum link_training_result dpia_training_eq_non_transparent(
 	else
 		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
 
-	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 	for (retries_eq = 0; retries_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
 
@@ -900,7 +901,7 @@ static enum link_training_result dpia_training_end(
 
 	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
 
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+		repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 		if (hop == repeater_cnt) { /* DPTX-to-DPIA */
 			/* Send SET_CONFIG(SET_TRAINING:0xff) to notify DPOA that
@@ -1004,7 +1005,7 @@ enum link_training_result dc_link_dpia_perform_link_training(
 		return result;
 
 	if (lt_settings.lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+		repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 	/* Train each hop in turn starting with the one closest to DPTX.
 	 * In transparent or non-LTTPR mode, train only the final hop (DPRX).
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
index 468ac5a2557b..860b5eea89aa 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
@@ -35,6 +35,7 @@
 #include "link_dp_training_8b_10b.h"
 #include "link_dpcd.h"
 #include "link_dp_phy.h"
+#include "link_dp_capability.h"
 #include "dc_link_dp.h"
 
 #define DC_LOGGER \
@@ -46,7 +47,7 @@ void dp_fixed_vs_pe_read_lane_adjust(
 {
 	const uint8_t vendor_lttpr_write_data_vs[3] = {0x0, 0x53, 0x63};
 	const uint8_t vendor_lttpr_write_data_pe[3] = {0x0, 0x54, 0x63};
-	const uint8_t offset = dp_convert_to_count(
+	const uint8_t offset = dp_parse_lttpr_repeater_count(
 			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 	uint32_t vendor_lttpr_write_address = 0xF004F;
 	uint32_t vendor_lttpr_read_address = 0xF0053;
@@ -95,7 +96,7 @@ void dp_fixed_vs_pe_set_retimer_lane_settings(
 	const union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX],
 	uint8_t lane_count)
 {
-	const uint8_t offset = dp_convert_to_count(
+	const uint8_t offset = dp_parse_lttpr_repeater_count(
 			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
 	uint32_t vendor_lttpr_write_address = 0xF004F;
@@ -180,7 +181,7 @@ static enum link_training_result perform_fixed_vs_pe_nontransparent_training_seq
 		/* 2. perform link training (set link training done
 		 *  to false is done as well)
 		 */
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+		repeater_cnt = dp_parse_lttpr_repeater_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 
 		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
 				repeater_id--) {
@@ -229,7 +230,7 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	struct link_training_settings *lt_settings)
 {
 	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
-	const uint8_t offset = dp_convert_to_count(
+	const uint8_t offset = dp_parse_lttpr_repeater_count(
 			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 	const uint8_t vendor_lttpr_write_data_intercept_en[4] = {0x1, 0x55, 0x63, 0x0};
 	const uint8_t vendor_lttpr_write_data_intercept_dis[4] = {0x1, 0x55, 0x63, 0x68};
@@ -245,7 +246,7 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	uint8_t rate;
 
 	/* Only 8b/10b is supported */
-	ASSERT(dp_get_link_encoding_format(&lt_settings->link_settings) ==
+	ASSERT(link_dp_get_encoding_format(&lt_settings->link_settings) ==
 			DP_8b_10b_ENCODING);
 
 	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-- 
2.39.0

