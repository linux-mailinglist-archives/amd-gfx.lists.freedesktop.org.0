Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED7712F63E
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Jan 2020 10:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C0E6E1B1;
	Fri,  3 Jan 2020 09:48:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B896E1B1
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Jan 2020 09:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee4myI5CMaHVAQQ6kurKeUgpLAkoUv0bfOjdAUk492rdDSYqIz1novM3xvpes6wEgDhXM48293UuuqgOKG1Wt5osIpuolyCb5zsbRbjNx6l+RUk97xqTB48ARvD0sVJ0bl0ZoN1zSX4mCNcwPpBZ/xo5vHu7yUrEv0UOuEyCHj84jM9o0epaiy2WYXa4jWNJHvCnNkhjYncaHK2HQFqfj8G2Po3pAxflQhyFfkzvakWTghcpdG6NvNVsc0j6/cRL7im3F2pzSFFnfpvKC8BJdOoN+6wdTWmXKTWs+XsRhUmLDIOxG4SnSGveFbtn67IrDdpdHTY503wxwXrs/k4SsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WFPT7twxufkSjKKxaqeP3p6vLytwb9utxjeFhc/GzA=;
 b=PmqiyC6APbWV35p1gJ/xMkdghkHckeLg5EHM88TzeHQr5yYIflux8q8ArKGNifwFxfOZgjiSvkQx/WjJutufOtW5AJr9iB/9a1WftEiP4uewHToIWdLjSJ0TR3Ofn8zwXEt+GuhUKT9MloUK0RcWQ5egXY/A6Oal4y80UaCsmPGG4NF2rMcQAZxT0SDQIn/SAZEXdlWUhgTkKlJ5csoKPNPyQQ+UVab/8nkpA6aHNxuWz3J78UvIYu72bLjO78rbUXr1vvqI/0wfaYtNzvrokHEGEPQXFQtvcIhYkmBjKTHgcRPYAy2VF2If8W1pJbmVsal1QteCCg9vRruqkOrudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WFPT7twxufkSjKKxaqeP3p6vLytwb9utxjeFhc/GzA=;
 b=eJicHfID/1+/MFueVgrQSPNkjozjw8svQSYWI8cMdfidP1+Yl2d5gAl+jfioTKXGP/CUczon9ci3Bk3AgFFhwI9otHi8tyCOWmtN2uEMbbDVLYbK30hxYYxJF+rFMUBfOZoulWBkOps24zK8FyHMXwhnH2lkx7TNqKp9WH/7EJk=
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by BYAPR12MB2966.namprd12.prod.outlook.com (2603:10b6:a03:df::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10; Fri, 3 Jan
 2020 09:48:00 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::200) by SN1PR12CA0046.outlook.office365.com
 (2603:10b6:802:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via Frontend
 Transport; Fri, 3 Jan 2020 09:48:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2602.11 via Frontend Transport; Fri, 3 Jan 2020 09:47:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 Jan 2020
 03:47:59 -0600
Received: from guest.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 03:47:52 -0600
From: Jane Jian <Jane.Jian@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Emily.Deng@amd.com>, <Leo.Liu@amd.com>, 
 <Frank.Min@amd.com>
Subject: [PATCH 1/5] drm/amd/amdgpu: L1 Policy(1/5) - removed VM settgings for
 mmhub and gfxhub from VF
Date: Fri, 3 Jan 2020 17:47:40 +0800
Message-ID: <20200103094744.2127-1-Jane.Jian@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(428003)(199004)(189003)(1076003)(8676002)(70586007)(4326008)(8936002)(81156014)(81166006)(70206006)(6666004)(356004)(2906002)(5660300002)(26005)(478600001)(336012)(86362001)(2616005)(186003)(36756003)(6636002)(7696005)(316002)(110136005)(426003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2966; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46eea950-af78-4e39-3457-08d7903204bf
X-MS-TrafficTypeDiagnostic: BYAPR12MB2966:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2966A99305202B781F4AE4F1FF230@BYAPR12MB2966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0271483E06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rL0pifEW6hn2/wSm1/vf2UIh2lQkbDY1UP2xgSOX9fuSlwjphTRPO2S3Vk8eIzmDnNUFEJnF40QrUytWajMxriThdFqO3sX2ZcTQTNkBsEeEUvIbLhKU66wNjnsJ6l5YNyPTqgKtL78cAZYaWYABfgI1H0ofeOIT2W88GE8GJ+BNTrG/FTpRW3HZfYAT/W54wnnaaOgK3CaZHt3FhXkKMi109aaPjpTMXj44P6TT0z47REmzW/bHzQ0ZylHqaJ/zuow4biIb+p7lx36Xt+9LbudtcRKDoCuJyTxTYTF4rc2umoLb+IccReHr7fqJUuaVbgqO40VDXPyTZGbBnf689nHV72rULK7PREcJ5PAevtkcQfVYAQaXIO3dQ6vz6c2aq/ClDN3kHFLTvT2uXo+9X0Mmfr8f3IvD0RIboW8G2wayJ9oeYXk1lGRh/gNdBCQM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2020 09:47:59.8198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46eea950-af78-4e39-3457-08d7903204bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2966
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
Cc: Zhigang Luo <zhigang.luo@amd.com>, Jane Jian <jane.jian@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Zhigang Luo <zhigang.luo@amd.com>

Signed-off-by: Zhigang Luo <zhigang.luo@amd.com>
Signed-off-by: Jane Jian <jane.jian@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 11 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 74 ++++++++++++++-----------
 2 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 68f9a1fa6dc1..4f72626fbce9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1308,11 +1308,12 @@ static int gmc_v9_0_hw_init(void *handle)
 		value = true;
 
 	gfxhub_v1_0_set_fault_enable_default(adev, value);
-	if (adev->asic_type == CHIP_ARCTURUS)
-		mmhub_v9_4_set_fault_enable_default(adev, value);
-	else
-		mmhub_v1_0_set_fault_enable_default(adev, value);
-
+	if (!amdgpu_sriov_vf(adev)) {
+		if (adev->asic_type == CHIP_ARCTURUS)
+			mmhub_v9_4_set_fault_enable_default(adev, value);
+		else
+			mmhub_v1_0_set_fault_enable_default(adev, value);
+	}
 	for (i = 0; i < adev->num_vmhubs; ++i)
 		gmc_v9_0_flush_gpu_tlb(adev, 0, i, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
index ac61206c4ce6..5c42387c9274 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -128,45 +128,53 @@ static void mmhub_v9_4_init_system_aperture_regs(struct amdgpu_device *adev,
 			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
 			    adev->gmc.agp_start >> 24);
 
-	/* Program the system aperture low logical page number. */
-	WREG32_SOC15_OFFSET(MMHUB, 0,
-			    mmVMSHAREDVC0_MC_VM_SYSTEM_APERTURE_LOW_ADDR,
-			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
-			    min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
-	WREG32_SOC15_OFFSET(MMHUB, 0,
-			    mmVMSHAREDVC0_MC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
-			    max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
+	if (!amdgpu_sriov_vf(adev)) {
+		/* Program the system aperture low logical page number. */
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0, mmVMSHAREDVC0_MC_VM_SYSTEM_APERTURE_LOW_ADDR,
+			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
+			min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0, mmVMSHAREDVC0_MC_VM_SYSTEM_APERTURE_HIGH_ADDR,
+			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
+			max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
 
-	/* Set default page address. */
-	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start +
-		adev->vm_manager.vram_base_offset;
-	WREG32_SOC15_OFFSET(MMHUB, 0,
+		/* Set default page address. */
+		value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start +
+			adev->vm_manager.vram_base_offset;
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0,
 			mmVMSHAREDPF0_MC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB,
 			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
 			(u32)(value >> 12));
-	WREG32_SOC15_OFFSET(MMHUB, 0,
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0,
 			mmVMSHAREDPF0_MC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
 			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
 			(u32)(value >> 44));
 
-	/* Program "protection fault". */
-	WREG32_SOC15_OFFSET(MMHUB, 0,
-			    mmVML2PF0_VM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
-			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
-			    (u32)(adev->dummy_page_addr >> 12));
-	WREG32_SOC15_OFFSET(MMHUB, 0,
-			    mmVML2PF0_VM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
-			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
-			    (u32)((u64)adev->dummy_page_addr >> 44));
+		/* Program "protection fault". */
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0,
+			mmVML2PF0_VM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
+			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
+			(u32)(adev->dummy_page_addr >> 12));
+		WREG32_SOC15_OFFSET(
+			MMHUB, 0,
+			mmVML2PF0_VM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
+			hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
+			(u32)((u64)adev->dummy_page_addr >> 44));
 
-	tmp = RREG32_SOC15_OFFSET(MMHUB, 0,
-				  mmVML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
-				  hubid * MMHUB_INSTANCE_REGISTER_OFFSET);
-	tmp = REG_SET_FIELD(tmp, VML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
-			    ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
-	WREG32_SOC15_OFFSET(MMHUB, 0, mmVML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
-			    hubid * MMHUB_INSTANCE_REGISTER_OFFSET, tmp);
+		tmp = RREG32_SOC15_OFFSET(
+			MMHUB, 0, mmVML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
+			hubid * MMHUB_INSTANCE_REGISTER_OFFSET);
+		tmp = REG_SET_FIELD(tmp, VML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
+				    ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
+		WREG32_SOC15_OFFSET(MMHUB, 0,
+				    mmVML2PF0_VM_L2_PROTECTION_FAULT_CNTL2,
+				    hubid * MMHUB_INSTANCE_REGISTER_OFFSET,
+				    tmp);
+	}
 }
 
 static void mmhub_v9_4_init_tlb_regs(struct amdgpu_device *adev, int hubid)
@@ -372,10 +380,12 @@ int mmhub_v9_4_gart_enable(struct amdgpu_device *adev)
 		mmhub_v9_4_init_gart_aperture_regs(adev, i);
 		mmhub_v9_4_init_system_aperture_regs(adev, i);
 		mmhub_v9_4_init_tlb_regs(adev, i);
-		mmhub_v9_4_init_cache_regs(adev, i);
+		if (!amdgpu_sriov_vf(adev))
+			mmhub_v9_4_init_cache_regs(adev, i);
 
 		mmhub_v9_4_enable_system_domain(adev, i);
-		mmhub_v9_4_disable_identity_aperture(adev, i);
+		if (!amdgpu_sriov_vf(adev))
+			mmhub_v9_4_disable_identity_aperture(adev, i);
 		mmhub_v9_4_setup_vmid_config(adev, i);
 		mmhub_v9_4_program_invalidation(adev, i);
 	}
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
