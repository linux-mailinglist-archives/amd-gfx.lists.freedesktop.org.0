Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B18B2946
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Apr 2024 21:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355AA11A863;
	Thu, 25 Apr 2024 19:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YfwulFGT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C911A862
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Apr 2024 19:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIAZt9+2KQ3UWXnq8kJ9EtaJ/zciSnQc44EqIcQUuNU9RRJekD3RDqzsjgKkzq8B3Jo5iU3KQCK2JPE+8ciDk9BhMgV2+OEJxE/9RiFEziik5U8vusquXwj5k8skGbbmA9Q12eRB7Po6YoZ/decR36noG1RZ2xrzD5Bef4HEW4Q0gVyeSuxOj2Asn8bJo+IreLoV6+HbJoUkSVIjjSwPX/jlmk3uoTKr36v1ZagJbW6zhfJ4mAj6AyFv3+fESjuyQhbrOOXo4dkH5iUma5/lwNqdi0esAJLGBMeMU98xvLjel2xYqdvKcfSdjgqmJYJPC4t16irI4DPEpiq/6LA/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgmDVIaiA/6De5iCK/55LNVJSr0PGFF9bLsJKnBWy3o=;
 b=NMFYZUyU9XDLRspwXCUD7xhlUJ44a683um5uifso6E2UWLAU2C2+4lxiKf8ePOc9+bj3w/1x8q/7/yiE+YyhVCVzhhkufOPnqqtNR/Kvfnnaxb+RZFEHCoeoVWMD9zNtAn0w8tgouBcRqJ0xiFXtz1gxQtLHBBvh36aHIpwGAtsKmdj/oXjEhdaA8addAijMHHGtVGCsxsZlVD6tMvrv8jb58pKQ4IXxeYMkNCyua8Izm8dSWnA2+cJ8204I3smG2gl1MhaTEnyL464rFbrZGP3NK2WhQ5f0ocTHm0iJTkl6epfUVAifZJjERT4k3Q3DQD6Q93m4vceDPvu7sqYEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgmDVIaiA/6De5iCK/55LNVJSr0PGFF9bLsJKnBWy3o=;
 b=YfwulFGTElkXt/WENth96Jc60UlEbvoDxcw2fe8vENkjRuYsmeBa/RFOMk2dVv8b62N+Iw8bqGLlPGOF3dzITq23YdRtFXnlPSdv3oxExM2r74+ap9oSXtJ3TEHBHBmPXjS2Xct33MPt3HzGpBcsiPeP4dJjtz9LigB+ukcl0bk=
Received: from CH2PR14CA0056.namprd14.prod.outlook.com (2603:10b6:610:56::36)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 19:59:08 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::bc) by CH2PR14CA0056.outlook.office365.com
 (2603:10b6:610:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 19:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 19:59:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 14:59:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 2/5] drm/amdgpu: Add gmc v12_0 ip block support (v7)
Date: Thu, 25 Apr 2024 15:58:46 -0400
Message-ID: <20240425195849.2787543-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425195849.2787543-1-alexander.deucher@amd.com>
References: <20240425195849.2787543-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f210c90-222f-4087-2f58-08dc65622b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I6aumz6PWmRDHaqRncQa82yV/SFZ10/Zw4CgqaoVmRgXLyh3K0hCJM2gJzPt?=
 =?us-ascii?Q?xAtBrD+EaujjFsio0oEtudoMgXw6P/Ata7R66zO90AHMzWwACmjInwa8b5Zr?=
 =?us-ascii?Q?Wev2SABuwS/+0m0JaJ+bRpaz8jv70+NB+gGND4Rnww4ylgSbp2R7OagYO04S?=
 =?us-ascii?Q?SwIQ1n5iAv2iJ6YeJtxubonAedWH0AWnpLfC/Ejtp4cN1eTx5mQ3/IaH7A+F?=
 =?us-ascii?Q?BZaZiDgoYLcQNgAWUUBTQOA8H7yAd4hQXyjVuxrkgguyPXL4urssnVzB4d7+?=
 =?us-ascii?Q?1vPl2KfeKk3knTFm4MPC8P1AYuepqkJcQptKYnGJE4YIu2mD5pQapFSfxw1S?=
 =?us-ascii?Q?WEsdsjaXw15xh/eqALzRq7gRh5/ubA7cxifevmXKv+dsctVgUNhYq9HNdaf2?=
 =?us-ascii?Q?k64xVMMDG3RXUhnmWg8oi456G6AdM4q/5Pm6IDrAaueS917m4tUg/w8LSx0z?=
 =?us-ascii?Q?FEVb0vqTxqCDqxum675WXz0mGaIHIHTc49Nc7qF9TvkmiKoNVXmH4ENBH9mR?=
 =?us-ascii?Q?NaywDZVpVMoh5t2f5wKgSWwtyG27Cq4AUWwxLRCJ6qiVRgmTg6mYF+SGjyaV?=
 =?us-ascii?Q?ymazHz00h/iRSvSNPsH5iguyZXkXYTPEHty9U8pMz2cD32CsWB2R4D5iOUd0?=
 =?us-ascii?Q?JYJ5MOIYD2y5AlAVbWeWcyUJM9x6kHGS9mtiypgJI+lBRwP8iSwQI271ne5T?=
 =?us-ascii?Q?KL6Qcrwuk4+1qiW91bwSVQPxRypAfEziG4MKhwzD/xYrDwE/WCTb7RZELtaw?=
 =?us-ascii?Q?lM+xwZqG/nTLYAwSlBcTtE81K8DTxnrj19tR4DzQubn1eMtPAqZ/wK3bBihh?=
 =?us-ascii?Q?M/joYRcLDS6idEm/XldZqlZgo273CEwS3I1Zl9kY9LhxlQgBKuf3tPjiUKHW?=
 =?us-ascii?Q?DWJanjKxhdfM+C94xzy450y56qb1ptZmSrH5LE6s/5++aeT3btjQG1Nhj2oa?=
 =?us-ascii?Q?nqohrNrCTAApRNlf6rZhgDsfq5bzkvUYmyMPNXPlMVREG8PZaNG73k/RW58c?=
 =?us-ascii?Q?DcSxY8hXQrEOxHqglpfmRam/oGgGGE9OpxfYufWNSO2YNic/tLY+NcX8vkXZ?=
 =?us-ascii?Q?1+wp2ZTM+P8WR8DRQHw779RTIms6kRvzliOccsah4I8Wsv9eyvxzzRl4K/pg?=
 =?us-ascii?Q?lRoGXt1BdRwCilOGz/Rx4Sd/i5cPrAHX6Jthy+ArTCxJVkbnlPE7RTOa88ln?=
 =?us-ascii?Q?yOfk/RLJqWaacfL1WiRP4syImNOy25S1HLi2jjFsnaSNnHlyFyiHdkmNGWSp?=
 =?us-ascii?Q?/74AyA6iXvIDaBmmsvk/49RHI4fs0ATANSU2q4/PxSBKZUD4gx62bXHJfanC?=
 =?us-ascii?Q?g5UZZY75FWpPKIdJFEIYenj0hy6w6kRyGf65ijsSSM29+9NLPu13tbVsjTKX?=
 =?us-ascii?Q?1l1aJrK3fHVWkwOoUQDZWqDWiptl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 19:59:08.4805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f210c90-222f-4087-2f58-08dc65622b33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705
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

From: Hawking Zhang <Hawking.Zhang@amd.com>

Add initial support for GMC v12.

v1: Add gmc v12_0 ip block support.
v2: Switch to gfx.kiq array.
v3: Switch to vmhubs_mask.
v4: Switch to AMDGPU_MMHUB0(0) and AMDGPU_GFXHUB(0)
v5: Rebase (Alex)
v6: Squash in fixes for AGP handling, gfxhub init order,
    vmhub index (Alex)
v7: Rebase (Alex)
v8: squash in ecc fix (Alex)

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile    |    2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 1000 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h |   30 +
 3 files changed, 1031 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 5c0e7b512e25..9a793f4d8fcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -116,7 +116,7 @@ amdgpu-y += \
 	gfxhub_v2_0.o mmhub_v2_0.o gmc_v10_0.o gfxhub_v2_1.o mmhub_v2_3.o \
 	mmhub_v1_7.o gfxhub_v3_0.o mmhub_v3_0.o mmhub_v3_0_2.o gmc_v11_0.o \
 	mmhub_v3_0_1.o gfxhub_v3_0_3.o gfxhub_v1_2.o mmhub_v1_8.o mmhub_v3_3.o \
-	gfxhub_v11_5_0.o mmhub_v4_1_0.o gfxhub_v12_0.o
+	gfxhub_v11_5_0.o mmhub_v4_1_0.o gfxhub_v12_0.o gmc_v12_0.o
 
 # add UMC block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
new file mode 100644
index 000000000000..c85ebc8360e1
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -0,0 +1,1000 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#include <linux/firmware.h>
+#include <linux/pci.h>
+
+#include <drm/drm_cache.h>
+
+#include "amdgpu.h"
+#include "amdgpu_atomfirmware.h"
+#include "gmc_v12_0.h"
+#include "athub/athub_4_1_0_sh_mask.h"
+#include "athub/athub_4_1_0_offset.h"
+#include "oss/osssys_7_0_0_offset.h"
+#include "ivsrcid/vmc/irqsrcs_vmc_1_0.h"
+#include "soc24_enum.h"
+#include "soc24.h"
+#include "soc15d.h"
+#include "soc15_common.h"
+#include "nbif_v6_3_1.h"
+#include "gfxhub_v12_0.h"
+#include "mmhub_v4_1_0.h"
+#include "athub_v4_1_0.h"
+
+
+static int gmc_v12_0_ecc_interrupt_state(struct amdgpu_device *adev,
+					 struct amdgpu_irq_src *src,
+					 unsigned type,
+					 enum amdgpu_interrupt_state state)
+{
+	return 0;
+}
+
+static int gmc_v12_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *src, unsigned type,
+					      enum amdgpu_interrupt_state state)
+{
+	switch (state) {
+	case AMDGPU_IRQ_STATE_DISABLE:
+		/* MM HUB */
+		amdgpu_gmc_set_vm_fault_masks(adev, AMDGPU_MMHUB0(0), false);
+		/* GFX HUB */
+		/* This works because this interrupt is only
+		 * enabled at init/resume and disabled in
+		 * fini/suspend, so the overall state doesn't
+		 * change over the course of suspend/resume.
+		 */
+		if (!adev->in_s0ix)
+			amdgpu_gmc_set_vm_fault_masks(adev, AMDGPU_GFXHUB(0), false);
+		break;
+	case AMDGPU_IRQ_STATE_ENABLE:
+		/* MM HUB */
+		amdgpu_gmc_set_vm_fault_masks(adev, AMDGPU_MMHUB0(0), true);
+		/* GFX HUB */
+		/* This works because this interrupt is only
+		 * enabled at init/resume and disabled in
+		 * fini/suspend, so the overall state doesn't
+		 * change over the course of suspend/resume.
+		 */
+		if (!adev->in_s0ix)
+			amdgpu_gmc_set_vm_fault_masks(adev, AMDGPU_GFXHUB(0), true);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
+				       struct amdgpu_irq_src *source,
+				       struct amdgpu_iv_entry *entry)
+{
+	struct amdgpu_vmhub *hub;
+	uint32_t status = 0;
+	u64 addr;
+
+	addr = (u64)entry->src_data[0] << 12;
+	addr |= ((u64)entry->src_data[1] & 0xf) << 44;
+
+	if (entry->client_id == SOC21_IH_CLIENTID_VMC)
+		hub = &adev->vmhub[AMDGPU_MMHUB0(0)];
+	else
+		hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+
+	if (!amdgpu_sriov_vf(adev)) {
+		/*
+		 * Issue a dummy read to wait for the status register to
+		 * be updated to avoid reading an incorrect value due to
+		 * the new fast GRBM interface.
+		 */
+		if (entry->vmid_src == AMDGPU_GFXHUB(0))
+			RREG32(hub->vm_l2_pro_fault_status);
+
+		status = RREG32(hub->vm_l2_pro_fault_status);
+		WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
+
+		amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status,
+					     entry->vmid_src ? AMDGPU_MMHUB0(0) : AMDGPU_GFXHUB(0));
+	}
+
+	if (printk_ratelimit()) {
+		struct amdgpu_task_info *task_info;
+
+		dev_err(adev->dev,
+			"[%s] page fault (src_id:%u ring:%u vmid:%u pasid:%u)\n",
+			entry->vmid_src ? "mmhub" : "gfxhub",
+			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
+		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
+		if (task_info) {
+			dev_err(adev->dev,
+				" in process %s pid %d thread %s pid %d)\n",
+				task_info->process_name, task_info->tgid,
+				task_info->task_name, task_info->pid);
+			amdgpu_vm_put_task_info(task_info);
+		}
+
+		dev_err(adev->dev, "  in page starting at address 0x%016llx from client %d\n",
+				addr, entry->client_id);
+
+		if (!amdgpu_sriov_vf(adev))
+			hub->vmhub_funcs->print_l2_protection_fault_status(adev, status);
+	}
+
+	return 0;
+}
+
+static const struct amdgpu_irq_src_funcs gmc_v12_0_irq_funcs = {
+	.set = gmc_v12_0_vm_fault_interrupt_state,
+	.process = gmc_v12_0_process_interrupt,
+};
+
+static const struct amdgpu_irq_src_funcs gmc_v12_0_ecc_funcs = {
+	.set = gmc_v12_0_ecc_interrupt_state,
+	.process = amdgpu_umc_process_ecc_irq,
+};
+
+static void gmc_v12_0_set_irq_funcs(struct amdgpu_device *adev)
+{
+	adev->gmc.vm_fault.num_types = 1;
+	adev->gmc.vm_fault.funcs = &gmc_v12_0_irq_funcs;
+
+	if (!amdgpu_sriov_vf(adev)) {
+		adev->gmc.ecc_irq.num_types = 1;
+		adev->gmc.ecc_irq.funcs = &gmc_v12_0_ecc_funcs;
+	}
+}
+
+/**
+ * gmc_v12_0_use_invalidate_semaphore - judge whether to use semaphore
+ *
+ * @adev: amdgpu_device pointer
+ * @vmhub: vmhub type
+ *
+ */
+static bool gmc_v12_0_use_invalidate_semaphore(struct amdgpu_device *adev,
+				       uint32_t vmhub)
+{
+	return ((vmhub == AMDGPU_MMHUB0(0)) &&
+		(!amdgpu_sriov_vf(adev)));
+}
+
+static bool gmc_v12_0_get_vmid_pasid_mapping_info(
+					struct amdgpu_device *adev,
+					uint8_t vmid, uint16_t *p_pasid)
+{
+	*p_pasid = RREG32(SOC15_REG_OFFSET(OSSSYS, 0, regIH_VMID_0_LUT) + vmid) & 0xffff;
+
+	return !!(*p_pasid);
+}
+
+/*
+ * GART
+ * VMID 0 is the physical GPU addresses as used by the kernel.
+ * VMIDs 1-15 are used for userspace clients and are handled
+ * by the amdgpu vm/hsa code.
+ */
+
+static void gmc_v12_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
+				   unsigned int vmhub, uint32_t flush_type)
+{
+	bool use_semaphore = gmc_v12_0_use_invalidate_semaphore(adev, vmhub);
+	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
+	u32 inv_req = hub->vmhub_funcs->get_invalidate_req(vmid, flush_type);
+	u32 tmp;
+	/* Use register 17 for GART */
+	const unsigned eng = 17;
+	unsigned int i;
+	unsigned char hub_ip = 0;
+
+	hub_ip = (vmhub == AMDGPU_GFXHUB(0)) ?
+		   GC_HWIP : MMHUB_HWIP;
+
+	spin_lock(&adev->gmc.invalidate_lock);
+	/*
+	 * It may lose gpuvm invalidate acknowldege state across power-gating
+	 * off cycle, add semaphore acquire before invalidation and semaphore
+	 * release after invalidation to avoid entering power gated state
+	 * to WA the Issue
+	 */
+
+	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
+	if (use_semaphore) {
+		for (i = 0; i < adev->usec_timeout; i++) {
+			/* a read return value of 1 means semaphore acuqire */
+			tmp = RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_sem +
+					    hub->eng_distance * eng, hub_ip);
+			if (tmp & 0x1)
+				break;
+			udelay(1);
+		}
+
+		if (i >= adev->usec_timeout)
+			dev_err(adev->dev,
+				"Timeout waiting for sem acquire in VM flush!\n");
+	}
+
+	WREG32_RLC_NO_KIQ(hub->vm_inv_eng0_req + hub->eng_distance * eng, inv_req, hub_ip);
+
+	/* Wait for ACK with a delay.*/
+	for (i = 0; i < adev->usec_timeout; i++) {
+		tmp = RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_ack +
+				    hub->eng_distance * eng, hub_ip);
+		tmp &= 1 << vmid;
+		if (tmp)
+			break;
+
+		udelay(1);
+	}
+
+	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
+	if (use_semaphore)
+		/*
+		 * add semaphore release after invalidation,
+		 * write with 0 means semaphore release
+		 */
+		WREG32_RLC_NO_KIQ(hub->vm_inv_eng0_sem +
+			      hub->eng_distance * eng, 0, hub_ip);
+
+	/* Issue additional private vm invalidation to MMHUB */
+	if ((vmhub != AMDGPU_GFXHUB(0)) &&
+	    (hub->vm_l2_bank_select_reserved_cid2) &&
+		!amdgpu_sriov_vf(adev)) {
+		inv_req = RREG32_NO_KIQ(hub->vm_l2_bank_select_reserved_cid2);
+		/* bit 25: RSERVED_CACHE_PRIVATE_INVALIDATION */
+		inv_req |= (1 << 25);
+		/* Issue private invalidation */
+		WREG32_NO_KIQ(hub->vm_l2_bank_select_reserved_cid2, inv_req);
+		/* Read back to ensure invalidation is done*/
+		RREG32_NO_KIQ(hub->vm_l2_bank_select_reserved_cid2);
+	}
+
+	spin_unlock(&adev->gmc.invalidate_lock);
+
+	if (i < adev->usec_timeout)
+		return;
+
+	dev_err(adev->dev, "Timeout waiting for VM flush ACK!\n");
+}
+
+/**
+ * gmc_v12_0_flush_gpu_tlb - gart tlb flush callback
+ *
+ * @adev: amdgpu_device pointer
+ * @vmid: vm instance to flush
+ *
+ * Flush the TLB for the requested page table.
+ */
+static void gmc_v12_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
+					uint32_t vmhub, uint32_t flush_type)
+{
+	if ((vmhub == AMDGPU_GFXHUB(0)) && !adev->gfx.is_poweron)
+		return;
+
+	/* flush hdp cache */
+	adev->hdp.funcs->flush_hdp(adev, NULL);
+
+	/* This is necessary for SRIOV as well as for GFXOFF to function
+	 * properly under bare metal
+	 */
+	if ((adev->gfx.kiq[0].ring.sched.ready || adev->mes.ring.sched.ready) &&
+	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
+		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
+		const unsigned eng = 17;
+		u32 inv_req = hub->vmhub_funcs->get_invalidate_req(vmid, flush_type);
+		u32 req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
+		u32 ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
+
+		amdgpu_gmc_fw_reg_write_reg_wait(adev, req, ack, inv_req,
+				1 << vmid, GET_INST(GC, 0));
+		return;
+	}
+
+	mutex_lock(&adev->mman.gtt_window_lock);
+	gmc_v12_0_flush_vm_hub(adev, vmid, vmhub, 0);
+	mutex_unlock(&adev->mman.gtt_window_lock);
+	return;
+}
+
+/**
+ * gmc_v12_0_flush_gpu_tlb_pasid - tlb flush via pasid
+ *
+ * @adev: amdgpu_device pointer
+ * @pasid: pasid to be flush
+ *
+ * Flush the TLB for the requested pasid.
+ */
+static void gmc_v12_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
+					  uint16_t pasid, uint32_t flush_type,
+					  bool all_hub, uint32_t inst)
+{
+	uint16_t queried;
+	int vmid, i;
+
+	for (vmid = 1; vmid < 16; vmid++) {
+		bool valid;
+
+		valid = gmc_v12_0_get_vmid_pasid_mapping_info(adev, vmid,
+							      &queried);
+		if (!valid || queried != pasid)
+			continue;
+
+		if (all_hub) {
+			for_each_set_bit(i, adev->vmhubs_mask,
+					 AMDGPU_MAX_VMHUBS)
+				gmc_v12_0_flush_gpu_tlb(adev, vmid, i,
+							flush_type);
+		} else {
+			gmc_v12_0_flush_gpu_tlb(adev, vmid, AMDGPU_GFXHUB(0),
+						flush_type);
+		}
+	}
+}
+
+static uint64_t gmc_v12_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
+					     unsigned vmid, uint64_t pd_addr)
+{
+	bool use_semaphore = gmc_v12_0_use_invalidate_semaphore(ring->adev, ring->vm_hub);
+	struct amdgpu_vmhub *hub = &ring->adev->vmhub[ring->vm_hub];
+	uint32_t req = hub->vmhub_funcs->get_invalidate_req(vmid, 0);
+	unsigned eng = ring->vm_inv_eng;
+
+	/*
+	 * It may lose gpuvm invalidate acknowldege state across power-gating
+	 * off cycle, add semaphore acquire before invalidation and semaphore
+	 * release after invalidation to avoid entering power gated state
+	 * to WA the Issue
+	 */
+
+	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
+	if (use_semaphore)
+		/* a read return value of 1 means semaphore acuqire */
+		amdgpu_ring_emit_reg_wait(ring,
+					  hub->vm_inv_eng0_sem +
+					  hub->eng_distance * eng, 0x1, 0x1);
+
+	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_lo32 +
+			      (hub->ctx_addr_distance * vmid),
+			      lower_32_bits(pd_addr));
+
+	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_hi32 +
+			      (hub->ctx_addr_distance * vmid),
+			      upper_32_bits(pd_addr));
+
+	amdgpu_ring_emit_reg_write_reg_wait(ring, hub->vm_inv_eng0_req +
+					    hub->eng_distance * eng,
+					    hub->vm_inv_eng0_ack +
+					    hub->eng_distance * eng,
+					    req, 1 << vmid);
+
+	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
+	if (use_semaphore)
+		/*
+		 * add semaphore release after invalidation,
+		 * write with 0 means semaphore release
+		 */
+		amdgpu_ring_emit_wreg(ring, hub->vm_inv_eng0_sem +
+				      hub->eng_distance * eng, 0);
+
+	return pd_addr;
+}
+
+static void gmc_v12_0_emit_pasid_mapping(struct amdgpu_ring *ring, unsigned vmid,
+					 unsigned pasid)
+{
+	struct amdgpu_device *adev = ring->adev;
+	uint32_t reg;
+
+	/* MES fw manages IH_VMID_x_LUT updating */
+	if (ring->is_mes_queue)
+		return;
+
+	if (ring->vm_hub == AMDGPU_GFXHUB(0))
+		reg = SOC15_REG_OFFSET(OSSSYS, 0, regIH_VMID_0_LUT) + vmid;
+	else
+		reg = SOC15_REG_OFFSET(OSSSYS, 0, regIH_VMID_0_LUT_MM) + vmid;
+
+	amdgpu_ring_emit_wreg(ring, reg, pasid);
+}
+
+/*
+ * PTE format:
+ * 63 P
+ * 62:59 reserved
+ * 58 D
+ * 57 G
+ * 56 T
+ * 55:54 M
+ * 53:52 SW
+ * 51:48 reserved for future
+ * 47:12 4k physical page base address
+ * 11:7 fragment
+ * 6 write
+ * 5 read
+ * 4 exe
+ * 3 Z
+ * 2 snooped
+ * 1 system
+ * 0 valid
+ *
+ * PDE format:
+ * 63 P
+ * 62:58 block fragment size
+ * 57 reserved
+ * 56 A
+ * 55:54 M
+ * 53:52 reserved
+ * 51:48 reserved for future
+ * 47:6 physical base address of PD or PTE
+ * 5:3 reserved
+ * 2 C
+ * 1 system
+ * 0 valid
+ */
+
+static uint64_t gmc_v12_0_map_mtype(struct amdgpu_device *adev, uint32_t flags)
+{
+	switch (flags) {
+	case AMDGPU_VM_MTYPE_DEFAULT:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_NC);
+	case AMDGPU_VM_MTYPE_NC:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_NC);
+	case AMDGPU_VM_MTYPE_WC:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_WC);
+	case AMDGPU_VM_MTYPE_CC:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_CC);
+	case AMDGPU_VM_MTYPE_UC:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_UC);
+	default:
+		return AMDGPU_PTE_MTYPE_GFX12(MTYPE_NC);
+	}
+}
+
+static void gmc_v12_0_get_vm_pde(struct amdgpu_device *adev, int level,
+				 uint64_t *addr, uint64_t *flags)
+{
+	if (!(*flags & AMDGPU_PDE_PTE_GFX12) && !(*flags & AMDGPU_PTE_SYSTEM))
+		*addr = adev->vm_manager.vram_base_offset + *addr -
+			adev->gmc.vram_start;
+	BUG_ON(*addr & 0xFFFF00000000003FULL);
+
+	if (!adev->gmc.translate_further)
+		return;
+
+	if (level == AMDGPU_VM_PDB1) {
+		/* Set the block fragment size */
+		if (!(*flags & AMDGPU_PDE_PTE_GFX12))
+			*flags |= AMDGPU_PDE_BFS_GFX12(0x9);
+
+	} else if (level == AMDGPU_VM_PDB0) {
+		if (*flags & AMDGPU_PDE_PTE_GFX12)
+			*flags &= ~AMDGPU_PDE_PTE_GFX12;
+	}
+}
+
+static void gmc_v12_0_get_vm_pte(struct amdgpu_device *adev,
+				 struct amdgpu_bo_va_mapping *mapping,
+				 uint64_t *flags)
+{
+	struct amdgpu_bo *bo = mapping->bo_va->base.bo;
+
+	*flags &= ~AMDGPU_PTE_EXECUTABLE;
+	*flags |= mapping->flags & AMDGPU_PTE_EXECUTABLE;
+
+	*flags &= ~AMDGPU_PTE_MTYPE_GFX12_MASK;
+	*flags |= (mapping->flags & AMDGPU_PTE_MTYPE_GFX12_MASK);
+
+	if (mapping->flags & AMDGPU_PTE_PRT_GFX12) {
+		*flags |= AMDGPU_PTE_PRT_GFX12;
+		*flags |= AMDGPU_PTE_SNOOPED;
+		*flags |= AMDGPU_PTE_SYSTEM;
+		*flags &= ~AMDGPU_PTE_VALID;
+	}
+
+	if (bo && bo->flags & (AMDGPU_GEM_CREATE_COHERENT |
+			       AMDGPU_GEM_CREATE_UNCACHED))
+		*flags = (*flags & ~AMDGPU_PTE_MTYPE_GFX12_MASK) |
+			 AMDGPU_PTE_MTYPE_GFX12(MTYPE_UC);
+}
+
+static unsigned gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
+{
+	return 0;
+}
+
+static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
+	.flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
+	.flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
+	.emit_flush_gpu_tlb = gmc_v12_0_emit_flush_gpu_tlb,
+	.emit_pasid_mapping = gmc_v12_0_emit_pasid_mapping,
+	.map_mtype = gmc_v12_0_map_mtype,
+	.get_vm_pde = gmc_v12_0_get_vm_pde,
+	.get_vm_pte = gmc_v12_0_get_vm_pte,
+	.get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
+};
+
+static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
+{
+	adev->gmc.gmc_funcs = &gmc_v12_0_gmc_funcs;
+}
+
+static void gmc_v12_0_set_umc_funcs(struct amdgpu_device *adev)
+{
+}
+
+
+static void gmc_v12_0_set_mmhub_funcs(struct amdgpu_device *adev)
+{
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
+	case IP_VERSION(4, 1, 0):
+		adev->mmhub.funcs = &mmhub_v4_1_0_funcs;
+		break;
+	default:
+		break;
+	}
+}
+
+static void gmc_v12_0_set_gfxhub_funcs(struct amdgpu_device *adev)
+{
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(12, 0, 0):
+	case IP_VERSION(12, 0, 1):
+		adev->gfxhub.funcs = &gfxhub_v12_0_funcs;
+		break;
+	default:
+		break;
+	}
+}
+
+static int gmc_v12_0_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	gmc_v12_0_set_gfxhub_funcs(adev);
+	gmc_v12_0_set_mmhub_funcs(adev);
+	gmc_v12_0_set_gmc_funcs(adev);
+	gmc_v12_0_set_irq_funcs(adev);
+	gmc_v12_0_set_umc_funcs(adev);
+
+	adev->gmc.shared_aperture_start = 0x2000000000000000ULL;
+	adev->gmc.shared_aperture_end =
+		adev->gmc.shared_aperture_start + (4ULL << 30) - 1;
+	adev->gmc.private_aperture_start = 0x1000000000000000ULL;
+	adev->gmc.private_aperture_end =
+		adev->gmc.private_aperture_start + (4ULL << 30) - 1;
+
+	return 0;
+}
+
+static int gmc_v12_0_late_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int r;
+
+	r = amdgpu_gmc_allocate_vm_inv_eng(adev);
+	if (r)
+		return r;
+
+	r = amdgpu_gmc_ras_late_init(adev);
+	if (r)
+		return r;
+
+	return amdgpu_irq_get(adev, &adev->gmc.vm_fault, 0);
+}
+
+static void gmc_v12_0_vram_gtt_location(struct amdgpu_device *adev,
+					struct amdgpu_gmc *mc)
+{
+	u64 base = 0;
+
+	base = adev->mmhub.funcs->get_fb_location(adev);
+
+	amdgpu_gmc_vram_location(adev, &adev->gmc, base);
+	amdgpu_gmc_gart_location(adev, mc, AMDGPU_GART_PLACEMENT_LOW);
+	if (!amdgpu_sriov_vf(adev) && (amdgpu_agp == 1))
+		amdgpu_gmc_agp_location(adev, mc);
+
+	/* base offset of vram pages */
+	if (amdgpu_sriov_vf(adev))
+		adev->vm_manager.vram_base_offset = 0;
+	else
+		adev->vm_manager.vram_base_offset = adev->mmhub.funcs->get_mc_fb_offset(adev);
+}
+
+/**
+ * gmc_v12_0_mc_init - initialize the memory controller driver params
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Look up the amount of vram, vram width, and decide how to place
+ * vram and gart within the GPU's physical address space.
+ * Returns 0 for success.
+ */
+static int gmc_v12_0_mc_init(struct amdgpu_device *adev)
+{
+	int r;
+
+	/* size in MB on si */
+	adev->gmc.mc_vram_size =
+		adev->nbio.funcs->get_memsize(adev) * 1024ULL * 1024ULL;
+	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
+
+	if (!(adev->flags & AMD_IS_APU)) {
+		r = amdgpu_device_resize_fb_bar(adev);
+		if (r)
+			return r;
+	}
+
+	adev->gmc.aper_base = pci_resource_start(adev->pdev, 0);
+	adev->gmc.aper_size = pci_resource_len(adev->pdev, 0);
+
+#ifdef CONFIG_X86_64
+	if ((adev->flags & AMD_IS_APU) && !amdgpu_passthrough(adev)) {
+		adev->gmc.aper_base = adev->mmhub.funcs->get_mc_fb_offset(adev);
+		adev->gmc.aper_size = adev->gmc.real_vram_size;
+	}
+#endif
+	/* In case the PCI BAR is larger than the actual amount of vram */
+	adev->gmc.visible_vram_size = adev->gmc.aper_size;
+	if (adev->gmc.visible_vram_size > adev->gmc.real_vram_size)
+		adev->gmc.visible_vram_size = adev->gmc.real_vram_size;
+
+	/* set the gart size */
+	if (amdgpu_gart_size == -1) {
+		adev->gmc.gart_size = 512ULL << 20;
+	} else
+		adev->gmc.gart_size = (u64)amdgpu_gart_size << 20;
+
+	gmc_v12_0_vram_gtt_location(adev, &adev->gmc);
+
+	return 0;
+}
+
+static int gmc_v12_0_gart_init(struct amdgpu_device *adev)
+{
+	int r;
+
+	if (adev->gart.bo) {
+		WARN(1, "PCIE GART already initialized\n");
+		return 0;
+	}
+
+	/* Initialize common gart structure */
+	r = amdgpu_gart_init(adev);
+	if (r)
+		return r;
+
+	adev->gart.table_size = adev->gart.num_gpu_pages * 8;
+	adev->gart.gart_pte_flags = AMDGPU_PTE_MTYPE_GFX12(MTYPE_UC) |
+				 AMDGPU_PTE_EXECUTABLE;
+
+	return amdgpu_gart_table_vram_alloc(adev);
+}
+
+static int gmc_v12_0_sw_init(void *handle)
+{
+	int r, vram_width = 0, vram_type = 0, vram_vendor = 0;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->mmhub.funcs->init(adev);
+
+	adev->gfxhub.funcs->init(adev);
+
+	spin_lock_init(&adev->gmc.invalidate_lock);
+
+	r = amdgpu_atomfirmware_get_vram_info(adev,
+					      &vram_width, &vram_type, &vram_vendor);
+	adev->gmc.vram_width = vram_width;
+
+	adev->gmc.vram_type = vram_type;
+	adev->gmc.vram_vendor = vram_vendor;
+
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(12, 0, 0):
+	case IP_VERSION(12, 0, 1):
+		set_bit(AMDGPU_GFXHUB(0), adev->vmhubs_mask);
+		set_bit(AMDGPU_MMHUB0(0), adev->vmhubs_mask);
+		/*
+		 * To fulfill 4-level page support,
+		 * vm size is 256TB (48bit), maximum size,
+		 * block size 512 (9bit)
+		 */
+		amdgpu_vm_adjust_size(adev, 256 * 1024, 9, 3, 48);
+		break;
+	default:
+		break;
+	}
+
+	/* This interrupt is VMC page fault.*/
+	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_VMC,
+			      VMC_1_0__SRCID__VM_FAULT,
+			      &adev->gmc.vm_fault);
+
+	if (r)
+		return r;
+
+	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_GFX,
+			      UTCL2_1_0__SRCID__FAULT,
+			      &adev->gmc.vm_fault);
+	if (r)
+		return r;
+
+	if (!amdgpu_sriov_vf(adev)) {
+		/* interrupt sent to DF. */
+		r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_DF, 0,
+				      &adev->gmc.ecc_irq);
+		if (r)
+			return r;
+	}
+
+	/*
+	 * Set the internal MC address mask This is the max address of the GPU's
+	 * internal address space.
+	 */
+	adev->gmc.mc_mask = 0xffffffffffffULL; /* 48 bit MC */
+
+	r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(48));
+	if (r) {
+		printk(KERN_WARNING "amdgpu: No suitable DMA available.\n");
+		return r;
+	}
+
+	adev->need_swiotlb = drm_need_swiotlb(44);
+
+	r = gmc_v12_0_mc_init(adev);
+	if (r)
+		return r;
+
+	amdgpu_gmc_get_vbios_allocations(adev);
+
+	/* Memory manager */
+	r = amdgpu_bo_init(adev);
+	if (r)
+		return r;
+
+	r = gmc_v12_0_gart_init(adev);
+	if (r)
+		return r;
+
+	/*
+	 * number of VMs
+	 * VMID 0 is reserved for System
+	 * amdgpu graphics/compute will use VMIDs 1-7
+	 * amdkfd will use VMIDs 8-15
+	 */
+	adev->vm_manager.first_kfd_vmid = 8;
+
+	amdgpu_vm_manager_init(adev);
+
+	return 0;
+}
+
+/**
+ * gmc_v12_0_gart_fini - vm fini callback
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Tears down the driver GART/VM setup (CIK).
+ */
+static void gmc_v12_0_gart_fini(struct amdgpu_device *adev)
+{
+	amdgpu_gart_table_vram_free(adev);
+}
+
+static int gmc_v12_0_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_vm_manager_fini(adev);
+	gmc_v12_0_gart_fini(adev);
+	amdgpu_gem_force_release(adev);
+	amdgpu_bo_fini(adev);
+
+	return 0;
+}
+
+static void gmc_v12_0_init_golden_registers(struct amdgpu_device *adev)
+{
+}
+
+/**
+ * gmc_v12_0_gart_enable - gart enable
+ *
+ * @adev: amdgpu_device pointer
+ */
+static int gmc_v12_0_gart_enable(struct amdgpu_device *adev)
+{
+	int r;
+	bool value;
+
+	if (adev->gart.bo == NULL) {
+		dev_err(adev->dev, "No VRAM object for PCIE GART.\n");
+		return -EINVAL;
+	}
+
+	amdgpu_gtt_mgr_recover(&adev->mman.gtt_mgr);
+
+	r = adev->mmhub.funcs->gart_enable(adev);
+	if (r)
+		return r;
+
+	/* Flush HDP after it is initialized */
+	adev->hdp.funcs->flush_hdp(adev, NULL);
+
+	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
+		false : true;
+
+	adev->mmhub.funcs->set_fault_enable_default(adev, value);
+	gmc_v12_0_flush_gpu_tlb(adev, 0, AMDGPU_MMHUB0(0), 0);
+
+	dev_info(adev->dev, "PCIE GART of %uM enabled (table at 0x%016llX).\n",
+		 (unsigned)(adev->gmc.gart_size >> 20),
+		 (unsigned long long)amdgpu_bo_gpu_offset(adev->gart.bo));
+
+	return 0;
+}
+
+static int gmc_v12_0_hw_init(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* The sequence of these two function calls matters.*/
+	gmc_v12_0_init_golden_registers(adev);
+
+	r = gmc_v12_0_gart_enable(adev);
+	if (r)
+		return r;
+
+	if (adev->umc.funcs && adev->umc.funcs->init_registers)
+		adev->umc.funcs->init_registers(adev);
+
+	return 0;
+}
+
+/**
+ * gmc_v12_0_gart_disable - gart disable
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * This disables all VM page table.
+ */
+static void gmc_v12_0_gart_disable(struct amdgpu_device *adev)
+{
+	adev->mmhub.funcs->gart_disable(adev);
+}
+
+static int gmc_v12_0_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (amdgpu_sriov_vf(adev)) {
+		/* full access mode, so don't touch any GMC register */
+		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
+		return 0;
+	}
+
+	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
+
+	if (adev->gmc.ecc_irq.funcs &&
+		amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC))
+		amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
+
+	gmc_v12_0_gart_disable(adev);
+
+	return 0;
+}
+
+static int gmc_v12_0_suspend(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	gmc_v12_0_hw_fini(adev);
+
+	return 0;
+}
+
+static int gmc_v12_0_resume(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = gmc_v12_0_hw_init(adev);
+	if (r)
+		return r;
+
+	amdgpu_vmid_reset_all(adev);
+
+	return 0;
+}
+
+static bool gmc_v12_0_is_idle(void *handle)
+{
+	/* MC is always ready in GMC v11.*/
+	return true;
+}
+
+static int gmc_v12_0_wait_for_idle(void *handle)
+{
+	/* There is no need to wait for MC idle in GMC v11.*/
+	return 0;
+}
+
+static int gmc_v12_0_soft_reset(void *handle)
+{
+	return 0;
+}
+
+static int gmc_v12_0_set_clockgating_state(void *handle,
+					   enum amd_clockgating_state state)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = adev->mmhub.funcs->set_clockgating(adev, state);
+	if (r)
+		return r;
+
+	return athub_v4_1_0_set_clockgating(adev, state);
+}
+
+static void gmc_v12_0_get_clockgating_state(void *handle, u64 *flags)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->mmhub.funcs->get_clockgating(adev, flags);
+
+	athub_v4_1_0_get_clockgating(adev, flags);
+}
+
+static int gmc_v12_0_set_powergating_state(void *handle,
+					   enum amd_powergating_state state)
+{
+	return 0;
+}
+
+const struct amd_ip_funcs gmc_v12_0_ip_funcs = {
+	.name = "gmc_v12_0",
+	.early_init = gmc_v12_0_early_init,
+	.sw_init = gmc_v12_0_sw_init,
+	.hw_init = gmc_v12_0_hw_init,
+	.late_init = gmc_v12_0_late_init,
+	.sw_fini = gmc_v12_0_sw_fini,
+	.hw_fini = gmc_v12_0_hw_fini,
+	.suspend = gmc_v12_0_suspend,
+	.resume = gmc_v12_0_resume,
+	.is_idle = gmc_v12_0_is_idle,
+	.wait_for_idle = gmc_v12_0_wait_for_idle,
+	.soft_reset = gmc_v12_0_soft_reset,
+	.set_clockgating_state = gmc_v12_0_set_clockgating_state,
+	.set_powergating_state = gmc_v12_0_set_powergating_state,
+	.get_clockgating_state = gmc_v12_0_get_clockgating_state,
+};
+
+const struct amdgpu_ip_block_version gmc_v12_0_ip_block = {
+	.type = AMD_IP_BLOCK_TYPE_GMC,
+	.major = 12,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &gmc_v12_0_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h
new file mode 100644
index 000000000000..deca93e4a156
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __GMC_V12_0_H__
+#define __GMC_V12_0_H__
+
+extern const struct amd_ip_funcs gmc_v12_0_ip_funcs;
+extern const struct amdgpu_ip_block_version gmc_v12_0_ip_block;
+
+#endif
-- 
2.44.0

