Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A432839F9FF
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Jun 2021 17:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D452E6EC13;
	Tue,  8 Jun 2021 15:08:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7FC6EC13
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Jun 2021 15:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA6P6nlklJ4b5nA0gcQkAkdbZnggbmqekYfZKYwAySyAh/jecT4QAOApco+8QHrWIBgWHZXtNB1UajdaWZvO8+2BsebdiMRM2BTt7kH5rqWLgzMmVmmkPcRYDikpn1DpvA81urieq0Q3hgls9xjNMdOemrw8hP3vXhxRD7McCY5oLIjaWB6VSK/zeEjoXCoOXMkzVE5bKicJqV2VmK8aozB1aXOfl1m6CL9bvnPN7ebTQG9mPgL5aSRXygAwao+XjLKsrzOya/uqCaC3Vodj3udzRo+d/qBFCMLlJ9nLPTCE6Amonzas0xxhG3dAZiL/lGFpk+8jlklUL4xEu/lGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l77S0qbhJV8dQDHQ/C/8iB1L5sRI9b3VSSnFWlHws0=;
 b=KiJr/RAkvkeqxrKxCYmphr2+CFMpQOE2MaQ+NdBcoZcDC5C2ZWLlwqwfB3ctn+58qGGkxBqJOVsxC0eVQT5MNT7TqYAaYr4hb0pSZPqdD7Jd+dZ3aW6vfDCwGX6/c8Y1kf03PtIaeyu8iu5h9UHmOpp+4QgLoamoZLfkYSiu9bNRjIOIuVuzmSnSQOTGJ5LdYKNRLeY1W1ZR3B1rP55A4sltcJfW560xm4bW3XvupUi9H00Jn2tTSAXlumo8RUB/cHpNyDLmeKHAEltNk+wIas9w00CE8X/tLgWPUcWEYu8pTH6j5SGJEylNetHy2c1/BB9Sd3uMzzNnIFz707/koA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l77S0qbhJV8dQDHQ/C/8iB1L5sRI9b3VSSnFWlHws0=;
 b=MZABOlaeHbQYjc9jw4l7A1iDivm7SkWI0k7YDVApXnOEDpHtgoHWfFujJ13v8eygPTsZLXwMBq9o8glmuts5mKRicpeqeePidFr2biAviUcr41YBgqYTEzDsvEllV+JU+gy0cFq4lE2VV0zcb1kHw9gZ7ycs4XIUnhtOX9ZcgTI=
Received: from DM5PR22CA0001.namprd22.prod.outlook.com (2603:10b6:3:101::11)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 15:08:31 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::2c) by DM5PR22CA0001.outlook.office365.com
 (2603:10b6:3:101::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 8 Jun 2021 15:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 15:08:30 +0000
Received: from grasider-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 8 Jun 2021
 10:08:29 -0500
From: Graham Sider <Graham.Sider@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 8/9] drm/amd/pm: Add renoir throttler translation
Date: Tue, 8 Jun 2021 11:08:09 -0400
Message-ID: <20210608150810.9679-8-Graham.Sider@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608150810.9679-1-Graham.Sider@amd.com>
References: <20210608150810.9679-1-Graham.Sider@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee7e914b-89fa-472e-5767-08d92a8f46e3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4565:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45659F5DEA1BE70DE069853E8A379@MN2PR12MB4565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wn5l0aZQY1lecIWAWp/tkEeKWjlcBPiWUsSp37a3iP6NzgrAuYre8EDamcDJjY5AWR8GoXwMoVdIwYiSnJ6PQLi/7B/zUFB3xhR8xUHnv3H4vsdOjk3vfGQkZYo+8pLNMlEsi0x8A8q/dmEKKh5o9Fugac0eWvtqLpGncX08vdwIm1y1EEDqjkRaR+jOG7ewx3rGXe1UKDWd0WL4iQS01n25Oyf9bnqyiQrnxLqNFd4hUivBqGF1BeDcVRuD3R7UfUAeC8u4lUyjdN+kSRm54YPzcJ57Dpk7k+93nF73l2nPfwRurr/mJnfyBXV9YfNAVWkeB09tcYTzYFdDGuSyhvrIcaz2+3Nefnbr76JqHjJftVLuKzh/tvTTvvmUwKZZdHOdb5h6XDRbenrR+WQS5k9CaNN12pMuSsWxOVtf0qZc6QwAciLa14X9LIOFH9N30cIuA9wMjzqXiPS1rnDh06ATSBio3nSMpjjJTlBIGiDoe3wYp+1MT/bRZHTT2YdjZZyC7B83VxZ7QTkoNrmPOLHmD5KnOQ9iOn4mmj2omINwuA6MrS7wI3WiNvXO76e0j51QPn3mwEcXhLtypPHHVi2IIGJivZKQA9+Ql6b/14PKIr4NwHx9k8Vf66OfS9jFODlCZh1iZtcju7q/d5+UbtpH5IeOWidZs8OmUQQRAwOWrYYuy+0HOapDekN3Cvb8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(2906002)(86362001)(54906003)(36860700001)(5660300002)(4326008)(47076005)(7696005)(6916009)(8676002)(2616005)(336012)(83380400001)(426003)(16526019)(8936002)(82740400003)(316002)(6666004)(26005)(36756003)(70586007)(356005)(478600001)(82310400003)(70206006)(186003)(1076003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 15:08:30.6700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7e914b-89fa-472e-5767-08d92a8f46e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
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
Cc: Harish.Kasiviswanathan@amd.com, Graham
 Sider <Graham.Sider@amd.com>, Elena.Sakhnovitch@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Perform dependent to independent throttle status translation
for renoir.

Signed-off-by: Graham Sider <Graham.Sider@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index 1c399c4ab4dc..ccfcfcf18e4d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -128,6 +128,22 @@ static struct cmn2asic_mapping renoir_workload_map[PP_SMC_POWER_PROFILE_COUNT] =
 	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,		WORKLOAD_PPLIB_CUSTOM_BIT),
 };
 
+static const uint8_t renoir_throttler_map[] = {
+	[THROTTLER_STATUS_BIT_SPL]		= (SMU_THROTTLER_SPL_BIT),
+	[THROTTLER_STATUS_BIT_FPPT]		= (SMU_THROTTLER_FPPT_BIT),
+	[THROTTLER_STATUS_BIT_SPPT]		= (SMU_THROTTLER_SPPT_BIT),
+	[THROTTLER_STATUS_BIT_SPPT_APU]		= (SMU_THROTTLER_SPPT_APU_BIT),
+	[THROTTLER_STATUS_BIT_THM_CORE]		= (SMU_THROTTLER_TEMP_CORE_BIT),
+	[THROTTLER_STATUS_BIT_THM_GFX]		= (SMU_THROTTLER_TEMP_GPU_BIT),
+	[THROTTLER_STATUS_BIT_THM_SOC]		= (SMU_THROTTLER_TEMP_SOC_BIT),
+	[THROTTLER_STATUS_BIT_TDC_VDD]		= (SMU_THROTTLER_TDC_VDD_BIT),
+	[THROTTLER_STATUS_BIT_TDC_SOC]		= (SMU_THROTTLER_TDC_SOC_BIT),
+	[THROTTLER_STATUS_BIT_PROCHOT_CPU]	= (SMU_THROTTLER_PROCHOT_CPU_BIT),
+	[THROTTLER_STATUS_BIT_PROCHOT_GFX]	= (SMU_THROTTLER_PROCHOT_GFX_BIT),
+	[THROTTLER_STATUS_BIT_EDC_CPU]		= (SMU_THROTTLER_EDC_CPU_BIT),
+	[THROTTLER_STATUS_BIT_EDC_GFX]		= (SMU_THROTTLER_EDC_GFX_BIT),
+};
+
 static int renoir_init_smc_tables(struct smu_context *smu)
 {
 	struct smu_table_context *smu_table = &smu->smu_table;
@@ -153,7 +169,7 @@ static int renoir_init_smc_tables(struct smu_context *smu)
 	if (!smu_table->watermarks_table)
 		goto err2_out;
 
-	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_1);
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_2);
 	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
 	if (!smu_table->gpu_metrics_table)
 		goto err3_out;
@@ -1264,8 +1280,8 @@ static ssize_t renoir_get_gpu_metrics(struct smu_context *smu,
 				      void **table)
 {
 	struct smu_table_context *smu_table = &smu->smu_table;
-	struct gpu_metrics_v2_1 *gpu_metrics =
-		(struct gpu_metrics_v2_1 *)smu_table->gpu_metrics_table;
+	struct gpu_metrics_v2_2 *gpu_metrics =
+		(struct gpu_metrics_v2_2 *)smu_table->gpu_metrics_table;
 	SmuMetrics_t metrics;
 	int ret = 0;
 
@@ -1273,7 +1289,7 @@ static ssize_t renoir_get_gpu_metrics(struct smu_context *smu,
 	if (ret)
 		return ret;
 
-	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 1);
+	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 2);
 
 	gpu_metrics->temperature_gfx = metrics.GfxTemperature;
 	gpu_metrics->temperature_soc = metrics.SocTemperature;
@@ -1311,6 +1327,9 @@ static ssize_t renoir_get_gpu_metrics(struct smu_context *smu,
 	gpu_metrics->current_l3clk[1] = metrics.L3Frequency[1];
 
 	gpu_metrics->throttle_status = metrics.ThrottlerStatus;
+	gpu_metrics->indep_throttle_status =
+		smu_cmn_get_indep_throttler_status(metrics.ThrottlerStatus,
+						   renoir_throttler_map);
 
 	gpu_metrics->fan_pwm = metrics.FanPwm;
 
@@ -1318,7 +1337,7 @@ static ssize_t renoir_get_gpu_metrics(struct smu_context *smu,
 
 	*table = (void *)gpu_metrics;
 
-	return sizeof(struct gpu_metrics_v2_1);
+	return sizeof(struct gpu_metrics_v2_2);
 }
 
 static int renoir_gfx_state_change_set(struct smu_context *smu, uint32_t state)
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
