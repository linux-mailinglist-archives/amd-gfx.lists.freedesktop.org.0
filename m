Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2A49FB3C
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jan 2022 15:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12110E75F;
	Fri, 28 Jan 2022 14:05:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98EC10EE77
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jan 2022 14:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUYJzSbGV+uQfGVQCKmhd4zqdnBeUjoqC/Uf/mlwtDZkHC+hY/bkXK/ZAc4mWWIAwUy7L4cjxZfm+ycF/BSc0dvMO2+NA1DPlQX9kP83V88mtnMmW+jXW1hLIDi4TP5bLPGf3AzXU/kygeWYL4B5yGJYnXI3Mub5bc9BZ2vfLAF/5Y6FBrKm5AiPC1otMeQWRioD0HSR+Judf82yqHS3QgfOHakuIdvPyI/rdZud6eLssrOPVn7dNssbaLpClaardcpsQD6fWj1l3QsXgYPA8IsB1rWW0BggWXdEwOHs3i/uQ2IFVPZWT7v13GPrGt761O3zfEAE0ZMnNvblWsNrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD+9MzZvvitx/Ink0lRir13+iCDZy5E/3d9LB5LBdrE=;
 b=Q54i4sLQO24DRzGUzIyGKs4vFNJBhxrHOLayaJ9W/71EYcyN+TVheRDAM4e/0XC0SLHP+27wBmyffvZW+fOHCQ6UvMFeUC02q2F5ut34ba2cYg4WZPua9raHD4B3tcjqo5k75aNm9pWelwtWau+dk+jFGJFgFsZASBftsJw2Mn2JMxx5DXfiozSkBRE/3xnvGytRoxhKTKjyBcuUt44Dy7nsoiiQZWl1vH5aXh10Akcn7+TrvmKuJxdGbIOeadZ95eXNVa7ZHwZH6vJK6qZ80BUQsUzTxLpET2UQh7b3EnG9YgDJyLnhl2DzOScn61ysbO5hP5tyXPkKEFnugbUwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD+9MzZvvitx/Ink0lRir13+iCDZy5E/3d9LB5LBdrE=;
 b=Cxrt9P61VEPDf72dcblwdLrGcTs804ApmBThnGd5C7ivLlWpQjRVlWfDGJ0hgHRgRv4Pv7/n+OOFZkcykx98GPDpjln2oPS7+dxCpVz4XFPU1gtxZf/7H3oIOHlz0JCRuGAL5MhQHnwknDh7C1L+0oI1ToEYGEm+OE4oTZgrkeo=
Received: from DM6PR07CA0083.namprd07.prod.outlook.com (2603:10b6:5:337::16)
 by MWHPR12MB1661.namprd12.prod.outlook.com (2603:10b6:301:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 14:05:23 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::c8) by DM6PR07CA0083.outlook.office365.com
 (2603:10b6:5:337::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Fri, 28 Jan 2022 14:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 14:05:23 +0000
Received: from stylon-T495.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 08:05:17 -0600
From: Stylon Wang <stylon.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/17] drm/amd/display: add setup/reset stream encoder to
 link_hwss
Date: Fri, 28 Jan 2022 22:04:00 +0800
Message-ID: <20220128140411.3683309-7-stylon.wang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128140411.3683309-1-stylon.wang@amd.com>
References: <20220128140411.3683309-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f2a41f-a7ad-4484-b2d5-08d9e2673a08
X-MS-TrafficTypeDiagnostic: MWHPR12MB1661:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1661F620190AA851205F4F14FF229@MWHPR12MB1661.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzOQA9dkWIWNcHrBJ5J/vxaFoV08zi+FYbI0yBM+kX5WB07BqBLFewS7VjqP+b7aYL1nkHsnpgIehWPZn56vBuyfkRUohZ+dgNgg2jGn1nhkEEErmqzXP35ov0JLTlIXjduIKn+sGbQBTuPLe2oIvUJF3511ggt7gttttZh3rqTZ/eye09DFNdpYv1IfBGkSiaEHnBXj31BdzF4oPHElknkna6zYpQ46pxtmbZKPpxKk2psw/hAjhudZK9sz8j1YTFq1284CyjdtTBX+qo71UDbsUVItAsIRDqK8iQi+ybKcFmGMkeQCYTREsyLUUikNHLgYjfPDTrQVeE8U2wVj05GZEMMEZD15W12y9dG03FvszEbLmMh72J42cbQUjhH76lcZ9pLOxjMlehlB5CtkdewORiGYKTqVVjV17p1R4azzo5U60G1XXBmbT7UGshgrTy3AV1TLuUOgSZE0MK4riIPgtwOPwQWIrkSEvAl+AGSy55ImPu+WMb4AsCgLvtEIvNufuaAFb8TaJeIQtu21kfArBprNaRqwA0MUMoTewZhikROHeUeTBVAA8EukOtm76tA/7g2usWPdzOwJ/+hhw+Xb0/n0USWyElYANQgnZxrkQfBxmg42aLFTZ4NHIoUgW/n0tPQqQetN9EOAiD3N6f6kDqzqnJFKXEPrg8Q5z6H97T5h4SLYmGxmRV6JfR1EIQslmBU77d9pyatrBOKwzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(6916009)(36860700001)(26005)(6666004)(2906002)(16526019)(186003)(2616005)(81166007)(47076005)(1076003)(316002)(36756003)(54906003)(508600001)(336012)(82310400004)(426003)(356005)(70586007)(70206006)(8676002)(4326008)(8936002)(7696005)(5660300002)(30864003)(40460700003)(44832011)(86362001)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 14:05:23.1699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f2a41f-a7ad-4484-b2d5-08d9e2673a08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1661
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
Cc: stylon.wang@amd.com, solomon.chiu@amd.com, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
Factor setup/reset stream encoder to link hwss.

Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  64 +++----
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  23 +--
 .../drm/amd/display/dc/core/dc_link_hwss.c    | 170 +++++++++++-------
 .../display/dc/dce110/dce110_hw_sequencer.c   |  44 ++---
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  40 +----
 .../gpu/drm/amd/display/dc/inc/link_hwss.h    |  22 ++-
 6 files changed, 180 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 1e596f1ea494..2c5d67abad3e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3441,7 +3441,7 @@ static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
 	struct link_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	const struct dc_link_settings empty_link_settings = {0};
-	const struct link_hwss *link_hwss = dc_link_hwss_get(link, &pipe_ctx->link_res);
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
 
 	/* slot X.Y for SST payload deallocate */
@@ -3450,9 +3450,11 @@ static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
 
 		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
 
-		link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-		if (link_hwss->set_hblank_min_symbol_width)
-			link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+		if (link_hwss->ext.set_throttled_vcp_size)
+			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
+					avg_time_slots_per_mtp);
+		if (link_hwss->ext.set_hblank_min_symbol_width)
+			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 					&empty_link_settings,
 					avg_time_slots_per_mtp);
 	}
@@ -3498,9 +3500,11 @@ static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
 
 		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
 
-		link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-		if (link_hwss->set_hblank_min_symbol_width)
-			link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+		if (link_hwss->ext.set_throttled_vcp_size)
+			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
+					avg_time_slots_per_mtp);
+		if (link_hwss->ext.set_hblank_min_symbol_width)
+			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 					&link->cur_link_settings,
 					avg_time_slots_per_mtp);
 	}
@@ -3526,7 +3530,7 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct fixed31_32 pbn_per_slot;
 	int i;
 	enum act_return_status ret;
-	const struct link_hwss *link_hwss = dc_link_hwss_get(link, &pipe_ctx->link_res);
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
 
 	/* Link encoder may have been dynamically assigned to non-physical display endpoint. */
@@ -3634,9 +3638,10 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 
 	dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
 
-	link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->set_hblank_min_symbol_width)
-		link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 				&link->cur_link_settings,
 				avg_time_slots_per_mtp);
 
@@ -3655,7 +3660,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	enum act_return_status ret;
-	const struct link_hwss *link_hwss = dc_link_hwss_get(link, &pipe_ctx->link_res);
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
 
 	/* decrease throttled vcp size */
@@ -3663,9 +3668,10 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
 	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
 
-	link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->set_hblank_min_symbol_width)
-		link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 				&link->cur_link_settings,
 				avg_time_slots_per_mtp);
 
@@ -3737,7 +3743,7 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	enum act_return_status ret;
-	const struct link_hwss *link_hwss = dc_link_hwss_get(link, &pipe_ctx->link_res);
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
 
 	/* notify immediate branch device table update */
@@ -3796,9 +3802,10 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 	pbn_per_slot = get_pbn_per_slot(stream);
 	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
 
-	link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->set_hblank_min_symbol_width)
-		link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 				&link->cur_link_settings,
 				avg_time_slots_per_mtp);
 
@@ -3815,7 +3822,7 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	int i;
 	bool mst_mode = (link->type == dc_connection_mst_branch);
-	const struct link_hwss *link_hwss = dc_link_hwss_get(link, &pipe_ctx->link_res);
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	const struct dc_link_settings empty_link_settings = {0};
 	DC_LOGGER_INIT(link->ctx->logger);
 
@@ -3834,9 +3841,10 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	 */
 
 	/* slot X.Y */
-	link_hwss->set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->set_hblank_min_symbol_width)
-		link_hwss->set_hblank_min_symbol_width(pipe_ctx,
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
 				&empty_link_settings,
 				avg_time_slots_per_mtp);
 
@@ -4004,8 +4012,8 @@ static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pi
 	struct fixed31_32 avg_time_slots_per_mtp;
 	uint8_t req_slot_count = 0;
 	uint8_t vc_id = 1; /// VC ID always 1 for SST
-
 	struct dc_link_settings link_settings = {0};
+	const struct link_hwss *link_hwss = get_link_hwss(stream->link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
 
 	decide_link_settings(stream, &link_settings);
@@ -4066,12 +4074,8 @@ static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pi
 			pipe_ctx->link_res.hpo_dp_link_enc,
 			&proposed_table);
 
-	pipe_ctx->link_res.hpo_dp_link_enc->funcs->set_throttled_vcp_size(
-			pipe_ctx->link_res.hpo_dp_link_enc,
-			pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
-			avg_time_slots_per_mtp);
-
-
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
 
 	dc->hwss.unblank_stream(pipe_ctx, &stream->link->cur_link_settings);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 117183b5ab44..f1082674bcbf 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2700,26 +2700,15 @@ bool perform_link_training_with_retries(
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
 	enum dp_panel_mode panel_mode = dp_get_panel_mode(link);
-	struct link_encoder *link_enc;
 	enum link_training_result status = LINK_TRAINING_CR_FAIL_LANE0;
 	struct dc_link_settings current_setting = *link_setting;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 
-	/* Dynamically assigned link encoders associated with stream rather than
-	 * link.
-	 */
-	if (link->is_dig_mapping_flexible && link->dc->res_pool->funcs->link_encs_assign)
-		link_enc = link_enc_cfg_get_link_enc_used_by_stream(link->ctx->dc, pipe_ctx->stream);
-	else
-		link_enc = link->link_enc;
-
-	/* We need to do this before the link training to ensure the idle pattern in SST
-	 * mode will be sent right after the link training
-	 */
-	if (dp_get_link_encoding_format(&current_setting) == DP_8b_10b_ENCODING) {
-		link_enc->funcs->connect_dig_be_to_fe(link_enc,
-							pipe_ctx->stream_res.stream_enc->id, true);
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
-	}
+	if (dp_get_link_encoding_format(&current_setting) == DP_8b_10b_ENCODING)
+		/* We need to do this before the link training to ensure the idle
+		 * pattern in SST mode will be sent right after the link training
+		 */
+		link_hwss->setup_stream_encoder(pipe_ctx);
 
 	for (j = 0; j < attempts; ++j) {
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 5e9054fdb339..c26df0a78664 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -784,54 +784,8 @@ void disable_dp_hpo_output(struct dc_link *link,
 	}
 }
 
-void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct pipe_ctx *odm_pipe;
-	int odm_combine_num_segments = 1;
-	enum phyd32clk_clock_source phyd32clk;
-
-	if (enable) {
-		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
-				odm_combine_num_segments++;
-
-		dc->res_pool->dccg->funcs->set_dpstreamclk(
-				dc->res_pool->dccg,
-				DTBCLK0,
-				pipe_ctx->stream_res.tg->inst);
-
-		phyd32clk = get_phyd32clk_src(stream->link);
-		dc->res_pool->dccg->funcs->enable_symclk32_se(
-				dc->res_pool->dccg,
-				pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
-				phyd32clk);
-
-		dc->res_pool->dccg->funcs->set_dtbclk_dto(
-				dc->res_pool->dccg,
-				pipe_ctx->stream_res.tg->inst,
-				stream->phy_pix_clk,
-				odm_combine_num_segments,
-				&stream->timing);
-	} else {
-		dc->res_pool->dccg->funcs->set_dtbclk_dto(
-				dc->res_pool->dccg,
-				pipe_ctx->stream_res.tg->inst,
-				0,
-				0,
-				&stream->timing);
-		dc->res_pool->dccg->funcs->disable_symclk32_se(
-				dc->res_pool->dccg,
-				pipe_ctx->stream_res.hpo_dp_stream_enc->inst);
-		dc->res_pool->dccg->funcs->set_dpstreamclk(
-				dc->res_pool->dccg,
-				REFCLK,
-				pipe_ctx->stream_res.tg->inst);
-	}
-}
-
-static void set_dummy_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
-		struct fixed31_32 throttled_vcp_size);
+static void virtual_setup_stream_encoder(struct pipe_ctx *pipe_ctx);
+static void virtual_reset_stream_encoder(struct pipe_ctx *pipe_ctx);
 
 /************************* below goes to dio_link_hwss ************************/
 static bool can_use_dio_link_hwss(const struct dc_link *link,
@@ -850,8 +804,48 @@ static void set_dio_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
 				throttled_vcp_size);
 }
 
+static struct link_encoder *get_dio_link_encoder(const struct dc_link *link)
+{
+	/* Link encoder may have been dynamically assigned to non-physical display endpoint. */
+	if (link->is_dig_mapping_flexible &&
+			link->dc->res_pool->funcs->link_encs_assign)
+		return link_enc_cfg_get_link_enc_used_by_link(link->ctx->dc, link);
+	else
+		return link->link_enc;
+}
+
+static void setup_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
+{
+	struct link_encoder *link_enc = get_dio_link_encoder(pipe_ctx->stream->link);
+
+	ASSERT(link_enc);
+	link_enc->funcs->connect_dig_be_to_fe(link_enc,
+			pipe_ctx->stream_res.stream_enc->id, true);
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(pipe_ctx->stream->link,
+				DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
+}
+
+static void reset_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
+{
+	struct link_encoder *link_enc = get_dio_link_encoder(pipe_ctx->stream->link);
+
+	link_enc->funcs->connect_dig_be_to_fe(
+			link_enc,
+			pipe_ctx->stream_res.stream_enc->id,
+			false);
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(pipe_ctx->stream->link,
+				DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
+
+}
+
 static const struct link_hwss dio_link_hwss = {
-	.set_throttled_vcp_size = set_dio_throttled_vcp_size,
+	.setup_stream_encoder = setup_dio_stream_encoder,
+	.reset_stream_encoder = reset_dio_stream_encoder,
+	.ext = {
+		.set_throttled_vcp_size = set_dio_throttled_vcp_size,
+	},
 };
 
 /*********************** below goes to hpo_dp_link_hwss ***********************/
@@ -895,13 +889,57 @@ static void set_dp_hpo_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
 			hblank_min_symbol_width);
 }
 
-static const struct link_hwss hpo_dp_link_hwss = {
-	.set_throttled_vcp_size = set_dp_hpo_throttled_vcp_size,
+static int get_odm_segment_count(struct pipe_ctx *pipe_ctx)
+{
+	struct pipe_ctx *odm_pipe = pipe_ctx->next_odm_pipe;
+	int count = 1;
 
-	/* function pointers below this point require check for NULL
-	 * *********************************************************************
-	 */
-	.set_hblank_min_symbol_width = set_dp_hpo_hblank_min_symbol_width,
+	while (odm_pipe != NULL) {
+		count++;
+		odm_pipe = odm_pipe->next_odm_pipe;
+	}
+
+	return count;
+}
+
+static void setup_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
+{
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
+	struct hpo_dp_link_encoder *link_enc = pipe_ctx->link_res.hpo_dp_link_enc;
+	struct dccg *dccg = dc->res_pool->dccg;
+	struct timing_generator *tg = pipe_ctx->stream_res.tg;
+	int odm_segment_count = get_odm_segment_count(pipe_ctx);
+	enum phyd32clk_clock_source phyd32clk = get_phyd32clk_src(pipe_ctx->stream->link);
+
+	dccg->funcs->set_dpstreamclk(dccg, DTBCLK0, tg->inst);
+	dccg->funcs->enable_symclk32_se(dccg, stream_enc->inst, phyd32clk);
+	dccg->funcs->set_dtbclk_dto(dccg, tg->inst, pipe_ctx->stream->phy_pix_clk,
+			odm_segment_count,
+			&pipe_ctx->stream->timing);
+	stream_enc->funcs->enable_stream(stream_enc);
+	stream_enc->funcs->map_stream_to_link(stream_enc, stream_enc->inst, link_enc->inst);
+}
+
+static void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
+{
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
+	struct dccg *dccg = dc->res_pool->dccg;
+	struct timing_generator *tg = pipe_ctx->stream_res.tg;
+
+	stream_enc->funcs->disable(stream_enc);
+	dccg->funcs->set_dtbclk_dto(dccg, tg->inst, 0, 0, &pipe_ctx->stream->timing);
+	dccg->funcs->disable_symclk32_se(dccg, stream_enc->inst);
+	dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst);
+}
+static const struct link_hwss hpo_dp_link_hwss = {
+	.setup_stream_encoder = setup_hpo_dp_stream_encoder,
+	.reset_stream_encoder = reset_hpo_dp_stream_encoder,
+	.ext = {
+		.set_throttled_vcp_size = set_dp_hpo_throttled_vcp_size,
+		.set_hblank_min_symbol_width = set_dp_hpo_hblank_min_symbol_width,
+	},
 };
 /*********************** below goes to dpia_link_hwss *************************/
 static bool can_use_dpia_link_hwss(const struct dc_link *link,
@@ -912,21 +950,27 @@ static bool can_use_dpia_link_hwss(const struct dc_link *link,
 }
 
 static const struct link_hwss dpia_link_hwss = {
-	.set_throttled_vcp_size = set_dio_throttled_vcp_size,
+	.setup_stream_encoder = setup_dio_stream_encoder,
+	.reset_stream_encoder = reset_dio_stream_encoder,
+	.ext = {
+		.set_throttled_vcp_size = set_dio_throttled_vcp_size,
+	},
 };
 
 /*********************** below goes to link_hwss ******************************/
-static void set_dummy_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
-		struct fixed31_32 throttled_vcp_size)
+static void virtual_setup_stream_encoder(struct pipe_ctx *pipe_ctx)
 {
-	return;
 }
 
-static const struct link_hwss dummy_link_hwss = {
-	.set_throttled_vcp_size = set_dummy_throttled_vcp_size,
+static void virtual_reset_stream_encoder(struct pipe_ctx *pipe_ctx)
+{
+}
+static const struct link_hwss virtual_link_hwss = {
+	.setup_stream_encoder = virtual_setup_stream_encoder,
+	.reset_stream_encoder = virtual_reset_stream_encoder,
 };
 
-const struct link_hwss *dc_link_hwss_get(const struct dc_link *link,
+const struct link_hwss *get_link_hwss(const struct dc_link *link,
 		const struct link_resource *link_res)
 {
 	if (can_use_dp_hpo_link_hwss(link, link_res))
@@ -953,7 +997,7 @@ const struct link_hwss *dc_link_hwss_get(const struct dc_link *link,
 	else if (can_use_dio_link_hwss(link, link_res))
 		return &dio_link_hwss;
 	else
-		return &dummy_link_hwss;
+		return &virtual_link_hwss;
 }
 
 #undef DC_LOGGER
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index f28d6c15a4e2..8c32b9cb3b49 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -667,17 +667,12 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx)
 	struct dc_crtc_timing *timing = &pipe_ctx->stream->timing;
 	struct dc_link *link = pipe_ctx->stream->link;
 	const struct dc *dc = link->dc;
-
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	uint32_t active_total_with_borders;
 	uint32_t early_control = 0;
 	struct timing_generator *tg = pipe_ctx->stream_res.tg;
 
-	/* For MST, there are multiply stream go to only one link.
-	 * connect DIG back_end to front_end while enable_stream and
-	 * disconnect them during disable_stream
-	 * BY this, it is logic clean to separate stream and link */
-	link->link_enc->funcs->connect_dig_be_to_fe(link->link_enc,
-						    pipe_ctx->stream_res.stream_enc->id, true);
+	link_hwss->setup_stream_encoder(pipe_ctx);
 
 	dc->hwss.update_info_frame(pipe_ctx);
 
@@ -1178,7 +1173,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
 	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct link_encoder *link_enc = NULL;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 
 	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal)) {
 		pipe_ctx->stream_res.stream_enc->funcs->stop_hdmi_info_packets(
@@ -1196,34 +1191,17 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 
 	dc->hwss.disable_audio_stream(pipe_ctx);
 
-	/* Link encoder may have been dynamically assigned to non-physical display endpoint. */
-	if (link->ep_type == DISPLAY_ENDPOINT_PHY)
-		link_enc = link->link_enc;
-	else if (dc->res_pool->funcs->link_encs_assign)
-		link_enc = link_enc_cfg_get_link_enc_used_by_link(link->ctx->dc, link);
-	ASSERT(link_enc);
+	link_hwss->reset_stream_encoder(pipe_ctx);
 
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
-		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->disable(
-				pipe_ctx->stream_res.hpo_dp_stream_enc);
-		setup_dp_hpo_stream(pipe_ctx, false);
-	/* TODO - DP2.0 HW: unmap stream from link encoder here */
-	} else {
-		if (link_enc)
-			link_enc->funcs->connect_dig_be_to_fe(
-				link_enc,
-				pipe_ctx->stream_res.stream_enc->id,
-				false);
+		/* TODO: This looks like a bug to me as we are disabling HPO IO when
+		 * we are just disabling a single HPO stream. Shouldn't we disable HPO
+		 * HW control only when HPOs for all streams are disabled?
+		 */
+		if (pipe_ctx->stream->ctx->dc->hwseq->funcs.setup_hpo_hw_control)
+			pipe_ctx->stream->ctx->dc->hwseq->funcs.setup_hpo_hw_control(
+					pipe_ctx->stream->ctx->dc->hwseq, false);
 	}
-
-	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (dc->hwseq->funcs.setup_hpo_hw_control && is_dp_128b_132b_signal(pipe_ctx))
-		dc->hwseq->funcs.setup_hpo_hw_control(dc->hwseq, false);
-#endif
-
 }
 
 void dce110_unblank_stream(struct pipe_ctx *pipe_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 4991e93e5308..013b94c41327 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2390,46 +2390,22 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 	uint32_t active_total_with_borders;
 	uint32_t early_control = 0;
 	struct timing_generator *tg = pipe_ctx->stream_res.tg;
-	struct link_encoder *link_enc;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
 
-	if (link->is_dig_mapping_flexible &&
-			link->dc->res_pool->funcs->link_encs_assign)
-		link_enc = link_enc_cfg_get_link_enc_used_by_stream(link->ctx->dc, pipe_ctx->stream);
-	else
-		link_enc = link->link_enc;
-	ASSERT(link_enc);
-
-	/* For MST, there are multiply stream go to only one link.
-	 * connect DIG back_end to front_end while enable_stream and
-	 * disconnect them during disable_stream
-	 * BY this, it is logic clean to separate stream and link
-	 */
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
-		if (pipe_ctx->stream->ctx->dc->hwseq->funcs.setup_hpo_hw_control)
-			pipe_ctx->stream->ctx->dc->hwseq->funcs.setup_hpo_hw_control(
-				pipe_ctx->stream->ctx->dc->hwseq, true);
-		setup_dp_hpo_stream(pipe_ctx, true);
-		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->enable_stream(
-				pipe_ctx->stream_res.hpo_dp_stream_enc);
-		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->map_stream_to_link(
-				pipe_ctx->stream_res.hpo_dp_stream_enc,
-				pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
-				pipe_ctx->link_res.hpo_dp_link_enc->inst);
+		if (dc->hwseq->funcs.setup_hpo_hw_control)
+			dc->hwseq->funcs.setup_hpo_hw_control(dc->hwseq, true);
 	}
 
-	if (!is_dp_128b_132b_signal(pipe_ctx) && link_enc)
-		link_enc->funcs->connect_dig_be_to_fe(
-			link_enc, pipe_ctx->stream_res.stream_enc->id, true);
-
-	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
+	link_hwss->setup_stream_encoder(pipe_ctx);
 
 	if (pipe_ctx->plane_state && pipe_ctx->plane_state->flip_immediate != 1) {
-		if (link->dc->hwss.program_dmdata_engine)
-			link->dc->hwss.program_dmdata_engine(pipe_ctx);
+		if (dc->hwss.program_dmdata_engine)
+			dc->hwss.program_dmdata_engine(pipe_ctx);
 	}
 
-	link->dc->hwss.update_info_frame(pipe_ctx);
+	dc->hwss.update_info_frame(pipe_ctx);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
 		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
index 5b361924ed8f..e9cad1c78b5e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
@@ -77,21 +77,27 @@ struct link_resource;
 struct fixed31_32;
 struct pipe_ctx;
 
-struct link_hwss {
-	/* you must define a dummy implementation and assign the function to
-	 * dummy_link_hwss if you don't want to check for NULL pointer
+struct link_hwss_ext {
+	/* function pointers below require check for NULL at all time
+	 * *********************************************************************
 	 */
+	void (*set_hblank_min_symbol_width)(struct pipe_ctx *pipe_ctx,
+			const struct dc_link_settings *link_settings,
+			struct fixed31_32 throttled_vcp_size);
 	void (*set_throttled_vcp_size)(struct pipe_ctx *pipe_ctx,
 			struct fixed31_32 throttled_vcp_size);
+};
 
-	/* function pointers below this point require check for NULL
+struct link_hwss {
+	struct link_hwss_ext ext;
+
+	/* function pointers below MUST be assigned to all types of link_hwss
 	 * *********************************************************************
 	 */
-	void (*set_hblank_min_symbol_width)(struct pipe_ctx *pipe_ctx,
-			const struct dc_link_settings *link_settings,
-			struct fixed31_32 throttled_vcp_size);
+	void (*setup_stream_encoder)(struct pipe_ctx *pipe_ctx);
+	void (*reset_stream_encoder)(struct pipe_ctx *pipe_ctx);
 };
 
-const struct link_hwss *dc_link_hwss_get(const struct dc_link *link, const struct link_resource *link_res);
+const struct link_hwss *get_link_hwss(const struct dc_link *link, const struct link_resource *link_res);
 
 #endif /* __DC_LINK_HWSS_H__ */
-- 
2.34.1

