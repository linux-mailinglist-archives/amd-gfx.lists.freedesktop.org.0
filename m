Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8986B2ED
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Feb 2024 16:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F2510E2E1;
	Wed, 28 Feb 2024 15:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZoKXFv+K";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6EE10E1AE
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 15:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxEgaixjsQoTIPAUfLRl/Bf2EAnXlDA30YHh8v/YQYEb3WES10fQqZyAK/lgbDZLr7dzufHMw2Q0miyb83Tpg2VlmPPQhbET6dNaC/EdqiQyRFr0YJW9ERFTSI59khOXRFLFsTfApWpMH1IxpuDk6EmPjXeqXYjFenApChoWzPCCvHyhI04taCUafUzOdfVauiWuOMSOwUv4QV+gHpSYvQHJE6iuYQlkhWdWlh2/7yVcKcvv3Ifa6sW37NWX+VWE3jJJ/ghE5E0rZEwxpYXsbvnCxL1hyjdyBE3JFCvX0lAYJ6kh+Xtx7qHkS/gsADOrTCevqOvoMFpn8Tmp+VKMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKjs2585/EC+wV2ZGLagZdBFvI8I67trpJz4K2aaROE=;
 b=WamUPvgQy0vTu84HosNnFTXY1mISJ1eXmJ1BaGqodoFOjy35VvSyjNhKGAr0f8JQkwFBSAFKDky74ocgG/BxGFV8nkBemRV0J4/TBcm1VpGiu4CZliZdbR391jcx62vEuJuMhD3IYkh6X93L458m3Q2JwlG7YGCsSYsz0kaxbFWjuxFue3axvFSHZ2TgqLpjQSw/I4ITkclKJ9cOMIWxl+UNLepHhYsHzm4YUjzAwN2WkQn7acGMi17XbX5nW30DLeSdTMOlPXTJC2REV7+WuiXCW9F6OcenwKouII4R3Tji1o6FOoXATeZP79gbIyz3u9Z4Kv9tqzgOEUoIzD5dhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKjs2585/EC+wV2ZGLagZdBFvI8I67trpJz4K2aaROE=;
 b=ZoKXFv+KNXGfkmf0w0W4RALnq6DLZJPpjBZJKBqXzL5IGOvJPKjm7QX7NpvP4dW2+jxVhPCNPs/x4mrMcl4F0DVXjGBCb35b2dGLb9cVN3upWIyidpjqCOuUruSI4+QiBvLypYYN3SE9wQUwW0ByuVxF7CHQ9BVwJ+mOyOBCW00=
Received: from CH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::10)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 15:17:42 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ed) by CH5P220CA0002.outlook.office365.com
 (2603:10b6:610:1ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Wed, 28 Feb 2024 15:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 15:17:41 +0000
Received: from eric-hp-elitebook-845-g7.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 09:17:40 -0600
From: Eric Huang <jinhuieric.huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Eric Huang <jinhuieric.huang@amd.com>
Subject: [PATCH] amd/amdkfd: remove unused parameter
Date: Wed, 28 Feb 2024 10:17:27 -0500
Message-ID: <20240228151727.102002-1-jinhuieric.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4986a5-7378-4e8f-374b-08dc387068ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brhQ7trw6d4jNOZpq+8cM0lkTvDYtf2kyD6Hbaox8Nr/gdq/2RkC4lwX8apXlDr+V3dAhCIWwrCZbXBB52Sw0akRXzdaoDwtG5otiGBM9lormV/hkaITzQY08bBhigLU0F9RJjFzp3N+38LCArytiYkY0VnPYBop6mu//N/IOW5e7vKNiU36T1dtg7zlKC8EbXN44/nSlyZoWprrrKy2rfPXpkMAgPujSkGMBrzEMLSSfx9qk2boc7rDKDhFYdx6ZwAQQq6sE67tMJ7v3I2MIlEtBt40JPAwXj3hqCvMVHIpaUgguFTSQZ8YC5yhWTf8nPj0WIEVRynrF6fqtFmlNsFO2LtaFeoeGl000eKzPCznqNgK5fjV1juRLUho3KKYCW3/virUdDFM2z1D1ZM3AGp4D9qNswaH6aV6wfsxdvu1QrD7pddlZDOyViPQOHzDljm6eyl0gYZUQTSQSsWXrj7SkEMs/tRteAoA8uGlEnVTqHXnbkBmNzdUvmdu2o9uVgYDpN+2RnDqi+TjeMzzNRC5eF6CWTxUEfKkXeQff+AHFtd+VMmr4Co4Af5bFnvi0glFeBXfntDPqQbYbv1+b2Dt+3wHLHJio0App86YlJMOqt2MgjOA967WcxI//8oJW4f5wiPdrBtNwLxRX31mzqajg3w+pJS0+Gcl1EdCD/asNq3NXaOYkBLhnnanCVXbnT5Jv0FE3Wd2dc0lafaHP4yFzMvwQrC+iCtGuIgZcRCWSp/lg6juMYB6stWUGTjB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:17:41.9314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4986a5-7378-4e8f-374b-08dc387068ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249
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

The adev can be found from bo by amdgpu_ttm_adev(bo->tbo.bdev),
and adev is also not used in the function
amdgpu_amdkfd_map_gtt_bo_to_gart().

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h       | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 +--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c         | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 4fb32d86cd0e..0ef223c2affb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -320,7 +320,7 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct kgd_mem *mem,
 					     void **kptr, uint64_t *size);
 void amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(struct kgd_mem *mem);
 
-int amdgpu_amdkfd_map_gtt_bo_to_gart(struct amdgpu_device *adev, struct amdgpu_bo *bo);
+int amdgpu_amdkfd_map_gtt_bo_to_gart(struct amdgpu_bo *bo);
 
 int amdgpu_amdkfd_gpuvm_restore_process_bos(void *process_info,
 					    struct dma_fence __rcu **ef);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index ef71b12062a1..bf8e6653341f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2189,13 +2189,12 @@ int amdgpu_amdkfd_gpuvm_sync_memory(
 
 /**
  * amdgpu_amdkfd_map_gtt_bo_to_gart - Map BO to GART and increment reference count
- * @adev: Device to which allocated BO belongs
  * @bo: Buffer object to be mapped
  *
  * Before return, bo reference count is incremented. To release the reference and unpin/
  * unmap the BO, call amdgpu_amdkfd_free_gtt_mem.
  */
-int amdgpu_amdkfd_map_gtt_bo_to_gart(struct amdgpu_device *adev, struct amdgpu_bo *bo)
+int amdgpu_amdkfd_map_gtt_bo_to_gart(struct amdgpu_bo *bo)
 {
 	int ret;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 824e660283b2..f030cafc5a0a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -371,7 +371,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			goto err_wptr_map_gart;
 		}
 
-		err = amdgpu_amdkfd_map_gtt_bo_to_gart(dev->adev, wptr_bo);
+		err = amdgpu_amdkfd_map_gtt_bo_to_gart(wptr_bo);
 		if (err) {
 			pr_err("Failed to map wptr bo to GART\n");
 			goto err_wptr_map_gart;
-- 
2.34.1

