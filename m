Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A502AA0ED
	for <lists+amd-gfx@lfdr.de>; Sat,  7 Nov 2020 00:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CD26EB56;
	Fri,  6 Nov 2020 23:19:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3716EB5A
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 23:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz/xe5ndwWczF6Rkuxc8LnEw4wQe9fNcgXIM8xgxq87RAvqEmzSt7c3dj0WDs/guvVJ/fNfozKC1lqsR/FLGFwvkJeZ6l8bJBHeMd5fe4t3+Z6125IXiKTD7CPL911W/ZkGkee5cM3nL7JhoVpSuhlw2pduLLWhaHh5Ts7YLI8fmNp0AYur9KE8ENmO6G4wleN3vIGf68L22NNsORSR0Uv5W3hStCf5ik8LG2O3CmvVIBD40fmWHSEadZ9q0t7KtaRrW6p+p/9HZTljTIYMZbViQWcF8svS+0NLOoqt8TwpV0qtxvkfz+UbEKmyARlHywBJHZAFEYjfU3iPN0a8hEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmxnn/mwe1bkfAWDaWbLuoUuSJpHL07H6vdLz76/EiI=;
 b=VOQO9xup2iS/W983bwlvboQY6jywQe0MM/RZuB1TlMEU1Q+RE8Gz+6QW/p0N0W0u9jZ3fYO2BPK2FapGYFucj+HedJaowVRNexT6lRbPnmGVZKuK6EtYR06YwRiGXXEk+VcajXyuqKO9mPHwG+Ee+IAXbfPrJImbK6te3gs97Sj5V04PXXtQsRHJ/MopeHRr8hS+SlnLQm9GwU2ubia8zuDXiefQx9Ro3deeg5XReCnU0l5xqhZtyLdFThGN+eHvbIYmhSPJb/2AGa4x+rbVxqVEpwieMGDRauNftEymdaSGqfO12q4qse4H0hdMrOjZXu5Q3IVc9cQX52XnYZT3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=none action=none header.from=amd.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmxnn/mwe1bkfAWDaWbLuoUuSJpHL07H6vdLz76/EiI=;
 b=Ze8CfCSZIj1ExkFnggxPpeQ/nURg+FwdaJM7UQYC2NQNEgDFAm7LVBdVAQI4neSd17HLyjwwX4TOD6I9PyBQbufOt+Jh5Wn3QVcMlu2SiI+Ng66Y39q9DOY/fCOGUsbUTawkcCA8xlgLWeMc9w+is9SuqWV6zLPhO8EhxdIcGy0=
Received: from CO2PR05CA0075.namprd05.prod.outlook.com (2603:10b6:102:2::43)
 by DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 23:19:36 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::ef) by CO2PR05CA0075.outlook.office365.com
 (2603:10b6:102:2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Fri, 6 Nov 2020 23:19:36 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.22 via Frontend Transport; Fri, 6 Nov 2020 23:19:35 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 6 Nov 2020
 17:19:34 -0600
Received: from bindu-HP-EliteDesk-705-G4-MT.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Fri, 6 Nov 2020 17:19:33 -0600
From: Bindu R <bindu.r@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/14] drm/amd/display: check actual clock value.
Date: Fri, 6 Nov 2020 18:17:09 -0500
Message-ID: <20201106231710.1290392-14-bindu.r@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106231710.1290392-1-bindu.r@amd.com>
References: <20201106231710.1290392-1-bindu.r@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc3db82-3e97-4dc0-85e1-08d882aa6cf4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3209:
X-Microsoft-Antispam-PRVS: <DM6PR12MB320998A070EFC7CDFD973630F5ED0@DM6PR12MB3209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlJGj1NYpM+AAC5ZjobOHoyXvxyANayiRE51PkN1u5xSa+cMA7qoGBSJvlC15V8ea5NIj362TRgTEQYKFtliWLLVqz1UhbpH+oUZPMFk+ireckTeFEAK4weQ4bKVifF2epT6L0+vQgfRMBqOwfJM01dkBV6WJcb+5z5XdraSc2rjYUbQ9yO22XYlgEl6osJAPAwAKYGNHdp7DYETs9CTbA0OEj/0CEzO+MjyOqOqWikqiN09eTEFlTbgPBonwP59AKwIIVEU95QjVsPNv+JzYSqF46y8mCKwnQpKOBZWa+ZuX3ZM+7uoAL9sLWijrJZ2SbKbLlgnAT40Kb7DOaEq9p5ZQmLhMAUDkqMRkC4UdbWid9nIfo/ZDzkBrskqWxa8BLX9jJDJdg6UNt5+9KEvEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(478600001)(356005)(316002)(6916009)(83380400001)(47076004)(70586007)(2616005)(82740400003)(186003)(81166007)(26005)(426003)(336012)(36756003)(5660300002)(2906002)(70206006)(6666004)(7696005)(8936002)(4326008)(1076003)(82310400003)(8676002)(54906003)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 23:19:35.5171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc3db82-3e97-4dc0-85e1-08d882aa6cf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
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
Cc: Eryk.Brol@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 Qingqing.Zhuo@amd.com, Rodrigo.Siqueira@amd.com, Aurabindo.Pillai@amd.com,
 Yongqiang Sun <yongqiang.sun@amd.com>, Bhawanpreet.Lakha@amd.com,
 Bindu Ramamurthy <bindu.r@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Yongqiang Sun <yongqiang.sun@amd.com>

[Why]
Actual dpp/disp clock PMFW set are always equal or more than requested.
Need to cache the actual clock for debugging purpose.

[How]
Add actuall dpp/disp clk in clock manager and save it when set clocks.
Add an ASSERT in case of actual clock less than requested.

Signed-off-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c    | 9 ++++++---
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c  | 8 ++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                      | 2 ++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index f30f3fdba433..ec394e3d8367 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -170,7 +170,7 @@ void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 
 	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
-		rn_vbios_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+		clk_mgr_base->clks.actual_dispclk_khz = rn_vbios_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
 
 		update_dispclk = true;
 	}
@@ -178,11 +178,14 @@ void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 	if (dpp_clock_lowered) {
 		// increase per DPP DTO before lowering global dppclk
 		dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
-		rn_vbios_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+		clk_mgr_base->clks.actual_dppclk_khz =
+				rn_vbios_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+
 	} else {
 		// increase global DPPCLK before lowering per DPP DTO
 		if (update_dppclk || update_dispclk)
-			rn_vbios_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+			clk_mgr_base->clks.actual_dppclk_khz =
+					rn_vbios_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
 		// always update dtos unless clock is lowered and not safe to lower
 		if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
 			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
index 9a374522e963..ab2b9c61e565 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
@@ -136,6 +136,10 @@ int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dis
 		}
 	}
 
+	// pmfw always set clock more than or equal requested clock
+	if (!IS_DIAG_DC(dc->ctx->dce_environment))
+		ASSERT(actual_dispclk_set_mhz >= requested_dispclk_khz / 1000);
+
 	return actual_dispclk_set_mhz * 1000;
 }
 
@@ -194,12 +198,16 @@ void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phy
 int rn_vbios_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
 {
 	int actual_dppclk_set_mhz = -1;
+	struct dc *dc = clk_mgr->base.ctx->dc;
 
 	actual_dppclk_set_mhz = rn_vbios_smu_send_msg_with_param(
 			clk_mgr,
 			VBIOSSMC_MSG_SetDppclkFreq,
 			requested_dpp_khz / 1000);
 
+	if (!IS_DIAG_DC(dc->ctx->dce_environment))
+		ASSERT(actual_dppclk_set_mhz >= requested_dpp_khz / 1000);
+
 	return actual_dppclk_set_mhz * 1000;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 67e9602c069d..962b20e607ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -342,7 +342,9 @@ enum dcn_pwr_state {
  */
 struct dc_clocks {
 	int dispclk_khz;
+	int actual_dispclk_khz;
 	int dppclk_khz;
+	int actual_dppclk_khz;
 	int disp_dpp_voltage_level_khz;
 	int dcfclk_khz;
 	int socclk_khz;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
