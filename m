Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8755BCA9
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Jun 2022 02:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1337B10E73B;
	Tue, 28 Jun 2022 00:15:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE77D10E678;
 Tue, 28 Jun 2022 00:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ7AUd+pomg3AiK+kaqmUtYwnIa6GPASja38ru6Ljx88y7w8zJ1xZ90B1Ye6CaNJhSQaQFFktJ3d4ogAudxFku2qbFF3z5FnQJ09LA+KXp73qWrmfKImSW43LASk4V5Ec1+y5/j7Dab9IbOCIt5HAbpO11cGv3eMLVyZKqk2WCoqiiahKfFKLz7IYSFl+WAgcoXIb5/2CqxmrRUAoxKjah0fCb2bWNUzrdK5TWuNO1RCep8EQOk+jLTIMVSfCF+DqSqog6NsN8zyuNGpigVsDjVBkbhlbWMDXWHmpqyGamLQGrE4sc0pqCVjR8W5ewcuEvWFaJpBs/7GJzXZZhXwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXHkTMDP9sqYKzMO3NOS8Ic3UgCNCptiqPNyD5wLuTo=;
 b=aGZKQHURNgNd8EIZd9vYFIWY0CGuswkUfWP4/7zu6JlceV8hYN6u/Ub1z2iYwIWaX08QjbhhFYlFP93u/dPdIxrREDLNVqeb1CTWdVd5YwZnBBhhhJ+JomlycYPTuk8r2wHQ2wfACcVC2DGKpckLwSw56Pa9ksTepi9MZNCV+Oz99TPGlKO3YtKW1fBVHlKbzvmN2pMOu+RJj7agJVuIBvmvFg8xq7p0Y5DHRq5hYHW52hmPghPiCbtY+WoBVbuIQSlIqip7time0ZaUYuR9vS9repWdOfTj8sUqUlG2y6293TUCr1djf+yT8921gvJ2uC3O9Et75gGghBMorAAe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXHkTMDP9sqYKzMO3NOS8Ic3UgCNCptiqPNyD5wLuTo=;
 b=oza9lRiRi03V8idNYWrho+8ZCxM7LYk5l1JR2pc2Pv8YCM1hM5VIL5W0fIUaFdaqZF8JThma47rD5nW8GghZrYUe6JuCNh3S7kAMRoB9GHre5vj5OQXQlFmkcStnQnYXs2wN7bHu2kN2fSuV3PUFLe5PSUT5rP3kVJXRA/w1ATA=
Received: from MWHPR15CA0061.namprd15.prod.outlook.com (2603:10b6:301:4c::23)
 by DM5PR12MB1738.namprd12.prod.outlook.com (2603:10b6:3:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 00:15:27 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::26) by MWHPR15CA0061.outlook.office365.com
 (2603:10b6:301:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:27 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:26 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 10/14] lib: add support for device coherent type in test_hmm
Date: Mon, 27 Jun 2022 19:14:50 -0500
Message-ID: <20220628001454.3503-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8bf622d-aaf2-4a51-e7f0-08da589b4deb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1738:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+3eRX3PAmHEUMmSy9ZIpmCfI4vYK96gvm5KzggTRaMhODmc4yNonpez5CgprkvDLqG6ke9pbRShvU/5LwE0cjsiDfAsoSCa+AcHhaUVYZnnZGvIYBxk17IueQ5llhPCvzlqLwqJw+qxUiF9IB4T4Ji5nWm2PXRfN+XU0IZ5xwfaxu/fp89e4c2o5RLzrrhq3Rp/4W3pzlRGUN4WPKowZ4oDpfl90Wv0PcTFxpOxPimXVjfB8+Yk5PfwwlyzojK8BqwlFAm9IgN+A9R7g8tOhYWF0LhYT3G7AdPIrmz6iPb7oltCejxEyWtwqvSlZsuxXkn0eSl/sTkd7fdAVbaJ4Y4BH7bHKfMBYLfMfWsrctzYDx0iT5tqAFK6Iky+mUIQt29obiuGZibPK2C3S0GKWMIWkLttWnnfvFvb6Jls7/UxnGtv79V2aVOTBOx2PBjNw20u5oOREXHEJiTKcWj7vzQzxRvJGizah+c3ZXMeZ2RuGc8UH0jpWT4rUTEH1CTpRp1cbPb5VGMlgFSh6yW8JfhHIkneFxFKwFfA4V0gMrpXeRnsxr4Er+5+RTIpB6vP322jDl8DHnpC0kvXdLc6JGEttn7rsLQhwFy1UIESPsI2Q2DGvkI1lNpCDS6AflMsVh+H0a4CXC/gnc0usW1ZRqYgXh0QXr9EuchN92l/DUvQZy33r6tQmkaOFW47kWUN8sboFWU41NzjUlZ8/T3r9WcIfVYnym5nA2phm765h5VNa8oMjLTqs9NglaRXyjVi5xn+IDSskXbxGOt6a10Fqj2Pb3P1eI9aWAT6IxLzt6zg4L5PhNVbRS0k10yO3asG7CA08iXDSs+ra2WHLR5ZiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(2616005)(4326008)(70586007)(6916009)(8676002)(70206006)(86362001)(316002)(8936002)(40480700001)(44832011)(7696005)(26005)(81166007)(41300700001)(54906003)(6666004)(40460700003)(82740400003)(82310400005)(16526019)(30864003)(83380400001)(186003)(2906002)(47076005)(1076003)(336012)(426003)(36860700001)(478600001)(5660300002)(7416002)(36756003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:27.4952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bf622d-aaf2-4a51-e7f0-08da589b4deb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1738
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Device Coherent type uses device memory that is coherently accesible by
the CPU. This could be shown as SP (special purpose) memory range
at the BIOS-e820 memory enumeration. If no SP memory is supported in
system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.

Currently, test_hmm only supports two different SP ranges of at least
256MB size. This could be specified in the kernel parameter variable
efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
0x140000000 physical address. Ex.
efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000

Private and coherent device mirror instances can be created in the same
probed. This is done by passing the module parameters spm_addr_dev0 &
spm_addr_dev1. In this case, it will create four instances of
device_mirror. The first two correspond to private device type, the
last two to coherent type. Then, they can be easily accessed from user
space through /dev/hmm_mirror<num_device>. Usually num_device 0 and 1
are for private, and 2 and 3 for coherent types. If no module
parameters are passed, two instances of private type device_mirror will
be created only.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
 lib/test_hmm.c      | 253 +++++++++++++++++++++++++++++++++-----------
 lib/test_hmm_uapi.h |   4 +
 2 files changed, 196 insertions(+), 61 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index afb30af9f3ff..7930853e7fc5 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -32,11 +32,22 @@
 
 #include "test_hmm_uapi.h"
 
-#define DMIRROR_NDEVICES		2
+#define DMIRROR_NDEVICES		4
 #define DMIRROR_RANGE_FAULT_TIMEOUT	1000
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
 
+/*
+ * For device_private pages, dpage is just a dummy struct page
+ * representing a piece of device memory. dmirror_devmem_alloc_page
+ * allocates a real system memory page as backing storage to fake a
+ * real device. zone_device_data points to that backing page. But
+ * for device_coherent memory, the struct page represents real
+ * physical CPU-accessible memory that we can use directly.
+ */
+#define BACKING_PAGE(page) (is_device_private_page((page)) ? \
+			   (page)->zone_device_data : (page))
+
 static unsigned long spm_addr_dev0;
 module_param(spm_addr_dev0, long, 0644);
 MODULE_PARM_DESC(spm_addr_dev0,
@@ -125,6 +136,21 @@ static int dmirror_bounce_init(struct dmirror_bounce *bounce,
 	return 0;
 }
 
+static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
+{
+	return (mdevice->zone_device_type ==
+		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ? true : false;
+}
+
+static enum migrate_vma_direction
+dmirror_select_device(struct dmirror *dmirror)
+{
+	return (dmirror->mdevice->zone_device_type ==
+		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
+		MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+}
+
 static void dmirror_bounce_fini(struct dmirror_bounce *bounce)
 {
 	vfree(bounce->ptr);
@@ -575,16 +601,19 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 {
 	struct page *dpage = NULL;
-	struct page *rpage;
+	struct page *rpage = NULL;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we allocate
+	 * real system memory to store our device memory.
+	 * For ZONE_DEVICE coherent type we use the actual dpage to store the
+	 * data and ignore rpage.
 	 */
-	rpage = alloc_page(GFP_HIGHUSER);
-	if (!rpage)
-		return NULL;
-
+	if (dmirror_is_private_zone(mdevice)) {
+		rpage = alloc_page(GFP_HIGHUSER);
+		if (!rpage)
+			return NULL;
+	}
 	spin_lock(&mdevice->lock);
 
 	if (mdevice->free_pages) {
@@ -603,7 +632,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	return dpage;
 
 error:
-	__free_page(rpage);
+	if (rpage)
+		__free_page(rpage);
 	return NULL;
 }
 
@@ -629,12 +659,16 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * unallocated pte_none() or read-only zero page.
 		 */
 		spage = migrate_pfn_to_page(*src);
+		if (WARN(spage && is_zone_device_page(spage),
+		     "page already in device spage pfn: 0x%lx\n",
+		     page_to_pfn(spage)))
+			continue;
 
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
 			continue;
 
-		rpage = dpage->zone_device_data;
+		rpage = BACKING_PAGE(dpage);
 		if (spage)
 			copy_highpage(rpage, spage);
 		else
@@ -648,6 +682,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if ((*src & MIGRATE_PFN_WRITE) ||
 		    (!spage && args->vma->vm_flags & VM_WRITE))
@@ -725,11 +761,7 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
-		 */
-		entry = dpage->zone_device_data;
+		entry = BACKING_PAGE(dpage);
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -809,15 +841,126 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 	return ret;
 }
 
-static int dmirror_migrate(struct dmirror *dmirror,
-			   struct hmm_dmirror_cmd *cmd)
+static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
+						      struct dmirror *dmirror)
+{
+	const unsigned long *src = args->src;
+	unsigned long *dst = args->dst;
+	unsigned long start = args->start;
+	unsigned long end = args->end;
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE,
+				       src++, dst++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(*src);
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		if (WARN_ON(!is_device_private_page(spage) &&
+			    !is_device_coherent_page(spage)))
+			continue;
+		spage = BACKING_PAGE(spage);
+		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+		if (!dpage)
+			continue;
+		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
+
+		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+		copy_highpage(dpage, spage);
+		*dst = migrate_pfn(page_to_pfn(dpage));
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+static unsigned long
+dmirror_successful_migrated_pages(struct migrate_vma *migrate)
+{
+	unsigned long cpages = 0;
+	unsigned long i;
+
+	for (i = 0; i < migrate->npages; i++) {
+		if (migrate->src[i] & MIGRATE_PFN_VALID &&
+		    migrate->src[i] & MIGRATE_PFN_MIGRATE)
+			cpages++;
+	}
+	return cpages;
+}
+
+static int dmirror_migrate_to_system(struct dmirror *dmirror,
+				     struct hmm_dmirror_cmd *cmd)
 {
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64];
-	unsigned long dst_pfns[64];
+	unsigned long src_pfns[64] = { 0 };
+	unsigned long dst_pfns[64] = { 0 };
+	struct migrate_vma args;
+	unsigned long next;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return -EINVAL;
+
+	cmd->cpages = 0;
+	mmap_read_lock(mm);
+	for (addr = start; addr < end; addr = next) {
+		vma = vma_lookup(mm, addr);
+		if (!vma || !(vma->vm_flags & VM_READ)) {
+			ret = -EINVAL;
+			goto out;
+		}
+		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		if (next > vma->vm_end)
+			next = vma->vm_end;
+
+		args.vma = vma;
+		args.src = src_pfns;
+		args.dst = dst_pfns;
+		args.start = addr;
+		args.end = next;
+		args.pgmap_owner = dmirror->mdevice;
+		args.flags = dmirror_select_device(dmirror);
+
+		ret = migrate_vma_setup(&args);
+		if (ret)
+			goto out;
+
+		pr_debug("Migrating from device mem to sys mem\n");
+		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
+
+		migrate_vma_pages(&args);
+		cmd->cpages += dmirror_successful_migrated_pages(&args);
+		migrate_vma_finalize(&args);
+	}
+out:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return ret;
+}
+
+static int dmirror_migrate_to_device(struct dmirror *dmirror,
+				struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct vm_area_struct *vma;
+	unsigned long src_pfns[64] = { 0 };
+	unsigned long dst_pfns[64] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args;
 	unsigned long next;
@@ -854,6 +997,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (ret)
 			goto out;
 
+		pr_debug("Migrating from sys mem to device mem\n");
 		dmirror_migrate_alloc_and_copy(&args, dmirror);
 		migrate_vma_pages(&args);
 		dmirror_migrate_finalize_and_map(&args, dmirror);
@@ -862,7 +1006,10 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
+	/*
+	 * Return the migrated data for verification.
+	 * Only for pages in device zone
+	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
 		return ret;
@@ -905,6 +1052,12 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
+	} else if (is_device_coherent_page(page)) {
+		/* Is the page migrated to this device or some other? */
+		if (dmirror->mdevice == dmirror_page_to_device(page))
+			*perm = HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL;
+		else
+			*perm = HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE;
 	} else if (is_zero_pfn(page_to_pfn(page)))
 		*perm = HMM_DMIRROR_PROT_ZERO;
 	else
@@ -1092,8 +1245,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_write(dmirror, &cmd);
 		break;
 
-	case HMM_DMIRROR_MIGRATE:
-		ret = dmirror_migrate(dmirror, &cmd);
+	case HMM_DMIRROR_MIGRATE_TO_DEV:
+		ret = dmirror_migrate_to_device(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_MIGRATE_TO_SYS:
+		ret = dmirror_migrate_to_system(dmirror, &cmd);
 		break;
 
 	case HMM_DMIRROR_EXCLUSIVE:
@@ -1155,14 +1312,13 @@ static const struct file_operations dmirror_fops = {
 
 static void dmirror_devmem_free(struct page *page)
 {
-	struct page *rpage = page->zone_device_data;
+	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
 
-	if (rpage)
+	if (rpage != page)
 		__free_page(rpage);
 
 	mdevice = dmirror_page_to_device(page);
-
 	spin_lock(&mdevice->lock);
 	mdevice->cfree++;
 	page->zone_device_data = mdevice->free_pages;
@@ -1170,43 +1326,11 @@ static void dmirror_devmem_free(struct page *page)
 	spin_unlock(&mdevice->lock);
 }
 
-static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
-						      struct dmirror *dmirror)
-{
-	const unsigned long *src = args->src;
-	unsigned long *dst = args->dst;
-	unsigned long start = args->start;
-	unsigned long end = args->end;
-	unsigned long addr;
-
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
-		struct page *dpage, *spage;
-
-		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
-		spage = spage->zone_device_data;
-
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-	}
-	return 0;
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
-	unsigned long src_pfns;
-	unsigned long dst_pfns;
+	unsigned long src_pfns = 0;
+	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
 	vm_fault_t ret;
@@ -1226,7 +1350,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
-	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	args.flags = dmirror_select_device(dmirror);
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
@@ -1305,6 +1429,12 @@ static int __init hmm_dmirror_init(void)
 				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
 	dmirror_devices[ndevices++].zone_device_type =
 				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	if (spm_addr_dev0 && spm_addr_dev1) {
+		dmirror_devices[ndevices++].zone_device_type =
+					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
+		dmirror_devices[ndevices++].zone_device_type =
+					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
+	}
 	for (id = 0; id < ndevices; id++) {
 		ret = dmirror_device_init(dmirror_devices + id, id);
 		if (ret)
@@ -1327,7 +1457,8 @@ static void __exit hmm_dmirror_exit(void)
 	int id;
 
 	for (id = 0; id < DMIRROR_NDEVICES; id++)
-		dmirror_device_remove(dmirror_devices + id);
+		if (dmirror_devices[id].zone_device_type)
+			dmirror_device_remove(dmirror_devices + id);
 	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
 }
 
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f700da7807c1..e31d58c9034a 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -50,6 +50,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
+ *				  the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -61,6 +63,8 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL	= 0x40,
+	HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE	= 0x50,
 };
 
 enum {
-- 
2.32.0

