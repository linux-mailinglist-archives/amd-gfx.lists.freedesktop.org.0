Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC69AE5EEA
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Jun 2025 10:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8075210E508;
	Tue, 24 Jun 2025 08:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cT5rQr6H";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CDC10E508
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Jun 2025 08:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dz8UBRIfrpCY+KzjJ35Ip1py2JiEkkuAMjreA/S/+JlJOaDe/H+kRRAOzVM2woczvgs1aPuiiRHKLrs8ZuFy5HYETRqOyZrB4uG9ovOUvu7LXa8m8tBwoBdT3NTnu6mn1EjHRojP89hyM+5dglxppYIs1K/F74zvf1zjIRp4Y6sRRylGOk2rU5Ubl1CEtBAy6hN+lEq9rxFz2ohKK7TaMWC09GADw66KdrmnZfLzOz1Z8qp8UHjxzeTABD9VVgekw9WYB9bFJRIVky3G5kPZ2Ppn16HUgsX9r2sGQ3SzSlV3Q2Pzr7Xs7nDckmRfMa9I2XlsC+uSbG1gQxerWzrANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Uh2xxrKt6b6wAmijQ0MD7tsVjJZ2d04oj9e055QdT8=;
 b=lGfK7n67ZH74N6NZRon2kKGOkNytnDdhZnhnu17F6nddY7vtcEOnSh0KKKln1AEvky0dq55trgQMDEP3G2RB6DD8zD2Y2y4LYSqFaEzx8KeZjDosY0bM+UTNYNFGva360vkCdAvBqykm+A6U75bXQ+a/jcNboymCZE08nlpCbb23E4OJU5k3VzrxK9sYwsgE5Qub2uwctEdsApuZUFIU+qNpv0bN4EbfaO+LOytSXKVBmW+9Prf7KOk86waUiXosxVLDNzg2HvHIwlWJjWC5UqFEBPaUAbXoz+eqKZXnSDQS6dRUuxNuP9adbcC/Ley4LdvXi0f2oH4cZFTHauQ2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Uh2xxrKt6b6wAmijQ0MD7tsVjJZ2d04oj9e055QdT8=;
 b=cT5rQr6HfOzt93R+ClPf6rVUH47K8y8Is7xTne1zYavQao6q3qof0rH8B+1qPhc2AwsMwCNp7PVdwx6KbRiDOY2rhSQiR1sieMppSiUGIdhqkw6+aqqAUL+Oz5aT/EW3inRmUw4ih5nbiznFd18n8B2LO1oHNgePaRuhPP2ga6o=
Received: from SJ0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:a03:39e::28)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:17:29 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::7d) by SJ0PR03CA0293.outlook.office365.com
 (2603:10b6:a03:39e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 08:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 08:17:28 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 03:17:26 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>, <Asad.Kamal@amd.com>
Subject: [PATCH] drm/amdgpu: Convert from DRM_* to dev_*
Date: Tue, 24 Jun 2025 13:47:09 +0530
Message-ID: <20250624081709.1157943-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: db7a7280-1ac4-4ab1-9903-08ddb2f78f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIpLNbnzVvwPXvc55hy2nsaoWVt33whXF8oz7ugDXo/uWn2AtC4MZqSMo6v7?=
 =?us-ascii?Q?rXB0IyP0H0ka8/qiNttCP1Ax8EV+oZ3eV3g+nh04QMaKfVBQ6iRY5a5xXK65?=
 =?us-ascii?Q?w8ijiH5fce5gMsY1mf6LKODjgYAGsgcc8Z0ElH+GmbhXbqjfIFWPJNVWfFZI?=
 =?us-ascii?Q?HjROG+FZ+nTxaL3T85T/Z/WM1spXQb64lQZv4QnEnZUzZZrZbwsDiKSrpy9/?=
 =?us-ascii?Q?KFnwMZfJ13K0CyXdY360I7B4iqyLZ4Wg1dUONMwGmAFAybWVqYLFIVDPL58b?=
 =?us-ascii?Q?5mAwjSkPoVpqOr2Y06mMlURxmWkArhqgnBsusza+8/TDL6W20fojwjQ6QZUy?=
 =?us-ascii?Q?g/48HuOyPsNYYaNfdbZnWHQ8gy2nvg3gWjOcpOt/99cyX/erADXQI0M34ns1?=
 =?us-ascii?Q?MGaboA/TmzccTItivYKZDui5sq43vE6NXy4aQmaFiRabxEAUEldGWavesA9Y?=
 =?us-ascii?Q?wRC8tFhxCEWxjIRVn31aHQLZrS4VT0Jxd6WApKupKq0EL3+4DVvFS26DKfkC?=
 =?us-ascii?Q?6FyQPQE3VMMyNryxsBDCk8j+fU8am1FFqRTs4h/G9r9f4U62CHB2liKhqDST?=
 =?us-ascii?Q?YUfoE54pAoWWwoxo9z14/sX/z2mDhMQzrYt40h4gcLkOycayHhXi05l5Q4lG?=
 =?us-ascii?Q?cJp1cnnYT4SKsDyzLG+UHZQzuKFLekx4SrkGmMoYAZp+oqfnChwRHxtkMJn/?=
 =?us-ascii?Q?+6G6S5ddnIy6NZAqxsr6KgZ5nAmvU6N4rbYmi0XAFfnEgaTw4XkB7J4HSB5E?=
 =?us-ascii?Q?r/I8RP/Ae4Xzx4XwbjRVtBBSahaNEIRcac11uFPPQEcu60BkSq0lme6z+6Ce?=
 =?us-ascii?Q?jaEEJisVxubRP2mu6DB4JY13YVs2iGjuqoF31gduOKxIZtS5WHtCpY5G6ssD?=
 =?us-ascii?Q?Qaavx7o0ajj+7VwifF/IfmR5biJlirNpqit2uznsPsnCGMLEz7gRhxv3D7N3?=
 =?us-ascii?Q?QQSF64JBByk21Fh+QhY2ZSYfcwWWmLSZZbKYfeA/7jEX2E4jEnKYsKuUdEl0?=
 =?us-ascii?Q?BoABHmYZqnBEPbtfNOtmAqQ/AuBdJJ52J80DTo+swU7DFZGbbgBgIjkEc5U1?=
 =?us-ascii?Q?tmUeyv8QCgYT9HtFPO0UKORMTTqC737FpruRmee/mZD0Dvk3e0GJaOzctCT8?=
 =?us-ascii?Q?CHVEJfU/VenOaCs+aEWGNnJp2n99WMkTkw5h2n4+98pp1znJLWxfncuoHdPX?=
 =?us-ascii?Q?0I7wqy/H1IFewPILnDca/POPGjj7YpPac8ZyI59RVrWRXl67GlkllqlP6mHG?=
 =?us-ascii?Q?txV8JBLrs9v1jMmDmX8rIqmpIRPH7f94HuUdsuD6T3Ji+Rr2eVCmIexlqJsY?=
 =?us-ascii?Q?RCRQUPDIMUtQ/reUQxLyVgrRlQWHo+odF47iVI96dLGqFifM2LknJUemWjRT?=
 =?us-ascii?Q?Vo7c/CUjmOnPG5eB4jDxhWHiaWTZV4Freo+IJs5bfj9usfSso5Vtl/G8mB9n?=
 =?us-ascii?Q?zxOfnyNAFFb41gekvXpHgqVG9ZbGyFki1eg8QOFfHMwsAhqkR/PjUVFHtnUT?=
 =?us-ascii?Q?I450v76ko9VU+3gMC81nNOytqBa9W71hd9Cq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:17:28.9777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7a7280-1ac4-4ab1-9903-08ddb2f78f84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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

Convert from generic DRM_* to dev_* calls to have device context info.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 271 +++++++++++-------
 .../gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c  |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c    |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  22 +-
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  77 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  56 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  21 +-
 12 files changed, 320 insertions(+), 219 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c8a6b3689dea..334e442c95ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1288,14 +1288,14 @@ u32 amdgpu_device_get_rev_id(struct amdgpu_device *adev)
  */
 static uint32_t amdgpu_invalid_rreg(struct amdgpu_device *adev, uint32_t reg)
 {
-	DRM_ERROR("Invalid callback to read register 0x%04X\n", reg);
+	dev_err(adev->dev, "Invalid callback to read register 0x%04X\n", reg);
 	BUG();
 	return 0;
 }
 
 static uint32_t amdgpu_invalid_rreg_ext(struct amdgpu_device *adev, uint64_t reg)
 {
-	DRM_ERROR("Invalid callback to read register 0x%llX\n", reg);
+	dev_err(adev->dev, "Invalid callback to read register 0x%llX\n", reg);
 	BUG();
 	return 0;
 }
@@ -1312,15 +1312,17 @@ static uint32_t amdgpu_invalid_rreg_ext(struct amdgpu_device *adev, uint64_t reg
  */
 static void amdgpu_invalid_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v)
 {
-	DRM_ERROR("Invalid callback to write register 0x%04X with 0x%08X\n",
-		  reg, v);
+	dev_err(adev->dev,
+		"Invalid callback to write register 0x%04X with 0x%08X\n", reg,
+		v);
 	BUG();
 }
 
 static void amdgpu_invalid_wreg_ext(struct amdgpu_device *adev, uint64_t reg, uint32_t v)
 {
-	DRM_ERROR("Invalid callback to write register 0x%llX with 0x%08X\n",
-		  reg, v);
+	dev_err(adev->dev,
+		"Invalid callback to write register 0x%llX with 0x%08X\n", reg,
+		v);
 	BUG();
 }
 
@@ -1336,14 +1338,15 @@ static void amdgpu_invalid_wreg_ext(struct amdgpu_device *adev, uint64_t reg, ui
  */
 static uint64_t amdgpu_invalid_rreg64(struct amdgpu_device *adev, uint32_t reg)
 {
-	DRM_ERROR("Invalid callback to read 64 bit register 0x%04X\n", reg);
+	dev_err(adev->dev, "Invalid callback to read 64 bit register 0x%04X\n",
+		reg);
 	BUG();
 	return 0;
 }
 
 static uint64_t amdgpu_invalid_rreg64_ext(struct amdgpu_device *adev, uint64_t reg)
 {
-	DRM_ERROR("Invalid callback to read register 0x%llX\n", reg);
+	dev_err(adev->dev, "Invalid callback to read register 0x%llX\n", reg);
 	BUG();
 	return 0;
 }
@@ -1360,15 +1363,17 @@ static uint64_t amdgpu_invalid_rreg64_ext(struct amdgpu_device *adev, uint64_t r
  */
 static void amdgpu_invalid_wreg64(struct amdgpu_device *adev, uint32_t reg, uint64_t v)
 {
-	DRM_ERROR("Invalid callback to write 64 bit register 0x%04X with 0x%08llX\n",
-		  reg, v);
+	dev_err(adev->dev,
+		"Invalid callback to write 64 bit register 0x%04X with 0x%08llX\n",
+		reg, v);
 	BUG();
 }
 
 static void amdgpu_invalid_wreg64_ext(struct amdgpu_device *adev, uint64_t reg, uint64_t v)
 {
-	DRM_ERROR("Invalid callback to write 64 bit register 0x%llX with 0x%08llX\n",
-		  reg, v);
+	dev_err(adev->dev,
+		"Invalid callback to write 64 bit register 0x%llX with 0x%08llX\n",
+		reg, v);
 	BUG();
 }
 
@@ -1386,8 +1391,9 @@ static void amdgpu_invalid_wreg64_ext(struct amdgpu_device *adev, uint64_t reg,
 static uint32_t amdgpu_block_invalid_rreg(struct amdgpu_device *adev,
 					  uint32_t block, uint32_t reg)
 {
-	DRM_ERROR("Invalid callback to read register 0x%04X in block 0x%04X\n",
-		  reg, block);
+	dev_err(adev->dev,
+		"Invalid callback to read register 0x%04X in block 0x%04X\n",
+		reg, block);
 	BUG();
 	return 0;
 }
@@ -1407,8 +1413,9 @@ static void amdgpu_block_invalid_wreg(struct amdgpu_device *adev,
 				      uint32_t block,
 				      uint32_t reg, uint32_t v)
 {
-	DRM_ERROR("Invalid block callback to write register 0x%04X in block 0x%04X with 0x%08X\n",
-		  reg, block, v);
+	dev_err(adev->dev,
+		"Invalid block callback to write register 0x%04X in block 0x%04X with 0x%08X\n",
+		reg, block, v);
 	BUG();
 }
 
@@ -1694,7 +1701,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 
 	/* PCI_EXT_CAP_ID_VNDR extended capability is located at 0x100 */
 	if (!pci_find_ext_capability(adev->pdev, PCI_EXT_CAP_ID_VNDR))
-		DRM_WARN("System can't access extended configuration space, please check!!\n");
+		dev_warn(
+			adev->dev,
+			"System can't access extended configuration space, please check!!\n");
 
 	/* skip if the bios has already enabled large BAR */
 	if (adev->gmc.real_vram_size &&
@@ -1734,9 +1743,10 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 
 	r = pci_resize_resource(adev->pdev, 0, rbar_size);
 	if (r == -ENOSPC)
-		DRM_INFO("Not enough PCI address space for a large BAR.");
+		dev_info(adev->dev,
+			 "Not enough PCI address space for a large BAR.");
 	else if (r && r != -ENOTSUPP)
-		DRM_ERROR("Problem resizing BAR0 (%d).", r);
+		dev_err(adev->dev, "Problem resizing BAR0 (%d).", r);
 
 	pci_assign_unassigned_bus_resources(adev->pdev->bus);
 
@@ -1838,8 +1848,8 @@ bool amdgpu_device_seamless_boot_supported(struct amdgpu_device *adev)
 	case 0:
 		return false;
 	default:
-		DRM_ERROR("Invalid value for amdgpu.seamless: %d\n",
-			  amdgpu_seamless);
+		dev_err(adev->dev, "Invalid value for amdgpu.seamless: %d\n",
+			amdgpu_seamless);
 		return false;
 	}
 
@@ -2015,7 +2025,7 @@ static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
 		return;
 
 	if (!is_os_64) {
-		DRM_WARN("Not 64-bit OS, feature not supported\n");
+		dev_warn(adev->dev, "Not 64-bit OS, feature not supported\n");
 		goto def_value;
 	}
 	si_meminfo(&si);
@@ -2030,7 +2040,7 @@ static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
 		if (total_memory < dram_size_seven_GB)
 			goto def_value1;
 	} else {
-		DRM_WARN("Smu memory pool size not supported\n");
+		dev_warn(adev->dev, "Smu memory pool size not supported\n");
 		goto def_value;
 	}
 	adev->pm.smu_prv_buffer_size = amdgpu_smu_memory_pool_size << 28;
@@ -2038,7 +2048,7 @@ static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
 	return;
 
 def_value1:
-	DRM_WARN("No enough system memory\n");
+	dev_warn(adev->dev, "No enough system memory\n");
 def_value:
 	adev->pm.smu_prv_buffer_size = 0;
 }
@@ -2202,12 +2212,13 @@ static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
 		amdgpu_device_load_pci_state(pdev);
 		r = pci_enable_device(pdev);
 		if (r)
-			DRM_WARN("pci_enable_device failed (%d)\n", r);
+			dev_warn(&pdev->dev, "pci_enable_device failed (%d)\n",
+				 r);
 		amdgpu_device_resume(dev, true);
 
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	} else {
-		pr_info("switched off\n");
+		dev_info(&pdev->dev, "switched off\n");
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 		amdgpu_device_prepare(dev);
 		amdgpu_device_suspend(dev, true);
@@ -2274,8 +2285,9 @@ int amdgpu_device_ip_set_clockgating_state(void *dev,
 		r = adev->ip_blocks[i].version->funcs->set_clockgating_state(
 			&adev->ip_blocks[i], state);
 		if (r)
-			DRM_ERROR("set_clockgating_state of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+			dev_err(adev->dev,
+				"set_clockgating_state of IP block <%s> failed %d\n",
+				adev->ip_blocks[i].version->funcs->name, r);
 	}
 	return r;
 }
@@ -2308,8 +2320,9 @@ int amdgpu_device_ip_set_powergating_state(void *dev,
 		r = adev->ip_blocks[i].version->funcs->set_powergating_state(
 			&adev->ip_blocks[i], state);
 		if (r)
-			DRM_ERROR("set_powergating_state of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+			dev_err(adev->dev,
+				"set_powergating_state of IP block <%s> failed %d\n",
+				adev->ip_blocks[i].version->funcs->name, r);
 	}
 	return r;
 }
@@ -2525,9 +2538,11 @@ static void amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
 			}
 		}
 
-		DRM_INFO("virtual display string:%s, %s:virtual_display:%d, num_crtc:%d\n",
-			 amdgpu_virtual_display, pci_address_name,
-			 adev->enable_virtual_display, adev->mode_info.num_crtc);
+		dev_info(
+			adev->dev,
+			"virtual display string:%s, %s:virtual_display:%d, num_crtc:%d\n",
+			amdgpu_virtual_display, pci_address_name,
+			adev->enable_virtual_display, adev->mode_info.num_crtc);
 
 		kfree(pciaddstr);
 	}
@@ -2538,8 +2553,9 @@ void amdgpu_device_set_sriov_virtual_display(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev) && !adev->enable_virtual_display) {
 		adev->mode_info.num_crtc = 1;
 		adev->enable_virtual_display = true;
-		DRM_INFO("virtual_display:%d, num_crtc:%d\n",
-			 adev->enable_virtual_display, adev->mode_info.num_crtc);
+		dev_info(adev->dev, "virtual_display:%d, num_crtc:%d\n",
+			 adev->enable_virtual_display,
+			 adev->mode_info.num_crtc);
 	}
 }
 
@@ -2784,16 +2800,18 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		ip_block = &adev->ip_blocks[i];
 
 		if ((amdgpu_ip_block_mask & (1 << i)) == 0) {
-			DRM_WARN("disabled ip block: %d <%s>\n",
-				  i, adev->ip_blocks[i].version->funcs->name);
+			dev_warn(adev->dev, "disabled ip block: %d <%s>\n", i,
+				 adev->ip_blocks[i].version->funcs->name);
 			adev->ip_blocks[i].status.valid = false;
 		} else if (ip_block->version->funcs->early_init) {
 			r = ip_block->version->funcs->early_init(ip_block);
 			if (r == -ENOENT) {
 				adev->ip_blocks[i].status.valid = false;
 			} else if (r) {
-				DRM_ERROR("early_init of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"early_init of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				total = false;
 			} else {
 				adev->ip_blocks[i].status.valid = true;
@@ -2874,8 +2892,10 @@ static int amdgpu_device_ip_hw_init_phase1(struct amdgpu_device *adev)
 		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH) {
 			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
-				DRM_ERROR("hw_init of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"hw_init of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				return r;
 			}
 			adev->ip_blocks[i].status.hw = true;
@@ -2899,8 +2919,9 @@ static int amdgpu_device_ip_hw_init_phase2(struct amdgpu_device *adev)
 			continue;
 		r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 		if (r) {
-			DRM_ERROR("hw_init of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+			dev_err(adev->dev,
+				"hw_init of IP block <%s> failed %d\n",
+				adev->ip_blocks[i].version->funcs->name, r);
 			return r;
 		}
 		adev->ip_blocks[i].status.hw = true;
@@ -2938,8 +2959,11 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 			} else {
 				r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 				if (r) {
-					DRM_ERROR("hw_init of IP block <%s> failed %d\n",
-							  adev->ip_blocks[i].version->funcs->name, r);
+					dev_err(adev->dev,
+						"hw_init of IP block <%s> failed %d\n",
+						adev->ip_blocks[i]
+							.version->funcs->name,
+						r);
 					return r;
 				}
 				adev->ip_blocks[i].status.hw = true;
@@ -2994,20 +3018,23 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 
 		r = drm_sched_init(&ring->sched, &args);
 		if (r) {
-			DRM_ERROR("Failed to create scheduler on ring %s.\n",
-				  ring->name);
+			dev_err(adev->dev,
+				"Failed to create scheduler on ring %s.\n",
+				ring->name);
 			return r;
 		}
 		r = amdgpu_uvd_entity_init(adev, ring);
 		if (r) {
-			DRM_ERROR("Failed to create UVD scheduling entity on ring %s.\n",
-				  ring->name);
+			dev_err(adev->dev,
+				"Failed to create UVD scheduling entity on ring %s.\n",
+				ring->name);
 			return r;
 		}
 		r = amdgpu_vce_entity_init(adev, ring);
 		if (r) {
-			DRM_ERROR("Failed to create VCE scheduling entity on ring %s.\n",
-				  ring->name);
+			dev_err(adev->dev,
+				"Failed to create VCE scheduling entity on ring %s.\n",
+				ring->name);
 			return r;
 		}
 	}
@@ -3045,8 +3072,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		if (adev->ip_blocks[i].version->funcs->sw_init) {
 			r = adev->ip_blocks[i].version->funcs->sw_init(&adev->ip_blocks[i]);
 			if (r) {
-				DRM_ERROR("sw_init of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"sw_init of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				goto init_failed;
 			}
 		}
@@ -3060,7 +3089,8 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 			/* need to do common hw init early so everything is set up for gmc */
 			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
-				DRM_ERROR("hw_init %d failed %d\n", i, r);
+				dev_err(adev->dev, "hw_init %d failed %d\n", i,
+					r);
 				goto init_failed;
 			}
 			adev->ip_blocks[i].status.hw = true;
@@ -3072,17 +3102,21 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 
 			r = amdgpu_device_mem_scratch_init(adev);
 			if (r) {
-				DRM_ERROR("amdgpu_mem_scratch_init failed %d\n", r);
+				dev_err(adev->dev,
+					"amdgpu_mem_scratch_init failed %d\n",
+					r);
 				goto init_failed;
 			}
 			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
-				DRM_ERROR("hw_init %d failed %d\n", i, r);
+				dev_err(adev->dev, "hw_init %d failed %d\n", i,
+					r);
 				goto init_failed;
 			}
 			r = amdgpu_device_wb_init(adev);
 			if (r) {
-				DRM_ERROR("amdgpu_device_wb_init failed %d\n", r);
+				dev_err(adev->dev,
+					"amdgpu_device_wb_init failed %d\n", r);
 				goto init_failed;
 			}
 			adev->ip_blocks[i].status.hw = true;
@@ -3094,14 +3128,16 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 							       AMDGPU_GEM_DOMAIN_GTT,
 							       AMDGPU_CSA_SIZE);
 				if (r) {
-					DRM_ERROR("allocate CSA failed %d\n", r);
+					dev_err(adev->dev,
+						"allocate CSA failed %d\n", r);
 					goto init_failed;
 				}
 			}
 
 			r = amdgpu_seq64_init(adev);
 			if (r) {
-				DRM_ERROR("allocate seq64 failed %d\n", r);
+				dev_err(adev->dev, "allocate seq64 failed %d\n",
+					r);
 				goto init_failed;
 			}
 		}
@@ -3291,8 +3327,10 @@ int amdgpu_device_set_cg_state(struct amdgpu_device *adev,
 			r = adev->ip_blocks[i].version->funcs->set_clockgating_state(&adev->ip_blocks[i],
 										     state);
 			if (r) {
-				DRM_ERROR("set_clockgating_state(gate) of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"set_clockgating_state(gate) of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				return r;
 			}
 		}
@@ -3328,8 +3366,10 @@ int amdgpu_device_set_pg_state(struct amdgpu_device *adev,
 			r = adev->ip_blocks[i].version->funcs->set_powergating_state(&adev->ip_blocks[i],
 											state);
 			if (r) {
-				DRM_ERROR("set_powergating_state(gate) of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"set_powergating_state(gate) of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				return r;
 			}
 		}
@@ -3395,8 +3435,10 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 		if (adev->ip_blocks[i].version->funcs->late_init) {
 			r = adev->ip_blocks[i].version->funcs->late_init(&adev->ip_blocks[i]);
 			if (r) {
-				DRM_ERROR("late_init of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_err(adev->dev,
+					"late_init of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 				return r;
 			}
 		}
@@ -3405,7 +3447,7 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 
 	r = amdgpu_ras_late_init(adev);
 	if (r) {
-		DRM_ERROR("amdgpu_ras_late_init failed %d", r);
+		dev_err(adev->dev, "amdgpu_ras_late_init failed %d", r);
 		return r;
 	}
 
@@ -3419,7 +3461,7 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 
 	r = amdgpu_device_enable_mgpu_fan_boost();
 	if (r)
-		DRM_ERROR("enable mgpu fan boost failed (%d).\n", r);
+		dev_err(adev->dev, "enable mgpu fan boost failed (%d).\n", r);
 
 	/* For passthrough configuration on arcturus and aldebaran, enable special handling SBR */
 	if (amdgpu_passthrough(adev) &&
@@ -3452,7 +3494,9 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 				r = amdgpu_xgmi_set_pstate(gpu_instance->adev,
 						AMDGPU_XGMI_PSTATE_MIN);
 				if (r) {
-					DRM_ERROR("pstate setting failed (%d).\n", r);
+					dev_err(adev->dev,
+						"pstate setting failed (%d).\n",
+						r);
 					break;
 				}
 			}
@@ -3466,17 +3510,19 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 
 static void amdgpu_ip_block_hw_fini(struct amdgpu_ip_block *ip_block)
 {
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	if (!ip_block->version->funcs->hw_fini) {
-		DRM_ERROR("hw_fini of IP block <%s> not defined\n",
-			  ip_block->version->funcs->name);
+		dev_err(adev->dev, "hw_fini of IP block <%s> not defined\n",
+			ip_block->version->funcs->name);
 	} else {
 		r = ip_block->version->funcs->hw_fini(ip_block);
 		/* XXX handle errors */
 		if (r) {
-			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-				  ip_block->version->funcs->name, r);
+			dev_dbg(adev->dev,
+				"hw_fini of IP block <%s> failed %d\n",
+				ip_block->version->funcs->name, r);
 		}
 	}
 
@@ -3517,8 +3563,9 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 
 		r = adev->ip_blocks[i].version->funcs->early_fini(&adev->ip_blocks[i]);
 		if (r) {
-			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+			dev_dbg(adev->dev,
+				"early_fini of IP block <%s> failed %d\n",
+				adev->ip_blocks[i].version->funcs->name, r);
 		}
 	}
 
@@ -3540,7 +3587,8 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 
 	if (amdgpu_sriov_vf(adev)) {
 		if (amdgpu_virt_release_full_gpu(adev, false))
-			DRM_ERROR("failed to release exclusive mode on fini\n");
+			dev_err(adev->dev,
+				"failed to release exclusive mode on fini\n");
 	}
 
 	return 0;
@@ -3588,8 +3636,10 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 			r = adev->ip_blocks[i].version->funcs->sw_fini(&adev->ip_blocks[i]);
 			/* XXX handle errors */
 			if (r) {
-				DRM_DEBUG("sw_fini of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+				dev_dbg(adev->dev,
+					"sw_fini of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name,
+					r);
 			}
 		}
 		adev->ip_blocks[i].status.sw = false;
@@ -3622,7 +3672,7 @@ static void amdgpu_device_delayed_init_work_handler(struct work_struct *work)
 
 	r = amdgpu_ib_ring_tests(adev);
 	if (r)
-		DRM_ERROR("ib ring test failed (%d).\n", r);
+		dev_err(adev->dev, "ib ring test failed (%d).\n", r);
 }
 
 static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
@@ -3763,8 +3813,9 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 			if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
 				r = amdgpu_dpm_set_mp1_state(adev, adev->mp1_state);
 				if (r) {
-					DRM_ERROR("SMC failed to set mp1 state %d, %d\n",
-							adev->mp1_state, r);
+					dev_err(adev->dev,
+						"SMC failed to set mp1 state %d, %d\n",
+						adev->mp1_state, r);
 					return r;
 				}
 			}
@@ -4096,7 +4147,9 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 #else
 	default:
 		if (amdgpu_dc > 0)
-			DRM_INFO_ONCE("Display Core has been requested via kernel parameter but isn't supported by ASIC, ignoring\n");
+			dev_info_once(
+				adev->dev,
+				"Display Core has been requested via kernel parameter but isn't supported by ASIC, ignoring\n");
 		return false;
 #endif
 	}
@@ -4157,7 +4210,8 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 
 fail:
 	if (adev->asic_reset_res)
-		DRM_WARN("ASIC reset failed with error, %d for drm dev, %s",
+		dev_warn(adev->dev,
+			 "ASIC reset failed with error, %d for drm dev, %s",
 			 adev->asic_reset_res, adev_to_drm(adev)->unique);
 	amdgpu_put_xgmi_hive(hive);
 }
@@ -4281,7 +4335,7 @@ static void amdgpu_device_set_mcbp(struct amdgpu_device *adev)
 		adev->gfx.mcbp = true;
 
 	if (adev->gfx.mcbp)
-		DRM_INFO("MCBP is enabled\n");
+		dev_info(adev->dev, "MCBP is enabled\n");
 }
 
 /**
@@ -4349,9 +4403,11 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->audio_endpt_rreg = &amdgpu_block_invalid_rreg;
 	adev->audio_endpt_wreg = &amdgpu_block_invalid_wreg;
 
-	DRM_INFO("initializing kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04X 0x%02X).\n",
-		 amdgpu_asic_name[adev->asic_type], pdev->vendor, pdev->device,
-		 pdev->subsystem_vendor, pdev->subsystem_device, pdev->revision);
+	dev_info(
+		adev->dev,
+		"initializing kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04X 0x%02X).\n",
+		amdgpu_asic_name[adev->asic_type], pdev->vendor, pdev->device,
+		pdev->subsystem_vendor, pdev->subsystem_device, pdev->revision);
 
 	/* mutex initialization are all done here so we
 	 * can recall function without having locking issues
@@ -4468,8 +4524,10 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (!adev->rmmio)
 		return -ENOMEM;
 
-	DRM_INFO("register mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
-	DRM_INFO("register mmio size: %u\n", (unsigned int)adev->rmmio_size);
+	dev_info(adev->dev, "register mmio base: 0x%08X\n",
+		 (uint32_t)adev->rmmio_base);
+	dev_info(adev->dev, "register mmio size: %u\n",
+		 (unsigned int)adev->rmmio_size);
 
 	/*
 	 * Reset domain needs to be present early, before XGMI hive discovered
@@ -4606,7 +4664,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			r = -EINVAL;
 			goto failed;
 		}
-		DRM_INFO("GPU posting now...\n");
+		dev_info(adev->dev, "GPU posting now...\n");
 		r = amdgpu_device_asic_init(adev);
 		if (r) {
 			dev_err(adev->dev, "gpu post error!\n");
@@ -4716,12 +4774,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	r = amdgpu_pm_sysfs_init(adev);
 	if (r)
-		DRM_ERROR("registering pm sysfs failed (%d).\n", r);
+		dev_err(adev->dev, "registering pm sysfs failed (%d).\n", r);
 
 	r = amdgpu_ucode_sysfs_init(adev);
 	if (r) {
 		adev->ucode_sysfs_en = false;
-		DRM_ERROR("Creating firmware sysfs failed (%d).\n", r);
+		dev_err(adev->dev, "Creating firmware sysfs failed (%d).\n", r);
 	} else
 		adev->ucode_sysfs_en = true;
 
@@ -4970,7 +5028,7 @@ static int amdgpu_device_evict_resources(struct amdgpu_device *adev)
 
 	ret = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
 	if (ret)
-		DRM_WARN("evicting device resources failed\n");
+		dev_warn(adev->dev, "evicting device resources failed\n");
 	return ret;
 }
 
@@ -5093,7 +5151,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	}
 
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
-		DRM_WARN("smart shift update failed\n");
+		dev_warn(adev->dev, "smart shift update failed\n");
 
 	if (notify_clients)
 		drm_client_dev_suspend(adev_to_drm(adev), false);
@@ -5262,7 +5320,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	adev->in_suspend = false;
 
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
-		DRM_WARN("smart shift update failed\n");
+		dev_warn(adev->dev, "smart shift update failed\n");
 
 	return 0;
 }
@@ -5793,7 +5851,9 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 					amdgpu_coredump(tmp_adev, false, vram_lost, reset_context->job);
 
 				if (vram_lost) {
-					DRM_INFO("VRAM is lost due to GPU reset!\n");
+					dev_info(
+						tmp_adev->dev,
+						"VRAM is lost due to GPU reset!\n");
 					amdgpu_inc_vram_lost(tmp_adev);
 				}
 
@@ -6305,7 +6365,8 @@ static int amdgpu_device_sched_resume(struct list_head *device_list,
 		} else {
 			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
 			if (amdgpu_acpi_smart_shift_update(adev_to_drm(tmp_adev), AMDGPU_SS_DEV_D0))
-				DRM_WARN("smart shift update failed\n");
+				dev_warn(tmp_adev->dev,
+					 "smart shift update failed\n");
 		}
 	}
 
@@ -6386,7 +6447,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 */
 	if (need_emergency_restart && amdgpu_ras_get_context(adev) &&
 		amdgpu_ras_get_context(adev)->reboot) {
-		DRM_WARN("Emergency reboot.");
+		dev_warn(adev->dev, "Emergency reboot.");
 
 		ksys_sync_helper();
 		emergency_restart();
@@ -7042,11 +7103,11 @@ bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)
 		adev->pci_state = pci_store_saved_state(pdev);
 
 		if (!adev->pci_state) {
-			DRM_ERROR("Failed to store PCI saved state");
+			dev_err(adev->dev, "Failed to store PCI saved state");
 			return false;
 		}
 	} else {
-		DRM_WARN("Failed to save PCI state, err:%d\n", r);
+		dev_warn(adev->dev, "Failed to save PCI state, err:%d\n", r);
 		return false;
 	}
 
@@ -7067,7 +7128,7 @@ bool amdgpu_device_load_pci_state(struct pci_dev *pdev)
 	if (!r) {
 		pci_restore_state(pdev);
 	} else {
-		DRM_WARN("Failed to load PCI state, err:%d\n", r);
+		dev_warn(adev->dev, "Failed to load PCI state, err:%d\n", r);
 		return false;
 	}
 
@@ -7313,7 +7374,7 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
 	dep = amdgpu_sync_peek_fence(&isolation->prev, ring);
 	r = amdgpu_sync_fence(&isolation->active, &f->finished, GFP_NOWAIT);
 	if (r)
-		DRM_WARN("OOM tracking isolation\n");
+		dev_warn(adev->dev, "OOM tracking isolation\n");
 
 out_grab_ref:
 	dma_fence_get(dep);
@@ -7381,9 +7442,11 @@ uint32_t amdgpu_device_wait_on_rreg(struct amdgpu_device *adev,
 		tmp_ = RREG32(reg_addr);
 		loop--;
 		if (!loop) {
-			DRM_WARN("Register(%d) [%s] failed to reach value 0x%08x != 0x%08xn",
-				  inst, reg_name, (uint32_t)expected_value,
-				  (uint32_t)(tmp_ & (mask)));
+			dev_warn(
+				adev->dev,
+				"Register(%d) [%s] failed to reach value 0x%08x != 0x%08xn",
+				inst, reg_name, (uint32_t)expected_value,
+				(uint32_t)(tmp_ & (mask)));
 			ret = -ETIMEDOUT;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index 3f3662e8b871..3040437d99c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -41,7 +41,8 @@ u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, u32 index)
 	if (index < adev->doorbell.num_kernel_doorbells)
 		return readl(adev->doorbell.cpu_addr + index);
 
-	DRM_ERROR("reading beyond doorbell aperture: 0x%08x!\n", index);
+	dev_err(adev->dev, "reading beyond doorbell aperture: 0x%08x!\n",
+		index);
 	return 0;
 }
 
@@ -63,7 +64,8 @@ void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
 	if (index < adev->doorbell.num_kernel_doorbells)
 		writel(v, adev->doorbell.cpu_addr + index);
 	else
-		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
+		dev_err(adev->dev,
+			"writing beyond doorbell aperture: 0x%08x!\n", index);
 }
 
 /**
@@ -83,7 +85,8 @@ u64 amdgpu_mm_rdoorbell64(struct amdgpu_device *adev, u32 index)
 	if (index < adev->doorbell.num_kernel_doorbells)
 		return atomic64_read((atomic64_t *)(adev->doorbell.cpu_addr + index));
 
-	DRM_ERROR("reading beyond doorbell aperture: 0x%08x!\n", index);
+	dev_err(adev->dev, "reading beyond doorbell aperture: 0x%08x!\n",
+		index);
 	return 0;
 }
 
@@ -105,7 +108,8 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
 	if (index < adev->doorbell.num_kernel_doorbells)
 		atomic64_set((atomic64_t *)(adev->doorbell.cpu_addr + index), v);
 	else
-		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
+		dev_err(adev->dev,
+			"writing beyond doorbell aperture: 0x%08x!\n", index);
 }
 
 /**
@@ -166,7 +170,8 @@ int amdgpu_doorbell_create_kernel_doorbells(struct amdgpu_device *adev)
 				    NULL,
 				    (void **)&adev->doorbell.cpu_addr);
 	if (r) {
-		DRM_ERROR("Failed to allocate kernel doorbells, err=%d\n", r);
+		dev_err(adev->dev,
+			"Failed to allocate kernel doorbells, err=%d\n", r);
 		return r;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 59ac6afa4db2..dc92952bf126 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -295,7 +295,9 @@ static void amdgpu_fence_fallback(struct timer_list *t)
 					      fence_drv.fallback_timer);
 
 	if (amdgpu_fence_process(ring))
-		DRM_WARN("Fence fallback timer expired on ring %s\n", ring->name);
+		dev_warn(ring->adev->dev,
+			 "Fence fallback timer expired on ring %s\n",
+			 ring->name);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
index 1ae88c459da5..b0082aa7f3c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
@@ -144,7 +144,8 @@ int amdgpu_fru_get_product_info(struct amdgpu_device *adev)
 
 	/* If algo exists, it means that the i2c_adapter's initialized */
 	if (!adev->pm.fru_eeprom_i2c_bus || !adev->pm.fru_eeprom_i2c_bus->algo) {
-		DRM_WARN("Cannot access FRU, EEPROM accessor not initialized");
+		dev_warn(adev->dev,
+			 "Cannot access FRU, EEPROM accessor not initialized");
 		return -ENODEV;
 	}
 
@@ -152,19 +153,22 @@ int amdgpu_fru_get_product_info(struct amdgpu_device *adev)
 	len = amdgpu_eeprom_read(adev->pm.fru_eeprom_i2c_bus, fru_addr, buf,
 				 sizeof(buf));
 	if (len != 8) {
-		DRM_ERROR("Couldn't read the IPMI Common Header: %d", len);
+		dev_err(adev->dev, "Couldn't read the IPMI Common Header: %d",
+			len);
 		return len < 0 ? len : -EIO;
 	}
 
 	if (buf[0] != 1) {
-		DRM_ERROR("Bad IPMI Common Header version: 0x%02x", buf[0]);
+		dev_err(adev->dev, "Bad IPMI Common Header version: 0x%02x",
+			buf[0]);
 		return -EIO;
 	}
 
 	for (csum = 0; len > 0; len--)
 		csum += buf[len - 1];
 	if (csum) {
-		DRM_ERROR("Bad IPMI Common Header checksum: 0x%02x", csum);
+		dev_err(adev->dev, "Bad IPMI Common Header checksum: 0x%02x",
+			csum);
 		return -EIO;
 	}
 
@@ -179,12 +183,14 @@ int amdgpu_fru_get_product_info(struct amdgpu_device *adev)
 	/* Read the header of the PIA. */
 	len = amdgpu_eeprom_read(adev->pm.fru_eeprom_i2c_bus, addr, buf, 3);
 	if (len != 3) {
-		DRM_ERROR("Couldn't read the Product Info Area header: %d", len);
+		dev_err(adev->dev,
+			"Couldn't read the Product Info Area header: %d", len);
 		return len < 0 ? len : -EIO;
 	}
 
 	if (buf[0] != 1) {
-		DRM_ERROR("Bad IPMI Product Info Area version: 0x%02x", buf[0]);
+		dev_err(adev->dev, "Bad IPMI Product Info Area version: 0x%02x",
+			buf[0]);
 		return -EIO;
 	}
 
@@ -197,14 +203,16 @@ int amdgpu_fru_get_product_info(struct amdgpu_device *adev)
 	len = amdgpu_eeprom_read(adev->pm.fru_eeprom_i2c_bus, addr, pia, size);
 	if (len != size) {
 		kfree(pia);
-		DRM_ERROR("Couldn't read the Product Info Area: %d", len);
+		dev_err(adev->dev, "Couldn't read the Product Info Area: %d",
+			len);
 		return len < 0 ? len : -EIO;
 	}
 
 	for (csum = 0; size > 0; size--)
 		csum += pia[size - 1];
 	if (csum) {
-		DRM_ERROR("Bad Product Info Area checksum: 0x%02x", csum);
+		dev_err(adev->dev, "Bad Product Info Area checksum: 0x%02x",
+			csum);
 		kfree(pia);
 		return -EIO;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index c5646af055ab..c80c8f543532 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -149,7 +149,7 @@ static bool amdgpu_gfx_is_graphics_multipipe_capable(struct amdgpu_device *adev)
 static bool amdgpu_gfx_is_compute_multipipe_capable(struct amdgpu_device *adev)
 {
 	if (amdgpu_compute_multipipe != -1) {
-		DRM_INFO("amdgpu: forcing compute pipe policy %d\n",
+		dev_info(adev->dev, "amdgpu: forcing compute pipe policy %d\n",
 			 amdgpu_compute_multipipe);
 		return amdgpu_compute_multipipe == 1;
 	}
@@ -674,7 +674,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 		 * generation exposes more than 64 queues. If so, the
 		 * definition of queue_mask needs updating */
 		if (WARN_ON(i > (sizeof(queue_mask)*8))) {
-			DRM_ERROR("Invalid KCQ enabled: %d\n", i);
+			dev_err(adev->dev, "Invalid KCQ enabled: %d\n", i);
 			break;
 		}
 
@@ -683,15 +683,15 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	DRM_INFO("kiq ring mec %d pipe %d q %d\n", kiq_ring->me, kiq_ring->pipe,
-		 kiq_ring->queue);
+	dev_info(adev->dev, "kiq ring mec %d pipe %d q %d\n", kiq_ring->me,
+		 kiq_ring->pipe, kiq_ring->queue);
 
 	spin_lock(&kiq->ring_lock);
 	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size *
 					adev->gfx.num_compute_rings +
 					kiq->pmf->set_resources_size);
 	if (r) {
-		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
+		dev_err(adev->dev, "Failed to lock KIQ (%d).\n", r);
 		spin_unlock(&kiq->ring_lock);
 		return r;
 	}
@@ -712,7 +712,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 	r = amdgpu_ring_test_helper(kiq_ring);
 	spin_unlock(&kiq->ring_lock);
 	if (r)
-		DRM_ERROR("KCQ enable failed\n");
+		dev_err(adev->dev, "KCQ enable failed\n");
 
 	return r;
 }
@@ -734,7 +734,7 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev, int xcc_id)
 			r = amdgpu_mes_map_legacy_queue(adev,
 							&adev->gfx.gfx_ring[j]);
 			if (r) {
-				DRM_ERROR("failed to map gfx queue\n");
+				dev_err(adev->dev, "failed to map gfx queue\n");
 				return r;
 			}
 		}
@@ -748,7 +748,7 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev, int xcc_id)
 		r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size *
 						adev->gfx.num_gfx_rings);
 		if (r) {
-			DRM_ERROR("Failed to lock KIQ (%d).\n", r);
+			dev_err(adev->dev, "Failed to lock KIQ (%d).\n", r);
 			spin_unlock(&kiq->ring_lock);
 			return r;
 		}
@@ -769,7 +769,7 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev, int xcc_id)
 	r = amdgpu_ring_test_helper(kiq_ring);
 	spin_unlock(&kiq->ring_lock);
 	if (r)
-		DRM_ERROR("KGQ enable failed\n");
+		dev_err(adev->dev, "KGQ enable failed\n");
 
 	return r;
 }
@@ -1030,7 +1030,7 @@ int amdgpu_gfx_cp_ecc_error_irq(struct amdgpu_device *adev,
 
 	ih_data.head = *ras_if;
 
-	DRM_ERROR("CP ECC ERROR IRQ\n");
+	dev_err(adev->dev, "CP ECC ERROR IRQ\n");
 	amdgpu_ras_interrupt_dispatch(adev, &ih_data);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
index 30f16968b578..a6419246e9c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
@@ -218,7 +218,7 @@ int amdgpu_ih_process(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
 
 restart_ih:
 	count  = AMDGPU_IH_MAX_NUM_IVS;
-	DRM_DEBUG("%s: rptr %d, wptr %d\n", __func__, ih->rptr, wptr);
+	dev_dbg(adev->dev, "%s: rptr %d, wptr %d\n", __func__, ih->rptr, wptr);
 
 	/* Order reading of wptr vs. reading of IH ring data */
 	rmb();
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 56d973faca41..cf988077a3ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -142,8 +142,9 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)
 				r = src->funcs->set(adev, src, k,
 						    AMDGPU_IRQ_STATE_DISABLE);
 				if (r)
-					DRM_ERROR("error disabling interrupt (%d)\n",
-						  r);
+					dev_err(adev->dev,
+						"error disabling interrupt (%d)\n",
+						r);
 			}
 		}
 	}
@@ -315,7 +316,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	adev->irq.irq = irq;
 	adev_to_drm(adev)->max_vblank_count = 0x00ffffff;
 
-	DRM_DEBUG("amdgpu: irq initialized.\n");
+	dev_dbg(adev->dev, "amdgpu: irq initialized.\n");
 	return 0;
 
 free_vectors:
@@ -461,10 +462,10 @@ void amdgpu_irq_dispatch(struct amdgpu_device *adev,
 	src_id = entry.src_id;
 
 	if (client_id >= AMDGPU_IRQ_CLIENTID_MAX) {
-		DRM_DEBUG("Invalid client_id in IV: %d\n", client_id);
+		dev_dbg(adev->dev, "Invalid client_id in IV: %d\n", client_id);
 
 	} else	if (src_id >= AMDGPU_MAX_IRQ_SRC_ID) {
-		DRM_DEBUG("Invalid src_id in IV: %d\n", src_id);
+		dev_dbg(adev->dev, "Invalid src_id in IV: %d\n", src_id);
 
 	} else if (((client_id == AMDGPU_IRQ_CLIENTID_LEGACY) ||
 		    (client_id == SOC15_IH_CLIENTID_ISP)) &&
@@ -472,18 +473,21 @@ void amdgpu_irq_dispatch(struct amdgpu_device *adev,
 		generic_handle_domain_irq(adev->irq.domain, src_id);
 
 	} else if (!adev->irq.client[client_id].sources) {
-		DRM_DEBUG("Unregistered interrupt client_id: %d src_id: %d\n",
-			  client_id, src_id);
+		dev_dbg(adev->dev,
+			"Unregistered interrupt client_id: %d src_id: %d\n",
+			client_id, src_id);
 
 	} else if ((src = adev->irq.client[client_id].sources[src_id])) {
 		r = src->funcs->process(adev, src, &entry);
 		if (r < 0)
-			DRM_ERROR("error processing interrupt (%d)\n", r);
+			dev_err(adev->dev, "error processing interrupt (%d)\n",
+				r);
 		else if (r)
 			handled = true;
 
 	} else {
-		DRM_DEBUG("Unregistered interrupt src_id: %d of client_id:%d\n",
+		dev_dbg(adev->dev,
+			"Unregistered interrupt src_id: %d of client_id:%d\n",
 			src_id, client_id);
 	}
 
@@ -732,7 +736,7 @@ int amdgpu_irq_add_domain(struct amdgpu_device *adev)
 	adev->irq.domain = irq_domain_add_linear(NULL, AMDGPU_MAX_IRQ_SRC_ID,
 						 &amdgpu_hw_irqdomain_ops, adev);
 	if (!adev->irq.domain) {
-		DRM_ERROR("GPU irq add domain failed\n");
+		dev_err(adev->dev, "GPU irq add domain failed\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index dda29132dfb2..82d58ac7afb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -463,7 +463,8 @@ int amdgpu_jpeg_reg_dump_init(struct amdgpu_device *adev,
 	adev->jpeg.ip_dump = kcalloc(adev->jpeg.num_jpeg_inst * count,
 				     sizeof(uint32_t), GFP_KERNEL);
 	if (!adev->jpeg.ip_dump) {
-		DRM_ERROR("Failed to allocate memory for JPEG IP Dump\n");
+		dev_err(adev->dev,
+			"Failed to allocate memory for JPEG IP Dump\n");
 		return -ENOMEM;
 	}
 	adev->jpeg.reg_list = reg;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 6fa9fa11c8f3..135598502c8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -47,7 +47,7 @@ static int amdgpu_mes_doorbell_init(struct amdgpu_device *adev)
 	/* Bitmap for dynamic allocation of kernel doorbells */
 	mes->doorbell_bitmap = bitmap_zalloc(PAGE_SIZE / sizeof(u32), GFP_KERNEL);
 	if (!mes->doorbell_bitmap) {
-		DRM_ERROR("Failed to allocate MES doorbell bitmap\n");
+		dev_err(adev->dev, "Failed to allocate MES doorbell bitmap\n");
 		return -ENOMEM;
 	}
 
@@ -256,7 +256,7 @@ int amdgpu_mes_suspend(struct amdgpu_device *adev)
 	r = adev->mes.funcs->suspend_gang(&adev->mes, &input);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r)
-		DRM_ERROR("failed to suspend all gangs");
+		dev_err(adev->dev, "failed to suspend all gangs");
 
 	return r;
 }
@@ -280,7 +280,7 @@ int amdgpu_mes_resume(struct amdgpu_device *adev)
 	r = adev->mes.funcs->resume_gang(&adev->mes, &input);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r)
-		DRM_ERROR("failed to resume all gangs");
+		dev_err(adev->dev, "failed to resume all gangs");
 
 	return r;
 }
@@ -304,7 +304,7 @@ int amdgpu_mes_map_legacy_queue(struct amdgpu_device *adev,
 	r = adev->mes.funcs->map_legacy_queue(&adev->mes, &queue_input);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r)
-		DRM_ERROR("failed to map legacy queue\n");
+		dev_err(adev->dev, "failed to map legacy queue\n");
 
 	return r;
 }
@@ -329,7 +329,7 @@ int amdgpu_mes_unmap_legacy_queue(struct amdgpu_device *adev,
 	r = adev->mes.funcs->unmap_legacy_queue(&adev->mes, &queue_input);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r)
-		DRM_ERROR("failed to unmap legacy queue\n");
+		dev_err(adev->dev, "failed to unmap legacy queue\n");
 
 	return r;
 }
@@ -361,7 +361,7 @@ int amdgpu_mes_reset_legacy_queue(struct amdgpu_device *adev,
 	r = adev->mes.funcs->reset_hw_queue(&adev->mes, &queue_input);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r)
-		DRM_ERROR("failed to reset legacy queue\n");
+		dev_err(adev->dev, "failed to reset legacy queue\n");
 
 	return r;
 }
@@ -469,7 +469,8 @@ int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
 	int r;
 
 	if (!adev->mes.funcs->misc_op) {
-		DRM_ERROR("mes set shader debugger is not supported!\n");
+		dev_err(adev->dev,
+			"mes set shader debugger is not supported!\n");
 		return -EINVAL;
 	}
 
@@ -493,7 +494,7 @@ int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
 
 	r = adev->mes.funcs->misc_op(&adev->mes, &op_input);
 	if (r)
-		DRM_ERROR("failed to set_shader_debugger\n");
+		dev_err(adev->dev, "failed to set_shader_debugger\n");
 
 	amdgpu_mes_unlock(&adev->mes);
 
@@ -507,7 +508,8 @@ int amdgpu_mes_flush_shader_debugger(struct amdgpu_device *adev,
 	int r;
 
 	if (!adev->mes.funcs->misc_op) {
-		DRM_ERROR("mes flush shader debugger is not supported!\n");
+		dev_err(adev->dev,
+			"mes flush shader debugger is not supported!\n");
 		return -EINVAL;
 	}
 
@@ -519,7 +521,7 @@ int amdgpu_mes_flush_shader_debugger(struct amdgpu_device *adev,
 
 	r = adev->mes.funcs->misc_op(&adev->mes, &op_input);
 	if (r)
-		DRM_ERROR("failed to set_shader_debugger\n");
+		dev_err(adev->dev, "failed to set_shader_debugger\n");
 
 	amdgpu_mes_unlock(&adev->mes);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 2af14c369bb9..54838746f97d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -277,10 +277,11 @@ static int __write_table_header(struct amdgpu_ras_eeprom_control *control)
 	up_read(&adev->reset_domain->sem);
 
 	if (res < 0) {
-		DRM_ERROR("Failed to write EEPROM table header:%d", res);
+		dev_err(adev->dev, "Failed to write EEPROM table header:%d",
+			res);
 	} else if (res < RAS_TABLE_HEADER_SIZE) {
-		DRM_ERROR("Short write:%d out of %d\n",
-			  res, RAS_TABLE_HEADER_SIZE);
+		dev_err(adev->dev, "Short write:%d out of %d\n", res,
+			RAS_TABLE_HEADER_SIZE);
 		res = -EIO;
 	} else {
 		res = 0;
@@ -323,7 +324,8 @@ static int __write_table_ras_info(struct amdgpu_ras_eeprom_control *control)
 
 	buf = kzalloc(RAS_TABLE_V2_1_INFO_SIZE, GFP_KERNEL);
 	if (!buf) {
-		DRM_ERROR("Failed to alloc buf to write table ras info\n");
+		dev_err(adev->dev,
+			"Failed to alloc buf to write table ras info\n");
 		return -ENOMEM;
 	}
 
@@ -338,10 +340,11 @@ static int __write_table_ras_info(struct amdgpu_ras_eeprom_control *control)
 	up_read(&adev->reset_domain->sem);
 
 	if (res < 0) {
-		DRM_ERROR("Failed to write EEPROM table ras info:%d", res);
+		dev_err(adev->dev, "Failed to write EEPROM table ras info:%d",
+			res);
 	} else if (res < RAS_TABLE_V2_1_INFO_SIZE) {
-		DRM_ERROR("Short write:%d out of %d\n",
-			  res, RAS_TABLE_V2_1_INFO_SIZE);
+		dev_err(adev->dev, "Short write:%d out of %d\n", res,
+			RAS_TABLE_V2_1_INFO_SIZE);
 		res = -EIO;
 	} else {
 		res = 0;
@@ -609,13 +612,13 @@ static int __amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
 				  buf, buf_size);
 	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
-		DRM_ERROR("Writing %d EEPROM table records error:%d",
-			  num, res);
+		dev_err(adev->dev, "Writing %d EEPROM table records error:%d",
+			num, res);
 	} else if (res < buf_size) {
 		/* Short write, return error.
 		 */
-		DRM_ERROR("Wrote %d records out of %d",
-			  res / RAS_TABLE_RECORD_SIZE, num);
+		dev_err(adev->dev, "Wrote %d records out of %d",
+			res / RAS_TABLE_RECORD_SIZE, num);
 		res = -EIO;
 	} else {
 		res = 0;
@@ -788,8 +791,9 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
 	buf_size = control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
 	buf = kcalloc(control->ras_num_recs, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
 	if (!buf) {
-		DRM_ERROR("allocating memory for table of size %d bytes failed\n",
-			  control->tbl_hdr.tbl_size);
+		dev_err(adev->dev,
+			"allocating memory for table of size %d bytes failed\n",
+			control->tbl_hdr.tbl_size);
 		res = -ENOMEM;
 		goto Out;
 	}
@@ -801,12 +805,11 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
 				 buf, buf_size);
 	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
-		DRM_ERROR("EEPROM failed reading records:%d\n",
-			  res);
+		dev_err(adev->dev, "EEPROM failed reading records:%d\n", res);
 		goto Out;
 	} else if (res < buf_size) {
-		DRM_ERROR("EEPROM read %d out of %d bytes\n",
-			  res, buf_size);
+		dev_err(adev->dev, "EEPROM read %d out of %d bytes\n", res,
+			buf_size);
 		res = -EIO;
 		goto Out;
 	}
@@ -867,11 +870,12 @@ int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
 		return 0;
 
 	if (num == 0) {
-		DRM_ERROR("will not append 0 records\n");
+		dev_err(adev->dev, "will not append 0 records\n");
 		return -EINVAL;
 	} else if (num > control->ras_max_record_count) {
-		DRM_ERROR("cannot append %d records than the size of table %d\n",
-			  num, control->ras_max_record_count);
+		dev_err(adev->dev,
+			"cannot append %d records than the size of table %d\n",
+			num, control->ras_max_record_count);
 		return -EINVAL;
 	}
 
@@ -925,13 +929,13 @@ static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 				 buf, buf_size);
 	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
-		DRM_ERROR("Reading %d EEPROM table records error:%d",
-			  num, res);
+		dev_err(adev->dev, "Reading %d EEPROM table records error:%d",
+			num, res);
 	} else if (res < buf_size) {
 		/* Short read, return error.
 		 */
-		DRM_ERROR("Read %d records out of %d",
-			  res / RAS_TABLE_RECORD_SIZE, num);
+		dev_err(adev->dev, "Read %d records out of %d",
+			res / RAS_TABLE_RECORD_SIZE, num);
 		res = -EIO;
 	} else {
 		res = 0;
@@ -965,11 +969,11 @@ int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 		return 0;
 
 	if (num == 0) {
-		DRM_ERROR("will not read 0 records\n");
+		dev_err(adev->dev, "will not read 0 records\n");
 		return -EINVAL;
 	} else if (num > control->ras_num_recs) {
-		DRM_ERROR("too many records to read:%d available:%d\n",
-			  num, control->ras_num_recs);
+		dev_err(adev->dev, "too many records to read:%d available:%d\n",
+			num, control->ras_num_recs);
 		return -EINVAL;
 	}
 
@@ -1301,7 +1305,8 @@ static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control
 
 	buf = kzalloc(buf_size, GFP_KERNEL);
 	if (!buf) {
-		DRM_ERROR("Out of memory checking RAS table checksum.\n");
+		dev_err(adev->dev,
+			"Out of memory checking RAS table checksum.\n");
 		return -ENOMEM;
 	}
 
@@ -1310,7 +1315,7 @@ static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control
 				 control->ras_header_offset,
 				 buf, buf_size);
 	if (res < buf_size) {
-		DRM_ERROR("Partial read for checksum, res:%d\n", res);
+		dev_err(adev->dev, "Partial read for checksum, res:%d\n", res);
 		/* On partial reads, return -EIO.
 		 */
 		if (res >= 0)
@@ -1335,7 +1340,8 @@ static int __read_table_ras_info(struct amdgpu_ras_eeprom_control *control)
 
 	buf = kzalloc(RAS_TABLE_V2_1_INFO_SIZE, GFP_KERNEL);
 	if (!buf) {
-		DRM_ERROR("Failed to alloc buf to read EEPROM table ras info\n");
+		dev_err(adev->dev,
+			"Failed to alloc buf to read EEPROM table ras info\n");
 		return -ENOMEM;
 	}
 
@@ -1347,7 +1353,8 @@ static int __read_table_ras_info(struct amdgpu_ras_eeprom_control *control)
 				 control->i2c_address + control->ras_info_offset,
 				 buf, RAS_TABLE_V2_1_INFO_SIZE);
 	if (res < RAS_TABLE_V2_1_INFO_SIZE) {
-		DRM_ERROR("Failed to read EEPROM table ras info, res:%d", res);
+		dev_err(adev->dev,
+			"Failed to read EEPROM table ras info, res:%d", res);
 		res = res >= 0 ? -EIO : res;
 		goto Out;
 	}
@@ -1388,7 +1395,8 @@ int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control)
 				 control->i2c_address + control->ras_header_offset,
 				 buf, RAS_TABLE_HEADER_SIZE);
 	if (res < RAS_TABLE_HEADER_SIZE) {
-		DRM_ERROR("Failed to read EEPROM table header, res:%d", res);
+		dev_err(adev->dev, "Failed to read EEPROM table header, res:%d",
+			res);
 		return res >= 0 ? -EIO : res;
 	}
 
@@ -1453,8 +1461,9 @@ int amdgpu_ras_eeprom_check(struct amdgpu_ras_eeprom_control *control)
 			control->ras_num_mca_recs * adev->umc.retire_unit;
 
 	if (hdr->header == RAS_TABLE_HDR_VAL) {
-		DRM_DEBUG_DRIVER("Found existing EEPROM table with %d records",
-				 control->ras_num_bad_pages);
+		dev_dbg(adev->dev,
+			"Found existing EEPROM table with %d records",
+			control->ras_num_bad_pages);
 
 		if (hdr->version >= RAS_TABLE_VER_V2_1) {
 			res = __read_table_ras_info(control);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 984fe8c6d480..80a5fc375da3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -299,7 +299,8 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	struct amdgpu_bo *abo_src, *abo_dst;
 
 	if (!adev->mman.buffer_funcs_enabled) {
-		DRM_ERROR("Trying to move memory with ring turned off.\n");
+		dev_err(adev->dev,
+			"Trying to move memory with ring turned off.\n");
 		return -EINVAL;
 	}
 
@@ -934,7 +935,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	if (gtt->userptr) {
 		r = amdgpu_ttm_tt_pin_userptr(bdev, ttm);
 		if (r) {
-			DRM_ERROR("failed to pin userptr\n");
+			dev_err(adev->dev, "failed to pin userptr\n");
 			return r;
 		}
 	} else if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) {
@@ -1781,7 +1782,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 						 &ctx->c2p_bo,
 						 NULL);
 		if (ret) {
-			DRM_ERROR("alloc c2p_bo failed(%d)!\n", ret);
+			dev_err(adev->dev, "alloc c2p_bo failed(%d)!\n", ret);
 			amdgpu_ttm_training_reserve_vram_fini(adev);
 			return ret;
 		}
@@ -1793,7 +1794,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 			adev, adev->gmc.real_vram_size - reserve_size,
 			reserve_size, &adev->mman.fw_reserved_memory, NULL);
 		if (ret) {
-			DRM_ERROR("alloc tmr failed(%d)!\n", ret);
+			dev_err(adev->dev, "alloc tmr failed(%d)!\n", ret);
 			amdgpu_bo_free_kernel(&adev->mman.fw_reserved_memory,
 					      NULL, NULL);
 			return ret;
@@ -1864,13 +1865,14 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 			       adev->need_swiotlb,
 			       dma_addressing_limited(adev->dev));
 	if (r) {
-		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
+		dev_err(adev->dev,
+			"failed initializing buffer object driver(%d).\n", r);
 		return r;
 	}
 
 	r = amdgpu_ttm_pools_init(adev);
 	if (r) {
-		DRM_ERROR("failed to init ttm pools(%d).\n", r);
+		dev_err(adev->dev, "failed to init ttm pools(%d).\n", r);
 		return r;
 	}
 	adev->mman.initialized = true;
@@ -1878,7 +1880,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	/* Initialize VRAM pool with all of VRAM divided into pages */
 	r = amdgpu_vram_mgr_init(adev);
 	if (r) {
-		DRM_ERROR("Failed initializing VRAM heap.\n");
+		dev_err(adev->dev, "Failed initializing VRAM heap.\n");
 		return r;
 	}
 
@@ -1958,7 +1960,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 		DRM_DEBUG_DRIVER("Skipped stolen memory reservation\n");
 	}
 
-	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
+	dev_info(adev->dev, "amdgpu: %uM of VRAM memory ready\n",
 		 (unsigned int)(adev->gmc.real_vram_size / (1024 * 1024)));
 
 	/* Compute GTT size, either based on TTM limit
@@ -1981,10 +1983,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	/* Initialize GTT memory pool */
 	r = amdgpu_gtt_mgr_init(adev, gtt_size);
 	if (r) {
-		DRM_ERROR("Failed initializing GTT heap.\n");
+		dev_err(adev->dev, "Failed initializing GTT heap.\n");
 		return r;
 	}
-	DRM_INFO("amdgpu: %uM of GTT memory ready.\n",
+	dev_info(adev->dev, "amdgpu: %uM of GTT memory ready.\n",
 		 (unsigned int)(gtt_size / (1024 * 1024)));
 
 	if (adev->flags & AMD_IS_APU) {
@@ -1995,40 +1997,40 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	/* Initialize doorbell pool on PCI BAR */
 	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_DOORBELL, adev->doorbell.size / PAGE_SIZE);
 	if (r) {
-		DRM_ERROR("Failed initializing doorbell heap.\n");
+		dev_err(adev->dev, "Failed initializing doorbell heap.\n");
 		return r;
 	}
 
 	/* Create a boorbell page for kernel usages */
 	r = amdgpu_doorbell_create_kernel_doorbells(adev);
 	if (r) {
-		DRM_ERROR("Failed to initialize kernel doorbells.\n");
+		dev_err(adev->dev, "Failed to initialize kernel doorbells.\n");
 		return r;
 	}
 
 	/* Initialize preemptible memory pool */
 	r = amdgpu_preempt_mgr_init(adev);
 	if (r) {
-		DRM_ERROR("Failed initializing PREEMPT heap.\n");
+		dev_err(adev->dev, "Failed initializing PREEMPT heap.\n");
 		return r;
 	}
 
 	/* Initialize various on-chip memory pools */
 	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GDS, adev->gds.gds_size);
 	if (r) {
-		DRM_ERROR("Failed initializing GDS heap.\n");
+		dev_err(adev->dev, "Failed initializing GDS heap.\n");
 		return r;
 	}
 
 	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GWS, adev->gds.gws_size);
 	if (r) {
-		DRM_ERROR("Failed initializing gws heap.\n");
+		dev_err(adev->dev, "Failed initializing gws heap.\n");
 		return r;
 	}
 
 	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_OA, adev->gds.oa_size);
 	if (r) {
-		DRM_ERROR("Failed initializing oa heap.\n");
+		dev_err(adev->dev, "Failed initializing oa heap.\n");
 		return r;
 	}
 	if (amdgpu_bo_create_kernel(adev, PAGE_SIZE, PAGE_SIZE,
@@ -2091,7 +2093,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_DOORBELL);
 	ttm_device_fini(&adev->mman.bdev);
 	adev->mman.initialized = false;
-	DRM_INFO("amdgpu: ttm finalized\n");
+	dev_info(adev->dev, "amdgpu: ttm finalized\n");
 }
 
 /**
@@ -2123,8 +2125,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
-			DRM_ERROR("Failed setting up TTM BO move entity (%d)\n",
-				  r);
+			dev_err(adev->dev,
+				"Failed setting up TTM BO move entity (%d)\n",
+				r);
 			return;
 		}
 
@@ -2132,8 +2135,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  DRM_SCHED_PRIORITY_NORMAL, &sched,
 					  1, NULL);
 		if (r) {
-			DRM_ERROR("Failed setting up TTM BO move entity (%d)\n",
-				  r);
+			dev_err(adev->dev,
+				"Failed setting up TTM BO move entity (%d)\n",
+				r);
 			goto error_free_entity;
 		}
 	} else {
@@ -2204,7 +2208,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	int r;
 
 	if (!direct_submit && !ring->sched.ready) {
-		DRM_ERROR("Trying to move memory with ring turned off.\n");
+		dev_err(adev->dev,
+			"Trying to move memory with ring turned off.\n");
 		return -EINVAL;
 	}
 
@@ -2239,7 +2244,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 
 error_free:
 	amdgpu_job_free(job);
-	DRM_ERROR("Error scheduling IBs (%d)\n", r);
+	dev_err(adev->dev, "Error scheduling IBs (%d)\n", r);
 	return r;
 }
 
@@ -2358,7 +2363,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 	int r;
 
 	if (!adev->mman.buffer_funcs_enabled) {
-		DRM_ERROR("Trying to clear memory with ring turned off.\n");
+		dev_err(adev->dev,
+			"Trying to clear memory with ring turned off.\n");
 		return -EINVAL;
 	}
 
@@ -2418,7 +2424,7 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 		man = ttm_manager_type(&adev->mman.bdev, mem_type);
 		break;
 	default:
-		DRM_ERROR("Trying to evict invalid memory type\n");
+		dev_err(adev->dev, "Trying to evict invalid memory type\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..20ad57f7815d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2395,10 +2395,11 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
 	else
 		adev->vm_manager.fragment_size = amdgpu_vm_fragment_size;
 
-	DRM_INFO("vm size is %u GB, %u levels, block size is %u-bit, fragment size is %u-bit\n",
-		 vm_size, adev->vm_manager.num_level + 1,
-		 adev->vm_manager.block_size,
-		 adev->vm_manager.fragment_size);
+	dev_info(
+		adev->dev,
+		"vm size is %u GB, %u levels, block size is %u-bit, fragment size is %u-bit\n",
+		vm_size, adev->vm_manager.num_level + 1,
+		adev->vm_manager.block_size, adev->vm_manager.fragment_size);
 }
 
 /**
@@ -2564,8 +2565,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
 				    AMDGPU_VM_USE_CPU_FOR_GFX);
 
-	DRM_DEBUG_DRIVER("VM update mode is %s\n",
-			 vm->use_cpu_for_update ? "CPU" : "SDMA");
+	dev_dbg(adev->dev, "VM update mode is %s\n",
+		vm->use_cpu_for_update ? "CPU" : "SDMA");
 	WARN_ONCE((vm->use_cpu_for_update &&
 		   !amdgpu_gmc_vram_full_visible(&adev->gmc)),
 		  "CPU update of VM recommended only for large BAR system\n");
@@ -2607,7 +2608,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	r = amdgpu_vm_create_task_info(vm);
 	if (r)
-		DRM_DEBUG("Failed to create task info for VM\n");
+		dev_dbg(adev->dev, "Failed to create task info for VM\n");
 
 	amdgpu_bo_unreserve(vm->root.bo);
 	amdgpu_bo_unref(&root_bo);
@@ -2658,8 +2659,8 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	/* Update VM state */
 	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
 				    AMDGPU_VM_USE_CPU_FOR_COMPUTE);
-	DRM_DEBUG_DRIVER("VM update mode is %s\n",
-			 vm->use_cpu_for_update ? "CPU" : "SDMA");
+	dev_dbg(adev->dev, "VM update mode is %s\n",
+		vm->use_cpu_for_update ? "CPU" : "SDMA");
 	WARN_ONCE((vm->use_cpu_for_update &&
 		   !amdgpu_gmc_vram_full_visible(&adev->gmc)),
 		  "CPU update of VM recommended only for large BAR system\n");
@@ -2982,7 +2983,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 error_unlock:
 	amdgpu_bo_unreserve(root);
 	if (r < 0)
-		DRM_ERROR("Can't handle page fault (%d)\n", r);
+		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
 
 error_unref:
 	amdgpu_bo_unref(&root);
-- 
2.49.0

