Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32E8909CA
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Mar 2024 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F1710E652;
	Thu, 28 Mar 2024 19:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CQFwATN2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21DA10F4F6
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Mar 2024 19:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCMCm0psqi986i8oJ2fYw4EXTGOHZ5emjjH6P7Op8kT3IGoDCHoZ9ACTtPL5Leo3NG5i9CdiBLbMLiDSqiO/oGkTmv2AfFOGjKpnC/WeAU2/eReL/1wYwgjdKFA53kcjCeJnEmLN2TpYzoWQdcSnzGeqMXIo07HfW7QXMD4huRsmEtH6nZ909weGj5L+Z3aZGXBx2FUMJnEleM3jt3g2eBh43KEd35AlxiW4+SbOB7PdUBHRnrBug0bR9y7RDFpa51gZrhzeGcL1bE7VBxND9VKHuaOvgBaL65YWfNpss6juoiubRsfsbMX1OBUU7HKFl/BQpBIPAcGG0D+8GZj6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eejygIqevD4GJ+RBu3W8Kj0P/kNCZkbxOdW2CNNtjMI=;
 b=fz2QhTkmaNKFtV74ZNJkDoTO9w95sc6gLzMovbX1tD5P9xS9UUrdeYD7AfIRoVRtdDPItcOXeVY2juzhRj3YwnUgJIdt10HnsQPK7mYKB7ClSUnqjXqqYk2d+Ki/u8dfGRw2rfGIVHKr00W2il7xCCHjaMpuda8o+o5JxpBPPSFjG8X/MyVpUKlpVRjXUzslX7lL3MtJ7Myw5X7L03uaJhx1hN+uu3Y1eGPFtUM+zGY8MK/Ieu0WzuMeG187vGGyhxsa4R4hBfSUzxCliioZ3SQWoNwJU3587o0JNtm/vERHcdktYlEEPtOom3wNucFE40GmSSDWLmanuxkjD1SN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eejygIqevD4GJ+RBu3W8Kj0P/kNCZkbxOdW2CNNtjMI=;
 b=CQFwATN23XB25+JYdgZ6wgJcG5/3HlJS+2tL8V0UjULxt5iHXbItd+FrAJyVsiQqF4DFqmqIJ6GuylUfM7H6+qzzeQ1RGF68aL0IH9Nnvd0DROqiCnewk7fWDzn3LA5c+Lze24MPIKASzPHqNDuYSSe+RQNSskTvDA+0So1FW3c=
Received: from SJ0PR03CA0339.namprd03.prod.outlook.com (2603:10b6:a03:39c::14)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39; Thu, 28 Mar
 2024 19:51:36 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b5) by SJ0PR03CA0339.outlook.office365.com
 (2603:10b6:a03:39c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 19:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 19:51:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 14:51:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 14:51:28 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Mar 2024 14:51:27 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Daniel Wheeler <daniel.wheeler@amd.com>, <Harry.Wentland@amd.com>,
 <Sunpeng.Li@amd.com>, <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, 
 <roman.li@amd.com>, <wayne.lin@amd.com>, <solomon.chiu@amd.com>,
 <agustin.gutierrez@amd.com>, <hamza.mahfooz@amd.com>, Daniel Miess
 <daniel.miess@amd.com>, Charlene Liu <charlene.liu@amd.com>
Subject: [PATCH 05/43] drm/amd/display: Toggle additional RCO options in DCN35
Date: Thu, 28 Mar 2024 15:50:09 -0400
Message-ID: <20240328195047.2843715-6-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328195047.2843715-1-Roman.Li@amd.com>
References: <20240328195047.2843715-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0c778c-10a3-44b6-ca81-08dc4f6079d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Blt3nLpNZMmciAVqMgfgghwyIJ41nq9K69rirUhEwO0F3+p44lHJyKr/zg3DJnxe/d9PKxYWfaNnh6ni8YG9Vdum9BoKlrLLwGVyNx4SyJ9TvHPF+r26XZGCi5DUz7/T5NusXD+hwztoLy+xff2oHcor5NxQ7UrTDlAGSOCca2QPMOnZYHd/aNrGHdJm/wvakm3p+pjVBjYh38nCKN+B0h6QXIicsxLo7rsRGUhPebnj0C5rI+qar6oAZBZAqyG8LY6rLn7twuDmALsOQXshs6BjWG0lKAXGThoAjXrCU3zQWErfhtWXCIWcbcdFbo5H87GE4qAdX9Sb6y5bWZ7lDuWoqIGPPZgjlZ7tTA8wvKhw7Nr7VfpIpSsXEf5ofb8KYl2GBI3yH+J0jpWMayvYqiKLuvjv5TGbh/z5zZkdicpAnrUz7+w/NRtkRVXaKR1dqO7nVfhssIOLMhA0rT9K2+/7dRZJjcYjQ1dyO/jOfzKzae2VoAsC5l0ZrKBy/DQ1cZTeOZaBQEPXbeT1Qh1+H3gtYypO4QqcU5Pu4DRlCAlbB7S/95CykrWcPW5cV6MjW6u068NZgY9/CrPUM2jI1Eje5lpHQXwHHB4LctoucL/XI2F1azWDYhvWJAWuN2aoWU35oIG2xpaGJMHjSlkfDjsAmuu/x3dKV07QMuJ4O5JCmS+g9AeihCyNHQecifwIRFM/5Ex4twNdoU0Rg4W11KB0k+jQ3tTPf0phmiKvGjsN/frKii6A5dWE9t2tJDjW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:51:35.6711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0c778c-10a3-44b6-ca81-08dc4f6079d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
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

From: Daniel Miess <daniel.miess@amd.com>

[Why]
With root clock optimization now enabled for DCN35 there
are still RCO registers still not being toggled

[How]
Add in logic to toggle RCO registers for DPPCLK,
DPSTREAMCLK and DSCCLK

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Roman Li <roman.li@amd.com>
Signed-off-by: Daniel Miess <daniel.miess@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c | 207 +++++++++++++++++-
 .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h  |   3 +-
 .../drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c  |  69 +++++-
 .../drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h  |   9 +-
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   |  28 +++
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.h   |   2 +
 .../amd/display/dc/hwss/dcn35/dcn35_init.c    |   1 +
 .../display/dc/hwss/hw_sequencer_private.h    |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |   4 +
 10 files changed, 314 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 6300ae2ea1f7..29fd8daa9d15 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -695,6 +695,7 @@ enum pg_hw_pipe_resources {
 	PG_MPCC,
 	PG_OPP,
 	PG_OPTC,
+	PG_DPSTREAM,
 	PG_HW_PIPE_RESOURCES_NUM_ELEMENT
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
index f1ba7bb792ea..58dd3c5bbff0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
@@ -49,15 +49,23 @@ static void dcn35_set_dppclk_enable(struct dccg *dccg,
 	switch (dpp_inst) {
 	case 0:
 		REG_UPDATE(DPPCLK_CTRL, DPPCLK0_EN, enable);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK0_ROOT_GATE_DISABLE, enable);
 		break;
 	case 1:
 		REG_UPDATE(DPPCLK_CTRL, DPPCLK1_EN, enable);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK1_ROOT_GATE_DISABLE, enable);
 		break;
 	case 2:
 		REG_UPDATE(DPPCLK_CTRL, DPPCLK2_EN, enable);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK2_ROOT_GATE_DISABLE, enable);
 		break;
 	case 3:
 		REG_UPDATE(DPPCLK_CTRL, DPPCLK3_EN, enable);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK3_ROOT_GATE_DISABLE, enable);
 		break;
 	default:
 		break;
@@ -100,6 +108,32 @@ static void dccg35_update_dpp_dto(struct dccg *dccg, int dpp_inst,
 	dccg->pipe_dppclk_khz[dpp_inst] = req_dppclk;
 }
 
+static void dccg35_set_dppclk_root_clock_gating(struct dccg *dccg,
+		 uint32_t dpp_inst, uint32_t enable)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	if (!dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+		return;
+
+	switch (dpp_inst) {
+	case 0:
+		REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK0_ROOT_GATE_DISABLE, enable);
+		break;
+	case 1:
+		REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK1_ROOT_GATE_DISABLE, enable);
+		break;
+	case 2:
+		REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK2_ROOT_GATE_DISABLE, enable);
+		break;
+	case 3:
+		REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DPPCLK3_ROOT_GATE_DISABLE, enable);
+		break;
+	default:
+		break;
+	}
+}
+
 static void dccg35_get_pixel_rate_div(
 		struct dccg *dccg,
 		uint32_t otg_inst,
@@ -333,21 +367,67 @@ static void dccg35_set_dpstreamclk(
 	/* enabled to select one of the DTBCLKs for pipe */
 	switch (dp_hpo_inst) {
 	case 0:
-		REG_UPDATE_2(DPSTREAMCLK_CNTL,
-				DPSTREAMCLK0_EN,
+		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK0_EN,
 				(src == REFCLK) ? 0 : 1, DPSTREAMCLK0_SRC_SEL, otg_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK0_ROOT_GATE_DISABLE, (src == REFCLK) ? 0 : 1);
 		break;
 	case 1:
 		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK1_EN,
 				(src == REFCLK) ? 0 : 1, DPSTREAMCLK1_SRC_SEL, otg_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK1_ROOT_GATE_DISABLE, (src == REFCLK) ? 0 : 1);
 		break;
 	case 2:
 		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK2_EN,
 				(src == REFCLK) ? 0 : 1, DPSTREAMCLK2_SRC_SEL, otg_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK2_ROOT_GATE_DISABLE, (src == REFCLK) ? 0 : 1);
 		break;
 	case 3:
 		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK3_EN,
 				(src == REFCLK) ? 0 : 1, DPSTREAMCLK3_SRC_SEL, otg_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK3_ROOT_GATE_DISABLE, (src == REFCLK) ? 0 : 1);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+}
+
+
+static void dccg35_set_dpstreamclk_root_clock_gating(
+		struct dccg *dccg,
+		int dp_hpo_inst,
+		bool enable)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	switch (dp_hpo_inst) {
+	case 0:
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream) {
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK0_ROOT_GATE_DISABLE, enable ? 1 : 0);
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK0_GATE_DISABLE, enable ? 1 : 0);
+		}
+		break;
+	case 1:
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream) {
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK1_ROOT_GATE_DISABLE, enable ? 1 : 0);
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK1_GATE_DISABLE, enable ? 1 : 0);
+		}
+		break;
+	case 2:
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream) {
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK2_ROOT_GATE_DISABLE, enable ? 1 : 0);
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK2_GATE_DISABLE, enable ? 1 : 0);
+		}
+		break;
+	case 3:
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream) {
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK3_ROOT_GATE_DISABLE, enable ? 1 : 0);
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DPSTREAMCLK3_GATE_DISABLE, enable ? 1 : 0);
+		}
 		break;
 	default:
 		BREAK_TO_DEBUGGER();
@@ -355,6 +435,8 @@ static void dccg35_set_dpstreamclk(
 	}
 }
 
+
+
 static void dccg35_set_physymclk_root_clock_gating(
 		struct dccg *dccg,
 		int phy_inst,
@@ -369,22 +451,32 @@ static void dccg35_set_physymclk_root_clock_gating(
 	case 0:
 		REG_UPDATE(DCCG_GATE_DISABLE_CNTL2,
 				PHYASYMCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
+//		REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//				PHYA_REFCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
 		break;
 	case 1:
 		REG_UPDATE(DCCG_GATE_DISABLE_CNTL2,
 				PHYBSYMCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
+//		REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//				PHYB_REFCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
 		break;
 	case 2:
 		REG_UPDATE(DCCG_GATE_DISABLE_CNTL2,
 				PHYCSYMCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
+//		REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//				PHYC_REFCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
 		break;
 	case 3:
 		REG_UPDATE(DCCG_GATE_DISABLE_CNTL2,
 				PHYDSYMCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
+//		REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//				PHYD_REFCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
 		break;
 	case 4:
 		REG_UPDATE(DCCG_GATE_DISABLE_CNTL2,
 				PHYESYMCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
+//		REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//				PHYE_REFCLK_ROOT_GATE_DISABLE, enable ? 1 : 0);
 		break;
 	default:
 		BREAK_TO_DEBUGGER();
@@ -407,10 +499,16 @@ static void dccg35_set_physymclk(
 			REG_UPDATE_2(PHYASYMCLK_CLOCK_CNTL,
 					PHYASYMCLK_EN, 1,
 					PHYASYMCLK_SRC_SEL, clk_src);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYA_REFCLK_ROOT_GATE_DISABLE, 0);
 		} else {
 			REG_UPDATE_2(PHYASYMCLK_CLOCK_CNTL,
 					PHYASYMCLK_EN, 0,
 					PHYASYMCLK_SRC_SEL, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYA_REFCLK_ROOT_GATE_DISABLE, 1);
 		}
 		break;
 	case 1:
@@ -418,10 +516,16 @@ static void dccg35_set_physymclk(
 			REG_UPDATE_2(PHYBSYMCLK_CLOCK_CNTL,
 					PHYBSYMCLK_EN, 1,
 					PHYBSYMCLK_SRC_SEL, clk_src);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYB_REFCLK_ROOT_GATE_DISABLE, 0);
 		} else {
 			REG_UPDATE_2(PHYBSYMCLK_CLOCK_CNTL,
 					PHYBSYMCLK_EN, 0,
 					PHYBSYMCLK_SRC_SEL, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYB_REFCLK_ROOT_GATE_DISABLE, 1);
 		}
 		break;
 	case 2:
@@ -429,10 +533,16 @@ static void dccg35_set_physymclk(
 			REG_UPDATE_2(PHYCSYMCLK_CLOCK_CNTL,
 					PHYCSYMCLK_EN, 1,
 					PHYCSYMCLK_SRC_SEL, clk_src);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYC_REFCLK_ROOT_GATE_DISABLE, 0);
 		} else {
 			REG_UPDATE_2(PHYCSYMCLK_CLOCK_CNTL,
 					PHYCSYMCLK_EN, 0,
 					PHYCSYMCLK_SRC_SEL, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYC_REFCLK_ROOT_GATE_DISABLE, 1);
 		}
 		break;
 	case 3:
@@ -440,10 +550,16 @@ static void dccg35_set_physymclk(
 			REG_UPDATE_2(PHYDSYMCLK_CLOCK_CNTL,
 					PHYDSYMCLK_EN, 1,
 					PHYDSYMCLK_SRC_SEL, clk_src);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYD_REFCLK_ROOT_GATE_DISABLE, 0);
 		} else {
 			REG_UPDATE_2(PHYDSYMCLK_CLOCK_CNTL,
 					PHYDSYMCLK_EN, 0,
 					PHYDSYMCLK_SRC_SEL, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYD_REFCLK_ROOT_GATE_DISABLE, 1);
 		}
 		break;
 	case 4:
@@ -451,10 +567,16 @@ static void dccg35_set_physymclk(
 			REG_UPDATE_2(PHYESYMCLK_CLOCK_CNTL,
 					PHYESYMCLK_EN, 1,
 					PHYESYMCLK_SRC_SEL, clk_src);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYE_REFCLK_ROOT_GATE_DISABLE, 0);
 		} else {
 			REG_UPDATE_2(PHYESYMCLK_CLOCK_CNTL,
 					PHYESYMCLK_EN, 0,
 					PHYESYMCLK_SRC_SEL, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4,
+//						PHYE_REFCLK_ROOT_GATE_DISABLE, 1);
 		}
 		break;
 	default:
@@ -491,12 +613,12 @@ static void dccg35_dpp_root_clock_control(
 
 	if (clock_on) {
 		/* turn off the DTO and leave phase/modulo at max */
-		dcn35_set_dppclk_enable(dccg, dpp_inst, 0);
+		dcn35_set_dppclk_enable(dccg, dpp_inst, 1);
 		REG_SET_2(DPPCLK_DTO_PARAM[dpp_inst], 0,
 			  DPPCLK0_DTO_PHASE, 0xFF,
 			  DPPCLK0_DTO_MODULO, 0xFF);
 	} else {
-		dcn35_set_dppclk_enable(dccg, dpp_inst, 1);
+		dcn35_set_dppclk_enable(dccg, dpp_inst, 0);
 		/* turn on the DTO to generate a 0hz clock */
 		REG_SET_2(DPPCLK_DTO_PARAM[dpp_inst], 0,
 			  DPPCLK0_DTO_PHASE, 0,
@@ -575,18 +697,32 @@ void dccg35_init(struct dccg *dccg)
 		dccg35_disable_symclk32_se(dccg, otg_inst);
 
 	if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
-		for (otg_inst = 0; otg_inst < 2; otg_inst++)
+		for (otg_inst = 0; otg_inst < 2; otg_inst++) {
 			dccg31_disable_symclk32_le(dccg, otg_inst);
+			dccg31_set_symclk32_le_root_clock_gating(dccg, otg_inst, false);
+		}
+
+//	if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//		for (otg_inst = 0; otg_inst < 4; otg_inst++)
+//			dccg35_disable_symclk_se(dccg, otg_inst, otg_inst);
+
 
 	if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
-		for (otg_inst = 0; otg_inst < 4; otg_inst++)
-			dccg314_set_dpstreamclk(dccg, REFCLK, otg_inst,
+		for (otg_inst = 0; otg_inst < 4; otg_inst++) {
+			dccg35_set_dpstreamclk(dccg, REFCLK, otg_inst,
 						otg_inst);
+			dccg35_set_dpstreamclk_root_clock_gating(dccg, otg_inst, false);
+		}
 
 	if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
 		for (otg_inst = 0; otg_inst < 5; otg_inst++)
 			dccg35_set_physymclk_root_clock_gating(dccg, otg_inst,
 					false);
+
+	if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpp)
+		for (otg_inst = 0; otg_inst < 4; otg_inst++)
+			dccg35_set_dppclk_root_clock_gating(dccg, otg_inst, 0);
+
 /*
 	dccg35_enable_global_fgcg_rep(
 		dccg, dccg->ctx->dc->debug.enable_fine_grain_clock_gating.bits
@@ -611,24 +747,32 @@ static void dccg35_enable_dscclk(struct dccg *dccg, int inst)
 				DSCCLK0_DTO_PHASE, 0,
 				DSCCLK0_DTO_MODULO, 0);
 		REG_UPDATE(DSCCLK_DTO_CTRL,	DSCCLK0_EN, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK0_ROOT_GATE_DISABLE, 1);
 		break;
 	case 1:
 		REG_UPDATE_2(DSCCLK1_DTO_PARAM,
 				DSCCLK1_DTO_PHASE, 0,
 				DSCCLK1_DTO_MODULO, 0);
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK1_EN, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK1_ROOT_GATE_DISABLE, 1);
 		break;
 	case 2:
 		REG_UPDATE_2(DSCCLK2_DTO_PARAM,
 				DSCCLK2_DTO_PHASE, 0,
 				DSCCLK2_DTO_MODULO, 0);
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK2_EN, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK2_ROOT_GATE_DISABLE, 1);
 		break;
 	case 3:
 		REG_UPDATE_2(DSCCLK3_DTO_PARAM,
 				DSCCLK3_DTO_PHASE, 0,
 				DSCCLK3_DTO_MODULO, 0);
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK3_EN, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK3_ROOT_GATE_DISABLE, 1);
 		break;
 	default:
 		BREAK_TO_DEBUGGER();
@@ -650,24 +794,32 @@ static void dccg35_disable_dscclk(struct dccg *dccg,
 		REG_UPDATE_2(DSCCLK0_DTO_PARAM,
 				DSCCLK0_DTO_PHASE, 0,
 				DSCCLK0_DTO_MODULO, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK0_ROOT_GATE_DISABLE, 0);
 		break;
 	case 1:
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK1_EN, 0);
 		REG_UPDATE_2(DSCCLK1_DTO_PARAM,
 				DSCCLK1_DTO_PHASE, 0,
 				DSCCLK1_DTO_MODULO, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK1_ROOT_GATE_DISABLE, 0);
 		break;
 	case 2:
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK2_EN, 0);
 		REG_UPDATE_2(DSCCLK2_DTO_PARAM,
 				DSCCLK2_DTO_PHASE, 0,
 				DSCCLK2_DTO_MODULO, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK2_ROOT_GATE_DISABLE, 0);
 		break;
 	case 3:
 		REG_UPDATE(DSCCLK_DTO_CTRL, DSCCLK3_EN, 0);
 		REG_UPDATE_2(DSCCLK3_DTO_PARAM,
 				DSCCLK3_DTO_PHASE, 0,
 				DSCCLK3_DTO_MODULO, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.dsc)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, DSCCLK3_ROOT_GATE_DISABLE, 0);
 		break;
 	default:
 		return;
@@ -682,22 +834,32 @@ static void dccg35_enable_symclk_se(struct dccg *dccg, uint32_t stream_enc_inst,
 	case 0:
 		REG_UPDATE(SYMCLKA_CLOCK_ENABLE,
 				SYMCLKA_CLOCK_ENABLE, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKA_ROOT_GATE_DISABLE, 1);
 		break;
 	case 1:
 		REG_UPDATE(SYMCLKB_CLOCK_ENABLE,
 				SYMCLKB_CLOCK_ENABLE, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKB_ROOT_GATE_DISABLE, 1);
 		break;
 	case 2:
 		REG_UPDATE(SYMCLKC_CLOCK_ENABLE,
 				SYMCLKC_CLOCK_ENABLE, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKC_ROOT_GATE_DISABLE, 1);
 		break;
 	case 3:
 		REG_UPDATE(SYMCLKD_CLOCK_ENABLE,
 				SYMCLKD_CLOCK_ENABLE, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKD_ROOT_GATE_DISABLE, 1);
 		break;
 	case 4:
 		REG_UPDATE(SYMCLKE_CLOCK_ENABLE,
 				SYMCLKE_CLOCK_ENABLE, 1);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKE_ROOT_GATE_DISABLE, 1);
 		break;
 	}
 
@@ -706,26 +868,36 @@ static void dccg35_enable_symclk_se(struct dccg *dccg, uint32_t stream_enc_inst,
 		REG_UPDATE_2(SYMCLKA_CLOCK_ENABLE,
 				SYMCLKA_FE_EN, 1,
 				SYMCLKA_FE_SRC_SEL, link_enc_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKA_FE_ROOT_GATE_DISABLE, 1);
 		break;
 	case 1:
 		REG_UPDATE_2(SYMCLKB_CLOCK_ENABLE,
 				SYMCLKB_FE_EN, 1,
 				SYMCLKB_FE_SRC_SEL, link_enc_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKB_FE_ROOT_GATE_DISABLE, 1);
 		break;
 	case 2:
 		REG_UPDATE_2(SYMCLKC_CLOCK_ENABLE,
 				SYMCLKC_FE_EN, 1,
 				SYMCLKC_FE_SRC_SEL, link_enc_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKC_FE_ROOT_GATE_DISABLE, 1);
 		break;
 	case 3:
 		REG_UPDATE_2(SYMCLKD_CLOCK_ENABLE,
 				SYMCLKD_FE_EN, 1,
 				SYMCLKD_FE_SRC_SEL, link_enc_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKD_FE_ROOT_GATE_DISABLE, 1);
 		break;
 	case 4:
 		REG_UPDATE_2(SYMCLKE_CLOCK_ENABLE,
 				SYMCLKE_FE_EN, 1,
 				SYMCLKE_FE_SRC_SEL, link_enc_inst);
+		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKE_FE_ROOT_GATE_DISABLE, 1);
 		break;
 	}
 }
@@ -786,26 +958,36 @@ static void dccg35_disable_symclk_se(struct dccg *dccg, uint32_t stream_enc_inst
 		REG_UPDATE_2(SYMCLKA_CLOCK_ENABLE,
 				SYMCLKA_FE_EN, 0,
 				SYMCLKA_FE_SRC_SEL, 0);
+//		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKA_FE_ROOT_GATE_DISABLE, 0);
 		break;
 	case 1:
 		REG_UPDATE_2(SYMCLKB_CLOCK_ENABLE,
 				SYMCLKB_FE_EN, 0,
 				SYMCLKB_FE_SRC_SEL, 0);
+//		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKB_FE_ROOT_GATE_DISABLE, 0);
 		break;
 	case 2:
 		REG_UPDATE_2(SYMCLKC_CLOCK_ENABLE,
 				SYMCLKC_FE_EN, 0,
 				SYMCLKC_FE_SRC_SEL, 0);
+//		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKC_FE_ROOT_GATE_DISABLE, 0);
 		break;
 	case 3:
 		REG_UPDATE_2(SYMCLKD_CLOCK_ENABLE,
 				SYMCLKD_FE_EN, 0,
 				SYMCLKD_FE_SRC_SEL, 0);
+//		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKD_FE_ROOT_GATE_DISABLE, 0);
 		break;
 	case 4:
 		REG_UPDATE_2(SYMCLKE_CLOCK_ENABLE,
 				SYMCLKE_FE_EN, 0,
 				SYMCLKE_FE_SRC_SEL, 0);
+//		if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_se)
+//			REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKE_FE_ROOT_GATE_DISABLE, 0);
 		break;
 	}
 
@@ -818,22 +1000,32 @@ static void dccg35_disable_symclk_se(struct dccg *dccg, uint32_t stream_enc_inst
 		case 0:
 			REG_UPDATE(SYMCLKA_CLOCK_ENABLE,
 					SYMCLKA_CLOCK_ENABLE, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKA_ROOT_GATE_DISABLE, 0);
 			break;
 		case 1:
 			REG_UPDATE(SYMCLKB_CLOCK_ENABLE,
 					SYMCLKB_CLOCK_ENABLE, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKB_ROOT_GATE_DISABLE, 0);
 			break;
 		case 2:
 			REG_UPDATE(SYMCLKC_CLOCK_ENABLE,
 					SYMCLKC_CLOCK_ENABLE, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKC_ROOT_GATE_DISABLE, 0);
 			break;
 		case 3:
 			REG_UPDATE(SYMCLKD_CLOCK_ENABLE,
 					SYMCLKD_CLOCK_ENABLE, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKD_ROOT_GATE_DISABLE, 0);
 			break;
 		case 4:
 			REG_UPDATE(SYMCLKE_CLOCK_ENABLE,
 					SYMCLKE_CLOCK_ENABLE, 0);
+//			if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
+//				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, SYMCLKE_ROOT_GATE_DISABLE, 0);
 			break;
 		}
 	}
@@ -845,6 +1037,7 @@ static const struct dccg_funcs dccg35_funcs = {
 	.get_dccg_ref_freq = dccg31_get_dccg_ref_freq,
 	.dccg_init = dccg35_init,
 	.set_dpstreamclk = dccg35_set_dpstreamclk,
+	.set_dpstreamclk_root_clock_gating = dccg35_set_dpstreamclk_root_clock_gating,
 	.enable_symclk32_se = dccg31_enable_symclk32_se,
 	.disable_symclk32_se = dccg35_disable_symclk32_se,
 	.enable_symclk32_le = dccg31_enable_symclk32_le,
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h
index a039eedc7c24..c48139bed11f 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h
@@ -1090,7 +1090,8 @@
 	type DPP_CLOCK_ENABLE; \
 	type CM_HDR_MULT_COEF; \
 	type CUR0_FP_BIAS; \
-	type CUR0_FP_SCALE;
+	type CUR0_FP_SCALE;\
+	type DISPCLK_R_GATE_DISABLE;
 
 struct dcn_dpp_shift {
 	TF_REG_FIELD_LIST(uint8_t)
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c
index 0146b36b93d7..e16274fee31d 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c
@@ -37,14 +37,73 @@
 	((const struct dcn35_dpp_shift *)(dpp->tf_shift))->field_name, \
 	((const struct dcn35_dpp_mask *)(dpp->tf_mask))->field_name
 
-bool dpp35_construct(struct dcn3_dpp *dpp, struct dc_context *ctx,
-		     uint32_t inst, const struct dcn3_dpp_registers *tf_regs,
-		     const struct dcn35_dpp_shift *tf_shift,
-		     const struct dcn35_dpp_mask *tf_mask)
+void dpp35_dppclk_control(
+		struct dpp *dpp_base,
+		bool dppclk_div,
+		bool enable)
 {
-	return dpp32_construct(dpp, ctx, inst, tf_regs,
+	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
+
+	if (enable) {
+		if (dpp->tf_mask->DPPCLK_RATE_CONTROL)
+			REG_UPDATE_2(DPP_CONTROL,
+				DPPCLK_RATE_CONTROL, dppclk_div,
+				DPP_CLOCK_ENABLE, 1);
+		else
+			REG_UPDATE_2(DPP_CONTROL,
+					DPP_CLOCK_ENABLE, 1,
+					DISPCLK_R_GATE_DISABLE, 1);
+	} else
+		REG_UPDATE_2(DPP_CONTROL,
+				DPP_CLOCK_ENABLE, 0,
+				DISPCLK_R_GATE_DISABLE, 0);
+}
+
+static struct dpp_funcs dcn35_dpp_funcs = {
+	.dpp_program_gamcor_lut		= dpp3_program_gamcor_lut,
+	.dpp_read_state				= dpp30_read_state,
+	.dpp_reset					= dpp_reset,
+	.dpp_set_scaler				= dpp1_dscl_set_scaler_manual_scale,
+	.dpp_get_optimal_number_of_taps	= dpp3_get_optimal_number_of_taps,
+	.dpp_set_gamut_remap		= dpp3_cm_set_gamut_remap,
+	.dpp_set_csc_adjustment		= NULL,
+	.dpp_set_csc_default		= NULL,
+	.dpp_program_regamma_pwl	= NULL,
+	.dpp_set_pre_degam			= dpp3_set_pre_degam,
+	.dpp_program_input_lut		= NULL,
+	.dpp_full_bypass			= dpp1_full_bypass,
+	.dpp_setup					= dpp3_cnv_setup,
+	.dpp_program_degamma_pwl	= NULL,
+	.dpp_program_cm_dealpha		= dpp3_program_cm_dealpha,
+	.dpp_program_cm_bias		= dpp3_program_cm_bias,
+
+	.dpp_program_blnd_lut		= NULL, // BLNDGAM is removed completely in DCN3.2 DPP
+	.dpp_program_shaper_lut		= NULL, // CM SHAPER block is removed in DCN3.2 DPP, (it is in MPCC, programmable before or after BLND)
+	.dpp_program_3dlut			= NULL, // CM 3DLUT block is removed in DCN3.2 DPP, (it is in MPCC, programmable before or after BLND)
+
+	.dpp_program_bias_and_scale	= NULL,
+	.dpp_cnv_set_alpha_keyer	= dpp2_cnv_set_alpha_keyer,
+	.set_cursor_attributes		= dpp3_set_cursor_attributes,
+	.set_cursor_position		= dpp1_set_cursor_position,
+	.set_optional_cursor_attributes	= dpp1_cnv_set_optional_cursor_attributes,
+	.dpp_dppclk_control			= dpp35_dppclk_control,
+	.dpp_set_hdr_multiplier		= dpp3_set_hdr_multiplier,
+	.dpp_get_gamut_remap		= dpp3_cm_get_gamut_remap,
+};
+
+
+bool dpp35_construct(
+	struct dcn3_dpp *dpp, struct dc_context *ctx,
+	uint32_t inst, const struct dcn3_dpp_registers *tf_regs,
+	const struct dcn35_dpp_shift *tf_shift,
+	const struct dcn35_dpp_mask *tf_mask)
+{
+	bool ret = dpp32_construct(dpp, ctx, inst, tf_regs,
 			      (const struct dcn3_dpp_shift *)(tf_shift),
 			      (const struct dcn3_dpp_mask *)(tf_mask));
+
+	dpp->base.funcs = &dcn35_dpp_funcs;
+	return ret;
 }
 
 void dpp35_set_fgcg(struct dcn3_dpp *dpp, bool enable)
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h b/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h
index 09b84307cd9e..135872d88219 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h
@@ -31,7 +31,9 @@
 
 #define DPP_REG_LIST_SH_MASK_DCN35(mask_sh)  \
 	DPP_REG_LIST_SH_MASK_DCN30_COMMON(mask_sh), \
-		TF_SF(DPP_TOP0_DPP_CONTROL, DPP_FGCG_REP_DIS, mask_sh)
+		TF_SF(DPP_TOP0_DPP_CONTROL, DPP_FGCG_REP_DIS, mask_sh), \
+		TF_SF(DPP_TOP0_DPP_CONTROL, DPP_FGCG_REP_DIS, mask_sh), \
+		TF_SF(DPP_TOP0_DPP_CONTROL, DISPCLK_R_GATE_DISABLE, mask_sh)
 
 #define DPP_REG_FIELD_LIST_DCN35(type)         \
 	struct {                               \
@@ -47,6 +49,11 @@ struct dcn35_dpp_mask {
 	DPP_REG_FIELD_LIST_DCN35(uint32_t);
 };
 
+void dpp35_dppclk_control(
+		struct dpp *dpp_base,
+		bool dppclk_div,
+		bool enable);
+
 bool dpp35_construct(struct dcn3_dpp *dpp3, struct dc_context *ctx,
 		     uint32_t inst, const struct dcn3_dpp_registers *tf_regs,
 		     const struct dcn35_dpp_shift *tf_shift,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index 629a702bb3fa..9499295f4582 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -495,6 +495,17 @@ void dcn35_dpp_root_clock_control(struct dce_hwseq *hws, unsigned int dpp_inst,
 	}
 }
 
+void dcn35_dpstream_root_clock_control(struct dce_hwseq *hws, unsigned int dp_hpo_inst, bool clock_on)
+{
+	if (!hws->ctx->dc->debug.root_clock_optimization.bits.dpstream)
+		return;
+
+	if (hws->ctx->dc->res_pool->dccg->funcs->set_dpstreamclk_root_clock_gating) {
+		hws->ctx->dc->res_pool->dccg->funcs->set_dpstreamclk_root_clock_gating(
+			hws->ctx->dc->res_pool->dccg, dp_hpo_inst, clock_on);
+	}
+}
+
 void dcn35_dsc_pg_control(
 		struct dce_hwseq *hws,
 		unsigned int dsc_inst,
@@ -1002,6 +1013,9 @@ void dcn35_calc_blocks_to_gate(struct dc *dc, struct dc_state *context,
 
 		if (pipe_ctx->stream_res.opp)
 			update_state->pg_pipe_res_update[PG_OPP][pipe_ctx->stream_res.opp->inst] = false;
+
+		if (pipe_ctx->stream_res.hpo_dp_stream_enc)
+			update_state->pg_pipe_res_update[PG_DPSTREAM][pipe_ctx->stream_res.hpo_dp_stream_enc->inst] = false;
 	}
 	/*domain24 controls all the otg, mpc, opp, as long as one otg is still up, avoid enabling OTG PG*/
 	for (i = 0; i < dc->res_pool->timing_generator_count; i++) {
@@ -1059,6 +1073,9 @@ void dcn35_calc_blocks_to_ungate(struct dc *dc, struct dc_state *context,
 
 				if (j == PG_OPTC && new_pipe->stream_res.tg)
 					update_state->pg_pipe_res_update[j][new_pipe->stream_res.tg->inst] = true;
+
+				if (j == PG_DPSTREAM && new_pipe->stream_res.hpo_dp_stream_enc)
+					update_state->pg_pipe_res_update[j][new_pipe->stream_res.hpo_dp_stream_enc->inst] = true;
 			}
 		} else if (cur_pipe->plane_state == new_pipe->plane_state ||
 				cur_pipe == new_pipe) {
@@ -1088,6 +1105,11 @@ void dcn35_calc_blocks_to_ungate(struct dc *dc, struct dc_state *context,
 					cur_pipe->stream_res.tg != new_pipe->stream_res.tg &&
 					new_pipe->stream_res.tg)
 					update_state->pg_pipe_res_update[j][new_pipe->stream_res.tg->inst] = true;
+
+				if (j == PG_DPSTREAM &&
+					cur_pipe->stream_res.hpo_dp_stream_enc != new_pipe->stream_res.hpo_dp_stream_enc &&
+					new_pipe->stream_res.hpo_dp_stream_enc)
+					update_state->pg_pipe_res_update[j][new_pipe->stream_res.hpo_dp_stream_enc->inst] = true;
 			}
 		}
 	}
@@ -1234,6 +1256,9 @@ void dcn35_root_clock_control(struct dc *dc,
 				if (dc->hwseq->funcs.dpp_root_clock_control)
 					dc->hwseq->funcs.dpp_root_clock_control(dc->hwseq, i, power_on);
 			}
+			if (update_state->pg_pipe_res_update[PG_DPSTREAM][i])
+				if (dc->hwseq->funcs.dpstream_root_clock_control)
+					dc->hwseq->funcs.dpstream_root_clock_control(dc->hwseq, i, power_on);
 		}
 	for (i = 0; i < dc->res_pool->res_cap->num_dsc; i++) {
 		if (update_state->pg_pipe_res_update[PG_DSC][i]) {
@@ -1254,6 +1279,9 @@ void dcn35_root_clock_control(struct dc *dc,
 				if (dc->hwseq->funcs.dpp_root_clock_control)
 					dc->hwseq->funcs.dpp_root_clock_control(dc->hwseq, i, power_on);
 			}
+			if (update_state->pg_pipe_res_update[PG_DPSTREAM][i])
+				if (dc->hwseq->funcs.dpstream_root_clock_control)
+					dc->hwseq->funcs.dpstream_root_clock_control(dc->hwseq, i, power_on);
 		}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
index 68f714143431..a731c8880d60 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
@@ -37,6 +37,8 @@ void dcn35_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool pow
 
 void dcn35_dpp_root_clock_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool clock_on);
 
+void dcn35_dpstream_root_clock_control(struct dce_hwseq *hws, unsigned int dp_hpo_inst, bool clock_on);
+
 void dcn35_enable_power_gating_plane(struct dce_hwseq *hws, bool enable);
 
 void dcn35_set_dmu_fgcg(struct dce_hwseq *hws, bool enable);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 19b861349954..df3bf77f3fb4 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
@@ -147,6 +147,7 @@ static const struct hwseq_private_funcs dcn35_private_funcs = {
 	//.hubp_pg_control = dcn35_hubp_pg_control,
 	.enable_power_gating_plane = dcn35_enable_power_gating_plane,
 	.dpp_root_clock_control = dcn35_dpp_root_clock_control,
+	.dpstream_root_clock_control = dcn35_dpstream_root_clock_control,
 	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
 	.update_odm = dcn35_update_odm,
 	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
index 554cfab5ab24..341219cf4144 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer_private.h
@@ -120,6 +120,10 @@ struct hwseq_private_funcs {
 			struct dce_hwseq *hws,
 			unsigned int dpp_inst,
 			bool clock_on);
+	void (*dpstream_root_clock_control)(
+			struct dce_hwseq *hws,
+			unsigned int dpp_inst,
+			bool clock_on);
 	void (*dpp_pg_control)(struct dce_hwseq *hws,
 			unsigned int dpp_inst,
 			bool power_on);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
index 722eff84ccfd..d4c7885fc916 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
@@ -106,6 +106,10 @@ struct dccg_funcs {
 	void (*otg_drop_pixel)(struct dccg *dccg,
 			uint32_t otg_inst);
 	void (*dccg_init)(struct dccg *dccg);
+	void (*set_dpstreamclk_root_clock_gating)(
+			struct dccg *dccg,
+			int dp_hpo_inst,
+			bool enable);
 
 	void (*set_dpstreamclk)(
 			struct dccg *dccg,
-- 
2.34.1

