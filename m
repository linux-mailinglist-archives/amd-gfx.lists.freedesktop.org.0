Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616C7D9D33
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 17:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF16410E9E9;
	Fri, 27 Oct 2023 15:43:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1F510E9E9
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 15:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lENWu+xhEoCRfXO/l4WVaq7ctFTt5wSRW0b56A7bKNv2wFKJUbAk/FhaUjg1fdXdx78bGNLpCE0HViWwu/btQR9jksKnxoXQAr6txD/Aajl8IKap0zYuqjx5LFEIx0CAzKRRsUSkuuEEjcTFU+cJP3oq6eMKLsupN+oPR0AV9UWs3/wsMikcEfwfEhYx2yl9psVXFufTiYfCFDio2eHv6LeELoKqJkI07DY7WIWvxCEnIDzEyBNgqwbej6j1U4QZ/DW/FaPu5h1JmfZlyZUKSZxCfYk8jQ4MjFNUjWy5fqk51l9CRk7cMbt9XO4k27GpDDeu5sCRPy3isYckNHcvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdTOq8P5sAU6p26/41Wn1S4QMRuvee6q9IVi4CmsYz0=;
 b=GEEQh96JNetrOwv2hGfje6CmFTWszFNGXSDfRHupAQb6xdrdgx1Cwpr00K5FxtkH5heD6p+UX5kvWUQ9R+Uati9+xIPqUhYuFl67i0Zv1s3WpeRN1NZ2Pj6/xoa6bmQuuFFMuJT5AExP5KpJG2r00m2nXocb5fsTJ2PGRZIgROELjYHIooBS4Z89MqWs1ZU+vI9MTOeKw5EknSlbc9VJqInJwyOd488HIyUuZSxcZ/UKjEtkM2Elq4yPsyUWFuG8/SNyiYjiGP1rupivQ1mydkv3bgXGLZASYEQSalDKAWpjSXxJpfvB2WAbSQJqKIvGAhlksxJem3AyPXMWYVrSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdTOq8P5sAU6p26/41Wn1S4QMRuvee6q9IVi4CmsYz0=;
 b=r4NGPI39JLeDOyVPUuZA6vmmCn8LqKvIO35/OAHpzRNWWjZKKTkvXnK4+Y7bo1YtMqg3wlp7hr6e4ziktAc++kH3Mwkqy0ipBem/XW6qmFNTUL3i4Jsh9Mu+PInGWEgs2lw0eD7R5en+VRgjd6yW5NFIdCKG9xYXFIo4GIsP8Mc=
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 15:43:09 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::9f) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.11 via Frontend
 Transport; Fri, 27 Oct 2023 15:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 15:43:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 10:43:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: don't use pci_is_thunderbolt_attached()
Date: Fri, 27 Oct 2023 11:42:24 -0400
Message-ID: <20231027154225.1662448-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027154225.1662448-1-alexander.deucher@amd.com>
References: <20231027154225.1662448-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 194aa0fa-e6c7-4aa6-ebe5-08dbd7036b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mU4dQ6ayb+MIUJS6by5DxCRKx/E6/uuOwFQui0QAC5V2YuLF/eTqz8IYS197zt3FpHIOXlbhPRoS7NZCR9//l1N+s3IFS7FLsst6WJStDse12tQrOMz2Jo9+HegfvVBZ+bnEIKZXZrBAhZ2TzNg3JbPrD5qyMilL3q7pun80qbiS/GcIfjQehEgtg8ZFPjt9RiLggl23UjVYTEV1atnBBhsqp19nT8K9Bk3KrALQ8wl4O4lD7GxrfyrZMPsGN/0UJSAegWz7gOLkm0XrBgQOH0xS6UoqxfQUXmqev0dTKYfpI8e0L4wx0bUC6JQFfSisMzgv9x4AoYpFiN1lebb7PMoau2/4qLRm5MjyrHqcLPA+gtkoLDqC++H0L0RZfUH6zDolINz0vE4sfRs7e8D/oLHeIpR3zKv5flG9hQVJeRK+aiir8Vpuy0yT2BzzF0GCTzqBtN5FX8fABCZUlqJXrGpco4E7OcRFsdIB3SCxFO9x63mlNwXYvC6bIXx69ETqHj+fg8uMfeYtBCEhMsOzGb30FoVSd0GG8DO+XyPzdtgo/o5IAG3nZ3tHGl8khe5+i3YNx0Q6K4y4BB2bJa77EiE23gz3XSXfgonvLWHo06avQNGFs/JRxWjOoLO2V1AN8xqgSpnOBaXCW+W5GPn6mr/01VFFC0SsK7s2+wo7P56Iz343n7oJ4h2uUVwOBcAbA4/teS2T/6mAbPA3G0yoQ9bHItknKUD6kvPS82RyiaWQC6cWkNkndqzrXYERpRvI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(82740400003)(40460700003)(36860700001)(86362001)(2906002)(41300700001)(316002)(70586007)(70206006)(478600001)(7696005)(6916009)(6666004)(16526019)(40480700001)(336012)(426003)(966005)(356005)(47076005)(1076003)(83380400001)(36756003)(5660300002)(2616005)(8676002)(4326008)(8936002)(81166007)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:43:08.9177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194aa0fa-e6c7-4aa6-ebe5-08dbd7036b6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

It's only valid on Intel systems with the Intel VSEC.
Use dev_is_removable() instead.  This should do the right
thing regardless of the platform.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c     | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2381de831271..5c90080e93ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -41,6 +41,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
+#include <linux/device.h>
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/efi.h>
@@ -2223,7 +2224,6 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
  */
 static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev_to_drm(adev);
 	struct pci_dev *parent;
 	int i, r;
 	bool total;
@@ -2294,7 +2294,7 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	    (amdgpu_is_atpx_hybrid() ||
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
 	    ((adev->flags & AMD_IS_APU) == 0) &&
-	    !pci_is_thunderbolt_attached(to_pci_dev(dev->dev)))
+	    !dev_is_removable(&adev->pdev->dev))
 		adev->flags |= AMD_IS_PX;
 
 	if (!(adev->flags & AMD_IS_APU)) {
@@ -4138,7 +4138,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	px = amdgpu_device_supports_px(ddev);
 
-	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+	if (px || (!dev_is_removable(&adev->pdev->dev) &&
 				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_register_client(adev->pdev,
 					       &amdgpu_switcheroo_ops, px);
@@ -4288,7 +4288,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	px = amdgpu_device_supports_px(adev_to_drm(adev));
 
-	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+	if (px || (!dev_is_removable(&adev->pdev->dev) &&
 				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_unregister_client(adev->pdev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index e523627cfe25..df218d5ca775 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -28,6 +28,7 @@
 #include "nbio/nbio_2_3_offset.h"
 #include "nbio/nbio_2_3_sh_mask.h"
 #include <uapi/linux/kfd_ioctl.h>
+#include <linux/device.h>
 #include <linux/pci.h>
 
 #define smnPCIE_CONFIG_CNTL	0x11180044
@@ -361,7 +362,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
 
 		data |= NAVI10_PCIE__LC_L0S_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
 
-		if (pci_is_thunderbolt_attached(adev->pdev))
+		if (dev_is_removable(&adev->pdev->dev))
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_TBT_DEFAULT  << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
 		else
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
@@ -480,7 +481,7 @@ static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
 
 	def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
 	data |= NAVI10_PCIE__LC_L0S_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
-	if (pci_is_thunderbolt_attached(adev->pdev))
+	if (dev_is_removable(&adev->pdev->dev))
 		data |= NAVI10_PCIE__LC_L1_INACTIVITY_TBT_DEFAULT  << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
 	else
 		data |= NAVI10_PCIE__LC_L1_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
-- 
2.41.0

