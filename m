Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360F6CF423
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Mar 2023 22:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5210EC2A;
	Wed, 29 Mar 2023 20:11:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E0810EC28
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Mar 2023 20:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CALmJNt4FGNJ29uauB83ZGjiWaxB90h1kHjTbW27gbtt2BCNupNRohbp6R0cUuVLS8NWaEQb0GCd+hWBV/qBIsVRdD9J5j84eubCMdq+jqKNjhiJ+K2D0U8UlqJczPqOvxjfSagHuxh8+2MvSgHfjvgIJDKHdlmaFI2k5NfqzDBXE6aPdWHxrBiaHu3yaph9YxfMFmhZ28ZT6ctyHusoR21Lbl/iReITLyPAoxNzt/1O8QzDdF2NznQk/5J2ky06sxOtJMLjv4OgLhCjb3XmE/luAohu+VFhxD9+ULpoA31IjVM1DTRTdYRuNwyiNJf4otsaMisorx4PrvHJOo3igQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul4b92C62qXAIp4YjGS1W5oXE9a/ta4/CgpeRuWUMy8=;
 b=cLyKF9DMKGl+4Al43UKhZ1XnzWyttg/9l7rTPdG8lJj1O852JS2m3enwhT22UgetmLLQrTMRlWnNOshnE4PT4b6H55Kv8gJ23Lv5mlmvDuJo677PyJR6HsZiRCwe0U7lmkQheseBKmMzdQlLbrLqddqaGeABPJk/MzBlYqr3rAY0siWsvKg398LuhzJmusfSFiWXKctVDKTmrmn/lh2tMwUb46fAGx1B91pLLmtHS40svGS0TJsDX+QUX/6yDo3w+ywHcqag4WfAXvcQM8a3TxFo+AgTWcw47wEdzCwIbKyID4ThkT+Flpr+UULkhdPn/JT9t9qfeTcN3ENwiypqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul4b92C62qXAIp4YjGS1W5oXE9a/ta4/CgpeRuWUMy8=;
 b=4nurBkoFadXgS8IanqxTCGLr1glrJydKrtPaKVb6SGAZG7XQqlvkj8mkUcwsjwHN3tlClHSZOXRww3YgB5CD1JZFKgpvZc+xg84kc+AVOkRXb4MIQ3BKa+9HHQI1AR+mtEFPaVAeZqlTwYLLJ+YK6+4H2WEA/HHLsKVF5JKWiWo=
Received: from MW4PR04CA0194.namprd04.prod.outlook.com (2603:10b6:303:86::19)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 20:11:29 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::b1) by MW4PR04CA0194.outlook.office365.com
 (2603:10b6:303:86::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 20:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6254.22 via Frontend Transport; Wed, 29 Mar 2023 20:11:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 15:11:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu/vcn: add vcn multiple AIDs support
Date: Wed, 29 Mar 2023 16:11:09 -0400
Message-ID: <20230329201109.1982249-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329201109.1982249-1-alexander.deucher@amd.com>
References: <20230329201109.1982249-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f85dff-f4fa-41a9-fac6-08db3091c82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+6lKrEwftgyLqmM4ZCxtzdvQp+Cuwd05CT77qes3/yr91vEku3SO0lyOfDHiht/c1nHAiahkfz9j8diPmgarZ+RltiXO+ximQQrHsLXE1J2LTI11Ls8evHMV9BoOOzNDPfvk75bjYbfpuZQFeyEKMHTpG6nFKycDGkZn/N2uTW/N6BofZmYER/J8ITlliog25Y36HNH4SgjQ1Xau018jFuVJqJ6p6fy3ccfSgj1ykIKDXQrnDcz6JVTvyAedc0CaKMjr6lw2Dg2F1yrdovc6zzBdubUY+ViTUJI9ruxkOi0RI7mCvkuz4Z78VCUXkIp7sZhzroErkjw9arZE0YikroVtqb/qIg8ZaEYad2ikT/n36lZiHqDZP5UJoopoxYaaDL3HZvRWXQrsKJIXJvy1oWVbLQHpsqW2pTk/zYU4lbVK7+jWv5XX7trNAsAVbDyjbZorxyGlxj0S4IBV5a5t1ahrwNe1ZBdY6ynYl5Q6jA/iW0k5C+Y3pnCYiXhJ2uLKQedW62bk6aeMMbTWSfDmZscf8ZMyn8f8cZXU4HaZ5M72mJ6FL/5ummKkekvnYboGGtFQKMwPRgFroBZrV+JFfKyKV9bgFJcpATlwLompxnNe7hNJT9aN5O1qFwJCjAxF8bZzF6on/c+ahRB15bKw7BLaY4/S0tCgCCv4A8LWCoRaXKBV4pHo2blesywoN1HbyAzhO25ByeDEkL4Gdehh47YvRd8RXxqSEbay2uQmTo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36756003)(70206006)(186003)(40480700001)(40460700003)(16526019)(26005)(1076003)(6916009)(36860700001)(8676002)(4326008)(30864003)(5660300002)(70586007)(8936002)(41300700001)(356005)(81166007)(7696005)(54906003)(478600001)(316002)(336012)(6666004)(47076005)(426003)(82740400003)(86362001)(83380400001)(2616005)(2906002)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 20:11:28.8317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f85dff-f4fa-41a9-fac6-08db3091c82f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: James Zhu <James.Zhu@amd.com>

add vcn multiple AIDs support.

v2: squash in FW setting fix (Alex)

Signed-off-by: James Zhu <James.Zhu@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c | 810 +++++++++++++-----------
 1 file changed, 434 insertions(+), 376 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index a9f06f3b00eb..8db50a50b868 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -79,9 +79,8 @@ static int vcn_v4_0_3_early_init(void *handle)
 static int vcn_v4_0_3_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 	struct amdgpu_ring *ring;
-	int r;
+	int i, r;
 
 	r = amdgpu_vcn_sw_init(adev);
 	if (r)
@@ -99,20 +98,27 @@ static int vcn_v4_0_3_sw_init(void *handle)
 	if (r)
 		return r;
 
-	ring = &adev->vcn.inst->ring_dec;
-	ring->use_doorbell = true;
-	ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1);
-	ring->vm_hub = AMDGPU_MMHUB0(0);
-	sprintf(ring->name, "vcn_dec");
-	r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst->irq, 0,
-			     AMDGPU_RING_PRIO_DEFAULT,
-			     &adev->vcn.inst->sched_score);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 
-	fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
-	fw_shared->present_flag_0 = 0;
-	fw_shared->sq.is_enabled = cpu_to_le32(true);
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		ring = &adev->vcn.inst[i].ring_dec;
+		ring->use_doorbell = true;
+		ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * i;
+		ring->vm_hub = AMDGPU_MMHUB0(adev->vcn.inst[i].aid_id);
+		sprintf(ring->name, "vcn_dec_%d", i);
+		r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst->irq, 0,
+				     AMDGPU_RING_PRIO_DEFAULT,
+				     &adev->vcn.inst[i].sched_score);
+		if (r)
+			return r;
+
+		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
+		fw_shared->present_flag_0 = 0;
+		fw_shared->sq.is_enabled = cpu_to_le32(true);
+	}
 
 	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
 		adev->vcn.pause_dpg_mode = vcn_v4_0_3_pause_dpg_mode;
@@ -130,15 +136,18 @@ static int vcn_v4_0_3_sw_init(void *handle)
 static int vcn_v4_0_3_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int r, idx;
+	int i, r, idx;
 
 	if (drm_dev_enter(&adev->ddev, &idx)) {
-		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
-
-		fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
-		fw_shared->present_flag_0 = 0;
-		fw_shared->sq.is_enabled = cpu_to_le32(false);
-
+		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+			volatile struct amdgpu_vcn4_fw_shared *fw_shared;
+
+			if (adev->vcn.harvest_config & (1 << i))
+				continue;
+			fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
+			fw_shared->present_flag_0 = 0;
+			fw_shared->sq.is_enabled = cpu_to_le32(false);
+		}
 		drm_dev_exit(idx);
 	}
 
@@ -161,18 +170,30 @@ static int vcn_v4_0_3_sw_fini(void *handle)
 static int vcn_v4_0_3_hw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct amdgpu_ring *ring = &adev->vcn.inst->ring_dec;
-	int r;
+	struct amdgpu_ring *ring;
+	int i, r;
 
-	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-				(adev->doorbell_index.vcn.vcn_ring0_1 << 1), 0);
-	if (ring->use_doorbell)
-		WREG32_SOC15(VCN, ring->me, regVCN_RB4_DB_CTRL,
-			ring->doorbell_index << VCN_RB4_DB_CTRL__OFFSET__SHIFT |
-			VCN_RB4_DB_CTRL__EN_MASK);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		ring = &adev->vcn.inst[i].ring_dec;
 
-	r = amdgpu_ring_test_helper(ring);
+		if (ring->use_doorbell)
+			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+					(adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * i,
+					adev->vcn.inst[i].aid_id);
 
+		if (ring->use_doorbell)
+			WREG32_SOC15(VCN, ring->me, regVCN_RB4_DB_CTRL,
+				ring->doorbell_index << VCN_RB4_DB_CTRL__OFFSET__SHIFT |
+				VCN_RB4_DB_CTRL__EN_MASK);
+
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			goto done;
+	}
+
+done:
 	if (!r)
 		DRM_DEV_INFO(adev->dev, "VCN decode initialized successfully(under %s).\n",
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)?"DPG Mode":"SPG Mode");
@@ -245,10 +266,11 @@ static int vcn_v4_0_3_resume(void *handle)
  * vcn_v4_0_3_mc_resume - memory controller programming
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number
  *
  * Let the VCN memory controller know it's offsets
  */
-static void vcn_v4_0_3_mc_resume(struct amdgpu_device *adev)
+static void vcn_v4_0_3_mc_resume(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t offset, size;
 	const struct common_firmware_header *hdr;
@@ -258,50 +280,46 @@ static void vcn_v4_0_3_mc_resume(struct amdgpu_device *adev)
 
 	/* cache window 0: fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
-			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].tmr_mc_addr_lo));
-		WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
-			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].tmr_mc_addr_hi));
-		WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_OFFSET0, 0);
+		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_lo));
+		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_hi));
+		WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0, 0);
 		offset = 0;
 	} else {
-		WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
-			lower_32_bits(adev->vcn.inst->gpu_addr));
-		WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
-			upper_32_bits(adev->vcn.inst->gpu_addr));
+		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
+		WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr));
 		offset = size;
-		if (amdgpu_emu_mode == 1)
-			/* No signed header here */
-			WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_OFFSET0, 0);
-		else
-			WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_OFFSET0,
-				AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
+		WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0,
+			AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
 	}
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_SIZE0, size);
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE0, size);
 
 	/* cache window 1: stack */
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW,
-		lower_32_bits(adev->vcn.inst->gpu_addr + offset));
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH,
-		upper_32_bits(adev->vcn.inst->gpu_addr + offset));
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_OFFSET1, 0);
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_SIZE1, AMDGPU_VCN_STACK_SIZE);
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset));
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET1, 0);
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE1, AMDGPU_VCN_STACK_SIZE);
 
 	/* cache window 2: context */
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW,
-		lower_32_bits(adev->vcn.inst->gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH,
-		upper_32_bits(adev->vcn.inst->gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_OFFSET2, 0);
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_CACHE_SIZE2, AMDGPU_VCN_CONTEXT_SIZE);
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET2, 0);
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_CACHE_SIZE2, AMDGPU_VCN_CONTEXT_SIZE);
 
 	/* non-cache window */
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW,
-		lower_32_bits(adev->vcn.inst->fw_shared.gpu_addr));
-	WREG32_SOC15(VCN, 0, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH,
-		upper_32_bits(adev->vcn.inst->fw_shared.gpu_addr));
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_NONCACHE_OFFSET0, 0);
-	WREG32_SOC15(VCN, 0, regUVD_VCPU_NONCACHE_SIZE0,
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr));
+	WREG32_SOC15(VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr));
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_NONCACHE_OFFSET0, 0);
+	WREG32_SOC15(VCN, inst_idx, regUVD_VCPU_NONCACHE_SIZE0,
 		AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)));
 }
 
@@ -309,11 +327,12 @@ static void vcn_v4_0_3_mc_resume(struct amdgpu_device *adev)
  * vcn_v4_0_mc_resume_dpg_mode - memory controller programming for dpg mode
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
  * @indirect: indirectly write sram
  *
  * Let the VCN memory controller know it's offsets with dpg mode
  */
-static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_device *adev, bool indirect)
+static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
 {
 	uint32_t offset, size;
 	const struct common_firmware_header *hdr;
@@ -324,93 +343,97 @@ static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_device *adev, bool indir
 	/* cache window 0: fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
 		if (!indirect) {
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
-				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].tmr_mc_addr_lo), 0, indirect);
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN +
+					inst_idx].tmr_mc_addr_lo), 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
-				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].tmr_mc_addr_hi), 0, indirect);
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN +
+					inst_idx].tmr_mc_addr_hi), 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
 		} else {
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW), 0, 0, indirect);
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH), 0, 0, indirect);
-			WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 				VCN, 0, regUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
 		}
 		offset = 0;
 	} else {
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
-			lower_32_bits(adev->vcn.inst->gpu_addr), 0, indirect);
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
-			upper_32_bits(adev->vcn.inst->gpu_addr), 0, indirect);
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
 		offset = size;
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_OFFSET0),
-			0, 0, indirect);
+			AMDGPU_UVD_FIRMWARE_OFFSET >> 3, 0, indirect);
 	}
 
 	if (!indirect)
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_SIZE0), size, 0, indirect);
 	else
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_SIZE0), 0, 0, indirect);
 
 	/* cache window 1: stack */
 	if (!indirect) {
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
-			lower_32_bits(adev->vcn.inst->gpu_addr + offset), 0, indirect);
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
-			upper_32_bits(adev->vcn.inst->gpu_addr + offset), 0, indirect);
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
 	} else {
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW), 0, 0, indirect);
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH), 0, 0, indirect);
-		WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
 	}
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_SIZE1), AMDGPU_VCN_STACK_SIZE, 0, indirect);
 
 	/* cache window 2: context */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
-			lower_32_bits(adev->vcn.inst->gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset +
+				AMDGPU_VCN_STACK_SIZE), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
-			upper_32_bits(adev->vcn.inst->gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset +
+				AMDGPU_VCN_STACK_SIZE), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_OFFSET2), 0, 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_CACHE_SIZE2), AMDGPU_VCN_CONTEXT_SIZE, 0, indirect);
 
 	/* non-cache window */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW),
-			lower_32_bits(adev->vcn.inst->fw_shared.gpu_addr), 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			lower_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH),
-			upper_32_bits(adev->vcn.inst->fw_shared.gpu_addr), 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+			upper_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_NONCACHE_OFFSET0), 0, 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 			VCN, 0, regUVD_VCPU_NONCACHE_SIZE0),
 			AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)), 0, indirect);
 
 	/* VCN global tiling registers */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_GFX8_ADDR_CONFIG), adev->gfx.config.gb_addr_config, 0, indirect);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_GFX10_ADDR_CONFIG), adev->gfx.config.gb_addr_config, 0, indirect);
 }
 
@@ -418,13 +441,13 @@ static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_device *adev, bool indir
  * vcn_v4_0_3_disable_clock_gating - disable VCN clock gating
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number
  *
  * Disable clock gating for VCN block
  */
-static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
+static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t data;
-	int inst_idx = 0;
 
 	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
 		return;
@@ -434,9 +457,9 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
 	data &= ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
 	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(VCN, 0, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_CGC_GATE);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_GATE);
 	data &= ~(UVD_CGC_GATE__SYS_MASK
 		| UVD_CGC_GATE__MPEG2_MASK
 		| UVD_CGC_GATE__REGS_MASK
@@ -450,10 +473,10 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
 		| UVD_CGC_GATE__VCPU_MASK
 		| UVD_CGC_GATE__MMSCH_MASK);
 
-	WREG32_SOC15(VCN, 0, regUVD_CGC_GATE, data);
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_CGC_GATE, 0,  0xFFFFFFFF);
+	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_GATE, data);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_CGC_GATE, 0,  0xFFFFFFFF);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
 	data &= ~(UVD_CGC_CTRL__SYS_MODE_MASK
 		| UVD_CGC_CTRL__MPEG2_MODE_MASK
 		| UVD_CGC_CTRL__REGS_MODE_MASK
@@ -466,9 +489,9 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
 		| UVD_CGC_CTRL__WCB_MODE_MASK
 		| UVD_CGC_CTRL__VCPU_MODE_MASK
 		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
-	WREG32_SOC15(VCN, 0, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_GATE);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_GATE);
 	data |= (UVD_SUVD_CGC_GATE__SRE_MASK
 		| UVD_SUVD_CGC_GATE__SIT_MASK
 		| UVD_SUVD_CGC_GATE__SMP_MASK
@@ -490,9 +513,9 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
 		| UVD_SUVD_CGC_GATE__SIT_VP9_DEC_MASK
 		| UVD_SUVD_CGC_GATE__SDB_VP9_MASK
 		| UVD_SUVD_CGC_GATE__IME_HEVC_MASK);
-	WREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_GATE, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_GATE, data);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL);
 	data &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
@@ -501,7 +524,7 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
 		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
-	WREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL, data);
 }
 
 /**
@@ -509,12 +532,13 @@ static void vcn_v4_0_3_disable_clock_gating(struct amdgpu_device *adev)
  *
  * @adev: amdgpu_device pointer
  * @sram_sel: sram select
+ * @inst_idx: instance number index
  * @indirect: indirectly write sram
  *
  * Disable clock gating for VCN block with dpg mode
  */
 static void vcn_v4_0_3_disable_clock_gating_dpg_mode(struct amdgpu_device *adev, uint8_t sram_sel,
-				uint8_t indirect)
+				int inst_idx, uint8_t indirect)
 {
 	uint32_t reg_data = 0;
 
@@ -538,19 +562,19 @@ static void vcn_v4_0_3_disable_clock_gating_dpg_mode(struct amdgpu_device *adev,
 		 UVD_CGC_CTRL__LRBBM_MODE_MASK |
 		 UVD_CGC_CTRL__WCB_MODE_MASK |
 		 UVD_CGC_CTRL__VCPU_MODE_MASK);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_CGC_CTRL), reg_data, sram_sel, indirect);
 
 	/* turn off clock gating */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_CGC_GATE), 0, sram_sel, indirect);
 
 	/* turn on SUVD clock gating */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_SUVD_CGC_GATE), 1, sram_sel, indirect);
 
 	/* turn on sw mode in UVD_SUVD_CGC_CTRL */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_SUVD_CGC_CTRL), 0, sram_sel, indirect);
 }
 
@@ -558,13 +582,13 @@ static void vcn_v4_0_3_disable_clock_gating_dpg_mode(struct amdgpu_device *adev,
  * vcn_v4_0_enable_clock_gating - enable VCN clock gating
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number
  *
  * Enable clock gating for VCN block
  */
-static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev)
+static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t data;
-	int inst_idx = 0;
 
 	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
 		return;
@@ -574,9 +598,9 @@ static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev)
 	data |= 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
 	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
-	WREG32_SOC15(VCN, 0, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL);
 	data |= (UVD_CGC_CTRL__SYS_MODE_MASK
 		| UVD_CGC_CTRL__MPEG2_MODE_MASK
 		| UVD_CGC_CTRL__REGS_MODE_MASK
@@ -588,9 +612,9 @@ static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev)
 		| UVD_CGC_CTRL__LRBBM_MODE_MASK
 		| UVD_CGC_CTRL__WCB_MODE_MASK
 		| UVD_CGC_CTRL__VCPU_MODE_MASK);
-	WREG32_SOC15(VCN, 0, regUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_CGC_CTRL, data);
 
-	data = RREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_CTRL);
+	data = RREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL);
 	data |= (UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
@@ -599,48 +623,51 @@ static void vcn_v4_0_3_enable_clock_gating(struct amdgpu_device *adev)
 		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
 		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
-	WREG32_SOC15(VCN, 0, regUVD_SUVD_CGC_CTRL, data);
+	WREG32_SOC15(VCN, inst_idx, regUVD_SUVD_CGC_CTRL, data);
 }
 
 /**
  * vcn_v4_0_3_start_dpg_mode - VCN start with dpg mode
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
  * @indirect: indirectly write sram
  *
  * Start VCN block with dpg mode
  */
-static int vcn_v4_0_3_start_dpg_mode(struct amdgpu_device *adev, bool indirect)
+static int vcn_v4_0_3_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
 {
-	volatile struct amdgpu_vcn4_fw_shared *fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
+	volatile struct amdgpu_vcn4_fw_shared *fw_shared =
+						adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
 	struct amdgpu_ring *ring;
 	uint32_t tmp;
 
 	/* disable register anti-hang mechanism */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_POWER_STATUS), 1,
+	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 1,
 		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 	/* enable dynamic power gating mode */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_POWER_STATUS);
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS);
 	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
 	tmp |= UVD_POWER_STATUS__UVD_PG_EN_MASK;
-	WREG32_SOC15(VCN, 0, regUVD_POWER_STATUS, tmp);
+	WREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS, tmp);
 
 	if (indirect)
-		adev->vcn.inst->dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst->dpg_sram_cpu_addr;
+		adev->vcn.inst[inst_idx].dpg_sram_curr_addr =
+				(uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
 
 	/* enable clock gating */
-	vcn_v4_0_3_disable_clock_gating_dpg_mode(adev, 0, indirect);
+	vcn_v4_0_3_disable_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
 
 	/* enable VCPU clock */
 	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
 	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
 	tmp |= UVD_VCPU_CNTL__BLK_RST_MASK;
 
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_VCPU_CNTL), tmp, 0, indirect);
 
 	/* disable master interrupt */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MASTINT_EN), 0, 0, indirect);
 
 	/* setup regUVD_LMI_CTRL */
@@ -652,80 +679,80 @@ static int vcn_v4_0_3_start_dpg_mode(struct amdgpu_device *adev, bool indirect)
 		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK |
 		(8 << UVD_LMI_CTRL__WRITE_CLEAN_TIMER__SHIFT) |
 		0x00100000L);
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_LMI_CTRL), tmp, 0, indirect);
 
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MPC_CNTL),
 		0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT, 0, indirect);
 
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MPC_SET_MUXA0),
 		((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
 		 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
 		 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
 		 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)), 0, indirect);
 
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MPC_SET_MUXB0),
 		 ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
 		 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
 		 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
 		 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)), 0, indirect);
 
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MPC_SET_MUX),
 		((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
 		 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
 		 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)), 0, indirect);
 
-	vcn_v4_0_3_mc_resume_dpg_mode(adev, indirect);
+	vcn_v4_0_3_mc_resume_dpg_mode(adev, inst_idx, indirect);
 
 	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
 	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_VCPU_CNTL), tmp, 0, indirect);
 
 	/* enable LMI MC and UMC channels */
 	tmp = 0x1f << UVD_LMI_CTRL2__RE_OFLD_MIF_WR_REQ_NUM__SHIFT;
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_LMI_CTRL2), tmp, 0, indirect);
 
 	/* enable master interrupt */
-	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, regUVD_MASTINT_EN),
 		UVD_MASTINT_EN__VCPU_EN_MASK, 0, indirect);
 
 	if (indirect)
-		psp_update_vcn_sram(adev, 0, adev->vcn.inst->dpg_sram_gpu_addr,
-			(uint32_t)((uintptr_t)adev->vcn.inst->dpg_sram_curr_addr -
-				(uintptr_t)adev->vcn.inst->dpg_sram_cpu_addr));
+		psp_update_vcn_sram(adev, inst_idx, adev->vcn.inst[inst_idx].dpg_sram_gpu_addr,
+			(uint32_t)((uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_curr_addr -
+				(uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr));
 
-	ring = &adev->vcn.inst->ring_dec;
+	ring = &adev->vcn.inst[inst_idx].ring_dec;
 
 	/* program the RB_BASE for ring buffer */
-	WREG32_SOC15(VCN, 0, regUVD_RB_BASE_LO4,
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO4,
 		lower_32_bits(ring->gpu_addr));
-	WREG32_SOC15(VCN, 0, regUVD_RB_BASE_HI4,
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI4,
 		upper_32_bits(ring->gpu_addr));
 
-	WREG32_SOC15(VCN, 0, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
 
 	/* resetting ring, fw should not check RB ring */
-	tmp = RREG32_SOC15(VCN, 0, regVCN_RB_ENABLE);
+	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
 	tmp &= ~(VCN_RB_ENABLE__RB4_EN_MASK);
-	WREG32_SOC15(VCN, 0, regVCN_RB_ENABLE, tmp);
+	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
 
 	/* Initialize the ring buffer's read and write pointers */
-	WREG32_SOC15(VCN, 0, regUVD_RB_RPTR4, 0);
-	WREG32_SOC15(VCN, 0, regUVD_RB_WPTR4, 0);
-	ring->wptr = RREG32_SOC15(VCN, 0, regUVD_RB_WPTR4);
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR4, 0);
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4, 0);
+	ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4);
 
-	tmp = RREG32_SOC15(VCN, 0, regVCN_RB_ENABLE);
+	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
 	tmp |= VCN_RB_ENABLE__RB4_EN_MASK;
-	WREG32_SOC15(VCN, 0, regVCN_RB_ENABLE, tmp);
+	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
 
-	WREG32_SOC15(VCN, 0, regUVD_SCRATCH2, 0);
+	WREG32_SOC15(VCN, inst_idx, regUVD_SCRATCH2, 0);
 
 	/*resetting done, fw can check RB ring */
 	fw_shared->sq.queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
@@ -745,159 +772,162 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
 	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
 	struct amdgpu_ring *ring;
 	uint32_t tmp;
-	int j, k, r;
+	int i, j, k, r;
 
 	if (adev->pm.dpm_enabled)
 		amdgpu_dpm_enable_uvd(adev, true);
 
-	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
-		return vcn_v4_0_3_start_dpg_mode(adev, adev->vcn.indirect_sram);
-
-	/* set VCN status busy */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
-	WREG32_SOC15(VCN, 0, regUVD_STATUS, tmp);
-
-	/*SW clock gating */
-	vcn_v4_0_3_disable_clock_gating(adev);
-
-	/* enable VCPU clock */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL),
-		UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
-
-	/* disable master interrupt */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_MASTINT_EN), 0,
-		~UVD_MASTINT_EN__VCPU_EN_MASK);
-
-	/* enable LMI MC and UMC channels */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_LMI_CTRL2), 0,
-		~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
-
-	tmp = RREG32_SOC15(VCN, 0, regUVD_SOFT_RESET);
-	tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
-	tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
-	WREG32_SOC15(VCN, 0, regUVD_SOFT_RESET, tmp);
-
-	/* setup regUVD_LMI_CTRL */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_LMI_CTRL);
-	WREG32_SOC15(VCN, 0, regUVD_LMI_CTRL, tmp |
-		UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
-		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
-		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
-		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
-
-	/* setup regUVD_MPC_CNTL */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_MPC_CNTL);
-	tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
-	tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
-	WREG32_SOC15(VCN, 0, regUVD_MPC_CNTL, tmp);
-
-	/* setup UVD_MPC_SET_MUXA0 */
-	WREG32_SOC15(VCN, 0, regUVD_MPC_SET_MUXA0,
-		((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
-		(0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
-		(0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
-		(0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
-
-	/* setup UVD_MPC_SET_MUXB0 */
-	WREG32_SOC15(VCN, 0, regUVD_MPC_SET_MUXB0,
-		((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
-		(0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
-		(0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
-		(0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
-
-	/* setup UVD_MPC_SET_MUX */
-	WREG32_SOC15(VCN, 0, regUVD_MPC_SET_MUX,
-		((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
-		(0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
-		(0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
-
-	vcn_v4_0_3_mc_resume(adev);
-
-	/* VCN global tiling registers */
-	WREG32_SOC15(VCN, 0, regUVD_GFX8_ADDR_CONFIG,
-		adev->gfx.config.gb_addr_config);
-	WREG32_SOC15(VCN, 0, regUVD_GFX10_ADDR_CONFIG,
-		adev->gfx.config.gb_addr_config);
-
-	/* unblock VCPU register access */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_RB_ARB_CTRL), 0,
-		~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+			r = vcn_v4_0_3_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
+			continue;
+		}
 
-	/* release VCPU reset to boot */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL), 0,
-		~UVD_VCPU_CNTL__BLK_RST_MASK);
+		/* set VCN status busy */
+		tmp = RREG32_SOC15(VCN, i, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
+		WREG32_SOC15(VCN, i, regUVD_STATUS, tmp);
+
+		/*SW clock gating */
+		vcn_v4_0_3_disable_clock_gating(adev, i);
+
+		/* enable VCPU clock */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
+
+		/* disable master interrupt */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN), 0,
+			~UVD_MASTINT_EN__VCPU_EN_MASK);
+
+		/* enable LMI MC and UMC channels */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_LMI_CTRL2), 0,
+			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
+
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
+		tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+
+		/* setup regUVD_LMI_CTRL */
+		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL);
+		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL, tmp |
+			UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
+			UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
+			UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
+			UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
+
+		/* setup regUVD_MPC_CNTL */
+		tmp = RREG32_SOC15(VCN, i, regUVD_MPC_CNTL);
+		tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
+		tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
+		WREG32_SOC15(VCN, i, regUVD_MPC_CNTL, tmp);
+
+		/* setup UVD_MPC_SET_MUXA0 */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXA0,
+			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
+			(0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
+			(0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
+
+		/* setup UVD_MPC_SET_MUXB0 */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXB0,
+			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
+			(0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
+			(0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
+
+		/* setup UVD_MPC_SET_MUX */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUX,
+			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
+			(0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
+
+		vcn_v4_0_3_mc_resume(adev, i);
+
+		/* VCN global tiling registers */
+		WREG32_SOC15(VCN, i, regUVD_GFX8_ADDR_CONFIG,
+			adev->gfx.config.gb_addr_config);
+		WREG32_SOC15(VCN, i, regUVD_GFX10_ADDR_CONFIG,
+			adev->gfx.config.gb_addr_config);
+
+		/* unblock VCPU register access */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL), 0,
+			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+
+		/* release VCPU reset to boot */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+			~UVD_VCPU_CNTL__BLK_RST_MASK);
 
-	for (j = 0; j < 10; ++j) {
-		uint32_t status;
+		for (j = 0; j < 10; ++j) {
+			uint32_t status;
 
-		for (k = 0; k < 100; ++k) {
-			status = RREG32_SOC15(VCN, 0, regUVD_STATUS);
+			for (k = 0; k < 100; ++k) {
+				status = RREG32_SOC15(VCN, i, regUVD_STATUS);
+				if (status & 2)
+					break;
+				mdelay(10);
+			}
+			r = 0;
 			if (status & 2)
 				break;
-			if (amdgpu_emu_mode == 1)
-				msleep(500);
-			else
-				mdelay(10);
-		}
-		r = 0;
-		if (status & 2)
-			break;
-
-		DRM_DEV_ERROR(adev->dev,
-			"VCN decode not responding, trying to reset the VCPU!!!\n");
-		WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL),
-			UVD_VCPU_CNTL__BLK_RST_MASK,
-			~UVD_VCPU_CNTL__BLK_RST_MASK);
-		mdelay(10);
-		WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL), 0,
-			~UVD_VCPU_CNTL__BLK_RST_MASK);
-
-		mdelay(10);
-		r = -1;
-	}
 
-	if (r) {
-		DRM_DEV_ERROR(adev->dev, "VCN decode not responding, giving up!!!\n");
-		return r;
-	}
+			DRM_DEV_ERROR(adev->dev,
+				"VCN decode not responding, trying to reset the VCPU!!!\n");
+			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+				UVD_VCPU_CNTL__BLK_RST_MASK,
+				~UVD_VCPU_CNTL__BLK_RST_MASK);
+			mdelay(10);
+			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+				~UVD_VCPU_CNTL__BLK_RST_MASK);
+
+			mdelay(10);
+			r = -1;
+		}
 
-	/* enable master interrupt */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_MASTINT_EN),
-		UVD_MASTINT_EN__VCPU_EN_MASK,
-		~UVD_MASTINT_EN__VCPU_EN_MASK);
+		if (r) {
+			DRM_DEV_ERROR(adev->dev, "VCN decode not responding, giving up!!!\n");
+			return r;
+		}
 
-	/* clear the busy bit of VCN_STATUS */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_STATUS), 0,
-		~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
+		/* enable master interrupt */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN),
+			UVD_MASTINT_EN__VCPU_EN_MASK,
+			~UVD_MASTINT_EN__VCPU_EN_MASK);
 
-	ring = &adev->vcn.inst->ring_dec;
+		/* clear the busy bit of VCN_STATUS */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_STATUS), 0,
+			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
 
-	fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
+		ring = &adev->vcn.inst[i].ring_dec;
+		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
 
-	/* program the RB_BASE for ring buffer */
-	WREG32_SOC15(VCN, 0, regUVD_RB_BASE_LO4,
-		lower_32_bits(ring->gpu_addr));
-	WREG32_SOC15(VCN, 0, regUVD_RB_BASE_HI4,
-		upper_32_bits(ring->gpu_addr));
+		/* program the RB_BASE for ring buffer */
+		WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO4,
+			lower_32_bits(ring->gpu_addr));
+		WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI4,
+			upper_32_bits(ring->gpu_addr));
 
-	WREG32_SOC15(VCN, 0, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
+		WREG32_SOC15(VCN, i, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
 
-	/* resetting ring, fw should not check RB ring */
-	tmp = RREG32_SOC15(VCN, 0, regVCN_RB_ENABLE);
-	tmp &= ~(VCN_RB_ENABLE__RB4_EN_MASK);
-	WREG32_SOC15(VCN, 0, regVCN_RB_ENABLE, tmp);
+		/* resetting ring, fw should not check RB ring */
+		tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+		tmp &= ~(VCN_RB_ENABLE__RB4_EN_MASK);
+		WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
 
-	/* Initialize the ring buffer's read and write pointers */
-	WREG32_SOC15(VCN, 0, regUVD_RB_RPTR4, 0);
-	WREG32_SOC15(VCN, 0, regUVD_RB_WPTR4, 0);
+		/* Initialize the ring buffer's read and write pointers */
+		WREG32_SOC15(VCN, i, regUVD_RB_RPTR4, 0);
+		WREG32_SOC15(VCN, i, regUVD_RB_WPTR4, 0);
 
-	tmp = RREG32_SOC15(VCN, 0, regVCN_RB_ENABLE);
-	tmp |= VCN_RB_ENABLE__RB4_EN_MASK;
-	WREG32_SOC15(VCN, 0, regVCN_RB_ENABLE, tmp);
+		tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+		tmp |= VCN_RB_ENABLE__RB4_EN_MASK;
+		WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
 
-	ring->wptr = RREG32_SOC15(VCN, 0, regUVD_RB_WPTR4);
-	fw_shared->sq.queue_mode &= cpu_to_le32(~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF));
+		ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR4);
+		fw_shared->sq.queue_mode &=
+			cpu_to_le32(~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF));
 
+	}
 	return 0;
 }
 
@@ -905,32 +935,27 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev)
  * vcn_v4_0_3_stop_dpg_mode - VCN stop with dpg mode
  *
  * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
  *
  * Stop VCN block with dpg mode
  */
-static int vcn_v4_0_3_stop_dpg_mode(struct amdgpu_device *adev)
+static int vcn_v4_0_3_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t tmp;
 
 	/* Wait for power status to be 1 */
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_POWER_STATUS, 1,
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
 		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 
 	/* wait for read ptr to be equal to write ptr */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_RB_WPTR);
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_RB_RPTR, tmp, 0xFFFFFFFF);
-
-	tmp = RREG32_SOC15(VCN, 0, regUVD_RB_WPTR2);
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_RB_RPTR2, tmp, 0xFFFFFFFF);
-
-	tmp = RREG32_SOC15(VCN, 0, regUVD_RB_WPTR4);
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_RB_RPTR4, tmp, 0xFFFFFFFF);
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR4, tmp, 0xFFFFFFFF);
 
-	SOC15_WAIT_ON_RREG(VCN, 0, regUVD_POWER_STATUS, 1,
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
 		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
 
 	/* disable dynamic power gating mode */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_POWER_STATUS), 0,
+	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
 		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
 	return 0;
 }
@@ -945,65 +970,68 @@ static int vcn_v4_0_3_stop_dpg_mode(struct amdgpu_device *adev)
 static int vcn_v4_0_3_stop(struct amdgpu_device *adev)
 {
 	uint32_t tmp;
-	int r = 0;
+	int i, r = 0;
 
-	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-		r = vcn_v4_0_3_stop_dpg_mode(adev);
-		goto Done;
-	}
-
-	/* wait for vcn idle */
-	r = SOC15_WAIT_ON_RREG(VCN, 0, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
-	if (r)
-		return r;
-
-	tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
-		UVD_LMI_STATUS__READ_CLEAN_MASK |
-		UVD_LMI_STATUS__WRITE_CLEAN_MASK |
-		UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
-	r = SOC15_WAIT_ON_RREG(VCN, 0, regUVD_LMI_STATUS, tmp, tmp);
-	if (r)
-		return r;
-
-	/* stall UMC channel */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_LMI_CTRL2);
-	tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
-	WREG32_SOC15(VCN, 0, regUVD_LMI_CTRL2, tmp);
-	tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK|
-		UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
-	r = SOC15_WAIT_ON_RREG(VCN, 0, regUVD_LMI_STATUS, tmp, tmp);
-	if (r)
-		return r;
-
-	/* Unblock VCPU Register access */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_RB_ARB_CTRL),
-		UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
-		~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
-
-	/* release VCPU reset to boot */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL),
-		UVD_VCPU_CNTL__BLK_RST_MASK,
-		~UVD_VCPU_CNTL__BLK_RST_MASK);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+			r = vcn_v4_0_3_stop_dpg_mode(adev, i);
+			goto Done;
+		}
 
-	/* disable VCPU clock */
-	WREG32_P(SOC15_REG_OFFSET(VCN, 0, regUVD_VCPU_CNTL), 0,
-		~(UVD_VCPU_CNTL__CLK_EN_MASK));
+		/* wait for vcn idle */
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
+		if (r)
+			goto Done;
+
+		tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
+			UVD_LMI_STATUS__READ_CLEAN_MASK |
+			UVD_LMI_STATUS__WRITE_CLEAN_MASK |
+			UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		if (r)
+			goto Done;
+
+		/* stall UMC channel */
+		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL2);
+		tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
+		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL2, tmp);
+		tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK|
+			UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		if (r)
+			goto Done;
+
+		/* Unblock VCPU Register access */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL),
+			UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
+			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+
+		/* release VCPU reset to boot */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+			UVD_VCPU_CNTL__BLK_RST_MASK,
+			~UVD_VCPU_CNTL__BLK_RST_MASK);
 
-	/* reset LMI UMC/LMI/VCPU */
-	tmp = RREG32_SOC15(VCN, 0, regUVD_SOFT_RESET);
-	tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
-	WREG32_SOC15(VCN, 0, regUVD_SOFT_RESET, tmp);
+		/* disable VCPU clock */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+			~(UVD_VCPU_CNTL__CLK_EN_MASK));
 
-	tmp = RREG32_SOC15(VCN, 0, regUVD_SOFT_RESET);
-	tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
-	WREG32_SOC15(VCN, 0, regUVD_SOFT_RESET, tmp);
+		/* reset LMI UMC/LMI/VCPU */
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
 
-	/* clear VCN status */
-	WREG32_SOC15(VCN, 0, regUVD_STATUS, 0);
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
 
-	/* apply HW clock gating */
-	vcn_v4_0_3_enable_clock_gating(adev);
+		/* clear VCN status */
+		WREG32_SOC15(VCN, i, regUVD_STATUS, 0);
 
+		/* apply HW clock gating */
+		vcn_v4_0_3_enable_clock_gating(adev, i);
+	}
 Done:
 	if (adev->pm.dpm_enabled)
 		amdgpu_dpm_enable_uvd(adev, false);
@@ -1113,8 +1141,15 @@ static const struct amdgpu_ring_funcs vcn_v4_0_3_dec_sw_ring_vm_funcs = {
  */
 static void vcn_v4_0_3_set_dec_ring_funcs(struct amdgpu_device *adev)
 {
-	adev->vcn.inst->ring_dec.funcs = &vcn_v4_0_3_dec_sw_ring_vm_funcs;
-	adev->vcn.inst->ring_dec.me = 0;
+	int i;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		adev->vcn.inst[i].ring_dec.funcs = &vcn_v4_0_3_dec_sw_ring_vm_funcs;
+		adev->vcn.inst[i].ring_dec.me = i;
+		adev->vcn.inst[i].aid_id = i / adev->vcn.num_inst_per_aid;
+	}
 	DRM_DEV_INFO(adev->dev, "VCN decode(Software Ring) is enabled in VM mode\n");
 }
 
@@ -1128,8 +1163,15 @@ static void vcn_v4_0_3_set_dec_ring_funcs(struct amdgpu_device *adev)
 static bool vcn_v4_0_3_is_idle(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, ret = 1;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		ret &= (RREG32_SOC15(VCN, i, regUVD_STATUS) == UVD_STATUS__IDLE);
+	}
 
-	return (RREG32_SOC15(VCN, 0, regUVD_STATUS) == UVD_STATUS__IDLE);
+	return ret;
 }
 
 /**
@@ -1142,13 +1184,21 @@ static bool vcn_v4_0_3_is_idle(void *handle)
 static int vcn_v4_0_3_wait_for_idle(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, ret = 0;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		ret = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE,
+				UVD_STATUS__IDLE);
+		if (ret)
+			return ret;
+	}
 
-	return SOC15_WAIT_ON_RREG(VCN, 0, regUVD_STATUS, UVD_STATUS__IDLE,
-			UVD_STATUS__IDLE);
+	return ret;
 }
 
-/**
- * vcn_v4_0_3_set_clockgating_state - set VCN block clockgating state
+/* vcn_v4_0_3_set_clockgating_state - set VCN block clockgating state
  *
  * @handle: amdgpu_device pointer
  * @state: clock gating state
@@ -1160,15 +1210,19 @@ static int vcn_v4_0_3_set_clockgating_state(void *handle,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	int i;
 
-	if (enable) {
-		if (RREG32_SOC15(VCN, 0, regUVD_STATUS) != UVD_STATUS__IDLE)
-			return -EBUSY;
-		vcn_v4_0_3_enable_clock_gating(adev);
-	} else {
-		vcn_v4_0_3_disable_clock_gating(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		if (enable) {
+			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
+				return -EBUSY;
+			vcn_v4_0_3_enable_clock_gating(adev, i);
+		} else {
+			vcn_v4_0_3_disable_clock_gating(adev, i);
+		}
 	}
-
 	return 0;
 }
 
@@ -1231,11 +1285,15 @@ static int vcn_v4_0_3_process_interrupt(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry)
 {
+	uint32_t i;
+
+	i = node_id_to_phys_map[entry->node_id];
+
 	DRM_DEV_DEBUG(adev->dev, "IH: VCN TRAP\n");
 
 	switch (entry->src_id) {
 	case VCN_4_0__SRCID__UVD_TRAP:
-		amdgpu_fence_process(&adev->vcn.inst->ring_dec);
+		amdgpu_fence_process(&adev->vcn.inst[i].ring_dec);
 		break;
 	default:
 		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
@@ -1266,9 +1324,9 @@ static void vcn_v4_0_3_set_irq_funcs(struct amdgpu_device *adev)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
-		adev->vcn.inst->irq.num_types = 1;
-		adev->vcn.inst->irq.funcs = &vcn_v4_0_3_irq_funcs;
+		adev->vcn.inst->irq.num_types++;
 	}
+	adev->vcn.inst->irq.funcs = &vcn_v4_0_3_irq_funcs;
 }
 
 static const struct amd_ip_funcs vcn_v4_0_3_ip_funcs = {
-- 
2.39.2

