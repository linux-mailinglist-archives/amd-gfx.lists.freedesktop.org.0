Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06622517721
	for <lists+amd-gfx@lfdr.de>; Mon,  2 May 2022 21:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0A310F293;
	Mon,  2 May 2022 19:08:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0092A10EA99
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 May 2022 19:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhzazdvIkXV5jJlKQM4izlqK7XB/MCgf4x8ggmab/Xp1GVIXbhsan6X33zJ3ZTz5keSnGsVZ45s/uEnTcpXoOGrMr0xo1z8f1eu9dsioPZA+HlY59ExMgZ8fVSH2NBenwRTv/G9uQQKKK9SrdwCSPz0pAl9rcd7ZkhEf6hF5Gkz9rqFTPXiUgSTOQVofFdnBloSNyCoqX1wD5FgmB7vjuAufZGXbBj5djnIjs8ONSnPxzB8YzGLaGtXp7/JB9FmtPSZXAX7A1VnhieQrWT+15muSOwKtErjEI7lJnRXlY+YXqpAuwmxeRdR8VY8PSjoTubU8r4DoElHQiyYa9K5Oow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NttVvOg5QdUWuUPs00fNXoPxXLfqQjhNJYroOKTrlIU=;
 b=AZrgSaKS6pr3FDZmjk+6hMAuGeOgJlCwBG3RnUmTP1hC/1nLu0rZe7wWnI+Q3NozHN6WgRrW9txeWToC6nJbXi8IVnw5yW6T88JKxSObVKUf4SBy3nbD3b3eb1rnocMdbMaCOkqFJ1Fl8XEFL/woKZ4K57z0DDiOGoh/pULyrXrgh0HldfagahjQC9JHKxplPuENGW2t8NXVBDK1xjRkVs2fCpAhAlpuzRLMZO0VOir6MOYpRDiwgLD7R4oPcoyPNOw2pYZWTno0cPqMtHmAVZmUiYaVICU7Jr8lG07LkMUdnZssX6qb3FZIHm7yRBrNdslvuWIB+5dTOrQRm4L1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NttVvOg5QdUWuUPs00fNXoPxXLfqQjhNJYroOKTrlIU=;
 b=Tuq0mMsyAKJ99DV8jd3qjz3hGRBSWhLRFo4Mqse+y+BRVQbl+Q1AgtY8pUpHv+hY5vTLuES1W3wJSZKifBYdMX7rVFZcBZtI6BqcEhlkd64sl/I3XSJuV19wHhNmecJvDlGouNhe0fP90jEfwQYOUOKgPwkSeXQh3c0DoZLSvpc=
Received: from MW4PR03CA0039.namprd03.prod.outlook.com (2603:10b6:303:8e::14)
 by CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 19:08:21 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::c6) by MW4PR03CA0039.outlook.office365.com
 (2603:10b6:303:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Mon, 2 May 2022 19:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 19:08:20 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 14:08:17 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/amdgpu: add VCN4 ip block support
Date: Mon, 2 May 2022 15:07:58 -0400
Message-ID: <20220502190804.784271-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502190804.784271-1-alexander.deucher@amd.com>
References: <20220502190804.784271-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 052fd29b-da08-4652-4474-08da2c6f1f85
X-MS-TrafficTypeDiagnostic: CY5PR12MB6179:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB617924129DD8B292C274D08FF7C19@CY5PR12MB6179.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBx3H9iAMHyXcUK3RWcH+AJsz0wcxvAUY9yL33L7MJuOEdjafpzfmpj7qgI4vBHNhWchm1kPFlY2cJXW813g5lnFG61TXcFL/XKNJyxMoIqepGG5RKdNmD/oBtEdTySnfp6NJOt8aOe9JBS06RaixMRVj5aAHvhW3rTDeyETcO86f9Jk7oAs1hpQ2WmQxwrECOKBXRpMGEBR1naj8cPdyqj4jXf6NFaBnXNsPUQIYM8c4QOgfrrWFO3udD76YXO4lujB8Wkisf6QFHsRD+4Ayk/zoPjUb4WQR29t6RpT/Kw0EYwzhuF8I5mKv1fz2xzLrnIB/T6gUF8fN2lEsGX5PD404nOA+9/auRNwjVhl4t7KBhelsBFEW6ur56dGIKM8oni2GCSE5cEbuD/x7En2IpCnserGZI1eqF6SNmFH1cWanILJehJgn8n+q3US0UEZTpN+mIAOmHjJaywzJa6F2RBhy5Psk60WBDhQZZgkYfHHTOk1jaz8WNeFBcqJz7wvQ3q7qG4AKC6npMSYzUieNmxn1qa0HyaEMPJrIbAmuKgF0FfGV6yC2fFbXOz7VT4pQPdBIQKurTFZmRAD0W3Jqo+ym+cFvLj0p9OWV4gxur97VHWN9M7wZX9nbqvPnjhLGoUqeW2UtMyra8mR1xxJf1iBlVoPVP0/+tLyCNJsAx8Y2nhHdx/2Ot9+LpE2+sluLPlMAl6VamhArRKWEFWbbg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36756003)(4326008)(2616005)(36860700001)(8936002)(1076003)(82310400005)(70206006)(8676002)(70586007)(6666004)(6916009)(508600001)(2906002)(54906003)(5660300002)(47076005)(7696005)(356005)(66574015)(40460700003)(26005)(83380400001)(336012)(81166007)(426003)(186003)(30864003)(16526019)(316002)(86362001)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 19:08:20.6447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 052fd29b-da08-4652-4474-08da2c6f1f85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6179
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Leo Liu <leo.liu@amd.com>

Add VCN 4.0 initialization and decoder/encoder ring functions.

Signed-off-by: Leo Liu <leo.liu@amd.com>
Reviewed-by: James Zhu <James.Zhu@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile     |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |   16 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 1877 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h   |   29 +
 5 files changed, 1940 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 81088b0cc92e..065939161961 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -171,6 +171,7 @@ amdgpu-y += \
 	vcn_v2_0.o \
 	vcn_v2_5.o \
 	vcn_v3_0.o \
+	vcn_v4_0.o \
 	amdgpu_jpeg.o \
 	jpeg_v1_0.o \
 	jpeg_v2_0.o \
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a0ee828a4a97..29f26db92f5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -53,6 +53,7 @@
 #define FIRMWARE_BEIGE_GOBY	"amdgpu/beige_goby_vcn.bin"
 #define FIRMWARE_YELLOW_CARP	"amdgpu/yellow_carp_vcn.bin"
 #define FIRMWARE_VCN_3_1_2	"amdgpu/vcn_3_1_2.bin"
+#define FIRMWARE_VCN4_0_0	"amdgpu/vcn_4_0_0.bin"
 
 MODULE_FIRMWARE(FIRMWARE_RAVEN);
 MODULE_FIRMWARE(FIRMWARE_PICASSO);
@@ -71,6 +72,7 @@ MODULE_FIRMWARE(FIRMWARE_DIMGREY_CAVEFISH);
 MODULE_FIRMWARE(FIRMWARE_BEIGE_GOBY);
 MODULE_FIRMWARE(FIRMWARE_YELLOW_CARP);
 MODULE_FIRMWARE(FIRMWARE_VCN_3_1_2);
+MODULE_FIRMWARE(FIRMWARE_VCN4_0_0);
 
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
@@ -175,6 +177,12 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
+	case IP_VERSION(4, 0, 0):
+		fw_name = FIRMWARE_VCN4_0_0;
+		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
+			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
+			adev->vcn.indirect_sram = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -228,8 +236,15 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
 		bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
-	fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
-	log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
+
+	if (adev->ip_versions[UVD_HWIP][0] >= IP_VERSION(4, 0, 0)){
+		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
+		log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
+	} else {
+		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
+		log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
+	}
+
 	bo_size += fw_shared_size;
 
 	if (amdgpu_vcnfw_log)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 912ead2e5bc8..8e7aec822a1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -155,6 +155,7 @@
 		}										\
 	} while (0)
 
+#define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
 #define AMDGPU_VCN_FW_SHARED_FLAG_0_RB	(1 << 6)
 #define AMDGPU_VCN_MULTI_QUEUE_FLAG	(1 << 8)
 #define AMDGPU_VCN_SW_RING_FLAG		(1 << 9)
@@ -286,6 +287,13 @@ struct amdgpu_fw_shared_sw_ring {
 	uint8_t padding[3];
 };
 
+struct amdgpu_fw_shared_unified_queue_struct {
+	uint8_t is_enabled;
+	uint8_t queue_mode;
+	uint8_t queue_status;
+	uint8_t padding[5];
+};
+
 struct amdgpu_fw_shared_fw_logging {
 	uint8_t is_enabled;
 	uint32_t addr_lo;
@@ -309,6 +317,14 @@ struct amdgpu_fw_shared {
 	struct amdgpu_fw_shared_smu_interface_info smu_interface_info;
 };
 
+struct amdgpu_vcn4_fw_shared {
+	uint32_t present_flag_0;
+	uint8_t pad[12];
+	struct amdgpu_fw_shared_unified_queue_struct sq;
+	uint8_t pad1[8];
+	struct amdgpu_fw_shared_fw_logging fw_log;
+};
+
 struct amdgpu_vcn_fwlog {
 	uint32_t rptr;
 	uint32_t wptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
new file mode 100644
index 000000000000..dada3e31db98
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -0,0 +1,1877 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#include <linux/firmware.h>
+#include "amdgpu.h"
+#include "amdgpu_vcn.h"
+#include "amdgpu_pm.h"
+#include "soc15.h"
+#include "soc15d.h"
+#include "soc15_hw_ip.h"
+#include "vcn_v2_0.h"
+#include "vcn_v3_0.h"
+
+#include "vcn/vcn_4_0_0_offset.h"
+#include "vcn/vcn_4_0_0_sh_mask.h"
+#include "ivsrcid/vcn/irqsrcs_vcn_4_0.h"
+
+#include <drm/drm_drv.h>
+
+#define mmUVD_DPG_LMA_CTL							regUVD_DPG_LMA_CTL
+#define mmUVD_DPG_LMA_CTL_BASE_IDX						regUVD_DPG_LMA_CTL_BASE_IDX
+#define mmUVD_DPG_LMA_DATA							regUVD_DPG_LMA_DATA
+#define mmUVD_DPG_LMA_DATA_BASE_IDX						regUVD_DPG_LMA_DATA_BASE_IDX
+
+#define VCN_VID_SOC_ADDRESS_2_0							0x1fb00
+#define VCN1_VID_SOC_ADDRESS_3_0						0x48300
+
+bool unifiedQ_enabled = false;
+
+static int amdgpu_ih_clientid_vcns[] = {
+	SOC15_IH_CLIENTID_VCN,
+	SOC15_IH_CLIENTID_VCN1
+};
+
+static void vcn_v4_0_set_dec_ring_funcs(struct amdgpu_device *adev);
+static void vcn_v4_0_set_enc_ring_funcs(struct amdgpu_device *adev);
+static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev);
+static int vcn_v4_0_set_powergating_state(void *handle,
+        enum amd_powergating_state state);
+static int vcn_v4_0_pause_dpg_mode(struct amdgpu_device *adev,
+        int inst_idx, struct dpg_pause_state *new_state);
+
+/**
+ * vcn_v4_0_early_init - set function pointers
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Set ring and irq function pointers
+ */
+static int vcn_v4_0_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (unifiedQ_enabled) {
+		adev->vcn.num_vcn_inst = 1;
+		adev->vcn.num_enc_rings = 1;
+	} else {
+		adev->vcn.num_enc_rings = 2;
+	}
+
+	if (!unifiedQ_enabled)
+		vcn_v4_0_set_dec_ring_funcs(adev);
+
+	vcn_v4_0_set_enc_ring_funcs(adev);
+	vcn_v4_0_set_irq_funcs(adev);
+
+	return 0;
+}
+
+static void amdgpu_vcn_setup_unified_queue_ucode(struct amdgpu_device *adev)
+{
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		const struct common_firmware_header *hdr;
+
+		hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
+		adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].ucode_id = AMDGPU_UCODE_ID_VCN;
+		adev->firmware.ucode[AMDGPU_UCODE_ID_VCN].fw = adev->vcn.fw;
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
+		DRM_INFO("PSP loading VCN firmware\n");
+	}
+}
+
+/**
+ * vcn_v4_0_sw_init - sw init for VCN block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Load firmware and sw initialization
+ */
+static int vcn_v4_0_sw_init(void *handle)
+{
+	struct amdgpu_ring *ring;
+	int i, j, r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = amdgpu_vcn_sw_init(adev);
+	if (r)
+		return r;
+
+	if (unifiedQ_enabled)
+		amdgpu_vcn_setup_unified_queue_ucode(adev);
+	else
+		amdgpu_vcn_setup_ucode(adev);
+
+	r = amdgpu_vcn_resume(adev);
+	if (r)
+		return r;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		/* VCN DEC TRAP */
+		r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[i],
+				VCN_4_0__SRCID__UVD_TRAP, &adev->vcn.inst[i].irq);
+		if (r)
+			return r;
+
+		atomic_set(&adev->vcn.inst[i].sched_score, 0);
+		if (!unifiedQ_enabled) {
+			ring = &adev->vcn.inst[i].ring_dec;
+			ring->use_doorbell = true;
+
+			/* VCN4 doorbell layout
+			 * 1: VCN_JPEG_DB_CTRL UVD_JRBC_RB_WPTR; (jpeg)
+			 * 2: VCN_RB1_DB_CTRL  UVD_RB_WPTR; (decode/encode for unified queue)
+			 * 3: VCN_RB2_DB_CTRL  UVD_RB_WPTR2; (encode only for swqueue)
+			 * 4: VCN_RB3_DB_CTRL  UVD_RB_WPTR3; (Reserved)
+			 * 5: VCN_RB4_DB_CTRL  UVD_RB_WPTR4; (decode only for swqueue)
+			 */
+
+			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1)
+						+ 5 + 8 * i;
+
+			sprintf(ring->name, "vcn_dec_%d", i);
+			r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst[i].irq, 0,
+					     AMDGPU_RING_PRIO_DEFAULT,
+					     &adev->vcn.inst[i].sched_score);
+			if (r)
+				return r;
+		}
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+			/* VCN ENC TRAP */
+			r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[i],
+				j + VCN_4_0__SRCID__UVD_ENC_GENERAL_PURPOSE, &adev->vcn.inst[i].irq);
+			if (r)
+				return r;
+
+			ring = &adev->vcn.inst[i].ring_enc[j];
+			ring->use_doorbell = true;
+
+			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + j + 8 * i;
+
+			if (unifiedQ_enabled) {
+				sprintf(ring->name, "vcn_unified%d", i);
+				r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst->irq, 0,
+				     AMDGPU_RING_PRIO_DEFAULT, NULL);
+			} else {
+				enum amdgpu_ring_priority_level hw_prio;
+
+				hw_prio = amdgpu_vcn_get_enc_ring_prio(j);
+				sprintf(ring->name, "vcn_enc_%d.%d", i, j);
+				r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst[i].irq, 0,
+					     hw_prio, &adev->vcn.inst[i].sched_score);
+			}
+			if (r)
+				return r;
+		}
+
+		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
+		fw_shared->present_flag_0 = 0;
+
+		if (unifiedQ_enabled) {
+			fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE);
+			fw_shared->sq.is_enabled = 1;
+		}
+
+		if (amdgpu_vcnfw_log)
+			amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
+	}
+
+	if (!unifiedQ_enabled) {
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
+			adev->vcn.pause_dpg_mode = vcn_v4_0_pause_dpg_mode;
+	}
+	return 0;
+}
+
+/**
+ * vcn_v4_0_sw_fini - sw fini for VCN block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * VCN suspend and free up sw allocation
+ */
+static int vcn_v4_0_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, r, idx;
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+                for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+                        volatile struct amdgpu_vcn4_fw_shared *fw_shared;
+
+                        if (adev->vcn.harvest_config & (1 << i))
+                                continue;
+
+                        fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
+                        fw_shared->present_flag_0 = 0;
+                        fw_shared->sq.is_enabled = 0;
+                }
+
+                drm_dev_exit(idx);
+        }
+
+	r = amdgpu_vcn_suspend(adev);
+	if (r)
+		return r;
+
+	r = amdgpu_vcn_sw_fini(adev);
+
+	return r;
+}
+
+/**
+ * vcn_v4_0_hw_init - start and test VCN block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Initialize the hardware, boot up the VCPU and do some testing
+ */
+static int vcn_v4_0_hw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_ring *ring;
+	int i, j, r;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		if (unifiedQ_enabled)
+			ring = &adev->vcn.inst[i].ring_enc[0];
+		else
+			ring = &adev->vcn.inst[i].ring_dec;
+
+		adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+				((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i), i);
+
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			goto done;
+
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+			ring = &adev->vcn.inst[i].ring_enc[j];
+			r = amdgpu_ring_test_helper(ring);
+			if (r)
+				goto done;
+		}
+	}
+
+done:
+	if (!r)
+		DRM_INFO("VCN decode and encode initialized successfully(under %s).\n",
+			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)?"DPG Mode":"SPG Mode");
+
+	return r;
+}
+
+/**
+ * vcn_v4_0_hw_fini - stop the hardware block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Stop the VCN block, mark ring as not ready any more
+ */
+static int vcn_v4_0_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i;
+
+	cancel_delayed_work_sync(&adev->vcn.idle_work);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
+                        (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
+                                RREG32_SOC15(VCN, i, regUVD_STATUS))) {
+                        vcn_v4_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * vcn_v4_0_suspend - suspend VCN block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * HW fini and suspend VCN block
+ */
+static int vcn_v4_0_suspend(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = vcn_v4_0_hw_fini(adev);
+	if (r)
+		return r;
+
+	r = amdgpu_vcn_suspend(adev);
+
+	return r;
+}
+
+/**
+ * vcn_v4_0_resume - resume VCN block
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Resume firmware and hw init VCN block
+ */
+static int vcn_v4_0_resume(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = amdgpu_vcn_resume(adev);
+	if (r)
+		return r;
+
+	r = vcn_v4_0_hw_init(adev);
+
+	return r;
+}
+
+/**
+ * vcn_v4_0_mc_resume - memory controller programming
+ *
+ * @adev: amdgpu_device pointer
+ * @inst: instance number
+ *
+ * Let the VCN memory controller know it's offsets
+ */
+static void vcn_v4_0_mc_resume(struct amdgpu_device *adev, int inst)
+{
+	uint32_t offset, size;
+	const struct common_firmware_header *hdr;
+
+	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
+	size = AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
+
+	/* cache window 0: fw */
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst].tmr_mc_addr_lo));
+		WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst].tmr_mc_addr_hi));
+		WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_OFFSET0, 0);
+		offset = 0;
+	} else {
+		WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
+			lower_32_bits(adev->vcn.inst[inst].gpu_addr));
+		WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
+			upper_32_bits(adev->vcn.inst[inst].gpu_addr));
+		offset = size;
+                WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_OFFSET0, AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
+	}
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_SIZE0, size);
+
+	/* cache window 1: stack */
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst].gpu_addr + offset));
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst].gpu_addr + offset));
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_OFFSET1, 0);
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_SIZE1, AMDGPU_VCN_STACK_SIZE);
+
+	/* cache window 2: context */
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE));
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_OFFSET2, 0);
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_CACHE_SIZE2, AMDGPU_VCN_CONTEXT_SIZE);
+
+	/* non-cache window */
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW,
+		lower_32_bits(adev->vcn.inst[inst].fw_shared.gpu_addr));
+	WREG32_SOC15(VCN, inst, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH,
+		upper_32_bits(adev->vcn.inst[inst].fw_shared.gpu_addr));
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_NONCACHE_OFFSET0, 0);
+	WREG32_SOC15(VCN, inst, regUVD_VCPU_NONCACHE_SIZE0,
+		AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)));
+}
+
+/**
+ * vcn_v4_0_mc_resume_dpg_mode - memory controller programming for dpg mode
+ *
+ * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
+ * @indirect: indirectly write sram
+ *
+ * Let the VCN memory controller know it's offsets with dpg mode
+ */
+static void vcn_v4_0_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
+{
+	uint32_t offset, size;
+	const struct common_firmware_header *hdr;
+	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
+	size = AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
+
+	/* cache window 0: fw */
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		if (!indirect) {
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
+				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_lo), 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
+				(adev->firmware.ucode[AMDGPU_UCODE_ID_VCN + inst_idx].tmr_mc_addr_hi), 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
+		} else {
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW), 0, 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH), 0, 0, indirect);
+			WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+				VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0), 0, 0, indirect);
+		}
+		offset = 0;
+	} else {
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr), 0, indirect);
+		offset = size;
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET0),
+			AMDGPU_UVD_FIRMWARE_OFFSET >> 3, 0, indirect);
+
+	}
+
+	if (!indirect)
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_SIZE0), size, 0, indirect);
+	else
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_SIZE0), 0, 0, indirect);
+
+	/* cache window 1: stack */
+	if (!indirect) {
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset), 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
+	} else {
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW), 0, 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH), 0, 0, indirect);
+		WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET1), 0, 0, indirect);
+	}
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_SIZE1), AMDGPU_VCN_STACK_SIZE, 0, indirect);
+
+	/* cache window 2: context */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
+			lower_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
+			upper_32_bits(adev->vcn.inst[inst_idx].gpu_addr + offset + AMDGPU_VCN_STACK_SIZE), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_OFFSET2), 0, 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_CACHE_SIZE2), AMDGPU_VCN_CONTEXT_SIZE, 0, indirect);
+
+	/* non-cache window */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_LOW),
+			lower_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH),
+			upper_32_bits(adev->vcn.inst[inst_idx].fw_shared.gpu_addr), 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_NONCACHE_OFFSET0), 0, 0, indirect);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+			VCN, inst_idx, regUVD_VCPU_NONCACHE_SIZE0),
+			AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared)), 0, indirect);
+
+	/* VCN global tiling registers */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, 0, regUVD_GFX10_ADDR_CONFIG), adev->gfx.config.gb_addr_config, 0, indirect);
+}
+
+/**
+ * vcn_v4_0_disable_static_power_gating - disable VCN static power gating
+ *
+ * @adev: amdgpu_device pointer
+ * @inst: instance number
+ *
+ * Disable static power gating for VCN block
+ */
+static void vcn_v4_0_disable_static_power_gating(struct amdgpu_device *adev, int inst)
+{
+	uint32_t data = 0;
+
+	if (adev->pg_flags & AMD_PG_SUPPORT_VCN) {
+		data = (1 << UVD_PGFSM_CONFIG__UVDM_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDS_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDLM_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDF_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTC_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTA_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTD_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTE_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDE_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDAB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDNA_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDNB_PWR_CONFIG__SHIFT);
+
+		WREG32_SOC15(VCN, inst, regUVD_PGFSM_CONFIG, data);
+		SOC15_WAIT_ON_RREG(VCN, inst, regUVD_PGFSM_STATUS,
+			UVD_PGFSM_STATUS__UVDM_UVDU_UVDLM_PWR_ON_3_0, 0x3F3FFFFF);
+	} else {
+		uint32_t value;
+
+		value = (inst) ? 0x2200800 : 0;
+		data = (1 << UVD_PGFSM_CONFIG__UVDM_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDS_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDLM_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDF_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDTC_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDB_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDTA_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDTD_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDTE_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDE_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDAB_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDTB_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDNA_PWR_CONFIG__SHIFT
+			| 1 << UVD_PGFSM_CONFIG__UVDNB_PWR_CONFIG__SHIFT);
+
+                WREG32_SOC15(VCN, inst, regUVD_PGFSM_CONFIG, data);
+                SOC15_WAIT_ON_RREG(VCN, inst, regUVD_PGFSM_STATUS, value,  0x3F3FFFFF);
+        }
+
+        data = RREG32_SOC15(VCN, inst, regUVD_POWER_STATUS);
+        data &= ~0x103;
+        if (adev->pg_flags & AMD_PG_SUPPORT_VCN)
+                data |= UVD_PGFSM_CONFIG__UVDM_UVDU_PWR_ON |
+                        UVD_POWER_STATUS__UVD_PG_EN_MASK;
+
+        WREG32_SOC15(VCN, inst, regUVD_POWER_STATUS, data);
+
+        return;
+}
+
+/**
+ * vcn_v4_0_enable_static_power_gating - enable VCN static power gating
+ *
+ * @adev: amdgpu_device pointer
+ * @inst: instance number
+ *
+ * Enable static power gating for VCN block
+ */
+static void vcn_v4_0_enable_static_power_gating(struct amdgpu_device *adev, int inst)
+{
+	uint32_t data;
+
+	if (adev->pg_flags & AMD_PG_SUPPORT_VCN) {
+		/* Before power off, this indicator has to be turned on */
+		data = RREG32_SOC15(VCN, inst, regUVD_POWER_STATUS);
+		data &= ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK;
+		data |= UVD_POWER_STATUS__UVD_POWER_STATUS_TILES_OFF;
+		WREG32_SOC15(VCN, inst, regUVD_POWER_STATUS, data);
+
+		data = (2 << UVD_PGFSM_CONFIG__UVDM_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDS_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDF_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTC_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTA_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDLM_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTD_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTE_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDE_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDAB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDTB_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDNA_PWR_CONFIG__SHIFT
+			| 2 << UVD_PGFSM_CONFIG__UVDNB_PWR_CONFIG__SHIFT);
+		WREG32_SOC15(VCN, inst, regUVD_PGFSM_CONFIG, data);
+
+		data = (2 << UVD_PGFSM_STATUS__UVDM_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDS_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDF_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDTC_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDB_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDTA_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDLM_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDTD_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDTE_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDE_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDAB_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDTB_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDNA_PWR_STATUS__SHIFT
+			| 2 << UVD_PGFSM_STATUS__UVDNB_PWR_STATUS__SHIFT);
+		SOC15_WAIT_ON_RREG(VCN, inst, regUVD_PGFSM_STATUS, data, 0x3F3FFFFF);
+	}
+
+        return;
+}
+
+/**
+ * vcn_v4_0_disable_clock_gating - disable VCN clock gating
+ *
+ * @adev: amdgpu_device pointer
+ * @inst: instance number
+ *
+ * Disable clock gating for VCN block
+ */
+static void vcn_v4_0_disable_clock_gating(struct amdgpu_device *adev, int inst)
+{
+	uint32_t data;
+
+	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
+		return;
+
+	/* VCN disable CGC */
+	data = RREG32_SOC15(VCN, inst, regUVD_CGC_CTRL);
+	data &= ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
+	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
+	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
+	WREG32_SOC15(VCN, inst, regUVD_CGC_CTRL, data);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_CGC_GATE);
+	data &= ~(UVD_CGC_GATE__SYS_MASK
+		| UVD_CGC_GATE__UDEC_MASK
+		| UVD_CGC_GATE__MPEG2_MASK
+		| UVD_CGC_GATE__REGS_MASK
+		| UVD_CGC_GATE__RBC_MASK
+		| UVD_CGC_GATE__LMI_MC_MASK
+		| UVD_CGC_GATE__LMI_UMC_MASK
+		| UVD_CGC_GATE__IDCT_MASK
+		| UVD_CGC_GATE__MPRD_MASK
+		| UVD_CGC_GATE__MPC_MASK
+		| UVD_CGC_GATE__LBSI_MASK
+		| UVD_CGC_GATE__LRBBM_MASK
+		| UVD_CGC_GATE__UDEC_RE_MASK
+		| UVD_CGC_GATE__UDEC_CM_MASK
+		| UVD_CGC_GATE__UDEC_IT_MASK
+		| UVD_CGC_GATE__UDEC_DB_MASK
+		| UVD_CGC_GATE__UDEC_MP_MASK
+		| UVD_CGC_GATE__WCB_MASK
+		| UVD_CGC_GATE__VCPU_MASK
+		| UVD_CGC_GATE__MMSCH_MASK);
+
+	WREG32_SOC15(VCN, inst, regUVD_CGC_GATE, data);
+	SOC15_WAIT_ON_RREG(VCN, inst, regUVD_CGC_GATE, 0,  0xFFFFFFFF);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_CGC_CTRL);
+	data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_CM_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_IT_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_DB_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_MP_MODE_MASK
+		| UVD_CGC_CTRL__SYS_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_MODE_MASK
+		| UVD_CGC_CTRL__MPEG2_MODE_MASK
+		| UVD_CGC_CTRL__REGS_MODE_MASK
+		| UVD_CGC_CTRL__RBC_MODE_MASK
+		| UVD_CGC_CTRL__LMI_MC_MODE_MASK
+		| UVD_CGC_CTRL__LMI_UMC_MODE_MASK
+		| UVD_CGC_CTRL__IDCT_MODE_MASK
+		| UVD_CGC_CTRL__MPRD_MODE_MASK
+		| UVD_CGC_CTRL__MPC_MODE_MASK
+		| UVD_CGC_CTRL__LBSI_MODE_MASK
+		| UVD_CGC_CTRL__LRBBM_MODE_MASK
+		| UVD_CGC_CTRL__WCB_MODE_MASK
+		| UVD_CGC_CTRL__VCPU_MODE_MASK
+		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
+	WREG32_SOC15(VCN, inst, regUVD_CGC_CTRL, data);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_GATE);
+	data |= (UVD_SUVD_CGC_GATE__SRE_MASK
+		| UVD_SUVD_CGC_GATE__SIT_MASK
+		| UVD_SUVD_CGC_GATE__SMP_MASK
+		| UVD_SUVD_CGC_GATE__SCM_MASK
+		| UVD_SUVD_CGC_GATE__SDB_MASK
+		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
+		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
+		| UVD_SUVD_CGC_GATE__SRE_HEVC_MASK
+		| UVD_SUVD_CGC_GATE__SIT_H264_MASK
+		| UVD_SUVD_CGC_GATE__SIT_HEVC_MASK
+		| UVD_SUVD_CGC_GATE__SCM_H264_MASK
+		| UVD_SUVD_CGC_GATE__SCM_HEVC_MASK
+		| UVD_SUVD_CGC_GATE__SDB_H264_MASK
+		| UVD_SUVD_CGC_GATE__SDB_HEVC_MASK
+		| UVD_SUVD_CGC_GATE__SCLR_MASK
+		| UVD_SUVD_CGC_GATE__UVD_SC_MASK
+		| UVD_SUVD_CGC_GATE__ENT_MASK
+		| UVD_SUVD_CGC_GATE__SIT_HEVC_DEC_MASK
+		| UVD_SUVD_CGC_GATE__SIT_HEVC_ENC_MASK
+		| UVD_SUVD_CGC_GATE__SITE_MASK
+		| UVD_SUVD_CGC_GATE__SRE_VP9_MASK
+		| UVD_SUVD_CGC_GATE__SCM_VP9_MASK
+		| UVD_SUVD_CGC_GATE__SIT_VP9_DEC_MASK
+		| UVD_SUVD_CGC_GATE__SDB_VP9_MASK
+		| UVD_SUVD_CGC_GATE__IME_HEVC_MASK);
+	WREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_GATE, data);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_CTRL);
+	data &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SCLR_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__UVD_SC_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
+	WREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_CTRL, data);
+}
+
+/**
+ * vcn_v4_0_disable_clock_gating_dpg_mode - disable VCN clock gating dpg mode
+ *
+ * @adev: amdgpu_device pointer
+ * @sram_sel: sram select
+ * @inst_idx: instance number index
+ * @indirect: indirectly write sram
+ *
+ * Disable clock gating for VCN block with dpg mode
+ */
+static void vcn_v4_0_disable_clock_gating_dpg_mode(struct amdgpu_device *adev, uint8_t sram_sel,
+      int inst_idx, uint8_t indirect)
+{
+	uint32_t reg_data = 0;
+
+	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
+		return;
+
+	/* enable sw clock gating control */
+	reg_data = 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
+	reg_data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
+	reg_data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
+	reg_data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK |
+		 UVD_CGC_CTRL__UDEC_CM_MODE_MASK |
+		 UVD_CGC_CTRL__UDEC_IT_MODE_MASK |
+		 UVD_CGC_CTRL__UDEC_DB_MODE_MASK |
+		 UVD_CGC_CTRL__UDEC_MP_MODE_MASK |
+		 UVD_CGC_CTRL__SYS_MODE_MASK |
+		 UVD_CGC_CTRL__UDEC_MODE_MASK |
+		 UVD_CGC_CTRL__MPEG2_MODE_MASK |
+		 UVD_CGC_CTRL__REGS_MODE_MASK |
+		 UVD_CGC_CTRL__RBC_MODE_MASK |
+		 UVD_CGC_CTRL__LMI_MC_MODE_MASK |
+		 UVD_CGC_CTRL__LMI_UMC_MODE_MASK |
+		 UVD_CGC_CTRL__IDCT_MODE_MASK |
+		 UVD_CGC_CTRL__MPRD_MODE_MASK |
+		 UVD_CGC_CTRL__MPC_MODE_MASK |
+		 UVD_CGC_CTRL__LBSI_MODE_MASK |
+		 UVD_CGC_CTRL__LRBBM_MODE_MASK |
+		 UVD_CGC_CTRL__WCB_MODE_MASK |
+		 UVD_CGC_CTRL__VCPU_MODE_MASK);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_CGC_CTRL), reg_data, sram_sel, indirect);
+
+	/* turn off clock gating */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_CGC_GATE), 0, sram_sel, indirect);
+
+	/* turn on SUVD clock gating */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_SUVD_CGC_GATE), 1, sram_sel, indirect);
+
+	/* turn on sw mode in UVD_SUVD_CGC_CTRL */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_SUVD_CGC_CTRL), 0, sram_sel, indirect);
+}
+
+/**
+ * vcn_v4_0_enable_clock_gating - enable VCN clock gating
+ *
+ * @adev: amdgpu_device pointer
+ * @inst: instance number
+ *
+ * Enable clock gating for VCN block
+ */
+static void vcn_v4_0_enable_clock_gating(struct amdgpu_device *adev, int inst)
+{
+	uint32_t data;
+
+	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
+		return;
+
+	/* enable VCN CGC */
+	data = RREG32_SOC15(VCN, inst, regUVD_CGC_CTRL);
+	data |= 0 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
+	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
+	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
+	WREG32_SOC15(VCN, inst, regUVD_CGC_CTRL, data);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_CGC_CTRL);
+	data |= (UVD_CGC_CTRL__UDEC_RE_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_CM_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_IT_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_DB_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_MP_MODE_MASK
+		| UVD_CGC_CTRL__SYS_MODE_MASK
+		| UVD_CGC_CTRL__UDEC_MODE_MASK
+		| UVD_CGC_CTRL__MPEG2_MODE_MASK
+		| UVD_CGC_CTRL__REGS_MODE_MASK
+		| UVD_CGC_CTRL__RBC_MODE_MASK
+		| UVD_CGC_CTRL__LMI_MC_MODE_MASK
+		| UVD_CGC_CTRL__LMI_UMC_MODE_MASK
+		| UVD_CGC_CTRL__IDCT_MODE_MASK
+		| UVD_CGC_CTRL__MPRD_MODE_MASK
+		| UVD_CGC_CTRL__MPC_MODE_MASK
+		| UVD_CGC_CTRL__LBSI_MODE_MASK
+		| UVD_CGC_CTRL__LRBBM_MODE_MASK
+		| UVD_CGC_CTRL__WCB_MODE_MASK
+		| UVD_CGC_CTRL__VCPU_MODE_MASK
+		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
+	WREG32_SOC15(VCN, inst, regUVD_CGC_CTRL, data);
+
+	data = RREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_CTRL);
+	data |= (UVD_SUVD_CGC_CTRL__SRE_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SCLR_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__UVD_SC_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
+		| UVD_SUVD_CGC_CTRL__SITE_MODE_MASK);
+	WREG32_SOC15(VCN, inst, regUVD_SUVD_CGC_CTRL, data);
+
+	return;
+}
+
+/**
+ * vcn_v4_0_start_dpg_mode - VCN start with dpg mode
+ *
+ * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
+ * @indirect: indirectly write sram
+ *
+ * Start VCN block with dpg mode
+ */
+static int vcn_v4_0_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
+{
+	volatile struct amdgpu_vcn4_fw_shared *fw_shared = adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
+	struct amdgpu_ring *ring;
+	uint32_t tmp;
+	int i;
+
+	/* disable register anti-hang mechanism */
+	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 1,
+		~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+	/* enable dynamic power gating mode */
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS);
+	tmp |= UVD_POWER_STATUS__UVD_PG_MODE_MASK;
+	tmp |= UVD_POWER_STATUS__UVD_PG_EN_MASK;
+	WREG32_SOC15(VCN, inst_idx, regUVD_POWER_STATUS, tmp);
+
+	if (indirect)
+		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
+
+	/* enable clock gating */
+	vcn_v4_0_disable_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
+
+	/* enable VCPU clock */
+	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
+	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK | UVD_VCPU_CNTL__BLK_RST_MASK;
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
+
+	/* disable master interupt */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MASTINT_EN), 0, 0, indirect);
+
+	/* setup regUVD_LMI_CTRL */
+	tmp = (UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
+		UVD_LMI_CTRL__REQ_MODE_MASK |
+		UVD_LMI_CTRL__CRC_RESET_MASK |
+		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
+		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
+		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK |
+		(8 << UVD_LMI_CTRL__WRITE_CLEAN_TIMER__SHIFT) |
+		0x00100000L);
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_LMI_CTRL), tmp, 0, indirect);
+
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MPC_CNTL),
+		0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT, 0, indirect);
+
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MPC_SET_MUXA0),
+		((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
+		 (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
+		 (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
+		 (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)), 0, indirect);
+
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MPC_SET_MUXB0),
+		 ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
+		 (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
+		 (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
+		 (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)), 0, indirect);
+
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MPC_SET_MUX),
+		((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
+		 (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
+		 (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)), 0, indirect);
+
+	vcn_v4_0_mc_resume_dpg_mode(adev, inst_idx, indirect);
+
+	tmp = (0xFF << UVD_VCPU_CNTL__PRB_TIMEOUT_VAL__SHIFT);
+	tmp |= UVD_VCPU_CNTL__CLK_EN_MASK;
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
+
+	/* enable LMI MC and UMC channels */
+	tmp = 0x1f << UVD_LMI_CTRL2__RE_OFLD_MIF_WR_REQ_NUM__SHIFT;
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_LMI_CTRL2), tmp, 0, indirect);
+
+	/* enable master interrupt */
+	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
+		VCN, inst_idx, regUVD_MASTINT_EN),
+		UVD_MASTINT_EN__VCPU_EN_MASK, 0, indirect);
+
+
+	if (indirect)
+		psp_update_vcn_sram(adev, inst_idx, adev->vcn.inst[inst_idx].dpg_sram_gpu_addr,
+			(uint32_t)((uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_curr_addr -
+				(uintptr_t)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr));
+
+	if (unifiedQ_enabled) {
+		ring = &adev->vcn.inst[inst_idx].ring_enc[0];
+		fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
+	} else
+		ring = &adev->vcn.inst[inst_idx].ring_dec;
+
+	WREG32_SOC15(VCN, inst_idx, regVCN_RB4_DB_CTRL,
+		ring->doorbell_index << VCN_RB4_DB_CTRL__OFFSET__SHIFT |
+		VCN_RB4_DB_CTRL__EN_MASK);
+
+	/* program the RB_BASE for ring buffer */
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO4,
+		lower_32_bits(ring->gpu_addr));
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI4,
+		upper_32_bits(ring->gpu_addr));
+
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
+
+	/* reseting ring, fw should not check RB ring */
+	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
+	tmp &= ~(VCN_RB_ENABLE__RB4_EN_MASK);
+	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
+
+	/* Initialize the ring buffer's read and write pointers */
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR4);
+	WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4, tmp);
+	ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4);
+
+	tmp = RREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE);
+	tmp |= VCN_RB_ENABLE__RB4_EN_MASK;
+	WREG32_SOC15(VCN, inst_idx, regVCN_RB_ENABLE, tmp);
+
+	WREG32_SOC15(VCN, inst_idx, regUVD_SCRATCH2, 0);
+
+	if (unifiedQ_enabled)
+		fw_shared->sq.queue_mode &= ~FW_QUEUE_RING_RESET;
+
+	for (i = 0; i < adev->vcn.num_enc_rings; i++) {
+		ring = &adev->vcn.inst[inst_idx].ring_enc[i];
+
+		if (i) {
+			ring = &adev->vcn.inst[inst_idx].ring_enc[1];
+
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO2, ring->gpu_addr);
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI2, upper_32_bits(ring->gpu_addr));
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE2, ring->ring_size / 4);
+			tmp= RREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR2);
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR2, tmp);
+			ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR2);
+
+			WREG32_SOC15(VCN, inst_idx, regVCN_RB2_DB_CTRL,
+				ring->doorbell_index << VCN_RB2_DB_CTRL__OFFSET__SHIFT |
+				VCN_RB2_DB_CTRL__EN_MASK);
+		} else {
+			ring = &adev->vcn.inst[inst_idx].ring_enc[0];
+
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_LO, ring->gpu_addr);
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_SIZE, ring->ring_size / 4);
+			tmp= RREG32_SOC15(VCN, inst_idx, regUVD_RB_RPTR);
+			WREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR, tmp);
+			ring->wptr = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
+
+			WREG32_SOC15(VCN, inst_idx, regVCN_RB1_DB_CTRL,
+				ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
+				VCN_RB1_DB_CTRL__EN_MASK);
+		}
+	}
+	return 0;
+}
+
+
+/**
+ * vcn_v4_0_start - VCN start
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Start VCN block
+ */
+static int vcn_v4_0_start(struct amdgpu_device *adev)
+{
+	volatile struct amdgpu_vcn4_fw_shared *fw_shared;
+	struct amdgpu_ring *ring;
+	uint32_t tmp;
+	int i, j, k, r;
+
+	if (adev->pm.dpm_enabled)
+		amdgpu_dpm_enable_uvd(adev, true);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+			r = vcn_v4_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
+			continue;
+		}
+
+		/* disable VCN power gating */
+		vcn_v4_0_disable_static_power_gating(adev, i);
+
+		/* set VCN status busy */
+		tmp = RREG32_SOC15(VCN, i, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
+		WREG32_SOC15(VCN, i, regUVD_STATUS, tmp);
+
+		/*SW clock gating */
+		vcn_v4_0_disable_clock_gating(adev, i);
+
+		/* enable VCPU clock */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+			UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
+
+		/* disable master interrupt */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN), 0,
+			~UVD_MASTINT_EN__VCPU_EN_MASK);
+
+		/* enable LMI MC and UMC channels */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_LMI_CTRL2), 0,
+			~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
+
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
+		tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+
+		/* setup regUVD_LMI_CTRL */
+		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL);
+		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL, tmp |
+		UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
+		UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
+		UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
+		UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
+
+		/* setup regUVD_MPC_CNTL */
+		tmp = RREG32_SOC15(VCN, i, regUVD_MPC_CNTL);
+		tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
+		tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
+		WREG32_SOC15(VCN, i, regUVD_MPC_CNTL, tmp);
+
+		/* setup UVD_MPC_SET_MUXA0 */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXA0,
+			((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
+			(0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
+			(0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
+
+		/* setup UVD_MPC_SET_MUXB0 */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUXB0,
+			((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
+			(0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
+			(0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
+
+		/* setup UVD_MPC_SET_MUX */
+		WREG32_SOC15(VCN, i, regUVD_MPC_SET_MUX,
+			((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
+			(0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
+			(0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
+
+		vcn_v4_0_mc_resume(adev, i);
+
+		/* VCN global tiling registers */
+		WREG32_SOC15(VCN, i, regUVD_GFX10_ADDR_CONFIG,
+			adev->gfx.config.gb_addr_config);
+
+		/* unblock VCPU register access */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL), 0,
+			~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+
+		/* release VCPU reset to boot */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+			~UVD_VCPU_CNTL__BLK_RST_MASK);
+
+		for (j = 0; j < 10; ++j) {
+			uint32_t status;
+
+			for (k = 0; k < 100; ++k) {
+				status = RREG32_SOC15(VCN, i, regUVD_STATUS);
+				if (status & 2)
+					break;
+				mdelay(10);
+				if (amdgpu_emu_mode==1)
+					msleep(1);
+			}
+
+			if (amdgpu_emu_mode==1) {
+				if (status & 2) {
+					r = 0;
+					break;
+				}
+			} else {
+				r = 0;
+				if (status & 2)
+					break;
+
+				dev_err(adev->dev, "VCN[%d] decode not responding, trying to reset the VCPU!!!\n", i);
+					WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+					UVD_VCPU_CNTL__BLK_RST_MASK,
+					~UVD_VCPU_CNTL__BLK_RST_MASK);
+				mdelay(10);
+				WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+					~UVD_VCPU_CNTL__BLK_RST_MASK);
+
+				mdelay(10);
+				r = -1;
+			}
+		}
+
+		if (r) {
+			dev_err(adev->dev, "VCN[%d] decode not responding, giving up!!!\n", i);
+			return r;
+		}
+
+		/* enable master interrupt */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN),
+			UVD_MASTINT_EN__VCPU_EN_MASK,
+			~UVD_MASTINT_EN__VCPU_EN_MASK);
+
+		/* clear the busy bit of VCN_STATUS */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_STATUS), 0,
+			~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
+
+		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
+		if (unifiedQ_enabled) {
+			ring = &adev->vcn.inst[i].ring_enc[0];
+			fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
+		} else {
+			ring = &adev->vcn.inst[i].ring_dec;
+
+			WREG32_SOC15(VCN, i, regVCN_RB4_DB_CTRL,
+				ring->doorbell_index << VCN_RB4_DB_CTRL__OFFSET__SHIFT |
+				VCN_RB4_DB_CTRL__EN_MASK);
+
+			/* program the RB_BASE for ring buffer */
+			WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO4,
+				lower_32_bits(ring->gpu_addr));
+			WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI4,
+				upper_32_bits(ring->gpu_addr));
+
+			WREG32_SOC15(VCN, i, regUVD_RB_SIZE4, ring->ring_size / sizeof(uint32_t));
+
+			/* resetting ring, fw should not check RB ring */
+			tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+			tmp &= ~(VCN_RB_ENABLE__RB4_EN_MASK);
+			WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
+
+			/* Initialize the ring buffer's read and write pointers */
+			tmp = RREG32_SOC15(VCN, i, regUVD_RB_RPTR4);
+			WREG32_SOC15(VCN, i, regUVD_RB_WPTR4, tmp);
+			ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR4);
+
+			tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
+			tmp |= VCN_RB_ENABLE__RB4_EN_MASK;
+			WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
+
+			ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_RPTR4);
+		}
+		ring = &adev->vcn.inst[i].ring_enc[0];
+		WREG32_SOC15(VCN, i, regVCN_RB1_DB_CTRL,
+			ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
+			VCN_RB1_DB_CTRL__EN_MASK);
+		tmp = RREG32_SOC15(VCN, i, regUVD_RB_RPTR);
+		WREG32_SOC15(VCN, i, regUVD_RB_WPTR, tmp);
+		ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR);
+		WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO, ring->gpu_addr);
+		WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
+		WREG32_SOC15(VCN, i, regUVD_RB_SIZE, ring->ring_size / 4);
+		if (unifiedQ_enabled)
+			fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
+		else {
+			ring = &adev->vcn.inst[i].ring_enc[1];
+			WREG32_SOC15(VCN, i, regVCN_RB2_DB_CTRL,
+				ring->doorbell_index << VCN_RB2_DB_CTRL__OFFSET__SHIFT |
+				VCN_RB2_DB_CTRL__EN_MASK);
+			tmp = RREG32_SOC15(VCN, i, regUVD_RB_RPTR2);
+			WREG32_SOC15(VCN, i, regUVD_RB_WPTR2, tmp);
+			ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR2);
+			WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO2, ring->gpu_addr);
+			WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI2, upper_32_bits(ring->gpu_addr));
+			WREG32_SOC15(VCN, i, regUVD_RB_SIZE2, ring->ring_size / 4);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * vcn_v4_0_stop_dpg_mode - VCN stop with dpg mode
+ *
+ * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
+ *
+ * Stop VCN block with dpg mode
+ */
+static int vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
+{
+	uint32_t tmp;
+
+	/* Wait for power status to be 1 */
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
+		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+
+	/* wait for read ptr to be equal to write ptr */
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR, tmp, 0xFFFFFFFF);
+
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR2);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR2, tmp, 0xFFFFFFFF);
+
+	tmp = RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR4);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_RB_RPTR4, tmp, 0xFFFFFFFF);
+
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 1,
+		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+
+	/* disable dynamic power gating mode */
+	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
+		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
+	return 0;
+}
+
+/**
+ * vcn_v4_0_stop - VCN stop
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Stop VCN block
+ */
+static int vcn_v4_0_stop(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+	int i, r = 0;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+			r = vcn_v4_0_stop_dpg_mode(adev, i);
+			continue;
+		}
+
+		/* wait for vcn idle */
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
+		if (r)
+			return r;
+
+		tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
+			UVD_LMI_STATUS__READ_CLEAN_MASK |
+			UVD_LMI_STATUS__WRITE_CLEAN_MASK |
+			UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		if (r)
+			return r;
+
+		/* disable LMI UMC channel */
+		tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL2);
+		tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
+		WREG32_SOC15(VCN, i, regUVD_LMI_CTRL2, tmp);
+		tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK |
+			UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
+		r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
+		if (r)
+			return r;
+
+		/* block VCPU register access */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL),
+				UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
+				~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
+
+		/* reset VCPU */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
+				UVD_VCPU_CNTL__BLK_RST_MASK,
+				~UVD_VCPU_CNTL__BLK_RST_MASK);
+
+		/* disable VCPU clock */
+		WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
+				~(UVD_VCPU_CNTL__CLK_EN_MASK));
+
+		/* apply soft reset */
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+		tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
+		tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
+		WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
+
+		/* clear status */
+		WREG32_SOC15(VCN, i, regUVD_STATUS, 0);
+
+		/* apply HW clock gating */
+		vcn_v4_0_enable_clock_gating(adev, i);
+
+		/* enable VCN power gating */
+		vcn_v4_0_enable_static_power_gating(adev, i);
+	}
+
+	if (adev->pm.dpm_enabled)
+		amdgpu_dpm_enable_uvd(adev, false);
+
+	return 0;
+}
+
+/**
+ * vcn_v4_0_pause_dpg_mode - VCN pause with dpg mode
+ *
+ * @adev: amdgpu_device pointer
+ * @inst_idx: instance number index
+ * @new_state: pause state
+ *
+ * Pause dpg mode for VCN block
+ */
+static int vcn_v4_0_pause_dpg_mode(struct amdgpu_device *adev, int inst_idx,
+      struct dpg_pause_state *new_state)
+{
+	uint32_t reg_data = 0;
+	int ret_code;
+
+	/* pause/unpause if state is changed */
+	if (adev->vcn.inst[inst_idx].pause_state.fw_based != new_state->fw_based) {
+		DRM_DEV_DEBUG(adev->dev, "dpg pause state changed %d -> %d",
+			adev->vcn.inst[inst_idx].pause_state.fw_based,	new_state->fw_based);
+		reg_data = RREG32_SOC15(VCN, inst_idx, regUVD_DPG_PAUSE) &
+			(~UVD_DPG_PAUSE__NJ_PAUSE_DPG_ACK_MASK);
+
+		if (new_state->fw_based == VCN_DPG_STATE__PAUSE) {
+			ret_code = SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 0x1,
+				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+
+			if (!ret_code) {
+				/* pause DPG */
+				reg_data |= UVD_DPG_PAUSE__NJ_PAUSE_DPG_REQ_MASK;
+				WREG32_SOC15(VCN, inst_idx, regUVD_DPG_PAUSE, reg_data);
+
+				/* wait for ACK */
+				SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_DPG_PAUSE,
+					UVD_DPG_PAUSE__NJ_PAUSE_DPG_ACK_MASK,
+					UVD_DPG_PAUSE__NJ_PAUSE_DPG_ACK_MASK);
+
+				SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS,
+					UVD_PGFSM_CONFIG__UVDM_UVDU_PWR_ON, UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+			}
+		} else {
+			/* unpause dpg, no need to wait */
+			reg_data &= ~UVD_DPG_PAUSE__NJ_PAUSE_DPG_REQ_MASK;
+			WREG32_SOC15(VCN, inst_idx, regUVD_DPG_PAUSE, reg_data);
+			SOC15_WAIT_ON_RREG(VCN, inst_idx, regUVD_POWER_STATUS, 0x1,
+				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
+		}
+		adev->vcn.inst[inst_idx].pause_state.fw_based = new_state->fw_based;
+	}
+
+	return 0;
+}
+
+/**
+ * vcn_v4_0_dec_ring_get_rptr - get read pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Returns the current hardware read pointer
+ */
+static uint64_t vcn_v4_0_dec_ring_get_rptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	return RREG32_SOC15(VCN, ring->me, regUVD_RB_RPTR4);
+}
+
+/**
+ * vcn_v4_0_dec_ring_get_wptr - get write pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Returns the current hardware write pointer
+ */
+static uint64_t vcn_v4_0_dec_ring_get_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring->use_doorbell)
+		return *ring->wptr_cpu_addr;
+	else
+		return RREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR4);
+}
+
+/**
+ * vcn_v4_0_dec_ring_set_wptr - set write pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Commits the write pointer to the hardware
+ */
+static void vcn_v4_0_dec_ring_set_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+		WREG32_SOC15(VCN, ring->me, regUVD_SCRATCH2,
+			lower_32_bits(ring->wptr));
+	}
+
+	if (ring->use_doorbell) {
+		*ring->wptr_cpu_addr = lower_32_bits(ring->wptr);
+		WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
+	} else {
+		WREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR4, lower_32_bits(ring->wptr));
+	}
+}
+
+static const struct amdgpu_ring_funcs vcn_v4_0_dec_sw_ring_vm_funcs = {
+	.type = AMDGPU_RING_TYPE_VCN_DEC,
+	.align_mask = 0x3f,
+	.nop = VCN_DEC_SW_CMD_NO_OP,
+	.vmhub = AMDGPU_MMHUB_0,
+	.get_rptr = vcn_v4_0_dec_ring_get_rptr,
+	.get_wptr = vcn_v4_0_dec_ring_get_wptr,
+	.set_wptr = vcn_v4_0_dec_ring_set_wptr,
+	.emit_frame_size =
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 3 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 4 +
+		4 + /* vcn_v3_0_dec_sw_ring_emit_vm_flush */
+		5 + 5 + /* vcn_v3_0_dec_sw_ring_emit_fdec_swe x2 vm fdec_swe */
+		1, /* vcn_v3_0_dec_sw_ring_insert_end */
+	.emit_ib_size = 5, /* vcn_v3_0_dec_sw_ring_emit_ib */
+	.emit_ib = vcn_v3_0_dec_sw_ring_emit_ib,
+	.emit_fence = vcn_v3_0_dec_sw_ring_emit_fence,
+	.emit_vm_flush = vcn_v3_0_dec_sw_ring_emit_vm_flush,
+	.test_ring = amdgpu_vcn_dec_sw_ring_test_ring,
+	.test_ib = amdgpu_vcn_dec_sw_ring_test_ib,
+	.insert_nop = amdgpu_ring_insert_nop,
+	.insert_end = vcn_v3_0_dec_sw_ring_insert_end,
+	.pad_ib = amdgpu_ring_generic_pad_ib,
+	.begin_use = amdgpu_vcn_ring_begin_use,
+	.end_use = amdgpu_vcn_ring_end_use,
+	.emit_wreg = vcn_v3_0_dec_sw_ring_emit_wreg,
+	.emit_reg_wait = vcn_v3_0_dec_sw_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = amdgpu_ring_emit_reg_write_reg_wait_helper,
+};
+
+/**
+ * vcn_v4_0_enc_ring_get_rptr - get enc read pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Returns the current hardware enc read pointer
+ */
+static uint64_t vcn_v4_0_enc_ring_get_rptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring == &adev->vcn.inst[ring->me].ring_enc[0])
+		return RREG32_SOC15(VCN, ring->me, regUVD_RB_RPTR);
+	else
+		return RREG32_SOC15(VCN, ring->me, regUVD_RB_RPTR2);
+}
+
+/**
+ * vcn_v4_0_enc_ring_get_wptr - get enc write pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Returns the current hardware enc write pointer
+ */
+static uint64_t vcn_v4_0_enc_ring_get_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring == &adev->vcn.inst[ring->me].ring_enc[0]) {
+		if (ring->use_doorbell)
+			return *ring->wptr_cpu_addr;
+		else
+			return RREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR);
+	} else {
+		if (ring->use_doorbell)
+			return *ring->wptr_cpu_addr;
+		else
+			return RREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR2);
+	}
+}
+
+/**
+ * vcn_v4_0_enc_ring_set_wptr - set enc write pointer
+ *
+ * @ring: amdgpu_ring pointer
+ *
+ * Commits the enc write pointer to the hardware
+ */
+static void vcn_v4_0_enc_ring_set_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring == &adev->vcn.inst[ring->me].ring_enc[0]) {
+		if (ring->use_doorbell) {
+			*ring->wptr_cpu_addr = lower_32_bits(ring->wptr);
+			WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
+		} else {
+			WREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR, lower_32_bits(ring->wptr));
+		}
+	} else {
+		if (ring->use_doorbell) {
+			*ring->wptr_cpu_addr = lower_32_bits(ring->wptr);
+			WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
+		} else {
+			WREG32_SOC15(VCN, ring->me, regUVD_RB_WPTR2, lower_32_bits(ring->wptr));
+		}
+	}
+}
+
+static const struct amdgpu_ring_funcs vcn_v4_0_enc_ring_vm_funcs = {
+	.type = AMDGPU_RING_TYPE_VCN_ENC,
+	.align_mask = 0x3f,
+	.nop = VCN_ENC_CMD_NO_OP,
+	.vmhub = AMDGPU_MMHUB_0,
+	.get_rptr = vcn_v4_0_enc_ring_get_rptr,
+	.get_wptr = vcn_v4_0_enc_ring_get_wptr,
+	.set_wptr = vcn_v4_0_enc_ring_set_wptr,
+	.emit_frame_size =
+		SOC15_FLUSH_GPU_TLB_NUM_WREG * 3 +
+		SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 4 +
+		4 + /* vcn_v2_0_enc_ring_emit_vm_flush */
+		5 + 5 + /* vcn_v2_0_enc_ring_emit_fence x2 vm fence */
+		1, /* vcn_v2_0_enc_ring_insert_end */
+	.emit_ib_size = 5, /* vcn_v2_0_enc_ring_emit_ib */
+	.emit_ib = vcn_v2_0_enc_ring_emit_ib,
+	.emit_fence = vcn_v2_0_enc_ring_emit_fence,
+	.emit_vm_flush = vcn_v2_0_enc_ring_emit_vm_flush,
+	.test_ring = amdgpu_vcn_enc_ring_test_ring,
+	.test_ib = amdgpu_vcn_enc_ring_test_ib,
+	.insert_nop = amdgpu_ring_insert_nop,
+	.insert_end = vcn_v2_0_enc_ring_insert_end,
+	.pad_ib = amdgpu_ring_generic_pad_ib,
+	.begin_use = amdgpu_vcn_ring_begin_use,
+	.end_use = amdgpu_vcn_ring_end_use,
+	.emit_wreg = vcn_v2_0_enc_ring_emit_wreg,
+	.emit_reg_wait = vcn_v2_0_enc_ring_emit_reg_wait,
+	.emit_reg_write_reg_wait = amdgpu_ring_emit_reg_write_reg_wait_helper,
+};
+
+/**
+ * vcn_v4_0_set_dec_ring_funcs - set dec ring functions
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Set decode ring functions
+ */
+static void vcn_v4_0_set_dec_ring_funcs(struct amdgpu_device *adev)
+{
+	int i;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		adev->vcn.inst[i].ring_dec.funcs = &vcn_v4_0_dec_sw_ring_vm_funcs;
+		adev->vcn.inst[i].ring_dec.me = i;
+		DRM_INFO("VCN(%d) decode software ring is enabled in VM mode\n", i);
+	}
+}
+
+/**
+ * vcn_v4_0_set_enc_ring_funcs - set enc ring functions
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Set encode ring functions
+ */
+static void vcn_v4_0_set_enc_ring_funcs(struct amdgpu_device *adev)
+{
+	int i, j;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+			adev->vcn.inst[i].ring_enc[j].funcs = &vcn_v4_0_enc_ring_vm_funcs;
+			adev->vcn.inst[i].ring_enc[j].me = i;
+		}
+		DRM_INFO("VCN(%d) encode is enabled in VM mode\n", i);
+	}
+}
+
+/**
+ * vcn_v4_0_is_idle - check VCN block is idle
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Check whether VCN block is idle
+ */
+static bool vcn_v4_0_is_idle(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, ret = 1;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		ret &= (RREG32_SOC15(VCN, i, regUVD_STATUS) == UVD_STATUS__IDLE);
+	}
+
+	return ret;
+}
+
+/**
+ * vcn_v4_0_wait_for_idle - wait for VCN block idle
+ *
+ * @handle: amdgpu_device pointer
+ *
+ * Wait for VCN block idle
+ */
+static int vcn_v4_0_wait_for_idle(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, ret = 0;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		ret = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE,
+			UVD_STATUS__IDLE);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * vcn_v4_0_set_clockgating_state - set VCN block clockgating state
+ *
+ * @handle: amdgpu_device pointer
+ * @state: clock gating state
+ *
+ * Set VCN block clockgating state
+ */
+static int vcn_v4_0_set_clockgating_state(void *handle, enum amd_clockgating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	int i;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		if (enable) {
+			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
+				return -EBUSY;
+			vcn_v4_0_enable_clock_gating(adev, i);
+		} else {
+			vcn_v4_0_disable_clock_gating(adev, i);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * vcn_v4_0_set_powergating_state - set VCN block powergating state
+ *
+ * @handle: amdgpu_device pointer
+ * @state: power gating state
+ *
+ * Set VCN block powergating state
+ */
+static int vcn_v4_0_set_powergating_state(void *handle, enum amd_powergating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int ret;
+
+	if(state == adev->vcn.cur_state)
+		return 0;
+
+	if (state == AMD_PG_STATE_GATE)
+		ret = vcn_v4_0_stop(adev);
+	else
+		ret = vcn_v4_0_start(adev);
+
+	if(!ret)
+		adev->vcn.cur_state = state;
+
+	return ret;
+}
+
+/**
+ * vcn_v4_0_set_interrupt_state - set VCN block interrupt state
+ *
+ * @adev: amdgpu_device pointer
+ * @source: interrupt sources
+ * @type: interrupt types
+ * @state: interrupt states
+ *
+ * Set VCN block interrupt state
+ */
+static int vcn_v4_0_set_interrupt_state(struct amdgpu_device *adev, struct amdgpu_irq_src *source,
+      unsigned type, enum amdgpu_interrupt_state state)
+{
+	return 0;
+}
+
+/**
+ * vcn_v4_0_process_interrupt - process VCN block interrupt
+ *
+ * @adev: amdgpu_device pointer
+ * @source: interrupt sources
+ * @entry: interrupt entry from clients and sources
+ *
+ * Process VCN block interrupt
+ */
+static int vcn_v4_0_process_interrupt(struct amdgpu_device *adev, struct amdgpu_irq_src *source,
+      struct amdgpu_iv_entry *entry)
+{
+	uint32_t ip_instance;
+
+	switch (entry->client_id) {
+	case SOC15_IH_CLIENTID_VCN:
+		ip_instance = 0;
+		break;
+	case SOC15_IH_CLIENTID_VCN1:
+		ip_instance = 1;
+		break;
+	default:
+		DRM_ERROR("Unhandled client id: %d\n", entry->client_id);
+		return 0;
+	}
+
+	DRM_DEBUG("IH: VCN TRAP\n");
+
+	switch (entry->src_id) {
+	case VCN_4_0__SRCID__UVD_TRAP:
+		if (!unifiedQ_enabled) {
+			amdgpu_fence_process(&adev->vcn.inst[ip_instance].ring_dec);
+			break;
+		}
+		break;
+	case VCN_4_0__SRCID__UVD_ENC_GENERAL_PURPOSE:
+		amdgpu_fence_process(&adev->vcn.inst[ip_instance].ring_enc[0]);
+		break;
+	case VCN_4_0__SRCID__UVD_ENC_LOW_LATENCY:
+		amdgpu_fence_process(&adev->vcn.inst[ip_instance].ring_enc[1]);
+		break;
+	default:
+		DRM_ERROR("Unhandled interrupt: %d %d\n",
+			  entry->src_id, entry->src_data[0]);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct amdgpu_irq_src_funcs vcn_v4_0_irq_funcs = {
+	.set = vcn_v4_0_set_interrupt_state,
+	.process = vcn_v4_0_process_interrupt,
+};
+
+/**
+ * vcn_v4_0_set_irq_funcs - set VCN block interrupt irq functions
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Set VCN block interrupt irq functions
+ */
+static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev)
+{
+	int i;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
+		adev->vcn.inst[i].irq.funcs = &vcn_v4_0_irq_funcs;
+	}
+}
+
+static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
+	.name = "vcn_v4_0",
+	.early_init = vcn_v4_0_early_init,
+	.late_init = NULL,
+	.sw_init = vcn_v4_0_sw_init,
+	.sw_fini = vcn_v4_0_sw_fini,
+	.hw_init = vcn_v4_0_hw_init,
+	.hw_fini = vcn_v4_0_hw_fini,
+	.suspend = vcn_v4_0_suspend,
+	.resume = vcn_v4_0_resume,
+	.is_idle = vcn_v4_0_is_idle,
+	.wait_for_idle = vcn_v4_0_wait_for_idle,
+	.check_soft_reset = NULL,
+	.pre_soft_reset = NULL,
+	.soft_reset = NULL,
+	.post_soft_reset = NULL,
+	.set_clockgating_state = vcn_v4_0_set_clockgating_state,
+	.set_powergating_state = vcn_v4_0_set_powergating_state,
+};
+
+const struct amdgpu_ip_block_version vcn_v4_0_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_VCN,
+	.major = 4,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &vcn_v4_0_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h
new file mode 100644
index 000000000000..7c5c9d91bb52
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h
@@ -0,0 +1,29 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#ifndef __VCN_V4_0_H__
+#define __VCN_V4_0_H__
+
+extern const struct amdgpu_ip_block_version vcn_v4_0_ip_block;
+
+#endif /* __VCN_V4_0_H__ */
-- 
2.35.1

