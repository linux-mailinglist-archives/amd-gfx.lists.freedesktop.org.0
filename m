Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08404E99CA
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Mar 2022 16:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111F10E67F;
	Mon, 28 Mar 2022 14:35:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665010E69E
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Mar 2022 14:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmIZyhuEvJJOgGsS5Wv3Khqh12VxLYZwzz2O+dfnFCSUOFKi+605mHpo5q+10jyoKsQ8hphPUfg/94pf0ec4oHIXE16km5wY5hJSIp1Drj2g6lcn5CtbltMm25uy19N0MiNQVW1JnclEXUD7+5OgxEnIJ9UlqwLb360ITh0ndfw4M3y4KHao+WFchMrQsAIrv5uL+eVmOOSXapst9Y8NFZ+cjR7jrc2kmRRDL4Ceaaq5mDwRHQHGv/mNciH+C4CYazVdcPCmO3jwGj2ink9RJOOzAjjWj6oRDhQuejYkZyhFsa53El7aJOCCoPEYoLaYeYT9A0NRBNlpCzkirZmoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niVjC4uJqno0fM+4jjs32c5dGPSa7a1X12T1A/2642c=;
 b=lyxrljIdfeRhzzSvW7UjIfQAchhf4az4YjqGM+jT9tbq354/RKHCFYt6zNAH74FIhQBcaWtJaTKTJ0+1qnA+rl+0lSmn4X8yVAgK1WLdPWqPYSFYcnxcJ5s6kF/06NujA4dnaWk0JzaBLyFc0/qLat+GSTmMhVZVGun4yVxEhgpkgBa8YBPjnoOQQiH8gUhfUInMCrGEuq5Xxp63smnWqjkH2+dol/o+sDhZujgN4kkwrubh9fWfGMO+7dV9fjRCphRtU7mN+wBcB0vJliLlWTB8YvmBzvKNUgLrp6xbN1haNChFahfRFcNb5QF2DvahItruea6y2oQZmWgMA3RwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niVjC4uJqno0fM+4jjs32c5dGPSa7a1X12T1A/2642c=;
 b=PS6PMgC26AT1a9nMUThqiOnLunVQ86O2xdUBqx2rgbgl8Rx771Q6zRoG/EqcntW55qSNqQWJFB4qPJ7OaaeZ8yfyZhjwQS2skTyd1cQKgkODayoxq8aWEYsZvjD5H6Kl0Y+bDVY9RWRQ0XgV1HXywUPsw8OdkfHctMdDCbTTr5Q=
Received: from DM3PR11CA0013.namprd11.prod.outlook.com (2603:10b6:0:54::23) by
 MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Mon, 28 Mar 2022 14:35:30 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::8c) by DM3PR11CA0013.outlook.office365.com
 (2603:10b6:0:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.26 via Frontend
 Transport; Mon, 28 Mar 2022 14:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 14:35:30 +0000
Received: from krussell.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 09:35:29 -0500
From: Kent Russell <kent.russell@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Add unique_id support for sienna cichlid
Date: Mon, 28 Mar 2022 10:35:18 -0400
Message-ID: <20220328143518.1253762-2-kent.russell@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328143518.1253762-1-kent.russell@amd.com>
References: <20220328143518.1253762-1-kent.russell@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d76251bd-2759-424b-d6c4-08da10c8355d
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4458CED52174DB7AFBCCB43E851D9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xBYBJWBJxfSvk5VQSsSG7dFYq+ktHmRCQv25MZO4wLehcbvZrnYy5teF5yifnM5zO0JQYFiTjk9wpdvnArj+yxlghYArnb8vSVcMFRo1pyMGwgHWoAEhqWBjzPg4T5el6omof8DFRT/dKhWAcYMqv6RZhFAMKWNTfXxfa5CxHAUBoT+YOfDzNgysl5Kv3pcjafcXXXqoga7tWqprVN+iJQri4ATcTMfWv/+UR+cf2SklG0+Bdexpx9UXexFKgIxv2foliOYr2oHkZV+VRCaMLefFv2DoUN1UcdFHD5lwsMNEtG6T6OIIXFCIX8xW1LU4xhLDDRkKRJhW1dt7yE5jNkPHvtCi3/vCmbWSKxBpq2SQBzyt+kVJ2ffMIyLRqk4mfcU3iKqXFTYDHvSYIN8SBhZv2m/gyifMCHqHFdT9yoc79QiVfuwkj04IOzWTCtTqKDjn2iEfyNlJhIovVbE6HupWQmQ7cXdxiGx6R3LxtdjyrEglvufIo/8HLRm2XXRUQ3a0SeH1I9xfBQ022xVAd06F8r+/oMbeJYVIDlchxwDd3IUAB4RLj8iEBpvLeT6jR6IsOZ4+4k1uwGoB/LGW8D58Z0iyFrvgqDl2gjsv9KhQry9WgY5mdjF4wqiI0gZgvQuouQ+fvkeEoiJ4NbCM5DP4ZYGZaQuB83PLoPH8yOu27+h6oLBnmHY/SguYGsOObqiu+MH+MvczhJNpn0txg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(82310400004)(54906003)(2616005)(1076003)(44832011)(6916009)(86362001)(8676002)(426003)(8936002)(4326008)(70586007)(36860700001)(336012)(81166007)(83380400001)(70206006)(356005)(5660300002)(6666004)(47076005)(36756003)(40460700003)(7696005)(186003)(26005)(16526019)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:35:30.0098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76251bd-2759-424b-d6c4-08da10c8355d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kent Russell <kent.russell@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is being added to SMU Metrics, so add the required tie-ins in the
kernel. Also create the corresponding unique_id sysfs file.

v2: Add FW version check, remove SMU mutex
v3: Fix style warning

Signed-off-by: Kent Russell <kent.russell@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  1 +
 .../pmfw_if/smu11_driver_if_sienna_cichlid.h  | 12 +++++--
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 36 +++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 4151db2678fb..4a9aabc16fbc 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1993,6 +1993,7 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 		case IP_VERSION(9, 4, 0):
 		case IP_VERSION(9, 4, 1):
 		case IP_VERSION(9, 4, 2):
+		case IP_VERSION(10, 3, 0):
 			*states = ATTR_STATE_SUPPORTED;
 			break;
 		default:
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
index 3e4a314ef925..58f977320d06 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
@@ -1419,8 +1419,12 @@ typedef struct {
   uint8_t  PcieRate               ;
   uint8_t  PcieWidth              ;
   uint16_t AverageGfxclkFrequencyTarget;
-  uint16_t Padding16_2;
 
+  //PMFW-8711
+  uint32_t PublicSerialNumLower32;
+  uint32_t PublicSerialNumUpper32;
+
+  uint16_t Padding16_2;
 } SmuMetrics_t;
 
 typedef struct {
@@ -1476,8 +1480,12 @@ typedef struct {
   uint8_t  PcieRate               ;
   uint8_t  PcieWidth              ;
   uint16_t AverageGfxclkFrequencyTarget;
-  uint16_t Padding16_2;
 
+  //PMFW-8711
+  uint32_t PublicSerialNumLower32;
+  uint32_t PublicSerialNumUpper32;
+
+  uint16_t Padding16_2;
 } SmuMetrics_V2_t;
 
 typedef struct {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 38f04836c82f..550458f6246a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -481,6 +481,41 @@ static int sienna_cichlid_setup_pptable(struct smu_context *smu)
 	return sienna_cichlid_patch_pptable_quirk(smu);
 }
 
+static void sienna_cichlid_get_unique_id(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	struct smu_table_context *smu_table = &smu->smu_table;
+	SmuMetrics_t *metrics =
+		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics);
+	SmuMetrics_V2_t *metrics_v2 =
+		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics_V2);
+	uint32_t upper32 = 0, lower32 = 0;
+	bool use_metrics_v2;
+	int ret;
+
+	/* Only supported as of version 0.58.83.0 */
+	if (smu->smc_fw_version < 0x3A5300)
+		return;
+
+	ret = smu_cmn_get_metrics_table(smu, NULL, false);
+	if (ret)
+		goto out_unlock;
+
+	use_metrics_v2 = ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
+		(smu->smc_fw_version >= 0x3A4300)) ? true : false;
+
+	upper32 = use_metrics_v2 ? metrics_v2->PublicSerialNumUpper32 :
+				   metrics->PublicSerialNumUpper32;
+	lower32 = use_metrics_v2 ? metrics_v2->PublicSerialNumLower32 :
+				   metrics->PublicSerialNumLower32;
+
+out_unlock:
+
+	adev->unique_id = ((uint64_t)upper32 << 32) | lower32;
+	if (adev->serial[0] == '\0')
+		sprintf(adev->serial, "%016llx", adev->unique_id);
+}
+
 static int sienna_cichlid_tables_init(struct smu_context *smu)
 {
 	struct smu_table_context *smu_table = &smu->smu_table;
@@ -4182,6 +4217,7 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.get_ecc_info = sienna_cichlid_get_ecc_info,
 	.get_default_config_table_settings = sienna_cichlid_get_default_config_table_settings,
 	.set_config_table = sienna_cichlid_set_config_table,
+	.get_unique_id = sienna_cichlid_get_unique_id,
 };
 
 void sienna_cichlid_set_ppt_funcs(struct smu_context *smu)
-- 
2.25.1

