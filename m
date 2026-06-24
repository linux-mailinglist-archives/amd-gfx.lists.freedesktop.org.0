Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RFIrDmMdPGppkAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AE6C0A6E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=isgZo5Ab;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376BB10F093;
	Wed, 24 Jun 2026 18:09:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B68410F086
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PG8QjsqxsDysc8MGjYI+A7zMV1YBmNFUGWmZLllomKRWotiTnzBT9RC9DVE3EfIo5kYciLBxalIoB4QJRxYaxkS7NHN0mvL0TWyYmmMjyMNyeSwaWoQpWB+fI/P3Ex8GTlcgixRILCOUzZmkS5u0s/LoGD61ak9C9cZlwD7pinbySCRpzNliU2BMuZ+y8XFxs7pif6P9yJ7MsRUPizl4G0OFWqKv7iIR4XOoiTtBJj9aP2Z7GQJLF5aumS4zXbLWlrXm7HGWILPWFbte4TERhAJKtnAEOsX86s1ieAHp7NGxVm+UHK0JPiDbxksib1Af614WAuhMBvuK2fDuGHTaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcTGrpg2cgwDfMBzEGNywFlbd0koglCTm6g7mME/Pn4=;
 b=Yvdh2f7rH9TRr+BZSGvTJ9+DpUGyzgCO5YEBYfA1zMlh9/vS9xcdBI9tDCYxKa+U8EAz2k1i2IXxvBLglpxSYfkGJ0/2w2a/vBfYzQ/JEWWgaRH9XubbAUmEXta9l8L6miyRcjqmn3DZPlWdYPAzAUWsh1SL1b4Asrmf7kL8nLLKrGv/7bZmH1mKEY5L9T9z5E3/CLsoIxAo6cijfhlQT4Tc2V3LRjJxDvkYwA6qJnLZF5AEU5yN+jrM2YYV1bF/AmIid6cSKdRpXhO5+nydHvgNM6+ZS+7aB7MiGzcFYOJntAQksnQRi8/iFt800/ZLVtf0WnY9giLfYeg+rg8wCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcTGrpg2cgwDfMBzEGNywFlbd0koglCTm6g7mME/Pn4=;
 b=isgZo5AbXKgwG1ulbUyjdpw/wXD5U5LwnOGcEVqaiv5tiRpgKiraK4DHTsC3ahWO/JLAEVBnXPCG31eFkbP5nBq1XKKWCIx3IsJ/2BsY5OWxG9PWgM+al7FyYT9hB+Xz2+RUiEvYs02qju3HHw8KzsAb18Vu2Jur2XpRSkXt+yk=
Received: from SJ0PR05CA0189.namprd05.prod.outlook.com (2603:10b6:a03:330::14)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 18:09:24 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::8b) by SJ0PR05CA0189.outlook.office365.com
 (2603:10b6:a03:330::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 24 Jun 2026 18:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 18:09:23 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:21 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Bhuvanachandra Pinninti
 <BhuvanaChandra.Pinninti@amd.com>, Alvin Lee <alvin.lee2@amd.com>, "George
 Zhang" <george.zhang@amd.com>
Subject: [PATCH 13/28] drm/amd/display: Add block sequence support for
 bandwidth programming operations
Date: Wed, 24 Jun 2026 14:03:11 -0400
Message-ID: <20260624180829.4775-14-george.zhang@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180829.4775-1-george.zhang@amd.com>
References: <20260624180829.4775-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: d8238573-05db-4341-37a5-08ded21bb8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Cm6HbNk4dvOWk996RPe0HRw8Nx1V0ZB9sEcKKAkizZxU9Ip0FHSYbyF4j4bJcW5abSTS/0liYUvNoR5gjyhJv6yfFqhvL3S+J69rvOBuQ9iUmOSE49C3hEMBl7E3RlAyIs9oRwrBXRhA82ILc3s+pcOKh/X3u7vHBAzxhpWa3zSnbTmqHygMBMzdBxFKws/Ub6zLffLF2dJYKsp7+TIWuRfAp+BMrMEcV9UIT/NlkVJOKuB9CCI+ji49hUDApKcYcqK6NpxVGauO7IY2HVlj02qH5K+Vne0WfA7NdeNvAYAw7ySR0akLOH7C58Db5R4TX5rqvp74HBXTqR5msW7oj/3ufk1TpZ8QGlzc0n6I31+wtrh7vqb3AivGoTRIdRSF81UkS27QO883EHceDf2Y4Rr/U3/WHUP1ylY4ng62CM5GI4z0IO70BHqomwuNrMFpvqOKVoc55urB+rq/u90kMCngCm+Jz7gu+OmSKsBbBP+975CTH+5H1Iq3N9y0jbW2GBUOtVkyLQskF3UUL87Zcjf0kIoSxbBzbnBPFMYSmRRSXP95f7EQBlEN3z6BZ3kGX5h0Ayx81NPT46cIMHPCuZDBIiMZ8adZawxdzoh/SASoyUEXrn4/yhkumOo5zWXjaythcooMKHJ813kuY4CF2U91N1HuuYwRM8hULSW6/WdjngBMtZQE2xXyYv9v+qpaoVGbtsJhEI0HOhTpaXiMwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BBu0O6kuD5KRjLnHapnvdPE+9/gPKfLfzSPZvngIbkwQXpkCCR4gbzm68TApgXmPIX/8Jv5Oo8dWqTuEa30ZuTSknvPWA9deO8E9OBwxwxC/Xx//DvK8R7RfZ9D2buuCgMLBWBgVA+2sQOzU7F9g1dS48vmS6K8PdF/rdhhHYaqjGJqIbjt0EPsafiTmpTCcoGbIj6ijs8DGfzeaVXM8lje30t7D+DbQ+h++NraN66HXNq/x22xcNgcy5RrJoFsNUkN7h+yLbF8pisxSQ1xLuWEBr1vl/8ezJsJSxcgfSIirw2FMIITG7fS+wQqOgkvA7V8/8dm7iv+SFiunuWUmBBcY6ot2e4HllbgTwqqHMF5nUe4TxQihdwbrYujIayd1QixScph9jxPxeJfe489IRSf0/9if1hxeZq8yADoY/c2aP253rCJZpKcTUVV9DBfS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:23.8737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8238573-05db-4341-37a5-08ded21bb8d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A31AE6C0A6E

From: Bhuvanachandra Pinninti <BhuvanaChandra.Pinninti@amd.com>

[why]
Bandwidth clock programming build and execution phases were coupled,
preventing the HWSS from orchestrating them through block sequencing.

[how]
Separate clock programming into build and execute phases across
latest versions. Build phase populates the clk_mgr internal block
sequence array, then registers a single CLK_MGR_UPDATE_CLOCKS HWSS step.
Execute phase dispatches the pre-built sequence. Add HWSS operations for
clk_mgr_set_max_memclk, hubbub_program_watermarks, hubbub_program_arbiter,
and hubbub_program_compbuf_segments.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Bhuvanachandra Pinninti <BhuvanaChandra.Pinninti@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr.c        |  57 ++++++-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr.h        |   9 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   4 +-
 .../drm/amd/display/dc/core/dc_hw_sequencer.c | 154 ++++++++++++++++++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  95 +++++++++++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |  10 ++
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   2 +
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |  82 ++++++++++
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |   8 +
 9 files changed, 416 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
index 5f9398745a38..42ce5a304125 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
@@ -10,6 +10,7 @@
 #include "dcn31/dcn31_clk_mgr.h"
 #include "dcn32/dcn32_clk_mgr.h"
 #include "dcn401/dcn401_clk_mgr.h"
+#include "hw_sequencer.h"
 #include "reg_helper.h"
 #include "core_types.h"
 #include "dm_helpers.h"
@@ -1085,7 +1086,8 @@ static unsigned int dcn401_build_update_display_clocks_sequence(
 		struct clk_mgr *clk_mgr_base,
 		struct dc_state *context,
 		struct dc_clocks *new_clocks,
-		bool safe_to_lower)
+		bool safe_to_lower,
+		unsigned int num_steps_start)
 {
 	struct clk_mgr_internal *clk_mgr_internal = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dcn401_clk_mgr *clk_mgr401 = TO_DCN401_CLK_MGR(clk_mgr_internal);
@@ -1100,7 +1102,7 @@ static unsigned int dcn401_build_update_display_clocks_sequence(
 	bool frl_present = false;
 	unsigned int i;
 
-	unsigned int num_steps = 0;
+	unsigned int num_steps = num_steps_start;
 
 	/* CLK_MGR401_READ_CLOCKS_FROM_DENTIST */
 	if (clk_mgr_base->clks.dispclk_khz == 0 ||
@@ -1239,6 +1241,44 @@ static unsigned int dcn401_build_update_display_clocks_sequence(
 	return num_steps;
 }
 
+/*
+ * Build-for-BLS functions.
+ * These build both bandwidth and display clock sequences into the clk_mgr's
+ * internal block sequence array, then add a single CLK_MGR_UPDATE_CLOCKS step
+ * to the HWSS block sequence whose executor will call
+ * execute_clk_mgr_block_sequence to dispatch all accumulated steps.
+ */
+void dcn401_build_clock_update_for_bls(
+		struct clk_mgr *clk_mgr_base,
+		struct dc_state *context,
+		bool safe_to_lower,
+		struct block_sequence_state *seq_state)
+{
+	struct clk_mgr_internal *clk_mgr_internal = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dcn401_clk_mgr *clk_mgr401 = TO_DCN401_CLK_MGR(clk_mgr_internal);
+	unsigned int num_bw_steps;
+	unsigned int total_steps;
+
+	/* Build bandwidth clocks sequence starting at index 0 */
+	num_bw_steps = dcn401_build_update_bandwidth_clocks_sequence(clk_mgr_base,
+			context,
+			&context->bw_ctx.bw.dcn.clk,
+			safe_to_lower);
+
+	/* Build display clocks sequence appended after bandwidth steps */
+	total_steps = dcn401_build_update_display_clocks_sequence(clk_mgr_base,
+			context,
+			&context->bw_ctx.bw.dcn.clk,
+			safe_to_lower,
+			num_bw_steps);
+
+	/* Store total step count for the executor */
+	clk_mgr401->num_block_sequence_steps = total_steps;
+
+	/* Add single HWSS step that will execute all clk_mgr block sequence steps */
+	hwss_add_clk_mgr_update_clocks(seq_state, clk_mgr_base);
+}
+
 static void dcn401_update_clocks(struct clk_mgr *clk_mgr_base,
 		struct dc_state *context,
 		bool safe_to_lower)
@@ -1260,7 +1300,8 @@ static void dcn401_update_clocks(struct clk_mgr *clk_mgr_base,
 	num_steps = dcn401_build_update_display_clocks_sequence(clk_mgr_base,
 			context,
 			&context->bw_ctx.bw.dcn.clk,
-			safe_to_lower);
+			safe_to_lower,
+			0);
 
 	/* execute sequence */
 	dcn401_execute_block_sequence(clk_mgr_base,	num_steps);
@@ -1549,6 +1590,14 @@ unsigned int dcn401_get_max_clock_khz(struct clk_mgr *clk_mgr_base, enum clk_typ
 	return 0;
 }
 
+static void dcn401_execute_clk_mgr_block_sequence_bls(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr_internal = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dcn401_clk_mgr *clk_mgr401 = TO_DCN401_CLK_MGR(clk_mgr_internal);
+
+	dcn401_execute_block_sequence(clk_mgr_base, clk_mgr401->num_block_sequence_steps);
+}
+
 static struct clk_mgr_funcs dcn401_funcs = {
 		.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
 		.get_dtb_ref_clk_frequency = dcn401_get_dtb_ref_freq_khz,
@@ -1566,6 +1615,8 @@ static struct clk_mgr_funcs dcn401_funcs = {
 		.get_hard_min_fclk = dcn401_get_hard_min_fclk,
 		.is_dc_mode_present = dcn401_is_dc_mode_present,
 		.get_max_clock_khz = dcn401_get_max_clock_khz,
+		.build_clock_update_for_bls = dcn401_build_clock_update_for_bls,
+		.execute_clk_mgr_block_sequence = dcn401_execute_clk_mgr_block_sequence_bls,
 };
 
 struct clk_mgr_internal *dcn401_clk_mgr_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h
index 370d2ddd6064..d4cd69a5a8dd 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h
@@ -102,6 +102,7 @@ struct dcn401_clk_mgr {
 	struct clk_mgr_internal base;
 
 	struct dcn401_clk_mgr_block_sequence block_sequence[DCN401_CLK_MGR_MAX_SEQUENCE_SIZE];
+	unsigned int num_block_sequence_steps;
 };
 
 void dcn401_init_clocks(struct clk_mgr *clk_mgr_base);
@@ -114,4 +115,12 @@ void dcn401_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr);
 
 unsigned int dcn401_get_max_clock_khz(struct clk_mgr *clk_mgr_base, enum clk_type clk_type);
 
+struct block_sequence_state;
+
+void dcn401_build_clock_update_for_bls(
+		struct clk_mgr *clk_mgr_base,
+		struct dc_state *context,
+		bool safe_to_lower,
+		struct block_sequence_state *seq_state);
+
 #endif /* __DCN401_CLK_MGR_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index ae776519e6ea..8922078d75d9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4257,8 +4257,8 @@ static void commit_planes_do_stream_update_sequence(struct dc *dc,
 					hwss_add_dc_set_optimized_required(&seq_state, dc, true);
 
 				} else {
-					if (get_seamless_boot_stream_count(context) == 0)
-						hwss_add_prepare_bandwidth(&seq_state, dc, dc->current_state);
+					if (get_seamless_boot_stream_count(context) == 0 && dc->hwss.prepare_bandwidth_sequence)
+						dc->hwss.prepare_bandwidth_sequence(dc, dc->current_state, &seq_state);
 					hwss_add_link_set_dpms_on(&seq_state, dc->current_state, dpms_pipe_ctx);
 				}
 			} else if (pipe_ctx->stream->link->wa_flags.blank_stream_on_ocs_change && stream_update->output_color_space
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index c7c32c0a6b50..e47c8cf5d036 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -37,6 +37,7 @@
 #include "dchubbub.h"
 #include "dccg.h"
 #include "abm.h"
+#include "clk_mgr.h"
 #include "dcn10/dcn10_hubbub.h"
 #include "dce/dmub_hw_lock_mgr.h"
 #include "link_service.h"
@@ -1668,6 +1669,21 @@ void hwss_execute_sequence(struct dc *dc,
 		case LINK_SET_DPMS_ON:
 			hwss_link_set_dpms_on(params);
 			break;
+		case CLK_MGR_SET_MAX_MEMCLK:
+			hwss_clk_mgr_set_max_memclk(params);
+			break;
+		case CLK_MGR_UPDATE_CLOCKS:
+			hwss_clk_mgr_update_clocks(params);
+			break;
+		case HUBBUB_PROGRAM_WATERMARKS:
+			hwss_hubbub_program_watermarks(params);
+			break;
+		case HUBBUB_PROGRAM_ARBITER:
+			hwss_hubbub_program_arbiter(params);
+			break;
+		case HUBBUB_PROGRAM_COMPBUF_SEGMENTS:
+			hwss_hubbub_program_compbuf_segments(params);
+			break;
 		default:
 			ASSERT(false);
 			break;
@@ -3849,6 +3865,70 @@ void hwss_dsc_set_config_simple(union block_sequence_params *params)
 		dsc->funcs->dsc_set_config(dsc, dsc_cfg, dsc_optc_cfg);
 }
 
+/*
+ * Clock manager executor functions
+ */
+void hwss_clk_mgr_set_max_memclk(union block_sequence_params *params)
+{
+	struct clk_mgr *clk_mgr = params->clk_mgr_set_max_memclk_params.clk_mgr;
+	unsigned int memclk_mhz = params->clk_mgr_set_max_memclk_params.memclk_mhz;
+
+	if (clk_mgr && clk_mgr->funcs && clk_mgr->funcs->set_max_memclk)
+		clk_mgr->funcs->set_max_memclk(clk_mgr, memclk_mhz);
+}
+
+void hwss_clk_mgr_update_clocks(union block_sequence_params *params)
+{
+	struct clk_mgr *clk_mgr = params->clk_mgr_update_clocks_params.clk_mgr;
+
+	if (clk_mgr && clk_mgr->funcs && clk_mgr->funcs->execute_clk_mgr_block_sequence)
+		clk_mgr->funcs->execute_clk_mgr_block_sequence(clk_mgr);
+}
+
+/*
+ * Hubbub executor functions
+ */
+void hwss_hubbub_program_watermarks(union block_sequence_params *params)
+{
+	struct dc *dc = params->hubbub_program_watermarks_params.dc;
+	struct hubbub *hubbub = params->hubbub_program_watermarks_params.hubbub;
+	union dcn_watermark_set *watermarks = params->hubbub_program_watermarks_params.watermarks;
+	unsigned int refclk_mhz = params->hubbub_program_watermarks_params.refclk_mhz;
+	bool safe_to_lower = params->hubbub_program_watermarks_params.safe_to_lower;
+
+	if (hubbub && hubbub->funcs && hubbub->funcs->program_watermarks) {
+		bool wm_changed = hubbub->funcs->program_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower);
+
+		if (dc && !safe_to_lower)
+			dc->optimized_required |= wm_changed;
+	}
+}
+
+void hwss_hubbub_program_arbiter(union block_sequence_params *params)
+{
+	struct dc *dc = params->hubbub_program_arbiter_params.dc;
+	struct hubbub *hubbub = params->hubbub_program_arbiter_params.hubbub;
+	struct dml2_display_arb_regs *arb_regs = params->hubbub_program_arbiter_params.arb_regs;
+	bool safe_to_lower = params->hubbub_program_arbiter_params.safe_to_lower;
+
+	if (hubbub && hubbub->funcs && hubbub->funcs->program_arbiter) {
+		bool arb_changed = hubbub->funcs->program_arbiter(hubbub, arb_regs, safe_to_lower);
+
+		if (dc && !safe_to_lower)
+			dc->optimized_required |= arb_changed;
+	}
+}
+
+void hwss_hubbub_program_compbuf_segments(union block_sequence_params *params)
+{
+	struct hubbub *hubbub = params->hubbub_program_compbuf_segments_params.hubbub;
+	unsigned int compbuf_size = params->hubbub_program_compbuf_segments_params.compbuf_size;
+	bool safe_to_lower = params->hubbub_program_compbuf_segments_params.safe_to_lower;
+
+	if (hubbub && hubbub->funcs && hubbub->funcs->program_compbuf_segments)
+		hubbub->funcs->program_compbuf_segments(hubbub, compbuf_size, safe_to_lower);
+}
+
 void hwss_add_dccg_set_dto_dscclk(struct block_sequence_state *seq_state,
 		struct dccg *dccg, int inst, int num_slices_h)
 {
@@ -4909,6 +4989,9 @@ void hwss_add_hpo_dp_stream_enc_update_dp_info_packets_sdp_line_num(struct block
 	}
 }
 
+/*
+ * Clock manager helper functions
+ */
 void hwss_add_hpo_dp_stream_enc_update_dp_info_packets(struct block_sequence_state *seq_state,
 		struct pipe_ctx *pipe_ctx)
 {
@@ -4919,6 +5002,28 @@ void hwss_add_hpo_dp_stream_enc_update_dp_info_packets(struct block_sequence_sta
 	}
 }
 
+void hwss_add_clk_mgr_set_max_memclk(struct block_sequence_state *seq_state,
+		struct clk_mgr *clk_mgr,
+		unsigned int memclk_mhz)
+{
+	if (*seq_state->num_steps < MAX_HWSS_BLOCK_SEQUENCE_SIZE) {
+		seq_state->steps[*seq_state->num_steps].func = CLK_MGR_SET_MAX_MEMCLK;
+		seq_state->steps[*seq_state->num_steps].params.clk_mgr_set_max_memclk_params.clk_mgr = clk_mgr;
+		seq_state->steps[*seq_state->num_steps].params.clk_mgr_set_max_memclk_params.memclk_mhz = memclk_mhz;
+		(*seq_state->num_steps)++;
+	}
+}
+
+void hwss_add_clk_mgr_update_clocks(struct block_sequence_state *seq_state,
+		struct clk_mgr *clk_mgr)
+{
+	if (*seq_state->num_steps < MAX_HWSS_BLOCK_SEQUENCE_SIZE) {
+		seq_state->steps[*seq_state->num_steps].func = CLK_MGR_UPDATE_CLOCKS;
+		seq_state->steps[*seq_state->num_steps].params.clk_mgr_update_clocks_params.clk_mgr = clk_mgr;
+		(*seq_state->num_steps)++;
+	}
+}
+
 void hwss_add_stream_enc_update_dp_info_packets_sdp_line_num(struct block_sequence_state *seq_state,
 		struct pipe_ctx *pipe_ctx)
 {
@@ -5022,6 +5127,26 @@ void hwss_add_setup_periodic_interrupt(struct block_sequence_state *seq_state,
 		(*seq_state->num_steps)++;
 	}
 }
+/*
+ * Hubbub helper functions
+ */
+void hwss_add_hubbub_program_watermarks(struct block_sequence_state *seq_state,
+		struct dc *dc,
+		struct hubbub *hubbub,
+		union dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	if (*seq_state->num_steps < MAX_HWSS_BLOCK_SEQUENCE_SIZE) {
+		seq_state->steps[*seq_state->num_steps].func = HUBBUB_PROGRAM_WATERMARKS;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_watermarks_params.dc = dc;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_watermarks_params.hubbub = hubbub;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_watermarks_params.watermarks = watermarks;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_watermarks_params.refclk_mhz = refclk_mhz;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_watermarks_params.safe_to_lower = safe_to_lower;
+		(*seq_state->num_steps)++;
+	}
+}
 
 void hwss_add_dp_trace_source_sequence(struct block_sequence_state *seq_state,
 		struct dc_link *link,
@@ -5035,6 +5160,22 @@ void hwss_add_dp_trace_source_sequence(struct block_sequence_state *seq_state,
 	}
 }
 
+void hwss_add_hubbub_program_arbiter(struct block_sequence_state *seq_state,
+		struct dc *dc,
+		struct hubbub *hubbub,
+		struct dml2_display_arb_regs *arb_regs,
+		bool safe_to_lower)
+{
+	if (*seq_state->num_steps < MAX_HWSS_BLOCK_SEQUENCE_SIZE) {
+		seq_state->steps[*seq_state->num_steps].func = HUBBUB_PROGRAM_ARBITER;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_arbiter_params.dc = dc;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_arbiter_params.hubbub = hubbub;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_arbiter_params.arb_regs = arb_regs;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_arbiter_params.safe_to_lower = safe_to_lower;
+		(*seq_state->num_steps)++;
+	}
+}
+
 void hwss_add_set_dmdata_attributes(struct block_sequence_state *seq_state,
 		struct pipe_ctx *pipe_ctx)
 {
@@ -5119,6 +5260,19 @@ void hwss_add_disable_audio_stream(struct block_sequence_state *seq_state,
 		(*seq_state->num_steps)++;
 	}
 }
+void hwss_add_hubbub_program_compbuf_segments(struct block_sequence_state *seq_state,
+		struct hubbub *hubbub,
+		unsigned int compbuf_size,
+		bool safe_to_lower)
+{
+	if (*seq_state->num_steps < MAX_HWSS_BLOCK_SEQUENCE_SIZE) {
+		seq_state->steps[*seq_state->num_steps].func = HUBBUB_PROGRAM_COMPBUF_SEGMENTS;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_compbuf_segments_params.hubbub = hubbub;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_compbuf_segments_params.compbuf_size = compbuf_size;
+		seq_state->steps[*seq_state->num_steps].params.hubbub_program_compbuf_segments_params.safe_to_lower = safe_to_lower;
+		(*seq_state->num_steps)++;
+	}
+}
 
 void hwss_add_prepare_bandwidth(struct block_sequence_state *seq_state,
 		struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index b708881222e8..632f183fe755 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -1496,6 +1496,57 @@ void dcn401_prepare_bandwidth(struct dc *dc,
 	}
 }
 
+void dcn401_prepare_bandwidth_sequence(struct dc *dc,
+		struct dc_state *context,
+		struct block_sequence_state *seq_state)
+{
+	struct hubbub *hubbub = dc->res_pool->hubbub;
+	bool p_state_change_support = context->bw_ctx.bw.dcn.clk.p_state_change_support;
+	unsigned int compbuf_size = 0;
+
+	/* Any transition into P-State support should disable MCLK switching first to avoid hangs */
+	if (p_state_change_support) {
+		dc->optimized_required = true;
+		context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
+	}
+
+	if (dc->clk_mgr->dc_mode_softmax_enabled)
+		if (dc->clk_mgr->clks.dramclk_khz <= (int)dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000 &&
+				context->bw_ctx.bw.dcn.clk.dramclk_khz > (int)dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
+			hwss_add_clk_mgr_set_max_memclk(seq_state, dc->clk_mgr,
+					dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
+
+	/* Build bandwidth and display clocks back-to-back (SW calc + append BLS steps) */
+	if (dc->clk_mgr->funcs->build_clock_update_for_bls)
+		dc->clk_mgr->funcs->build_clock_update_for_bls(
+				dc->clk_mgr, context, false, seq_state);
+
+	hwss_add_hubbub_program_watermarks(seq_state, dc, hubbub,
+					&context->bw_ctx.bw.dcn.watermarks,
+					dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000,
+					false);
+
+	if (hubbub->funcs->program_arbiter)
+		hwss_add_hubbub_program_arbiter(seq_state, dc, hubbub,
+				&context->bw_ctx.bw.dcn.arb_regs, false);
+
+	if (hubbub->funcs->program_compbuf_segments) {
+		compbuf_size = context->bw_ctx.bw.dcn.arb_regs.compbuf_size;
+		dc->optimized_required |= (compbuf_size != dc->current_state->bw_ctx.bw.dcn.arb_regs.compbuf_size);
+
+		hwss_add_hubbub_program_compbuf_segments(seq_state, hubbub, compbuf_size, false);
+	}
+
+	if (dc->debug.fams2_config.bits.enable) {
+		dcn401_dmub_hw_control_lock(dc, context, true);
+		dcn401_fams2_update_config(dc, context, false);
+		dcn401_dmub_hw_control_lock(dc, context, false);
+	}
+
+	if (p_state_change_support != context->bw_ctx.bw.dcn.clk.p_state_change_support)
+		context->bw_ctx.bw.dcn.clk.p_state_change_support = p_state_change_support;
+}
+
 void dcn401_optimize_bandwidth(
 		struct dc *dc,
 		struct dc_state *context)
@@ -1549,6 +1600,50 @@ void dcn401_optimize_bandwidth(
 	}
 }
 
+/*
+ * optimize_bandwidth_sequence is unused for now. It will be used when
+ * dc_commit_state_no_check is moved into block sequence pattern, similar
+ * to how commit_planes_do_stream_update_sequence replaces
+ * commit_planes_do_stream_update.
+ */
+void dcn401_optimize_bandwidth_sequence(struct dc *dc,
+		struct dc_state *context,
+		struct block_sequence_state *seq_state)
+{
+	struct hubbub *hubbub = dc->res_pool->hubbub;
+
+	/* enable fams2 if needed */
+	if (dc->debug.fams2_config.bits.enable) {
+		dcn401_dmub_hw_control_lock(dc, context, true);
+		dcn401_fams2_update_config(dc, context, true);
+		dcn401_dmub_hw_control_lock(dc, context, false);
+	}
+
+	hwss_add_hubbub_program_watermarks(seq_state, dc, hubbub,
+					&context->bw_ctx.bw.dcn.watermarks,
+					dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000,
+					true);
+
+	if (hubbub->funcs->program_arbiter)
+		hwss_add_hubbub_program_arbiter(seq_state, dc, hubbub,
+				&context->bw_ctx.bw.dcn.arb_regs, true);
+
+	if (dc->clk_mgr->dc_mode_softmax_enabled)
+		if (dc->clk_mgr->clks.dramclk_khz > (int)dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000 &&
+				context->bw_ctx.bw.dcn.clk.dramclk_khz <= (int)dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
+			hwss_add_clk_mgr_set_max_memclk(seq_state, dc->clk_mgr,
+					dc->clk_mgr->bw_params->dc_mode_softmax_memclk);
+
+	if (hubbub->funcs->program_compbuf_segments)
+		hwss_add_hubbub_program_compbuf_segments(seq_state, hubbub,
+				context->bw_ctx.bw.dcn.arb_regs.compbuf_size, true);
+
+	/* Build bandwidth and display clocks (SW calc + append BLS steps) */
+	if (dc->clk_mgr->funcs->build_clock_update_for_bls)
+		dc->clk_mgr->funcs->build_clock_update_for_bls(
+				dc->clk_mgr, context, true, seq_state);
+}
+
 void dcn401_dmub_hw_control_lock(struct dc *dc,
 		struct dc_state *context,
 		bool lock)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index 2afeafc902c7..a760050eea8c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -70,10 +70,20 @@ void dcn401_wait_for_dcc_meta_propagation(const struct dc *dc,
 void dcn401_prepare_bandwidth(struct dc *dc,
 		struct dc_state *context);
 
+struct block_sequence_state;
+
+void dcn401_prepare_bandwidth_sequence(struct dc *dc,
+		struct dc_state *context,
+		struct block_sequence_state *seq_state);
+
 void dcn401_optimize_bandwidth(
 		struct dc *dc,
 		struct dc_state *context);
 
+void dcn401_optimize_bandwidth_sequence(struct dc *dc,
+		struct dc_state *context,
+		struct block_sequence_state *seq_state);
+
 void dcn401_dmub_hw_control_lock(struct dc *dc,
 		struct dc_state *context,
 		bool lock);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index 33b2cf344f1e..f206e221f926 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -44,7 +44,9 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.interdependent_update_lock = dcn401_interdependent_update_lock,
 	.cursor_lock = dcn10_cursor_lock,
 	.prepare_bandwidth = dcn401_prepare_bandwidth,
+	.prepare_bandwidth_sequence = dcn401_prepare_bandwidth_sequence,
 	.optimize_bandwidth = dcn401_optimize_bandwidth,
+	.optimize_bandwidth_sequence = dcn401_optimize_bandwidth_sequence,
 	.update_bandwidth = dcn401_update_bandwidth,
 	.set_drr = dcn10_set_drr,
 	.get_position = dcn10_get_position,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index dfb278a9fc3e..65df8002d3d7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -894,6 +894,36 @@ struct disable_audio_stream_params {
 	struct pipe_ctx *pipe_ctx;
 };
 
+struct clk_mgr_set_max_memclk_params {
+	struct clk_mgr *clk_mgr;
+	unsigned int memclk_mhz;
+};
+
+struct clk_mgr_update_clocks_params {
+	struct clk_mgr *clk_mgr;
+};
+
+struct hubbub_program_watermarks_params {
+	struct dc *dc;
+	struct hubbub *hubbub;
+	union dcn_watermark_set *watermarks;
+	unsigned int refclk_mhz;
+	bool safe_to_lower;
+};
+
+struct hubbub_program_arbiter_params {
+	struct dc *dc;
+	struct hubbub *hubbub;
+	struct dml2_display_arb_regs *arb_regs;
+	bool safe_to_lower;
+};
+
+struct hubbub_program_compbuf_segments_params {
+	struct hubbub *hubbub;
+	unsigned int compbuf_size;
+	bool safe_to_lower;
+};
+
 struct prepare_bandwidth_params {
 	struct dc *dc;
 	struct dc_state *context;
@@ -1057,6 +1087,11 @@ union block_sequence_params {
 	struct disable_audio_stream_params disable_audio_stream_params;
 	struct prepare_bandwidth_params prepare_bandwidth_params;
 	struct link_set_dpms_on_params link_set_dpms_on_params;
+	struct clk_mgr_set_max_memclk_params clk_mgr_set_max_memclk_params;
+	struct clk_mgr_update_clocks_params clk_mgr_update_clocks_params;
+	struct hubbub_program_watermarks_params hubbub_program_watermarks_params;
+	struct hubbub_program_arbiter_params hubbub_program_arbiter_params;
+	struct hubbub_program_compbuf_segments_params hubbub_program_compbuf_segments_params;
 };
 
 enum block_sequence_func {
@@ -1209,6 +1244,11 @@ enum block_sequence_func {
 	DISABLE_AUDIO_STREAM,
 	PREPARE_BANDWIDTH,
 	LINK_SET_DPMS_ON,
+	CLK_MGR_SET_MAX_MEMCLK,
+	CLK_MGR_UPDATE_CLOCKS,
+	HUBBUB_PROGRAM_WATERMARKS,
+	HUBBUB_PROGRAM_ARBITER,
+	HUBBUB_PROGRAM_COMPBUF_SEGMENTS,
 	/* This must be the last value in this enum, add new ones above */
 	HWSS_BLOCK_SEQUENCE_FUNC_COUNT
 };
@@ -1316,8 +1356,14 @@ struct hw_sequencer_funcs {
 
 	/* Bandwidth Related */
 	void (*prepare_bandwidth)(struct dc *dc, struct dc_state *context);
+	void (*prepare_bandwidth_sequence)(struct dc *dc,
+			struct dc_state *context,
+			struct block_sequence_state *seq_state);
 	bool (*update_bandwidth)(struct dc *dc, struct dc_state *context);
 	void (*optimize_bandwidth)(struct dc *dc, struct dc_state *context);
+	void (*optimize_bandwidth_sequence)(struct dc *dc,
+			struct dc_state *context,
+			struct block_sequence_state *seq_state);
 
 	/* Infopacket Related */
 	void (*set_avmute)(struct pipe_ctx *pipe_ctx, bool enable);
@@ -2475,4 +2521,40 @@ void hwss_add_link_set_dpms_on(struct block_sequence_state *seq_state,
 		struct dc_state *state,
 		struct pipe_ctx *pipe_ctx);
 
+/* Clock manager BLS executor functions */
+void hwss_clk_mgr_set_max_memclk(union block_sequence_params *params);
+void hwss_clk_mgr_update_clocks(union block_sequence_params *params);
+
+void hwss_hubbub_program_watermarks(union block_sequence_params *params);
+
+void hwss_hubbub_program_arbiter(union block_sequence_params *params);
+
+void hwss_hubbub_program_compbuf_segments(union block_sequence_params *params);
+
+/* Clock manager BLS add-helper functions */
+void hwss_add_clk_mgr_set_max_memclk(struct block_sequence_state *seq_state,
+		struct clk_mgr *clk_mgr,
+		unsigned int memclk_mhz);
+
+void hwss_add_clk_mgr_update_clocks(struct block_sequence_state *seq_state,
+		struct clk_mgr *clk_mgr);
+
+void hwss_add_hubbub_program_watermarks(struct block_sequence_state *seq_state,
+		struct dc *dc,
+		struct hubbub *hubbub,
+		union dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower);
+
+void hwss_add_hubbub_program_arbiter(struct block_sequence_state *seq_state,
+		struct dc *dc,
+		struct hubbub *hubbub,
+		struct dml2_display_arb_regs *arb_regs,
+		bool safe_to_lower);
+
+void hwss_add_hubbub_program_compbuf_segments(struct block_sequence_state *seq_state,
+		struct hubbub *hubbub,
+		unsigned int compbuf_size,
+		bool safe_to_lower);
+
 #endif /* __DC_HW_SEQUENCER_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 69c4a49a40fc..68dc2d4ba7ca 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -320,6 +320,8 @@ struct clk_states {
 	uint32_t dprefclk_khz;
 };
 
+struct block_sequence_state;
+
 struct clk_mgr_funcs {
 	/*
 	 * This function should set new clocks based on the input "safe_to_lower".
@@ -409,6 +411,12 @@ struct clk_mgr_funcs {
 	void (*get_requested_memory_qos)(
 			struct clk_mgr *clk_mgr,
 			struct dc_requested_memory_qos *qos);
+
+	void (*build_clock_update_for_bls)(struct clk_mgr *clk_mgr,
+			struct dc_state *context, bool safe_to_lower,
+			struct block_sequence_state *seq_state);
+
+	void (*execute_clk_mgr_block_sequence)(struct clk_mgr *clk_mgr);
 };
 
 struct clk_mgr {
-- 
2.53.0

