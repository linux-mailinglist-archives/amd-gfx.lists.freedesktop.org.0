Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17B8B91C5
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2024 00:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EDA11249E;
	Wed,  1 May 2024 22:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="15PYe2Ye";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DF511249E
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2024 22:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhLVgFIxRBWbs0giek5tv4L9byyHPDs/yh47K9ujNgWbMg02eTvFbp1HvOQ0zNgzXz4sR8UXcQxQNeBQa+Kl3n5KHEHHYXNeMcY/JmCPQXi6YhxnkLP7ANy9iGHucNOilnqM7m7QtH07C1yEA+FH1SCSwoNadE/YEQ1jB+1JnZejkuWRzyNs3dLaqj9Hc2G1W4O5pprIGMJywWj8h1+GenyXHh480OJAQG2um8NpUr0rOmdHk97dF8KGkYwBZPjMBzELHssnjk46bOJeX1WkzeXQhzCIjsICrev3nHPbf24q2/6r6DUmzIbkm657shjMscGZRu69VOE+nLLhV3c3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gAqrE5xNWdw3p0W3OaS0v29CCgrqpgyQ+Pu4N0oZJU=;
 b=N2gIv+k3Qh+O0RYLgA3/C2piZdvsauZlkEdT8CA0MP6S6LqmC+MNtXcOLyD0ic0XZ7ee7AiKpDeWu7MvfuK1SGywlc6D9RnMappnzwr9rdX+5QWJ3U7PkXugYiDqbNjeJMN90XyS9KbWp+fXYJ+YLx1E4z/eCdoRy+yC7JhTRO9Kd6a1tkvuLtvNd4dtxws+sabNnPb7M6fKSzR8VAfzeUxzETpXfZQv6rwLz4Bj20wVS7piUylUAR31+Dig6uG37hfO9xu+yoM2lGKYVhHylClxUkmzzCGSkuZ00vFKmJpBr1y1ZomZ7W28FcinZPRmbhGqSKWcczL4h4XeGogKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gAqrE5xNWdw3p0W3OaS0v29CCgrqpgyQ+Pu4N0oZJU=;
 b=15PYe2YeLKlHU4aAY1Y56zMEvJnKf7Zf4N4WXHARfycRg8iDFpQQqoG89sSVjVktM2yMcj6408sZUlRW6lj7Vl5p39X1IDzn74xpzZyWJNtFzwz5Xw8lpfmRDWtugtXoUVjAF8g1nBJFzu+olOiN5kb+WUmRLkzyn1IbG9ILyY0=
Received: from BN9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::35)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 22:57:13 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::ce) by BN9P223CA0030.outlook.office365.com
 (2603:10b6:408:10b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.24 via Frontend
 Transport; Wed, 1 May 2024 22:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 1 May 2024 22:57:13 +0000
Received: from Philip-Dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 1 May
 2024 17:57:12 -0500
From: Philip Yang <Philip.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Felix.Kuehling@amd.com>, <christian.koenig@amd.com>, Philip Yang
 <Philip.Yang@amd.com>
Subject: [PATCH] drm/amdkfd: Remove arbitrary timeout for hmm_range_fault
Date: Wed, 1 May 2024 18:56:55 -0400
Message-ID: <20240501225655.5215-1-Philip.Yang@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CY5PR12MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: fff3624b-bb47-4287-7044-08dc6a320a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400014|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?faol1tzD3Gq0EZjlA3+k8oiEIXtqAFZNdZ0OpD/LkRzF37qDx+CBrRhBBreC?=
 =?us-ascii?Q?dRsV0GYaDiNOo9EjNPya+kXkkGMSuUP6I27c2vTgrMNprk2qgtGWsVG6ULfO?=
 =?us-ascii?Q?cFGvuWmchYFQOWGN2PYZ+txX9jY1v+glwk3mHe42/2B9uKZpvn3aUqzNH89z?=
 =?us-ascii?Q?2WO+469F+Io5r2e3F36Ze4UisdDepfcGQrKe0Tfgi75BeUGMhNVPcukM6RpR?=
 =?us-ascii?Q?oT8eOlLu/HCChieHnd8AVtX76rStxdmNZw6kuW2+u4+/dgAlX5+I1bt+j7bk?=
 =?us-ascii?Q?C/37M4idzfBLwEy+D2hzNrr/XhrdE8MXxVKb/+GXhRHyipjubTHkDonlVD4c?=
 =?us-ascii?Q?BVDKwo2A+SZ1OfD7NdT3PSZTHgXIs/0P8KMFk/iE04otxBVS4HtgSrBHqsnZ?=
 =?us-ascii?Q?itj6PIx4SMxYbMzP4T211ykYPxHkOIVYMykctKsb3x00KYUzQswh13cKidNX?=
 =?us-ascii?Q?XWCQACcrvVVjqEzkBkEXllxsytRzx3mMiJIpjmtICjIPcAr96TVcYOXX1pMm?=
 =?us-ascii?Q?f0n5CRNqstYXEKc/j6c3ff8ud8jXhzqrFN3ZD2fB20+SD/JzMMn+KlxijI9I?=
 =?us-ascii?Q?3EdesM2L556cv+xCGoXUusZ6gMVHBmAUqgcD1fZUFYn5iHIChrceavoj1FyB?=
 =?us-ascii?Q?HSP61B8k5pbsCbrHPGeI0TCejI4aqOQ8BnUPYE8RK9EPPZ4IavDwM+2IHfaQ?=
 =?us-ascii?Q?z5LJfUsdMyxhZHl/9vjkthWipcDX/3m3K/MsvQISpNn5Fdz9sSrJGuDUgZKQ?=
 =?us-ascii?Q?IA0Dz0gQX5bse9ktO2vSF9Ufaxi1Iy3/iCAT2aNcZowVrg9KrW1u1cjeIaH0?=
 =?us-ascii?Q?9/uyoRg4SCS07s/xvVWnJ2pslHg3XGhlLgOY2+EOq8HFf0E1qRGjDLaoX/Ir?=
 =?us-ascii?Q?4/GD8UJsOG3x6zhhGIsHl7UlbVvj6N5aETZpm6FFkiFbvf6UaHEAG2VHeZr5?=
 =?us-ascii?Q?TKalWKnrR3T7KXbPnd31otOzSIyeg28BSvvUAEYXnXN7+FLGo/lfW1D07WKb?=
 =?us-ascii?Q?nBSisx2zaloVZU3Q/aTf0OevmzDyZBVwIxnkc96G1uL0aDJmvDe2DYIIc7AZ?=
 =?us-ascii?Q?+ksD3JtqHFJmzYCuhGTNx+v1Uc9Jh3Fl3zs1Yb8Qtyk59BGknLQpaguZA6G+?=
 =?us-ascii?Q?u+QJqdR7UwvIorFjHPfyK+5i+SwGurbTZOPSi69Apjz5WsKh4pbZoFDFplqc?=
 =?us-ascii?Q?fOy6gRmzuv3vcZj686efNWUpNSCWp9uECtIXYmmxkQvcrIWz1/5aUeQG7FuP?=
 =?us-ascii?Q?n50FgLcPDNqHsPhyClI1JouMFmGyzNOXv+/p6RWxvf9pgGkeZpvsBEoZB74U?=
 =?us-ascii?Q?G65jGEAZdtqHyzFbS06jUd2Jixv6IuHzq8Rms/blX0rNBNF+FkIatjhTm1mk?=
 =?us-ascii?Q?WeIg7/edSNdXn789H3e2yTOk71UR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 22:57:13.0171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff3624b-bb47-4287-7044-08dc6a320a21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202
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

On system with khugepaged enabled and user cases with THP buffer, the
hmm_range_fault may takes > 15 seconds to return -EBUSY, the arbitrary
timeout value is not accurate, cause memory allocation failure.

Remove the arbitrary timeout value, return EAGAIN to application if
hmm_range_fault return EBUSY, then userspace libdrm and Thunk will call
ioctl again.

Change EAGAIN to debug message as this is not error.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c          | 12 +++---------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c             |  5 +----
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 54198c3928c7..02696c2102f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1087,7 +1087,10 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
 
 	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages, &range);
 	if (ret) {
-		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
+		if (ret == -EAGAIN)
+			pr_debug("Failed to get user pages, try again\n");
+		else
+			pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
 		goto unregister_out;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
index 431ec72655ec..e36fede7f74c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
@@ -202,20 +202,12 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 		pr_debug("hmm range: start = 0x%lx, end = 0x%lx",
 			hmm_range->start, hmm_range->end);
 
-		/* Assuming 64MB takes maximum 1 second to fault page address */
-		timeout = max((hmm_range->end - hmm_range->start) >> 26, 1UL);
-		timeout *= HMM_RANGE_DEFAULT_TIMEOUT;
-		timeout = jiffies + msecs_to_jiffies(timeout);
+		timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
 		hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
 		r = hmm_range_fault(hmm_range);
 		if (unlikely(r)) {
-			schedule();
-			/*
-			 * FIXME: This timeout should encompass the retry from
-			 * mmu_interval_read_retry() as well.
-			 */
 			if (r == -EBUSY && !time_after(jiffies, timeout))
 				goto retry;
 			goto out_free_pfns;
@@ -247,6 +239,8 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 out_free_range:
 	kfree(hmm_range);
 
+	if (r == -EBUSY)
+		r = -EAGAIN;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 94f83be2232d..e7040f809f33 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1670,11 +1670,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 						       readonly, owner, NULL,
 						       &hmm_range);
 			WRITE_ONCE(p->svms.faulting_task, NULL);
-			if (r) {
+			if (r)
 				pr_debug("failed %d to get svm range pages\n", r);
-				if (r == -EBUSY)
-					r = -EAGAIN;
-			}
 		} else {
 			r = -EFAULT;
 		}
-- 
2.43.2

