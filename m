Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4B79A87C
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Sep 2023 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070DF10E2F9;
	Mon, 11 Sep 2023 14:04:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AC110E305
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Sep 2023 14:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0pPrjJAO+s2LzNhxYR8XAIjjbOW3wtmdhzQ0+T51vSJeI1ogaaAXQnSe7uc1wNOCk15qt+J9ChIi5C7v2ojnBhJAjuWEMNEPrD9BOCiTXD+UMaMNa6YCzospnbdmVYEQdmMXrGg/mz9Pv2cVKfsw9YYWLUf5ZNgldh3jNKfKSZ8xF9xEUS822J7QbxVe909qB9kMGmzAGtEnFFIAeuz576yY5bnSNT1LPHsfo9CvgowKDUoK5NhH8XeYiMuyXU9ZgY7zMLbgjozVPbjm7pPC4nVZe7gKtmulvd12t9DWyUSaurf887BG3x5wR7NHoHE7PaUVc6nYNJ84jtpWwQk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXK22YYlK+AIaHelbYh2td5MEcHa8zZf2skmzuD7UxQ=;
 b=OiBTub1Nv0MIVr4d1/Bj/81+RkITwrprrhDaWLnqE9nXUrNFPiZqlrVUp6x89U0MiBLbxhnYoflSxwOIVIedGUJ14Cb9fFYFfsWCqyqNSVGWs5RPXll0zPAnYzDtqNFl4gjSQt2xuGjdNH5lg7hBLUqVepQmxHSvrp2cZVnQ6HTpP3QeMWznjPHbAC5JZf/0YaELAnKiwCs8Jk8gDBRDKYt+u9XHcLYiK/6X6kktYBhbXwlvmVvqysSIU6CeaNHiOX2SCEsCS+U5TwOl+zrOQ5/eGmNdUFdr5iUwy3itFyafVhPJIZpVB83lSTjwp6fNZ/QdraI+ccbKPwQkbnU34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXK22YYlK+AIaHelbYh2td5MEcHa8zZf2skmzuD7UxQ=;
 b=go0p82V5GmSatXejnQmvId1CBfY/0uBQVBbsm1HU5bMi76QPtphLhKKZ/fnKuutBwL4KwM/Xm7ldoTNr4EgzBleI33J2k8z/BqKP1IB2tM+kSoxh/rtUyLHwNpyVX7RIs72CGNmDm9PPwTU6R/FQ193P9Gun7x4HySmSUc9ZRqE=
Received: from DM5PR07CA0085.namprd07.prod.outlook.com (2603:10b6:4:ae::14) by
 DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Mon, 11 Sep 2023 14:04:27 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::dc) by DM5PR07CA0085.outlook.office365.com
 (2603:10b6:4:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 14:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 14:04:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 09:04:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 07:04:26 -0700
Received: from Xiaogang-ROCM-Dev.attlocal.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 11 Sep 2023 09:04:26 -0500
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdkfd: Use partial migrations in GPU page faults
Date: Mon, 11 Sep 2023 09:04:30 -0500
Message-ID: <20230911140430.106717-1-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f130bb-d15a-4767-71c9-08dbb2d002f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOnt1r1mvBE6r364IBDWgkWiWMmlGatgIqbUc8UNQtFxatXAEF7WqgPPT6XMThmNa6KoyAHti+/ObMKBWEdhd1PhfT+fOLwrokBbNL9DY44X0N5TC825O7DTu7+K2xortWIhUoQt8p9pBOti3muxINqcjiLVjdIHBLz4BhCUAC9A9wZx41WXHK0RBxd/0Hqn8U3fCeoM7k0JmAYBamao5uJWkNC2v6PVW5GmjmcyvtefSQ73sSqj/7fRH/wIWCSwJEQgY6EoaWgKybOQdXifprqPWNza3b3dP6PBzwNA4sk42m6Mr2ozUxVXI7drI9ZOWNvxXaUf+WKoX9inT0Cb9SVV5JosViXoRP9d4BNFU1/rulh7a8NAbJ/WvPYGLdy8JP+RzRH21D2tqD2UXjSPANEWB8NpL9zNwKCBa3CJny2JtMbm9sFtsR9RU35WR7P44tRIVYdjZ14yh2hKJ0USzvD6HpIh8EiaOVnXFzMu/08eGB8XEzjUPmJ1ptimAnxWmCEsavbNIe6ywjls1R34WquATx78p2n9STNDi/klyLKtM9s6LmgOEHRCMRyOQ0lWRpjThpXaE+uJw+5++7XXr3ijPowv8fbvugBiwnhOywZv6tk7Pb/4xAYpbPKRFin4IWcIXWw7IHefO1+H9xGp4vWWD6mZQXVYsc/WsCUnTmTC2fxACP8ScO/NKKY8EcHPDe710cvZx4J7G9jqjnMtj2rj2j+9c/omHKztbqoRIpj2HzZGvZzqPpQ7AT2I1xAW3tF8hloa90IOL5MAr5s/7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(70206006)(81166007)(356005)(6666004)(86362001)(36756003)(82740400003)(36860700001)(47076005)(40460700003)(40480700001)(2616005)(426003)(26005)(30864003)(2906002)(336012)(41300700001)(83380400001)(478600001)(70586007)(4326008)(8936002)(8676002)(5660300002)(54906003)(1076003)(316002)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:04:27.4529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f130bb-d15a-4767-71c9-08dbb2d002f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286
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
Cc: Xiaogang Chen <xiaogang.chen@amd.com>, Philip.Yang@amd.com,
 felix.kuehling@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Xiaogang Chen <xiaogang.chen@amd.com>

This patch implements partial migration in gpu page fault according to migration
granularity(default 2MB) and not split svm range in cpu page fault handling.
A svm range may include pages from both system ram and vram of one gpu now.
These chagnes are expected to improve migration performance and reduce
mmu callback and TLB flush workloads.

Signed-off-by: xiaogang chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 151 ++++++++++++++---------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  88 ++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   7 +-
 4 files changed, 171 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7d82c7da223a..653a2edbaba4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -445,7 +445,7 @@ svm_migrate_vma_to_vram(struct kfd_node *node, struct svm_range *prange,
 		pr_debug("partial migration, 0x%lx/0x%llx pages migrated\n",
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
+		pr_debug("request svms 0x%p [0x%lx 0x%lx] migrate to sys ram\n",
+			 prange->svms, start_mgr, last_mgr);
 		return 0;
 	}
 
+	if (start_mgr < prange->start || last_mgr > prange->last) {
+		pr_debug("migration range [0x%lx 0x%lx] out prange [0x%lx 0x%lx]\n",
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
+			 prange->svms, start_mgr, last_mgr, prange->start, prange->last,
+			 best_loc);
 
-	start = prange->start << PAGE_SHIFT;
-	end = (prange->last + 1) << PAGE_SHIFT;
+	start = start_mgr << PAGE_SHIFT;
+	end = (last_mgr + 1) << PAGE_SHIFT;
 
 	r = svm_range_vram_node_new(node, prange, true);
 	if (r) {
@@ -544,8 +554,11 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 
 	if (cpages) {
 		prange->actual_loc = best_loc;
-		svm_range_free_dma_mappings(prange, true);
-	} else {
+		prange->vram_pages = prange->vram_pages + cpages;
+	} else if (!prange->actual_loc) {
+		/* if no page migrated and all pages from prange are at
+		 * sys ram drop svm_bo got from svm_range_vram_node_new
+		 */
 		svm_range_vram_node_free(prange);
 	}
 
@@ -670,7 +683,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 static long
 svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
-		       uint32_t trigger, struct page *fault_page)
+		       uint32_t trigger, struct page *fault_page, unsigned long *mpages)
 {
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
@@ -684,6 +697,7 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 	void *buf;
 	int r = -ENOMEM;
 
+	*mpages = 0;
 	memset(&migrate, 0, sizeof(migrate));
 	migrate.vma = vma;
 	migrate.start = start;
@@ -728,7 +742,7 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 		pr_debug("partial migration, 0x%lx/0x%llx pages migrated\n",
 			 cpages, npages);
 	else
-		pr_debug("0x%lx pages migrated\n", cpages);
+		pr_debug("0x%lx pages collected\n", cpages);
 
 	r = svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence,
 				    scratch, npages);
@@ -751,10 +765,12 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
 	kvfree(buf);
 out:
 	if (!r && cpages) {
+		*mpages = cpages - upages;
 		pdd = svm_range_get_pdd_by_node(prange, node);
 		if (pdd)
-			WRITE_ONCE(pdd->page_out, pdd->page_out + cpages);
+			WRITE_ONCE(pdd->page_out, pdd->page_out + *mpages);
 	}
+
 	return r ? r : upages;
 }
 
@@ -762,6 +778,8 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
  * svm_migrate_vram_to_ram - migrate svm range from device to system
  * @prange: range structure
  * @mm: process mm, use current->mm if NULL
+ * @start_mgr: start page need be migrated to sys ram
+ * @last_mgr: last page need be migrated to sys ram
  * @trigger: reason of migration
  * @fault_page: is from vmf->page, svm_migrate_to_ram(), this is CPU page fault callback
  *
@@ -771,7 +789,8 @@ svm_migrate_vma_to_ram(struct kfd_node *node, struct svm_range *prange,
  * 0 - OK, otherwise error code
  */
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger, struct page *fault_page)
+					unsigned long start_mgr, unsigned long last_mgr,
+					uint32_t trigger, struct page *fault_page)
 {
 	struct kfd_node *node;
 	struct vm_area_struct *vma;
@@ -779,28 +798,37 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 	unsigned long start;
 	unsigned long end;
 	unsigned long upages = 0;
+	unsigned long mpages = 0;
 	long r = 0;
 
+	/* this pragne has no any vram page to migrate to sys ram */
 	if (!prange->actual_loc) {
 		pr_debug("[0x%lx 0x%lx] already migrated to ram\n",
 			 prange->start, prange->last);
 		return 0;
 	}
 
+	if (start_mgr < prange->start || last_mgr > prange->last) {
+		pr_debug("migration range [0x%lx 0x%lx] out prange [0x%lx 0x%lx]\n",
+			 start_mgr, last_mgr, prange->start, prange->last);
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
+		unsigned long mpages_vma;
 
 		vma = vma_lookup(mm, addr);
 		if (!vma) {
@@ -811,19 +839,29 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 
 		next = min(vma->vm_end, end);
 		r = svm_migrate_vma_to_ram(node, prange, vma, addr, next, trigger,
-			fault_page);
+			fault_page, &mpages_vma);
 		if (r < 0) {
 			pr_debug("failed %ld to migrate prange %p\n", r, prange);
 			break;
 		} else {
 			upages += r;
+			mpages = mpages + mpages_vma;
 		}
 		addr = next;
 	}
 
-	if (r >= 0 && !upages) {
-		svm_range_vram_node_free(prange);
-		prange->actual_loc = 0;
+	if (r >= 0) {
+		prange->vram_pages = prange->vram_pages - mpages;
+
+		/* prange dos not have vram page drop its svm_bo ref */
+		if (prange->vram_pages == 0 && prange->ttm_res) {
+
+			svm_range_vram_node_free(prange);
+			mutex_lock(&prange->lock);
+			prange->svm_bo = NULL;
+			prange->actual_loc = 0;
+			mutex_unlock(&prange->lock);
+		}
 	}
 
 	return r < 0 ? r : 0;
@@ -833,17 +871,23 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
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
+ * migrate all vram pages in prange to sys ram, then migrate [start, last] pages
+ * from sys ram to gpu node best_loc.
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
 
@@ -855,7 +899,8 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
 
 	do {
-		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
+		r = svm_migrate_vram_to_ram(prange, mm, prange->start, prange->last,
+					trigger, NULL);
 		if (r)
 			return r;
 	} while (prange->actual_loc && --retries);
@@ -863,18 +908,20 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	if (prange->actual_loc)
 		return -EDEADLK;
 
-	return svm_migrate_ram_to_vram(prange, best_loc, mm, trigger);
+	return svm_migrate_ram_to_vram(prange, best_loc, start, last, mm, trigger);
 }
 
 int
 svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
-		    struct mm_struct *mm, uint32_t trigger)
+		unsigned long start, unsigned long last,
+		struct mm_struct *mm, uint32_t trigger)
 {
-	if  (!prange->actual_loc)
-		return svm_migrate_ram_to_vram(prange, best_loc, mm, trigger);
+	if  (!prange->actual_loc || prange->actual_loc == best_loc)
+		return svm_migrate_ram_to_vram(prange, best_loc, start, last,
+					mm, trigger);
 	else
-		return svm_migrate_vram_to_vram(prange, best_loc, mm, trigger);
-
+		return svm_migrate_vram_to_vram(prange, best_loc, start, last,
+					mm, trigger);
 }
 
 /**
@@ -889,10 +936,9 @@ svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
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
@@ -929,51 +975,34 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 
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
+	start = ALIGN_DOWN(addr, size);
+	last = ALIGN(addr + 1, size) - 1;
+
+	start = (start >= prange->start) ? start : prange->start;
+	last = (last <= prange->last) ? last : prange->last;
 
-	r = svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm,
-				    KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
-				    vmf->page);
+	r = svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm, start, last,
+				KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU, vmf->page);
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
+			 r, prange->svms, prange, start, last);
 
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
index 841ba6102bbb..8243fbccdf2d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -270,8 +270,6 @@ void svm_range_free_dma_mappings(struct svm_range *prange, bool unmap_dma)
 		dev = &pdd->dev->adev->pdev->dev;
 		if (unmap_dma)
 			svm_range_dma_unmap(dev, dma_addr, 0, prange->npages);
-		kvfree(dma_addr);
-		prange->dma_addr[gpuidx] = NULL;
 	}
 }
 
@@ -279,6 +277,7 @@ static void svm_range_free(struct svm_range *prange, bool do_unmap)
 {
 	uint64_t size = (prange->last - prange->start + 1) << PAGE_SHIFT;
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
+	uint32_t gpuidx;
 
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
@@ -286,6 +285,14 @@ static void svm_range_free(struct svm_range *prange, bool do_unmap)
 	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange, do_unmap);
 
+	/* free dma_addr array for each gpu */
+	for (gpuidx = 0; gpuidx < MAX_GPU_INSTANCE; gpuidx++) {
+		if (prange->dma_addr[gpuidx]) {
+			kvfree(prange->dma_addr[gpuidx]);
+			prange->dma_addr[gpuidx] = NULL;
+		}
+	}
+
 	if (do_unmap && !p->xnack_enabled) {
 		pr_debug("unreserve prange 0x%p size: 0x%llx\n", prange, size);
 		amdgpu_amdkfd_unreserve_mem_limit(NULL, size,
@@ -338,6 +345,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
 	prange->validate_timestamp = 0;
+	prange->vram_pages = 0;
 	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 
@@ -384,6 +392,8 @@ static void svm_range_bo_release(struct kref *kref)
 			 prange->start, prange->last);
 		mutex_lock(&prange->lock);
 		prange->svm_bo = NULL;
+		/* prange dose not hold vram page now */
+		prange->actual_loc = 0;
 		mutex_unlock(&prange->lock);
 
 		spin_lock(&svm_bo->list_lock);
@@ -439,7 +449,8 @@ svm_range_validate_svm_bo(struct kfd_node *node, struct svm_range *prange)
 		mutex_unlock(&prange->lock);
 		return false;
 	}
-	if (prange->ttm_res) {
+	/* requeset from same kfd_node and we still have reference to it */
+	if (prange->ttm_res && prange->svm_bo->node == node) {
 		/* We still have a reference, all is well */
 		mutex_unlock(&prange->lock);
 		return true;
@@ -458,6 +469,8 @@ svm_range_validate_svm_bo(struct kfd_node *node, struct svm_range *prange)
 			spin_unlock(&prange->svm_bo->list_lock);
 
 			svm_range_bo_unref(prange->svm_bo);
+			prange->ttm_res = NULL;
+			prange->svm_bo = NULL;
 			return false;
 		}
 		if (READ_ONCE(prange->svm_bo->evicting)) {
@@ -956,6 +969,10 @@ svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
 
 	new->svm_bo = svm_range_bo_ref(old->svm_bo);
 	new->ttm_res = old->ttm_res;
+	/* set new's vram_pages as old range's now, the acurate vram_pages
+	 * will be updated during mapping
+	 */
+	new->vram_pages = old->vram_pages;
 
 	spin_lock(&new->svm_bo->list_lock);
 	list_add(&new->svm_bo_list, &new->svm_bo->range_list);
@@ -1593,6 +1610,7 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	struct svm_validate_context *ctx;
 	unsigned long start, end, addr;
 	struct kfd_process *p;
+	uint32_t vram_pages;
 	void *owner;
 	int32_t idx;
 	int r = 0;
@@ -1661,6 +1679,7 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		}
 	}
 
+	vram_pages = 0;
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 	for (addr = start; addr < end && !r; ) {
@@ -1692,6 +1711,11 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			goto unreserve_out;
 		}
 
+		for (int i = 0; i < npages; i++) {
+			if (is_zone_device_page(hmm_pfn_to_page(hmm_range->hmm_pfns[i])))
+				vram_pages++;
+		}
+
 		offset = (addr - start) >> PAGE_SHIFT;
 		r = svm_range_dma_map(prange, ctx->bitmap, offset, npages,
 				      hmm_range->hmm_pfns);
@@ -1724,6 +1748,15 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	if (addr == end) {
 		prange->validated_once = true;
 		prange->mapped_to_gpu = true;
+		prange->vram_pages = vram_pages;
+
+		/* if pragne does not include any vram page and it
+		 * has not released svm_bo drop its svm_bo reference
+		 */
+		if (!vram_pages && prange->ttm_res) {
+			svm_range_vram_node_free(prange);
+			prange->actual_loc = 0;
+		}
 	}
 
 unreserve_out:
@@ -1981,6 +2014,7 @@ static struct svm_range *svm_range_clone(struct svm_range *old)
 	new->actual_loc = old->actual_loc;
 	new->granularity = old->granularity;
 	new->mapped_to_gpu = old->mapped_to_gpu;
+	new->vram_pages = old->vram_pages;
 	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
 	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
 
@@ -2888,6 +2922,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint32_t vmid, uint32_t node_id,
 			uint64_t addr, bool write_fault)
 {
+	unsigned long start, last, size;
 	struct mm_struct *mm = NULL;
 	struct svm_range_list *svms;
 	struct svm_range *prange;
@@ -3023,11 +3058,21 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	kfd_smi_event_page_fault_start(node, p->lead_thread->pid, addr,
 				       write_fault, timestamp);
 
-	if (prange->actual_loc != best_loc) {
+
+	if (prange->actual_loc != 0 || best_loc != 0) {
+
 		migration = true;
+		/* Align migration range start and size to granularity size */
+		size = 1UL << prange->granularity;
+		start = ALIGN_DOWN(addr, size);
+		last = ALIGN(addr + 1, size) - 1;
+
+		start = (start >= prange->start) ? start : prange->start;
+		last = (last <= prange->last) ? last : prange->last;
+
 		if (best_loc) {
-			r = svm_migrate_to_vram(prange, best_loc, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+			r = svm_migrate_to_vram(prange, best_loc, start, last,
+							mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
 			if (r) {
 				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
 					 r, addr);
@@ -3035,20 +3080,18 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 				 * VRAM failed
 				 */
 				if (prange->actual_loc)
-					r = svm_migrate_vram_to_ram(prange, mm,
-					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
-					   NULL);
+					r = svm_migrate_vram_to_ram(prange, mm, start, last,
+								KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU, NULL);
 				else
 					r = 0;
 			}
 		} else {
-			r = svm_migrate_vram_to_ram(prange, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
-					NULL);
+			r = svm_migrate_vram_to_ram(prange, mm, start, last,
+						KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU, NULL);
 		}
 		if (r) {
 			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
-				 r, svms, prange->start, prange->last);
+				 r, svms, start, last);
 			goto out_unlock_range;
 		}
 	}
@@ -3402,18 +3445,24 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
@@ -3468,7 +3517,11 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 
 		mutex_lock(&prange->migrate_mutex);
 		do {
+			/* migrate all vram pages in this prange to sys ram
+			 * after that prange->actual_loc should be zero
+			 */
 			r = svm_migrate_vram_to_ram(prange, mm,
+					prange->start, prange->last,
 					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
 		} while (!r && prange->actual_loc && --retries);
 
@@ -3571,7 +3624,6 @@ svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 		bool migrated;
 
 		mutex_lock(&prange->migrate_mutex);
-
 		r = svm_range_trigger_migration(mm, prange, &migrated);
 		if (r)
 			goto out_unlock_range;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 9e668eeefb32..83acd4e8c4a1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -88,7 +88,9 @@ struct svm_work_list_item {
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
@@ -98,6 +100,7 @@ struct svm_work_list_item {
  * @child_list: list header for split ranges which are not added to svms yet
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
+ * @vram_pages: vram pages number in this svm_range
  *
  * Data structure for virtual memory range shared by CPU and GPUs, it can be
  * allocated from system memory ram or device vram, and migrate from ram to vram
@@ -135,6 +138,7 @@ struct svm_range {
 	bool				validated_once;
 	bool				mapped_to_gpu;
 	bool				is_error_flag;
+	uint32_t			vram_pages;
 };
 
 static inline void svm_range_lock(struct svm_range *prange)
@@ -184,6 +188,7 @@ void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
 void svm_range_free_dma_mappings(struct svm_range *prange, bool unmap_dma);
+
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size);
 int kfd_criu_checkpoint_svm(struct kfd_process *p,
-- 
2.25.1

