Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A48C2CCA
	for <lists+amd-gfx@lfdr.de>; Sat, 11 May 2024 00:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E05410E227;
	Fri, 10 May 2024 22:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u4UQ+mzw";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149DC10E227
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2024 22:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beqWEIi/SqztWGIAEsUnVn7c8+Q4j37yiV82JZmHAwXB3GEEUcKEiHxSF6ms+93Yy8H3B2HKEv3ld2R6J+uojWJPsOBnIryc0K8kk2ts2vBSXtaNCkquO8YCNrQMWgr6D5tGXvPgmx0/8LEkUqjW8TSR+tFNtFhc8ml50z4yDmhcSwc9ftaHPPyXCJqChAYhZX4bgSce9/Hc2+uUr0tE5lMiKsXcTO/l9rgbyjpi0RoyQFG9K/xmo7t34v2fAWvi4Ixz65U9Dzq/TDRw+nv/mjAM5d3RR60GYJl35vV+wDUfKORnWCd/W0VljXBWaj4+kVrnAX2JzJvp34vJaL+tkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVttwcrzVTFuGAIMHE4AT/Pcj3ZsmgCilKzjVcl1PYs=;
 b=AQvIVoa3Wd+v3OX7Pk3bLvDYNPri2Je5o1MwCZ9UMi6cacekpmw46zl5zYllRhxSBtw6qiaLeObYENep0h9NHLW9Glz2d7eSAzyi5PQuor9p59EX9LYTOdutz7cNUvo+iGAOgltgfl33tt6eSA4VyxkyyNfwI6SCXT/KBWSO/KQb6O0YBn5hMQORh+DQNBZipWkqOgI3XR5ravXDvzpa7U127HIqbd95S29qMrrqorvCH8UTuIwhS5vwujmxuBrbnKwjmBCDZCPdUWdEnUrRThHIRgEeyd3L2rYsdZYDmA+bIoHMu4F5qvoeda09GD9H3tkYFxZbjFIGytvpXSzO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVttwcrzVTFuGAIMHE4AT/Pcj3ZsmgCilKzjVcl1PYs=;
 b=u4UQ+mzwhcb+lfc/hw6Drc71BqNbhsfqVewAK/+jI3YRvY4VHr/qBQXibm5YlrxgMTZvgJGmuKRs/4LDkPdYh76/ZqRodm1fD6XuBdNpRYDJ1iUOzZl57PTaaRp3V56k+o3rUckRdJ4H4SI9CtB9psCCUy6A+3zEzI0VcNyXyF4=
Received: from BL1PR13CA0160.namprd13.prod.outlook.com (2603:10b6:208:2bd::15)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 22:59:33 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::1d) by BL1PR13CA0160.outlook.office365.com
 (2603:10b6:208:2bd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.15 via Frontend
 Transport; Fri, 10 May 2024 22:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 22:59:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 17:59:31 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: drop MES 10.1 support v2
Date: Fri, 10 May 2024 18:59:09 -0400
Message-ID: <20240510225909.1957238-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6f28c0-ecb3-48bc-2aa0-08dc7144db06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2wd/6H0byVVPicFWImGK692LBhNCua16E1B88bSwsg/eiAGnYaBv4SYmPf/e?=
 =?us-ascii?Q?zLs/MiYSj3CruTOLqFbtaVz7w7glnjvpSbblwtwYupTeUKHmHbK5skjSqljf?=
 =?us-ascii?Q?9dmbT7pzW1xb3Mkib96uFjFWSQIH8CY1vPHgq1+0LRIXaZB3lHKPxPaZuSVK?=
 =?us-ascii?Q?VK+5M6UIod+JMY3aVMu3GY/WxIlEW4pH5rVuQR8RtXi7MvDutQKB41FtXqAQ?=
 =?us-ascii?Q?q+1jv8rz9raTLZZuamKgQsJAiiCvM0Jjwts1J9heJdMJvOBNIjBJa4Z8iaoG?=
 =?us-ascii?Q?t09rrXdJbfZZMkoBCpkfcxZED05FX2d5rX87f+7svM6gUZCveU6mWaEPd0VN?=
 =?us-ascii?Q?KFO7tAECfZ0d9PB84t6xpJqgUzQWOdNQ2cXy4mr8qQzqUOKnq/lRnYjREpMu?=
 =?us-ascii?Q?Y3Hk0NVjFc4yBi/Rv23S8Gw2EahDqS9k8EGQUVGP70qCi6q0pXlJdDdEXPSx?=
 =?us-ascii?Q?utV7U8j6JjzWa+ARV372zIcEcjN/RzNVpift74PB6yjGE5kN9fiJYSeSutHy?=
 =?us-ascii?Q?m3gCNFw/05U19OTZvuXL6YEgFMUDuOk7ivg7sj3u7tZjxnTtgZTRoo9Bm3Tf?=
 =?us-ascii?Q?1uwF3513QYKG52CNnPJzb7lpeqHqoan6G+ou1Mo1awKBUxoMow4ARihxKuzC?=
 =?us-ascii?Q?MDBC99BwhM4kweecMcNrWVrCzQaTi2DNbreTaalvaz+zt4MhvYXAGc2SJItg?=
 =?us-ascii?Q?HS9aKGKr87xVZFMPFchHSB+6ii4tjDkO1nGf8iTAzIO+Fg99NJt3agTZcZr3?=
 =?us-ascii?Q?ouO4OskF75dyPlRcfv05hRqgJ83kU/IGqo0BUE99PM7GDZBfYQxk6RlNRrGV?=
 =?us-ascii?Q?bWAcZMSnp54tKwyfJKMeoQcBpN20pxZ90bDhkumlOiU+WPpU1b4drbNk8OAW?=
 =?us-ascii?Q?KsT1fgcBf+x6ThglcdTXhEskLTyJZg0LBU46PYTEsxKL78Ypy8X5z7hTmOqr?=
 =?us-ascii?Q?e4/eML20Q1hDS4eA3gGXqp2Zs4F3Vp07SD8s5R6HPWV7IpFTud7bXRpqUaEb?=
 =?us-ascii?Q?0CDf3BXGu0ARK+BnKKGJcEKtOshljt1BPPhTGQRTp11iFW6YO/IeUugT2w7g?=
 =?us-ascii?Q?PX/asBKwUZRRJ7aCL6Eblj0NP9Ven5onAupfMUwjSZu9QEwy4m/YqbBkf2RM?=
 =?us-ascii?Q?x1PyIoyeIHxjkLXYCeOXngHUdFVaziqr4NR1qihr4FYImVmi8czcBDEku7XH?=
 =?us-ascii?Q?6raeeMJC0QlYYjflF89DVj7uT2O7qy9767qIleOt+/EfxlC+Zer8JkuqChdm?=
 =?us-ascii?Q?FFyWirb4LX73IgUOj8tYJHNhADn88nfZq0lANYeyBWwPXfVfcICGJn9ZdnO0?=
 =?us-ascii?Q?Ib6JZdrgFK7ioUI8Bjk+ViOX3FMpOJGwa1/mdU+WUERaS9pOq5CJy+RMOOEw?=
 =?us-ascii?Q?xAL3v5s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 22:59:32.5628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f28c0-ecb3-48bc-2aa0-08dc7144db06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779
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

It was an enablement vehicle for MES 11 and was never
productized.  Remove it.

v2: drop additional checks in the GFX10 code.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   20 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  281 +---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 1190 -----------------
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h        |   29 -
 drivers/gpu/drm/amd/amdgpu/nv.c               |    1 -
 6 files changed, 71 insertions(+), 1451 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index de7b76327f5ba..6e1237a97a91e 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -187,7 +187,6 @@ amdgpu-y += \
 # add MES block
 amdgpu-y += \
 	amdgpu_mes.o \
-	mes_v10_1.o \
 	mes_v11_0.o \
 	mes_v12_0.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 824dd5b57d0d3..47e45e1700326 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -94,7 +94,6 @@
 #include "vcn_v4_0_5.h"
 #include "jpeg_v4_0_5.h"
 #include "amdgpu_vkms.h"
-#include "mes_v10_1.h"
 #include "mes_v11_0.h"
 #include "mes_v12_0.h"
 #include "smuio_v11_0.h"
@@ -2215,25 +2214,6 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 {
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 1, 10):
-	case IP_VERSION(10, 1, 1):
-	case IP_VERSION(10, 1, 2):
-	case IP_VERSION(10, 1, 3):
-	case IP_VERSION(10, 1, 4):
-	case IP_VERSION(10, 3, 0):
-	case IP_VERSION(10, 3, 1):
-	case IP_VERSION(10, 3, 2):
-	case IP_VERSION(10, 3, 3):
-	case IP_VERSION(10, 3, 4):
-	case IP_VERSION(10, 3, 5):
-	case IP_VERSION(10, 3, 6):
-		if (amdgpu_mes) {
-			amdgpu_device_ip_block_add(adev, &mes_v10_1_ip_block);
-			adev->enable_mes = true;
-			if (amdgpu_mes_kiq)
-				adev->enable_mes_kiq = true;
-		}
-		break;
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 1):
 	case IP_VERSION(11, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index fcb0fbd1a1122..21208bbcd70ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3664,14 +3664,8 @@ static void gfx10_kiq_unmap_queues(struct amdgpu_ring *kiq_ring,
 				   enum amdgpu_unmap_queues_action action,
 				   u64 gpu_addr, u64 seq)
 {
-	struct amdgpu_device *adev = kiq_ring->adev;
 	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
 
-	if (adev->enable_mes && !adev->gfx.kiq[0].ring.sched.ready) {
-		amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr, seq);
-		return;
-	}
-
 	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
 	amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
 			  PACKET3_UNMAP_QUEUES_ACTION(action) |
@@ -3929,33 +3923,18 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 	memset(&ib, 0, sizeof(ib));
 
-	if (ring->is_mes_queue) {
-		uint32_t padding, offset;
-
-		offset = amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_OFFS);
-		padding = amdgpu_mes_ctx_get_offs(ring,
-						  AMDGPU_MES_CTX_PADDING_OFFS);
-
-		ib.gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-		ib.ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-
-		gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, padding);
-		cpu_ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, padding);
-		*cpu_ptr = cpu_to_le32(0xCAFEDEAD);
-	} else {
-		r = amdgpu_device_wb_get(adev, &index);
-		if (r)
-			return r;
+	r = amdgpu_device_wb_get(adev, &index);
+	if (r)
+		return r;
 
-		gpu_addr = adev->wb.gpu_addr + (index * 4);
-		adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
-		cpu_ptr = &adev->wb.wb[index];
+	gpu_addr = adev->wb.gpu_addr + (index * 4);
+	adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
+	cpu_ptr = &adev->wb.wb[index];
 
-		r = amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
-		if (r) {
-			DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
-			goto err1;
-		}
+	r = amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
+	if (r) {
+		DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
+		goto err1;
 	}
 
 	ib.ptr[0] = PACKET3(PACKET3_WRITE_DATA, 3);
@@ -3982,12 +3961,10 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 	else
 		r = -EINVAL;
 err2:
-	if (!ring->is_mes_queue)
-		amdgpu_ib_free(adev, &ib, NULL);
+	amdgpu_ib_free(adev, &ib, NULL);
 	dma_fence_put(f);
 err1:
-	if (!ring->is_mes_queue)
-		amdgpu_device_wb_free(adev, index);
+	amdgpu_device_wb_free(adev, index);
 	return r;
 }
 
@@ -4735,18 +4712,16 @@ static int gfx_v10_0_sw_init(void *handle)
 		}
 	}
 
-	if (!adev->enable_mes_kiq) {
-		r = amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
-		if (r) {
-			DRM_ERROR("Failed to init KIQ BOs!\n");
-			return r;
-		}
-
-		r = amdgpu_gfx_kiq_init_ring(adev, xcc_id);
-		if (r)
-			return r;
+	r = amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
+	if (r) {
+		DRM_ERROR("Failed to init KIQ BOs!\n");
+		return r;
 	}
 
+	r = amdgpu_gfx_kiq_init_ring(adev, xcc_id);
+	if (r)
+		return r;
+
 	r = amdgpu_gfx_mqd_sw_init(adev, sizeof(struct v10_compute_mqd), 0);
 	if (r)
 		return r;
@@ -4800,10 +4775,8 @@ static int gfx_v10_0_sw_fini(void *handle)
 
 	amdgpu_gfx_mqd_sw_fini(adev, 0);
 
-	if (!adev->enable_mes_kiq) {
-		amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
-		amdgpu_gfx_kiq_fini(adev, 0);
-	}
+	amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
+	amdgpu_gfx_kiq_fini(adev, 0);
 
 	gfx_v10_0_pfp_fini(adev);
 	gfx_v10_0_ce_fini(adev);
@@ -7012,10 +6985,7 @@ static int gfx_v10_0_cp_resume(struct amdgpu_device *adev)
 			return r;
 	}
 
-	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
-		r = amdgpu_mes_kiq_hw_init(adev);
-	else
-		r = gfx_v10_0_kiq_resume(adev);
+	r = gfx_v10_0_kiq_resume(adev);
 	if (r)
 		return r;
 
@@ -8327,45 +8297,17 @@ static u64 gfx_v10_0_ring_get_wptr_gfx(struct amdgpu_ring *ring)
 static void gfx_v10_0_ring_set_wptr_gfx(struct amdgpu_ring *ring)
 {
 	struct amdgpu_device *adev = ring->adev;
-	uint32_t *wptr_saved;
-	uint32_t *is_queue_unmap;
-	uint64_t aggregated_db_index;
-	uint32_t mqd_size = adev->mqds[AMDGPU_HW_IP_GFX].mqd_size;
-	uint64_t wptr_tmp;
-
-	if (ring->is_mes_queue) {
-		wptr_saved = (uint32_t *)(ring->mqd_ptr + mqd_size);
-		is_queue_unmap = (uint32_t *)(ring->mqd_ptr + mqd_size +
-					      sizeof(uint32_t));
-		aggregated_db_index =
-			amdgpu_mes_get_aggregated_doorbell_index(adev,
-			AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
-
-		wptr_tmp = ring->wptr & ring->buf_mask;
-		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
-		*wptr_saved = wptr_tmp;
-		/* assume doorbell always being used by mes mapped queue */
-		if (*is_queue_unmap) {
-			WDOORBELL64(aggregated_db_index, wptr_tmp);
-			WDOORBELL64(ring->doorbell_index, wptr_tmp);
-		} else {
-			WDOORBELL64(ring->doorbell_index, wptr_tmp);
 
-			if (*is_queue_unmap)
-				WDOORBELL64(aggregated_db_index, wptr_tmp);
-		}
+	if (ring->use_doorbell) {
+		/* XXX check if swapping is necessary on BE */
+		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
+			     ring->wptr);
+		WDOORBELL64(ring->doorbell_index, ring->wptr);
 	} else {
-		if (ring->use_doorbell) {
-			/* XXX check if swapping is necessary on BE */
-			atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-				     ring->wptr);
-			WDOORBELL64(ring->doorbell_index, ring->wptr);
-		} else {
-			WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
-				     lower_32_bits(ring->wptr));
-			WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
-				     upper_32_bits(ring->wptr));
-		}
+		WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
+			     lower_32_bits(ring->wptr));
+		WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
+			     upper_32_bits(ring->wptr));
 	}
 }
 
@@ -8390,42 +8332,13 @@ static u64 gfx_v10_0_ring_get_wptr_compute(struct amdgpu_ring *ring)
 static void gfx_v10_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
 {
 	struct amdgpu_device *adev = ring->adev;
-	uint32_t *wptr_saved;
-	uint32_t *is_queue_unmap;
-	uint64_t aggregated_db_index;
-	uint32_t mqd_size = adev->mqds[AMDGPU_HW_IP_COMPUTE].mqd_size;
-	uint64_t wptr_tmp;
-
-	if (ring->is_mes_queue) {
-		wptr_saved = (uint32_t *)(ring->mqd_ptr + mqd_size);
-		is_queue_unmap = (uint32_t *)(ring->mqd_ptr + mqd_size +
-					      sizeof(uint32_t));
-		aggregated_db_index =
-			amdgpu_mes_get_aggregated_doorbell_index(adev,
-			AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
-
-		wptr_tmp = ring->wptr & ring->buf_mask;
-		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
-		*wptr_saved = wptr_tmp;
-		/* assume doorbell always used by mes mapped queue */
-		if (*is_queue_unmap) {
-			WDOORBELL64(aggregated_db_index, wptr_tmp);
-			WDOORBELL64(ring->doorbell_index, wptr_tmp);
-		} else {
-			WDOORBELL64(ring->doorbell_index, wptr_tmp);
 
-			if (*is_queue_unmap)
-				WDOORBELL64(aggregated_db_index, wptr_tmp);
-		}
+	if (ring->use_doorbell) {
+		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
+			     ring->wptr);
+		WDOORBELL64(ring->doorbell_index, ring->wptr);
 	} else {
-		/* XXX check if swapping is necessary on BE */
-		if (ring->use_doorbell) {
-			atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-				     ring->wptr);
-			WDOORBELL64(ring->doorbell_index, ring->wptr);
-		} else {
-			BUG(); /* only DOORBELL method supported on gfx10 now */
-		}
+		BUG(); /* only DOORBELL method supported on gfx10 now */
 	}
 }
 
@@ -8484,10 +8397,6 @@ static void gfx_v10_0_ring_emit_ib_gfx(struct amdgpu_ring *ring,
 				    (!amdgpu_sriov_vf(ring->adev) && flags & AMDGPU_IB_PREEMPTED) ? true : false);
 	}
 
-	if (ring->is_mes_queue)
-		/* inherit vmid from mqd */
-		control |= 0x400000;
-
 	amdgpu_ring_write(ring, header);
 	BUG_ON(ib->gpu_addr & 0x3); /* Dword align */
 	amdgpu_ring_write(ring,
@@ -8507,10 +8416,6 @@ static void gfx_v10_0_ring_emit_ib_compute(struct amdgpu_ring *ring,
 	unsigned int vmid = AMDGPU_JOB_GET_VMID(job);
 	u32 control = INDIRECT_BUFFER_VALID | ib->length_dw | (vmid << 24);
 
-	if (ring->is_mes_queue)
-		/* inherit vmid from mqd */
-		control |= 0x40000000;
-
 	/* Currently, there is a high possibility to get wave ID mismatch
 	 * between ME and GDS, leading to a hw deadlock, because ME generates
 	 * different wave IDs than the GDS expects. This situation happens
@@ -8568,8 +8473,7 @@ static void gfx_v10_0_ring_emit_fence(struct amdgpu_ring *ring, u64 addr,
 	amdgpu_ring_write(ring, upper_32_bits(addr));
 	amdgpu_ring_write(ring, lower_32_bits(seq));
 	amdgpu_ring_write(ring, upper_32_bits(seq));
-	amdgpu_ring_write(ring, ring->is_mes_queue ?
-			 (ring->hw_queue_id | AMDGPU_FENCE_MES_QUEUE_FLAG) : 0);
+	amdgpu_ring_write(ring, 0);
 }
 
 static void gfx_v10_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
@@ -8597,10 +8501,7 @@ static void gfx_v10_0_ring_invalidate_tlbs(struct amdgpu_ring *ring,
 static void gfx_v10_0_ring_emit_vm_flush(struct amdgpu_ring *ring,
 					 unsigned int vmid, uint64_t pd_addr)
 {
-	if (ring->is_mes_queue)
-		gfx_v10_0_ring_invalidate_tlbs(ring, 0, 0, false, 0);
-	else
-		amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
+	amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
 
 	/* compute doesn't have PFP */
 	if (ring->funcs->type == AMDGPU_RING_TYPE_GFX) {
@@ -8751,19 +8652,9 @@ static void gfx_v10_0_ring_emit_ce_meta(struct amdgpu_ring *ring, bool resume)
 
 	cnt = (sizeof(ce_payload) >> 2) + 4 - 2;
 
-	if (ring->is_mes_queue) {
-		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
-				  gfx[0].gfx_meta_data) +
-			offsetof(struct v10_gfx_meta_data, ce_payload);
-		ce_payload_gpu_addr =
-			amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-		ce_payload_cpu_addr =
-			amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-	} else {
-		offset = offsetof(struct v10_gfx_meta_data, ce_payload);
-		ce_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
-		ce_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
-	}
+	offset = offsetof(struct v10_gfx_meta_data, ce_payload);
+	ce_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
+	ce_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
 
 	amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, cnt));
 	amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(2) |
@@ -8789,28 +8680,13 @@ static void gfx_v10_0_ring_emit_de_meta(struct amdgpu_ring *ring, bool resume)
 	void *de_payload_cpu_addr;
 	int cnt;
 
-	if (ring->is_mes_queue) {
-		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
-				  gfx[0].gfx_meta_data) +
-			offsetof(struct v10_gfx_meta_data, de_payload);
-		de_payload_gpu_addr =
-			amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-		de_payload_cpu_addr =
-			amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-
-		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
-				  gfx[0].gds_backup) +
-			offsetof(struct v10_gfx_meta_data, de_payload);
-		gds_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-	} else {
-		offset = offsetof(struct v10_gfx_meta_data, de_payload);
-		de_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
-		de_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
+	offset = offsetof(struct v10_gfx_meta_data, de_payload);
+	de_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
+	de_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
 
-		gds_addr = ALIGN(amdgpu_csa_vaddr(ring->adev) +
-				 AMDGPU_CSA_SIZE - adev->gds.gds_size,
-				 PAGE_SIZE);
-	}
+	gds_addr = ALIGN(amdgpu_csa_vaddr(ring->adev) +
+			 AMDGPU_CSA_SIZE - adev->gds.gds_size,
+			 PAGE_SIZE);
 
 	de_payload.gds_backup_addrlo = lower_32_bits(gds_addr);
 	de_payload.gds_backup_addrhi = upper_32_bits(gds_addr);
@@ -9062,49 +8938,34 @@ static int gfx_v10_0_eop_irq(struct amdgpu_device *adev,
 	int i;
 	u8 me_id, pipe_id, queue_id;
 	struct amdgpu_ring *ring;
-	uint32_t mes_queue_id = entry->src_data[0];
 
 	DRM_DEBUG("IH: CP EOP\n");
 
-	if (adev->enable_mes && (mes_queue_id & AMDGPU_FENCE_MES_QUEUE_FLAG)) {
-		struct amdgpu_mes_queue *queue;
-
-		mes_queue_id &= AMDGPU_FENCE_MES_QUEUE_ID_MASK;
-
-		spin_lock(&adev->mes.queue_id_lock);
-		queue = idr_find(&adev->mes.queue_id_idr, mes_queue_id);
-		if (queue) {
-			DRM_DEBUG("process mes queue id = %d\n", mes_queue_id);
-			amdgpu_fence_process(queue->ring);
-		}
-		spin_unlock(&adev->mes.queue_id_lock);
-	} else {
-		me_id = (entry->ring_id & 0x0c) >> 2;
-		pipe_id = (entry->ring_id & 0x03) >> 0;
-		queue_id = (entry->ring_id & 0x70) >> 4;
+	me_id = (entry->ring_id & 0x0c) >> 2;
+	pipe_id = (entry->ring_id & 0x03) >> 0;
+	queue_id = (entry->ring_id & 0x70) >> 4;
 
-		switch (me_id) {
-		case 0:
-			if (pipe_id == 0)
-				amdgpu_fence_process(&adev->gfx.gfx_ring[0]);
-			else
-				amdgpu_fence_process(&adev->gfx.gfx_ring[1]);
-			break;
-		case 1:
-		case 2:
-			for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-				ring = &adev->gfx.compute_ring[i];
-				/* Per-queue interrupt is supported for MEC starting from VI.
-				 * The interrupt can only be enabled/disabled per pipe instead
-				 * of per queue.
-				 */
-				if ((ring->me == me_id) &&
-				    (ring->pipe == pipe_id) &&
-				    (ring->queue == queue_id))
-					amdgpu_fence_process(ring);
-			}
-			break;
+	switch (me_id) {
+	case 0:
+		if (pipe_id == 0)
+			amdgpu_fence_process(&adev->gfx.gfx_ring[0]);
+		else
+			amdgpu_fence_process(&adev->gfx.gfx_ring[1]);
+		break;
+	case 1:
+	case 2:
+		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+			ring = &adev->gfx.compute_ring[i];
+			/* Per-queue interrupt is supported for MEC starting from VI.
+			 * The interrupt can only be enabled/disabled per pipe instead
+			 * of per queue.
+			 */
+			if ((ring->me == me_id) &&
+			    (ring->pipe == pipe_id) &&
+			    (ring->queue == queue_id))
+				amdgpu_fence_process(ring);
 		}
+		break;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
deleted file mode 100644
index 013aa690299ec..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ /dev/null
@@ -1,1190 +0,0 @@
-/*
- * Copyright 2019 Advanced Micro Devices, Inc.
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
-#include <linux/firmware.h>
-#include <linux/module.h>
-#include "amdgpu.h"
-#include "amdgpu_reset.h"
-#include "soc15_common.h"
-#include "nv.h"
-#include "gc/gc_10_1_0_offset.h"
-#include "gc/gc_10_1_0_sh_mask.h"
-#include "gc/gc_10_1_0_default.h"
-#include "v10_structs.h"
-#include "mes_api_def.h"
-
-#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid               0x2820
-#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid_BASE_IDX      1
-#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid		0x4ca1
-#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid_BASE_IDX	1
-
-MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
-
-static int mes_v10_1_hw_fini(void *handle);
-static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev);
-
-#define MES_EOP_SIZE   2048
-
-static void mes_v10_1_ring_set_wptr(struct amdgpu_ring *ring)
-{
-	struct amdgpu_device *adev = ring->adev;
-
-	if (ring->use_doorbell) {
-		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-			     ring->wptr);
-		WDOORBELL64(ring->doorbell_index, ring->wptr);
-	} else {
-		BUG();
-	}
-}
-
-static u64 mes_v10_1_ring_get_rptr(struct amdgpu_ring *ring)
-{
-	return *ring->rptr_cpu_addr;
-}
-
-static u64 mes_v10_1_ring_get_wptr(struct amdgpu_ring *ring)
-{
-	u64 wptr;
-
-	if (ring->use_doorbell)
-		wptr = atomic64_read((atomic64_t *)ring->wptr_cpu_addr);
-	else
-		BUG();
-	return wptr;
-}
-
-static const struct amdgpu_ring_funcs mes_v10_1_ring_funcs = {
-	.type = AMDGPU_RING_TYPE_MES,
-	.align_mask = 1,
-	.nop = 0,
-	.support_64bit_ptrs = true,
-	.get_rptr = mes_v10_1_ring_get_rptr,
-	.get_wptr = mes_v10_1_ring_get_wptr,
-	.set_wptr = mes_v10_1_ring_set_wptr,
-	.insert_nop = amdgpu_ring_insert_nop,
-};
-
-static int mes_v10_1_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
-						    void *pkt, int size,
-						    int api_status_off)
-{
-	int ndw = size / 4;
-	signed long r;
-	union MESAPI__ADD_QUEUE *x_pkt = pkt;
-	struct MES_API_STATUS *api_status;
-	struct amdgpu_device *adev = mes->adev;
-	struct amdgpu_ring *ring = &mes->ring;
-	unsigned long flags;
-
-	BUG_ON(size % 4 != 0);
-
-	spin_lock_irqsave(&mes->ring_lock, flags);
-	if (amdgpu_ring_alloc(ring, ndw)) {
-		spin_unlock_irqrestore(&mes->ring_lock, flags);
-		return -ENOMEM;
-	}
-
-	api_status = (struct MES_API_STATUS *)((char *)pkt + api_status_off);
-	api_status->api_completion_fence_addr = mes->ring.fence_drv.gpu_addr;
-	api_status->api_completion_fence_value = ++mes->ring.fence_drv.sync_seq;
-
-	amdgpu_ring_write_multiple(ring, pkt, ndw);
-	amdgpu_ring_commit(ring);
-	spin_unlock_irqrestore(&mes->ring_lock, flags);
-
-	DRM_DEBUG("MES msg=%d was emitted\n", x_pkt->header.opcode);
-
-	r = amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
-				      adev->usec_timeout);
-	if (r < 1) {
-		DRM_ERROR("MES failed to response msg=%d\n",
-			  x_pkt->header.opcode);
-
-		while (halt_if_hws_hang)
-			schedule();
-
-		return -ETIMEDOUT;
-	}
-
-	return 0;
-}
-
-static int convert_to_mes_queue_type(int queue_type)
-{
-	if (queue_type == AMDGPU_RING_TYPE_GFX)
-		return MES_QUEUE_TYPE_GFX;
-	else if (queue_type == AMDGPU_RING_TYPE_COMPUTE)
-		return MES_QUEUE_TYPE_COMPUTE;
-	else if (queue_type == AMDGPU_RING_TYPE_SDMA)
-		return MES_QUEUE_TYPE_SDMA;
-	else
-		BUG();
-	return -1;
-}
-
-static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
-				  struct mes_add_queue_input *input)
-{
-	struct amdgpu_device *adev = mes->adev;
-	union MESAPI__ADD_QUEUE mes_add_queue_pkt;
-	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
-	uint32_t vm_cntx_cntl = hub->vm_cntx_cntl;
-
-	memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
-
-	mes_add_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
-	mes_add_queue_pkt.header.opcode = MES_SCH_API_ADD_QUEUE;
-	mes_add_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
-
-	mes_add_queue_pkt.process_id = input->process_id;
-	mes_add_queue_pkt.page_table_base_addr = input->page_table_base_addr;
-	mes_add_queue_pkt.process_va_start = input->process_va_start;
-	mes_add_queue_pkt.process_va_end = input->process_va_end;
-	mes_add_queue_pkt.process_quantum = input->process_quantum;
-	mes_add_queue_pkt.process_context_addr = input->process_context_addr;
-	mes_add_queue_pkt.gang_quantum = input->gang_quantum;
-	mes_add_queue_pkt.gang_context_addr = input->gang_context_addr;
-	mes_add_queue_pkt.inprocess_gang_priority =
-		input->inprocess_gang_priority;
-	mes_add_queue_pkt.gang_global_priority_level =
-		input->gang_global_priority_level;
-	mes_add_queue_pkt.doorbell_offset = input->doorbell_offset;
-	mes_add_queue_pkt.mqd_addr = input->mqd_addr;
-	mes_add_queue_pkt.wptr_addr = input->wptr_addr;
-	mes_add_queue_pkt.queue_type =
-		convert_to_mes_queue_type(input->queue_type);
-	mes_add_queue_pkt.paging = input->paging;
-	mes_add_queue_pkt.vm_context_cntl = vm_cntx_cntl;
-	mes_add_queue_pkt.gws_base = input->gws_base;
-	mes_add_queue_pkt.gws_size = input->gws_size;
-	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
-
-	return mes_v10_1_submit_pkt_and_poll_completion(mes,
-			&mes_add_queue_pkt, sizeof(mes_add_queue_pkt),
-			offsetof(union MESAPI__ADD_QUEUE, api_status));
-}
-
-static int mes_v10_1_remove_hw_queue(struct amdgpu_mes *mes,
-				     struct mes_remove_queue_input *input)
-{
-	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
-
-	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
-
-	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
-	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
-	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
-
-	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
-	mes_remove_queue_pkt.gang_context_addr = input->gang_context_addr;
-
-	return mes_v10_1_submit_pkt_and_poll_completion(mes,
-			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
-			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
-}
-
-static int mes_v10_1_unmap_legacy_queue(struct amdgpu_mes *mes,
-				 struct mes_unmap_legacy_queue_input *input)
-{
-	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
-
-	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
-
-	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
-	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
-	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
-
-	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
-	mes_remove_queue_pkt.gang_context_addr = 0;
-
-	mes_remove_queue_pkt.pipe_id = input->pipe_id;
-	mes_remove_queue_pkt.queue_id = input->queue_id;
-
-	if (input->action == PREEMPT_QUEUES_NO_UNMAP) {
-		mes_remove_queue_pkt.preempt_legacy_gfx_queue = 1;
-		mes_remove_queue_pkt.tf_addr = input->trail_fence_addr;
-		mes_remove_queue_pkt.tf_data =
-			lower_32_bits(input->trail_fence_data);
-	} else {
-		if (input->queue_type == AMDGPU_RING_TYPE_GFX)
-			mes_remove_queue_pkt.unmap_legacy_gfx_queue = 1;
-		else
-			mes_remove_queue_pkt.unmap_kiq_utility_queue = 1;
-	}
-
-	return mes_v10_1_submit_pkt_and_poll_completion(mes,
-			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
-			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
-}
-
-static int mes_v10_1_suspend_gang(struct amdgpu_mes *mes,
-				  struct mes_suspend_gang_input *input)
-{
-	return 0;
-}
-
-static int mes_v10_1_resume_gang(struct amdgpu_mes *mes,
-				 struct mes_resume_gang_input *input)
-{
-	return 0;
-}
-
-static int mes_v10_1_query_sched_status(struct amdgpu_mes *mes)
-{
-	union MESAPI__QUERY_MES_STATUS mes_status_pkt;
-
-	memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
-
-	mes_status_pkt.header.type = MES_API_TYPE_SCHEDULER;
-	mes_status_pkt.header.opcode = MES_SCH_API_QUERY_SCHEDULER_STATUS;
-	mes_status_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
-
-	return mes_v10_1_submit_pkt_and_poll_completion(mes,
-			&mes_status_pkt, sizeof(mes_status_pkt),
-			offsetof(union MESAPI__QUERY_MES_STATUS, api_status));
-}
-
-static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
-{
-	int i;
-	struct amdgpu_device *adev = mes->adev;
-	union MESAPI_SET_HW_RESOURCES mes_set_hw_res_pkt;
-
-	memset(&mes_set_hw_res_pkt, 0, sizeof(mes_set_hw_res_pkt));
-
-	mes_set_hw_res_pkt.header.type = MES_API_TYPE_SCHEDULER;
-	mes_set_hw_res_pkt.header.opcode = MES_SCH_API_SET_HW_RSRC;
-	mes_set_hw_res_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
-
-	mes_set_hw_res_pkt.vmid_mask_mmhub = mes->vmid_mask_mmhub;
-	mes_set_hw_res_pkt.vmid_mask_gfxhub = mes->vmid_mask_gfxhub;
-	mes_set_hw_res_pkt.gds_size = adev->gds.gds_size;
-	mes_set_hw_res_pkt.paging_vmid = 0;
-	mes_set_hw_res_pkt.g_sch_ctx_gpu_mc_ptr = mes->sch_ctx_gpu_addr;
-	mes_set_hw_res_pkt.query_status_fence_gpu_mc_ptr =
-		mes->query_status_fence_gpu_addr;
-
-	for (i = 0; i < MAX_COMPUTE_PIPES; i++)
-		mes_set_hw_res_pkt.compute_hqd_mask[i] =
-			mes->compute_hqd_mask[i];
-
-	for (i = 0; i < MAX_GFX_PIPES; i++)
-		mes_set_hw_res_pkt.gfx_hqd_mask[i] = mes->gfx_hqd_mask[i];
-
-	for (i = 0; i < MAX_SDMA_PIPES; i++)
-		mes_set_hw_res_pkt.sdma_hqd_mask[i] = mes->sdma_hqd_mask[i];
-
-	for (i = 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
-		mes_set_hw_res_pkt.aggregated_doorbells[i] =
-			mes->aggregated_doorbells[i];
-
-	for (i = 0; i < 5; i++) {
-		mes_set_hw_res_pkt.gc_base[i] = adev->reg_offset[GC_HWIP][0][i];
-		mes_set_hw_res_pkt.mmhub_base[i] =
-			adev->reg_offset[MMHUB_HWIP][0][i];
-		mes_set_hw_res_pkt.osssys_base[i] =
-			adev->reg_offset[OSSSYS_HWIP][0][i];
-	}
-
-	mes_set_hw_res_pkt.disable_reset = 1;
-	mes_set_hw_res_pkt.disable_mes_log = 1;
-	mes_set_hw_res_pkt.use_different_vmid_compute = 1;
-
-	return mes_v10_1_submit_pkt_and_poll_completion(mes,
-			&mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt),
-			offsetof(union MESAPI_SET_HW_RESOURCES, api_status));
-}
-
-static void mes_v10_1_init_aggregated_doorbell(struct amdgpu_mes *mes)
-{
-	struct amdgpu_device *adev = mes->adev;
-	uint32_t data;
-
-	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1);
-	data &= ~(CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET_MASK |
-		  CP_MES_DOORBELL_CONTROL1__DOORBELL_EN_MASK |
-		  CP_MES_DOORBELL_CONTROL1__DOORBELL_HIT_MASK);
-	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_LOW] <<
-		CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET__SHIFT;
-	data |= 1 << CP_MES_DOORBELL_CONTROL1__DOORBELL_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1, data);
-
-	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2);
-	data &= ~(CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET_MASK |
-		  CP_MES_DOORBELL_CONTROL2__DOORBELL_EN_MASK |
-		  CP_MES_DOORBELL_CONTROL2__DOORBELL_HIT_MASK);
-	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_NORMAL] <<
-		CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET__SHIFT;
-	data |= 1 << CP_MES_DOORBELL_CONTROL2__DOORBELL_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2, data);
-
-	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3);
-	data &= ~(CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET_MASK |
-		  CP_MES_DOORBELL_CONTROL3__DOORBELL_EN_MASK |
-		  CP_MES_DOORBELL_CONTROL3__DOORBELL_HIT_MASK);
-	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_MEDIUM] <<
-		CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET__SHIFT;
-	data |= 1 << CP_MES_DOORBELL_CONTROL3__DOORBELL_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3, data);
-
-	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4);
-	data &= ~(CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET_MASK |
-		  CP_MES_DOORBELL_CONTROL4__DOORBELL_EN_MASK |
-		  CP_MES_DOORBELL_CONTROL4__DOORBELL_HIT_MASK);
-	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_HIGH] <<
-		CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET__SHIFT;
-	data |= 1 << CP_MES_DOORBELL_CONTROL4__DOORBELL_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4, data);
-
-	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5);
-	data &= ~(CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET_MASK |
-		  CP_MES_DOORBELL_CONTROL5__DOORBELL_EN_MASK |
-		  CP_MES_DOORBELL_CONTROL5__DOORBELL_HIT_MASK);
-	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_REALTIME] <<
-		CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET__SHIFT;
-	data |= 1 << CP_MES_DOORBELL_CONTROL5__DOORBELL_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5, data);
-
-	data = 1 << CP_HQD_GFX_CONTROL__DB_UPDATED_MSG_EN__SHIFT;
-	WREG32_SOC15(GC, 0, mmCP_HQD_GFX_CONTROL, data);
-}
-
-static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
-	.add_hw_queue = mes_v10_1_add_hw_queue,
-	.remove_hw_queue = mes_v10_1_remove_hw_queue,
-	.unmap_legacy_queue = mes_v10_1_unmap_legacy_queue,
-	.suspend_gang = mes_v10_1_suspend_gang,
-	.resume_gang = mes_v10_1_resume_gang,
-};
-
-static int mes_v10_1_allocate_ucode_buffer(struct amdgpu_device *adev,
-					   enum admgpu_mes_pipe pipe)
-{
-	int r;
-	const struct mes_firmware_header_v1_0 *mes_hdr;
-	const __le32 *fw_data;
-	unsigned fw_size;
-
-	mes_hdr = (const struct mes_firmware_header_v1_0 *)
-		adev->mes.fw[pipe]->data;
-
-	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
-		   le32_to_cpu(mes_hdr->mes_ucode_offset_bytes));
-	fw_size = le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
-
-	r = amdgpu_bo_create_reserved(adev, fw_size,
-				      PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
-				      &adev->mes.ucode_fw_obj[pipe],
-				      &adev->mes.ucode_fw_gpu_addr[pipe],
-				      (void **)&adev->mes.ucode_fw_ptr[pipe]);
-	if (r) {
-		dev_err(adev->dev, "(%d) failed to create mes fw bo\n", r);
-		return r;
-	}
-
-	memcpy(adev->mes.ucode_fw_ptr[pipe], fw_data, fw_size);
-
-	amdgpu_bo_kunmap(adev->mes.ucode_fw_obj[pipe]);
-	amdgpu_bo_unreserve(adev->mes.ucode_fw_obj[pipe]);
-
-	return 0;
-}
-
-static int mes_v10_1_allocate_ucode_data_buffer(struct amdgpu_device *adev,
-						enum admgpu_mes_pipe pipe)
-{
-	int r;
-	const struct mes_firmware_header_v1_0 *mes_hdr;
-	const __le32 *fw_data;
-	unsigned fw_size;
-
-	mes_hdr = (const struct mes_firmware_header_v1_0 *)
-		adev->mes.fw[pipe]->data;
-
-	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
-		   le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes));
-	fw_size = le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
-
-	r = amdgpu_bo_create_reserved(adev, fw_size,
-				      64 * 1024, AMDGPU_GEM_DOMAIN_GTT,
-				      &adev->mes.data_fw_obj[pipe],
-				      &adev->mes.data_fw_gpu_addr[pipe],
-				      (void **)&adev->mes.data_fw_ptr[pipe]);
-	if (r) {
-		dev_err(adev->dev, "(%d) failed to create mes data fw bo\n", r);
-		return r;
-	}
-
-	memcpy(adev->mes.data_fw_ptr[pipe], fw_data, fw_size);
-
-	amdgpu_bo_kunmap(adev->mes.data_fw_obj[pipe]);
-	amdgpu_bo_unreserve(adev->mes.data_fw_obj[pipe]);
-
-	return 0;
-}
-
-static void mes_v10_1_free_ucode_buffers(struct amdgpu_device *adev,
-					 enum admgpu_mes_pipe pipe)
-{
-	amdgpu_bo_free_kernel(&adev->mes.data_fw_obj[pipe],
-			      &adev->mes.data_fw_gpu_addr[pipe],
-			      (void **)&adev->mes.data_fw_ptr[pipe]);
-
-	amdgpu_bo_free_kernel(&adev->mes.ucode_fw_obj[pipe],
-			      &adev->mes.ucode_fw_gpu_addr[pipe],
-			      (void **)&adev->mes.ucode_fw_ptr[pipe]);
-}
-
-static void mes_v10_1_enable(struct amdgpu_device *adev, bool enable)
-{
-	uint32_t pipe, data = 0;
-
-	if (enable) {
-		data = RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
-		data = REG_SET_FIELD(data, CP_MES_CNTL,
-			     MES_PIPE1_RESET, adev->enable_mes_kiq ? 1 : 0);
-		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-
-		mutex_lock(&adev->srbm_mutex);
-		for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-			if (!adev->enable_mes_kiq &&
-			    pipe == AMDGPU_MES_KIQ_PIPE)
-				continue;
-
-			nv_grbm_select(adev, 3, pipe, 0, 0);
-			WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
-			     (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
-		}
-		nv_grbm_select(adev, 0, 0, 0, 0);
-		mutex_unlock(&adev->srbm_mutex);
-
-		/* clear BYPASS_UNCACHED to avoid hangs after interrupt. */
-		data = RREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL);
-		data = REG_SET_FIELD(data, CP_MES_DC_OP_CNTL,
-				     BYPASS_UNCACHED, 0);
-		WREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL, data);
-
-		/* unhalt MES and activate pipe0 */
-		data = REG_SET_FIELD(0, CP_MES_CNTL, MES_PIPE0_ACTIVE, 1);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE,
-				     adev->enable_mes_kiq ? 1 : 0);
-		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-		udelay(100);
-	} else {
-		data = RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_ACTIVE, 0);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE, 0);
-		data = REG_SET_FIELD(data, CP_MES_CNTL,
-				     MES_INVALIDATE_ICACHE, 1);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_RESET,
-				     adev->enable_mes_kiq ? 1 : 0);
-		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_HALT, 1);
-		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-	}
-}
-
-/* This function is for backdoor MES firmware */
-static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
-				    enum admgpu_mes_pipe pipe)
-{
-	int r;
-	uint32_t data;
-
-	mes_v10_1_enable(adev, false);
-
-	if (!adev->mes.fw[pipe])
-		return -EINVAL;
-
-	r = mes_v10_1_allocate_ucode_buffer(adev, pipe);
-	if (r)
-		return r;
-
-	r = mes_v10_1_allocate_ucode_data_buffer(adev, pipe);
-	if (r) {
-		mes_v10_1_free_ucode_buffers(adev, pipe);
-		return r;
-	}
-
-	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_CNTL, 0);
-
-	mutex_lock(&adev->srbm_mutex);
-	/* me=3, pipe=0, queue=0 */
-	nv_grbm_select(adev, 3, pipe, 0, 0);
-
-	/* set ucode start address */
-	WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
-		     (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
-
-	/* set ucode fimrware address */
-	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_LO,
-		     lower_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
-	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_HI,
-		     upper_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
-
-	/* set ucode instruction cache boundary to 2M-1 */
-	WREG32_SOC15(GC, 0, mmCP_MES_MIBOUND_LO, 0x1FFFFF);
-
-	/* set ucode data firmware address */
-	WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_LO,
-		     lower_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
-	WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_HI,
-		     upper_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
-
-	/* Set 0x3FFFF (256K-1) to CP_MES_MDBOUND_LO */
-	WREG32_SOC15(GC, 0, mmCP_MES_MDBOUND_LO, 0x3FFFF);
-
-	/* invalidate ICACHE */
-	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 3, 0):
-		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
-		break;
-	default:
-		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
-		break;
-	}
-	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
-	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1);
-	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 3, 0):
-		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
-		break;
-	default:
-		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
-		break;
-	}
-
-	/* prime the ICACHE. */
-	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 3, 0):
-		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
-		break;
-	default:
-		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
-		break;
-	}
-	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
-	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 3, 0):
-		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
-		break;
-	default:
-		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
-		break;
-	}
-
-	nv_grbm_select(adev, 0, 0, 0, 0);
-	mutex_unlock(&adev->srbm_mutex);
-
-	return 0;
-}
-
-static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev,
-				      enum admgpu_mes_pipe pipe)
-{
-	int r;
-	u32 *eop;
-
-	r = amdgpu_bo_create_reserved(adev, MES_EOP_SIZE, PAGE_SIZE,
-			      AMDGPU_GEM_DOMAIN_GTT,
-			      &adev->mes.eop_gpu_obj[pipe],
-			      &adev->mes.eop_gpu_addr[pipe],
-			      (void **)&eop);
-	if (r) {
-		dev_warn(adev->dev, "(%d) create EOP bo failed\n", r);
-		return r;
-	}
-
-	memset(eop, 0, adev->mes.eop_gpu_obj[pipe]->tbo.base.size);
-
-	amdgpu_bo_kunmap(adev->mes.eop_gpu_obj[pipe]);
-	amdgpu_bo_unreserve(adev->mes.eop_gpu_obj[pipe]);
-
-	return 0;
-}
-
-static int mes_v10_1_mqd_init(struct amdgpu_ring *ring)
-{
-	struct v10_compute_mqd *mqd = ring->mqd_ptr;
-	uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
-	uint32_t tmp;
-
-	memset(mqd, 0, sizeof(*mqd));
-
-	mqd->header = 0xC0310800;
-	mqd->compute_pipelinestat_enable = 0x00000001;
-	mqd->compute_static_thread_mgmt_se0 = 0xffffffff;
-	mqd->compute_static_thread_mgmt_se1 = 0xffffffff;
-	mqd->compute_static_thread_mgmt_se2 = 0xffffffff;
-	mqd->compute_static_thread_mgmt_se3 = 0xffffffff;
-	mqd->compute_misc_reserved = 0x00000003;
-
-	eop_base_addr = ring->eop_gpu_addr >> 8;
-
-	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
-	tmp = mmCP_HQD_EOP_CONTROL_DEFAULT;
-	tmp = REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
-			(order_base_2(MES_EOP_SIZE / 4) - 1));
-
-	mqd->cp_hqd_eop_base_addr_lo = lower_32_bits(eop_base_addr);
-	mqd->cp_hqd_eop_base_addr_hi = upper_32_bits(eop_base_addr);
-	mqd->cp_hqd_eop_control = tmp;
-
-	/* disable the queue if it's active */
-	ring->wptr = 0;
-	mqd->cp_hqd_pq_rptr = 0;
-	mqd->cp_hqd_pq_wptr_lo = 0;
-	mqd->cp_hqd_pq_wptr_hi = 0;
-
-	/* set the pointer to the MQD */
-	mqd->cp_mqd_base_addr_lo = ring->mqd_gpu_addr & 0xfffffffc;
-	mqd->cp_mqd_base_addr_hi = upper_32_bits(ring->mqd_gpu_addr);
-
-	/* set MQD vmid to 0 */
-	tmp = mmCP_MQD_CONTROL_DEFAULT;
-	tmp = REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
-	mqd->cp_mqd_control = tmp;
-
-	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
-	hqd_gpu_addr = ring->gpu_addr >> 8;
-	mqd->cp_hqd_pq_base_lo = lower_32_bits(hqd_gpu_addr);
-	mqd->cp_hqd_pq_base_hi = upper_32_bits(hqd_gpu_addr);
-
-	/* set the wb address whether it's enabled or not */
-	wb_gpu_addr = ring->rptr_gpu_addr;
-	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
-	mqd->cp_hqd_pq_rptr_report_addr_hi =
-		upper_32_bits(wb_gpu_addr) & 0xffff;
-
-	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
-	wb_gpu_addr = ring->wptr_gpu_addr;
-	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffff8;
-	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
-
-	/* set up the HQD, this is similar to CP_RB0_CNTL */
-	tmp = mmCP_HQD_PQ_CONTROL_DEFAULT;
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
-			    (order_base_2(ring->ring_size / 4) - 1));
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
-			    ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) << 8));
-#ifdef __BIG_ENDIAN
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
-#endif
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 1);
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0);
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
-	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, NO_UPDATE_RPTR, 1);
-	mqd->cp_hqd_pq_control = tmp;
-
-	/* enable doorbell? */
-	tmp = 0;
-	if (ring->use_doorbell) {
-		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-				    DOORBELL_OFFSET, ring->doorbell_index);
-		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-				    DOORBELL_EN, 1);
-		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-				    DOORBELL_SOURCE, 0);
-		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-				    DOORBELL_HIT, 0);
-	}
-	else
-		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-				    DOORBELL_EN, 0);
-	mqd->cp_hqd_pq_doorbell_control = tmp;
-
-	mqd->cp_hqd_vmid = 0;
-	/* activate the queue */
-	mqd->cp_hqd_active = 1;
-	mqd->cp_hqd_persistent_state = mmCP_HQD_PERSISTENT_STATE_DEFAULT;
-	mqd->cp_hqd_ib_control = mmCP_HQD_IB_CONTROL_DEFAULT;
-	mqd->cp_hqd_iq_timer = mmCP_HQD_IQ_TIMER_DEFAULT;
-	mqd->cp_hqd_quantum = mmCP_HQD_QUANTUM_DEFAULT;
-
-	tmp = mmCP_HQD_GFX_CONTROL_DEFAULT;
-	tmp = REG_SET_FIELD(tmp, CP_HQD_GFX_CONTROL, DB_UPDATED_MSG_EN, 1);
-	/* offset: 184 - this is used for CP_HQD_GFX_CONTROL */
-	mqd->cp_hqd_suspend_cntl_stack_offset = tmp;
-
-	amdgpu_device_flush_hdp(ring->adev, NULL);
-	return 0;
-}
-
-#if 0
-static void mes_v10_1_queue_init_register(struct amdgpu_ring *ring)
-{
-	struct v10_compute_mqd *mqd = ring->mqd_ptr;
-	struct amdgpu_device *adev = ring->adev;
-	uint32_t data = 0;
-
-	mutex_lock(&adev->srbm_mutex);
-	nv_grbm_select(adev, 3, ring->pipe, 0, 0);
-
-	/* set CP_HQD_VMID.VMID = 0. */
-	data = RREG32_SOC15(GC, 0, mmCP_HQD_VMID);
-	data = REG_SET_FIELD(data, CP_HQD_VMID, VMID, 0);
-	WREG32_SOC15(GC, 0, mmCP_HQD_VMID, data);
-
-	/* set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_EN=0 */
-	data = RREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL);
-	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
-			     DOORBELL_EN, 0);
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL, data);
-
-	/* set CP_MQD_BASE_ADDR/HI with the MQD base address */
-	WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR, mqd->cp_mqd_base_addr_lo);
-	WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR_HI, mqd->cp_mqd_base_addr_hi);
-
-	/* set CP_MQD_CONTROL.VMID=0 */
-	data = RREG32_SOC15(GC, 0, mmCP_MQD_CONTROL);
-	data = REG_SET_FIELD(data, CP_MQD_CONTROL, VMID, 0);
-	WREG32_SOC15(GC, 0, mmCP_MQD_CONTROL, 0);
-
-	/* set CP_HQD_PQ_BASE/HI with the ring buffer base address */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE, mqd->cp_hqd_pq_base_lo);
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE_HI, mqd->cp_hqd_pq_base_hi);
-
-	/* set CP_HQD_PQ_RPTR_REPORT_ADDR/HI */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR,
-		     mqd->cp_hqd_pq_rptr_report_addr_lo);
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
-		     mqd->cp_hqd_pq_rptr_report_addr_hi);
-
-	/* set CP_HQD_PQ_CONTROL */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL, mqd->cp_hqd_pq_control);
-
-	/* set CP_HQD_PQ_WPTR_POLL_ADDR/HI */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR,
-		     mqd->cp_hqd_pq_wptr_poll_addr_lo);
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI,
-		     mqd->cp_hqd_pq_wptr_poll_addr_hi);
-
-	/* set CP_HQD_PQ_DOORBELL_CONTROL */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL,
-		     mqd->cp_hqd_pq_doorbell_control);
-
-	/* set CP_HQD_PERSISTENT_STATE.PRELOAD_SIZE=0x53 */
-	WREG32_SOC15(GC, 0, mmCP_HQD_PERSISTENT_STATE, mqd->cp_hqd_persistent_state);
-
-	/* set CP_HQD_ACTIVE.ACTIVE=1 */
-	WREG32_SOC15(GC, 0, mmCP_HQD_ACTIVE, mqd->cp_hqd_active);
-
-	nv_grbm_select(adev, 0, 0, 0, 0);
-	mutex_unlock(&adev->srbm_mutex);
-}
-#endif
-
-static int mes_v10_1_kiq_enable_queue(struct amdgpu_device *adev)
-{
-	struct amdgpu_kiq *kiq = &adev->gfx.kiq[0];
-	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq[0].ring;
-	int r;
-
-	if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
-		return -EINVAL;
-
-	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
-	if (r) {
-		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
-		return r;
-	}
-
-	kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring);
-
-	return amdgpu_ring_test_helper(kiq_ring);
-}
-
-static int mes_v10_1_queue_init(struct amdgpu_device *adev)
-{
-	int r;
-
-	r = mes_v10_1_mqd_init(&adev->mes.ring);
-	if (r)
-		return r;
-
-	r = mes_v10_1_kiq_enable_queue(adev);
-	if (r)
-		return r;
-
-	return 0;
-}
-
-static int mes_v10_1_ring_init(struct amdgpu_device *adev)
-{
-	struct amdgpu_ring *ring;
-
-	ring = &adev->mes.ring;
-
-	ring->funcs = &mes_v10_1_ring_funcs;
-
-	ring->me = 3;
-	ring->pipe = 0;
-	ring->queue = 0;
-
-	ring->ring_obj = NULL;
-	ring->use_doorbell = true;
-	ring->doorbell_index = adev->doorbell_index.mes_ring0 << 1;
-	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_SCHED_PIPE];
-	ring->no_scheduler = true;
-	sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->queue);
-
-	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
-				AMDGPU_RING_PRIO_DEFAULT, NULL);
-}
-
-static int mes_v10_1_kiq_ring_init(struct amdgpu_device *adev)
-{
-	struct amdgpu_ring *ring;
-
-	spin_lock_init(&adev->gfx.kiq[0].ring_lock);
-
-	ring = &adev->gfx.kiq[0].ring;
-
-	ring->me = 3;
-	ring->pipe = 1;
-	ring->queue = 0;
-
-	ring->adev = NULL;
-	ring->ring_obj = NULL;
-	ring->use_doorbell = true;
-	ring->doorbell_index = adev->doorbell_index.mes_ring1 << 1;
-	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_KIQ_PIPE];
-	ring->no_scheduler = true;
-	sprintf(ring->name, "mes_kiq_%d.%d.%d",
-		ring->me, ring->pipe, ring->queue);
-
-	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
-				AMDGPU_RING_PRIO_DEFAULT, NULL);
-}
-
-static int mes_v10_1_mqd_sw_init(struct amdgpu_device *adev,
-				 enum admgpu_mes_pipe pipe)
-{
-	int r, mqd_size = sizeof(struct v10_compute_mqd);
-	struct amdgpu_ring *ring;
-
-	if (pipe == AMDGPU_MES_KIQ_PIPE)
-		ring = &adev->gfx.kiq[0].ring;
-	else if (pipe == AMDGPU_MES_SCHED_PIPE)
-		ring = &adev->mes.ring;
-	else
-		BUG();
-
-	if (ring->mqd_obj)
-		return 0;
-
-	r = amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-				    AMDGPU_GEM_DOMAIN_VRAM |
-				    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
-				    &ring->mqd_gpu_addr, &ring->mqd_ptr);
-	if (r) {
-		dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r);
-		return r;
-	}
-	memset(ring->mqd_ptr, 0, mqd_size);
-
-	/* prepare MQD backup */
-	adev->mes.mqd_backup[pipe] = kmalloc(mqd_size, GFP_KERNEL);
-	if (!adev->mes.mqd_backup[pipe]) {
-		dev_warn(adev->dev,
-			 "no memory to create MQD backup for ring %s\n",
-			 ring->name);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static int mes_v10_1_sw_init(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int pipe, r;
-
-	adev->mes.funcs = &mes_v10_1_funcs;
-	adev->mes.kiq_hw_init = &mes_v10_1_kiq_hw_init;
-
-	r = amdgpu_mes_init(adev);
-	if (r)
-		return r;
-
-	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
-			continue;
-
-		r = mes_v10_1_allocate_eop_buf(adev, pipe);
-		if (r)
-			return r;
-
-		r = mes_v10_1_mqd_sw_init(adev, pipe);
-		if (r)
-			return r;
-	}
-
-	if (adev->enable_mes_kiq) {
-		r = mes_v10_1_kiq_ring_init(adev);
-		if (r)
-			return r;
-	}
-
-	r = mes_v10_1_ring_init(adev);
-	if (r)
-		return r;
-
-	return 0;
-}
-
-static int mes_v10_1_sw_fini(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int pipe;
-
-	amdgpu_device_wb_free(adev, adev->mes.sch_ctx_offs);
-	amdgpu_device_wb_free(adev, adev->mes.query_status_fence_offs);
-
-	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-		kfree(adev->mes.mqd_backup[pipe]);
-
-		amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
-				      &adev->mes.eop_gpu_addr[pipe],
-				      NULL);
-		amdgpu_ucode_release(&adev->mes.fw[pipe]);
-	}
-
-	amdgpu_bo_free_kernel(&adev->gfx.kiq[0].ring.mqd_obj,
-			      &adev->gfx.kiq[0].ring.mqd_gpu_addr,
-			      &adev->gfx.kiq[0].ring.mqd_ptr);
-
-	amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
-			      &adev->mes.ring.mqd_gpu_addr,
-			      &adev->mes.ring.mqd_ptr);
-
-	amdgpu_ring_fini(&adev->gfx.kiq[0].ring);
-	amdgpu_ring_fini(&adev->mes.ring);
-
-	amdgpu_mes_fini(adev);
-	return 0;
-}
-
-static void mes_v10_1_kiq_setting(struct amdgpu_ring *ring)
-{
-	uint32_t tmp;
-	struct amdgpu_device *adev = ring->adev;
-
-	/* tell RLC which is KIQ queue */
-	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-	case IP_VERSION(10, 3, 0):
-	case IP_VERSION(10, 3, 2):
-	case IP_VERSION(10, 3, 1):
-	case IP_VERSION(10, 3, 4):
-		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
-		tmp &= 0xffffff00;
-		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
-		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
-		tmp |= 0x80;
-		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
-		break;
-	default:
-		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS);
-		tmp &= 0xffffff00;
-		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
-		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
-		tmp |= 0x80;
-		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
-		break;
-	}
-}
-
-static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev)
-{
-	int r = 0;
-
-	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
-		r = mes_v10_1_load_microcode(adev, AMDGPU_MES_KIQ_PIPE);
-		if (r) {
-			DRM_ERROR("failed to load MES kiq fw, r=%d\n", r);
-			return r;
-		}
-
-		r = mes_v10_1_load_microcode(adev, AMDGPU_MES_SCHED_PIPE);
-		if (r) {
-			DRM_ERROR("failed to load MES fw, r=%d\n", r);
-			return r;
-		}
-	}
-
-	mes_v10_1_enable(adev, true);
-
-	mes_v10_1_kiq_setting(&adev->gfx.kiq[0].ring);
-
-	r = mes_v10_1_queue_init(adev);
-	if (r)
-		goto failure;
-
-	return r;
-
-failure:
-	mes_v10_1_hw_fini(adev);
-	return r;
-}
-
-static int mes_v10_1_hw_init(void *handle)
-{
-	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	if (!adev->enable_mes_kiq) {
-		if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
-			r = mes_v10_1_load_microcode(adev,
-					     AMDGPU_MES_SCHED_PIPE);
-			if (r) {
-				DRM_ERROR("failed to MES fw, r=%d\n", r);
-				return r;
-			}
-		}
-
-		mes_v10_1_enable(adev, true);
-	}
-
-	r = mes_v10_1_queue_init(adev);
-	if (r)
-		goto failure;
-
-	r = mes_v10_1_set_hw_resources(&adev->mes);
-	if (r)
-		goto failure;
-
-	mes_v10_1_init_aggregated_doorbell(&adev->mes);
-
-	r = mes_v10_1_query_sched_status(&adev->mes);
-	if (r) {
-		DRM_ERROR("MES is busy\n");
-		goto failure;
-	}
-
-	/*
-	 * Disable KIQ ring usage from the driver once MES is enabled.
-	 * MES uses KIQ ring exclusively so driver cannot access KIQ ring
-	 * with MES enabled.
-	 */
-	adev->gfx.kiq[0].ring.sched.ready = false;
-	adev->mes.ring.sched.ready = true;
-
-	return 0;
-
-failure:
-	mes_v10_1_hw_fini(adev);
-	return r;
-}
-
-static int mes_v10_1_hw_fini(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	adev->mes.ring.sched.ready = false;
-
-	mes_v10_1_enable(adev, false);
-
-	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
-		mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
-		mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE);
-	}
-
-	return 0;
-}
-
-static int mes_v10_1_suspend(void *handle)
-{
-	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	r = amdgpu_mes_suspend(adev);
-	if (r)
-		return r;
-
-	return mes_v10_1_hw_fini(adev);
-}
-
-static int mes_v10_1_resume(void *handle)
-{
-	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	r = mes_v10_1_hw_init(adev);
-	if (r)
-		return r;
-
-	return amdgpu_mes_resume(adev);
-}
-
-static int mes_v10_0_early_init(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int pipe, r;
-
-	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
-			continue;
-		r = amdgpu_mes_init_microcode(adev, pipe);
-		if (r)
-			return r;
-	}
-
-	return 0;
-}
-
-static int mes_v10_0_late_init(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	if (!amdgpu_in_reset(adev))
-		amdgpu_mes_self_test(adev);
-
-	return 0;
-}
-
-static const struct amd_ip_funcs mes_v10_1_ip_funcs = {
-	.name = "mes_v10_1",
-	.early_init = mes_v10_0_early_init,
-	.late_init = mes_v10_0_late_init,
-	.sw_init = mes_v10_1_sw_init,
-	.sw_fini = mes_v10_1_sw_fini,
-	.hw_init = mes_v10_1_hw_init,
-	.hw_fini = mes_v10_1_hw_fini,
-	.suspend = mes_v10_1_suspend,
-	.resume = mes_v10_1_resume,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
-};
-
-const struct amdgpu_ip_block_version mes_v10_1_ip_block = {
-	.type = AMD_IP_BLOCK_TYPE_MES,
-	.major = 10,
-	.minor = 1,
-	.rev = 0,
-	.funcs = &mes_v10_1_ip_funcs,
-};
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
deleted file mode 100644
index 9afd6ddb01e9c..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Copyright 2019 Advanced Micro Devices, Inc.
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
-#ifndef __MES_V10_1_H__
-#define __MES_V10_1_H__
-
-extern const struct amdgpu_ip_block_version mes_v10_1_ip_block;
-
-#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 7e30a89fe03ef..4938e6b340e9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -59,7 +59,6 @@
 #include "vcn_v3_0.h"
 #include "jpeg_v3_0.h"
 #include "amdgpu_vkms.h"
-#include "mes_v10_1.h"
 #include "mxgpu_nv.h"
 #include "smuio_v11_0.h"
 #include "smuio_v11_0_6.h"
-- 
2.45.0

