Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D558F56B57D
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Jul 2022 11:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1C010F96C;
	Fri,  8 Jul 2022 09:32:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF19510EEA9;
 Fri,  8 Jul 2022 09:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkEQlIipYYOw1VVdVotmMsXdFzKtShH+KpedBcbqfSQXnrZrvof7CcU1bglpXHo3q+1iSsZT8JtHLSYZhEEzfDb5TnKrz8tXnweHw7KiSoDgsYTmHKo3hHCZdbWR5a4tXdIBl5Y3wAo4A3JKBOvJdmucQnIzglUQa6kTbHMqi74lR+6ijKkXQlDDOTd5NnNv0OssBhUC4eAck0u4RoWb/zyfbIWmTguzBm4+Oqi3awZ4vML/fdhVqoIwjIwY4gd6t9DfgrN1q/NcHhM2IOmn5SGCQ0EY+ece3ZFYJyctweyx2bNYJIZ1lNk0gWwaUcIoX3sAiiaoG2a+XdS63NNKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylntBTTUy4+csMKnYCM3HCgjIqGaHCKhmXfvzAx0GSk=;
 b=LUoVX7/7+xok6It75lEjARxeRSkIoYMvXOX7OKYHFH9yUUlGp+HJUJWK5r+KCcVlyqKrejAGzkgWCGNFtF9upiDbMf2hJpG2iwCtJqU98zYMniOxd5EA7OPZMJpA3dKDA05b7yJWbtFq7Vl6E7L5vy/5uKUPnlDlL0G3Gt5OkK6DPm9Adoe6pDdKU2gPtH+X2L58cV4BGUbdUMSkVYwKe4l9IxqXoKWZXWOIeU1RHYJhijJll6ptDad6XG0KCKfBRhle246z4DXaQuwiPS6p/RXMuVU82JI20H433sWLRwt36kE4OaAzjIpspYGMZf5McXNzvNKe7uu9aw7jzc2+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylntBTTUy4+csMKnYCM3HCgjIqGaHCKhmXfvzAx0GSk=;
 b=P0LNaK34suv+YeNLfaslfJLwuVIMProMGKOhY+xHFjPIdt96FuDKOEbC5CjP6ssfcmhxnblc0+Q+h/iz1yDQKgrjkgUeKPP65GpnVdJrpNP/arrB/q9LPbS8acbEB5Zh1WRQhOm0Yyg0TZlKyOtuTCKEBd8UPd6mKdLTSRjIKoE=
Received: from MW4PR03CA0135.namprd03.prod.outlook.com (2603:10b6:303:8c::20)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 09:32:50 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::87) by MW4PR03CA0135.outlook.office365.com
 (2603:10b6:303:8c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 09:32:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 09:32:49 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 04:32:46 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Date: Fri, 8 Jul 2022 02:30:47 -0700
Message-ID: <20220708093047.492662-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2cc5688-6067-49d7-c754-08da60c4d346
X-MS-TrafficTypeDiagnostic: MW3PR12MB4428:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HyrGz76Nj27R9+FkGS1FZCt7hJ+nGS78oXNn1LBj27SuiZo4zsSZsi3TQrq5U9QatU6XnVwAwTcJvUvl6lbGL2wRG4iAeEU1wZ2VrjzZIyQSnMJjWbQ1N/z1W8mPvpi2NmL7Iw/gmPWMyJIiEln6QvB3tgTF7dWfu0njjz9Y8Ftjcha73CfCktSnycQBdyTOBDnzCbXkLrmPXCzAZswIyGFq1xkED2MWDSJDNvENDiM9mxffHfRfoj+Ncw06L4vL607Yw8gMEZC+AIt6v60jnZatJg1OOZUjMghwR0r72GcQZsrMXV58sX4MV8GaFXTZtDUKPI2R3O7aUHe3qtFSVzeYCLxrcD4XvXW6ctLZgW+PbEVYTD34IvnS4dgQns/KBAB6LhJ9Ljjxyf1D6MZ7LsGJMwLwWxZU48kYRL8OprB9HMWQ2hSfX250Y30kJx8G8XWJNX8YMuTBSxXHeIY7uVHULiJBTQhYBs3lLEGn2s0j8kbGfoFpaOFv9KLnNErix1r+5whxfRdm8cYoH11fiS0CRC5bl/MWgJIRsZ/o4Ni5VVpP7bWSWD/2pMhWazudXgmTMnu80ceMOZcf7/idmWYUsPjJs3ec3sG+der56gQDbvIpOt3YU5+TtI9Brb8Q5VHANY43pB3F21Q/DlLE95CVzc3yFpfZihVPSEH6RjvO+9AkAjzsjJv99/XG8BNhVoLEuZiTZDFqOhsOFyEdLkAEpYuqrWIa2YNMb0ma/zcNAsz+lCSZvgyRZdjf+9ZfgURv2Ggf7zzybW8FbMu2gW4H1cvixTwzOWFeesvsWOcjiomgvp6mNiLd47lPyh5Yc64byVypIIuJPcEsMADfbwU1MFPbclAIJSes29lhmAjcTAXHi4sX0NQYzTajP505
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(40470700004)(2906002)(478600001)(82310400005)(40480700001)(40460700003)(110136005)(54906003)(450100002)(36756003)(86362001)(41300700001)(316002)(26005)(70586007)(70206006)(7696005)(8676002)(4326008)(336012)(1076003)(16526019)(2616005)(83380400001)(47076005)(356005)(186003)(426003)(5660300002)(36860700001)(82740400003)(30864003)(8936002)(34020700004)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 09:32:49.8959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cc5688-6067-49d7-c754-08da60c4d346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Arunpravin
 Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This reverts commit c9cad937c0c58618fe5b0310fd539a854dc1ae95.

This is part of a revert of the following commits:
commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")

[WHY]
Few users reported garbaged graphics as soon as x starts,
reverting until this can be resolved.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Kconfig                       |   1 -
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 359 ++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  89 -----
 5 files changed, 176 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..d438d5ff8b40 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -272,7 +272,6 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
-	select DRM_BUDDY
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 6546552e596c..acfa207cf970 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -30,15 +30,12 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_range_manager.h>
 
-#include "amdgpu_vram_mgr.h"
-
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
 	uint64_t		start;
 	uint64_t		size;
 	uint64_t		remaining;
-	void			*node;
-	uint32_t		mem_type;
+	struct drm_mm_node	*node;
 };
 
 /**
@@ -55,63 +52,27 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 				    uint64_t start, uint64_t size,
 				    struct amdgpu_res_cursor *cur)
 {
-	struct drm_buddy_block *block;
-	struct list_head *head, *next;
 	struct drm_mm_node *node;
 
-	if (!res)
-		goto fallback;
-
-	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
-
-	cur->mem_type = res->mem_type;
-
-	switch (cur->mem_type) {
-	case TTM_PL_VRAM:
-		head = &to_amdgpu_vram_mgr_resource(res)->blocks;
-
-		block = list_first_entry_or_null(head,
-						 struct drm_buddy_block,
-						 link);
-		if (!block)
-			goto fallback;
-
-		while (start >= amdgpu_vram_mgr_block_size(block)) {
-			start -= amdgpu_vram_mgr_block_size(block);
-
-			next = block->link.next;
-			if (next != head)
-				block = list_entry(next, struct drm_buddy_block, link);
-		}
-
-		cur->start = amdgpu_vram_mgr_block_start(block) + start;
-		cur->size = min(amdgpu_vram_mgr_block_size(block) - start, size);
-		cur->remaining = size;
-		cur->node = block;
-		break;
-	case TTM_PL_TT:
-		node = to_ttm_range_mgr_node(res)->mm_nodes;
-		while (start >= node->size << PAGE_SHIFT)
-			start -= node++->size << PAGE_SHIFT;
-
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+	if (!res || res->mem_type == TTM_PL_SYSTEM) {
+		cur->start = start;
+		cur->size = size;
 		cur->remaining = size;
-		cur->node = node;
-		break;
-	default:
-		goto fallback;
+		cur->node = NULL;
+		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+		return;
 	}
 
-	return;
+	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-fallback:
-	cur->start = start;
-	cur->size = size;
+	node = to_ttm_range_mgr_node(res)->mm_nodes;
+	while (start >= node->size << PAGE_SHIFT)
+		start -= node++->size << PAGE_SHIFT;
+
+	cur->start = (node->start << PAGE_SHIFT) + start;
+	cur->size = min((node->size << PAGE_SHIFT) - start, size);
 	cur->remaining = size;
-	cur->node = NULL;
-	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
-	return;
+	cur->node = node;
 }
 
 /**
@@ -124,9 +85,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
  */
 static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 {
-	struct drm_buddy_block *block;
-	struct drm_mm_node *node;
-	struct list_head *next;
+	struct drm_mm_node *node = cur->node;
 
 	BUG_ON(size > cur->remaining);
 
@@ -140,27 +99,9 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		return;
 	}
 
-	switch (cur->mem_type) {
-	case TTM_PL_VRAM:
-		block = cur->node;
-
-		next = block->link.next;
-		block = list_entry(next, struct drm_buddy_block, link);
-
-		cur->node = block;
-		cur->start = amdgpu_vram_mgr_block_start(block);
-		cur->size = min(amdgpu_vram_mgr_block_size(block), cur->remaining);
-		break;
-	case TTM_PL_TT:
-		node = cur->node;
-
-		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
-		break;
-	default:
-		return;
-	}
+	cur->node = ++node;
+	cur->start = node->start << PAGE_SHIFT;
+	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
 }
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 6a70818039dd..9120ae80ef52 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,7 +26,6 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
-#include "amdgpu_vram_mgr.h"
 #include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
@@ -39,6 +38,15 @@
 
 #define AMDGPU_POISON	0xd0bed0be
 
+struct amdgpu_vram_mgr {
+	struct ttm_resource_manager manager;
+	struct drm_mm mm;
+	spinlock_t lock;
+	struct list_head reservations_pending;
+	struct list_head reserved_pages;
+	atomic64_t vis_usage;
+};
+
 struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 49e4092f447f..0a7611648573 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -32,10 +32,8 @@
 #include "atom.h"
 
 struct amdgpu_vram_reservation {
-	u64 start;
-	u64 size;
-	struct list_head allocated;
-	struct list_head blocks;
+	struct list_head node;
+	struct drm_mm_node mm_node;
 };
 
 static inline struct amdgpu_vram_mgr *
@@ -188,18 +186,18 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
 };
 
 /**
- * amdgpu_vram_mgr_vis_size - Calculate visible block size
+ * amdgpu_vram_mgr_vis_size - Calculate visible node size
  *
  * @adev: amdgpu_device pointer
- * @block: DRM BUDDY block structure
+ * @node: MM node structure
  *
- * Calculate how many bytes of the DRM BUDDY block are inside visible VRAM
+ * Calculate how many bytes of the MM node are inside visible VRAM
  */
 static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
-				    struct drm_buddy_block *block)
+				    struct drm_mm_node *node)
 {
-	u64 start = amdgpu_vram_mgr_block_start(block);
-	u64 end = start + amdgpu_vram_mgr_block_size(block);
+	uint64_t start = node->start << PAGE_SHIFT;
+	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
 
 	if (start >= adev->gmc.visible_vram_size)
 		return 0;
@@ -220,9 +218,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
-	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
-	struct drm_buddy_block *block;
-	u64 usage = 0;
+	unsigned pages = res->num_pages;
+	struct drm_mm_node *mm;
+	u64 usage;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
@@ -230,8 +228,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	list_for_each_entry(block, &vres->blocks, link)
-		usage += amdgpu_vram_mgr_vis_size(adev, block);
+	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
+	for (usage = 0; pages; pages -= mm->size, mm++)
+		usage += amdgpu_vram_mgr_vis_size(adev, mm);
 
 	return usage;
 }
@@ -241,30 +240,23 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_buddy *mm = &mgr->mm;
+	struct drm_mm *mm = &mgr->mm;
 	struct amdgpu_vram_reservation *rsv, *temp;
-	struct drm_buddy_block *block;
 	uint64_t vis_usage;
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks) {
-		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
-					   rsv->size, mm->chunk_size, &rsv->allocated,
-					   DRM_BUDDY_RANGE_ALLOCATION))
-			continue;
-
-		block = amdgpu_vram_mgr_first_block(&rsv->allocated);
-		if (!block)
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
+		if (drm_mm_reserve_node(mm, &rsv->mm_node))
 			continue;
 
 		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
-			rsv->start, rsv->size);
+			rsv->mm_node.start, rsv->mm_node.size);
 
-		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
+		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
 		atomic64_add(vis_usage, &mgr->vis_usage);
 		spin_lock(&man->bdev->lru_lock);
-		man->usage += rsv->size;
+		man->usage += rsv->mm_node.size << PAGE_SHIFT;
 		spin_unlock(&man->bdev->lru_lock);
-		list_move(&rsv->blocks, &mgr->reserved_pages);
+		list_move(&rsv->node, &mgr->reserved_pages);
 	}
 }
 
@@ -286,16 +278,14 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 	if (!rsv)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&rsv->allocated);
-	INIT_LIST_HEAD(&rsv->blocks);
+	INIT_LIST_HEAD(&rsv->node);
+	rsv->mm_node.start = start >> PAGE_SHIFT;
+	rsv->mm_node.size = size >> PAGE_SHIFT;
 
-	rsv->start = start;
-	rsv->size = size;
-
-	mutex_lock(&mgr->lock);
-	list_add_tail(&rsv->blocks, &mgr->reservations_pending);
+	spin_lock(&mgr->lock);
+	list_add_tail(&rsv->node, &mgr->reservations_pending);
 	amdgpu_vram_mgr_do_reserve(&mgr->manager);
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 
 	return 0;
 }
@@ -317,19 +307,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 	struct amdgpu_vram_reservation *rsv;
 	int ret;
 
-	mutex_lock(&mgr->lock);
+	spin_lock(&mgr->lock);
 
-	list_for_each_entry(rsv, &mgr->reservations_pending, blocks) {
-		if (rsv->start <= start &&
-		    (start < (rsv->start + rsv->size))) {
+	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
+		if ((rsv->mm_node.start <= start) &&
+		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
 			ret = -EBUSY;
 			goto out;
 		}
 	}
 
-	list_for_each_entry(rsv, &mgr->reserved_pages, blocks) {
-		if (rsv->start <= start &&
-		    (start < (rsv->start + rsv->size))) {
+	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
+		if ((rsv->mm_node.start <= start) &&
+		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
 			ret = 0;
 			goto out;
 		}
@@ -337,10 +327,32 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 
 	ret = -ENOENT;
 out:
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 	return ret;
 }
 
+/**
+ * amdgpu_vram_mgr_virt_start - update virtual start address
+ *
+ * @mem: ttm_resource to update
+ * @node: just allocated node
+ *
+ * Calculate a virtual BO start address to easily check if everything is CPU
+ * accessible.
+ */
+static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
+				       struct drm_mm_node *node)
+{
+	unsigned long start;
+
+	start = node->start + node->size;
+	if (start > mem->num_pages)
+		start -= mem->num_pages;
+	else
+		start = 0;
+	mem->start = max(mem->start, start);
+}
+
 /**
  * amdgpu_vram_mgr_new - allocate new ranges
  *
@@ -356,44 +368,46 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	u64 vis_usage = 0, max_bytes, cur_size, min_block_size;
+	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct amdgpu_vram_mgr_resource *vres;
-	u64 size, remaining_size, lpfn, fpfn;
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
-	unsigned long pages_per_block;
+	uint64_t vis_usage = 0, mem_bytes, max_bytes;
+	struct ttm_range_mgr_node *node;
+	struct drm_mm *mm = &mgr->mm;
+	enum drm_mm_insert_mode mode;
+	unsigned i;
 	int r;
 
-	lpfn = place->lpfn << PAGE_SHIFT;
+	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
-
-	fpfn = place->fpfn << PAGE_SHIFT;
+		lpfn = man->size >> PAGE_SHIFT;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
+	mem_bytes = tbo->base.size;
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		pages_per_block = ~0ul;
+		pages_per_node = ~0ul;
+		num_nodes = 1;
 	} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		pages_per_block = HPAGE_PMD_NR;
+		pages_per_node = HPAGE_PMD_NR;
 #else
 		/* default to 2MB */
-		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
+		pages_per_node = 2UL << (20UL - PAGE_SHIFT);
 #endif
-		pages_per_block = max_t(uint32_t, pages_per_block,
-					tbo->page_alignment);
+		pages_per_node = max_t(uint32_t, pages_per_node,
+				       tbo->page_alignment);
+		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 	}
 
-	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
-	if (!vres)
+	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
+			GFP_KERNEL | __GFP_ZERO);
+	if (!node)
 		return -ENOMEM;
 
-	ttm_resource_init(tbo, place, &vres->base);
+	ttm_resource_init(tbo, place, &node->base);
 
 	/* bail out quickly if there's likely not enough VRAM for this BO */
 	if (ttm_resource_manager_usage(man) > max_bytes) {
@@ -401,130 +415,66 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_fini;
 	}
 
-	INIT_LIST_HEAD(&vres->blocks);
-
+	mode = DRM_MM_INSERT_BEST;
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
-
-	if (fpfn || lpfn != man->size)
-		/* Allocate blocks in desired range */
-		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
-
-	remaining_size = vres->base.num_pages << PAGE_SHIFT;
-
-	mutex_lock(&mgr->lock);
-	while (remaining_size) {
-		if (tbo->page_alignment)
-			min_block_size = tbo->page_alignment << PAGE_SHIFT;
-		else
-			min_block_size = mgr->default_page_size;
-
-		BUG_ON(min_block_size < mm->chunk_size);
-
-		/* Limit maximum size to 2GiB due to SG table limitations */
-		size = min(remaining_size, 2ULL << 30);
-
-		if (size >= pages_per_block << PAGE_SHIFT)
-			min_block_size = pages_per_block << PAGE_SHIFT;
-
-		cur_size = size;
-
-		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
-			/*
-			 * Except for actual range allocation, modify the size and
-			 * min_block_size conforming to continuous flag enablement
-			 */
-			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-				size = roundup_pow_of_two(size);
-				min_block_size = size;
-			/*
-			 * Modify the size value if size is not
-			 * aligned with min_block_size
-			 */
-			} else if (!IS_ALIGNED(size, min_block_size)) {
-				size = round_up(size, min_block_size);
+		mode = DRM_MM_INSERT_HIGH;
+
+	pages_left = node->base.num_pages;
+
+	/* Limit maximum size to 2GB due to SG table limitations */
+	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
+
+	i = 0;
+	spin_lock(&mgr->lock);
+	while (pages_left) {
+		uint32_t alignment = tbo->page_alignment;
+
+		if (pages >= pages_per_node)
+			alignment = pages_per_node;
+
+		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
+						alignment, 0, place->fpfn,
+						lpfn, mode);
+		if (unlikely(r)) {
+			if (pages > pages_per_node) {
+				if (is_power_of_2(pages))
+					pages = pages / 2;
+				else
+					pages = rounddown_pow_of_two(pages);
+				continue;
 			}
+			goto error_free;
 		}
 
-		r = drm_buddy_alloc_blocks(mm, fpfn,
-					   lpfn,
-					   size,
-					   min_block_size,
-					   &vres->blocks,
-					   vres->flags);
-		if (unlikely(r))
-			goto error_free_blocks;
-
-		if (size > remaining_size)
-			remaining_size = 0;
-		else
-			remaining_size -= size;
-	}
-	mutex_unlock(&mgr->lock);
-
-	if (cur_size != size) {
-		struct drm_buddy_block *block;
-		struct list_head *trim_list;
-		u64 original_size;
-		LIST_HEAD(temp);
-
-		trim_list = &vres->blocks;
-		original_size = vres->base.num_pages << PAGE_SHIFT;
-
-		/*
-		 * If size value is rounded up to min_block_size, trim the last
-		 * block to the required size
-		 */
-		if (!list_is_singular(&vres->blocks)) {
-			block = list_last_entry(&vres->blocks, typeof(*block), link);
-			list_move_tail(&block->link, &temp);
-			trim_list = &temp;
-			/*
-			 * Compute the original_size value by subtracting the
-			 * last block size with (aligned size - original size)
-			 */
-			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
-		}
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
+		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
+		pages_left -= pages;
+		++i;
 
-		mutex_lock(&mgr->lock);
-		drm_buddy_block_trim(mm,
-				     original_size,
-				     trim_list);
-		mutex_unlock(&mgr->lock);
-
-		if (!list_empty(&temp))
-			list_splice_tail(trim_list, &vres->blocks);
-	}
-
-	list_for_each_entry(block, &vres->blocks, link)
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
-
-	block = amdgpu_vram_mgr_first_block(&vres->blocks);
-	if (!block) {
-		r = -EINVAL;
-		goto error_fini;
+		if (pages > pages_left)
+			pages = pages_left;
 	}
+	spin_unlock(&mgr->lock);
 
-	vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
-
-	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
-		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
+	if (i == 1)
+		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (adev->gmc.xgmi.connected_to_cpu)
-		vres->base.bus.caching = ttm_cached;
+		node->base.bus.caching = ttm_cached;
 	else
-		vres->base.bus.caching = ttm_write_combined;
+		node->base.bus.caching = ttm_write_combined;
 
 	atomic64_add(vis_usage, &mgr->vis_usage);
-	*res = &vres->base;
+	*res = &node->base;
 	return 0;
 
-error_free_blocks:
-	drm_buddy_free_list(mm, &vres->blocks);
-	mutex_unlock(&mgr->lock);
+error_free:
+	while (i--)
+		drm_mm_remove_node(&node->mm_nodes[i]);
+	spin_unlock(&mgr->lock);
 error_fini:
-	ttm_resource_fini(man, &vres->base);
-	kfree(vres);
+	ttm_resource_fini(man, &node->base);
+	kvfree(node);
 
 	return r;
 }
@@ -540,26 +490,27 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
-	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
 	uint64_t vis_usage = 0;
+	unsigned i, pages;
 
-	mutex_lock(&mgr->lock);
-	list_for_each_entry(block, &vres->blocks, link)
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+	spin_lock(&mgr->lock);
+	for (i = 0, pages = res->num_pages; pages;
+	     pages -= node->mm_nodes[i].size, ++i) {
+		struct drm_mm_node *mm = &node->mm_nodes[i];
 
+		drm_mm_remove_node(mm);
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	}
 	amdgpu_vram_mgr_do_reserve(man);
-
-	drm_buddy_free_list(mm, &vres->blocks);
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
 	ttm_resource_fini(man, res);
-	kfree(vres);
+	kvfree(node);
 }
 
 /**
@@ -591,7 +542,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 	if (!*sgt)
 		return -ENOMEM;
 
-	/* Determine the number of DRM_BUDDY blocks to export */
+	/* Determine the number of DRM_MM nodes to export */
 	amdgpu_res_first(res, offset, length, &cursor);
 	while (cursor.remaining) {
 		num_entries++;
@@ -607,10 +558,10 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 		sg->length = 0;
 
 	/*
-	 * Walk down DRM_BUDDY blocks to populate scatterlist nodes
-	 * @note: Use iterator api to get first the DRM_BUDDY block
+	 * Walk down DRM_MM nodes to populate scatterlist nodes
+	 * @note: Use iterator api to get first the DRM_MM node
 	 * and the number of bytes from it. Access the following
-	 * DRM_BUDDY block(s) if more buffer needs to exported
+	 * DRM_MM node(s) if more buffer needs to exported
 	 */
 	amdgpu_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
@@ -697,22 +648,13 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
 
 	drm_printf(printer, "  vis usage:%llu\n",
 		   amdgpu_vram_mgr_vis_usage(mgr));
 
-	mutex_lock(&mgr->lock);
-	drm_printf(printer, "default_page_size: %lluKiB\n",
-		   mgr->default_page_size >> 10);
-
-	drm_buddy_print(mm, printer);
-
-	drm_printf(printer, "reserved:\n");
-	list_for_each_entry(block, &mgr->reserved_pages, link)
-		drm_buddy_block_print(mm, block, printer);
-	mutex_unlock(&mgr->lock);
+	spin_lock(&mgr->lock);
+	drm_mm_print(&mgr->mm, printer);
+	spin_unlock(&mgr->lock);
 }
 
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
@@ -732,21 +674,16 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	int err;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
 				  adev->gmc.real_vram_size);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
-	if (err)
-		return err;
-
-	mutex_init(&mgr->lock);
+	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
+	spin_lock_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
-	mgr->default_page_size = PAGE_SIZE;
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
@@ -774,16 +711,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	if (ret)
 		return;
 
-	mutex_lock(&mgr->lock);
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks)
+	spin_lock(&mgr->lock);
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
 		kfree(rsv);
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
-		drm_buddy_free_list(&mgr->mm, &rsv->blocks);
+	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
+		drm_mm_remove_node(&rsv->mm_node);
 		kfree(rsv);
 	}
-	drm_buddy_fini(&mgr->mm);
-	mutex_unlock(&mgr->lock);
+	drm_mm_takedown(&mgr->mm);
+	spin_unlock(&mgr->lock);
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
deleted file mode 100644
index 9a2db87186c7..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ /dev/null
@@ -1,89 +0,0 @@
-/* SPDX-License-Identifier: MIT
- * Copyright 2021 Advanced Micro Devices, Inc.
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
-#ifndef __AMDGPU_VRAM_MGR_H__
-#define __AMDGPU_VRAM_MGR_H__
-
-#include <drm/drm_buddy.h>
-
-struct amdgpu_vram_mgr {
-	struct ttm_resource_manager manager;
-	struct drm_buddy mm;
-	/* protects access to buffer objects */
-	struct mutex lock;
-	struct list_head reservations_pending;
-	struct list_head reserved_pages;
-	atomic64_t vis_usage;
-	u64 default_page_size;
-};
-
-struct amdgpu_vram_mgr_resource {
-	struct ttm_resource base;
-	struct list_head blocks;
-	unsigned long flags;
-};
-
-static inline u64 amdgpu_vram_mgr_block_start(struct drm_buddy_block *block)
-{
-	return drm_buddy_block_offset(block);
-}
-
-static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
-{
-	return PAGE_SIZE << drm_buddy_block_order(block);
-}
-
-static inline struct drm_buddy_block *
-amdgpu_vram_mgr_first_block(struct list_head *list)
-{
-	return list_first_entry_or_null(list, struct drm_buddy_block, link);
-}
-
-static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
-{
-	struct drm_buddy_block *block;
-	u64 start, size;
-
-	block = amdgpu_vram_mgr_first_block(head);
-	if (!block)
-		return false;
-
-	while (head != block->link.next) {
-		start = amdgpu_vram_mgr_block_start(block);
-		size = amdgpu_vram_mgr_block_size(block);
-
-		block = list_entry(block->link.next, struct drm_buddy_block, link);
-		if (start + size != amdgpu_vram_mgr_block_start(block))
-			return false;
-	}
-
-	return true;
-}
-
-static inline struct amdgpu_vram_mgr_resource *
-to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
-{
-	return container_of(res, struct amdgpu_vram_mgr_resource, base);
-}
-
-#endif
-- 
2.25.1

