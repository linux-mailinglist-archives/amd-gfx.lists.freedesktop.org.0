Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B958D679
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Aug 2022 11:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448B91149;
	Tue,  9 Aug 2022 09:24:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F51907B3;
 Tue,  9 Aug 2022 09:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoJzepwrHEQ3RQeyR9nmJzAMNOrLA23gPf6m6Bkwe/ZmjQBcZCtdQEkO9/E7izJ5ywaYR7KwWUHCCPV9GNhr6yPeZ3M38YsRA+qphkunHhYHzlEeDDtfH4aYslnWJLS1D2kRCVnBbJQPEikmjsU43sYx2bHv3xoWkrUA/haS9zwIM+NKDzj5BP/xz3hpB5SzAwu6b+yV95ILOeqTbZ+TKjmUsZ/v6fmgq64DqDtL3pz993xGRUhshSWKyTQjwF7DZphZoes23bFLFh+s/n0Ydk7xkXbXgQajOxfm974CFX93iqO9s4PziMw/52nIY/OVkSWOVJ5DG0cBsN9dCKIoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQi5HdAfqk9e3uellmQXB3kBOwi/n5rmJXrEPF94U0Y=;
 b=CQ/ldPhH3pLjOWBLqxCR1HZf0EYanAvM24AwrjIPEFwY4fOA3FiHSlrH3IA/6F7S8NFd3t64pzFX+Oub8OcFnIVYG1aoyiHcTUgiCX2pclaxke6f3BmpoJH8QrDqcJzplaDoBdEIX02AmIFcdFRbEzPTUhSXXWFs4xGcThzftCMiqogEyvJPDpeiSUXYbFt9PMRA50ZH/wrgjUAJw0rlAq92I9BPYpwcjhXDHPIvOw12axhCt2sXqm+P7PiCMxum2kLqFJ49/CQM3bjnaA56ujA8jC5Fke6Uo5TuVsuT6fahfF5iwRwhVOhBSDnHfONWZNwd9FwHokyLZni/10ERjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQi5HdAfqk9e3uellmQXB3kBOwi/n5rmJXrEPF94U0Y=;
 b=YX7Vx9YKQH/jeanh0phrY7kckTn/JZjZYA3Mw/i8EEMKpAMhVXUOojeUCGuUQ9s4+SSerx8LRnDjHm5yR+m8C/evzHHOBBA3qebKFKhg/y7DJ6Ya/UqfV1qPXkqoNXAo/+Bgh0QmFXYEGIoQY6Xvw31gqGIFU/BFReLMEangMR8=
Received: from MW4PR04CA0332.namprd04.prod.outlook.com (2603:10b6:303:8a::7)
 by BN8PR12MB2897.namprd12.prod.outlook.com (2603:10b6:408:99::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:23:38 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::4c) by MW4PR04CA0332.outlook.office365.com
 (2603:10b6:303:8a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:37 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:32 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 6/6] drm/ttm: Switch to using the new res callback
Date: Tue, 9 Aug 2022 02:22:30 -0700
Message-ID: <20220809092230.2808-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51edffe3-f0b0-4c10-a44c-08da79e8d768
X-MS-TrafficTypeDiagnostic: BN8PR12MB2897:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkorguVr2yeIFlvH8ggTt/VgulBHAvVeqzPyz0DDPD6hthBwnF5tvP0bRs38HUPwvtNUYdfIgxicKd4Juo26pXloZmLKYMSJ/lt6PyxCnFTH7H85+UvlIJgK4RqQyzhOwCRE1mtmPr4Bvjnv4wmM14cT0pvt7cGfTen3D6CCs7vIzVn4HElVj5/EwhqiK3+PQ6ctddXVZx+r5Q4MfAZ6lAlaKqkx9YFlURjLoLGR1P8i9dSba+SicfJ3+fJ3I3N3mL3ovUIJIPQFYomn6+BwYeOutMDzLrsq8V+aO6C1OOAJAGSeo5Ghyii8j3SfpxL6RTCGkN/fK7tMMyGSlXafIxbPk1HOFXX0ehp/idKtYocBy7QKC6CBSJaGItPF7+TCVOlEmEbMHkgjiwugzyA63FaemlLHVGw5kIuMmDmgjfiK/sldWXQ21zZuzpXl9v7tiD2Prhxl756rVyzaS4ubr5M1N1Q9mA+cTEIFthMUuBjmR3n8VnU+dvHOPkeQsW8Sf1YutDY+izl5SUSmJaqlwQV/7wlv1Da/EHfO2SF81BnQhf+RlT6zIUsOVyloOHVpzuPMgAmUeXR+0mF698BletVCRUpYPFjFJlQ1VKb+WaSh3EIr9OR2EvsdTwCYCiK9bcgn4VDWB3Ub5OjcKhiVj2FuXQDy7OyoNHxXODxO78xzSGsoLl1jqLU15LDDE4EZNIPs732tFEMXeIDMmtegU8bp/RfDDx/+9sLKrv1XGX674aFmlrxxD1HTJU4sZis1rP1MEpA0wux/BAdqggL956zcV8m9r2tLzb93B96MPUh1M41B2JIRKi+q7Ey5Y2BQ8G1c2+TS06ccssJBh/GeGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(70206006)(70586007)(40480700001)(82740400003)(2906002)(81166007)(5660300002)(356005)(8936002)(8676002)(4326008)(478600001)(83380400001)(66574015)(7696005)(47076005)(16526019)(336012)(2616005)(426003)(186003)(26005)(1076003)(36860700001)(41300700001)(54906003)(110136005)(316002)(86362001)(82310400005)(36756003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:37.7960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51edffe3-f0b0-4c10-a44c-08da79e8d768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2897
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Apply new intersect and compatible callback instead
of having a generic placement range verfications.

v2: Added a separate callback for compatiblilty
    checks (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
 drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
 3 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 170935c294f5..7d25a10395c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
-	unsigned long num_pages = bo->resource->num_pages;
 	struct dma_resv_iter resv_cursor;
-	struct amdgpu_res_cursor cursor;
 	struct dma_fence *f;
 
+	if (!amdgpu_bo_is_amdgpu_bo(bo))
+		return ttm_bo_eviction_valuable(bo, place);
+
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			return false;
 	}
 
-	switch (bo->resource->mem_type) {
-	case AMDGPU_PL_PREEMPT:
-		/* Preemptible BOs don't own system resources managed by the
-		 * driver (pages, VRAM, GART space). They point to resources
-		 * owned by someone else (e.g. pageable memory in user mode
-		 * or a DMABuf). They are used in a preemptible context so we
-		 * can guarantee no deadlocks and good QoS in case of MMU
-		 * notifiers or DMABuf move notifiers from the resource owner.
-		 */
+	/* Preemptible BOs don't own system resources managed by the
+	 * driver (pages, VRAM, GART space). They point to resources
+	 * owned by someone else (e.g. pageable memory in user mode
+	 * or a DMABuf). They are used in a preemptible context so we
+	 * can guarantee no deadlocks and good QoS in case of MMU
+	 * notifiers or DMABuf move notifiers from the resource owner.
+	 */
+	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
 		return false;
-	case TTM_PL_TT:
-		if (amdgpu_bo_is_amdgpu_bo(bo) &&
-		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
-			return false;
-		return true;
 
-	case TTM_PL_VRAM:
-		/* Check each drm MM node individually */
-		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
-				 &cursor);
-		while (cursor.remaining) {
-			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
-			    && !(place->lpfn &&
-				 place->lpfn <= PFN_DOWN(cursor.start)))
-				return true;
-
-			amdgpu_res_next(&cursor, cursor.size);
-		}
+	if (bo->resource->mem_type == TTM_PL_TT &&
+	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
 		return false;
 
-	default:
-		break;
-	}
-
 	return ttm_bo_eviction_valuable(bo, place);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..f066e8124c50 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	struct ttm_resource *res = bo->resource;
+	struct ttm_device *bdev = bo->bdev;
+
 	dma_resv_assert_held(bo->base.resv);
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
-	    (place->lpfn && place->lpfn <= bo->resource->start))
-		return false;
-
-	return true;
+	return ttm_resource_intersects(bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index ea67976f1f60..a729c32a1e48 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
-- 
2.25.1

