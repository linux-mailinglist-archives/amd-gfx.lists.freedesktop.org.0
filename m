Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA155BC11
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Jun 2022 23:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242D510E9DA;
	Mon, 27 Jun 2022 21:04:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B7E10E9DA
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Jun 2022 21:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzJoaBnKQK27v20qNXS611t3UAbVVNStfVUWG/IcJEnm9sjYYZChw5r+kcsdzRXkPo6wmz1ffaHC4SVvETfive8gRIuvakaqRvngtulNoW7mCLmU5RGVW27EdSryohAkDr6XgfoL1oR5LW3GYtORfhKXlzLvEHO1Wk33rCBEVEhqBy+YNDZy+KnS3AdhtzyAtzuMQaOfVp8D4uMnDqLzfqU7PK9CBeObcfpOZxfaZZJpA232C7zOvclPmZ0zm1t9Ywe6ORsGbTWF4XDvSLoV9Kg7huAd5Pfmt10HAsU/VaVsAZzxwPYLqFGEBURyXjAbfFNR9iMuOMlj8wcKzuIiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3myfChLq2FTE2GFBqwfjrKEhDEu7TU9TVdabPCHLlQ=;
 b=M2GZJimtRvDZhUBML1BF2XlEG1qOr75STkvPo4GNc0hm6FvsvueKHH8rvkOFO7iBdmN+YFpHrA0LBg87FU3eDhia8VbcLsJ7KfHLY4a8TOxkvN9/Si2yqqpw8iS7R3jBF0MPkLFgzW1S320YytpWEzQOVtnJAjf8f0wrKY72OqddE08g6fCPKmql0/93hFv5pMpyn65tAYV9CLvmahDTOsxEg0aPKMLDmVo0MA1Cm0wnWccWbOuBsEDVw6C6xI964n8LwGhMBz3BYGN3+BoPo+cFO/9gDG8T10fFKc4OdZSaiFHCCDcRZAJG50JQjPJCTo3OQQsZfiJI5qNwkNua9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3myfChLq2FTE2GFBqwfjrKEhDEu7TU9TVdabPCHLlQ=;
 b=IZf+5CVbN4lIRt1MAUxUs7/9aHSEAUMqd6uLY1RqsWnN72Ai9mnKpO+LU16Ed2IgNwuR9wE8F2u6jCC2WBAjnLkRsv98fv6nYnOMumdw5+A/4Ur7LPOXjQ/UeLjrBdjtWqzt3yyY/y8x8De9N7vdFAgkLfuTiV+ERtkTKuV4Swc=
Received: from BN6PR22CA0036.namprd22.prod.outlook.com (2603:10b6:404:37::22)
 by MWHPR12MB1615.namprd12.prod.outlook.com (2603:10b6:301:10::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 21:04:33 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::8c) by BN6PR22CA0036.outlook.office365.com
 (2603:10b6:404:37::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 27 Jun 2022 21:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 21:04:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 16:04:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: add missing FP_START/END checks
 dcn32_clk_mgr.c
Date: Mon, 27 Jun 2022 17:04:15 -0400
Message-ID: <20220627210415.67100-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4090cc3c-ca19-4532-7116-08da5880a1ec
X-MS-TrafficTypeDiagnostic: MWHPR12MB1615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiGtGoWu/11yzwc7gvAT/hZ4ajETBylCpjjE/ffke4x2Vf8CtOdetBXpBsSEjy5Ir4rwEKlpBaJ0FwK+VNakvYv9mkyB3aAlrScEEEABT4Gn08TbXF8rcnGLGEhHZVByf1NyTqUAgCA8+0PGuHktj3u2OahT5rNvTs77jm7mIBbpr48vWUVSA9TaDPmUVXO54Ya1fapfTaHRXJCIhED6zQhhWHjXF94CxnFVwD28RspO+JlKLkgpGMKkA4xjN3B+XMdfEYrRF4wf0HI88t1CQllfyHt/3r45aqoTje4Zh/e7KCW0O/fMuBC7CKOwwt0L0q4EnPAEXxBQZ9sQSQOCe1XEjDmGwgBVUGpGemRyqkZFLf+UTfBl3BtGLa5/tbDvMdRlXAUIR1hjEoootZzqNBfPVGVMKHIEUmkKKtxLReAVOixBWPXGxWjYM+qRvzoU1BBrEMO9n0kEm8NEcO9buk3hoIxKptSxhOuXAdmKs9k5SIEUVy1w6JjCkTSEgcvqZUnApgZM0W+D0NTtJZMgL/HKKvfKxQkyybCP5vDKFdG2atoaplEKiE9eZKiozJP43S5DL7KRZwpd7XEH4g94HUMn9fkW0piv967OIawtRaUKWLGQ804xMBaMR91pT1yaA5gkJTmFyL6sKryrYZaj8sB75ahcnCICkymyhMCEYQH1c+reQmH980IaX9mi8hUFTsooLUrqnFbcjGF+Qxw5ed70xm/y9Sq42Jtu3aNHfoXvT87EDR7lsIZoZ2TDQM8KGmH8x4k8+dJdlHsj5LOlEtOUQBZ/wyEoxWcpO9dBJo4zwydD1btip1l23Vf6NjUrh5t+Z8PwfwnaUBX6r/EQoA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(47076005)(6666004)(41300700001)(186003)(8676002)(426003)(16526019)(2616005)(83380400001)(70586007)(7696005)(81166007)(1076003)(36860700001)(82740400003)(356005)(6916009)(26005)(336012)(70206006)(36756003)(4326008)(5660300002)(2906002)(40460700003)(86362001)(82310400005)(8936002)(40480700001)(316002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 21:04:32.1406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4090cc3c-ca19-4532-7116-08da5880a1ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1615
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Properly handle FP code in dcn32_clk_mgr.c.

Fixes: 265280b99822 ("drm/amd/display: add CLKMGR changes for DCN32/321")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 4e8059f20007..72bbe7f18f5d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -288,8 +288,10 @@ void dcn32_init_clocks(struct clk_mgr *clk_mgr_base)
 	/* Get UCLK, update bounding box */
 	clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
 
+	DC_FP_START();
 	/* WM range table */
 	dcn32_build_wm_range_table(clk_mgr);
+	DC_FP_END();
 }
 
 static void dcn32_update_clocks_update_dtb_dto(struct clk_mgr_internal *clk_mgr,
@@ -724,9 +726,11 @@ static void dcn32_get_memclk_states_from_smu(struct clk_mgr *clk_mgr_base)
 			&num_levels);
 	clk_mgr_base->bw_params->clk_table.num_entries = num_levels ? num_levels : 1;
 
+	DC_FP_START();
 	/* Refresh bounding box */
 	clk_mgr_base->ctx->dc->res_pool->funcs->update_bw_bounding_box(
 			clk_mgr->base.ctx->dc, clk_mgr_base->bw_params);
+	DC_FP_END();
 }
 
 static bool dcn32_are_clock_states_equal(struct dc_clocks *a,
-- 
2.35.3

