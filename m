Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E628AE3E5
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Apr 2024 13:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC9D10FBF2;
	Tue, 23 Apr 2024 11:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nv02WuFD";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3C310FBE5
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Apr 2024 11:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo35e9Y4uHBQv8X+VhgLstblVQ0BmgYDr6/2RsbGfZ9H6oZNzqu9uSoX0Eld0CKcKqT4L13FksNmaNBYfLJaZA/WE/+D788Su6kZyEYTlV+ZWn2sP4G23QcFGf6FaYDty48Ckj6fiCgayVwLoQe9JPhJi7qM0hvHi4bmyXc8Oy3NQokxz0bDRgeLzHXrh7v86QdLXM+tlPsR4+ksJpkEV1vMQzg9lPAZNsvQwmQ8PGsZFcNGdPSfXwzQrBy97CbIDYrvszbphuCNnkEH7Yz2jsSOPofUDxLldLp0NF35hJkP+dFrLoZw/8iyriz28vE+tP9kEf0ZH+RCTbXdbzrIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS0bqz7Q9ia49XWM9j4HeXyUqu57FkPnSnbCY0Vp+TE=;
 b=cHTMlDDI3MWjL30zNdHUi4uU8rYq93AzikJ3q1VqZgWdTC9H/rehvsWCpejhntPBoMlWBJoBKpMghncqxC1wj62mSMZtRUgHiIMplZ0uz15S0hxFcYNvfUlPxauST632gusFBEO2fwHVnJrWig5PFeU8O3ws1o6daQsuUjdRKbF9+tAgRnsaPuLvdac0hBmJ5knH4Bda/b+4EewO5+XG1HKlRscd+m/n2lh8H8EmYRpb+je4q1eBdgyohERS64Ih6cpZVNH4pkaLDWQ28hT2u8tqgXgOeIk/43i0GNoa8ttPEBAQHfhnoqvFrQyMWDzpXgFevJ+vz/e8AIOyPzJbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS0bqz7Q9ia49XWM9j4HeXyUqu57FkPnSnbCY0Vp+TE=;
 b=Nv02WuFD2WDZsqvckbeFTd0g4mXZ6WwvmxnES8OwSNOpuwMXw9YGY4fHy+HYUMUeFq006Yz3J1+QtMlV23mwPaHRh2DCB849JyqRALHaivZpCZx2i+93vYOCApV50Qj1M9PE1Xd0BM5Tf5VjrscdkwoJ/k5vFEqRAsSTo6ZJtWc=
Received: from SN6PR04CA0103.namprd04.prod.outlook.com (2603:10b6:805:f2::44)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 11:28:27 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::fd) by SN6PR04CA0103.outlook.office365.com
 (2603:10b6:805:f2::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Tue, 23 Apr 2024 11:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 11:28:26 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 06:28:23 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>,
 <mukul.joshi@amd.com>, <Jonathan.Kim@amd.com>, <charpoag@amd.com>,
 <donald.cheung@amd.com>, <david.yatsin@amd.com>, <jatchaud@amd.com>,
 <wenkai.du@amd.com>
Subject: [PATCH] Revert "drm/amdkfd: Add partition id field to location_id"
Date: Tue, 23 Apr 2024 16:58:03 +0530
Message-ID: <20240423112803.231769-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4e9230-8d3b-49a1-24c6-08dc63887e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+L9csUFAwbZDhG1xXZewEEd5LFtI6arOfRLULqtCPDk0jIz/6d9//bzjo/PA?=
 =?us-ascii?Q?n+LKRpEazbfpLmsfuszKUIcjMzsTwb2CKsj+RegxEzoBxR7+83seuBigCcf3?=
 =?us-ascii?Q?dSjIMTnNNmINpzK3DezUB33WOMJ6/5iIZYZTmdHaR+BGsp/4gbYUOnNkKtJL?=
 =?us-ascii?Q?tZmRUXzPUvWaZtpGNPfRmYb7y+MkQZMuGVKkpjqlAB9TdGtHfSQi6AYj6nDD?=
 =?us-ascii?Q?eDg+M5jy2lj9NX5bX0DIOfhCbhCwjxSlNVKuYui/4UzcGovQjHXQPXsatctD?=
 =?us-ascii?Q?Yz01Us2QezN/YfpiK93mnNThfeedKvgMPXJKTE09+030hzo4TAlaKv6NQdOI?=
 =?us-ascii?Q?QWxnkO2tSh0OwoyBeuS5X2KDxE7p6bJJpoOmCwPEtsSHM/8LPWgCQQ1IKEhi?=
 =?us-ascii?Q?ZFLu7CXHxeoggWcWp2WMK2b9lZR0zLhuCtYZMpuXIlmU8uBZd3CzRR3X4hRL?=
 =?us-ascii?Q?UYnvy/zu4qaqx0zi8mSN/CjuOusW76cyTHQ+kqSw6lBPzxFXA3JGp3JpczWU?=
 =?us-ascii?Q?0mwjeUMmXLJ00p998H6xSj+P4fSLgijSJj/JUWR3w/WtjXriePIE7RXAh9Em?=
 =?us-ascii?Q?NQdLyPnQh4y9zkW3d6Av7wPrWvWPAqbCW0DdVenTmnlSzOZexoWqzVsm8dnA?=
 =?us-ascii?Q?R02xzBaB3Y1ZlxmzNcH6jZODKoF9oAL/m9hQynnYAGrSzamQMbKaYIMc79T3?=
 =?us-ascii?Q?PFn7jAZ1CkuETGxp3XbwuPTUp5vfkVP/RcQ+02O7tbM/c8BgIgOekFAYUaXC?=
 =?us-ascii?Q?ojqwAu52Ln3FU9sClKGyo69yUGUxbIF+aN9qrPoF8N/9I4XORJADit/w4d5D?=
 =?us-ascii?Q?nBmqzPiD0TqNmS0TI/oRr7TO3kcuOIRGFGudieaCglxyOxH/LdL9n8ZlsKJE?=
 =?us-ascii?Q?aC7FpmkmQwe2LP/ppmyj6vDfguKtV95BkvJklUrTOoHIs1+XzQpeBIhKqFCT?=
 =?us-ascii?Q?r+1gfCvg7Hqv69yXpa+oFS3jJzePzYzcxtUoQKPgJJCSiHdoUWns4ZP0r0yO?=
 =?us-ascii?Q?aNwFuRDOIgkTVoYlXTgsAJLlO7g8kZS0rppW/AM7SRroy3jTduispcFZNMR2?=
 =?us-ascii?Q?ImHwBTOT25QUbEp7+d0GLSMFOp4ZegsyqdMS7ZWlsaohtPpdPauLvWsykc8N?=
 =?us-ascii?Q?t3hLgAXIO7XrLWTYTxKl7Og71P2VZ13LcbQcoLiQUC9mZH35nRh4aB+vKZJc?=
 =?us-ascii?Q?gBfOTcOw2a5dTp9hb4t/+aCn8OHa5hMfV3V3zM2c4slQYImfoWWz954nxgfY?=
 =?us-ascii?Q?Al1tm8iXMu28tHsK810ReHulCh0jPIsA8e76kWjwWB7vXjPfnCXj5Z+PprMd?=
 =?us-ascii?Q?GhJzxuBgMNc5Z9vjXpad6xGml1x4bcYI8Vm3oZccTdO9G8gTb5tHQN1bpEm2?=
 =?us-ascii?Q?kDpXZ1Sgww2YBFghydJtuAErgcfZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 11:28:26.8303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4e9230-8d3b-49a1-24c6-08dc63887e82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
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

This reverts commit 925c7bd1d1cf9f173b22603c8bd4816d142d4935.

RCCL library is currently not treating spatial partitions differently,
hence this change is causing issues. Revert temporarily till RCCL
implementation is ready for spatial partitions.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index c51f131eaa2f..bc9eb847ecfe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1997,9 +1997,8 @@ int kfd_topology_add_device(struct kfd_node *gpu)
 			HSA_CAP_ASIC_REVISION_MASK);
 
 	dev->node_props.location_id = pci_dev_id(gpu->adev->pdev);
-	/* On multi-partition nodes, node id = location_id[31:28] */
-	if (gpu->kfd->num_nodes > 1)
-		dev->node_props.location_id |= (dev->gpu->node_id << 28);
+	if (KFD_GC_VERSION(dev->gpu->kfd) == IP_VERSION(9, 4, 3))
+		dev->node_props.location_id |= dev->gpu->node_id;
 
 	dev->node_props.domain = pci_domain_nr(gpu->adev->pdev->bus);
 	dev->node_props.max_engine_clk_fcompute =
-- 
2.25.1

