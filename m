Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM6WEbuNn2nYcgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 01:03:07 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E319F437
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 01:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165FC10E845;
	Thu, 26 Feb 2026 00:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RJdAvGx6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011031.outbound.protection.outlook.com
 [40.93.194.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848D310E845
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 00:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mekPubCpKsimi3YkdHmM8/JxGB34VhpvbLExYxHzXbg8hmgxHMjCa0hv2ScAAP1BNgVVQS3mk8p4LGhXNhAfW8m0+jiF6J3gCc+nOkcMqHsjnGtuKsNUCk6PTY09HTMT+mP8Fo9RnFePPa4Ao9bYg7loeMJDm6Sy2P+WUQUGzzmoe90OApmUQl9va7DuR/eT1cYABHpc7BYX3KsVpY6cspXc3O7QsWuZBvRFoTAO0Dc/27Q7eH0oVelqvKXlKla/a48Eq1DY1wR1SVso7gzrIh6TplO3o3VdKrMIzglC1md+DhRTkaiNLmdymRpNBZ4FC5M5+eHSG3Uj0loVbYZbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK8xEGdE2bABcCSfnkKTOZZ9XVcEUuX1kfM4+VDPGF4=;
 b=wg2kYaDwPX90sc1ZKoqYhqLYAPl1qkVDmHT4Fcu+979mb8YAgJpvf/tSRs4B9Q9Vl4Hpf7BXJBHVeM722eShELY4nFcrj1C+9V58lbYKtT+kzovHer8dyzp8yn6qqUI/7+9hafRx5kETQu5XpQnCeIZxgenktxDB/Vt+C943FwdSCcdQp/6pihfnYbRd4wpegqTxQ6Z58ykhTwBe7lCDN16VEL8TRU6oXZ1VB1hTe1DQGkb2y52fY0WrdLfICeUjAz/fzPH68i7su6LAmkjApOeG8Yb85m2M4L5dhbEunvLgp3NoEQ5tnfpckzfWplkACOp4o5HxH6G4DjDIGT3A0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK8xEGdE2bABcCSfnkKTOZZ9XVcEUuX1kfM4+VDPGF4=;
 b=RJdAvGx6b+A10jj79Uhv+OVuEIFSJXgltwBb3gJi0a05cMCVX+ggfiSDZDJ/GIwhPHJIT3ZfYeMYnRTSdwW57sjsVSwnaPL3swKa3AabE7DHQmamZTacTPZAMaVN3hXy6hMywq/5jcHHoQgTvwv07Tml40A6TFxsMXlGwuaM72E=
Received: from DS7PR05CA0028.namprd05.prod.outlook.com (2603:10b6:5:3b9::33)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 00:03:01 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::1c) by DS7PR05CA0028.outlook.office365.com
 (2603:10b6:5:3b9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 00:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 00:03:01 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 18:02:59 -0600
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 7/8] drm/amd/display: Prevent integer overflow when mhz to khz
Date: Wed, 25 Feb 2026 16:57:46 -0700
Message-ID: <20260226000048.68030-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226000048.68030-1-alex.hung@amd.com>
References: <20260226000048.68030-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b14241-b127-4f43-3a98-08de74ca6828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: gcD0i/A/LoSOvAjtlvRGk3B+h2yb9EuoCyc8b0f6zhXig2HPxElI9W/HkWEZx+UQraQJd0oXmIExREbwhbNrt5AdJxYjqpXFva9wptkNYmfAO150rce7tCgVTyOpflnKHkDmts1jcdT+mEF4+nUcqi0YqLncZ0HwJK8S9OPdTl9gb23bQXJMjREfw4SFEZ1mLglVEUmPpMeV5LyAamLuyh8HyzVI2HNPJe5hf6cR8FIWC18AMzFvxC+TTagfzM5dQFLQvMTvJSjZmRkvSZpYpA8UBNOTBIVrfFq18uX5SNxZC/3FtFFx4Cd5XiLDYVvXsh1dZvcyQMU3mM2qygQ+EjOBQVYG1CggLqERlnrZ85sOYxGBK+5phoG83D4RBZh11jqMXN+zGFYzgb/E8KhUuYmi9oO0qs9qHSmmMNB8mYvqpjud5bC5i8ax+GrYLkbGjXptm1879SOQ0NWXc0M0vbxuIVZGb8W5lb1py1pbhxrMMh+yM0V3q3KLP4J3lhUM0hhYN5x52DOUvEzLUZx8lMmPgJj1iBb6EEoWZ34IkKquF3A/gEtaJATBptKYlArRFMMPus38zP6YpGfifUn5OLLuw4TlgkhJATQ1KlwWizKKWfc0w2V6IB/qLn22H0ydL1boGszxXWlxivfzC1c9oL83FFfV7CNL3Lp5P0XvuyReLyPS/0x2LHa8GTJ7m0/qNMYUC5OEmVbkkzHPbz+bGEHKOMJXBUPjF84O8OB8sqaawaNI+yutGfWZvk7zRHIeaBrZlBnuiKP5R5FtcAyccb6H1SeQlf1NAMrdvUjC78ZyO72aiO34dQ4ajYesyohDDHI644ScDviLIlGt1n5MZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZjMYVX4JZAtDjL2/DtSdtFoRd3gBg/qY+U5c41HeiUbKxtryZMEdEQRViZ50Xdp0Rg2jAjfV7gs+Q/U2CT4kh//sqqjFWLwxS/lKn8elUEs/nwncVhwYO13VG7Cf506Ypw2EqIZsZCcPw+zM0D50URbfReBLOfOvjxmQLF2cvZFuzhzi29BfdPUQLEKIrMdGrmqJ8+HwechUmM6tToynLNpJxzbKoeA0EYh6sS/K/AD5x+/acLS0zG7OurII3RsCORGv5ztbS2UYEtSHRcx+oF2P2rF1ZthB+uEKmSeC6VLe2xjrB+GZsRvVRahYdpIfcu5aP330TOxZ/mem3NxkPjIf3juA9QgvV9oa73rH0FhZodHcN4Zn+YwCNWT1oahAwCmC6lB814IMxXJz6gJez+UW+ZCwPChh9ooXzOWtdnrVHITXzxhc8OI9h1rI0mPV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:03:01.2019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b14241-b127-4f43-3a98-08de74ca6828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: A08E319F437
X-Rspamd-Action: no action

[WHAT]
Cast to long long before multiplication to prevent overflow
when converting mhz to khz by multiplying by 1000.

This is reported as INTEGER_OVERFLOW errors by Coverity.

Reviewed-by: Roman Li <roman.li@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   | 14 +++++++-------
 .../drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c   | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
index 604d256cb47a..9d8f81c3d3f0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
@@ -204,7 +204,7 @@ int dcn35_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispcl
 			khz_to_mhz_ceil(requested_dispclk_khz));
 
 	smu_print("requested_dispclk_khz = %d, actual_dispclk_set_mhz: %d\n", requested_dispclk_khz, actual_dispclk_set_mhz);
-	return actual_dispclk_set_mhz * 1000;
+	return (int)((long long)actual_dispclk_set_mhz * 1000);
 }
 
 int dcn35_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
@@ -221,7 +221,7 @@ int dcn35_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
 
 	/* TODO: add code for programing DP DTO, currently this is down by command table */
 
-	return actual_dprefclk_set_mhz * 1000;
+	return (int)((long long)actual_dprefclk_set_mhz * 1000);
 }
 
 int dcn35_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
@@ -238,7 +238,7 @@ int dcn35_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requeste
 
 	smu_print("requested_dcfclk_khz = %d, actual_dcfclk_set_mhz: %d\n", requested_dcfclk_khz, actual_dcfclk_set_mhz);
 
-	return actual_dcfclk_set_mhz * 1000;
+	return (int)((long long)actual_dcfclk_set_mhz * 1000);
 }
 
 int dcn35_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
@@ -255,7 +255,7 @@ int dcn35_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int re
 
 	smu_print("requested_min_ds_dcfclk_khz = %d, actual_min_ds_dcfclk_mhz: %d\n", requested_min_ds_dcfclk_khz, actual_min_ds_dcfclk_mhz);
 
-	return actual_min_ds_dcfclk_mhz * 1000;
+	return (int)((long long)actual_min_ds_dcfclk_mhz * 1000);
 }
 
 int dcn35_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
@@ -272,7 +272,7 @@ int dcn35_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz
 
 	smu_print("requested_dpp_khz = %d, actual_dppclk_set_mhz: %d\n", requested_dpp_khz, actual_dppclk_set_mhz);
 
-	return actual_dppclk_set_mhz * 1000;
+	return (int)((long long)actual_dppclk_set_mhz * 1000);
 }
 
 void dcn35_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
@@ -424,7 +424,7 @@ int dcn35_smu_get_dprefclk(struct clk_mgr_internal *clk_mgr)
 						 0);
 
 	smu_print("%s:  SMU DPREF clk  = %d mhz\n",  __func__, dprefclk);
-	return dprefclk * 1000;
+	return (int)((long long)dprefclk * 1000);
 }
 
 int dcn35_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr)
@@ -439,7 +439,7 @@ int dcn35_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr)
 					       0);
 
 	smu_print("%s: get_dtbclk  = %dmhz\n", __func__, dtbclk);
-	return dtbclk * 1000;
+	return (int)((long long)dtbclk * 1000);
 }
 /* Arg = 1: Turn DTB on; 0: Turn DTB CLK OFF. when it is on, it is 600MHZ */
 void dcn35_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c
index d3cc624cd758..c791bb1edb47 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c
@@ -193,7 +193,7 @@ int dcn42_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispcl
 
 	smu_print("requested_dispclk_khz = %d, actual_dispclk_set_mhz: %d\n",
 		requested_dispclk_khz, actual_dispclk_set_mhz);
-	return actual_dispclk_set_mhz * 1000;
+	return (int)((long long)actual_dispclk_set_mhz * 1000);
 }
 
 
@@ -212,7 +212,7 @@ int dcn42_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requeste
 	smu_print("requested_dcfclk_khz = %d, actual_dcfclk_set_mhz: %d\n",
 		requested_dcfclk_khz, actual_dcfclk_set_mhz);
 
-	return actual_dcfclk_set_mhz * 1000;
+	return (int)((long long)actual_dcfclk_set_mhz * 1000);
 }
 
 int dcn42_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
@@ -230,7 +230,7 @@ int dcn42_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int re
 	smu_print("requested_min_ds_dcfclk_khz = %d, actual_min_ds_dcfclk_mhz: %d\n",
 		requested_min_ds_dcfclk_khz, actual_min_ds_dcfclk_mhz);
 
-	return actual_min_ds_dcfclk_mhz * 1000;
+	return (int)((long long)actual_min_ds_dcfclk_mhz * 1000);
 }
 
 int dcn42_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
@@ -248,7 +248,7 @@ int dcn42_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz
 	smu_print("requested_dpp_khz = %d, actual_dppclk_set_mhz: %d\n",
 		requested_dpp_khz, actual_dppclk_set_mhz);
 
-	return actual_dppclk_set_mhz * 1000;
+	return (int)((long long)actual_dppclk_set_mhz * 1000);
 }
 
 void dcn42_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
@@ -399,7 +399,7 @@ int dcn42_smu_get_dprefclk(struct clk_mgr_internal *clk_mgr)
 						 0);
 
 	smu_print("%s:  SMU DPREF clk  = %d mhz\n",  __func__, dprefclk);
-	return dprefclk * 1000;
+	return (int)((long long)dprefclk * 1000);
 }
 
 int dcn42_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr)
@@ -414,7 +414,7 @@ int dcn42_smu_get_dtbclk(struct clk_mgr_internal *clk_mgr)
 					       0);
 
 	smu_print("%s: get_dtbclk  = %dmhz\n", __func__, dtbclk);
-	return dtbclk * 1000;
+	return (int)((long long)dtbclk * 1000);
 }
 /* Arg = 1: Turn DTB on; 0: Turn DTB CLK OFF. when it is on, it is 600MHZ */
 void dcn42_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable)
-- 
2.43.0

