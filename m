Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14298AE75A
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Apr 2024 15:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984E11339D;
	Tue, 23 Apr 2024 13:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EzDevPSJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7D11339D
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Apr 2024 13:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7IFhQmZUd4k2u9iuwLEKt5KJxgqrt7mchYLtu4dkDfEkccv4M0ObpKDhslbAdgZoTuFWPuZ3fTs6YJ3MFtzTPtMuV47ivjONBrBjVp7zTHAEXcp2X6H+6wFapE+6OZTl0gtalbZM90FFQkU2odneTWg8Fr6PzU49Wn6gDwKazp1gaCJcX0VIOgvWxE0H7Nf1F9K3YUZYULkM2HWqPvbYXURQwQ8WQ6JD//QREA+xhGKM3QrAj3nj5XNy1m2vW2KxA/D/Iccz8Uzsb+svyenegiarNd6JwQHdsstaxW30ZLBSjnSLwGry1dtIJ+iqn3xw1yDulxZb8kUMild4ezA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNyivYZjs+d0o4kKHOMxxaDoAsYg4wV6QpeEhW+6eXM=;
 b=BbovpktMGnmDtGFHkzFLAC48XyJ7k3AbwbV76geAiJ7H2Anrtsednak0Pe9W4XiPN25GgGKOHslCMSPOkiAHSib2Mcg65McOD99HPqy/wM8gp39Qq+A2RdhNPuYu0OB0Jvbp3YNlpihFzZhZBvD3Y19eyoZdkmddJDukb5wmvk0MrPRemuG08N5edcv3a4icRRmE5KyiwLje6usFlGfBW3JAiKzJ7eOqcTjcUekkCMeCSMhX/mBkT+RfGizKOzD5sJFQFKeG6dCcfQ+VjVS2aq09hOEGNol0cctpf6l249msQ8wPsfCj/Xl7vmulyHxqfPlEmdFpsEqPe5Jzq7FVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNyivYZjs+d0o4kKHOMxxaDoAsYg4wV6QpeEhW+6eXM=;
 b=EzDevPSJukdbA/7uYLQ+eIT1z23to+Hl3P8htIUdEAK//1iO1/+e7wSzWql/8+tlXhKb4Wv5MJyQeK4cv+qQVBj1XjpjTYl9a2ySuaChahyzfACU9awRVjlvifiKEBdipMrvpqZvV8d0FyxpCP9q1veQmhAVxehCMRIfoKlL75A=
Received: from CH2PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610::33) by
 DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 13:05:49 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::c9) by CH2PR05CA0020.outlook.office365.com
 (2603:10b6:610::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Tue, 23 Apr 2024 13:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 23 Apr 2024 13:05:48 +0000
Received: from Philip-Dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 08:05:41 -0500
From: Philip Yang <Philip.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Felix.Kuehling@amd.com>, <christian.koenig@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, Philip Yang <Philip.Yang@amd.com>
Subject: [PATCH v4 4/7] drm/amdkfd: Evict BO itself for contiguous allocation
Date: Tue, 23 Apr 2024 09:04:47 -0400
Message-ID: <20240423130450.25200-5-Philip.Yang@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423130450.25200-1-Philip.Yang@amd.com>
References: <20240423130450.25200-1-Philip.Yang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 101d0d1e-66ac-4014-f8f0-08dc639618ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gD7nXtbmLd+LSv9q4WCv1SH7pawGtnnJi8KACC/bbzeI1KS1T6Nvj+XjmGUH?=
 =?us-ascii?Q?Djx85Czj7O6MchsUi/jcxhiterTlDQBnXQ18hz+h7/hNctZWoRhTbH8efC7W?=
 =?us-ascii?Q?n9os+EkPMh9D7QuJa7Q94oujkGOt60hNIwjMfgXuDwTQehJj8p0JYXA/K4eh?=
 =?us-ascii?Q?69ZUIuS8ArVLNn7DngHbO3V9/ZTf3IqME3RZ+aT2YI24Yd+sCwvvsSt4QSNR?=
 =?us-ascii?Q?zzVSh9EtoD4znSoKE8XdiNSygoQ7x9gU2UJmi6eQ4LBIDW8B+Gsf9A2Rnvm0?=
 =?us-ascii?Q?QqqJGbP/df1CdTvjO4a1ahgmNb7N/SS2gT/CEyR0UvPP6RQ/XoFM6q+i5F1K?=
 =?us-ascii?Q?YzNOApF8urxxiJ8QDauSairETiQL4NOan+wMojx3lftk1sh6glkaC5mZnfAr?=
 =?us-ascii?Q?VcgTQbHSUnjGCurysK1TZyWVX5BUqPOX+6nmO1t4OVrde/WrG/IlXCfsil+V?=
 =?us-ascii?Q?f3z9s9z+LwdS5GUj+qleMMKpZZQyVCEjU2RngzHBiMJpmE4/MnfqrMxQiQ46?=
 =?us-ascii?Q?Kk4RAeyiqk9OD369c/nu4I8XDxuKe2JK3R7Hcb+RJ6cwE4ahz18Vx5jUi9cH?=
 =?us-ascii?Q?vwGETocuczuch7ONH5Xd2ns5YKEA9F4YsW/tW3OyPmFgw6DCBHvUMPAKXgcY?=
 =?us-ascii?Q?T0ZKw73hkpej/MDOWOC4/8rkh8ML9XLNKlAlQEgTuPZf59sBIKQlnNB+S5yu?=
 =?us-ascii?Q?cAx9ppgRzavL7ho5aFk7KO/MPAnEZOzvPg8wQGbTcSzF8MErZABZbc4vgEYG?=
 =?us-ascii?Q?LBacTTp2nQJ8OIAPajI9XYrfI+yEuw2xvM/ep3kpRpatLd/c/JsDSSC6Q9JI?=
 =?us-ascii?Q?qkOAt7H5NQf54c6NN2lQioU/QxMLdO3twgAMZdVbR8HXCMtLkFHSDbSV+M4q?=
 =?us-ascii?Q?Nj260Rb9lzago0qmKPlcz5onAhHjdfFVDX/rAoquf65lNnCi8QnzD4swrPDz?=
 =?us-ascii?Q?Vkjor9LKJ4r2inAr/TG/gsQQaoP8bTCsb2j1j7mH1n8uBBnCZpNImNjjxIo5?=
 =?us-ascii?Q?hPXP75aXZMTjbL9GNVXTYdQUjmGBv8fcNZFXjiuaWmawB0t46Ggb59qqm1Zk?=
 =?us-ascii?Q?G+4kT118aSX6okdDmaVRqNfrfG6m+8F2tXWzu/WNLXsRWR0jGD9wMQ5hdHyx?=
 =?us-ascii?Q?UWGZMQxAHzjN4HfRqRZ9oKSXNBUCFdcNEZ5wDZG79Lcu5VRgshR+4yMhwMOV?=
 =?us-ascii?Q?SK6bV1W43qAYcjevkf+JuBtPX93VBWZ4ZDgb1hBc2bWU8Ipmq3s0LvWouNEy?=
 =?us-ascii?Q?K7wO9fRuXIy3Wsd4eM3PW5c5b2Pai9XpEsOCp4nYQUYZjuIQjqbpeXQf7j2e?=
 =?us-ascii?Q?8KVnm/1GGeSdRV7kAKfsBwfe6tkuqhxRDwzkmkca75jnnAuNZFN6zp2k3OrS?=
 =?us-ascii?Q?qOIcy3NtaRdBAfs+Snwdkhu07Pys?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:05:48.9376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 101d0d1e-66ac-4014-f8f0-08dc639618ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
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

If the BO pages pinned for RDMA is not contiguous on VRAM, evict it to
system memory first to free the VRAM space, then allocate contiguous
VRAM space, and then move it from system memory back to VRAM.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index ef9154043757..5d118e5580ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1470,13 +1470,27 @@ static int amdgpu_amdkfd_gpuvm_pin_bo(struct amdgpu_bo *bo, u32 domain)
 	if (unlikely(ret))
 		return ret;
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS) {
+		/*
+		 * If bo is not contiguous on VRAM, move to system memory first to ensure
+		 * we can get contiguous VRAM space after evicting other BOs.
+		 */
+		if (!(bo->tbo.resource->placement & TTM_PL_FLAG_CONTIGUOUS)) {
+			ret = amdgpu_amdkfd_bo_validate(bo, AMDGPU_GEM_DOMAIN_GTT, false);
+			if (unlikely(ret)) {
+				pr_debug("validate bo 0x%p to GTT failed %d\n", &bo->tbo, ret);
+				goto out;
+			}
+		}
+	}
+
 	ret = amdgpu_bo_pin_restricted(bo, domain, 0, 0);
 	if (ret)
 		pr_err("Error in Pinning BO to domain: %d\n", domain);
 
 	amdgpu_bo_sync_wait(bo, AMDGPU_FENCE_OWNER_KFD, false);
+out:
 	amdgpu_bo_unreserve(bo);
-
 	return ret;
 }
 
-- 
2.43.2

