Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC28B1CA9
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Apr 2024 10:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CC111A28C;
	Thu, 25 Apr 2024 08:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RX+dPuSx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BBB11A287
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Apr 2024 08:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMdD8jXAev7bkwryS6nzrfgSl+eCQ6eO2ZZ8Cwj8MZb1EZ0T1wnapl4N/yZWQiB91fe6sDLjkt9wepVOW0ewhWkE3TR3AZMvH5AO1aNmQEI5yhsEldBHidPuIh6xEElxZ5tI4Afp/vard2tqHVvGiVvP3L/bubZpa5wpVDFR9cKsxsOZfnTghvadU5o79Lh058anrdt/i6s+eVSheHvZ3m3MpYtU8gY/aU+hkysdnwpGx5JRFXv2Ptt3ZtabJq7UNtu186n9g/YwxxYkMz7pgU0HplVJdaXixOnYE9eERzvHTpKcd/m/zugbrKh+If8dFgJ5AfF41z9VfHhWTLdXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU7pF0FLrtoT4c7y2ltzCAVJtsOZrRdwQpkhLd7RI/Q=;
 b=n8oxJJ/YGwgbPt9wg1tdPn/xG+1rcXsoOWfpphwZ8CDxf2Yc1CYnG0Z/g0Uotnr3hPVKfe9uEhid5xX5C1no63+t31OxyDSNuhTCFigAvgU9+430ASUOQj7QrCLcm0wIdqCn/u3Po3nafiin/0c/CtQyfCZHk8Nq2qyv3jPeWFfnQxLbCUxQ7X1sqnvnDBOxJtTDwMEPZiaZf0DYlqrtiijkBSsBr7mCfNNJNsVGKKQNBgeyuWizuNl1LnJ5PHZ7d1JKHXhq6nqeYNweA7Wj80F4/fhA/E+Mbeedks2apc+udZgConm2nzpUuIBtiFSNGBp9FSM7G+qcFuzEtfVKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU7pF0FLrtoT4c7y2ltzCAVJtsOZrRdwQpkhLd7RI/Q=;
 b=RX+dPuSx6FU7whw0Y2CP0KZSlJOWcKItwBs/kog/Pzc5uQ51V/UdPWPbU0nTY0i87I6SG00IS4vpFGb780YYe141EKCQTUOlwbRSQ/S1mpLZBnkqmuzj/TVIhBE57LK7SzFfvUUTE3JV6heYjuNkYHP+c34Bvnp30pJbOT5GGDM=
Received: from BYAPR11CA0108.namprd11.prod.outlook.com (2603:10b6:a03:f4::49)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 08:15:50 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::c8) by BYAPR11CA0108.outlook.office365.com
 (2603:10b6:a03:f4::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Thu, 25 Apr 2024 08:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 08:15:50 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 03:15:47 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <felix.kuehling@amd.com>, <philip.yang@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4] drm/amdgpu: Modify the contiguous flags behaviour
Date: Thu, 25 Apr 2024 13:45:27 +0530
Message-ID: <20240425081527.3212-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab53b12-6db5-4d4e-fa23-08dc64ffeb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0ZPYWVZTFQyMTkvTk40YWVVNXBFQUw4TGREcC83RVN0RHZPZm9uamd4bURp?=
 =?utf-8?B?MkFTeTVxbmRqbllMZU9CQ2k0Y3BEc1YrYUZZWHZ1cnlWalY1RTUwMVB3NGtY?=
 =?utf-8?B?VWJIUHN6VTNWdzhLWDk4SjArNzNPcTV6YkI5MFJOOXMwcE95aGJheEQ2Vys0?=
 =?utf-8?B?Zlp6NWJpWXZCQ2FZMno5VENqZUY4L2psUEJ5elBYOUpzQnlYbWVuRW9vR0Ji?=
 =?utf-8?B?UXFVb3lydmZ3MENIVVVkWS9vQlBsdElycGRaTkZpRDZGNThZeXdZc3dRTjIr?=
 =?utf-8?B?OUVWV0tBUS9yNHNkbzg5N2QyTitVcVZRNGkxbmZWUmFLWGp1R0pHMlFFNDZ3?=
 =?utf-8?B?cTBISFRJaTFVb0pQbmhVWTRwZTRRRVJEbGh3YXRDdG01NHJ0RUNKNlpQdFJI?=
 =?utf-8?B?RFEyM2x6Z2QwNHRhMGpoNkxxU0RyWndDZjM4dkxxLzdCcjZsbmEySWxPaTdJ?=
 =?utf-8?B?SStmeGU1UTVtYWNYUlhadjBCcWl6UG5FOXZDc3hNcDA2TWpqMXN2UXEzOFNt?=
 =?utf-8?B?YW12UUlpS1lleDR3RmIwNGVpWHhvbE52VG1uRXJpeWFPM3hCazdXMlVQNXpt?=
 =?utf-8?B?aWhZc3VHZlRZRTRrenZtZ2cyTzFVcmxBZzdoKzNIZVovV082VDRnV0dRb2xW?=
 =?utf-8?B?U0h5WEZlTGtuRlpWbUFWQXFQcDBZekdSaWZOaGJXam5Yd09CL1VRRjVqOFI5?=
 =?utf-8?B?NHBUS0hXMG1NT3I3WTlIL1RST2g4d3czelVhVEdZaTY5VFBXZmI0c1FZRXls?=
 =?utf-8?B?cWZDVTFPZ0pTZHVDbHp1ZGFLWGhsbDAweXJlN1RkSFhBbDc4cldaRDZlZjR2?=
 =?utf-8?B?R0F0aXhPZm43WDEzN0hMcldVM0NydFA2REU2ZG1keWFRbHZ1QUxiSmxNWkpI?=
 =?utf-8?B?c0xTZ0YxMjJFQUtjL29lM3VPWmQvVWhWK1BZSTNLM2N3YVNpbnBOb1J5R2Fr?=
 =?utf-8?B?TkFoR3IwSmU4M1U4V2JuUFJoY1NsZ0d0MUdRODJaLzZ4MUdyMytmZ1RZdFZx?=
 =?utf-8?B?blZLMExZT25zaVJGTWVHZlFsbEVmMWNuVndmM1FOV1o2Sm1BV09IUlJBa1Fu?=
 =?utf-8?B?djMzMkUvelpWK1owbGk3aXdYSk12MmtTWG15KzUwQllZWGZKQUJjQ1AzVXRw?=
 =?utf-8?B?MFBpVlM4bDEvMlo0d0FUbDI0WFNXNEd4dGt5b2RUclpQMkFVSzFQemYrZ2lJ?=
 =?utf-8?B?ck5seFc0T0ZOaEY5bUhJcmQvM3hoQlFmbTZVYXRvOFFVTXVzZmU1Nnd1eTR6?=
 =?utf-8?B?SlJUbjEzQ2F3SXhlZUxvWmNybFM3UWlESklDZWNVcmcvYi9JSVdjalQ2UUpV?=
 =?utf-8?B?KzdZSWRuTzVDR0lEMnF3NTlzZVM1UGh2M2xtZFpSQ2hUVkozL210Vi82dGpX?=
 =?utf-8?B?TEFwQUhJQUNrdG5lbFBlU1IvQVM3czF0OHhWdDQrMVFSK08vTmlTanNBQXJZ?=
 =?utf-8?B?SjVEWnJHOEdIZ0lBQjZBbnpBZHZhWWhJeWRNTk1FN1dNOFhLamxod0FEQ05C?=
 =?utf-8?B?WjNKbXhjMzZzb2I1SlNQbTFpWUVLa1BkeG9IYmVqZ1REaEZGL2NhV3dJZGF2?=
 =?utf-8?B?Zmw4M2NHVmJHc2JYc1Y2VEJqQXpSL0Jvamg0SllFOTlBMUZwVTc5OVNxaWZT?=
 =?utf-8?B?UXMzdWk0V1ZzbG16M3BSRk9NenlBZXhKaG1zb09BdDVxWHF3d1NFU0VXUEtV?=
 =?utf-8?B?cGVhcHlVMmtWNlJOY1h3VTBEQTlRcE9qZGhLd2dSalJGUjFzOXpqbWdrQ3NI?=
 =?utf-8?B?YURYMFZBUTlTZ0hIVGJpaXJkWFd3Q0dNVUU0MjdLMUxlT2hTUFdyQ0U5TVVX?=
 =?utf-8?B?Tm9qb1RKQXBnVGZqN1pLTTNnMk53NWF2MEp4NzN1VnAxbXZ1eUtsUjREV1BS?=
 =?utf-8?Q?KBEyQflU/aLIM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 08:15:50.2591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab53b12-6db5-4d4e-fa23-08dc64ffeb1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
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

Now we have two flags for contiguous VRAM buffer allocation.
If the application request for AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS,
it would set the ttm place TTM_PL_FLAG_CONTIGUOUS flag in the
buffer's placement function.

This patch will change the default behaviour of the two flags.

When we set AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS
- This means contiguous is not mandatory.
- we will try to allocate the contiguous buffer. Say if the
  allocation fails, we fallback to allocate the individual pages.

When we setTTM_PL_FLAG_CONTIGUOUS
- This means contiguous allocation is mandatory.
- we are setting this in amdgpu_bo_pin_restricted() before bo validation
  and check this flag in the vram manager file.
- if this is set, we should allocate the buffer pages contiguously.
  the allocation fails, we return -ENOSPC.

v2:
  - keep the mem_flags and bo->flags check as is(Christian)
  - place the TTM_PL_FLAG_CONTIGUOUS flag setting into the
    amdgpu_bo_pin_restricted function placement range iteration
    loop(Christian)
  - rename find_pages with amdgpu_vram_mgr_calculate_pages_per_block
    (Christian)
  - Keep the kernel BO allocation as is(Christain)
  - If BO pin vram allocation failed, we need to return -ENOSPC as
    RDMA cannot work with scattered VRAM pages(Philip)

v3(Christian):
  - keep contiguous flag handling outside of pages_per_block
    calculation
  - remove the hacky implementation in contiguous flag error
    handling code

v4(Christian):
  - use any variable and return value for non-contiguous
    fallback

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   |  8 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 22 ++++++++++++++------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 492aebc44e51..c594d2a5978e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -154,8 +154,10 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		else
 			places[c].flags |= TTM_PL_FLAG_TOPDOWN;
 
-		if (flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
+		if (abo->tbo.type == ttm_bo_type_kernel &&
+		    flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
 			places[c].flags |= TTM_PL_FLAG_CONTIGUOUS;
+
 		c++;
 	}
 
@@ -965,6 +967,10 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		if (!bo->placements[i].lpfn ||
 		    (lpfn && lpfn < bo->placements[i].lpfn))
 			bo->placements[i].lpfn = lpfn;
+
+		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+		    bo->placements[i].mem_type == TTM_PL_VRAM)
+			bo->placements[i].flags |= TTM_PL_FLAG_CONTIGUOUS;
 	}
 
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index e494f5bf136a..6c30eceec896 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -469,7 +469,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (tbo->type != ttm_bo_type_kernel)
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS) {
 		pages_per_block = ~0ul;
 	} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -478,7 +478,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		/* default to 2MB */
 		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
 #endif
-		pages_per_block = max_t(uint32_t, pages_per_block,
+		pages_per_block = max_t(u32, pages_per_block,
 					tbo->page_alignment);
 	}
 
@@ -499,7 +499,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
 		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
 
 	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
@@ -518,21 +518,31 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		else
 			min_block_size = mgr->default_page_size;
 
-		BUG_ON(min_block_size < mm->chunk_size);
-
 		/* Limit maximum size to 2GiB due to SG table limitations */
 		size = min(remaining_size, 2ULL << 30);
 
 		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
-				!(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
+		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
 			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
+		BUG_ON(min_block_size < mm->chunk_size);
+
 		r = drm_buddy_alloc_blocks(mm, fpfn,
 					   lpfn,
 					   size,
 					   min_block_size,
 					   &vres->blocks,
 					   vres->flags);
+
+		if (unlikely(r == -ENOSPC) && pages_per_block == ~0ul &&
+		    !(place->flags & TTM_PL_FLAG_CONTIGUOUS)) {
+			vres->flags &= ~DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+			pages_per_block = max_t(u32, 2UL << (20UL - PAGE_SHIFT),
+						tbo->page_alignment);
+
+			continue;
+		}
+
 		if (unlikely(r))
 			goto error_free_blocks;
 
-- 
2.25.1

