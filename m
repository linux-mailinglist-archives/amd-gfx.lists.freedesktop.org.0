Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E76FD24A
	for <lists+amd-gfx@lfdr.de>; Wed, 10 May 2023 00:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A80410E40D;
	Tue,  9 May 2023 22:11:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D83010E417
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 May 2023 22:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPOOyZfJ0oxrVsCL2tRiM6XhjFVglFyg5t257kFfqc1JFNXtdvCOIGKFaZ8IYHAxLVbXB8uGZsJ+pGY79VB70KJMOOoVnv3LsF8cxc5fQDKaaO/KJ2ZWN4OjKBoZXl3N0mR4Zkhk1xuUH3T5IpGAh26VO3slLUSv+KvbdpIgKTTXAhnXDODwVOlRaRBNLq7YGkrzUC0CxnRNXDZAKumMA1wbqAUvgY+Zexr++6AKx/+sX5ZDaQM4L5R5QI3pLRtcDukhAP+wc2PS9pppW0qsC76nS0Tgg7I29+BKatxsQJMzK0JsVLT8tVEqSUbxoBbon7DJ2XU3x0H0QfxHxOQW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DraQ+zI+kkuU/phisDIgsokQct5Rhgvpy//KGessNP0=;
 b=HFoqIuQmtLAkAQ3mvO3VVWGQICRC0eIWFPTffeJkqNUIh7sbBW0YxEyIzCDzxhwaTaGDrEPGD16Liryuky3vucQ8pH4YRtuz8DvGOq03VPi8rxIxAy2lxxG4BlS5JjTKtyyvR6We+StSKakjy0oKa7Hd9civ6PRStowtntmITFxCYwsjbqnTflPrnwU7EtE+43NiMXkJbFQgPu6zFD3xopz701i9KhOKzDU3EZVqG+WcZLftTHftV8jpbFGvr1gXcixT38DeptDVeyeagljxvsQF9hDGWIlUnZdOOx5yGCowb+vyDCPUrCPU5zbFrHsFoW5li/nehr48u5yv3MmeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DraQ+zI+kkuU/phisDIgsokQct5Rhgvpy//KGessNP0=;
 b=RyUGyPD46dQW8OZpYnfWlIbcyEtXXKkKiDpg2hkbnu65W6dYwmSyaWcTLTFuseEITFvowO+xMV3+id9SdTy6U1FKySTOWZ9+amcNRwKhPkwflK1ft+OnoThLYDdD27AbgssuaIswkaFbXSUmmHDtkHQzodiegLIRnlFtapW39do=
Received: from BN1PR13CA0007.namprd13.prod.outlook.com (2603:10b6:408:e2::12)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 22:11:46 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::47) by BN1PR13CA0007.outlook.office365.com
 (2603:10b6:408:e2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 22:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 22:11:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 17:11:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/12] drm/amdgpu: Use logical ids for VCN/JPEG v4.0.3
Date: Tue, 9 May 2023 18:11:20 -0400
Message-ID: <20230509221128.476220-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509221128.476220-1-alexander.deucher@amd.com>
References: <20230509221128.476220-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT029:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: cc92ea03-d85f-433e-51aa-08db50da60ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdBtutodZQK2gq2PwEKhZvfwPBzTxbaqtD8A1y8Tmt3lmH0c6r0nfwBwYEjsZJGJbtKO3t81q6V4HBWroDdEO5/cwVtgpEl2IQVbeD0ckDf4mfjy59KLW1mZfig7ygIlxE7+0G+eDWdFGMcsMoZGcSLRlnAOIotxlxjy2VbsEr2QtiplknVJCIsrExGyvKNsGXYA569IbkBpUIQA3ueB5/hlhTvFb4SAeQ3EnpFG+wEWps6VUBJ+bNaRj8xNZioYNMu495tAH494WC8UA+uVFwg3m5ezIIvzizPRZBGDyPWFAd1NOfPWKZ49O0n+PK3Y2+vyhMHbPsVp0K5jLY5Xzw0t7FbkWyBVKRh5gV/K/UWubKe7LeWbUSReFhVF/C98SQoybXDoVoiiaDY47aoCev2VNkX/5yJsrbTGOQX6rDvMGypPlN+eZVjzbSjy8U2VTqDJfFHDhiloDDKOvZjT4zFpWu8dQjZl4JfHX40Pwf2UudXkFUhP11p1vkll7ps1E9zp00nrVpzdod/69cXy7PZ6psxOlf3Dqp+CG6elF3mDQC6ecA2Nn5jfoUradmr04Dtudr3oWAjiRqeyGoTKmVuy2P57F1+AdQw3jkd3jWj8U9/3lTYTKpVihug0NmWkF9/P+ZYN5qCGJvmicd3PSxZl0SUWKYHRZO/LwtdCN/sOnIcRt0nKi5QG6gbG3iG4hkbBSF6JtJaKQzTf8ItsTzfZKcHZbZahWrbNVT3NLYw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(30864003)(4326008)(2906002)(8936002)(478600001)(316002)(5660300002)(8676002)(6916009)(54906003)(41300700001)(16526019)(6666004)(70586007)(70206006)(7696005)(1076003)(26005)(186003)(40460700003)(83380400001)(82740400003)(47076005)(36756003)(2616005)(336012)(426003)(40480700001)(36860700001)(82310400005)(86362001)(356005)(81166007)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:11:46.1846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc92ea03-d85f-433e-51aa-08db50da60ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

Address VCN/JPEG instances using logical ids. Whenever register access is
required, get the physical instance using GET_INST.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
Tested-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h       |  29 +-
 .../drm/amd/amdgpu/aqua_vanjaram_reg_init.c   |  14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c      | 251 +++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c       | 431 ++++++++++--------
 4 files changed, 408 insertions(+), 317 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 47463ef10fce..1eb9ccd1d83d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -141,18 +141,23 @@
 		RREG32_SOC15(VCN, inst_idx, mmUVD_DPG_LMA_DATA);				\
 	})
 
-#define WREG32_SOC15_DPG_MODE(inst_idx, offset, value, mask_en, indirect)			\
-	do {											\
-		if (!indirect) {								\
-			WREG32_SOC15(VCN, inst_idx, mmUVD_DPG_LMA_DATA, value);			\
-			WREG32_SOC15(VCN, inst_idx, mmUVD_DPG_LMA_CTL, 				\
-				(0x1 << UVD_DPG_LMA_CTL__READ_WRITE__SHIFT |			\
-				 mask_en << UVD_DPG_LMA_CTL__MASK_EN__SHIFT |			\
-				 offset << UVD_DPG_LMA_CTL__READ_WRITE_ADDR__SHIFT));		\
-		} else {									\
-			*adev->vcn.inst[inst_idx].dpg_sram_curr_addr++ = offset;		\
-			*adev->vcn.inst[inst_idx].dpg_sram_curr_addr++ = value;			\
-		}										\
+#define WREG32_SOC15_DPG_MODE(inst_idx, offset, value, mask_en, indirect)             \
+	do {                                                                          \
+		if (!indirect) {                                                      \
+			WREG32_SOC15(VCN, GET_INST(VCN, inst_idx),                    \
+				     mmUVD_DPG_LMA_DATA, value);                      \
+			WREG32_SOC15(                                                 \
+				VCN, GET_INST(VCN, inst_idx),                         \
+				mmUVD_DPG_LMA_CTL,                                    \
+				(0x1 << UVD_DPG_LMA_CTL__READ_WRITE__SHIFT |          \
+				 mask_en << UVD_DPG_LMA_CTL__MASK_EN__SHIFT |         \
+				 offset << UVD_DPG_LMA_CTL__READ_WRITE_ADDR__SHIFT)); \
+		} else {                                                              \
+			*adev->vcn.inst[inst_idx].dpg_sram_curr_addr++ =              \
+				offset;                                               \
+			*adev->vcn.inst[inst_idx].dpg_sram_curr_addr++ =              \
+				value;                                                \
+		}                                                                     \
 	} while (0)
 
 #define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
index 90fe77db9bee..51d3cb81e37a 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
@@ -70,6 +70,8 @@ static int8_t aqua_vanjaram_logical_to_dev_inst(struct amdgpu_device *adev,
 	switch (block) {
 	case GC_HWIP:
 	case SDMA0_HWIP:
+	/* Both JPEG and VCN as JPEG is only alias of VCN */
+	case VCN_HWIP:
 		dev_inst = adev->ip_map.dev_inst[block][inst];
 		break;
 	default:
@@ -379,7 +381,7 @@ static int aqua_vanjaram_xcp_mgr_init(struct amdgpu_device *adev)
 int aqua_vanjaram_init_soc_config(struct amdgpu_device *adev)
 {
 	u32 mask, inst_mask = adev->sdma.sdma_mask;
-	int ret, i, num_inst;
+	int ret, i;
 
 	/* generally 1 AID supports 4 instances */
 	adev->sdma.num_inst_per_aid = 4;
@@ -394,11 +396,15 @@ int aqua_vanjaram_init_soc_config(struct amdgpu_device *adev)
 			adev->aid_mask |= (1 << i);
 	}
 
-	num_inst = hweight32(adev->aid_mask);
+	/* Harvest config is not used for aqua vanjaram. VCN and JPEGs will be
+	 * addressed based on logical instance ids.
+	 */
+	adev->vcn.harvest_config = 0;
 	adev->vcn.num_inst_per_aid = 1;
-	adev->vcn.num_vcn_inst = adev->vcn.num_inst_per_aid * num_inst;
+	adev->vcn.num_vcn_inst = hweight32(adev->vcn.inst_mask);
+	adev->jpeg.harvest_config = 0;
 	adev->jpeg.num_inst_per_aid = 1;
-	adev->jpeg.num_jpeg_inst = adev->jpeg.num_inst_per_aid * num_inst;
+	adev->jpeg.num_jpeg_inst = hweight32(adev->jpeg.inst_mask);
 
 	ret = aqua_vanjaram_xcp_mgr_init(adev);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index aa14a6619e9a..c0e90e27f24b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -82,7 +82,7 @@ static int jpeg_v4_0_3_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, j, r;
+	int i, j, r, jpeg_inst;
 
 	for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 		/* JPEG TRAP */
@@ -101,14 +101,15 @@ static int jpeg_v4_0_3_sw_init(void *handle)
 		return r;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
+		jpeg_inst = GET_INST(JPEG, i);
+
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			ring->use_doorbell = true;
 			ring->vm_hub = AMDGPU_MMHUB0(adev->jpeg.inst[i].aid_id);
 			ring->doorbell_index =
-				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 1 + j + 9 * i;
+				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
+				1 + j + 9 * jpeg_inst;
 			sprintf(ring->name, "jpeg_dec_%d.%d", i, j);
 			r = amdgpu_ring_init(adev, ring, 512, &adev->jpeg.inst->irq, 0,
 						AMDGPU_RING_PRIO_DEFAULT, NULL);
@@ -118,8 +119,10 @@ static int jpeg_v4_0_3_sw_init(void *handle)
 			adev->jpeg.internal.jpeg_pitch[j] =
 				regUVD_JRBC0_UVD_JRBC_SCRATCH0_INTERNAL_OFFSET;
 			adev->jpeg.inst[i].external.jpeg_pitch[j] =
-				SOC15_REG_OFFSET1(JPEG, i, regUVD_JRBC0_UVD_JRBC_SCRATCH0,
-				(j?(0x40 * j - 0xc80):0));
+				SOC15_REG_OFFSET1(
+					JPEG, jpeg_inst,
+					regUVD_JRBC0_UVD_JRBC_SCRATCH0,
+					(j ? (0x40 * j - 0xc80) : 0));
 		}
 	}
 
@@ -157,25 +160,30 @@ static int jpeg_v4_0_3_hw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, j, r;
+	int i, j, r, jpeg_inst;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
+		jpeg_inst = GET_INST(JPEG, i);
+
 		ring = adev->jpeg.inst[i].ring_dec;
 
 		if (ring->use_doorbell)
-			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * i,
+			adev->nbio.funcs->vcn_doorbell_range(
+				adev, ring->use_doorbell,
+				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
+					9 * jpeg_inst,
 				adev->jpeg.inst[i].aid_id);
 
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			if (ring->use_doorbell)
-				WREG32_SOC15_OFFSET(VCN, i, regVCN_JPEG_DB_CTRL,
-					(ring->pipe?(ring->pipe - 0x15):0),
-					ring->doorbell_index << VCN_JPEG_DB_CTRL__OFFSET__SHIFT |
-					VCN_JPEG_DB_CTRL__EN_MASK);
+				WREG32_SOC15_OFFSET(
+					VCN, GET_INST(VCN, i),
+					regVCN_JPEG_DB_CTRL,
+					(ring->pipe ? (ring->pipe - 0x15) : 0),
+					ring->doorbell_index
+							<< VCN_JPEG_DB_CTRL__OFFSET__SHIFT |
+						VCN_JPEG_DB_CTRL__EN_MASK);
 			r = amdgpu_ring_test_helper(ring);
 			if (r)
 				return r;
@@ -250,10 +258,11 @@ static int jpeg_v4_0_3_resume(void *handle)
 
 static void jpeg_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
+	int i, jpeg_inst;
 	uint32_t data;
-	int i;
 
-	data = RREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_CTRL);
+	jpeg_inst = GET_INST(JPEG, inst_idx);
+	data = RREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_CTRL);
 	if (adev->cg_flags & AMD_CG_SUPPORT_JPEG_MGCG) {
 		data |= 1 << JPEG_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
 		data &= (~(JPEG_CGC_CTRL__JPEG0_DEC_MODE_MASK << 1));
@@ -263,21 +272,22 @@ static void jpeg_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int ins
 
 	data |= 1 << JPEG_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << JPEG_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_CTRL, data);
+	WREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_CTRL, data);
 
-	data = RREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_GATE);
+	data = RREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_GATE);
 	data &= ~(JPEG_CGC_GATE__JMCIF_MASK | JPEG_CGC_GATE__JRBBM_MASK);
 	for (i = 0; i < adev->jpeg.num_jpeg_rings; ++i)
 		data &= ~(JPEG_CGC_GATE__JPEG0_DEC_MASK << i);
-	WREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_GATE, data);
+	WREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_GATE, data);
 }
 
 static void jpeg_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
+	int i, jpeg_inst;
 	uint32_t data;
-	int i;
 
-	data = RREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_CTRL);
+	jpeg_inst = GET_INST(JPEG, inst_idx);
+	data = RREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_CTRL);
 	if (adev->cg_flags & AMD_CG_SUPPORT_JPEG_MGCG) {
 		data |= 1 << JPEG_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
 		data |= (JPEG_CGC_CTRL__JPEG0_DEC_MODE_MASK << 1);
@@ -287,13 +297,13 @@ static void jpeg_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst
 
 	data |= 1 << JPEG_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << JPEG_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_CTRL, data);
+	WREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_CTRL, data);
 
-	data = RREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_GATE);
+	data = RREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_GATE);
 	data |= (JPEG_CGC_GATE__JMCIF_MASK | JPEG_CGC_GATE__JRBBM_MASK);
 	for (i = 0; i < adev->jpeg.num_jpeg_rings; ++i)
 		data |= (JPEG_CGC_GATE__JPEG0_DEC_MASK << i);
-	WREG32_SOC15(JPEG, inst_idx, regJPEG_CGC_GATE, data);
+	WREG32_SOC15(JPEG, jpeg_inst, regJPEG_CGC_GATE, data);
 }
 
 /**
@@ -306,34 +316,36 @@ static void jpeg_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst
 static int jpeg_v4_0_3_start(struct amdgpu_device *adev)
 {
 	struct amdgpu_ring *ring;
-	int i, j;
+	int i, j, jpeg_inst;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
-		WREG32_SOC15(JPEG, i, regUVD_PGFSM_CONFIG,
-			1 << UVD_PGFSM_CONFIG__UVDJ_PWR_CONFIG__SHIFT);
-		SOC15_WAIT_ON_RREG(JPEG, i, regUVD_PGFSM_STATUS,
-			UVD_PGFSM_STATUS__UVDJ_PWR_ON <<
-			UVD_PGFSM_STATUS__UVDJ_PWR_STATUS__SHIFT,
+		jpeg_inst = GET_INST(JPEG, i);
+
+		WREG32_SOC15(JPEG, jpeg_inst, regUVD_PGFSM_CONFIG,
+			     1 << UVD_PGFSM_CONFIG__UVDJ_PWR_CONFIG__SHIFT);
+		SOC15_WAIT_ON_RREG(
+			JPEG, jpeg_inst, regUVD_PGFSM_STATUS,
+			UVD_PGFSM_STATUS__UVDJ_PWR_ON
+				<< UVD_PGFSM_STATUS__UVDJ_PWR_STATUS__SHIFT,
 			UVD_PGFSM_STATUS__UVDJ_PWR_STATUS_MASK);
 
 		/* disable anti hang mechanism */
-		WREG32_P(SOC15_REG_OFFSET(JPEG, i, regUVD_JPEG_POWER_STATUS), 0,
-			~UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK);
+		WREG32_P(SOC15_REG_OFFSET(JPEG, jpeg_inst,
+					  regUVD_JPEG_POWER_STATUS),
+			 0, ~UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK);
 
 		/* JPEG disable CGC */
 		jpeg_v4_0_3_disable_clock_gating(adev, i);
 
 		/* MJPEG global tiling registers */
-		WREG32_SOC15(JPEG, i, regJPEG_DEC_GFX8_ADDR_CONFIG,
-			adev->gfx.config.gb_addr_config);
-		WREG32_SOC15(JPEG, i, regJPEG_DEC_GFX10_ADDR_CONFIG,
-			adev->gfx.config.gb_addr_config);
+		WREG32_SOC15(JPEG, jpeg_inst, regJPEG_DEC_GFX8_ADDR_CONFIG,
+			     adev->gfx.config.gb_addr_config);
+		WREG32_SOC15(JPEG, jpeg_inst, regJPEG_DEC_GFX10_ADDR_CONFIG,
+			     adev->gfx.config.gb_addr_config);
 
 		/* enable JMI channel */
-		WREG32_P(SOC15_REG_OFFSET(JPEG, i, regUVD_JMI_CNTL), 0,
-			~UVD_JMI_CNTL__SOFT_RESET_MASK);
+		WREG32_P(SOC15_REG_OFFSET(JPEG, jpeg_inst, regUVD_JMI_CNTL), 0,
+			 ~UVD_JMI_CNTL__SOFT_RESET_MASK);
 
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			unsigned int reg_offset = (j?(0x40 * j - 0xc80):0);
@@ -341,25 +353,40 @@ static int jpeg_v4_0_3_start(struct amdgpu_device *adev)
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 
 			/* enable System Interrupt for JRBC */
-			WREG32_P(SOC15_REG_OFFSET(JPEG, i, regJPEG_SYS_INT_EN),
-				JPEG_SYS_INT_EN__DJRBC0_MASK << j,
-				~(JPEG_SYS_INT_EN__DJRBC0_MASK << j));
-
-			WREG32_SOC15_OFFSET(JPEG, i,
-				regUVD_JMI0_UVD_LMI_JRBC_RB_VMID, reg_offset, 0);
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_CNTL, reg_offset,
-				(0x00000001L | 0x00000002L));
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JMI0_UVD_LMI_JRBC_RB_64BIT_BAR_LOW,
+			WREG32_P(SOC15_REG_OFFSET(JPEG, jpeg_inst,
+						  regJPEG_SYS_INT_EN),
+				 JPEG_SYS_INT_EN__DJRBC0_MASK << j,
+				 ~(JPEG_SYS_INT_EN__DJRBC0_MASK << j));
+
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JMI0_UVD_LMI_JRBC_RB_VMID,
+					    reg_offset, 0);
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JRBC0_UVD_JRBC_RB_CNTL,
+					    reg_offset,
+					    (0x00000001L | 0x00000002L));
+			WREG32_SOC15_OFFSET(
+				JPEG, jpeg_inst,
+				regUVD_JMI0_UVD_LMI_JRBC_RB_64BIT_BAR_LOW,
 				reg_offset, lower_32_bits(ring->gpu_addr));
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JMI0_UVD_LMI_JRBC_RB_64BIT_BAR_HIGH,
+			WREG32_SOC15_OFFSET(
+				JPEG, jpeg_inst,
+				regUVD_JMI0_UVD_LMI_JRBC_RB_64BIT_BAR_HIGH,
 				reg_offset, upper_32_bits(ring->gpu_addr));
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_RPTR, reg_offset, 0);
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_WPTR, reg_offset, 0);
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_CNTL, reg_offset,
-				0x00000002L);
-			WREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_SIZE, reg_offset,
-				ring->ring_size / 4);
-			ring->wptr = RREG32_SOC15_OFFSET(JPEG, i, regUVD_JRBC0_UVD_JRBC_RB_WPTR,
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JRBC0_UVD_JRBC_RB_RPTR,
+					    reg_offset, 0);
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JRBC0_UVD_JRBC_RB_WPTR,
+					    reg_offset, 0);
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JRBC0_UVD_JRBC_RB_CNTL,
+					    reg_offset, 0x00000002L);
+			WREG32_SOC15_OFFSET(JPEG, jpeg_inst,
+					    regUVD_JRBC0_UVD_JRBC_RB_SIZE,
+					    reg_offset, ring->ring_size / 4);
+			ring->wptr = RREG32_SOC15_OFFSET(
+				JPEG, jpeg_inst, regUVD_JRBC0_UVD_JRBC_RB_WPTR,
 				reg_offset);
 		}
 	}
@@ -376,29 +403,29 @@ static int jpeg_v4_0_3_start(struct amdgpu_device *adev)
  */
 static int jpeg_v4_0_3_stop(struct amdgpu_device *adev)
 {
-	int i;
+	int i, jpeg_inst;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
-
+		jpeg_inst = GET_INST(JPEG, i);
 		/* reset JMI */
-		WREG32_P(SOC15_REG_OFFSET(JPEG, i, regUVD_JMI_CNTL),
-			UVD_JMI_CNTL__SOFT_RESET_MASK,
-			~UVD_JMI_CNTL__SOFT_RESET_MASK);
+		WREG32_P(SOC15_REG_OFFSET(JPEG, jpeg_inst, regUVD_JMI_CNTL),
+			 UVD_JMI_CNTL__SOFT_RESET_MASK,
+			 ~UVD_JMI_CNTL__SOFT_RESET_MASK);
 
 		jpeg_v4_0_3_enable_clock_gating(adev, i);
 
 		/* enable anti hang mechanism */
-		WREG32_P(SOC15_REG_OFFSET(JPEG, i, regUVD_JPEG_POWER_STATUS),
-			UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK,
-			~UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK);
-
-		WREG32_SOC15(JPEG, i, regUVD_PGFSM_CONFIG,
-			2 << UVD_PGFSM_CONFIG__UVDJ_PWR_CONFIG__SHIFT);
-		SOC15_WAIT_ON_RREG(JPEG, i, regUVD_PGFSM_STATUS,
-			UVD_PGFSM_STATUS__UVDJ_PWR_OFF <<
-			UVD_PGFSM_STATUS__UVDJ_PWR_STATUS__SHIFT,
+		WREG32_P(SOC15_REG_OFFSET(JPEG, jpeg_inst,
+					  regUVD_JPEG_POWER_STATUS),
+			 UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK,
+			 ~UVD_JPEG_POWER_STATUS__JPEG_POWER_STATUS_MASK);
+
+		WREG32_SOC15(JPEG, jpeg_inst, regUVD_PGFSM_CONFIG,
+			     2 << UVD_PGFSM_CONFIG__UVDJ_PWR_CONFIG__SHIFT);
+		SOC15_WAIT_ON_RREG(
+			JPEG, jpeg_inst, regUVD_PGFSM_STATUS,
+			UVD_PGFSM_STATUS__UVDJ_PWR_OFF
+				<< UVD_PGFSM_STATUS__UVDJ_PWR_STATUS__SHIFT,
 			UVD_PGFSM_STATUS__UVDJ_PWR_STATUS_MASK);
 	}
 
@@ -416,8 +443,9 @@ static uint64_t jpeg_v4_0_3_dec_ring_get_rptr(struct amdgpu_ring *ring)
 {
 	struct amdgpu_device *adev = ring->adev;
 
-	return RREG32_SOC15_OFFSET(JPEG, ring->me, regUVD_JRBC0_UVD_JRBC_RB_RPTR,
-			ring->pipe?(0x40 * ring->pipe - 0xc80):0);
+	return RREG32_SOC15_OFFSET(
+		JPEG, GET_INST(JPEG, ring->me), regUVD_JRBC0_UVD_JRBC_RB_RPTR,
+		ring->pipe ? (0x40 * ring->pipe - 0xc80) : 0);
 }
 
 /**
@@ -434,8 +462,10 @@ static uint64_t jpeg_v4_0_3_dec_ring_get_wptr(struct amdgpu_ring *ring)
 	if (ring->use_doorbell)
 		return adev->wb.wb[ring->wptr_offs];
 	else
-		return RREG32_SOC15_OFFSET(JPEG, ring->me, regUVD_JRBC0_UVD_JRBC_RB_WPTR,
-			ring->pipe?(0x40 * ring->pipe - 0xc80):0);
+		return RREG32_SOC15_OFFSET(
+			JPEG, GET_INST(JPEG, ring->me),
+			regUVD_JRBC0_UVD_JRBC_RB_WPTR,
+			ring->pipe ? (0x40 * ring->pipe - 0xc80) : 0);
 }
 
 /**
@@ -453,8 +483,11 @@ static void jpeg_v4_0_3_dec_ring_set_wptr(struct amdgpu_ring *ring)
 		adev->wb.wb[ring->wptr_offs] = lower_32_bits(ring->wptr);
 		WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
 	} else {
-		WREG32_SOC15_OFFSET(JPEG, ring->me, regUVD_JRBC0_UVD_JRBC_RB_WPTR,
-			(ring->pipe?(0x40 * ring->pipe - 0xc80):0), lower_32_bits(ring->wptr));
+		WREG32_SOC15_OFFSET(JPEG, GET_INST(JPEG, ring->me),
+				    regUVD_JRBC0_UVD_JRBC_RB_WPTR,
+				    (ring->pipe ? (0x40 * ring->pipe - 0xc80) :
+						  0),
+				    lower_32_bits(ring->wptr));
 	}
 }
 
@@ -703,15 +736,15 @@ static bool jpeg_v4_0_3_is_idle(void *handle)
 	int i, j;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			unsigned int reg_offset = (j?(0x40 * j - 0xc80):0);
 
-			ret &= ((RREG32_SOC15_OFFSET(JPEG, i,
-					regUVD_JRBC0_UVD_JRBC_STATUS, reg_offset) &
-					UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK) ==
-					UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK);
+			ret &= ((RREG32_SOC15_OFFSET(
+					 JPEG, GET_INST(JPEG, i),
+					 regUVD_JRBC0_UVD_JRBC_STATUS,
+					 reg_offset) &
+				 UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK) ==
+				UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK);
 		}
 	}
 
@@ -725,12 +758,11 @@ static int jpeg_v4_0_3_wait_for_idle(void *handle)
 	int i, j;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			unsigned int reg_offset = (j?(0x40 * j - 0xc80):0);
 
-			ret &= SOC15_WAIT_ON_RREG_OFFSET(JPEG, i,
+			ret &= SOC15_WAIT_ON_RREG_OFFSET(
+				JPEG, GET_INST(JPEG, i),
 				regUVD_JRBC0_UVD_JRBC_STATUS, reg_offset,
 				UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK,
 				UVD_JRBC0_UVD_JRBC_STATUS__RB_JOB_DONE_MASK);
@@ -747,8 +779,6 @@ static int jpeg_v4_0_3_set_clockgating_state(void *handle,
 	int i;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
 		if (enable) {
 			if (!jpeg_v4_0_3_is_idle(handle))
 				return -EBUSY;
@@ -792,35 +822,46 @@ static int jpeg_v4_0_3_process_interrupt(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry)
 {
-	uint32_t i;
+	uint32_t i, inst;
 
 	i = node_id_to_phys_map[entry->node_id];
 	DRM_DEV_DEBUG(adev->dev, "IH: JPEG TRAP\n");
 
+	for (inst = 0; inst < adev->jpeg.num_jpeg_inst; ++inst)
+		if (adev->jpeg.inst[inst].aid_id == i)
+			break;
+
+	if (inst >= adev->jpeg.num_jpeg_inst) {
+		dev_WARN_ONCE(adev->dev, 1,
+			      "Interrupt received for unknown JPEG instance %d",
+			      entry->node_id);
+		return 0;
+	}
+
 	switch (entry->src_id) {
 	case VCN_4_0__SRCID__JPEG_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[0]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[0]);
 		break;
 	case VCN_4_0__SRCID__JPEG1_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[1]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[1]);
 		break;
 	case VCN_4_0__SRCID__JPEG2_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[2]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[2]);
 		break;
 	case VCN_4_0__SRCID__JPEG3_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[3]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[3]);
 		break;
 	case VCN_4_0__SRCID__JPEG4_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[4]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[4]);
 		break;
 	case VCN_4_0__SRCID__JPEG5_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[5]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[5]);
 		break;
 	case VCN_4_0__SRCID__JPEG6_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[6]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[6]);
 		break;
 	case VCN_4_0__SRCID__JPEG7_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[i].ring_dec[7]);
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[7]);
 		break;
 	default:
 		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
@@ -882,17 +923,17 @@ static const struct amdgpu_ring_funcs jpeg_v4_0_3_dec_ring_vm_funcs = {
 
 static void jpeg_v4_0_3_set_dec_ring_funcs(struct amdgpu_device *adev)
 {
-	int i, j;
+	int i, j, jpeg_inst;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			adev->jpeg.inst[i].ring_dec[j].funcs = &jpeg_v4_0_3_dec_ring_vm_funcs;
 			adev->jpeg.inst[i].ring_dec[j].me = i;
 			adev->jpeg.inst[i].ring_dec[j].pipe = j;
 		}
-		adev->jpeg.inst[i].aid_id = i / adev->jpeg.num_inst_per_aid;
+		jpeg_inst = GET_INST(JPEG, i);
+		adev->jpeg.inst[i].aid_id =
+			jpeg_inst / adev->jpeg.num_inst_per_aid;
 	}
 	DRM_DEV_INFO(adev->dev, "JPEG decode is enabled in VM mode\n");
 }
@@ -907,8 +948,6 @@ static void jpeg_v4_0_3_set_irq_funcs(struct amdgpu_device *adev)
 	int i;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
 		adev->jpeg.inst->irq.num_types += adev->jpeg.num_jpeg_rings;
 	}
 	adev->jpeg.inst->irq.funcs = &jpeg_v4_0_3_irq_funcs;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 308dfe80a87c..49b07843efd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -83,7 +83,7 @@ static int vcn_v4_0_3_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, r;
+	int i, r, vcn_inst;
 
 	r = amdgpu_vcn_sw_init(adev);
 	if (r)
@@ -104,12 +104,13 @@ static int vcn_v4_0_3_sw_init(void *handle)
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
 		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+		vcn_inst = GET_INST(VCN, i);
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
 		ring->use_doorbell = true;
-		ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * i;
+		ring->doorbell_index =
+			(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
+			9 * vcn_inst;
 		ring->vm_hub = AMDGPU_MMHUB0(adev->vcn.inst[i].aid_id);
 		sprintf(ring->name, "vcn_unified_%d", i);
 		r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst->irq, 0,
@@ -148,8 +149,6 @@ static int vcn_v4_0_3_sw_fini(void *handle)
 		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
 			volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
 			fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
 			fw_shared->present_flag_0 = 0;
 			fw_shared->sq.is_enabled = cpu_to_le32(false);
@@ -177,21 +176,25 @@ static int vcn_v4_0_3_hw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, r;
+	int i, r, vcn_inst;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+		vcn_inst = GET_INST(VCN, i);
 		ring = &adev->vcn.inst[i].ring_enc[0];
 
 		if (ring->use_doorbell) {
-			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-					(adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * i,
-					adev->vcn.inst[i].aid_id);
-
-			WREG32_SOC15(VCN, ring->me, regVCN_RB1_DB_CTRL,
-				ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
-				VCN_RB1_DB_CTRL__EN_MASK);
+			adev->nbio.funcs->vcn_doorbell_range(
+				adev, ring->use_doorbell,
+				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
+					9 * vcn_inst,
+				adev->vcn.inst[i].aid_id);
+
+			WREG32_SOC15(
+				VCN, GET_INST(VCN, ring->me),
+				regVCN_RB1_DB_CTRL,
+				ring->doorbell_index
+						<< VCN_RB1_DB_CTRL__OFFSET__SHIFT |
+					VCN_RB1_DB_CTRL__EN_MASK);
 		}
 
 		r = amdgpu_ring_test_helper(ring);
@@ -278,54 +281,67 @@ static int vcn_v4_0_3_resume(void *handle)
  */
 static void vcn_v4_0_3_mc_resume(struct amdgpu_device *adev, int inst_idx)
 {
-	uint32_t offset, size;
+	uint32_t offset, size, vcn_inst;
 	const struct common_firmware_header *hdr;
 
 	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 	size = AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
 
+	vcn_inst = GET_INST(VCN, inst_idx);
 	/* cache window 0: fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
-			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_lo));
-		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
-			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_hi));
-		WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0, 0);
+		WREG32_SOC15(
+			VCN, vcn_inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx]
+				 .tmr_mc_addr_lo));
+		WREG32_SOC15(
+			VCN, vcn_inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx]
+				 .tmr_mc_addr_hi));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_OFFSET0, 0);
 		offset = 0;
 	} else {
-		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
-			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
-		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
-			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			     lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
+		WREG32_SOC15(VCN, vcn_inst,
+			     regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			     upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
 		offset = size;
-		WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0,
-			AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_OFFSET0,
+			     AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
 	}
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE0, size);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_SIZE0, size);
 
 	/* cache window 1: stack */
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW,
-		lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH,
-		upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET1, 0);
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE1, AMDGPU_VCN_STACK_SIZE);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW,
+		     lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH,
+		     upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_OFFSET1, 0);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_SIZE1,
+		     AMDGPU_VCN_STACK_SIZE);
 
 	/* cache window 2: context */
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW,
-		lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH,
-		upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET2, 0);
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE2, AMDGPU_VCN_CONTEXT_SIZE);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW,
+		     lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset +
+				   AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH,
+		     upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset +
+				   AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_OFFSET2, 0);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_CACHE_SIZE2,
+		     AMDGPU_VCN_CONTEXT_SIZE);
 
 	/* non-cache window */
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW,
+	WREG32_SOC15(
+		VCN, vcn_inst, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW,
 		lower_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr));
-	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH,
+	WREG32_SOC15(
+		VCN, vcn_inst, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH,
 		upper_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr));
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_NONCACHE_OFFSET0, 0);
-	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_NONCACHE_SIZE0,
+	WREG32_SOC15(VCN, vcn_inst, regUVD_VCPU_NONCACHE_OFFSET0, 0);
+	WREG32_SOC15(
+		VCN, vcn_inst, regUVD_VCPU_NONCACHE_SIZE0,
 		AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)));
 }
 
@@ -454,18 +470,21 @@ static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_i
 static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t data;
+	int vcn_inst;
 
 	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
 		return;
 
+	vcn_inst = GET_INST(VCN, inst_idx);
+
 	/* VCN disable CGC */
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL);
 	data &= ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
 	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_GATE);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_CGC_GATE);
 	data &= ~(UVD_CGC_GATE__SYS_MASK
 		| UVD_CGC_GATE__MPEG2_MASK
 		| UVD_CGC_GATE__REGS_MASK
@@ -479,10 +498,10 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst
 		| UVD_CGC_GATE__VCPU_MASK
 		| UVD_CGC_GATE__MMSCH_MASK);
 
-	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_GATE, data);
-	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_CGC_GATE, 0,  0xFFFFFFFF);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_CGC_GATE, data);
+	SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_CGC_GATE, 0, 0xFFFFFFFF);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL);
 	data &= ~(UVD_CGC_CTRL__SYS_MODE_MASK
 		| UVD_CGC_CTRL__MPEG2_MODE_MASK
 		| UVD_CGC_CTRL__REGS_MODE_MASK
@@ -495,9 +514,9 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst
 		| UVD_CGC_CTRL__WCB_MODE_MASK
 		| UVD_CGC_CTRL__VCPU_MODE_MASK
 		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
-	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_GATE);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_GATE);
 	data |= (UVD_SUVD_CGC_GATE__SRE_MASK
 		| UVD_SUVD_CGC_GATE__SIT_MASK
 		| UVD_SUVD_CGC_GATE__SMP_MASK
@@ -519,9 +538,9 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst
 		| UVD_SUVD_CGC_GATE__SIT_VP9_DEC_MASK
 		| UVD_SUVD_CGC_GATE__SDB_VP9_MASK
 		| UVD_SUVD_CGC_GATE__IME_HEVC_MASK);
-	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_GATE, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_GATE, data);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_CTRL);
 	data &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
@@ -530,7 +549,7 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst
 		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
-	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_CTRL, data);
 }
 
 /**
@@ -595,18 +614,21 @@ static void vcn_v4_0_3_disable_clock_gating_dpg_mode(struct amdgpu_device *adev,
 static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t data;
+	int vcn_inst;
 
 	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
 		return;
 
+	vcn_inst = GET_INST(VCN, inst_idx);
+
 	/* enable VCN CGC */
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL);
 	data |= 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
 	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL);
 	data |= (UVD_CGC_CTRL__SYS_MODE_MASK
 		| UVD_CGC_CTRL__MPEG2_MODE_MASK
 		| UVD_CGC_CTRL__REGS_MODE_MASK
@@ -618,9 +640,9 @@ static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst_
 		| UVD_CGC_CTRL__LRBBM_MODE_MASK
 		| UVD_CGC_CTRL__WCB_MODE_MASK
 		| UVD_CGC_CTRL__VCPU_MODE_MASK);
-	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_CTRL);
 	data |= (UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
@@ -629,7 +651,7 @@ static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst_
 		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
-	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_SUVD_CGC_CTRL, data);
 }
 
 /**
@@ -646,16 +668,18 @@ static int vcn_v4_0_3_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, b
 	volatile struct amdgpu_vcn4_fw_shared *fw_shared =
 						adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
 	struct amdgpu_ring *ring;
+	int vcn_inst;
 	uint32_t tmp;
 
+	vcn_inst = GET_INST(VCN, inst_idx);
 	/* disable register anti-hang mechanism */
-	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 1,
-		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_POWER_STATUS), 1,
+		 ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 	/* enable dynamic power gating mode */
-	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS);
+	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_POWER_STATUS);
 	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
 	tmp |= UVD_POWER_STATUS__UVD_PG_EN_MASK;
-	WREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS, tmp);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_POWER_STATUS, tmp);
 
 	if (indirect)
 		adev->vcn.inst[inst_idx].dpg_sram_curr_addr =
@@ -737,27 +761,28 @@ static int vcn_v4_0_3_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, b
 	ring = &adev->vcn.inst[inst_idx].ring_enc[0];
 
 	/* program the RB_BASE for ring buffer */
-	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO,
-		lower_32_bits(ring->gpu_addr));
-	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI,
-		upper_32_bits(ring->gpu_addr));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_LO,
+		     lower_32_bits(ring->gpu_addr));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_HI,
+		     upper_32_bits(ring->gpu_addr));
 
-	WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE, ring->ring_size / sizeof(uint32_t));
+	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_SIZE,
+		     ring->ring_size / sizeof(uint32_t));
 
 	/* resetting ring, fw should not check RB ring */
-	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
+	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
 	tmp &= ~(VCN_RB_ENABLE__RB_EN_MASK);
-	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
+	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
 	fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
 
 	/* Initialize the ring buffer's read and write pointers */
-	WREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR, 0);
-	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, 0);
-	ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR, 0);
+	WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, 0);
+	ring->wptr = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
 
-	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
+	tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
 	tmp |= VCN_RB_ENABLE__RB_EN_MASK;
-	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
+	WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
 	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
 
 	/*resetting done, fw can check RB ring */
@@ -777,99 +802,101 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
 {
 	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 	struct amdgpu_ring *ring;
+	int i, j, k, r, vcn_inst;
 	uint32_t tmp;
-	int i, j, k, r;
 
 	if (adev->pm.dpm_enabled)
 		amdgpu_dpm_enable_uvd(adev, true);
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
 		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
 			r = vcn_v4_0_3_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
 			continue;
 		}
 
+		vcn_inst = GET_INST(VCN, i);
 		/* set VCN status busy */
-		tmp = RREG32_SOC15(VCN, i, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
-		WREG32_SOC15(VCN, i, regUVD_STATUS, tmp);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_STATUS) |
+		      UVD_STATUS__UVD_BUSY;
+		WREG32_SOC15(VCN, vcn_inst, regUVD_STATUS, tmp);
 
 		/*SW clock gating */
 		vcn_v4_0_3_disable_clock_gating(adev, i);
 
 		/* enable VCPU clock */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
-			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL),
+			 UVD_VCPU_CNTL__CLK_EN_MASK,
+			 ~UVD_VCPU_CNTL__CLK_EN_MASK);
 
 		/* disable master interrupt */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN), 0,
-			~UVD_MASTINT_EN__VCPU_EN_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN), 0,
+			 ~UVD_MASTINT_EN__VCPU_EN_MASK);
 
 		/* enable LMI MC and UMC channels */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_LMI_CTRL2), 0,
-			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_LMI_CTRL2), 0,
+			 ~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
 
-		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET);
 		tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
 		tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
-		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET, tmp);
 
 		/* setup regUVD_LMI_CTRL */
-		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL);
-		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL, tmp |
-			UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
-			UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
-			UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
-			UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL,
+			     tmp | UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
+				     UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
+				     UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
+				     UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
 
 		/* setup regUVD_MPC_CNTL */
-		tmp = RREG32_SOC15(VCN, i, regUVD_MPC_CNTL);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_MPC_CNTL);
 		tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
 		tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
-		WREG32_SOC15(VCN, i, regUVD_MPC_CNTL, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_CNTL, tmp);
 
 		/* setup UVD_MPC_SET_MUXA0 */
-		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXA0,
-			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
-			(0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
-			(0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
-			(0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUXA0,
+			     ((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
+			      (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
+			      (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
+			      (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
 
 		/* setup UVD_MPC_SET_MUXB0 */
-		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXB0,
-			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
-			(0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
-			(0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
-			(0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUXB0,
+			     ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
+			      (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
+			      (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
+			      (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
 
 		/* setup UVD_MPC_SET_MUX */
-		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUX,
-			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
-			(0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
-			(0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_MPC_SET_MUX,
+			     ((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
+			      (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
+			      (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
 
 		vcn_v4_0_3_mc_resume(adev, i);
 
 		/* VCN global tiling registers */
-		WREG32_SOC15(VCN, i, regUVD_GFX8_ADDR_CONFIG,
-			adev->gfx.config.gb_addr_config);
-		WREG32_SOC15(VCN, i, regUVD_GFX10_ADDR_CONFIG,
-			adev->gfx.config.gb_addr_config);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_GFX8_ADDR_CONFIG,
+			     adev->gfx.config.gb_addr_config);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_GFX10_ADDR_CONFIG,
+			     adev->gfx.config.gb_addr_config);
 
 		/* unblock VCPU register access */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL), 0,
-			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_RB_ARB_CTRL), 0,
+			 ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
 
 		/* release VCPU reset to boot */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
-			~UVD_VCPU_CNTL__BLK_RST_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL), 0,
+			 ~UVD_VCPU_CNTL__BLK_RST_MASK);
 
 		for (j = 0; j < 10; ++j) {
 			uint32_t status;
 
 			for (k = 0; k < 100; ++k) {
-				status = RREG32_SOC15(VCN, i, regUVD_STATUS);
+				status = RREG32_SOC15(VCN, vcn_inst,
+						      regUVD_STATUS);
 				if (status & 2)
 					break;
 				mdelay(10);
@@ -880,12 +907,14 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
 
 			DRM_DEV_ERROR(adev->dev,
 				"VCN decode not responding, trying to reset the VCPU!!!\n");
-			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
-				UVD_VCPU_CNTL__BLK_RST_MASK,
-				~UVD_VCPU_CNTL__BLK_RST_MASK);
+			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst,
+						  regUVD_VCPU_CNTL),
+				 UVD_VCPU_CNTL__BLK_RST_MASK,
+				 ~UVD_VCPU_CNTL__BLK_RST_MASK);
 			mdelay(10);
-			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
-				~UVD_VCPU_CNTL__BLK_RST_MASK);
+			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst,
+						  regUVD_VCPU_CNTL),
+				 0, ~UVD_VCPU_CNTL__BLK_RST_MASK);
 
 			mdelay(10);
 			r = -1;
@@ -897,39 +926,40 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
 		}
 
 		/* enable master interrupt */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN),
-			UVD_MASTINT_EN__VCPU_EN_MASK,
-			~UVD_MASTINT_EN__VCPU_EN_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN),
+			 UVD_MASTINT_EN__VCPU_EN_MASK,
+			 ~UVD_MASTINT_EN__VCPU_EN_MASK);
 
 		/* clear the busy bit of VCN_STATUS */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_STATUS), 0,
-			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_STATUS), 0,
+			 ~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
 		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
 
 		/* program the RB_BASE for ring buffer */
-		WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO,
-			lower_32_bits(ring->gpu_addr));
-		WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI,
-			upper_32_bits(ring->gpu_addr));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_LO,
+			     lower_32_bits(ring->gpu_addr));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_HI,
+			     upper_32_bits(ring->gpu_addr));
 
-		WREG32_SOC15(VCN, i, regUVD_RB_SIZE, ring->ring_size / sizeof(uint32_t));
+		WREG32_SOC15(VCN, vcn_inst, regUVD_RB_SIZE,
+			     ring->ring_size / sizeof(uint32_t));
 
 		/* resetting ring, fw should not check RB ring */
-		tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
 		tmp &= ~(VCN_RB_ENABLE__RB_EN_MASK);
-		WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
 
 		/* Initialize the ring buffer's read and write pointers */
-		WREG32_SOC15(VCN, i, regUVD_RB_RPTR, 0);
-		WREG32_SOC15(VCN, i, regUVD_RB_WPTR, 0);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR, 0);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, 0);
 
-		tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
 		tmp |= VCN_RB_ENABLE__RB_EN_MASK;
-		WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
 
-		ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR);
+		ring->wptr = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
 		fw_shared->sq.queue_mode &=
 			cpu_to_le32(~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF));
 
@@ -948,21 +978,24 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
 static int vcn_v4_0_3_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t tmp;
+	int vcn_inst;
+
+	vcn_inst = GET_INST(VCN, inst_idx);
 
 	/* Wait for power status to be 1 */
-	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
-		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+	SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_POWER_STATUS, 1,
+			   UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 
 	/* wait for read ptr to be equal to write ptr */
-	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
-	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR, tmp, 0xFFFFFFFF);
+	tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
+	SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_RB_RPTR, tmp, 0xFFFFFFFF);
 
-	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
-		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+	SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_POWER_STATUS, 1,
+			   UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 
 	/* disable dynamic power gating mode */
-	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
-		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
+	WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_POWER_STATUS), 0,
+		 ~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
 	return 0;
 }
 
@@ -976,12 +1009,11 @@ static int vcn_v4_0_3_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 static int vcn_v4_0_3_stop(struct amdgpu_device *adev)
 {
 	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
+	int i, r = 0, vcn_inst;
 	uint32_t tmp;
-	int i, r = 0;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+		vcn_inst = GET_INST(VCN, i);
 
 		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
 		fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
@@ -992,7 +1024,8 @@ static int vcn_v4_0_3_stop(struct amdgpu_device *adev)
 		}
 
 		/* wait for vcn idle */
-		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
+		r = SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_STATUS,
+				       UVD_STATUS__IDLE, 0x7);
 		if (r)
 			goto Done;
 
@@ -1000,45 +1033,47 @@ static int vcn_v4_0_3_stop(struct amdgpu_device *adev)
 			UVD_LMI_STATUS__READ_CLEAN_MASK |
 			UVD_LMI_STATUS__WRITE_CLEAN_MASK |
 			UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
-		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		r = SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_LMI_STATUS, tmp,
+				       tmp);
 		if (r)
 			goto Done;
 
 		/* stall UMC channel */
-		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL2);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL2);
 		tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
-		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL2, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL2, tmp);
 		tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK |
 			UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
-		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		r = SOC15_WAIT_ON_RREG(VCN, vcn_inst, regUVD_LMI_STATUS, tmp,
+				       tmp);
 		if (r)
 			goto Done;
 
 		/* Unblock VCPU Register access */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL),
-			UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
-			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_RB_ARB_CTRL),
+			 UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
+			 ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
 
 		/* release VCPU reset to boot */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
-			UVD_VCPU_CNTL__BLK_RST_MASK,
-			~UVD_VCPU_CNTL__BLK_RST_MASK);
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL),
+			 UVD_VCPU_CNTL__BLK_RST_MASK,
+			 ~UVD_VCPU_CNTL__BLK_RST_MASK);
 
 		/* disable VCPU clock */
-		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
-			~(UVD_VCPU_CNTL__CLK_EN_MASK));
+		WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL), 0,
+			 ~(UVD_VCPU_CNTL__CLK_EN_MASK));
 
 		/* reset LMI UMC/LMI/VCPU */
-		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET);
 		tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
-		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET, tmp);
 
-		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET);
 		tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
-		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET, tmp);
 
 		/* clear VCN status */
-		WREG32_SOC15(VCN, i, regUVD_STATUS, 0);
+		WREG32_SOC15(VCN, vcn_inst, regUVD_STATUS, 0);
 
 		/* apply HW clock gating */
 		vcn_v4_0_3_enable_clock_gating(adev, i);
@@ -1080,7 +1115,7 @@ static uint64_t vcn_v4_0_3_unified_ring_get_rptr(struct amdgpu_ring *ring)
 	if (ring != &adev->vcn.inst[ring->me].ring_enc[0])
 		DRM_ERROR("wrong ring id is identified in %s", __func__);
 
-	return RREG32_SOC15(VCN, ring->me, regUVD_RB_RPTR);
+	return RREG32_SOC15(VCN, GET_INST(VCN, ring->me), regUVD_RB_RPTR);
 }
 
 /**
@@ -1100,7 +1135,8 @@ static uint64_t vcn_v4_0_3_unified_ring_get_wptr(struct amdgpu_ring *ring)
 	if (ring->use_doorbell)
 		return *ring->wptr_cpu_addr;
 	else
-		return RREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR);
+		return RREG32_SOC15(VCN, GET_INST(VCN, ring->me),
+				    regUVD_RB_WPTR);
 }
 
 /**
@@ -1121,7 +1157,8 @@ static void vcn_v4_0_3_unified_ring_set_wptr(struct amdgpu_ring *ring)
 		*ring->wptr_cpu_addr = lower_32_bits(ring->wptr);
 		WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
 	} else {
-		WREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR, lower_32_bits(ring->wptr));
+		WREG32_SOC15(VCN, GET_INST(VCN, ring->me), regUVD_RB_WPTR,
+			     lower_32_bits(ring->wptr));
 	}
 }
 
@@ -1163,14 +1200,14 @@ static const struct amdgpu_ring_funcs vcn_v4_0_3_unified_ring_vm_funcs = {
  */
 static void vcn_v4_0_3_set_unified_ring_funcs(struct amdgpu_device *adev)
 {
-	int i;
+	int i, vcn_inst;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
 		adev->vcn.inst[i].ring_enc[0].funcs = &vcn_v4_0_3_unified_ring_vm_funcs;
 		adev->vcn.inst[i].ring_enc[0].me = i;
-		adev->vcn.inst[i].aid_id = i / adev->vcn.num_inst_per_aid;
+		vcn_inst = GET_INST(VCN, i);
+		adev->vcn.inst[i].aid_id =
+			vcn_inst / adev->vcn.num_inst_per_aid;
 	}
 	DRM_DEV_INFO(adev->dev, "VCN decode is enabled in VM mode\n");
 }
@@ -1188,9 +1225,8 @@ static bool vcn_v4_0_3_is_idle(void *handle)
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		ret &= (RREG32_SOC15(VCN, i, regUVD_STATUS) == UVD_STATUS__IDLE);
+		ret &= (RREG32_SOC15(VCN, GET_INST(VCN, i), regUVD_STATUS) ==
+			UVD_STATUS__IDLE);
 	}
 
 	return ret;
@@ -1209,10 +1245,8 @@ static int vcn_v4_0_3_wait_for_idle(void *handle)
 	int i, ret = 0;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		ret = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE,
-				UVD_STATUS__IDLE);
+		ret = SOC15_WAIT_ON_RREG(VCN, GET_INST(VCN, i), regUVD_STATUS,
+					 UVD_STATUS__IDLE, UVD_STATUS__IDLE);
 		if (ret)
 			return ret;
 	}
@@ -1235,10 +1269,9 @@ static int vcn_v4_0_3_set_clockgating_state(void *handle,
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
 		if (enable) {
-			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
+			if (RREG32_SOC15(VCN, GET_INST(VCN, i),
+					 regUVD_STATUS) != UVD_STATUS__IDLE)
 				return -EBUSY;
 			vcn_v4_0_3_enable_clock_gating(adev, i);
 		} else {
@@ -1307,15 +1340,26 @@ static int vcn_v4_0_3_process_interrupt(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry)
 {
-	uint32_t i;
+	uint32_t i, inst;
 
 	i = node_id_to_phys_map[entry->node_id];
 
 	DRM_DEV_DEBUG(adev->dev, "IH: VCN TRAP\n");
 
+	for (inst = 0; inst < adev->vcn.num_vcn_inst; ++inst)
+		if (adev->vcn.inst[inst].aid_id == i)
+			break;
+
+	if (inst >= adev->vcn.num_vcn_inst) {
+		dev_WARN_ONCE(adev->dev, 1,
+			      "Interrupt received for unknown VCN instance %d",
+			      entry->node_id);
+		return 0;
+	}
+
 	switch (entry->src_id) {
 	case VCN_4_0__SRCID__UVD_ENC_GENERAL_PURPOSE:
-		amdgpu_fence_process(&adev->vcn.inst[i].ring_enc[0]);
+		amdgpu_fence_process(&adev->vcn.inst[inst].ring_enc[0]);
 		break;
 	default:
 		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
@@ -1343,9 +1387,6 @@ static void vcn_v4_0_3_set_irq_funcs(struct amdgpu_device *adev)
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-
 		adev->vcn.inst->irq.num_types++;
 	}
 	adev->vcn.inst->irq.funcs = &vcn_v4_0_3_irq_funcs;
-- 
2.40.1

