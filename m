Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A739086A86F
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Feb 2024 07:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2664910E4D4;
	Wed, 28 Feb 2024 06:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2kGsDTKK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0F10E4D4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 06:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBltJRgwWNV5NVjKXv0NtEjsDTt3Ja5JGgvdm010jkzihIGutcIBoCku9345696D4OmrbYmAYyw36P9b8OiWuu26w/VlR1kBwARN5QtC8BZCSIY0Ric4x7KDvcz0Y4Yx8iaL1z2GAYDy/Tho5dEqWebToA0BZbxBP+OdPZY0O38BzDWtc8cFmQEIwYFCY1gEr2XUiLfXTPpVGlrm9Ef2sVUwBl6hcjVkPH/WlP5xqvh1Xlrei/5MTqTLaI9/w5v6gvLJJV3F31/QFvogUDejD/CnXYEI9/Z6mEnzQB8Ck9aCS5lXh/n0SffDYLV7sWZWdXAt3tzOGddniXCxDkZeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13EypoG/6OFyYyJIDncTFuck7MhjgOrSJMUnpSi6z+E=;
 b=dfEiDzQIPoxxLI6XZ45qAQJpWQ/mSqGW+SZWkDUc76iP+OH4xoaQbyDvgplhX8fhkGWo8dfUnJuZefz+r+nvGc1TxoNiy4HGxwYVvhp702TSiAkrLlaUTfVudJe4S5EOT6z0TvNePXrJDTNq3TNtJ/CRVucX+mgzqwWucEE2k04Xf1BpoxHC4bPHf9UyFslVhWyw/8yuvHusSacyJj86/dKPL7wSFwwAWNz4Ap+PJtZRLDHyK07kyAHLtn23YSHKcTKc4nQPVVx2BNIKpYza0MHFrzM4nCeK6dZKJn0xLtzNmEQ3PotMMWUH/f2uwPehhmxywiDiJJ4eEAytuy8U1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13EypoG/6OFyYyJIDncTFuck7MhjgOrSJMUnpSi6z+E=;
 b=2kGsDTKKObBYtorsjfRC9W6pddLR2NY0E4CdipF4R8X2k8QR415EdB/XXgai9kcCvzT2NlDQucpKzc1h5NNttttpG/gy+L2gCGCpg/nsTB1QxPOc6mphemvZXfQ+TmHA9IxqThvmaCchx1G3dAwQvhvo0S6eT2JY3Yp89PxsXjE=
Received: from MW4PR04CA0242.namprd04.prod.outlook.com (2603:10b6:303:88::7)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Wed, 28 Feb
 2024 06:38:37 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::a1) by MW4PR04CA0242.outlook.office365.com
 (2603:10b6:303:88::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Wed, 28 Feb 2024 06:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 06:38:36 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 00:38:34 -0600
From: Yang Wang <kevinyang.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.zhang@amd.com>, <Lijo.Lazar@amd.com>, <Davis.Ming@amd.com>,
 <vignesh.chander@amd.com>, Yang Wang <kevinyang.wang@amd.com>
Subject: [PATCH v2] drm/amdgpu: enable pp_od_clk_voltage for gfx 9.4.3 SRIOV
Date: Wed, 28 Feb 2024 14:38:15 +0800
Message-ID: <20240228063815.4139197-1-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a877467-eb7f-4f6d-bb3c-08dc3827e494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaQ31yMScqY88sNwii10z3Cikb0gKYpsDsjix1KBttuC33iP7oU1fhMApefYA/fEk60Ugz1MJbZ3aQTUj4Z2QuEMUUZLAatJXhuNH28wLUeUs4JR7KpA3vK17BtzSAIVAQOZAN2UonrSeoE6cTxhs1HFq0wMJJz1K546YGDm4NoDI91ocgDalZWzO/a/p4X39G6CYH6pZxYFUCaXDiYh28y9re6p0p3GvWlDLtvmK2ia6iMdQVcykNH5v0rGZNi+M6PRZduKO/Fa0TgZnGY0g8p+eFdK8vYR8gyKF4mEq3RnyVIXBhUQhaYmX9NYMhF1Vp0nR8ZZxl5FO638ug02EFx7Q/norZTwNzUSOEaorRUEj4vU2I6hRW1c4muLga0p4rV96aUrpjt61i6Vlm5/co+WFDVDkXdoTb0R1bHVvtiyi67AnDs/si90rxxZrdswxwAIzPkFM/dLuh9NGI627ehEMAcg2zN6H94cON3cVmi7Kh8LIQsVNKJyo3A0qxvxPQrjL7dnVr2IUZzuMDaywpIb8yuw+E05wY8BlN0+7LA6yvqvnyfr3Ox6SS8R+t9rYH3g9FZVahHzBzwgSXTcd2coF37ztXDlnnQ/V0dYoNh/VRQ7uvlCQLjY8Wz60Qyr0ogU1T6k+gtaBG1wTXjhujsYBvmmF4Wsa5cY0y/BGEnJdMFLl9Y9N+GBwV2DAaUEyr0fcLOktFNbRZQWsklqk96T0Z9P4eF8LXMISxkB4iGM6aDIM1BMrPLcisn7gaQB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:38:36.8037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a877467-eb7f-4f6d-bb3c-08dc3827e494
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924
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

v1:
enabel pp_od_clk_voltage node for gfx 9.4.3 SRIOV and BM.

v2:
add onevf check for gfx 9.4.3

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 35 +++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 087d57850304..7e5f00530769 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2034,6 +2034,34 @@ static int ss_bias_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 	return 0;
 }
 
+static int pp_od_clk_voltage_attr_update(struct amdgpu_device *adev, struct amdgpu_device_attr *attr,
+					 uint32_t mask, enum amdgpu_device_attr_states *states)
+{
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
+
+	*states = ATTR_STATE_UNSUPPORTED;
+
+	/* Enable pp_od_clk_voltage node for gc 9.4.3 SRIOV/BM support */
+	if (gc_ver == IP_VERSION(9, 4, 3)) {
+		if (!amdgpu_dpm_is_overdrive_supported(adev) ||
+		    (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev)))
+			*states = ATTR_STATE_UNSUPPORTED;
+		else
+			*states = ATTR_STATE_SUPPORTED;
+		return 0;
+	}
+
+	if (!(attr->flags & mask)) {
+		*states = ATTR_STATE_UNSUPPORTED;
+		return 0;
+	}
+
+	if (amdgpu_dpm_is_overdrive_supported(adev))
+		*states = ATTR_STATE_SUPPORTED;
+
+	return 0;
+}
+
 /* Following items will be read out to indicate current plpd policy:
  *  - -1: none
  *  - 0: disallow
@@ -2118,7 +2146,8 @@ static struct amdgpu_device_attr amdgpu_device_attrs[] = {
 	AMDGPU_DEVICE_ATTR_RW(pp_sclk_od,				ATTR_FLAG_BASIC),
 	AMDGPU_DEVICE_ATTR_RW(pp_mclk_od,				ATTR_FLAG_BASIC),
 	AMDGPU_DEVICE_ATTR_RW(pp_power_profile_mode,			ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
-	AMDGPU_DEVICE_ATTR_RW(pp_od_clk_voltage,			ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_od_clk_voltage,			ATTR_FLAG_BASIC,
+			      .attr_update = pp_od_clk_voltage_attr_update),
 	AMDGPU_DEVICE_ATTR_RO(gpu_busy_percent,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
 	AMDGPU_DEVICE_ATTR_RO(mem_busy_percent,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
 	AMDGPU_DEVICE_ATTR_RO(pcie_bw,					ATTR_FLAG_BASIC),
@@ -2163,10 +2192,6 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 	} else if (DEVICE_ATTR_IS(pp_dpm_fclk)) {
 		if (mp1_ver < IP_VERSION(10, 0, 0))
 			*states = ATTR_STATE_UNSUPPORTED;
-	} else if (DEVICE_ATTR_IS(pp_od_clk_voltage)) {
-		*states = ATTR_STATE_UNSUPPORTED;
-		if (amdgpu_dpm_is_overdrive_supported(adev))
-			*states = ATTR_STATE_SUPPORTED;
 	} else if (DEVICE_ATTR_IS(mem_busy_percent)) {
 		if ((adev->flags & AMD_IS_APU &&
 		     gc_ver != IP_VERSION(9, 4, 3)) ||
-- 
2.34.1

