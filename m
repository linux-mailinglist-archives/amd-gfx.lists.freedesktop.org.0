Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE2434052
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Oct 2021 23:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4736EB78;
	Tue, 19 Oct 2021 21:15:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDE6EA9C
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Oct 2021 21:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMRjKrYoK0Orn4Srx5QbJrvv1Z8W+bnZcTyr9q+ZejvAyutjUNCUnZmZbkDQMxsWYa1+iJ/UW9CrL4F+oyfTdoIRiujV/6ndFyBe8DCKfv7XXaATW7dJ118tUm8zftLEMWmo4l0OUHK6Is3K4DffW1aUGlvm1vG/nteJHSejN3kL4GfC8JxDeSzLNF3TUebpL5qxYGAtFuzx7w5UIFFtKENltDznDP8tV0n5IG44sKsk4LNQf1sZjoG3gvyAo15EJecNuQC7S48So1ZMVwsL6YBkAk+uBQBCl9EUBOzRVK16Tv1cE389UCpYje8bKH2T/CuMc1cjcgnY8OAUcQPDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLIhn0R2dsomLUG55PQoTKvyMp0z5QZzaGxIzke3EY8=;
 b=ndQxSW03W3fTTSH3lNhcbXA0vC455aI9rI2wr3Ge2JCUpmgJGkE9+B6yJqLuLDR4lI1NUiM14m6LrC2URHn4wh2noc3Cowr1A8yE8FoywckTbKnA8fFw/dDu02cwOXzp9ns2vM6GvaWUpG3N9h9+WhlXVCpfDESs+FAgW5kDvM490Bf2OFu+Z24Dy84DDj66Dl12e8ujSgFlkiKPbuqgAwWfuj/MxSBtMnco0XdvsNwDf4IRIj2gDM87MqyLwTiu4m3z9vgu3KrzYmsiax6UB4Gfhnj9a/SloFHBpa+UYD8Itql30jelTwbaZu21J9CqmJyXN+j4lRfJqwk8hPlZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLIhn0R2dsomLUG55PQoTKvyMp0z5QZzaGxIzke3EY8=;
 b=H8lLI6P9IrV4qYo1X59oJfxDhVsTPLnimgTqD2q+AxTl2+B12PjH3SFxwtt9v0089ZuXFwnwIuUvYatnHgBRTseiHBZ3jK5HOVVbelYHM9Z9QT31Ci97DS3NSvMb+nGyqHBnHAC/eLEAugoir0AyFn6Pa2WPlgXdgdfBqDx13/s=
Received: from BN9PR03CA0326.namprd03.prod.outlook.com (2603:10b6:408:112::31)
 by MWHPR1201MB0271.namprd12.prod.outlook.com (2603:10b6:301:57::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 21:15:00 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::a6) by BN9PR03CA0326.outlook.office365.com
 (2603:10b6:408:112::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 21:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 21:14:59 +0000
Received: from mkgs-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 16:14:57 -0500
From: Graham Sider <Graham.Sider@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <mukul.joshi@amd.com>, Graham Sider
 <Graham.Sider@amd.com>
Subject: [PATCH 08/13] drm/amdkfd: replace kgd_dev in various kfd2kgd funcs
Date: Tue, 19 Oct 2021 17:13:29 -0400
Message-ID: <20211019211334.1552825-8-Graham.Sider@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019211334.1552825-1-Graham.Sider@amd.com>
References: <20211019211334.1552825-1-Graham.Sider@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6f55158-d107-4ce8-1191-08d993458252
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0271:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB027182CC58B0B62E49085EB98ABD9@MWHPR1201MB0271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/2ouZv4zYKSchiIQJcJWHfuecd75c7fvW0qsdixsDCSXHXdCKzRUXqwqMp2Cr6Go6WOU6m+ZDc67hx8bGkGtImbcjps1DR+0THcoyZb+qTjNvfpiglG6YFlMkXogVl8aiiPrbVugSsTtLwxrbMmTXpaLKql6dZ5Zlnd5JthB404akJIP/5EVPg49i55f0mb6MXACy3dD3qwjtEEIR16wC5V6D9GTyR2fSTb3rsTh082xz/SNlT79SniHTkGxBrzA9qpevV7JjXmWaWPsRSqo3l/Mm9rDK7FvsQSiXSssMZGy60QBy0oZ72/oZKy+DkZiM4a0Nu5Y2vBfTy2lZtPlvAjH720DW0qfxcICwSn8mKtVQsSyclnMW6Huhp6ieNR59xOr4H6KTYnXcP+YUsG6BIrsLcApk7Yq6Qxrt3mcZJIrP01FyuG9smOME8fdLJRXqQpjSQwMkCInX3r8aSRKsFimoSQamSeWgpSMr94vx0mTPXZ2nJ/2s5aWMEI1KXI70D/R2HHBPQstV4oVR9VTL9FfYRKxK9kS+kaH2o4tSQ0l+84qDxalKcq9W+z3DXev1UhbR7lcBy4qxPdsQREYR5n5tDiuw+BhvVs2X8//+omXRptj67varacPyUhVIlPZc3QfXx3+KV3dMICh3yj9PtTM70CKpl7HsBE46YlkNs/4ShdEq+9cGlXBiITAhBaX5jzR0PsIjOAA/a4t8in3gRaNkLtI4L4Rt0K9LH2UVA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(47076005)(8676002)(2906002)(36860700001)(6666004)(426003)(7696005)(26005)(70586007)(70206006)(16526019)(356005)(186003)(81166007)(86362001)(82310400003)(2616005)(316002)(8936002)(5660300002)(508600001)(36756003)(336012)(4326008)(30864003)(6916009)(83380400001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 21:14:59.7649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f55158-d107-4ce8-1191-08d993458252
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0271
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

Modified definitions:

- program_sh_mem_settings
- set_pasid_vmid_mapping
- init_interrupts
- address_watch_disable
- address_watch_execute
- wave_control_execute
- address_watch_get_offset
- get_atc_vmid_pasid_mapping_info
- set_scratch_backing_va
- set_vm_context_page_table_base
- read_vmid_from_vmfault_reg
- get_cu_occupancy
- program_trap_handler_settings

Signed-off-by: Graham Sider <Graham.Sider@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 33 +++++--------
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  | 49 ++++++-------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c | 39 +++++----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c | 33 +++++--------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 35 +++++--------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 22 ++++-----
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       | 18 +++----
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 14 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  2 +-
 .../gpu/drm/amd/include/kgd_kfd_interface.h   | 29 ++++++-----
 12 files changed, 106 insertions(+), 174 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 5927a8fcbc23..5f274b7c4121 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -80,14 +80,12 @@ static void release_queue(struct amdgpu_device *adev)
 	unlock_srbm(adev);
 }
 
-static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
+static void kgd_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 					uint32_t sh_mem_config,
 					uint32_t sh_mem_ape1_base,
 					uint32_t sh_mem_ape1_limit,
 					uint32_t sh_mem_bases)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, sh_mem_config);
@@ -97,11 +95,9 @@ static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
 	unlock_srbm(adev);
 }
 
-static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
+static int kgd_set_pasid_vmid_mapping(struct amdgpu_device *adev, u32 pasid,
 					unsigned int vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	/*
 	 * We have to assume that there is no outstanding mapping.
 	 * The ATC_VMID_PASID_MAPPING_UPDATE_STATUS bit could be 0 because
@@ -144,9 +140,8 @@ static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
  * but still works
  */
 
-static int kgd_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id)
+static int kgd_init_interrupts(struct amdgpu_device *adev, uint32_t pipe_id)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t mec;
 	uint32_t pipe;
 
@@ -669,11 +664,10 @@ static int kgd_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
+static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid)
 {
 	uint32_t value;
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
 
 	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
 		     + vmid);
@@ -682,12 +676,12 @@ static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int kgd_address_watch_disable(struct kgd_dev *kgd)
+static int kgd_address_watch_disable(struct amdgpu_device *adev)
 {
 	return 0;
 }
 
-static int kgd_address_watch_execute(struct kgd_dev *kgd,
+static int kgd_address_watch_execute(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
@@ -696,11 +690,10 @@ static int kgd_address_watch_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static int kgd_wave_control_execute(struct kgd_dev *kgd,
+static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -721,18 +714,16 @@ static int kgd_wave_control_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct kgd_dev *kgd,
+static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset)
 {
 	return 0;
 }
 
-static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
-		uint64_t page_table_base)
+static void set_vm_context_page_table_base(struct amdgpu_device *adev,
+		uint32_t vmid, uint64_t page_table_base)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
 		pr_err("trying to set page table base for wrong VMID %u\n",
 		       vmid);
@@ -743,11 +734,9 @@ static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
 	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
-static void program_trap_handler_settings(struct kgd_dev *kgd,
+static void program_trap_handler_settings(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 2fc7dfc4fc92..980430974aca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -79,14 +79,12 @@ static void release_queue(struct amdgpu_device *adev)
 	unlock_srbm(adev);
 }
 
-static void program_sh_mem_settings_v10_3(struct kgd_dev *kgd, uint32_t vmid,
+static void program_sh_mem_settings_v10_3(struct amdgpu_device *adev, uint32_t vmid,
 					uint32_t sh_mem_config,
 					uint32_t sh_mem_ape1_base,
 					uint32_t sh_mem_ape1_limit,
 					uint32_t sh_mem_bases)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, sh_mem_config);
@@ -97,11 +95,9 @@ static void program_sh_mem_settings_v10_3(struct kgd_dev *kgd, uint32_t vmid,
 }
 
 /* ATC is defeatured on Sienna_Cichlid */
-static int set_pasid_vmid_mapping_v10_3(struct kgd_dev *kgd, unsigned int pasid,
+static int set_pasid_vmid_mapping_v10_3(struct amdgpu_device *adev, unsigned int pasid,
 					unsigned int vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	uint32_t value = pasid << IH_VMID_0_LUT__PASID__SHIFT;
 
 	/* Mapping vmid to pasid also for IH block */
@@ -112,9 +108,8 @@ static int set_pasid_vmid_mapping_v10_3(struct kgd_dev *kgd, unsigned int pasid,
 	return 0;
 }
 
-static int init_interrupts_v10_3(struct kgd_dev *kgd, uint32_t pipe_id)
+static int init_interrupts_v10_3(struct amdgpu_device *adev, uint32_t pipe_id)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t mec;
 	uint32_t pipe;
 
@@ -593,12 +588,12 @@ static int hqd_sdma_destroy_v10_3(struct amdgpu_device *adev, void *mqd,
 }
 
 
-static int address_watch_disable_v10_3(struct kgd_dev *kgd)
+static int address_watch_disable_v10_3(struct amdgpu_device *adev)
 {
 	return 0;
 }
 
-static int address_watch_execute_v10_3(struct kgd_dev *kgd,
+static int address_watch_execute_v10_3(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
@@ -607,11 +602,10 @@ static int address_watch_execute_v10_3(struct kgd_dev *kgd,
 	return 0;
 }
 
-static int wave_control_execute_v10_3(struct kgd_dev *kgd,
+static int wave_control_execute_v10_3(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -632,27 +626,23 @@ static int wave_control_execute_v10_3(struct kgd_dev *kgd,
 	return 0;
 }
 
-static uint32_t address_watch_get_offset_v10_3(struct kgd_dev *kgd,
+static uint32_t address_watch_get_offset_v10_3(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset)
 {
 	return 0;
 }
 
-static void set_vm_context_page_table_base_v10_3(struct kgd_dev *kgd, uint32_t vmid,
-		uint64_t page_table_base)
+static void set_vm_context_page_table_base_v10_3(struct amdgpu_device *adev,
+		uint32_t vmid, uint64_t page_table_base)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	/* SDMA is on gfxhub as well for Navi1* series */
 	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
-static void program_trap_handler_settings_v10_3(struct kgd_dev *kgd,
+static void program_trap_handler_settings_v10_3(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	/*
@@ -676,11 +666,10 @@ static void program_trap_handler_settings_v10_3(struct kgd_dev *kgd,
 }
 
 #if 0
-uint32_t enable_debug_trap_v10_3(struct kgd_dev *kgd,
+uint32_t enable_debug_trap_v10_3(struct amdgpu_device *adev,
 				uint32_t trap_debug_wave_launch_mode,
 				uint32_t vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 	uint32_t orig_wave_cntl_value;
 	uint32_t orig_stall_vmid;
@@ -707,10 +696,8 @@ uint32_t enable_debug_trap_v10_3(struct kgd_dev *kgd,
 	return 0;
 }
 
-uint32_t disable_debug_trap_v10_3(struct kgd_dev *kgd)
+uint32_t disable_debug_trap_v10_3(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
@@ -720,11 +707,10 @@ uint32_t disable_debug_trap_v10_3(struct kgd_dev *kgd)
 	return 0;
 }
 
-uint32_t set_wave_launch_trap_override_v10_3(struct kgd_dev *kgd,
+uint32_t set_wave_launch_trap_override_v10_3(struct amdgpu_device *adev,
 						uint32_t trap_override,
 						uint32_t trap_mask)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -749,11 +735,10 @@ uint32_t set_wave_launch_trap_override_v10_3(struct kgd_dev *kgd,
 	return 0;
 }
 
-uint32_t set_wave_launch_mode_v10_3(struct kgd_dev *kgd,
+uint32_t set_wave_launch_mode_v10_3(struct amdgpu_device *adev,
 					uint8_t wave_launch_mode,
 					uint32_t vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 	bool is_stall_mode;
 	bool is_mode_set;
@@ -792,16 +777,14 @@ uint32_t set_wave_launch_mode_v10_3(struct kgd_dev *kgd,
  *	sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
  *	deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
  */
-void get_iq_wait_times_v10_3(struct kgd_dev *kgd,
+void get_iq_wait_times_v10_3(struct amdgpu_device *adev,
 					uint32_t *wait_times)
 
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
 }
 
-void build_grace_period_packet_info_v10_3(struct kgd_dev *kgd,
+void build_grace_period_packet_info_v10_3(struct amdgpu_device *adev,
 						uint32_t wait_times,
 						uint32_t grace_period,
 						uint32_t *reg_offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index 1190f58c4a99..e31b03495db4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -116,14 +116,12 @@ static void release_queue(struct amdgpu_device *adev)
 	unlock_srbm(adev);
 }
 
-static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
+static void kgd_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 					uint32_t sh_mem_config,
 					uint32_t sh_mem_ape1_base,
 					uint32_t sh_mem_ape1_limit,
 					uint32_t sh_mem_bases)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	WREG32(mmSH_MEM_CONFIG, sh_mem_config);
@@ -134,11 +132,9 @@ static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
 	unlock_srbm(adev);
 }
 
-static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
+static int kgd_set_pasid_vmid_mapping(struct amdgpu_device *adev, u32 pasid,
 					unsigned int vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	/*
 	 * We have to assume that there is no outstanding mapping.
 	 * The ATC_VMID_PASID_MAPPING_UPDATE_STATUS bit could be 0 because
@@ -160,9 +156,8 @@ static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
 	return 0;
 }
 
-static int kgd_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id)
+static int kgd_init_interrupts(struct amdgpu_device *adev, uint32_t pipe_id)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t mec;
 	uint32_t pipe;
 
@@ -539,9 +534,8 @@ static int kgd_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-static int kgd_address_watch_disable(struct kgd_dev *kgd)
+static int kgd_address_watch_disable(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	union TCP_WATCH_CNTL_BITS cntl;
 	unsigned int i;
 
@@ -559,13 +553,12 @@ static int kgd_address_watch_disable(struct kgd_dev *kgd)
 	return 0;
 }
 
-static int kgd_address_watch_execute(struct kgd_dev *kgd,
+static int kgd_address_watch_execute(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
 					uint32_t addr_lo)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	union TCP_WATCH_CNTL_BITS cntl;
 
 	cntl.u32All = cntl_val;
@@ -590,11 +583,10 @@ static int kgd_address_watch_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static int kgd_wave_control_execute(struct kgd_dev *kgd,
+static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -615,18 +607,17 @@ static int kgd_wave_control_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct kgd_dev *kgd,
+static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset)
 {
 	return watchRegs[watch_point_id * ADDRESS_WATCH_REG_MAX + reg_offset];
 }
 
-static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
+static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid)
 {
 	uint32_t value;
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
 
 	value = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
 	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
@@ -634,21 +625,17 @@ static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static void set_scratch_backing_va(struct kgd_dev *kgd,
+static void set_scratch_backing_va(struct amdgpu_device *adev,
 					uint64_t va, uint32_t vmid)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 	WREG32(mmSH_HIDDEN_PRIVATE_BASE_VMID, va);
 	unlock_srbm(adev);
 }
 
-static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
-			uint64_t page_table_base)
+static void set_vm_context_page_table_base(struct amdgpu_device *adev,
+			uint32_t vmid, uint64_t page_table_base)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
 		pr_err("trying to set page table base for wrong VMID\n");
 		return;
@@ -664,10 +651,8 @@ static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
   * @vmid: vmid pointer
   * read vmid from register (CIK).
   */
-static uint32_t read_vmid_from_vmfault_reg(struct kgd_dev *kgd)
+static uint32_t read_vmid_from_vmfault_reg(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	uint32_t status = RREG32(mmVM_CONTEXT1_PROTECTION_FAULT_STATUS);
 
 	return REG_GET_FIELD(status, VM_CONTEXT1_PROTECTION_FAULT_STATUS, VMID);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index 5eb4e9bbe463..9a30a4f4f098 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -73,14 +73,12 @@ static void release_queue(struct amdgpu_device *adev)
 	unlock_srbm(adev);
 }
 
-static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
+static void kgd_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 					uint32_t sh_mem_config,
 					uint32_t sh_mem_ape1_base,
 					uint32_t sh_mem_ape1_limit,
 					uint32_t sh_mem_bases)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	WREG32(mmSH_MEM_CONFIG, sh_mem_config);
@@ -91,11 +89,9 @@ static void kgd_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
 	unlock_srbm(adev);
 }
 
-static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
+static int kgd_set_pasid_vmid_mapping(struct amdgpu_device *adev, u32 pasid,
 					unsigned int vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	/*
 	 * We have to assume that there is no outstanding mapping.
 	 * The ATC_VMID_PASID_MAPPING_UPDATE_STATUS bit could be 0 because
@@ -118,9 +114,8 @@ static int kgd_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
 	return 0;
 }
 
-static int kgd_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id)
+static int kgd_init_interrupts(struct amdgpu_device *adev, uint32_t pipe_id)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t mec;
 	uint32_t pipe;
 
@@ -537,11 +532,10 @@ static int kgd_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
+static bool get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid)
 {
 	uint32_t value;
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
 
 	value = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
 	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
@@ -549,12 +543,12 @@ static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int kgd_address_watch_disable(struct kgd_dev *kgd)
+static int kgd_address_watch_disable(struct amdgpu_device *adev)
 {
 	return 0;
 }
 
-static int kgd_address_watch_execute(struct kgd_dev *kgd,
+static int kgd_address_watch_execute(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
@@ -563,11 +557,10 @@ static int kgd_address_watch_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static int kgd_wave_control_execute(struct kgd_dev *kgd,
+static int kgd_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -588,28 +581,24 @@ static int kgd_wave_control_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-static uint32_t kgd_address_watch_get_offset(struct kgd_dev *kgd,
+static uint32_t kgd_address_watch_get_offset(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset)
 {
 	return 0;
 }
 
-static void set_scratch_backing_va(struct kgd_dev *kgd,
+static void set_scratch_backing_va(struct amdgpu_device *adev,
 					uint64_t va, uint32_t vmid)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 	WREG32(mmSH_HIDDEN_PRIVATE_BASE_VMID, va);
 	unlock_srbm(adev);
 }
 
-static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
-		uint64_t page_table_base)
+static void set_vm_context_page_table_base(struct amdgpu_device *adev,
+		uint32_t vmid, uint64_t page_table_base)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
 		pr_err("trying to set page table base for wrong VMID\n");
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 480014ada833..d7b31adcfd80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -87,14 +87,12 @@ static void release_queue(struct amdgpu_device *adev)
 	unlock_srbm(adev);
 }
 
-void kgd_gfx_v9_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
+void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 					uint32_t sh_mem_config,
 					uint32_t sh_mem_ape1_base,
 					uint32_t sh_mem_ape1_limit,
 					uint32_t sh_mem_bases)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, mmSH_MEM_CONFIG), sh_mem_config);
@@ -104,11 +102,9 @@ void kgd_gfx_v9_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
 	unlock_srbm(adev);
 }
 
-int kgd_gfx_v9_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
+int kgd_gfx_v9_set_pasid_vmid_mapping(struct amdgpu_device *adev, u32 pasid,
 					unsigned int vmid)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	/*
 	 * We have to assume that there is no outstanding mapping.
 	 * The ATC_VMID_PASID_MAPPING_UPDATE_STATUS bit could be 0 because
@@ -165,9 +161,8 @@ int kgd_gfx_v9_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
  * but still works
  */
 
-int kgd_gfx_v9_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id)
+int kgd_gfx_v9_init_interrupts(struct amdgpu_device *adev, uint32_t pipe_id)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t mec;
 	uint32_t pipe;
 
@@ -620,11 +615,10 @@ static int kgd_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
-bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
+bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid)
 {
 	uint32_t value;
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
 
 	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
 		     + vmid);
@@ -633,12 +627,12 @@ bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-int kgd_gfx_v9_address_watch_disable(struct kgd_dev *kgd)
+int kgd_gfx_v9_address_watch_disable(struct amdgpu_device *adev)
 {
 	return 0;
 }
 
-int kgd_gfx_v9_address_watch_execute(struct kgd_dev *kgd,
+int kgd_gfx_v9_address_watch_execute(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
@@ -647,11 +641,10 @@ int kgd_gfx_v9_address_watch_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-int kgd_gfx_v9_wave_control_execute(struct kgd_dev *kgd,
+int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	uint32_t data = 0;
 
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -672,18 +665,16 @@ int kgd_gfx_v9_wave_control_execute(struct kgd_dev *kgd,
 	return 0;
 }
 
-uint32_t kgd_gfx_v9_address_watch_get_offset(struct kgd_dev *kgd,
+uint32_t kgd_gfx_v9_address_watch_get_offset(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset)
 {
 	return 0;
 }
 
-void kgd_gfx_v9_set_vm_context_page_table_base(struct kgd_dev *kgd,
+void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
 		pr_err("trying to set page table base for wrong VMID %u\n",
 		       vmid);
@@ -790,7 +781,7 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
  *
  *  Reading registers referenced above involves programming GRBM appropriately
  */
-void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
+void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
 		int *pasid_wave_cnt, int *max_waves_per_cu)
 {
 	int qidx;
@@ -804,10 +795,8 @@ void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
 	int pasid_tmp;
 	int max_queue_cnt;
 	int vmid_wave_cnt = 0;
-	struct amdgpu_device *adev;
 	DECLARE_BITMAP(cp_queue_bitmap, KGD_MAX_QUEUES);
 
-	adev = get_amdgpu_device(kgd);
 	lock_spi_csq_mutexes(adev);
 	soc15_grbm_select(adev, 1, 0, 0, 0);
 
@@ -868,11 +857,9 @@ void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
 				adev->gfx.cu_info.max_waves_per_simd;
 }
 
-void kgd_gfx_v9_program_trap_handler_settings(struct kgd_dev *kgd,
+void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
                         uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-
 	lock_srbm(adev, 0, 0, 0, vmid);
 
 	/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 3fd99968f463..24be49df26fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -22,13 +22,13 @@
 
 
 
-void kgd_gfx_v9_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
+void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 		uint32_t sh_mem_config,
 		uint32_t sh_mem_ape1_base, uint32_t sh_mem_ape1_limit,
 		uint32_t sh_mem_bases);
-int kgd_gfx_v9_set_pasid_vmid_mapping(struct kgd_dev *kgd, u32 pasid,
+int kgd_gfx_v9_set_pasid_vmid_mapping(struct amdgpu_device *adev, u32 pasid,
 		unsigned int vmid);
-int kgd_gfx_v9_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id);
+int kgd_gfx_v9_init_interrupts(struct amdgpu_device *adev, uint32_t pipe_id);
 int kgd_gfx_v9_hqd_load(struct amdgpu_device *adev, void *mqd, uint32_t pipe_id,
 			uint32_t queue_id, uint32_t __user *wptr,
 			uint32_t wptr_shift, uint32_t wptr_mask,
@@ -46,25 +46,25 @@ int kgd_gfx_v9_hqd_destroy(struct amdgpu_device *adev, void *mqd,
 				enum kfd_preempt_type reset_type,
 				unsigned int utimeout, uint32_t pipe_id,
 				uint32_t queue_id);
-int kgd_gfx_v9_address_watch_disable(struct kgd_dev *kgd);
-int kgd_gfx_v9_address_watch_execute(struct kgd_dev *kgd,
+int kgd_gfx_v9_address_watch_disable(struct amdgpu_device *adev);
+int kgd_gfx_v9_address_watch_execute(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
 					uint32_t addr_lo);
-int kgd_gfx_v9_wave_control_execute(struct kgd_dev *kgd,
+int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd);
-uint32_t kgd_gfx_v9_address_watch_get_offset(struct kgd_dev *kgd,
+uint32_t kgd_gfx_v9_address_watch_get_offset(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset);
 
-bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
+bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid);
 
-void kgd_gfx_v9_set_vm_context_page_table_base(struct kgd_dev *kgd,
+void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base);
-void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
+void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
 		int *pasid_wave_cnt, int *max_waves_per_cu);
-void kgd_gfx_v9_program_trap_handler_settings(struct kgd_dev *kgd,
+void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
index f6233019f042..3073361bb714 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -50,8 +50,8 @@ static bool cik_event_interrupt_isr(struct kfd_dev *dev,
 		*patched_flag = true;
 		*tmp_ihre = *ihre;
 
-		vmid = f2g->read_vmid_from_vmfault_reg(dev->kgd);
-		ret = f2g->get_atc_vmid_pasid_mapping_info(dev->kgd, vmid, &pasid);
+		vmid = f2g->read_vmid_from_vmfault_reg(dev->adev);
+		ret = f2g->get_atc_vmid_pasid_mapping_info(dev->adev, vmid, &pasid);
 
 		tmp_ihre->ring_id &= 0x000000ff;
 		tmp_ihre->ring_id |= vmid << 8;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f1e7edeb4e6b..7c4f14410a74 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1130,7 +1130,7 @@ static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 	if (dev->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS &&
 	    pdd->qpd.vmid != 0 && dev->kfd2kgd->set_scratch_backing_va)
 		dev->kfd2kgd->set_scratch_backing_va(
-			dev->kgd, args->va_addr, pdd->qpd.vmid);
+			dev->adev, args->va_addr, pdd->qpd.vmid);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 159add0f5aaa..1e30717b5253 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -41,7 +41,7 @@
 
 static void dbgdev_address_watch_disable_nodiq(struct kfd_dev *dev)
 {
-	dev->kfd2kgd->address_watch_disable(dev->kgd);
+	dev->kfd2kgd->address_watch_disable(dev->adev);
 }
 
 static int dbgdev_diq_submit_ib(struct kfd_dbgdev *dbgdev,
@@ -322,7 +322,7 @@ static int dbgdev_address_watch_nodiq(struct kfd_dbgdev *dbgdev,
 		pr_debug("\t\t%30s\n", "* * * * * * * * * * * * * * * * * *");
 
 		pdd->dev->kfd2kgd->address_watch_execute(
-						dbgdev->dev->kgd,
+						dbgdev->dev->adev,
 						i,
 						cntl.u32All,
 						addrHi.u32All,
@@ -420,7 +420,7 @@ static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
 
 		aw_reg_add_dword =
 				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->kgd,
+					dbgdev->dev->adev,
 					i,
 					ADDRESS_WATCH_REG_CNTL);
 
@@ -431,7 +431,7 @@ static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
 
 		aw_reg_add_dword =
 				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->kgd,
+					dbgdev->dev->adev,
 					i,
 					ADDRESS_WATCH_REG_ADDR_HI);
 
@@ -441,7 +441,7 @@ static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
 
 		aw_reg_add_dword =
 				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->kgd,
+					dbgdev->dev->adev,
 					i,
 					ADDRESS_WATCH_REG_ADDR_LO);
 
@@ -457,7 +457,7 @@ static int dbgdev_address_watch_diq(struct kfd_dbgdev *dbgdev,
 
 		aw_reg_add_dword =
 				dbgdev->dev->kfd2kgd->address_watch_get_offset(
-					dbgdev->dev->kgd,
+					dbgdev->dev->adev,
 					i,
 					ADDRESS_WATCH_REG_CNTL);
 
@@ -752,7 +752,7 @@ static int dbgdev_wave_control_nodiq(struct kfd_dbgdev *dbgdev,
 
 	pr_debug("\t\t %30s\n", "* * * * * * * * * * * * * * * * * *");
 
-	return dbgdev->dev->kfd2kgd->wave_control_execute(dbgdev->dev->kgd,
+	return dbgdev->dev->kfd2kgd->wave_control_execute(dbgdev->dev->adev,
 							reg_gfx_index.u32All,
 							reg_sq_cmd.u32All);
 }
@@ -784,7 +784,7 @@ int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
 
 	for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
 		status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
-				(dev->kgd, vmid, &queried_pasid);
+				(dev->adev, vmid, &queried_pasid);
 
 		if (status && queried_pasid == p->pasid) {
 			pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
@@ -811,7 +811,7 @@ int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
 	/* for non DIQ we need to patch the VMID: */
 	reg_sq_cmd.bits.vm_id = vmid;
 
-	dev->kfd2kgd->wave_control_execute(dev->kgd,
+	dev->kfd2kgd->wave_control_execute(dev->adev,
 					reg_gfx_index.u32All,
 					reg_sq_cmd.u32All);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 1919efe06f30..9cdf3fb8c58e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -130,7 +130,7 @@ void program_sh_mem_settings(struct device_queue_manager *dqm,
 					struct qcm_process_device *qpd)
 {
 	return dqm->dev->kfd2kgd->program_sh_mem_settings(
-						dqm->dev->kgd, qpd->vmid,
+						dqm->dev->adev, qpd->vmid,
 						qpd->sh_mem_config,
 						qpd->sh_mem_ape1_base,
 						qpd->sh_mem_ape1_limit,
@@ -216,7 +216,7 @@ static void program_trap_handler_settings(struct device_queue_manager *dqm,
 {
 	if (dqm->dev->kfd2kgd->program_trap_handler_settings)
 		dqm->dev->kfd2kgd->program_trap_handler_settings(
-						dqm->dev->kgd, qpd->vmid,
+						dqm->dev->adev, qpd->vmid,
 						qpd->tba_addr, qpd->tma_addr);
 }
 
@@ -257,14 +257,14 @@ static int allocate_vmid(struct device_queue_manager *dqm,
 	/* qpd->page_table_base is set earlier when register_process()
 	 * is called, i.e. when the first queue is created.
 	 */
-	dqm->dev->kfd2kgd->set_vm_context_page_table_base(dqm->dev->kgd,
+	dqm->dev->kfd2kgd->set_vm_context_page_table_base(dqm->dev->adev,
 			qpd->vmid,
 			qpd->page_table_base);
 	/* invalidate the VM context after pasid and vmid mapping is set up */
 	kfd_flush_tlb(qpd_to_pdd(qpd), TLB_FLUSH_LEGACY);
 
 	if (dqm->dev->kfd2kgd->set_scratch_backing_va)
-		dqm->dev->kfd2kgd->set_scratch_backing_va(dqm->dev->kgd,
+		dqm->dev->kfd2kgd->set_scratch_backing_va(dqm->dev->adev,
 				qpd->sh_hidden_private_base, qpd->vmid);
 
 	return 0;
@@ -775,7 +775,7 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
 
 	if (!list_empty(&qpd->queues_list)) {
 		dqm->dev->kfd2kgd->set_vm_context_page_table_base(
-				dqm->dev->kgd,
+				dqm->dev->adev,
 				qpd->vmid,
 				qpd->page_table_base);
 		kfd_flush_tlb(pdd, TLB_FLUSH_LEGACY);
@@ -953,7 +953,7 @@ set_pasid_vmid_mapping(struct device_queue_manager *dqm, u32 pasid,
 			unsigned int vmid)
 {
 	return dqm->dev->kfd2kgd->set_pasid_vmid_mapping(
-						dqm->dev->kgd, pasid, vmid);
+						dqm->dev->adev, pasid, vmid);
 }
 
 static void init_interrupts(struct device_queue_manager *dqm)
@@ -962,7 +962,7 @@ static void init_interrupts(struct device_queue_manager *dqm)
 
 	for (i = 0 ; i < get_pipes_per_mec(dqm) ; i++)
 		if (is_pipe_enabled(dqm, 0, i))
-			dqm->dev->kfd2kgd->init_interrupts(dqm->dev->kgd, i);
+			dqm->dev->kfd2kgd->init_interrupts(dqm->dev->adev, i);
 }
 
 static int initialize_nocpsch(struct device_queue_manager *dqm)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 21ec8a18cad2..8b3dc6462405 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -286,7 +286,7 @@ static int kfd_get_cu_occupancy(struct attribute *attr, char *buffer)
 	/* Collect wave count from device if it supports */
 	wave_cnt = 0;
 	max_waves_per_cu = 0;
-	dev->kfd2kgd->get_cu_occupancy(dev->kgd, proc->pasid, &wave_cnt,
+	dev->kfd2kgd->get_cu_occupancy(dev->adev, proc->pasid, &wave_cnt,
 			&max_waves_per_cu);
 
 	/* Translate wave count to number of compute units */
diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index 75e40acdd699..8f4f3a1700e8 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -229,14 +229,14 @@ struct tile_config {
  */
 struct kfd2kgd_calls {
 	/* Register access functions */
-	void (*program_sh_mem_settings)(struct kgd_dev *kgd, uint32_t vmid,
+	void (*program_sh_mem_settings)(struct amdgpu_device *adev, uint32_t vmid,
 			uint32_t sh_mem_config,	uint32_t sh_mem_ape1_base,
 			uint32_t sh_mem_ape1_limit, uint32_t sh_mem_bases);
 
-	int (*set_pasid_vmid_mapping)(struct kgd_dev *kgd, u32 pasid,
+	int (*set_pasid_vmid_mapping)(struct amdgpu_device *adev, u32 pasid,
 					unsigned int vmid);
 
-	int (*init_interrupts)(struct kgd_dev *kgd, uint32_t pipe_id);
+	int (*init_interrupts)(struct amdgpu_device *adev, uint32_t pipe_id);
 
 	int (*hqd_load)(struct amdgpu_device *adev, void *mqd, uint32_t pipe_id,
 			uint32_t queue_id, uint32_t __user *wptr,
@@ -271,20 +271,19 @@ struct kfd2kgd_calls {
 	int (*hqd_sdma_destroy)(struct amdgpu_device *adev, void *mqd,
 				unsigned int timeout);
 
-	int (*address_watch_disable)(struct kgd_dev *kgd);
-	int (*address_watch_execute)(struct kgd_dev *kgd,
+	int (*address_watch_disable)(struct amdgpu_device *adev);
+	int (*address_watch_execute)(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					uint32_t cntl_val,
 					uint32_t addr_hi,
 					uint32_t addr_lo);
-	int (*wave_control_execute)(struct kgd_dev *kgd,
+	int (*wave_control_execute)(struct amdgpu_device *adev,
 					uint32_t gfx_index_val,
 					uint32_t sq_cmd);
-	uint32_t (*address_watch_get_offset)(struct kgd_dev *kgd,
+	uint32_t (*address_watch_get_offset)(struct amdgpu_device *adev,
 					unsigned int watch_point_id,
 					unsigned int reg_offset);
-	bool (*get_atc_vmid_pasid_mapping_info)(
-					struct kgd_dev *kgd,
+	bool (*get_atc_vmid_pasid_mapping_info)(struct amdgpu_device *adev,
 					uint8_t vmid,
 					uint16_t *p_pasid);
 
@@ -292,16 +291,16 @@ struct kfd2kgd_calls {
 	 * passed to the shader by the CP. It's the user mode driver's
 	 * responsibility.
 	 */
-	void (*set_scratch_backing_va)(struct kgd_dev *kgd,
+	void (*set_scratch_backing_va)(struct amdgpu_device *adev,
 				uint64_t va, uint32_t vmid);
 
-	void (*set_vm_context_page_table_base)(struct kgd_dev *kgd,
+	void (*set_vm_context_page_table_base)(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base);
-	uint32_t (*read_vmid_from_vmfault_reg)(struct kgd_dev *kgd);
+	uint32_t (*read_vmid_from_vmfault_reg)(struct amdgpu_device *adev);
 
-	void (*get_cu_occupancy)(struct kgd_dev *kgd, int pasid, int *wave_cnt,
-			int *max_waves_per_cu);
-	void (*program_trap_handler_settings)(struct kgd_dev *kgd,
+	void (*get_cu_occupancy)(struct amdgpu_device *adev, int pasid,
+			int *wave_cnt, int *max_waves_per_cu);
+	void (*program_trap_handler_settings)(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr);
 };
 
-- 
2.25.1

