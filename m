Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF09E5D64
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Dec 2024 18:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E41210EF3D;
	Thu,  5 Dec 2024 17:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aPd7dG/L";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83D10E5B5
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Dec 2024 17:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQjsonex0oodwZSMegQ9TXBBVjplBtcWBOH5AXHf57NXYh7LmyCG5J7DGcCdOWCkGE2R4eYwikyZDPzfNUR+YO7BorqeCgrKoaKL5/ORRt4QPRSVMWcpNEoRxQA99fcfDVCn6cfmDyFkPLoOWgeFEikCCOjTEr9u7147Yeff0gnz7YfMj6xzZQ6ueOkQnqKr9jifYQZkknSeg+5FCXu56MygVjx2TZQYZEeRSwdy2QQGvvcOIoog2em5OMTdNSh3DFjAXPDgjP77QQ1gpYSghdM8ZUFC0vrxPCyp2ukCXSEXkgGID5fI00hHYcXXBp1Ga9sHaneD81Er/2kRlMHfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5ghHFoiPdcZmN41BM5rQu6D67GsWk/c5G6CtNeqil4=;
 b=uiY9ff92OZVBTFrjU0uL18XoAXB+vv4XXkMYJOhbRao6by6a6nzgHVQ1BvFNxSVckUucjig6lj9ohmdvcJypQ92TlRqQpppMCsuY4/ANsqh8P7Bdz/JyyTE0EZjodgnXUlsS1gxrEdmyOZj9nCmbTMxO3ueqjSfbE49QR11u+9kvFw40Uw7hlQr20p3gKx1KUcujrQxYuhLnrzF43b6MfWecu4dnhqfIWka/20Wg4e69To+tDXjl+s47b1/FPVhhyJhRpFYUKOGEN0KZ/19wZwzukags/nQuOfO3A/fFCG8UXHrnTbZZQuyd90pyPue7uB5OCEjVc2/e4iUSqV/ikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5ghHFoiPdcZmN41BM5rQu6D67GsWk/c5G6CtNeqil4=;
 b=aPd7dG/LqGAjTdg9wwOQWfTSPU36Iv/Upb6/BQmPsC73X0ADgsplCEH/CcI1DvBKicZFyyUZrsB9c1qzF6w3heq6YoAaywiDQQ8WOejElJUTEvgn08T35C83WB285IWy/b7+hyqj5DjjPs3rlkjixUnQVKfsZByjo6PR6yJww10=
Received: from BN9PR03CA0459.namprd03.prod.outlook.com (2603:10b6:408:139::14)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 17:36:31 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::72) by BN9PR03CA0459.outlook.office365.com
 (2603:10b6:408:139::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Thu,
 5 Dec 2024 17:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 17:36:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 11:36:29 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Sonny Jiang <sonjiang@amd.com>, Leo Liu <leo.liu@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH 10/10] drm/amdgpu: Enable VCN_5_0_1 IP block
Date: Thu, 5 Dec 2024 12:36:10 -0500
Message-ID: <20241205173610.334358-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205173610.334358-1-alexander.deucher@amd.com>
References: <20241205173610.334358-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 566aff96-a325-443e-84c3-08dd15535b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V45G1ped1l2kK4c/5C/FkhyAuUF4KM9p85d38fQflR1F7b0jUH94PM4JanNm?=
 =?us-ascii?Q?qe/zkpx5+5vGBuxtDrq6FajICdP3qKdZL3JhZeAINZDuqWjZcluZqFOPrKuu?=
 =?us-ascii?Q?iROP34jGi9QRgip8h4HE8d3h/TlhB3ayWvQrJJonc0k5n13kHMirgg8n77Ab?=
 =?us-ascii?Q?h+pkkVS7Y9Oc3q5ecK72N2s/8KT4ioBOrImv8aGmtpG8kV1OLpGiMRkACRWz?=
 =?us-ascii?Q?5+W8+c3jTGJ8AdBLMqQw1A69tAN7pXtam4Pb/yuZbZQUIyI0Slwrv8y9VUbT?=
 =?us-ascii?Q?Mx4qyBh3pB6JmOyoNJ8bmOWwFQ6w6E/P3RfTAOpZwa+wUU4KL6BZtv3EtVRF?=
 =?us-ascii?Q?JIoO+uTAZF6j/KZceOMEGgzNj6Ul0vZRRnRNw5l5t+ke7MoezhVPPmnNg+pi?=
 =?us-ascii?Q?QMb1EMcytaMsvU8BdcjXXTGsrhRUdjTGSykXPVI7LjqXbYe+WpEq08dYy+im?=
 =?us-ascii?Q?4m/zqU8WRjOPE+e4W2dDNnIsek8mB7ktT1MJt0Q6UwcLBFA30z//g+guAuA2?=
 =?us-ascii?Q?YE8Mr1SJWSbgbVBlUA8ACOCEwVl6BzwuaaMnKj98nFsg350TezFyMhiSVVfX?=
 =?us-ascii?Q?SuMeuZQr9wHQfpOIx7MxlLJAwc5BZsOkDyygwLy0wJG31+q/iuDB+SxYI6CK?=
 =?us-ascii?Q?2NUygmeonOeW2+BwhnkPDHhTsz620DIQCfJbke7sajbwueKEB8JEHsP/W4IL?=
 =?us-ascii?Q?Tk2ot9Bf4Cc44JC80WtmGhNiFgFPHOqotvhCV8vYpIhqerMa9C6fg2pHxE30?=
 =?us-ascii?Q?sMD3LUG53g09xGuRZzevS50o2BQx4lCJJluovEQuPlPxKPsvcMiZP+793ugp?=
 =?us-ascii?Q?0SslPan203pCq5JRZTnXu8waX/iJRg+W3kA8jS+nByZ6GviUZa9n8Wh6be+I?=
 =?us-ascii?Q?GBlAumbiZYQlopB5v4yICwUs0J3en5zkcfQ6sVCLjn+JDnOgR1r+U8LJueGc?=
 =?us-ascii?Q?ZEPzFdPZQUCuKKFJUzppp+GtJg7jjxQLJo+eveeIQJ7pC+IteJFMLVC/YPKA?=
 =?us-ascii?Q?F0d/MVrG+tlDl5J2qrXPsnDKrldDLm81ncBtGQufe1ZGjNH9R08KAQsbxepx?=
 =?us-ascii?Q?v6HJqgbpjYjWjGru85V902xYfxn6N7Sk7Kmwaif45QDv778f3Nh1yamDiwsF?=
 =?us-ascii?Q?RKakc0QPU0s2cg/8uWnkKT8ZTJzNrlIVWqc2qYy+3ruzv57W9o57xkkWfx6a?=
 =?us-ascii?Q?iufuQDriBigIzAVNQDfLu+feBrteiDdXakdGl8AlgsbV+GX6ZGwQJ0WTvrTB?=
 =?us-ascii?Q?auaN4Ls6J0QRw7SzlbezdSf4sb4ZDfGVyMvIgkWgYrs7JVXIVjoFR+d5+vYG?=
 =?us-ascii?Q?3IMcaT1dExOGGr0vX0NdfGeBGwQnKZLNTWJIvvYRBjsLWGE4hi4u4kR8zJBq?=
 =?us-ascii?Q?ss9Bboboqj3ol98RwjssATnycjwBWeI0TGQj1HOFQI0YyZQ3WEMJe0YOiM0G?=
 =?us-ascii?Q?U3lj0kKDZ/ddT3D4SACyH6+is0C7QRtN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 17:36:30.8991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566aff96-a325-443e-84c3-08dd15535b01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753
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

From: Sonny Jiang <sonjiang@amd.com>

Add VCN_5_0_1 IP block to kernel boot

Signed-off-by: Sonny Jiang <sonjiang@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 60c36cc4adb12..949d74eff2946 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1,5 +1,5 @@
 /*
- * Copyright 2018 Advanced Micro Devices, Inc.
+ * Copyright 2018-2024 Advanced Micro Devices, Inc. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -104,6 +104,7 @@
 #include "smuio_v13_0_6.h"
 #include "smuio_v14_0_2.h"
 #include "vcn_v5_0_0.h"
+#include "vcn_v5_0_1.h"
 #include "jpeg_v5_0_0.h"
 #include "jpeg_v5_0_1.h"
 
@@ -2368,6 +2369,7 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &jpeg_v5_0_0_ip_block);
 			break;
 		case IP_VERSION(5, 0, 1):
+			amdgpu_device_ip_block_add(adev, &vcn_v5_0_1_ip_block);
 			amdgpu_device_ip_block_add(adev, &jpeg_v5_0_1_ip_block);
 			break;
 		default:
-- 
2.47.0

