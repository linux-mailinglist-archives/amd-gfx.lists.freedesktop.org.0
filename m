Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0436A7616
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Mar 2023 22:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079710E33B;
	Wed,  1 Mar 2023 21:23:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF910E33B
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Mar 2023 21:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNDuVpsPPyD0LMbrP2yg96f2M48luA06m4YYW3fT47pk32f2YzVySF8WTcwySom/VZoK3UM1B2WQ2brlrcHpfMSFYSYWORRpgEjP/ybjO3TZNHjstQ8SE4fc4qN9IUwCckdvgJFh0e/rEwCIm2bHSTl2BlaVn6qfwLDCkFvbFcsJ8I2jNdG4rytbupKvILERcHUefJpKn2ujFumJ2hDD0CzwTA5RNlaLw7lYcYnoZJ3EVK06ERZUiSxe3LDTbIRieyjhKAmN+KTkQe+G8N1LnEL2EClEyt4lWTH5NFGWPoV+vAhkeJPd31tR4BqmKU+oBO4Q4r57g32phkWHBFi4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xG30rcNT5ZACTVPxcq6or0eYadlBUXPDjQ2syXsDsk=;
 b=UfWO5nXADVzwqTI9uHFx5Q4hp2VoHsNkgI+8f29ETewDVvTEeODCJs9xpu396BBUAsIjEoAgr//OYqbRzO6q4ssG6Z65AlQMrV20L51kT8ysmEOcmVrKkrWEeXyiMTrd1kp8sk5qyCe4dLatYRBcCL2h+ZuKMBB33Ri6BajAhH/kcJpXYd5Tj74SxfvvmCmcGAfj6lUQDqkSEAo6RbjPPLAduVuXJxWhU6hrGZ483z27PcpqOLDukaHoxA7PQAOlBT2Frh5qcjgA3Zz1q1yrCefmt14h6OJAHTLYNk2cDHhHFuZoVWlyy+2gr/NuYc32lzNJ70byvPNpSE1m+qZu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xG30rcNT5ZACTVPxcq6or0eYadlBUXPDjQ2syXsDsk=;
 b=Y8n8SbzNwP7FhOGiKApWzuFcJBZEFzLOTLzHBSJieE4uOdfhpNFYNSLtx3hg+YeTeLqad+jFd+Ksw9ovS3us1d6tyZ9cxL7CC/GDPUDXsS41Uko8wYPfju3/oalbxqL0wDLYrBYNOqTlpvT/p/I6df4TnEpXXb0BzwdTmIjxY9o=
Received: from MN2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:208:239::35)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 21:23:10 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::e8) by MN2PR08CA0030.outlook.office365.com
 (2603:10b6:208:239::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Wed, 1 Mar 2023 21:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.16 via Frontend Transport; Wed, 1 Mar 2023 21:23:09 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 15:23:03 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: add sdma v4_4_2 support (v4)
Date: Wed, 1 Mar 2023 16:22:38 -0500
Message-ID: <20230301212239.2098980-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301212239.2098980-1-alexander.deucher@amd.com>
References: <20230301212239.2098980-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 99916746-4f4a-44dd-bfa4-08db1a9b2821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vIsdXh7m/MitxlsViE147Cu3zIZCgBsoOJ7/U/hV1WPJ1OrwI5XE7ALy2/gyEqyBgZixegzrBZQod0ZvomMAJn4j5Ih7N5bAkrmU0lk6jtfOGrC6SwRnyYPa12ZDobCdg9msOKy0hi4zl8mR2sn1Gf0WQS+HPNaOAxiemLMHyBEZFbx0dJuENaFRGag4tm5KJvsFGbiQYi8+yI6dMZiQWTxReI1J06Y3x1BqNYhoPISRpMgQAoJASufDIWl0+ngb/JNooOg8T1HfZbUD00QyMaqpt86MUxm5E5Rjp+zGrP5S6s7gT9kEwfDWbBIQmA3CmiXv9g4xIFT1fQq+4ZD1xdiTUvBbTCi18haqFekrj/izJKfKd517iF/rTY0qhcWf0iylppk207/QDCA5SsGEXVnhjRN5OhySxs0sGHyc8Ych6yOaLjIrhqlt6pVq+KBwKhWjPzt7nHuJydBKpNUjm3p/X0tjKzy1qjB5xtzWxVaH1HmidC1URhAXoEaHQPgn0O5Mzx/RkC6w3XHoSvewD5wSvpickJweJ179P8L3Aq9agLlJubcj/JUXBwwDqT5an3nyGtjzBcgjwXjIoS7Z6CApfFHy5wOre4pDF33+9n7eFXkTP7oMSOm8RZ29UJ8WdRV7YTLmIVlAwuGQhJ1BOgH9lftPDtVbT+UNUWsx8i4hjqWFGxFVYEBFNWHaglHQiVenhBHFI2iBm73cfR0KHC9sSdjU5523tzArJQtqNc/0iFOKCV3MBGsSczDGm1+K
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(66899018)(36756003)(86362001)(5660300002)(70206006)(40480700001)(6916009)(8676002)(2906002)(356005)(30864003)(82740400003)(4326008)(36860700001)(81166007)(8936002)(41300700001)(7696005)(6666004)(966005)(54906003)(316002)(478600001)(82310400005)(70586007)(83380400001)(26005)(1076003)(47076005)(2616005)(186003)(426003)(336012)(40460700003)(16526019)(21314003)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 21:23:09.8142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99916746-4f4a-44dd-bfa4-08db1a9b2821
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Le Ma <le.ma@amd.com>

Add support for SDMA 4.4.2.

v1: Create sdma_v4_4_2.[c|h] for initial support (Le)
v2: update amdgpu_ring_init call with atomic score (Hawking)
v3: Squash in sdma_start fixes (Alex)
v4: Comment out currently unused RAS code (Alex)

Signed-off-by: Le Ma <le.ma@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 1967 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h |   30 +
 3 files changed, 1998 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 1d72cbc85348..d4dfd48451ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -148,6 +148,7 @@ amdgpu-y += \
 	sdma_v3_0.o \
 	sdma_v4_0.o \
 	sdma_v4_4.o \
+	sdma_v4_4_2.o \
 	sdma_v5_0.o \
 	sdma_v5_2.o \
 	sdma_v6_0.o
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
new file mode 100644
index 000000000000..1b04700a4d55
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -0,0 +1,1967 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "amdgpu.h"
+#include "amdgpu_ucode.h"
+#include "amdgpu_trace.h"
+
+#include "sdma/sdma_4_4_2_offset.h"
+#include "sdma/sdma_4_4_2_sh_mask.h"
+
+#include "soc15_common.h"
+#include "soc15.h"
+#include "vega10_sdma_pkt_open.h"
+
+#include "ivsrcid/sdma0/irqsrcs_sdma0_4_0.h"
+#include "ivsrcid/sdma1/irqsrcs_sdma1_4_0.h"
+
+#include "amdgpu_ras.h"
+
+MODULE_FIRMWARE("amdgpu/sdma_4_4_2.bin");
+
+#define WREG32_SDMA(instance, offset, value) \
+	WREG32(sdma_v4_4_2_get_reg_offset(adev, (instance), (offset)), value)
+#define RREG32_SDMA(instance, offset) \
+	RREG32(sdma_v4_4_2_get_reg_offset(adev, (instance), (offset)))
+
+static void sdma_v4_4_2_set_ring_funcs(struct amdgpu_device *adev);
+static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev);
+static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev);
+static void sdma_v4_4_2_set_irq_funcs(struct amdgpu_device *adev);
+
+static u32 sdma_v4_4_2_get_reg_offset(struct amdgpu_device *adev,
+		u32 instance, u32 offset)
+{
+	return (adev->reg_offset[SDMA0_HWIP][instance][0] + offset);
+}
+
+static unsigned sdma_v4_4_2_seq_to_irq_id(int seq_num)
+{
+	switch (seq_num) {
+	case 0:
+		return SOC15_IH_CLIENTID_SDMA0;
+	case 1:
+		return SOC15_IH_CLIENTID_SDMA1;
+	case 2:
+		return SOC15_IH_CLIENTID_SDMA2;
+	case 3:
+		return SOC15_IH_CLIENTID_SDMA3;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int sdma_v4_4_2_irq_id_to_seq(unsigned client_id)
+{
+	switch (client_id) {
+	case SOC15_IH_CLIENTID_SDMA0:
+		return 0;
+	case SOC15_IH_CLIENTID_SDMA1:
+		return 1;
+	case SOC15_IH_CLIENTID_SDMA2:
+		return 2;
+	case SOC15_IH_CLIENTID_SDMA3:
+		return 3;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void sdma_v4_4_2_init_golden_registers(struct amdgpu_device *adev)
+{
+	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	case IP_VERSION(4, 4, 2):
+		break;
+	default:
+		break;
+	}
+}
+
+/**
+ * sdma_v4_4_2_init_microcode - load ucode images from disk
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Use the firmware interface to load the ucode images into
+ * the driver (not loaded into hw).
+ * Returns 0 on success, error on failure.
+ */
+static int sdma_v4_4_2_init_microcode(struct amdgpu_device *adev)
+{
+	int ret, i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 2)) {
+			ret = amdgpu_sdma_init_microcode(adev, 0, true);
+			break;
+		} else {
+			ret = amdgpu_sdma_init_microcode(adev, i, false);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * sdma_v4_4_2_ring_get_rptr - get the current read pointer
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Get the current rptr from the hardware.
+ */
+static uint64_t sdma_v4_4_2_ring_get_rptr(struct amdgpu_ring *ring)
+{
+	u64 *rptr;
+
+	/* XXX check if swapping is necessary on BE */
+	rptr = ((u64 *)&ring->adev->wb.wb[ring->rptr_offs]);
+
+	DRM_DEBUG("rptr before shift == 0x%016llx\n", *rptr);
+	return ((*rptr) >> 2);
+}
+
+/**
+ * sdma_v4_4_2_ring_get_wptr - get the current write pointer
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Get the current wptr from the hardware.
+ */
+static uint64_t sdma_v4_4_2_ring_get_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	u64 wptr;
+
+	if (ring->use_doorbell) {
+		/* XXX check if swapping is necessary on BE */
+		wptr = READ_ONCE(*((u64 *)&adev->wb.wb[ring->wptr_offs]));
+		DRM_DEBUG("wptr/doorbell before shift == 0x%016llx\n", wptr);
+	} else {
+		wptr = RREG32_SDMA(ring->me, regSDMA_GFX_RB_WPTR_HI);
+		wptr = wptr << 32;
+		wptr |= RREG32_SDMA(ring->me, regSDMA_GFX_RB_WPTR);
+		DRM_DEBUG("wptr before shift [%i] wptr == 0x%016llx\n",
+				ring->me, wptr);
+	}
+
+	return wptr >> 2;
+}
+
+/**
+ * sdma_v4_4_2_ring_set_wptr - commit the write pointer
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Write the wptr back to the hardware.
+ */
+static void sdma_v4_4_2_ring_set_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	DRM_DEBUG("Setting write pointer\n");
+	if (ring->use_doorbell) {
+		u64 *wb = (u64 *)&adev->wb.wb[ring->wptr_offs];
+
+		DRM_DEBUG("Using doorbell -- "
+				"wptr_offs == 0x%08x "
+				"lower_32_bits(ring->wptr) << 2 == 0x%08x "
+				"upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+				ring->wptr_offs,
+				lower_32_bits(ring->wptr << 2),
+				upper_32_bits(ring->wptr << 2));
+		/* XXX check if swapping is necessary on BE */
+		WRITE_ONCE(*wb, (ring->wptr << 2));
+		DRM_DEBUG("calling WDOORBELL64(0x%08x, 0x%016llx)\n",
+				ring->doorbell_index, ring->wptr << 2);
+		WDOORBELL64(ring->doorbell_index, ring->wptr << 2);
+	} else {
+		DRM_DEBUG("Not using doorbell -- "
+				"regSDMA%i_GFX_RB_WPTR == 0x%08x "
+				"regSDMA%i_GFX_RB_WPTR_HI == 0x%08x\n",
+				ring->me,
+				lower_32_bits(ring->wptr << 2),
+				ring->me,
+				upper_32_bits(ring->wptr << 2));
+		WREG32_SDMA(ring->me, regSDMA_GFX_RB_WPTR,
+			    lower_32_bits(ring->wptr << 2));
+		WREG32_SDMA(ring->me, regSDMA_GFX_RB_WPTR_HI,
+			    upper_32_bits(ring->wptr << 2));
+	}
+}
+
+/**
+ * sdma_v4_4_2_page_ring_get_wptr - get the current write pointer
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Get the current wptr from the hardware.
+ */
+static uint64_t sdma_v4_4_2_page_ring_get_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	u64 wptr;
+
+	if (ring->use_doorbell) {
+		/* XXX check if swapping is necessary on BE */
+		wptr = READ_ONCE(*((u64 *)&adev->wb.wb[ring->wptr_offs]));
+	} else {
+		wptr = RREG32_SDMA(ring->me, regSDMA_PAGE_RB_WPTR_HI);
+		wptr = wptr << 32;
+		wptr |= RREG32_SDMA(ring->me, regSDMA_PAGE_RB_WPTR);
+	}
+
+	return wptr >> 2;
+}
+
+/**
+ * sdma_v4_4_2_page_ring_set_wptr - commit the write pointer
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Write the wptr back to the hardware.
+ */
+static void sdma_v4_4_2_page_ring_set_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring->use_doorbell) {
+		u64 *wb = (u64 *)&adev->wb.wb[ring->wptr_offs];
+
+		/* XXX check if swapping is necessary on BE */
+		WRITE_ONCE(*wb, (ring->wptr << 2));
+		WDOORBELL64(ring->doorbell_index, ring->wptr << 2);
+	} else {
+		uint64_t wptr = ring->wptr << 2;
+
+		WREG32_SDMA(ring->me, regSDMA_PAGE_RB_WPTR,
+			    lower_32_bits(wptr));
+		WREG32_SDMA(ring->me, regSDMA_PAGE_RB_WPTR_HI,
+			    upper_32_bits(wptr));
+	}
+}
+
+static void sdma_v4_4_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
+{
+	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
+	int i;
+
+	for (i = 0; i < count; i++)
+		if (sdma && sdma->burst_nop && (i == 0))
+			amdgpu_ring_write(ring, ring->funcs->nop |
+				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
+		else
+			amdgpu_ring_write(ring, ring->funcs->nop);
+}
+
+/**
+ * sdma_v4_4_2_ring_emit_ib - Schedule an IB on the DMA engine
+ *
+ * @ring: amdgpu ring pointer
+ * @job: job to retrieve vmid from
+ * @ib: IB object to schedule
+ * @flags: unused
+ *
+ * Schedule an IB in the DMA ring.
+ */
+static void sdma_v4_4_2_ring_emit_ib(struct amdgpu_ring *ring,
+				   struct amdgpu_job *job,
+				   struct amdgpu_ib *ib,
+				   uint32_t flags)
+{
+	unsigned vmid = AMDGPU_JOB_GET_VMID(job);
+
+	/* IB packet must end on a 8 DW boundary */
+	sdma_v4_4_2_ring_insert_nop(ring, (2 - lower_32_bits(ring->wptr)) & 7);
+
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT) |
+			  SDMA_PKT_INDIRECT_HEADER_VMID(vmid & 0xf));
+	/* base must be 32 byte aligned */
+	amdgpu_ring_write(ring, lower_32_bits(ib->gpu_addr) & 0xffffffe0);
+	amdgpu_ring_write(ring, upper_32_bits(ib->gpu_addr));
+	amdgpu_ring_write(ring, ib->length_dw);
+	amdgpu_ring_write(ring, 0);
+	amdgpu_ring_write(ring, 0);
+
+}
+
+static void sdma_v4_4_2_wait_reg_mem(struct amdgpu_ring *ring,
+				   int mem_space, int hdp,
+				   uint32_t addr0, uint32_t addr1,
+				   uint32_t ref, uint32_t mask,
+				   uint32_t inv)
+{
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_POLL_REGMEM) |
+			  SDMA_PKT_POLL_REGMEM_HEADER_HDP_FLUSH(hdp) |
+			  SDMA_PKT_POLL_REGMEM_HEADER_MEM_POLL(mem_space) |
+			  SDMA_PKT_POLL_REGMEM_HEADER_FUNC(3)); /* == */
+	if (mem_space) {
+		/* memory */
+		amdgpu_ring_write(ring, addr0);
+		amdgpu_ring_write(ring, addr1);
+	} else {
+		/* registers */
+		amdgpu_ring_write(ring, addr0 << 2);
+		amdgpu_ring_write(ring, addr1 << 2);
+	}
+	amdgpu_ring_write(ring, ref); /* reference */
+	amdgpu_ring_write(ring, mask); /* mask */
+	amdgpu_ring_write(ring, SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |
+			  SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(inv)); /* retry count, poll interval */
+}
+
+/**
+ * sdma_v4_4_2_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
+ *
+ * @ring: amdgpu ring pointer
+ *
+ * Emit an hdp flush packet on the requested DMA ring.
+ */
+static void sdma_v4_4_2_ring_emit_hdp_flush(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	u32 ref_and_mask = 0;
+	const struct nbio_hdp_flush_reg *nbio_hf_reg = adev->nbio.hdp_flush_reg;
+
+	ref_and_mask = nbio_hf_reg->ref_and_mask_sdma0 << ring->me;
+
+	sdma_v4_4_2_wait_reg_mem(ring, 0, 1,
+			       adev->nbio.funcs->get_hdp_flush_done_offset(adev),
+			       adev->nbio.funcs->get_hdp_flush_req_offset(adev),
+			       ref_and_mask, ref_and_mask, 10);
+}
+
+/**
+ * sdma_v4_4_2_ring_emit_fence - emit a fence on the DMA ring
+ *
+ * @ring: amdgpu ring pointer
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
+ *
+ * Add a DMA fence packet to the ring to write
+ * the fence seq number and DMA trap packet to generate
+ * an interrupt if needed.
+ */
+static void sdma_v4_4_2_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
+				      unsigned flags)
+{
+	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
+	/* write the fence */
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_FENCE));
+	/* zero in first two bits */
+	BUG_ON(addr & 0x3);
+	amdgpu_ring_write(ring, lower_32_bits(addr));
+	amdgpu_ring_write(ring, upper_32_bits(addr));
+	amdgpu_ring_write(ring, lower_32_bits(seq));
+
+	/* optionally write high bits as well */
+	if (write64bit) {
+		addr += 4;
+		amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_FENCE));
+		/* zero in first two bits */
+		BUG_ON(addr & 0x3);
+		amdgpu_ring_write(ring, lower_32_bits(addr));
+		amdgpu_ring_write(ring, upper_32_bits(addr));
+		amdgpu_ring_write(ring, upper_32_bits(seq));
+	}
+
+	/* generate an interrupt */
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_TRAP));
+	amdgpu_ring_write(ring, SDMA_PKT_TRAP_INT_CONTEXT_INT_CONTEXT(0));
+}
+
+
+/**
+ * sdma_v4_4_2_gfx_stop - stop the gfx async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Stop the gfx async dma ring buffers.
+ */
+static void sdma_v4_4_2_gfx_stop(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *sdma[AMDGPU_MAX_SDMA_INSTANCES];
+	u32 rb_cntl, ib_cntl;
+	int i, unset = 0;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		sdma[i] = &adev->sdma.instance[i].ring;
+
+		if ((adev->mman.buffer_funcs_ring == sdma[i]) && unset != 1) {
+			amdgpu_ttm_set_buffer_funcs_status(adev, false);
+			unset = 1;
+		}
+
+		rb_cntl = RREG32_SDMA(i, regSDMA_GFX_RB_CNTL);
+		rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL, RB_ENABLE, 0);
+		WREG32_SDMA(i, regSDMA_GFX_RB_CNTL, rb_cntl);
+		ib_cntl = RREG32_SDMA(i, regSDMA_GFX_IB_CNTL);
+		ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_GFX_IB_CNTL, IB_ENABLE, 0);
+		WREG32_SDMA(i, regSDMA_GFX_IB_CNTL, ib_cntl);
+	}
+}
+
+/**
+ * sdma_v4_4_2_rlc_stop - stop the compute async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Stop the compute async dma queues.
+ */
+static void sdma_v4_4_2_rlc_stop(struct amdgpu_device *adev)
+{
+	/* XXX todo */
+}
+
+/**
+ * sdma_v4_4_2_page_stop - stop the page async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Stop the page async dma ring buffers.
+ */
+static void sdma_v4_4_2_page_stop(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *sdma[AMDGPU_MAX_SDMA_INSTANCES];
+	u32 rb_cntl, ib_cntl;
+	int i;
+	bool unset = false;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		sdma[i] = &adev->sdma.instance[i].page;
+
+		if ((adev->mman.buffer_funcs_ring == sdma[i]) &&
+			(!unset)) {
+			amdgpu_ttm_set_buffer_funcs_status(adev, false);
+			unset = true;
+		}
+
+		rb_cntl = RREG32_SDMA(i, regSDMA_PAGE_RB_CNTL);
+		rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_PAGE_RB_CNTL,
+					RB_ENABLE, 0);
+		WREG32_SDMA(i, regSDMA_PAGE_RB_CNTL, rb_cntl);
+		ib_cntl = RREG32_SDMA(i, regSDMA_PAGE_IB_CNTL);
+		ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_PAGE_IB_CNTL,
+					IB_ENABLE, 0);
+		WREG32_SDMA(i, regSDMA_PAGE_IB_CNTL, ib_cntl);
+	}
+}
+
+/**
+ * sdma_v4_4_2_ctx_switch_enable - stop the async dma engines context switch
+ *
+ * @adev: amdgpu_device pointer
+ * @enable: enable/disable the DMA MEs context switch.
+ *
+ * Halt or unhalt the async dma engines context switch.
+ */
+static void sdma_v4_4_2_ctx_switch_enable(struct amdgpu_device *adev, bool enable)
+{
+	u32 f32_cntl, phase_quantum = 0;
+	int i;
+
+	if (amdgpu_sdma_phase_quantum) {
+		unsigned value = amdgpu_sdma_phase_quantum;
+		unsigned unit = 0;
+
+		while (value > (SDMA_PHASE0_QUANTUM__VALUE_MASK >>
+				SDMA_PHASE0_QUANTUM__VALUE__SHIFT)) {
+			value = (value + 1) >> 1;
+			unit++;
+		}
+		if (unit > (SDMA_PHASE0_QUANTUM__UNIT_MASK >>
+			    SDMA_PHASE0_QUANTUM__UNIT__SHIFT)) {
+			value = (SDMA_PHASE0_QUANTUM__VALUE_MASK >>
+				 SDMA_PHASE0_QUANTUM__VALUE__SHIFT);
+			unit = (SDMA_PHASE0_QUANTUM__UNIT_MASK >>
+				SDMA_PHASE0_QUANTUM__UNIT__SHIFT);
+			WARN_ONCE(1,
+			"clamping sdma_phase_quantum to %uK clock cycles\n",
+				  value << unit);
+		}
+		phase_quantum =
+			value << SDMA_PHASE0_QUANTUM__VALUE__SHIFT |
+			unit  << SDMA_PHASE0_QUANTUM__UNIT__SHIFT;
+	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		f32_cntl = RREG32_SDMA(i, regSDMA_CNTL);
+		f32_cntl = REG_SET_FIELD(f32_cntl, SDMA_CNTL,
+				AUTO_CTXSW_ENABLE, enable ? 1 : 0);
+		if (enable && amdgpu_sdma_phase_quantum) {
+			WREG32_SDMA(i, regSDMA_PHASE0_QUANTUM, phase_quantum);
+			WREG32_SDMA(i, regSDMA_PHASE1_QUANTUM, phase_quantum);
+			WREG32_SDMA(i, regSDMA_PHASE2_QUANTUM, phase_quantum);
+		}
+		WREG32_SDMA(i, regSDMA_CNTL, f32_cntl);
+
+		/* Extend page fault timeout to avoid interrupt storm */
+		WREG32_SDMA(i, regSDMA_UTCL1_TIMEOUT, 0x00800080);
+	}
+
+}
+
+/**
+ * sdma_v4_4_2_enable - stop the async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ * @enable: enable/disable the DMA MEs.
+ *
+ * Halt or unhalt the async dma engines.
+ */
+static void sdma_v4_4_2_enable(struct amdgpu_device *adev, bool enable)
+{
+	u32 f32_cntl;
+	int i;
+
+	if (!enable) {
+		sdma_v4_4_2_gfx_stop(adev);
+		sdma_v4_4_2_rlc_stop(adev);
+		if (adev->sdma.has_page_queue)
+			sdma_v4_4_2_page_stop(adev);
+	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		f32_cntl = RREG32_SDMA(i, regSDMA_F32_CNTL);
+		f32_cntl = REG_SET_FIELD(f32_cntl, SDMA_F32_CNTL, HALT, enable ? 0 : 1);
+		WREG32_SDMA(i, regSDMA_F32_CNTL, f32_cntl);
+	}
+}
+
+/*
+ * sdma_v4_4_2_rb_cntl - get parameters for rb_cntl
+ */
+static uint32_t sdma_v4_4_2_rb_cntl(struct amdgpu_ring *ring, uint32_t rb_cntl)
+{
+	/* Set ring buffer size in dwords */
+	uint32_t rb_bufsz = order_base_2(ring->ring_size / 4);
+
+	barrier(); /* work around https://bugs.llvm.org/show_bug.cgi?id=42576 */
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL, RB_SIZE, rb_bufsz);
+#ifdef __BIG_ENDIAN
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL, RB_SWAP_ENABLE, 1);
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL,
+				RPTR_WRITEBACK_SWAP_ENABLE, 1);
+#endif
+	return rb_cntl;
+}
+
+/**
+ * sdma_v4_4_2_gfx_resume - setup and start the async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ * @i: instance to resume
+ *
+ * Set up the gfx DMA ring buffers and enable them.
+ * Returns 0 for success, error for failure.
+ */
+static void sdma_v4_4_2_gfx_resume(struct amdgpu_device *adev, unsigned int i)
+{
+	struct amdgpu_ring *ring = &adev->sdma.instance[i].ring;
+	u32 rb_cntl, ib_cntl, wptr_poll_cntl;
+	u32 wb_offset;
+	u32 doorbell;
+	u32 doorbell_offset;
+	u64 wptr_gpu_addr;
+
+	wb_offset = (ring->rptr_offs * 4);
+
+	rb_cntl = RREG32_SDMA(i, regSDMA_GFX_RB_CNTL);
+	rb_cntl = sdma_v4_4_2_rb_cntl(ring, rb_cntl);
+	WREG32_SDMA(i, regSDMA_GFX_RB_CNTL, rb_cntl);
+
+	/* Initialize the ring buffer's read and write pointers */
+	WREG32_SDMA(i, regSDMA_GFX_RB_RPTR, 0);
+	WREG32_SDMA(i, regSDMA_GFX_RB_RPTR_HI, 0);
+	WREG32_SDMA(i, regSDMA_GFX_RB_WPTR, 0);
+	WREG32_SDMA(i, regSDMA_GFX_RB_WPTR_HI, 0);
+
+	/* set the wb address whether it's enabled or not */
+	WREG32_SDMA(i, regSDMA_GFX_RB_RPTR_ADDR_HI,
+	       upper_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFF);
+	WREG32_SDMA(i, regSDMA_GFX_RB_RPTR_ADDR_LO,
+	       lower_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFC);
+
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL,
+				RPTR_WRITEBACK_ENABLE, 1);
+
+	WREG32_SDMA(i, regSDMA_GFX_RB_BASE, ring->gpu_addr >> 8);
+	WREG32_SDMA(i, regSDMA_GFX_RB_BASE_HI, ring->gpu_addr >> 40);
+
+	ring->wptr = 0;
+
+	/* before programing wptr to a less value, need set minor_ptr_update first */
+	WREG32_SDMA(i, regSDMA_GFX_MINOR_PTR_UPDATE, 1);
+
+	doorbell = RREG32_SDMA(i, regSDMA_GFX_DOORBELL);
+	doorbell_offset = RREG32_SDMA(i, regSDMA_GFX_DOORBELL_OFFSET);
+
+	doorbell = REG_SET_FIELD(doorbell, SDMA_GFX_DOORBELL, ENABLE,
+				 ring->use_doorbell);
+	doorbell_offset = REG_SET_FIELD(doorbell_offset,
+					SDMA_GFX_DOORBELL_OFFSET,
+					OFFSET, ring->doorbell_index);
+	WREG32_SDMA(i, regSDMA_GFX_DOORBELL, doorbell);
+	WREG32_SDMA(i, regSDMA_GFX_DOORBELL_OFFSET, doorbell_offset);
+
+	sdma_v4_4_2_ring_set_wptr(ring);
+
+	/* set minor_ptr_update to 0 after wptr programed */
+	WREG32_SDMA(i, regSDMA_GFX_MINOR_PTR_UPDATE, 0);
+
+	/* setup the wptr shadow polling */
+	wptr_gpu_addr = adev->wb.gpu_addr + (ring->wptr_offs * 4);
+	WREG32_SDMA(i, regSDMA_GFX_RB_WPTR_POLL_ADDR_LO,
+		    lower_32_bits(wptr_gpu_addr));
+	WREG32_SDMA(i, regSDMA_GFX_RB_WPTR_POLL_ADDR_HI,
+		    upper_32_bits(wptr_gpu_addr));
+	wptr_poll_cntl = RREG32_SDMA(i, regSDMA_GFX_RB_WPTR_POLL_CNTL);
+	wptr_poll_cntl = REG_SET_FIELD(wptr_poll_cntl,
+				       SDMA_GFX_RB_WPTR_POLL_CNTL,
+				       F32_POLL_ENABLE, amdgpu_sriov_vf(adev)? 1 : 0);
+	WREG32_SDMA(i, regSDMA_GFX_RB_WPTR_POLL_CNTL, wptr_poll_cntl);
+
+	/* enable DMA RB */
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_GFX_RB_CNTL, RB_ENABLE, 1);
+	WREG32_SDMA(i, regSDMA_GFX_RB_CNTL, rb_cntl);
+
+	ib_cntl = RREG32_SDMA(i, regSDMA_GFX_IB_CNTL);
+	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_GFX_IB_CNTL, IB_ENABLE, 1);
+#ifdef __BIG_ENDIAN
+	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_GFX_IB_CNTL, IB_SWAP_ENABLE, 1);
+#endif
+	/* enable DMA IBs */
+	WREG32_SDMA(i, regSDMA_GFX_IB_CNTL, ib_cntl);
+
+	ring->sched.ready = true;
+}
+
+/**
+ * sdma_v4_4_2_page_resume - setup and start the async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ * @i: instance to resume
+ *
+ * Set up the page DMA ring buffers and enable them.
+ * Returns 0 for success, error for failure.
+ */
+static void sdma_v4_4_2_page_resume(struct amdgpu_device *adev, unsigned int i)
+{
+	struct amdgpu_ring *ring = &adev->sdma.instance[i].page;
+	u32 rb_cntl, ib_cntl, wptr_poll_cntl;
+	u32 wb_offset;
+	u32 doorbell;
+	u32 doorbell_offset;
+	u64 wptr_gpu_addr;
+
+	wb_offset = (ring->rptr_offs * 4);
+
+	rb_cntl = RREG32_SDMA(i, regSDMA_PAGE_RB_CNTL);
+	rb_cntl = sdma_v4_4_2_rb_cntl(ring, rb_cntl);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_CNTL, rb_cntl);
+
+	/* Initialize the ring buffer's read and write pointers */
+	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR, 0);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_HI, 0);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR, 0);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_HI, 0);
+
+	/* set the wb address whether it's enabled or not */
+	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_ADDR_HI,
+	       upper_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFF);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_ADDR_LO,
+	       lower_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFC);
+
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_PAGE_RB_CNTL,
+				RPTR_WRITEBACK_ENABLE, 1);
+
+	WREG32_SDMA(i, regSDMA_PAGE_RB_BASE, ring->gpu_addr >> 8);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_BASE_HI, ring->gpu_addr >> 40);
+
+	ring->wptr = 0;
+
+	/* before programing wptr to a less value, need set minor_ptr_update first */
+	WREG32_SDMA(i, regSDMA_PAGE_MINOR_PTR_UPDATE, 1);
+
+	doorbell = RREG32_SDMA(i, regSDMA_PAGE_DOORBELL);
+	doorbell_offset = RREG32_SDMA(i, regSDMA_PAGE_DOORBELL_OFFSET);
+
+	doorbell = REG_SET_FIELD(doorbell, SDMA_PAGE_DOORBELL, ENABLE,
+				 ring->use_doorbell);
+	doorbell_offset = REG_SET_FIELD(doorbell_offset,
+					SDMA_PAGE_DOORBELL_OFFSET,
+					OFFSET, ring->doorbell_index);
+	WREG32_SDMA(i, regSDMA_PAGE_DOORBELL, doorbell);
+	WREG32_SDMA(i, regSDMA_PAGE_DOORBELL_OFFSET, doorbell_offset);
+
+	/* paging queue doorbell range is setup at sdma_v4_4_2_gfx_resume */
+	sdma_v4_4_2_page_ring_set_wptr(ring);
+
+	/* set minor_ptr_update to 0 after wptr programed */
+	WREG32_SDMA(i, regSDMA_PAGE_MINOR_PTR_UPDATE, 0);
+
+	/* setup the wptr shadow polling */
+	wptr_gpu_addr = adev->wb.gpu_addr + (ring->wptr_offs * 4);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_ADDR_LO,
+		    lower_32_bits(wptr_gpu_addr));
+	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_ADDR_HI,
+		    upper_32_bits(wptr_gpu_addr));
+	wptr_poll_cntl = RREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_CNTL);
+	wptr_poll_cntl = REG_SET_FIELD(wptr_poll_cntl,
+				       SDMA_PAGE_RB_WPTR_POLL_CNTL,
+				       F32_POLL_ENABLE, amdgpu_sriov_vf(adev)? 1 : 0);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_CNTL, wptr_poll_cntl);
+
+	/* enable DMA RB */
+	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_PAGE_RB_CNTL, RB_ENABLE, 1);
+	WREG32_SDMA(i, regSDMA_PAGE_RB_CNTL, rb_cntl);
+
+	ib_cntl = RREG32_SDMA(i, regSDMA_PAGE_IB_CNTL);
+	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_PAGE_IB_CNTL, IB_ENABLE, 1);
+#ifdef __BIG_ENDIAN
+	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_PAGE_IB_CNTL, IB_SWAP_ENABLE, 1);
+#endif
+	/* enable DMA IBs */
+	WREG32_SDMA(i, regSDMA_PAGE_IB_CNTL, ib_cntl);
+
+	ring->sched.ready = true;
+}
+
+static void sdma_v4_4_2_init_pg(struct amdgpu_device *adev)
+{
+
+}
+
+/**
+ * sdma_v4_4_2_rlc_resume - setup and start the async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Set up the compute DMA queues and enable them.
+ * Returns 0 for success, error for failure.
+ */
+static int sdma_v4_4_2_rlc_resume(struct amdgpu_device *adev)
+{
+	sdma_v4_4_2_init_pg(adev);
+
+	return 0;
+}
+
+/**
+ * sdma_v4_4_2_load_microcode - load the sDMA ME ucode
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Loads the sDMA0/1 ucode.
+ * Returns 0 for success, -EINVAL if the ucode is not available.
+ */
+static int sdma_v4_4_2_load_microcode(struct amdgpu_device *adev)
+{
+	const struct sdma_firmware_header_v1_0 *hdr;
+	const __le32 *fw_data;
+	u32 fw_size;
+	int i, j;
+
+	/* halt the MEs */
+	sdma_v4_4_2_enable(adev, false);
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (!adev->sdma.instance[i].fw)
+			return -EINVAL;
+
+		hdr = (const struct sdma_firmware_header_v1_0 *)adev->sdma.instance[i].fw->data;
+		amdgpu_ucode_print_sdma_hdr(&hdr->header);
+		fw_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
+
+		fw_data = (const __le32 *)
+			(adev->sdma.instance[i].fw->data +
+				le32_to_cpu(hdr->header.ucode_array_offset_bytes));
+
+		WREG32_SDMA(i, regSDMA_UCODE_ADDR, 0);
+
+		for (j = 0; j < fw_size; j++)
+			WREG32_SDMA(i, regSDMA_UCODE_DATA,
+				    le32_to_cpup(fw_data++));
+
+		WREG32_SDMA(i, regSDMA_UCODE_ADDR,
+			    adev->sdma.instance[i].fw_version);
+	}
+
+	return 0;
+}
+
+/**
+ * sdma_v4_4_2_start - setup and start the async dma engines
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Set up the DMA engines and enable them.
+ * Returns 0 for success, error for failure.
+ */
+static int sdma_v4_4_2_start(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+	int i, r = 0;
+
+	if (amdgpu_sriov_vf(adev)) {
+		sdma_v4_4_2_ctx_switch_enable(adev, false);
+		sdma_v4_4_2_enable(adev, false);
+	} else {
+		/* bypass sdma microcode loading on Gopher */
+		if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP &&
+		    !(adev->pdev->device == 0x49) && !(adev->pdev->device == 0x50)) {
+			r = sdma_v4_4_2_load_microcode(adev);
+			if (r)
+				return r;
+		}
+
+		/* unhalt the MEs */
+		sdma_v4_4_2_enable(adev, true);
+		/* enable sdma ring preemption */
+		sdma_v4_4_2_ctx_switch_enable(adev, true);
+	}
+
+	/* start the gfx rings and rlc compute queues */
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		uint32_t temp;
+
+		WREG32_SDMA(i, regSDMA_SEM_WAIT_FAIL_TIMER_CNTL, 0);
+		sdma_v4_4_2_gfx_resume(adev, i);
+		if (adev->sdma.has_page_queue)
+			sdma_v4_4_2_page_resume(adev, i);
+
+		/* set utc l1 enable flag always to 1 */
+		temp = RREG32_SDMA(i, regSDMA_CNTL);
+		temp = REG_SET_FIELD(temp, SDMA_CNTL, UTC_L1_ENABLE, 1);
+		WREG32_SDMA(i, regSDMA_CNTL, temp);
+
+		if (!amdgpu_sriov_vf(adev)) {
+			ring = &adev->sdma.instance[i].ring;
+			adev->nbio.funcs->sdma_doorbell_range(adev, i,
+				ring->use_doorbell, ring->doorbell_index,
+				adev->doorbell_index.sdma_doorbell_range);
+
+			/* unhalt engine */
+			temp = RREG32_SDMA(i, regSDMA_F32_CNTL);
+			temp = REG_SET_FIELD(temp, SDMA_F32_CNTL, HALT, 0);
+			WREG32_SDMA(i, regSDMA_F32_CNTL, temp);
+		}
+	}
+
+	if (amdgpu_sriov_vf(adev)) {
+		sdma_v4_4_2_ctx_switch_enable(adev, true);
+		sdma_v4_4_2_enable(adev, true);
+	} else {
+		r = sdma_v4_4_2_rlc_resume(adev);
+		if (r)
+			return r;
+	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		ring = &adev->sdma.instance[i].ring;
+
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			return r;
+
+		if (adev->sdma.has_page_queue) {
+			struct amdgpu_ring *page = &adev->sdma.instance[i].page;
+
+			r = amdgpu_ring_test_helper(page);
+			if (r)
+				return r;
+
+			if (adev->mman.buffer_funcs_ring == page)
+				amdgpu_ttm_set_buffer_funcs_status(adev, true);
+		}
+
+		if (adev->mman.buffer_funcs_ring == ring)
+			amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	}
+
+	return r;
+}
+
+/**
+ * sdma_v4_4_2_ring_test_ring - simple async dma engine test
+ *
+ * @ring: amdgpu_ring structure holding ring information
+ *
+ * Test the DMA engine by writing using it to write an
+ * value to memory.
+ * Returns 0 for success, error for failure.
+ */
+static int sdma_v4_4_2_ring_test_ring(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	unsigned i;
+	unsigned index;
+	int r;
+	u32 tmp;
+	u64 gpu_addr;
+
+	r = amdgpu_device_wb_get(adev, &index);
+	if (r)
+		return r;
+
+	gpu_addr = adev->wb.gpu_addr + (index * 4);
+	tmp = 0xCAFEDEAD;
+	adev->wb.wb[index] = cpu_to_le32(tmp);
+
+	r = amdgpu_ring_alloc(ring, 5);
+	if (r)
+		goto error_free_wb;
+
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_WRITE) |
+			  SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR));
+	amdgpu_ring_write(ring, lower_32_bits(gpu_addr));
+	amdgpu_ring_write(ring, upper_32_bits(gpu_addr));
+	amdgpu_ring_write(ring, SDMA_PKT_WRITE_UNTILED_DW_3_COUNT(0));
+	amdgpu_ring_write(ring, 0xDEADBEEF);
+	amdgpu_ring_commit(ring);
+
+	for (i = 0; i < adev->usec_timeout; i++) {
+		tmp = le32_to_cpu(adev->wb.wb[index]);
+		if (tmp == 0xDEADBEEF)
+			break;
+		udelay(1);
+	}
+
+	if (i >= adev->usec_timeout)
+		r = -ETIMEDOUT;
+
+error_free_wb:
+	amdgpu_device_wb_free(adev, index);
+	return r;
+}
+
+/**
+ * sdma_v4_4_2_ring_test_ib - test an IB on the DMA engine
+ *
+ * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
+ *
+ * Test a simple IB in the DMA ring.
+ * Returns 0 on success, error on failure.
+ */
+static int sdma_v4_4_2_ring_test_ib(struct amdgpu_ring *ring, long timeout)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_ib ib;
+	struct dma_fence *f = NULL;
+	unsigned index;
+	long r;
+	u32 tmp = 0;
+	u64 gpu_addr;
+
+	r = amdgpu_device_wb_get(adev, &index);
+	if (r)
+		return r;
+
+	gpu_addr = adev->wb.gpu_addr + (index * 4);
+	tmp = 0xCAFEDEAD;
+	adev->wb.wb[index] = cpu_to_le32(tmp);
+	memset(&ib, 0, sizeof(ib));
+	r = amdgpu_ib_get(adev, NULL, 256,
+					AMDGPU_IB_POOL_DIRECT, &ib);
+	if (r)
+		goto err0;
+
+	ib.ptr[0] = SDMA_PKT_HEADER_OP(SDMA_OP_WRITE) |
+		SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
+	ib.ptr[1] = lower_32_bits(gpu_addr);
+	ib.ptr[2] = upper_32_bits(gpu_addr);
+	ib.ptr[3] = SDMA_PKT_WRITE_UNTILED_DW_3_COUNT(0);
+	ib.ptr[4] = 0xDEADBEEF;
+	ib.ptr[5] = SDMA_PKT_NOP_HEADER_OP(SDMA_OP_NOP);
+	ib.ptr[6] = SDMA_PKT_NOP_HEADER_OP(SDMA_OP_NOP);
+	ib.ptr[7] = SDMA_PKT_NOP_HEADER_OP(SDMA_OP_NOP);
+	ib.length_dw = 8;
+
+	r = amdgpu_ib_schedule(ring, 1, &ib, NULL, &f);
+	if (r)
+		goto err1;
+
+	r = dma_fence_wait_timeout(f, false, timeout);
+	if (r == 0) {
+		r = -ETIMEDOUT;
+		goto err1;
+	} else if (r < 0) {
+		goto err1;
+	}
+	tmp = le32_to_cpu(adev->wb.wb[index]);
+	if (tmp == 0xDEADBEEF)
+		r = 0;
+	else
+		r = -EINVAL;
+
+err1:
+	amdgpu_ib_free(adev, &ib, NULL);
+	dma_fence_put(f);
+err0:
+	amdgpu_device_wb_free(adev, index);
+	return r;
+}
+
+
+/**
+ * sdma_v4_4_2_vm_copy_pte - update PTEs by copying them from the GART
+ *
+ * @ib: indirect buffer to fill with commands
+ * @pe: addr of the page entry
+ * @src: src addr to copy from
+ * @count: number of page entries to update
+ *
+ * Update PTEs by copying them from the GART using sDMA.
+ */
+static void sdma_v4_4_2_vm_copy_pte(struct amdgpu_ib *ib,
+				  uint64_t pe, uint64_t src,
+				  unsigned count)
+{
+	unsigned bytes = count * 8;
+
+	ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_COPY) |
+		SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR);
+	ib->ptr[ib->length_dw++] = bytes - 1;
+	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
+	ib->ptr[ib->length_dw++] = lower_32_bits(src);
+	ib->ptr[ib->length_dw++] = upper_32_bits(src);
+	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
+	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
+
+}
+
+/**
+ * sdma_v4_4_2_vm_write_pte - update PTEs by writing them manually
+ *
+ * @ib: indirect buffer to fill with commands
+ * @pe: addr of the page entry
+ * @value: dst addr to write into pe
+ * @count: number of page entries to update
+ * @incr: increase next addr by incr bytes
+ *
+ * Update PTEs by writing them manually using sDMA.
+ */
+static void sdma_v4_4_2_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
+				   uint64_t value, unsigned count,
+				   uint32_t incr)
+{
+	unsigned ndw = count * 2;
+
+	ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_WRITE) |
+		SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
+	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
+	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
+	ib->ptr[ib->length_dw++] = ndw - 1;
+	for (; ndw > 0; ndw -= 2) {
+		ib->ptr[ib->length_dw++] = lower_32_bits(value);
+		ib->ptr[ib->length_dw++] = upper_32_bits(value);
+		value += incr;
+	}
+}
+
+/**
+ * sdma_v4_4_2_vm_set_pte_pde - update the page tables using sDMA
+ *
+ * @ib: indirect buffer to fill with commands
+ * @pe: addr of the page entry
+ * @addr: dst addr to write into pe
+ * @count: number of page entries to update
+ * @incr: increase next addr by incr bytes
+ * @flags: access flags
+ *
+ * Update the page tables using sDMA.
+ */
+static void sdma_v4_4_2_vm_set_pte_pde(struct amdgpu_ib *ib,
+				     uint64_t pe,
+				     uint64_t addr, unsigned count,
+				     uint32_t incr, uint64_t flags)
+{
+	/* for physically contiguous pages (vram) */
+	ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_PTEPDE);
+	ib->ptr[ib->length_dw++] = lower_32_bits(pe); /* dst addr */
+	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
+	ib->ptr[ib->length_dw++] = lower_32_bits(flags); /* mask */
+	ib->ptr[ib->length_dw++] = upper_32_bits(flags);
+	ib->ptr[ib->length_dw++] = lower_32_bits(addr); /* value */
+	ib->ptr[ib->length_dw++] = upper_32_bits(addr);
+	ib->ptr[ib->length_dw++] = incr; /* increment size */
+	ib->ptr[ib->length_dw++] = 0;
+	ib->ptr[ib->length_dw++] = count - 1; /* number of entries */
+}
+
+/**
+ * sdma_v4_4_2_ring_pad_ib - pad the IB to the required number of dw
+ *
+ * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to fill with padding
+ */
+static void sdma_v4_4_2_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
+{
+	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
+	u32 pad_count;
+	int i;
+
+	pad_count = (-ib->length_dw) & 7;
+	for (i = 0; i < pad_count; i++)
+		if (sdma && sdma->burst_nop && (i == 0))
+			ib->ptr[ib->length_dw++] =
+				SDMA_PKT_HEADER_OP(SDMA_OP_NOP) |
+				SDMA_PKT_NOP_HEADER_COUNT(pad_count - 1);
+		else
+			ib->ptr[ib->length_dw++] =
+				SDMA_PKT_HEADER_OP(SDMA_OP_NOP);
+}
+
+
+/**
+ * sdma_v4_4_2_ring_emit_pipeline_sync - sync the pipeline
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Make sure all previous operations are completed (CIK).
+ */
+static void sdma_v4_4_2_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
+{
+	uint32_t seq = ring->fence_drv.sync_seq;
+	uint64_t addr = ring->fence_drv.gpu_addr;
+
+	/* wait for idle */
+	sdma_v4_4_2_wait_reg_mem(ring, 1, 0,
+			       addr & 0xfffffffc,
+			       upper_32_bits(addr) & 0xffffffff,
+			       seq, 0xffffffff, 4);
+}
+
+
+/**
+ * sdma_v4_4_2_ring_emit_vm_flush - vm flush using sDMA
+ *
+ * @ring: amdgpu_ring pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
+ *
+ * Update the page table base and flush the VM TLB
+ * using sDMA.
+ */
+static void sdma_v4_4_2_ring_emit_vm_flush(struct amdgpu_ring *ring,
+					 unsigned vmid, uint64_t pd_addr)
+{
+	amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
+}
+
+static void sdma_v4_4_2_ring_emit_wreg(struct amdgpu_ring *ring,
+				     uint32_t reg, uint32_t val)
+{
+	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_SRBM_WRITE) |
+			  SDMA_PKT_SRBM_WRITE_HEADER_BYTE_EN(0xf));
+	amdgpu_ring_write(ring, reg);
+	amdgpu_ring_write(ring, val);
+}
+
+static void sdma_v4_4_2_ring_emit_reg_wait(struct amdgpu_ring *ring, uint32_t reg,
+					 uint32_t val, uint32_t mask)
+{
+	sdma_v4_4_2_wait_reg_mem(ring, 0, 0, reg, 0, val, mask, 10);
+}
+
+static bool sdma_v4_4_2_fw_support_paging_queue(struct amdgpu_device *adev)
+{
+	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	case IP_VERSION(4, 4, 2):
+		return false;
+	default:
+		return false;
+	}
+}
+
+static int sdma_v4_4_2_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int r;
+
+	r = sdma_v4_4_2_init_microcode(adev);
+	if (r) {
+		DRM_ERROR("Failed to load sdma firmware!\n");
+		return r;
+	}
+
+	/* TODO: Page queue breaks driver reload under SRIOV */
+	if (sdma_v4_4_2_fw_support_paging_queue(adev))
+		adev->sdma.has_page_queue = true;
+
+	sdma_v4_4_2_set_ring_funcs(adev);
+	sdma_v4_4_2_set_buffer_funcs(adev);
+	sdma_v4_4_2_set_vm_pte_funcs(adev);
+	sdma_v4_4_2_set_irq_funcs(adev);
+
+	return 0;
+}
+
+#if 0
+static int sdma_v4_4_2_process_ras_data_cb(struct amdgpu_device *adev,
+		void *err_data,
+		struct amdgpu_iv_entry *entry);
+#endif
+
+static int sdma_v4_4_2_late_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+#if 0
+	struct ras_ih_if ih_info = {
+		.cb = sdma_v4_4_2_process_ras_data_cb,
+	};
+#endif
+	if (!amdgpu_persistent_edc_harvesting_supported(adev)) {
+		if (adev->sdma.ras && adev->sdma.ras->ras_block.hw_ops &&
+		    adev->sdma.ras->ras_block.hw_ops->reset_ras_error_count)
+			adev->sdma.ras->ras_block.hw_ops->reset_ras_error_count(adev);
+	}
+
+	return 0;
+}
+
+static int sdma_v4_4_2_sw_init(void *handle)
+{
+	struct amdgpu_ring *ring;
+	int r, i;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* SDMA trap event */
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_TRAP,
+				      &adev->sdma.trap_irq);
+		if (r)
+			return r;
+	}
+
+	/* SDMA SRAM ECC event */
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_SRAM_ECC,
+				      &adev->sdma.ecc_irq);
+		if (r)
+			return r;
+	}
+
+	/* SDMA VM_HOLE/DOORBELL_INV/POLL_TIMEOUT/SRBM_WRITE_PROTECTION event*/
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_VM_HOLE,
+				      &adev->sdma.vm_hole_irq);
+		if (r)
+			return r;
+
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_DOORBELL_INVALID,
+				      &adev->sdma.doorbell_invalid_irq);
+		if (r)
+			return r;
+
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_POLL_TIMEOUT,
+				      &adev->sdma.pool_timeout_irq);
+		if (r)
+			return r;
+
+		r = amdgpu_irq_add_id(adev, sdma_v4_4_2_seq_to_irq_id(i),
+				      SDMA0_4_0__SRCID__SDMA_SRBMWRITE,
+				      &adev->sdma.srbm_write_irq);
+		if (r)
+			return r;
+	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		ring = &adev->sdma.instance[i].ring;
+		ring->ring_obj = NULL;
+		ring->use_doorbell = true;
+
+		DRM_DEBUG("SDMA %d use_doorbell being set to: [%s]\n", i,
+				ring->use_doorbell?"true":"false");
+
+		/* doorbell size is 2 dwords, get DWORD offset */
+		ring->doorbell_index = adev->doorbell_index.sdma_engine[i] << 1;
+
+		sprintf(ring->name, "sdma%d", i);
+		r = amdgpu_ring_init(adev, ring, 1024, &adev->sdma.trap_irq,
+				     AMDGPU_SDMA_IRQ_INSTANCE0 + i,
+				     AMDGPU_RING_PRIO_DEFAULT, NULL);
+		if (r)
+			return r;
+
+		if (adev->sdma.has_page_queue) {
+			ring = &adev->sdma.instance[i].page;
+			ring->ring_obj = NULL;
+			ring->use_doorbell = true;
+
+			/* paging queue use same doorbell index/routing as gfx queue
+			 * with 0x400 (4096 dwords) offset on second doorbell page
+			 */
+			ring->doorbell_index = adev->doorbell_index.sdma_engine[i] << 1;
+			ring->doorbell_index += 0x400;
+
+			sprintf(ring->name, "page%d", i);
+			r = amdgpu_ring_init(adev, ring, 1024,
+					     &adev->sdma.trap_irq,
+					     AMDGPU_SDMA_IRQ_INSTANCE0 + i,
+					     AMDGPU_RING_PRIO_DEFAULT, NULL);
+			if (r)
+				return r;
+		}
+	}
+
+	return r;
+}
+
+static int sdma_v4_4_2_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		amdgpu_ring_fini(&adev->sdma.instance[i].ring);
+		if (adev->sdma.has_page_queue)
+			amdgpu_ring_fini(&adev->sdma.instance[i].page);
+	}
+
+	if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 2))
+		amdgpu_sdma_destroy_inst_ctx(adev, true);
+	else
+		amdgpu_sdma_destroy_inst_ctx(adev, false);
+
+	return 0;
+}
+
+static int sdma_v4_4_2_hw_init(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (adev->flags & AMD_IS_APU)
+		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_SDMA, false);
+
+	if (!amdgpu_sriov_vf(adev))
+		sdma_v4_4_2_init_golden_registers(adev);
+
+	r = sdma_v4_4_2_start(adev);
+
+	return r;
+}
+
+static int sdma_v4_4_2_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
+
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		amdgpu_irq_put(adev, &adev->sdma.ecc_irq,
+			       AMDGPU_SDMA_IRQ_INSTANCE0 + i);
+	}
+
+	sdma_v4_4_2_ctx_switch_enable(adev, false);
+	sdma_v4_4_2_enable(adev, false);
+
+	return 0;
+}
+
+static int sdma_v4_4_2_suspend(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return sdma_v4_4_2_hw_fini(adev);
+}
+
+static int sdma_v4_4_2_resume(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return sdma_v4_4_2_hw_init(adev);
+}
+
+static bool sdma_v4_4_2_is_idle(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	u32 i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		u32 tmp = RREG32_SDMA(i, regSDMA_STATUS_REG);
+
+		if (!(tmp & SDMA_STATUS_REG__IDLE_MASK))
+			return false;
+	}
+
+	return true;
+}
+
+static int sdma_v4_4_2_wait_for_idle(void *handle)
+{
+	unsigned i, j;
+	u32 sdma[AMDGPU_MAX_SDMA_INSTANCES];
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	for (i = 0; i < adev->usec_timeout; i++) {
+		for (j = 0; j < adev->sdma.num_instances; j++) {
+			sdma[j] = RREG32_SDMA(j, regSDMA_STATUS_REG);
+			if (!(sdma[j] & SDMA_STATUS_REG__IDLE_MASK))
+				break;
+		}
+		if (j == adev->sdma.num_instances)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int sdma_v4_4_2_soft_reset(void *handle)
+{
+	/* todo */
+
+	return 0;
+}
+
+static int sdma_v4_4_2_set_trap_irq_state(struct amdgpu_device *adev,
+					struct amdgpu_irq_src *source,
+					unsigned type,
+					enum amdgpu_interrupt_state state)
+{
+	u32 sdma_cntl;
+
+	sdma_cntl = RREG32_SDMA(type, regSDMA_CNTL);
+	sdma_cntl = REG_SET_FIELD(sdma_cntl, SDMA_CNTL, TRAP_ENABLE,
+		       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+	WREG32_SDMA(type, regSDMA_CNTL, sdma_cntl);
+
+	return 0;
+}
+
+static int sdma_v4_4_2_process_trap_irq(struct amdgpu_device *adev,
+				      struct amdgpu_irq_src *source,
+				      struct amdgpu_iv_entry *entry)
+{
+	uint32_t instance;
+
+	DRM_DEBUG("IH: SDMA trap\n");
+	instance = sdma_v4_4_2_irq_id_to_seq(entry->client_id);
+	switch (entry->ring_id) {
+	case 0:
+		amdgpu_fence_process(&adev->sdma.instance[instance].ring);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+#if 0
+static int sdma_v4_4_2_process_ras_data_cb(struct amdgpu_device *adev,
+		void *err_data,
+		struct amdgpu_iv_entry *entry)
+{
+	int instance;
+
+	/* When “Full RAS” is enabled, the per-IP interrupt sources should
+	 * be disabled and the driver should only look for the aggregated
+	 * interrupt via sync flood
+	 */
+	if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
+		goto out;
+
+	instance = sdma_v4_4_2_irq_id_to_seq(entry->client_id);
+	if (instance < 0)
+		goto out;
+
+	amdgpu_sdma_process_ras_data_cb(adev, err_data, entry);
+
+out:
+	return AMDGPU_RAS_SUCCESS;
+}
+#endif
+
+static int sdma_v4_4_2_process_illegal_inst_irq(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      struct amdgpu_iv_entry *entry)
+{
+	int instance;
+
+	DRM_ERROR("Illegal instruction in SDMA command stream\n");
+
+	instance = sdma_v4_4_2_irq_id_to_seq(entry->client_id);
+	if (instance < 0)
+		return 0;
+
+	switch (entry->ring_id) {
+	case 0:
+		drm_sched_fault(&adev->sdma.instance[instance].ring.sched);
+		break;
+	}
+	return 0;
+}
+
+static int sdma_v4_4_2_set_ecc_irq_state(struct amdgpu_device *adev,
+					struct amdgpu_irq_src *source,
+					unsigned type,
+					enum amdgpu_interrupt_state state)
+{
+	u32 sdma_edc_config;
+
+	sdma_edc_config = RREG32_SDMA(type, regCC_SDMA_EDC_CONFIG);
+	/*
+	 * FIXME: This was inherited from Aldebaran, but no this field
+	 * definition in the regspec of both Aldebaran and SDMA 4.4.2
+	 */
+	sdma_edc_config |= (state == AMDGPU_IRQ_STATE_ENABLE) ? (1 << 2) : 0;
+	WREG32_SDMA(type, regCC_SDMA_EDC_CONFIG, sdma_edc_config);
+
+	return 0;
+}
+
+static int sdma_v4_4_2_print_iv_entry(struct amdgpu_device *adev,
+					      struct amdgpu_iv_entry *entry)
+{
+	int instance;
+	struct amdgpu_task_info task_info;
+	u64 addr;
+
+	instance = sdma_v4_4_2_irq_id_to_seq(entry->client_id);
+	if (instance < 0 || instance >= adev->sdma.num_instances) {
+		dev_err(adev->dev, "sdma instance invalid %d\n", instance);
+		return -EINVAL;
+	}
+
+	addr = (u64)entry->src_data[0] << 12;
+	addr |= ((u64)entry->src_data[1] & 0xf) << 44;
+
+	memset(&task_info, 0, sizeof(struct amdgpu_task_info));
+	amdgpu_vm_get_task_info(adev, entry->pasid, &task_info);
+
+	dev_dbg_ratelimited(adev->dev,
+		   "[sdma%d] address:0x%016llx src_id:%u ring:%u vmid:%u "
+		   "pasid:%u, for process %s pid %d thread %s pid %d\n",
+		   instance, addr, entry->src_id, entry->ring_id, entry->vmid,
+		   entry->pasid, task_info.process_name, task_info.tgid,
+		   task_info.task_name, task_info.pid);
+	return 0;
+}
+
+static int sdma_v4_4_2_process_vm_hole_irq(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      struct amdgpu_iv_entry *entry)
+{
+	dev_dbg_ratelimited(adev->dev, "MC or SEM address in VM hole\n");
+	sdma_v4_4_2_print_iv_entry(adev, entry);
+	return 0;
+}
+
+static int sdma_v4_4_2_process_doorbell_invalid_irq(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      struct amdgpu_iv_entry *entry)
+{
+
+	dev_dbg_ratelimited(adev->dev, "SDMA received a doorbell from BIF with byte_enable !=0xff\n");
+	sdma_v4_4_2_print_iv_entry(adev, entry);
+	return 0;
+}
+
+static int sdma_v4_4_2_process_pool_timeout_irq(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      struct amdgpu_iv_entry *entry)
+{
+	dev_dbg_ratelimited(adev->dev,
+		"Polling register/memory timeout executing POLL_REG/MEM with finite timer\n");
+	sdma_v4_4_2_print_iv_entry(adev, entry);
+	return 0;
+}
+
+static int sdma_v4_4_2_process_srbm_write_irq(struct amdgpu_device *adev,
+					      struct amdgpu_irq_src *source,
+					      struct amdgpu_iv_entry *entry)
+{
+	dev_dbg_ratelimited(adev->dev,
+		"SDMA gets an Register Write SRBM_WRITE command in non-privilege command buffer\n");
+	sdma_v4_4_2_print_iv_entry(adev, entry);
+	return 0;
+}
+
+static void sdma_v4_4_2_update_medium_grain_clock_gating(
+		struct amdgpu_device *adev,
+		bool enable)
+{
+	uint32_t data, def;
+	int i;
+
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_SDMA_MGCG)) {
+		for (i = 0; i < adev->sdma.num_instances; i++) {
+			def = data = RREG32_SDMA(i, regSDMA_CLK_CTRL);
+			data &= ~(SDMA_CLK_CTRL__SOFT_OVERRIDE7_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE6_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE5_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE4_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE3_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE2_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE1_MASK |
+				  SDMA_CLK_CTRL__SOFT_OVERRIDE0_MASK);
+			if (def != data)
+				WREG32_SDMA(i, regSDMA_CLK_CTRL, data);
+		}
+	} else {
+		for (i = 0; i < adev->sdma.num_instances; i++) {
+			def = data = RREG32_SDMA(i, regSDMA_CLK_CTRL);
+			data |= (SDMA_CLK_CTRL__SOFT_OVERRIDE7_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE6_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE5_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE4_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE3_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE2_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE1_MASK |
+				 SDMA_CLK_CTRL__SOFT_OVERRIDE0_MASK);
+			if (def != data)
+				WREG32_SDMA(i, regSDMA_CLK_CTRL, data);
+		}
+	}
+}
+
+
+static void sdma_v4_4_2_update_medium_grain_light_sleep(
+		struct amdgpu_device *adev,
+		bool enable)
+{
+	uint32_t data, def;
+	int i;
+
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_SDMA_LS)) {
+		for (i = 0; i < adev->sdma.num_instances; i++) {
+			/* 1-not override: enable sdma mem light sleep */
+			def = data = RREG32_SDMA(0, regSDMA_POWER_CNTL);
+			data |= SDMA_POWER_CNTL__MEM_POWER_OVERRIDE_MASK;
+			if (def != data)
+				WREG32_SDMA(0, regSDMA_POWER_CNTL, data);
+		}
+	} else {
+		for (i = 0; i < adev->sdma.num_instances; i++) {
+		/* 0-override:disable sdma mem light sleep */
+			def = data = RREG32_SDMA(0, regSDMA_POWER_CNTL);
+			data &= ~SDMA_POWER_CNTL__MEM_POWER_OVERRIDE_MASK;
+			if (def != data)
+				WREG32_SDMA(0, regSDMA_POWER_CNTL, data);
+		}
+	}
+}
+
+static int sdma_v4_4_2_set_clockgating_state(void *handle,
+					  enum amd_clockgating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
+	sdma_v4_4_2_update_medium_grain_clock_gating(adev,
+			state == AMD_CG_STATE_GATE);
+	sdma_v4_4_2_update_medium_grain_light_sleep(adev,
+			state == AMD_CG_STATE_GATE);
+	return 0;
+}
+
+static int sdma_v4_4_2_set_powergating_state(void *handle,
+					  enum amd_powergating_state state)
+{
+	return 0;
+}
+
+static void sdma_v4_4_2_get_clockgating_state(void *handle, u64 *flags)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int data;
+
+	if (amdgpu_sriov_vf(adev))
+		*flags = 0;
+
+	/* AMD_CG_SUPPORT_SDMA_MGCG */
+	data = RREG32(SOC15_REG_OFFSET(SDMA0, 0, regSDMA_CLK_CTRL));
+	if (!(data & SDMA_CLK_CTRL__SOFT_OVERRIDE7_MASK))
+		*flags |= AMD_CG_SUPPORT_SDMA_MGCG;
+
+	/* AMD_CG_SUPPORT_SDMA_LS */
+	data = RREG32(SOC15_REG_OFFSET(SDMA0, 0, regSDMA_POWER_CNTL));
+	if (data & SDMA_POWER_CNTL__MEM_POWER_OVERRIDE_MASK)
+		*flags |= AMD_CG_SUPPORT_SDMA_LS;
+}
+
+const struct amd_ip_funcs sdma_v4_4_2_ip_funcs = {
+	.name = "sdma_v4_4_2",
+	.early_init = sdma_v4_4_2_early_init,
+	.late_init = sdma_v4_4_2_late_init,
+	.sw_init = sdma_v4_4_2_sw_init,
+	.sw_fini = sdma_v4_4_2_sw_fini,
+	.hw_init = sdma_v4_4_2_hw_init,
+	.hw_fini = sdma_v4_4_2_hw_fini,
+	.suspend = sdma_v4_4_2_suspend,
+	.resume = sdma_v4_4_2_resume,
+	.is_idle = sdma_v4_4_2_is_idle,
+	.wait_for_idle = sdma_v4_4_2_wait_for_idle,
+	.soft_reset = sdma_v4_4_2_soft_reset,
+	.set_clockgating_state = sdma_v4_4_2_set_clockgating_state,
+	.set_powergating_state = sdma_v4_4_2_set_powergating_state,
+	.get_clockgating_state = sdma_v4_4_2_get_clockgating_state,
+};
+
+static const struct amdgpu_ring_funcs sdma_v4_4_2_ring_funcs = {
+	.type = AMDGPU_RING_TYPE_SDMA,
+	.align_mask = 0xf,
+	.nop = SDMA_PKT_NOP_HEADER_OP(SDMA_OP_NOP),
+	.support_64bit_ptrs = true,
+	.vmhub = AMDGPU_MMHUB_0,
+	.get_rptr = sdma_v4_4_2_ring_get_rptr,
+	.get_wptr = sdma_v4_4_2_ring_get_wptr,
+	.set_wptr = sdma_v4_4_2_ring_set_wptr,
+	.emit_frame_size =
+		6 + /* sdma_v4_4_2_ring_emit_hdp_flush */
+		3 + /* hdp invalidate */
+		6 + /* sdma_v4_4_2_ring_emit_pipeline_sync */
+		/* sdma_v4_4_2_ring_emit_vm_flush */
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 3 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 6 +
+		10 + 10 + 10, /* sdma_v4_4_2_ring_emit_fence x3 for user fence, vm fence */
+	.emit_ib_size = 7 + 6, /* sdma_v4_4_2_ring_emit_ib */
+	.emit_ib = sdma_v4_4_2_ring_emit_ib,
+	.emit_fence = sdma_v4_4_2_ring_emit_fence,
+	.emit_pipeline_sync = sdma_v4_4_2_ring_emit_pipeline_sync,
+	.emit_vm_flush = sdma_v4_4_2_ring_emit_vm_flush,
+	.emit_hdp_flush = sdma_v4_4_2_ring_emit_hdp_flush,
+	.test_ring = sdma_v4_4_2_ring_test_ring,
+	.test_ib = sdma_v4_4_2_ring_test_ib,
+	.insert_nop = sdma_v4_4_2_ring_insert_nop,
+	.pad_ib = sdma_v4_4_2_ring_pad_ib,
+	.emit_wreg = sdma_v4_4_2_ring_emit_wreg,
+	.emit_reg_wait = sdma_v4_4_2_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = amdgpu_ring_emit_reg_write_reg_wait_helper,
+};
+
+static const struct amdgpu_ring_funcs sdma_v4_4_2_page_ring_funcs = {
+	.type = AMDGPU_RING_TYPE_SDMA,
+	.align_mask = 0xf,
+	.nop = SDMA_PKT_NOP_HEADER_OP(SDMA_OP_NOP),
+	.support_64bit_ptrs = true,
+	.vmhub = AMDGPU_MMHUB_0,
+	.get_rptr = sdma_v4_4_2_ring_get_rptr,
+	.get_wptr = sdma_v4_4_2_page_ring_get_wptr,
+	.set_wptr = sdma_v4_4_2_page_ring_set_wptr,
+	.emit_frame_size =
+		6 + /* sdma_v4_4_2_ring_emit_hdp_flush */
+		3 + /* hdp invalidate */
+		6 + /* sdma_v4_4_2_ring_emit_pipeline_sync */
+		/* sdma_v4_4_2_ring_emit_vm_flush */
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 3 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 6 +
+		10 + 10 + 10, /* sdma_v4_4_2_ring_emit_fence x3 for user fence, vm fence */
+	.emit_ib_size = 7 + 6, /* sdma_v4_4_2_ring_emit_ib */
+	.emit_ib = sdma_v4_4_2_ring_emit_ib,
+	.emit_fence = sdma_v4_4_2_ring_emit_fence,
+	.emit_pipeline_sync = sdma_v4_4_2_ring_emit_pipeline_sync,
+	.emit_vm_flush = sdma_v4_4_2_ring_emit_vm_flush,
+	.emit_hdp_flush = sdma_v4_4_2_ring_emit_hdp_flush,
+	.test_ring = sdma_v4_4_2_ring_test_ring,
+	.test_ib = sdma_v4_4_2_ring_test_ib,
+	.insert_nop = sdma_v4_4_2_ring_insert_nop,
+	.pad_ib = sdma_v4_4_2_ring_pad_ib,
+	.emit_wreg = sdma_v4_4_2_ring_emit_wreg,
+	.emit_reg_wait = sdma_v4_4_2_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = amdgpu_ring_emit_reg_write_reg_wait_helper,
+};
+
+static void sdma_v4_4_2_set_ring_funcs(struct amdgpu_device *adev)
+{
+	int i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		adev->sdma.instance[i].ring.funcs = &sdma_v4_4_2_ring_funcs;
+		adev->sdma.instance[i].ring.me = i;
+		if (adev->sdma.has_page_queue) {
+			adev->sdma.instance[i].page.funcs =
+				&sdma_v4_4_2_page_ring_funcs;
+			adev->sdma.instance[i].page.me = i;
+		}
+	}
+}
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_trap_irq_funcs = {
+	.set = sdma_v4_4_2_set_trap_irq_state,
+	.process = sdma_v4_4_2_process_trap_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_illegal_inst_irq_funcs = {
+	.process = sdma_v4_4_2_process_illegal_inst_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_ecc_irq_funcs = {
+	.set = sdma_v4_4_2_set_ecc_irq_state,
+	.process = amdgpu_sdma_process_ecc_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_vm_hole_irq_funcs = {
+	.process = sdma_v4_4_2_process_vm_hole_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_doorbell_invalid_irq_funcs = {
+	.process = sdma_v4_4_2_process_doorbell_invalid_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_pool_timeout_irq_funcs = {
+	.process = sdma_v4_4_2_process_pool_timeout_irq,
+};
+
+static const struct amdgpu_irq_src_funcs sdma_v4_4_2_srbm_write_irq_funcs = {
+	.process = sdma_v4_4_2_process_srbm_write_irq,
+};
+
+static void sdma_v4_4_2_set_irq_funcs(struct amdgpu_device *adev)
+{
+	adev->sdma.trap_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.ecc_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.vm_hole_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.doorbell_invalid_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.pool_timeout_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.srbm_write_irq.num_types = adev->sdma.num_instances;
+
+	adev->sdma.trap_irq.funcs = &sdma_v4_4_2_trap_irq_funcs;
+	adev->sdma.illegal_inst_irq.funcs = &sdma_v4_4_2_illegal_inst_irq_funcs;
+	adev->sdma.ecc_irq.funcs = &sdma_v4_4_2_ecc_irq_funcs;
+	adev->sdma.vm_hole_irq.funcs = &sdma_v4_4_2_vm_hole_irq_funcs;
+	adev->sdma.doorbell_invalid_irq.funcs = &sdma_v4_4_2_doorbell_invalid_irq_funcs;
+	adev->sdma.pool_timeout_irq.funcs = &sdma_v4_4_2_pool_timeout_irq_funcs;
+	adev->sdma.srbm_write_irq.funcs = &sdma_v4_4_2_srbm_write_irq_funcs;
+}
+
+/**
+ * sdma_v4_4_2_emit_copy_buffer - copy buffer using the sDMA engine
+ *
+ * @ib: indirect buffer to copy to
+ * @src_offset: src GPU address
+ * @dst_offset: dst GPU address
+ * @byte_count: number of bytes to xfer
+ * @tmz: if a secure copy should be used
+ *
+ * Copy GPU buffers using the DMA engine.
+ * Used by the amdgpu ttm implementation to move pages if
+ * registered as the asic copy callback.
+ */
+static void sdma_v4_4_2_emit_copy_buffer(struct amdgpu_ib *ib,
+				       uint64_t src_offset,
+				       uint64_t dst_offset,
+				       uint32_t byte_count,
+				       bool tmz)
+{
+	ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_COPY) |
+		SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR) |
+		SDMA_PKT_COPY_LINEAR_HEADER_TMZ(tmz ? 1 : 0);
+	ib->ptr[ib->length_dw++] = byte_count - 1;
+	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
+	ib->ptr[ib->length_dw++] = lower_32_bits(src_offset);
+	ib->ptr[ib->length_dw++] = upper_32_bits(src_offset);
+	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
+	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
+}
+
+/**
+ * sdma_v4_4_2_emit_fill_buffer - fill buffer using the sDMA engine
+ *
+ * @ib: indirect buffer to copy to
+ * @src_data: value to write to buffer
+ * @dst_offset: dst GPU address
+ * @byte_count: number of bytes to xfer
+ *
+ * Fill GPU buffers using the DMA engine.
+ */
+static void sdma_v4_4_2_emit_fill_buffer(struct amdgpu_ib *ib,
+				       uint32_t src_data,
+				       uint64_t dst_offset,
+				       uint32_t byte_count)
+{
+	ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_CONST_FILL);
+	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
+	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
+	ib->ptr[ib->length_dw++] = src_data;
+	ib->ptr[ib->length_dw++] = byte_count - 1;
+}
+
+static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
+	.copy_max_bytes = 0x400000,
+	.copy_num_dw = 7,
+	.emit_copy_buffer = sdma_v4_4_2_emit_copy_buffer,
+
+	.fill_max_bytes = 0x400000,
+	.fill_num_dw = 5,
+	.emit_fill_buffer = sdma_v4_4_2_emit_fill_buffer,
+};
+
+static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
+{
+	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
+	if (adev->sdma.has_page_queue)
+		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
+	else
+		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+}
+
+static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v4_4_2_vm_copy_pte,
+
+	.write_pte = sdma_v4_4_2_vm_write_pte,
+	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
+};
+
+static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
+{
+	struct drm_gpu_scheduler *sched;
+	unsigned i;
+
+	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->vm_manager.vm_pte_scheds[i] = sched;
+	}
+	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+}
+
+const struct amdgpu_ip_block_version sdma_v4_4_2_ip_block = {
+	.type = AMD_IP_BLOCK_TYPE_SDMA,
+	.major = 4,
+	.minor = 4,
+	.rev = 0,
+	.funcs = &sdma_v4_4_2_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h
new file mode 100644
index 000000000000..4814e8a074d6
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#ifndef __SDMA_V4_4_2_H__
+#define __SDMA_V4_4_2_H__
+
+extern const struct amd_ip_funcs sdma_v4_4_2_ip_funcs;
+extern const struct amdgpu_ip_block_version sdma_v4_4_2_ip_block;
+
+#endif
-- 
2.39.2

