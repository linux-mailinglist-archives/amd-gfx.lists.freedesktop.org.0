Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F37B74F6
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Oct 2023 01:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DDC10E322;
	Tue,  3 Oct 2023 23:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF0810E322
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Oct 2023 23:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLx8eypy8zB++3nnGqf9c58noRshia4eX2VERq7Mh1M7b6M3mQdXs6V+ei84ngL0NViU6UdqneuE6q2fWlwZzP9wwPbVUalc1k96+Ik9x8bdz/NQe3BM4vpPi66EjoL74uCsZ4C4qyMTtsvLmmyQ6EYxOfDcxVHH5Tj/7iMzpsSYPCGV9vhkRWVzbkDeXpGqRlYEZY87pI19a+rRlYXrjcxos6d0yidGoD9l0EBkVqfhQqjyMBRPXMhmSI8iWjXImEXykNO8nkYV1I1YuPVT7n8D9flzp7oNoQsMHvS7VYMj/BDSvLBa9iXDiYETCwDFh/YgeF+kOBVmm9CcyBd/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kT4P/H4UCxL2/8dZukgzkTKwNzOf7S0tPH0fY98cpk=;
 b=mx8vA97enPHVNWQKqslQPi04jd2oFCiEiCnX/SfhGN95zmP6bI+fAOuLHv3lJPsn0M9SnVEdEVBj5EUWW9RKKGXLTv9jFFHmgC8BOPBy4Hh3dgqF0qnzQMr19kC2idY1zVOj8kN414SNKskKaFyav7VuVHZCmWgBklE4lOgvBl9rrvVnJ53OpESeOyA1vF7iNhCjlHRRecwb/WkACRF9POF87XHeZOVOO+Vr8TOzSUeUPFR8CIv0nl2PU4zdEQ4sXBqc28SqZ9jAISnPkiou/q37lgDmG4f/RWCdHbb5ydnOuQzcQWmbbQM1tlPX9PgwnlRJxnfVwBJe/EcU/4D2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kT4P/H4UCxL2/8dZukgzkTKwNzOf7S0tPH0fY98cpk=;
 b=Mo73Z0S+p6TQMgvLTXakI2uvHCUvKeQCmTUnMMCjDZOt5JQJMBN4cN9P97tkhxSJmZqskAstY1ojH8+LxT31j2h2BDA4fGtUUmeeAQlb5bZsGvRFaG3w86AQ0CVdK75g49SsceJKHN79wcZn18huPAvoLqMiNo2jYkJvPjsIC3E=
Received: from DM6PR11CA0067.namprd11.prod.outlook.com (2603:10b6:5:14c::44)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 23:31:20 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::58) by DM6PR11CA0067.outlook.office365.com
 (2603:10b6:5:14c::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Tue, 3 Oct 2023 23:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 23:31:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 18:31:19 -0500
Received: from Xiaogang-ROCM-Dev.attlocal.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 3 Oct 2023 18:31:14 -0500
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm/amdkfd: Use partial migrations in GPU page faults
Date: Tue, 3 Oct 2023 18:31:08 -0500
Message-ID: <20231003233108.16892-1-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: bf00e81c-1cf7-4adb-107b-08dbc468d93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3wPXq+FzN1WoOH271+qYzK7NZ4PVXcgnqN8IVgpWkWuNxWOfymDez7pgMgen1vEjuT1LnbOOpRfP7q+MpYoiG5JQPU9PUiIfFsnXM0xU5oBB261FdagVjFPWUhemE/mVZqjbZ/9MjSVrkYF+IFYBpBHleVv6xDurOTAhQvTP72+h6WWP8dhACDl5wdSKzxOHaODBpr1Snrbq5170rXQglFy+VJUAhM7h5mprh4I47nAKZ3b4tfaIvy2K/OBXHnhGLGYQJX3ueFU9q+H4YFdW7NKRZOIfguMeiNQVpZjCJDHiBfLnrMLqDIrFnt/3/gBaOZ3iCaeyHKQkDSinv4htK8D/SJwapl5vTtXG2JQDiPkVrcg4QV9J91sbbUOoe+G3LHlkbitiv9UqiK5jcC72MskScS2Awpmz/whYNgzKlk04psXETa2zMGDTs9YOMcysH1XhPVUA/94Z+lTidr8ET3Vk4ULlHysgfhpBMWI3ZnA0cQmva45kUsBjJlrqhc2buf8bchi0JHnFHKlQWbG76Jm8wgUI6dREBB2OKjwGZIvHlZKoC/h2e57l1BwjKTICxxKLqeNAopm3oe7vKWL375WbWqNOx2zZkMBDSaYYgCkqnWq4oNFk0DPrVn9YE62NwgExKgZ8OskyDSL9xMhp/A43dwePu2SJ/tLBIZj82N/2RlLnn8myRciP7vB9HfCkSWhuHJ+Rz5YkVvcgwQGh4Nt9zRJBQxDg2XagTx5udlMRA2ZP6ZbVBWFVACaIuablQJQfhK+59ls2ZqxgbeYNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(4326008)(30864003)(2906002)(5660300002)(8676002)(1076003)(36756003)(26005)(41300700001)(316002)(70206006)(6916009)(2616005)(40480700001)(54906003)(336012)(40460700003)(8936002)(478600001)(356005)(70586007)(6666004)(47076005)(426003)(82740400003)(86362001)(81166007)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 23:31:20.2379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf00e81c-1cf7-4adb-107b-08dbc468d93a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
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
Cc: Xiaogang Chen <Xiaogang.Chen@amd.com>, Philip.Yang@amd.com,
 felix.kuehling@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Xiaogang Chen <xiaogang.chen@amd.com>

This patch implements partial migration in gpu page fault according to migration
granularity(default 2MB) and not split svm range in cpu page fault handling.
A svm range may include pages from both system ram and vram of one gpu now.
These chagnes are expected to improve migration performance and reduce mmu
callback and TLB flush workloads.

Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 156 +++++++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  83 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   6 +-
 4 files changed, 162 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 6c25dab051d5..6a059e4aff86 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -442,10 +442,10 @@ svm_migrate_vma_to_vram(struct kfd_node *node, struct svm_range *prange,
 		goto out_free;
 	}
 	if (cpages != npages)
-		pr_debug("partial migration, 0x%lx/0x%llx pages migrated\n",
+		pr_debug("partial migration, 0x%lx/0x%llx pages collected\n",
 			 cpages, npages);
 	else
-		pr_debug("0x%lx pages migrated\n", cpages);
+		pr_debug("0x%lx pages collected\n", cpages);
 
 	r = svm_migrate_copy_to_vram(node, prange, &migrate, &mfence, scratch, ttm_res_offset);
 	migrate_vma_pages(&migrate);
@@ -479,6 +479,8 @@ svm_migrate_vma_to_vram(struct kfd_node *node, struct svm_range *prange,
  * svm_migrate_ram_to_vram - migrate svm range from system to device
  * @prange: range structure
  * @best_loc: the device to migrate to
+ * @start_mgr: start page to migrate
+ * @last_mgr: last page to migrate
  * @mm: the process mm structure
  * @trigger: reason of migration
  *
@@ -489,6 +491,7 @@ svm_migrate_vma_to_vram(struct kfd_node *node, struct svm_range *prange,
  */
 static int
 svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			unsigned long start_mgr, unsigned long last_mgr,
 			struct mm_struct *mm, uint32_t trigger)
 {
 	unsigned long addr, start, end;
@@ -498,23 +501,30 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	unsigned long cpages = 0;
 	long r = 0;
 
-	if (prange->actual_loc == best_loc) {
-		pr_debug("svms 0x%p [0x%lx 0x%lx] already on best_loc 0x%x\n",
-			 prange->svms, prange->start, prange->last, best_loc);
+	if (!best_loc) {
+		pr_debug("svms 0x%p [0x%lx 0x%lx] migrate to sys ram\n",
+			prange->svms, start_mgr, last_mgr);
 		return 0;
 	}
 
+	if (start_mgr < prange->start || last_mgr > prange->last) {
+		pr_debug("range [0x%lx 0x%lx] out prange [0x%lx 0x%lx]\n",
+				 start_mgr, last_mgr, prange->start, prange->last);
+		return -EFAULT;
+	}
+
 	node = svm_range_get_node_by_id(prange, best_loc);
 	if (!node) {
 		pr_debug("failed to get kfd node by id 0x%x\n", best_loc);
 		return -ENODEV;
 	}
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx] to gpu 0x%x\n", prange->svms,
-		 prange->start, prange->last, best_loc);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] in [0x%lx 0x%lx] to gpu 0x%x\n",
+		prange->svms, start_mgr, last_mgr, prange->start, prange->last,
+		best_loc);
 
-	start = prange->start << PAGE_SHIFT;
-	end = (prange->last + 1) << PAGE_SHIFT;
+	start = start_mgr << PAGE_SHIFT;
+	end = (last_mgr + 1) << PAGE_SHIFT;
 
 	r = svm_range_vram_node_new(node, prange, true);
 	if (r) {
@@ -544,8 +554,11 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 
 	if (cpages) {
 		prange->actual_loc = best_loc;
-		svm_range_dma_unmap(prange);
-	} else {
+		prange->vram_pages = prange->vram_pages + cpages;
+	} else if (!prange->actual_loc) {
+		/* if no page migrated and all pages from prange are at
+		 * sys ram drop svm_bo got from svm_range_vram_node_new
+		 */
 		svm_range_vram_node_free(prange);
 	}
 
@@ -663,19 +676,19 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
  * Context: Process context, caller hold mmap read lock, prange->migrate_mutex
  *
  * Return:
- *   0 - success with all pages migrated
  *   negative values - indicate error
- *   positive values - partial migration, number of pages not migrated
+ *   positive values or zero - number of pages got migrated
  */
 static long
 svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
-		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
-		       uint32_t trigger, struct page *fault_page)
+			struct vm_area_struct *vma, uint64_t start, uint64_t end,
+			uint32_t trigger, struct page *fault_page)
 {
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
 	unsigned long upages = npages;
 	unsigned long cpages = 0;
+	unsigned long mpages = 0;
 	struct amdgpu_device *adev = node->adev;
 	struct kfd_process_device *pdd;
 	struct dma_fence *mfence = NULL;
@@ -725,10 +738,10 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 		goto out_free;
 	}
 	if (cpages != npages)
-		pr_debug("partial migration, 0x%lx/0x%llx pages migrated\n",
+		pr_debug("partial migration, 0x%lx/0x%llx pages collected\n",
 			 cpages, npages);
 	else
-		pr_debug("0x%lx pages migrated\n", cpages);
+		pr_debug("0x%lx pages collected\n", cpages);
 
 	r = svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence,
 				    scratch, npages);
@@ -751,17 +764,21 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 	kvfree(buf);
 out:
 	if (!r && cpages) {
+		mpages = cpages - upages;
 		pdd = svm_range_get_pdd_by_node(prange, node);
 		if (pdd)
-			WRITE_ONCE(pdd->page_out, pdd->page_out + cpages);
+			WRITE_ONCE(pdd->page_out, pdd->page_out + mpages);
 	}
-	return r ? r : upages;
+
+	return r ? r : mpages;
 }
 
 /**
  * svm_migrate_vram_to_ram - migrate svm range from device to system
  * @prange: range structure
  * @mm: process mm, use current->mm if NULL
+ * @start_mgr: start page need be migrated to sys ram
+ * @last_mgr: last page need be migrated to sys ram
  * @trigger: reason of migration
  * @fault_page: is from vmf->page, svm_migrate_to_ram(), this is CPU page fault callback
  *
@@ -771,33 +788,41 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
  * 0 - OK, otherwise error code
  */
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger, struct page *fault_page)
+			unsigned long start_mgr, unsigned long last_mgr,
+			uint32_t trigger, struct page *fault_page)
 {
 	struct kfd_node *node;
 	struct vm_area_struct *vma;
 	unsigned long addr;
 	unsigned long start;
 	unsigned long end;
-	unsigned long upages = 0;
+	unsigned long mpages = 0;
 	long r = 0;
 
+	/* this pragne has no any vram page to migrate to sys ram */
 	if (!prange->actual_loc) {
 		pr_debug("[0x%lx 0x%lx] already migrated to ram\n",
 			 prange->start, prange->last);
 		return 0;
 	}
 
+	if (start_mgr < prange->start || last_mgr > prange->last) {
+		pr_debug("range [0x%lx 0x%lx] out prange [0x%lx 0x%lx]\n",
+				 start_mgr, last_mgr, prange->start, prange->last);
+		return -EFAULT;
+	}
+
 	node = svm_range_get_node_by_id(prange, prange->actual_loc);
 	if (!node) {
 		pr_debug("failed to get kfd node by id 0x%x\n", prange->actual_loc);
 		return -ENODEV;
 	}
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] from gpu 0x%x to ram\n",
-		 prange->svms, prange, prange->start, prange->last,
+		 prange->svms, prange, start_mgr, last_mgr,
 		 prange->actual_loc);
 
-	start = prange->start << PAGE_SHIFT;
-	end = (prange->last + 1) << PAGE_SHIFT;
+	start = start_mgr << PAGE_SHIFT;
+	end = (last_mgr + 1) << PAGE_SHIFT;
 
 	for (addr = start; addr < end;) {
 		unsigned long next;
@@ -816,14 +841,21 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			pr_debug("failed %ld to migrate prange %p\n", r, prange);
 			break;
 		} else {
-			upages += r;
+			mpages += r;
 		}
 		addr = next;
 	}
 
-	if (r >= 0 && !upages) {
-		svm_range_vram_node_free(prange);
-		prange->actual_loc = 0;
+	if (r >= 0) {
+		prange->vram_pages -= mpages;
+
+		/* prange does not have vram page set its actual_loc to system
+		 * and drop its svm_bo ref
+		 */
+		if (prange->vram_pages == 0 && prange->ttm_res) {
+			prange->actual_loc = 0;
+			svm_range_vram_node_free(prange);
+		}
 	}
 
 	return r < 0 ? r : 0;
@@ -833,17 +865,23 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
  * svm_migrate_vram_to_vram - migrate svm range from device to device
  * @prange: range structure
  * @best_loc: the device to migrate to
+ * @start: start page need be migrated to sys ram
+ * @last: last page need be migrated to sys ram
  * @mm: process mm, use current->mm if NULL
  * @trigger: reason of migration
  *
  * Context: Process context, caller hold mmap read lock, svms lock, prange lock
  *
+ * migrate all vram pages in prange to sys ram, then migrate
+ * [start, last] pages from sys ram to gpu node best_loc.
+ *
  * Return:
  * 0 - OK, otherwise error code
  */
 static int
 svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
-			 struct mm_struct *mm, uint32_t trigger)
+			unsigned long start, unsigned long last,
+			struct mm_struct *mm, uint32_t trigger)
 {
 	int r, retries = 3;
 
@@ -855,7 +893,8 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
 
 	do {
-		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
+		r = svm_migrate_vram_to_ram(prange, mm, prange->start, prange->last,
+								trigger, NULL);
 		if (r)
 			return r;
 	} while (prange->actual_loc && --retries);
@@ -863,17 +902,21 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	if (prange->actual_loc)
 		return -EDEADLK;
 
-	return svm_migrate_ram_to_vram(prange, best_loc, mm, trigger);
+	return svm_migrate_ram_to_vram(prange, best_loc, start, last, mm, trigger);
 }
 
 int
 svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
-		    struct mm_struct *mm, uint32_t trigger)
+			unsigned long start, unsigned long last,
+			struct mm_struct *mm, uint32_t trigger)
 {
-	if  (!prange->actual_loc)
-		return svm_migrate_ram_to_vram(prange, best_loc, mm, trigger);
+	if  (!prange->actual_loc || prange->actual_loc == best_loc)
+		return svm_migrate_ram_to_vram(prange, best_loc, start, last,
+						mm, trigger);
+
 	else
-		return svm_migrate_vram_to_vram(prange, best_loc, mm, trigger);
+		return svm_migrate_vram_to_vram(prange, best_loc, start, last,
+						mm, trigger);
 
 }
 
@@ -889,10 +932,9 @@ svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
  */
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
+	unsigned long start, last, size;
 	unsigned long addr = vmf->address;
 	struct svm_range_bo *svm_bo;
-	enum svm_work_list_ops op;
-	struct svm_range *parent;
 	struct svm_range *prange;
 	struct kfd_process *p;
 	struct mm_struct *mm;
@@ -929,51 +971,31 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 
 	mutex_lock(&p->svms.lock);
 
-	prange = svm_range_from_addr(&p->svms, addr, &parent);
+	prange = svm_range_from_addr(&p->svms, addr, NULL);
 	if (!prange) {
 		pr_debug("failed get range svms 0x%p addr 0x%lx\n", &p->svms, addr);
 		r = -EFAULT;
 		goto out_unlock_svms;
 	}
 
-	mutex_lock(&parent->migrate_mutex);
-	if (prange != parent)
-		mutex_lock_nested(&prange->migrate_mutex, 1);
+	mutex_lock(&prange->migrate_mutex);
 
 	if (!prange->actual_loc)
 		goto out_unlock_prange;
 
-	svm_range_lock(parent);
-	if (prange != parent)
-		mutex_lock_nested(&prange->lock, 1);
-	r = svm_range_split_by_granularity(p, mm, addr, parent, prange);
-	if (prange != parent)
-		mutex_unlock(&prange->lock);
-	svm_range_unlock(parent);
-	if (r) {
-		pr_debug("failed %d to split range by granularity\n", r);
-		goto out_unlock_prange;
-	}
+	/* Align migration range start and size to granularity size */
+	size = 1UL << prange->granularity;
+	start = max(ALIGN_DOWN(addr, size), prange->start);
+	last = min(ALIGN(addr + 1, size) - 1, prange->last);
 
-	r = svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm,
-				    KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
-				    vmf->page);
+	r = svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm, start, last,
+						KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU, vmf->page);
 	if (r)
 		pr_debug("failed %d migrate svms 0x%p range 0x%p [0x%lx 0x%lx]\n",
-			 r, prange->svms, prange, prange->start, prange->last);
-
-	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
-	if (p->xnack_enabled && parent == prange)
-		op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
-	else
-		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
-	svm_range_add_list_work(&p->svms, parent, mm, op);
-	schedule_deferred_list_work(&p->svms);
+			r, prange->svms, prange, start, last);
 
 out_unlock_prange:
-	if (prange != parent)
-		mutex_unlock(&prange->migrate_mutex);
-	mutex_unlock(&parent->migrate_mutex);
+	mutex_unlock(&prange->migrate_mutex);
 out_unlock_svms:
 	mutex_unlock(&p->svms.lock);
 out_unref_process:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 487f26368164..9e48d10e848e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -41,9 +41,13 @@ enum MIGRATION_COPY_DIR {
 };
 
 int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			unsigned long start, unsigned long last,
 			struct mm_struct *mm, uint32_t trigger);
+
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger, struct page *fault_page);
+			unsigned long start, unsigned long last,
+			uint32_t trigger, struct page *fault_page);
+
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 649f9685e1ec..5a15866b52ee 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -156,7 +156,7 @@ svm_is_valid_dma_mapping_addr(struct device *dev, dma_addr_t dma_addr)
 static int
 svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 		      unsigned long offset, unsigned long npages,
-		      unsigned long *hmm_pfns, uint32_t gpuidx)
+		      unsigned long *hmm_pfns, uint32_t gpuidx, uint64_t *vram_pages)
 {
 	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
 	dma_addr_t *addr = prange->dma_addr[gpuidx];
@@ -171,6 +171,7 @@ svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 		prange->dma_addr[gpuidx] = addr;
 	}
 
+	*vram_pages = 0;
 	addr += offset;
 	for (i = 0; i < npages; i++) {
 		if (svm_is_valid_dma_mapping_addr(dev, addr[i]))
@@ -180,6 +181,7 @@ svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 		if (is_zone_device_page(page)) {
 			struct amdgpu_device *bo_adev = prange->svm_bo->node->adev;
 
+			(*vram_pages)++;
 			addr[i] = (hmm_pfns[i] << PAGE_SHIFT) +
 				   bo_adev->vm_manager.vram_base_offset -
 				   bo_adev->kfd.pgmap.range.start;
@@ -202,7 +204,7 @@ svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 static int
 svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
 		  unsigned long offset, unsigned long npages,
-		  unsigned long *hmm_pfns)
+		  unsigned long *hmm_pfns, uint64_t *vram_pages)
 {
 	struct kfd_process *p;
 	uint32_t gpuidx;
@@ -221,7 +223,7 @@ svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
 		}
 
 		r = svm_range_dma_map_dev(pdd->dev->adev, prange, offset, npages,
-					  hmm_pfns, gpuidx);
+					  hmm_pfns, gpuidx, vram_pages);
 		if (r)
 			break;
 	}
@@ -347,6 +349,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
 	prange->validate_timestamp = 0;
+	prange->vram_pages = 0;
 	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 
@@ -393,6 +396,8 @@ static void svm_range_bo_release(struct kref *kref)
 			 prange->start, prange->last);
 		mutex_lock(&prange->lock);
 		prange->svm_bo = NULL;
+		/* prange should not hold vram page now */
+		WARN_ON(prange->actual_loc);
 		mutex_unlock(&prange->lock);
 
 		spin_lock(&svm_bo->list_lock);
@@ -973,6 +978,11 @@ svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
 	new->svm_bo = svm_range_bo_ref(old->svm_bo);
 	new->ttm_res = old->ttm_res;
 
+	/* set new's vram_pages as old range's now, the acurate vram_pages
+	 * will be updated during mapping
+	 */
+	new->vram_pages = min(old->vram_pages, new->npages);
+
 	spin_lock(&new->svm_bo->list_lock);
 	list_add(&new->svm_bo_list, &new->svm_bo->range_list);
 	spin_unlock(&new->svm_bo->list_lock);
@@ -1617,6 +1627,7 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	struct svm_validate_context *ctx;
 	unsigned long start, end, addr;
 	struct kfd_process *p;
+	uint64_t vram_pages;
 	void *owner;
 	int32_t idx;
 	int r = 0;
@@ -1685,11 +1696,13 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		}
 	}
 
+	vram_pages = 0;
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 	for (addr = start; !r && addr < end; ) {
 		struct hmm_range *hmm_range;
 		struct vm_area_struct *vma;
+		uint64_t vram_pages_vma;
 		unsigned long next = 0;
 		unsigned long offset;
 		unsigned long npages;
@@ -1718,9 +1731,11 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		if (!r) {
 			offset = (addr - start) >> PAGE_SHIFT;
 			r = svm_range_dma_map(prange, ctx->bitmap, offset, npages,
-					      hmm_range->hmm_pfns);
+					      hmm_range->hmm_pfns, &vram_pages_vma);
 			if (r)
 				pr_debug("failed %d to dma map range\n", r);
+			else
+				vram_pages += vram_pages_vma;
 		}
 
 		svm_range_lock(prange);
@@ -1746,6 +1761,19 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		addr = next;
 	}
 
+	if (addr == end) {
+		prange->vram_pages = vram_pages;
+
+		/* if prange does not include any vram page and it
+		 * has not released svm_bo drop its svm_bo reference
+		 * and set its actaul_loc to sys ram
+		 */
+		if (!vram_pages && prange->ttm_res) {
+			prange->actual_loc = 0;
+			svm_range_vram_node_free(prange);
+		}
+	}
+
 	svm_range_unreserve_bos(ctx);
 	if (!r)
 		prange->validate_timestamp = ktime_get_boottime();
@@ -1998,6 +2026,7 @@ static struct svm_range *svm_range_clone(struct svm_range *old)
 	new->actual_loc = old->actual_loc;
 	new->granularity = old->granularity;
 	new->mapped_to_gpu = old->mapped_to_gpu;
+	new->vram_pages = old->vram_pages;
 	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
 	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
 
@@ -2116,7 +2145,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 		next_start = min(node->last, last) + 1;
 
 		if (svm_range_is_same_attrs(p, prange, nattr, attrs) &&
-		    prange->mapped_to_gpu) {
+			prange->mapped_to_gpu) {
 			/* nothing to do */
 		} else if (node->start < start || node->last > last) {
 			/* node intersects the update range and its attributes
@@ -2906,6 +2935,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint32_t vmid, uint32_t node_id,
 			uint64_t addr, bool write_fault)
 {
+	unsigned long start, last, size;
 	struct mm_struct *mm = NULL;
 	struct svm_range_list *svms;
 	struct svm_range *prange;
@@ -3041,32 +3071,35 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	kfd_smi_event_page_fault_start(node, p->lead_thread->pid, addr,
 				       write_fault, timestamp);
 
-	if (prange->actual_loc != best_loc) {
+	if (prange->actual_loc != 0 || best_loc != 0) {
 		migration = true;
+		/* Align migration range start and size to granularity size */
+		size = 1UL << prange->granularity;
+		start = max_t(unsigned long, ALIGN_DOWN(addr, size), prange->start);
+		last = min_t(unsigned long, ALIGN(addr + 1, size) - 1, prange->last);
+
 		if (best_loc) {
-			r = svm_migrate_to_vram(prange, best_loc, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+			r = svm_migrate_to_vram(prange, best_loc, start, last,
+					mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
 			if (r) {
 				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
 					 r, addr);
 				/* Fallback to system memory if migration to
 				 * VRAM failed
 				 */
-				if (prange->actual_loc)
-					r = svm_migrate_vram_to_ram(prange, mm,
-					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
-					   NULL);
+				if (prange->actual_loc && prange->actual_loc != best_loc)
+					r = svm_migrate_vram_to_ram(prange, mm, start, last,
+						KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU, NULL);
 				else
 					r = 0;
 			}
 		} else {
-			r = svm_migrate_vram_to_ram(prange, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
-					NULL);
+			r = svm_migrate_vram_to_ram(prange, mm, start, last,
+					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU, NULL);
 		}
 		if (r) {
 			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
-				 r, svms, prange->start, prange->last);
+				r, svms, start, last);
 			goto out_unlock_range;
 		}
 	}
@@ -3420,18 +3453,24 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	*migrated = false;
 	best_loc = svm_range_best_prefetch_location(prange);
 
-	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
-	    best_loc == prange->actual_loc)
+	/* when best_loc is a gpu node and same as prange->actual_loc
+	 * we still need do migration as prange->actual_loc !=0 does
+	 * not mean all pages in prange are vram. hmm migrate will pick
+	 * up right pages during migration.
+	 */
+	if ((best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED) ||
+		(best_loc == 0 && prange->actual_loc == 0))
 		return 0;
 
 	if (!best_loc) {
-		r = svm_migrate_vram_to_ram(prange, mm,
+		r = svm_migrate_vram_to_ram(prange, mm, prange->start, prange->last,
 					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
 		*migrated = !r;
 		return r;
 	}
 
-	r = svm_migrate_to_vram(prange, best_loc, mm, KFD_MIGRATE_TRIGGER_PREFETCH);
+	r = svm_migrate_to_vram(prange, best_loc, prange->start, prange->last,
+					mm, KFD_MIGRATE_TRIGGER_PREFETCH);
 	*migrated = !r;
 
 	return r;
@@ -3486,7 +3525,11 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 
 		mutex_lock(&prange->migrate_mutex);
 		do {
+			/* migrate all vram pages in this prange to sys ram
+			 * after that prange->actual_loc should be zero
+			 */
 			r = svm_migrate_vram_to_ram(prange, mm,
+					prange->start, prange->last,
 					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
 		} while (!r && prange->actual_loc && --retries);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c528df1d0ba2..be11ba0c4289 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -78,6 +78,7 @@ struct svm_work_list_item {
  * @update_list:link list node used to add to update_list
  * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
+ * @vram_pages: vram pages number in this svm_range
  * @dma_addr:   dma mapping address on each GPU for system memory physical page
  * @ttm_res:    vram ttm resource map
  * @offset:     range start offset within mm_nodes
@@ -88,7 +89,9 @@ struct svm_work_list_item {
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
- * @actual_loc: the actual location, 0 for CPU, or GPU id
+ * @actual_loc: this svm_range location. 0: all pages are from sys ram;
+ *              GPU id: this svm_range may include vram pages from GPU with
+ *              id actual_loc.
  * @granularity:migration granularity, log2 num pages
  * @invalid:    not 0 means cpu page table is invalidated
  * @validate_timestamp: system timestamp when range is validated
@@ -112,6 +115,7 @@ struct svm_range {
 	struct list_head		list;
 	struct list_head		update_list;
 	uint64_t			npages;
+	uint64_t			vram_pages;
 	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
 	struct ttm_resource		*ttm_res;
 	uint64_t			offset;
-- 
2.25.1

