Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B056053ED8C
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jun 2022 20:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089DD112494;
	Mon,  6 Jun 2022 18:07:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223A5112494
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jun 2022 18:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOGYZ/Jwhs0g+UkOq+1bJu6IKcvwwl1ul0Xy0uHzqd6znNJSgACg4VuokkSh+Nvdr6vv4vbCHuXyYzv5MV3QCaGzZkNa/3ATPp3gL49R8eelB5jbL8L5NbMSxG4VMHe2WDmg7W3IkMoyfRqnmRFQP6SFYz93+0x0CRVOmhk3SjrYvPf7UsHYLbbmYWVGb945EDnQF6FoNCyoDkuExofbcfDREDMK9q0rZMaVhGDdPArjvXwPqWET+33wRhKkAwfYAss1ETc6jmADQEeWPNA94hKD0yEqJBaSeceOzILil5Ayz4z7z3AtkV/0xGTAlJs/G3MJRrEm2kQKmGACb72plA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugA6kIL7QQBDmTo2zd4WunHMBg47GXtmWb8vwQeJd+A=;
 b=kB4SnKkw0OGSdLtwf01rV7AiiOlVkeoQX08loj0Mip/tjYFb7cNDg5yUnUTSe9GtSCO1SMZCaKuoN57jrYNQMB+t+i/DH0tgzpv2pvXvQdMj1qnTJFsSunnsfyIDzLU14ic/ZftRSIN29u/2y8f1b8f5nPm8cO5PcyWkT4chIfIr+5BWUtkYcItEXlhOLrsi8HDOuwIJmDa6UNHIEODNE68DSxSQxn0xdkZj55y7jd7pbsZR+h5cWiwKD2U1PSlzLmMiXDHkJvP0k5Jk3JVhrMBSLkcw5cYmV9SxTsouSMCgVlL0pUJ+4X1pgjtUbYC9t3uixWGKl84ySQhP4374gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugA6kIL7QQBDmTo2zd4WunHMBg47GXtmWb8vwQeJd+A=;
 b=t3JQmPzhsK9Zg4g40HQp5lvnoEVnj+y3HX2WfxvN3CAPdmeJwljZEwidYo18CWP9vZTCsRjbCjiFoLi/zr7Pl0TrNRDnn3lZnlIZh3MRWYPGTgBkkD9iF6zbcr6GSy7oX5r2GKjnpUrCwo4jKxo9PtNf+XFeGbIy2lsHiBXup5c=
Received: from MW4PR02CA0011.namprd02.prod.outlook.com (2603:10b6:303:16d::28)
 by BN6PR1201MB0146.namprd12.prod.outlook.com (2603:10b6:405:59::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 18:07:54 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::c8) by MW4PR02CA0011.outlook.office365.com
 (2603:10b6:303:16d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15 via Frontend
 Transport; Mon, 6 Jun 2022 18:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 18:07:53 +0000
Received: from RErrabolDevMach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 6 Jun
 2022 13:07:52 -0500
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Add peer-to-peer support among PCIe connected
 AMD GPUs
Date: Mon, 6 Jun 2022 13:07:42 -0500
Message-ID: <20220606180742.3313561-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe3e78e0-d732-4e63-14ca-08da47e77a24
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0146:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0146C90AB882069AE4006B58E3A29@BN6PR1201MB0146.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLzqT0odwbo0G8iwpu5FliMSf3fMWIQI3kLzY7BiLQRlla8SarZ7dkf/bRDrRyzMTz1YfnsAGEfSv3e+M1SK5nn5q8W0VGMjfsMVVbsCvH9neDruO56eLZYV0HmpeLcaervhUU6MFKhDey6pzHbDNvQ7q3c7PFrqNbybBjQvyKwPeevvIsy+CyO5+2VZFOs5iWiJdjFt+NWLq2x8Wt41b9L4OJgxIZDCTunObpElCVhndesU1AzSGR/RNlZdknGY7HVdBs+QtzS7dUamv2H6MpJaOpm1pKZrrTsesyTcFix26+l821LrAV3AxsNwjnt4hXZmWIHB6xN4GdVZcOGilul9HHrGVqFaxgqkxSUiRLfQlfxw+Mg9zpERZ6wVHShaBnd6OOaH2G4t0vpntD5npjcM2Jpl4AQoCgubJYfsAeb9HCgjzBf3mWdT3vCQamw+BHI6ba3adXG2Mwv6vwQ4oBXN/Ly0FQB21dYk8T0lBHe/tn4m0RDv8sm37sxNHTM0VbQE/deGt6AyZK2+uxKa3tMOZH9xE2Tlv0sI6/ofVLeuNf3Ry+KlF079iHTBjiSm+ebIqPycan17eKDRxSNLmbWXzDD+0HmDR1caxiTxbbvrZDF1a2LkW4hhnyq6QAl2e59iLRkxjvu+92byDnTPkI9RNJvObpc+2vDBuO0IYnTiOqcbbuj0PzbdhcQWrAkW04qRf71KL9l3Oh2ACODqNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(82310400005)(40460700003)(7696005)(70206006)(70586007)(8936002)(508600001)(16526019)(186003)(5660300002)(1076003)(4326008)(2616005)(8676002)(47076005)(426003)(81166007)(356005)(26005)(30864003)(6916009)(6666004)(2906002)(316002)(36756003)(83380400001)(36860700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 18:07:53.6830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e78e0-d732-4e63-14ca-08da47e77a24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0146
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add support for peer-to-peer communication among AMD GPUs over PCIe
bus. Support REQUIRES enablement of config HSA_AMD_P2P.

Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 300 ++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  33 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   8 +
 4 files changed, 280 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index f8b9f27adcf5..5c00ea1df21c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -48,6 +48,7 @@ enum kfd_mem_attachment_type {
 	KFD_MEM_ATT_SHARED,	/* Share kgd_mem->bo or another attachment's */
 	KFD_MEM_ATT_USERPTR,	/* SG bo to DMA map pages from a userptr bo */
 	KFD_MEM_ATT_DMABUF,	/* DMAbuf to DMA map TTM BOs */
+	KFD_MEM_ATT_SG		/* Tag to DMA map SG BOs */
 };
 
 struct kfd_mem_attachment {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 054e4a76ae2e..ce012a148ed7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -241,6 +241,42 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
 	kfree(bo->kfd_bo);
 }
 
+/**
+ * @create_dmamap_sg_bo: Creates a amdgpu_bo object to reflect information
+ * about USERPTR or DOOREBELL or MMIO BO.
+ * @adev: Device for which dmamap BO is being created
+ * @mem: BO of peer device that is being DMA mapped. Provides parameters
+ *	 in building the dmamap BO
+ * @bo_out: Output parameter updated with handle of dmamap BO
+ */
+static int
+create_dmamap_sg_bo(struct amdgpu_device *adev,
+		 struct kgd_mem *mem, struct amdgpu_bo **bo_out)
+{
+	struct drm_gem_object *gem_obj;
+	int ret, align;
+
+	ret = amdgpu_bo_reserve(mem->bo, false);
+	if (ret)
+		return ret;
+
+	align = 1;
+	ret = amdgpu_gem_object_create(adev, mem->bo->tbo.base.size, align,
+			AMDGPU_GEM_DOMAIN_CPU, AMDGPU_GEM_CREATE_PREEMPTIBLE,
+			ttm_bo_type_sg, mem->bo->tbo.base.resv, &gem_obj);
+
+	amdgpu_bo_unreserve(mem->bo);
+
+	if (ret) {
+		pr_err("Error in creating DMA mappable SG BO on domain: %d\n", ret);
+		return -EINVAL;
+	}
+
+	*bo_out = gem_to_amdgpu_bo(gem_obj);
+	(*bo_out)->parent = amdgpu_bo_ref(mem->bo);
+	return ret;
+}
+
 /* amdgpu_amdkfd_remove_eviction_fence - Removes eviction fence from BO's
  *  reservation object.
  *
@@ -481,6 +517,38 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
 	return pte_flags;
 }
 
+/**
+ * create_sg_table() - Create an sg_table for a contiguous DMA addr range
+ * @addr: The starting address to point to
+ * @size: Size of memory area in bytes being pointed to
+ *
+ * Allocates an instance of sg_table and initializes it to point to memory
+ * area specified by input parameters. The address used to build is assumed
+ * to be DMA mapped, if needed.
+ *
+ * DOORBELL or MMIO BOs use only one scatterlist node in their sg_table
+ * because they are physically contiguous.
+ *
+ * Return: Initialized instance of SG Table or NULL
+ */
+static struct sg_table *create_sg_table(uint64_t addr, uint32_t size)
+{
+	struct sg_table *sg = kmalloc(sizeof(*sg), GFP_KERNEL);
+
+	if (!sg)
+		return NULL;
+	if (sg_alloc_table(sg, 1, GFP_KERNEL)) {
+		kfree(sg);
+		return NULL;
+	}
+	sg_dma_address(sg->sgl) = addr;
+	sg->sgl->length = size;
+#ifdef CONFIG_NEED_SG_DMA_LENGTH
+	sg->sgl->dma_length = size;
+#endif
+	return sg;
+}
+
 static int
 kfd_mem_dmamap_userptr(struct kgd_mem *mem,
 		       struct kfd_mem_attachment *attachment)
@@ -545,6 +613,87 @@ kfd_mem_dmamap_dmabuf(struct kfd_mem_attachment *attachment)
 	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }
 
+/**
+ * kfd_mem_dmamap_sg_bo() - Create DMA mapped sg_table to access DOORBELL or MMIO BO
+ * @mem: SG BO of the DOORBELL or MMIO resource on the owning device
+ * @attachment: Virtual address attachment of the BO on accessing device
+ *
+ * An access request from the device that owns DOORBELL does not require DMA mapping.
+ * This is because the request doesn't go through PCIe root complex i.e. it instead
+ * loops back. The need to DMA map arises only when accessing peer device's DOORBELL
+ *
+ * In contrast, all access requests for MMIO need to be DMA mapped without regard to
+ * device ownership. This is because access requests for MMIO go through PCIe root
+ * complex.
+ *
+ * This is accomplished in two steps:
+ *   - Obtain DMA mapped address of DOORBELL or MMIO memory that could be used
+ *         in updating requesting device's page table
+ *   - Signal TTM to mark memory pointed to by requesting device's BO as GPU
+ *         accessible. This allows an update of requesting device's page table
+ *         with entries associated with DOOREBELL or MMIO memory
+ *
+ * This method is invoked in the following contexts:
+ *   - Mapping of DOORBELL or MMIO BO of same or peer device
+ *   - Validating an evicted DOOREBELL or MMIO BO on device seeking access
+ *
+ * Return: ZERO if successful, NON-ZERO otherwise
+ */
+static int
+kfd_mem_dmamap_sg_bo(struct kgd_mem *mem,
+		     struct kfd_mem_attachment *attachment)
+{
+	struct ttm_operation_ctx ctx = {.interruptible = true};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+	struct amdgpu_device *adev = attachment->adev;
+	struct ttm_tt *ttm = bo->tbo.ttm;
+	enum dma_data_direction dir;
+	dma_addr_t dma_addr;
+	bool mmio;
+	int ret;
+
+	/* Expect SG Table of dmapmap BO to be NULL */
+	mmio = (mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP);
+	if (unlikely(ttm->sg)) {
+		pr_err("SG Table of %d BO for peer device is UNEXPECTEDLY NON-NULL", mmio);
+		return -EINVAL;
+	}
+
+	dir = mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+			DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	dma_addr = mem->bo->tbo.sg->sgl->dma_address;
+	pr_debug("%d BO size: %d\n", mmio, mem->bo->tbo.sg->sgl->length);
+	pr_debug("%d BO address before DMA mapping: %llx\n", mmio, dma_addr);
+	dma_addr = dma_map_resource(adev->dev, dma_addr,
+			mem->bo->tbo.sg->sgl->length, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_mapping_error(adev->dev, dma_addr);
+	if (unlikely(ret))
+		return ret;
+	pr_debug("%d BO address after DMA mapping: %llx\n", mmio, dma_addr);
+
+	ttm->sg = create_sg_table(dma_addr, mem->bo->tbo.sg->sgl->length);
+	if (unlikely(!ttm->sg)) {
+		ret = -ENOMEM;
+		goto unmap_sg;
+	}
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
+	ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	if (unlikely(ret))
+		goto free_sg;
+
+	return ret;
+
+free_sg:
+	sg_free_table(ttm->sg);
+	kfree(ttm->sg);
+	ttm->sg = NULL;
+unmap_sg:
+	dma_unmap_resource(adev->dev, dma_addr, mem->bo->tbo.sg->sgl->length,
+			   dir, DMA_ATTR_SKIP_CPU_SYNC);
+	return ret;
+}
+
 static int
 kfd_mem_dmamap_attachment(struct kgd_mem *mem,
 			  struct kfd_mem_attachment *attachment)
@@ -556,6 +705,8 @@ kfd_mem_dmamap_attachment(struct kgd_mem *mem,
 		return kfd_mem_dmamap_userptr(mem, attachment);
 	case KFD_MEM_ATT_DMABUF:
 		return kfd_mem_dmamap_dmabuf(attachment);
+	case KFD_MEM_ATT_SG:
+		return kfd_mem_dmamap_sg_bo(mem, attachment);
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -596,6 +747,50 @@ kfd_mem_dmaunmap_dmabuf(struct kfd_mem_attachment *attachment)
 	ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }
 
+/**
+ * kfd_mem_dmaunmap_sg_bo() - Free DMA mapped sg_table of DOORBELL or MMIO BO
+ * @mem: SG BO of the DOORBELL or MMIO resource on the owning device
+ * @attachment: Virtual address attachment of the BO on accessing device
+ *
+ * The method performs following steps:
+ *   - Signal TTM to mark memory pointed to by BO as GPU inaccessible
+ *   - Free SG Table that is used to encapsulate DMA mapped memory of
+ *          peer device's DOORBELL or MMIO memory
+ *
+ * This method is invoked in the following contexts:
+ *     UNMapping of DOORBELL or MMIO BO on a device having access to its memory
+ *     Eviction of DOOREBELL or MMIO BO on device having access to its memory
+ *
+ * Return: void
+ */
+static void
+kfd_mem_dmaunmap_sg_bo(struct kgd_mem *mem,
+		       struct kfd_mem_attachment *attachment)
+{
+	struct ttm_operation_ctx ctx = {.interruptible = true};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+	struct amdgpu_device *adev = attachment->adev;
+	struct ttm_tt *ttm = bo->tbo.ttm;
+	enum dma_data_direction dir;
+
+	if (unlikely(!ttm->sg)) {
+		pr_err("SG Table of BO is UNEXPECTEDLY NULL");
+		return;
+	}
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
+	ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+
+	dir = mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+				DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	dma_unmap_resource(adev->dev, ttm->sg->sgl->dma_address,
+			ttm->sg->sgl->length, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(ttm->sg);
+	kfree(ttm->sg);
+	ttm->sg = NULL;
+	bo->tbo.sg = NULL;
+}
+
 static void
 kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 			    struct kfd_mem_attachment *attachment)
@@ -609,38 +804,14 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	case KFD_MEM_ATT_DMABUF:
 		kfd_mem_dmaunmap_dmabuf(attachment);
 		break;
+	case KFD_MEM_ATT_SG:
+		kfd_mem_dmaunmap_sg_bo(mem, attachment);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 	}
 }
 
-static int
-kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
-		       struct amdgpu_bo **bo)
-{
-	unsigned long bo_size = mem->bo->tbo.base.size;
-	struct drm_gem_object *gobj;
-	int ret;
-
-	ret = amdgpu_bo_reserve(mem->bo, false);
-	if (ret)
-		return ret;
-
-	ret = amdgpu_gem_object_create(adev, bo_size, 1,
-				       AMDGPU_GEM_DOMAIN_CPU,
-				       AMDGPU_GEM_CREATE_PREEMPTIBLE,
-				       ttm_bo_type_sg, mem->bo->tbo.base.resv,
-				       &gobj);
-	amdgpu_bo_unreserve(mem->bo);
-	if (ret)
-		return ret;
-
-	*bo = gem_to_amdgpu_bo(gobj);
-	(*bo)->parent = amdgpu_bo_ref(mem->bo);
-
-	return 0;
-}
-
 static int
 kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 		      struct amdgpu_bo **bo)
@@ -691,6 +862,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
+	bool same_hive = false;
 	int i, ret;
 
 	if (!va) {
@@ -698,6 +870,24 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		return -EINVAL;
 	}
 
+	/* Determine access to VRAM, MMIO and DOORBELL BOs of peer devices
+	 *
+	 * The access path of MMIO and DOORBELL BOs of is always over PCIe.
+	 * In contrast the access path of VRAM BOs depens upon the type of
+	 * link that connects the peer device. Access over PCIe is allowed
+	 * if peer device has large BAR. In contrast, access over xGMI is
+	 * allowed for both small and large BAR configurations of peer device
+	 */
+	if ((adev != bo_adev) &&
+	    ((mem->domain == AMDGPU_GEM_DOMAIN_VRAM) ||
+	     (mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) ||
+	     (mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP))) {
+		if (mem->domain == AMDGPU_GEM_DOMAIN_VRAM)
+			same_hive = amdgpu_xgmi_same_hive(adev, bo_adev);
+		if (!same_hive && !amdgpu_device_is_peer_accessible(bo_adev, adev))
+			return -EINVAL;
+	}
+
 	for (i = 0; i <= is_aql; i++) {
 		attachment[i] = kzalloc(sizeof(*attachment[i]), GFP_KERNEL);
 		if (unlikely(!attachment[i])) {
@@ -708,9 +898,9 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			 va + bo_size, vm);
 
-		if (adev == bo_adev ||
-		   (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) && adev->ram_is_direct_mapped) ||
-		   (mem->domain == AMDGPU_GEM_DOMAIN_VRAM && amdgpu_xgmi_same_hive(adev, bo_adev))) {
+		if ((adev == bo_adev && !(mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP)) ||
+		    (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) && adev->ram_is_direct_mapped) ||
+		    same_hive) {
 			/* Mappings on the local GPU, or VRAM mappings in the
 			 * local hive, or userptr mapping IOMMU direct map mode
 			 * share the original BO
@@ -726,26 +916,30 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		} else if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
 			/* Create an SG BO to DMA-map userptrs on other GPUs */
 			attachment[i]->type = KFD_MEM_ATT_USERPTR;
-			ret = kfd_mem_attach_userptr(adev, mem, &bo[i]);
+			ret = create_dmamap_sg_bo(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
-		} else if (mem->domain == AMDGPU_GEM_DOMAIN_GTT &&
-			   mem->bo->tbo.type != ttm_bo_type_sg) {
-			/* GTT BOs use DMA-mapping ability of dynamic-attach
-			 * DMA bufs. TODO: The same should work for VRAM on
-			 * large-BAR GPUs.
-			 */
+		/* Handle DOORBELL BOs of peer devices and MMIO BOs of local and peer devices */
+		} else if (mem->bo->tbo.type == ttm_bo_type_sg) {
+			WARN_ONCE(!(mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL ||
+				    mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP),
+				  "Handing invalid SG BO in ATTACH request");
+			attachment[i]->type = KFD_MEM_ATT_SG;
+			ret = create_dmamap_sg_bo(adev, mem, &bo[i]);
+			if (ret)
+				goto unwind;
+		/* Enable acces to GTT and VRAM BOs of peer devices */
+		} else if (mem->domain == AMDGPU_GEM_DOMAIN_GTT ||
+			   mem->domain == AMDGPU_GEM_DOMAIN_VRAM) {
 			attachment[i]->type = KFD_MEM_ATT_DMABUF;
 			ret = kfd_mem_attach_dmabuf(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
+			pr_debug("Employ DMABUF mechanim to enable peer GPU access\n");
 		} else {
-			/* FIXME: Need to DMA-map other BO types:
-			 * large-BAR VRAM, doorbells, MMIO remap
-			 */
-			attachment[i]->type = KFD_MEM_ATT_SHARED;
-			bo[i] = mem->bo;
-			drm_gem_object_get(&bo[i]->tbo.base);
+			WARN_ONCE(true, "Handling invalid ATTACH request");
+			ret = -EINVAL;
+			goto unwind;
 		}
 
 		/* Add BO to VM internal data structures */
@@ -1146,24 +1340,6 @@ static int map_bo_to_gpuvm(struct kgd_mem *mem,
 	return ret;
 }
 
-static struct sg_table *create_doorbell_sg(uint64_t addr, uint32_t size)
-{
-	struct sg_table *sg = kmalloc(sizeof(*sg), GFP_KERNEL);
-
-	if (!sg)
-		return NULL;
-	if (sg_alloc_table(sg, 1, GFP_KERNEL)) {
-		kfree(sg);
-		return NULL;
-	}
-	sg->sgl->dma_address = addr;
-	sg->sgl->length = size;
-#ifdef CONFIG_NEED_SG_DMA_LENGTH
-	sg->sgl->dma_length = size;
-#endif
-	return sg;
-}
-
 static int process_validate_vms(struct amdkfd_process_info *process_info)
 {
 	struct amdgpu_vm *peer_vm;
@@ -1532,7 +1708,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 			bo_type = ttm_bo_type_sg;
 			if (size > UINT_MAX)
 				return -EINVAL;
-			sg = create_doorbell_sg(*offset, size);
+			sg = create_sg_table(*offset, size);
 			if (!sg)
 				return -ENOMEM;
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index be0baacc5942..8e88e7c88d26 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -34,6 +34,7 @@
 #include <linux/pci.h>
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
+#include <linux/pci-p2pdma.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -129,6 +130,8 @@ const char *amdgpu_asic_name[] = {
 	"LAST",
 };
 
+extern bool pcie_p2p;
+
 /**
  * DOC: pcie_replay_count
  *
@@ -5498,6 +5501,36 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 	}
 }
 
+/**
+ * amdgpu_device_is_peer_accessible - Check peer access through PCIe BAR
+ *
+ * @adev: amdgpu_device pointer
+ * @peer_adev: amdgpu_device pointer for peer device trying to access @adev
+ *
+ * Return true if @peer_adev can access (DMA) @adev through the PCIe
+ * BAR, i.e. @adev is "large BAR" and the BAR matches the DMA mask of
+ * @peer_adev.
+ */
+bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
+				      struct amdgpu_device *peer_adev)
+{
+#ifdef CONFIG_HSA_AMD_P2P
+	uint64_t address_mask = peer_adev->dev->dma_mask ?
+		~*peer_adev->dev->dma_mask : ~((1ULL << 32) - 1);
+	resource_size_t aper_limit =
+		adev->gmc.aper_base + adev->gmc.aper_size - 1;
+	bool p2p_access = !(pci_p2pdma_distance_many(adev->pdev,
+					&peer_adev->dev, 1, true) < 0);
+
+	return pcie_p2p && p2p_access && (adev->gmc.visible_vram_size &&
+		adev->gmc.real_vram_size == adev->gmc.visible_vram_size &&
+		!(adev->gmc.aper_base & address_mask ||
+		  aper_limit & address_mask));
+#else
+	return false;
+#endif
+}
+
 int amdgpu_device_baco_enter(struct drm_device *dev)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bed4ed88951f..d1c82a9e8569 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -802,6 +802,14 @@ MODULE_PARM_DESC(no_queue_eviction_on_vm_fault, "No queue eviction on VM fault (
 module_param_named(no_queue_eviction_on_vm_fault, amdgpu_no_queue_eviction_on_vm_fault, int, 0444);
 #endif
 
+/**
+ * DOC: pcie_p2p (bool)
+ * Enable PCIe P2P (requires large-BAR). Default value: true (on)
+ */
+bool pcie_p2p = true;
+module_param(pcie_p2p, bool, 0444);
+MODULE_PARM_DESC(pcie_p2p, "Enable PCIe P2P (requires large-BAR). (N = off, Y = on(default))");
+
 /**
  * DOC: dcfeaturemask (uint)
  * Override display features enabled. See enum DC_FEATURE_MASK in drivers/gpu/drm/amd/include/amd_shared.h.
-- 
2.35.1

