Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3FEMKxF3MmqP0QUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 12:29:37 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23C6987D4
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 12:29:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=eB6rLKPh;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067710EF7C;
	Wed, 17 Jun 2026 10:29:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20A310EF7C
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 10:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW6AysP9hOih03vkLCL+c/wFOeVdNpS+QewMnuqfGxCJroNIJFU5JSL3v5U0uX3v4nT/E9uGvGhjEqudc49Bk5NqNHWvdSDfNwyogSIfkKtlIHK5Nd05CSHGo6v0NR7jvyAW01F7xJt24eTlWXJIy7kWsV1LGOTUEHsOmWtnpfgh2yyGnsMY1wBWU2ZWgq6VUu8MxnV2GmR2l5neta0CSU7hG+ZryKeA2Cvd+qC71Zrkeuu+xPaUoWC567k8lrZ595zfyNpZ8+TR1zCHB1+PdBrpvtJEdLhl1nx3qgWjphAOfsuD/GKmfFraR+d7yPX/A0aLS5zADLAXcpLusJnqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vw2BBHlfYwAoht56ik8WdeSeiWvbgeZ2rtIeYHXrMg=;
 b=AYsVAF7Q4SVtTwf3HzEMCJzUFN991lPaO2fqRq6icLzJMH67I6WpLYVi84fbuYi91qdXO7dq0limDCm5XeqTByXKyCycNqLBXtcKeB5XXQWli++TfILUjeDTQDR7rr476edab1b7A5yNr0iRwt95a+4U9IVkIbmRRtzvRpkGslh+OGJD6Vl5HGphyt5q3LpmxkwFuQkc6bVrS/InUPDwljCj7MMOVa2uNutaVjWTQDP7sUH1XsN9G/vHqm7VYztEqvrKr0RBUqu4AeVuW+qbOSyYwR2cz8Xv/d47MmoGpqsCd4Hm7Vw85bxcdNZMCRIVxdSdf1+92lVgxENwlXiPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vw2BBHlfYwAoht56ik8WdeSeiWvbgeZ2rtIeYHXrMg=;
 b=eB6rLKPhYEgQzd+UMe9xjN4Af4OvrISvGoCsW1+FNwqOgO4FoFWkKP6DRAgPGT6MjO1+KpNXFaWbnZ7HZ/yKwZTQNHEeHwNoEoYSepHnRtTXFTRMExqf36NltBlNrZIW0uJRmqTCDa8PkOxLMpSSOvd5RyQYTTF3D6fK7rVzYfA=
Received: from CY5PR14CA0013.namprd14.prod.outlook.com (2603:10b6:930:2::23)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 10:29:29 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::10) by CY5PR14CA0013.outlook.office365.com
 (2603:10b6:930:2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 10:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 10:29:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 05:29:28 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 05:29:26 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v5 1/4] drm/amd/pm: smu_v14_0_0: fix DCLK metric reporting via
 VCLK level index
Date: Wed, 17 Jun 2026 15:59:25 +0530
Message-ID: <20260617102925.12599-1-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 486dda11-99ca-4c63-bab1-08decc5b501a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JO3B0/0r4sA9tAm4IVqw26z4zghLjm1V+PA9qi2oLE1Pvd6sbPo9JMHm4N69YqqRIJbafXl/VadZOX4ChBsAPxvkgfAI529IoLchu12l5Bkw1sE0w+M7H6ZDL44HX+rOv32RlObncibhzJP8HxKFcDPS6tksxus5uml+5Nf/vDmmZOsUQx6Loaaxv1ffWFt7z8NVjEtMXbtxCHRMfmfWhbmM5V8lYj25sPgCMYOENQIW4z99/cAV9kGSosCbDKokZRWb5TEFnjCNHgJ8U0ExL7NRpMJhDdt/MVKoAXMxQiAv6eDp3meYfq0luxaze5b1DQWsDIxQA0twzmkzYY8fULZTYUWJiMsKwCcn5AOFj6W9mTgcAW6t73lYG8Z/H3HbuZLa4FW1WY1Qamnn3h4SCwK1WMkRxcn+2EXhHHAulhlRFP/bbTeVOedg81pRboiGzzfm70Tz1Y/TbeU81AiB3PZS5nPSzI3caE+BpN3jnWrWMGyv0BGrsnA8xcePkFV0KPRAZWdtn0E1KhVWmWlwB4YIq21bcGdP19F+qM/wP8MIFBIUS3Zx+LVr3fp8id8UgVQGNxPh3MjKdp4BsUplUNJG4UPVnXvFPQ6bE5RxfJ9QStWtMohl9OH2sGttNkAlK2ynxb4wZHVHuhVNiWa5GpjfQIVyN57Oj/0OMB6RfuDuu52BhY/K8au3lPEt/Q4TfiRF1kWZkrfKuotpcnzCF5CnvkdTUIZkwNGXXm3ttNs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OLGTUGfAOjHEvEjHVM7EnWtr9xHO56Td8vMDJpEIA7xDbzIZitJ7l0YIAhPnCYIkTn1E38pLEwdwNf+RDBCmKyoPQFDk4Y/keVBah7tjiIJbrM2lkaTd5kYeX31H7CPpBmgAAGcoy+z1s66b2q8tdQZGr8wVvHDSucDj5FYo/5KFyQfa3eaJYWI6f5bY9ndRQ6X3fNnsyQip3d2eB5GSuQO2KqPxChlzaFGW6k6bO4WrTNL1rVMPW70j5zDfQPllJokmlENfjvPqHzi80OA7e6MzPykQ1aZ7gYKzJnMukudTJxE//hkG/Fx/cQ8QU1knc/N/bYSKVWixzbCW67ZG/k3wSHGx83GZqe1jz3yvp+GigcorFiK9epeDJRA+9fW51TbPZURrOHvW80aGJCUweD+NxptFuXH+1iXF/ovr5/woh9tyMj+JHFxOIA/ltGhl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:29:29.0343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486dda11-99ca-4c63-bab1-08decc5b501a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_NEQ_ENVFROM(0.00)[Priya.Hosur@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F23C6987D4

SmuMetrics_t has no DclkFrequency field but DCLK and VCLK have
separate DPM clock tables with different frequencies at each level.

Introduce smu_v14_0_0_find_clk_level(), a shared helper that
finds the closest DPM level for a given target frequency in a
frequency array.

For METRICS_AVERAGE_DCLK, use the helper to find the DPM level
whose VCLK frequency matches the reported VclkFrequency and
return the DCLK frequency at that same level index, since both
clocks share the same level count (VcnClkLevelsEnabled /
Vcn0ClkLevelsEnabled).

The original code returned 0 for METRICS_AVERAGE_DCLK, which broke
the active-level marker in pp_dpm_dclk entirely.

Signed-off-by: Priya Hosur <Priya.Hosur@amd.com>
---
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
index 2fe006de927a..b206a4d0376b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
@@ -260,6 +260,35 @@ static int smu_v14_0_0_system_features_control(struct smu_context *smu, bool en)
 	return ret;
 }
 
+/**
+ * smu_v14_0_0_find_clk_level - find the closest DPM level for a frequency
+ * @freqs: array of frequencies (one per DPM level)
+ * @count: number of valid entries in @freqs
+ * @target: the frequency to match
+ *
+ * Returns the index of the DPM level whose frequency is closest to @target.
+ * If an exact match exists it is preferred; otherwise the nearest level by
+ * absolute difference is returned.
+ */
+static uint8_t smu_v14_0_0_find_clk_level(const uint32_t *freqs, uint8_t count,
+					   uint32_t target)
+{
+	uint8_t i, closest = 0;
+	uint32_t best_diff = U32_MAX;
+
+	for (i = 0; i < count; i++) {
+		uint32_t diff = abs((int)target - (int)freqs[i]);
+
+		if (diff < best_diff) {
+			best_diff = diff;
+			closest = i;
+		}
+		if (freqs[i] == target)
+			return i;
+	}
+	return closest;
+}
+
 static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 					    MetricsMember_t member,
 					    uint32_t *value)
@@ -284,7 +313,30 @@ static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->VclkFrequency;
 		break;
 	case METRICS_AVERAGE_DCLK:
+		/*
+		 * SmuMetrics_t has no DclkFrequency field.  DCLK and VCLK
+		 * share the same DPM level count, so find the DPM level
+		 * whose VCLK matches the reported VclkFrequency and return
+		 * the DCLK frequency at that level.
+		 */
 		*value = 0;
+		if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(14, 0, 1)) {
+			DpmClocks_t_v14_0_1 *clk_table = smu->smu_table.clocks_table;
+			uint8_t lvl = smu_v14_0_0_find_clk_level(
+					clk_table->VClocks0,
+					clk_table->Vcn0ClkLevelsEnabled,
+					metrics->VclkFrequency);
+
+			*value = clk_table->DClocks0[lvl];
+		} else {
+			DpmClocks_t *clk_table = smu->smu_table.clocks_table;
+			uint8_t lvl = smu_v14_0_0_find_clk_level(
+					clk_table->VClocks,
+					clk_table->VcnClkLevelsEnabled,
+					metrics->VclkFrequency);
+
+			*value = clk_table->DClocks[lvl];
+		}
 		break;
 	case METRICS_AVERAGE_UCLK:
 		*value = metrics->MemclkFrequency;
-- 
2.43.0

