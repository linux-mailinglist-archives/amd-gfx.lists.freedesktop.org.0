Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7C93C60F
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2024 17:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99EF10E85C;
	Thu, 25 Jul 2024 15:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r/d4eCd6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A1410E868
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2024 15:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzROAO6TYmGQH5KagSJmIwxO5h5ez2yMFpkKfSELRvlbuxyB+8PkhVP7WUw+Z18Jaf5dWkShmo+tqZnvTDNnqJk3z3tIsC/cyKG5mTIeQcijBWr4dwL6myofvK1MEBl7GYVBdkg6nWm69VNYyZ4wDF3JAq+CKsK44kvOnn9tevitLsJyrf1qaEwGVPtwNwxnVUFuR/SXT26dA5MSEaseHKLLreDhONlPWZJzd4+Svf4YKIjHtg3RCi0dZN8MnlOrMxiJmFlHJeebzamlT+ZTPanJ9QBCBar4ahv9bz+Jbs4eOrvpWyiBB/9DP//dVoIu9j35Gcl9uJ1L/HLhETn5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jbt+rmD2CCifAThKkUuNdGgbmel1yzuJkjKVGOPYj+c=;
 b=xwjIDVJhFTHQi1CgBfEJjN1eIwd27gdZ9y7M8aw6I9mZgc6b+Id0dAzM7fueiQOKaj3uKGcKy9k/lqZF5b7Dt0M8as/3gskApolRXHEDvvDCV5maxR4kIiKk8i+0k/GliFT2Q31uB5+16c4LUjMR+3hDcOtSPOPp41PHIxdWOA6N7JNmMefGpS+jFBltZkD4Y9+fyjDyG7b/cCvyNSwUjoM9vme8CrfE4nNsi7fso5yS9cryvZZsB7CeEhdYcSB6/rXy4WrP5ZxnM/rmmxeXWQ17nDLY3vWRYNa92nVMNqeQuOk/7klh302Q4nk1zuC8sKiirTNtCfa+cd4CQWUGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jbt+rmD2CCifAThKkUuNdGgbmel1yzuJkjKVGOPYj+c=;
 b=r/d4eCd6JojC5J9A/jWwpX2IBmlB3K5fzQ9JNEfPqWqE7VRh5QoNwOibg1949OO5N25b6ybHNm3g0IG1u4BKlxMgz14Ez1yWibhVFC6WbBx2Zm9LNwK08ChaCwNlk1Bs9KuBClGjmsD5rHpaHHpmA41lekA+N4jbeqFx9fPeYMA=
Received: from PH7P220CA0110.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::21)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 15:01:30 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::7) by PH7P220CA0110.outlook.office365.com
 (2603:10b6:510:32d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Thu, 25 Jul 2024 15:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 15:01:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 10:01:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 38/53] drm/amdgpu/gfx10: per queue reset only on bare metal
Date: Thu, 25 Jul 2024 11:00:40 -0400
Message-ID: <20240725150055.1991893-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725150055.1991893-1-alexander.deucher@amd.com>
References: <20240725150055.1991893-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 243688fe-1844-4932-af87-08dcacbaaa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7bbb6bzye5rYqzw0oxHMFeAkeLPlHncBWIvKmGcGkAwA+LAD8RWJFvHx89qS?=
 =?us-ascii?Q?yGEXPJ57DzTFwWjVdNlx8jwYtLN2zF8UN7wvhxOIEyStEHtx6wuxgRmxjScI?=
 =?us-ascii?Q?xyYJpGG2v7EUq6jffBKtAkFtKNlJrXIMJu76g3wRxVV4y5eVTw54gBu51oKm?=
 =?us-ascii?Q?e5/DaUm8BdQWnDCkKuGdZrWjz27MkttogU94tSutFF8zwyZPYni1Zes12wdd?=
 =?us-ascii?Q?4oF6ctRPkaw0TXqrcIX1bqjmNWDC/RZdsM2/rROuy37xm7+BcfwdaIxSAyOS?=
 =?us-ascii?Q?CefE/o759vvQ77OdLWk6G4NRkzq75qtsWNo/G1yLdFiF/XGnEzYdmUOYlaQn?=
 =?us-ascii?Q?FAw+dwrLnitLA9X6+i894vLsLS1uUmOYxXd+KWbfe1CPIIKEFlSqhFNTsAm/?=
 =?us-ascii?Q?dDHSGPug8rIfut/tBhobFjoG8626r6uo7tIAW9WAG9hA8r0UWrpY4//tIYuW?=
 =?us-ascii?Q?uXM76Y7RUyoO+GAEVYOoILqCBUJTmPpmMtJKiq6T6MZ7VqNAn67fLoLoD782?=
 =?us-ascii?Q?lGTZTSyuOB2mVynoeHzYuofYTEnSUW0npNgqtFmB22+ZqUc3VLEIRqlfkqd5?=
 =?us-ascii?Q?ShIUwd3AjPjcLDa1ZOCm62RphiNx0xPUILFfsH6+A/nsMVDvH13iOJ5yuVMd?=
 =?us-ascii?Q?Tdj2TQ3Gg/DOpByT83L73YAjJYZC9m1VOLKf5tmdlTRUPtwbUGEWQeBCAk+x?=
 =?us-ascii?Q?hJnGO49a/iq8GTxpF2iMO1e9XBOmwrYT/pEnix28fcwqLpFbCrfJlDzOqQFf?=
 =?us-ascii?Q?POb9mnwvY693QDpKSc/658tqFwlwkyhZ9qVyGZHyD5kiwqbHcbuiWUEVhTHl?=
 =?us-ascii?Q?jfzycTS9Ol042T4EWA9j2tNqQ1PBMChH7yNRy3MNvmu0xuTnUJTRxtEDaubm?=
 =?us-ascii?Q?g9IkLkHuIyJgd3KsYXGV7BZXVfutu3cQjInGlNiNjm++EuWelPezGW1DxYB7?=
 =?us-ascii?Q?6ZMKnuOa0CLzvsHOr/75PX3NWyAv37up7vr3Y7p+H7iCrErGvxZrpP08mnZp?=
 =?us-ascii?Q?58o47JhD4oZ1xNrkJj5/2xL5L/5UzWV1WBo/eqnhrqa645Crv/qRjQertMMy?=
 =?us-ascii?Q?528aii3MvcZLrbezUOWnm/mOvmRlwAC54vdvURMKfXmgJZzMFR/PCPyVHde8?=
 =?us-ascii?Q?KgKcLyj8ynX6X9UEt10ZNGLuXQUXzvanBclSY1xberERq5LBRpnvFBIch80m?=
 =?us-ascii?Q?D5m2+c0oB/7tdistBU1YLg/9wJeHT0JO+gce4T0C+vET/sbf82HuoAI55wKk?=
 =?us-ascii?Q?SC0HIWrx8zLneE5dXtvDLnCe3gDO8m/Sba2rbBb4yGku+edFNPdV+sEM2DMu?=
 =?us-ascii?Q?jOEv3dddPCna3HrDJXaYjLddgPCxY4TlooSAryoFkd54Di3lv4uGCTIUNzpG?=
 =?us-ascii?Q?fEWz2EqRIjn5mAdNaozVMSUmWuZXVpGgEZI2mVY2OIN68AAWi6w6iTNtXnVO?=
 =?us-ascii?Q?gBIyULyZT6aGEGzRdvM55aO2uR9/1rYl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 15:01:29.6091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243688fe-1844-4932-af87-08dcacbaaa17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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

It's not supported under SR-IOV at the moment.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 0c12ea47c79a..dc4bd17b4789 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -9464,6 +9464,9 @@ static int gfx_v10_0_reset_kgq(struct amdgpu_ring *ring, unsigned int vmid)
 	u64 addr;
 	int r;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
 		return -EINVAL;
 
@@ -9527,6 +9530,9 @@ static int gfx_v10_0_reset_kcq(struct amdgpu_ring *ring,
 	unsigned long flags;
 	int i, r;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
 		return -EINVAL;
 
-- 
2.45.2

