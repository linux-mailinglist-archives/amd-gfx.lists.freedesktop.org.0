Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342492D965
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2024 21:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3210E8BC;
	Wed, 10 Jul 2024 19:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mZtotNrU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824A10E8BC
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2024 19:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwEJI4wgJmB6iXCmpHteG0bRO8wYG+eepEFkAsomZTnqGrT3ZrGc12OHs24PUZ6wily4/7grizhVCR3zn3muJtZQm9XuRTVDk13E587f3IGgtgxsaIZW01lsJTJKqnI3E7AQPVTESDgQTlTrDyckAfpr4lHXKdQDp6Auc/Wd/bz4qRIftxBes186BSQVXxpN4dT31Nmye97dSEC6lLT4pJBJ13fILJ2EqcgQtRDkquN7Msnv3w63k1Id3p2n8mjpMhUWrf5y4tuCsrsloyZ3C2yI6tjvhwgln/3DSM0f8mIq9r7YKMX0txTdPOmb8M6CnufJ64G5JAuPEG1zPXabxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2ttthidtLo4k00MdsnLmdjSaggssjZyKVl/vG3CT0E=;
 b=XKnH9K7xkZMEdestZLXLnPubkGV9oyeOe8MDQdxCkjJd/gkNC+AUAmEFvYsZrUOiz7ju2ygEzMPLSzFmkLkYr/QFMBcj8tkP9XBiYIib0xzB1KmPtlKz6PGgoWkdkVm8ztOryJvvzS/5Z4R/P7KOJwkZGaEcIHIsZcFlQ1RAiiMnpgGXB+41L/XjgIVEj6Pn+ZR7AzhU98Lymda0hUhuGWAxL7wdfYTXm1LdBrlkj3JX+44B8hn3XzcZWRMdNyolLakdnQEpsz1EsRUHhI3+KXl6Bh2DrKFMc18i+h+AdqO84HuF9/0jyssWeYWOzwx2mbfe7zamuochiFFsZTVu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2ttthidtLo4k00MdsnLmdjSaggssjZyKVl/vG3CT0E=;
 b=mZtotNrUiI9iInf8kyfpzJI+Soqemq0zNaw0LuN7K5cUyy6oMeu1/8mH2UZ+mQaX0U0TIpR8Q1IS2szkjheDYAa9+Q9gzFTCLrEiDkU3XoeMSiJkwWIl8sXU57Bz0udM9MmzntAcAsAay+sFeNzYlSDgDsWpq5gkz9sSChcjkM4=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Wed, 10 Jul
 2024 19:39:41 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::cf) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21 via Frontend
 Transport; Wed, 10 Jul 2024 19:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 19:39:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 14:39:38 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 14:39:38 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Samson Tam <samson.tam@amd.com>, Relja Vojvodic
 <relja.vojvodic@amd.com>
Subject: [PATCH 33/50] drm/amd/display: remove dc dependencies from SPL library
Date: Wed, 10 Jul 2024 15:36:50 -0400
Message-ID: <20240710193707.43754-34-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710193707.43754-1-Jerry.Zuo@amd.com>
References: <20240710193707.43754-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: fdad7229-897f-4bad-f13a-08dca1180a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUg2ZDVpcWJNOHZMWGVLa0xsZlNxaFo5YzRma3ROaER2VUlrNzZEd3Y3WGFu?=
 =?utf-8?B?eUhEZDE3dzEvUytlSXRUVHNqQ3dSVk54WlVYeGgvRmtXWUt0N1V6aThrUFdU?=
 =?utf-8?B?K1Jjd3p3aVNRdmUxUFM1bHRKUjgrRmZ3ZTNRaFdlN2JUVHVlclJYbGllWVMw?=
 =?utf-8?B?VEh5aWZmMG5iRWdKS0tQVDV3ZGxzREYyTUorOVppYUFwbXJsSlZ0QU1LUmND?=
 =?utf-8?B?cnRJamV4UWl1dXdrVmJoeTE0QUtjNmY0VTRMeTk1VUVjYmJqbmFXdGNFQUM3?=
 =?utf-8?B?YWtmVCs1SXhDVjVFd3RyaEVEc1RVSjJVZ0FDWGJCM1UzN2VWQWpmT0xacGta?=
 =?utf-8?B?dStmSHcyQ0FKRWVTNHpvbmwvWExibWxYaUJIOHIvVUQvQlhMa1Z6bVYrQVZq?=
 =?utf-8?B?OGduNGhlaFJWWDJ4QWIrTEdqdkR1SmU1d3VzQm8zMFlrZVMvam4xT3dJdlBn?=
 =?utf-8?B?dDZQdS90QktZWDBWdlQ4dzlDOXBvNitJNHJvbnE1b2FWN0wrZlppQlRveWR2?=
 =?utf-8?B?REJkbE9VdVl6bUM0aE9zd3dwWWlaRjEyMmZWRktVYkNSdjArMDdIc0xOMGxq?=
 =?utf-8?B?Q3dUQkZoR1htSjZ2bU1wc0ZzZWxGaS9wVm5WTzJIT0NTSWJKSGF3RDhaVWN4?=
 =?utf-8?B?dEsva0dpZXAybmYzWmExdVZVSytNMUxOdmUvK1g5ZE5LUzZtWm1iNGQwOCtm?=
 =?utf-8?B?enF4SklxbURRaGNUQ1R2Qy9HL01EWGN3RHdZWXlvUUpURkJqdTNkaDlIVEZJ?=
 =?utf-8?B?b0I1SVVJWTlJYUVNUDV5akJsYUlJakFTVUhZUmlJMmJ6UUtRQm5NUXYreW5i?=
 =?utf-8?B?Nm5Eak1VSHZPTWNNMVZ0MS9NSC9OMnlZWjNyMk4xc0ltQkVvT2ZDVTkvL2FI?=
 =?utf-8?B?Y01HK1pjZVd6SC9iVGV2bmN6UlJkSlNGZE96bVpXUmhZQTdDUy9QRFF1QVNI?=
 =?utf-8?B?SEdnSzdsazkwM1pMK2lEcUt4RkdsMTJWQWI3S1haREFlbnp1dnVrYTFMWk1k?=
 =?utf-8?B?ak5SekpBcFo2ZHNVWk1MY1BpRDV5anM2RU9hMFJDWk1iTzNBU3VDNkZDUzky?=
 =?utf-8?B?TkVxYld0Vk5zQXJ6T1hPc1Qwb3BEbW0wMTFoSkxoNWhWYnJWTzdNTEFXaWVa?=
 =?utf-8?B?Skg5Qi9veHY0RFNCVzdnN0ZCemFlQTRBTWJNTE5HaGJsZDhaQytXQVZBd0ti?=
 =?utf-8?B?MFdhNmdqaG5HbHVLV3JvM0RCdDNTTStBRjZhT2NXdFIxN3JWM1dLTFFyZHBN?=
 =?utf-8?B?MUo3VVp0bE9XSjBvdWVoRnJBRy9VS3l6SDVtR3dDeCtCOE1QMFdJa3dZZmZC?=
 =?utf-8?B?SDJaZk5PT2dzQ2s5VUliNitNTzd2NE9ONWtFcG9YY252Um12NlZxLzV2ZXRN?=
 =?utf-8?B?LzlSdG9LWmtSOE1ud0piM084RXpoditHZ1o3b1h2TEs4eElPQlJ2QktkVmg2?=
 =?utf-8?B?ZTlmUnNSaVYzNWl0ZXRmUElvNlZrWm95V2VqM290WWtPbGs3c1FXSnBjN21Q?=
 =?utf-8?B?VnZZTlZmM3VLUlJqRW5aaWNNVURnT3FCODMrMWQ3Z1AzbzlDZnQ3a1VuVXg5?=
 =?utf-8?B?bHRRbXBReFNVM3pRc09SaVBIbXZnZHFxOXpOUndRZVZ1b2dDMEZSd1liWksr?=
 =?utf-8?B?bVpZcnBlZy9DNjhBMVZlaXpEQyt3VTJsZGhUNExRYlNua1EzLzh1REQrNGFC?=
 =?utf-8?B?WGd3SlUxTVdNL0RBc1pQTnJxQVNBa2RUeDU2bEo5K3hFNnBkblhtbDR5bWNT?=
 =?utf-8?B?K0xubktydlNFcHlCSFc1VVh2SkJPSEFQY0Via0pFUEVwYThtNW5GZkpJSHBT?=
 =?utf-8?B?Q0xCUTc5Ry9SaVZvNFFxT1ozMUZMQVRETmZhUHNvSERhR0NJcVBFSUR3L1lj?=
 =?utf-8?B?NTFLRmlzOWhHM1l4UjVVRzhWeHphZ2VZdmU1REc1cjRpUDcrbGhzMnlMZzlB?=
 =?utf-8?Q?jXdqpT3E5eNsLAgRUuxTTIOBSosGNp3c?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 19:39:40.7433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdad7229-897f-4bad-f13a-08dca1180a9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210
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

From: Samson Tam <samson.tam@amd.com>

[Why]
Make SPL library dc-independent so it can be reused by other
 components

[How]
Create separate set of fixed31_32 calls in SPL
Make all inputs and outputs to SPL use primitive types
For ratios and inits, return as uint32 from SPL.  So
 add conversion from uint32 back to fixed point in
 SPL-to-dc translate function

Reviewed-by: Relja Vojvodic <relja.vojvodic@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Samson Tam <samson.tam@amd.com>
---
 .../drm/amd/display/dc/basics/fixpt31_32.c    |  27 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   2 -
 .../gpu/drm/amd/display/dc/dc_spl_translate.c |  43 +-
 drivers/gpu/drm/amd/display/dc/spl/Makefile   |   2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   | 566 +++++++++---------
 .../display/dc/spl/dc_spl_isharp_filters.c    |  27 +-
 .../display/dc/spl/dc_spl_isharp_filters.h    |   2 +-
 .../display/dc/spl/dc_spl_scl_easf_filters.c  |  81 +--
 .../display/dc/spl/dc_spl_scl_easf_filters.h  |  32 +-
 .../amd/display/dc/spl/dc_spl_scl_filters.c   |  69 +--
 .../amd/display/dc/spl/dc_spl_scl_filters.h   |  18 +-
 .../gpu/drm/amd/display/dc/spl/dc_spl_types.h |  39 +-
 .../gpu/drm/amd/display/dc/spl/spl_debug.h    |  23 +
 .../drm/amd/display/dc/spl/spl_fixpt31_32.c   | 518 ++++++++++++++++
 .../drm/amd/display/dc/spl/spl_fixpt31_32.h   | 546 +++++++++++++++++
 .../gpu/drm/amd/display/dc/spl/spl_os_types.h |  77 +++
 .../gpu/drm/amd/display/include/fixed31_32.h  |   6 +
 17 files changed, 1646 insertions(+), 432 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 506f82cd5cc6..88d3f9d7dd55 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -486,3 +486,30 @@ int dc_fixpt_s4d19(struct fixed31_32 arg)
 	else
 		return ux_dy(arg.value, 4, 19);
 }
+
+struct fixed31_32 dc_fixpt_from_ux_dy(unsigned int value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct fixed31_32 fixpt_value = dc_fixpt_zero;
+	struct fixed31_32 fixpt_int_value = dc_fixpt_zero;
+	long long frac_mask = ((long long)1 << (long long)integer_bits) - 1;
+
+	fixpt_value.value = (long long)value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	frac_mask = frac_mask << fractional_bits;
+	fixpt_int_value.value = value & frac_mask;
+	fixpt_int_value.value <<= (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	fixpt_value.value |= fixpt_int_value.value;
+	return fixpt_value;
+}
+
+struct fixed31_32 dc_fixpt_from_int_dy(unsigned int int_value,
+	unsigned int frac_value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct fixed31_32 fixpt_value = dc_fixpt_from_int(int_value);
+
+	fixpt_value.value |= (long long)frac_value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	return fixpt_value;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4f5b23520365..5c9091f2a8b2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1511,8 +1511,6 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
 
 		pipe_ctx->plane_res.scl_data.lb_params.alpha_en = plane_state->per_pixel_alpha;
-		spl_out->scl_data.h_active = pipe_ctx->plane_res.scl_data.h_active;
-		spl_out->scl_data.v_active = pipe_ctx->plane_res.scl_data.v_active;
 
 		// Convert pipe_ctx to respective input params for SPL
 		translate_SPL_in_params_from_pipe_ctx(pipe_ctx, spl_in);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
index 49ff59258c8d..339d092e711c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
@@ -42,26 +42,26 @@ static void populate_spltaps_from_taps(struct spl_taps *spl_scaling_quality,
 static void populate_taps_from_spltaps(struct scaling_taps *scaling_quality,
 		const struct spl_taps *spl_scaling_quality)
 {
-	scaling_quality->h_taps_c = spl_scaling_quality->h_taps_c;
-	scaling_quality->h_taps = spl_scaling_quality->h_taps;
-	scaling_quality->v_taps_c = spl_scaling_quality->v_taps_c;
-	scaling_quality->v_taps = spl_scaling_quality->v_taps;
+	scaling_quality->h_taps_c = spl_scaling_quality->h_taps_c + 1;
+	scaling_quality->h_taps = spl_scaling_quality->h_taps + 1;
+	scaling_quality->v_taps_c = spl_scaling_quality->v_taps_c + 1;
+	scaling_quality->v_taps = spl_scaling_quality->v_taps + 1;
 }
 static void populate_ratios_from_splratios(struct scaling_ratios *ratios,
-		const struct spl_ratios *spl_ratios)
+		const struct ratio *spl_ratios)
 {
-	ratios->horz = spl_ratios->horz;
-	ratios->vert = spl_ratios->vert;
-	ratios->horz_c = spl_ratios->horz_c;
-	ratios->vert_c = spl_ratios->vert_c;
+	ratios->horz = dc_fixpt_from_ux_dy(spl_ratios->h_scale_ratio >> 5, 3, 19);
+	ratios->vert = dc_fixpt_from_ux_dy(spl_ratios->v_scale_ratio >> 5, 3, 19);
+	ratios->horz_c = dc_fixpt_from_ux_dy(spl_ratios->h_scale_ratio_c >> 5, 3, 19);
+	ratios->vert_c = dc_fixpt_from_ux_dy(spl_ratios->v_scale_ratio_c >> 5, 3, 19);
 }
 static void populate_inits_from_splinits(struct scl_inits *inits,
-		const struct spl_inits *spl_inits)
+		const struct init *spl_inits)
 {
-	inits->h = spl_inits->h;
-	inits->v = spl_inits->v;
-	inits->h_c = spl_inits->h_c;
-	inits->v_c = spl_inits->v_c;
+	inits->h = dc_fixpt_from_int_dy(spl_inits->h_filter_init_int, spl_inits->h_filter_init_frac >> 5, 0, 19);
+	inits->v = dc_fixpt_from_int_dy(spl_inits->v_filter_init_int, spl_inits->v_filter_init_frac >> 5, 0, 19);
+	inits->h_c = dc_fixpt_from_int_dy(spl_inits->h_filter_init_int_c, spl_inits->h_filter_init_frac_c >> 5, 0, 19);
+	inits->v_c = dc_fixpt_from_int_dy(spl_inits->v_filter_init_int_c, spl_inits->v_filter_init_frac_c >> 5, 0, 19);
 }
 /// @brief Translate SPL input parameters from pipe context
 /// @param pipe_ctx
@@ -170,6 +170,9 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 	/* Translate transfer function */
 	spl_in->basic_in.tf_type = (enum spl_transfer_func_type) plane_state->in_transfer_func.type;
 	spl_in->basic_in.tf_predefined_type = (enum spl_transfer_func_predefined) plane_state->in_transfer_func.tf;
+
+	spl_in->h_active = pipe_ctx->plane_res.scl_data.h_active;
+	spl_in->v_active = pipe_ctx->plane_res.scl_data.v_active;
 	/* Check if it is stream is in fullscreen and if its HDR.
 	 * Use this to determine sharpness levels
 	 */
@@ -184,15 +187,15 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 void translate_SPL_out_params_to_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl_out *spl_out)
 {
 	// Make scaler data recout point to spl output field recout
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.recout, &spl_out->scl_data.recout);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.recout, &spl_out->dscl_prog_data->recout);
 	// Make scaler data ratios point to spl output field ratios
-	populate_ratios_from_splratios(&pipe_ctx->plane_res.scl_data.ratios, &spl_out->scl_data.ratios);
+	populate_ratios_from_splratios(&pipe_ctx->plane_res.scl_data.ratios, &spl_out->dscl_prog_data->ratios);
 	// Make scaler data viewport point to spl output field viewport
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport, &spl_out->scl_data.viewport);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport, &spl_out->dscl_prog_data->viewport);
 	// Make scaler data viewport_c point to spl output field viewport_c
-	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport_c, &spl_out->scl_data.viewport_c);
+	populate_rect_from_splrect(&pipe_ctx->plane_res.scl_data.viewport_c, &spl_out->dscl_prog_data->viewport_c);
 	// Make scaler data taps point to spl output field scaling taps
-	populate_taps_from_spltaps(&pipe_ctx->plane_res.scl_data.taps, &spl_out->scl_data.taps);
+	populate_taps_from_spltaps(&pipe_ctx->plane_res.scl_data.taps, &spl_out->dscl_prog_data->taps);
 	// Make scaler data init point to spl output field init
-	populate_inits_from_splinits(&pipe_ctx->plane_res.scl_data.inits, &spl_out->scl_data.inits);
+	populate_inits_from_splinits(&pipe_ctx->plane_res.scl_data.inits, &spl_out->dscl_prog_data->init);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/spl/Makefile b/drivers/gpu/drm/amd/display/dc/spl/Makefile
index af7eaf839970..05764d4d4604 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/spl/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'spl' sub-component of DAL.
 # It provides the scaling library interface.
 
-SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_scl_easf_filters.o dc_spl_isharp_filters.o dc_spl_filters.o
+SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_scl_easf_filters.o dc_spl_isharp_filters.o dc_spl_filters.o spl_fixpt31_32.o
 
 AMD_DAL_SPL = $(addprefix $(AMDDALPATH)/dc/spl/,$(SPL))
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index d3d45aa7e08d..b8858ea7c776 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -4,10 +4,11 @@
 
 #include "dc_spl.h"
 #include "dc_spl_scl_filters.h"
-#include "dc_spl_isharp_filters.h"
 #include "dc_spl_scl_easf_filters.h"
+#include "dc_spl_isharp_filters.h"
+#include "spl_debug.h"
 
-#define IDENTITY_RATIO(ratio) (dc_fixpt_u2d19(ratio) == (1 << 19))
+#define IDENTITY_RATIO(ratio) (spl_fixpt_u2d19(ratio) == (1 << 19))
 #define MIN_VIEWPORT_SIZE 12
 
 static struct spl_rect intersect_rec(const struct spl_rect *r0, const struct spl_rect *r1)
@@ -108,26 +109,26 @@ static struct spl_rect calculate_plane_rec_in_timing_active(
 	const struct spl_rect *stream_src = &spl_in->basic_out.src_rect;
 	const struct spl_rect *stream_dst = &spl_in->basic_out.dst_rect;
 	struct spl_rect rec_out = {0};
-	struct fixed31_32 temp;
+	struct spl_fixed31_32 temp;
 
 
-	temp = dc_fixpt_from_fraction(rec_in->x * (long long)stream_dst->width,
+	temp = spl_fixpt_from_fraction(rec_in->x * (long long)stream_dst->width,
 			stream_src->width);
-	rec_out.x = stream_dst->x + dc_fixpt_round(temp);
+	rec_out.x = stream_dst->x + spl_fixpt_round(temp);
 
-	temp = dc_fixpt_from_fraction(
+	temp = spl_fixpt_from_fraction(
 			(rec_in->x + rec_in->width) * (long long)stream_dst->width,
 			stream_src->width);
-	rec_out.width = stream_dst->x + dc_fixpt_round(temp) - rec_out.x;
+	rec_out.width = stream_dst->x + spl_fixpt_round(temp) - rec_out.x;
 
-	temp = dc_fixpt_from_fraction(rec_in->y * (long long)stream_dst->height,
+	temp = spl_fixpt_from_fraction(rec_in->y * (long long)stream_dst->height,
 			stream_src->height);
-	rec_out.y = stream_dst->y + dc_fixpt_round(temp);
+	rec_out.y = stream_dst->y + spl_fixpt_round(temp);
 
-	temp = dc_fixpt_from_fraction(
+	temp = spl_fixpt_from_fraction(
 			(rec_in->y + rec_in->height) * (long long)stream_dst->height,
 			stream_src->height);
-	rec_out.height = stream_dst->y + dc_fixpt_round(temp) - rec_out.y;
+	rec_out.height = stream_dst->y + spl_fixpt_round(temp) - rec_out.y;
 
 	return rec_out;
 }
@@ -145,7 +146,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	mpc_rec.x = plane_clip_rec->x + mpc_rec.width * mpc_slice_idx;
 	mpc_rec.height = plane_clip_rec->height;
 	mpc_rec.y = plane_clip_rec->y;
-	ASSERT(mpc_slice_count == 1 ||
+	SPL_ASSERT(mpc_slice_count == 1 ||
 			spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE ||
 			mpc_rec.width % 2 == 0);
 
@@ -158,7 +159,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	}
 
 	if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM) {
-		ASSERT(mpc_rec.height % 2 == 0);
+		SPL_ASSERT(mpc_rec.height % 2 == 0);
 		mpc_rec.height /= 2;
 	}
 	return mpc_rec;
@@ -198,7 +199,7 @@ static struct spl_rect calculate_odm_slice_in_timing_active(struct spl_in *spl_i
 	return spl_in->basic_out.odm_slice_rect;
 }
 
-static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_recout(struct spl_in *spl_in, struct spl_scratch *spl_scratch, struct spl_out *spl_out)
 {
 	/*
 	 * A plane clip represents the desired plane size and position in Stream
@@ -341,21 +342,23 @@ static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
 		/* shift the overlapping area so it is with respect to current
 		 * ODM slice's position
 		 */
-		spl_out->scl_data.recout = shift_rec(
+		spl_scratch->scl_data.recout = shift_rec(
 				&overlapping_area,
 				-odm_slice.x, -odm_slice.y);
-		spl_out->scl_data.recout.height -=
+		spl_scratch->scl_data.recout.height -=
 			spl_in->debug.visual_confirm_base_offset;
-		spl_out->scl_data.recout.height -=
+		spl_scratch->scl_data.recout.height -=
 			spl_in->debug.visual_confirm_dpp_offset;
 	} else
 		/* if there is no overlap, zero recout */
-		memset(&spl_out->scl_data.recout, 0,
+		memset(&spl_scratch->scl_data.recout, 0,
 				sizeof(struct spl_rect));
 }
 
 /* Calculate scaling ratios */
-static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_scaling_ratios(struct spl_in *spl_in,
+		struct spl_scratch *spl_scratch,
+		struct spl_out *spl_out)
 {
 	const int in_w = spl_in->basic_out.src_rect.width;
 	const int in_h = spl_in->basic_out.src_rect.height;
@@ -366,72 +369,72 @@ static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *
 	/*Swap surf_src height and width since scaling ratios are in recout rotation*/
 	if (spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_90 ||
 		spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_270)
-		swap(surf_src.height, surf_src.width);
+		spl_swap(surf_src.height, surf_src.width);
 
-	spl_out->scl_data.ratios.horz = dc_fixpt_from_fraction(
+	spl_scratch->scl_data.ratios.horz = spl_fixpt_from_fraction(
 					surf_src.width,
 					spl_in->basic_in.dst_rect.width);
-	spl_out->scl_data.ratios.vert = dc_fixpt_from_fraction(
+	spl_scratch->scl_data.ratios.vert = spl_fixpt_from_fraction(
 					surf_src.height,
 					spl_in->basic_in.dst_rect.height);
 
 	if (spl_in->basic_out.view_format == SPL_VIEW_3D_SIDE_BY_SIDE)
-		spl_out->scl_data.ratios.horz.value *= 2;
+		spl_scratch->scl_data.ratios.horz.value *= 2;
 	else if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM)
-		spl_out->scl_data.ratios.vert.value *= 2;
+		spl_scratch->scl_data.ratios.vert.value *= 2;
 
-	spl_out->scl_data.ratios.vert.value = div64_s64(
-		spl_out->scl_data.ratios.vert.value * in_h, out_h);
-	spl_out->scl_data.ratios.horz.value = div64_s64(
-		spl_out->scl_data.ratios.horz.value * in_w, out_w);
+	spl_scratch->scl_data.ratios.vert.value = spl_div64_s64(
+		spl_scratch->scl_data.ratios.vert.value * in_h, out_h);
+	spl_scratch->scl_data.ratios.horz.value = spl_div64_s64(
+		spl_scratch->scl_data.ratios.horz.value * in_w, out_w);
 
-	spl_out->scl_data.ratios.horz_c = spl_out->scl_data.ratios.horz;
-	spl_out->scl_data.ratios.vert_c = spl_out->scl_data.ratios.vert;
+	spl_scratch->scl_data.ratios.horz_c = spl_scratch->scl_data.ratios.horz;
+	spl_scratch->scl_data.ratios.vert_c = spl_scratch->scl_data.ratios.vert;
 
 	if (spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8
 			|| spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP10) {
-		spl_out->scl_data.ratios.horz_c.value /= 2;
-		spl_out->scl_data.ratios.vert_c.value /= 2;
+		spl_scratch->scl_data.ratios.horz_c.value /= 2;
+		spl_scratch->scl_data.ratios.vert_c.value /= 2;
 	}
-	spl_out->scl_data.ratios.horz = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.horz, 19);
-	spl_out->scl_data.ratios.vert = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.vert, 19);
-	spl_out->scl_data.ratios.horz_c = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.horz_c, 19);
-	spl_out->scl_data.ratios.vert_c = dc_fixpt_truncate(
-			spl_out->scl_data.ratios.vert_c, 19);
+	spl_scratch->scl_data.ratios.horz = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.horz, 19);
+	spl_scratch->scl_data.ratios.vert = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.vert, 19);
+	spl_scratch->scl_data.ratios.horz_c = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.horz_c, 19);
+	spl_scratch->scl_data.ratios.vert_c = spl_fixpt_truncate(
+			spl_scratch->scl_data.ratios.vert_c, 19);
 
 	/*
 	 * Coefficient table and some registers are different based on ratio
 	 * that is output/input.  Currently we calculate input/output
 	 * Store 1/ratio in recip_ratio for those lookups
 	 */
-	spl_out->scl_data.recip_ratios.horz = dc_fixpt_recip(
-			spl_out->scl_data.ratios.horz);
-	spl_out->scl_data.recip_ratios.vert = dc_fixpt_recip(
-			spl_out->scl_data.ratios.vert);
-	spl_out->scl_data.recip_ratios.horz_c = dc_fixpt_recip(
-			spl_out->scl_data.ratios.horz_c);
-	spl_out->scl_data.recip_ratios.vert_c = dc_fixpt_recip(
-			spl_out->scl_data.ratios.vert_c);
+	spl_scratch->scl_data.recip_ratios.horz = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.horz);
+	spl_scratch->scl_data.recip_ratios.vert = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.vert);
+	spl_scratch->scl_data.recip_ratios.horz_c = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.horz_c);
+	spl_scratch->scl_data.recip_ratios.vert_c = spl_fixpt_recip(
+			spl_scratch->scl_data.ratios.vert_c);
 }
 
 /* Calculate Viewport size */
-static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
 {
-	spl_out->scl_data.viewport.width = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.horz,
-							spl_out->scl_data.recout.width));
-	spl_out->scl_data.viewport.height = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.vert,
-							spl_out->scl_data.recout.height));
-	spl_out->scl_data.viewport_c.width = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.horz_c,
-						spl_out->scl_data.recout.width));
-	spl_out->scl_data.viewport_c.height = dc_fixpt_ceil(dc_fixpt_mul_int(spl_out->scl_data.ratios.vert_c,
-						spl_out->scl_data.recout.height));
+	spl_scratch->scl_data.viewport.width = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.horz,
+							spl_scratch->scl_data.recout.width));
+	spl_scratch->scl_data.viewport.height = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.vert,
+							spl_scratch->scl_data.recout.height));
+	spl_scratch->scl_data.viewport_c.width = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.horz_c,
+						spl_scratch->scl_data.recout.width));
+	spl_scratch->scl_data.viewport_c.height = spl_fixpt_ceil(spl_fixpt_mul_int(spl_scratch->scl_data.ratios.vert_c,
+						spl_scratch->scl_data.recout.height));
 	if (spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_90 ||
 			spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_270) {
-		swap(spl_out->scl_data.viewport.width, spl_out->scl_data.viewport.height);
-		swap(spl_out->scl_data.viewport_c.width, spl_out->scl_data.viewport_c.height);
+		spl_swap(spl_scratch->scl_data.viewport.width, spl_scratch->scl_data.viewport.height);
+		spl_swap(spl_scratch->scl_data.viewport_c.width, spl_scratch->scl_data.viewport_c.height);
 	}
 }
 
@@ -468,13 +471,13 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 				int recout_size,
 				int src_size,
 				int taps,
-				struct fixed31_32 ratio,
-				struct fixed31_32 init_adj,
-				struct fixed31_32 *init,
+				struct spl_fixed31_32 ratio,
+				struct spl_fixed31_32 init_adj,
+				struct spl_fixed31_32 *init,
 				int *vp_offset,
 				int *vp_size)
 {
-	struct fixed31_32 temp;
+	struct spl_fixed31_32 temp;
 	int int_part;
 
 	/*
@@ -487,33 +490,33 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 	 * init_bot = init + scaling_ratio
 	 * to get pixel perfect combine add the fraction from calculating vp offset
 	 */
-	temp = dc_fixpt_mul_int(ratio, recout_offset_within_recout_full);
-	*vp_offset = dc_fixpt_floor(temp);
+	temp = spl_fixpt_mul_int(ratio, recout_offset_within_recout_full);
+	*vp_offset = spl_fixpt_floor(temp);
 	temp.value &= 0xffffffff;
-	*init = dc_fixpt_add(dc_fixpt_div_int(dc_fixpt_add_int(ratio, taps + 1), 2), temp);
-	*init = dc_fixpt_add(*init, init_adj);
-	*init = dc_fixpt_truncate(*init, 19);
+	*init = spl_fixpt_add(spl_fixpt_div_int(spl_fixpt_add_int(ratio, taps + 1), 2), temp);
+	*init = spl_fixpt_add(*init, init_adj);
+	*init = spl_fixpt_truncate(*init, 19);
 
 	/*
 	 * If viewport has non 0 offset and there are more taps than covered by init then
 	 * we should decrease the offset and increase init so we are never sampling
 	 * outside of viewport.
 	 */
-	int_part = dc_fixpt_floor(*init);
+	int_part = spl_fixpt_floor(*init);
 	if (int_part < taps) {
 		int_part = taps - int_part;
 		if (int_part > *vp_offset)
 			int_part = *vp_offset;
 		*vp_offset -= int_part;
-		*init = dc_fixpt_add_int(*init, int_part);
+		*init = spl_fixpt_add_int(*init, int_part);
 	}
 	/*
 	 * If taps are sampling outside of viewport at end of recout and there are more pixels
 	 * available in the surface we should increase the viewport size, regardless set vp to
 	 * only what is used.
 	 */
-	temp = dc_fixpt_add(*init, dc_fixpt_mul_int(ratio, recout_size - 1));
-	*vp_size = dc_fixpt_floor(temp);
+	temp = spl_fixpt_add(*init, spl_fixpt_mul_int(ratio, recout_size - 1));
+	*vp_size = spl_fixpt_floor(temp);
 	if (*vp_size + *vp_offset > src_size)
 		*vp_size = src_size - *vp_offset;
 
@@ -536,7 +539,8 @@ static bool spl_is_yuv420(enum spl_pixel_format format)
 }
 
 /*Calculate inits and viewport */
-static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_calculate_inits_and_viewports(struct spl_in *spl_in,
+		struct spl_scratch *spl_scratch)
 {
 	struct spl_rect src = spl_in->basic_in.src_rect;
 	struct spl_rect recout_dst_in_active_timing;
@@ -547,11 +551,11 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 	int vpc_div = (spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8
 			|| spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP10) ? 2 : 1;
 	bool orthogonal_rotation, flip_vert_scan_dir, flip_horz_scan_dir;
-	struct fixed31_32 init_adj_h = dc_fixpt_zero;
-	struct fixed31_32 init_adj_v = dc_fixpt_zero;
+	struct spl_fixed31_32 init_adj_h = spl_fixpt_zero;
+	struct spl_fixed31_32 init_adj_v = spl_fixpt_zero;
 
 	recout_clip_in_active_timing = shift_rec(
-			&spl_out->scl_data.recout, odm_slice.x, odm_slice.y);
+			&spl_scratch->scl_data.recout, odm_slice.x, odm_slice.y);
 	recout_dst_in_active_timing = calculate_plane_rec_in_timing_active(
 			spl_in, &spl_in->basic_in.dst_rect);
 	overlap_in_active_timing = intersect_rec(&recout_clip_in_active_timing,
@@ -574,8 +578,8 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 			&flip_horz_scan_dir);
 
 	if (orthogonal_rotation) {
-		swap(src.width, src.height);
-		swap(flip_vert_scan_dir, flip_horz_scan_dir);
+		spl_swap(src.width, src.height);
+		spl_swap(flip_vert_scan_dir, flip_horz_scan_dir);
 	}
 
 	if (spl_is_yuv420(spl_in->basic_in.format)) {
@@ -587,17 +591,17 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 		switch (spl_in->basic_in.cositing) {
 
 		case CHROMA_COSITING_LEFT:
-			init_adj_h = dc_fixpt_zero;
-			init_adj_v = dc_fixpt_from_fraction(sign, 4);
+			init_adj_h = spl_fixpt_zero;
+			init_adj_v = spl_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_NONE:
-			init_adj_h = dc_fixpt_from_fraction(sign, 4);
-			init_adj_v = dc_fixpt_from_fraction(sign, 4);
+			init_adj_h = spl_fixpt_from_fraction(sign, 4);
+			init_adj_v = spl_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_TOPLEFT:
 		default:
-			init_adj_h = dc_fixpt_zero;
-			init_adj_v = dc_fixpt_zero;
+			init_adj_h = spl_fixpt_zero;
+			init_adj_v = spl_fixpt_zero;
 			break;
 		}
 	}
@@ -605,58 +609,58 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 	spl_calculate_init_and_vp(
 			flip_horz_scan_dir,
 			recout_clip_in_recout_dst.x,
-			spl_out->scl_data.recout.width,
+			spl_scratch->scl_data.recout.width,
 			src.width,
-			spl_out->scl_data.taps.h_taps,
-			spl_out->scl_data.ratios.horz,
-			dc_fixpt_zero,
-			&spl_out->scl_data.inits.h,
-			&spl_out->scl_data.viewport.x,
-			&spl_out->scl_data.viewport.width);
+			spl_scratch->scl_data.taps.h_taps,
+			spl_scratch->scl_data.ratios.horz,
+			spl_fixpt_zero,
+			&spl_scratch->scl_data.inits.h,
+			&spl_scratch->scl_data.viewport.x,
+			&spl_scratch->scl_data.viewport.width);
 	spl_calculate_init_and_vp(
 			flip_horz_scan_dir,
 			recout_clip_in_recout_dst.x,
-			spl_out->scl_data.recout.width,
+			spl_scratch->scl_data.recout.width,
 			src.width / vpc_div,
-			spl_out->scl_data.taps.h_taps_c,
-			spl_out->scl_data.ratios.horz_c,
+			spl_scratch->scl_data.taps.h_taps_c,
+			spl_scratch->scl_data.ratios.horz_c,
 			init_adj_h,
-			&spl_out->scl_data.inits.h_c,
-			&spl_out->scl_data.viewport_c.x,
-			&spl_out->scl_data.viewport_c.width);
+			&spl_scratch->scl_data.inits.h_c,
+			&spl_scratch->scl_data.viewport_c.x,
+			&spl_scratch->scl_data.viewport_c.width);
 	spl_calculate_init_and_vp(
 			flip_vert_scan_dir,
 			recout_clip_in_recout_dst.y,
-			spl_out->scl_data.recout.height,
+			spl_scratch->scl_data.recout.height,
 			src.height,
-			spl_out->scl_data.taps.v_taps,
-			spl_out->scl_data.ratios.vert,
-			dc_fixpt_zero,
-			&spl_out->scl_data.inits.v,
-			&spl_out->scl_data.viewport.y,
-			&spl_out->scl_data.viewport.height);
+			spl_scratch->scl_data.taps.v_taps,
+			spl_scratch->scl_data.ratios.vert,
+			spl_fixpt_zero,
+			&spl_scratch->scl_data.inits.v,
+			&spl_scratch->scl_data.viewport.y,
+			&spl_scratch->scl_data.viewport.height);
 	spl_calculate_init_and_vp(
 			flip_vert_scan_dir,
 			recout_clip_in_recout_dst.y,
-			spl_out->scl_data.recout.height,
+			spl_scratch->scl_data.recout.height,
 			src.height / vpc_div,
-			spl_out->scl_data.taps.v_taps_c,
-			spl_out->scl_data.ratios.vert_c,
+			spl_scratch->scl_data.taps.v_taps_c,
+			spl_scratch->scl_data.ratios.vert_c,
 			init_adj_v,
-			&spl_out->scl_data.inits.v_c,
-			&spl_out->scl_data.viewport_c.y,
-			&spl_out->scl_data.viewport_c.height);
+			&spl_scratch->scl_data.inits.v_c,
+			&spl_scratch->scl_data.viewport_c.y,
+			&spl_scratch->scl_data.viewport_c.height);
 	if (orthogonal_rotation) {
-		swap(spl_out->scl_data.viewport.x, spl_out->scl_data.viewport.y);
-		swap(spl_out->scl_data.viewport.width, spl_out->scl_data.viewport.height);
-		swap(spl_out->scl_data.viewport_c.x, spl_out->scl_data.viewport_c.y);
-		swap(spl_out->scl_data.viewport_c.width, spl_out->scl_data.viewport_c.height);
+		spl_swap(spl_scratch->scl_data.viewport.x, spl_scratch->scl_data.viewport.y);
+		spl_swap(spl_scratch->scl_data.viewport.width, spl_scratch->scl_data.viewport.height);
+		spl_swap(spl_scratch->scl_data.viewport_c.x, spl_scratch->scl_data.viewport_c.y);
+		spl_swap(spl_scratch->scl_data.viewport_c.width, spl_scratch->scl_data.viewport_c.height);
 	}
-	spl_out->scl_data.viewport.x += src.x;
-	spl_out->scl_data.viewport.y += src.y;
-	ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
-	spl_out->scl_data.viewport_c.x += src.x / vpc_div;
-	spl_out->scl_data.viewport_c.y += src.y / vpc_div;
+	spl_scratch->scl_data.viewport.x += src.x;
+	spl_scratch->scl_data.viewport.y += src.y;
+	SPL_ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
+	spl_scratch->scl_data.viewport_c.x += src.x / vpc_div;
+	spl_scratch->scl_data.viewport_c.y += src.y / vpc_div;
 }
 
 static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
@@ -667,7 +671,7 @@ static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
 	 * This may break with rotation, good thing we aren't mixing hw rotation and 3d
 	 */
 	if (spl_in->basic_in.mpc_combine_v) {
-		ASSERT(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
+		SPL_ASSERT(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
 			(spl_in->basic_out.view_format != SPL_VIEW_3D_TOP_AND_BOTTOM &&
 					spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE));
 		if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM)
@@ -708,7 +712,7 @@ static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
 				const struct spl_scaler_data *data,
 				bool enable_isharp, bool enable_easf)
 {
-	const long long one = dc_fixpt_one.value;
+	const long long one = spl_fixpt_one.value;
 	enum spl_pixel_format pixel_format = spl_in->basic_in.format;
 
 	/* Bypass if ratio is 1:1 with no ISHARP or force scale on */
@@ -762,7 +766,7 @@ static bool spl_choose_lls_policy(enum spl_pixel_format format,
 }
 
 /* Enable EASF ?*/
-static bool enable_easf(struct spl_in *spl_in, struct spl_out *spl_out)
+static bool enable_easf(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
 {
 	int vratio = 0;
 	int hratio = 0;
@@ -778,8 +782,8 @@ static bool enable_easf(struct spl_in *spl_in, struct spl_out *spl_out)
 			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
 			&spl_in->lls_pref);
 
-	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+	vratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz);
 
 	if (!lls_enable_easf || spl_in->disable_easf)
 		skip_easf = true;
@@ -799,7 +803,7 @@ static bool enable_easf(struct spl_in *spl_in, struct spl_out *spl_out)
 }
 
 /* Check if video is in fullscreen mode */
-static bool spl_is_video_fullscreen(struct spl_in *spl_in, struct spl_out *spl_out)
+static bool spl_is_video_fullscreen(struct spl_in *spl_in)
 {
 	if (spl_is_yuv420(spl_in->basic_in.format) && spl_in->is_fullscreen)
 		return true;
@@ -807,16 +811,16 @@ static bool spl_is_video_fullscreen(struct spl_in *spl_in, struct spl_out *spl_o
 }
 
 static bool spl_get_isharp_en(struct spl_in *spl_in,
-	struct spl_out *spl_out)
+	struct spl_scratch *spl_scratch)
 {
 	bool enable_isharp = false;
 	int vratio = 0;
 	int hratio = 0;
-	struct spl_taps taps = spl_out->scl_data.taps;
-	bool fullscreen = spl_is_video_fullscreen(spl_in, spl_out);
+	struct spl_taps taps = spl_scratch->scl_data.taps;
+	bool fullscreen = spl_is_video_fullscreen(spl_in);
 
-	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+	vratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz);
 
 	/* Return if adaptive sharpness is disabled */
 	if (spl_in->adaptive_sharpness.enable == false)
@@ -848,7 +852,7 @@ static bool spl_get_isharp_en(struct spl_in *spl_in,
 
 /* Calculate optimal number of taps */
 static bool spl_get_optimal_number_of_taps(
-	  int max_downscale_src_width, struct spl_in *spl_in, struct spl_out *spl_out,
+	  int max_downscale_src_width, struct spl_in *spl_in, struct spl_scratch *spl_scratch,
 	  const struct spl_taps *in_taps, bool *enable_easf_v, bool *enable_easf_h,
 	  bool *enable_isharp)
 {
@@ -858,13 +862,13 @@ static bool spl_get_optimal_number_of_taps(
 	enum lb_memory_config lb_config;
 	bool skip_easf = false;
 
-	if (spl_out->scl_data.viewport.width > spl_out->scl_data.h_active &&
+	if (spl_scratch->scl_data.viewport.width > spl_scratch->scl_data.h_active &&
 		max_downscale_src_width != 0 &&
-		spl_out->scl_data.viewport.width > max_downscale_src_width)
+		spl_scratch->scl_data.viewport.width > max_downscale_src_width)
 		return false;
 
 	/* Check if we are using EASF or not */
-	skip_easf = enable_easf(spl_in, spl_out);
+	skip_easf = enable_easf(spl_in, spl_scratch);
 
 	/*
 	 * Set default taps if none are provided
@@ -873,57 +877,57 @@ static bool spl_get_optimal_number_of_taps(
 	 */
 	if (skip_easf) {
 		if (in_taps->h_taps == 0) {
-			if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz) > 1)
-				spl_out->scl_data.taps.h_taps = min(2 * dc_fixpt_ceil(
-					spl_out->scl_data.ratios.horz), 8);
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz) > 1)
+				spl_scratch->scl_data.taps.h_taps = spl_min(2 * spl_fixpt_ceil(
+					spl_scratch->scl_data.ratios.horz), 8);
 			else
-				spl_out->scl_data.taps.h_taps = 4;
+				spl_scratch->scl_data.taps.h_taps = 4;
 		} else
-			spl_out->scl_data.taps.h_taps = in_taps->h_taps;
+			spl_scratch->scl_data.taps.h_taps = in_taps->h_taps;
 		if (in_taps->v_taps == 0) {
-			if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 1)
-				spl_out->scl_data.taps.v_taps = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-					spl_out->scl_data.ratios.vert, 2)), 8);
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) > 1)
+				spl_scratch->scl_data.taps.v_taps = spl_min(spl_fixpt_ceil(spl_fixpt_mul_int(
+					spl_scratch->scl_data.ratios.vert, 2)), 8);
 			else
-				spl_out->scl_data.taps.v_taps = 4;
+				spl_scratch->scl_data.taps.v_taps = 4;
 		} else
-			spl_out->scl_data.taps.v_taps = in_taps->v_taps;
+			spl_scratch->scl_data.taps.v_taps = in_taps->v_taps;
 		if (in_taps->v_taps_c == 0) {
-			if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 1)
-				spl_out->scl_data.taps.v_taps_c = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-					spl_out->scl_data.ratios.vert_c, 2)), 8);
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) > 1)
+				spl_scratch->scl_data.taps.v_taps_c = spl_min(spl_fixpt_ceil(spl_fixpt_mul_int(
+					spl_scratch->scl_data.ratios.vert_c, 2)), 8);
 			else
-				spl_out->scl_data.taps.v_taps_c = 4;
+				spl_scratch->scl_data.taps.v_taps_c = 4;
 		} else
-			spl_out->scl_data.taps.v_taps_c = in_taps->v_taps_c;
+			spl_scratch->scl_data.taps.v_taps_c = in_taps->v_taps_c;
 		if (in_taps->h_taps_c == 0) {
-			if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c) > 1)
-				spl_out->scl_data.taps.h_taps_c = min(2 * dc_fixpt_ceil(
-					spl_out->scl_data.ratios.horz_c), 8);
+			if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.horz_c) > 1)
+				spl_scratch->scl_data.taps.h_taps_c = spl_min(2 * spl_fixpt_ceil(
+					spl_scratch->scl_data.ratios.horz_c), 8);
 			else
-				spl_out->scl_data.taps.h_taps_c = 4;
+				spl_scratch->scl_data.taps.h_taps_c = 4;
 		} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
 			/* Only 1 and even h_taps_c are supported by hw */
-			spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
+			spl_scratch->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
 		else
-			spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c;
+			spl_scratch->scl_data.taps.h_taps_c = in_taps->h_taps_c;
 	} else {
 		if (spl_is_yuv420(spl_in->basic_in.format)) {
-			spl_out->scl_data.taps.h_taps = 6;
-			spl_out->scl_data.taps.v_taps = 6;
-			spl_out->scl_data.taps.h_taps_c = 4;
-			spl_out->scl_data.taps.v_taps_c = 4;
+			spl_scratch->scl_data.taps.h_taps = 6;
+			spl_scratch->scl_data.taps.v_taps = 6;
+			spl_scratch->scl_data.taps.h_taps_c = 4;
+			spl_scratch->scl_data.taps.v_taps_c = 4;
 		} else { /* RGB */
-			spl_out->scl_data.taps.h_taps = 6;
-			spl_out->scl_data.taps.v_taps = 6;
-			spl_out->scl_data.taps.h_taps_c = 6;
-			spl_out->scl_data.taps.v_taps_c = 6;
+			spl_scratch->scl_data.taps.h_taps = 6;
+			spl_scratch->scl_data.taps.v_taps = 6;
+			spl_scratch->scl_data.taps.h_taps_c = 6;
+			spl_scratch->scl_data.taps.v_taps_c = 6;
 		}
 	}
 
 	/*Ensure we can support the requested number of vtaps*/
-	min_taps_y = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	min_taps_c = dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c);
+	min_taps_y = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert);
+	min_taps_c = spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c);
 
 	/* Use LB_MEMORY_CONFIG_3 for 4:2:0 */
 	if ((spl_in->basic_in.format == SPL_PIXEL_FORMAT_420BPP8)
@@ -932,16 +936,16 @@ static bool spl_get_optimal_number_of_taps(
 	else
 		lb_config = LB_MEMORY_CONFIG_0;
 	// Determine max vtap support by calculating how much line buffer can fit
-	spl_in->funcs->spl_calc_lb_num_partitions(spl_in->basic_out.alpha_en, &spl_out->scl_data,
+	spl_in->funcs->spl_calc_lb_num_partitions(spl_in->basic_out.alpha_en, &spl_scratch->scl_data,
 			lb_config, &num_part_y, &num_part_c);
 	/* MAX_V_TAPS = MIN (NUM_LINES - MAX(CEILING(V_RATIO,1)-2, 0), 8) */
-	if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 2)
-		max_taps_y = num_part_y - (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) - 2);
+	if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) > 2)
+		max_taps_y = num_part_y - (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert) - 2);
 	else
 		max_taps_y = num_part_y;
 
-	if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 2)
-		max_taps_c = num_part_c - (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) - 2);
+	if (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) > 2)
+		max_taps_c = num_part_c - (spl_fixpt_ceil(spl_scratch->scl_data.ratios.vert_c) - 2);
 	else
 		max_taps_c = num_part_c;
 
@@ -950,11 +954,11 @@ static bool spl_get_optimal_number_of_taps(
 	else if (max_taps_c < min_taps_c)
 		return false;
 
-	if (spl_out->scl_data.taps.v_taps > max_taps_y)
-		spl_out->scl_data.taps.v_taps = max_taps_y;
+	if (spl_scratch->scl_data.taps.v_taps > max_taps_y)
+		spl_scratch->scl_data.taps.v_taps = max_taps_y;
 
-	if (spl_out->scl_data.taps.v_taps_c > max_taps_c)
-		spl_out->scl_data.taps.v_taps_c = max_taps_c;
+	if (spl_scratch->scl_data.taps.v_taps_c > max_taps_c)
+		spl_scratch->scl_data.taps.v_taps_c = max_taps_c;
 
 	if (!skip_easf) {
 		/*
@@ -971,45 +975,45 @@ static bool spl_get_optimal_number_of_taps(
 		 * If optimal no of taps is 7 or 8, then fine since max tap is 6
 		 *
 		 */
-		if (spl_out->scl_data.taps.v_taps == 5)
-			spl_out->scl_data.taps.v_taps = 4;
+		if (spl_scratch->scl_data.taps.v_taps == 5)
+			spl_scratch->scl_data.taps.v_taps = 4;
 
-		if (spl_out->scl_data.taps.v_taps_c == 5)
-			spl_out->scl_data.taps.v_taps_c = 4;
+		if (spl_scratch->scl_data.taps.v_taps_c == 5)
+			spl_scratch->scl_data.taps.v_taps_c = 4;
 
-		if (spl_out->scl_data.taps.h_taps == 5)
-			spl_out->scl_data.taps.h_taps = 4;
+		if (spl_scratch->scl_data.taps.h_taps == 5)
+			spl_scratch->scl_data.taps.h_taps = 4;
 
-		if (spl_out->scl_data.taps.h_taps_c == 5)
-			spl_out->scl_data.taps.h_taps_c = 4;
+		if (spl_scratch->scl_data.taps.h_taps_c == 5)
+			spl_scratch->scl_data.taps.h_taps_c = 4;
 
 		if (spl_is_yuv420(spl_in->basic_in.format)) {
-			if ((spl_out->scl_data.taps.h_taps <= 4) ||
-				(spl_out->scl_data.taps.h_taps_c <= 3)) {
+			if ((spl_scratch->scl_data.taps.h_taps <= 4) ||
+				(spl_scratch->scl_data.taps.h_taps_c <= 3)) {
 				*enable_easf_v = false;
 				*enable_easf_h = false;
-			} else if ((spl_out->scl_data.taps.v_taps <= 3) ||
-				(spl_out->scl_data.taps.v_taps_c <= 3)) {
+			} else if ((spl_scratch->scl_data.taps.v_taps <= 3) ||
+				(spl_scratch->scl_data.taps.v_taps_c <= 3)) {
 				*enable_easf_v = false;
 				*enable_easf_h = true;
 			} else {
 				*enable_easf_v = true;
 				*enable_easf_h = true;
 			}
-			ASSERT((spl_out->scl_data.taps.v_taps > 1) &&
-				(spl_out->scl_data.taps.v_taps_c > 1));
+			SPL_ASSERT((spl_scratch->scl_data.taps.v_taps > 1) &&
+				(spl_scratch->scl_data.taps.v_taps_c > 1));
 		} else { /* RGB */
-			if (spl_out->scl_data.taps.h_taps <= 3) {
+			if (spl_scratch->scl_data.taps.h_taps <= 3) {
 				*enable_easf_v = false;
 				*enable_easf_h = false;
-			} else if (spl_out->scl_data.taps.v_taps < 3) {
+			} else if (spl_scratch->scl_data.taps.v_taps < 3) {
 				*enable_easf_v = false;
 				*enable_easf_h = true;
 			} else {
 				*enable_easf_v = true;
 				*enable_easf_h = true;
 			}
-			ASSERT(spl_out->scl_data.taps.v_taps > 1);
+			SPL_ASSERT(spl_scratch->scl_data.taps.v_taps > 1);
 		}
 	} else {
 		*enable_easf_v = false;
@@ -1024,29 +1028,29 @@ static bool spl_get_optimal_number_of_taps(
 	 *  EASF is not enabled
 	 */
 
-	*enable_isharp = spl_get_isharp_en(spl_in, spl_out);
+	*enable_isharp = spl_get_isharp_en(spl_in, spl_scratch);
 	if (!*enable_isharp && !spl_in->basic_out.always_scale)	{
-		if ((IDENTITY_RATIO(spl_out->scl_data.ratios.horz)) &&
-			(IDENTITY_RATIO(spl_out->scl_data.ratios.vert))) {
-			spl_out->scl_data.taps.h_taps = 1;
-			spl_out->scl_data.taps.v_taps = 1;
+		if ((IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz)) &&
+			(IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert))) {
+			spl_scratch->scl_data.taps.h_taps = 1;
+			spl_scratch->scl_data.taps.v_taps = 1;
 
-			if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c))
-				spl_out->scl_data.taps.h_taps_c = 1;
+			if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz_c))
+				spl_scratch->scl_data.taps.h_taps_c = 1;
 
-			if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c))
-				spl_out->scl_data.taps.v_taps_c = 1;
+			if (IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert_c))
+				spl_scratch->scl_data.taps.v_taps_c = 1;
 
 			*enable_easf_v = false;
 			*enable_easf_h = false;
 		} else {
 			if ((!*enable_easf_h) &&
-				(IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c)))
-				spl_out->scl_data.taps.h_taps_c = 1;
+				(IDENTITY_RATIO(spl_scratch->scl_data.ratios.horz_c)))
+				spl_scratch->scl_data.taps.h_taps_c = 1;
 
 			if ((!*enable_easf_v) &&
-				(IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c)))
-				spl_out->scl_data.taps.v_taps_c = 1;
+				(IDENTITY_RATIO(spl_scratch->scl_data.ratios.vert_c)))
+				spl_scratch->scl_data.taps.v_taps_c = 1;
 		}
 	}
 	return true;
@@ -1069,38 +1073,38 @@ static void spl_set_black_color_data(enum spl_pixel_format format,
 static void spl_set_manual_ratio_init_data(struct dscl_prog_data *dscl_prog_data,
 		const struct spl_scaler_data *scl_data)
 {
-	struct fixed31_32 bot;
+	struct spl_fixed31_32 bot;
 
-	dscl_prog_data->ratios.h_scale_ratio = dc_fixpt_u3d19(scl_data->ratios.horz) << 5;
-	dscl_prog_data->ratios.v_scale_ratio = dc_fixpt_u3d19(scl_data->ratios.vert) << 5;
-	dscl_prog_data->ratios.h_scale_ratio_c = dc_fixpt_u3d19(scl_data->ratios.horz_c) << 5;
-	dscl_prog_data->ratios.v_scale_ratio_c = dc_fixpt_u3d19(scl_data->ratios.vert_c) << 5;
+	dscl_prog_data->ratios.h_scale_ratio = spl_fixpt_u3d19(scl_data->ratios.horz) << 5;
+	dscl_prog_data->ratios.v_scale_ratio = spl_fixpt_u3d19(scl_data->ratios.vert) << 5;
+	dscl_prog_data->ratios.h_scale_ratio_c = spl_fixpt_u3d19(scl_data->ratios.horz_c) << 5;
+	dscl_prog_data->ratios.v_scale_ratio_c = spl_fixpt_u3d19(scl_data->ratios.vert_c) << 5;
 	/*
 	 * 0.24 format for fraction, first five bits zeroed
 	 */
 	dscl_prog_data->init.h_filter_init_frac =
-			dc_fixpt_u0d19(scl_data->inits.h) << 5;
+			spl_fixpt_u0d19(scl_data->inits.h) << 5;
 	dscl_prog_data->init.h_filter_init_int =
-			dc_fixpt_floor(scl_data->inits.h);
+			spl_fixpt_floor(scl_data->inits.h);
 	dscl_prog_data->init.h_filter_init_frac_c =
-			dc_fixpt_u0d19(scl_data->inits.h_c) << 5;
+			spl_fixpt_u0d19(scl_data->inits.h_c) << 5;
 	dscl_prog_data->init.h_filter_init_int_c =
-			dc_fixpt_floor(scl_data->inits.h_c);
+			spl_fixpt_floor(scl_data->inits.h_c);
 	dscl_prog_data->init.v_filter_init_frac =
-			dc_fixpt_u0d19(scl_data->inits.v) << 5;
+			spl_fixpt_u0d19(scl_data->inits.v) << 5;
 	dscl_prog_data->init.v_filter_init_int =
-			dc_fixpt_floor(scl_data->inits.v);
+			spl_fixpt_floor(scl_data->inits.v);
 	dscl_prog_data->init.v_filter_init_frac_c =
-			dc_fixpt_u0d19(scl_data->inits.v_c) << 5;
+			spl_fixpt_u0d19(scl_data->inits.v_c) << 5;
 	dscl_prog_data->init.v_filter_init_int_c =
-			dc_fixpt_floor(scl_data->inits.v_c);
-
-	bot = dc_fixpt_add(scl_data->inits.v, scl_data->ratios.vert);
-	dscl_prog_data->init.v_filter_init_bot_frac = dc_fixpt_u0d19(bot) << 5;
-	dscl_prog_data->init.v_filter_init_bot_int = dc_fixpt_floor(bot);
-	bot = dc_fixpt_add(scl_data->inits.v_c, scl_data->ratios.vert_c);
-	dscl_prog_data->init.v_filter_init_bot_frac_c = dc_fixpt_u0d19(bot) << 5;
-	dscl_prog_data->init.v_filter_init_bot_int_c = dc_fixpt_floor(bot);
+			spl_fixpt_floor(scl_data->inits.v_c);
+
+	bot = spl_fixpt_add(scl_data->inits.v, scl_data->ratios.vert);
+	dscl_prog_data->init.v_filter_init_bot_frac = spl_fixpt_u0d19(bot) << 5;
+	dscl_prog_data->init.v_filter_init_bot_int = spl_fixpt_floor(bot);
+	bot = spl_fixpt_add(scl_data->inits.v_c, scl_data->ratios.vert_c);
+	dscl_prog_data->init.v_filter_init_bot_frac_c = spl_fixpt_u0d19(bot) << 5;
+	dscl_prog_data->init.v_filter_init_bot_int_c = spl_fixpt_floor(bot);
 }
 
 static void spl_set_taps_data(struct dscl_prog_data *dscl_prog_data,
@@ -1113,22 +1117,22 @@ static void spl_set_taps_data(struct dscl_prog_data *dscl_prog_data,
 }
 
 /* Populate dscl prog data structure from scaler data calculated by SPL */
-static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_out,
-	bool enable_easf_v, bool enable_easf_h, bool enable_isharp)
+static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_scratch *spl_scratch,
+	struct spl_out *spl_out, bool enable_easf_v, bool enable_easf_h, bool enable_isharp)
 {
 	struct dscl_prog_data *dscl_prog_data = spl_out->dscl_prog_data;
 
-	const struct spl_scaler_data *data = &spl_out->scl_data;
+	const struct spl_scaler_data *data = &spl_scratch->scl_data;
 
 	struct scl_black_color *scl_black_color = &dscl_prog_data->scl_black_color;
 
 	bool enable_easf = enable_easf_v || enable_easf_h;
 
 	// Set values for recout
-	dscl_prog_data->recout = spl_out->scl_data.recout;
+	dscl_prog_data->recout = spl_scratch->scl_data.recout;
 	// Set values for MPC Size
-	dscl_prog_data->mpc_size.width = spl_out->scl_data.h_active;
-	dscl_prog_data->mpc_size.height = spl_out->scl_data.v_active;
+	dscl_prog_data->mpc_size.width = spl_scratch->scl_data.h_active;
+	dscl_prog_data->mpc_size.height = spl_scratch->scl_data.v_active;
 
 	// SCL_MODE - Set SCL_MODE data
 	dscl_prog_data->dscl_mode = spl_get_dscl_mode(spl_in, data, enable_isharp,
@@ -1143,15 +1147,15 @@ static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_ou
 	// Set HTaps/VTaps
 	spl_set_taps_data(dscl_prog_data, data);
 	// Set viewport
-	dscl_prog_data->viewport = spl_out->scl_data.viewport;
+	dscl_prog_data->viewport = spl_scratch->scl_data.viewport;
 	// Set viewport_c
-	dscl_prog_data->viewport_c = spl_out->scl_data.viewport_c;
+	dscl_prog_data->viewport_c = spl_scratch->scl_data.viewport_c;
 	// Set filters data
 	spl_set_filters_data(dscl_prog_data, data, enable_easf_v, enable_easf_h);
 }
 
 /* Set EASF data */
-static void spl_set_easf_data(struct spl_out *spl_out, bool enable_easf_v,
+static void spl_set_easf_data(struct spl_scratch *spl_scratch, struct spl_out *spl_out, bool enable_easf_v,
 	bool enable_easf_h, enum linear_light_scaling lls_pref,
 	enum spl_pixel_format format, enum system_setup setup)
 {
@@ -1164,47 +1168,47 @@ static void spl_set_easf_data(struct spl_out *spl_out, bool enable_easf_v,
 		dscl_prog_data->easf_v_bf2_mode = 0xF;	// 4-bit, BF2 calculation mode
 		/* 2-bit, BF3 chroma mode correction calculation mode */
 		dscl_prog_data->easf_v_bf3_mode = spl_get_v_bf3_mode(
-			spl_out->scl_data.recip_ratios.vert);
+			spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ minCoef ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_uptilt =
-			spl_get_3tap_dntilt_uptilt_offset(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_dntilt_uptilt_offset(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ upTiltMaxVal ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt_max =
-			spl_get_3tap_uptilt_maxval(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_uptilt_maxval(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ dnTiltSlope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_slope =
-			spl_get_3tap_dntilt_slope(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_dntilt_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ upTilt1Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt1_slope =
-			spl_get_3tap_uptilt1_slope(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_uptilt1_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ upTilt2Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_slope =
-			spl_get_3tap_uptilt2_slope(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_uptilt2_slope(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10 [ upTilt2Offset ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_offset =
-			spl_get_3tap_uptilt2_offset(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_3tap_uptilt2_offset(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg1 =
-			spl_get_reducer_gain4(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_reducer_gain4(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg2 =
-			spl_get_reducer_gain6(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_reducer_gain6(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain1 =
-			spl_get_gainRing4(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_gainRing4(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain2 =
-			spl_get_gainRing6(spl_out->scl_data.taps.v_taps,
-				spl_out->scl_data.recip_ratios.vert);
+			spl_get_gainRing6(spl_scratch->scl_data.taps.v_taps,
+				spl_scratch->scl_data.recip_ratios.vert);
 		dscl_prog_data->easf_v_bf_maxa = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 0
 		dscl_prog_data->easf_v_bf_maxb = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 1
 		dscl_prog_data->easf_v_bf_mina = 0;	//Vertical Min BF value A in U0.6 format.Selected if V_FCNTL == 0
@@ -1330,23 +1334,23 @@ static void spl_set_easf_data(struct spl_out *spl_out, bool enable_easf_v,
 			0xF;	// 4-bit, BF2 calculation mode
 		/* 2-bit, BF3 chroma mode correction calculation mode */
 		dscl_prog_data->easf_h_bf3_mode = spl_get_h_bf3_mode(
-			spl_out->scl_data.recip_ratios.horz);
+			spl_scratch->scl_data.recip_ratios.horz);
 		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg1 =
-			spl_get_reducer_gain4(spl_out->scl_data.taps.h_taps,
-				spl_out->scl_data.recip_ratios.horz);
+			spl_get_reducer_gain4(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
 		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg2 =
-			spl_get_reducer_gain6(spl_out->scl_data.taps.h_taps,
-				spl_out->scl_data.recip_ratios.horz);
+			spl_get_reducer_gain6(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
 		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain1 =
-			spl_get_gainRing4(spl_out->scl_data.taps.h_taps,
-				spl_out->scl_data.recip_ratios.horz);
+			spl_get_gainRing4(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
 		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain2 =
-			spl_get_gainRing6(spl_out->scl_data.taps.h_taps,
-				spl_out->scl_data.recip_ratios.horz);
+			spl_get_gainRing6(spl_scratch->scl_data.taps.h_taps,
+				spl_scratch->scl_data.recip_ratios.horz);
 		dscl_prog_data->easf_h_bf_maxa = 63; //Horz Max BF value A in U0.6 format.Selected if H_FCNTL==0
 		dscl_prog_data->easf_h_bf_maxb = 63; //Horz Max BF value B in U0.6 format.Selected if H_FCNTL==1
 		dscl_prog_data->easf_h_bf_mina = 0;	//Horz Min BF value B in U0.6 format.Selected if H_FCNTL==0
@@ -1524,7 +1528,7 @@ static void spl_set_isharp_noise_det_mode(struct dscl_prog_data *dscl_prog_data,
 static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 		struct adaptive_sharpness adp_sharpness, bool enable_isharp,
 		enum linear_light_scaling lls_pref, enum spl_pixel_format format,
-		const struct spl_scaler_data *data, struct fixed31_32 ratio,
+		const struct spl_scaler_data *data, struct spl_fixed31_32 ratio,
 		enum system_setup setup)
 {
 	/* Turn off sharpener if not required */
@@ -1638,40 +1642,44 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 	bool enable_easf_h = false;
 	int vratio = 0;
 	int hratio = 0;
-	const struct spl_scaler_data *data = &spl_out->scl_data;
-	struct fixed31_32 isharp_scale_ratio;
+	struct spl_scratch spl_scratch;
+	struct spl_fixed31_32 isharp_scale_ratio;
 	enum system_setup setup;
 	bool enable_isharp = false;
+	const struct spl_scaler_data *data = &spl_scratch.scl_data;
 
+	memset(&spl_scratch, 0, sizeof(struct spl_scratch));
+	spl_scratch.scl_data.h_active = spl_in->h_active;
+	spl_scratch.scl_data.v_active = spl_in->v_active;
 	// All SPL calls
 	/* recout calculation */
 	/* depends on h_active */
-	spl_calculate_recout(spl_in, spl_out);
+	spl_calculate_recout(spl_in, &spl_scratch, spl_out);
 	/* depends on pixel format */
-	spl_calculate_scaling_ratios(spl_in, spl_out);
+	spl_calculate_scaling_ratios(spl_in, &spl_scratch, spl_out);
 	/* depends on scaling ratios and recout, does not calculate offset yet */
-	spl_calculate_viewport_size(spl_in, spl_out);
+	spl_calculate_viewport_size(spl_in, &spl_scratch);
 
 	res = spl_get_optimal_number_of_taps(
 			  spl_in->basic_out.max_downscale_src_width, spl_in,
-			  spl_out, &spl_in->scaling_quality, &enable_easf_v,
+			  &spl_scratch, &spl_in->scaling_quality, &enable_easf_v,
 			  &enable_easf_h, &enable_isharp);
 	/*
 	 * Depends on recout, scaling ratios, h_active and taps
 	 * May need to re-check lb size after this in some obscure scenario
 	 */
 	if (res)
-		spl_calculate_inits_and_viewports(spl_in, spl_out);
+		spl_calculate_inits_and_viewports(spl_in, &spl_scratch);
 	// Handle 3d recout
-	spl_handle_3d_recout(spl_in, &spl_out->scl_data.recout);
+	spl_handle_3d_recout(spl_in, &spl_scratch.scl_data.recout);
 	// Clamp
-	spl_clamp_viewport(&spl_out->scl_data.viewport);
+	spl_clamp_viewport(&spl_scratch.scl_data.viewport);
 
 	if (!res)
 		return res;
 
 	// Save all calculated parameters in dscl_prog_data structure to program hw registers
-	spl_set_dscl_prog_data(spl_in, spl_out, enable_easf_v, enable_easf_h, enable_isharp);
+	spl_set_dscl_prog_data(spl_in, &spl_scratch, spl_out, enable_easf_v, enable_easf_h, enable_isharp);
 
 	if (spl_in->lls_pref == LLS_PREF_YES) {
 		if (spl_in->is_hdr_on)
@@ -1685,15 +1693,15 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 			setup = SDR_NL;
 	}
 	// Set EASF
-	spl_set_easf_data(spl_out->dscl_prog_data, enable_easf_v, enable_easf_h, spl_in->lls_pref,
+	spl_set_easf_data(&spl_scratch, spl_out, enable_easf_v, enable_easf_h, spl_in->lls_pref,
 		spl_in->basic_in.format, setup);
 	// Set iSHARP
-	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+	vratio = spl_fixpt_ceil(spl_scratch.scl_data.ratios.vert);
+	hratio = spl_fixpt_ceil(spl_scratch.scl_data.ratios.horz);
 	if (vratio <= hratio)
-		isharp_scale_ratio = spl_out->scl_data.recip_ratios.vert;
+		isharp_scale_ratio = spl_scratch.scl_data.recip_ratios.vert;
 	else
-		isharp_scale_ratio = spl_out->scl_data.recip_ratios.horz;
+		isharp_scale_ratio = spl_scratch.scl_data.recip_ratios.horz;
 
 	spl_set_isharp_data(spl_out->dscl_prog_data, spl_in->adaptive_sharpness, enable_isharp,
 		spl_in->lls_pref, spl_in->basic_in.format, data, isharp_scale_ratio, setup);
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
index a5e544406e91..d483f259512e 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
@@ -3,6 +3,7 @@
 // Copyright 2024 Advanced Micro Devices, Inc.
 
 #include "dc_spl_types.h"
+#include "spl_debug.h"
 #include "dc_spl_filters.h"
 #include "dc_spl_isharp_filters.h"
 
@@ -631,10 +632,10 @@ uint16_t *spl_get_filter_isharp_bs_3tap_64p(void)
 	return filter_isharp_bs_3tap_64p_s1_12;
 }
 
-void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum system_setup setup)
+void spl_build_isharp_1dlut_from_reference_curve(struct spl_fixed31_32 ratio, enum system_setup setup)
 {
 	uint8_t *byte_ptr_1dlut_src, *byte_ptr_1dlut_dst;
-	struct fixed31_32 sharp_base, sharp_calc, sharp_level, ratio_level;
+	struct spl_fixed31_32 sharp_base, sharp_calc, sharp_level, ratio_level;
 	int i, j;
 	struct scale_ratio_to_sharpness_level_lookup *setup_lookup_ptr;
 	int num_sharp_ramp_levels;
@@ -680,12 +681,12 @@ void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum s
 		 *  base scale ratio to sharpness curve
 		 */
 		j = 0;
-		sharp_level = dc_fixpt_zero;
+		sharp_level = spl_fixpt_zero;
 		while (j < num_sharp_ramp_levels) {
-			ratio_level = dc_fixpt_from_fraction(setup_lookup_ptr->ratio_numer,
+			ratio_level = spl_fixpt_from_fraction(setup_lookup_ptr->ratio_numer,
 				setup_lookup_ptr->ratio_denom);
 			if (ratio.value >= ratio_level.value) {
-				sharp_level = dc_fixpt_from_fraction(setup_lookup_ptr->sharpness_numer,
+				sharp_level = spl_fixpt_from_fraction(setup_lookup_ptr->sharpness_numer,
 					setup_lookup_ptr->sharpness_denom);
 				break;
 			}
@@ -707,12 +708,12 @@ void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum s
 		size_1dlut = sizeof(filter_isharp_1D_lut_3p0x);
 		memset(byte_ptr_1dlut_dst, 0, size_1dlut);
 		for (j = 0; j < size_1dlut; j++) {
-			sharp_base = dc_fixpt_from_int((int)*byte_ptr_1dlut_src);
-			sharp_calc = dc_fixpt_mul(sharp_base, sharp_level);
-			sharp_calc = dc_fixpt_div(sharp_calc, dc_fixpt_from_int(3));
-			sharp_calc = dc_fixpt_min(dc_fixpt_from_int(255), sharp_calc);
-			sharp_calc = dc_fixpt_add(sharp_calc, dc_fixpt_from_fraction(1, 2));
-			sharp_calc_int = dc_fixpt_floor(sharp_calc);
+			sharp_base = spl_fixpt_from_int((int)*byte_ptr_1dlut_src);
+			sharp_calc = spl_fixpt_mul(sharp_base, sharp_level);
+			sharp_calc = spl_fixpt_div(sharp_calc, spl_fixpt_from_int(3));
+			sharp_calc = spl_fixpt_min(spl_fixpt_from_int(255), sharp_calc);
+			sharp_calc = spl_fixpt_add(sharp_calc, spl_fixpt_from_fraction(1, 2));
+			sharp_calc_int = spl_fixpt_floor(sharp_calc);
 			if (sharp_calc_int > 255)
 				sharp_calc_int = 255;
 			*byte_ptr_1dlut_dst = (uint8_t)sharp_calc_int;
@@ -742,7 +743,6 @@ void spl_init_blur_scale_coeffs(void)
 		filter_isharp_bs_4tap_in_6_64p_s1_12, 6);
 }
 
-#ifdef CONFIG_DRM_AMD_DC_FP
 uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
 {
 	if (taps == 3)
@@ -753,7 +753,7 @@ uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
 		return spl_get_filter_isharp_bs_4tap_in_6_64p();
 	else {
 		/* should never happen, bug */
-		BREAK_TO_DEBUGGER();
+		SPL_BREAK_TO_DEBUGGER();
 		return NULL;
 	}
 }
@@ -767,5 +767,4 @@ void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
 	dscl_prog_data->filter_blur_scale_v =
 		spl_dscl_get_blur_scale_coeffs_64p(data->taps.v_taps);
 }
-#endif
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
index c8b7cd6404dd..6cb000bf9d53 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
@@ -43,6 +43,6 @@ void spl_init_blur_scale_coeffs(void);
 void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
 	const struct spl_scaler_data *data);
 
-void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum system_setup setup);
+void spl_build_isharp_1dlut_from_reference_curve(struct spl_fixed31_32 ratio, enum system_setup setup);
 uint32_t *spl_get_pregen_filter_isharp_1D_lut(enum explicit_sharpness sharpness);
 #endif /* __DC_SPL_ISHARP_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
index 83dd3435ebcc..09bf82f7d468 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
@@ -2,6 +2,7 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
+#include "spl_debug.h"
 #include "dc_spl_filters.h"
 #include "dc_spl_scl_filters.h"
 #include "dc_spl_scl_easf_filters.h"
@@ -1406,67 +1407,67 @@ void spl_init_easf_filter_coeffs(void)
 		easf_filter_6tap_64p_ratio_1_00_s1_12, 6);
 }
 
-uint16_t *spl_get_easf_filter_3tap_64p(struct fixed31_32 ratio)
+uint16_t *spl_get_easf_filter_3tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
 		return easf_filter_3tap_64p_ratio_0_30_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
 		return easf_filter_3tap_64p_ratio_0_40_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
 		return easf_filter_3tap_64p_ratio_0_50_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
 		return easf_filter_3tap_64p_ratio_0_60_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
 		return easf_filter_3tap_64p_ratio_0_70_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
 		return easf_filter_3tap_64p_ratio_0_80_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
 		return easf_filter_3tap_64p_ratio_0_90_s1_12;
 	else
 		return easf_filter_3tap_64p_ratio_1_00_s1_12;
 }
 
-uint16_t *spl_get_easf_filter_4tap_64p(struct fixed31_32 ratio)
+uint16_t *spl_get_easf_filter_4tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
 		return easf_filter_4tap_64p_ratio_0_30_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
 		return easf_filter_4tap_64p_ratio_0_40_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
 		return easf_filter_4tap_64p_ratio_0_50_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
 		return easf_filter_4tap_64p_ratio_0_60_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
 		return easf_filter_4tap_64p_ratio_0_70_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
 		return easf_filter_4tap_64p_ratio_0_80_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
 		return easf_filter_4tap_64p_ratio_0_90_s1_12;
 	else
 		return easf_filter_4tap_64p_ratio_1_00_s1_12;
 }
 
-uint16_t *spl_get_easf_filter_6tap_64p(struct fixed31_32 ratio)
+uint16_t *spl_get_easf_filter_6tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+	if (ratio.value < spl_fixpt_from_fraction(3, 10).value)
 		return easf_filter_6tap_64p_ratio_0_30_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 10).value)
 		return easf_filter_6tap_64p_ratio_0_40_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 10).value)
 		return easf_filter_6tap_64p_ratio_0_50_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(6, 10).value)
 		return easf_filter_6tap_64p_ratio_0_60_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(7, 10).value)
 		return easf_filter_6tap_64p_ratio_0_70_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(8, 10).value)
 		return easf_filter_6tap_64p_ratio_0_80_s1_12;
-	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+	else if (ratio.value < spl_fixpt_from_fraction(9, 10).value)
 		return easf_filter_6tap_64p_ratio_0_90_s1_12;
 	else
 		return easf_filter_6tap_64p_ratio_1_00_s1_12;
 }
 
-uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio)
 {
 	if (taps == 6)
 		return spl_get_easf_filter_6tap_64p(ratio);
@@ -1476,7 +1477,7 @@ uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
 		return spl_get_easf_filter_3tap_64p(ratio);
 	else {
 		/* should never happen, bug */
-		BREAK_TO_DEBUGGER();
+		SPL_BREAK_TO_DEBUGGER();
 		return NULL;
 	}
 }
@@ -1517,7 +1518,7 @@ void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
 	}
 }
 
-static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct fixed31_32 ratio,
+static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 ratio,
 	struct scale_ratio_to_reg_value_lookup *lookup_table_base_ptr,
 	unsigned int num_entries)
 {
@@ -1534,7 +1535,7 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct fixed31_32 ratio,
 		if (lookup_table_index_ptr->numer < 0)
 			break;
 
-		if (ratio.value < dc_fixpt_from_fraction(
+		if (ratio.value < spl_fixpt_from_fraction(
 			lookup_table_index_ptr->numer,
 			lookup_table_index_ptr->denom).value) {
 			value = lookup_table_index_ptr->reg_value;
@@ -1545,7 +1546,7 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct fixed31_32 ratio,
 	}
 	return value;
 }
-uint32_t spl_get_v_bf3_mode(struct fixed31_32 ratio)
+uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
@@ -1554,7 +1555,7 @@ uint32_t spl_get_v_bf3_mode(struct fixed31_32 ratio)
 		easf_v_bf3_mode_lookup, num_entries);
 	return value;
 }
-uint32_t spl_get_h_bf3_mode(struct fixed31_32 ratio)
+uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
@@ -1563,7 +1564,7 @@ uint32_t spl_get_h_bf3_mode(struct fixed31_32 ratio)
 		easf_h_bf3_mode_lookup, num_entries);
 	return value;
 }
-uint32_t spl_get_reducer_gain6(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1582,7 +1583,7 @@ uint32_t spl_get_reducer_gain6(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_reducer_gain4(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1601,7 +1602,7 @@ uint32_t spl_get_reducer_gain4(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_gainRing6(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1620,7 +1621,7 @@ uint32_t spl_get_gainRing6(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_gainRing4(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1639,7 +1640,7 @@ uint32_t spl_get_gainRing4(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1653,7 +1654,7 @@ uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_uptilt_maxval(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1667,7 +1668,7 @@ uint32_t spl_get_3tap_uptilt_maxval(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_dntilt_slope(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1681,7 +1682,7 @@ uint32_t spl_get_3tap_dntilt_slope(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_uptilt1_slope(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1695,7 +1696,7 @@ uint32_t spl_get_3tap_uptilt1_slope(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_uptilt2_slope(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
@@ -1709,7 +1710,7 @@ uint32_t spl_get_3tap_uptilt2_slope(int taps, struct fixed31_32 ratio)
 		value = 0;
 	return value;
 }
-uint32_t spl_get_3tap_uptilt2_offset(int taps, struct fixed31_32 ratio)
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
 	unsigned int num_entries;
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
index 542b5ce1a385..8bb2b8108e38 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
@@ -14,25 +14,25 @@ struct scale_ratio_to_reg_value_lookup {
 };
 
 void spl_init_easf_filter_coeffs(void);
-uint16_t *spl_get_easf_filter_3tap_64p(struct fixed31_32 ratio);
-uint16_t *spl_get_easf_filter_4tap_64p(struct fixed31_32 ratio);
-uint16_t *spl_get_easf_filter_6tap_64p(struct fixed31_32 ratio);
-uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_3tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_4tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_6tap_64p(struct spl_fixed31_32 ratio);
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio);
 void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
 	const struct spl_scaler_data *data, bool enable_easf_v,
 	bool enable_easf_h);
 
-uint32_t spl_get_v_bf3_mode(struct fixed31_32 ratio);
-uint32_t spl_get_h_bf3_mode(struct fixed31_32 ratio);
-uint32_t spl_get_reducer_gain6(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_reducer_gain4(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_gainRing6(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_gainRing4(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_uptilt_maxval(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_dntilt_slope(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_uptilt1_slope(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_uptilt2_slope(int taps, struct fixed31_32 ratio);
-uint32_t spl_get_3tap_uptilt2_offset(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio);
+uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio);
+uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio);
 
 #endif /* __DC_SPL_SCL_EASF_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
index 156f8171e44f..b9a7b77a7167 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
@@ -3,6 +3,7 @@
 // Copyright 2024 Advanced Micro Devices, Inc.
 
 #include "dc_spl_types.h"
+#include "spl_debug.h"
 #include "dc_spl_scl_filters.h"
 //=========================================
 // <num_taps>    = 2
@@ -1318,97 +1319,97 @@ static const uint16_t filter_8tap_64p_183[264] = {
 		0x3FD4, 0x3F84, 0x0214, 0x0694, 0x0694, 0x0214, 0x3F84, 0x3FD4
 };
 
-const uint16_t *spl_get_filter_3tap_16p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_3tap_16p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_3tap_16p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_3tap_16p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_3tap_16p_149;
 	else
 		return filter_3tap_16p_183;
 }
 
-const uint16_t *spl_get_filter_3tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_3tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_3tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_3tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_3tap_64p_149;
 	else
 		return filter_3tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_4tap_16p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_4tap_16p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_4tap_16p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_4tap_16p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_4tap_16p_149;
 	else
 		return filter_4tap_16p_183;
 }
 
-const uint16_t *spl_get_filter_4tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_4tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_4tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_4tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_4tap_64p_149;
 	else
 		return filter_4tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_5tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_5tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_5tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_5tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_5tap_64p_149;
 	else
 		return filter_5tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_6tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_6tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_6tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_6tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_6tap_64p_149;
 	else
 		return filter_6tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_7tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_7tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_7tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_7tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_7tap_64p_149;
 	else
 		return filter_7tap_64p_183;
 }
 
-const uint16_t *spl_get_filter_8tap_64p(struct fixed31_32 ratio)
+const uint16_t *spl_get_filter_8tap_64p(struct spl_fixed31_32 ratio)
 {
-	if (ratio.value < dc_fixpt_one.value)
+	if (ratio.value < spl_fixpt_one.value)
 		return filter_8tap_64p_upscale;
-	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(4, 3).value)
 		return filter_8tap_64p_116;
-	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
+	else if (ratio.value < spl_fixpt_from_fraction(5, 3).value)
 		return filter_8tap_64p_149;
 	else
 		return filter_8tap_64p_183;
@@ -1424,7 +1425,7 @@ const uint16_t *spl_get_filter_2tap_64p(void)
 	return filter_2tap_64p;
 }
 
-const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio)
 {
 	if (taps == 8)
 		return spl_get_filter_8tap_64p(ratio);
@@ -1444,7 +1445,7 @@ const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio
 		return NULL;
 	else {
 		/* should never happen, bug */
-		BREAK_TO_DEBUGGER();
+		SPL_BREAK_TO_DEBUGGER();
 		return NULL;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
index 27590846d92a..48202bc4f81e 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
@@ -7,16 +7,16 @@
 
 #include "dc_spl_types.h"
 
-const uint16_t *spl_get_filter_3tap_16p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_3tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_4tap_16p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_4tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_5tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_6tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_7tap_64p(struct fixed31_32 ratio);
-const uint16_t *spl_get_filter_8tap_64p(struct fixed31_32 ratio);
+const uint16_t *spl_get_filter_3tap_16p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_3tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_4tap_16p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_4tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_5tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_6tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_7tap_64p(struct spl_fixed31_32 ratio);
+const uint16_t *spl_get_filter_8tap_64p(struct spl_fixed31_32 ratio);
 const uint16_t *spl_get_filter_2tap_16p(void);
 const uint16_t *spl_get_filter_2tap_64p(void);
-const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio);
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct spl_fixed31_32 ratio);
 
 #endif /* __DC_SPL_SCL_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
index 865e2095ed0d..3c81b8ac4745 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
@@ -2,15 +2,15 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-#include "os_types.h"
-#include "dc_hw_types.h"
-#ifndef ASSERT
-#define ASSERT(_bool) (void *)0
-#endif
-#include "include/fixed31_32.h"	// fixed31_32 and related functions
 #ifndef __DC_SPL_TYPES_H__
 #define __DC_SPL_TYPES_H__
 
+#include "spl_os_types.h"   // swap
+#ifndef SPL_ASSERT
+#define SPL_ASSERT(_bool) (void *)0
+#endif
+#include "spl_fixpt31_32.h"	// fixed31_32 and related functions
+
 enum lb_memory_config {
 	/* Enable all 3 pieces of memory */
 	LB_MEMORY_CONFIG_0 = 0,
@@ -39,16 +39,16 @@ struct spl_rect	{
 };
 
 struct spl_ratios {
-	struct fixed31_32 horz;
-	struct fixed31_32 vert;
-	struct fixed31_32 horz_c;
-	struct fixed31_32 vert_c;
+	struct spl_fixed31_32 horz;
+	struct spl_fixed31_32 vert;
+	struct spl_fixed31_32 horz_c;
+	struct spl_fixed31_32 vert_c;
 };
 struct spl_inits {
-	struct fixed31_32 h;
-	struct fixed31_32 h_c;
-	struct fixed31_32 v;
-	struct fixed31_32 v_c;
+	struct spl_fixed31_32 h;
+	struct spl_fixed31_32 h_c;
+	struct spl_fixed31_32 v;
+	struct spl_fixed31_32 v_c;
 };
 
 struct spl_taps	{
@@ -409,10 +409,15 @@ struct dscl_prog_data {
 };
 
 /* SPL input and output definitions */
-// SPL outputs struct
-struct spl_out	{
+// SPL scratch struct
+struct spl_scratch {
 	// Pack all SPL outputs in scl_data
 	struct spl_scaler_data scl_data;
+};
+
+/* SPL input and output definitions */
+// SPL outputs struct
+struct spl_out	{
 	// Pack all output need to program hw registers
 	struct dscl_prog_data *dscl_prog_data;
 };
@@ -497,6 +502,8 @@ struct spl_in	{
 	struct spl_debug debug;
 	bool is_fullscreen;
 	bool is_hdr_on;
+	int h_active;
+	int v_active;
 };
 // end of SPL inputs
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
new file mode 100644
index 000000000000..a36239ab8d1c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
@@ -0,0 +1,23 @@
+/* Copyright � 1997-2004 Advanced Micro Devices, Inc. All rights reserved. */
+
+#ifndef SPL_DEBUG_H
+#define SPL_DEBUG_H
+
+#ifdef SPL_ASSERT
+#undef SPL_ASSERT
+#endif
+#define SPL_ASSERT(b)
+
+#define SPL_ASSERT_CRITICAL(expr)  do {if (expr)/* Do nothing */; } while (0)
+
+#ifdef SPL_DALMSG
+#undef SPL_DALMSG
+#endif
+#define SPL_DALMSG(b)
+
+#ifdef SPL_DAL_ASSERT_MSG
+#undef SPL_DAL_ASSERT_MSG
+#endif
+#define SPL_DAL_ASSERT_MSG(b, m)
+
+#endif  // SPL_DEBUG_H
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
new file mode 100644
index 000000000000..2bb1de88aef7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -0,0 +1,518 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
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
+#include "spl_fixpt31_32.h"
+
+static const struct spl_fixed31_32 spl_fixpt_two_pi = { 26986075409LL };
+static const struct spl_fixed31_32 spl_fixpt_ln2 = { 2977044471LL };
+static const struct spl_fixed31_32 spl_fixpt_ln2_div_2 = { 1488522236LL };
+
+static inline unsigned long long abs_i64(
+	long long arg)
+{
+	if (arg > 0)
+		return (unsigned long long)arg;
+	else
+		return (unsigned long long)(-arg);
+}
+
+/*
+ * @brief
+ * result = dividend / divisor
+ * *remainder = dividend % divisor
+ */
+static inline unsigned long long complete_integer_division_u64(
+	unsigned long long dividend,
+	unsigned long long divisor,
+	unsigned long long *remainder)
+{
+	unsigned long long result;
+
+	ASSERT(divisor);
+
+	result = spl_div64_u64_rem(dividend, divisor, remainder);
+
+	return result;
+}
+
+
+#define FRACTIONAL_PART_MASK \
+	((1ULL << FIXED31_32_BITS_PER_FRACTIONAL_PART) - 1)
+
+#define GET_INTEGER_PART(x) \
+	((x) >> FIXED31_32_BITS_PER_FRACTIONAL_PART)
+
+#define GET_FRACTIONAL_PART(x) \
+	(FRACTIONAL_PART_MASK & (x))
+
+struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long denominator)
+{
+	struct spl_fixed31_32 res;
+
+	bool arg1_negative = numerator < 0;
+	bool arg2_negative = denominator < 0;
+
+	unsigned long long arg1_value = arg1_negative ? -numerator : numerator;
+	unsigned long long arg2_value = arg2_negative ? -denominator : denominator;
+
+	unsigned long long remainder;
+
+	/* determine integer part */
+
+	unsigned long long res_value = complete_integer_division_u64(
+		arg1_value, arg2_value, &remainder);
+
+	ASSERT(res_value <= LONG_MAX);
+
+	/* determine fractional part */
+	{
+		unsigned int i = FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+		do {
+			remainder <<= 1;
+
+			res_value <<= 1;
+
+			if (remainder >= arg2_value) {
+				res_value |= 1;
+				remainder -= arg2_value;
+			}
+		} while (--i != 0);
+	}
+
+	/* round up LSB */
+	{
+		unsigned long long summand = (remainder << 1) >= arg2_value;
+
+		ASSERT(res_value <= LLONG_MAX - summand);
+
+		res_value += summand;
+	}
+
+	res.value = (long long)res_value;
+
+	if (arg1_negative ^ arg2_negative)
+		res.value = -res.value;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	bool arg1_negative = arg1.value < 0;
+	bool arg2_negative = arg2.value < 0;
+
+	unsigned long long arg1_value = arg1_negative ? -arg1.value : arg1.value;
+	unsigned long long arg2_value = arg2_negative ? -arg2.value : arg2.value;
+
+	unsigned long long arg1_int = GET_INTEGER_PART(arg1_value);
+	unsigned long long arg2_int = GET_INTEGER_PART(arg2_value);
+
+	unsigned long long arg1_fra = GET_FRACTIONAL_PART(arg1_value);
+	unsigned long long arg2_fra = GET_FRACTIONAL_PART(arg2_value);
+
+	unsigned long long tmp;
+
+	res.value = arg1_int * arg2_int;
+
+	ASSERT(res.value <= (long long)LONG_MAX);
+
+	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	tmp = arg1_int * arg2_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg2_int * arg1_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg1_fra * arg2_fra;
+
+	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
+		(tmp >= (unsigned long long)spl_fixpt_half.value);
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	if (arg1_negative ^ arg2_negative)
+		res.value = -res.value;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res;
+
+	unsigned long long arg_value = abs_i64(arg.value);
+
+	unsigned long long arg_int = GET_INTEGER_PART(arg_value);
+
+	unsigned long long arg_fra = GET_FRACTIONAL_PART(arg_value);
+
+	unsigned long long tmp;
+
+	res.value = arg_int * arg_int;
+
+	ASSERT(res.value <= (long long)LONG_MAX);
+
+	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	tmp = arg_int * arg_fra;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	tmp = arg_fra * arg_fra;
+
+	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
+		(tmp >= (unsigned long long)spl_fixpt_half.value);
+
+	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+
+	res.value += tmp;
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg)
+{
+	/*
+	 * @note
+	 * Good idea to use Newton's method
+	 */
+
+	ASSERT(arg.value);
+
+	return spl_fixpt_from_fraction(
+		spl_fixpt_one.value,
+		arg.value);
+}
+
+struct spl_fixed31_32 spl_fixpt_sinc(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 square;
+
+	struct spl_fixed31_32 res = spl_fixpt_one;
+
+	int n = 27;
+
+	struct spl_fixed31_32 arg_norm = arg;
+
+	if (spl_fixpt_le(
+		spl_fixpt_two_pi,
+		spl_fixpt_abs(arg))) {
+		arg_norm = spl_fixpt_sub(
+			arg_norm,
+			spl_fixpt_mul_int(
+				spl_fixpt_two_pi,
+				(int)spl_div64_s64(
+					arg_norm.value,
+					spl_fixpt_two_pi.value)));
+	}
+
+	square = spl_fixpt_sqr(arg_norm);
+
+	do {
+		res = spl_fixpt_sub(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					square,
+					res),
+				n * (n - 1)));
+
+		n -= 2;
+	} while (n > 2);
+
+	if (arg.value != arg_norm.value)
+		res = spl_fixpt_div(
+			spl_fixpt_mul(res, arg_norm),
+			arg);
+
+	return res;
+}
+
+struct spl_fixed31_32 spl_fixpt_sin(struct spl_fixed31_32 arg)
+{
+	return spl_fixpt_mul(
+		arg,
+		spl_fixpt_sinc(arg));
+}
+
+struct spl_fixed31_32 spl_fixpt_cos(struct spl_fixed31_32 arg)
+{
+	/* TODO implement argument normalization */
+
+	const struct spl_fixed31_32 square = spl_fixpt_sqr(arg);
+
+	struct spl_fixed31_32 res = spl_fixpt_one;
+
+	int n = 26;
+
+	do {
+		res = spl_fixpt_sub(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					square,
+					res),
+				n * (n - 1)));
+
+		n -= 2;
+	} while (n != 0);
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = exp(arg),
+ * where abs(arg) < 1
+ *
+ * Calculated as Taylor series.
+ */
+static struct spl_fixed31_32 fixed31_32_exp_from_taylor_series(struct spl_fixed31_32 arg)
+{
+	unsigned int n = 9;
+
+	struct spl_fixed31_32 res = spl_fixpt_from_fraction(
+		n + 2,
+		n + 1);
+	/* TODO find correct res */
+
+	ASSERT(spl_fixpt_lt(arg, spl_fixpt_one));
+
+	do
+		res = spl_fixpt_add(
+			spl_fixpt_one,
+			spl_fixpt_div_int(
+				spl_fixpt_mul(
+					arg,
+					res),
+				n));
+	while (--n != 1);
+
+	return spl_fixpt_add(
+		spl_fixpt_one,
+		spl_fixpt_mul(
+			arg,
+			res));
+}
+
+struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg)
+{
+	/*
+	 * @brief
+	 * Main equation is:
+	 * exp(x) = exp(r + m * ln(2)) = (1 << m) * exp(r),
+	 * where m = round(x / ln(2)), r = x - m * ln(2)
+	 */
+
+	if (spl_fixpt_le(
+		spl_fixpt_ln2_div_2,
+		spl_fixpt_abs(arg))) {
+		int m = spl_fixpt_round(
+			spl_fixpt_div(
+				arg,
+				spl_fixpt_ln2));
+
+		struct spl_fixed31_32 r = spl_fixpt_sub(
+			arg,
+			spl_fixpt_mul_int(
+				spl_fixpt_ln2,
+				m));
+
+		ASSERT(m != 0);
+
+		ASSERT(spl_fixpt_lt(
+			spl_fixpt_abs(r),
+			spl_fixpt_one));
+
+		if (m > 0)
+			return spl_fixpt_shl(
+				fixed31_32_exp_from_taylor_series(r),
+				(unsigned char)m);
+		else
+			return spl_fixpt_div_int(
+				fixed31_32_exp_from_taylor_series(r),
+				1LL << -m);
+	} else if (arg.value != 0)
+		return fixed31_32_exp_from_taylor_series(arg);
+	else
+		return spl_fixpt_one;
+}
+
+struct spl_fixed31_32 spl_fixpt_log(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res = spl_fixpt_neg(spl_fixpt_one);
+	/* TODO improve 1st estimation */
+
+	struct spl_fixed31_32 error;
+
+	ASSERT(arg.value > 0);
+	/* TODO if arg is negative, return NaN */
+	/* TODO if arg is zero, return -INF */
+
+	do {
+		struct spl_fixed31_32 res1 = spl_fixpt_add(
+			spl_fixpt_sub(
+				res,
+				spl_fixpt_one),
+			spl_fixpt_div(
+				arg,
+				spl_fixpt_exp(res)));
+
+		error = spl_fixpt_sub(
+			res,
+			res1);
+
+		res = res1;
+		/* TODO determine max_allowed_error based on quality of exp() */
+	} while (abs_i64(error.value) > 100ULL);
+
+	return res;
+}
+
+
+/* this function is a generic helper to translate fixed point value to
+ * specified integer format that will consist of integer_bits integer part and
+ * fractional_bits fractional part. For example it is used in
+ * spl_fixpt_u2d19 to receive 2 bits integer part and 19 bits fractional
+ * part in 32 bits. It is used in hw programming (scaler)
+ */
+
+static inline unsigned int ux_dy(
+	long long value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	/* 1. create mask of integer part */
+	unsigned int result = (1 << integer_bits) - 1;
+	/* 2. mask out fractional part */
+	unsigned int fractional_part = FRACTIONAL_PART_MASK & value;
+	/* 3. shrink fixed point integer part to be of integer_bits width*/
+	result &= GET_INTEGER_PART(value);
+	/* 4. make space for fractional part to be filled in after integer */
+	result <<= fractional_bits;
+	/* 5. shrink fixed point fractional part to of fractional_bits width*/
+	fractional_part >>= FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits;
+	/* 6. merge the result */
+	return result | fractional_part;
+}
+
+static inline unsigned int clamp_ux_dy(
+	long long value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits,
+	unsigned int min_clamp)
+{
+	unsigned int truncated_val = ux_dy(value, integer_bits, fractional_bits);
+
+	if (value >= (1LL << (integer_bits + FIXED31_32_BITS_PER_FRACTIONAL_PART)))
+		return (1 << (integer_bits + fractional_bits)) - 1;
+	else if (truncated_val > min_clamp)
+		return truncated_val;
+	else
+		return min_clamp;
+}
+
+unsigned int spl_fixpt_u4d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 4, 19);
+}
+
+unsigned int spl_fixpt_u3d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 3, 19);
+}
+
+unsigned int spl_fixpt_u2d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 2, 19);
+}
+
+unsigned int spl_fixpt_u0d19(struct spl_fixed31_32 arg)
+{
+	return ux_dy(arg.value, 0, 19);
+}
+
+unsigned int spl_fixpt_clamp_u0d14(struct spl_fixed31_32 arg)
+{
+	return clamp_ux_dy(arg.value, 0, 14, 1);
+}
+
+unsigned int spl_fixpt_clamp_u0d10(struct spl_fixed31_32 arg)
+{
+	return clamp_ux_dy(arg.value, 0, 10, 1);
+}
+
+int spl_fixpt_s4d19(struct spl_fixed31_32 arg)
+{
+	if (arg.value < 0)
+		return -(int)ux_dy(spl_fixpt_abs(arg).value, 4, 19);
+	else
+		return ux_dy(arg.value, 4, 19);
+}
+
+struct spl_fixed31_32 spl_fixpt_from_ux_dy(unsigned int value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct spl_fixed31_32 fixpt_value = spl_fixpt_zero;
+	struct spl_fixed31_32 fixpt_int_value = spl_fixpt_zero;
+	long long frac_mask = ((long long)1 << (long long)integer_bits) - 1;
+
+	fixpt_value.value = (long long)value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	frac_mask = frac_mask << fractional_bits;
+	fixpt_int_value.value = value & frac_mask;
+	fixpt_int_value.value <<= (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	fixpt_value.value |= fixpt_int_value.value;
+	return fixpt_value;
+}
+
+struct spl_fixed31_32 spl_fixpt_from_int_dy(unsigned int int_value,
+	unsigned int frac_value,
+	unsigned int integer_bits,
+	unsigned int fractional_bits)
+{
+	struct spl_fixed31_32 fixpt_value = spl_fixpt_from_int(int_value);
+
+	fixpt_value.value |= (long long)frac_value << (FIXED31_32_BITS_PER_FRACTIONAL_PART - fractional_bits);
+	return fixpt_value;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
new file mode 100644
index 000000000000..27ec6d416b7c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
@@ -0,0 +1,546 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
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
+#ifndef __SPL_FIXED31_32_H__
+#define __SPL_FIXED31_32_H__
+
+#include "os_types.h"
+#include "spl_os_types.h"   // swap
+#ifndef ASSERT
+#define ASSERT(_bool) ((void *)0)
+#endif
+
+#ifndef LLONG_MAX
+#define LLONG_MAX 9223372036854775807ll
+#endif
+#ifndef LLONG_MIN
+#define LLONG_MIN (-LLONG_MAX - 1ll)
+#endif
+
+#define FIXED31_32_BITS_PER_FRACTIONAL_PART 32
+#ifndef LLONG_MIN
+#define LLONG_MIN (1LL<<63)
+#endif
+#ifndef LLONG_MAX
+#define LLONG_MAX (-1LL>>1)
+#endif
+
+/*
+ * @brief
+ * Arithmetic operations on real numbers
+ * represented as fixed-point numbers.
+ * There are: 1 bit for sign,
+ * 31 bit for integer part,
+ * 32 bits for fractional part.
+ *
+ * @note
+ * Currently, overflows and underflows are asserted;
+ * no special result returned.
+ */
+
+struct spl_fixed31_32 {
+	long long value;
+};
+
+
+/*
+ * @brief
+ * Useful constants
+ */
+
+static const struct spl_fixed31_32 spl_fixpt_zero = { 0 };
+static const struct spl_fixed31_32 spl_fixpt_epsilon = { 1LL };
+static const struct spl_fixed31_32 spl_fixpt_half = { 0x80000000LL };
+static const struct spl_fixed31_32 spl_fixpt_one = { 0x100000000LL };
+
+/*
+ * @brief
+ * Initialization routines
+ */
+
+/*
+ * @brief
+ * result = numerator / denominator
+ */
+struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long denominator);
+
+/*
+ * @brief
+ * result = arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_from_int(int arg)
+{
+	struct spl_fixed31_32 res;
+
+	res.value = (long long) arg << FIXED31_32_BITS_PER_FRACTIONAL_PART;
+
+	return res;
+}
+
+/*
+ * @brief
+ * Unary operators
+ */
+
+/*
+ * @brief
+ * result = -arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_neg(struct spl_fixed31_32 arg)
+{
+	struct spl_fixed31_32 res;
+
+	res.value = -arg.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = abs(arg) := (arg >= 0) ? arg : -arg
+ */
+static inline struct spl_fixed31_32 spl_fixpt_abs(struct spl_fixed31_32 arg)
+{
+	if (arg.value < 0)
+		return spl_fixpt_neg(arg);
+	else
+		return arg;
+}
+
+/*
+ * @brief
+ * Binary relational operators
+ */
+
+/*
+ * @brief
+ * result = arg1 < arg2
+ */
+static inline bool spl_fixpt_lt(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value < arg2.value;
+}
+
+/*
+ * @brief
+ * result = arg1 <= arg2
+ */
+static inline bool spl_fixpt_le(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value <= arg2.value;
+}
+
+/*
+ * @brief
+ * result = arg1 == arg2
+ */
+static inline bool spl_fixpt_eq(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return arg1.value == arg2.value;
+}
+
+/*
+ * @brief
+ * result = min(arg1, arg2) := (arg1 <= arg2) ? arg1 : arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_min(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value <= arg2.value)
+		return arg1;
+	else
+		return arg2;
+}
+
+/*
+ * @brief
+ * result = max(arg1, arg2) := (arg1 <= arg2) ? arg2 : arg1
+ */
+static inline struct spl_fixed31_32 spl_fixpt_max(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value <= arg2.value)
+		return arg2;
+	else
+		return arg1;
+}
+
+/*
+ * @brief
+ *          | min_value, when arg <= min_value
+ * result = | arg, when min_value < arg < max_value
+ *          | max_value, when arg >= max_value
+ */
+static inline struct spl_fixed31_32 spl_fixpt_clamp(
+	struct spl_fixed31_32 arg,
+	struct spl_fixed31_32 min_value,
+	struct spl_fixed31_32 max_value)
+{
+	if (spl_fixpt_le(arg, min_value))
+		return min_value;
+	else if (spl_fixpt_le(max_value, arg))
+		return max_value;
+	else
+		return arg;
+}
+
+/*
+ * @brief
+ * Binary shift operators
+ */
+
+/*
+ * @brief
+ * result = arg << shift
+ */
+static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, unsigned char shift)
+{
+	ASSERT(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
+		((arg.value < 0) && (arg.value >= ~(LLONG_MAX >> shift))));
+
+	arg.value = arg.value << shift;
+
+	return arg;
+}
+
+/*
+ * @brief
+ * result = arg >> shift
+ */
+static inline struct spl_fixed31_32 spl_fixpt_shr(struct spl_fixed31_32 arg, unsigned char shift)
+{
+	bool negative = arg.value < 0;
+
+	if (negative)
+		arg.value = -arg.value;
+	arg.value = arg.value >> shift;
+	if (negative)
+		arg.value = -arg.value;
+	return arg;
+}
+
+/*
+ * @brief
+ * Binary additive operators
+ */
+
+/*
+ * @brief
+ * result = arg1 + arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_add(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	ASSERT(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
+		((arg1.value < 0) && (LLONG_MIN - arg1.value <= arg2.value)));
+
+	res.value = arg1.value + arg2.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = arg1 + arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_add_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_add(arg1, spl_fixpt_from_int(arg2));
+}
+
+/*
+ * @brief
+ * result = arg1 - arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_sub(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	struct spl_fixed31_32 res;
+
+	ASSERT(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
+		((arg2.value < 0) && (LLONG_MAX + arg2.value >= arg1.value)));
+
+	res.value = arg1.value - arg2.value;
+
+	return res;
+}
+
+/*
+ * @brief
+ * result = arg1 - arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_sub_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_sub(arg1, spl_fixpt_from_int(arg2));
+}
+
+
+/*
+ * @brief
+ * Binary multiplicative operators
+ */
+
+/*
+ * @brief
+ * result = arg1 * arg2
+ */
+struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2);
+
+
+/*
+ * @brief
+ * result = arg1 * arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_mul_int(struct spl_fixed31_32 arg1, int arg2)
+{
+	return spl_fixpt_mul(arg1, spl_fixpt_from_int(arg2));
+}
+
+/*
+ * @brief
+ * result = square(arg) := arg * arg
+ */
+struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = arg1 / arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_div_int(struct spl_fixed31_32 arg1, long long arg2)
+{
+	return spl_fixpt_from_fraction(arg1.value, spl_fixpt_from_int((int)arg2).value);
+}
+
+/*
+ * @brief
+ * result = arg1 / arg2
+ */
+static inline struct spl_fixed31_32 spl_fixpt_div(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	return spl_fixpt_from_fraction(arg1.value, arg2.value);
+}
+
+/*
+ * @brief
+ * Reciprocal function
+ */
+
+/*
+ * @brief
+ * result = reciprocal(arg) := 1 / arg
+ *
+ * @note
+ * No special actions taken in case argument is zero.
+ */
+struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Trigonometric functions
+ */
+
+/*
+ * @brief
+ * result = sinc(arg) := sin(arg) / arg
+ *
+ * @note
+ * Argument specified in radians,
+ * internally it's normalized to [-2pi...2pi] range.
+ */
+struct spl_fixed31_32 spl_fixpt_sinc(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = sin(arg)
+ *
+ * @note
+ * Argument specified in radians,
+ * internally it's normalized to [-2pi...2pi] range.
+ */
+struct spl_fixed31_32 spl_fixpt_sin(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = cos(arg)
+ *
+ * @note
+ * Argument specified in radians
+ * and should be in [-2pi...2pi] range -
+ * passing arguments outside that range
+ * will cause incorrect result!
+ */
+struct spl_fixed31_32 spl_fixpt_cos(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Transcendent functions
+ */
+
+/*
+ * @brief
+ * result = exp(arg)
+ *
+ * @note
+ * Currently, function is verified for abs(arg) <= 1.
+ */
+struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * result = log(arg)
+ *
+ * @note
+ * Currently, abs(arg) should be less than 1.
+ * No normalization is done.
+ * Currently, no special actions taken
+ * in case of invalid argument(s). Take care!
+ */
+struct spl_fixed31_32 spl_fixpt_log(struct spl_fixed31_32 arg);
+
+/*
+ * @brief
+ * Power function
+ */
+
+/*
+ * @brief
+ * result = pow(arg1, arg2)
+ *
+ * @note
+ * Currently, abs(arg1) should be less than 1. Take care!
+ */
+static inline struct spl_fixed31_32 spl_fixpt_pow(struct spl_fixed31_32 arg1, struct spl_fixed31_32 arg2)
+{
+	if (arg1.value == 0)
+		return arg2.value == 0 ? spl_fixpt_one : spl_fixpt_zero;
+
+	return spl_fixpt_exp(
+		spl_fixpt_mul(
+			spl_fixpt_log(arg1),
+			arg2));
+}
+
+/*
+ * @brief
+ * Rounding functions
+ */
+
+/*
+ * @brief
+ * result = floor(arg) := greatest integer lower than or equal to arg
+ */
+static inline int spl_fixpt_floor(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/*
+ * @brief
+ * result = round(arg) := integer nearest to arg
+ */
+static inline int spl_fixpt_round(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	const long long summand = spl_fixpt_half.value;
+
+	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+
+	arg_value += summand;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/*
+ * @brief
+ * result = ceil(arg) := lowest integer greater than or equal to arg
+ */
+static inline int spl_fixpt_ceil(struct spl_fixed31_32 arg)
+{
+	unsigned long long arg_value = arg.value > 0 ? arg.value : -arg.value;
+
+	const long long summand = spl_fixpt_one.value -
+		spl_fixpt_epsilon.value;
+
+	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+
+	arg_value += summand;
+
+	if (arg.value >= 0)
+		return (int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+	else
+		return -(int)(arg_value >> FIXED31_32_BITS_PER_FRACTIONAL_PART);
+}
+
+/* the following two function are used in scaler hw programming to convert fixed
+ * point value to format 2 bits from integer part and 19 bits from fractional
+ * part. The same applies for u0d19, 0 bits from integer part and 19 bits from
+ * fractional
+ */
+
+unsigned int spl_fixpt_u4d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u3d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u2d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_u0d19(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_clamp_u0d14(struct spl_fixed31_32 arg);
+
+unsigned int spl_fixpt_clamp_u0d10(struct spl_fixed31_32 arg);
+
+int spl_fixpt_s4d19(struct spl_fixed31_32 arg);
+
+static inline struct spl_fixed31_32 spl_fixpt_truncate(struct spl_fixed31_32 arg, unsigned int frac_bits)
+{
+	bool negative = arg.value < 0;
+
+	if (frac_bits >= FIXED31_32_BITS_PER_FRACTIONAL_PART) {
+		ASSERT(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
+		return arg;
+	}
+
+	if (negative)
+		arg.value = -arg.value;
+	arg.value &= (~0ULL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
+	if (negative)
+		arg.value = -arg.value;
+	return arg;
+}
+
+struct spl_fixed31_32 spl_fixpt_from_ux_dy(unsigned int value, unsigned int integer_bits, unsigned int fractional_bits);
+struct spl_fixed31_32 spl_fixpt_from_int_dy(unsigned int int_value,
+		unsigned int frac_value,
+		unsigned int integer_bits,
+		unsigned int fractional_bits);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h b/drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h
new file mode 100644
index 000000000000..7ebea91c84f6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h
@@ -0,0 +1,77 @@
+/*
+ * Copyright 2012-16 Advanced Micro Devices, Inc.
+ * Copyright 2019 Raptor Engineering, LLC
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
+#ifndef _SPL_OS_TYPES_H_
+#define _SPL_OS_TYPES_H_
+
+#include <linux/slab.h>
+#include <linux/kgdb.h>
+#include <linux/kref.h>
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <linux/mm.h>
+
+/*
+ *
+ * general debug capabilities
+ *
+ */
+// TODO: need backport
+#define SPL_BREAK_TO_DEBUGGER() ASSERT(0)
+
+static inline uint64_t spl_div_u64_rem(uint64_t dividend, uint32_t divisor, uint32_t *remainder)
+{
+	return div_u64_rem(dividend, divisor, remainder);
+}
+
+static inline uint64_t spl_div_u64(uint64_t dividend, uint32_t divisor)
+{
+	return div_u64(dividend, divisor);
+}
+
+static inline uint64_t spl_div64_u64(uint64_t dividend, uint64_t divisor)
+{
+	return div64_u64(dividend, divisor);
+}
+
+static inline uint64_t spl_div64_u64_rem(uint64_t dividend, uint64_t divisor, uint64_t *remainder)
+{
+	return div64_u64_rem(dividend, divisor, remainder);
+}
+
+static inline int64_t spl_div64_s64(int64_t dividend, int64_t divisor)
+{
+	return div64_s64(dividend, divisor);
+}
+
+#define spl_swap(a, b) \
+	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+
+#ifndef spl_min
+#define spl_min(a, b)    (((a) < (b)) ? (a):(b))
+#endif
+
+#endif /* _SPL_OS_TYPES_H_ */
diff --git a/drivers/gpu/drm/amd/display/include/fixed31_32.h b/drivers/gpu/drm/amd/display/include/fixed31_32.h
index d4cf7ead1d87..990fa1f19c22 100644
--- a/drivers/gpu/drm/amd/display/include/fixed31_32.h
+++ b/drivers/gpu/drm/amd/display/include/fixed31_32.h
@@ -531,4 +531,10 @@ static inline struct fixed31_32 dc_fixpt_truncate(struct fixed31_32 arg, unsigne
 	return arg;
 }
 
+struct fixed31_32 dc_fixpt_from_ux_dy(unsigned int value, unsigned int integer_bits, unsigned int fractional_bits);
+struct fixed31_32 dc_fixpt_from_int_dy(unsigned int int_value,
+		unsigned int frac_value,
+		unsigned int integer_bits,
+		unsigned int fractional_bits);
+
 #endif
-- 
2.34.1

