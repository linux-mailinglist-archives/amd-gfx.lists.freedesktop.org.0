Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6158CA6F6
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2024 05:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7656D10E6C7;
	Tue, 21 May 2024 03:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HsyN2z9H";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489110E6C7
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2024 03:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEDxO3vUuNtfEuQGx/DasqSLzTZx1zfhZYuGVfMaEY79qkcoK8wXm4grPDP180+ScS7pt2IU6VM1/PifDP4HkB/eeOZ/+FFTHybTvVtoUYLuJgFGaEMTxRUDD8/KeaY3o5rJ/0GTDBG/eBTcNMBkW2t6WBlS4Kgu31+fzHELp+/KqDKcSM0LhxpdWHX1EOlxAmylEuKjoDf+XedNKIgk8x2J8dsFQVdfYILWY2m73a4a0YHcFhAuzOb56iEGq0W72dhWRmzKIT80J7Ta6zXnibdgBlXIF+YcRQY47RyirJdZEh+ab4zolSIm4sTZpF4UxpDNlTakW125dBcKru7JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MXYU1UkkrYFgd1MjMvNX195vV+bdwKEuQLZ7eTJR34=;
 b=GqBYCf91qWoqLpx9tB/ftW5VX/1i6phrN3DeJYVCYiWmkLe2rP0sQyvvr35I8S1o3zdQTKUcDoi/53VJSrTxObcGfDvzNXnqd+HxnboaUhn9KBtSggdgCGdbX6dLEt8psU8pjfTSr3WdIvmNRNSam3+XYV7bknjBP85jET029q5W/F5YxiUN/g3Tj6ETVJa7NMAzRTwHH/rlhnmyZ0aczYybAaAtaikyccM0XLxjkwsSbMWi7vLwJpgB2RZAQGZUGAf62mRXPczBs/74r0eqBK/ymOTcl1n/aidBbTjEFfpo5CsjBl3Y6IlYl0vIutvvb+7cisNQjZFyhr1V+iBdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MXYU1UkkrYFgd1MjMvNX195vV+bdwKEuQLZ7eTJR34=;
 b=HsyN2z9HjiQKgNcqAmjbmPLjfkuGZQvwASOLrh5dxX8jrKlOlcSLg5tWkT9mxREm1GG90Ehvl3vxfLXIL1uCdMBRKRdIZICOVaEZvo39uLtIbiM/XZO4DLpkuP7nOKqpK3xg2JXW8PujxkGmL/WG37Dyavd2OV93Uhf59Z0yd3A=
Received: from BYAPR07CA0061.namprd07.prod.outlook.com (2603:10b6:a03:60::38)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 03:24:36 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::9d) by BYAPR07CA0061.outlook.office365.com
 (2603:10b6:a03:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 03:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 03:24:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 22:24:32 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 22:24:26 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 <Tim.Huang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: fix invadate operation for umsch
Date: Tue, 21 May 2024 11:24:20 +0800
Message-ID: <20240521032420.288521-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 1466517f-de2e-456e-43f8-08dc794588fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zrh6zz2Wm3I+CK10CzQUax24HPR6jdN3F2LoW5G36hEpR3oi4xh+kEmC6M1Z?=
 =?us-ascii?Q?OwsJSurdxqwoB58MFpo116vJrlWazeFSrrWRxO3pvOULi/38EADgH56FA0DX?=
 =?us-ascii?Q?nrIXY4Q9PKo/yns8giFebT0GHt5n7J7m+o1LqmD33lq2bYTBSp3qFNVK6pCm?=
 =?us-ascii?Q?I3KvF507hxuLiTL8f6cc0abMU3OIQ6cmux9czth0k52Z2l9OB90valXxJUYs?=
 =?us-ascii?Q?nNKgB/2xIsoDlXxGE8aizALyqnZXrveJ/SY/rIPxRAKxK/7jfDFvGDENBIuu?=
 =?us-ascii?Q?lwJC2vXgE3N4hNkKsMvEY3LHSPA9hW2Xec7I7RzUvmyfeGT3O82EQFmyO1ow?=
 =?us-ascii?Q?9VC5zRakqt1QGED3zMHh2cvWGnLj34QwaZgIvGjwYlLLEa3pikGLmqzmd7SV?=
 =?us-ascii?Q?NnviIiDxXEHngJasiYEiEwX298jJ8VrYg/2Q/FDZKPH4y7HeFbndFn0lhpMw?=
 =?us-ascii?Q?XNAHSJdqYj412fhPRF704spJEBD45Aja6+q5Ea9jQavP57YhhDuzYcsKsDbY?=
 =?us-ascii?Q?wrNzqDHIhzKmG/PRK/0KGCzmKljOmrECHbqmkidV+aTsgFQoanto9vnps4xH?=
 =?us-ascii?Q?LX5nAyo77h+MkwZ8kimra4ktSl5hX3q8VmGgcI6Mvx7uv6YBdMqmXZ5svgj5?=
 =?us-ascii?Q?83K1qD6j4yiJ5nO/5aH3LQc+a0bekUNhCJ7hfSZkTYgV1g8F+PfxYWBGri5y?=
 =?us-ascii?Q?xdwOLSjM4piY+19iKXmzEAmO47RXND/kXHSoufvnN6FGgZvk0pVCWgwKTP+L?=
 =?us-ascii?Q?sD6CWef57XveMzgkbmvR0OqcMzkm11Y6QRVstF7ayiplzx0xlvZfiKAR+8ev?=
 =?us-ascii?Q?v53E/Au25BpdGo9C/Rcb+Cgkwk5gtlCNJAh7Xl9Vcum9sAOXXcEhO740sp2t?=
 =?us-ascii?Q?eSdKURHtsQtGi8LkqtEZbCkY3EyvdQOYresEbC7tHEURE6OOWs7hgprltIh3?=
 =?us-ascii?Q?1hI+NWpd9jXLlgO2qEDtf5gZ9lBQqU4QKGYED81gr9cFJxv6+ACix1vdNQ4B?=
 =?us-ascii?Q?trAd5u2bvBeX8BsMC+3DGzVLq/MrYGyyGFo1s0qsDeIvOMS80M0im3HCF5EL?=
 =?us-ascii?Q?Z6OebFYjx24gRoYJLC/2d7zC7v7v8k75/XEPHFmJkcmgWIHtQtFL4K61WCID?=
 =?us-ascii?Q?HGBLTg7OHKGRGwOa49R2crF4+Bp0cc/qAVxJf3cLKIc1vbreWpdi5gRue7dw?=
 =?us-ascii?Q?bfZevFwv/7z8zHftoRqwSccs9b8TifGsP358H5jrzCrINqNyw8WRbmT9V/5j?=
 =?us-ascii?Q?/xpf6uSPkwverHxnPx9KQ257umJf/rk6GAJX/cvr4x0QayzMO0l838mAQfTH?=
 =?us-ascii?Q?cW4khY7qe8ughV9NgOf26oHFMarXwVOdWxNVc6QSzaaTD5CGrGNa068G2L8E?=
 =?us-ascii?Q?xDezkXYCn0lvqm79ae5IwJZhMgXI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 03:24:33.5987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1466517f-de2e-456e-43f8-08dc794588fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577
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

adev->umsch_mm.data_size - 1 >> 16 >> 16 is 0 regardless of the values of its operands

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c b/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
index 2c5e7b0a73f9..880d91a654e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
@@ -117,8 +117,7 @@ static int umsch_mm_v4_0_load_microcode(struct amdgpu_umsch_mm *umsch)
 
 	WREG32_SOC15_UMSCH(regVCN_MES_LOCAL_MASK0_LO,
 		lower_32_bits(adev->umsch_mm.data_size - 1));
-	WREG32_SOC15_UMSCH(regVCN_MES_LOCAL_MASK0_HI,
-		upper_32_bits(adev->umsch_mm.data_size - 1));
+	WREG32_SOC15_UMSCH(regVCN_MES_LOCAL_MASK0_HI, 0);
 
 	data = adev->firmware.load_type == AMDGPU_FW_LOAD_PSP ?
 	       0 : adev->umsch_mm.data_fw_gpu_addr;
-- 
2.25.1

