Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443759C12A
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Aug 2022 16:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87C011A517;
	Mon, 22 Aug 2022 14:00:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAC8F1E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Aug 2022 13:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9triw/jJHaBlK4A3I3Q11bDf6jm06ysi45jALiHFL25ySpp3SU6FpLe7HHYEbXYAhemU6FE6tgPv9Za7Z6AuMSKEVeW11kUw7vaSLzOMvQ19tBzJssxFhksfULUbjq9vjCEDBw0evsKk9ebUnWVrM118YZvq8DJdeJJSglXt3VyRp+spdcvBXBSah67MvCQBldBrc38IvroIl08DzcT1aA0CqAhurBPqnqGvOKEyTnq+NoVhAVQxLwfbPvaa+1ebNn5o/T6BI00BD46F39PTpcT1TS1bwg0rae8f+g4X1MCXG7FvhGR1ZyrUEr3le/QPPQI4C8edtdm9RPZa5gWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEuMA48K1xp+V5LhgA/WNgPXxnL4GMCX9Uu/8ZDiO1E=;
 b=Kyl2U84TEFNhkUMq8x3noivHyYAiLxGS6dEZxlWH5zKSxPL1zyMZZ7yJ0BHRBtxMhO8c83L41uE8jLyUS/Khcv+OSaQqEl6iUMiSNkAZNY1iNZ1anKh9z6jekp4ceaD7kZmIbFciel3JforQVwtH7fxzeGz4OlzYDAiTIkoN278aSG9ulM69csf0q4V3uNqLLq4Qlp9y11SKF4rQ95x0ldT/26nvqqVoTKUWWmtvy92nROPdTxCBuVJm2ROsl7wQgeHgS/AEVcCUrzlrxA5nGFK4P8qF6lWjBW/VF74/YPNQhbZ1fmqsMukeWRztk3EEtLuGjNMd7/xx67QY7fzvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEuMA48K1xp+V5LhgA/WNgPXxnL4GMCX9Uu/8ZDiO1E=;
 b=kOrIVhp+9p770XeMR60dnI/9lGwGqe/FW6msJ7LatrBYBSZlNmLfKARsf4iCrmjN+P56hHFXygo4dhVUR2R+Wx9SvuGJUph0aXDfZSYppi11VhSU0OIBYoCFkk6MFU0KkndSwDwXeHbSUJbVUfyNiAl7/aGTBu1ZtWsgOwPA3bA=
Received: from BN0PR04CA0205.namprd04.prod.outlook.com (2603:10b6:408:e9::30)
 by BN8PR12MB3090.namprd12.prod.outlook.com (2603:10b6:408:67::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 13:59:37 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::46) by BN0PR04CA0205.outlook.office365.com
 (2603:10b6:408:e9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Mon, 22 Aug 2022 13:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 13:59:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 22 Aug
 2022 08:59:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 22 Aug
 2022 06:59:18 -0700
Received: from brianchang-HP-EliteDesk-805-G6-Small-Form-Factor-PC.amd.com
 (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP
 Server id 15.1.2375.28 via Frontend Transport; Mon, 22 Aug 2022 08:59:09
 -0500
From: brichang <Brian.Chang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/14] drm/amd/display: change to runtime initialization for
 reg offsets for DCN32
Date: Mon, 22 Aug 2022 17:57:44 +0800
Message-ID: <20220822095752.3750614-7-Brian.Chang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822095752.3750614-1-Brian.Chang@amd.com>
References: <20220822095752.3750614-1-Brian.Chang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fae7d2-26f5-4b6c-9917-08da84468d31
X-MS-TrafficTypeDiagnostic: BN8PR12MB3090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaI/1YqIL5xVUKUHLiZiIjyVqX8s/9EKXG+an9ww7TkjLUQTiKtI4t9Lt1jmS2KPE+I/3pn+N2eINSHo9eMZMDrn/X4/haBngFwm1mjuKlxWBkpMQkg/fB+8tEIzCZKs4n6DrSLhZ314rXeD9oHwgrbvyLXhuIhYXwvm5nFq2AKAvOWqAb1qRFzvVvCJydeCAYUGbJwO0mZbCDEufeudll8+EhKtHl58xJoGDyoQdAvKbChauIKaa0A646w07Xf7/gGJaYeSuIEpz94TjV0+CvR0oXndE3kIyBR60THnhAzvZblYMbbelmI3fU4/kRwgT85dlxhNp+X7+GWKXee8HLcPXOdzo6N703anl7wYcg1ChY7oNuZkZ5rl16mHj1TIDzvCPekzgrJ2UiST6Z/2RXftZPNTo5o5gIAQpw9XZ5nU2I8pJ8mW3CidI4zfZ3O5dZ3QEvF1hTltYgwTW7dbhqvBfwG10V2+5DWBw06WcpnTnnvI+JGq0+iSxiU1aKRqwcanM6t1+FgtgygJAD+5MPxo070sxXkBT4MBaWYZ9ZquT+3D1PL38IG1srP15rnalzZ2Gj+DfSxpfzafgALyXq7exbQX8bi6uTLi2wNYT44z/KWLK/oWpQMQKcHWk2/tIg6YeYXXPqj5c4DB6ORjNOsq87XwPlQuR2Wf3hQqOs3+5qI30lfw9KlxULJEUWJ1TkhpS7+eBa4dcqXZRPPU6bVryknP4ubUOazShpOUriEjSJ857BKRGNI911DWOl3pVg3CnAwJGiG/+Q5FN1EhparEMx0DG+xmyivLaIhiycrikFngEI9MRd2SAUJx1VBYfNGC30orYKUlD3DkTmSyCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(6666004)(7696005)(426003)(83380400001)(186003)(1076003)(47076005)(336012)(8936002)(26005)(2616005)(2906002)(30864003)(40460700003)(82310400005)(5660300002)(40480700001)(316002)(6916009)(54906003)(4326008)(8676002)(70586007)(86362001)(81166007)(70206006)(82740400003)(36860700001)(36756003)(356005)(43062005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:59:37.6199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fae7d2-26f5-4b6c-9917-08da84468d31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3090
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
Cc: stylon.wang@amd.com, Brian Chang <Brian.Chang@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, solomon.chiu@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

DC was using compile time initialization of register addresses using
SR_* macros and their variants. These have been converted to use runtime
initialization.

The REG_STRUCT macro is a definition that is added to SR_* macros.
During initialization, this must be defined before SR_* macros are
invoked, which are in turn invoked through various IP initialization macros.

Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Acked-by: Brian Chang <Brian.Chang@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 641 +++++------
 .../drm/amd/display/dc/dcn32/dcn32_resource.h | 997 ++++++++++++++++++
 2 files changed, 1343 insertions(+), 295 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 1524b6d1ce34..b8a9606863f8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -131,79 +131,94 @@ enum dcn32_clk_src_array_id {
 /* DCN */
 /* TODO awful hack. fixup dcn20_dwb.h */
 #undef BASE_INNER
-#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+#define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
 
 #define BASE(seg) BASE_INNER(seg)
 
 #define SR(reg_name)\
-		.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
+		REG_STRUCT.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
 					reg ## reg_name
+#define SR_ARR(reg_name, id) \
+	REG_STRUCT[id].reg_name = BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+
+#define SR_ARR_INIT(reg_name, id, value) \
+	REG_STRUCT[id].reg_name = value
 
 #define SRI(reg_name, block, id)\
-	.reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
-					reg ## block ## id ## _ ## reg_name
+	REG_STRUCT.reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
+#define SRI_ARR_ALPHABET(reg_name, block, index, id)\
+	REG_STRUCT[index].reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
 
 #define SRI2(reg_name, block, id)\
-	.reg_name = BASE(reg ## reg_name ## _BASE_IDX) + \
-					reg ## reg_name
+	.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +	\
+		reg ## reg_name
+#define SRI2_ARR(reg_name, block, id)\
+	REG_STRUCT[id].reg_name = BASE(reg ## reg_name ## _BASE_IDX) +	\
+		reg ## reg_name
 
 #define SRIR(var_name, reg_name, block, id)\
 	.var_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
-					reg ## block ## id ## _ ## reg_name
+		reg ## block ## id ## _ ## reg_name
 
 #define SRII(reg_name, block, id)\
-	.reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
 					reg ## block ## id ## _ ## reg_name
 
+#define SRII_ARR_2(reg_name, block, id, inst)\
+	REG_STRUCT[inst].reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
+
 #define SRII_MPC_RMU(reg_name, block, id)\
 	.RMU##_##reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
-					reg ## block ## id ## _ ## reg_name
+		reg ## block ## id ## _ ## reg_name
 
 #define SRII_DWB(reg_name, temp_name, block, id)\
-	.reg_name[id] = BASE(reg ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
-					reg ## block ## id ## _ ## temp_name
+	REG_STRUCT.reg_name[id] = BASE(reg ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## temp_name
 
 #define DCCG_SRII(reg_name, block, id)\
-	.block ## _ ## reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
-					reg ## block ## id ## _ ## reg_name
+	REG_STRUCT.block ## _ ## reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		reg ## block ## id ## _ ## reg_name
 
 #define VUPDATE_SRII(reg_name, block, id)\
-	.reg_name[id] = BASE(reg ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
-					reg ## reg_name ## _ ## block ## id
+	REG_STRUCT.reg_name[id] = BASE(reg ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+		reg ## reg_name ## _ ## block ## id
 
 /* NBIO */
-#define NBIO_BASE_INNER(seg) \
-	NBIO_BASE__INST0_SEG ## seg
+#define NBIO_BASE_INNER(seg) ctx->nbio_reg_offsets[seg]
 
 #define NBIO_BASE(seg) \
 	NBIO_BASE_INNER(seg)
 
 #define NBIO_SR(reg_name)\
-		.reg_name = NBIO_BASE(regBIF_BX0_ ## reg_name ## _BASE_IDX) + \
-					regBIF_BX0_ ## reg_name
+	REG_STRUCT.reg_name = NBIO_BASE(regBIF_BX0_ ## reg_name ## _BASE_IDX) + \
+			regBIF_BX0_ ## reg_name
+#define NBIO_SR_ARR(reg_name, id)\
+	REG_STRUCT[id].reg_name = NBIO_BASE(regBIF_BX0_ ## reg_name ## _BASE_IDX) + \
+		regBIF_BX0_ ## reg_name
 
 #undef CTX
 #define CTX ctx
 #define REG(reg_name) \
-	(DCN_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+	(ctx->dcn_reg_offsets[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
 
-static const struct bios_registers bios_regs = {
-		NBIO_SR(BIOS_SCRATCH_3),
+static struct bios_registers bios_regs;
+
+#define bios_regs_init() \
+		NBIO_SR(BIOS_SCRATCH_3),\
 		NBIO_SR(BIOS_SCRATCH_6)
-};
 
-#define clk_src_regs(index, pllid)\
-[index] = {\
-	CS_COMMON_REG_LIST_DCN3_0(index, pllid),\
-}
+#define clk_src_regs_init(index, pllid)\
+	CS_COMMON_REG_LIST_DCN3_0_RI(index, pllid)
 
-static const struct dce110_clk_src_regs clk_src_regs[] = {
-	clk_src_regs(0, A),
-	clk_src_regs(1, B),
-	clk_src_regs(2, C),
-	clk_src_regs(3, D),
-	clk_src_regs(4, E)
-};
+static struct dce110_clk_src_regs clk_src_regs[5];
 
 static const struct dce110_clk_src_shift cs_shift = {
 		CS_COMMON_MASK_SH_LIST_DCN3_2(__SHIFT)
@@ -213,17 +228,10 @@ static const struct dce110_clk_src_mask cs_mask = {
 		CS_COMMON_MASK_SH_LIST_DCN3_2(_MASK)
 };
 
-#define abm_regs(id)\
-[id] = {\
-		ABM_DCN32_REG_LIST(id)\
-}
+#define abm_regs_init(id)\
+		ABM_DCN32_REG_LIST_RI(id)
 
-static const struct dce_abm_registers abm_regs[] = {
-		abm_regs(0),
-		abm_regs(1),
-		abm_regs(2),
-		abm_regs(3),
-};
+static struct dce_abm_registers abm_regs[4];
 
 static const struct dce_abm_shift abm_shift = {
 		ABM_MASK_SH_LIST_DCN32(__SHIFT)
@@ -233,18 +241,10 @@ static const struct dce_abm_mask abm_mask = {
 		ABM_MASK_SH_LIST_DCN32(_MASK)
 };
 
-#define audio_regs(id)\
-[id] = {\
-		AUD_COMMON_REG_LIST(id)\
-}
+#define audio_regs_init(id)\
+		AUD_COMMON_REG_LIST_RI(id)
 
-static const struct dce_audio_registers audio_regs[] = {
-	audio_regs(0),
-	audio_regs(1),
-	audio_regs(2),
-	audio_regs(3),
-	audio_regs(4)
-};
+static struct dce_audio_registers audio_regs[5];
 
 #define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
 		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
@@ -259,23 +259,10 @@ static const struct dce_audio_mask audio_mask = {
 		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
 };
 
-#define vpg_regs(id)\
-[id] = {\
-	VPG_DCN3_REG_LIST(id)\
-}
+#define vpg_regs_init(id)\
+	VPG_DCN3_REG_LIST_RI(id)
 
-static const struct dcn30_vpg_registers vpg_regs[] = {
-	vpg_regs(0),
-	vpg_regs(1),
-	vpg_regs(2),
-	vpg_regs(3),
-	vpg_regs(4),
-	vpg_regs(5),
-	vpg_regs(6),
-	vpg_regs(7),
-	vpg_regs(8),
-	vpg_regs(9),
-};
+static struct dcn30_vpg_registers vpg_regs[10];
 
 static const struct dcn30_vpg_shift vpg_shift = {
 	DCN3_VPG_MASK_SH_LIST(__SHIFT)
@@ -285,19 +272,10 @@ static const struct dcn30_vpg_mask vpg_mask = {
 	DCN3_VPG_MASK_SH_LIST(_MASK)
 };
 
-#define afmt_regs(id)\
-[id] = {\
-	AFMT_DCN3_REG_LIST(id)\
-}
+#define afmt_regs_init(id)\
+	AFMT_DCN3_REG_LIST_RI(id)
 
-static const struct dcn30_afmt_registers afmt_regs[] = {
-	afmt_regs(0),
-	afmt_regs(1),
-	afmt_regs(2),
-	afmt_regs(3),
-	afmt_regs(4),
-	afmt_regs(5)
-};
+static struct dcn30_afmt_registers afmt_regs[6];
 
 static const struct dcn30_afmt_shift afmt_shift = {
 	DCN3_AFMT_MASK_SH_LIST(__SHIFT)
@@ -307,17 +285,10 @@ static const struct dcn30_afmt_mask afmt_mask = {
 	DCN3_AFMT_MASK_SH_LIST(_MASK)
 };
 
-#define apg_regs(id)\
-[id] = {\
-	APG_DCN31_REG_LIST(id)\
-}
+#define apg_regs_init(id)\
+	APG_DCN31_REG_LIST_RI(id)
 
-static const struct dcn31_apg_registers apg_regs[] = {
-	apg_regs(0),
-	apg_regs(1),
-	apg_regs(2),
-	apg_regs(3)
-};
+static struct dcn31_apg_registers apg_regs[4];
 
 static const struct dcn31_apg_shift apg_shift = {
 	DCN31_APG_MASK_SH_LIST(__SHIFT)
@@ -327,18 +298,10 @@ static const struct dcn31_apg_mask apg_mask = {
 		DCN31_APG_MASK_SH_LIST(_MASK)
 };
 
-#define stream_enc_regs(id)\
-[id] = {\
-	SE_DCN32_REG_LIST(id)\
-}
+#define stream_enc_regs_init(id)\
+	SE_DCN32_REG_LIST_RI(id)
 
-static const struct dcn10_stream_enc_registers stream_enc_regs[] = {
-	stream_enc_regs(0),
-	stream_enc_regs(1),
-	stream_enc_regs(2),
-	stream_enc_regs(3),
-	stream_enc_regs(4)
-};
+static struct dcn10_stream_enc_registers stream_enc_regs[5];
 
 static const struct dcn10_stream_encoder_shift se_shift = {
 		SE_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
@@ -349,46 +312,22 @@ static const struct dcn10_stream_encoder_mask se_mask = {
 };
 
 
-#define aux_regs(id)\
-[id] = {\
-	DCN2_AUX_REG_LIST(id)\
-}
+#define aux_regs_init(id)\
+	DCN2_AUX_REG_LIST_RI(id)
 
-static const struct dcn10_link_enc_aux_registers link_enc_aux_regs[] = {
-		aux_regs(0),
-		aux_regs(1),
-		aux_regs(2),
-		aux_regs(3),
-		aux_regs(4)
-};
+static struct dcn10_link_enc_aux_registers link_enc_aux_regs[5];
 
-#define hpd_regs(id)\
-[id] = {\
-	HPD_REG_LIST(id)\
-}
+#define hpd_regs_init(id)\
+	HPD_REG_LIST_RI(id)
 
-static const struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[] = {
-		hpd_regs(0),
-		hpd_regs(1),
-		hpd_regs(2),
-		hpd_regs(3),
-		hpd_regs(4)
-};
+static struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[5];
 
-#define link_regs(id, phyid)\
-[id] = {\
-	LE_DCN31_REG_LIST(id), \
-	UNIPHY_DCN2_REG_LIST(phyid), \
+#define link_regs_init(id, phyid)\
+	LE_DCN31_REG_LIST_RI(id), \
+	UNIPHY_DCN2_REG_LIST_RI(id, phyid)
 	/*DPCS_DCN31_REG_LIST(id),*/ \
-}
 
-static const struct dcn10_link_enc_registers link_enc_regs[] = {
-	link_regs(0, A),
-	link_regs(1, B),
-	link_regs(2, C),
-	link_regs(3, D),
-	link_regs(4, E)
-};
+static struct dcn10_link_enc_registers link_enc_regs[5];
 
 static const struct dcn10_link_enc_shift le_shift = {
 	LINK_ENCODER_MASK_SH_LIST_DCN31(__SHIFT), \
@@ -401,17 +340,10 @@ static const struct dcn10_link_enc_mask le_mask = {
 	//DPCS_DCN31_MASK_SH_LIST(_MASK)
 };
 
-#define hpo_dp_stream_encoder_reg_list(id)\
-[id] = {\
-	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST(id)\
-}
+#define hpo_dp_stream_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
 
-static const struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[] = {
-	hpo_dp_stream_encoder_reg_list(0),
-	hpo_dp_stream_encoder_reg_list(1),
-	hpo_dp_stream_encoder_reg_list(2),
-	hpo_dp_stream_encoder_reg_list(3),
-};
+static struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[4];
 
 static const struct dcn31_hpo_dp_stream_encoder_shift hpo_dp_se_shift = {
 	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(__SHIFT)
@@ -422,20 +354,14 @@ static const struct dcn31_hpo_dp_stream_encoder_mask hpo_dp_se_mask = {
 };
 
 
-#define hpo_dp_link_encoder_reg_list(id)\
-[id] = {\
-	DCN3_1_HPO_DP_LINK_ENC_REG_LIST(id),\
-	/*DCN3_1_RDPCSTX_REG_LIST(0),*/\
-	/*DCN3_1_RDPCSTX_REG_LIST(1),*/\
-	/*DCN3_1_RDPCSTX_REG_LIST(2),*/\
-	/*DCN3_1_RDPCSTX_REG_LIST(3),*/\
-	/*DCN3_1_RDPCSTX_REG_LIST(4)*/\
-}
+#define hpo_dp_link_encoder_reg_init(id)\
+	DCN3_1_HPO_DP_LINK_ENC_REG_LIST_RI(id)
+	/*DCN3_1_RDPCSTX_REG_LIST(0),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(1),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(2),*/
+	/*DCN3_1_RDPCSTX_REG_LIST(3),*/
 
-static const struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[] = {
-	hpo_dp_link_encoder_reg_list(0),
-	hpo_dp_link_encoder_reg_list(1),
-};
+static struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[2];
 
 static const struct dcn31_hpo_dp_link_encoder_shift hpo_dp_le_shift = {
 	DCN3_2_HPO_DP_LINK_ENC_MASK_SH_LIST(__SHIFT)
@@ -445,17 +371,10 @@ static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
 	DCN3_2_HPO_DP_LINK_ENC_MASK_SH_LIST(_MASK)
 };
 
-#define dpp_regs(id)\
-[id] = {\
-	DPP_REG_LIST_DCN30_COMMON(id),\
-}
+#define dpp_regs_init(id)\
+	DPP_REG_LIST_DCN30_COMMON_RI(id)
 
-static const struct dcn3_dpp_registers dpp_regs[] = {
-	dpp_regs(0),
-	dpp_regs(1),
-	dpp_regs(2),
-	dpp_regs(3)
-};
+static struct dcn3_dpp_registers dpp_regs[4];
 
 static const struct dcn3_dpp_shift tf_shift = {
 		DPP_REG_LIST_SH_MASK_DCN30_COMMON(__SHIFT)
@@ -466,17 +385,10 @@ static const struct dcn3_dpp_mask tf_mask = {
 };
 
 
-#define opp_regs(id)\
-[id] = {\
-	OPP_REG_LIST_DCN30(id),\
-}
+#define opp_regs_init(id)\
+	OPP_REG_LIST_DCN30_RI(id)
 
-static const struct dcn20_opp_registers opp_regs[] = {
-	opp_regs(0),
-	opp_regs(1),
-	opp_regs(2),
-	opp_regs(3)
-};
+static struct dcn20_opp_registers opp_regs[4];
 
 static const struct dcn20_opp_shift opp_shift = {
 	OPP_MASK_SH_LIST_DCN20(__SHIFT)
@@ -486,21 +398,14 @@ static const struct dcn20_opp_mask opp_mask = {
 	OPP_MASK_SH_LIST_DCN20(_MASK)
 };
 
-#define aux_engine_regs(id)\
-[id] = {\
-	AUX_COMMON_REG_LIST0(id), \
-	.AUXN_IMPCAL = 0, \
-	.AUXP_IMPCAL = 0, \
-	.AUX_RESET_MASK = DP_AUX0_AUX_CONTROL__AUX_RESET_MASK, \
-}
+#define aux_engine_regs_init(id)\
+	AUX_COMMON_REG_LIST0_RI(id), \
+	SR_ARR_INIT(AUXN_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUXP_IMPCAL, id, 0), \
+	SR_ARR_INIT(AUX_RESET_MASK, id, DP_AUX0_AUX_CONTROL__AUX_RESET_MASK), \
+	SR_ARR_INIT(AUX_RESET_MASK, id, DP_AUX0_AUX_CONTROL__AUX_RESET_MASK)
 
-static const struct dce110_aux_registers aux_engine_regs[] = {
-		aux_engine_regs(0),
-		aux_engine_regs(1),
-		aux_engine_regs(2),
-		aux_engine_regs(3),
-		aux_engine_regs(4)
-};
+static struct dce110_aux_registers aux_engine_regs[5];
 
 static const struct dce110_aux_registers_shift aux_shift = {
 	DCN_AUX_MASK_SH_LIST(__SHIFT)
@@ -510,15 +415,10 @@ static const struct dce110_aux_registers_mask aux_mask = {
 	DCN_AUX_MASK_SH_LIST(_MASK)
 };
 
+#define dwbc_regs_dcn3_init(id)\
+	DWBC_COMMON_REG_LIST_DCN30_RI(id)
 
-#define dwbc_regs_dcn3(id)\
-[id] = {\
-	DWBC_COMMON_REG_LIST_DCN30(id),\
-}
-
-static const struct dcn30_dwbc_registers dwbc30_regs[] = {
-	dwbc_regs_dcn3(0),
-};
+static struct dcn30_dwbc_registers dwbc30_regs[1];
 
 static const struct dcn30_dwbc_shift dwbc30_shift = {
 	DWBC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
@@ -528,14 +428,10 @@ static const struct dcn30_dwbc_mask dwbc30_mask = {
 	DWBC_COMMON_MASK_SH_LIST_DCN30(_MASK)
 };
 
-#define mcif_wb_regs_dcn3(id)\
-[id] = {\
-	MCIF_WB_COMMON_REG_LIST_DCN32(id),\
-}
+#define mcif_wb_regs_dcn3_init(id)\
+	MCIF_WB_COMMON_REG_LIST_DCN32_RI(id)
 
-static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
-	mcif_wb_regs_dcn3(0)
-};
+static struct dcn30_mmhubbub_registers mcif_wb30_regs[1];
 
 static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
 	MCIF_WB_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
@@ -545,17 +441,10 @@ static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
 	MCIF_WB_COMMON_MASK_SH_LIST_DCN32(_MASK)
 };
 
-#define dsc_regsDCN20(id)\
-[id] = {\
-	DSC_REG_LIST_DCN20(id)\
-}
+#define dsc_regsDCN20_init(id)\
+	DSC_REG_LIST_DCN20_RI(id)
 
-static const struct dcn20_dsc_registers dsc_regs[] = {
-	dsc_regsDCN20(0),
-	dsc_regsDCN20(1),
-	dsc_regsDCN20(2),
-	dsc_regsDCN20(3)
-};
+static struct dcn20_dsc_registers dsc_regs[4];
 
 static const struct dcn20_dsc_shift dsc_shift = {
 	DSC_REG_LIST_SH_MASK_DCN20(__SHIFT)
@@ -565,17 +454,21 @@ static const struct dcn20_dsc_mask dsc_mask = {
 	DSC_REG_LIST_SH_MASK_DCN20(_MASK)
 };
 
-static const struct dcn30_mpc_registers mpc_regs = {
-		MPC_REG_LIST_DCN3_2(0),
-		MPC_REG_LIST_DCN3_2(1),
-		MPC_REG_LIST_DCN3_2(2),
-		MPC_REG_LIST_DCN3_2(3),
-		MPC_OUT_MUX_REG_LIST_DCN3_0(0),
-		MPC_OUT_MUX_REG_LIST_DCN3_0(1),
-		MPC_OUT_MUX_REG_LIST_DCN3_0(2),
-		MPC_OUT_MUX_REG_LIST_DCN3_0(3),
-		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
-};
+static struct dcn30_mpc_registers mpc_regs;
+#define dcn_mpc_regs_init()\
+		MPC_REG_LIST_DCN3_0_RI(0),\
+		MPC_REG_LIST_DCN3_0_RI(1),\
+		MPC_REG_LIST_DCN3_0_RI(2),\
+		MPC_REG_LIST_DCN3_0_RI(3),\
+		MPC_OUT_MUX_REG_LIST_DCN3_0_RI(0),\
+		MPC_OUT_MUX_REG_LIST_DCN3_0_RI(1),\
+		MPC_OUT_MUX_REG_LIST_DCN3_0_RI(2),\
+		MPC_OUT_MUX_REG_LIST_DCN3_0_RI(3),\
+		MPC_MCM_REG_LIST_DCN32_RI(0),\
+		MPC_MCM_REG_LIST_DCN32_RI(1),\
+		MPC_MCM_REG_LIST_DCN32_RI(2),\
+		MPC_MCM_REG_LIST_DCN32_RI(3),\
+		MPC_DWB_MUX_REG_LIST_DCN3_0_RI(0)
 
 static const struct dcn30_mpc_shift mpc_shift = {
 	MPC_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
@@ -585,19 +478,10 @@ static const struct dcn30_mpc_mask mpc_mask = {
 	MPC_COMMON_MASK_SH_LIST_DCN32(_MASK)
 };
 
-#define optc_regs(id)\
-[id] = {OPTC_COMMON_REG_LIST_DCN3_2(id)}
-
-//#ifdef DIAGS_BUILD
-//static struct dcn_optc_registers optc_regs[] = {
-//#else
-static const struct dcn_optc_registers optc_regs[] = {
-//#endif
-	optc_regs(0),
-	optc_regs(1),
-	optc_regs(2),
-	optc_regs(3)
-};
+#define optc_regs_init(id)\
+	OPTC_COMMON_REG_LIST_DCN3_2_RI(id)
+
+static struct dcn_optc_registers optc_regs[4];
 
 static const struct dcn_optc_shift optc_shift = {
 	OPTC_COMMON_MASK_SH_LIST_DCN3_2(__SHIFT)
@@ -607,17 +491,10 @@ static const struct dcn_optc_mask optc_mask = {
 	OPTC_COMMON_MASK_SH_LIST_DCN3_2(_MASK)
 };
 
-#define hubp_regs(id)\
-[id] = {\
-	HUBP_REG_LIST_DCN32(id)\
-}
+#define hubp_regs_init(id)\
+	HUBP_REG_LIST_DCN32_RI(id)
 
-static const struct dcn_hubp2_registers hubp_regs[] = {
-		hubp_regs(0),
-		hubp_regs(1),
-		hubp_regs(2),
-		hubp_regs(3)
-};
+static struct dcn_hubp2_registers hubp_regs[4];
 
 
 static const struct dcn_hubp2_shift hubp_shift = {
@@ -627,9 +504,10 @@ static const struct dcn_hubp2_shift hubp_shift = {
 static const struct dcn_hubp2_mask hubp_mask = {
 		HUBP_MASK_SH_LIST_DCN32(_MASK)
 };
-static const struct dcn_hubbub_registers hubbub_reg = {
-		HUBBUB_REG_LIST_DCN32(0)
-};
+
+static struct dcn_hubbub_registers hubbub_reg;
+#define hubbub_reg_init()\
+		HUBBUB_REG_LIST_DCN32_RI(0)
 
 static const struct dcn_hubbub_shift hubbub_shift = {
 		HUBBUB_MASK_SH_LIST_DCN32(__SHIFT)
@@ -639,9 +517,10 @@ static const struct dcn_hubbub_mask hubbub_mask = {
 		HUBBUB_MASK_SH_LIST_DCN32(_MASK)
 };
 
-static const struct dccg_registers dccg_regs = {
-		DCCG_REG_LIST_DCN32()
-};
+static struct dccg_registers dccg_regs;
+
+#define dccg_regs_init()\
+	DCCG_REG_LIST_DCN32_RI()
 
 static const struct dccg_shift dccg_shift = {
 		DCCG_MASK_SH_LIST_DCN32(__SHIFT)
@@ -714,9 +593,10 @@ static const struct dccg_mask dccg_mask = {
 	SR(AZALIA_AUDIO_DTO), \
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
 
-static const struct dce_hwseq_registers hwseq_reg = {
-		HWSEQ_DCN32_REG_LIST()
-};
+static struct dce_hwseq_registers hwseq_reg;
+
+#define hwseq_reg_init()\
+	HWSEQ_DCN32_REG_LIST()
 
 #define HWSEQ_DCN32_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
@@ -759,29 +639,10 @@ static const struct dce_hwseq_shift hwseq_shift = {
 static const struct dce_hwseq_mask hwseq_mask = {
 		HWSEQ_DCN32_MASK_SH_LIST(_MASK)
 };
-#define vmid_regs(id)\
-[id] = {\
-		DCN20_VMID_REG_LIST(id)\
-}
+#define vmid_regs_init(id)\
+		DCN20_VMID_REG_LIST_RI(id)
 
-static const struct dcn_vmid_registers vmid_regs[] = {
-	vmid_regs(0),
-	vmid_regs(1),
-	vmid_regs(2),
-	vmid_regs(3),
-	vmid_regs(4),
-	vmid_regs(5),
-	vmid_regs(6),
-	vmid_regs(7),
-	vmid_regs(8),
-	vmid_regs(9),
-	vmid_regs(10),
-	vmid_regs(11),
-	vmid_regs(12),
-	vmid_regs(13),
-	vmid_regs(14),
-	vmid_regs(15)
-};
+static struct dcn_vmid_registers vmid_regs[16];
 
 static const struct dcn20_vmid_shift vmid_shifts = {
 		DCN20_VMID_MASK_SH_LIST(__SHIFT)
@@ -903,6 +764,14 @@ static struct dce_aux *dcn32_aux_engine_create(
 	if (!aux_engine)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT aux_engine_regs
+	aux_engine_regs_init(0),
+	aux_engine_regs_init(1),
+	aux_engine_regs_init(2),
+	aux_engine_regs_init(3),
+	aux_engine_regs_init(4);
+
 	dce110_aux_engine_construct(aux_engine, ctx, inst,
 				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
 				    &aux_engine_regs[inst],
@@ -912,15 +781,10 @@ static struct dce_aux *dcn32_aux_engine_create(
 
 	return &aux_engine->base;
 }
-#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST_DCN30(id) }
-
-static const struct dce_i2c_registers i2c_hw_regs[] = {
-		i2c_inst_regs(1),
-		i2c_inst_regs(2),
-		i2c_inst_regs(3),
-		i2c_inst_regs(4),
-		i2c_inst_regs(5),
-};
+#define i2c_inst_regs_init(id)\
+	I2C_HW_ENGINE_COMMON_REG_LIST_DCN30_RI(id)
+
+static struct dce_i2c_registers i2c_hw_regs[6];
 
 static const struct dce_i2c_shift i2c_shifts = {
 		I2C_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
@@ -940,6 +804,14 @@ static struct dce_i2c_hw *dcn32_i2c_hw_create(
 	if (!dce_i2c_hw)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT i2c_hw_regs
+	i2c_inst_regs_init(1),
+	i2c_inst_regs_init(2),
+	i2c_inst_regs_init(3),
+	i2c_inst_regs_init(4),
+	i2c_inst_regs_init(5);
+
 	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
 				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
 
@@ -979,6 +851,29 @@ static struct hubbub *dcn32_hubbub_create(struct dc_context *ctx)
 	if (!hubbub2)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT hubbub_reg
+	hubbub_reg_init();
+
+#undef REG_STRUCT
+#define REG_STRUCT vmid_regs
+	vmid_regs_init(0),
+	vmid_regs_init(1),
+	vmid_regs_init(2),
+	vmid_regs_init(3),
+	vmid_regs_init(4),
+	vmid_regs_init(5),
+	vmid_regs_init(6),
+	vmid_regs_init(7),
+	vmid_regs_init(8),
+	vmid_regs_init(9),
+	vmid_regs_init(10),
+	vmid_regs_init(11),
+	vmid_regs_init(12),
+	vmid_regs_init(13),
+	vmid_regs_init(14),
+	vmid_regs_init(15);
+
 	hubbub32_construct(hubbub2, ctx,
 			&hubbub_reg,
 			&hubbub_shift,
@@ -1011,6 +906,13 @@ static struct hubp *dcn32_hubp_create(
 	if (!hubp2)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT hubp_regs
+		hubp_regs_init(0),
+		hubp_regs_init(1),
+		hubp_regs_init(2),
+		hubp_regs_init(3);
+
 	if (hubp32_construct(hubp2, ctx, inst,
 			&hubp_regs[inst], &hubp_shift, &hubp_mask))
 		return &hubp2->base;
@@ -1036,6 +938,13 @@ static struct dpp *dcn32_dpp_create(
 	if (!dpp3)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT dpp_regs
+	dpp_regs_init(0),
+	dpp_regs_init(1),
+	dpp_regs_init(2),
+	dpp_regs_init(3);
+
 	if (dpp32_construct(dpp3, ctx, inst,
 			&dpp_regs[inst], &tf_shift, &tf_mask))
 		return &dpp3->base;
@@ -1056,6 +965,10 @@ static struct mpc *dcn32_mpc_create(
 	if (!mpc30)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT mpc_regs
+	dcn_mpc_regs_init();
+
 	dcn32_mpc_construct(mpc30, ctx,
 			&mpc_regs,
 			&mpc_shift,
@@ -1077,6 +990,13 @@ static struct output_pixel_processor *dcn32_opp_create(
 		return NULL;
 	}
 
+#undef REG_STRUCT
+#define REG_STRUCT opp_regs
+	opp_regs_init(0),
+	opp_regs_init(1),
+	opp_regs_init(2),
+	opp_regs_init(3);
+
 	dcn20_opp_construct(opp2, ctx, inst,
 			&opp_regs[inst], &opp_shift, &opp_mask);
 	return &opp2->base;
@@ -1093,6 +1013,13 @@ static struct timing_generator *dcn32_timing_generator_create(
 	if (!tgn10)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT optc_regs
+	optc_regs_init(0),
+	optc_regs_init(1),
+	optc_regs_init(2),
+	optc_regs_init(3);
+
 	tgn10->base.inst = instance;
 	tgn10->base.ctx = ctx;
 
@@ -1127,6 +1054,30 @@ static struct link_encoder *dcn32_link_encoder_create(
 	if (!enc20)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_aux_regs
+	aux_regs_init(0),
+	aux_regs_init(1),
+	aux_regs_init(2),
+	aux_regs_init(3),
+	aux_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_hpd_regs
+	hpd_regs_init(0),
+	hpd_regs_init(1),
+	hpd_regs_init(2),
+	hpd_regs_init(3),
+	hpd_regs_init(4);
+
+#undef REG_STRUCT
+#define REG_STRUCT link_enc_regs
+	link_regs_init(0, A),
+	link_regs_init(1, B),
+	link_regs_init(2, C),
+	link_regs_init(3, D),
+	link_regs_init(4, E);
+
 	dcn32_link_encoder_construct(enc20,
 			enc_init_data,
 			&link_enc_feature,
@@ -1156,7 +1107,7 @@ static void read_dce_straps(
 	struct dc_context *ctx,
 	struct resource_straps *straps)
 {
-	generic_reg_get(ctx, regDC_PINSTRAPS + BASE(regDC_PINSTRAPS_BASE_IDX),
+	generic_reg_get(ctx, ctx->dcn_reg_offsets[regDC_PINSTRAPS_BASE_IDX] + regDC_PINSTRAPS,
 		FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
 
 }
@@ -1164,6 +1115,15 @@ static void read_dce_straps(
 static struct audio *dcn32_create_audio(
 		struct dc_context *ctx, unsigned int inst)
 {
+
+#undef REG_STRUCT
+#define REG_STRUCT audio_regs
+	audio_regs_init(0),
+	audio_regs_init(1),
+	audio_regs_init(2),
+	audio_regs_init(3),
+	audio_regs_init(4);
+
 	return dce_audio_create(ctx, inst,
 			&audio_regs[inst], &audio_shift, &audio_mask);
 }
@@ -1177,6 +1137,19 @@ static struct vpg *dcn32_vpg_create(
 	if (!vpg3)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT vpg_regs
+	vpg_regs_init(0),
+	vpg_regs_init(1),
+	vpg_regs_init(2),
+	vpg_regs_init(3),
+	vpg_regs_init(4),
+	vpg_regs_init(5),
+	vpg_regs_init(6),
+	vpg_regs_init(7),
+	vpg_regs_init(8),
+	vpg_regs_init(9);
+
 	vpg3_construct(vpg3, ctx, inst,
 			&vpg_regs[inst],
 			&vpg_shift,
@@ -1194,6 +1167,15 @@ static struct afmt *dcn32_afmt_create(
 	if (!afmt3)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT afmt_regs
+	afmt_regs_init(0),
+	afmt_regs_init(1),
+	afmt_regs_init(2),
+	afmt_regs_init(3),
+	afmt_regs_init(4),
+	afmt_regs_init(5);
+
 	afmt3_construct(afmt3, ctx, inst,
 			&afmt_regs[inst],
 			&afmt_shift,
@@ -1211,6 +1193,13 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
+#undef REG_STRUCT
+#define REG_STRUCT apg_regs
+	apg_regs_init(0),
+	apg_regs_init(1),
+	apg_regs_init(2),
+	apg_regs_init(3);
+
 	apg31_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
@@ -1247,6 +1236,14 @@ static struct stream_encoder *dcn32_stream_encoder_create(
 		return NULL;
 	}
 
+#undef REG_STRUCT
+#define REG_STRUCT stream_enc_regs
+	stream_enc_regs_init(0),
+	stream_enc_regs_init(1),
+	stream_enc_regs_init(2),
+	stream_enc_regs_init(3),
+	stream_enc_regs_init(4);
+
 	dcn32_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
 					eng_id, vpg, afmt,
 					&stream_enc_regs[eng_id],
@@ -1297,6 +1294,13 @@ static struct hpo_dp_stream_encoder *dcn32_hpo_dp_stream_encoder_create(
 		return NULL;
 	}
 
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_stream_enc_regs
+	hpo_dp_stream_encoder_reg_init(0),
+	hpo_dp_stream_encoder_reg_init(1),
+	hpo_dp_stream_encoder_reg_init(2),
+	hpo_dp_stream_encoder_reg_init(3);
+
 	dcn31_hpo_dp_stream_encoder_construct(hpo_dp_enc31, ctx, ctx->dc_bios,
 					hpo_dp_inst, eng_id, vpg, apg,
 					&hpo_dp_stream_enc_regs[hpo_dp_inst],
@@ -1314,6 +1318,11 @@ static struct hpo_dp_link_encoder *dcn32_hpo_dp_link_encoder_create(
 	/* allocate HPO link encoder */
 	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_link_encoder), GFP_KERNEL);
 
+#undef REG_STRUCT
+#define REG_STRUCT hpo_dp_link_enc_regs
+	hpo_dp_link_encoder_reg_init(0),
+	hpo_dp_link_encoder_reg_init(1);
+
 	hpo_dp_link_encoder32_construct(hpo_dp_enc31, ctx, inst,
 					&hpo_dp_link_enc_regs[inst],
 					&hpo_dp_le_shift, &hpo_dp_le_mask);
@@ -1326,6 +1335,10 @@ static struct dce_hwseq *dcn32_hwseq_create(
 {
 	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
 
+#undef REG_STRUCT
+#define REG_STRUCT hwseq_reg
+	hwseq_reg_init();
+
 	if (hws) {
 		hws->ctx = ctx;
 		hws->regs = &hwseq_reg;
@@ -1517,6 +1530,10 @@ static bool dcn32_dwbc_create(struct dc_context *ctx, struct resource_pool *pool
 			return false;
 		}
 
+#undef REG_STRUCT
+#define REG_STRUCT dwbc30_regs
+		dwbc_regs_dcn3_init(0);
+
 		dcn30_dwbc_construct(dwbc30, ctx,
 				&dwbc30_regs[i],
 				&dwbc30_shift,
@@ -1542,6 +1559,10 @@ static bool dcn32_mmhubbub_create(struct dc_context *ctx, struct resource_pool *
 			return false;
 		}
 
+#undef REG_STRUCT
+#define REG_STRUCT mcif_wb30_regs
+		mcif_wb_regs_dcn3_init(0);
+
 		dcn32_mmhubbub_construct(mcif_wb30, ctx,
 				&mcif_wb30_regs[i],
 				&mcif_wb30_shift,
@@ -1564,6 +1585,13 @@ static struct display_stream_compressor *dcn32_dsc_create(
 		return NULL;
 	}
 
+#undef REG_STRUCT
+#define REG_STRUCT dsc_regs
+	dsc_regsDCN20_init(0),
+	dsc_regsDCN20_init(1),
+	dsc_regsDCN20_init(2),
+	dsc_regsDCN20_init(3);
+
 	dsc2_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
 
 	dsc->max_image_width = 6016;
@@ -2000,6 +2028,29 @@ static bool dcn32_resource_construct(
 	uint32_t pipe_fuses = 0;
 	uint32_t num_pipes  = 4;
 
+	#undef REG_STRUCT
+	#define REG_STRUCT bios_regs
+		bios_regs_init();
+
+	#undef REG_STRUCT
+	#define REG_STRUCT clk_src_regs
+		clk_src_regs_init(0, A),
+		clk_src_regs_init(1, B),
+		clk_src_regs_init(2, C),
+		clk_src_regs_init(3, D),
+		clk_src_regs_init(4, E);
+	
+	#undef REG_STRUCT
+	#define REG_STRUCT abm_regs
+		abm_regs_init(0),
+		abm_regs_init(1),
+		abm_regs_init(2),
+		abm_regs_init(3);
+
+	#undef REG_STRUCT
+	#define REG_STRUCT dccg_regs
+		dccg_regs_init();
+
 	DC_FP_START();
 
 	ctx->dc_bios->regs = &bios_regs;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
index 1e7e6201c880..294243a5ee74 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
@@ -109,4 +109,1001 @@ struct pipe_ctx *dcn32_acquire_idle_pipe_for_head_pipe_in_layer(
 void dcn32_determine_det_override(struct dc_state *context, display_e2e_pipe_params_st *pipes,
 		bool *is_pipe_split_expected, int pipe_cnt);
 
+/* definitions for run time init of reg offsets */
+
+/* CLK SRC */
+#define CS_COMMON_REG_LIST_DCN3_0_RI(index, pllid)                             \
+  SRI_ARR_ALPHABET(PIXCLK_RESYNC_CNTL, PHYPLL, index, pllid),                  \
+      SRII_ARR_2(PHASE, DP_DTO, 0, index),                                     \
+      SRII_ARR_2(PHASE, DP_DTO, 1, index),                                     \
+      SRII_ARR_2(PHASE, DP_DTO, 2, index),                                     \
+      SRII_ARR_2(PHASE, DP_DTO, 3, index),                                     \
+      SRII_ARR_2(MODULO, DP_DTO, 0, index),                                    \
+      SRII_ARR_2(MODULO, DP_DTO, 1, index),                                    \
+      SRII_ARR_2(MODULO, DP_DTO, 2, index),                                    \
+      SRII_ARR_2(MODULO, DP_DTO, 3, index),                                    \
+      SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 0, index),                              \
+      SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 1, index),                              \
+      SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 2, index),                              \
+      SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 3, index)
+
+/* ABM */
+#define ABM_DCN32_REG_LIST_RI(id)                                              \
+  SRI_ARR(DC_ABM1_HG_SAMPLE_RATE, ABM, id),                                    \
+      SRI_ARR(DC_ABM1_LS_SAMPLE_RATE, ABM, id),                                \
+      SRI_ARR(BL1_PWM_BL_UPDATE_SAMPLE_RATE, ABM, id),                         \
+      SRI_ARR(DC_ABM1_HG_MISC_CTRL, ABM, id),                                  \
+      SRI_ARR(DC_ABM1_IPCSC_COEFF_SEL, ABM, id),                               \
+      SRI_ARR(BL1_PWM_CURRENT_ABM_LEVEL, ABM, id),                             \
+      SRI_ARR(BL1_PWM_TARGET_ABM_LEVEL, ABM, id),                              \
+      SRI_ARR(BL1_PWM_USER_LEVEL, ABM, id),                                    \
+      SRI_ARR(DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, ABM, id),                  \
+      SRI_ARR(DC_ABM1_HGLS_REG_READ_PROGRESS, ABM, id),                        \
+      SRI_ARR(DC_ABM1_ACE_OFFSET_SLOPE_0, ABM, id),                            \
+      SRI_ARR(DC_ABM1_ACE_THRES_12, ABM, id), NBIO_SR_ARR(BIOS_SCRATCH_2, id)
+
+/* Audio */
+#define AUD_COMMON_REG_LIST_RI(id)                                             \
+  SRI_ARR(AZALIA_F0_CODEC_ENDPOINT_INDEX, AZF0ENDPOINT, id),                   \
+      SRI_ARR(AZALIA_F0_CODEC_ENDPOINT_DATA, AZF0ENDPOINT, id),                \
+      SR_ARR(AZALIA_F0_CODEC_FUNCTION_PARAMETER_STREAM_FORMATS, id),           \
+      SR_ARR(AZALIA_F0_CODEC_FUNCTION_PARAMETER_SUPPORTED_SIZE_RATES, id),     \
+      SR_ARR(AZALIA_F0_CODEC_FUNCTION_PARAMETER_POWER_STATES, id),             \
+      SR_ARR(DCCG_AUDIO_DTO_SOURCE, id), SR_ARR(DCCG_AUDIO_DTO0_MODULE, id),   \
+      SR_ARR(DCCG_AUDIO_DTO0_PHASE, id), SR_ARR(DCCG_AUDIO_DTO1_MODULE, id),   \
+      SR_ARR(DCCG_AUDIO_DTO1_PHASE, id)
+
+/* VPG */
+
+#define VPG_DCN3_REG_LIST_RI(id)                                               \
+  SRI_ARR(VPG_GENERIC_STATUS, VPG, id),                                        \
+      SRI_ARR(VPG_GENERIC_PACKET_ACCESS_CTRL, VPG, id),                        \
+      SRI_ARR(VPG_GENERIC_PACKET_DATA, VPG, id),                               \
+      SRI_ARR(VPG_GSP_FRAME_UPDATE_CTRL, VPG, id),                             \
+      SRI_ARR(VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG, id)
+
+/* AFMT */
+#define AFMT_DCN3_REG_LIST_RI(id)                                              \
+  SRI_ARR(AFMT_INFOFRAME_CONTROL0, AFMT, id),                                  \
+      SRI_ARR(AFMT_VBI_PACKET_CONTROL, AFMT, id),                              \
+      SRI_ARR(AFMT_AUDIO_PACKET_CONTROL, AFMT, id),                            \
+      SRI_ARR(AFMT_AUDIO_PACKET_CONTROL2, AFMT, id),                           \
+      SRI_ARR(AFMT_AUDIO_SRC_CONTROL, AFMT, id),                               \
+      SRI_ARR(AFMT_60958_0, AFMT, id), SRI_ARR(AFMT_60958_1, AFMT, id),        \
+      SRI_ARR(AFMT_60958_2, AFMT, id), SRI_ARR(AFMT_MEM_PWR, AFMT, id)
+
+/* APG */
+#define APG_DCN31_REG_LIST_RI(id)                                              \
+  SRI_ARR(APG_CONTROL, APG, id), SRI_ARR(APG_CONTROL2, APG, id),               \
+      SRI_ARR(APG_MEM_PWR, APG, id), SRI_ARR(APG_DBG_GEN_CONTROL, APG, id)
+
+/* Stream encoder */
+#define SE_DCN32_REG_LIST_RI(id)                                               \
+  SRI_ARR(AFMT_CNTL, DIG, id), SRI_ARR(DIG_FE_CNTL, DIG, id),                  \
+      SRI_ARR(HDMI_CONTROL, DIG, id), SRI_ARR(HDMI_DB_CONTROL, DIG, id),       \
+      SRI_ARR(HDMI_GC, DIG, id),                                               \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL0, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL1, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL2, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL3, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL4, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL5, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL6, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL7, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL8, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL9, DIG, id),                          \
+      SRI_ARR(HDMI_GENERIC_PACKET_CONTROL10, DIG, id),                         \
+      SRI_ARR(HDMI_INFOFRAME_CONTROL0, DIG, id),                               \
+      SRI_ARR(HDMI_INFOFRAME_CONTROL1, DIG, id),                               \
+      SRI_ARR(HDMI_VBI_PACKET_CONTROL, DIG, id),                               \
+      SRI_ARR(HDMI_AUDIO_PACKET_CONTROL, DIG, id),                             \
+      SRI_ARR(HDMI_ACR_PACKET_CONTROL, DIG, id),                               \
+      SRI_ARR(HDMI_ACR_32_0, DIG, id), SRI_ARR(HDMI_ACR_32_1, DIG, id),        \
+      SRI_ARR(HDMI_ACR_44_0, DIG, id), SRI_ARR(HDMI_ACR_44_1, DIG, id),        \
+      SRI_ARR(HDMI_ACR_48_0, DIG, id), SRI_ARR(HDMI_ACR_48_1, DIG, id),        \
+      SRI_ARR(DP_DB_CNTL, DP, id), SRI_ARR(DP_MSA_MISC, DP, id),               \
+      SRI_ARR(DP_MSA_VBID_MISC, DP, id), SRI_ARR(DP_MSA_COLORIMETRY, DP, id),  \
+      SRI_ARR(DP_MSA_TIMING_PARAM1, DP, id),                                   \
+      SRI_ARR(DP_MSA_TIMING_PARAM2, DP, id),                                   \
+      SRI_ARR(DP_MSA_TIMING_PARAM3, DP, id),                                   \
+      SRI_ARR(DP_MSA_TIMING_PARAM4, DP, id),                                   \
+      SRI_ARR(DP_MSE_RATE_CNTL, DP, id), SRI_ARR(DP_MSE_RATE_UPDATE, DP, id),  \
+      SRI_ARR(DP_PIXEL_FORMAT, DP, id), SRI_ARR(DP_SEC_CNTL, DP, id),          \
+      SRI_ARR(DP_SEC_CNTL2, DP, id), SRI_ARR(DP_SEC_CNTL6, DP, id),            \
+      SRI_ARR(DP_STEER_FIFO, DP, id), SRI_ARR(DP_VID_M, DP, id),               \
+      SRI_ARR(DP_VID_N, DP, id), SRI_ARR(DP_VID_STREAM_CNTL, DP, id),          \
+      SRI_ARR(DP_VID_TIMING, DP, id), SRI_ARR(DP_SEC_AUD_N, DP, id),           \
+      SRI_ARR(DP_SEC_TIMESTAMP, DP, id), SRI_ARR(DP_DSC_CNTL, DP, id),         \
+      SRI_ARR(DP_SEC_METADATA_TRANSMISSION, DP, id),                           \
+      SRI_ARR(HDMI_METADATA_PACKET_CONTROL, DIG, id),                          \
+      SRI_ARR(DP_SEC_FRAMING4, DP, id), SRI_ARR(DP_GSP11_CNTL, DP, id),        \
+      SRI_ARR(DME_CONTROL, DME, id),                                           \
+      SRI_ARR(DP_SEC_METADATA_TRANSMISSION, DP, id),                           \
+      SRI_ARR(HDMI_METADATA_PACKET_CONTROL, DIG, id),                          \
+      SRI_ARR(DIG_FE_CNTL, DIG, id), SRI_ARR(DIG_CLOCK_PATTERN, DIG, id),      \
+      SRI_ARR(DIG_FIFO_CTRL0, DIG, id)
+
+/* Aux regs */
+
+#define AUX_REG_LIST_RI(id)                                                    \
+  SRI_ARR(AUX_CONTROL, DP_AUX, id), SRI_ARR(AUX_DPHY_RX_CONTROL0, DP_AUX, id), \
+      SRI_ARR(AUX_DPHY_RX_CONTROL1, DP_AUX, id)
+
+#define DCN2_AUX_REG_LIST_RI(id)                                               \
+  AUX_REG_LIST_RI(id), SRI_ARR(AUX_DPHY_TX_CONTROL, DP_AUX, id)
+
+/* HDP */
+#define HPD_REG_LIST_RI(id) SRI_ARR(DC_HPD_CONTROL, HPD, id)
+
+/* Link encoder */
+#define LE_DCN3_REG_LIST_RI(id)                                                \
+  SRI_ARR(DIG_BE_CNTL, DIG, id), SRI_ARR(DIG_BE_EN_CNTL, DIG, id),             \
+      SRI_ARR(TMDS_CTL_BITS, DIG, id),                                         \
+      SRI_ARR(TMDS_DCBALANCER_CONTROL, DIG, id), SRI_ARR(DP_CONFIG, DP, id),   \
+      SRI_ARR(DP_DPHY_CNTL, DP, id), SRI_ARR(DP_DPHY_PRBS_CNTL, DP, id),       \
+      SRI_ARR(DP_DPHY_SCRAM_CNTL, DP, id), SRI_ARR(DP_DPHY_SYM0, DP, id),      \
+      SRI_ARR(DP_DPHY_SYM1, DP, id), SRI_ARR(DP_DPHY_SYM2, DP, id),            \
+      SRI_ARR(DP_DPHY_TRAINING_PATTERN_SEL, DP, id),                           \
+      SRI_ARR(DP_LINK_CNTL, DP, id), SRI_ARR(DP_LINK_FRAMING_CNTL, DP, id),    \
+      SRI_ARR(DP_MSE_SAT0, DP, id), SRI_ARR(DP_MSE_SAT1, DP, id),              \
+      SRI_ARR(DP_MSE_SAT2, DP, id), SRI_ARR(DP_MSE_SAT_UPDATE, DP, id),        \
+      SRI_ARR(DP_SEC_CNTL, DP, id), SRI_ARR(DP_VID_STREAM_CNTL, DP, id),       \
+      SRI_ARR(DP_DPHY_FAST_TRAINING, DP, id), SRI_ARR(DP_SEC_CNTL1, DP, id),   \
+      SRI_ARR(DP_DPHY_BS_SR_SWAP_CNTL, DP, id),                                \
+      SRI_ARR(DP_DPHY_HBR2_PATTERN_CONTROL, DP, id)
+
+#define LE_DCN31_REG_LIST_RI(id)                                               \
+  LE_DCN3_REG_LIST_RI(id), SRI_ARR(DP_DPHY_INTERNAL_CTRL, DP, id),             \
+      SR_ARR(DIO_LINKA_CNTL, id), SR_ARR(DIO_LINKB_CNTL, id),                  \
+      SR_ARR(DIO_LINKC_CNTL, id), SR_ARR(DIO_LINKD_CNTL, id),                  \
+      SR_ARR(DIO_LINKE_CNTL, id), SR_ARR(DIO_LINKF_CNTL, id)
+
+#define UNIPHY_DCN2_REG_LIST_RI(id, phyid)                                     \
+  SRI_ARR_ALPHABET(CLOCK_ENABLE, SYMCLK, id, phyid),                           \
+      SRI_ARR_ALPHABET(CHANNEL_XBAR_CNTL, UNIPHY, id, phyid)
+
+/* HPO DP stream encoder */
+#define DCN3_1_HPO_DP_STREAM_ENC_REG_LIST_RI(id)                               \
+  SR_ARR(DP_STREAM_MAPPER_CONTROL0, id),                                       \
+      SR_ARR(DP_STREAM_MAPPER_CONTROL1, id),                                   \
+      SR_ARR(DP_STREAM_MAPPER_CONTROL2, id),                                   \
+      SR_ARR(DP_STREAM_MAPPER_CONTROL3, id),                                   \
+      SRI_ARR(DP_STREAM_ENC_CLOCK_CONTROL, DP_STREAM_ENC, id),                 \
+      SRI_ARR(DP_STREAM_ENC_INPUT_MUX_CONTROL, DP_STREAM_ENC, id),             \
+      SRI_ARR(DP_STREAM_ENC_AUDIO_CONTROL, DP_STREAM_ENC, id),                 \
+      SRI_ARR(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0, DP_STREAM_ENC, id), \
+      SRI_ARR(DP_SYM32_ENC_CONTROL, DP_SYM32_ENC, id),                         \
+      SRI_ARR(DP_SYM32_ENC_VID_PIXEL_FORMAT, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_VID_PIXEL_FORMAT_DOUBLE_BUFFER_CONTROL, DP_SYM32_ENC, id), \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA0, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA1, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA2, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA3, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA4, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA5, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA6, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA7, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA8, DP_SYM32_ENC, id),                        \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA_CONTROL, DP_SYM32_ENC, id),                 \
+      SRI_ARR(DP_SYM32_ENC_VID_MSA_DOUBLE_BUFFER_CONTROL, DP_SYM32_ENC, id),   \
+      SRI_ARR(DP_SYM32_ENC_VID_FIFO_CONTROL, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_VID_STREAM_CONTROL, DP_SYM32_ENC, id),              \
+      SRI_ARR(DP_SYM32_ENC_VID_VBID_CONTROL, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_SDP_CONTROL, DP_SYM32_ENC, id),                     \
+      SRI_ARR(DP_SYM32_ENC_SDP_GSP_CONTROL0, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_SDP_GSP_CONTROL2, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_SDP_GSP_CONTROL3, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_SDP_GSP_CONTROL5, DP_SYM32_ENC, id),                \
+      SRI_ARR(DP_SYM32_ENC_SDP_GSP_CONTROL11, DP_SYM32_ENC, id),               \
+      SRI_ARR(DP_SYM32_ENC_SDP_METADATA_PACKET_CONTROL, DP_SYM32_ENC, id),     \
+      SRI_ARR(DP_SYM32_ENC_SDP_AUDIO_CONTROL0, DP_SYM32_ENC, id),              \
+      SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                 \
+      SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
+
+/* HPO DP link encoder regs */
+#define DCN3_1_HPO_DP_LINK_ENC_REG_LIST_RI(id)                                 \
+  SRI_ARR(DP_LINK_ENC_CLOCK_CONTROL, DP_LINK_ENC, id),                         \
+      SRI_ARR(DP_DPHY_SYM32_CONTROL, DP_DPHY_SYM32, id),                       \
+      SRI_ARR(DP_DPHY_SYM32_STATUS, DP_DPHY_SYM32, id),                        \
+      SRI_ARR(DP_DPHY_SYM32_TP_CONFIG, DP_DPHY_SYM32, id),                     \
+      SRI_ARR(DP_DPHY_SYM32_TP_PRBS_SEED0, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_TP_PRBS_SEED1, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_TP_PRBS_SEED2, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_TP_PRBS_SEED3, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_TP_SQ_PULSE, DP_DPHY_SYM32, id),                   \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM0, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM1, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM2, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM3, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM4, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM5, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM6, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM7, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM8, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM9, DP_DPHY_SYM32, id),                    \
+      SRI_ARR(DP_DPHY_SYM32_TP_CUSTOM10, DP_DPHY_SYM32, id),                   \
+      SRI_ARR(DP_DPHY_SYM32_SAT_VC0, DP_DPHY_SYM32, id),                       \
+      SRI_ARR(DP_DPHY_SYM32_SAT_VC1, DP_DPHY_SYM32, id),                       \
+      SRI_ARR(DP_DPHY_SYM32_SAT_VC2, DP_DPHY_SYM32, id),                       \
+      SRI_ARR(DP_DPHY_SYM32_SAT_VC3, DP_DPHY_SYM32, id),                       \
+      SRI_ARR(DP_DPHY_SYM32_VC_RATE_CNTL0, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_VC_RATE_CNTL1, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_VC_RATE_CNTL2, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_VC_RATE_CNTL3, DP_DPHY_SYM32, id),                 \
+      SRI_ARR(DP_DPHY_SYM32_SAT_UPDATE, DP_DPHY_SYM32, id)
+
+/* DPP */
+#define DPP_REG_LIST_DCN30_COMMON_RI(id)                                       \
+  SRI_ARR(CM_DEALPHA, CM, id), SRI_ARR(CM_MEM_PWR_STATUS, CM, id),             \
+      SRI_ARR(CM_BIAS_CR_R, CM, id), SRI_ARR(CM_BIAS_Y_G_CB_B, CM, id),        \
+      SRI_ARR(PRE_DEGAM, CNVC_CFG, id), SRI_ARR(CM_GAMCOR_CONTROL, CM, id),    \
+      SRI_ARR(CM_GAMCOR_LUT_CONTROL, CM, id),                                  \
+      SRI_ARR(CM_GAMCOR_LUT_INDEX, CM, id),                                    \
+      SRI_ARR(CM_GAMCOR_LUT_INDEX, CM, id),                                    \
+      SRI_ARR(CM_GAMCOR_LUT_DATA, CM, id),                                     \
+      SRI_ARR(CM_GAMCOR_RAMB_START_CNTL_B, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMB_START_CNTL_G, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMB_START_CNTL_R, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMB_START_SLOPE_CNTL_B, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMB_START_SLOPE_CNTL_G, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMB_START_SLOPE_CNTL_R, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL1_B, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL2_B, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL1_G, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL2_G, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL1_R, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_END_CNTL2_R, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMB_REGION_0_1, CM, id),                              \
+      SRI_ARR(CM_GAMCOR_RAMB_REGION_32_33, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMB_OFFSET_B, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMB_OFFSET_G, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMB_OFFSET_R, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMB_START_BASE_CNTL_B, CM, id),                       \
+      SRI_ARR(CM_GAMCOR_RAMB_START_BASE_CNTL_G, CM, id),                       \
+      SRI_ARR(CM_GAMCOR_RAMB_START_BASE_CNTL_R, CM, id),                       \
+      SRI_ARR(CM_GAMCOR_RAMA_START_CNTL_B, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMA_START_CNTL_G, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMA_START_CNTL_R, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMA_START_SLOPE_CNTL_B, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMA_START_SLOPE_CNTL_G, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMA_START_SLOPE_CNTL_R, CM, id),                      \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL1_B, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL2_B, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL1_G, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL2_G, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL1_R, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_END_CNTL2_R, CM, id),                             \
+      SRI_ARR(CM_GAMCOR_RAMA_REGION_0_1, CM, id),                              \
+      SRI_ARR(CM_GAMCOR_RAMA_REGION_32_33, CM, id),                            \
+      SRI_ARR(CM_GAMCOR_RAMA_OFFSET_B, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMA_OFFSET_G, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMA_OFFSET_R, CM, id),                                \
+      SRI_ARR(CM_GAMCOR_RAMA_START_BASE_CNTL_B, CM, id),                       \
+      SRI_ARR(CM_GAMCOR_RAMA_START_BASE_CNTL_G, CM, id),                       \
+      SRI_ARR(CM_GAMCOR_RAMA_START_BASE_CNTL_R, CM, id),                       \
+      SRI_ARR(CM_GAMUT_REMAP_CONTROL, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C11_C12, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C13_C14, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C21_C22, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C23_C24, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C31_C32, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_C33_C34, CM, id),                                 \
+      SRI_ARR(CM_GAMUT_REMAP_B_C11_C12, CM, id),                               \
+      SRI_ARR(CM_GAMUT_REMAP_B_C13_C14, CM, id),                               \
+      SRI_ARR(CM_GAMUT_REMAP_B_C21_C22, CM, id),                               \
+      SRI_ARR(CM_GAMUT_REMAP_B_C23_C24, CM, id),                               \
+      SRI_ARR(CM_GAMUT_REMAP_B_C31_C32, CM, id),                               \
+      SRI_ARR(CM_GAMUT_REMAP_B_C33_C34, CM, id),                               \
+      SRI_ARR(DSCL_EXT_OVERSCAN_LEFT_RIGHT, DSCL, id),                         \
+      SRI_ARR(DSCL_EXT_OVERSCAN_TOP_BOTTOM, DSCL, id),                         \
+      SRI_ARR(OTG_H_BLANK, DSCL, id), SRI_ARR(OTG_V_BLANK, DSCL, id),          \
+      SRI_ARR(SCL_MODE, DSCL, id), SRI_ARR(LB_DATA_FORMAT, DSCL, id),          \
+      SRI_ARR(LB_MEMORY_CTRL, DSCL, id), SRI_ARR(DSCL_AUTOCAL, DSCL, id),      \
+      SRI_ARR(SCL_TAP_CONTROL, DSCL, id),                                      \
+      SRI_ARR(SCL_COEF_RAM_TAP_SELECT, DSCL, id),                              \
+      SRI_ARR(SCL_COEF_RAM_TAP_DATA, DSCL, id),                                \
+      SRI_ARR(DSCL_2TAP_CONTROL, DSCL, id), SRI_ARR(MPC_SIZE, DSCL, id),       \
+      SRI_ARR(SCL_HORZ_FILTER_SCALE_RATIO, DSCL, id),                          \
+      SRI_ARR(SCL_VERT_FILTER_SCALE_RATIO, DSCL, id),                          \
+      SRI_ARR(SCL_HORZ_FILTER_SCALE_RATIO_C, DSCL, id),                        \
+      SRI_ARR(SCL_VERT_FILTER_SCALE_RATIO_C, DSCL, id),                        \
+      SRI_ARR(SCL_HORZ_FILTER_INIT, DSCL, id),                                 \
+      SRI_ARR(SCL_HORZ_FILTER_INIT_C, DSCL, id),                               \
+      SRI_ARR(SCL_VERT_FILTER_INIT, DSCL, id),                                 \
+      SRI_ARR(SCL_VERT_FILTER_INIT_C, DSCL, id),                               \
+      SRI_ARR(RECOUT_START, DSCL, id), SRI_ARR(RECOUT_SIZE, DSCL, id),         \
+      SRI_ARR(PRE_DEALPHA, CNVC_CFG, id), SRI_ARR(PRE_REALPHA, CNVC_CFG, id),  \
+      SRI_ARR(PRE_CSC_MODE, CNVC_CFG, id),                                     \
+      SRI_ARR(PRE_CSC_C11_C12, CNVC_CFG, id),                                  \
+      SRI_ARR(PRE_CSC_C33_C34, CNVC_CFG, id),                                  \
+      SRI_ARR(PRE_CSC_B_C11_C12, CNVC_CFG, id),                                \
+      SRI_ARR(PRE_CSC_B_C33_C34, CNVC_CFG, id),                                \
+      SRI_ARR(CM_POST_CSC_CONTROL, CM, id),                                    \
+      SRI_ARR(CM_POST_CSC_C11_C12, CM, id),                                    \
+      SRI_ARR(CM_POST_CSC_C33_C34, CM, id),                                    \
+      SRI_ARR(CM_POST_CSC_B_C11_C12, CM, id),                                  \
+      SRI_ARR(CM_POST_CSC_B_C33_C34, CM, id),                                  \
+      SRI_ARR(CM_MEM_PWR_CTRL, CM, id), SRI_ARR(CM_CONTROL, CM, id),           \
+      SRI_ARR(FORMAT_CONTROL, CNVC_CFG, id),                                   \
+      SRI_ARR(CNVC_SURFACE_PIXEL_FORMAT, CNVC_CFG, id),                        \
+      SRI_ARR(CURSOR0_CONTROL, CNVC_CUR, id),                                  \
+      SRI_ARR(CURSOR0_COLOR0, CNVC_CUR, id),                                   \
+      SRI_ARR(CURSOR0_COLOR1, CNVC_CUR, id),                                   \
+      SRI_ARR(CURSOR0_FP_SCALE_BIAS, CNVC_CUR, id),                            \
+      SRI_ARR(DPP_CONTROL, DPP_TOP, id), SRI_ARR(CM_HDR_MULT_COEF, CM, id),    \
+      SRI_ARR(CURSOR_CONTROL, CURSOR0_, id),                                   \
+      SRI_ARR(ALPHA_2BIT_LUT, CNVC_CFG, id),                                   \
+      SRI_ARR(FCNV_FP_BIAS_R, CNVC_CFG, id),                                   \
+      SRI_ARR(FCNV_FP_BIAS_G, CNVC_CFG, id),                                   \
+      SRI_ARR(FCNV_FP_BIAS_B, CNVC_CFG, id),                                   \
+      SRI_ARR(FCNV_FP_SCALE_R, CNVC_CFG, id),                                  \
+      SRI_ARR(FCNV_FP_SCALE_G, CNVC_CFG, id),                                  \
+      SRI_ARR(FCNV_FP_SCALE_B, CNVC_CFG, id),                                  \
+      SRI_ARR(COLOR_KEYER_CONTROL, CNVC_CFG, id),                              \
+      SRI_ARR(COLOR_KEYER_ALPHA, CNVC_CFG, id),                                \
+      SRI_ARR(COLOR_KEYER_RED, CNVC_CFG, id),                                  \
+      SRI_ARR(COLOR_KEYER_GREEN, CNVC_CFG, id),                                \
+      SRI_ARR(COLOR_KEYER_BLUE, CNVC_CFG, id),                                 \
+      SRI_ARR(CURSOR_CONTROL, CURSOR0_, id),                                   \
+      SRI_ARR(OBUF_MEM_PWR_CTRL, DSCL, id),                                    \
+      SRI_ARR(DSCL_MEM_PWR_STATUS, DSCL, id),                                  \
+      SRI_ARR(DSCL_MEM_PWR_CTRL, DSCL, id)
+
+/* OPP */
+#define OPP_REG_LIST_DCN_RI(id)                                                \
+  SRI_ARR(FMT_BIT_DEPTH_CONTROL, FMT, id), SRI_ARR(FMT_CONTROL, FMT, id),      \
+      SRI_ARR(FMT_DITHER_RAND_R_SEED, FMT, id),                                \
+      SRI_ARR(FMT_DITHER_RAND_G_SEED, FMT, id),                                \
+      SRI_ARR(FMT_DITHER_RAND_B_SEED, FMT, id),                                \
+      SRI_ARR(FMT_CLAMP_CNTL, FMT, id),                                        \
+      SRI_ARR(FMT_DYNAMIC_EXP_CNTL, FMT, id),                                  \
+      SRI_ARR(FMT_MAP420_MEMORY_CONTROL, FMT, id),                             \
+      SRI_ARR(OPPBUF_CONTROL, OPPBUF, id),                                     \
+      SRI_ARR(OPPBUF_3D_PARAMETERS_0, OPPBUF, id),                             \
+      SRI_ARR(OPPBUF_3D_PARAMETERS_1, OPPBUF, id),                             \
+      SRI_ARR(OPP_PIPE_CONTROL, OPP_PIPE, id)
+
+#define OPP_REG_LIST_DCN10_RI(id) OPP_REG_LIST_DCN_RI(id)
+
+#define OPP_DPG_REG_LIST_RI(id)                                                \
+  SRI_ARR(DPG_CONTROL, DPG, id), SRI_ARR(DPG_DIMENSIONS, DPG, id),             \
+      SRI_ARR(DPG_OFFSET_SEGMENT, DPG, id), SRI_ARR(DPG_COLOUR_B_CB, DPG, id), \
+      SRI_ARR(DPG_COLOUR_G_Y, DPG, id), SRI_ARR(DPG_COLOUR_R_CR, DPG, id),     \
+      SRI_ARR(DPG_RAMP_CONTROL, DPG, id), SRI_ARR(DPG_STATUS, DPG, id)
+
+#define OPP_REG_LIST_DCN30_RI(id)                                              \
+  OPP_REG_LIST_DCN10_RI(id), OPP_DPG_REG_LIST_RI(id),                          \
+      SRI_ARR(FMT_422_CONTROL, FMT, id)
+
+/* Aux engine regs */
+#define AUX_COMMON_REG_LIST0_RI(id)                                            \
+  SRI_ARR(AUX_CONTROL, DP_AUX, id), SRI_ARR(AUX_ARB_CONTROL, DP_AUX, id),      \
+      SRI_ARR(AUX_SW_DATA, DP_AUX, id), SRI_ARR(AUX_SW_CONTROL, DP_AUX, id),   \
+      SRI_ARR(AUX_INTERRUPT_CONTROL, DP_AUX, id),                              \
+      SRI_ARR(AUX_DPHY_RX_CONTROL1, DP_AUX, id),                               \
+      SRI_ARR(AUX_SW_STATUS, DP_AUX, id)
+
+/* DWBC */
+#define DWBC_COMMON_REG_LIST_DCN30_RI(id)                                      \
+  SR_ARR(DWB_ENABLE_CLK_CTRL, id), SR_ARR(DWB_MEM_PWR_CTRL, id),               \
+      SR_ARR(FC_MODE_CTRL, id), SR_ARR(FC_FLOW_CTRL, id),                      \
+      SR_ARR(FC_WINDOW_START, id), SR_ARR(FC_WINDOW_SIZE, id),                 \
+      SR_ARR(FC_SOURCE_SIZE, id), SR_ARR(DWB_UPDATE_CTRL, id),                 \
+      SR_ARR(DWB_CRC_CTRL, id), SR_ARR(DWB_CRC_MASK_R_G, id),                  \
+      SR_ARR(DWB_CRC_MASK_B_A, id), SR_ARR(DWB_CRC_VAL_R_G, id),               \
+      SR_ARR(DWB_CRC_VAL_B_A, id), SR_ARR(DWB_OUT_CTRL, id),                   \
+      SR_ARR(DWB_MMHUBBUB_BACKPRESSURE_CNT_EN, id),                            \
+      SR_ARR(DWB_MMHUBBUB_BACKPRESSURE_CNT, id),                               \
+      SR_ARR(DWB_HOST_READ_CONTROL, id), SR_ARR(DWB_SOFT_RESET, id),           \
+      SR_ARR(DWB_HDR_MULT_COEF, id), SR_ARR(DWB_GAMUT_REMAP_MODE, id),         \
+      SR_ARR(DWB_GAMUT_REMAP_COEF_FORMAT, id),                                 \
+      SR_ARR(DWB_GAMUT_REMAPA_C11_C12, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPA_C13_C14, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPA_C21_C22, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPA_C23_C24, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPA_C31_C32, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPA_C33_C34, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C11_C12, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C13_C14, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C21_C22, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C23_C24, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C31_C32, id),                                    \
+      SR_ARR(DWB_GAMUT_REMAPB_C33_C34, id), SR_ARR(DWB_OGAM_CONTROL, id),      \
+      SR_ARR(DWB_OGAM_LUT_INDEX, id), SR_ARR(DWB_OGAM_LUT_DATA, id),           \
+      SR_ARR(DWB_OGAM_LUT_CONTROL, id),                                        \
+      SR_ARR(DWB_OGAM_RAMA_START_CNTL_B, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_START_CNTL_G, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_START_CNTL_R, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_START_BASE_CNTL_B, id),                             \
+      SR_ARR(DWB_OGAM_RAMA_START_SLOPE_CNTL_B, id),                            \
+      SR_ARR(DWB_OGAM_RAMA_START_BASE_CNTL_G, id),                             \
+      SR_ARR(DWB_OGAM_RAMA_START_SLOPE_CNTL_G, id),                            \
+      SR_ARR(DWB_OGAM_RAMA_START_BASE_CNTL_R, id),                             \
+      SR_ARR(DWB_OGAM_RAMA_START_SLOPE_CNTL_R, id),                            \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL1_B, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL2_B, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL1_G, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL2_G, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL1_R, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_END_CNTL2_R, id),                                   \
+      SR_ARR(DWB_OGAM_RAMA_OFFSET_B, id), SR_ARR(DWB_OGAM_RAMA_OFFSET_G, id),  \
+      SR_ARR(DWB_OGAM_RAMA_OFFSET_R, id),                                      \
+      SR_ARR(DWB_OGAM_RAMA_REGION_0_1, id),                                    \
+      SR_ARR(DWB_OGAM_RAMA_REGION_2_3, id),                                    \
+      SR_ARR(DWB_OGAM_RAMA_REGION_4_5, id),                                    \
+      SR_ARR(DWB_OGAM_RAMA_REGION_6_7, id),                                    \
+      SR_ARR(DWB_OGAM_RAMA_REGION_8_9, id),                                    \
+      SR_ARR(DWB_OGAM_RAMA_REGION_10_11, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_12_13, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_14_15, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_16_17, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_18_19, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_20_21, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_22_23, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_24_25, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_26_27, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_28_29, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_30_31, id),                                  \
+      SR_ARR(DWB_OGAM_RAMA_REGION_32_33, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_START_CNTL_B, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_START_CNTL_G, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_START_CNTL_R, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_START_BASE_CNTL_B, id),                             \
+      SR_ARR(DWB_OGAM_RAMB_START_SLOPE_CNTL_B, id),                            \
+      SR_ARR(DWB_OGAM_RAMB_START_BASE_CNTL_G, id),                             \
+      SR_ARR(DWB_OGAM_RAMB_START_SLOPE_CNTL_G, id),                            \
+      SR_ARR(DWB_OGAM_RAMB_START_BASE_CNTL_R, id),                             \
+      SR_ARR(DWB_OGAM_RAMB_START_SLOPE_CNTL_R, id),                            \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL1_B, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL2_B, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL1_G, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL2_G, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL1_R, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_END_CNTL2_R, id),                                   \
+      SR_ARR(DWB_OGAM_RAMB_OFFSET_B, id), SR_ARR(DWB_OGAM_RAMB_OFFSET_G, id),  \
+      SR_ARR(DWB_OGAM_RAMB_OFFSET_R, id),                                      \
+      SR_ARR(DWB_OGAM_RAMB_REGION_0_1, id),                                    \
+      SR_ARR(DWB_OGAM_RAMB_REGION_2_3, id),                                    \
+      SR_ARR(DWB_OGAM_RAMB_REGION_4_5, id),                                    \
+      SR_ARR(DWB_OGAM_RAMB_REGION_6_7, id),                                    \
+      SR_ARR(DWB_OGAM_RAMB_REGION_8_9, id),                                    \
+      SR_ARR(DWB_OGAM_RAMB_REGION_10_11, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_12_13, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_14_15, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_16_17, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_18_19, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_20_21, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_22_23, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_24_25, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_26_27, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_28_29, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_30_31, id),                                  \
+      SR_ARR(DWB_OGAM_RAMB_REGION_32_33, id)
+
+/* MCIF */
+
+#define MCIF_WB_COMMON_REG_LIST_DCN32_RI(inst)                                 \
+  SRI2_ARR(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUFMGR_STATUS, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUF_PITCH, MCIF_WB, inst),                              \
+      SRI2_ARR(MCIF_WB_BUF_1_STATUS, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_1_STATUS2, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUF_2_STATUS, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_2_STATUS2, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUF_3_STATUS, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_3_STATUS2, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUF_4_STATUS, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_4_STATUS2, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB, inst),                    \
+      SRI2_ARR(MCIF_WB_SCLK_CHANGE, MCIF_WB, inst),                            \
+      SRI2_ARR(MCIF_WB_TEST_DEBUG_INDEX, MCIF_WB, inst),                       \
+      SRI2_ARR(MCIF_WB_TEST_DEBUG_DATA, MCIF_WB, inst),                        \
+      SRI2_ARR(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_1_ADDR_C, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_2_ADDR_C, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_3_ADDR_C, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUF_4_ADDR_C, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB, inst),                     \
+      SRI2_ARR(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, MMHUBBUB, inst),           \
+      SRI2_ARR(MCIF_WB_NB_PSTATE_CONTROL, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_WATERMARK, MMHUBBUB, inst),                             \
+      SRI2_ARR(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB, inst),                    \
+      SRI2_ARR(MCIF_WB_SELF_REFRESH_CONTROL, MCIF_WB, inst),                   \
+      SRI2_ARR(MULTI_LEVEL_QOS_CTRL, MCIF_WB, inst),                           \
+      SRI2_ARR(MCIF_WB_SECURITY_LEVEL, MCIF_WB, inst),                         \
+      SRI2_ARR(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB, inst),                          \
+      SRI2_ARR(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB, inst),                        \
+      SRI2_ARR(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB, inst),                      \
+      SRI2_ARR(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB, inst),                       \
+      SRI2_ARR(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB, inst),                       \
+      SRI2_ARR(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB, inst),                       \
+      SRI2_ARR(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB, inst),                       \
+      SRI2_ARR(MMHUBBUB_MEM_PWR_CNTL, MMHUBBUB, inst),                         \
+      SRI2_ARR(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB, inst),                   \
+      SRI2_ARR(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB, inst),                \
+      SRI2_ARR(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB, inst),                 \
+      SRI2_ARR(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB, inst)
+
+/* DSC */
+
+#define DSC_REG_LIST_DCN20_RI(id)                                              \
+  SRI_ARR(DSC_TOP_CONTROL, DSC_TOP, id),                                       \
+      SRI_ARR(DSC_DEBUG_CONTROL, DSC_TOP, id),                                 \
+      SRI_ARR(DSCC_CONFIG0, DSCC, id), SRI_ARR(DSCC_CONFIG1, DSCC, id),        \
+      SRI_ARR(DSCC_STATUS, DSCC, id),                                          \
+      SRI_ARR(DSCC_INTERRUPT_CONTROL_STATUS, DSCC, id),                        \
+      SRI_ARR(DSCC_PPS_CONFIG0, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG1, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG2, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG3, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG4, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG5, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG6, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG7, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG8, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG9, DSCC, id),                                     \
+      SRI_ARR(DSCC_PPS_CONFIG10, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG11, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG12, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG13, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG14, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG15, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG16, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG17, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG18, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG19, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG20, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG21, DSCC, id),                                    \
+      SRI_ARR(DSCC_PPS_CONFIG22, DSCC, id),                                    \
+      SRI_ARR(DSCC_MEM_POWER_CONTROL, DSCC, id),                               \
+      SRI_ARR(DSCC_R_Y_SQUARED_ERROR_LOWER, DSCC, id),                         \
+      SRI_ARR(DSCC_R_Y_SQUARED_ERROR_UPPER, DSCC, id),                         \
+      SRI_ARR(DSCC_G_CB_SQUARED_ERROR_LOWER, DSCC, id),                        \
+      SRI_ARR(DSCC_G_CB_SQUARED_ERROR_UPPER, DSCC, id),                        \
+      SRI_ARR(DSCC_B_CR_SQUARED_ERROR_LOWER, DSCC, id),                        \
+      SRI_ARR(DSCC_B_CR_SQUARED_ERROR_UPPER, DSCC, id),                        \
+      SRI_ARR(DSCC_MAX_ABS_ERROR0, DSCC, id),                                  \
+      SRI_ARR(DSCC_MAX_ABS_ERROR1, DSCC, id),                                  \
+      SRI_ARR(DSCC_RATE_BUFFER0_MAX_FULLNESS_LEVEL, DSCC, id),                 \
+      SRI_ARR(DSCC_RATE_BUFFER1_MAX_FULLNESS_LEVEL, DSCC, id),                 \
+      SRI_ARR(DSCC_RATE_BUFFER2_MAX_FULLNESS_LEVEL, DSCC, id),                 \
+      SRI_ARR(DSCC_RATE_BUFFER3_MAX_FULLNESS_LEVEL, DSCC, id),                 \
+      SRI_ARR(DSCC_RATE_CONTROL_BUFFER0_MAX_FULLNESS_LEVEL, DSCC, id),         \
+      SRI_ARR(DSCC_RATE_CONTROL_BUFFER1_MAX_FULLNESS_LEVEL, DSCC, id),         \
+      SRI_ARR(DSCC_RATE_CONTROL_BUFFER2_MAX_FULLNESS_LEVEL, DSCC, id),         \
+      SRI_ARR(DSCC_RATE_CONTROL_BUFFER3_MAX_FULLNESS_LEVEL, DSCC, id),         \
+      SRI_ARR(DSCCIF_CONFIG0, DSCCIF, id),                                     \
+      SRI_ARR(DSCCIF_CONFIG1, DSCCIF, id),                                     \
+      SRI_ARR(DSCRM_DSC_FORWARD_CONFIG, DSCRM, id)
+
+/* MPC */
+
+#define MPC_DWB_MUX_REG_LIST_DCN3_0_RI(inst)                                   \
+  SRII_DWB(DWB_MUX, MUX, MPC_DWB, inst)
+
+#define MPC_MCM_REG_LIST_DCN32_RI(inst)                                        \
+  SRII(MPCC_MCM_SHAPER_CONTROL, MPCC_MCM, inst),                               \
+      SRII(MPCC_MCM_SHAPER_OFFSET_R, MPCC_MCM, inst),                          \
+      SRII(MPCC_MCM_SHAPER_OFFSET_G, MPCC_MCM, inst),                          \
+      SRII(MPCC_MCM_SHAPER_OFFSET_B, MPCC_MCM, inst),                          \
+      SRII(MPCC_MCM_SHAPER_SCALE_R, MPCC_MCM, inst),                           \
+      SRII(MPCC_MCM_SHAPER_SCALE_G_B, MPCC_MCM, inst),                         \
+      SRII(MPCC_MCM_SHAPER_LUT_INDEX, MPCC_MCM, inst),                         \
+      SRII(MPCC_MCM_SHAPER_LUT_DATA, MPCC_MCM, inst),                          \
+      SRII(MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_B, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_G, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_R, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_B, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_G, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_R, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_2_3, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_4_5, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_6_7, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_8_9, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_10_11, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_12_13, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_14_15, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_16_17, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_18_19, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_20_21, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_22_23, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_24_25, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_26_27, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_28_29, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_30_31, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMA_REGION_32_33, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_B, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_G, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_R, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_B, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_G, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_R, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_0_1, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_2_3, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_4_5, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_6_7, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_8_9, MPCC_MCM, inst),                   \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_10_11, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_12_13, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_14_15, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_16_17, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_18_19, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_20_21, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_22_23, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_24_25, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_26_27, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_28_29, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_30_31, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_SHAPER_RAMB_REGION_32_33, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_3DLUT_MODE, MPCC_MCM, inst),                               \
+      SRII(MPCC_MCM_3DLUT_INDEX, MPCC_MCM, inst),                              \
+      SRII(MPCC_MCM_3DLUT_DATA, MPCC_MCM, inst),                               \
+      SRII(MPCC_MCM_3DLUT_DATA_30BIT, MPCC_MCM, inst),                         \
+      SRII(MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM, inst),                 \
+      SRII(MPCC_MCM_3DLUT_OUT_NORM_FACTOR, MPCC_MCM, inst),                    \
+      SRII(MPCC_MCM_3DLUT_OUT_OFFSET_R, MPCC_MCM, inst),                       \
+      SRII(MPCC_MCM_3DLUT_OUT_OFFSET_G, MPCC_MCM, inst),                       \
+      SRII(MPCC_MCM_3DLUT_OUT_OFFSET_B, MPCC_MCM, inst),                       \
+      SRII(MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM, inst)
+
+#define MPC_OUT_MUX_COMMON_REG_LIST_DCN1_0_RI(inst)                            \
+  SRII(MUX, MPC_OUT, inst), VUPDATE_SRII(CUR, VUPDATE_LOCK_SET, inst)
+
+#define MPC_OUT_MUX_REG_LIST_DCN3_0_RI(inst)                                   \
+  MPC_OUT_MUX_COMMON_REG_LIST_DCN1_0_RI(inst), SRII(CSC_MODE, MPC_OUT, inst),  \
+      SRII(CSC_C11_C12_A, MPC_OUT, inst), SRII(CSC_C33_C34_A, MPC_OUT, inst),  \
+      SRII(CSC_C11_C12_B, MPC_OUT, inst), SRII(CSC_C33_C34_B, MPC_OUT, inst),  \
+      SRII(DENORM_CONTROL, MPC_OUT, inst),                                     \
+      SRII(DENORM_CLAMP_G_Y, MPC_OUT, inst),                                   \
+      SRII(DENORM_CLAMP_B_CB, MPC_OUT, inst), SR(MPC_OUT_CSC_COEF_FORMAT)
+
+#define MPC_COMMON_REG_LIST_DCN1_0_RI(inst)                                    \
+  SRII(MPCC_TOP_SEL, MPCC, inst), SRII(MPCC_BOT_SEL, MPCC, inst),              \
+      SRII(MPCC_CONTROL, MPCC, inst), SRII(MPCC_STATUS, MPCC, inst),           \
+      SRII(MPCC_OPP_ID, MPCC, inst), SRII(MPCC_BG_G_Y, MPCC, inst),            \
+      SRII(MPCC_BG_R_CR, MPCC, inst), SRII(MPCC_BG_B_CB, MPCC, inst),          \
+      SRII(MPCC_SM_CONTROL, MPCC, inst),                                       \
+      SRII(MPCC_UPDATE_LOCK_SEL, MPCC, inst)
+
+#define MPC_REG_LIST_DCN3_0_RI(inst)                                           \
+  MPC_COMMON_REG_LIST_DCN1_0_RI(inst), SRII(MPCC_TOP_GAIN, MPCC, inst),        \
+      SRII(MPCC_BOT_GAIN_INSIDE, MPCC, inst),                                  \
+      SRII(MPCC_BOT_GAIN_OUTSIDE, MPCC, inst),                                 \
+      SRII(MPCC_MEM_PWR_CTRL, MPCC, inst),                                     \
+      SRII(MPCC_OGAM_LUT_INDEX, MPCC_OGAM, inst),                              \
+      SRII(MPCC_OGAM_LUT_DATA, MPCC_OGAM, inst),                               \
+      SRII(MPCC_GAMUT_REMAP_COEF_FORMAT, MPCC_OGAM, inst),                     \
+      SRII(MPCC_GAMUT_REMAP_MODE, MPCC_OGAM, inst),                            \
+      SRII(MPC_GAMUT_REMAP_C11_C12_A, MPCC_OGAM, inst),                        \
+      SRII(MPC_GAMUT_REMAP_C33_C34_A, MPCC_OGAM, inst),                        \
+      SRII(MPC_GAMUT_REMAP_C11_C12_B, MPCC_OGAM, inst),                        \
+      SRII(MPC_GAMUT_REMAP_C33_C34_B, MPCC_OGAM, inst),                        \
+      SRII(MPCC_OGAM_RAMA_START_CNTL_B, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMA_START_CNTL_G, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMA_START_CNTL_R, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMA_START_SLOPE_CNTL_B, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMA_START_SLOPE_CNTL_G, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMA_START_SLOPE_CNTL_R, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMA_END_CNTL1_B, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_END_CNTL2_B, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_END_CNTL1_G, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_END_CNTL2_G, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_END_CNTL1_R, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_END_CNTL2_R, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM, inst),                        \
+      SRII(MPCC_OGAM_RAMA_REGION_32_33, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMA_OFFSET_B, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMA_OFFSET_G, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMA_OFFSET_R, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMA_START_BASE_CNTL_B, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_RAMA_START_BASE_CNTL_G, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_RAMA_START_BASE_CNTL_R, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_RAMB_START_CNTL_B, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMB_START_CNTL_G, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMB_START_CNTL_R, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMB_START_SLOPE_CNTL_B, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMB_START_SLOPE_CNTL_G, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMB_START_SLOPE_CNTL_R, MPCC_OGAM, inst),                \
+      SRII(MPCC_OGAM_RAMB_END_CNTL1_B, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_END_CNTL2_B, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_END_CNTL1_G, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_END_CNTL2_G, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_END_CNTL1_R, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_END_CNTL2_R, MPCC_OGAM, inst),                       \
+      SRII(MPCC_OGAM_RAMB_REGION_0_1, MPCC_OGAM, inst),                        \
+      SRII(MPCC_OGAM_RAMB_REGION_32_33, MPCC_OGAM, inst),                      \
+      SRII(MPCC_OGAM_RAMB_OFFSET_B, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMB_OFFSET_G, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMB_OFFSET_R, MPCC_OGAM, inst),                          \
+      SRII(MPCC_OGAM_RAMB_START_BASE_CNTL_B, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_RAMB_START_BASE_CNTL_G, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_RAMB_START_BASE_CNTL_R, MPCC_OGAM, inst),                 \
+      SRII(MPCC_OGAM_CONTROL, MPCC_OGAM, inst),                                \
+      SRII(MPCC_OGAM_LUT_CONTROL, MPCC_OGAM, inst)
+
+/* OPTC */
+
+#define OPTC_COMMON_REG_LIST_DCN3_2_RI(inst)                                   \
+  SRI_ARR(OTG_VSTARTUP_PARAM, OTG, inst),                                      \
+      SRI_ARR(OTG_VUPDATE_PARAM, OTG, inst),                                   \
+      SRI_ARR(OTG_VREADY_PARAM, OTG, inst),                                    \
+      SRI_ARR(OTG_MASTER_UPDATE_LOCK, OTG, inst),                              \
+      SRI_ARR(OTG_GLOBAL_CONTROL0, OTG, inst),                                 \
+      SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),                                 \
+      SRI_ARR(OTG_GLOBAL_CONTROL2, OTG, inst),                                 \
+      SRI_ARR(OTG_GLOBAL_CONTROL4, OTG, inst),                                 \
+      SRI_ARR(OTG_DOUBLE_BUFFER_CONTROL, OTG, inst),                           \
+      SRI_ARR(OTG_H_TOTAL, OTG, inst),                                         \
+      SRI_ARR(OTG_H_BLANK_START_END, OTG, inst),                               \
+      SRI_ARR(OTG_H_SYNC_A, OTG, inst), SRI_ARR(OTG_H_SYNC_A_CNTL, OTG, inst), \
+      SRI_ARR(OTG_H_TIMING_CNTL, OTG, inst), SRI_ARR(OTG_V_TOTAL, OTG, inst),  \
+      SRI_ARR(OTG_V_BLANK_START_END, OTG, inst),                               \
+      SRI_ARR(OTG_V_SYNC_A, OTG, inst), SRI_ARR(OTG_V_SYNC_A_CNTL, OTG, inst), \
+      SRI_ARR(OTG_CONTROL, OTG, inst), SRI_ARR(OTG_STEREO_CONTROL, OTG, inst), \
+      SRI_ARR(OTG_3D_STRUCTURE_CONTROL, OTG, inst),                            \
+      SRI_ARR(OTG_STEREO_STATUS, OTG, inst),                                   \
+      SRI_ARR(OTG_V_TOTAL_MAX, OTG, inst),                                     \
+      SRI_ARR(OTG_V_TOTAL_MIN, OTG, inst),                                     \
+      SRI_ARR(OTG_V_TOTAL_CONTROL, OTG, inst),                                 \
+      SRI_ARR(OTG_TRIGA_CNTL, OTG, inst),                                      \
+      SRI_ARR(OTG_FORCE_COUNT_NOW_CNTL, OTG, inst),                            \
+      SRI_ARR(OTG_STATIC_SCREEN_CONTROL, OTG, inst),                           \
+      SRI_ARR(OTG_STATUS_FRAME_COUNT, OTG, inst),                              \
+      SRI_ARR(OTG_STATUS, OTG, inst), SRI_ARR(OTG_STATUS_POSITION, OTG, inst), \
+      SRI_ARR(OTG_NOM_VERT_POSITION, OTG, inst),                               \
+      SRI_ARR(OTG_M_CONST_DTO0, OTG, inst),                                    \
+      SRI_ARR(OTG_M_CONST_DTO1, OTG, inst),                                    \
+      SRI_ARR(OTG_CLOCK_CONTROL, OTG, inst),                                   \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT0_CONTROL, OTG, inst),                     \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT0_POSITION, OTG, inst),                    \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT1_CONTROL, OTG, inst),                     \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT1_POSITION, OTG, inst),                    \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT2_CONTROL, OTG, inst),                     \
+      SRI_ARR(OTG_VERTICAL_INTERRUPT2_POSITION, OTG, inst),                    \
+      SRI_ARR(OPTC_INPUT_CLOCK_CONTROL, ODM, inst),                            \
+      SRI_ARR(OPTC_DATA_SOURCE_SELECT, ODM, inst),                             \
+      SRI_ARR(OPTC_INPUT_GLOBAL_CONTROL, ODM, inst),                           \
+      SRI_ARR(CONTROL, VTG, inst), SRI_ARR(OTG_VERT_SYNC_CONTROL, OTG, inst),  \
+      SRI_ARR(OTG_GSL_CONTROL, OTG, inst), SRI_ARR(OTG_CRC_CNTL, OTG, inst),   \
+      SRI_ARR(OTG_CRC0_DATA_RG, OTG, inst),                                    \
+      SRI_ARR(OTG_CRC0_DATA_B, OTG, inst),                                     \
+      SRI_ARR(OTG_CRC0_WINDOWA_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),                          \
+      SR_ARR(GSL_SOURCE_SELECT, inst),                                         \
+      SRI_ARR(OTG_TRIGA_MANUAL_TRIG, OTG, inst),                               \
+      SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),                                 \
+      SRI_ARR(OTG_GLOBAL_CONTROL2, OTG, inst),                                 \
+      SRI_ARR(OTG_GSL_WINDOW_X, OTG, inst),                                    \
+      SRI_ARR(OTG_GSL_WINDOW_Y, OTG, inst),                                    \
+      SRI_ARR(OTG_VUPDATE_KEEPOUT, OTG, inst),                                 \
+      SRI_ARR(OTG_DSC_START_POSITION, OTG, inst),                              \
+      SRI_ARR(OTG_DRR_TRIGGER_WINDOW, OTG, inst),                              \
+      SRI_ARR(OTG_DRR_V_TOTAL_CHANGE, OTG, inst),                              \
+      SRI_ARR(OPTC_DATA_FORMAT_CONTROL, ODM, inst),                            \
+      SRI_ARR(OPTC_BYTES_PER_PIXEL, ODM, inst),                                \
+      SRI_ARR(OPTC_WIDTH_CONTROL, ODM, inst),                                  \
+      SRI_ARR(OPTC_MEMORY_CONFIG, ODM, inst),                                  \
+      SRI_ARR(OTG_DRR_CONTROL, OTG, inst)
+
+/* HUBP */
+
+#define HUBP_REG_LIST_DCN_VM_RI(id)                                            \
+  SRI_ARR(NOM_PARAMETERS_0, HUBPREQ, id),                                      \
+      SRI_ARR(NOM_PARAMETERS_1, HUBPREQ, id),                                  \
+      SRI_ARR(NOM_PARAMETERS_2, HUBPREQ, id),                                  \
+      SRI_ARR(NOM_PARAMETERS_3, HUBPREQ, id),                                  \
+      SRI_ARR(DCN_VM_MX_L1_TLB_CNTL, HUBPREQ, id)
+#define HUBP_REG_LIST_DCN_RI(id)                                               \
+  SRI_ARR(DCHUBP_CNTL, HUBP, id), SRI_ARR(HUBPREQ_DEBUG_DB, HUBP, id),         \
+      SRI_ARR(HUBPREQ_DEBUG, HUBP, id), SRI_ARR(DCSURF_ADDR_CONFIG, HUBP, id), \
+      SRI_ARR(DCSURF_TILING_CONFIG, HUBP, id),                                 \
+      SRI_ARR(DCSURF_SURFACE_PITCH, HUBPREQ, id),                              \
+      SRI_ARR(DCSURF_SURFACE_PITCH_C, HUBPREQ, id),                            \
+      SRI_ARR(DCSURF_SURFACE_CONFIG, HUBP, id),                                \
+      SRI_ARR(DCSURF_FLIP_CONTROL, HUBPREQ, id),                               \
+      SRI_ARR(DCSURF_PRI_VIEWPORT_DIMENSION, HUBP, id),                        \
+      SRI_ARR(DCSURF_PRI_VIEWPORT_START, HUBP, id),                            \
+      SRI_ARR(DCSURF_SEC_VIEWPORT_DIMENSION, HUBP, id),                        \
+      SRI_ARR(DCSURF_SEC_VIEWPORT_START, HUBP, id),                            \
+      SRI_ARR(DCSURF_PRI_VIEWPORT_DIMENSION_C, HUBP, id),                      \
+      SRI_ARR(DCSURF_PRI_VIEWPORT_START_C, HUBP, id),                          \
+      SRI_ARR(DCSURF_SEC_VIEWPORT_DIMENSION_C, HUBP, id),                      \
+      SRI_ARR(DCSURF_SEC_VIEWPORT_START_C, HUBP, id),                          \
+      SRI_ARR(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, HUBPREQ, id),               \
+      SRI_ARR(DCSURF_PRIMARY_SURFACE_ADDRESS, HUBPREQ, id),                    \
+      SRI_ARR(DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH, HUBPREQ, id),             \
+      SRI_ARR(DCSURF_SECONDARY_SURFACE_ADDRESS, HUBPREQ, id),                  \
+      SRI_ARR(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, HUBPREQ, id),          \
+      SRI_ARR(DCSURF_PRIMARY_META_SURFACE_ADDRESS, HUBPREQ, id),               \
+      SRI_ARR(DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH, HUBPREQ, id),        \
+      SRI_ARR(DCSURF_SECONDARY_META_SURFACE_ADDRESS, HUBPREQ, id),             \
+      SRI_ARR(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, HUBPREQ, id),             \
+      SRI_ARR(DCSURF_PRIMARY_SURFACE_ADDRESS_C, HUBPREQ, id),                  \
+      SRI_ARR(DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH_C, HUBPREQ, id),           \
+      SRI_ARR(DCSURF_SECONDARY_SURFACE_ADDRESS_C, HUBPREQ, id),                \
+      SRI_ARR(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, HUBPREQ, id),        \
+      SRI_ARR(DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, HUBPREQ, id),             \
+      SRI_ARR(DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH_C, HUBPREQ, id),      \
+      SRI_ARR(DCSURF_SECONDARY_META_SURFACE_ADDRESS_C, HUBPREQ, id),           \
+      SRI_ARR(DCSURF_SURFACE_INUSE, HUBPREQ, id),                              \
+      SRI_ARR(DCSURF_SURFACE_INUSE_HIGH, HUBPREQ, id),                         \
+      SRI_ARR(DCSURF_SURFACE_INUSE_C, HUBPREQ, id),                            \
+      SRI_ARR(DCSURF_SURFACE_INUSE_HIGH_C, HUBPREQ, id),                       \
+      SRI_ARR(DCSURF_SURFACE_EARLIEST_INUSE, HUBPREQ, id),                     \
+      SRI_ARR(DCSURF_SURFACE_EARLIEST_INUSE_HIGH, HUBPREQ, id),                \
+      SRI_ARR(DCSURF_SURFACE_EARLIEST_INUSE_C, HUBPREQ, id),                   \
+      SRI_ARR(DCSURF_SURFACE_EARLIEST_INUSE_HIGH_C, HUBPREQ, id),              \
+      SRI_ARR(DCSURF_SURFACE_CONTROL, HUBPREQ, id),                            \
+      SRI_ARR(DCSURF_SURFACE_FLIP_INTERRUPT, HUBPREQ, id),                     \
+      SRI_ARR(HUBPRET_CONTROL, HUBPRET, id),                                   \
+      SRI_ARR(HUBPRET_READ_LINE_STATUS, HUBPRET, id),                          \
+      SRI_ARR(DCN_EXPANSION_MODE, HUBPREQ, id),                                \
+      SRI_ARR(DCHUBP_REQ_SIZE_CONFIG, HUBP, id),                               \
+      SRI_ARR(DCHUBP_REQ_SIZE_CONFIG_C, HUBP, id),                             \
+      SRI_ARR(BLANK_OFFSET_0, HUBPREQ, id),                                    \
+      SRI_ARR(BLANK_OFFSET_1, HUBPREQ, id),                                    \
+      SRI_ARR(DST_DIMENSIONS, HUBPREQ, id),                                    \
+      SRI_ARR(DST_AFTER_SCALER, HUBPREQ, id),                                  \
+      SRI_ARR(VBLANK_PARAMETERS_0, HUBPREQ, id),                               \
+      SRI_ARR(REF_FREQ_TO_PIX_FREQ, HUBPREQ, id),                              \
+      SRI_ARR(VBLANK_PARAMETERS_1, HUBPREQ, id),                               \
+      SRI_ARR(VBLANK_PARAMETERS_3, HUBPREQ, id),                               \
+      SRI_ARR(NOM_PARAMETERS_4, HUBPREQ, id),                                  \
+      SRI_ARR(NOM_PARAMETERS_5, HUBPREQ, id),                                  \
+      SRI_ARR(PER_LINE_DELIVERY_PRE, HUBPREQ, id),                             \
+      SRI_ARR(PER_LINE_DELIVERY, HUBPREQ, id),                                 \
+      SRI_ARR(VBLANK_PARAMETERS_2, HUBPREQ, id),                               \
+      SRI_ARR(VBLANK_PARAMETERS_4, HUBPREQ, id),                               \
+      SRI_ARR(NOM_PARAMETERS_6, HUBPREQ, id),                                  \
+      SRI_ARR(NOM_PARAMETERS_7, HUBPREQ, id),                                  \
+      SRI_ARR(DCN_TTU_QOS_WM, HUBPREQ, id),                                    \
+      SRI_ARR(DCN_GLOBAL_TTU_CNTL, HUBPREQ, id),                               \
+      SRI_ARR(DCN_SURF0_TTU_CNTL0, HUBPREQ, id),                               \
+      SRI_ARR(DCN_SURF0_TTU_CNTL1, HUBPREQ, id),                               \
+      SRI_ARR(DCN_SURF1_TTU_CNTL0, HUBPREQ, id),                               \
+      SRI_ARR(DCN_SURF1_TTU_CNTL1, HUBPREQ, id),                               \
+      SRI_ARR(DCN_CUR0_TTU_CNTL0, HUBPREQ, id),                                \
+      SRI_ARR(DCN_CUR0_TTU_CNTL1, HUBPREQ, id),                                \
+      SRI_ARR(HUBP_CLK_CNTL, HUBP, id)
+#define HUBP_REG_LIST_DCN2_COMMON_RI(id)                                       \
+  HUBP_REG_LIST_DCN_RI(id), HUBP_REG_LIST_DCN_VM_RI(id),                       \
+      SRI_ARR(PREFETCH_SETTINGS, HUBPREQ, id),                                 \
+      SRI_ARR(PREFETCH_SETTINGS_C, HUBPREQ, id),                               \
+      SRI_ARR(DCN_VM_SYSTEM_APERTURE_LOW_ADDR, HUBPREQ, id),                   \
+      SRI_ARR(DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, HUBPREQ, id),                  \
+      SRI_ARR(CURSOR_SETTINGS, HUBPREQ, id),                                   \
+      SRI_ARR(CURSOR_SURFACE_ADDRESS_HIGH, CURSOR0_, id),                      \
+      SRI_ARR(CURSOR_SURFACE_ADDRESS, CURSOR0_, id),                           \
+      SRI_ARR(CURSOR_SIZE, CURSOR0_, id),                                      \
+      SRI_ARR(CURSOR_CONTROL, CURSOR0_, id),                                   \
+      SRI_ARR(CURSOR_POSITION, CURSOR0_, id),                                  \
+      SRI_ARR(CURSOR_HOT_SPOT, CURSOR0_, id),                                  \
+      SRI_ARR(CURSOR_DST_OFFSET, CURSOR0_, id),                                \
+      SRI_ARR(DMDATA_ADDRESS_HIGH, CURSOR0_, id),                              \
+      SRI_ARR(DMDATA_ADDRESS_LOW, CURSOR0_, id),                               \
+      SRI_ARR(DMDATA_CNTL, CURSOR0_, id),                                      \
+      SRI_ARR(DMDATA_SW_CNTL, CURSOR0_, id),                                   \
+      SRI_ARR(DMDATA_QOS_CNTL, CURSOR0_, id),                                  \
+      SRI_ARR(DMDATA_SW_DATA, CURSOR0_, id),                                   \
+      SRI_ARR(DMDATA_STATUS, CURSOR0_, id),                                    \
+      SRI_ARR(FLIP_PARAMETERS_0, HUBPREQ, id),                                 \
+      SRI_ARR(FLIP_PARAMETERS_1, HUBPREQ, id),                                 \
+      SRI_ARR(FLIP_PARAMETERS_2, HUBPREQ, id),                                 \
+      SRI_ARR(DCN_CUR1_TTU_CNTL0, HUBPREQ, id),                                \
+      SRI_ARR(DCN_CUR1_TTU_CNTL1, HUBPREQ, id),                                \
+      SRI_ARR(DCSURF_FLIP_CONTROL2, HUBPREQ, id),                              \
+      SRI_ARR(VMID_SETTINGS_0, HUBPREQ, id)
+#define HUBP_REG_LIST_DCN21_RI(id)                                             \
+  HUBP_REG_LIST_DCN2_COMMON_RI(id), SRI_ARR(FLIP_PARAMETERS_3, HUBPREQ, id),   \
+      SRI_ARR(FLIP_PARAMETERS_4, HUBPREQ, id),                                 \
+      SRI_ARR(FLIP_PARAMETERS_5, HUBPREQ, id),                                 \
+      SRI_ARR(FLIP_PARAMETERS_6, HUBPREQ, id),                                 \
+      SRI_ARR(VBLANK_PARAMETERS_5, HUBPREQ, id),                               \
+      SRI_ARR(VBLANK_PARAMETERS_6, HUBPREQ, id)
+#define HUBP_REG_LIST_DCN30_RI(id)                                             \
+  HUBP_REG_LIST_DCN21_RI(id), SRI_ARR(DCN_DMDATA_VM_CNTL, HUBPREQ, id)
+#define HUBP_REG_LIST_DCN32_RI(id)                                             \
+  HUBP_REG_LIST_DCN30_RI(id), SRI_ARR(DCHUBP_MALL_CONFIG, HUBP, id),           \
+      SRI_ARR(DCHUBP_VMPG_CONFIG, HUBP, id),                                   \
+      SRI_ARR(UCLK_PSTATE_FORCE, HUBPREQ, id)
+
+/* HUBBUB */
+
+#define HUBBUB_REG_LIST_DCN32_RI(id)                                           \
+  SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A),                                   \
+      SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B),                               \
+      SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C),                               \
+      SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D),                               \
+      SR(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL),                                  \
+      SR(DCHUBBUB_ARB_DRAM_STATE_CNTL), SR(DCHUBBUB_ARB_SAT_LEVEL),            \
+      SR(DCHUBBUB_ARB_DF_REQ_OUTSTAND), SR(DCHUBBUB_GLOBAL_TIMER_CNTL),        \
+      SR(DCHUBBUB_SOFT_RESET), SR(DCHUBBUB_CRC_CTRL),                          \
+      SR(DCN_VM_FB_LOCATION_BASE), SR(DCN_VM_FB_LOCATION_TOP),                 \
+      SR(DCN_VM_FB_OFFSET), SR(DCN_VM_AGP_BOT), SR(DCN_VM_AGP_TOP),            \
+      SR(DCN_VM_AGP_BASE), HUBBUB_SR_WATERMARK_REG_LIST(),                     \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A), SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B),  \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C), SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D),  \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A),                                     \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B),                                     \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C),                                     \
+      SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D),                                     \
+      SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A),                            \
+      SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B),                            \
+      SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C),                            \
+      SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D), SR(DCHUBBUB_DET0_CTRL),    \
+      SR(DCHUBBUB_DET1_CTRL), SR(DCHUBBUB_DET2_CTRL), SR(DCHUBBUB_DET3_CTRL),  \
+      SR(DCHUBBUB_COMPBUF_CTRL), SR(COMPBUF_RESERVED_SPACE),                   \
+      SR(DCHUBBUB_ARB_USR_RETRAINING_CNTL),                                    \
+      SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A),                             \
+      SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B),                             \
+      SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C),                             \
+      SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D),                             \
+      SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A),                         \
+      SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B),                         \
+      SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C),                         \
+      SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D),                         \
+      SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A),                         \
+      SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B),                         \
+      SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C),                         \
+      SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D),                         \
+      SR(DCN_VM_FAULT_ADDR_MSB), SR(DCN_VM_FAULT_ADDR_LSB),                    \
+      SR(DCN_VM_FAULT_CNTL), SR(DCN_VM_FAULT_STATUS)
+
+/* DCCG */
+
+#define DCCG_REG_LIST_DCN32_RI()                                               \
+  SR(DPPCLK_DTO_CTRL), DCCG_SRII(DTO_PARAM, DPPCLK, 0),                        \
+      DCCG_SRII(DTO_PARAM, DPPCLK, 1), DCCG_SRII(DTO_PARAM, DPPCLK, 2),        \
+      DCCG_SRII(DTO_PARAM, DPPCLK, 3), DCCG_SRII(CLOCK_CNTL, HDMICHARCLK, 0),  \
+      SR(PHYASYMCLK_CLOCK_CNTL), SR(PHYBSYMCLK_CLOCK_CNTL),                    \
+      SR(PHYCSYMCLK_CLOCK_CNTL), SR(PHYDSYMCLK_CLOCK_CNTL),                    \
+      SR(PHYESYMCLK_CLOCK_CNTL), SR(DPSTREAMCLK_CNTL), SR(HDMISTREAMCLK_CNTL), \
+      SR(SYMCLK32_SE_CNTL), SR(SYMCLK32_LE_CNTL),                              \
+      DCCG_SRII(PIXEL_RATE_CNTL, OTG, 0), DCCG_SRII(PIXEL_RATE_CNTL, OTG, 1),  \
+      DCCG_SRII(PIXEL_RATE_CNTL, OTG, 2), DCCG_SRII(PIXEL_RATE_CNTL, OTG, 3),  \
+      DCCG_SRII(MODULO, DTBCLK_DTO, 0), DCCG_SRII(MODULO, DTBCLK_DTO, 1),      \
+      DCCG_SRII(MODULO, DTBCLK_DTO, 2), DCCG_SRII(MODULO, DTBCLK_DTO, 3),      \
+      DCCG_SRII(PHASE, DTBCLK_DTO, 0), DCCG_SRII(PHASE, DTBCLK_DTO, 1),        \
+      DCCG_SRII(PHASE, DTBCLK_DTO, 2), DCCG_SRII(PHASE, DTBCLK_DTO, 3),        \
+      SR(DCCG_AUDIO_DTBCLK_DTO_MODULO), SR(DCCG_AUDIO_DTBCLK_DTO_PHASE),       \
+      SR(OTG_PIXEL_RATE_DIV), SR(DTBCLK_P_CNTL), SR(DCCG_AUDIO_DTO_SOURCE)
+
+/* VMID */
+#define DCN20_VMID_REG_LIST_RI(id)                                             \
+  SRI_ARR(CNTL, DCN_VM_CONTEXT, id),                                           \
+      SRI_ARR(PAGE_TABLE_BASE_ADDR_HI32, DCN_VM_CONTEXT, id),                  \
+      SRI_ARR(PAGE_TABLE_BASE_ADDR_LO32, DCN_VM_CONTEXT, id),                  \
+      SRI_ARR(PAGE_TABLE_START_ADDR_HI32, DCN_VM_CONTEXT, id),                 \
+      SRI_ARR(PAGE_TABLE_START_ADDR_LO32, DCN_VM_CONTEXT, id),                 \
+      SRI_ARR(PAGE_TABLE_END_ADDR_HI32, DCN_VM_CONTEXT, id),                   \
+      SRI_ARR(PAGE_TABLE_END_ADDR_LO32, DCN_VM_CONTEXT, id)
+
+/* I2C HW */
+
+#define I2C_HW_ENGINE_COMMON_REG_LIST_RI(id)                                   \
+  SRI_ARR(SETUP, DC_I2C_DDC, id), SRI_ARR(SPEED, DC_I2C_DDC, id),              \
+      SRI_ARR(HW_STATUS, DC_I2C_DDC, id), SR_ARR(DC_I2C_ARBITRATION, id),      \
+      SR_ARR(DC_I2C_CONTROL, id), SR_ARR(DC_I2C_SW_STATUS, id),                \
+      SR_ARR(DC_I2C_TRANSACTION0, id), SR_ARR(DC_I2C_TRANSACTION1, id),        \
+      SR_ARR(DC_I2C_TRANSACTION2, id), SR_ARR(DC_I2C_TRANSACTION3, id),        \
+      SR_ARR(DC_I2C_DATA, id), SR_ARR(MICROSECOND_TIME_BASE_DIV, id)
+
+#define I2C_HW_ENGINE_COMMON_REG_LIST_DCN30_RI(id)                             \
+  I2C_HW_ENGINE_COMMON_REG_LIST_RI(id), SR_ARR(DIO_MEM_PWR_CTRL, id),          \
+      SR_ARR(DIO_MEM_PWR_STATUS, id)
+
 #endif /* _DCN32_RESOURCE_H_ */
-- 
2.25.1

