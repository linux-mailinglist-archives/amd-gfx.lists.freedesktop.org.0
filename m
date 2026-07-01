Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4m+BK9dzRGokvAoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 03:56:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33706E9235
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 03:56:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=pI02frqs;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBF10E1DF;
	Wed,  1 Jul 2026 01:56:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC0210E1DF
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 01:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl1YorDXdrCWbz94YdEDRjIzUlypTGYrmbJlHwvbwOLuMHLeF+SAoljKr0ZMWdZuozwIwszyJsa7VoqTdyj8lkSYsYBQ/ja+yc0YCisJKTNqmpWhSENINNOCXCJw/3pNpP+fhKUEK4FC1dKwhSpPrdFFingl74eWYWxSCeB96LPE4XX1mYIURO2iQ1CpGiCjebJ4ICfNYNi62G7BZYBThXbJ6WhxghQUl6+CpaSDPYmdg/l+aiJmnvDKQFnfch/dvI4LJ+rIzq1bxW1Fd/+xKSrZL1Lz1BhTbKwVaWcXw0XVJTRf9wxPlwlEm3rv5F0/tH5jiIr8ci4+2hunj5qBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=of2TxvcPRifli9UAkUYKVq0yQX6wTT3j/bWZ0hMR9Fs=;
 b=mD1WCURxwipKFgs8nQv2qbVLG4T5ILNXP6WNu9kTYAIRAWQm7g45TgjZ1An+uM332u1Q3Ir3hHavE6liyMoCqLCB1KzySNeBNEPr9u2ylJghr0xySNCBtGEe1SpnWbP9ghOuBDKX89nyDh7tTNpC+3i+oADOwIOog7YDW5R4a8TZwlVa1mFJ7i+NGKMJWArqkUcdad/YwYTXwX6rTUeyTbykmggH89pBs+y7Fw82+c5B2FjYGlbW8TiyyTQZBKILJH8nnBMcg9edTK+JOaDEb7U4ESZycUL0n5oTN7BUZ0Qy3IR6e8ewkKl3bWN7C9jH3gerjBXpRq/JCr5tlwnswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=of2TxvcPRifli9UAkUYKVq0yQX6wTT3j/bWZ0hMR9Fs=;
 b=pI02frqs5SO5um3PHKje/5f2M/8shTEB+wn0DJ8AKIy01Ea9E+LJUTakZ4+ukS14arPk3+2mRM+dt8HVj/qxVWcq8bPNCClzQOXhx63rf7ieB98DtzsNOliHNFYRlmgjo93BBXccK6pOOsP5ONv+m/Zm8zGaLVhwFRIIjh8idHQ=
Received: from SJ0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:a03:2c2::14)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 01:56:18 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::83) by SJ0PR13CA0039.outlook.office365.com
 (2603:10b6:a03:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 01:56:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 01:56:17 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 20:56:11 -0500
From: Yang Wang <kevinyang.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <kenneth.feng@amd.com>
Subject: [PATCH] drm/amd/pm: fix smu13 power limit range calculation
Date: Wed, 1 Jul 2026 09:55:58 +0800
Message-ID: <20260701015558.3757481-1-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b36ca1-5989-4c98-f629-08ded713f0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|13003099007|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: KQIjfkd2aRgfvmYNUaVIGRu/wuQAu1VnCKJDuVxhYEo/UfVzPM1LQRitMAGaODPntZdSOzf6K0YJ+LqDbcHI5whXKCnFi9OafYj/gpcQaDu8MBrjXxOOuyYTiB1hQ6v6ZnlZjqmWg2DT1R2x7ZjAVLiKbdtdtQLbX4ClSRd5rcBDqpzRf/ukK9BrsDZBKdCMXFkdJWnedeWc6xoKvDaEGLQL3u8pMT9y/8JWkZb7HDHv0cSZb6h2peCy4GxvmNAHP5fai+UdicpK9UV8CUkqDHCuQoKiD7KkoWsUKvZgcIORlt9XrNBTQ+WYdoey4BOu7XFmUhXE35GLTjPL2DWm+9DmXaJdo0knm0oSbQtV2c+7xZgH+3qc7bdxoZw6uesSfeSWebG8pP3LXiQaknobVGRNN401VVOlaDRSRNnAbB1zK/2IP03XCHdhSs6aICy8LP/curtDYlHt3tVuIIK+AeryaJhMQYSZsdSmVlmlxkeJRPDsxZyxmj3So6PwJ5840Q1Xtim9mrU8lSalqrwSdAmi4JSQlmdBLUkmjjAabwDRnWE04aDwzuKegV4KTGtL2p8/UmnmlktWa9xySIRVzvLrmLHuG3iTTSPGaRm6mgQkjYV70pkCjO+QcK08/GVMrYQpuHWzRbslGKTB95FS5LICqpAyGnbyCVt5Hq6Ut7uB5h26+BZhWS1kwH710fKL16TgkkOSMM40SY9CxRywDA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iFGNE4Btogaaey6C37kxoAFNPZoSJYRp1We/389QV/uVJ7xwJlANGFPDxM66O6SfFbRg1rBtCbxcBN3DvIOcC/c13nFG9bOMptrFk/r7KQC3SjvO01ldu/+VAQ4npdDZZDmPMFM3l9TpQnNgtaslDhu/r/snVc6Qir7EciMTnL2JmNHJZRG0JYCftiC32YKvsw0b5kiVWt0tYxysEN/p9+qyUGIbDbEK6fxV62ex5mCgrYLdJlhQ+YA6aWMxAV8OT1M6MK0WqAJpUtydxpQgKgcGe0Nzr7pBBOk2ZkRrOhQZYbw3Lz0F78Z5cgbyJvgxr9EbXGg7NzJBTjy69mJxoG7Fv24MJiF32LGuH49hGEYWFd2XB2jQFt8dkJPWy3PzNVifgyDv/U20zjhuK2I2+sf/20GY4Ct1Gol/lZ4uDa1WZcuCJTSxtXgjxcP8N34O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 01:56:17.8320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b36ca1-5989-4c98-f629-08ded713f0ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevinyang.wang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A33706E9235

SMU13 reports SocketPowerLimitAc/Dc as the default power limit, but
MsgLimits.Power may carry a different firmware bound for the same PPT
throttler. Using only the socket limit for both min and max can therefore
expose an incorrect power range.

Keep the socket limit as the default, but derive the range from both values:
use the lower value for the min base and the higher value for the max base
before applying OD percentages. Keep the current limit query independent
from the cap calculation.

Fixes: 8c658297a4db ("drm/amd/pm: fix smu13 power limit default/cap calculation")
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5419

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 11 +++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 15 ++++++++-------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index c984dce48310..560cc306f10f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2404,11 +2404,14 @@ static int smu_v13_0_0_get_power_limit(struct smu_context *smu,
 	uint32_t pp_limit = smu->adev->pm.ac_power ?
 			      skutable->SocketPowerLimitAc[PPT_THROTTLER_PPT0] :
 			      skutable->SocketPowerLimitDc[PPT_THROTTLER_PPT0];
-	uint32_t power_limit = 0, od_percent_upper = 0, od_percent_lower = 0;
+	uint32_t msg_limit = skutable->MsgLimits.Power[PPT_THROTTLER_PPT0][POWER_SOURCE_AC];
+	uint32_t min_limit = min_t(uint32_t, pp_limit, msg_limit);
+	uint32_t max_limit = max_t(uint32_t, pp_limit, msg_limit);
+	uint32_t od_percent_upper = 0, od_percent_lower = 0;
 	int ret;
 
 	if (current_power_limit) {
-		ret = smu_v13_0_get_current_power_limit(smu, &power_limit);
+		ret = smu_v13_0_get_current_power_limit(smu, current_power_limit);
 		if (ret)
 			*current_power_limit = pp_limit;
 	}
@@ -2431,12 +2434,12 @@ static int smu_v13_0_0_get_power_limit(struct smu_context *smu,
 		od_percent_upper, od_percent_lower, pp_limit);
 
 	if (max_power_limit) {
-		*max_power_limit = pp_limit * (100 + od_percent_upper);
+		*max_power_limit = max_limit * (100 + od_percent_upper);
 		*max_power_limit /= 100;
 	}
 
 	if (min_power_limit) {
-		*min_power_limit = pp_limit * (100 - od_percent_lower);
+		*min_power_limit = min_limit * (100 - od_percent_lower);
 		*min_power_limit /= 100;
 	}
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 7d0222d3d44d..8f214400cca5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -2386,15 +2386,16 @@ static int smu_v13_0_7_get_power_limit(struct smu_context *smu,
 	uint32_t pp_limit = smu->adev->pm.ac_power ?
 			      skutable->SocketPowerLimitAc[PPT_THROTTLER_PPT0] :
 			      skutable->SocketPowerLimitDc[PPT_THROTTLER_PPT0];
-	uint32_t power_limit = 0, od_percent_upper = 0, od_percent_lower = 0;
+	uint32_t msg_limit = skutable->MsgLimits.Power[PPT_THROTTLER_PPT0][POWER_SOURCE_AC];
+	uint32_t min_limit = min_t(uint32_t, pp_limit, msg_limit);
+	uint32_t max_limit = max_t(uint32_t, pp_limit, msg_limit);
+	uint32_t od_percent_upper = 0, od_percent_lower = 0;
 	int ret;
 
 	if (current_power_limit) {
-		ret = smu_v13_0_get_current_power_limit(smu, &power_limit);
+		ret = smu_v13_0_get_current_power_limit(smu, current_power_limit);
 		if (ret)
-			power_limit = pp_limit;
-
-		*current_power_limit = power_limit;
+			*current_power_limit = pp_limit;
 	}
 
 	if (default_power_limit)
@@ -2415,12 +2416,12 @@ static int smu_v13_0_7_get_power_limit(struct smu_context *smu,
 		od_percent_upper, od_percent_lower, pp_limit);
 
 	if (max_power_limit) {
-		*max_power_limit = pp_limit * (100 + od_percent_upper);
+		*max_power_limit = max_limit * (100 + od_percent_upper);
 		*max_power_limit /= 100;
 	}
 
 	if (min_power_limit) {
-		*min_power_limit = pp_limit * (100 - od_percent_lower);
+		*min_power_limit = min_limit * (100 - od_percent_lower);
 		*min_power_limit /= 100;
 	}
 
-- 
2.47.3

