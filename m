Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82CF4AC9E5
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Feb 2022 20:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8610E507;
	Mon,  7 Feb 2022 19:53:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA710E23A
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Feb 2022 19:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrp+o1xs7lNIkcnx4BeqJjZhAtgb0HaVNBmSZqnqZCMGSQzh/kBI8Ic0akzSjlTHfFiZR082WGvB4Td/75iGCduHfNdXLyiIAVyLsKNulzElqzwZUN7fvVNli2qqBJOxWLQLVzS2h6//eVWlue8M5wcIMux/R1d7Y+ckj6Np7r9QNkj/5vQyD40CZqu7aKhjlw/3UF8waRyzTDI9TPhuKfrufeIy5vf57oY6Oq69qF6QuVB4eCKhMAF/Zg2cLP77abeXUvNK7u0Np7XlVO12zC3ar5sQALkH2djCaN9u5vweQCZA1j6tX4jucPxSr01BjbwNNqqYsJySmp6uubVbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALyNGKXdqFQdL45BL+X50lPv97qdsdgcz1FZRyOABVQ=;
 b=YkUqaybleIsenIQyCssZexVwumv3x43lF691iRpqW16+y+1eoup4SMaKqTWDzdgDMmKusyuBvJk2G7ts9znpCumDWW14GSBKBAcjD5ktyIgLmFY7f6YsKgURaY2PWgBiBiqnMkgnuOgj6/c2XWaE+mRCTpS45sAxKJHEC6EavWUqU9rjrzzh+nhyYtVdVXiYSURu3vkaZFadmoT8WkBpdC0wOQmMgig5c3kORog7KqGIRkl8hfv22d7ItsX9WoL3x+Dhloqs8HKfYSrFsKwmygJk2scD3dpkCnQH9n64sWURJ1hlDnPXD+WWFjJFPw5f+yakZJaRbb3zGOdIwXZquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALyNGKXdqFQdL45BL+X50lPv97qdsdgcz1FZRyOABVQ=;
 b=mhswsPTQ30KDhNzHDdP4DJiMcd2KhWBibDX5LCQxE/xb5GV2xoWlreiF2fQB23WtE61F2pUDpnYtMcRL8aOizukA9E5mTjwdIu2x9ZOW7YRu7q3K8tuLHhH8dlxnyG2YV0phZPJ2iz63e0C2N5H6XwkVeH678kDiWO+ZsLHMNGY=
Received: from DM6PR03CA0073.namprd03.prod.outlook.com (2603:10b6:5:333::6) by
 DM6PR12MB2681.namprd12.prod.outlook.com (2603:10b6:5:41::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Mon, 7 Feb 2022 19:53:05 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::55) by DM6PR03CA0073.outlook.office365.com
 (2603:10b6:5:333::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Mon, 7 Feb 2022 19:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 19:53:05 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Feb
 2022 13:53:04 -0600
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCHv2 2/3] drm/amdkfd: Remove unused old debugger implementation
Date: Mon, 7 Feb 2022 14:52:36 -0500
Message-ID: <20220207195237.11605-2-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220207195237.11605-1-mukul.joshi@amd.com>
References: <20220207195237.11605-1-mukul.joshi@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1c775fd-beef-40d9-7ff9-08d9ea73752a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2681:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2681B6A02EFC93E86AD4C43CEE2C9@DM6PR12MB2681.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BUqZUhou2tjMUD90eV176C7S5kj1pvbDuKwxw3anojF+cLHrfkc8xpy4tgtjgYMBzL9ki2qq4p7FbiMAxMSjImQ81geCBC7Oam7Gx8EkdhpEb2+Z6q2wnmZRos+MjiJA3rSkJpODLZODDyDyQyEGO2yfTpPQozxyS4SrYOuto3IevYBvtyh3EErRoDixlnNzO0Ie3d9lhGqgZf8DqhVx/FBLjKsGyiTIrifHQ1iEM0b1hs4IHZdeAA/4z0hhhSkEX6WJZ9DjinSfgc8mLVxC4oSN37oeTW2Epp3jSebqqqMZ22NS6LaTt3X0QyTc8nLQYTikAoo5y/USTGxP98tXwHm/IA4KOCLuPYJ/wDTP+yC3ivC/ZEwvgTDWhlGz2f5F15sljxTdOTDs+fWJRKUX3VMFTxkvuAwy7I5uwdGJNZB7hg6OWoGgdDrrO8lpNacRft/t++/r7Z1+rMt3QDgNpTUhEggCiLYR+VuqN1Fgj4dJXL3jzLGtW5tuUY0rTx9hJPWnlqwuuRvf35Dzu5GIPRiyDO2SLmJpnNotSPl4BtaC4Zql+aJBRFREznJ10SQ0xF++beANUS+3dea4u+kZVU/azOI8TDhm2xoonVKPLG2zUEJ0WwcMeLm/vxJ01XMUMQ0+77tJElmsnrWpTKvR5AUZ/flwcgCo7vP7iCcQTMJMwcpvxy2yZ90ITnKT4Ptr5r0t5/Fjl7t8Zl8IOFu9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(316002)(82310400004)(6916009)(7696005)(19627235002)(54906003)(70586007)(86362001)(6666004)(8676002)(4326008)(8936002)(83380400001)(70206006)(356005)(30864003)(81166007)(47076005)(36860700001)(2906002)(1076003)(16526019)(186003)(2616005)(5660300002)(26005)(44832011)(426003)(336012)(508600001)(36756003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 19:53:05.6400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c775fd-beef-40d9-7ff9-08d9ea73752a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Cleanup the kfd code by removing the unused old debugger
implementation.
Only a small piece of resetting wavefronts is kept and
is moved to kfd_device_queue_manager.c

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
---
v1->v2:
- Rename AMDKFD_IOC_DBG_* to AMDKFD_IOC_DBG_*_DEPRECATED.
- Cleanup address_watch_disable(), address_watch_execute(),
  and address_watch_get_offset() from amdgpu_amdkfd_gfx_* files.

 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |   3 -
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   3 -
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  24 -
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  25 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c |  96 --
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c |  24 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  24 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  10 -
 drivers/gpu/drm/amd/amdkfd/Makefile           |   2 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 290 +-----
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       | 845 ------------------
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h       | 230 -----
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c       | 158 ----
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h       | 293 ------
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   2 -
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  59 ++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  35 +
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |  12 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  19 -
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |   9 -
 include/uapi/linux/kfd_ioctl.h                |   8 +-
 22 files changed, 106 insertions(+), 2070 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 46cd4ee6bafb..c8935d718207 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -37,10 +37,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_arcturus_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_gfx_v9_hqd_destroy,
 	.hqd_sdma_destroy = kgd_arcturus_hqd_sdma_destroy,
-	.address_watch_disable = kgd_gfx_v9_address_watch_disable,
-	.address_watch_execute = kgd_gfx_v9_address_watch_execute,
 	.wave_control_execute = kgd_gfx_v9_wave_control_execute,
-	.address_watch_get_offset = kgd_gfx_v9_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info =
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index abe93b3ff765..4191af5a3f13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -289,10 +289,7 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_arcturus_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_gfx_v9_hqd_destroy,
 	.hqd_sdma_destroy = kgd_arcturus_hqd_sdma_destroy,
-	.address_watch_disable = kgd_gfx_v9_address_watch_disable,
-	.address_watch_execute = kgd_gfx_v9_address_watch_execute,
 	.wave_control_execute = kgd_gfx_v9_wave_control_execute,
-	.address_watch_get_offset = kgd_gfx_v9_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info =
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 7b7f4b2764c1..9378fc79e9ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -671,20 +671,6 @@ static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int kgd_address_watch_disable(struct amdgpu_device *adev)
-{
-	return 0;
-}
-
-static int kgd_address_watch_execute(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo)
-{
-	return 0;
-}
-
 static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
@@ -709,13 +695,6 @@ static int kgd_wave_control_execute(struct amdgpu_device *adev,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset)
-{
-	return 0;
-}
-
 static void set_vm_context_page_table_base(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t page_table_base)
 {
@@ -767,10 +746,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_hqd_destroy,
 	.hqd_sdma_destroy = kgd_hqd_sdma_destroy,
-	.address_watch_disable = kgd_address_watch_disable,
-	.address_watch_execute = kgd_address_watch_execute,
 	.wave_control_execute = kgd_wave_control_execute,
-	.address_watch_get_offset = kgd_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info =
 			get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 1f37d3574001..e9c80ce13f3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -582,21 +582,6 @@ static int hqd_sdma_destroy_v10_3(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-
-static int address_watch_disable_v10_3(struct amdgpu_device *adev)
-{
-	return 0;
-}
-
-static int address_watch_execute_v10_3(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo)
-{
-	return 0;
-}
-
 static int wave_control_execute_v10_3(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
@@ -621,13 +606,6 @@ static int wave_control_execute_v10_3(struct amdgpu_device *adev,
 	return 0;
 }
 
-static uint32_t address_watch_get_offset_v10_3(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset)
-{
-	return 0;
-}
-
 static void set_vm_context_page_table_base_v10_3(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t page_table_base)
 {
@@ -809,10 +787,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.hqd_sdma_is_occupied = hqd_sdma_is_occupied_v10_3,
 	.hqd_destroy = hqd_destroy_v10_3,
 	.hqd_sdma_destroy = hqd_sdma_destroy_v10_3,
-	.address_watch_disable = address_watch_disable_v10_3,
-	.address_watch_execute = address_watch_execute_v10_3,
 	.wave_control_execute = wave_control_execute_v10_3,
-	.address_watch_get_offset = address_watch_get_offset_v10_3,
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
 	.program_trap_handler_settings = program_trap_handler_settings_v10_3,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index 36528dad7684..65552bb7d2f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -45,43 +45,6 @@ enum {
 	MAX_WATCH_ADDRESSES = 4
 };
 
-enum {
-	ADDRESS_WATCH_REG_ADDR_HI = 0,
-	ADDRESS_WATCH_REG_ADDR_LO,
-	ADDRESS_WATCH_REG_CNTL,
-	ADDRESS_WATCH_REG_MAX
-};
-
-/*  not defined in the CI/KV reg file  */
-enum {
-	ADDRESS_WATCH_REG_CNTL_ATC_BIT = 0x10000000UL,
-	ADDRESS_WATCH_REG_CNTL_DEFAULT_MASK = 0x00FFFFFF,
-	ADDRESS_WATCH_REG_ADDLOW_MASK_EXTENSION = 0x03000000,
-	/* extend the mask to 26 bits to match the low address field */
-	ADDRESS_WATCH_REG_ADDLOW_SHIFT = 6,
-	ADDRESS_WATCH_REG_ADDHIGH_MASK = 0xFFFF
-};
-
-static const uint32_t watchRegs[MAX_WATCH_ADDRESSES * ADDRESS_WATCH_REG_MAX] = {
-	mmTCP_WATCH0_ADDR_H, mmTCP_WATCH0_ADDR_L, mmTCP_WATCH0_CNTL,
-	mmTCP_WATCH1_ADDR_H, mmTCP_WATCH1_ADDR_L, mmTCP_WATCH1_CNTL,
-	mmTCP_WATCH2_ADDR_H, mmTCP_WATCH2_ADDR_L, mmTCP_WATCH2_CNTL,
-	mmTCP_WATCH3_ADDR_H, mmTCP_WATCH3_ADDR_L, mmTCP_WATCH3_CNTL
-};
-
-union TCP_WATCH_CNTL_BITS {
-	struct {
-		uint32_t mask:24;
-		uint32_t vmid:4;
-		uint32_t atc:1;
-		uint32_t mode:2;
-		uint32_t valid:1;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t pipe,
 			uint32_t queue, uint32_t vmid)
 {
@@ -529,55 +492,6 @@ static int kgd_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-static int kgd_address_watch_disable(struct amdgpu_device *adev)
-{
-	union TCP_WATCH_CNTL_BITS cntl;
-	unsigned int i;
-
-	cntl.u32All = 0;
-
-	cntl.bitfields.valid = 0;
-	cntl.bitfields.mask = ADDRESS_WATCH_REG_CNTL_DEFAULT_MASK;
-	cntl.bitfields.atc = 1;
-
-	/* Turning off this address until we set all the registers */
-	for (i = 0; i < MAX_WATCH_ADDRESSES; i++)
-		WREG32(watchRegs[i * ADDRESS_WATCH_REG_MAX +
-			ADDRESS_WATCH_REG_CNTL], cntl.u32All);
-
-	return 0;
-}
-
-static int kgd_address_watch_execute(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo)
-{
-	union TCP_WATCH_CNTL_BITS cntl;
-
-	cntl.u32All = cntl_val;
-
-	/* Turning off this watch point until we set all the registers */
-	cntl.bitfields.valid = 0;
-	WREG32(watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX +
-		ADDRESS_WATCH_REG_CNTL], cntl.u32All);
-
-	WREG32(watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX +
-		ADDRESS_WATCH_REG_ADDR_HI], addr_hi);
-
-	WREG32(watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX +
-		ADDRESS_WATCH_REG_ADDR_LO], addr_lo);
-
-	/* Enable the watch point */
-	cntl.bitfields.valid = 1;
-
-	WREG32(watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX +
-		ADDRESS_WATCH_REG_CNTL], cntl.u32All);
-
-	return 0;
-}
-
 static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
@@ -602,13 +516,6 @@ static int kgd_wave_control_execute(struct amdgpu_device *adev,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset)
-{
-	return watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX + reg_offset];
-}
-
 static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid)
 {
@@ -665,10 +572,7 @@ const struct kfd2kgd_calls gfx_v7_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_hqd_destroy,
 	.hqd_sdma_destroy = kgd_hqd_sdma_destroy,
-	.address_watch_disable = kgd_address_watch_disable,
-	.address_watch_execute = kgd_address_watch_execute,
 	.wave_control_execute = kgd_wave_control_execute,
-	.address_watch_get_offset = kgd_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info = get_atc_vmid_pasid_mapping_info,
 	.set_scratch_backing_va = set_scratch_backing_va,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index 52832cd69a93..9dc5f2a0cc07 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -538,20 +538,6 @@ static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int kgd_address_watch_disable(struct amdgpu_device *adev)
-{
-	return 0;
-}
-
-static int kgd_address_watch_execute(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo)
-{
-	return 0;
-}
-
 static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
@@ -576,13 +562,6 @@ static int kgd_wave_control_execute(struct amdgpu_device *adev,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset)
-{
-	return 0;
-}
-
 static void set_scratch_backing_va(struct amdgpu_device *adev,
 					uint64_t va, uint32_t vmid)
 {
@@ -614,10 +593,7 @@ const struct kfd2kgd_calls gfx_v8_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_hqd_destroy,
 	.hqd_sdma_destroy = kgd_hqd_sdma_destroy,
-	.address_watch_disable = kgd_address_watch_disable,
-	.address_watch_execute = kgd_address_watch_execute,
 	.wave_control_execute = kgd_wave_control_execute,
-	.address_watch_get_offset = kgd_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info =
 			get_atc_vmid_pasid_mapping_info,
 	.set_scratch_backing_va = set_scratch_backing_va,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 1abf662a0e91..53895a41932e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -622,20 +622,6 @@ bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-int kgd_gfx_v9_address_watch_disable(struct amdgpu_device *adev)
-{
-	return 0;
-}
-
-int kgd_gfx_v9_address_watch_execute(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo)
-{
-	return 0;
-}
-
 int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
@@ -660,13 +646,6 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 	return 0;
 }
 
-uint32_t kgd_gfx_v9_address_watch_get_offset(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset)
-{
-	return 0;
-}
-
 void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base)
 {
@@ -888,10 +867,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.hqd_sdma_is_occupied = kgd_hqd_sdma_is_occupied,
 	.hqd_destroy = kgd_gfx_v9_hqd_destroy,
 	.hqd_sdma_destroy = kgd_hqd_sdma_destroy,
-	.address_watch_disable = kgd_gfx_v9_address_watch_disable,
-	.address_watch_execute = kgd_gfx_v9_address_watch_execute,
 	.wave_control_execute = kgd_gfx_v9_wave_control_execute,
-	.address_watch_get_offset = kgd_gfx_v9_address_watch_get_offset,
 	.get_atc_vmid_pasid_mapping_info =
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 24be49df26fd..c7ed3bc9053c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -46,19 +46,9 @@ int kgd_gfx_v9_hqd_destroy(struct amdgpu_device *adev, void *mqd,
 				enum kfd_preempt_type reset_type,
 				unsigned int utimeout, uint32_t pipe_id,
 				uint32_t queue_id);
-int kgd_gfx_v9_address_watch_disable(struct amdgpu_device *adev);
-int kgd_gfx_v9_address_watch_execute(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo);
 int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd);
-uint32_t kgd_gfx_v9_address_watch_get_offset(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset);
-
 bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index c4f3aff11072..19cfbf9577b4 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -51,8 +51,6 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_events.o \
 		$(AMDKFD_PATH)/cik_event_interrupt.o \
 		$(AMDKFD_PATH)/kfd_int_process_v9.o \
-		$(AMDKFD_PATH)/kfd_dbgdev.o \
-		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
 		$(AMDKFD_PATH)/kfd_crat.o
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 64e3b4e3a712..13e46631e289 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -39,7 +39,6 @@
 #include <asm/processor.h>
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
-#include "kfd_dbgmgr.h"
 #include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
@@ -580,299 +579,26 @@ static int kfd_ioctl_set_trap_handler(struct file *filep,
 static int kfd_ioctl_dbg_register(struct file *filep,
 				struct kfd_process *p, void *data)
 {
-	struct kfd_ioctl_dbg_register_args *args = data;
-	struct kfd_dev *dev;
-	struct kfd_dbgmgr *dbgmgr_ptr;
-	struct kfd_process_device *pdd;
-	bool create_ok;
-	long status = 0;
-
-	mutex_lock(&p->mutex);
-	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
-	if (!pdd) {
-		status = -EINVAL;
-		goto err_pdd;
-	}
-	dev = pdd->dev;
-
-	if (dev->adev->asic_type == CHIP_CARRIZO) {
-		pr_debug("kfd_ioctl_dbg_register not supported on CZ\n");
-		status = -EINVAL;
-		goto err_chip_unsupp;
-	}
-
-	mutex_lock(kfd_get_dbgmgr_mutex());
-
-	/*
-	 * make sure that we have pdd, if this the first queue created for
-	 * this process
-	 */
-	pdd = kfd_bind_process_to_device(dev, p);
-	if (IS_ERR(pdd)) {
-		status = PTR_ERR(pdd);
-		goto out;
-	}
-
-	if (!dev->dbgmgr) {
-		/* In case of a legal call, we have no dbgmgr yet */
-		create_ok = kfd_dbgmgr_create(&dbgmgr_ptr, dev);
-		if (create_ok) {
-			status = kfd_dbgmgr_register(dbgmgr_ptr, p);
-			if (status != 0)
-				kfd_dbgmgr_destroy(dbgmgr_ptr);
-			else
-				dev->dbgmgr = dbgmgr_ptr;
-		}
-	} else {
-		pr_debug("debugger already registered\n");
-		status = -EINVAL;
-	}
-
-out:
-	mutex_unlock(kfd_get_dbgmgr_mutex());
-err_pdd:
-err_chip_unsupp:
-	mutex_unlock(&p->mutex);
-
-	return status;
+	return -EPERM;
 }
 
 static int kfd_ioctl_dbg_unregister(struct file *filep,
 				struct kfd_process *p, void *data)
 {
-	struct kfd_ioctl_dbg_unregister_args *args = data;
-	struct kfd_process_device *pdd;
-	struct kfd_dev *dev;
-	long status;
-
-	mutex_lock(&p->mutex);
-	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
-	mutex_unlock(&p->mutex);
-	if (!pdd || !pdd->dev->dbgmgr)
-		return -EINVAL;
-
-	dev = pdd->dev;
-
-	if (dev->adev->asic_type == CHIP_CARRIZO) {
-		pr_debug("kfd_ioctl_dbg_unregister not supported on CZ\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(kfd_get_dbgmgr_mutex());
-
-	status = kfd_dbgmgr_unregister(dev->dbgmgr, p);
-	if (!status) {
-		kfd_dbgmgr_destroy(dev->dbgmgr);
-		dev->dbgmgr = NULL;
-	}
-
-	mutex_unlock(kfd_get_dbgmgr_mutex());
-
-	return status;
+	return -EPERM;
 }
 
-/*
- * Parse and generate variable size data structure for address watch.
- * Total size of the buffer and # watch points is limited in order
- * to prevent kernel abuse. (no bearing to the much smaller HW limitation
- * which is enforced by dbgdev module)
- * please also note that the watch address itself are not "copied from user",
- * since it be set into the HW in user mode values.
- *
- */
 static int kfd_ioctl_dbg_address_watch(struct file *filep,
 					struct kfd_process *p, void *data)
 {
-	struct kfd_ioctl_dbg_address_watch_args *args = data;
-	struct kfd_dev *dev;
-	struct kfd_process_device *pdd;
-	struct dbg_address_watch_info aw_info;
-	unsigned char *args_buff;
-	long status;
-	void __user *cmd_from_user;
-	uint64_t watch_mask_value = 0;
-	unsigned int args_idx = 0;
-
-	memset((void *) &aw_info, 0, sizeof(struct dbg_address_watch_info));
-
-	mutex_lock(&p->mutex);
-	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
-	mutex_unlock(&p->mutex);
-	if (!pdd) {
-		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
-		return -EINVAL;
-	}
-	dev = pdd->dev;
-
-	if (dev->adev->asic_type == CHIP_CARRIZO) {
-		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
-		return -EINVAL;
-	}
-	cmd_from_user = (void __user *) args->content_ptr;
-
-	/* Validate arguments */
-
-	if ((args->buf_size_in_bytes > MAX_ALLOWED_AW_BUFF_SIZE) ||
-		(args->buf_size_in_bytes <= sizeof(*args) + sizeof(int) * 2) ||
-		(cmd_from_user == NULL))
-		return -EINVAL;
-
-	/* this is the actual buffer to work with */
-	args_buff = memdup_user(cmd_from_user,
-				args->buf_size_in_bytes - sizeof(*args));
-	if (IS_ERR(args_buff))
-		return PTR_ERR(args_buff);
-
-	aw_info.process = p;
-
-	aw_info.num_watch_points = *((uint32_t *)(&args_buff[args_idx]));
-	args_idx += sizeof(aw_info.num_watch_points);
-
-	aw_info.watch_mode = (enum HSA_DBG_WATCH_MODE *) &args_buff[args_idx];
-	args_idx += sizeof(enum HSA_DBG_WATCH_MODE) * aw_info.num_watch_points;
-
-	/*
-	 * set watch address base pointer to point on the array base
-	 * within args_buff
-	 */
-	aw_info.watch_address = (uint64_t *) &args_buff[args_idx];
-
-	/* skip over the addresses buffer */
-	args_idx += sizeof(aw_info.watch_address) * aw_info.num_watch_points;
-
-	if (args_idx >= args->buf_size_in_bytes - sizeof(*args)) {
-		status = -EINVAL;
-		goto out;
-	}
-
-	watch_mask_value = (uint64_t) args_buff[args_idx];
-
-	if (watch_mask_value > 0) {
-		/*
-		 * There is an array of masks.
-		 * set watch mask base pointer to point on the array base
-		 * within args_buff
-		 */
-		aw_info.watch_mask = (uint64_t *) &args_buff[args_idx];
-
-		/* skip over the masks buffer */
-		args_idx += sizeof(aw_info.watch_mask) *
-				aw_info.num_watch_points;
-	} else {
-		/* just the NULL mask, set to NULL and skip over it */
-		aw_info.watch_mask = NULL;
-		args_idx += sizeof(aw_info.watch_mask);
-	}
-
-	if (args_idx >= args->buf_size_in_bytes - sizeof(args)) {
-		status = -EINVAL;
-		goto out;
-	}
-
-	/* Currently HSA Event is not supported for DBG */
-	aw_info.watch_event = NULL;
-
-	mutex_lock(kfd_get_dbgmgr_mutex());
-
-	status = kfd_dbgmgr_address_watch(dev->dbgmgr, &aw_info);
-
-	mutex_unlock(kfd_get_dbgmgr_mutex());
-
-out:
-	kfree(args_buff);
-
-	return status;
+	return -EPERM;
 }
 
 /* Parse and generate fixed size data structure for wave control */
 static int kfd_ioctl_dbg_wave_control(struct file *filep,
 					struct kfd_process *p, void *data)
 {
-	struct kfd_ioctl_dbg_wave_control_args *args = data;
-	struct kfd_dev *dev;
-	struct kfd_process_device *pdd;
-	struct dbg_wave_control_info wac_info;
-	unsigned char *args_buff;
-	uint32_t computed_buff_size;
-	long status;
-	void __user *cmd_from_user;
-	unsigned int args_idx = 0;
-
-	memset((void *) &wac_info, 0, sizeof(struct dbg_wave_control_info));
-
-	/* we use compact form, independent of the packing attribute value */
-	computed_buff_size = sizeof(*args) +
-				sizeof(wac_info.mode) +
-				sizeof(wac_info.operand) +
-				sizeof(wac_info.dbgWave_msg.DbgWaveMsg) +
-				sizeof(wac_info.dbgWave_msg.MemoryVA) +
-				sizeof(wac_info.trapId);
-
-	mutex_lock(&p->mutex);
-	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
-	mutex_unlock(&p->mutex);
-	if (!pdd) {
-		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
-		return -EINVAL;
-	}
-	dev = pdd->dev;
-
-	if (dev->adev->asic_type == CHIP_CARRIZO) {
-		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
-		return -EINVAL;
-	}
-
-	/* input size must match the computed "compact" size */
-	if (args->buf_size_in_bytes != computed_buff_size) {
-		pr_debug("size mismatch, computed : actual %u : %u\n",
-				args->buf_size_in_bytes, computed_buff_size);
-		return -EINVAL;
-	}
-
-	cmd_from_user = (void __user *) args->content_ptr;
-
-	if (cmd_from_user == NULL)
-		return -EINVAL;
-
-	/* copy the entire buffer from user */
-
-	args_buff = memdup_user(cmd_from_user,
-				args->buf_size_in_bytes - sizeof(*args));
-	if (IS_ERR(args_buff))
-		return PTR_ERR(args_buff);
-
-	/* move ptr to the start of the "pay-load" area */
-	wac_info.process = p;
-
-	wac_info.operand = *((enum HSA_DBG_WAVEOP *)(&args_buff[args_idx]));
-	args_idx += sizeof(wac_info.operand);
-
-	wac_info.mode = *((enum HSA_DBG_WAVEMODE *)(&args_buff[args_idx]));
-	args_idx += sizeof(wac_info.mode);
-
-	wac_info.trapId = *((uint32_t *)(&args_buff[args_idx]));
-	args_idx += sizeof(wac_info.trapId);
-
-	wac_info.dbgWave_msg.DbgWaveMsg.WaveMsgInfoGen2.Value =
-					*((uint32_t *)(&args_buff[args_idx]));
-	wac_info.dbgWave_msg.MemoryVA = NULL;
-
-	mutex_lock(kfd_get_dbgmgr_mutex());
-
-	pr_debug("Calling dbg manager process %p, operand %u, mode %u, trapId %u, message %u\n",
-			wac_info.process, wac_info.operand,
-			wac_info.mode, wac_info.trapId,
-			wac_info.dbgWave_msg.DbgWaveMsg.WaveMsgInfoGen2.Value);
-
-	status = kfd_dbgmgr_wave_control(dev->dbgmgr, &wac_info);
-
-	pr_debug("Returned status of dbg manager is %ld\n", status);
-
-	mutex_unlock(kfd_get_dbgmgr_mutex());
-
-	kfree(args_buff);
-
-	return status;
+	return -EPERM;
 }
 
 static int kfd_ioctl_get_clock_counters(struct file *filep,
@@ -2900,16 +2626,16 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_WAIT_EVENTS,
 			kfd_ioctl_wait_events, 0),
 
-	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_REGISTER,
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_REGISTER_DEPRECATED,
 			kfd_ioctl_dbg_register, 0),
 
-	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_UNREGISTER,
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_UNREGISTER_DEPRECATED,
 			kfd_ioctl_dbg_unregister, 0),
 
-	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_ADDRESS_WATCH,
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_ADDRESS_WATCH_DEPRECATED,
 			kfd_ioctl_dbg_address_watch, 0),
 
-	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_WAVE_CONTROL,
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_WAVE_CONTROL_DEPRECATED,
 			kfd_ioctl_dbg_wave_control, 0),
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_SCRATCH_BACKING_VA,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
deleted file mode 100644
index 8eca9ed3ab36..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ /dev/null
@@ -1,845 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/log2.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
-#include <linux/device.h>
-
-#include "kfd_pm4_headers.h"
-#include "kfd_pm4_headers_diq.h"
-#include "kfd_kernel_queue.h"
-#include "kfd_priv.h"
-#include "kfd_pm4_opcodes.h"
-#include "cik_regs.h"
-#include "kfd_dbgmgr.h"
-#include "kfd_dbgdev.h"
-#include "kfd_device_queue_manager.h"
-
-static void dbgdev_address_watch_disable_nodiq(struct kfd_dev *dev)
-{
-	dev->kfd2kgd->address_watch_disable(dev->adev);
-}
-
-static int dbgdev_diq_submit_ib(struct kfd_dbgdev *dbgdev,
-				u32 pasid, uint64_t vmid0_address,
-				uint32_t *packet_buff, size_t size_in_bytes)
-{
-	struct pm4__release_mem *rm_packet;
-	struct pm4__indirect_buffer_pasid *ib_packet;
-	struct kfd_mem_obj *mem_obj;
-	size_t pq_packets_size_in_bytes;
-	union ULARGE_INTEGER *largep;
-	union ULARGE_INTEGER addr;
-	struct kernel_queue *kq;
-	uint64_t *rm_state;
-	unsigned int *ib_packet_buff;
-	int status;
-
-	if (WARN_ON(!size_in_bytes))
-		return -EINVAL;
-
-	kq = dbgdev->kq;
-
-	pq_packets_size_in_bytes = sizeof(struct pm4__release_mem) +
-				sizeof(struct pm4__indirect_buffer_pasid);
-
-	/*
-	 * We acquire a buffer from DIQ
-	 * The receive packet buff will be sitting on the Indirect Buffer
-	 * and in the PQ we put the IB packet + sync packet(s).
-	 */
-	status = kq_acquire_packet_buffer(kq,
-				pq_packets_size_in_bytes / sizeof(uint32_t),
-				&ib_packet_buff);
-	if (status) {
-		pr_err("kq_acquire_packet_buffer failed\n");
-		return status;
-	}
-
-	memset(ib_packet_buff, 0, pq_packets_size_in_bytes);
-
-	ib_packet = (struct pm4__indirect_buffer_pasid *) (ib_packet_buff);
-
-	ib_packet->header.count = 3;
-	ib_packet->header.opcode = IT_INDIRECT_BUFFER_PASID;
-	ib_packet->header.type = PM4_TYPE_3;
-
-	largep = (union ULARGE_INTEGER *) &vmid0_address;
-
-	ib_packet->bitfields2.ib_base_lo = largep->u.low_part >> 2;
-	ib_packet->bitfields3.ib_base_hi = largep->u.high_part;
-
-	ib_packet->control = (1 << 23) | (1 << 31) |
-			((size_in_bytes / 4) & 0xfffff);
-
-	ib_packet->bitfields5.pasid = pasid;
-
-	/*
-	 * for now we use release mem for GPU-CPU synchronization
-	 * Consider WaitRegMem + WriteData as a better alternative
-	 * we get a GART allocations ( gpu/cpu mapping),
-	 * for the sync variable, and wait until:
-	 * (a) Sync with HW
-	 * (b) Sync var is written by CP to mem.
-	 */
-	rm_packet = (struct pm4__release_mem *) (ib_packet_buff +
-			(sizeof(struct pm4__indirect_buffer_pasid) /
-					sizeof(unsigned int)));
-
-	status = kfd_gtt_sa_allocate(dbgdev->dev, sizeof(uint64_t),
-					&mem_obj);
-
-	if (status) {
-		pr_err("Failed to allocate GART memory\n");
-		kq_rollback_packet(kq);
-		return status;
-	}
-
-	rm_state = (uint64_t *) mem_obj->cpu_ptr;
-
-	*rm_state = QUEUESTATE__ACTIVE_COMPLETION_PENDING;
-
-	rm_packet->header.opcode = IT_RELEASE_MEM;
-	rm_packet->header.type = PM4_TYPE_3;
-	rm_packet->header.count = sizeof(struct pm4__release_mem) / 4 - 2;
-
-	rm_packet->bitfields2.event_type = CACHE_FLUSH_AND_INV_TS_EVENT;
-	rm_packet->bitfields2.event_index =
-				event_index___release_mem__end_of_pipe;
-
-	rm_packet->bitfields2.cache_policy = cache_policy___release_mem__lru;
-	rm_packet->bitfields2.atc = 0;
-	rm_packet->bitfields2.tc_wb_action_ena = 1;
-
-	addr.quad_part = mem_obj->gpu_addr;
-
-	rm_packet->bitfields4.address_lo_32b = addr.u.low_part >> 2;
-	rm_packet->address_hi = addr.u.high_part;
-
-	rm_packet->bitfields3.data_sel =
-				data_sel___release_mem__send_64_bit_data;
-
-	rm_packet->bitfields3.int_sel =
-			int_sel___release_mem__send_data_after_write_confirm;
-
-	rm_packet->bitfields3.dst_sel =
-			dst_sel___release_mem__memory_controller;
-
-	rm_packet->data_lo = QUEUESTATE__ACTIVE;
-
-	kq_submit_packet(kq);
-
-	/* Wait till CP writes sync code: */
-	status = amdkfd_fence_wait_timeout(
-			rm_state,
-			QUEUESTATE__ACTIVE, 1500);
-
-	kfd_gtt_sa_free(dbgdev->dev, mem_obj);
-
-	return status;
-}
-
-static int dbgdev_register_nodiq(struct kfd_dbgdev *dbgdev)
-{
-	/*
-	 * no action is needed in this case,
-	 * just make sure diq will not be used
-	 */
-
-	dbgdev->kq = NULL;
-
-	return 0;
-}
-
-static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
-{
-	struct queue_properties properties;
-	unsigned int qid;
-	struct kernel_queue *kq = NULL;
-	int status;
-
-	properties.type = KFD_QUEUE_TYPE_DIQ;
-
-	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
-				&properties, &qid, NULL, NULL, NULL, NULL);
-
-	if (status) {
-		pr_err("Failed to create DIQ\n");
-		return status;
-	}
-
-	pr_debug("DIQ Created with queue id: %d\n", qid);
-
-	kq = pqm_get_kernel_queue(dbgdev->pqm, qid);
-
-	if (!kq) {
-		pr_err("Error getting DIQ\n");
-		pqm_destroy_queue(dbgdev->pqm, qid);
-		return -EFAULT;
-	}
-
-	dbgdev->kq = kq;
-
-	return status;
-}
-
-static int dbgdev_unregister_nodiq(struct kfd_dbgdev *dbgdev)
-{
-	/* disable watch address */
-	dbgdev_address_watch_disable_nodiq(dbgdev->dev);
-	return 0;
-}
-
-static int dbgdev_unregister_diq(struct kfd_dbgdev *dbgdev)
-{
-	/* todo - disable address watch */
-	int status;
-
-	status = pqm_destroy_queue(dbgdev->pqm,
-			dbgdev->kq->queue->properties.queue_id);
-	dbgdev->kq = NULL;
-
-	return status;
-}
-
-static void dbgdev_address_watch_set_registers(
-			const struct dbg_address_watch_info *adw_info,
-			union TCP_WATCH_ADDR_H_BITS *addrHi,
-			union TCP_WATCH_ADDR_L_BITS *addrLo,
-			union TCP_WATCH_CNTL_BITS *cntl,
-			unsigned int index, unsigned int vmid)
-{
-	union ULARGE_INTEGER addr;
-
-	addr.quad_part = 0;
-	addrHi->u32All = 0;
-	addrLo->u32All = 0;
-	cntl->u32All = 0;
-
-	if (adw_info->watch_mask)
-		cntl->bitfields.mask =
-			(uint32_t) (adw_info->watch_mask[index] &
-					ADDRESS_WATCH_REG_CNTL_DEFAULT_MASK);
-	else
-		cntl->bitfields.mask = ADDRESS_WATCH_REG_CNTL_DEFAULT_MASK;
-
-	addr.quad_part = (unsigned long long) adw_info->watch_address[index];
-
-	addrHi->bitfields.addr = addr.u.high_part &
-					ADDRESS_WATCH_REG_ADDHIGH_MASK;
-	addrLo->bitfields.addr =
-			(addr.u.low_part >> ADDRESS_WATCH_REG_ADDLOW_SHIFT);
-
-	cntl->bitfields.mode = adw_info->watch_mode[index];
-	cntl->bitfields.vmid = (uint32_t) vmid;
-	/* for now assume it is an ATC address */
-	cntl->u32All |= ADDRESS_WATCH_REG_CNTL_ATC_BIT;
-
-	pr_debug("\t\t%20s %08x\n", "set reg mask :", cntl->bitfields.mask);
-	pr_debug("\t\t%20s %08x\n", "set reg add high :",
-			addrHi->bitfields.addr);
-	pr_debug("\t\t%20s %08x\n", "set reg add low :",
-			addrLo->bitfields.addr);
-}
-
-static int dbgdev_address_watch_nodiq(struct kfd_dbgdev *dbgdev,
-				      struct dbg_address_watch_info *adw_info)
-{
-	union TCP_WATCH_ADDR_H_BITS addrHi;
-	union TCP_WATCH_ADDR_L_BITS addrLo;
-	union TCP_WATCH_CNTL_BITS cntl;
-	struct kfd_process_device *pdd;
-	unsigned int i;
-
-	/* taking the vmid for that process on the safe way using pdd */
-	pdd = kfd_get_process_device_data(dbgdev->dev,
-					adw_info->process);
-	if (!pdd) {
-		pr_err("Failed to get pdd for wave control no DIQ\n");
-		return -EFAULT;
-	}
-
-	addrHi.u32All = 0;
-	addrLo.u32All = 0;
-	cntl.u32All = 0;
-
-	if ((adw_info->num_watch_points > MAX_WATCH_ADDRESSES) ||
-			(adw_info->num_watch_points == 0)) {
-		pr_err("num_watch_points is invalid\n");
-		return -EINVAL;
-	}
-
-	if (!adw_info->watch_mode || !adw_info->watch_address) {
-		pr_err("adw_info fields are not valid\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < adw_info->num_watch_points; i++) {
-		dbgdev_address_watch_set_registers(adw_info, &addrHi, &addrLo,
-						&cntl, i, pdd->qpd.vmid);
-
-		pr_debug("\t\t%30s\n", "* * * * * * * * * * * * * * * * * *");
-		pr_debug("\t\t%20s %08x\n", "register index :", i);
-		pr_debug("\t\t%20s %08x\n", "vmid is :", pdd->qpd.vmid);
-		pr_debug("\t\t%20s %08x\n", "Address Low is :",
-				addrLo.bitfields.addr);
-		pr_debug("\t\t%20s %08x\n", "Address high is :",
-				addrHi.bitfields.addr);
-		pr_debug("\t\t%20s %08x\n", "Address high is :",
-				addrHi.bitfields.addr);
-		pr_debug("\t\t%20s %08x\n", "Control Mask is :",
-				cntl.bitfields.mask);
-		pr_debug("\t\t%20s %08x\n", "Control Mode is :",
-				cntl.bitfields.mode);
-		pr_debug("\t\t%20s %08x\n", "Control Vmid is :",
-				cntl.bitfields.vmid);
-		pr_debug("\t\t%20s %08x\n", "Control atc  is :",
-				cntl.bitfields.atc);
-		pr_debug("\t\t%30s\n", "* * * * * * * * * * * * * * * * * *");
-
-		pdd->dev->kfd2kgd->address_watch_execute(
-						dbgdev->dev->adev,
-						i,
-						cntl.u32All,
-						addrHi.u32All,
-						addrLo.u32All);
-	}
-
-	return 0;
-}
-
-static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
-				    struct dbg_address_watch_info *adw_info)
-{
-	struct pm4__set_config_reg *packets_vec;
-	union TCP_WATCH_ADDR_H_BITS addrHi;
-	union TCP_WATCH_ADDR_L_BITS addrLo;
-	union TCP_WATCH_CNTL_BITS cntl;
-	struct kfd_mem_obj *mem_obj;
-	unsigned int aw_reg_add_dword;
-	uint32_t *packet_buff_uint;
-	unsigned int i;
-	int status;
-	size_t ib_size = sizeof(struct pm4__set_config_reg) * 4;
-	/* we do not control the vmid in DIQ mode, just a place holder */
-	unsigned int vmid = 0;
-
-	addrHi.u32All = 0;
-	addrLo.u32All = 0;
-	cntl.u32All = 0;
-
-	if ((adw_info->num_watch_points > MAX_WATCH_ADDRESSES) ||
-			(adw_info->num_watch_points == 0)) {
-		pr_err("num_watch_points is invalid\n");
-		return -EINVAL;
-	}
-
-	if (!adw_info->watch_mode || !adw_info->watch_address) {
-		pr_err("adw_info fields are not valid\n");
-		return -EINVAL;
-	}
-
-	status = kfd_gtt_sa_allocate(dbgdev->dev, ib_size, &mem_obj);
-
-	if (status) {
-		pr_err("Failed to allocate GART memory\n");
-		return status;
-	}
-
-	packet_buff_uint = mem_obj->cpu_ptr;
-
-	memset(packet_buff_uint, 0, ib_size);
-
-	packets_vec = (struct pm4__set_config_reg *) (packet_buff_uint);
-
-	packets_vec[0].header.count = 1;
-	packets_vec[0].header.opcode = IT_SET_CONFIG_REG;
-	packets_vec[0].header.type = PM4_TYPE_3;
-	packets_vec[0].bitfields2.vmid_shift = ADDRESS_WATCH_CNTL_OFFSET;
-	packets_vec[0].bitfields2.insert_vmid = 1;
-	packets_vec[1].ordinal1 = packets_vec[0].ordinal1;
-	packets_vec[1].bitfields2.insert_vmid = 0;
-	packets_vec[2].ordinal1 = packets_vec[0].ordinal1;
-	packets_vec[2].bitfields2.insert_vmid = 0;
-	packets_vec[3].ordinal1 = packets_vec[0].ordinal1;
-	packets_vec[3].bitfields2.vmid_shift = ADDRESS_WATCH_CNTL_OFFSET;
-	packets_vec[3].bitfields2.insert_vmid = 1;
-
-	for (i = 0; i < adw_info->num_watch_points; i++) {
-		dbgdev_address_watch_set_registers(adw_info,
-						&addrHi,
-						&addrLo,
-						&cntl,
-						i,
-						vmid);
-
-		pr_debug("\t\t%30s\n", "* * * * * * * * * * * * * * * * * *");
-		pr_debug("\t\t%20s %08x\n", "register index :", i);
-		pr_debug("\t\t%20s %08x\n", "vmid is :", vmid);
-		pr_debug("\t\t%20s %p\n", "Add ptr is :",
-				adw_info->watch_address);
-		pr_debug("\t\t%20s %08llx\n", "Add     is :",
-				adw_info->watch_address[i]);
-		pr_debug("\t\t%20s %08x\n", "Address Low is :",
-				addrLo.bitfields.addr);
-		pr_debug("\t\t%20s %08x\n", "Address high is :",
-				addrHi.bitfields.addr);
-		pr_debug("\t\t%20s %08x\n", "Control Mask is :",
-				cntl.bitfields.mask);
-		pr_debug("\t\t%20s %08x\n", "Control Mode is :",
-				cntl.bitfields.mode);
-		pr_debug("\t\t%20s %08x\n", "Control Vmid is :",
-				cntl.bitfields.vmid);
-		pr_debug("\t\t%20s %08x\n", "Control atc  is :",
-				cntl.bitfields.atc);
-		pr_debug("\t\t%30s\n", "* * * * * * * * * * * * * * * * * *");
-
-		aw_reg_add_dword =
-				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->adev,
-					i,
-					ADDRESS_WATCH_REG_CNTL);
-
-		packets_vec[0].bitfields2.reg_offset =
-					aw_reg_add_dword - AMD_CONFIG_REG_BASE;
-
-		packets_vec[0].reg_data[0] = cntl.u32All;
-
-		aw_reg_add_dword =
-				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->adev,
-					i,
-					ADDRESS_WATCH_REG_ADDR_HI);
-
-		packets_vec[1].bitfields2.reg_offset =
-					aw_reg_add_dword - AMD_CONFIG_REG_BASE;
-		packets_vec[1].reg_data[0] = addrHi.u32All;
-
-		aw_reg_add_dword =
-				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->adev,
-					i,
-					ADDRESS_WATCH_REG_ADDR_LO);
-
-		packets_vec[2].bitfields2.reg_offset =
-				aw_reg_add_dword - AMD_CONFIG_REG_BASE;
-		packets_vec[2].reg_data[0] = addrLo.u32All;
-
-		/* enable watch flag if address is not zero*/
-		if (adw_info->watch_address[i] > 0)
-			cntl.bitfields.valid = 1;
-		else
-			cntl.bitfields.valid = 0;
-
-		aw_reg_add_dword =
-				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->adev,
-					i,
-					ADDRESS_WATCH_REG_CNTL);
-
-		packets_vec[3].bitfields2.reg_offset =
-					aw_reg_add_dword - AMD_CONFIG_REG_BASE;
-		packets_vec[3].reg_data[0] = cntl.u32All;
-
-		status = dbgdev_diq_submit_ib(
-					dbgdev,
-					adw_info->process->pasid,
-					mem_obj->gpu_addr,
-					packet_buff_uint,
-					ib_size);
-
-		if (status) {
-			pr_err("Failed to submit IB to DIQ\n");
-			break;
-		}
-	}
-
-	kfd_gtt_sa_free(dbgdev->dev, mem_obj);
-	return status;
-}
-
-static int dbgdev_wave_control_set_registers(
-				struct dbg_wave_control_info *wac_info,
-				union SQ_CMD_BITS *in_reg_sq_cmd,
-				union GRBM_GFX_INDEX_BITS *in_reg_gfx_index)
-{
-	int status = 0;
-	union SQ_CMD_BITS reg_sq_cmd;
-	union GRBM_GFX_INDEX_BITS reg_gfx_index;
-	struct HsaDbgWaveMsgAMDGen2 *pMsg;
-
-	reg_sq_cmd.u32All = 0;
-	reg_gfx_index.u32All = 0;
-	pMsg = &wac_info->dbgWave_msg.DbgWaveMsg.WaveMsgInfoGen2;
-
-	switch (wac_info->mode) {
-	/* Send command to single wave */
-	case HSA_DBG_WAVEMODE_SINGLE:
-		/*
-		 * Limit access to the process waves only,
-		 * by setting vmid check
-		 */
-		reg_sq_cmd.bits.check_vmid = 1;
-		reg_sq_cmd.bits.simd_id = pMsg->ui32.SIMD;
-		reg_sq_cmd.bits.wave_id = pMsg->ui32.WaveId;
-		reg_sq_cmd.bits.mode = SQ_IND_CMD_MODE_SINGLE;
-
-		reg_gfx_index.bits.sh_index = pMsg->ui32.ShaderArray;
-		reg_gfx_index.bits.se_index = pMsg->ui32.ShaderEngine;
-		reg_gfx_index.bits.instance_index = pMsg->ui32.HSACU;
-
-		break;
-
-	/* Send command to all waves with matching VMID */
-	case HSA_DBG_WAVEMODE_BROADCAST_PROCESS:
-
-		reg_gfx_index.bits.sh_broadcast_writes = 1;
-		reg_gfx_index.bits.se_broadcast_writes = 1;
-		reg_gfx_index.bits.instance_broadcast_writes = 1;
-
-		reg_sq_cmd.bits.mode = SQ_IND_CMD_MODE_BROADCAST;
-
-		break;
-
-	/* Send command to all CU waves with matching VMID */
-	case HSA_DBG_WAVEMODE_BROADCAST_PROCESS_CU:
-
-		reg_sq_cmd.bits.check_vmid = 1;
-		reg_sq_cmd.bits.mode = SQ_IND_CMD_MODE_BROADCAST;
-
-		reg_gfx_index.bits.sh_index = pMsg->ui32.ShaderArray;
-		reg_gfx_index.bits.se_index = pMsg->ui32.ShaderEngine;
-		reg_gfx_index.bits.instance_index = pMsg->ui32.HSACU;
-
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	switch (wac_info->operand) {
-	case HSA_DBG_WAVEOP_HALT:
-		reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_HALT;
-		break;
-
-	case HSA_DBG_WAVEOP_RESUME:
-		reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_RESUME;
-		break;
-
-	case HSA_DBG_WAVEOP_KILL:
-		reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_KILL;
-		break;
-
-	case HSA_DBG_WAVEOP_DEBUG:
-		reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_DEBUG;
-		break;
-
-	case HSA_DBG_WAVEOP_TRAP:
-		if (wac_info->trapId < MAX_TRAPID) {
-			reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_TRAP;
-			reg_sq_cmd.bits.trap_id = wac_info->trapId;
-		} else {
-			status = -EINVAL;
-		}
-		break;
-
-	default:
-		status = -EINVAL;
-		break;
-	}
-
-	if (status == 0) {
-		*in_reg_sq_cmd = reg_sq_cmd;
-		*in_reg_gfx_index = reg_gfx_index;
-	}
-
-	return status;
-}
-
-static int dbgdev_wave_control_diq(struct kfd_dbgdev *dbgdev,
-					struct dbg_wave_control_info *wac_info)
-{
-
-	int status;
-	union SQ_CMD_BITS reg_sq_cmd;
-	union GRBM_GFX_INDEX_BITS reg_gfx_index;
-	struct kfd_mem_obj *mem_obj;
-	uint32_t *packet_buff_uint;
-	struct pm4__set_config_reg *packets_vec;
-	size_t ib_size = sizeof(struct pm4__set_config_reg) * 3;
-
-	reg_sq_cmd.u32All = 0;
-
-	status = dbgdev_wave_control_set_registers(wac_info, &reg_sq_cmd,
-							&reg_gfx_index);
-	if (status) {
-		pr_err("Failed to set wave control registers\n");
-		return status;
-	}
-
-	/* we do not control the VMID in DIQ, so reset it to a known value */
-	reg_sq_cmd.bits.vm_id = 0;
-
-	pr_debug("\t\t %30s\n", "* * * * * * * * * * * * * * * * * *");
-
-	pr_debug("\t\t mode      is: %u\n", wac_info->mode);
-	pr_debug("\t\t operand   is: %u\n", wac_info->operand);
-	pr_debug("\t\t trap id   is: %u\n", wac_info->trapId);
-	pr_debug("\t\t msg value is: %u\n",
-			wac_info->dbgWave_msg.DbgWaveMsg.WaveMsgInfoGen2.Value);
-	pr_debug("\t\t vmid      is: N/A\n");
-
-	pr_debug("\t\t chk_vmid  is : %u\n", reg_sq_cmd.bitfields.check_vmid);
-	pr_debug("\t\t command   is : %u\n", reg_sq_cmd.bitfields.cmd);
-	pr_debug("\t\t queue id  is : %u\n", reg_sq_cmd.bitfields.queue_id);
-	pr_debug("\t\t simd id   is : %u\n", reg_sq_cmd.bitfields.simd_id);
-	pr_debug("\t\t mode      is : %u\n", reg_sq_cmd.bitfields.mode);
-	pr_debug("\t\t vm_id     is : %u\n", reg_sq_cmd.bitfields.vm_id);
-	pr_debug("\t\t wave_id   is : %u\n", reg_sq_cmd.bitfields.wave_id);
-
-	pr_debug("\t\t ibw       is : %u\n",
-			reg_gfx_index.bitfields.instance_broadcast_writes);
-	pr_debug("\t\t ii        is : %u\n",
-			reg_gfx_index.bitfields.instance_index);
-	pr_debug("\t\t sebw      is : %u\n",
-			reg_gfx_index.bitfields.se_broadcast_writes);
-	pr_debug("\t\t se_ind    is : %u\n", reg_gfx_index.bitfields.se_index);
-	pr_debug("\t\t sh_ind    is : %u\n", reg_gfx_index.bitfields.sh_index);
-	pr_debug("\t\t sbw       is : %u\n",
-			reg_gfx_index.bitfields.sh_broadcast_writes);
-
-	pr_debug("\t\t %30s\n", "* * * * * * * * * * * * * * * * * *");
-
-	status = kfd_gtt_sa_allocate(dbgdev->dev, ib_size, &mem_obj);
-
-	if (status != 0) {
-		pr_err("Failed to allocate GART memory\n");
-		return status;
-	}
-
-	packet_buff_uint = mem_obj->cpu_ptr;
-
-	memset(packet_buff_uint, 0, ib_size);
-
-	packets_vec =  (struct pm4__set_config_reg *) packet_buff_uint;
-	packets_vec[0].header.count = 1;
-	packets_vec[0].header.opcode = IT_SET_UCONFIG_REG;
-	packets_vec[0].header.type = PM4_TYPE_3;
-	packets_vec[0].bitfields2.reg_offset =
-			GRBM_GFX_INDEX / 4 - USERCONFIG_REG_BASE;
-
-	packets_vec[0].bitfields2.insert_vmid = 0;
-	packets_vec[0].reg_data[0] = reg_gfx_index.u32All;
-
-	packets_vec[1].header.count = 1;
-	packets_vec[1].header.opcode = IT_SET_CONFIG_REG;
-	packets_vec[1].header.type = PM4_TYPE_3;
-	packets_vec[1].bitfields2.reg_offset = SQ_CMD / 4 - AMD_CONFIG_REG_BASE;
-
-	packets_vec[1].bitfields2.vmid_shift = SQ_CMD_VMID_OFFSET;
-	packets_vec[1].bitfields2.insert_vmid = 1;
-	packets_vec[1].reg_data[0] = reg_sq_cmd.u32All;
-
-	/* Restore the GRBM_GFX_INDEX register */
-
-	reg_gfx_index.u32All = 0;
-	reg_gfx_index.bits.sh_broadcast_writes = 1;
-	reg_gfx_index.bits.instance_broadcast_writes = 1;
-	reg_gfx_index.bits.se_broadcast_writes = 1;
-
-
-	packets_vec[2].ordinal1 = packets_vec[0].ordinal1;
-	packets_vec[2].bitfields2.reg_offset =
-				GRBM_GFX_INDEX / 4 - USERCONFIG_REG_BASE;
-
-	packets_vec[2].bitfields2.insert_vmid = 0;
-	packets_vec[2].reg_data[0] = reg_gfx_index.u32All;
-
-	status = dbgdev_diq_submit_ib(
-			dbgdev,
-			wac_info->process->pasid,
-			mem_obj->gpu_addr,
-			packet_buff_uint,
-			ib_size);
-
-	if (status)
-		pr_err("Failed to submit IB to DIQ\n");
-
-	kfd_gtt_sa_free(dbgdev->dev, mem_obj);
-
-	return status;
-}
-
-static int dbgdev_wave_control_nodiq(struct kfd_dbgdev *dbgdev,
-					struct dbg_wave_control_info *wac_info)
-{
-	int status;
-	union SQ_CMD_BITS reg_sq_cmd;
-	union GRBM_GFX_INDEX_BITS reg_gfx_index;
-	struct kfd_process_device *pdd;
-
-	reg_sq_cmd.u32All = 0;
-
-	/* taking the VMID for that process on the safe way using PDD */
-	pdd = kfd_get_process_device_data(dbgdev->dev, wac_info->process);
-
-	if (!pdd) {
-		pr_err("Failed to get pdd for wave control no DIQ\n");
-		return -EFAULT;
-	}
-	status = dbgdev_wave_control_set_registers(wac_info, &reg_sq_cmd,
-							&reg_gfx_index);
-	if (status) {
-		pr_err("Failed to set wave control registers\n");
-		return status;
-	}
-
-	/* for non DIQ we need to patch the VMID: */
-
-	reg_sq_cmd.bits.vm_id = pdd->qpd.vmid;
-
-	pr_debug("\t\t %30s\n", "* * * * * * * * * * * * * * * * * *");
-
-	pr_debug("\t\t mode      is: %u\n", wac_info->mode);
-	pr_debug("\t\t operand   is: %u\n", wac_info->operand);
-	pr_debug("\t\t trap id   is: %u\n", wac_info->trapId);
-	pr_debug("\t\t msg value is: %u\n",
-			wac_info->dbgWave_msg.DbgWaveMsg.WaveMsgInfoGen2.Value);
-	pr_debug("\t\t vmid      is: %u\n", pdd->qpd.vmid);
-
-	pr_debug("\t\t chk_vmid  is : %u\n", reg_sq_cmd.bitfields.check_vmid);
-	pr_debug("\t\t command   is : %u\n", reg_sq_cmd.bitfields.cmd);
-	pr_debug("\t\t queue id  is : %u\n", reg_sq_cmd.bitfields.queue_id);
-	pr_debug("\t\t simd id   is : %u\n", reg_sq_cmd.bitfields.simd_id);
-	pr_debug("\t\t mode      is : %u\n", reg_sq_cmd.bitfields.mode);
-	pr_debug("\t\t vm_id     is : %u\n", reg_sq_cmd.bitfields.vm_id);
-	pr_debug("\t\t wave_id   is : %u\n", reg_sq_cmd.bitfields.wave_id);
-
-	pr_debug("\t\t ibw       is : %u\n",
-			reg_gfx_index.bitfields.instance_broadcast_writes);
-	pr_debug("\t\t ii        is : %u\n",
-			reg_gfx_index.bitfields.instance_index);
-	pr_debug("\t\t sebw      is : %u\n",
-			reg_gfx_index.bitfields.se_broadcast_writes);
-	pr_debug("\t\t se_ind    is : %u\n", reg_gfx_index.bitfields.se_index);
-	pr_debug("\t\t sh_ind    is : %u\n", reg_gfx_index.bitfields.sh_index);
-	pr_debug("\t\t sbw       is : %u\n",
-			reg_gfx_index.bitfields.sh_broadcast_writes);
-
-	pr_debug("\t\t %30s\n", "* * * * * * * * * * * * * * * * * *");
-
-	return dbgdev->dev->kfd2kgd->wave_control_execute(dbgdev->dev->adev,
-							reg_gfx_index.u32All,
-							reg_sq_cmd.u32All);
-}
-
-int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
-{
-	int status = 0;
-	unsigned int vmid;
-	uint16_t queried_pasid;
-	union SQ_CMD_BITS reg_sq_cmd;
-	union GRBM_GFX_INDEX_BITS reg_gfx_index;
-	struct kfd_process_device *pdd;
-	struct dbg_wave_control_info wac_info;
-	int first_vmid_to_scan = dev->vm_info.first_vmid_kfd;
-	int last_vmid_to_scan = dev->vm_info.last_vmid_kfd;
-
-	reg_sq_cmd.u32All = 0;
-	status = 0;
-
-	wac_info.mode = HSA_DBG_WAVEMODE_BROADCAST_PROCESS;
-	wac_info.operand = HSA_DBG_WAVEOP_KILL;
-
-	pr_debug("Killing all process wavefronts\n");
-
-	/* Scan all registers in the range ATC_VMID8_PASID_MAPPING ..
-	 * ATC_VMID15_PASID_MAPPING
-	 * to check which VMID the current process is mapped to.
-	 */
-
-	for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
-		status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
-				(dev->adev, vmid, &queried_pasid);
-
-		if (status && queried_pasid == p->pasid) {
-			pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
-					vmid, p->pasid);
-			break;
-		}
-	}
-
-	if (vmid > last_vmid_to_scan) {
-		pr_err("Didn't find vmid for pasid 0x%x\n", p->pasid);
-		return -EFAULT;
-	}
-
-	/* taking the VMID for that process on the safe way using PDD */
-	pdd = kfd_get_process_device_data(dev, p);
-	if (!pdd)
-		return -EFAULT;
-
-	status = dbgdev_wave_control_set_registers(&wac_info, &reg_sq_cmd,
-			&reg_gfx_index);
-	if (status != 0)
-		return -EINVAL;
-
-	/* for non DIQ we need to patch the VMID: */
-	reg_sq_cmd.bits.vm_id = vmid;
-
-	dev->kfd2kgd->wave_control_execute(dev->adev,
-					reg_gfx_index.u32All,
-					reg_sq_cmd.u32All);
-
-	return 0;
-}
-
-void kfd_dbgdev_init(struct kfd_dbgdev *pdbgdev, struct kfd_dev *pdev,
-			enum DBGDEV_TYPE type)
-{
-	pdbgdev->dev = pdev;
-	pdbgdev->kq = NULL;
-	pdbgdev->type = type;
-	pdbgdev->pqm = NULL;
-
-	switch (type) {
-	case DBGDEV_TYPE_NODIQ:
-		pdbgdev->dbgdev_register = dbgdev_register_nodiq;
-		pdbgdev->dbgdev_unregister = dbgdev_unregister_nodiq;
-		pdbgdev->dbgdev_wave_control = dbgdev_wave_control_nodiq;
-		pdbgdev->dbgdev_address_watch = dbgdev_address_watch_nodiq;
-		break;
-	case DBGDEV_TYPE_DIQ:
-	default:
-		pdbgdev->dbgdev_register = dbgdev_register_diq;
-		pdbgdev->dbgdev_unregister = dbgdev_unregister_diq;
-		pdbgdev->dbgdev_wave_control =  dbgdev_wave_control_diq;
-		pdbgdev->dbgdev_address_watch = dbgdev_address_watch_diq;
-		break;
-	}
-
-}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h
deleted file mode 100644
index 0619c777b47e..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h
+++ /dev/null
@@ -1,230 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef KFD_DBGDEV_H_
-#define KFD_DBGDEV_H_
-
-enum {
-	SQ_CMD_VMID_OFFSET = 28,
-	ADDRESS_WATCH_CNTL_OFFSET = 24
-};
-
-enum {
-	PRIV_QUEUE_SYNC_TIME_MS = 200
-};
-
-/* CONTEXT reg space definition */
-enum {
-	CONTEXT_REG_BASE = 0xA000,
-	CONTEXT_REG_END = 0xA400,
-	CONTEXT_REG_SIZE = CONTEXT_REG_END - CONTEXT_REG_BASE
-};
-
-/* USER CONFIG reg space definition */
-enum {
-	USERCONFIG_REG_BASE = 0xC000,
-	USERCONFIG_REG_END = 0x10000,
-	USERCONFIG_REG_SIZE = USERCONFIG_REG_END - USERCONFIG_REG_BASE
-};
-
-/* CONFIG reg space definition */
-enum {
-	AMD_CONFIG_REG_BASE = 0x2000,	/* in dwords */
-	AMD_CONFIG_REG_END = 0x2B00,
-	AMD_CONFIG_REG_SIZE = AMD_CONFIG_REG_END - AMD_CONFIG_REG_BASE
-};
-
-/* SH reg space definition */
-enum {
-	SH_REG_BASE = 0x2C00,
-	SH_REG_END = 0x3000,
-	SH_REG_SIZE = SH_REG_END - SH_REG_BASE
-};
-
-/* SQ_CMD definitions */
-#define SQ_CMD						0x8DEC
-
-enum SQ_IND_CMD_CMD {
-	SQ_IND_CMD_CMD_NULL = 0x00000000,
-	SQ_IND_CMD_CMD_HALT = 0x00000001,
-	SQ_IND_CMD_CMD_RESUME = 0x00000002,
-	SQ_IND_CMD_CMD_KILL = 0x00000003,
-	SQ_IND_CMD_CMD_DEBUG = 0x00000004,
-	SQ_IND_CMD_CMD_TRAP = 0x00000005,
-};
-
-enum SQ_IND_CMD_MODE {
-	SQ_IND_CMD_MODE_SINGLE = 0x00000000,
-	SQ_IND_CMD_MODE_BROADCAST = 0x00000001,
-	SQ_IND_CMD_MODE_BROADCAST_QUEUE = 0x00000002,
-	SQ_IND_CMD_MODE_BROADCAST_PIPE = 0x00000003,
-	SQ_IND_CMD_MODE_BROADCAST_ME = 0x00000004,
-};
-
-union SQ_IND_INDEX_BITS {
-	struct {
-		uint32_t wave_id:4;
-		uint32_t simd_id:2;
-		uint32_t thread_id:6;
-		 uint32_t:1;
-		uint32_t force_read:1;
-		uint32_t read_timeout:1;
-		uint32_t unindexed:1;
-		uint32_t index:16;
-
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union SQ_IND_CMD_BITS {
-	struct {
-		uint32_t data:32;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union SQ_CMD_BITS {
-	struct {
-		uint32_t cmd:3;
-		 uint32_t:1;
-		uint32_t mode:3;
-		uint32_t check_vmid:1;
-		uint32_t trap_id:3;
-		 uint32_t:5;
-		uint32_t wave_id:4;
-		uint32_t simd_id:2;
-		 uint32_t:2;
-		uint32_t queue_id:3;
-		 uint32_t:1;
-		uint32_t vm_id:4;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union SQ_IND_DATA_BITS {
-	struct {
-		uint32_t data:32;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union GRBM_GFX_INDEX_BITS {
-	struct {
-		uint32_t instance_index:8;
-		uint32_t sh_index:8;
-		uint32_t se_index:8;
-		 uint32_t:5;
-		uint32_t sh_broadcast_writes:1;
-		uint32_t instance_broadcast_writes:1;
-		uint32_t se_broadcast_writes:1;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union TCP_WATCH_ADDR_H_BITS {
-	struct {
-		uint32_t addr:16;
-		 uint32_t:16;
-
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-union TCP_WATCH_ADDR_L_BITS {
-	struct {
-		uint32_t:6;
-		uint32_t addr:26;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-enum {
-	QUEUESTATE__INVALID = 0, /* so by default we'll get invalid state */
-	QUEUESTATE__ACTIVE_COMPLETION_PENDING,
-	QUEUESTATE__ACTIVE
-};
-
-union ULARGE_INTEGER {
-	struct {
-		uint32_t low_part;
-		uint32_t high_part;
-	} u;
-	unsigned long long quad_part;
-};
-
-
-#define KFD_CIK_VMID_START_OFFSET (8)
-#define KFD_CIK_VMID_END_OFFSET (KFD_CIK_VMID_START_OFFSET + (8))
-
-
-void kfd_dbgdev_init(struct kfd_dbgdev *pdbgdev, struct kfd_dev *pdev,
-			enum DBGDEV_TYPE type);
-
-union TCP_WATCH_CNTL_BITS {
-	struct {
-		uint32_t mask:24;
-		uint32_t vmid:4;
-		uint32_t atc:1;
-		uint32_t mode:2;
-		uint32_t valid:1;
-	} bitfields, bits;
-	uint32_t u32All;
-	signed int i32All;
-	float f32All;
-};
-
-enum {
-	ADDRESS_WATCH_REG_CNTL_ATC_BIT = 0x10000000UL,
-	ADDRESS_WATCH_REG_CNTL_DEFAULT_MASK = 0x00FFFFFF,
-	ADDRESS_WATCH_REG_ADDLOW_MASK_EXTENSION = 0x03000000,
-	/* extend the mask to 26 bits in order to match the low address field */
-	ADDRESS_WATCH_REG_ADDLOW_SHIFT = 6,
-	ADDRESS_WATCH_REG_ADDHIGH_MASK = 0xFFFF
-};
-
-enum {
-	MAX_TRAPID = 8,		/* 3 bits in the bitfield. */
-	MAX_WATCH_ADDRESSES = 4
-};
-
-enum {
-	ADDRESS_WATCH_REG_ADDR_HI = 0,
-	ADDRESS_WATCH_REG_ADDR_LO,
-	ADDRESS_WATCH_REG_CNTL,
-	ADDRESS_WATCH_REG_MAX
-};
-
-#endif	/* KFD_DBGDEV_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c
deleted file mode 100644
index 9bfa50633654..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c
+++ /dev/null
@@ -1,158 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/log2.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
-#include <linux/device.h>
-
-#include "kfd_priv.h"
-#include "cik_regs.h"
-#include "kfd_pm4_headers.h"
-#include "kfd_pm4_headers_diq.h"
-#include "kfd_dbgmgr.h"
-#include "kfd_dbgdev.h"
-#include "kfd_device_queue_manager.h"
-
-static DEFINE_MUTEX(kfd_dbgmgr_mutex);
-
-struct mutex *kfd_get_dbgmgr_mutex(void)
-{
-	return &kfd_dbgmgr_mutex;
-}
-
-
-static void kfd_dbgmgr_uninitialize(struct kfd_dbgmgr *pmgr)
-{
-	kfree(pmgr->dbgdev);
-
-	pmgr->dbgdev = NULL;
-	pmgr->pasid = 0;
-	pmgr->dev = NULL;
-}
-
-void kfd_dbgmgr_destroy(struct kfd_dbgmgr *pmgr)
-{
-	if (pmgr) {
-		kfd_dbgmgr_uninitialize(pmgr);
-		kfree(pmgr);
-	}
-}
-
-bool kfd_dbgmgr_create(struct kfd_dbgmgr **ppmgr, struct kfd_dev *pdev)
-{
-	enum DBGDEV_TYPE type = DBGDEV_TYPE_DIQ;
-	struct kfd_dbgmgr *new_buff;
-
-	if (WARN_ON(!pdev->init_complete))
-		return false;
-
-	new_buff = kfd_alloc_struct(new_buff);
-	if (!new_buff) {
-		pr_err("Failed to allocate dbgmgr instance\n");
-		return false;
-	}
-
-	new_buff->pasid = 0;
-	new_buff->dev = pdev;
-	new_buff->dbgdev = kfd_alloc_struct(new_buff->dbgdev);
-	if (!new_buff->dbgdev) {
-		pr_err("Failed to allocate dbgdev instance\n");
-		kfree(new_buff);
-		return false;
-	}
-
-	/* get actual type of DBGDevice cpsch or not */
-	if (pdev->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS)
-		type = DBGDEV_TYPE_NODIQ;
-
-	kfd_dbgdev_init(new_buff->dbgdev, pdev, type);
-	*ppmgr = new_buff;
-
-	return true;
-}
-
-long kfd_dbgmgr_register(struct kfd_dbgmgr *pmgr, struct kfd_process *p)
-{
-	if (pmgr->pasid != 0) {
-		pr_debug("H/W debugger is already active using pasid 0x%x\n",
-				pmgr->pasid);
-		return -EBUSY;
-	}
-
-	/* remember pasid */
-	pmgr->pasid = p->pasid;
-
-	/* provide the pqm for diq generation */
-	pmgr->dbgdev->pqm = &p->pqm;
-
-	/* activate the actual registering */
-	pmgr->dbgdev->dbgdev_register(pmgr->dbgdev);
-
-	return 0;
-}
-
-long kfd_dbgmgr_unregister(struct kfd_dbgmgr *pmgr, struct kfd_process *p)
-{
-	/* Is the requests coming from the already registered process? */
-	if (pmgr->pasid != p->pasid) {
-		pr_debug("H/W debugger is not registered by calling pasid 0x%x\n",
-				p->pasid);
-		return -EINVAL;
-	}
-
-	pmgr->dbgdev->dbgdev_unregister(pmgr->dbgdev);
-
-	pmgr->pasid = 0;
-
-	return 0;
-}
-
-long kfd_dbgmgr_wave_control(struct kfd_dbgmgr *pmgr,
-				struct dbg_wave_control_info *wac_info)
-{
-	/* Is the requests coming from the already registered process? */
-	if (pmgr->pasid != wac_info->process->pasid) {
-		pr_debug("H/W debugger support was not registered for requester pasid 0x%x\n",
-				wac_info->process->pasid);
-		return -EINVAL;
-	}
-
-	return (long) pmgr->dbgdev->dbgdev_wave_control(pmgr->dbgdev, wac_info);
-}
-
-long kfd_dbgmgr_address_watch(struct kfd_dbgmgr *pmgr,
-				struct dbg_address_watch_info *adw_info)
-{
-	/* Is the requests coming from the already registered process? */
-	if (pmgr->pasid != adw_info->process->pasid) {
-		pr_debug("H/W debugger support was not registered for requester pasid 0x%x\n",
-				adw_info->process->pasid);
-		return -EINVAL;
-	}
-
-	return (long) pmgr->dbgdev->dbgdev_address_watch(pmgr->dbgdev,
-							adw_info);
-}
-
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h b/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h
deleted file mode 100644
index f9c6df1fdc5c..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h
+++ /dev/null
@@ -1,293 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef KFD_DBGMGR_H_
-#define KFD_DBGMGR_H_
-
-#include "kfd_priv.h"
-
-/* must align with hsakmttypes definition */
-#pragma pack(push, 4)
-
-enum HSA_DBG_WAVEOP {
-	HSA_DBG_WAVEOP_HALT = 1,   /* Halts a wavefront */
-	HSA_DBG_WAVEOP_RESUME = 2, /* Resumes a wavefront */
-	HSA_DBG_WAVEOP_KILL = 3,   /* Kills a wavefront */
-	HSA_DBG_WAVEOP_DEBUG = 4,  /* Causes wavefront to enter dbg mode */
-	HSA_DBG_WAVEOP_TRAP = 5,   /* Causes wavefront to take a trap */
-	HSA_DBG_NUM_WAVEOP = 5,
-	HSA_DBG_MAX_WAVEOP = 0xFFFFFFFF
-};
-
-enum HSA_DBG_WAVEMODE {
-	/* send command to a single wave */
-	HSA_DBG_WAVEMODE_SINGLE = 0,
-	/*
-	 * Broadcast to all wavefronts of all processes is not
-	 * supported for HSA user mode
-	 */
-
-	/* send to waves within current process */
-	HSA_DBG_WAVEMODE_BROADCAST_PROCESS = 2,
-	/* send to waves within current process on CU  */
-	HSA_DBG_WAVEMODE_BROADCAST_PROCESS_CU = 3,
-	HSA_DBG_NUM_WAVEMODE = 3,
-	HSA_DBG_MAX_WAVEMODE = 0xFFFFFFFF
-};
-
-enum HSA_DBG_WAVEMSG_TYPE {
-	HSA_DBG_WAVEMSG_AUTO = 0,
-	HSA_DBG_WAVEMSG_USER = 1,
-	HSA_DBG_WAVEMSG_ERROR = 2,
-	HSA_DBG_NUM_WAVEMSG,
-	HSA_DBG_MAX_WAVEMSG = 0xFFFFFFFF
-};
-
-enum HSA_DBG_WATCH_MODE {
-	HSA_DBG_WATCH_READ = 0,		/* Read operations only */
-	HSA_DBG_WATCH_NONREAD = 1,	/* Write or Atomic operations only */
-	HSA_DBG_WATCH_ATOMIC = 2,	/* Atomic Operations only */
-	HSA_DBG_WATCH_ALL = 3,		/* Read, Write or Atomic operations */
-	HSA_DBG_WATCH_NUM,
-	HSA_DBG_WATCH_SIZE = 0xFFFFFFFF
-};
-
-/* This structure is hardware specific and may change in the future */
-struct HsaDbgWaveMsgAMDGen2 {
-	union {
-		struct ui32 {
-			uint32_t UserData:8;	/* user data */
-			uint32_t ShaderArray:1;	/* Shader array */
-			uint32_t Priv:1;	/* Privileged */
-			uint32_t Reserved0:4;	/* Reserved, should be 0 */
-			uint32_t WaveId:4;	/* wave id */
-			uint32_t SIMD:2;	/* SIMD id */
-			uint32_t HSACU:4;	/* Compute unit */
-			uint32_t ShaderEngine:2;/* Shader engine */
-			uint32_t MessageType:2;	/* see HSA_DBG_WAVEMSG_TYPE */
-			uint32_t Reserved1:4;	/* Reserved, should be 0 */
-		} ui32;
-		uint32_t Value;
-	};
-	uint32_t Reserved2;
-};
-
-union HsaDbgWaveMessageAMD {
-	struct HsaDbgWaveMsgAMDGen2 WaveMsgInfoGen2;
-	/* for future HsaDbgWaveMsgAMDGen3; */
-};
-
-struct HsaDbgWaveMessage {
-	void *MemoryVA;		/* ptr to associated host-accessible data */
-	union HsaDbgWaveMessageAMD DbgWaveMsg;
-};
-
-/*
- * TODO: This definitions to be MOVED to kfd_event, once it is implemented.
- *
- * HSA sync primitive, Event and HW Exception notification API definitions.
- * The API functions allow the runtime to define a so-called sync-primitive,
- * a SW object combining a user-mode provided "syncvar" and a scheduler event
- * that can be signaled through a defined GPU interrupt. A syncvar is
- * a process virtual memory location of a certain size that can be accessed
- * by CPU and GPU shader code within the process to set and query the content
- * within that memory. The definition of the content is determined by the HSA
- * runtime and potentially GPU shader code interfacing with the HSA runtime.
- * The syncvar values may be commonly written through an PM4 WRITE_DATA packet
- * in the user mode instruction stream. The OS scheduler event is typically
- * associated and signaled by an interrupt issued by the GPU, but other HSA
- * system interrupt conditions from other HW (e.g. IOMMUv2) may be surfaced
- * by the KFD by this mechanism, too.
- */
-
-/* these are the new definitions for events */
-enum HSA_EVENTTYPE {
-	HSA_EVENTTYPE_SIGNAL = 0,	/* user-mode generated GPU signal */
-	HSA_EVENTTYPE_NODECHANGE = 1,	/* HSA node change (attach/detach) */
-	HSA_EVENTTYPE_DEVICESTATECHANGE = 2,	/* HSA device state change
-						 * (start/stop)
-						 */
-	HSA_EVENTTYPE_HW_EXCEPTION = 3,	/* GPU shader exception event */
-	HSA_EVENTTYPE_SYSTEM_EVENT = 4,	/* GPU SYSCALL with parameter info */
-	HSA_EVENTTYPE_DEBUG_EVENT = 5,	/* GPU signal for debugging */
-	HSA_EVENTTYPE_PROFILE_EVENT = 6,/* GPU signal for profiling */
-	HSA_EVENTTYPE_QUEUE_EVENT = 7,	/* GPU signal queue idle state
-					 * (EOP pm4)
-					 */
-	/* ...  */
-	HSA_EVENTTYPE_MAXID,
-	HSA_EVENTTYPE_TYPE_SIZE = 0xFFFFFFFF
-};
-
-/* Sub-definitions for various event types: Syncvar */
-struct HsaSyncVar {
-	union SyncVar {
-		void *UserData;	/* pointer to user mode data */
-		uint64_t UserDataPtrValue; /* 64bit compatibility of value */
-	} SyncVar;
-	uint64_t SyncVarSize;
-};
-
-/* Sub-definitions for various event types: NodeChange */
-
-enum HSA_EVENTTYPE_NODECHANGE_FLAGS {
-	HSA_EVENTTYPE_NODECHANGE_ADD = 0,
-	HSA_EVENTTYPE_NODECHANGE_REMOVE = 1,
-	HSA_EVENTTYPE_NODECHANGE_SIZE = 0xFFFFFFFF
-};
-
-struct HsaNodeChange {
-	/* HSA node added/removed on the platform */
-	enum HSA_EVENTTYPE_NODECHANGE_FLAGS Flags;
-};
-
-/* Sub-definitions for various event types: DeviceStateChange */
-enum HSA_EVENTTYPE_DEVICESTATECHANGE_FLAGS {
-	/* device started (and available) */
-	HSA_EVENTTYPE_DEVICESTATUSCHANGE_START = 0,
-	/* device stopped (i.e. unavailable) */
-	HSA_EVENTTYPE_DEVICESTATUSCHANGE_STOP = 1,
-	HSA_EVENTTYPE_DEVICESTATUSCHANGE_SIZE = 0xFFFFFFFF
-};
-
-enum HSA_DEVICE {
-	HSA_DEVICE_CPU = 0,
-	HSA_DEVICE_GPU = 1,
-	MAX_HSA_DEVICE = 2
-};
-
-struct HsaDeviceStateChange {
-	uint32_t NodeId;	/* F-NUMA node that contains the device */
-	enum HSA_DEVICE Device;	/* device type: GPU or CPU */
-	enum HSA_EVENTTYPE_DEVICESTATECHANGE_FLAGS Flags; /* event flags */
-};
-
-struct HsaEventData {
-	enum HSA_EVENTTYPE EventType; /* event type */
-	union EventData {
-		/*
-		 * return data associated with HSA_EVENTTYPE_SIGNAL
-		 * and other events
-		 */
-		struct HsaSyncVar SyncVar;
-
-		/* data associated with HSA_EVENTTYPE_NODE_CHANGE */
-		struct HsaNodeChange NodeChangeState;
-
-		/* data associated with HSA_EVENTTYPE_DEVICE_STATE_CHANGE */
-		struct HsaDeviceStateChange DeviceState;
-	} EventData;
-
-	/* the following data entries are internal to the KFD & thunk itself */
-
-	/* internal thunk store for Event data (OsEventHandle) */
-	uint64_t HWData1;
-	/* internal thunk store for Event data (HWAddress) */
-	uint64_t HWData2;
-	/* internal thunk store for Event data (HWData) */
-	uint32_t HWData3;
-};
-
-struct HsaEventDescriptor {
-	/* event type to allocate */
-	enum HSA_EVENTTYPE EventType;
-	/* H-NUMA node containing GPU device that is event source */
-	uint32_t NodeId;
-	/* pointer to user mode syncvar data, syncvar->UserDataPtrValue
-	 * may be NULL
-	 */
-	struct HsaSyncVar SyncVar;
-};
-
-struct HsaEvent {
-	uint32_t EventId;
-	struct HsaEventData EventData;
-};
-
-#pragma pack(pop)
-
-enum DBGDEV_TYPE {
-	DBGDEV_TYPE_ILLEGAL = 0,
-	DBGDEV_TYPE_NODIQ = 1,
-	DBGDEV_TYPE_DIQ = 2,
-	DBGDEV_TYPE_TEST = 3
-};
-
-struct dbg_address_watch_info {
-	struct kfd_process *process;
-	enum HSA_DBG_WATCH_MODE *watch_mode;
-	uint64_t *watch_address;
-	uint64_t *watch_mask;
-	struct HsaEvent *watch_event;
-	uint32_t num_watch_points;
-};
-
-struct dbg_wave_control_info {
-	struct kfd_process *process;
-	uint32_t trapId;
-	enum HSA_DBG_WAVEOP operand;
-	enum HSA_DBG_WAVEMODE mode;
-	struct HsaDbgWaveMessage dbgWave_msg;
-};
-
-struct kfd_dbgdev {
-
-	/* The device that owns this data. */
-	struct kfd_dev *dev;
-
-	/* kernel queue for DIQ */
-	struct kernel_queue *kq;
-
-	/* a pointer to the pqm of the calling process */
-	struct process_queue_manager *pqm;
-
-	/* type of debug device ( DIQ, non DIQ, etc. ) */
-	enum DBGDEV_TYPE type;
-
-	/* virtualized function pointers to device dbg */
-	int (*dbgdev_register)(struct kfd_dbgdev *dbgdev);
-	int (*dbgdev_unregister)(struct kfd_dbgdev *dbgdev);
-	int (*dbgdev_address_watch)(struct kfd_dbgdev *dbgdev,
-				struct dbg_address_watch_info *adw_info);
-	int (*dbgdev_wave_control)(struct kfd_dbgdev *dbgdev,
-				struct dbg_wave_control_info *wac_info);
-
-};
-
-struct kfd_dbgmgr {
-	u32 pasid;
-	struct kfd_dev *dev;
-	struct kfd_dbgdev *dbgdev;
-};
-
-/* prototypes for debug manager functions */
-struct mutex *kfd_get_dbgmgr_mutex(void);
-void kfd_dbgmgr_destroy(struct kfd_dbgmgr *pmgr);
-bool kfd_dbgmgr_create(struct kfd_dbgmgr **ppmgr, struct kfd_dev *pdev);
-long kfd_dbgmgr_register(struct kfd_dbgmgr *pmgr, struct kfd_process *p);
-long kfd_dbgmgr_unregister(struct kfd_dbgmgr *pmgr, struct kfd_process *p);
-long kfd_dbgmgr_wave_control(struct kfd_dbgmgr *pmgr,
-				struct dbg_wave_control_info *wac_info);
-long kfd_dbgmgr_address_watch(struct kfd_dbgmgr *pmgr,
-			struct dbg_address_watch_info *adw_info);
-#endif /* KFD_DBGMGR_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 5a47f437b455..dbb877fba724 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -575,8 +575,6 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	if (kfd_resume(kfd))
 		goto kfd_resume_error;
 
-	kfd->dbgmgr = NULL;
-
 	if (kfd_topology_add_device(kfd)) {
 		dev_err(kfd_device, "Error adding device to topology\n");
 		goto kfd_topology_add_device_error;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 63b3c7af681b..f5d82f257dbb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -480,6 +480,65 @@ static inline void deallocate_hqd(struct device_queue_manager *dqm,
 	dqm->allocated_queues[q->pipe] |= (1 << q->queue);
 }
 
+#define SQ_IND_CMD_CMD_KILL		0x00000003
+#define SQ_IND_CMD_MODE_BROADCAST	0x00000001
+
+static int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
+{
+	int status = 0;
+	unsigned int vmid;
+	uint16_t queried_pasid;
+	union SQ_CMD_BITS reg_sq_cmd;
+	union GRBM_GFX_INDEX_BITS reg_gfx_index;
+	struct kfd_process_device *pdd;
+	int first_vmid_to_scan = dev->vm_info.first_vmid_kfd;
+	int last_vmid_to_scan = dev->vm_info.last_vmid_kfd;
+
+	reg_sq_cmd.u32All = 0;
+	reg_gfx_index.u32All = 0;
+
+	pr_debug("Killing all process wavefronts\n");
+
+	/* Scan all registers in the range ATC_VMID8_PASID_MAPPING ..
+	 * ATC_VMID15_PASID_MAPPING
+	 * to check which VMID the current process is mapped to.
+	 */
+
+	for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
+		status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
+				(dev->adev, vmid, &queried_pasid);
+
+		if (status && queried_pasid == p->pasid) {
+			pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
+					vmid, p->pasid);
+			break;
+		}
+	}
+
+	if (vmid > last_vmid_to_scan) {
+		pr_err("Didn't find vmid for pasid 0x%x\n", p->pasid);
+		return -EFAULT;
+	}
+
+	/* taking the VMID for that process on the safe way using PDD */
+	pdd = kfd_get_process_device_data(dev, p);
+	if (!pdd)
+		return -EFAULT;
+
+	reg_gfx_index.bits.sh_broadcast_writes = 1;
+	reg_gfx_index.bits.se_broadcast_writes = 1;
+	reg_gfx_index.bits.instance_broadcast_writes = 1;
+	reg_sq_cmd.bits.mode = SQ_IND_CMD_MODE_BROADCAST;
+	reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_KILL;
+	reg_sq_cmd.bits.vm_id = vmid;
+
+	dev->kfd2kgd->wave_control_execute(dev->adev,
+					reg_gfx_index.u32All,
+					reg_sq_cmd.u32All);
+
+	return 0;
+}
+
 /* Access to DQM has to be locked before calling destroy_queue_nocpsch_locked
  * to avoid asynchronized access
  */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index a7d2e3323977..05a9c17daa3e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -39,6 +39,41 @@ struct device_process_node {
 	struct list_head list;
 };
 
+union SQ_CMD_BITS {
+	struct {
+		uint32_t cmd:3;
+		uint32_t:1;
+		uint32_t mode:3;
+		uint32_t check_vmid:1;
+		uint32_t trap_id:3;
+		uint32_t:5;
+		uint32_t wave_id:4;
+		uint32_t simd_id:2;
+		uint32_t:2;
+		uint32_t queue_id:3;
+		uint32_t:1;
+		uint32_t vm_id:4;
+	} bitfields, bits;
+	uint32_t u32All;
+	signed int i32All;
+	float f32All;
+};
+
+union GRBM_GFX_INDEX_BITS {
+	struct {
+		uint32_t instance_index:8;
+		uint32_t sh_index:8;
+		uint32_t se_index:8;
+		uint32_t:5;
+		uint32_t sh_broadcast_writes:1;
+		uint32_t instance_broadcast_writes:1;
+		uint32_t se_broadcast_writes:1;
+	} bitfields, bits;
+	uint32_t u32All;
+	signed int i32All;
+	float f32All;
+};
+
 /**
  * struct device_queue_manager_ops
  *
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 66ad8d0b8f7f..fe62407dacb2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -30,7 +30,6 @@
 #include <linux/pci.h>
 #include <linux/amd-iommu.h>
 #include "kfd_priv.h"
-#include "kfd_dbgmgr.h"
 #include "kfd_topology.h"
 #include "kfd_iommu.h"
 
@@ -163,17 +162,6 @@ static void iommu_pasid_shutdown_callback(struct pci_dev *pdev, u32 pasid)
 
 	pr_debug("Unbinding process 0x%x from IOMMU\n", pasid);
 
-	mutex_lock(kfd_get_dbgmgr_mutex());
-
-	if (dev->dbgmgr && dev->dbgmgr->pasid == p->pasid) {
-		if (!kfd_dbgmgr_unregister(dev->dbgmgr, p)) {
-			kfd_dbgmgr_destroy(dev->dbgmgr);
-			dev->dbgmgr = NULL;
-		}
-	}
-
-	mutex_unlock(kfd_get_dbgmgr_mutex());
-
 	mutex_lock(&p->mutex);
 
 	pdd = kfd_get_process_device_data(dev, p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 74ff4132a163..465aae8e5697 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -300,9 +300,6 @@ struct kfd_dev {
 	 */
 	bool interrupts_active;
 
-	/* Debug manager */
-	struct kfd_dbgmgr *dbgmgr;
-
 	/* Firmware versions */
 	uint16_t mec_fw_version;
 	uint16_t mec2_fw_version;
@@ -1331,8 +1328,6 @@ void kfd_signal_poison_consumed_event(struct kfd_dev *dev, u32 pasid);
 
 void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type);
 
-int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p);
-
 bool kfd_is_locked(void);
 
 /* Compute profile */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 8e2780d2f735..8c6a48add76e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -40,7 +40,6 @@ struct mm_struct;
 
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
-#include "kfd_dbgmgr.h"
 #include "kfd_iommu.h"
 #include "kfd_svm.h"
 
@@ -1158,7 +1157,6 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 					struct mm_struct *mm)
 {
 	struct kfd_process *p;
-	int i;
 
 	/*
 	 * The kfd_process structure can not be free because the
@@ -1178,23 +1176,6 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 	mutex_lock(&p->mutex);
 
-	/* Iterate over all process device data structures and if the
-	 * pdd is in debug mode, we should first force unregistration,
-	 * then we will be able to destroy the queues
-	 */
-	for (i = 0; i < p->n_pdds; i++) {
-		struct kfd_dev *dev = p->pdds[i]->dev;
-
-		mutex_lock(kfd_get_dbgmgr_mutex());
-		if (dev && dev->dbgmgr && dev->dbgmgr->pasid == p->pasid) {
-			if (!kfd_dbgmgr_unregister(dev->dbgmgr, p)) {
-				kfd_dbgmgr_destroy(dev->dbgmgr);
-				dev->dbgmgr = NULL;
-			}
-		}
-		mutex_unlock(kfd_get_dbgmgr_mutex());
-	}
-
 	kfd_process_dequeue_from_all_devices(p);
 	pqm_uninit(&p->pqm);
 
diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index ac941f62cbed..2f60cf35a444 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -269,18 +269,9 @@ struct kfd2kgd_calls {
 	int (*hqd_sdma_destroy)(struct amdgpu_device *adev, void *mqd,
 				unsigned int timeout);
 
-	int (*address_watch_disable)(struct amdgpu_device *adev);
-	int (*address_watch_execute)(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					uint32_t cntl_val,
-					uint32_t addr_hi,
-					uint32_t addr_lo);
 	int (*wave_control_execute)(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd);
-	uint32_t (*address_watch_get_offset)(struct amdgpu_device *adev,
-					unsigned int watch_point_id,
-					unsigned int reg_offset);
 	bool (*get_atc_vmid_pasid_mapping_info)(struct amdgpu_device *adev,
 					uint8_t vmid,
 					uint16_t *p_pasid);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index e6a56c146920..6e4268f5e482 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -756,16 +756,16 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_WAIT_EVENTS			\
 		AMDKFD_IOWR(0x0C, struct kfd_ioctl_wait_events_args)
 
-#define AMDKFD_IOC_DBG_REGISTER			\
+#define AMDKFD_IOC_DBG_REGISTER_DEPRECATED	\
 		AMDKFD_IOW(0x0D, struct kfd_ioctl_dbg_register_args)
 
-#define AMDKFD_IOC_DBG_UNREGISTER		\
+#define AMDKFD_IOC_DBG_UNREGISTER_DEPRECATED	\
 		AMDKFD_IOW(0x0E, struct kfd_ioctl_dbg_unregister_args)
 
-#define AMDKFD_IOC_DBG_ADDRESS_WATCH		\
+#define AMDKFD_IOC_DBG_ADDRESS_WATCH_DEPRECATED	\
 		AMDKFD_IOW(0x0F, struct kfd_ioctl_dbg_address_watch_args)
 
-#define AMDKFD_IOC_DBG_WAVE_CONTROL		\
+#define AMDKFD_IOC_DBG_WAVE_CONTROL_DEPRECATED	\
 		AMDKFD_IOW(0x10, struct kfd_ioctl_dbg_wave_control_args)
 
 #define AMDKFD_IOC_SET_SCRATCH_BACKING_VA	\
-- 
2.33.1

