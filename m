Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545812F640
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Jan 2020 10:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49BB6E1B2;
	Fri,  3 Jan 2020 09:48:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96346E1B4
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Jan 2020 09:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrwmDJ9Uh7a5u+0GEMjRWXmfDOP6D4oY55G+a+uhFVhmKPRBCObnVMlRVIdJkc3M2m8hCoABGw2zJ+nQbskck+WuXxfMKHmBVsDWwAJtIlIJw/7QVQhqApa9OjlTs13BWznTEGfJLE6AqGTbEKJJfbT3RToWGg/LcYTBFm4HgBCwxJtVfVFpESxqN+q1jkNJ8zdaz1b1UEUJl6u7y+vLnO9bNPIKPCDYOgZ9UF4Wv/3sp1LGfPszYU+Ff4xhGPhZjnHJt0KLApiCQDyWEhkxxsP+rVvac7FYaN4+B6I+3ikYoHbzLKJdgykRIe9J9ZMrAH4tm+OPvlwA+2dWrrmz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ZX5rOUOTUI3DPO2StakEHXHmAABYnC/EGdWevEnUM=;
 b=BLiB3OoQPgGdaBNz8r2qw0KA9J6TaHsY1MzbZZee8rj5z1R+qK1UCv9JUxTfrFe1xmQB9aM2yeRf5TM16e8Vvg4BdSNLkuXmrLoJACC/CyUuzPBEywS+NjGjqhMoJRY3ZJPWh3jIsKY5gdKZIp2gDyxH/czt4xbccOJW0Lr3uiMFErooJ1fBUWO2dtcprQ1AkxCxuAtEhvGbXx4H9HeM3JBKBcvdoUBM7ryKrd9hK8zyqrIoBuoVElKYRmTQHgWH2v7IfuQ5p7K1LV/44cEGWlBM2lJS1eWsQ+Frre7Vndx7C17jx8k3V1YdYNeUQ3gEZR19HPXUfwt5NCbmtm6kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ZX5rOUOTUI3DPO2StakEHXHmAABYnC/EGdWevEnUM=;
 b=biX4my2IEov7DJPFqO+lY86O7ytmS3gnBRkJLefsC778ovceyEmZCWPpbWwooQfIZsQMwLZMSiC5ZUHT5Z2lqN3GTWf5EcuvuQ6YrholDg+rhyXfKCcFk/6lN7g9z3c1Sjw1G1qvezbBxgo574LLl1BAdup5OrceRsWdlGNWqtE=
Received: from BN8PR12CA0027.namprd12.prod.outlook.com (2603:10b6:408:60::40)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Fri, 3 Jan
 2020 09:48:10 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by BN8PR12CA0027.outlook.office365.com
 (2603:10b6:408:60::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Fri, 3 Jan 2020 09:48:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2602.11 via Frontend Transport; Fri, 3 Jan 2020 09:48:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 Jan 2020
 03:48:09 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 Jan 2020
 03:48:09 -0600
Received: from guest.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 03:48:02 -0600
From: Jane Jian <Jane.Jian@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Emily.Deng@amd.com>, <Leo.Liu@amd.com>, 
 <Frank.Min@amd.com>
Subject: [PATCH 2/5] drm/amd/amdgpu: L1 Policy(2/5) - removed GC GRBM
 violations from gfxhub
Date: Fri, 3 Jan 2020 17:47:41 +0800
Message-ID: <20200103094744.2127-2-Jane.Jian@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103094744.2127-1-Jane.Jian@amd.com>
References: <20200103094744.2127-1-Jane.Jian@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(428003)(189003)(199004)(4326008)(26005)(186003)(426003)(86362001)(1076003)(6636002)(2616005)(478600001)(2906002)(336012)(7696005)(356004)(5660300002)(70206006)(70586007)(6666004)(81166006)(54906003)(110136005)(8676002)(8936002)(81156014)(36756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4165; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47ea905e-5489-4e42-a134-08d790320acb
X-MS-TrafficTypeDiagnostic: CH2PR12MB4165:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4165E7A21E9B1397D3EAFA9BFF230@CH2PR12MB4165.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0271483E06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04Xqgg6IPatF4uTt3C3gxeATtFo6P6PexIvMz2LpvkJKdTiK52NG5JJb3MOvNiIQqDvGUrSv8ZRuZPJVqog5q+y1ZeZfb9/FPJ0iPgm5wJlguXct9F9+3Hx9iUP/kbeNwewhy+XpJgj+d939fhTUHzQAKd50YJO+nQoOXbCGP98kQuGvL/0ewK6sfnKi+1Ds07I1g9HnmkHlX9M5CGZT2QrXeR69vOPRX2IWvn0uZ8/edP009GqpqxJF+fpL6kI4XXVc6EB/jZGPJG0hGjDKnPFNb5NDShqpUIue1TdlRpc8AsnM4m7lRwY97C1XgX3TWydLMxtv6NSr8m4Z50vnsMIwK0ZTbjac5H+qK7+PTLydR42XYy3V4qE3It+8rIYbfzR+TDmDVHhovAdgKrbcOx7OhxIqUv+kkcWpgxb0aaihM4F22G8rHvZvEi1MH1//
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2020 09:48:09.9666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ea905e-5489-4e42-a134-08d790320acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
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
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c | 79 +++++++++++++-----------
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c    |  2 +-
 2 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
index e9a9d24c2b7f..1a2f18b908fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -75,40 +75,45 @@ static void gfxhub_v1_0_init_system_aperture_regs(struct amdgpu_device *adev)
 	WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
 	WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
-	/* Program the system aperture low logical page number. */
-	WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-		     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
-
-	if (adev->asic_type == CHIP_RAVEN && adev->rev_id >= 0x8)
-		/*
-		 * Raven2 has a HW issue that it is unable to use the vram which
-		 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
-		 * workaround that increase system aperture high address (add 1)
-		 * to get rid of the VM fault and hardware hang.
-		 */
-		WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-			     max((adev->gmc.fb_end >> 18) + 0x1,
-				 adev->gmc.agp_end >> 18));
-	else
-		WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-			     max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
-
-	/* Set default page address. */
-	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start
-		+ adev->vm_manager.vram_base_offset;
-	WREG32_SOC15(GC, 0, mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB,
-		     (u32)(value >> 12));
-	WREG32_SOC15(GC, 0, mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
-		     (u32)(value >> 44));
-
-	/* Program "protection fault". */
-	WREG32_SOC15(GC, 0, mmVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
-		     (u32)(adev->dummy_page_addr >> 12));
-	WREG32_SOC15(GC, 0, mmVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
-		     (u32)((u64)adev->dummy_page_addr >> 44));
-
-	WREG32_FIELD15(GC, 0, VM_L2_PROTECTION_FAULT_CNTL2,
-		       ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
+	if (!amdgpu_sriov_vf(adev) || adev->asic_type <= CHIP_VEGA10) {
+		/* Program the system aperture low logical page number. */
+		WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_LOW_ADDR,
+			min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
+
+		if (adev->asic_type == CHIP_RAVEN && adev->rev_id >= 0x8)
+			/*
+			* Raven2 has a HW issue that it is unable to use the
+			* vram which is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR.
+			* So here is the workaround that increase system
+			* aperture high address (add 1) to get rid of the VM
+			* fault and hardware hang.
+			*/
+			WREG32_SOC15_RLC(GC, 0,
+					 mmMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
+					 max((adev->gmc.fb_end >> 18) + 0x1,
+					     adev->gmc.agp_end >> 18));
+		else
+			WREG32_SOC15_RLC(
+				GC, 0, mmMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
+				max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
+
+		/* Set default page address. */
+		value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start +
+			adev->vm_manager.vram_base_offset;
+		WREG32_SOC15(GC, 0, mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB,
+			     (u32)(value >> 12));
+		WREG32_SOC15(GC, 0, mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
+			     (u32)(value >> 44));
+
+		/* Program "protection fault". */
+		WREG32_SOC15(GC, 0, mmVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
+			     (u32)(adev->dummy_page_addr >> 12));
+		WREG32_SOC15(GC, 0, mmVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
+			     (u32)((u64)adev->dummy_page_addr >> 44));
+
+		WREG32_FIELD15(GC, 0, VM_L2_PROTECTION_FAULT_CNTL2,
+			       ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
+	}
 }
 
 static void gfxhub_v1_0_init_tlb_regs(struct amdgpu_device *adev)
@@ -280,10 +285,12 @@ int gfxhub_v1_0_gart_enable(struct amdgpu_device *adev)
 	gfxhub_v1_0_init_gart_aperture_regs(adev);
 	gfxhub_v1_0_init_system_aperture_regs(adev);
 	gfxhub_v1_0_init_tlb_regs(adev);
-	gfxhub_v1_0_init_cache_regs(adev);
+	if (!amdgpu_sriov_vf(adev))
+		gfxhub_v1_0_init_cache_regs(adev);
 
 	gfxhub_v1_0_enable_system_domain(adev);
-	gfxhub_v1_0_disable_identity_aperture(adev);
+	if (!amdgpu_sriov_vf(adev))
+		gfxhub_v1_0_disable_identity_aperture(adev);
 	gfxhub_v1_0_setup_vmid_config(adev);
 	gfxhub_v1_0_program_invalidation(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 4f72626fbce9..2f4a013b3344 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1307,8 +1307,8 @@ static int gmc_v9_0_hw_init(void *handle)
 	else
 		value = true;
 
-	gfxhub_v1_0_set_fault_enable_default(adev, value);
 	if (!amdgpu_sriov_vf(adev)) {
+		gfxhub_v1_0_set_fault_enable_default(adev, value);
 		if (adev->asic_type == CHIP_ARCTURUS)
 			mmhub_v9_4_set_fault_enable_default(adev, value);
 		else
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
