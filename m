Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CA88DC22
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 12:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E73A10FA17;
	Wed, 27 Mar 2024 11:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t4yVfftl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342410FA17
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Mar 2024 11:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqY+p5k5HlyiYlP6+6u/hJtzI9u9Jj7ot6lNYqXecvuOFtGAAjq+M0HHBZ0EO7vNTDtmwLCkAiGAQxzcK2x7EfTBVt9YfVJBUHEDawS+4eUDtpFqLEZvWJUdQPE9lbcesZZ2gM6QxfAX0iDWa/smpXkBRXrAImwA6nuFB1qiwAbDZElK1RL3dkXW6FtHh5hrff1TOl7VFkigqAYnbrSPZ9g0PXeAODtDgdsrZSa+LpaVgZRNwPWHuT6PeUMoWzpyKcuXoGlh7kPuTMF5UcG0R6td+ZN0vRwm7UwWef+ym5d3pHSfAiD+44yhoFrCfcJNvDIyHMqysQiUNPFB0hXmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/ImNpEbgjpZi17zbG745nFFMvfYQHMbpDJtYna6UC0=;
 b=acXFxPsiMye7WBkykmcNjzcITqs+kVxMdiIOGx6ff2TLB8VckErKAevjYDdb0YFowFxU6jasjad8rEP/vb3GJguJSJr84U8TdBlEH0W2MKbj4/8ECPK9T9IVZZJuXxD4nWD1Z1uIRMROwMMdFMrAlhPWvAaQDhGH8PcVvKKWf3memeN4NQPlDa/fVf4xmDqHQd68tCn1NGDr9P7nMB4L98oOfnmtTH2shiA8sf46FFBznY/0M4xgzPy9DCIS/595znms7pQRvWNQYuZAKciQwhBOnmtUTqgWIGFF18sjssroccoGEm4TxpKETtsPUQVodf4+CzuY9wsINSSvUlLaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/ImNpEbgjpZi17zbG745nFFMvfYQHMbpDJtYna6UC0=;
 b=t4yVfftlrC/izpPElYfWKFXPHSv8+AimcVs6Dha35NFLDTO/3ndy0+fjnaal3NL2xc93ftVD/3hqhyZOTSpd3/MCmEzh6WHJS7+U9QNRDjMTjIiGZOfou6SdT9LN/PpdSUYViCXCVA4yQreaw6u9qC+U+CSR8DAxvcXq56rKJWw=
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 11:11:23 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::41) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 11:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.0 via Frontend Transport; Wed, 27 Mar 2024 11:11:23 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 06:11:21 -0500
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Kenneth.Feng@amd.com>, <Alexander.Deucher@amd.com>,
 <kevinyang.wang@amd.com>, <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>
Subject: [PATCH v3 3/5] drm/amdgpu/pm: Add support for MACO flag checking
Date: Wed, 27 Mar 2024 19:10:07 +0800
Message-ID: <20240327111009.2994297-3-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327111009.2994297-1-Jun.Ma2@amd.com>
References: <20240327111009.2994297-1-Jun.Ma2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: a023f6ff-a14c-4460-6a11-08dc4e4ea374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hP7om68qRHd75XBU3M3q4IGpkE99SmSGNO3EIia3GsPqMdkTUeC/qYXYlRRdmQmejy5M46bLTcr57VOJDxDZtTyScd3kB3a9DuNDfIayjRZtRNwNFBUUn9GOCO3jAGe/AkB2kWAHhUq0DFFcGNGvnfpTUw+hs+WN98pR6JRz7V+TR0yTQ7EYOV3PFJZnkEAFhBRSH6cVle09a/MKo5h7uUB7K33BY42berRPpJ+hkhdR3CIb4vf7QVkG7bb16n+e52C0C3UqL2w1JmNbXf4HLzL2bH5lXZXXrHmE2B7GT9BvxTB1zdmeUAv4jDG5+8OQJsKRGr0gdJHjymJwy5Y+KMsn+uO0sUqjAQ95NHOC0cxNRGlzcf4k1znVnFgeDZXNShzghK/sLzgheB8lN5UneMOKE5gkj11YJ5tw0bDi8aCmFEkodv9XNczf2BgpkbWCIqCz0HFRerKu6b+B8y8kwVKt6DX/BrOh1HJGWJTXG93Qh2AAGnpLaFrwf596XOmhhxwnZViWX1Bt63TJXYoBOB5AX5izpAUyGWiVRQNAe0n/3H2ubV63DiDtQMxQVdBcA1Xvh+FaDx2WZTN4FY6xQndytjwS62e5scAQYkm1Qxv85bVP/AzsTmXJ9An0tq4jY6QGscA1dsKTPI4PME9Cy8FGgBC3dZcDwIoYy9VjgPDa2JvSIB8aw6rZVGPpinoNHX1diXB73ck06Z3Uo+Q+V/JMRgT9svBnrWYAQVjj91/1ncxM0pnVjLgFrOzbNzSl
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 11:11:23.6030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a023f6ff-a14c-4460-6a11-08dc4e4ea374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

Add support for MACO flag checking.
MACO mode only works if BACO is supported.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/si.c                    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  8 ++++----
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  8 ++++----
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c |  6 +++---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h |  2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c |  8 ++++----
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h |  2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |  8 ++++----
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h   |  2 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  3 ++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     | 14 +++++++++-----
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 14 +++++++++-----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     | 14 +++++++++-----
 27 files changed, 79 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9c62552bec34..3723235f5818 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -605,7 +605,7 @@ struct amdgpu_asic_funcs {
 	/* PCIe replay counter */
 	uint64_t (*get_pcie_replay_count)(struct amdgpu_device *adev);
 	/* device supports BACO */
-	bool (*supports_baco)(struct amdgpu_device *adev);
+	int (*supports_baco)(struct amdgpu_device *adev);
 	/* pre asic_init quirks */
 	void (*pre_asic_init)(struct amdgpu_device *adev);
 	/* enter/exit umd stable pstate */
@@ -1407,7 +1407,7 @@ bool amdgpu_device_supports_atpx(struct drm_device *dev);
 bool amdgpu_device_supports_px(struct drm_device *dev);
 bool amdgpu_device_supports_boco(struct drm_device *dev);
 bool amdgpu_device_supports_smart_shift(struct drm_device *dev);
-bool amdgpu_device_supports_baco(struct drm_device *dev);
+int amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
 int amdgpu_device_baco_enter(struct drm_device *dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 12dc71a6b5db..410f878462bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -338,10 +338,12 @@ bool amdgpu_device_supports_boco(struct drm_device *dev)
  *
  * @dev: drm_device pointer
  *
- * Returns true if the device supporte BACO,
- * otherwise return false.
+ * Return:
+ * 1 if the device supporte BACO;
+ * 3 if the device support MACO (only works if BACO is supported)
+ * otherwise return 0.
  */
-bool amdgpu_device_supports_baco(struct drm_device *dev)
+int amdgpu_device_supports_baco(struct drm_device *dev)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index a3a643254d7a..fdbc26346b54 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1375,14 +1375,14 @@ static int cik_asic_pci_config_reset(struct amdgpu_device *adev)
 	return r;
 }
 
-static bool cik_asic_supports_baco(struct amdgpu_device *adev)
+static int cik_asic_supports_baco(struct amdgpu_device *adev)
 {
 	switch (adev->asic_type) {
 	case CHIP_BONAIRE:
 	case CHIP_HAWAII:
 		return amdgpu_dpm_is_baco_supported(adev);
 	default:
-		return false;
+		return 0;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 23e4ef4fff7c..67e179c7e347 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1409,9 +1409,9 @@ static int si_gpu_pci_config_reset(struct amdgpu_device *adev)
 	return r;
 }
 
-static bool si_asic_supports_baco(struct amdgpu_device *adev)
+static int si_asic_supports_baco(struct amdgpu_device *adev)
 {
-	return false;
+	return 0;
 }
 
 static enum amd_reset_method
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index dec81ccf6240..c8abbf5da736 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -502,7 +502,7 @@ static int soc15_asic_baco_reset(struct amdgpu_device *adev)
 static enum amd_reset_method
 soc15_asic_reset_method(struct amdgpu_device *adev)
 {
-	bool baco_reset = false;
+	int baco_reset = 0;
 	bool connected_to_cpu = false;
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
@@ -540,7 +540,7 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
 			 */
 			if (ras && adev->ras_enabled &&
 			    adev->pm.fw_version <= 0x283400)
-				baco_reset = false;
+				baco_reset = 0;
 		} else {
 			baco_reset = amdgpu_dpm_is_baco_supported(adev);
 		}
@@ -620,7 +620,7 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
 	}
 }
 
-static bool soc15_supports_baco(struct amdgpu_device *adev)
+static int soc15_supports_baco(struct amdgpu_device *adev)
 {
 	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
@@ -628,13 +628,13 @@ static bool soc15_supports_baco(struct amdgpu_device *adev)
 		if (adev->asic_type == CHIP_VEGA20) {
 			if (adev->psp.sos.fw_version >= 0x80067)
 				return amdgpu_dpm_is_baco_supported(adev);
-			return false;
+			return 0;
 		} else {
 			return amdgpu_dpm_is_baco_supported(adev);
 		}
 		break;
 	default:
-		return false;
+		return 0;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 1a98812981f4..2415355b037c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -897,7 +897,7 @@ static int vi_asic_pci_config_reset(struct amdgpu_device *adev)
 	return r;
 }
 
-static bool vi_asic_supports_baco(struct amdgpu_device *adev)
+static int vi_asic_supports_baco(struct amdgpu_device *adev)
 {
 	switch (adev->asic_type) {
 	case CHIP_FIJI:
@@ -908,14 +908,14 @@ static bool vi_asic_supports_baco(struct amdgpu_device *adev)
 	case CHIP_TOPAZ:
 		return amdgpu_dpm_is_baco_supported(adev);
 	default:
-		return false;
+		return 0;
 	}
 }
 
 static enum amd_reset_method
 vi_asic_reset_method(struct amdgpu_device *adev)
 {
-	bool baco_reset;
+	int baco_reset;
 
 	if (amdgpu_reset_method == AMD_RESET_METHOD_LEGACY ||
 	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
@@ -935,7 +935,7 @@ vi_asic_reset_method(struct amdgpu_device *adev)
 		baco_reset = amdgpu_dpm_is_baco_supported(adev);
 		break;
 	default:
-		baco_reset = false;
+		baco_reset = 0;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index afb930b70615..805c9d37a2b4 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -421,7 +421,7 @@ struct amd_pm_funcs {
 	int (*set_hard_min_dcefclk_by_freq)(void *handle, uint32_t clock);
 	int (*set_hard_min_fclk_by_freq)(void *handle, uint32_t clock);
 	int (*set_min_deep_sleep_dcefclk)(void *handle, uint32_t clock);
-	bool (*get_asic_baco_capability)(void *handle);
+	int (*get_asic_baco_capability)(void *handle);
 	int (*get_asic_baco_state)(void *handle, int *state);
 	int (*set_asic_baco_state)(void *handle, int state);
 	int (*get_ppfeature_status)(void *handle, char *buf);
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index f84bfed50681..eee919577b44 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -199,14 +199,14 @@ int amdgpu_dpm_notify_rlc_state(struct amdgpu_device *adev, bool en)
 	return ret;
 }
 
-bool amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev)
+int amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev)
 {
 	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 	void *pp_handle = adev->powerplay.pp_handle;
-	bool ret;
+	int ret;
 
 	if (!pp_funcs || !pp_funcs->get_asic_baco_capability)
-		return false;
+		return 0;
 	/* Don't use baco for reset in S3.
 	 * This is a workaround for some platforms
 	 * where entering BACO during suspend
@@ -217,7 +217,7 @@ bool amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev)
 	 * devices.  Needs more investigation.
 	 */
 	if (adev->in_s3)
-		return false;
+		return 0;
 
 	mutex_lock(&adev->pm.mutex);
 
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
index e6cad9f7aaeb..501f8c726e8d 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
@@ -411,7 +411,7 @@ int amdgpu_dpm_baco_reset(struct amdgpu_device *adev);
 int amdgpu_dpm_mode2_reset(struct amdgpu_device *adev);
 int amdgpu_dpm_enable_gfx_features(struct amdgpu_device *adev);
 
-bool amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev);
+int amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev);
 
 bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev);
 int amdgpu_dpm_mode1_reset(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 581dadfd13f9..133d1ee6e67c 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1371,7 +1371,7 @@ static int pp_set_active_display_count(void *handle, uint32_t count)
 	return phm_set_active_display_count(hwmgr, count);
 }
 
-static bool pp_get_asic_baco_capability(void *handle)
+static int pp_get_asic_baco_capability(void *handle)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c
index 8490614e2d7e..ad60918aaae1 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c
@@ -33,7 +33,7 @@
 #include "smu/smu_7_1_2_d.h"
 #include "smu/smu_7_1_2_sh_mask.h"
 
-bool smu7_get_bamaco_support(struct pp_hwmgr *hwmgr)
+int smu7_get_bamaco_support(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
 	uint32_t reg;
@@ -44,9 +44,9 @@ bool smu7_get_bamaco_support(struct pp_hwmgr *hwmgr)
 	reg = RREG32(mmCC_BIF_BX_FUSESTRAP0);
 
 	if (reg & CC_BIF_BX_FUSESTRAP0__STRAP_BIF_PX_CAPABLE_MASK)
-		return true;
+		return BACO_SUPPORT;
 
-	return false;
+	return 0;
 }
 
 int smu7_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state)
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h
index 93df1b9dfbd9..750082ea74d8 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h
@@ -25,7 +25,7 @@
 #include "hwmgr.h"
 #include "common_baco.h"
 
-extern bool smu7_get_bamaco_support(struct pp_hwmgr *hwmgr);
+extern int smu7_get_bamaco_support(struct pp_hwmgr *hwmgr);
 extern int smu7_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state);
 extern int smu7_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state);
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c
index 938812d6b978..c1ce1d7cae48 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c
@@ -28,13 +28,13 @@
 #include "vega10_inc.h"
 #include "smu9_baco.h"
 
-bool smu9_get_bamaco_support(struct pp_hwmgr *hwmgr)
+int smu9_get_bamaco_support(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
 	uint32_t reg, data;
 
 	if (!phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_BACO))
-		return false;
+		return 0;
 
 	WREG32(0x12074, 0xFFF0003B);
 	data = RREG32(0x12075);
@@ -43,10 +43,10 @@ bool smu9_get_bamaco_support(struct pp_hwmgr *hwmgr)
 		reg = RREG32_SOC15(NBIF, 0, mmRCC_BIF_STRAP0);
 
 		if (reg & RCC_BIF_STRAP0__STRAP_PX_CAPABLE_MASK)
-			return true;
+			return BACO_SUPPORT;
 	}
 
-	return false;
+	return 0;
 }
 
 int smu9_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state)
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h
index 67a5cec8e6b5..2c100482084c 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h
@@ -25,7 +25,7 @@
 #include "hwmgr.h"
 #include "common_baco.h"
 
-extern bool smu9_get_bamaco_support(struct pp_hwmgr *hwmgr);
+extern int smu9_get_bamaco_support(struct pp_hwmgr *hwmgr);
 extern int smu9_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state);
 
 #endif
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
index 0d0523e046d4..424e4ec9e389 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
@@ -36,22 +36,22 @@ static const struct soc15_baco_cmd_entry clean_baco_tbl[] = {
 	{CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_7), 0, 0, 0, 0},
 };
 
-bool vega20_get_bamaco_support(struct pp_hwmgr *hwmgr)
+int vega20_get_bamaco_support(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
 	uint32_t reg;
 
 	if (!phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_BACO))
-		return false;
+		return 0;
 
 	if (((RREG32(0x17569) & 0x20000000) >> 29) == 0x1) {
 		reg = RREG32_SOC15(NBIF, 0, mmRCC_BIF_STRAP0);
 
 		if (reg & RCC_BIF_STRAP0__STRAP_PX_CAPABLE_MASK)
-			return true;
+			return BACO_SUPPORT;
 	}
 
-	return false;
+	return 0;
 }
 
 int vega20_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state)
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h
index a2c0f4e7813c..0f2dd8c008ba 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h
@@ -25,7 +25,7 @@
 #include "hwmgr.h"
 #include "common_baco.h"
 
-extern bool vega20_get_bamaco_support(struct pp_hwmgr *hwmgr);
+extern int vega20_get_bamaco_support(struct pp_hwmgr *hwmgr);
 extern int vega20_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state);
 extern int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state);
 extern int vega20_baco_apply_vdci_flush_workaround(struct pp_hwmgr *hwmgr);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
index 5b3da41f159f..69928a4a074b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
@@ -351,7 +351,7 @@ struct pp_hwmgr_func {
 	int (*set_hard_min_fclk_by_freq)(struct pp_hwmgr *hwmgr, uint32_t clock);
 	int (*set_hard_min_gfxclk_by_freq)(struct pp_hwmgr *hwmgr, uint32_t clock);
 	int (*set_soft_max_gfxclk_by_freq)(struct pp_hwmgr *hwmgr, uint32_t clock);
-	bool (*get_bamaco_support)(struct pp_hwmgr *hwmgr);
+	int (*get_bamaco_support)(struct pp_hwmgr *hwmgr);
 	int (*get_asic_baco_state)(struct pp_hwmgr *hwmgr, enum BACO_STATE *state);
 	int (*set_asic_baco_state)(struct pp_hwmgr *hwmgr, enum BACO_STATE state);
 	int (*get_ppfeature_status)(struct pp_hwmgr *hwmgr, char *buf);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 4aa0776a5b01..981cf34060db 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -737,6 +737,7 @@ static int smu_early_init(void *handle)
 	smu->is_apu = false;
 	smu->smu_baco.state = SMU_BACO_STATE_EXIT;
 	smu->smu_baco.platform_support = false;
+	smu->smu_baco.maco_support = false;
 	smu->user_dpm_profile.fan_mode = -1;
 
 	mutex_init(&smu->message_lock);
@@ -3200,7 +3201,7 @@ static int smu_set_xgmi_pstate(void *handle,
 	return ret;
 }
 
-static bool smu_get_baco_capability(void *handle)
+static int smu_get_baco_capability(void *handle)
 {
 	struct smu_context *smu = handle;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index e791b846da7a..126e7116b534 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1177,7 +1177,7 @@ struct pptable_funcs {
 	 * BACO: Bus Active, Chip Off
 	 * MACO: Memory Active, Chip Off
 	 */
-	bool (*get_bamaco_support)(struct smu_context *smu);
+	int (*get_bamaco_support)(struct smu_context *smu);
 
 	/**
 	 * @baco_get_state: Get the current BACO state.
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
index 0e8fdf3bccc4..c2ab336bb530 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
@@ -237,7 +237,7 @@ int smu_v11_0_set_azalia_d3_pme(struct smu_context *smu);
 int smu_v11_0_get_max_sustainable_clocks_by_dc(struct smu_context *smu,
 		struct pp_smu_nv_clock_table *max_clocks);
 
-bool smu_v11_0_get_bamaco_support(struct smu_context *smu);
+int smu_v11_0_get_bamaco_support(struct smu_context *smu);
 
 enum smu_baco_state smu_v11_0_baco_get_state(struct smu_context *smu);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index bad7e73e9fe0..d9700a3f28d2 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -210,7 +210,7 @@ int smu_v13_0_set_azalia_d3_pme(struct smu_context *smu);
 int smu_v13_0_get_max_sustainable_clocks_by_dc(struct smu_context *smu,
 					       struct pp_smu_nv_clock_table *max_clocks);
 
-bool smu_v13_0_get_bamaco_support(struct smu_context *smu);
+int smu_v13_0_get_bamaco_support(struct smu_context *smu);
 
 int smu_v13_0_baco_enter(struct smu_context *smu);
 int smu_v13_0_baco_exit(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h
index b4d7b4ea0c9f..c705c26884cb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h
@@ -159,7 +159,7 @@ int smu_v14_0_register_irq_handler(struct smu_context *smu);
 int smu_v14_0_baco_set_armd3_sequence(struct smu_context *smu,
 				      enum smu_baco_seq baco_seq);
 
-bool smu_v14_0_get_bamaco_support(struct smu_context *smu);
+int smu_v14_0_get_bamaco_support(struct smu_context *smu);
 
 enum smu_baco_state smu_v14_0_baco_get_state(struct smu_context *smu);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index f6913820dbb7..8407ca4fdc17 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1557,23 +1557,27 @@ int smu_v11_0_baco_set_armd3_sequence(struct smu_context *smu,
 	return smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_ArmD3, baco_seq, NULL);
 }
 
-bool smu_v11_0_get_bamaco_support(struct smu_context *smu)
+int smu_v11_0_get_bamaco_support(struct smu_context *smu)
 {
 	struct smu_baco_context *smu_baco = &smu->smu_baco;
+	int bamaco_support = 0;
 
 	if (amdgpu_sriov_vf(smu->adev) || !smu_baco->platform_support)
-		return false;
+		return 0;
+
+	if (smu_baco->maco_support)
+		bamaco_support |= MACO_SUPPORT;
 
 	/* return true if ASIC is in BACO state already */
 	if (smu_v11_0_baco_get_state(smu) == SMU_BACO_STATE_ENTER)
-		return true;
+		return bamaco_support |= BACO_SUPPORT;
 
 	/* Arcturus does not support this bit mask */
 	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_BACO_BIT) &&
 	   !smu_cmn_feature_is_enabled(smu, SMU_FEATURE_BACO_BIT))
-		return false;
+		return 0;
 
-	return true;
+	return (bamaco_support |= BACO_SUPPORT);
 }
 
 enum smu_baco_state smu_v11_0_baco_get_state(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index a3bf491eb8ad..f4b31b86e2a4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1582,11 +1582,11 @@ static void aldebaran_get_unique_id(struct smu_context *smu)
 	adev->unique_id = ((uint64_t)upper32 << 32) | lower32;
 }
 
-static bool aldebaran_get_bamaco_support(struct smu_context *smu)
+static int aldebaran_get_bamaco_support(struct smu_context *smu)
 {
 	/* aldebaran is not support baco */
 
-	return false;
+	return 0;
 }
 
 static int aldebaran_set_df_cstate(struct smu_context *smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0193b81eab14..7277cc72d7f5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -2268,22 +2268,26 @@ static int smu_v13_0_baco_set_state(struct smu_context *smu,
 	return ret;
 }
 
-bool smu_v13_0_get_bamaco_support(struct smu_context *smu)
+int smu_v13_0_get_bamaco_support(struct smu_context *smu)
 {
 	struct smu_baco_context *smu_baco = &smu->smu_baco;
+	int bamaco_support = 0;
 
 	if (amdgpu_sriov_vf(smu->adev) || !smu_baco->platform_support)
-		return false;
+		return 0;
+
+	if (smu_baco->maco_support)
+		bamaco_support |= MACO_SUPPORT;
 
 	/* return true if ASIC is in BACO state already */
 	if (smu_v13_0_baco_get_state(smu) == SMU_BACO_STATE_ENTER)
-		return true;
+		return bamaco_support |= BACO_SUPPORT;
 
 	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_BACO_BIT) &&
 	    !smu_cmn_feature_is_enabled(smu, SMU_FEATURE_BACO_BIT))
-		return false;
+		return 0;
 
-	return true;
+	return (bamaco_support |= BACO_SUPPORT);
 }
 
 int smu_v13_0_baco_enter(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 739611215c8b..575292314f57 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -2078,11 +2078,11 @@ static void smu_v13_0_6_get_unique_id(struct smu_context *smu)
 	adev->unique_id = pptable->PublicSerialNumber_AID;
 }
 
-static bool smu_v13_0_6_get_bamaco_support(struct smu_context *smu)
+static int smu_v13_0_6_get_bamaco_support(struct smu_context *smu)
 {
 	/* smu_13_0_6 does not support baco */
 
-	return false;
+	return 0;
 }
 
 static const char *const throttling_logging_label[] = {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c
index 28f6312e1798..d9ecb1da24cd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c
@@ -1590,23 +1590,27 @@ int smu_v14_0_baco_set_armd3_sequence(struct smu_context *smu,
 	return 0;
 }
 
-bool smu_v14_0_get_bamaco_support(struct smu_context *smu)
+int smu_v14_0_get_bamaco_support(struct smu_context *smu)
 {
 	struct smu_baco_context *smu_baco = &smu->smu_baco;
+	int bamaco_support = 0;
 
 	if (amdgpu_sriov_vf(smu->adev) ||
 	    !smu_baco->platform_support)
-		return false;
+		return 0;
+
+	if (smu_baco->maco_support)
+		bamaco_support |= MACO_SUPPORT;
 
 	/* return true if ASIC is in BACO state already */
 	if (smu_v14_0_baco_get_state(smu) == SMU_BACO_STATE_ENTER)
-		return true;
+		return (bamaco_support |= BACO_SUPPORT);
 
 	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_BACO_BIT) &&
 	    !smu_cmn_feature_is_enabled(smu, SMU_FEATURE_BACO_BIT))
-		return false;
+		return 0;
 
-	return true;
+	return (bamaco_support |= BACO_SUPPORT);
 }
 
 enum smu_baco_state smu_v14_0_baco_get_state(struct smu_context *smu)
-- 
2.34.1

