Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29356CAECF
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Mar 2023 21:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ACD10E729;
	Mon, 27 Mar 2023 19:36:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D653F10E145
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Mar 2023 19:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biwR5vBxD6lYHu5ohze/QVUDDuGJODEXMbO83X7P8cgsGXePWz2B74GIiYh2pmH/HvotVgu4+RFV1/y0eM49gMrCsM6tQI7UPbJqrEHHqg71rBycMGJ2nUBC/MQRaoOd4D2JQK5RIhD5PnGpdIzzhsDYVqIFf84r5m1TrNbxJ6/PJgjvPIb35DMQLJIGXk+3jpiFWIiTJsPvP9kpb8iW+SnVkCfrqqMqFB5VKp10ytZmXkA7RZpE6BPn8x1NgQb0OH/9d7zvRw9Nupx5Ek/NuSXE+njXAYi6H628BI4LNfMjrWgKo/Ae8iKeWtXQVtfKW6bxMpwMuFjgEMv9FsrgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWi4FZcJV/Vcn9+c0so9iEy/cwDc1GBoS52Aa92IDW0=;
 b=UQhVDUmTi1QoL0KDSaaKk4IR3eHzV4CcpudJbF+Jnz4xvVv2cUdlFcLiX6t1eiZ+7w8aiZw7DyWruZbvWWoB8LXXFVupwiLG4JOxz6lsGA1NB9xl7z+F7cOBxDTCtqrrF9ISTOwaIZCF6+OxufiSIWcSQVlrO+oMoVFtpV1lGG1eo2Rzx5QcfFLcV9O7In/4ljlfQGH/keUVVDwxfQwib/QkAj8r9uklTkRa2SVcGwdIZxC8MNyBxpQfSUzeVvjzDFkbgsGD8aWAhdxYsnCKmrVCJBw/aQzHi7BEz6G3JBOEdmlTNWL6dbS1Ogj/GLoQ5/jcC6S6J92APdNRi1QBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWi4FZcJV/Vcn9+c0so9iEy/cwDc1GBoS52Aa92IDW0=;
 b=5AiF6oZRHPEB1L3JLW/jgynpV2kA5Qb46DLEn57bk0DitHxlTmhbwqrIBRDa/S4SxYa9hQerd5CvNRg28Mh93pzUSdlrdu1QZpdVqBevb1K3njqAUQVVoOLKqiYtVginKDf4lSpeOafWM+7/Rts5dM6vPXZtwyAx4y8pXBQIcuE=
Received: from BN8PR15CA0066.namprd15.prod.outlook.com (2603:10b6:408:80::43)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Mon, 27 Mar
 2023 19:36:27 +0000
Received: from BL02EPF000100D0.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::c4) by BN8PR15CA0066.outlook.office365.com
 (2603:10b6:408:80::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 19:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000100D0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 19:36:26 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 14:36:25 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/28] drm/amdgpu: add multi-XCC initial support in
 gfx_v9_4_3.c
Date: Mon, 27 Mar 2023 15:35:43 -0400
Message-ID: <20230327193602.7901-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327193602.7901-1-alexander.deucher@amd.com>
References: <20230327193602.7901-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000100D0:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 949d7414-9949-40a1-cd49-08db2efa8e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8KL1kDBW6AqOnPY95vmeYU0gBdHZrlVp2k8f1IqQ2a4Z4v5vj5TUecyfviZMBnEAodXqXpq4yJ5xubggzAHVn+akwhDPDZEf+t02kByP+CuAF3b+slmEahO5DJjZkR3OVYvCNkw5X41V4B8B3l2/XgGRMNWWZjTuaIsjfopt5i95/rhtaL08DEoe6Awh1dkWCZEjfKvX8jm5w07BMla4csvIYOarNDAOLVmhO5dyFODUejqPTxnVIR1RYfDMUTxFwpHgAn6hlQkM8xBdNHbrDnt2en7JS0eET4GxyLqYD4m4lmmc4D6M55Hgl4NAMCnHQ29R3kHYCATQT4dTl2K6jSE0YxjquMkoz+CcPA+M8WbiUHu194lml0ZKI0pjXQsf285gU8rh0cGnGVFkihZlOaLm9XSPsIzBTQVb+hRx30dnPBAtwYvsLuPdSx45/XpNlQnrcdpZDk0An0weSJKa+3o6stwOAHHzKKdNaFY12txiW7xvoQzofxtf37UjuBorgbG3jo/M79o8ZAqKnoVg4X2ynVaeGOhD3RU1pv9l88wiG60rWYBsT0dGeGMCC7Df3lLQa4dumYEeY0znSesVPX3zBJlb5z2ybfapFUDBjozOIo8fhFhd/MFnDwfkTzug4jNNlNCKFqAdAzx7CSXPB6+W1YdLX2yWXdRuB/u+ewZZ1l4q3AwDy615zAgyrYClb/SbHqIcToj6jSJSCDx9Hf6jsoHrfQ/LBdSzHreXisvClrtMvS5sYsf1ARWZbyJEB77Ji+hNSRIHIjBqSOPApg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(7696005)(478600001)(1076003)(336012)(2616005)(426003)(83380400001)(26005)(6666004)(316002)(47076005)(186003)(16526019)(36860700001)(54906003)(70586007)(70206006)(8676002)(6916009)(4326008)(8936002)(81166007)(30864003)(5660300002)(2906002)(356005)(82740400003)(41300700001)(40460700003)(36756003)(40480700001)(82310400005)(86362001)(36900700001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:36:26.8654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 949d7414-9949-40a1-cd49-08db2efa8e6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000100D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Le Ma <le.ma@amd.com>

Each XCD needs to be initialized respectively. The major changes are:

  1. add iteration to do rlc/kiq/kcq init/fini for each xcd
  2. load rlc/mec microcode to each xcd
  3. add argument to specify xcc index in initialization functions

Signed-off-by: Le Ma <le.ma@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 721 +++++++++++++-----------
 1 file changed, 394 insertions(+), 327 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index da6a457b830f..160b7f358c88 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -182,7 +182,9 @@ static const struct kiq_pm4_funcs gfx_v9_4_3_kiq_pm4_funcs = {
 
 static void gfx_v9_4_3_set_kiq_pm4_funcs(struct amdgpu_device *adev)
 {
-	adev->gfx.kiq[0].pmf = &gfx_v9_4_3_kiq_pm4_funcs;
+	int i;
+	for (i = 0; i < adev->gfx.num_xcd; i++)
+		adev->gfx.kiq[i].pmf = &gfx_v9_4_3_kiq_pm4_funcs;
 }
 
 static void gfx_v9_4_3_init_golden_registers(struct amdgpu_device *adev)
@@ -505,7 +507,9 @@ static int gfx_v9_4_3_mec_init(struct amdgpu_device *adev)
 
 	const struct gfx_firmware_header_v1_0 *mec_hdr;
 
-	bitmap_zero(adev->gfx.mec_bitmap[0].queue_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
+	for (i = 0; i < adev->gfx.num_xcd; i++)
+		bitmap_zero(adev->gfx.mec_bitmap[i].queue_bitmap,
+			AMDGPU_MAX_COMPUTE_QUEUES);
 
 	/* take ownership of the relevant compute queues */
 	amdgpu_gfx_compute_queue_acquire(adev);
@@ -732,7 +736,7 @@ static int gfx_v9_4_3_gpu_early_init(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_4_3_compute_ring_init(struct amdgpu_device *adev, int ring_id,
-				      int mec, int pipe, int queue)
+				        int xcc_id, int mec, int pipe, int queue)
 {
 	unsigned irq_type;
 	struct amdgpu_ring *ring = &adev->gfx.compute_ring[ring_id];
@@ -741,6 +745,7 @@ static int gfx_v9_4_3_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 	ring = &adev->gfx.compute_ring[ring_id];
 
 	/* mec0 is me1 */
+	ring->xcc_id = xcc_id;
 	ring->me = mec + 1;
 	ring->pipe = pipe;
 	ring->queue = queue;
@@ -751,7 +756,8 @@ static int gfx_v9_4_3_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 	ring->eop_gpu_addr = adev->gfx.mec.hpd_eop_gpu_addr
 				+ (ring_id * GFX9_MEC_HPD_SIZE);
 	ring->vm_hub = AMDGPU_GFXHUB_0;
-	sprintf(ring->name, "comp_%d.%d.%d", ring->me, ring->pipe, ring->queue);
+	sprintf(ring->name, "comp_%d.%d.%d.%d",
+			ring->xcc_id, ring->me, ring->pipe, ring->queue);
 
 	irq_type = AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE0_EOP
 		+ ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
@@ -765,7 +771,7 @@ static int gfx_v9_4_3_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 
 static int gfx_v9_4_3_sw_init(void *handle)
 {
-	int i, j, k, r, ring_id;
+	int i, j, k, r, ring_id, xcc_id;
 	struct amdgpu_kiq *kiq;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
@@ -806,39 +812,45 @@ static int gfx_v9_4_3_sw_init(void *handle)
 
 	/* set up the compute queues - allocate horizontally across pipes */
 	ring_id = 0;
-	for (i = 0; i < adev->gfx.mec.num_mec; ++i) {
-		for (j = 0; j < adev->gfx.mec.num_queue_per_pipe; j++) {
-			for (k = 0; k < adev->gfx.mec.num_pipe_per_mec; k++) {
-				if (!amdgpu_gfx_is_mec_queue_enabled(adev, 0, i,
-								     k, j))
-					continue;
-
-				r = gfx_v9_4_3_compute_ring_init(adev,
-							       ring_id,
-							       i, k, j);
-				if (r)
-					return r;
-
-				ring_id++;
+	for (xcc_id = 0; xcc_id < adev->gfx.num_xcd; xcc_id++) {
+
+		for (i = 0; i < adev->gfx.mec.num_mec; ++i) {
+			for (j = 0; j < adev->gfx.mec.num_queue_per_pipe; j++) {
+				for (k = 0; k < adev->gfx.mec.num_pipe_per_mec;
+				     k++) {
+					if (!amdgpu_gfx_is_mec_queue_enabled(
+							adev, xcc_id, i, k, j))
+						continue;
+
+					r = gfx_v9_4_3_compute_ring_init(adev,
+								       ring_id,
+								       xcc_id,
+								       i, k, j);
+					if (r)
+						return r;
+
+					ring_id++;
+				}
 			}
 		}
-	}
 
-	r = amdgpu_gfx_kiq_init(adev, GFX9_MEC_HPD_SIZE, 0);
-	if (r) {
-		DRM_ERROR("Failed to init KIQ BOs!\n");
-		return r;
-	}
+		r = amdgpu_gfx_kiq_init(adev, GFX9_MEC_HPD_SIZE, xcc_id);
+		if (r) {
+			DRM_ERROR("Failed to init KIQ BOs!\n");
+			return r;
+		}
 
-	kiq = &adev->gfx.kiq[0];
-	r = amdgpu_gfx_kiq_init_ring(adev, &kiq->ring, &kiq->irq, 0);
-	if (r)
-		return r;
+		kiq = &adev->gfx.kiq[xcc_id];
+		r = amdgpu_gfx_kiq_init_ring(adev, &kiq->ring, &kiq->irq, xcc_id);
+		if (r)
+			return r;
 
-	/* create MQD for all compute queues as wel as KIQ for SRIOV case */
-	r = amdgpu_gfx_mqd_sw_init(adev, sizeof(struct v9_mqd_allocation), 0);
-	if (r)
-		return r;
+		/* create MQD for all compute queues as wel as KIQ for SRIOV case */
+		r = amdgpu_gfx_mqd_sw_init(adev,
+				sizeof(struct v9_mqd_allocation), xcc_id);
+		if (r)
+			return r;
+	}
 
 	r = gfx_v9_4_3_gpu_early_init(adev);
 	if (r)
@@ -852,12 +864,15 @@ static int gfx_v9_4_3_sw_fini(void *handle)
 	int i;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	for (i = 0; i < adev->gfx.num_compute_rings; i++)
+	for (i = 0; i < adev->gfx.num_compute_rings *
+		adev->gfx.num_xcd; i++)
 		amdgpu_ring_fini(&adev->gfx.compute_ring[i]);
 
-	amdgpu_gfx_mqd_sw_fini(adev, 0);
-	amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
-	amdgpu_gfx_kiq_fini(adev, 0);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		amdgpu_gfx_mqd_sw_fini(adev, i);
+		amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[i].ring);
+		amdgpu_gfx_kiq_fini(adev, i);
+	}
 
 	gfx_v9_4_3_mec_fini(adev);
 	amdgpu_bo_unref(&adev->gfx.rlc.clear_state_obj);
@@ -882,7 +897,7 @@ static u32 gfx_v9_4_3_get_rb_active_bitmap(struct amdgpu_device *adev)
 	return (~data) & mask;
 }
 
-static void gfx_v9_4_3_setup_rb(struct amdgpu_device *adev)
+static void gfx_v9_4_3_setup_rb(struct amdgpu_device *adev, int xcc_id)
 {
 	int i, j;
 	u32 data;
@@ -907,7 +922,7 @@ static void gfx_v9_4_3_setup_rb(struct amdgpu_device *adev)
 }
 
 #define DEFAULT_SH_MEM_BASES	(0x6000)
-static void gfx_v9_4_3_init_compute_vmid(struct amdgpu_device *adev)
+static void gfx_v9_4_3_init_compute_vmid(struct amdgpu_device *adev, int xcc_id)
 {
 	int i;
 	uint32_t sh_mem_config;
@@ -927,25 +942,25 @@ static void gfx_v9_4_3_init_compute_vmid(struct amdgpu_device *adev)
 
 	mutex_lock(&adev->srbm_mutex);
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
-		soc15_grbm_select(adev, 0, 0, 0, i, 0);
+		soc15_grbm_select(adev, 0, 0, 0, i, xcc_id);
 		/* CP and shaders */
-		WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, sh_mem_config);
-		WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, sh_mem_bases);
+		WREG32_SOC15_RLC(GC, xcc_id, regSH_MEM_CONFIG, sh_mem_config);
+		WREG32_SOC15_RLC(GC, xcc_id, regSH_MEM_BASES, sh_mem_bases);
 	}
-	soc15_grbm_select(adev, 0, 0, 0, 0, 0);
+	soc15_grbm_select(adev, 0, 0, 0, 0, xcc_id);
 	mutex_unlock(&adev->srbm_mutex);
 
 	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
 	   acccess. These should be enabled by FW for target VMIDs. */
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_GWS_VMID0, i, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_OA_VMID0, i, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_VMID0_BASE, 2 * i, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_VMID0_SIZE, 2 * i, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_GWS_VMID0, i, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_OA_VMID0, i, 0);
 	}
 }
 
-static void gfx_v9_4_3_init_gds_vmid(struct amdgpu_device *adev)
+static void gfx_v9_4_3_init_gds_vmid(struct amdgpu_device *adev, int xcc_id)
 {
 	int vmid;
 
@@ -956,21 +971,23 @@ static void gfx_v9_4_3_init_gds_vmid(struct amdgpu_device *adev)
 	 * access so that HWS firmware can save/restore entries.
 	 */
 	for (vmid = 1; vmid < AMDGPU_NUM_VMID; vmid++) {
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * vmid, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * vmid, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_GWS_VMID0, vmid, 0);
-		WREG32_SOC15_OFFSET(GC, 0, regGDS_OA_VMID0, vmid, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_VMID0_BASE, 2 * vmid, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_VMID0_SIZE, 2 * vmid, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_GWS_VMID0, vmid, 0);
+		WREG32_SOC15_OFFSET(GC, xcc_id, regGDS_OA_VMID0, vmid, 0);
 	}
 }
 
 static void gfx_v9_4_3_constants_init(struct amdgpu_device *adev)
 {
 	u32 tmp;
-	int i;
+	int i, j;
 
-	WREG32_FIELD15_PREREG(GC, 0, GRBM_CNTL, READ_TIMEOUT, 0xff);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		WREG32_FIELD15_PREREG(GC, i, GRBM_CNTL, READ_TIMEOUT, 0xff);
+		gfx_v9_4_3_setup_rb(adev, i);
+	}
 
-	gfx_v9_4_3_setup_rb(adev);
 	gfx_v9_4_3_get_cu_info(adev, &adev->gfx.cu_info);
 	adev->gfx.config.db_debug2 = RREG32_SOC15(GC, 0, regDB_DEBUG2);
 
@@ -978,63 +995,68 @@ static void gfx_v9_4_3_constants_init(struct amdgpu_device *adev)
 	/* where to put LDS, scratch, GPUVM in FSA64 space */
 	mutex_lock(&adev->srbm_mutex);
 	for (i = 0; i < adev->vm_manager.id_mgr[AMDGPU_GFXHUB_0].num_ids; i++) {
-		soc15_grbm_select(adev, 0, 0, 0, i, 0);
-		/* CP and shaders */
-		if (i == 0) {
-			tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
-					    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
-			tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
-					    !!adev->gmc.noretry);
-			WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, tmp);
-			WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, 0);
-		} else {
-			tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
-					    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
-			tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
-					    !!adev->gmc.noretry);
-			WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, tmp);
-			tmp = REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BASE,
-				(adev->gmc.private_aperture_start >> 48));
-			tmp = REG_SET_FIELD(tmp, SH_MEM_BASES, SHARED_BASE,
-				(adev->gmc.shared_aperture_start >> 48));
-			WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, tmp);
+		for (j = 0; j < adev->gfx.num_xcd; j++) {
+			soc15_grbm_select(adev, 0, 0, 0, i, j);
+			/* CP and shaders */
+			if (i == 0) {
+				tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
+						    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
+				tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
+						    !!adev->gmc.noretry);
+				WREG32_SOC15_RLC(GC, j, regSH_MEM_CONFIG, tmp);
+				WREG32_SOC15_RLC(GC, j, regSH_MEM_BASES, 0);
+			} else {
+				tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
+						    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
+				tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
+						    !!adev->gmc.noretry);
+				WREG32_SOC15_RLC(GC, j, regSH_MEM_CONFIG, tmp);
+				tmp = REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BASE,
+					(adev->gmc.private_aperture_start >> 48));
+				tmp = REG_SET_FIELD(tmp, SH_MEM_BASES, SHARED_BASE,
+					(adev->gmc.shared_aperture_start >> 48));
+				WREG32_SOC15_RLC(GC, j, regSH_MEM_BASES, tmp);
+			}
 		}
 	}
 	soc15_grbm_select(adev, 0, 0, 0, 0, 0);
 
 	mutex_unlock(&adev->srbm_mutex);
 
-	gfx_v9_4_3_init_compute_vmid(adev);
-	gfx_v9_4_3_init_gds_vmid(adev);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		gfx_v9_4_3_init_compute_vmid(adev, i);
+		gfx_v9_4_3_init_gds_vmid(adev, i);
+	}
 }
 
-static void gfx_v9_4_3_enable_save_restore_machine(struct amdgpu_device *adev)
+static void gfx_v9_4_3_enable_save_restore_machine(struct amdgpu_device *adev,
+						   int xcc_id)
 {
-	WREG32_FIELD15_PREREG(GC, 0, RLC_SRM_CNTL, SRM_ENABLE, 1);
+	WREG32_FIELD15_PREREG(GC, xcc_id, RLC_SRM_CNTL, SRM_ENABLE, 1);
 }
 
-static void gfx_v9_4_3_init_csb(struct amdgpu_device *adev)
+static void gfx_v9_4_3_init_csb(struct amdgpu_device *adev, int xcc_id)
 {
 	adev->gfx.rlc.funcs->get_csb_buffer(adev, adev->gfx.rlc.cs_ptr);
 	/* csib */
-	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_ADDR_HI),
+	WREG32_RLC(SOC15_REG_OFFSET(GC, xcc_id, regRLC_CSIB_ADDR_HI),
 			adev->gfx.rlc.clear_state_gpu_addr >> 32);
-	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_ADDR_LO),
+	WREG32_RLC(SOC15_REG_OFFSET(GC, xcc_id, regRLC_CSIB_ADDR_LO),
 			adev->gfx.rlc.clear_state_gpu_addr & 0xfffffffc);
-	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_LENGTH),
+	WREG32_RLC(SOC15_REG_OFFSET(GC, xcc_id, regRLC_CSIB_LENGTH),
 			adev->gfx.rlc.clear_state_size);
 }
 
-static void gfx_v9_4_3_init_pg(struct amdgpu_device *adev)
+static void gfx_v9_4_3_init_pg(struct amdgpu_device *adev, int xcc_id)
 {
-	gfx_v9_4_3_init_csb(adev);
+	gfx_v9_4_3_init_csb(adev, xcc_id);
 
 	/*
 	 * Rlc save restore list is workable since v2_1.
 	 * And it's needed by gfxoff feature.
 	 */
 	if (adev->gfx.rlc.is_rlc_v2_1)
-		gfx_v9_4_3_enable_save_restore_machine(adev);
+		gfx_v9_4_3_enable_save_restore_machine(adev, xcc_id);
 
 	if (adev->pg_flags & (AMD_PG_SUPPORT_GFX_PG |
 			      AMD_PG_SUPPORT_GFX_SMG |
@@ -1116,7 +1138,8 @@ static int gfx_v9_4_3_rlc_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-static void gfx_v9_4_3_wait_for_rlc_serdes(struct amdgpu_device *adev)
+static void gfx_v9_4_3_wait_for_rlc_serdes(struct amdgpu_device *adev,
+					   int xcc_id)
 {
 	u32 i, j, k;
 	u32 mask;
@@ -1172,17 +1195,25 @@ static void gfx_v9_4_3_enable_gui_idle_interrupt(struct amdgpu_device *adev,
 
 static void gfx_v9_4_3_rlc_stop(struct amdgpu_device *adev)
 {
-	WREG32_FIELD15_PREREG(GC, 0, RLC_CNTL, RLC_ENABLE_F32, 0);
-	gfx_v9_4_3_enable_gui_idle_interrupt(adev, false);
-	gfx_v9_4_3_wait_for_rlc_serdes(adev);
+	int i;
+
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		WREG32_FIELD15_PREREG(GC, i, RLC_CNTL, RLC_ENABLE_F32, 0);
+		gfx_v9_4_3_enable_gui_idle_interrupt(adev, false);
+		gfx_v9_4_3_wait_for_rlc_serdes(adev, i);
+	}
 }
 
 static void gfx_v9_4_3_rlc_reset(struct amdgpu_device *adev)
 {
-	WREG32_FIELD15_PREREG(GC, 0, GRBM_SOFT_RESET, SOFT_RESET_RLC, 1);
-	udelay(50);
-	WREG32_FIELD15_PREREG(GC, 0, GRBM_SOFT_RESET, SOFT_RESET_RLC, 0);
-	udelay(50);
+	int i;
+
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		WREG32_FIELD15_PREREG(GC, i, GRBM_SOFT_RESET, SOFT_RESET_RLC, 1);
+		udelay(50);
+		WREG32_FIELD15_PREREG(GC, i, GRBM_SOFT_RESET, SOFT_RESET_RLC, 0);
+		udelay(50);
+	}
 }
 
 static void gfx_v9_4_3_rlc_start(struct amdgpu_device *adev)
@@ -1190,35 +1221,38 @@ static void gfx_v9_4_3_rlc_start(struct amdgpu_device *adev)
 #ifdef AMDGPU_RLC_DEBUG_RETRY
 	u32 rlc_ucode_ver;
 #endif
+	int i;
 
-	WREG32_FIELD15_PREREG(GC, 0, RLC_CNTL, RLC_ENABLE_F32, 1);
-	udelay(50);
-
-	/* carrizo do enable cp interrupt after cp inited */
-	if (!(adev->flags & AMD_IS_APU)) {
-		gfx_v9_4_3_enable_gui_idle_interrupt(adev, true);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		WREG32_FIELD15_PREREG(GC, i, RLC_CNTL, RLC_ENABLE_F32, 1);
 		udelay(50);
-	}
+
+		/* carrizo do enable cp interrupt after cp inited */
+		if (!(adev->flags & AMD_IS_APU)) {
+			gfx_v9_4_3_enable_gui_idle_interrupt(adev, true);
+			udelay(50);
+		}
 
 #ifdef AMDGPU_RLC_DEBUG_RETRY
-	/* RLC_GPM_GENERAL_6 : RLC Ucode version */
-	rlc_ucode_ver = RREG32_SOC15(GC, 0, regRLC_GPM_GENERAL_6);
-	if(rlc_ucode_ver == 0x108) {
-		dev_info(adev->dev,
-			 "Using rlc debug ucode. regRLC_GPM_GENERAL_6 ==0x08%x / fw_ver == %i \n",
-			 rlc_ucode_ver, adev->gfx.rlc_fw_version);
-		/* RLC_GPM_TIMER_INT_3 : Timer interval in RefCLK cycles,
-		 * default is 0x9C4 to create a 100us interval */
-		WREG32_SOC15(GC, 0, regRLC_GPM_TIMER_INT_3, 0x9C4);
-		/* RLC_GPM_GENERAL_12 : Minimum gap between wptr and rptr
-		 * to disable the page fault retry interrupts, default is
-		 * 0x100 (256) */
-		WREG32_SOC15(GC, 0, regRLC_GPM_GENERAL_12, 0x100);
-	}
+		/* RLC_GPM_GENERAL_6 : RLC Ucode version */
+		rlc_ucode_ver = RREG32_SOC15(GC, i, regRLC_GPM_GENERAL_6);
+		if(rlc_ucode_ver == 0x108) {
+			dev_info(adev->dev,
+				 "Using rlc debug ucode. regRLC_GPM_GENERAL_6 ==0x08%x / fw_ver == %i \n",
+				 rlc_ucode_ver, adev->gfx.rlc_fw_version);
+			/* RLC_GPM_TIMER_INT_3 : Timer interval in RefCLK cycles,
+			 * default is 0x9C4 to create a 100us interval */
+			WREG32_SOC15(GC, i, regRLC_GPM_TIMER_INT_3, 0x9C4);
+			/* RLC_GPM_GENERAL_12 : Minimum gap between wptr and rptr
+			 * to disable the page fault retry interrupts, default is
+			 * 0x100 (256) */
+			WREG32_SOC15(GC, i, regRLC_GPM_GENERAL_12, 0x100);
+		}
 #endif
+	}
 }
 
-static int gfx_v9_4_3_rlc_load_microcode(struct amdgpu_device *adev)
+static int gfx_v9_4_3_rlc_load_microcode(struct amdgpu_device *adev, int xcc_id)
 {
 	const struct rlc_firmware_header_v2_0 *hdr;
 	const __le32 *fw_data;
@@ -1234,36 +1268,38 @@ static int gfx_v9_4_3_rlc_load_microcode(struct amdgpu_device *adev)
 			   le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 	fw_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
 
-	WREG32_SOC15(GC, 0, regRLC_GPM_UCODE_ADDR,
+	WREG32_SOC15(GC, xcc_id, regRLC_GPM_UCODE_ADDR,
 			RLCG_UCODE_LOADING_START_ADDRESS);
 	for (i = 0; i < fw_size; i++) {
 		if (amdgpu_emu_mode == 1 && i % 100 == 0) {
 			dev_info(adev->dev, "Write RLC ucode data %u DWs\n", i);
 			msleep(1);
 		}
-		WREG32_SOC15(GC, 0, regRLC_GPM_UCODE_DATA, le32_to_cpup(fw_data++));
+		WREG32_SOC15(GC, xcc_id, regRLC_GPM_UCODE_DATA, le32_to_cpup(fw_data++));
 	}
-	WREG32_SOC15(GC, 0, regRLC_GPM_UCODE_ADDR, adev->gfx.rlc_fw_version);
+	WREG32_SOC15(GC, xcc_id, regRLC_GPM_UCODE_ADDR, adev->gfx.rlc_fw_version);
 
 	return 0;
 }
 
 static int gfx_v9_4_3_rlc_resume(struct amdgpu_device *adev)
 {
-	int r;
+	int r, i;
 
 	adev->gfx.rlc.funcs->stop(adev);
 
-	/* disable CG */
-	WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, 0);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		/* disable CG */
+		WREG32_SOC15(GC, i, regRLC_CGCG_CGLS_CTRL, 0);
 
-	gfx_v9_4_3_init_pg(adev);
+		gfx_v9_4_3_init_pg(adev, i);
 
-	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
-		/* legacy rlc firmware loading */
-		r = gfx_v9_4_3_rlc_load_microcode(adev);
-		if (r)
-			return r;
+		if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
+			/* legacy rlc firmware loading */
+			r = gfx_v9_4_3_rlc_load_microcode(adev, i);
+			if (r)
+				return r;
+		}
 	}
 
 	adev->gfx.rlc.funcs->start(adev);
@@ -1271,7 +1307,8 @@ static int gfx_v9_4_3_rlc_resume(struct amdgpu_device *adev)
 	return 0;
 }
 
-static void gfx_v9_4_3_update_spm_vmid(struct amdgpu_device *adev, unsigned vmid)
+static void gfx_v9_4_3_update_spm_vmid(struct amdgpu_device *adev,
+				       unsigned vmid)
 {
 	u32 reg, data;
 
@@ -1324,19 +1361,21 @@ static bool gfx_v9_4_3_is_rlcg_access_range(struct amdgpu_device *adev, u32 offs
 					ARRAY_SIZE(rlcg_access_gc_9_4_3));
 }
 
-static void gfx_v9_4_3_cp_compute_enable(struct amdgpu_device *adev, bool enable)
+static void gfx_v9_4_3_cp_compute_enable(struct amdgpu_device *adev,
+					 bool enable, int xcc_id)
 {
 	if (enable) {
-		WREG32_SOC15_RLC(GC, 0, regCP_MEC_CNTL, 0);
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_MEC_CNTL, 0);
 	} else {
-		WREG32_SOC15_RLC(GC, 0, regCP_MEC_CNTL,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_MEC_CNTL,
 			(CP_MEC_CNTL__MEC_ME1_HALT_MASK | CP_MEC_CNTL__MEC_ME2_HALT_MASK));
-		adev->gfx.kiq[0].ring.sched.ready = false;
+		adev->gfx.kiq[xcc_id].ring.sched.ready = false;
 	}
 	udelay(50);
 }
 
-static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev)
+static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev,
+						int xcc_id)
 {
 	const struct gfx_firmware_header_v1_0 *mec_hdr;
 	const __le32 *fw_data;
@@ -1348,7 +1387,7 @@ static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev)
 	if (!adev->gfx.mec_fw)
 		return -EINVAL;
 
-	gfx_v9_4_3_cp_compute_enable(adev, false);
+	gfx_v9_4_3_cp_compute_enable(adev, false, xcc_id);
 
 	mec_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->data;
 	amdgpu_ucode_print_gfx_hdr(&mec_hdr->header);
@@ -1359,17 +1398,17 @@ static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev)
 	tmp = 0;
 	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, VMID, 0);
 	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, CACHE_POLICY, 0);
-	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_CNTL, tmp);
+	WREG32_SOC15(GC, xcc_id, regCP_CPC_IC_BASE_CNTL, tmp);
 
-	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_LO,
+	WREG32_SOC15(GC, xcc_id, regCP_CPC_IC_BASE_LO,
 		adev->gfx.mec.mec_fw_gpu_addr & 0xFFFFF000);
-	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_HI,
+	WREG32_SOC15(GC, xcc_id, regCP_CPC_IC_BASE_HI,
 		upper_32_bits(adev->gfx.mec.mec_fw_gpu_addr));
 
 	mec_ucode_addr_offset =
-		SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME1_UCODE_ADDR);
+		SOC15_REG_OFFSET(GC, xcc_id, regCP_MEC_ME1_UCODE_ADDR);
 	mec_ucode_data_offset =
-		SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME1_UCODE_DATA);
+		SOC15_REG_OFFSET(GC, xcc_id, regCP_MEC_ME1_UCODE_DATA);
 
 	/* MEC1 */
 	WREG32(mec_ucode_addr_offset, mec_hdr->jt_offset);
@@ -1384,18 +1423,18 @@ static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev)
 }
 
 /* KIQ functions */
-static void gfx_v9_4_3_kiq_setting(struct amdgpu_ring *ring)
+static void gfx_v9_4_3_kiq_setting(struct amdgpu_ring *ring, int xcc_id)
 {
 	uint32_t tmp;
 	struct amdgpu_device *adev = ring->adev;
 
 	/* tell RLC which is KIQ queue */
-	tmp = RREG32_SOC15(GC, 0, regRLC_CP_SCHEDULERS);
+	tmp = RREG32_SOC15(GC, xcc_id, regRLC_CP_SCHEDULERS);
 	tmp &= 0xffffff00;
 	tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
-	WREG32_SOC15_RLC(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+	WREG32_SOC15_RLC(GC, xcc_id, regRLC_CP_SCHEDULERS, tmp);
 	tmp |= 0x80;
-	WREG32_SOC15_RLC(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+	WREG32_SOC15_RLC(GC, xcc_id, regRLC_CP_SCHEDULERS, tmp);
 }
 
 static void gfx_v9_4_3_mqd_set_priority(struct amdgpu_ring *ring, struct v9_mqd *mqd)
@@ -1539,123 +1578,123 @@ static int gfx_v9_4_3_mqd_init(struct amdgpu_ring *ring)
 	return 0;
 }
 
-static int gfx_v9_4_3_kiq_init_register(struct amdgpu_ring *ring)
+static int gfx_v9_4_3_kiq_init_register(struct amdgpu_ring *ring, int xcc_id)
 {
 	struct amdgpu_device *adev = ring->adev;
 	struct v9_mqd *mqd = ring->mqd_ptr;
 	int j;
 
 	/* disable wptr polling */
-	WREG32_FIELD15_PREREG(GC, 0, CP_PQ_WPTR_POLL_CNTL, EN, 0);
+	WREG32_FIELD15_PREREG(GC, xcc_id, CP_PQ_WPTR_POLL_CNTL, EN, 0);
 
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_BASE_ADDR,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_EOP_BASE_ADDR,
 	       mqd->cp_hqd_eop_base_addr_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_BASE_ADDR_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_EOP_BASE_ADDR_HI,
 	       mqd->cp_hqd_eop_base_addr_hi);
 
 	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_CONTROL,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_EOP_CONTROL,
 	       mqd->cp_hqd_eop_control);
 
 	/* enable doorbell? */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_DOORBELL_CONTROL,
 	       mqd->cp_hqd_pq_doorbell_control);
 
 	/* disable the queue if it's active */
-	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+	if (RREG32_SOC15(GC, xcc_id, regCP_HQD_ACTIVE) & 1) {
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_DEQUEUE_REQUEST, 1);
 		for (j = 0; j < adev->usec_timeout; j++) {
-			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+			if (!(RREG32_SOC15(GC, xcc_id, regCP_HQD_ACTIVE) & 1))
 				break;
 			udelay(1);
 		}
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_DEQUEUE_REQUEST,
 		       mqd->cp_hqd_dequeue_request);
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_RPTR,
 		       mqd->cp_hqd_pq_rptr);
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_LO,
 		       mqd->cp_hqd_pq_wptr_lo);
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_HI,
 		       mqd->cp_hqd_pq_wptr_hi);
 	}
 
 	/* set the pointer to the MQD */
-	WREG32_SOC15_RLC(GC, 0, regCP_MQD_BASE_ADDR,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_MQD_BASE_ADDR,
 	       mqd->cp_mqd_base_addr_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_MQD_BASE_ADDR_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_MQD_BASE_ADDR_HI,
 	       mqd->cp_mqd_base_addr_hi);
 
 	/* set MQD vmid to 0 */
-	WREG32_SOC15_RLC(GC, 0, regCP_MQD_CONTROL,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_MQD_CONTROL,
 	       mqd->cp_mqd_control);
 
 	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_BASE,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_BASE,
 	       mqd->cp_hqd_pq_base_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_BASE_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_BASE_HI,
 	       mqd->cp_hqd_pq_base_hi);
 
 	/* set up the HQD, this is similar to CP_RB0_CNTL */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_CONTROL,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_CONTROL,
 	       mqd->cp_hqd_pq_control);
 
 	/* set the wb address whether it's enabled or not */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_RPTR_REPORT_ADDR,
 				mqd->cp_hqd_pq_rptr_report_addr_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
 				mqd->cp_hqd_pq_rptr_report_addr_hi);
 
 	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_POLL_ADDR,
 	       mqd->cp_hqd_pq_wptr_poll_addr_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_POLL_ADDR_HI,
 	       mqd->cp_hqd_pq_wptr_poll_addr_hi);
 
 	/* enable the doorbell if requested */
 	if (ring->use_doorbell) {
-		WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_LOWER,
+		WREG32_SOC15(GC, xcc_id, regCP_MEC_DOORBELL_RANGE_LOWER,
 					(adev->doorbell_index.kiq * 2) << 2);
-		WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_UPPER,
+		WREG32_SOC15(GC, xcc_id, regCP_MEC_DOORBELL_RANGE_UPPER,
 				(adev->doorbell_index.userqueue_end * 2) << 2);
 	}
 
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_DOORBELL_CONTROL,
 	       mqd->cp_hqd_pq_doorbell_control);
 
 	/* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_LO,
 	       mqd->cp_hqd_pq_wptr_lo);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_HI,
 	       mqd->cp_hqd_pq_wptr_hi);
 
 	/* set the vmid for the queue */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_VMID, mqd->cp_hqd_vmid);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_VMID, mqd->cp_hqd_vmid);
 
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PERSISTENT_STATE,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PERSISTENT_STATE,
 	       mqd->cp_hqd_persistent_state);
 
 	/* activate the queue */
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_ACTIVE,
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_ACTIVE,
 	       mqd->cp_hqd_active);
 
 	if (ring->use_doorbell)
-		WREG32_FIELD15_PREREG(GC, 0, CP_PQ_STATUS, DOORBELL_ENABLE, 1);
+		WREG32_FIELD15_PREREG(GC, xcc_id, CP_PQ_STATUS, DOORBELL_ENABLE, 1);
 
 	return 0;
 }
 
-static int gfx_v9_4_3_kiq_fini_register(struct amdgpu_ring *ring)
+static int gfx_v9_4_3_kiq_fini_register(struct amdgpu_ring *ring, int xcc_id)
 {
 	struct amdgpu_device *adev = ring->adev;
 	int j;
 
 	/* disable the queue if it's active */
-	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+	if (RREG32_SOC15(GC, xcc_id, regCP_HQD_ACTIVE) & 1) {
 
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_DEQUEUE_REQUEST, 1);
 
 		for (j = 0; j < adev->usec_timeout; j++) {
-			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+			if (!(RREG32_SOC15(GC, xcc_id, regCP_HQD_ACTIVE) & 1))
 				break;
 			udelay(1);
 		}
@@ -1664,72 +1703,71 @@ static int gfx_v9_4_3_kiq_fini_register(struct amdgpu_ring *ring)
 			DRM_DEBUG("KIQ dequeue request failed.\n");
 
 			/* Manual disable if dequeue request times out */
-			WREG32_SOC15_RLC(GC, 0, regCP_HQD_ACTIVE, 0);
+			WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_ACTIVE, 0);
 		}
 
-		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST,
+		WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_DEQUEUE_REQUEST,
 		      0);
 	}
 
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_IQ_TIMER, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_IB_CONTROL, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PERSISTENT_STATE, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0x40000000);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI, 0);
-	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_IQ_TIMER, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_IB_CONTROL, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PERSISTENT_STATE, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_DOORBELL_CONTROL, 0x40000000);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_RPTR, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_HI, 0);
+	WREG32_SOC15_RLC(GC, xcc_id, regCP_HQD_PQ_WPTR_LO, 0);
 
 	return 0;
 }
 
-static int gfx_v9_4_3_kiq_init_queue(struct amdgpu_ring *ring)
+static int gfx_v9_4_3_kiq_init_queue(struct amdgpu_ring *ring, int xcc_id)
 {
 	struct amdgpu_device *adev = ring->adev;
 	struct v9_mqd *mqd = ring->mqd_ptr;
 	struct v9_mqd *tmp_mqd;
 
-	gfx_v9_4_3_kiq_setting(ring);
+	gfx_v9_4_3_kiq_setting(ring, xcc_id);
 
 	/* GPU could be in bad state during probe, driver trigger the reset
 	 * after load the SMU, in this case , the mqd is not be initialized.
 	 * driver need to re-init the mqd.
 	 * check mqd->cp_hqd_pq_control since this value should not be 0
 	 */
-	tmp_mqd = (struct v9_mqd *)adev->gfx.kiq[0].mqd_backup;
+	tmp_mqd = (struct v9_mqd *)adev->gfx.kiq[xcc_id].mqd_backup;
 	if (amdgpu_in_reset(adev) && tmp_mqd->cp_hqd_pq_control){
 		/* for GPU_RESET case , reset MQD to a clean status */
-		if (adev->gfx.kiq[0].mqd_backup)
-			memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(struct v9_mqd_allocation));
+		if (adev->gfx.kiq[xcc_id].mqd_backup)
+			memcpy(mqd, adev->gfx.kiq[xcc_id].mqd_backup, sizeof(struct v9_mqd_allocation));
 
 		/* reset ring buffer */
 		ring->wptr = 0;
 		amdgpu_ring_clear_ring(ring);
-
 		mutex_lock(&adev->srbm_mutex);
-		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, 0);
-		gfx_v9_4_3_kiq_init_register(ring);
-		soc15_grbm_select(adev, 0, 0, 0, 0, 0);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, xcc_id);
+		gfx_v9_4_3_kiq_init_register(ring, xcc_id);
+		soc15_grbm_select(adev, 0, 0, 0, 0, xcc_id);
 		mutex_unlock(&adev->srbm_mutex);
 	} else {
 		memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
 		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
 		((struct v9_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
 		mutex_lock(&adev->srbm_mutex);
-		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, 0);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, xcc_id);
 		gfx_v9_4_3_mqd_init(ring);
-		gfx_v9_4_3_kiq_init_register(ring);
-		soc15_grbm_select(adev, 0, 0, 0, 0, 0);
+		gfx_v9_4_3_kiq_init_register(ring, xcc_id);
+		soc15_grbm_select(adev, 0, 0, 0, 0, xcc_id);
 		mutex_unlock(&adev->srbm_mutex);
 
-		if (adev->gfx.kiq[0].mqd_backup)
-			memcpy(adev->gfx.kiq[0].mqd_backup, mqd, sizeof(struct v9_mqd_allocation));
+		if (adev->gfx.kiq[xcc_id].mqd_backup)
+			memcpy(adev->gfx.kiq[xcc_id].mqd_backup, mqd, sizeof(struct v9_mqd_allocation));
 	}
 
 	return 0;
 }
 
-static int gfx_v9_4_3_kcq_init_queue(struct amdgpu_ring *ring)
+static int gfx_v9_4_3_kcq_init_queue(struct amdgpu_ring *ring, int xcc_id)
 {
 	struct amdgpu_device *adev = ring->adev;
 	struct v9_mqd *mqd = ring->mqd_ptr;
@@ -1747,9 +1785,9 @@ static int gfx_v9_4_3_kcq_init_queue(struct amdgpu_ring *ring)
 		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
 		((struct v9_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
 		mutex_lock(&adev->srbm_mutex);
-		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, 0);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0, xcc_id);
 		gfx_v9_4_3_mqd_init(ring);
-		soc15_grbm_select(adev, 0, 0, 0, 0, 0);
+		soc15_grbm_select(adev, 0, 0, 0, 0, xcc_id);
 		mutex_unlock(&adev->srbm_mutex);
 
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
@@ -1770,12 +1808,12 @@ static int gfx_v9_4_3_kcq_init_queue(struct amdgpu_ring *ring)
 	return 0;
 }
 
-static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev)
+static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev, int xcc_id)
 {
 	struct amdgpu_ring *ring;
 	int r;
 
-	ring = &adev->gfx.kiq[0].ring;
+	ring = &adev->gfx.kiq[xcc_id].ring;
 
 	r = amdgpu_bo_reserve(ring->mqd_obj, false);
 	if (unlikely(r != 0))
@@ -1785,7 +1823,7 @@ static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev)
 	if (unlikely(r != 0))
 		return r;
 
-	gfx_v9_4_3_kiq_init_queue(ring);
+	gfx_v9_4_3_kiq_init_queue(ring, xcc_id);
 	amdgpu_bo_kunmap(ring->mqd_obj);
 	ring->mqd_ptr = NULL;
 	amdgpu_bo_unreserve(ring->mqd_obj);
@@ -1793,22 +1831,22 @@ static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int gfx_v9_4_3_kcq_resume(struct amdgpu_device *adev)
+static int gfx_v9_4_3_kcq_resume(struct amdgpu_device *adev, int xcc_id)
 {
 	struct amdgpu_ring *ring = NULL;
 	int r = 0, i;
 
-	gfx_v9_4_3_cp_compute_enable(adev, true);
+	gfx_v9_4_3_cp_compute_enable(adev, true, xcc_id);
 
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		ring = &adev->gfx.compute_ring[i];
+		ring = &adev->gfx.compute_ring[i + xcc_id * adev->gfx.num_compute_rings];
 
 		r = amdgpu_bo_reserve(ring->mqd_obj, false);
 		if (unlikely(r != 0))
 			goto done;
 		r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
 		if (!r) {
-			r = gfx_v9_4_3_kcq_init_queue(ring);
+			r = gfx_v9_4_3_kcq_init_queue(ring, xcc_id);
 			amdgpu_bo_kunmap(ring->mqd_obj);
 			ring->mqd_ptr = NULL;
 		}
@@ -1817,47 +1855,50 @@ static int gfx_v9_4_3_kcq_resume(struct amdgpu_device *adev)
 			goto done;
 	}
 
-	r = amdgpu_gfx_enable_kcq(adev, 0);
+	r = amdgpu_gfx_enable_kcq(adev, xcc_id);
 done:
 	return r;
 }
 
 static int gfx_v9_4_3_cp_resume(struct amdgpu_device *adev)
 {
-	int r, i;
+	int r, i, j;
 	struct amdgpu_ring *ring;
 
-	gfx_v9_4_3_enable_gui_idle_interrupt(adev, false);
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		gfx_v9_4_3_enable_gui_idle_interrupt(adev, false);
+
+		if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
+			gfx_v9_4_3_disable_gpa_mode(adev);
 
-	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
-		gfx_v9_4_3_disable_gpa_mode(adev);
+			r = gfx_v9_4_3_cp_compute_load_microcode(adev, i);
+			if (r)
+				return r;
+		}
 
-		r = gfx_v9_4_3_cp_compute_load_microcode(adev);
+		r = gfx_v9_4_3_kiq_resume(adev, i);
 		if (r)
 			return r;
-	}
 
-	r = gfx_v9_4_3_kiq_resume(adev);
-	if (r)
-		return r;
+		r = gfx_v9_4_3_kcq_resume(adev, i);
+		if (r)
+			return r;
 
-	r = gfx_v9_4_3_kcq_resume(adev);
-	if (r)
-		return r;
+		for (j = 0; j < adev->gfx.num_compute_rings; j++) {
+			ring = &adev->gfx.compute_ring[j + i * adev->gfx.num_compute_rings];
+			amdgpu_ring_test_helper(ring);
+		}
 
-	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		ring = &adev->gfx.compute_ring[i];
-		amdgpu_ring_test_helper(ring);
+		gfx_v9_4_3_enable_gui_idle_interrupt(adev, true);
 	}
 
-	gfx_v9_4_3_enable_gui_idle_interrupt(adev, true);
-
 	return 0;
 }
 
-static void gfx_v9_4_3_cp_enable(struct amdgpu_device *adev, bool enable)
+static void gfx_v9_4_3_cp_enable(struct amdgpu_device *adev, bool enable,
+				int xcc_id)
 {
-	gfx_v9_4_3_cp_compute_enable(adev, enable);
+	gfx_v9_4_3_cp_compute_enable(adev, enable, xcc_id);
 }
 
 static int gfx_v9_4_3_hw_init(void *handle)
@@ -1883,27 +1924,30 @@ static int gfx_v9_4_3_hw_init(void *handle)
 static int gfx_v9_4_3_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
 
-	if (amdgpu_gfx_disable_kcq(adev, 0))
-		DRM_ERROR("KCQ disable failed\n");
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		if (amdgpu_gfx_disable_kcq(adev, i))
+			DRM_ERROR("XCD %d KCQ disable failed\n", i);
 
-	/* Use deinitialize sequence from CAIL when unbinding device from driver,
-	 * otherwise KIQ is hanging when binding back
-	 */
-	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
-		mutex_lock(&adev->srbm_mutex);
-		soc15_grbm_select(adev, adev->gfx.kiq[0].ring.me,
-				adev->gfx.kiq[0].ring.pipe,
-				adev->gfx.kiq[0].ring.queue, 0, 0);
-		gfx_v9_4_3_kiq_fini_register(&adev->gfx.kiq[0].ring);
-		soc15_grbm_select(adev, 0, 0, 0, 0, 0);
-		mutex_unlock(&adev->srbm_mutex);
-	}
+		/* Use deinitialize sequence from CAIL when unbinding device
+		 * from driver, otherwise KIQ is hanging when binding back
+		 */
+		if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
+			mutex_lock(&adev->srbm_mutex);
+			soc15_grbm_select(adev, adev->gfx.kiq[i].ring.me,
+					adev->gfx.kiq[i].ring.pipe,
+					adev->gfx.kiq[i].ring.queue, 0, i);
+			gfx_v9_4_3_kiq_fini_register(&adev->gfx.kiq[i].ring, i);
+			soc15_grbm_select(adev, 0, 0, 0, 0, i);
+			mutex_unlock(&adev->srbm_mutex);
+		}
 
-	gfx_v9_4_3_cp_enable(adev, false);
+		gfx_v9_4_3_cp_enable(adev, false, i);
+	}
 
 	/* Skip suspend with A+A reset */
 	if (adev->gmc.xgmi.connected_to_cpu && amdgpu_in_reset(adev)) {
@@ -1928,12 +1972,14 @@ static int gfx_v9_4_3_resume(void *handle)
 static bool gfx_v9_4_3_is_idle(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
 
-	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, regGRBM_STATUS),
-				GRBM_STATUS, GUI_ACTIVE))
-		return false;
-	else
-		return true;
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		if (REG_GET_FIELD(RREG32_SOC15(GC, i, regGRBM_STATUS),
+					GRBM_STATUS, GUI_ACTIVE))
+			return false;
+	}
+	return true;
 }
 
 static int gfx_v9_4_3_wait_for_idle(void *handle)
@@ -1986,7 +2032,7 @@ static int gfx_v9_4_3_soft_reset(void *handle)
 		adev->gfx.rlc.funcs->stop(adev);
 
 		/* Disable MEC parsing/prefetching */
-		gfx_v9_4_3_cp_compute_enable(adev, false);
+		gfx_v9_4_3_cp_compute_enable(adev, false, 0);
 
 		if (grbm_soft_reset) {
 			tmp = RREG32_SOC15(GC, 0, regGRBM_SOFT_RESET);
@@ -2041,6 +2087,11 @@ static int gfx_v9_4_3_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
+	/* hardcode in emulation phase */
+	adev->gfx.num_xcd = 1;
+	adev->gfx.num_xcc_per_xcp = 1;
+	adev->gfx.partition_mode = AMDGPU_SPX_PARTITION_MODE;
+
 	adev->gfx.num_compute_rings = min(amdgpu_gfx_get_num_kcq(adev),
 					  AMDGPU_MAX_COMPUTE_RINGS);
 	gfx_v9_4_3_set_kiq_pm4_funcs(adev);
@@ -2069,7 +2120,7 @@ static int gfx_v9_4_3_late_init(void *handle)
 }
 
 static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *adev,
-						      bool enable)
+						      bool enable, int xcc_id)
 {
 	uint32_t data, def;
 
@@ -2078,7 +2129,7 @@ static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *ad
 	/* It is disabled by HW by default */
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_GFX_MGCG)) {
 		/* 1 - RLC_CGTT_MGCG_OVERRIDE */
-		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+		def = data = RREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE);
 
 		data &= ~(RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
 			  RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGCG_OVERRIDE_MASK |
@@ -2088,28 +2139,28 @@ static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *ad
 		data |= RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK;
 
 		if (def != data)
-			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE, data);
 
 		/* MGLS is a global flag to control all MGLS in GFX */
 		if (adev->cg_flags & AMD_CG_SUPPORT_GFX_MGLS) {
 			/* 2 - RLC memory Light sleep */
 			if (adev->cg_flags & AMD_CG_SUPPORT_GFX_RLC_LS) {
-				def = data = RREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL);
+				def = data = RREG32_SOC15(GC, xcc_id, regRLC_MEM_SLP_CNTL);
 				data |= RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK;
 				if (def != data)
-					WREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL, data);
+					WREG32_SOC15(GC, xcc_id, regRLC_MEM_SLP_CNTL, data);
 			}
 			/* 3 - CP memory Light sleep */
 			if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CP_LS) {
-				def = data = RREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL);
+				def = data = RREG32_SOC15(GC, xcc_id, regCP_MEM_SLP_CNTL);
 				data |= CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK;
 				if (def != data)
-					WREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL, data);
+					WREG32_SOC15(GC, xcc_id, regCP_MEM_SLP_CNTL, data);
 			}
 		}
 	} else {
 		/* 1 - MGCG_OVERRIDE */
-		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+		def = data = RREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE);
 
 		data |= (RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK |
 			 RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
@@ -2117,20 +2168,20 @@ static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *ad
 			 RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGLS_OVERRIDE_MASK);
 
 		if (def != data)
-			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE, data);
 
 		/* 2 - disable MGLS in RLC */
-		data = RREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL);
+		data = RREG32_SOC15(GC, xcc_id, regRLC_MEM_SLP_CNTL);
 		if (data & RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK) {
 			data &= ~RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK;
-			WREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_MEM_SLP_CNTL, data);
 		}
 
 		/* 3 - disable MGLS in CP */
-		data = RREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL);
+		data = RREG32_SOC15(GC, xcc_id, regCP_MEM_SLP_CNTL);
 		if (data & CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK) {
 			data &= ~CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK;
-			WREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL, data);
+			WREG32_SOC15(GC, xcc_id, regCP_MEM_SLP_CNTL, data);
 		}
 	}
 
@@ -2138,14 +2189,14 @@ static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *ad
 }
 
 static void gfx_v9_4_3_update_coarse_grain_clock_gating(struct amdgpu_device *adev,
-						      bool enable)
+						      bool enable, int xcc_id)
 {
 	uint32_t def, data;
 
 	amdgpu_gfx_rlc_enter_safe_mode(adev);
 
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGCG)) {
-		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+		def = data = RREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE);
 		/* unset CGCG override */
 		data &= ~RLC_CGTT_MGCG_OVERRIDE__GFXIP_CGCG_OVERRIDE_MASK;
 		if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGLS)
@@ -2154,10 +2205,10 @@ static void gfx_v9_4_3_update_coarse_grain_clock_gating(struct amdgpu_device *ad
 			data |= RLC_CGTT_MGCG_OVERRIDE__GFXIP_CGLS_OVERRIDE_MASK;
 		/* update CGCG and CGLS override bits */
 		if (def != data)
-			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_CGTT_MGCG_OVERRIDE, data);
 
 		/* enable cgcg FSM(0x0000363F) */
-		def = RREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL);
+		def = RREG32_SOC15(GC, xcc_id, regRLC_CGCG_CGLS_CTRL);
 
 		if (adev->asic_type == CHIP_ARCTURUS)
 			data = (0x2000 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |
@@ -2169,43 +2220,43 @@ static void gfx_v9_4_3_update_coarse_grain_clock_gating(struct amdgpu_device *ad
 			data |= (0x000F << RLC_CGCG_CGLS_CTRL__CGLS_REP_COMPANSAT_DELAY__SHIFT) |
 				RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK;
 		if (def != data)
-			WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_CGCG_CGLS_CTRL, data);
 
 		/* set IDLE_POLL_COUNT(0x00900100) */
-		def = RREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_CNTL);
+		def = RREG32_SOC15(GC, xcc_id, regCP_RB_WPTR_POLL_CNTL);
 		data = (0x0100 << CP_RB_WPTR_POLL_CNTL__POLL_FREQUENCY__SHIFT) |
 			(0x0090 << CP_RB_WPTR_POLL_CNTL__IDLE_POLL_COUNT__SHIFT);
 		if (def != data)
-			WREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_CNTL, data);
+			WREG32_SOC15(GC, xcc_id, regCP_RB_WPTR_POLL_CNTL, data);
 	} else {
-		def = data = RREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL);
+		def = data = RREG32_SOC15(GC, xcc_id, regRLC_CGCG_CGLS_CTRL);
 		/* reset CGCG/CGLS bits */
 		data &= ~(RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK | RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK);
 		/* disable cgcg and cgls in FSM */
 		if (def != data)
-			WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, data);
+			WREG32_SOC15(GC, xcc_id, regRLC_CGCG_CGLS_CTRL, data);
 	}
 
 	amdgpu_gfx_rlc_exit_safe_mode(adev);
 }
 
 static int gfx_v9_4_3_update_gfx_clock_gating(struct amdgpu_device *adev,
-					    bool enable)
+					    bool enable, int xcc_id)
 {
 	if (enable) {
 		/* CGCG/CGLS should be enabled after MGCG/MGLS
 		 * ===  MGCG + MGLS ===
 		 */
-		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable);
+		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable, xcc_id);
 		/* ===  CGCG + CGLS === */
-		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable);
+		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable, xcc_id);
 	} else {
 		/* CGCG/CGLS should be disabled before MGCG/MGLS
 		 * ===  CGCG + CGLS ===
 		 */
-		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable);
+		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable, xcc_id);
 		/* ===  MGCG + MGLS === */
-		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable);
+		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable, xcc_id);
 	}
 	return 0;
 }
@@ -2235,14 +2286,16 @@ static int gfx_v9_4_3_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
 
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(9, 4, 3):
-		gfx_v9_4_3_update_gfx_clock_gating(adev,
-						 state == AMD_CG_STATE_GATE);
+		for (i = 0; i < adev->gfx.num_xcd; i++)
+			gfx_v9_4_3_update_gfx_clock_gating(adev,
+						state == AMD_CG_STATE_GATE, i);
 		break;
 	default:
 		break;
@@ -2510,8 +2563,9 @@ static void gfx_v9_4_3_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
 }
 
 static void gfx_v9_4_3_set_compute_eop_interrupt_state(struct amdgpu_device *adev,
-						     int me, int pipe,
-						     enum amdgpu_interrupt_state state)
+						       int me, int pipe,
+						       enum amdgpu_interrupt_state state,
+						       int xcc_id)
 {
 	u32 mec_int_cntl, mec_int_cntl_reg;
 
@@ -2524,16 +2578,16 @@ static void gfx_v9_4_3_set_compute_eop_interrupt_state(struct amdgpu_device *ade
 	if (me == 1) {
 		switch (pipe) {
 		case 0:
-			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE0_INT_CNTL);
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, xcc_id, regCP_ME1_PIPE0_INT_CNTL);
 			break;
 		case 1:
-			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE1_INT_CNTL);
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, xcc_id, regCP_ME1_PIPE1_INT_CNTL);
 			break;
 		case 2:
-			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE2_INT_CNTL);
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, xcc_id, regCP_ME1_PIPE2_INT_CNTL);
 			break;
 		case 3:
-			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE3_INT_CNTL);
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, xcc_id, regCP_ME1_PIPE3_INT_CNTL);
 			break;
 		default:
 			DRM_DEBUG("invalid pipe %d\n", pipe);
@@ -2567,12 +2621,15 @@ static int gfx_v9_4_3_set_priv_reg_fault_state(struct amdgpu_device *adev,
 					     unsigned type,
 					     enum amdgpu_interrupt_state state)
 {
+	int i;
+
 	switch (state) {
 	case AMDGPU_IRQ_STATE_DISABLE:
 	case AMDGPU_IRQ_STATE_ENABLE:
-		WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
-			       PRIV_REG_INT_ENABLE,
-			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		for (i = 0; i < adev->gfx.num_xcd; i++)
+			WREG32_FIELD15_PREREG(GC, i, CP_INT_CNTL_RING0,
+				PRIV_REG_INT_ENABLE,
+				state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
 		break;
 	default:
 		break;
@@ -2586,12 +2643,15 @@ static int gfx_v9_4_3_set_priv_inst_fault_state(struct amdgpu_device *adev,
 					      unsigned type,
 					      enum amdgpu_interrupt_state state)
 {
+	int i;
+
 	switch (state) {
 	case AMDGPU_IRQ_STATE_DISABLE:
 	case AMDGPU_IRQ_STATE_ENABLE:
-		WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
-			       PRIV_INSTR_INT_ENABLE,
-			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		for (i = 0; i < adev->gfx.num_xcd; i++)
+			WREG32_FIELD15_PREREG(GC, i, CP_INT_CNTL_RING0,
+				PRIV_INSTR_INT_ENABLE,
+				state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
 		break;
 	default:
 		break;
@@ -2605,34 +2665,38 @@ static int gfx_v9_4_3_set_eop_interrupt_state(struct amdgpu_device *adev,
 					    unsigned type,
 					    enum amdgpu_interrupt_state state)
 {
-	switch (type) {
-	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE0_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 0, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE1_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 1, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE2_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 2, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE3_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 3, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE0_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 0, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE1_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 1, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE2_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 2, state);
-		break;
-	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE3_EOP:
-		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 3, state);
-		break;
-	default:
-		break;
+	int i;
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		switch (type) {
+		case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE0_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 0, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE1_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 1, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE2_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 2, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE3_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 3, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE0_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 0, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE1_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 1, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE2_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 2, state, i);
+			break;
+		case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE3_EOP:
+			gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 3, state, i);
+			break;
+		default:
+			break;
+		}
 	}
+
 	return 0;
 }
 
@@ -2872,12 +2936,15 @@ static const struct amdgpu_ring_funcs gfx_v9_4_3_ring_funcs_kiq = {
 
 static void gfx_v9_4_3_set_ring_funcs(struct amdgpu_device *adev)
 {
-	int i;
+	int i, j;
 
-	adev->gfx.kiq[0].ring.funcs = &gfx_v9_4_3_ring_funcs_kiq;
+	for (i = 0; i < adev->gfx.num_xcd; i++) {
+		adev->gfx.kiq[i].ring.funcs = &gfx_v9_4_3_ring_funcs_kiq;
 
-	for (i = 0; i < adev->gfx.num_compute_rings; i++)
-		adev->gfx.compute_ring[i].funcs = &gfx_v9_4_3_ring_funcs_compute;
+		for (j = 0; j < adev->gfx.num_compute_rings; j++)
+			adev->gfx.compute_ring[j + i * adev->gfx.num_compute_rings].funcs
+					= &gfx_v9_4_3_ring_funcs_compute;
+	}
 }
 
 static const struct amdgpu_irq_src_funcs gfx_v9_4_3_eop_irq_funcs = {
-- 
2.39.2

