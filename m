Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE88C5CC4
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2024 23:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ADC10E064;
	Tue, 14 May 2024 21:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SZnV+J81";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56FF10E064
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2024 21:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2nMMEwVLhP2NW1vfP1rzBQSxMXxwCJPYq4JDyI6iFjkbwXkycE6J6Z6fCRURVc39hCfPlTzlpaxJN4NkNMeu5/aTKoJ7IAIou/r9FKr1MtyBmySMoaHrfkBMQ8NSLH6VrHorWi64fltousABeKODWqVRZNqj7NR8HPZjbB0/Ni25/ot3o5oZt9CPUAT4vIfR1G5uDDS9NrBVGmO8bV4gQ2MTtFVvagwFjBQTabOyp8Bzf3LOo0XAK6pj0k+EJ5/CjfmmH0Z+Dpr4e9j3lEPfU0KhTxEJOsB88Z391VAra8vnE40PwaRfymwLSZlGgA2K7svKbj0FPFad7dsIyqOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO7ILzjhr5afdtCSeSb6g6fvb/MXMxvfl5m9pG2LDCc=;
 b=jJEVGvwYigO7cJ/2Ng1d6Q9sFHSF4qDSS12iUriUxwmGPvvtiaYyRIiDtQbuzRfXDcilMvFiz2NHRxV8zu9K/nhCxziBP5sWquf/8WxoJTy/ut4mwtgIDQBuwVho4peMKus15ilqazbQg0IqvF99r6b6ksHyIYfruW/PG/QcG1CHyqRICxKMd2F4L0fZQGJFpGVp3W/pWf2h8fYvPw960+9wY6sOOOblT+B2PLTxqNLwhK3xscolmAaPhyHKcISrC9acwlsNku0HD5eOPd77HcS6l4XlQMOFmHrIGdZgBv+WpxasGg02HsSTOuxrBt/d/efNmtFkEMsAidvbI5ba7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO7ILzjhr5afdtCSeSb6g6fvb/MXMxvfl5m9pG2LDCc=;
 b=SZnV+J818ZLKVhBOivmTvpSi1+sOTwmUCqn/x4qhnq5EIcgWPJ72nNfPGDh+cpuZah/ixKvrQ/F1+gQ2izbpt4Nw1Jw4Zv/P5b+PCSQ2iAGFkMOeHw1Mi10OddB1yqmEZErx40LTTu9VYPJDvdzTw7AAqwFncnGtZQQW+IrIVBw=
Received: from CH0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:610:74::32)
 by SJ1PR12MB6289.namprd12.prod.outlook.com (2603:10b6:a03:458::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 21:28:32 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::26) by CH0PR04CA0087.outlook.office365.com
 (2603:10b6:610:74::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 21:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 21:28:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 16:28:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>
Subject: [PATCH] drm/amdgpu: fix Kconfig for ISP v2
Date: Tue, 14 May 2024 17:28:15 -0400
Message-ID: <20240514212815.1259421-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SJ1PR12MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ad9864-06c3-4e32-7d78-08dc745ccdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yNrdsERoioc1QAUo+Me9rWca6mTWthJu6x56xPCUFydFe79dzxNgFVYepchZ?=
 =?us-ascii?Q?9WtJfSyruM6+WJu5M7aX1ZVxBL/qA7vonHSAr4VJSMOHQ+5PX9+eYoNrvRkT?=
 =?us-ascii?Q?JfO3bDVA790NbZ+D//DenUqgAzn4gA0G7gMFm/hVAH9rU3WXprSc5jRitW6/?=
 =?us-ascii?Q?dI+Latb7KsEAmd4oSLT/sIQQveAzWQMxYI8CrZdC8DxztNysYNq64QRMEHyo?=
 =?us-ascii?Q?+auqbqN8GWpiD+0PJ0o/e04l4ZWBk5moCX3pPEpbBja757hwALkH+QzB2ofz?=
 =?us-ascii?Q?I9hkvA6hOsjyFd3Vhh2p0e8nThmYo1XEBVKQUxzOEr39/aERI54tCyrE+8ox?=
 =?us-ascii?Q?39O4IbB8JlovWIRpMcYGDLtjqDs+fSwgapTD2zjh4lfyiFd0gnzmrDxrUrLO?=
 =?us-ascii?Q?6K5xpGHZbChn+DoVHk/cma7IgjXE8LqhBnbtDvH1gLqPPaUT7O5CAs39JocZ?=
 =?us-ascii?Q?sFK/jPvQMKEicU0tNFdr9ALQH8YatgrvrRo4/JJ7Gr1O81By6NqhRA0bX4QB?=
 =?us-ascii?Q?pgFDdnim6OuR9mJghfhiTPQPT5yN/z+w0Eric3MvS361gOSxHL2ZUmQAAOFz?=
 =?us-ascii?Q?c2zZVWwyKt5zVXWGxYvZOn8tjz+cKvHpt1o1Okc+YO0bLB3m6qPAZ6oDlCF1?=
 =?us-ascii?Q?zGK7sE6qiCDF+ce7sNplzLhuq35Es1hOlVAKoWyE+gyioFExHo3Aq1nmxnfo?=
 =?us-ascii?Q?lZ/FpO0Fwivi3uhKGDh8iWfzgy0HEFBEN1wQdVg49Bfq+8S4JBHqX30JZ3d0?=
 =?us-ascii?Q?M+Q4rAGbXsfxhNHmQUa2pksOhhhGjXGxyUcmQ5Lm/oEFcF7/y5F4xIKA/Qgb?=
 =?us-ascii?Q?CW1grwoKDk3BhzvKWF/bxkgRFjKMRmkfrBt8jEWNZhO3rOKpw+ylwBQY3ZzA?=
 =?us-ascii?Q?lcwKIcMNT/xlf1Ze47YAr1DVkNqdVJBtxm+9jV1WQZQEYiyQlAj5M8geTCZb?=
 =?us-ascii?Q?jw+1r/Ym3A7S61kmIq9YDcEbwsI9Cl0pIqPeBfN+S21Tt5WwoWOr+WtlQ99x?=
 =?us-ascii?Q?TYHUBgPhcAKUjJ9U2kUtLqlRkAus6zJLayPGuh3DKr25UxE4cjTHKPKDXNXg?=
 =?us-ascii?Q?mhz6+8dGFRZvM/LeqKbzotflUSYBIkZ8/wTG6lJznQbYtMJn0ZNVOKKZ+EMa?=
 =?us-ascii?Q?FHN4wbg+AzQTOiXjh+u6HlOGMAzIqCAhu7F/fcFrPEg37SazmVSYxYFxqeWz?=
 =?us-ascii?Q?A/BewSKp4oCN3X80qMntZguteZxwTo8fFw9oZm+nCc+uLvYkIQ9ljDNHrm7a?=
 =?us-ascii?Q?YQ55sosHVo2ITqSPtCeFDTLjNtMsK/0Ewrp3RVS+ob0FD8xc72VYI1ASSkUs?=
 =?us-ascii?Q?QIBHEd64NYm1crDl1sYoiLeJfJhj66s7g3TOscyGvr+SnTepOt57Gs7XBfIu?=
 =?us-ascii?Q?MDpt01AAqtfiembaAXCJnOfGQ07y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 21:28:31.8120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ad9864-06c3-4e32-7d78-08dc745ccdd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6289
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

Add new config option and set proper dependencies for ISP.

v2: add missed guards, drop separate Kconfig

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig            | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/Makefile           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |  6 ++++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef5279..0cd9d29394072 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -70,6 +70,17 @@ config DRM_AMDGPU_USERPTR
 	  This option selects CONFIG_HMM and CONFIG_HMM_MIRROR if it
 	  isn't already selected to enabled full userptr support.
 
+config DRM_AMD_ISP
+	bool "Enable AMD Image Signal Processor IP support"
+	depends on DRM_AMDGPU
+	select MFD_CORE
+	select PM_GENERIC_DOMAINS if PM
+	help
+	Choose this option to enable ISP IP support for AMD SOCs.
+	This adds the ISP (Image Signal Processor) IP driver and wires
+	it up into the amdgpu driver.  It is required for cameras
+	on APUs which utilize mipi cameras.
+
 config DRM_AMDGPU_WERROR
 	bool "Force the compiler to throw an error instead of a warning when compiling"
 	depends on DRM_AMDGPU
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 12ba76025cb7c..c95ec19a38264 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -325,6 +325,8 @@ amdgpu-y += $(AMD_DISPLAY_FILES)
 endif
 
 # add isp block
+ifneq ($(CONFIG_DRM_AMD_ISP),)
 amdgpu-y += amdgpu_isp.o
+endif
 
 obj-$(CONFIG_DRM_AMDGPU)+= amdgpu.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 846c3550fbda8..936ed3c10c884 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -113,7 +113,9 @@
 #include "amdgpu_seq64.h"
 #include "amdgpu_reg_state.h"
 #include "amdgpu_umsch_mm.h"
+#if defined(CONFIG_DRM_AMD_ISP)
 #include "amdgpu_isp.h"
+#endif
 
 #define MAX_GPU_INSTANCE		64
 
@@ -1049,8 +1051,10 @@ struct amdgpu_device {
 	/* display related functionality */
 	struct amdgpu_display_manager dm;
 
+#if defined(CONFIG_DRM_AMD_ISP)
 	/* isp */
 	struct amdgpu_isp		isp;
+#endif
 
 	/* mes */
 	bool                            enable_mes;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 378d5a5cda917..1bab8dd37d621 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -107,7 +107,9 @@
 #include "jpeg_v5_0_0.h"
 
 #include "amdgpu_vpe.h"
+#if defined(CONFIG_DRM_AMD_ISP)
 #include "amdgpu_isp.h"
+#endif
 
 #define FIRMWARE_IP_DISCOVERY "amdgpu/ip_discovery.bin"
 MODULE_FIRMWARE(FIRMWARE_IP_DISCOVERY);
@@ -712,10 +714,12 @@ static void amdgpu_discovery_read_from_harvest_table(struct amdgpu_device *adev,
 			adev->sdma.sdma_mask &=
 				~(1U << harvest_info->list[i].number_instance);
 			break;
+#if defined(CONFIG_DRM_AMD_ISP)
 		case ISP_HWID:
 			adev->isp.harvest_config |=
 				~(1U << harvest_info->list[i].number_instance);
 			break;
+#endif
 		default:
 			break;
 		}
@@ -2402,6 +2406,7 @@ static int amdgpu_discovery_set_umsch_mm_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_isp_ip_blocks(struct amdgpu_device *adev)
 {
+#if defined(CONFIG_DRM_AMD_ISP)
 	switch (amdgpu_ip_version(adev, ISP_HWIP, 0)) {
 	case IP_VERSION(4, 1, 0):
 	case IP_VERSION(4, 1, 1):
@@ -2410,6 +2415,7 @@ static int amdgpu_discovery_set_isp_ip_blocks(struct amdgpu_device *adev)
 	default:
 		break;
 	}
+#endif
 
 	return 0;
 }
-- 
2.45.0

