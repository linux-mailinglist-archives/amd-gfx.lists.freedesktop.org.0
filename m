Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C176A8C1581
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2024 21:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4959310F195;
	Thu,  9 May 2024 19:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wJGe6aAv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74A310F195
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2024 19:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8urARJFETQrLRjHwYkcrAcAUsfD4JHm4CghOULqH0TB/i4lgcGj/9Itj7A99CCQghYsReE22Nn1bV5gdEMvIlDFaOZ7/SxJJwmfRVsA17W8ybTFTsGUHX42OzX2gZBJwKINHzgAaJ+71I1aMz3nmk0kCWbTmgn905h+m2cWb/On47JPoDj4i3k0loZ5DIY3yceFuAhjKKmjZtjzObzQFHKqxcv+sk+f9qr4eKAvI+rsf8RA5vZLCAMabvFlXQPD2frCIiRSUTuTbIB0gwJMbIbF3ByIG4hZtAavjusNsFgqb4WJkD86ZOmmMc9Mw2ZLowOFnQTBglZGmNokv++IRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh7y+7txHC4dVASaxOLD8cqhTti3OUs6wxIY/xRPA5M=;
 b=GLmmqO270qLbRGqiq1hErUqHlhvmgXZ5Z0vd8mafjmJrIJk4HzE52qEfn4X1z8jtGM5AtWDDugbwK+feJe4Eq09SN+EW9l2WG48+/l+kZlgPX5EIhnJV5vZRcywZRdOoK6AuBfPpkqVWCBOAtG9gndy+eys9E5XjFfMsFF1D36PmqaLZB0xGnybxdy96Q6cPDX2TS6qWMrA433TBaObMsexBItjzkB1/oQwC58BCQ1Rlp+0b6XMFZhaXTXc3vtFkOVgYFaErCu2O/prAztKGnz3Eg+niiC0WmMUUk6vMfwyfntXsXXFjZeomE0qG/vI2Kg/svji+Sbnd747ykcDnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh7y+7txHC4dVASaxOLD8cqhTti3OUs6wxIY/xRPA5M=;
 b=wJGe6aAvouOeS3cOVMNQ9XMwSmoiTlRldpnxdqvnhT01leKk1JQFRUN61ajKA/iSdxZHWYUlVVmCzpxM3KdeHA4AZiDwZoYtYHPaRC8Pyn71+F7hHLEnFpVSSnKwlJ+7NYCEmNqa3BnubJydZKH0hxMHkLgCrh5WwIZ2/X7w42U=
Received: from MN2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:208:a8::30)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 19:35:55 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::41) by MN2PR12CA0017.outlook.office365.com
 (2603:10b6:208:a8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Thu, 9 May 2024 19:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Thu, 9 May 2024 19:35:54 +0000
Received: from birman-stx1-09-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 9 May
 2024 14:35:50 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <mlimonci@amd.com>, <benjamin.chan@amd.com>, 
 <king.li@amd.com>, <bin.du@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>
Subject: [PATCH v2 2/3] drm/amd/amdgpu: Add ISP driver support
Date: Thu, 9 May 2024 15:35:30 -0400
Message-ID: <20240509193531.129092-3-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509193531.129092-1-pratap.nirujogi@amd.com>
References: <20240509193531.129092-1-pratap.nirujogi@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ace925-ab18-44f8-e573-08dc705f3e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j5E0dW8zWoCxYHInLLobLVr9P4yrM9kLz1YcuxmV+VeN+lkwnp1xsUwvQZTT?=
 =?us-ascii?Q?lJuHCzLpf+qX8DsekfZBduDTjAUWM1dwkL7mvjmqLOSS0w4j3ZB75M31g8w6?=
 =?us-ascii?Q?5/FgaOOwRjJFiURsk28MhJDA3VJO65ipam4VpCObLw+ZEQJ+8kf7cnv0hTBu?=
 =?us-ascii?Q?4BnDFkFop513kvxy25JuBwr35YJpNMXaXUSHj23FI7AqdR1Fy8Eh2tBcr+2a?=
 =?us-ascii?Q?NDHGaipxIGb6b4MdQSzMofjm0VmEWQZ3/o5tE8eciOwF9d35Tads85OJiMn6?=
 =?us-ascii?Q?nIuVE07f2/znrOun2NbebrJ/136CNfqnihSEpdWe45+/GvF2ryHT+SOYWUS0?=
 =?us-ascii?Q?noT6Z0k4v2T3k72nC03QmlyUEyUNzWZSD/FpLJnbupLcfUuKGkLR9O1uNR11?=
 =?us-ascii?Q?coDtmSH74M7WxAcgR5qjz1gGftlYKbPMt5677sZghNKow/en7yxwJpVoYMl2?=
 =?us-ascii?Q?dyg1UVVfHQsBHb/+t5d1siwz3LCOHT5urvjJsCeXMCkaaMv8VhD/HS7a4dE1?=
 =?us-ascii?Q?UfFoAj6Ux6BKluSGTLvk52KGS15JBB1D5pQZo5DuDmBmFjfnZyxYWP3dPZkE?=
 =?us-ascii?Q?qLfnhTgXMf0zt4PRZRAy8PdienbRQ1z4a+GI3+JDjjBpSWV8/T42i/OX3aru?=
 =?us-ascii?Q?DFYHaqGiDx7K3y3hKFzbW8Uvpm9icYKiKQ/ZKb4zaKMhFfrvvit0CSAJCkyW?=
 =?us-ascii?Q?e/CFcH01HvpYn3S32Fi/weRYDbDTFXn5KS4JgGk22J+gxezKHmhOs6rdlX1O?=
 =?us-ascii?Q?VoNOM5e/4DySza9A1c8NBJr54f320GV0r/I14s+SqTiE8/XvU3U69Uwtu0mA?=
 =?us-ascii?Q?kSx29wuJlDUp4Yy+LH70dv941LQnuDNqwVs19u+FshdoFOqRXFo4glXk0wVX?=
 =?us-ascii?Q?AP8JEntKQaL74zX+Rud18QN5bN27KVVbu3v+IuiLsDp2jKJeAzZHLtNcBTzv?=
 =?us-ascii?Q?0H+W70J6OitUKSdJnhd3gTkbVxNJArTS2GVCoT9taNtltd7wWRNan4rr3b2v?=
 =?us-ascii?Q?djvNgLguXh8vV+JbGudT1sxcsc127tNQf3/+cPbZzpvnQJeUhIXqWQC6vfgn?=
 =?us-ascii?Q?AfVI6ibJsHR9hqvi25FpPQ1JOnCnJvJwz4d3vihWv0IhiqUnyWzqTCfxx6Oq?=
 =?us-ascii?Q?m1xDU3bnoiyr0OmTtolMIjMAe6m1EoZrdgup51Kq1Qbz2Ce8EtlaClYQwEO/?=
 =?us-ascii?Q?yE6tKaIOVFVRrqdpVmza4iLPNjpozqISRcCbU5wIZWx/6NwzqFhLKoM8VwNr?=
 =?us-ascii?Q?Tu/AVXtWZhW60VjZT/V+WIOvBhZNMXG5QYpmDKY5gaLSAzJaXnbScIB2qrj7?=
 =?us-ascii?Q?EtlxZ2CoMucFTmnZX4Xu0YrO1yK58uTvcnOGKItd7LijMcft4rpHUHXPo6CE?=
 =?us-ascii?Q?moJrLW60+wQwSVTm1KREVrwrZg91?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:35:54.9254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ace925-ab18-44f8-e573-08dc705f3e54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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

Add the isp driver in amdgpu to support ISP device on the APUs that
supports ISP IP block. ISP hw block is used for camera front-end, pre
and post processing operations.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
Change-Id: I67ef206e5eca1fe74e495c3262746be495e17d09
---
Changes in v2:
 - Remove adding IORESOURCE_IRQ
 - Remove noisy info prints
 - Avoid isp version numbers while naming
 - Fix incorrect argument description
 - Replace // with /* */ for comemnts

 drivers/gpu/drm/amd/amdgpu/Makefile       |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c   | 287 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h   |  54 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c   |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   1 +
 7 files changed, 357 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index de7b76327f5b..12ba76025cb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -324,4 +324,7 @@ amdgpu-y += $(AMD_DISPLAY_FILES)
 
 endif
 
+# add isp block
+amdgpu-y += amdgpu_isp.o
+
 obj-$(CONFIG_DRM_AMDGPU)+= amdgpu.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index eb60d28a3a13..6d7f9ef53269 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -112,6 +112,7 @@
 #include "amdgpu_xcp.h"
 #include "amdgpu_seq64.h"
 #include "amdgpu_reg_state.h"
+#include "amdgpu_isp.h"
 
 #define MAX_GPU_INSTANCE		64
 
@@ -1045,6 +1046,9 @@ struct amdgpu_device {
 	/* display related functionality */
 	struct amdgpu_display_manager dm;
 
+	/* isp */
+	struct amdgpu_isp		isp;
+
 	/* mes */
 	bool                            enable_mes;
 	bool                            enable_mes_kiq;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
new file mode 100644
index 000000000000..c28d90c25b10
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+
+#include <linux/irqdomain.h>
+#include <linux/pm_domain.h>
+#include <linux/platform_device.h>
+#include <sound/designware_i2s.h>
+#include <sound/pcm.h>
+#include <linux/acpi.h>
+#include <linux/firmware.h>
+
+#include "amdgpu_smu.h"
+#include "atom.h"
+#include "amdgpu_isp.h"
+#include "smu_internal.h"
+#include "smu_v11_5_ppsmc.h"
+#include "smu_v11_5_pmfw.h"
+
+#define mmDAGB0_WRCLI5_V4_1	0x6811C
+#define mmDAGB0_WRCLI9_V4_1	0x6812C
+#define mmDAGB0_WRCLI10_V4_1	0x68130
+#define mmDAGB0_WRCLI14_V4_1	0x68140
+#define mmDAGB0_WRCLI19_V4_1	0x68154
+#define mmDAGB0_WRCLI20_V4_1	0x68158
+
+static int isp_sw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->isp.parent = adev->dev;
+
+	adev->isp.cgs_device = amdgpu_cgs_create_device(adev);
+	if (!adev->isp.cgs_device)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int isp_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (adev->isp.cgs_device)
+		amdgpu_cgs_destroy_device(adev->isp.cgs_device);
+
+	return 0;
+}
+
+/**
+ * isp_hw_init - start and test isp block
+ *
+ * @handle: handle for amdgpu_device pointer
+ *
+ */
+static int isp_hw_init(void *handle)
+{
+	int r;
+	u64 isp_base;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	const struct amdgpu_ip_block *ip_block =
+		amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_ISP);
+
+	if (!ip_block)
+		return -EINVAL;
+
+	if (adev->rmmio_size == 0 || adev->rmmio_size < 0x5289)
+		return -EINVAL;
+
+	isp_base = adev->rmmio_base;
+
+	adev->isp.isp_cell = kcalloc(1, sizeof(struct mfd_cell), GFP_KERNEL);
+	if (!adev->isp.isp_cell) {
+		r = -ENOMEM;
+		DRM_ERROR("%s: isp mfd cell alloc failed\n", __func__);
+		goto failure;
+	}
+
+	adev->isp.isp_res = kcalloc(1, sizeof(struct resource), GFP_KERNEL);
+	if (!adev->isp.isp_res) {
+		r = -ENOMEM;
+		DRM_ERROR("%s: isp mfd res alloc failed\n", __func__);
+		goto failure;
+	}
+
+	adev->isp.isp_pdata = kzalloc(sizeof(*adev->isp.isp_pdata), GFP_KERNEL);
+	if (!adev->isp.isp_pdata) {
+		r = -ENOMEM;
+		DRM_ERROR("%s: isp platform data alloc failed\n", __func__);
+		goto failure;
+	}
+
+	/* initialize isp platform data */
+	adev->isp.isp_pdata->adev = (void *)adev;
+	adev->isp.isp_pdata->asic_type = adev->asic_type;
+	adev->isp.isp_pdata->base_rmmio_size = adev->rmmio_size;
+
+	adev->isp.isp_res[0].name = "isp_reg";
+	adev->isp.isp_res[0].flags = IORESOURCE_MEM;
+	adev->isp.isp_res[0].start = isp_base;
+	adev->isp.isp_res[0].end = isp_base + ISP_REGS_OFFSET_END;
+
+	adev->isp.isp_cell[0].name = "amd_isp_capture";
+	adev->isp.isp_cell[0].num_resources = 1;
+	adev->isp.isp_cell[0].resources = &adev->isp.isp_res[0];
+	adev->isp.isp_cell[0].platform_data = adev->isp.isp_pdata;
+	adev->isp.isp_cell[0].pdata_size = sizeof(struct isp_platform_data);
+
+	r = mfd_add_hotplug_devices(adev->isp.parent, adev->isp.isp_cell, 1);
+	if (r) {
+		DRM_ERROR("%s: add mfd hotplug device failed\n", __func__);
+		goto failure;
+	}
+
+	/* Temporary WA added to disable MMHUB TLSi until the GART initialization
+	   is ready to support MMHUB TLSi and SAW for ISP HW to access GART memory
+	   using the TLSi path */
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI5_V4_1 >> 2, 0xFE5FEAA8);
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI9_V4_1 >> 2, 0xFE5FEAA8);
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI10_V4_1 >> 2, 0xFE5FEAA8);
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI14_V4_1 >> 2, 0xFE5FEAA8);
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI19_V4_1 >> 2, 0xFE5FEAA8);
+	cgs_write_register(adev->isp.cgs_device, mmDAGB0_WRCLI20_V4_1 >> 2, 0xFE5FEAA8);
+
+	return 0;
+
+failure:
+
+	kfree(adev->isp.isp_pdata);
+	kfree(adev->isp.isp_res);
+	kfree(adev->isp.isp_cell);
+
+	return r;
+}
+
+/**
+ * isp_hw_fini - stop the hardware block
+ *
+ * @handle: handle for amdgpu_device pointer
+ *
+ */
+static int isp_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* remove isp mfd device */
+	mfd_remove_devices(adev->isp.parent);
+
+	kfree(adev->isp.isp_res);
+	kfree(adev->isp.isp_cell);
+	kfree(adev->isp.isp_pdata);
+
+	return 0;
+}
+
+static int isp_suspend(void *handle)
+{
+	return 0;
+}
+
+static int isp_resume(void *handle)
+{
+	return 0;
+}
+
+static int isp_load_fw_by_psp(struct amdgpu_device *adev)
+{
+	const struct common_firmware_header *hdr;
+	char ucode_prefix[30];
+	char fw_name[40];
+	int r = 0;
+
+	/* get isp fw binary name and path */
+	amdgpu_ucode_ip_version_decode(adev, ISP_HWIP, ucode_prefix,
+				       sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
+
+	/* read isp fw */
+	r = amdgpu_ucode_request(adev, &adev->isp.fw, fw_name);
+	if (r) {
+		DRM_ERROR("%s: failed to read isp fw %s\n", __func__, fw_name);
+		amdgpu_ucode_release(&adev->isp.fw);
+		return r;
+	}
+
+	hdr = (const struct common_firmware_header *)adev->isp.fw->data;
+
+	adev->firmware.ucode[AMDGPU_UCODE_ID_ISP].ucode_id =
+		AMDGPU_UCODE_ID_ISP;
+	adev->firmware.ucode[AMDGPU_UCODE_ID_ISP].fw = adev->isp.fw;
+
+	adev->firmware.fw_size +=
+		ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
+
+	return r;
+}
+
+static int isp_early_init(void *handle)
+{
+	int ret = 0;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	ret = isp_load_fw_by_psp(adev);
+	if (ret) {
+		DRM_WARN("%s: isp fw load failed %d\n", __func__, ret);
+		/* allow amdgpu init to proceed though isp fw load fails */
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static bool isp_is_idle(void *handle)
+{
+	return true;
+}
+
+static int isp_wait_for_idle(void *handle)
+{
+	return 0;
+}
+
+static int isp_soft_reset(void *handle)
+{
+	return 0;
+}
+
+static int isp_set_clockgating_state(void *handle,
+				     enum amd_clockgating_state state)
+{
+	return 0;
+}
+
+static int isp_set_powergating_state(void *handle,
+				     enum amd_powergating_state state)
+{
+	return 0;
+}
+
+static const struct amd_ip_funcs isp_ip_funcs = {
+	.name = "isp_ip",
+	.early_init = isp_early_init,
+	.late_init = NULL,
+	.sw_init = isp_sw_init,
+	.sw_fini = isp_sw_fini,
+	.hw_init = isp_hw_init,
+	.hw_fini = isp_hw_fini,
+	.suspend = isp_suspend,
+	.resume = isp_resume,
+	.is_idle = isp_is_idle,
+	.wait_for_idle = isp_wait_for_idle,
+	.soft_reset = isp_soft_reset,
+	.set_clockgating_state = isp_set_clockgating_state,
+	.set_powergating_state = isp_set_powergating_state,
+};
+
+const struct amdgpu_ip_block_version isp_ip_block = {
+	.type = AMD_IP_BLOCK_TYPE_ISP,
+	.major = 4,
+	.minor = 1,
+	.rev = 0,
+	.funcs = &isp_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h
new file mode 100644
index 000000000000..2adcb4b4dc6e
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+
+#ifndef __AMDGPU_ISP_H__
+#define __AMDGPU_ISP_H__
+
+#include <linux/mfd/core.h>
+#include <linux/mfd/core.h>
+
+#define ISP_REGS_OFFSET_END 0x629A4
+
+struct isp_platform_data {
+	void *adev;
+	u32 asic_type;
+	resource_size_t base_rmmio_size;
+};
+
+struct amdgpu_isp {
+	struct device *parent;
+	struct cgs_device *cgs_device;
+	struct mfd_cell *isp_cell;
+	struct resource *isp_res;
+	struct isp_platform_data *isp_pdata;
+	unsigned int harvest_config;
+	const struct firmware	*fw;
+};
+
+extern const struct amdgpu_ip_block_version isp_ip_block;
+
+#endif /* __AMDGPU_ISP_H__ */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 37820dd03cab..b4bd943a7cc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2539,6 +2539,9 @@ static int psp_get_fw_type(struct amdgpu_firmware_info *ucode,
 	case AMDGPU_UCODE_ID_JPEG_RAM:
 		*type = GFX_FW_TYPE_JPEG_RAM;
 		break;
+	case AMDGPU_UCODE_ID_ISP:
+		*type = GFX_FW_TYPE_ISP;
+		break;
 	case AMDGPU_UCODE_ID_MAXIMUM:
 	default:
 		return -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 75ece8a2f96b..a9de78bb96e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -712,6 +712,8 @@ const char *amdgpu_ucode_name(enum AMDGPU_UCODE_ID ucode_id)
 		return "RS64_MEC_P2_STACK";
 	case AMDGPU_UCODE_ID_CP_RS64_MEC_P3_STACK:
 		return "RS64_MEC_P3_STACK";
+	case AMDGPU_UCODE_ID_ISP:
+		return "ISP";
 	default:
 		return "UNKNOWN UCODE";
 	}
@@ -1411,6 +1413,9 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
 	case VPE_HWIP:
 		ip_name = "vpe";
 		break;
+	case ISP_HWIP:
+		ip_name = "isp";
+		break;
 	default:
 		BUG();
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index a3c04f711099..db745ab7b0c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -523,6 +523,7 @@ enum AMDGPU_UCODE_ID {
 	AMDGPU_UCODE_ID_UMSCH_MM_CMD_BUFFER,
 	AMDGPU_UCODE_ID_P2S_TABLE,
 	AMDGPU_UCODE_ID_JPEG_RAM,
+	AMDGPU_UCODE_ID_ISP,
 	AMDGPU_UCODE_ID_MAXIMUM,
 };
 
-- 
2.34.1

