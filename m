Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E4123D05
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Dec 2019 03:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C46E21E;
	Wed, 18 Dec 2019 02:21:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8086E21E
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Dec 2019 02:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK2zZg6qUqjk4kEz+qHNm8W9yGAnl+/wlW/envLREQn+UhsL1CkuL+r1bb/9YSgvLHMgiCMY8bnZABqnMNf38S3QolOdji/VF/+fbXuZ1y2TUAxZr2BfijPLTK9DhevuSTy8PolxPVv5PsY5i3WjtxZH7Z4mpkiAf14F4gneLDft1aq0Ppqn2P134J+a7nPsCmBsX8j+jBkJkTeFUY/jiQfwzueNEk2CHH3Z4ou25GvZfrbzwg6OJUWQdq17iC1RFQHubShRxVj8lbr4Xfp26+M9Gk3wyjFaFQexvxCb4u7lUMasfh/ZCZzOhVNSQXdMiR0WiDcGjOP5mo7CHMWdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3philQrJotYJgWGbaiFjtgDjuWXR4G/G28VxY9PxRw=;
 b=SWOXgy8bOwGhTDdso3e1h8RsTU47ZMgW37vbdaYeab6LUf8qwi85V1Hkr9yeY175HogJdtbo2j3h8bZMf3/NWyhrLZEakDZl1t8V/36xc3LMNReqPtoABGZwd158lOvEd7i1MLFYQMOpUVUt8RnW2LLjoBWi1Q5atxFPm//4Ko2UA27vMXiF3RJNYlptofqbg4bIrEumdsJkYCDx1XRKBE/PQi48wCyxzICQi1FVyV0BzDXFjJsLC/FAkA3x9pWs6pNyMwZ6DPslU3L2JqBJk77Y5Nf705Hu7J4tqbjaQsR5/XRyMuqi/bH51cqnV/VF1S5foEWnhEWRp2a2MB3NWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3philQrJotYJgWGbaiFjtgDjuWXR4G/G28VxY9PxRw=;
 b=w9qugydij7MD1kGq9epRykEPqXgX3eswb/rLEjWL0HTLoe6XBh15SoHUvX7vY0yMnu9exPkcQ3vmsfz3l72+O+qPHD3ESbMwZ4YzUkAiwPZOVLJ5Q8Ng47TsxiJO62rPc7Qq/KdBpNMMBXp3X4t64eI8oITTMF/K5Vvj/7VxKy8=
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 BN8PR12MB2979.namprd12.prod.outlook.com (2603:10b6:408:66::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 18 Dec 2019 02:21:34 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Wed, 18 Dec 2019 02:21:34 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 18 Dec 2019 02:21:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 17 Dec
 2019 20:21:34 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 17 Dec
 2019 20:21:33 -0600
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 17 Dec 2019 20:21:28 -0600
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: update the method to get fb_loc of memory
 training
Date: Wed, 18 Dec 2019 10:21:25 +0800
Message-ID: <20191218022126.25205-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(428003)(189003)(199004)(186003)(26005)(498600001)(81156014)(1076003)(2616005)(426003)(6666004)(7696005)(54906003)(356004)(36756003)(86362001)(4326008)(5660300002)(70206006)(2906002)(8676002)(6916009)(336012)(8936002)(81166006)(44832011)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2979; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33b9bafb-ed5d-47cc-a020-08d7836100e7
X-MS-TrafficTypeDiagnostic: BN8PR12MB2979:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2979A2BEFA224B0C1349416995530@BN8PR12MB2979.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0255DF69B9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVr72dIs0UMMEwVPU7FbS/LpM6zGl87WjxlX4XnwtF/JItUIbmMjB0W+MB185K2LHWicDDKrzwzgTAPqOe+eUwebQJyINHYoi/tpRClvkDLz3vfZJ2LxWxV4mUWom8foLy12CsmbGWh9xi2hlruCOc6Km53tiUZe96klLsQxhF0atiS2KaEWffdRcUlmxl7RfvN68tASMrXDYr9qOBb89eFAV4Zl6wxhHHnbuwuU2mYi2vA9Kr9jb7S+lTnXWDrDUE1DadsZkp/1E/F0FwayFpvxiVXqMMnmO1tHldfDqzmhwsZ0705IDXiN7L4je3SJi5Wxkiy5M35Nf8fPixcf9lyIE8smylGU+dxwIOc+eM1M7VCZk6gGHi203yEz+r7L6Avq87HIbBvo4DcDriEZhQKdtuFKPN7yVIMs0UooAJ2YH+Ow4RUHPE6Zq5iRTDzI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 02:21:34.6030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b9bafb-ed5d-47cc-a020-08d7836100e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2979
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
Cc: Long Gang <Gang.Long@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 Deucher Alexander <Alexander.Deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Tianci.Yin" <tianci.yin@amd.com>

The method of getting fb_loc changed from parsing VBIOS to
taking certain offset from top of VRAM

Change-Id: I053b42fdb1d822722fa7980b2cd9f86b3fdce539
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  | 36 ++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  7 ++++
 drivers/gpu/drm/amd/include/atomfirmware.h    | 14 --------
 5 files changed, 16 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a78a363b1d71..fa2cf8e7bc07 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -642,9 +642,8 @@ struct amdgpu_fw_vram_usage {
 	struct amdgpu_bo *reserved_bo;
 	void *va;
 
-	/* Offset on the top of VRAM, used as c2p write buffer.
+	/* GDDR6 training support flag.
 	*/
-	u64 mem_train_fb_loc;
 	bool mem_train_support;
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index ff4eb96bdfb5..009cb0b03d13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -528,13 +528,9 @@ static int gddr6_mem_train_support(struct amdgpu_device *adev)
 int amdgpu_atomfirmware_get_mem_train_fb_loc(struct amdgpu_device *adev)
 {
 	struct atom_context *ctx = adev->mode_info.atom_context;
-	unsigned char *bios = ctx->bios;
-	struct vram_reserve_block *reserved_block;
-	int index, block_number;
+	int index;
 	uint8_t frev, crev;
 	uint16_t data_offset, size;
-	uint32_t start_address_in_kb;
-	uint64_t offset;
 	int ret;
 
 	adev->fw_vram_usage.mem_train_support = false;
@@ -569,32 +565,6 @@ int amdgpu_atomfirmware_get_mem_train_fb_loc(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	reserved_block = (struct vram_reserve_block *)
-		(bios + data_offset + sizeof(struct atom_common_table_header));
-	block_number = ((unsigned int)size - sizeof(struct atom_common_table_header))
-		/ sizeof(struct vram_reserve_block);
-	reserved_block += (block_number > 0) ? block_number-1 : 0;
-	DRM_DEBUG("block_number:0x%04x, last block: 0x%08xkb sz, %dkb fw, %dkb drv.\n",
-		  block_number,
-		  le32_to_cpu(reserved_block->start_address_in_kb),
-		  le16_to_cpu(reserved_block->used_by_firmware_in_kb),
-		  le16_to_cpu(reserved_block->used_by_driver_in_kb));
-	if (reserved_block->used_by_firmware_in_kb > 0) {
-		start_address_in_kb = le32_to_cpu(reserved_block->start_address_in_kb);
-		offset = (uint64_t)start_address_in_kb * ONE_KiB;
-		if ((offset & (ONE_MiB - 1)) < (4 * ONE_KiB + 1) ) {
-			offset -= ONE_MiB;
-		}
-
-		offset &= ~(ONE_MiB - 1);
-		adev->fw_vram_usage.mem_train_fb_loc = offset;
-		adev->fw_vram_usage.mem_train_support = true;
-		DRM_DEBUG("mem_train_fb_loc:0x%09llx.\n", offset);
-		ret = 0;
-	} else {
-		DRM_ERROR("used_by_firmware_in_kb is 0!\n");
-		ret = -EINVAL;
-	}
-
-	return ret;
+	adev->fw_vram_usage.mem_train_support = true;
+	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2ff63d0414c9..ce5cb854bdb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1705,7 +1705,11 @@ static int amdgpu_ttm_training_reserve_vram_init(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	ctx->c2p_train_data_offset = adev->fw_vram_usage.mem_train_fb_loc;
+	ctx->c2p_train_data_offset = adev->gmc.mc_vram_size;
+	if ((ctx->c2p_train_data_offset & (ONE_MiB - 1)) < (4 * ONE_KiB + 1) ) {
+		ctx->c2p_train_data_offset -= ONE_MiB;
+	}
+	ctx->c2p_train_data_offset &= ~(ONE_MiB - 1);
 	ctx->p2c_train_data_offset = (adev->gmc.mc_vram_size - GDDR6_MEM_TRAINING_OFFSET);
 	ctx->train_data_size = GDDR6_MEM_TRAINING_DATA_SIZE_IN_BYTES;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f1ebd424510c..19eb3e8456c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -66,6 +66,13 @@ struct amdgpu_copy_mem {
 	unsigned long			offset;
 };
 
+/* Definitions for constance */
+enum amdgpu_internal_constants
+{
+	ONE_KiB	= 0x400,
+	ONE_MiB	= 0x100000,
+};
+
 extern const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
 extern const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
 
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index dd7cbc00a0aa..70146518174c 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -672,20 +672,6 @@ struct vram_usagebyfirmware_v2_1
   uint16_t  used_by_driver_in_kb; 
 };
 
-/* This is part of vram_usagebyfirmware_v2_1 */
-struct vram_reserve_block
-{
-	uint32_t start_address_in_kb;
-	uint16_t used_by_firmware_in_kb;
-	uint16_t used_by_driver_in_kb;
-};
-
-/* Definitions for constance */
-enum atomfirmware_internal_constants
-{
-	ONE_KiB	= 0x400,
-	ONE_MiB	= 0x100000,
-};
 
 /* 
   ***************************************************************************
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
