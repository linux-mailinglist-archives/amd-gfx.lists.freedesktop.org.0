Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F116CAED1
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Mar 2023 21:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10BA10E71F;
	Mon, 27 Mar 2023 19:36:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3010E145
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Mar 2023 19:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGvohJH9sap6m4NEg4vBM2XZNPLW/uxzw7TW7iz3jvoVaGRwdcnomcmLl3RdgWy0QIG9lLkkuE9o/8cRZp2NgPoNOfuTmgbVJNPUmxzR4sx1puWDRbakTolEKoEQe4mqcgdWoH9NIMnJqfrUBp9hcaRDi/wG1lQfIlczQX3EU5aT+s6/ZL3xyc8r+vSRY/4Tb/Twg3B2wIMW2/gPMHV1A7TzB/4RGTVmO/tqj0EndNUXJSsoi1omXUUkOFAAvGO2ZbdZK/5+qlzqfhRwxOW9oHZOiLvjnqS71224jBbemwz2OFOiSaQ6UgZcMLN8pVPQQCmOMRiXy4ZhRFdkqvmnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D/1pzSmdg0hH+wqmujKm6OdSGk2PlJfx5eEesFdhSs=;
 b=NrJczU02XnoZXIMwdp3jyto13pWikBvEsJU0S4fwWq0emwg2bGV8tT1Oxt3OAUCbbnk6C3icKRdaKlfzJGOpVFgdSK92mbKvkbyAtJSCacZ9/msiQnlUXeUSdkU2OVpZBPrQPco+GZEYsT41POsxmsapiLY7gyNdE+CzrLG2j9Np2XDpMlSPnIKP50YQWLJmEoQTtFyDWyh4K+K86mZzVUuypfxmZyLh472AD057X7f2R9twV7V0FZuqVxFpKM3ys+yR1C4FNmEgEMdwcrg9GXxIESK+SsBLssd3T7h3V2w/btTAHHn7C3m738byOXxvZByZa0wgnJ+hPPKx1c7P6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D/1pzSmdg0hH+wqmujKm6OdSGk2PlJfx5eEesFdhSs=;
 b=YfjExIyJtyhBIDwQ8LeVASRy6PfWRNpGCt/9WavPT9LZNZ+Ls3voFbUhlkqG5xXC+YRBgo+2zFtRcEqSwbEJ+ONUIfkO7TsONNMuEQ4xz50liJHIbzelfdofSuT7N3kRkCot2SZuTH/kT+A4yRt5NYmsFwqhwyb6Sekuy/qAVlU=
Received: from BN8PR15CA0070.namprd15.prod.outlook.com (2603:10b6:408:80::47)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 19:36:25 +0000
Received: from BL02EPF000100D0.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::89) by BN8PR15CA0070.outlook.office365.com
 (2603:10b6:408:80::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 19:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000100D0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 19:36:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 14:36:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/28] drm/amdgpu: split gc v9_4_3 functionality from gc v9_0
Date: Mon, 27 Mar 2023 15:35:41 -0400
Message-ID: <20230327193602.7901-7-alexander.deucher@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF000100D0:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: e0897a86-f1a3-41aa-7a54-08db2efa8d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bip5dSQMBqOYnC3oUFwXzvKFui+bxeRxRfuwppnNwmuMhZqiHilBwtQvKmpepTnr9dPYOTSxczX1ekouUKxq79ZRo0YOKS/2ROP8uWTUrdD+BImy8J7SRBWOg/DRapIjKbW4Ku+ToJnlEaZy6oJVB8VGpOxrRpWhY8Y497axPpKMZRcM74R+YTIZ8eJnLNYqtX/HYsuxqoXnd9xUye4jEAWupiMziagcqlpNKotFWSRCuUJedEsFPQFzZfNh07GYOHaLFL2KMXiOcPywQVAvLnrvhKCVdyXFn79eFeQd0rYHN7HFtNDnMvGI2aK759J0tzlqbcBlCvV5/YJQ85r5mtNobpdJzsm2ZxgtyO1vDVYCYm9ScySw0l3GOnbM2tY5j9hZ2KDczw/W0dNHF5HRrgnDscFvUtL3UTxp5kUXcIWVM/ESoBLHWoUfQrpzgwLGS27bYXTLP2DmshxSeIKzfZYWrcAWLyrf6MA3aYWQ05s0ENEmLls2kG4oYxNLLzzZjj17DULEsOz4Vklt+1jrI3vK8trsEdXfL1pdYeLLjUoxqcNKrI9UfevM2kx6fd1RQNgZQr6+/wjr5NXw8fTOS0jqRE0kBXUGEjK0rzRx9GFnNwGnENBuiUMh+xkb36F49ElgZfro7n5557W3adGZyYPxViuZwNHKPE3Dl0BUrFYU2tqdcxi6txlWq7MfgHS7lqn2lbsi1za81+YQpsTDZhqXbthPgu/rINmgpb+tBIMvqHBCo+js87ymhNF4ZWmrd6unzM396xIRAUXo9UdTIhgMiq/Lp0ZRn1QJ7tmwNcU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(2906002)(40460700003)(30864003)(83380400001)(36756003)(5660300002)(82740400003)(41300700001)(356005)(81166007)(8936002)(82310400005)(426003)(336012)(40480700001)(86362001)(2616005)(6666004)(54906003)(1076003)(26005)(47076005)(316002)(7696005)(478600001)(36860700001)(186003)(4326008)(16526019)(6916009)(8676002)(70206006)(70586007)(21314003)(36900700001)(579004)(559001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:36:24.6154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0897a86-f1a3-41aa-7a54-08db2efa8d13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000100D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434
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

To prepare for gc v9_4_3 specific feature.

v2: fix exports (Alex)

Signed-off-by: Le Ma <le.ma@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 2668 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h |    3 +-
 2 files changed, 2646 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 35372f910fca..03ef36f2e892 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -25,16 +25,293 @@
 #include "amdgpu.h"
 #include "amdgpu_gfx.h"
 #include "soc15.h"
+#include "soc15d.h"
 #include "soc15_common.h"
 #include "vega10_enum.h"
 
+#include "clearstate_gfx9.h"
+#include "v9_structs.h"
+
+#include "ivsrcid/gfx/irqsrcs_gfx_9_0.h"
+
 #include "gc/gc_9_4_3_offset.h"
 #include "gc/gc_9_4_3_sh_mask.h"
 
 #include "gfx_v9_4_3.h"
 
+MODULE_FIRMWARE("amdgpu/gc_9_4_3_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_9_4_3_rlc.bin");
+
+#define GFX9_MEC_HPD_SIZE 4096
 #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L
 
+static const struct soc15_reg_golden golden_settings_gc_9_4_3[] =
+{
+
+};
+
+static void gfx_v9_4_3_set_ring_funcs(struct amdgpu_device *adev);
+static void gfx_v9_4_3_set_irq_funcs(struct amdgpu_device *adev);
+static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev);
+static void gfx_v9_4_3_set_rlc_funcs(struct amdgpu_device *adev);
+static int gfx_v9_4_3_get_cu_info(struct amdgpu_device *adev,
+				struct amdgpu_cu_info *cu_info);
+
+static void gfx_v9_4_3_kiq_set_resources(struct amdgpu_ring *kiq_ring,
+				uint64_t queue_mask)
+{
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_SET_RESOURCES, 6));
+	amdgpu_ring_write(kiq_ring,
+		PACKET3_SET_RESOURCES_VMID_MASK(0) |
+		/* vmid_mask:0* queue_type:0 (KIQ) */
+		PACKET3_SET_RESOURCES_QUEUE_TYPE(0));
+	amdgpu_ring_write(kiq_ring,
+			lower_32_bits(queue_mask));	/* queue mask lo */
+	amdgpu_ring_write(kiq_ring,
+			upper_32_bits(queue_mask));	/* queue mask hi */
+	amdgpu_ring_write(kiq_ring, 0);	/* gws mask lo */
+	amdgpu_ring_write(kiq_ring, 0);	/* gws mask hi */
+	amdgpu_ring_write(kiq_ring, 0);	/* oac mask */
+	amdgpu_ring_write(kiq_ring, 0);	/* gds heap base:0, gds heap size:0 */
+}
+
+static void gfx_v9_4_3_kiq_map_queues(struct amdgpu_ring *kiq_ring,
+				 struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = kiq_ring->adev;
+	uint64_t mqd_addr = amdgpu_bo_gpu_offset(ring->mqd_obj);
+	uint64_t wptr_addr = adev->wb.gpu_addr + (ring->wptr_offs * 4);
+	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
+
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_MAP_QUEUES, 5));
+	/* Q_sel:0, vmid:0, vidmem: 1, engine:0, num_Q:1*/
+	amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
+			 PACKET3_MAP_QUEUES_QUEUE_SEL(0) | /* Queue_Sel */
+			 PACKET3_MAP_QUEUES_VMID(0) | /* VMID */
+			 PACKET3_MAP_QUEUES_QUEUE(ring->queue) |
+			 PACKET3_MAP_QUEUES_PIPE(ring->pipe) |
+			 PACKET3_MAP_QUEUES_ME((ring->me == 1 ? 0 : 1)) |
+			 /*queue_type: normal compute queue */
+			 PACKET3_MAP_QUEUES_QUEUE_TYPE(0) |
+			 /* alloc format: all_on_one_pipe */
+			 PACKET3_MAP_QUEUES_ALLOC_FORMAT(0) |
+			 PACKET3_MAP_QUEUES_ENGINE_SEL(eng_sel) |
+			 /* num_queues: must be 1 */
+			 PACKET3_MAP_QUEUES_NUM_QUEUES(1));
+	amdgpu_ring_write(kiq_ring,
+			PACKET3_MAP_QUEUES_DOORBELL_OFFSET(ring->doorbell_index));
+	amdgpu_ring_write(kiq_ring, lower_32_bits(mqd_addr));
+	amdgpu_ring_write(kiq_ring, upper_32_bits(mqd_addr));
+	amdgpu_ring_write(kiq_ring, lower_32_bits(wptr_addr));
+	amdgpu_ring_write(kiq_ring, upper_32_bits(wptr_addr));
+}
+
+static void gfx_v9_4_3_kiq_unmap_queues(struct amdgpu_ring *kiq_ring,
+				   struct amdgpu_ring *ring,
+				   enum amdgpu_unmap_queues_action action,
+				   u64 gpu_addr, u64 seq)
+{
+	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
+
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
+	amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
+			  PACKET3_UNMAP_QUEUES_ACTION(action) |
+			  PACKET3_UNMAP_QUEUES_QUEUE_SEL(0) |
+			  PACKET3_UNMAP_QUEUES_ENGINE_SEL(eng_sel) |
+			  PACKET3_UNMAP_QUEUES_NUM_QUEUES(1));
+	amdgpu_ring_write(kiq_ring,
+			PACKET3_UNMAP_QUEUES_DOORBELL_OFFSET0(ring->doorbell_index));
+
+	if (action == PREEMPT_QUEUES_NO_UNMAP) {
+		amdgpu_ring_write(kiq_ring, lower_32_bits(gpu_addr));
+		amdgpu_ring_write(kiq_ring, upper_32_bits(gpu_addr));
+		amdgpu_ring_write(kiq_ring, seq);
+	} else {
+		amdgpu_ring_write(kiq_ring, 0);
+		amdgpu_ring_write(kiq_ring, 0);
+		amdgpu_ring_write(kiq_ring, 0);
+	}
+}
+
+static void gfx_v9_4_3_kiq_query_status(struct amdgpu_ring *kiq_ring,
+				   struct amdgpu_ring *ring,
+				   u64 addr,
+				   u64 seq)
+{
+	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
+
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_QUERY_STATUS, 5));
+	amdgpu_ring_write(kiq_ring,
+			  PACKET3_QUERY_STATUS_CONTEXT_ID(0) |
+			  PACKET3_QUERY_STATUS_INTERRUPT_SEL(0) |
+			  PACKET3_QUERY_STATUS_COMMAND(2));
+	/* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
+	amdgpu_ring_write(kiq_ring,
+			PACKET3_QUERY_STATUS_DOORBELL_OFFSET(ring->doorbell_index) |
+			PACKET3_QUERY_STATUS_ENG_SEL(eng_sel));
+	amdgpu_ring_write(kiq_ring, lower_32_bits(addr));
+	amdgpu_ring_write(kiq_ring, upper_32_bits(addr));
+	amdgpu_ring_write(kiq_ring, lower_32_bits(seq));
+	amdgpu_ring_write(kiq_ring, upper_32_bits(seq));
+}
+
+static void gfx_v9_4_3_kiq_invalidate_tlbs(struct amdgpu_ring *kiq_ring,
+				uint16_t pasid, uint32_t flush_type,
+				bool all_hub)
+{
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
+	amdgpu_ring_write(kiq_ring,
+			PACKET3_INVALIDATE_TLBS_DST_SEL(1) |
+			PACKET3_INVALIDATE_TLBS_ALL_HUB(all_hub) |
+			PACKET3_INVALIDATE_TLBS_PASID(pasid) |
+			PACKET3_INVALIDATE_TLBS_FLUSH_TYPE(flush_type));
+}
+
+static const struct kiq_pm4_funcs gfx_v9_4_3_kiq_pm4_funcs = {
+	.kiq_set_resources = gfx_v9_4_3_kiq_set_resources,
+	.kiq_map_queues = gfx_v9_4_3_kiq_map_queues,
+	.kiq_unmap_queues = gfx_v9_4_3_kiq_unmap_queues,
+	.kiq_query_status = gfx_v9_4_3_kiq_query_status,
+	.kiq_invalidate_tlbs = gfx_v9_4_3_kiq_invalidate_tlbs,
+	.set_resources_size = 8,
+	.map_queues_size = 7,
+	.unmap_queues_size = 6,
+	.query_status_size = 7,
+	.invalidate_tlbs_size = 2,
+};
+
+static void gfx_v9_4_3_set_kiq_pm4_funcs(struct amdgpu_device *adev)
+{
+	adev->gfx.kiq[0].pmf = &gfx_v9_4_3_kiq_pm4_funcs;
+}
+
+static void gfx_v9_4_3_init_golden_registers(struct amdgpu_device *adev)
+{
+
+}
+
+static void gfx_v9_4_3_write_data_to_reg(struct amdgpu_ring *ring, int eng_sel,
+				       bool wc, uint32_t reg, uint32_t val)
+{
+	amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
+	amdgpu_ring_write(ring, WRITE_DATA_ENGINE_SEL(eng_sel) |
+				WRITE_DATA_DST_SEL(0) |
+				(wc ? WR_CONFIRM : 0));
+	amdgpu_ring_write(ring, reg);
+	amdgpu_ring_write(ring, 0);
+	amdgpu_ring_write(ring, val);
+}
+
+static void gfx_v9_4_3_wait_reg_mem(struct amdgpu_ring *ring, int eng_sel,
+				  int mem_space, int opt, uint32_t addr0,
+				  uint32_t addr1, uint32_t ref, uint32_t mask,
+				  uint32_t inv)
+{
+	amdgpu_ring_write(ring, PACKET3(PACKET3_WAIT_REG_MEM, 5));
+	amdgpu_ring_write(ring,
+				 /* memory (1) or register (0) */
+				 (WAIT_REG_MEM_MEM_SPACE(mem_space) |
+				 WAIT_REG_MEM_OPERATION(opt) | /* wait */
+				 WAIT_REG_MEM_FUNCTION(3) |  /* equal */
+				 WAIT_REG_MEM_ENGINE(eng_sel)));
+
+	if (mem_space)
+		BUG_ON(addr0 & 0x3); /* Dword align */
+	amdgpu_ring_write(ring, addr0);
+	amdgpu_ring_write(ring, addr1);
+	amdgpu_ring_write(ring, ref);
+	amdgpu_ring_write(ring, mask);
+	amdgpu_ring_write(ring, inv); /* poll interval */
+}
+
+static int gfx_v9_4_3_ring_test_ring(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	uint32_t tmp = 0;
+	unsigned i;
+	int r;
+
+	WREG32_SOC15(GC, 0, regSCRATCH_REG0, 0xCAFEDEAD);
+	r = amdgpu_ring_alloc(ring, 3);
+	if (r)
+		return r;
+
+	amdgpu_ring_write(ring, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+	amdgpu_ring_write(ring, SOC15_REG_OFFSET(GC, 0, regSCRATCH_REG0) -
+			  PACKET3_SET_UCONFIG_REG_START);
+	amdgpu_ring_write(ring, 0xDEADBEEF);
+	amdgpu_ring_commit(ring);
+
+	for (i = 0; i < adev->usec_timeout; i++) {
+		tmp = RREG32_SOC15(GC, 0, regSCRATCH_REG0);
+		if (tmp == 0xDEADBEEF)
+			break;
+		udelay(1);
+	}
+
+	if (i >= adev->usec_timeout)
+		r = -ETIMEDOUT;
+	return r;
+}
+
+static int gfx_v9_4_3_ring_test_ib(struct amdgpu_ring *ring, long timeout)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_ib ib;
+	struct dma_fence *f = NULL;
+
+	unsigned index;
+	uint64_t gpu_addr;
+	uint32_t tmp;
+	long r;
+
+	r = amdgpu_device_wb_get(adev, &index);
+	if (r)
+		return r;
+
+	gpu_addr = adev->wb.gpu_addr + (index * 4);
+	adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
+	memset(&ib, 0, sizeof(ib));
+	r = amdgpu_ib_get(adev, NULL, 16,
+			  AMDGPU_IB_POOL_DIRECT, &ib);
+	if (r)
+		goto err1;
+
+	ib.ptr[0] = PACKET3(PACKET3_WRITE_DATA, 3);
+	ib.ptr[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+	ib.ptr[2] = lower_32_bits(gpu_addr);
+	ib.ptr[3] = upper_32_bits(gpu_addr);
+	ib.ptr[4] = 0xDEADBEEF;
+	ib.length_dw = 5;
+
+	r = amdgpu_ib_schedule(ring, 1, &ib, NULL, &f);
+	if (r)
+		goto err2;
+
+	r = dma_fence_wait_timeout(f, false, timeout);
+	if (r == 0) {
+		r = -ETIMEDOUT;
+		goto err2;
+	} else if (r < 0) {
+		goto err2;
+	}
+
+	tmp = adev->wb.wb[index];
+	if (tmp == 0xDEADBEEF)
+		r = 0;
+	else
+		r = -EINVAL;
+
+err2:
+	amdgpu_ib_free(adev, &ib, NULL);
+	dma_fence_put(f);
+err1:
+	amdgpu_device_wb_free(adev, index);
+	return r;
+}
+
+
+/* This value might differs per partition */
 static uint64_t gfx_v9_4_3_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock;
@@ -50,6 +327,241 @@ static uint64_t gfx_v9_4_3_get_gpu_clock_counter(struct amdgpu_device *adev)
 	return clock;
 }
 
+static void gfx_v9_4_3_free_microcode(struct amdgpu_device *adev)
+{
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
+	amdgpu_ucode_release(&adev->gfx.mec2_fw);
+
+	kfree(adev->gfx.rlc.register_list_format);
+}
+
+static int gfx_v9_4_3_init_rlc_microcode(struct amdgpu_device *adev,
+					  const char *chip_name)
+{
+	char fw_name[30];
+	int err;
+	const struct rlc_firmware_header_v2_0 *rlc_hdr;
+	uint16_t version_major;
+	uint16_t version_minor;
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
+
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
+	if (err)
+		goto out;
+	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
+
+	version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
+	version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
+	err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
+out:
+	if (err)
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+
+	return err;
+}
+
+static bool gfx_v9_4_3_should_disable_gfxoff(struct pci_dev *pdev)
+{
+	return true;
+}
+
+static void gfx_v9_4_3_check_if_need_gfxoff(struct amdgpu_device *adev)
+{
+	if (gfx_v9_4_3_should_disable_gfxoff(adev->pdev))
+		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
+}
+
+static int gfx_v9_4_3_init_cp_compute_microcode(struct amdgpu_device *adev,
+					  const char *chip_name)
+{
+	char fw_name[30];
+	int err;
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
+
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
+	if (err)
+		goto out;
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
+
+	adev->gfx.mec2_fw_version = adev->gfx.mec_fw_version;
+	adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
+
+	gfx_v9_4_3_check_if_need_gfxoff(adev);
+
+out:
+	if (err)
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
+	return err;
+}
+
+static int gfx_v9_4_3_init_microcode(struct amdgpu_device *adev)
+{
+	const char *chip_name;
+	int r;
+
+	chip_name = "gc_9_4_3";
+
+	r = gfx_v9_4_3_init_rlc_microcode(adev, chip_name);
+	if (r)
+		return r;
+
+	r = gfx_v9_4_3_init_cp_compute_microcode(adev, chip_name);
+	if (r)
+		return r;
+
+	return r;
+}
+
+static u32 gfx_v9_4_3_get_csb_size(struct amdgpu_device *adev)
+{
+	u32 count = 0;
+	const struct cs_section_def *sect = NULL;
+	const struct cs_extent_def *ext = NULL;
+
+	/* begin clear state */
+	count += 2;
+	/* context control state */
+	count += 3;
+
+	for (sect = gfx9_cs_data; sect->section != NULL; ++sect) {
+		for (ext = sect->section; ext->extent != NULL; ++ext) {
+			if (sect->id == SECT_CONTEXT)
+				count += 2 + ext->reg_count;
+			else
+				return 0;
+		}
+	}
+
+	/* end clear state */
+	count += 2;
+	/* clear state */
+	count += 2;
+
+	return count;
+}
+
+static void gfx_v9_4_3_get_csb_buffer(struct amdgpu_device *adev,
+				    volatile u32 *buffer)
+{
+	u32 count = 0, i;
+	const struct cs_section_def *sect = NULL;
+	const struct cs_extent_def *ext = NULL;
+
+	if (adev->gfx.rlc.cs_data == NULL)
+		return;
+	if (buffer == NULL)
+		return;
+
+	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
+	buffer[count++] = cpu_to_le32(PACKET3_PREAMBLE_BEGIN_CLEAR_STATE);
+
+	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_CONTEXT_CONTROL, 1));
+	buffer[count++] = cpu_to_le32(0x80000000);
+	buffer[count++] = cpu_to_le32(0x80000000);
+
+	for (sect = adev->gfx.rlc.cs_data; sect->section != NULL; ++sect) {
+		for (ext = sect->section; ext->extent != NULL; ++ext) {
+			if (sect->id == SECT_CONTEXT) {
+				buffer[count++] =
+					cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
+				buffer[count++] = cpu_to_le32(ext->reg_index -
+						PACKET3_SET_CONTEXT_REG_START);
+				for (i = 0; i < ext->reg_count; i++)
+					buffer[count++] = cpu_to_le32(ext->extent[i]);
+			} else {
+				return;
+			}
+		}
+	}
+
+	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
+	buffer[count++] = cpu_to_le32(PACKET3_PREAMBLE_END_CLEAR_STATE);
+
+	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_CLEAR_STATE, 0));
+	buffer[count++] = cpu_to_le32(0);
+}
+
+static void gfx_v9_4_3_mec_fini(struct amdgpu_device *adev)
+{
+	amdgpu_bo_free_kernel(&adev->gfx.mec.hpd_eop_obj, NULL, NULL);
+	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_obj, NULL, NULL);
+}
+
+static int gfx_v9_4_3_mec_init(struct amdgpu_device *adev)
+{
+	int r, i;
+	u32 *hpd;
+	const __le32 *fw_data;
+	unsigned fw_size;
+	u32 *fw;
+	size_t mec_hpd_size;
+
+	const struct gfx_firmware_header_v1_0 *mec_hdr;
+
+	bitmap_zero(adev->gfx.mec_bitmap[0].queue_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
+
+	/* take ownership of the relevant compute queues */
+	amdgpu_gfx_compute_queue_acquire(adev);
+	mec_hpd_size = adev->gfx.num_compute_rings * GFX9_MEC_HPD_SIZE;
+	if (mec_hpd_size) {
+		r = amdgpu_bo_create_reserved(adev, mec_hpd_size, PAGE_SIZE,
+					      AMDGPU_GEM_DOMAIN_VRAM,
+					      &adev->gfx.mec.hpd_eop_obj,
+					      &adev->gfx.mec.hpd_eop_gpu_addr,
+					      (void **)&hpd);
+		if (r) {
+			dev_warn(adev->dev, "(%d) create HDP EOP bo failed\n", r);
+			gfx_v9_4_3_mec_fini(adev);
+			return r;
+		}
+
+		if (amdgpu_emu_mode == 1) {
+			for (i = 0; i < mec_hpd_size / 4; i++) {
+				memset((void *)(hpd + i), 0, 4);
+				if (i % 50 == 0)
+					msleep(1);
+			}
+		} else {
+			memset(hpd, 0, mec_hpd_size);
+		}
+
+		amdgpu_bo_kunmap(adev->gfx.mec.hpd_eop_obj);
+		amdgpu_bo_unreserve(adev->gfx.mec.hpd_eop_obj);
+	}
+
+	mec_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->data;
+
+	fw_data = (const __le32 *)
+		(adev->gfx.mec_fw->data +
+		 le32_to_cpu(mec_hdr->header.ucode_array_offset_bytes));
+	fw_size = le32_to_cpu(mec_hdr->header.ucode_size_bytes);
+
+	r = amdgpu_bo_create_reserved(adev, mec_hdr->header.ucode_size_bytes,
+				      PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
+				      &adev->gfx.mec.mec_fw_obj,
+				      &adev->gfx.mec.mec_fw_gpu_addr,
+				      (void **)&fw);
+	if (r) {
+		dev_warn(adev->dev, "(%d) create mec firmware bo failed\n", r);
+		gfx_v9_4_3_mec_fini(adev);
+		return r;
+	}
+
+	memcpy(fw, fw_data, fw_size);
+
+	amdgpu_bo_kunmap(adev->gfx.mec.mec_fw_obj);
+	amdgpu_bo_unreserve(adev->gfx.mec.mec_fw_obj);
+
+	return 0;
+}
+
 static void gfx_v9_4_3_select_se_sh(struct amdgpu_device *adev,
 				    u32 se_num,
 				    u32 sh_num,
@@ -150,6 +662,400 @@ static void gfx_v9_4_3_select_me_pipe_q(struct amdgpu_device *adev,
 	soc15_grbm_select(adev, me, pipe, q, vm);
 }
 
+static const struct amdgpu_gfx_funcs gfx_v9_4_3_gfx_funcs = {
+        .get_gpu_clock_counter = &gfx_v9_4_3_get_gpu_clock_counter,
+        .select_se_sh = &gfx_v9_4_3_select_se_sh,
+        .read_wave_data = &gfx_v9_4_3_read_wave_data,
+        .read_wave_sgprs = &gfx_v9_4_3_read_wave_sgprs,
+        .read_wave_vgprs = &gfx_v9_4_3_read_wave_vgprs,
+        .select_me_pipe_q = &gfx_v9_4_3_select_me_pipe_q,
+};
+
+static int gfx_v9_4_3_gpu_early_init(struct amdgpu_device *adev)
+{
+	u32 gb_addr_config;
+
+	adev->gfx.funcs = &gfx_v9_4_3_gfx_funcs;
+
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(9, 4, 3):
+		adev->gfx.config.max_hw_contexts = 8;
+		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
+		adev->gfx.config.sc_prim_fifo_size_backend = 0x100;
+		adev->gfx.config.sc_hiz_tile_fifo_size = 0x30;
+		adev->gfx.config.sc_earlyz_tile_fifo_size = 0x4C0;
+		gb_addr_config = RREG32_SOC15(GC, 0, regGB_ADDR_CONFIG);
+		break;
+	default:
+		BUG();
+		break;
+	}
+
+	adev->gfx.config.gb_addr_config = gb_addr_config;
+
+	adev->gfx.config.gb_addr_config_fields.num_pipes = 1 <<
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					NUM_PIPES);
+
+	adev->gfx.config.max_tile_pipes =
+		adev->gfx.config.gb_addr_config_fields.num_pipes;
+
+	adev->gfx.config.gb_addr_config_fields.num_banks = 1 <<
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					NUM_BANKS);
+	adev->gfx.config.gb_addr_config_fields.max_compress_frags = 1 <<
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					MAX_COMPRESSED_FRAGS);
+	adev->gfx.config.gb_addr_config_fields.num_rb_per_se = 1 <<
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					NUM_RB_PER_SE);
+	adev->gfx.config.gb_addr_config_fields.num_se = 1 <<
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					NUM_SHADER_ENGINES);
+	adev->gfx.config.gb_addr_config_fields.pipe_interleave_size = 1 << (8 +
+			REG_GET_FIELD(
+					adev->gfx.config.gb_addr_config,
+					GB_ADDR_CONFIG,
+					PIPE_INTERLEAVE_SIZE));
+
+	return 0;
+}
+
+static int gfx_v9_4_3_compute_ring_init(struct amdgpu_device *adev, int ring_id,
+				      int mec, int pipe, int queue)
+{
+	unsigned irq_type;
+	struct amdgpu_ring *ring = &adev->gfx.compute_ring[ring_id];
+	unsigned int hw_prio;
+
+	ring = &adev->gfx.compute_ring[ring_id];
+
+	/* mec0 is me1 */
+	ring->me = mec + 1;
+	ring->pipe = pipe;
+	ring->queue = queue;
+
+	ring->ring_obj = NULL;
+	ring->use_doorbell = true;
+	ring->doorbell_index = (adev->doorbell_index.mec_ring0 + ring_id) << 1;
+	ring->eop_gpu_addr = adev->gfx.mec.hpd_eop_gpu_addr
+				+ (ring_id * GFX9_MEC_HPD_SIZE);
+	ring->vm_hub = AMDGPU_GFXHUB_0;
+	sprintf(ring->name, "comp_%d.%d.%d", ring->me, ring->pipe, ring->queue);
+
+	irq_type = AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE0_EOP
+		+ ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
+		+ ring->pipe;
+	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
+			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
+	/* type-2 packets are deprecated on MEC, use type-3 instead */
+	return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
+				hw_prio, NULL);
+}
+
+static int gfx_v9_4_3_sw_init(void *handle)
+{
+	int i, j, k, r, ring_id;
+	struct amdgpu_kiq *kiq;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->gfx.mec.num_mec = 2;
+	adev->gfx.mec.num_pipe_per_mec = 4;
+	adev->gfx.mec.num_queue_per_pipe = 8;
+
+	/* EOP Event */
+	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_GRBM_CP, GFX_9_0__SRCID__CP_EOP_INTERRUPT, &adev->gfx.eop_irq);
+	if (r)
+		return r;
+
+	/* Privileged reg */
+	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_GRBM_CP, GFX_9_0__SRCID__CP_PRIV_REG_FAULT,
+			      &adev->gfx.priv_reg_irq);
+	if (r)
+		return r;
+
+	/* Privileged inst */
+	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_GRBM_CP, GFX_9_0__SRCID__CP_PRIV_INSTR_FAULT,
+			      &adev->gfx.priv_inst_irq);
+	if (r)
+		return r;
+
+	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
+
+	r = adev->gfx.rlc.funcs->init(adev);
+	if (r) {
+		DRM_ERROR("Failed to init rlc BOs!\n");
+		return r;
+	}
+
+	r = gfx_v9_4_3_mec_init(adev);
+	if (r) {
+		DRM_ERROR("Failed to init MEC BOs!\n");
+		return r;
+	}
+
+	/* set up the compute queues - allocate horizontally across pipes */
+	ring_id = 0;
+	for (i = 0; i < adev->gfx.mec.num_mec; ++i) {
+		for (j = 0; j < adev->gfx.mec.num_queue_per_pipe; j++) {
+			for (k = 0; k < adev->gfx.mec.num_pipe_per_mec; k++) {
+				if (!amdgpu_gfx_is_mec_queue_enabled(adev, 0, i,
+								     k, j))
+					continue;
+
+				r = gfx_v9_4_3_compute_ring_init(adev,
+							       ring_id,
+							       i, k, j);
+				if (r)
+					return r;
+
+				ring_id++;
+			}
+		}
+	}
+
+	r = amdgpu_gfx_kiq_init(adev, GFX9_MEC_HPD_SIZE, 0);
+	if (r) {
+		DRM_ERROR("Failed to init KIQ BOs!\n");
+		return r;
+	}
+
+	kiq = &adev->gfx.kiq[0];
+	r = amdgpu_gfx_kiq_init_ring(adev, &kiq->ring, &kiq->irq, 0);
+	if (r)
+		return r;
+
+	/* create MQD for all compute queues as wel as KIQ for SRIOV case */
+	r = amdgpu_gfx_mqd_sw_init(adev, sizeof(struct v9_mqd_allocation), 0);
+	if (r)
+		return r;
+
+	r = gfx_v9_4_3_gpu_early_init(adev);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static int gfx_v9_4_3_sw_fini(void *handle)
+{
+	int i;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++)
+		amdgpu_ring_fini(&adev->gfx.compute_ring[i]);
+
+	amdgpu_gfx_mqd_sw_fini(adev, 0);
+	amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
+	amdgpu_gfx_kiq_fini(adev, 0);
+
+	gfx_v9_4_3_mec_fini(adev);
+	amdgpu_bo_unref(&adev->gfx.rlc.clear_state_obj);
+	gfx_v9_4_3_free_microcode(adev);
+
+	return 0;
+}
+
+static u32 gfx_v9_4_3_get_rb_active_bitmap(struct amdgpu_device *adev)
+{
+	u32 data, mask;
+
+	data = RREG32_SOC15(GC, 0, regCC_RB_BACKEND_DISABLE);
+	data |= RREG32_SOC15(GC, 0, regGC_USER_RB_BACKEND_DISABLE);
+
+	data &= CC_RB_BACKEND_DISABLE__BACKEND_DISABLE_MASK;
+	data >>= GC_USER_RB_BACKEND_DISABLE__BACKEND_DISABLE__SHIFT;
+
+	mask = amdgpu_gfx_create_bitmask(adev->gfx.config.max_backends_per_se /
+					 adev->gfx.config.max_sh_per_se);
+
+	return (~data) & mask;
+}
+
+static void gfx_v9_4_3_setup_rb(struct amdgpu_device *adev)
+{
+	int i, j;
+	u32 data;
+	u32 active_rbs = 0;
+	u32 rb_bitmap_width_per_sh = adev->gfx.config.max_backends_per_se /
+					adev->gfx.config.max_sh_per_se;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
+		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
+			gfx_v9_4_3_select_se_sh(adev, i, j, 0xffffffff);
+			data = gfx_v9_4_3_get_rb_active_bitmap(adev);
+			active_rbs |= data << ((i * adev->gfx.config.max_sh_per_se + j) *
+					       rb_bitmap_width_per_sh);
+		}
+	}
+	gfx_v9_4_3_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	adev->gfx.config.backend_enable_mask = active_rbs;
+	adev->gfx.config.num_rbs = hweight32(active_rbs);
+}
+
+#define DEFAULT_SH_MEM_BASES	(0x6000)
+static void gfx_v9_4_3_init_compute_vmid(struct amdgpu_device *adev)
+{
+	int i;
+	uint32_t sh_mem_config;
+	uint32_t sh_mem_bases;
+
+	/*
+	 * Configure apertures:
+	 * LDS:         0x60000000'00000000 - 0x60000001'00000000 (4GB)
+	 * Scratch:     0x60000001'00000000 - 0x60000002'00000000 (4GB)
+	 * GPUVM:       0x60010000'00000000 - 0x60020000'00000000 (1TB)
+	 */
+	sh_mem_bases = DEFAULT_SH_MEM_BASES | (DEFAULT_SH_MEM_BASES << 16);
+
+	sh_mem_config = SH_MEM_ADDRESS_MODE_64 |
+			SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+			SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;
+
+	mutex_lock(&adev->srbm_mutex);
+	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
+		soc15_grbm_select(adev, 0, 0, 0, i);
+		/* CP and shaders */
+		WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, sh_mem_config);
+		WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, sh_mem_bases);
+	}
+	soc15_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
+	   acccess. These should be enabled by FW for target VMIDs. */
+	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_GWS_VMID0, i, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_OA_VMID0, i, 0);
+	}
+}
+
+static void gfx_v9_4_3_init_gds_vmid(struct amdgpu_device *adev)
+{
+	int vmid;
+
+	/*
+	 * Initialize all compute and user-gfx VMIDs to have no GDS, GWS, or OA
+	 * access. Compute VMIDs should be enabled by FW for target VMIDs,
+	 * the driver can enable them for graphics. VMID0 should maintain
+	 * access so that HWS firmware can save/restore entries.
+	 */
+	for (vmid = 1; vmid < AMDGPU_NUM_VMID; vmid++) {
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * vmid, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * vmid, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_GWS_VMID0, vmid, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGDS_OA_VMID0, vmid, 0);
+	}
+}
+
+static void gfx_v9_4_3_constants_init(struct amdgpu_device *adev)
+{
+	u32 tmp;
+	int i;
+
+	WREG32_FIELD15_PREREG(GC, 0, GRBM_CNTL, READ_TIMEOUT, 0xff);
+
+	gfx_v9_4_3_setup_rb(adev);
+	gfx_v9_4_3_get_cu_info(adev, &adev->gfx.cu_info);
+	adev->gfx.config.db_debug2 = RREG32_SOC15(GC, 0, regDB_DEBUG2);
+
+	/* XXX SH_MEM regs */
+	/* where to put LDS, scratch, GPUVM in FSA64 space */
+	mutex_lock(&adev->srbm_mutex);
+	for (i = 0; i < adev->vm_manager.id_mgr[AMDGPU_GFXHUB_0].num_ids; i++) {
+		soc15_grbm_select(adev, 0, 0, 0, i);
+		/* CP and shaders */
+		if (i == 0) {
+			tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
+					    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
+			tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
+					    !!adev->gmc.noretry);
+			WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, tmp);
+			WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, 0);
+		} else {
+			tmp = REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,
+					    SH_MEM_ALIGNMENT_MODE_UNALIGNED);
+			tmp = REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DISABLE,
+					    !!adev->gmc.noretry);
+			WREG32_SOC15_RLC(GC, 0, regSH_MEM_CONFIG, tmp);
+			tmp = REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BASE,
+				(adev->gmc.private_aperture_start >> 48));
+			tmp = REG_SET_FIELD(tmp, SH_MEM_BASES, SHARED_BASE,
+				(adev->gmc.shared_aperture_start >> 48));
+			WREG32_SOC15_RLC(GC, 0, regSH_MEM_BASES, tmp);
+		}
+	}
+	soc15_grbm_select(adev, 0, 0, 0, 0);
+
+	mutex_unlock(&adev->srbm_mutex);
+
+	gfx_v9_4_3_init_compute_vmid(adev);
+	gfx_v9_4_3_init_gds_vmid(adev);
+}
+
+static void gfx_v9_4_3_enable_save_restore_machine(struct amdgpu_device *adev)
+{
+	WREG32_FIELD15_PREREG(GC, 0, RLC_SRM_CNTL, SRM_ENABLE, 1);
+}
+
+static void gfx_v9_4_3_init_csb(struct amdgpu_device *adev)
+{
+	adev->gfx.rlc.funcs->get_csb_buffer(adev, adev->gfx.rlc.cs_ptr);
+	/* csib */
+	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_ADDR_HI),
+			adev->gfx.rlc.clear_state_gpu_addr >> 32);
+	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_ADDR_LO),
+			adev->gfx.rlc.clear_state_gpu_addr & 0xfffffffc);
+	WREG32_RLC(SOC15_REG_OFFSET(GC, 0, regRLC_CSIB_LENGTH),
+			adev->gfx.rlc.clear_state_size);
+}
+
+static void gfx_v9_4_3_init_pg(struct amdgpu_device *adev)
+{
+	gfx_v9_4_3_init_csb(adev);
+
+	/*
+	 * Rlc save restore list is workable since v2_1.
+	 * And it's needed by gfxoff feature.
+	 */
+	if (adev->gfx.rlc.is_rlc_v2_1)
+		gfx_v9_4_3_enable_save_restore_machine(adev);
+
+	if (adev->pg_flags & (AMD_PG_SUPPORT_GFX_PG |
+			      AMD_PG_SUPPORT_GFX_SMG |
+			      AMD_PG_SUPPORT_GFX_DMG |
+			      AMD_PG_SUPPORT_CP |
+			      AMD_PG_SUPPORT_GDS |
+			      AMD_PG_SUPPORT_RLC_SMU_HS)) {
+		WREG32_SOC15(GC, 0, regRLC_JUMP_TABLE_RESTORE,
+		       adev->gfx.rlc.cp_table_gpu_addr >> 8);
+	}
+}
+
+void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev)
+{
+	uint32_t data;
+
+	data = RREG32_SOC15(GC, 0, regCPC_PSP_DEBUG);
+	data |= CPC_PSP_DEBUG__UTCL2IUGPAOVERRIDE_MASK;
+	WREG32_SOC15(GC, 0, regCPC_PSP_DEBUG, data);
+}
+
 static bool gfx_v9_4_3_is_rlc_enabled(struct amdgpu_device *adev)
 {
 	uint32_t rlc_setting;
@@ -189,6 +1095,20 @@ static void gfx_v9_4_3_unset_safe_mode(struct amdgpu_device *adev)
 
 static int gfx_v9_4_3_rlc_init(struct amdgpu_device *adev)
 {
+	const struct cs_section_def *cs_data;
+	int r;
+
+	adev->gfx.rlc.cs_data = gfx9_cs_data;
+
+	cs_data = adev->gfx.rlc.cs_data;
+
+	if (cs_data) {
+		/* init clear state block */
+		r = amdgpu_gfx_rlc_init_csb(adev);
+		if (r)
+			return r;
+	}
+
 	/* init spm vmid with 0xf */
 	if (adev->gfx.rlc.funcs->update_spm_vmid)
 		adev->gfx.rlc.funcs->update_spm_vmid(adev, 0xf);
@@ -246,8 +1166,6 @@ static void gfx_v9_4_3_enable_gui_idle_interrupt(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_BUSY_INT_ENABLE, enable ? 1 : 0);
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_EMPTY_INT_ENABLE, enable ? 1 : 0);
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CMP_BUSY_INT_ENABLE, enable ? 1 : 0);
-	if(adev->gfx.num_gfx_rings)
-		tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, GFX_IDLE_INT_ENABLE, enable ? 1 : 0);
 
 	WREG32_SOC15(GC, 0, regCP_INT_CNTL_RING0, tmp);
 }
@@ -339,8 +1257,7 @@ static int gfx_v9_4_3_rlc_resume(struct amdgpu_device *adev)
 	/* disable CG */
 	WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, 0);
 
-	/* TODO: revisit pg function */
-	/* gfx_v9_4_3_init_pg(adev);*/
+	gfx_v9_4_3_init_pg(adev);
 
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
 		/* legacy rlc firmware loading */
@@ -407,24 +1324,1729 @@ static bool gfx_v9_4_3_is_rlcg_access_range(struct amdgpu_device *adev, u32 offs
 					ARRAY_SIZE(rlcg_access_gc_9_4_3));
 }
 
-const struct amdgpu_gfx_funcs gfx_v9_4_3_gfx_funcs = {
-        .get_gpu_clock_counter = &gfx_v9_4_3_get_gpu_clock_counter,
-        .select_se_sh = &gfx_v9_4_3_select_se_sh,
-        .read_wave_data = &gfx_v9_4_3_read_wave_data,
-        .read_wave_sgprs = &gfx_v9_4_3_read_wave_sgprs,
-        .read_wave_vgprs = &gfx_v9_4_3_read_wave_vgprs,
-        .select_me_pipe_q = &gfx_v9_4_3_select_me_pipe_q,
-};
+static void gfx_v9_4_3_cp_compute_enable(struct amdgpu_device *adev, bool enable)
+{
+	if (enable) {
+		WREG32_SOC15_RLC(GC, 0, regCP_MEC_CNTL, 0);
+	} else {
+		WREG32_SOC15_RLC(GC, 0, regCP_MEC_CNTL,
+			(CP_MEC_CNTL__MEC_ME1_HALT_MASK | CP_MEC_CNTL__MEC_ME2_HALT_MASK));
+		adev->gfx.kiq[0].ring.sched.ready = false;
+	}
+	udelay(50);
+}
 
-const struct amdgpu_rlc_funcs gfx_v9_4_3_rlc_funcs = {
-	.is_rlc_enabled = gfx_v9_4_3_is_rlc_enabled,
-	.set_safe_mode = gfx_v9_4_3_set_safe_mode,
-	.unset_safe_mode = gfx_v9_4_3_unset_safe_mode,
-	.init = gfx_v9_4_3_rlc_init,
-	.resume = gfx_v9_4_3_rlc_resume,
-	.stop = gfx_v9_4_3_rlc_stop,
-	.reset = gfx_v9_4_3_rlc_reset,
-	.start = gfx_v9_4_3_rlc_start,
-	.update_spm_vmid = gfx_v9_4_3_update_spm_vmid,
-	.is_rlcg_access_range = gfx_v9_4_3_is_rlcg_access_range,
+static int gfx_v9_4_3_cp_compute_load_microcode(struct amdgpu_device *adev)
+{
+	const struct gfx_firmware_header_v1_0 *mec_hdr;
+	const __le32 *fw_data;
+	unsigned i;
+	u32 tmp;
+	u32 mec_ucode_addr_offset;
+	u32 mec_ucode_data_offset;
+
+	if (!adev->gfx.mec_fw)
+		return -EINVAL;
+
+	gfx_v9_4_3_cp_compute_enable(adev, false);
+
+	mec_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->data;
+	amdgpu_ucode_print_gfx_hdr(&mec_hdr->header);
+
+	fw_data = (const __le32 *)
+		(adev->gfx.mec_fw->data +
+		 le32_to_cpu(mec_hdr->header.ucode_array_offset_bytes));
+	tmp = 0;
+	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, VMID, 0);
+	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, CACHE_POLICY, 0);
+	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_CNTL, tmp);
+
+	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_LO,
+		adev->gfx.mec.mec_fw_gpu_addr & 0xFFFFF000);
+	WREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_HI,
+		upper_32_bits(adev->gfx.mec.mec_fw_gpu_addr));
+
+	mec_ucode_addr_offset =
+		SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME1_UCODE_ADDR);
+	mec_ucode_data_offset =
+		SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME1_UCODE_DATA);
+
+	/* MEC1 */
+	WREG32(mec_ucode_addr_offset, mec_hdr->jt_offset);
+	for (i = 0; i < mec_hdr->jt_size; i++)
+		WREG32(mec_ucode_data_offset,
+		       le32_to_cpup(fw_data + mec_hdr->jt_offset + i));
+
+	WREG32(mec_ucode_addr_offset, adev->gfx.mec_fw_version);
+	/* Todo : Loading MEC2 firmware is only necessary if MEC2 should run different microcode than MEC1. */
+
+	return 0;
+}
+
+/* KIQ functions */
+static void gfx_v9_4_3_kiq_setting(struct amdgpu_ring *ring)
+{
+	uint32_t tmp;
+	struct amdgpu_device *adev = ring->adev;
+
+	/* tell RLC which is KIQ queue */
+	tmp = RREG32_SOC15(GC, 0, regRLC_CP_SCHEDULERS);
+	tmp &= 0xffffff00;
+	tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
+	WREG32_SOC15_RLC(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+	tmp |= 0x80;
+	WREG32_SOC15_RLC(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+}
+
+static void gfx_v9_4_3_mqd_set_priority(struct amdgpu_ring *ring, struct v9_mqd *mqd)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring->funcs->type == AMDGPU_RING_TYPE_COMPUTE) {
+		if (amdgpu_gfx_is_high_priority_compute_queue(adev, ring)) {
+			mqd->cp_hqd_pipe_priority = AMDGPU_GFX_PIPE_PRIO_HIGH;
+			mqd->cp_hqd_queue_priority =
+				AMDGPU_GFX_QUEUE_PRIORITY_MAXIMUM;
+		}
+	}
+}
+
+static int gfx_v9_4_3_mqd_init(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct v9_mqd *mqd = ring->mqd_ptr;
+	uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
+	uint32_t tmp;
+
+	mqd->header = 0xC0310800;
+	mqd->compute_pipelinestat_enable = 0x00000001;
+	mqd->compute_static_thread_mgmt_se0 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se1 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se2 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se3 = 0xffffffff;
+	mqd->compute_misc_reserved = 0x00000003;
+
+	mqd->dynamic_cu_mask_addr_lo =
+		lower_32_bits(ring->mqd_gpu_addr
+			      + offsetof(struct v9_mqd_allocation, dynamic_cu_mask));
+	mqd->dynamic_cu_mask_addr_hi =
+		upper_32_bits(ring->mqd_gpu_addr
+			      + offsetof(struct v9_mqd_allocation, dynamic_cu_mask));
+
+	eop_base_addr = ring->eop_gpu_addr >> 8;
+	mqd->cp_hqd_eop_base_addr_lo = eop_base_addr;
+	mqd->cp_hqd_eop_base_addr_hi = upper_32_bits(eop_base_addr);
+
+	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_EOP_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
+			(order_base_2(GFX9_MEC_HPD_SIZE / 4) - 1));
+
+	mqd->cp_hqd_eop_control = tmp;
+
+	/* enable doorbell? */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+
+	if (ring->use_doorbell) {
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_OFFSET, ring->doorbell_index);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 1);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_SOURCE, 0);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_HIT, 0);
+	} else {
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+					 DOORBELL_EN, 0);
+	}
+
+	mqd->cp_hqd_pq_doorbell_control = tmp;
+
+	/* disable the queue if it's active */
+	ring->wptr = 0;
+	mqd->cp_hqd_dequeue_request = 0;
+	mqd->cp_hqd_pq_rptr = 0;
+	mqd->cp_hqd_pq_wptr_lo = 0;
+	mqd->cp_hqd_pq_wptr_hi = 0;
+
+	/* set the pointer to the MQD */
+	mqd->cp_mqd_base_addr_lo = ring->mqd_gpu_addr & 0xfffffffc;
+	mqd->cp_mqd_base_addr_hi = upper_32_bits(ring->mqd_gpu_addr);
+
+	/* set MQD vmid to 0 */
+	tmp = RREG32_SOC15(GC, 0, regCP_MQD_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
+	mqd->cp_mqd_control = tmp;
+
+	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
+	hqd_gpu_addr = ring->gpu_addr >> 8;
+	mqd->cp_hqd_pq_base_lo = hqd_gpu_addr;
+	mqd->cp_hqd_pq_base_hi = upper_32_bits(hqd_gpu_addr);
+
+	/* set up the HQD, this is similar to CP_RB0_CNTL */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PQ_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
+			    (order_base_2(ring->ring_size / 4) - 1));
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
+			((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) << 8));
+#ifdef __BIG_ENDIAN
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
+#endif
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 0);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ROQ_PQ_IB_FLIP, 0);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
+	mqd->cp_hqd_pq_control = tmp;
+
+	/* set the wb address whether it's enabled or not */
+	wb_gpu_addr = adev->wb.gpu_addr + (ring->rptr_offs * 4);
+	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
+	mqd->cp_hqd_pq_rptr_report_addr_hi =
+		upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
+	wb_gpu_addr = adev->wb.gpu_addr + (ring->wptr_offs * 4);
+	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffffc;
+	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	/* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
+	ring->wptr = 0;
+	mqd->cp_hqd_pq_rptr = RREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR);
+
+	/* set the vmid for the queue */
+	mqd->cp_hqd_vmid = 0;
+
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PERSISTENT_STATE);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PERSISTENT_STATE, PRELOAD_SIZE, 0x53);
+	mqd->cp_hqd_persistent_state = tmp;
+
+	/* set MIN_IB_AVAIL_SIZE */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_IB_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_IB_CONTROL, MIN_IB_AVAIL_SIZE, 3);
+	mqd->cp_hqd_ib_control = tmp;
+
+	/* set static priority for a queue/ring */
+	gfx_v9_4_3_mqd_set_priority(ring, mqd);
+	mqd->cp_hqd_quantum = RREG32(regCP_HQD_QUANTUM);
+
+	/* map_queues packet doesn't need activate the queue,
+	 * so only kiq need set this field.
+	 */
+	if (ring->funcs->type == AMDGPU_RING_TYPE_KIQ)
+		mqd->cp_hqd_active = 1;
+
+	return 0;
+}
+
+static int gfx_v9_4_3_kiq_init_register(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct v9_mqd *mqd = ring->mqd_ptr;
+	int j;
+
+	/* disable wptr polling */
+	WREG32_FIELD15_PREREG(GC, 0, CP_PQ_WPTR_POLL_CNTL, EN, 0);
+
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_BASE_ADDR,
+	       mqd->cp_hqd_eop_base_addr_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_BASE_ADDR_HI,
+	       mqd->cp_hqd_eop_base_addr_hi);
+
+	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_EOP_CONTROL,
+	       mqd->cp_hqd_eop_control);
+
+	/* enable doorbell? */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
+	       mqd->cp_hqd_pq_doorbell_control);
+
+	/* disable the queue if it's active */
+	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+		for (j = 0; j < adev->usec_timeout; j++) {
+			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+				break;
+			udelay(1);
+		}
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST,
+		       mqd->cp_hqd_dequeue_request);
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR,
+		       mqd->cp_hqd_pq_rptr);
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO,
+		       mqd->cp_hqd_pq_wptr_lo);
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI,
+		       mqd->cp_hqd_pq_wptr_hi);
+	}
+
+	/* set the pointer to the MQD */
+	WREG32_SOC15_RLC(GC, 0, regCP_MQD_BASE_ADDR,
+	       mqd->cp_mqd_base_addr_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_MQD_BASE_ADDR_HI,
+	       mqd->cp_mqd_base_addr_hi);
+
+	/* set MQD vmid to 0 */
+	WREG32_SOC15_RLC(GC, 0, regCP_MQD_CONTROL,
+	       mqd->cp_mqd_control);
+
+	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_BASE,
+	       mqd->cp_hqd_pq_base_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_BASE_HI,
+	       mqd->cp_hqd_pq_base_hi);
+
+	/* set up the HQD, this is similar to CP_RB0_CNTL */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_CONTROL,
+	       mqd->cp_hqd_pq_control);
+
+	/* set the wb address whether it's enabled or not */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR,
+				mqd->cp_hqd_pq_rptr_report_addr_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
+				mqd->cp_hqd_pq_rptr_report_addr_hi);
+
+	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR,
+	       mqd->cp_hqd_pq_wptr_poll_addr_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR_HI,
+	       mqd->cp_hqd_pq_wptr_poll_addr_hi);
+
+	/* enable the doorbell if requested */
+	if (ring->use_doorbell) {
+		WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_LOWER,
+					(adev->doorbell_index.kiq * 2) << 2);
+		WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_UPPER,
+				(adev->doorbell_index.userqueue_end * 2) << 2);
+	}
+
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
+	       mqd->cp_hqd_pq_doorbell_control);
+
+	/* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO,
+	       mqd->cp_hqd_pq_wptr_lo);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI,
+	       mqd->cp_hqd_pq_wptr_hi);
+
+	/* set the vmid for the queue */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_VMID, mqd->cp_hqd_vmid);
+
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PERSISTENT_STATE,
+	       mqd->cp_hqd_persistent_state);
+
+	/* activate the queue */
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_ACTIVE,
+	       mqd->cp_hqd_active);
+
+	if (ring->use_doorbell)
+		WREG32_FIELD15_PREREG(GC, 0, CP_PQ_STATUS, DOORBELL_ENABLE, 1);
+
+	return 0;
+}
+
+static int gfx_v9_4_3_kiq_fini_register(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	int j;
+
+	/* disable the queue if it's active */
+	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+
+		for (j = 0; j < adev->usec_timeout; j++) {
+			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+				break;
+			udelay(1);
+		}
+
+		if (j == AMDGPU_MAX_USEC_TIMEOUT) {
+			DRM_DEBUG("KIQ dequeue request failed.\n");
+
+			/* Manual disable if dequeue request times out */
+			WREG32_SOC15_RLC(GC, 0, regCP_HQD_ACTIVE, 0);
+		}
+
+		WREG32_SOC15_RLC(GC, 0, regCP_HQD_DEQUEUE_REQUEST,
+		      0);
+	}
+
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_IQ_TIMER, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_IB_CONTROL, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PERSISTENT_STATE, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0x40000000);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_RPTR, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_HI, 0);
+	WREG32_SOC15_RLC(GC, 0, regCP_HQD_PQ_WPTR_LO, 0);
+
+	return 0;
+}
+
+static int gfx_v9_4_3_kiq_init_queue(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct v9_mqd *mqd = ring->mqd_ptr;
+	struct v9_mqd *tmp_mqd;
+
+	gfx_v9_4_3_kiq_setting(ring);
+
+	/* GPU could be in bad state during probe, driver trigger the reset
+	 * after load the SMU, in this case , the mqd is not be initialized.
+	 * driver need to re-init the mqd.
+	 * check mqd->cp_hqd_pq_control since this value should not be 0
+	 */
+	tmp_mqd = (struct v9_mqd *)adev->gfx.kiq[0].mqd_backup;
+	if (amdgpu_in_reset(adev) && tmp_mqd->cp_hqd_pq_control){
+		/* for GPU_RESET case , reset MQD to a clean status */
+		if (adev->gfx.kiq[0].mqd_backup)
+			memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(struct v9_mqd_allocation));
+
+		/* reset ring buffer */
+		ring->wptr = 0;
+		amdgpu_ring_clear_ring(ring);
+
+		mutex_lock(&adev->srbm_mutex);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
+		gfx_v9_4_3_kiq_init_register(ring);
+		soc15_grbm_select(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+	} else {
+		memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
+		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
+		((struct v9_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
+		mutex_lock(&adev->srbm_mutex);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
+		gfx_v9_4_3_mqd_init(ring);
+		gfx_v9_4_3_kiq_init_register(ring);
+		soc15_grbm_select(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+
+		if (adev->gfx.kiq[0].mqd_backup)
+			memcpy(adev->gfx.kiq[0].mqd_backup, mqd, sizeof(struct v9_mqd_allocation));
+	}
+
+	return 0;
+}
+
+static int gfx_v9_4_3_kcq_init_queue(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct v9_mqd *mqd = ring->mqd_ptr;
+	int mqd_idx = ring - &adev->gfx.compute_ring[0];
+	struct v9_mqd *tmp_mqd;
+
+	/* Same as above kiq init, driver need to re-init the mqd if mqd->cp_hqd_pq_control
+	 * is not be initialized before
+	 */
+	tmp_mqd = (struct v9_mqd *)adev->gfx.mec.mqd_backup[mqd_idx];
+
+	if (!tmp_mqd->cp_hqd_pq_control ||
+	    (!amdgpu_in_reset(adev) && !adev->in_suspend)) {
+		memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
+		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
+		((struct v9_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
+		mutex_lock(&adev->srbm_mutex);
+		soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
+		gfx_v9_4_3_mqd_init(ring);
+		soc15_grbm_select(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+
+		if (adev->gfx.mec.mqd_backup[mqd_idx])
+			memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(struct v9_mqd_allocation));
+	} else if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
+		/* reset MQD to a clean status */
+		if (adev->gfx.mec.mqd_backup[mqd_idx])
+			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(struct v9_mqd_allocation));
+
+		/* reset ring buffer */
+		ring->wptr = 0;
+		atomic64_set((atomic64_t *)&adev->wb.wb[ring->wptr_offs], 0);
+		amdgpu_ring_clear_ring(ring);
+	} else {
+		amdgpu_ring_clear_ring(ring);
+	}
+
+	return 0;
+}
+
+static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+	int r;
+
+	ring = &adev->gfx.kiq[0].ring;
+
+	r = amdgpu_bo_reserve(ring->mqd_obj, false);
+	if (unlikely(r != 0))
+		return r;
+
+	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
+	if (unlikely(r != 0))
+		return r;
+
+	gfx_v9_4_3_kiq_init_queue(ring);
+	amdgpu_bo_kunmap(ring->mqd_obj);
+	ring->mqd_ptr = NULL;
+	amdgpu_bo_unreserve(ring->mqd_obj);
+	ring->sched.ready = true;
+	return 0;
+}
+
+static int gfx_v9_4_3_kcq_resume(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring = NULL;
+	int r = 0, i;
+
+	gfx_v9_4_3_cp_compute_enable(adev, true);
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+		ring = &adev->gfx.compute_ring[i];
+
+		r = amdgpu_bo_reserve(ring->mqd_obj, false);
+		if (unlikely(r != 0))
+			goto done;
+		r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
+		if (!r) {
+			r = gfx_v9_4_3_kcq_init_queue(ring);
+			amdgpu_bo_kunmap(ring->mqd_obj);
+			ring->mqd_ptr = NULL;
+		}
+		amdgpu_bo_unreserve(ring->mqd_obj);
+		if (r)
+			goto done;
+	}
+
+	r = amdgpu_gfx_enable_kcq(adev, 0);
+done:
+	return r;
+}
+
+static int gfx_v9_4_3_cp_resume(struct amdgpu_device *adev)
+{
+	int r, i;
+	struct amdgpu_ring *ring;
+
+	gfx_v9_4_3_enable_gui_idle_interrupt(adev, false);
+
+	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
+		gfx_v9_4_3_disable_gpa_mode(adev);
+
+		r = gfx_v9_4_3_cp_compute_load_microcode(adev);
+		if (r)
+			return r;
+	}
+
+	r = gfx_v9_4_3_kiq_resume(adev);
+	if (r)
+		return r;
+
+	r = gfx_v9_4_3_kcq_resume(adev);
+	if (r)
+		return r;
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+		ring = &adev->gfx.compute_ring[i];
+		amdgpu_ring_test_helper(ring);
+	}
+
+	gfx_v9_4_3_enable_gui_idle_interrupt(adev, true);
+
+	return 0;
+}
+
+static void gfx_v9_4_3_cp_enable(struct amdgpu_device *adev, bool enable)
+{
+	gfx_v9_4_3_cp_compute_enable(adev, enable);
+}
+
+static int gfx_v9_4_3_hw_init(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	gfx_v9_4_3_init_golden_registers(adev);
+
+	gfx_v9_4_3_constants_init(adev);
+
+	r = adev->gfx.rlc.funcs->resume(adev);
+	if (r)
+		return r;
+
+	r = gfx_v9_4_3_cp_resume(adev);
+	if (r)
+		return r;
+
+	return r;
+}
+
+static int gfx_v9_4_3_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
+	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
+
+	if (amdgpu_gfx_disable_kcq(adev, 0))
+		DRM_ERROR("KCQ disable failed\n");
+
+	/* Use deinitialize sequence from CAIL when unbinding device from driver,
+	 * otherwise KIQ is hanging when binding back
+	 */
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
+		mutex_lock(&adev->srbm_mutex);
+		soc15_grbm_select(adev, adev->gfx.kiq[0].ring.me,
+				adev->gfx.kiq[0].ring.pipe,
+				adev->gfx.kiq[0].ring.queue, 0);
+		gfx_v9_4_3_kiq_fini_register(&adev->gfx.kiq[0].ring);
+		soc15_grbm_select(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+	}
+
+	gfx_v9_4_3_cp_enable(adev, false);
+
+	/* Skip suspend with A+A reset */
+	if (adev->gmc.xgmi.connected_to_cpu && amdgpu_in_reset(adev)) {
+		dev_dbg(adev->dev, "Device in reset. Skipping RLC halt\n");
+		return 0;
+	}
+
+	adev->gfx.rlc.funcs->stop(adev);
+	return 0;
+}
+
+static int gfx_v9_4_3_suspend(void *handle)
+{
+	return gfx_v9_4_3_hw_fini(handle);
+}
+
+static int gfx_v9_4_3_resume(void *handle)
+{
+	return gfx_v9_4_3_hw_init(handle);
+}
+
+static bool gfx_v9_4_3_is_idle(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, regGRBM_STATUS),
+				GRBM_STATUS, GUI_ACTIVE))
+		return false;
+	else
+		return true;
+}
+
+static int gfx_v9_4_3_wait_for_idle(void *handle)
+{
+	unsigned i;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	for (i = 0; i < adev->usec_timeout; i++) {
+		if (gfx_v9_4_3_is_idle(handle))
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int gfx_v9_4_3_soft_reset(void *handle)
+{
+	u32 grbm_soft_reset = 0;
+	u32 tmp;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* GRBM_STATUS */
+	tmp = RREG32_SOC15(GC, 0, regGRBM_STATUS);
+	if (tmp & (GRBM_STATUS__PA_BUSY_MASK | GRBM_STATUS__SC_BUSY_MASK |
+		   GRBM_STATUS__BCI_BUSY_MASK | GRBM_STATUS__SX_BUSY_MASK |
+		   GRBM_STATUS__TA_BUSY_MASK | GRBM_STATUS__VGT_BUSY_MASK |
+		   GRBM_STATUS__DB_BUSY_MASK | GRBM_STATUS__CB_BUSY_MASK |
+		   GRBM_STATUS__GDS_BUSY_MASK | GRBM_STATUS__SPI_BUSY_MASK |
+		   GRBM_STATUS__IA_BUSY_MASK | GRBM_STATUS__IA_BUSY_NO_DMA_MASK)) {
+		grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
+						GRBM_SOFT_RESET, SOFT_RESET_CP, 1);
+		grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
+						GRBM_SOFT_RESET, SOFT_RESET_GFX, 1);
+	}
+
+	if (tmp & (GRBM_STATUS__CP_BUSY_MASK | GRBM_STATUS__CP_COHERENCY_BUSY_MASK)) {
+		grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
+						GRBM_SOFT_RESET, SOFT_RESET_CP, 1);
+	}
+
+	/* GRBM_STATUS2 */
+	tmp = RREG32_SOC15(GC, 0, regGRBM_STATUS2);
+	if (REG_GET_FIELD(tmp, GRBM_STATUS2, RLC_BUSY))
+		grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
+						GRBM_SOFT_RESET, SOFT_RESET_RLC, 1);
+
+
+	if (grbm_soft_reset) {
+		/* stop the rlc */
+		adev->gfx.rlc.funcs->stop(adev);
+
+		/* Disable MEC parsing/prefetching */
+		gfx_v9_4_3_cp_compute_enable(adev, false);
+
+		if (grbm_soft_reset) {
+			tmp = RREG32_SOC15(GC, 0, regGRBM_SOFT_RESET);
+			tmp |= grbm_soft_reset;
+			dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
+			WREG32_SOC15(GC, 0, regGRBM_SOFT_RESET, tmp);
+			tmp = RREG32_SOC15(GC, 0, regGRBM_SOFT_RESET);
+
+			udelay(50);
+
+			tmp &= ~grbm_soft_reset;
+			WREG32_SOC15(GC, 0, regGRBM_SOFT_RESET, tmp);
+			tmp = RREG32_SOC15(GC, 0, regGRBM_SOFT_RESET);
+		}
+
+		/* Wait a little for things to settle down */
+		udelay(50);
+	}
+	return 0;
+}
+
+static void gfx_v9_4_3_ring_emit_gds_switch(struct amdgpu_ring *ring,
+					  uint32_t vmid,
+					  uint32_t gds_base, uint32_t gds_size,
+					  uint32_t gws_base, uint32_t gws_size,
+					  uint32_t oa_base, uint32_t oa_size)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	/* GDS Base */
+	gfx_v9_4_3_write_data_to_reg(ring, 0, false,
+				   SOC15_REG_OFFSET(GC, 0, regGDS_VMID0_BASE) + 2 * vmid,
+				   gds_base);
+
+	/* GDS Size */
+	gfx_v9_4_3_write_data_to_reg(ring, 0, false,
+				   SOC15_REG_OFFSET(GC, 0, regGDS_VMID0_SIZE) + 2 * vmid,
+				   gds_size);
+
+	/* GWS */
+	gfx_v9_4_3_write_data_to_reg(ring, 0, false,
+				   SOC15_REG_OFFSET(GC, 0, regGDS_GWS_VMID0) + vmid,
+				   gws_size << GDS_GWS_VMID0__SIZE__SHIFT | gws_base);
+
+	/* OA */
+	gfx_v9_4_3_write_data_to_reg(ring, 0, false,
+				   SOC15_REG_OFFSET(GC, 0, regGDS_OA_VMID0) + vmid,
+				   (1 << (oa_size + oa_base)) - (1 << oa_base));
+}
+
+static int gfx_v9_4_3_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->gfx.num_compute_rings = min(amdgpu_gfx_get_num_kcq(adev),
+					  AMDGPU_MAX_COMPUTE_RINGS);
+	gfx_v9_4_3_set_kiq_pm4_funcs(adev);
+	gfx_v9_4_3_set_ring_funcs(adev);
+	gfx_v9_4_3_set_irq_funcs(adev);
+	gfx_v9_4_3_set_gds_init(adev);
+	gfx_v9_4_3_set_rlc_funcs(adev);
+
+	return gfx_v9_4_3_init_microcode(adev);
+}
+
+static int gfx_v9_4_3_late_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int r;
+
+	r = amdgpu_irq_get(adev, &adev->gfx.priv_reg_irq, 0);
+	if (r)
+		return r;
+
+	r = amdgpu_irq_get(adev, &adev->gfx.priv_inst_irq, 0);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static void gfx_v9_4_3_update_medium_grain_clock_gating(struct amdgpu_device *adev,
+						      bool enable)
+{
+	uint32_t data, def;
+
+	amdgpu_gfx_rlc_enter_safe_mode(adev);
+
+	/* It is disabled by HW by default */
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_GFX_MGCG)) {
+		/* 1 - RLC_CGTT_MGCG_OVERRIDE */
+		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+
+		data &= ~(RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
+			  RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGCG_OVERRIDE_MASK |
+			  RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGLS_OVERRIDE_MASK);
+
+		/* only for Vega10 & Raven1 */
+		data |= RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK;
+
+		if (def != data)
+			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+
+		/* MGLS is a global flag to control all MGLS in GFX */
+		if (adev->cg_flags & AMD_CG_SUPPORT_GFX_MGLS) {
+			/* 2 - RLC memory Light sleep */
+			if (adev->cg_flags & AMD_CG_SUPPORT_GFX_RLC_LS) {
+				def = data = RREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL);
+				data |= RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK;
+				if (def != data)
+					WREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL, data);
+			}
+			/* 3 - CP memory Light sleep */
+			if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CP_LS) {
+				def = data = RREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL);
+				data |= CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK;
+				if (def != data)
+					WREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL, data);
+			}
+		}
+	} else {
+		/* 1 - MGCG_OVERRIDE */
+		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+
+		data |= (RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK |
+			 RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
+			 RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGCG_OVERRIDE_MASK |
+			 RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGLS_OVERRIDE_MASK);
+
+		if (def != data)
+			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+
+		/* 2 - disable MGLS in RLC */
+		data = RREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL);
+		if (data & RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK) {
+			data &= ~RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK;
+			WREG32_SOC15(GC, 0, regRLC_MEM_SLP_CNTL, data);
+		}
+
+		/* 3 - disable MGLS in CP */
+		data = RREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL);
+		if (data & CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK) {
+			data &= ~CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK;
+			WREG32_SOC15(GC, 0, regCP_MEM_SLP_CNTL, data);
+		}
+	}
+
+	amdgpu_gfx_rlc_exit_safe_mode(adev);
+}
+
+static void gfx_v9_4_3_update_coarse_grain_clock_gating(struct amdgpu_device *adev,
+						      bool enable)
+{
+	uint32_t def, data;
+
+	amdgpu_gfx_rlc_enter_safe_mode(adev);
+
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGCG)) {
+		def = data = RREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE);
+		/* unset CGCG override */
+		data &= ~RLC_CGTT_MGCG_OVERRIDE__GFXIP_CGCG_OVERRIDE_MASK;
+		if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGLS)
+			data &= ~RLC_CGTT_MGCG_OVERRIDE__GFXIP_CGLS_OVERRIDE_MASK;
+		else
+			data |= RLC_CGTT_MGCG_OVERRIDE__GFXIP_CGLS_OVERRIDE_MASK;
+		/* update CGCG and CGLS override bits */
+		if (def != data)
+			WREG32_SOC15(GC, 0, regRLC_CGTT_MGCG_OVERRIDE, data);
+
+		/* enable cgcg FSM(0x0000363F) */
+		def = RREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL);
+
+		if (adev->asic_type == CHIP_ARCTURUS)
+			data = (0x2000 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |
+				RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
+		else
+			data = (0x36 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |
+				RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
+		if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGLS)
+			data |= (0x000F << RLC_CGCG_CGLS_CTRL__CGLS_REP_COMPANSAT_DELAY__SHIFT) |
+				RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK;
+		if (def != data)
+			WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, data);
+
+		/* set IDLE_POLL_COUNT(0x00900100) */
+		def = RREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_CNTL);
+		data = (0x0100 << CP_RB_WPTR_POLL_CNTL__POLL_FREQUENCY__SHIFT) |
+			(0x0090 << CP_RB_WPTR_POLL_CNTL__IDLE_POLL_COUNT__SHIFT);
+		if (def != data)
+			WREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_CNTL, data);
+	} else {
+		def = data = RREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL);
+		/* reset CGCG/CGLS bits */
+		data &= ~(RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK | RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK);
+		/* disable cgcg and cgls in FSM */
+		if (def != data)
+			WREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL, data);
+	}
+
+	amdgpu_gfx_rlc_exit_safe_mode(adev);
+}
+
+static int gfx_v9_4_3_update_gfx_clock_gating(struct amdgpu_device *adev,
+					    bool enable)
+{
+	if (enable) {
+		/* CGCG/CGLS should be enabled after MGCG/MGLS
+		 * ===  MGCG + MGLS ===
+		 */
+		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable);
+		/* ===  CGCG + CGLS === */
+		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable);
+	} else {
+		/* CGCG/CGLS should be disabled before MGCG/MGLS
+		 * ===  CGCG + CGLS ===
+		 */
+		gfx_v9_4_3_update_coarse_grain_clock_gating(adev, enable);
+		/* ===  MGCG + MGLS === */
+		gfx_v9_4_3_update_medium_grain_clock_gating(adev, enable);
+	}
+	return 0;
+}
+
+static const struct amdgpu_rlc_funcs gfx_v9_4_3_rlc_funcs = {
+	.is_rlc_enabled = gfx_v9_4_3_is_rlc_enabled,
+	.set_safe_mode = gfx_v9_4_3_set_safe_mode,
+	.unset_safe_mode = gfx_v9_4_3_unset_safe_mode,
+	.init = gfx_v9_4_3_rlc_init,
+	.get_csb_size = gfx_v9_4_3_get_csb_size,
+	.get_csb_buffer = gfx_v9_4_3_get_csb_buffer,
+	.resume = gfx_v9_4_3_rlc_resume,
+	.stop = gfx_v9_4_3_rlc_stop,
+	.reset = gfx_v9_4_3_rlc_reset,
+	.start = gfx_v9_4_3_rlc_start,
+	.update_spm_vmid = gfx_v9_4_3_update_spm_vmid,
+	.is_rlcg_access_range = gfx_v9_4_3_is_rlcg_access_range,
+};
+
+static int gfx_v9_4_3_set_powergating_state(void *handle,
+					  enum amd_powergating_state state)
+{
+	return 0;
+}
+
+static int gfx_v9_4_3_set_clockgating_state(void *handle,
+					  enum amd_clockgating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(9, 4, 3):
+		gfx_v9_4_3_update_gfx_clock_gating(adev,
+						 state == AMD_CG_STATE_GATE);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static void gfx_v9_4_3_get_clockgating_state(void *handle, u64 *flags)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int data;
+
+	if (amdgpu_sriov_vf(adev))
+		*flags = 0;
+
+	/* AMD_CG_SUPPORT_GFX_MGCG */
+	data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, regRLC_CGTT_MGCG_OVERRIDE));
+	if (!(data & RLC_CGTT_MGCG_OVERRIDE__GFXIP_MGCG_OVERRIDE_MASK))
+		*flags |= AMD_CG_SUPPORT_GFX_MGCG;
+
+	/* AMD_CG_SUPPORT_GFX_CGCG */
+	data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, regRLC_CGCG_CGLS_CTRL));
+	if (data & RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK)
+		*flags |= AMD_CG_SUPPORT_GFX_CGCG;
+
+	/* AMD_CG_SUPPORT_GFX_CGLS */
+	if (data & RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK)
+		*flags |= AMD_CG_SUPPORT_GFX_CGLS;
+
+	/* AMD_CG_SUPPORT_GFX_RLC_LS */
+	data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, regRLC_MEM_SLP_CNTL));
+	if (data & RLC_MEM_SLP_CNTL__RLC_MEM_LS_EN_MASK)
+		*flags |= AMD_CG_SUPPORT_GFX_RLC_LS | AMD_CG_SUPPORT_GFX_MGLS;
+
+	/* AMD_CG_SUPPORT_GFX_CP_LS */
+	data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, regCP_MEM_SLP_CNTL));
+	if (data & CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK)
+		*flags |= AMD_CG_SUPPORT_GFX_CP_LS | AMD_CG_SUPPORT_GFX_MGLS;
+}
+
+static void gfx_v9_4_3_ring_emit_hdp_flush(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	u32 ref_and_mask, reg_mem_engine;
+	const struct nbio_hdp_flush_reg *nbio_hf_reg = adev->nbio.hdp_flush_reg;
+
+	if (ring->funcs->type == AMDGPU_RING_TYPE_COMPUTE) {
+		switch (ring->me) {
+		case 1:
+			ref_and_mask = nbio_hf_reg->ref_and_mask_cp2 << ring->pipe;
+			break;
+		case 2:
+			ref_and_mask = nbio_hf_reg->ref_and_mask_cp6 << ring->pipe;
+			break;
+		default:
+			return;
+		}
+		reg_mem_engine = 0;
+	} else {
+		ref_and_mask = nbio_hf_reg->ref_and_mask_cp0;
+		reg_mem_engine = 1; /* pfp */
+	}
+
+	gfx_v9_4_3_wait_reg_mem(ring, reg_mem_engine, 0, 1,
+			      adev->nbio.funcs->get_hdp_flush_req_offset(adev),
+			      adev->nbio.funcs->get_hdp_flush_done_offset(adev),
+			      ref_and_mask, ref_and_mask, 0x20);
+}
+
+static void gfx_v9_4_3_ring_emit_ib_compute(struct amdgpu_ring *ring,
+					  struct amdgpu_job *job,
+					  struct amdgpu_ib *ib,
+					  uint32_t flags)
+{
+	unsigned vmid = AMDGPU_JOB_GET_VMID(job);
+	u32 control = INDIRECT_BUFFER_VALID | ib->length_dw | (vmid << 24);
+
+	/* Currently, there is a high possibility to get wave ID mismatch
+	 * between ME and GDS, leading to a hw deadlock, because ME generates
+	 * different wave IDs than the GDS expects. This situation happens
+	 * randomly when at least 5 compute pipes use GDS ordered append.
+	 * The wave IDs generated by ME are also wrong after suspend/resume.
+	 * Those are probably bugs somewhere else in the kernel driver.
+	 *
+	 * Writing GDS_COMPUTE_MAX_WAVE_ID resets wave ID counters in ME and
+	 * GDS to 0 for this ring (me/pipe).
+	 */
+	if (ib->flags & AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID) {
+		amdgpu_ring_write(ring, PACKET3(PACKET3_SET_CONFIG_REG, 1));
+		amdgpu_ring_write(ring, regGDS_COMPUTE_MAX_WAVE_ID);
+		amdgpu_ring_write(ring, ring->adev->gds.gds_compute_max_wave_id);
+	}
+
+	amdgpu_ring_write(ring, PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+	BUG_ON(ib->gpu_addr & 0x3); /* Dword align */
+	amdgpu_ring_write(ring,
+#ifdef __BIG_ENDIAN
+				(2 << 0) |
+#endif
+				lower_32_bits(ib->gpu_addr));
+	amdgpu_ring_write(ring, upper_32_bits(ib->gpu_addr));
+	amdgpu_ring_write(ring, control);
+}
+
+static void gfx_v9_4_3_ring_emit_fence(struct amdgpu_ring *ring, u64 addr,
+				     u64 seq, unsigned flags)
+{
+	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
+	bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
+	bool writeback = flags & AMDGPU_FENCE_FLAG_TC_WB_ONLY;
+
+	/* RELEASE_MEM - flush caches, send int */
+	amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE_MEM, 6));
+	amdgpu_ring_write(ring, ((writeback ? (EOP_TC_WB_ACTION_EN |
+					       EOP_TC_NC_ACTION_EN) :
+					      (EOP_TCL1_ACTION_EN |
+					       EOP_TC_ACTION_EN |
+					       EOP_TC_WB_ACTION_EN |
+					       EOP_TC_MD_ACTION_EN)) |
+				 EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
+				 EVENT_INDEX(5)));
+	amdgpu_ring_write(ring, DATA_SEL(write64bit ? 2 : 1) | INT_SEL(int_sel ? 2 : 0));
+
+	/*
+	 * the address should be Qword aligned if 64bit write, Dword
+	 * aligned if only send 32bit data low (discard data high)
+	 */
+	if (write64bit)
+		BUG_ON(addr & 0x7);
+	else
+		BUG_ON(addr & 0x3);
+	amdgpu_ring_write(ring, lower_32_bits(addr));
+	amdgpu_ring_write(ring, upper_32_bits(addr));
+	amdgpu_ring_write(ring, lower_32_bits(seq));
+	amdgpu_ring_write(ring, upper_32_bits(seq));
+	amdgpu_ring_write(ring, 0);
+}
+
+static void gfx_v9_4_3_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
+{
+	int usepfp = (ring->funcs->type == AMDGPU_RING_TYPE_GFX);
+	uint32_t seq = ring->fence_drv.sync_seq;
+	uint64_t addr = ring->fence_drv.gpu_addr;
+
+	gfx_v9_4_3_wait_reg_mem(ring, usepfp, 1, 0,
+			      lower_32_bits(addr), upper_32_bits(addr),
+			      seq, 0xffffffff, 4);
+}
+
+static void gfx_v9_4_3_ring_emit_vm_flush(struct amdgpu_ring *ring,
+					unsigned vmid, uint64_t pd_addr)
+{
+	amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
+}
+
+static u64 gfx_v9_4_3_ring_get_rptr_compute(struct amdgpu_ring *ring)
+{
+	return ring->adev->wb.wb[ring->rptr_offs]; /* gfx9 hardware is 32bit rptr */
+}
+
+static u64 gfx_v9_4_3_ring_get_wptr_compute(struct amdgpu_ring *ring)
+{
+	u64 wptr;
+
+	/* XXX check if swapping is necessary on BE */
+	if (ring->use_doorbell)
+		wptr = atomic64_read((atomic64_t *)&ring->adev->wb.wb[ring->wptr_offs]);
+	else
+		BUG();
+	return wptr;
+}
+
+static void gfx_v9_4_3_ring_set_wptr_compute(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	/* XXX check if swapping is necessary on BE */
+	if (ring->use_doorbell) {
+		atomic64_set((atomic64_t *)&adev->wb.wb[ring->wptr_offs], ring->wptr);
+		WDOORBELL64(ring->doorbell_index, ring->wptr);
+	} else{
+		BUG(); /* only DOORBELL method supported on gfx9 now */
+	}
+}
+
+static void gfx_v9_4_3_ring_emit_fence_kiq(struct amdgpu_ring *ring, u64 addr,
+					 u64 seq, unsigned int flags)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	/* we only allocate 32bit for each seq wb address */
+	BUG_ON(flags & AMDGPU_FENCE_FLAG_64BIT);
+
+	/* write fence seq to the "addr" */
+	amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
+	amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
+				 WRITE_DATA_DST_SEL(5) | WR_CONFIRM));
+	amdgpu_ring_write(ring, lower_32_bits(addr));
+	amdgpu_ring_write(ring, upper_32_bits(addr));
+	amdgpu_ring_write(ring, lower_32_bits(seq));
+
+	if (flags & AMDGPU_FENCE_FLAG_INT) {
+		/* set register to trigger INT */
+		amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
+		amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
+					 WRITE_DATA_DST_SEL(0) | WR_CONFIRM));
+		amdgpu_ring_write(ring, SOC15_REG_OFFSET(GC, 0, regCPC_INT_STATUS));
+		amdgpu_ring_write(ring, 0);
+		amdgpu_ring_write(ring, 0x20000000); /* src_id is 178 */
+	}
+}
+
+static void gfx_v9_4_3_ring_emit_rreg(struct amdgpu_ring *ring, uint32_t reg,
+				    uint32_t reg_val_offs)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	amdgpu_ring_write(ring, PACKET3(PACKET3_COPY_DATA, 4));
+	amdgpu_ring_write(ring, 0 |	/* src: register*/
+				(5 << 8) |	/* dst: memory */
+				(1 << 20));	/* write confirm */
+	amdgpu_ring_write(ring, reg);
+	amdgpu_ring_write(ring, 0);
+	amdgpu_ring_write(ring, lower_32_bits(adev->wb.gpu_addr +
+				reg_val_offs * 4));
+	amdgpu_ring_write(ring, upper_32_bits(adev->wb.gpu_addr +
+				reg_val_offs * 4));
+}
+
+static void gfx_v9_4_3_ring_emit_wreg(struct amdgpu_ring *ring, uint32_t reg,
+				    uint32_t val)
+{
+	uint32_t cmd = 0;
+
+	switch (ring->funcs->type) {
+	case AMDGPU_RING_TYPE_GFX:
+		cmd = WRITE_DATA_ENGINE_SEL(1) | WR_CONFIRM;
+		break;
+	case AMDGPU_RING_TYPE_KIQ:
+		cmd = (1 << 16); /* no inc addr */
+		break;
+	default:
+		cmd = WR_CONFIRM;
+		break;
+	}
+	amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
+	amdgpu_ring_write(ring, cmd);
+	amdgpu_ring_write(ring, reg);
+	amdgpu_ring_write(ring, 0);
+	amdgpu_ring_write(ring, val);
+}
+
+static void gfx_v9_4_3_ring_emit_reg_wait(struct amdgpu_ring *ring, uint32_t reg,
+					uint32_t val, uint32_t mask)
+{
+	gfx_v9_4_3_wait_reg_mem(ring, 0, 0, 0, reg, 0, val, mask, 0x20);
+}
+
+static void gfx_v9_4_3_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
+						  uint32_t reg0, uint32_t reg1,
+						  uint32_t ref, uint32_t mask)
+{
+	amdgpu_ring_emit_reg_write_reg_wait_helper(ring, reg0, reg1,
+						   ref, mask);
+}
+
+static void gfx_v9_4_3_set_compute_eop_interrupt_state(struct amdgpu_device *adev,
+						     int me, int pipe,
+						     enum amdgpu_interrupt_state state)
+{
+	u32 mec_int_cntl, mec_int_cntl_reg;
+
+	/*
+	 * amdgpu controls only the first MEC. That's why this function only
+	 * handles the setting of interrupts for this specific MEC. All other
+	 * pipes' interrupts are set by amdkfd.
+	 */
+
+	if (me == 1) {
+		switch (pipe) {
+		case 0:
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE0_INT_CNTL);
+			break;
+		case 1:
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE1_INT_CNTL);
+			break;
+		case 2:
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE2_INT_CNTL);
+			break;
+		case 3:
+			mec_int_cntl_reg = SOC15_REG_OFFSET(GC, 0, regCP_ME1_PIPE3_INT_CNTL);
+			break;
+		default:
+			DRM_DEBUG("invalid pipe %d\n", pipe);
+			return;
+		}
+	} else {
+		DRM_DEBUG("invalid me %d\n", me);
+		return;
+	}
+
+	switch (state) {
+	case AMDGPU_IRQ_STATE_DISABLE:
+		mec_int_cntl = RREG32(mec_int_cntl_reg);
+		mec_int_cntl = REG_SET_FIELD(mec_int_cntl, CP_ME1_PIPE0_INT_CNTL,
+					     TIME_STAMP_INT_ENABLE, 0);
+		WREG32(mec_int_cntl_reg, mec_int_cntl);
+		break;
+	case AMDGPU_IRQ_STATE_ENABLE:
+		mec_int_cntl = RREG32(mec_int_cntl_reg);
+		mec_int_cntl = REG_SET_FIELD(mec_int_cntl, CP_ME1_PIPE0_INT_CNTL,
+					     TIME_STAMP_INT_ENABLE, 1);
+		WREG32(mec_int_cntl_reg, mec_int_cntl);
+		break;
+	default:
+		break;
+	}
+}
+
+static int gfx_v9_4_3_set_priv_reg_fault_state(struct amdgpu_device *adev,
+					     struct amdgpu_irq_src *source,
+					     unsigned type,
+					     enum amdgpu_interrupt_state state)
+{
+	switch (state) {
+	case AMDGPU_IRQ_STATE_DISABLE:
+	case AMDGPU_IRQ_STATE_ENABLE:
+		WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
+			       PRIV_REG_INT_ENABLE,
+			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int gfx_v9_4_3_set_priv_inst_fault_state(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      unsigned type,
+					      enum amdgpu_interrupt_state state)
+{
+	switch (state) {
+	case AMDGPU_IRQ_STATE_DISABLE:
+	case AMDGPU_IRQ_STATE_ENABLE:
+		WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
+			       PRIV_INSTR_INT_ENABLE,
+			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int gfx_v9_4_3_set_eop_interrupt_state(struct amdgpu_device *adev,
+					    struct amdgpu_irq_src *src,
+					    unsigned type,
+					    enum amdgpu_interrupt_state state)
+{
+	switch (type) {
+	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE0_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 0, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE1_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 1, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE2_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 2, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC1_PIPE3_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 1, 3, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE0_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 0, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE1_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 1, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE2_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 2, state);
+		break;
+	case AMDGPU_CP_IRQ_COMPUTE_MEC2_PIPE3_EOP:
+		gfx_v9_4_3_set_compute_eop_interrupt_state(adev, 2, 3, state);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int gfx_v9_4_3_eop_irq(struct amdgpu_device *adev,
+			    struct amdgpu_irq_src *source,
+			    struct amdgpu_iv_entry *entry)
+{
+	int i;
+	u8 me_id, pipe_id, queue_id;
+	struct amdgpu_ring *ring;
+
+	DRM_DEBUG("IH: CP EOP\n");
+	me_id = (entry->ring_id & 0x0c) >> 2;
+	pipe_id = (entry->ring_id & 0x03) >> 0;
+	queue_id = (entry->ring_id & 0x70) >> 4;
+
+	switch (me_id) {
+	case 0:
+	case 1:
+	case 2:
+		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+			ring = &adev->gfx.compute_ring[i];
+			/* Per-queue interrupt is supported for MEC starting from VI.
+			  * The interrupt can only be enabled/disabled per pipe instead of per queue.
+			  */
+			if ((ring->me == me_id) && (ring->pipe == pipe_id) && (ring->queue == queue_id))
+				amdgpu_fence_process(ring);
+		}
+		break;
+	}
+	return 0;
+}
+
+static void gfx_v9_4_3_fault(struct amdgpu_device *adev,
+			   struct amdgpu_iv_entry *entry)
+{
+	u8 me_id, pipe_id, queue_id;
+	struct amdgpu_ring *ring;
+	int i;
+
+	me_id = (entry->ring_id & 0x0c) >> 2;
+	pipe_id = (entry->ring_id & 0x03) >> 0;
+	queue_id = (entry->ring_id & 0x70) >> 4;
+
+	switch (me_id) {
+	case 0:
+	case 1:
+	case 2:
+		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+			ring = &adev->gfx.compute_ring[i];
+			if (ring->me == me_id && ring->pipe == pipe_id &&
+			    ring->queue == queue_id)
+				drm_sched_fault(&ring->sched);
+		}
+		break;
+	}
+}
+
+static int gfx_v9_4_3_priv_reg_irq(struct amdgpu_device *adev,
+				 struct amdgpu_irq_src *source,
+				 struct amdgpu_iv_entry *entry)
+{
+	DRM_ERROR("Illegal register access in command stream\n");
+	gfx_v9_4_3_fault(adev, entry);
+	return 0;
+}
+
+static int gfx_v9_4_3_priv_inst_irq(struct amdgpu_device *adev,
+				  struct amdgpu_irq_src *source,
+				  struct amdgpu_iv_entry *entry)
+{
+	DRM_ERROR("Illegal instruction in command stream\n");
+	gfx_v9_4_3_fault(adev, entry);
+	return 0;
+}
+
+static void gfx_v9_4_3_emit_mem_sync(struct amdgpu_ring *ring)
+{
+	const unsigned int cp_coher_cntl =
+			PACKET3_ACQUIRE_MEM_CP_COHER_CNTL_SH_ICACHE_ACTION_ENA(1) |
+			PACKET3_ACQUIRE_MEM_CP_COHER_CNTL_SH_KCACHE_ACTION_ENA(1) |
+			PACKET3_ACQUIRE_MEM_CP_COHER_CNTL_TC_ACTION_ENA(1) |
+			PACKET3_ACQUIRE_MEM_CP_COHER_CNTL_TCL1_ACTION_ENA(1) |
+			PACKET3_ACQUIRE_MEM_CP_COHER_CNTL_TC_WB_ACTION_ENA(1);
+
+	/* ACQUIRE_MEM -make one or more surfaces valid for use by the subsequent operations */
+	amdgpu_ring_write(ring, PACKET3(PACKET3_ACQUIRE_MEM, 5));
+	amdgpu_ring_write(ring, cp_coher_cntl); /* CP_COHER_CNTL */
+	amdgpu_ring_write(ring, 0xffffffff);  /* CP_COHER_SIZE */
+	amdgpu_ring_write(ring, 0xffffff);  /* CP_COHER_SIZE_HI */
+	amdgpu_ring_write(ring, 0); /* CP_COHER_BASE */
+	amdgpu_ring_write(ring, 0);  /* CP_COHER_BASE_HI */
+	amdgpu_ring_write(ring, 0x0000000A); /* POLL_INTERVAL */
+}
+
+static void gfx_v9_4_3_emit_wave_limit_cs(struct amdgpu_ring *ring,
+					uint32_t pipe, bool enable)
+{
+	struct amdgpu_device *adev = ring->adev;
+	uint32_t val;
+	uint32_t wcl_cs_reg;
+
+	/* regSPI_WCL_PIPE_PERCENT_CS[0-7]_DEFAULT values are same */
+	val = enable ? 0x1 : 0x7f;
+
+	switch (pipe) {
+	case 0:
+		wcl_cs_reg = SOC15_REG_OFFSET(GC, 0, regSPI_WCL_PIPE_PERCENT_CS0);
+		break;
+	case 1:
+		wcl_cs_reg = SOC15_REG_OFFSET(GC, 0, regSPI_WCL_PIPE_PERCENT_CS1);
+		break;
+	case 2:
+		wcl_cs_reg = SOC15_REG_OFFSET(GC, 0, regSPI_WCL_PIPE_PERCENT_CS2);
+		break;
+	case 3:
+		wcl_cs_reg = SOC15_REG_OFFSET(GC, 0, regSPI_WCL_PIPE_PERCENT_CS3);
+		break;
+	default:
+		DRM_DEBUG("invalid pipe %d\n", pipe);
+		return;
+	}
+
+	amdgpu_ring_emit_wreg(ring, wcl_cs_reg, val);
+
+}
+static void gfx_v9_4_3_emit_wave_limit(struct amdgpu_ring *ring, bool enable)
+{
+	struct amdgpu_device *adev = ring->adev;
+	uint32_t val;
+	int i;
+
+	/* regSPI_WCL_PIPE_PERCENT_GFX is 7 bit multiplier register to limit
+	 * number of gfx waves. Setting 5 bit will make sure gfx only gets
+	 * around 25% of gpu resources.
+	 */
+	val = enable ? 0x1f : 0x07ffffff;
+	amdgpu_ring_emit_wreg(ring,
+			      SOC15_REG_OFFSET(GC, 0, regSPI_WCL_PIPE_PERCENT_GFX),
+			      val);
+
+	/* Restrict waves for normal/low priority compute queues as well
+	 * to get best QoS for high priority compute jobs.
+	 *
+	 * amdgpu controls only 1st ME(0-3 CS pipes).
+	 */
+	for (i = 0; i < adev->gfx.mec.num_pipe_per_mec; i++) {
+		if (i != ring->pipe)
+			gfx_v9_4_3_emit_wave_limit_cs(ring, i, enable);
+
+	}
+}
+
+static const struct amd_ip_funcs gfx_v9_4_3_ip_funcs = {
+	.name = "gfx_v9_4_3",
+	.early_init = gfx_v9_4_3_early_init,
+	.late_init = gfx_v9_4_3_late_init,
+	.sw_init = gfx_v9_4_3_sw_init,
+	.sw_fini = gfx_v9_4_3_sw_fini,
+	.hw_init = gfx_v9_4_3_hw_init,
+	.hw_fini = gfx_v9_4_3_hw_fini,
+	.suspend = gfx_v9_4_3_suspend,
+	.resume = gfx_v9_4_3_resume,
+	.is_idle = gfx_v9_4_3_is_idle,
+	.wait_for_idle = gfx_v9_4_3_wait_for_idle,
+	.soft_reset = gfx_v9_4_3_soft_reset,
+	.set_clockgating_state = gfx_v9_4_3_set_clockgating_state,
+	.set_powergating_state = gfx_v9_4_3_set_powergating_state,
+	.get_clockgating_state = gfx_v9_4_3_get_clockgating_state,
+};
+
+static const struct amdgpu_ring_funcs gfx_v9_4_3_ring_funcs_compute = {
+	.type = AMDGPU_RING_TYPE_COMPUTE,
+	.align_mask = 0xff,
+	.nop = PACKET3(PACKET3_NOP, 0x3FFF),
+	.support_64bit_ptrs = true,
+	.get_rptr = gfx_v9_4_3_ring_get_rptr_compute,
+	.get_wptr = gfx_v9_4_3_ring_get_wptr_compute,
+	.set_wptr = gfx_v9_4_3_ring_set_wptr_compute,
+	.emit_frame_size =
+		20 + /* gfx_v9_4_3_ring_emit_gds_switch */
+		7 + /* gfx_v9_4_3_ring_emit_hdp_flush */
+		5 + /* hdp invalidate */
+		7 + /* gfx_v9_4_3_ring_emit_pipeline_sync */
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 5 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 7 +
+		2 + /* gfx_v9_4_3_ring_emit_vm_flush */
+		8 + 8 + 8 + /* gfx_v9_4_3_ring_emit_fence x3 for user fence, vm fence */
+		7 + /* gfx_v9_4_3_emit_mem_sync */
+		5 + /* gfx_v9_4_3_emit_wave_limit for updating regSPI_WCL_PIPE_PERCENT_GFX register */
+		15, /* for updating 3 regSPI_WCL_PIPE_PERCENT_CS registers */
+	.emit_ib_size =	7, /* gfx_v9_4_3_ring_emit_ib_compute */
+	.emit_ib = gfx_v9_4_3_ring_emit_ib_compute,
+	.emit_fence = gfx_v9_4_3_ring_emit_fence,
+	.emit_pipeline_sync = gfx_v9_4_3_ring_emit_pipeline_sync,
+	.emit_vm_flush = gfx_v9_4_3_ring_emit_vm_flush,
+	.emit_gds_switch = gfx_v9_4_3_ring_emit_gds_switch,
+	.emit_hdp_flush = gfx_v9_4_3_ring_emit_hdp_flush,
+	.test_ring = gfx_v9_4_3_ring_test_ring,
+	.test_ib = gfx_v9_4_3_ring_test_ib,
+	.insert_nop = amdgpu_ring_insert_nop,
+	.pad_ib = amdgpu_ring_generic_pad_ib,
+	.emit_wreg = gfx_v9_4_3_ring_emit_wreg,
+	.emit_reg_wait = gfx_v9_4_3_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = gfx_v9_4_3_ring_emit_reg_write_reg_wait,
+	.emit_mem_sync = gfx_v9_4_3_emit_mem_sync,
+	.emit_wave_limit = gfx_v9_4_3_emit_wave_limit,
+};
+
+static const struct amdgpu_ring_funcs gfx_v9_4_3_ring_funcs_kiq = {
+	.type = AMDGPU_RING_TYPE_KIQ,
+	.align_mask = 0xff,
+	.nop = PACKET3(PACKET3_NOP, 0x3FFF),
+	.support_64bit_ptrs = true,
+	.get_rptr = gfx_v9_4_3_ring_get_rptr_compute,
+	.get_wptr = gfx_v9_4_3_ring_get_wptr_compute,
+	.set_wptr = gfx_v9_4_3_ring_set_wptr_compute,
+	.emit_frame_size =
+		20 + /* gfx_v9_4_3_ring_emit_gds_switch */
+		7 + /* gfx_v9_4_3_ring_emit_hdp_flush */
+		5 + /* hdp invalidate */
+		7 + /* gfx_v9_4_3_ring_emit_pipeline_sync */
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 5 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 7 +
+		2 + /* gfx_v9_4_3_ring_emit_vm_flush */
+		8 + 8 + 8, /* gfx_v9_4_3_ring_emit_fence_kiq x3 for user fence, vm fence */
+	.emit_ib_size =	7, /* gfx_v9_4_3_ring_emit_ib_compute */
+	.emit_fence = gfx_v9_4_3_ring_emit_fence_kiq,
+	.test_ring = gfx_v9_4_3_ring_test_ring,
+	.insert_nop = amdgpu_ring_insert_nop,
+	.pad_ib = amdgpu_ring_generic_pad_ib,
+	.emit_rreg = gfx_v9_4_3_ring_emit_rreg,
+	.emit_wreg = gfx_v9_4_3_ring_emit_wreg,
+	.emit_reg_wait = gfx_v9_4_3_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = gfx_v9_4_3_ring_emit_reg_write_reg_wait,
+};
+
+static void gfx_v9_4_3_set_ring_funcs(struct amdgpu_device *adev)
+{
+	int i;
+
+	adev->gfx.kiq[0].ring.funcs = &gfx_v9_4_3_ring_funcs_kiq;
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++)
+		adev->gfx.compute_ring[i].funcs = &gfx_v9_4_3_ring_funcs_compute;
+}
+
+static const struct amdgpu_irq_src_funcs gfx_v9_4_3_eop_irq_funcs = {
+	.set = gfx_v9_4_3_set_eop_interrupt_state,
+	.process = gfx_v9_4_3_eop_irq,
+};
+
+static const struct amdgpu_irq_src_funcs gfx_v9_4_3_priv_reg_irq_funcs = {
+	.set = gfx_v9_4_3_set_priv_reg_fault_state,
+	.process = gfx_v9_4_3_priv_reg_irq,
+};
+
+static const struct amdgpu_irq_src_funcs gfx_v9_4_3_priv_inst_irq_funcs = {
+	.set = gfx_v9_4_3_set_priv_inst_fault_state,
+	.process = gfx_v9_4_3_priv_inst_irq,
+};
+
+static void gfx_v9_4_3_set_irq_funcs(struct amdgpu_device *adev)
+{
+	adev->gfx.eop_irq.num_types = AMDGPU_CP_IRQ_LAST;
+	adev->gfx.eop_irq.funcs = &gfx_v9_4_3_eop_irq_funcs;
+
+	adev->gfx.priv_reg_irq.num_types = 1;
+	adev->gfx.priv_reg_irq.funcs = &gfx_v9_4_3_priv_reg_irq_funcs;
+
+	adev->gfx.priv_inst_irq.num_types = 1;
+	adev->gfx.priv_inst_irq.funcs = &gfx_v9_4_3_priv_inst_irq_funcs;
+}
+
+static void gfx_v9_4_3_set_rlc_funcs(struct amdgpu_device *adev)
+{
+	adev->gfx.rlc.funcs = &gfx_v9_4_3_rlc_funcs;
+}
+
+
+static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev)
+{
+	/* init asci gds info */
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(9, 4, 3):
+		/* 9.4.3 removed all the GDS internal memory,
+		 * only support GWS opcode in kernel, like barrier
+		 * semaphore.etc */
+		adev->gds.gds_size = 0;
+		break;
+	default:
+		adev->gds.gds_size = 0x10000;
+		break;
+	}
+
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(9, 4, 3):
+		/* deprecated for 9.4.3, no usage at all */
+		adev->gds.gds_compute_max_wave_id = 0;
+		break;
+	default:
+		/* this really depends on the chip */
+		adev->gds.gds_compute_max_wave_id = 0x7ff;
+		break;
+	}
+
+	adev->gds.gws_size = 64;
+	adev->gds.oa_size = 16;
+}
+
+static void gfx_v9_4_3_set_user_cu_inactive_bitmap(struct amdgpu_device *adev,
+						 u32 bitmap)
+{
+	u32 data;
+
+	if (!bitmap)
+		return;
+
+	data = bitmap << GC_USER_SHADER_ARRAY_CONFIG__INACTIVE_CUS__SHIFT;
+	data &= GC_USER_SHADER_ARRAY_CONFIG__INACTIVE_CUS_MASK;
+
+	WREG32_SOC15(GC, 0, regGC_USER_SHADER_ARRAY_CONFIG, data);
+}
+
+static u32 gfx_v9_4_3_get_cu_active_bitmap(struct amdgpu_device *adev)
+{
+	u32 data, mask;
+
+	data = RREG32_SOC15(GC, 0, regCC_GC_SHADER_ARRAY_CONFIG);
+	data |= RREG32_SOC15(GC, 0, regGC_USER_SHADER_ARRAY_CONFIG);
+
+	data &= CC_GC_SHADER_ARRAY_CONFIG__INACTIVE_CUS_MASK;
+	data >>= CC_GC_SHADER_ARRAY_CONFIG__INACTIVE_CUS__SHIFT;
+
+	mask = amdgpu_gfx_create_bitmask(adev->gfx.config.max_cu_per_sh);
+
+	return (~data) & mask;
+}
+
+static int gfx_v9_4_3_get_cu_info(struct amdgpu_device *adev,
+				 struct amdgpu_cu_info *cu_info)
+{
+	int i, j, k, counter, active_cu_number = 0;
+	u32 mask, bitmap, ao_bitmap, ao_cu_mask = 0;
+	unsigned disable_masks[4 * 4];
+
+	if (!adev || !cu_info)
+		return -EINVAL;
+
+	/*
+	 * 16 comes from bitmap array size 4*4, and it can cover all gfx9 ASICs
+	 */
+	if (adev->gfx.config.max_shader_engines *
+		adev->gfx.config.max_sh_per_se > 16)
+		return -EINVAL;
+
+	amdgpu_gfx_parse_disable_cu(disable_masks,
+				    adev->gfx.config.max_shader_engines,
+				    adev->gfx.config.max_sh_per_se);
+
+	mutex_lock(&adev->grbm_idx_mutex);
+	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
+		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
+			mask = 1;
+			ao_bitmap = 0;
+			counter = 0;
+			gfx_v9_4_3_select_se_sh(adev, i, j, 0xffffffff);
+			gfx_v9_4_3_set_user_cu_inactive_bitmap(
+				adev, disable_masks[i * adev->gfx.config.max_sh_per_se + j]);
+			bitmap = gfx_v9_4_3_get_cu_active_bitmap(adev);
+
+			/*
+			 * The bitmap(and ao_cu_bitmap) in cu_info structure is
+			 * 4x4 size array, and it's usually suitable for Vega
+			 * ASICs which has 4*2 SE/SH layout.
+			 * But for Arcturus, SE/SH layout is changed to 8*1.
+			 * To mostly reduce the impact, we make it compatible
+			 * with current bitmap array as below:
+			 *    SE4,SH0 --> bitmap[0][1]
+			 *    SE5,SH0 --> bitmap[1][1]
+			 *    SE6,SH0 --> bitmap[2][1]
+			 *    SE7,SH0 --> bitmap[3][1]
+			 */
+			cu_info->bitmap[i % 4][j + i / 4] = bitmap;
+
+			for (k = 0; k < adev->gfx.config.max_cu_per_sh; k ++) {
+				if (bitmap & mask) {
+					if (counter < adev->gfx.config.max_cu_per_sh)
+						ao_bitmap |= mask;
+					counter ++;
+				}
+				mask <<= 1;
+			}
+			active_cu_number += counter;
+			if (i < 2 && j < 2)
+				ao_cu_mask |= (ao_bitmap << (i * 16 + j * 8));
+			cu_info->ao_cu_bitmap[i % 4][j + i / 4] = ao_bitmap;
+		}
+	}
+	gfx_v9_4_3_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	cu_info->number = active_cu_number;
+	cu_info->ao_cu_mask = ao_cu_mask;
+	cu_info->simd_per_cu = NUM_SIMD_PER_CU;
+
+	return 0;
+}
+
+const struct amdgpu_ip_block_version gfx_v9_4_3_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_GFX,
+	.major = 9,
+	.minor = 4,
+	.rev = 0,
+	.funcs = &gfx_v9_4_3_ip_funcs,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h
index 84e69701b81a..4b530f4c1295 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h
@@ -24,7 +24,6 @@
 #ifndef __GFX_V9_4_3_H__
 #define __GFX_V9_4_3_H__
 
-extern const struct amdgpu_gfx_funcs gfx_v9_4_3_gfx_funcs;
-extern const struct amdgpu_rlc_funcs gfx_v9_4_3_rlc_funcs;
+extern const struct amdgpu_ip_block_version gfx_v9_4_3_ip_block;
 
 #endif /* __GFX_V9_4_3_H__ */
-- 
2.39.2

