Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E73F2049
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Aug 2021 20:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244126E9C8;
	Thu, 19 Aug 2021 18:59:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9456E9C8
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Aug 2021 18:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsMv8r/jlAOrc6thGAKm+ejS30zj4PBwnUgAohNLR9uoLYrisqnWIKbUwpvhGn+CjOVo9KKuBFoEj4pBj58GLzggxg2NlZz5Bw60s90/2SUVSCMDusjR6hV1h9WxuKoN7/dXJ3p0Vk5j928X3EnMbAIMbHSz6pFMgEs/3SiTusYWZuNpCUhJhwZ4c66AfsjuL+ZNefuPqhnekF+mWqgUq1SpyT10fFC0MFtVPmHuP3KbBT15j4GyFps5InrEF0wfqEC09P0NYmCHBdiaXCApxH1Stp+FOwHlkakMc4Yfz5VehIi8+zjdLmeN96SJqlbf2ixbEqnrrPPbwr9+PNFJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ9KgHX8+tIh5uN3HYxu+1dLmCQ+oGkV2ASWo8eGCkU=;
 b=f7Cz8f1jCqdHiOzqF98vyNudM+ituL/nZdRqXP+kEktCGUBfnhu6vfaxXuFNRpHKeNJefn1rmJ42LbxA3ekExcSZEFEOLt72Ndwe2JPtZ1qtYAXQIOT4WartOUIi35li6QK/NZvp1XYh3MWmVpgzTG1ZYYfLvmbVaVDBtcLWTNcwPW0jxQETeLBYvM+HyZ3BdZlGOdWcon0hGy5NzC/4i9HHWMVOWAw5j00XNEuFMKt0tW22ron4x7n+tjVmlmuGaAQyDiDhx5s2w+MZ6OILp0TgeZry+tKlI81XXF9Qjp1d75o5VKGwsbCwwCDRwwowd0/HG47AdLBykuONhFpm6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ9KgHX8+tIh5uN3HYxu+1dLmCQ+oGkV2ASWo8eGCkU=;
 b=Mb9zstlCljFWEpJ3FyDv+FICbDrJadH/fApFL2V97VYUEmfDoAMwzp1uh0vdGc8zqJTV9dHMnaFCJqmgPsgR4PJ8dipL7AO4E9zvGv09ImRgcRNyd1UorOE4PyqToGbbfKZeEC0exs0RVt9UUOlMEx7XLtd+psUPve05WJ9M7do=
Received: from MWHPR17CA0090.namprd17.prod.outlook.com (2603:10b6:300:c2::28)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 18:59:05 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::68) by MWHPR17CA0090.outlook.office365.com
 (2603:10b6:300:c2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 18:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 18:59:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 19 Aug
 2021 13:59:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 19 Aug
 2021 11:59:03 -0700
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Thu, 19 Aug 2021 13:59:02 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <nicholas.kazlauskas@amd.com>,
 <harry.wentland@amd.com>
CC: <wayne.lin@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH v3 2/6] drm/amd/display: Add DP 2.0 HPO Stream Encoder
Date: Thu, 19 Aug 2021 14:58:36 -0400
Message-ID: <20210819185840.3682559-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819185840.3682559-1-Jerry.Zuo@amd.com>
References: <20210819185840.3682559-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d0f5b3-794c-4813-1960-08d963436a25
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40952439218B7E2971506246E5C09@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXfVR7hoGGd4n6H5KAsaGVetSd4c/dtoutcQtafFXaHeSdl1TZ1F1mki7+RVY/q0VqaXJSqD5T85De1xoCJ3TKXlmWvx3L0UMLQwJtQtpXSB8r9NrKvwFwV9L+nRGDaKql+RJIECsJAFeHPIIyDClHn1egTfg0sxrLqdTUpCVJCSx+u+jcfxJpFQbCHIHMcp2wUVWZmZU5Ij6pNGbhxSiLkRCqDcrILWxHkXZ08JxA5RQZ3FodcHG7/LYnUpuO+YXxxKLs5I+94aR3ujVBAKS/XHVuty+JSBQRM/izCB1sADhp31Su1EwdwbRUUf4LSZlm+8wWCy5WmdqhwbIZXLAZnDsE3FouENABnbuOdJiQZAYgar2VlQQV70K1cwnHtvjGh1htbPufbl2MA7tlEBPUWpEeu70aSBNls1azmJJw4di4c3Ku0ZSH61Bs6TH/EJGsqEqciwGt3zVvbT6pgPr+Gh4+SZEGnzHqhq9RdrSQELx6PoiefE5VtzMc0wywEhCIXXSDAuUiUKTcHwtsD58dC0sP9IWHPmyMqD4n34NnN4ITbLO/xifBfpwpWDoGZbSkyRTweLbJni4jTSpikQm5IA4aIVS6mH9QiNoFNtol9ZYvBkZ8Ck2TKkEl+JGKGwp42AO8QMxCsc3uOYl9Sm8FC+iGCi9GdS/4TJwc36xmqYBZX5/apDyTjPnPryEXWjM78RldhY+YOaR7RVsMP+A08nFMpMiH/zShUumSpn/kRqyKPdvAD57FRndpgWrABzm4GMrH0shWz/WrksjRmnIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(5660300002)(1076003)(2616005)(4326008)(336012)(70586007)(186003)(478600001)(26005)(316002)(83380400001)(6666004)(47076005)(426003)(34020700004)(70206006)(2906002)(36860700001)(86362001)(82310400003)(36756003)(7696005)(356005)(54906003)(8936002)(110136005)(30864003)(8676002)(81166007)(82740400003)(6636002)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 18:59:04.2831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d0f5b3-794c-4813-1960-08d963436a25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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

HW Blocks:

        +--------+  +-----+  +------+
        |  OPTC  |  | HDA |  | HUBP |
        +--------+  +-----+  +------+
            |          |        |
            |          |        |
    HPO ====|==========|========|====
     |      |          v        |
     |      |       +-----+     |
     |      |       | APG |     |
     |      |       +-----+     |
     |      |          |        |
     v      v          v        v
           +----------------------+
           |  HPO Stream Encoder  |
           +----------------------+

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  33 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |   2 +-
 .../dc/dcn31/dcn31_hpo_dp_stream_encoder.c    | 749 ++++++++++++++++++
 .../dc/dcn31/dcn31_hpo_dp_stream_encoder.h    | 241 ++++++
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |  85 ++
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  10 +
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |   3 +
 .../amd/display/dc/inc/hw/stream_encoder.h    |  81 ++
 drivers/gpu/drm/amd/display/dc/inc/resource.h |   8 +
 .../amd/display/include/grph_object_defs.h    |  12 +
 .../drm/amd/display/include/grph_object_id.h  |   8 +
 11 files changed, 1231 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index df8a7718a85f..be98f5513fe5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -466,6 +466,39 @@ void dcn10_log_hw_state(struct dc *dc,
 
 	log_mpc_crc(dc, log_ctx);
 
+	{
+		int hpo_dp_link_enc_count = 0;
+
+		if (pool->hpo_dp_stream_enc_count > 0) {
+			DTN_INFO("DP HPO S_ENC:  Enabled  OTG   Format   Depth   Vid   SDP   Compressed  Link\n");
+			for (i = 0; i < pool->hpo_dp_stream_enc_count; i++) {
+				struct hpo_dp_stream_encoder_state hpo_dp_se_state = {0};
+				struct hpo_dp_stream_encoder *hpo_dp_stream_enc = pool->hpo_dp_stream_enc[i];
+
+				if (hpo_dp_stream_enc && hpo_dp_stream_enc->funcs->read_state) {
+					hpo_dp_stream_enc->funcs->read_state(hpo_dp_stream_enc, &hpo_dp_se_state);
+
+					DTN_INFO("[%d]:                 %d    %d   %6s       %d     %d     %d            %d     %d\n",
+							hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0,
+							hpo_dp_se_state.stream_enc_enabled,
+							hpo_dp_se_state.otg_inst,
+							(hpo_dp_se_state.pixel_encoding == 0) ? "4:4:4" :
+									((hpo_dp_se_state.pixel_encoding == 1) ? "4:2:2" :
+									(hpo_dp_se_state.pixel_encoding == 2) ? "4:2:0" : "Y-Only"),
+							(hpo_dp_se_state.component_depth == 0) ? 6 :
+									((hpo_dp_se_state.component_depth == 1) ? 8 :
+									(hpo_dp_se_state.component_depth == 2) ? 10 : 12),
+							hpo_dp_se_state.vid_stream_enabled,
+							hpo_dp_se_state.sdp_enabled,
+							hpo_dp_se_state.compressed_format,
+							hpo_dp_se_state.mapped_to_link_enc);
+				}
+			}
+
+			DTN_INFO("\n");
+		}
+	}
+
 	DTN_INFO_END();
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
index bc2087f6dcb2..8b811f589524 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
@@ -12,7 +12,7 @@
 
 DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o \
 	dcn31_dccg.o dcn31_optc.o dcn31_dio_link_encoder.o dcn31_panel_cntl.o \
-	dcn31_apg.o
+	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o
 
 ifdef CONFIG_X86
 CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -msse
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
new file mode 100644
index 000000000000..bc265ee06824
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -0,0 +1,749 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+ * Authors: AMD
+ *
+ */
+
+#include "dc_bios_types.h"
+#include "dcn31_hpo_dp_stream_encoder.h"
+#include "reg_helper.h"
+#include "dc_link.h"
+
+#define DC_LOGGER \
+		enc3->base.ctx->logger
+
+#define REG(reg)\
+	(enc3->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc3->hpo_se_shift->field_name, enc3->hpo_se_mask->field_name
+
+#define CTX \
+	enc3->base.ctx
+
+
+enum dp2_pixel_encoding {
+	DP_SYM32_ENC_PIXEL_ENCODING_RGB_YCBCR444,
+	DP_SYM32_ENC_PIXEL_ENCODING_YCBCR422,
+	DP_SYM32_ENC_PIXEL_ENCODING_YCBCR420,
+	DP_SYM32_ENC_PIXEL_ENCODING_Y_ONLY
+};
+
+enum dp2_uncompressed_component_depth {
+	DP_SYM32_ENC_COMPONENT_DEPTH_6BPC,
+	DP_SYM32_ENC_COMPONENT_DEPTH_8BPC,
+	DP_SYM32_ENC_COMPONENT_DEPTH_10BPC,
+	DP_SYM32_ENC_COMPONENT_DEPTH_12BPC
+};
+
+
+static void dcn31_hpo_dp_stream_enc_enable_stream(
+		struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Enable all clocks in the DP_STREAM_ENC */
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_CONTROL,
+			DP_STREAM_ENC_CLOCK_EN, 1);
+
+	/* Assert reset to the DP_SYM32_ENC logic */
+	REG_UPDATE(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_RESET, 1);
+	/* Wait for reset to complete (to assert) */
+	REG_WAIT(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_RESET_DONE, 1,
+			1, 10);
+
+	/* De-assert reset to the DP_SYM32_ENC logic */
+	REG_UPDATE(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_RESET, 0);
+	/* Wait for reset to de-assert */
+	REG_WAIT(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_RESET_DONE, 0,
+			1, 10);
+
+	/* Enable idle pattern generation */
+	REG_UPDATE(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_ENABLE, 1);
+}
+
+static void dcn31_hpo_dp_stream_enc_dp_unblank(
+		struct hpo_dp_stream_encoder *enc,
+		uint32_t stream_source)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Set the input mux for video stream source */
+	REG_UPDATE(DP_STREAM_ENC_INPUT_MUX_CONTROL,
+			DP_STREAM_ENC_INPUT_MUX_PIXEL_STREAM_SOURCE_SEL, stream_source);
+
+	/* Enable video transmission in main framer */
+	REG_UPDATE(DP_SYM32_ENC_VID_STREAM_CONTROL,
+			VID_STREAM_ENABLE, 1);
+
+	/* Reset and Enable Pixel to Symbol FIFO */
+	REG_UPDATE(DP_SYM32_ENC_VID_FIFO_CONTROL,
+			PIXEL_TO_SYMBOL_FIFO_RESET, 1);
+	REG_WAIT(DP_SYM32_ENC_VID_FIFO_CONTROL,
+			PIXEL_TO_SYMBOL_FIFO_RESET_DONE, 1,
+			1, 10);
+	REG_UPDATE(DP_SYM32_ENC_VID_FIFO_CONTROL,
+			PIXEL_TO_SYMBOL_FIFO_RESET, 0);
+	REG_WAIT(DP_SYM32_ENC_VID_FIFO_CONTROL,	/* Disable Clock Ramp Adjuster FIFO */
+			PIXEL_TO_SYMBOL_FIFO_RESET_DONE, 0,
+			1, 10);
+	REG_UPDATE(DP_SYM32_ENC_VID_FIFO_CONTROL,
+			PIXEL_TO_SYMBOL_FIFO_ENABLE, 1);
+
+	/* Reset and Enable Clock Ramp Adjuster FIFO */
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_RESET, 1);
+	REG_WAIT(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_RESET_DONE, 1,
+			1, 10);
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_RESET, 0);
+	REG_WAIT(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_RESET_DONE, 0,
+			1, 10);
+
+	/* For Debug -- Enable CRC */
+	REG_UPDATE_2(DP_SYM32_ENC_VID_CRC_CONTROL,
+			CRC_ENABLE, 1,
+			CRC_CONT_MODE_ENABLE, 1);
+
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_ENABLE, 1);
+}
+
+static void dcn31_hpo_dp_stream_enc_dp_blank(
+		struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Disable video transmission */
+	REG_UPDATE(DP_SYM32_ENC_VID_STREAM_CONTROL,
+			VID_STREAM_ENABLE, 0);
+
+	/* Wait for video stream transmission disabled
+	 * Larger delay to wait until VBLANK - use max retry of
+	 * 10us*5000=50ms. This covers 41.7ms of minimum 24 Hz mode +
+	 * a little more because we may not trust delay accuracy.
+	 */
+	//REG_WAIT(DP_SYM32_ENC_VID_STREAM_CONTROL,
+	//		VID_STREAM_STATUS, 0,
+	//		10, 5000);
+
+	/* Disable SDP tranmission */
+	REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+			SDP_STREAM_ENABLE, 0);
+
+	/* Disable Pixel to Symbol FIFO */
+	REG_UPDATE(DP_SYM32_ENC_VID_FIFO_CONTROL,
+			PIXEL_TO_SYMBOL_FIFO_ENABLE, 0);
+
+	/* Disable Clock Ramp Adjuster FIFO */
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0,
+			FIFO_ENABLE, 0);
+}
+
+static void dcn31_hpo_dp_stream_enc_disable(
+		struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Disable DP_SYM32_ENC */
+	REG_UPDATE(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_ENABLE, 0);
+
+	/* Disable clocks in the DP_STREAM_ENC */
+	REG_UPDATE(DP_STREAM_ENC_CLOCK_CONTROL,
+			DP_STREAM_ENC_CLOCK_EN, 0);
+}
+
+static void dcn31_hpo_dp_stream_enc_set_stream_attribute(
+		struct hpo_dp_stream_encoder *enc,
+		struct dc_crtc_timing *crtc_timing,
+		enum dc_color_space output_color_space,
+		bool use_vsc_sdp_for_colorimetry,
+		bool compressed_format,
+		bool double_buffer_en)
+{
+	enum dp2_pixel_encoding pixel_encoding;
+	enum dp2_uncompressed_component_depth component_depth;
+	uint32_t h_active_start;
+	uint32_t v_active_start;
+	uint32_t h_blank;
+	uint32_t h_back_porch;
+	uint32_t h_width;
+	uint32_t v_height;
+	unsigned long long v_freq;
+	uint8_t misc0 = 0;
+	uint8_t misc1 = 0;
+	uint8_t hsp;
+	uint8_t vsp;
+
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+	struct dc_crtc_timing hw_crtc_timing = *crtc_timing;
+
+	/* MISC0[0]   = 0    video and link clocks are asynchronous
+	 * MISC1[0]   = 0    interlace not supported
+	 * MISC1[2:1] = 0    stereo field is handled by hardware
+	 * MISC1[5:3] = 0    Reserved
+	 */
+
+	/* Interlaced not supported */
+	if (hw_crtc_timing.flags.INTERLACE) {
+		BREAK_TO_DEBUGGER();
+	}
+
+	/* Double buffer enable for MSA and pixel format registers
+	 * Only double buffer for changing stream attributes for active streams
+	 * Do not double buffer when initially enabling a stream
+	 */
+	REG_UPDATE(DP_SYM32_ENC_VID_MSA_DOUBLE_BUFFER_CONTROL,
+			MSA_DOUBLE_BUFFER_ENABLE, double_buffer_en);
+	REG_UPDATE(DP_SYM32_ENC_VID_PIXEL_FORMAT_DOUBLE_BUFFER_CONTROL,
+			PIXEL_FORMAT_DOUBLE_BUFFER_ENABLE, double_buffer_en);
+
+	/* Pixel Encoding */
+	switch (hw_crtc_timing.pixel_encoding) {
+	case PIXEL_ENCODING_YCBCR422:
+		pixel_encoding = DP_SYM32_ENC_PIXEL_ENCODING_YCBCR422;
+		misc0 = misc0 | 0x2;  // MISC0[2:1] = 01
+		break;
+	case PIXEL_ENCODING_YCBCR444:
+		pixel_encoding = DP_SYM32_ENC_PIXEL_ENCODING_RGB_YCBCR444;
+		misc0 = misc0 | 0x4;  // MISC0[2:1] = 10
+
+		if (hw_crtc_timing.flags.Y_ONLY) {
+			pixel_encoding =  DP_SYM32_ENC_PIXEL_ENCODING_Y_ONLY;
+			if (hw_crtc_timing.display_color_depth != COLOR_DEPTH_666) {
+				/* HW testing only, no use case yet.
+				 * Color depth of Y-only could be
+				 * 8, 10, 12, 16 bits
+				 */
+				misc1 = misc1 | 0x80;  // MISC1[7] = 1
+			}
+		}
+		break;
+	case PIXEL_ENCODING_YCBCR420:
+		pixel_encoding = DP_SYM32_ENC_PIXEL_ENCODING_YCBCR420;
+		misc1 = misc1 | 0x40;   // MISC1[6] = 1
+		break;
+	case PIXEL_ENCODING_RGB:
+	default:
+		pixel_encoding = DP_SYM32_ENC_PIXEL_ENCODING_RGB_YCBCR444;
+		break;
+	}
+
+	/* For YCbCr420 and BT2020 Colorimetry Formats, VSC SDP shall be used.
+	 * When MISC1, bit 6, is Set to 1, a Source device uses a VSC SDP to indicate the
+	 * Pixel Encoding/Colorimetry Format and that a Sink device shall ignore MISC1, bit 7,
+	 * and MISC0, bits 7:1 (MISC1, bit 7, and MISC0, bits 7:1, become "don't care").
+	 */
+	if (use_vsc_sdp_for_colorimetry)
+		misc1 = misc1 | 0x40;
+	else
+		misc1 = misc1 & ~0x40;
+
+	/* Color depth */
+	switch (hw_crtc_timing.display_color_depth) {
+	case COLOR_DEPTH_666:
+		component_depth = DP_SYM32_ENC_COMPONENT_DEPTH_6BPC;
+		// MISC0[7:5] = 000
+		break;
+	case COLOR_DEPTH_888:
+		component_depth = DP_SYM32_ENC_COMPONENT_DEPTH_8BPC;
+		misc0 = misc0 | 0x20;  // MISC0[7:5] = 001
+		break;
+	case COLOR_DEPTH_101010:
+		component_depth = DP_SYM32_ENC_COMPONENT_DEPTH_10BPC;
+		misc0 = misc0 | 0x40;  // MISC0[7:5] = 010
+		break;
+	case COLOR_DEPTH_121212:
+		component_depth = DP_SYM32_ENC_COMPONENT_DEPTH_12BPC;
+		misc0 = misc0 | 0x60;  // MISC0[7:5] = 011
+		break;
+	default:
+		component_depth = DP_SYM32_ENC_COMPONENT_DEPTH_6BPC;
+		break;
+	}
+
+	REG_UPDATE_3(DP_SYM32_ENC_VID_PIXEL_FORMAT,
+			PIXEL_ENCODING_TYPE, compressed_format,
+			UNCOMPRESSED_PIXEL_ENCODING, pixel_encoding,
+			UNCOMPRESSED_COMPONENT_DEPTH, component_depth);
+
+	switch (output_color_space) {
+	case COLOR_SPACE_SRGB:
+		misc1 = misc1 & ~0x80; /* bit7 = 0*/
+		break;
+	case COLOR_SPACE_SRGB_LIMITED:
+		misc0 = misc0 | 0x8; /* bit3=1 */
+		misc1 = misc1 & ~0x80; /* bit7 = 0*/
+		break;
+	case COLOR_SPACE_YCBCR601:
+	case COLOR_SPACE_YCBCR601_LIMITED:
+		misc0 = misc0 | 0x8; /* bit3=1, bit4=0 */
+		misc1 = misc1 & ~0x80; /* bit7 = 0*/
+		if (hw_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR422)
+			misc0 = misc0 | 0x2; /* bit2=0, bit1=1 */
+		else if (hw_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR444)
+			misc0 = misc0 | 0x4; /* bit2=1, bit1=0 */
+		break;
+	case COLOR_SPACE_YCBCR709:
+	case COLOR_SPACE_YCBCR709_LIMITED:
+		misc0 = misc0 | 0x18; /* bit3=1, bit4=1 */
+		misc1 = misc1 & ~0x80; /* bit7 = 0*/
+		if (hw_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR422)
+			misc0 = misc0 | 0x2; /* bit2=0, bit1=1 */
+		else if (hw_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR444)
+			misc0 = misc0 | 0x4; /* bit2=1, bit1=0 */
+		break;
+	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_XR_RGB:
+	case COLOR_SPACE_MSREF_SCRGB:
+	case COLOR_SPACE_ADOBERGB:
+	case COLOR_SPACE_DCIP3:
+	case COLOR_SPACE_XV_YCC_709:
+	case COLOR_SPACE_XV_YCC_601:
+	case COLOR_SPACE_DISPLAYNATIVE:
+	case COLOR_SPACE_DOLBYVISION:
+	case COLOR_SPACE_APPCTRL:
+	case COLOR_SPACE_CUSTOMPOINTS:
+	case COLOR_SPACE_UNKNOWN:
+	case COLOR_SPACE_YCBCR709_BLACK:
+		/* do nothing */
+		break;
+	}
+
+	/* calculate from vesa timing parameters
+	 * h_active_start related to leading edge of sync
+	 */
+	h_blank = hw_crtc_timing.h_total - hw_crtc_timing.h_border_left -
+			hw_crtc_timing.h_addressable - hw_crtc_timing.h_border_right;
+
+	h_back_porch = h_blank - hw_crtc_timing.h_front_porch -
+			hw_crtc_timing.h_sync_width;
+
+	/* start at beginning of left border */
+	h_active_start = hw_crtc_timing.h_sync_width + h_back_porch;
+
+	v_active_start = hw_crtc_timing.v_total - hw_crtc_timing.v_border_top -
+			hw_crtc_timing.v_addressable - hw_crtc_timing.v_border_bottom -
+			hw_crtc_timing.v_front_porch;
+
+	h_width = hw_crtc_timing.h_border_left + hw_crtc_timing.h_addressable + hw_crtc_timing.h_border_right;
+	v_height = hw_crtc_timing.v_border_top + hw_crtc_timing.v_addressable + hw_crtc_timing.v_border_bottom;
+	hsp = hw_crtc_timing.flags.HSYNC_POSITIVE_POLARITY ? 0x80 : 0;
+	vsp = hw_crtc_timing.flags.VSYNC_POSITIVE_POLARITY ? 0x80 : 0;
+	v_freq = hw_crtc_timing.pix_clk_100hz * 100;
+
+	/*   MSA Packet Mapping to 32-bit Link Symbols - DP2 spec, section 2.7.4.1
+	 *
+	 *                      Lane 0           Lane 1          Lane 2         Lane 3
+	 *    MSA[0] = {             0,               0,              0,  VFREQ[47:40]}
+	 *    MSA[1] = {             0,               0,              0,  VFREQ[39:32]}
+	 *    MSA[2] = {             0,               0,              0,  VFREQ[31:24]}
+	 *    MSA[3] = {  HTotal[15:8],    HStart[15:8],   HWidth[15:8],  VFREQ[23:16]}
+	 *    MSA[4] = {  HTotal[ 7:0],    HStart[ 7:0],   HWidth[ 7:0],  VFREQ[15: 8]}
+	 *    MSA[5] = {  VTotal[15:8],    VStart[15:8],  VHeight[15:8],  VFREQ[ 7: 0]}
+	 *    MSA[6] = {  VTotal[ 7:0],    VStart[ 7:0],  VHeight[ 7:0],  MISC0[ 7: 0]}
+	 *    MSA[7] = { HSP|HSW[14:8],   VSP|VSW[14:8],              0,  MISC1[ 7: 0]}
+	 *    MSA[8] = {     HSW[ 7:0],       VSW[ 7:0],              0,             0}
+	 */
+	REG_SET_4(DP_SYM32_ENC_VID_MSA0, 0,
+			MSA_DATA_LANE_0, 0,
+			MSA_DATA_LANE_1, 0,
+			MSA_DATA_LANE_2, 0,
+			MSA_DATA_LANE_3, v_freq >> 40);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA1, 0,
+			MSA_DATA_LANE_0, 0,
+			MSA_DATA_LANE_1, 0,
+			MSA_DATA_LANE_2, 0,
+			MSA_DATA_LANE_3, (v_freq >> 32) & 0xff);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA2, 0,
+			MSA_DATA_LANE_0, 0,
+			MSA_DATA_LANE_1, 0,
+			MSA_DATA_LANE_2, 0,
+			MSA_DATA_LANE_3, (v_freq >> 24) & 0xff);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA3, 0,
+			MSA_DATA_LANE_0, hw_crtc_timing.h_total >> 8,
+			MSA_DATA_LANE_1, h_active_start >> 8,
+			MSA_DATA_LANE_2, h_width >> 8,
+			MSA_DATA_LANE_3, (v_freq >> 16) & 0xff);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA4, 0,
+			MSA_DATA_LANE_0, hw_crtc_timing.h_total & 0xff,
+			MSA_DATA_LANE_1, h_active_start & 0xff,
+			MSA_DATA_LANE_2, h_width & 0xff,
+			MSA_DATA_LANE_3, (v_freq >> 8) & 0xff);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA5, 0,
+			MSA_DATA_LANE_0, hw_crtc_timing.v_total >> 8,
+			MSA_DATA_LANE_1, v_active_start >> 8,
+			MSA_DATA_LANE_2, v_height >> 8,
+			MSA_DATA_LANE_3, v_freq & 0xff);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA6, 0,
+			MSA_DATA_LANE_0, hw_crtc_timing.v_total & 0xff,
+			MSA_DATA_LANE_1, v_active_start & 0xff,
+			MSA_DATA_LANE_2, v_height & 0xff,
+			MSA_DATA_LANE_3, misc0);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA7, 0,
+			MSA_DATA_LANE_0, hsp | (hw_crtc_timing.h_sync_width >> 8),
+			MSA_DATA_LANE_1, vsp | (hw_crtc_timing.v_sync_width >> 8),
+			MSA_DATA_LANE_2, 0,
+			MSA_DATA_LANE_3, misc1);
+
+	REG_SET_4(DP_SYM32_ENC_VID_MSA8, 0,
+			MSA_DATA_LANE_0, hw_crtc_timing.h_sync_width & 0xff,
+			MSA_DATA_LANE_1, hw_crtc_timing.v_sync_width & 0xff,
+			MSA_DATA_LANE_2, 0,
+			MSA_DATA_LANE_3, 0);
+}
+
+static void dcn31_hpo_dp_stream_enc_update_dp_info_packets(
+		struct hpo_dp_stream_encoder *enc,
+		const struct encoder_info_frame *info_frame)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+	uint32_t dmdata_packet_enabled = 0;
+	bool sdp_stream_enable = false;
+
+	if (info_frame->vsc.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				0,  /* packetIndex */
+				&info_frame->vsc);
+		sdp_stream_enable = true;
+	}
+	if (info_frame->spd.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				2,  /* packetIndex */
+				&info_frame->spd);
+		sdp_stream_enable = true;
+	}
+	if (info_frame->hdrsmd.valid) {
+		enc->vpg->funcs->update_generic_info_packet(
+				enc->vpg,
+				3,  /* packetIndex */
+				&info_frame->hdrsmd);
+		sdp_stream_enable = true;
+	}
+	/* enable/disable transmission of packet(s).
+	 * If enabled, packet transmission begins on the next frame
+	 */
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->vsc.valid);
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL2, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->spd.valid);
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL3, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, info_frame->hdrsmd.valid);
+
+	/* check if dynamic metadata packet transmission is enabled */
+	REG_GET(DP_SYM32_ENC_SDP_METADATA_PACKET_CONTROL,
+			METADATA_PACKET_ENABLE, &dmdata_packet_enabled);
+
+	/* Enable secondary data path */
+	REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+			SDP_STREAM_ENABLE, 1);
+}
+
+static void dcn31_hpo_dp_stream_enc_stop_dp_info_packets(
+	struct hpo_dp_stream_encoder *enc)
+{
+	/* stop generic packets on DP */
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+	uint32_t asp_enable = 0;
+	uint32_t atp_enable = 0;
+	uint32_t aip_enable = 0;
+	uint32_t acm_enable = 0;
+
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, 0);
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL2, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, 0);
+	REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL3, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, 0);
+
+	/* Disable secondary data path if audio is also disabled */
+	REG_GET_4(DP_SYM32_ENC_SDP_AUDIO_CONTROL0,
+			ASP_ENABLE, &asp_enable,
+			ATP_ENABLE, &atp_enable,
+			AIP_ENABLE, &aip_enable,
+			ACM_ENABLE, &acm_enable);
+	if (!(asp_enable || atp_enable || aip_enable || acm_enable))
+		REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+				SDP_STREAM_ENABLE, 0);
+}
+
+static uint32_t hpo_dp_is_gsp_enabled(
+		struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+	uint32_t gsp0_enabled = 0;
+	uint32_t gsp2_enabled = 0;
+	uint32_t gsp3_enabled = 0;
+	uint32_t gsp11_enabled = 0;
+
+	REG_GET(DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, &gsp0_enabled);
+	REG_GET(DP_SYM32_ENC_SDP_GSP_CONTROL2, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, &gsp2_enabled);
+	REG_GET(DP_SYM32_ENC_SDP_GSP_CONTROL3, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, &gsp3_enabled);
+	REG_GET(DP_SYM32_ENC_SDP_GSP_CONTROL11, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, &gsp11_enabled);
+
+	return (gsp0_enabled || gsp2_enabled || gsp3_enabled || gsp11_enabled);
+}
+
+static void dcn31_hpo_dp_stream_enc_set_dsc_pps_info_packet(
+		struct hpo_dp_stream_encoder *enc,
+		bool enable,
+		uint8_t *dsc_packed_pps)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	if (enable) {
+		struct dc_info_packet pps_sdp;
+		int i;
+
+		/* Configure for PPS packet size (128 bytes) */
+		REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL11,
+				GSP_PAYLOAD_SIZE, 3);
+
+		/* Load PPS into infoframe (SDP) registers */
+		pps_sdp.valid = true;
+		pps_sdp.hb0 = 0;
+		pps_sdp.hb1 = DC_DP_INFOFRAME_TYPE_PPS;
+		pps_sdp.hb2 = 127;
+		pps_sdp.hb3 = 0;
+
+		for (i = 0; i < 4; i++) {
+			memcpy(pps_sdp.sb, &dsc_packed_pps[i * 32], 32);
+			enc3->base.vpg->funcs->update_generic_info_packet(
+							enc3->base.vpg,
+							11 + i,
+							&pps_sdp);
+		}
+
+		/* SW should make sure VBID[6] update line number is bigger
+		 * than PPS transmit line number
+		 */
+		REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL11,
+				GSP_TRANSMISSION_LINE_NUMBER, 2);
+
+		REG_UPDATE_2(DP_SYM32_ENC_VID_VBID_CONTROL,
+				VBID_6_COMPRESSEDSTREAM_FLAG_SOF_REFERENCE, 0,
+				VBID_6_COMPRESSEDSTREAM_FLAG_LINE_NUMBER, 3);
+
+		/* Send PPS data at the line number specified above. */
+		REG_UPDATE(DP_SYM32_ENC_SDP_GSP_CONTROL11,
+				GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, 1);
+		REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+				SDP_STREAM_ENABLE, 1);
+	} else {
+		/* Disable Generic Stream Packet 11 (GSP) transmission */
+		REG_UPDATE_2(DP_SYM32_ENC_SDP_GSP_CONTROL11,
+				GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, 0,
+				GSP_PAYLOAD_SIZE, 0);
+	}
+}
+
+static void dcn31_hpo_dp_stream_enc_map_stream_to_link(
+		struct hpo_dp_stream_encoder *enc,
+		uint32_t stream_enc_inst,
+		uint32_t link_enc_inst)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	ASSERT(stream_enc_inst < 4 && link_enc_inst < 2);
+
+	switch (stream_enc_inst) {
+	case 0:
+		REG_UPDATE(DP_STREAM_MAPPER_CONTROL0,
+				DP_STREAM_LINK_TARGET, link_enc_inst);
+		break;
+	case 1:
+		REG_UPDATE(DP_STREAM_MAPPER_CONTROL1,
+				DP_STREAM_LINK_TARGET, link_enc_inst);
+		break;
+	case 2:
+		REG_UPDATE(DP_STREAM_MAPPER_CONTROL2,
+				DP_STREAM_LINK_TARGET, link_enc_inst);
+		break;
+	case 3:
+		REG_UPDATE(DP_STREAM_MAPPER_CONTROL3,
+				DP_STREAM_LINK_TARGET, link_enc_inst);
+		break;
+	}
+}
+
+static void dcn31_hpo_dp_stream_enc_mute_control(
+	struct hpo_dp_stream_encoder *enc,
+	bool mute)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	ASSERT(enc->apg);
+	enc->apg->funcs->audio_mute_control(enc->apg, mute);
+}
+
+static void dcn31_hpo_dp_stream_enc_audio_setup(
+	struct hpo_dp_stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Set the input mux for video stream source */
+	REG_UPDATE(DP_STREAM_ENC_AUDIO_CONTROL,
+			DP_STREAM_ENC_INPUT_MUX_AUDIO_STREAM_SOURCE_SEL, az_inst);
+
+	ASSERT(enc->apg);
+	enc->apg->funcs->se_audio_setup(enc->apg, az_inst, info);
+}
+
+static void dcn31_hpo_dp_stream_enc_audio_enable(
+	struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Enable Audio packets */
+	REG_UPDATE(DP_SYM32_ENC_SDP_AUDIO_CONTROL0, ASP_ENABLE, 1);
+
+	/* Program the ATP and AIP next */
+	REG_UPDATE_2(DP_SYM32_ENC_SDP_AUDIO_CONTROL0,
+			ATP_ENABLE, 1,
+			AIP_ENABLE, 1);
+
+	/* Enable secondary data path */
+	REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+			SDP_STREAM_ENABLE, 1);
+
+	/* Enable APG block */
+	enc->apg->funcs->enable_apg(enc->apg);
+}
+
+static void dcn31_hpo_dp_stream_enc_audio_disable(
+	struct hpo_dp_stream_encoder *enc)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	/* Disable Audio packets */
+	REG_UPDATE_4(DP_SYM32_ENC_SDP_AUDIO_CONTROL0,
+			ASP_ENABLE, 0,
+			ATP_ENABLE, 0,
+			AIP_ENABLE, 0,
+			ACM_ENABLE, 0);
+
+	/* Disable STP Stream Enable if other SDP GSP are also disabled */
+	if (!(hpo_dp_is_gsp_enabled(enc)))
+		REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
+				SDP_STREAM_ENABLE, 0);
+
+	/* Disable APG block */
+	enc->apg->funcs->disable_apg(enc->apg);
+}
+
+static void dcn31_hpo_dp_stream_enc_read_state(
+		struct hpo_dp_stream_encoder *enc,
+		struct hpo_dp_stream_encoder_state *s)
+{
+	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
+
+	REG_GET(DP_SYM32_ENC_CONTROL,
+			DP_SYM32_ENC_ENABLE, &s->stream_enc_enabled);
+	REG_GET(DP_SYM32_ENC_VID_STREAM_CONTROL,
+			VID_STREAM_ENABLE, &s->vid_stream_enabled);
+	REG_GET(DP_STREAM_ENC_INPUT_MUX_CONTROL,
+			DP_STREAM_ENC_INPUT_MUX_PIXEL_STREAM_SOURCE_SEL, &s->otg_inst);
+
+	REG_GET_3(DP_SYM32_ENC_VID_PIXEL_FORMAT,
+			PIXEL_ENCODING_TYPE, &s->compressed_format,
+			UNCOMPRESSED_PIXEL_ENCODING, &s->pixel_encoding,
+			UNCOMPRESSED_COMPONENT_DEPTH, &s->component_depth);
+
+	REG_GET(DP_SYM32_ENC_SDP_CONTROL,
+			SDP_STREAM_ENABLE, &s->sdp_enabled);
+
+	switch (enc->inst) {
+	case 0:
+		REG_GET(DP_STREAM_MAPPER_CONTROL0,
+				DP_STREAM_LINK_TARGET, &s->mapped_to_link_enc);
+		break;
+	case 1:
+		REG_GET(DP_STREAM_MAPPER_CONTROL1,
+				DP_STREAM_LINK_TARGET, &s->mapped_to_link_enc);
+		break;
+	case 2:
+		REG_GET(DP_STREAM_MAPPER_CONTROL2,
+				DP_STREAM_LINK_TARGET, &s->mapped_to_link_enc);
+		break;
+	case 3:
+		REG_GET(DP_STREAM_MAPPER_CONTROL3,
+				DP_STREAM_LINK_TARGET, &s->mapped_to_link_enc);
+		break;
+	}
+}
+
+static const struct hpo_dp_stream_encoder_funcs dcn30_str_enc_funcs = {
+	.enable_stream = dcn31_hpo_dp_stream_enc_enable_stream,
+	.dp_unblank = dcn31_hpo_dp_stream_enc_dp_unblank,
+	.dp_blank = dcn31_hpo_dp_stream_enc_dp_blank,
+	.disable = dcn31_hpo_dp_stream_enc_disable,
+	.set_stream_attribute = dcn31_hpo_dp_stream_enc_set_stream_attribute,
+	.update_dp_info_packets = dcn31_hpo_dp_stream_enc_update_dp_info_packets,
+	.stop_dp_info_packets = dcn31_hpo_dp_stream_enc_stop_dp_info_packets,
+	.dp_set_dsc_pps_info_packet = dcn31_hpo_dp_stream_enc_set_dsc_pps_info_packet,
+	.map_stream_to_link = dcn31_hpo_dp_stream_enc_map_stream_to_link,
+	.audio_mute_control = dcn31_hpo_dp_stream_enc_mute_control,
+	.dp_audio_setup = dcn31_hpo_dp_stream_enc_audio_setup,
+	.dp_audio_enable = dcn31_hpo_dp_stream_enc_audio_enable,
+	.dp_audio_disable = dcn31_hpo_dp_stream_enc_audio_disable,
+	.read_state = dcn31_hpo_dp_stream_enc_read_state,
+};
+
+void dcn31_hpo_dp_stream_encoder_construct(
+	struct dcn31_hpo_dp_stream_encoder *enc3,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	uint32_t inst,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct apg *apg,
+	const struct dcn31_hpo_dp_stream_encoder_registers *regs,
+	const struct dcn31_hpo_dp_stream_encoder_shift *hpo_se_shift,
+	const struct dcn31_hpo_dp_stream_encoder_mask *hpo_se_mask)
+{
+	enc3->base.funcs = &dcn30_str_enc_funcs;
+	enc3->base.ctx = ctx;
+	enc3->base.inst = inst;
+	enc3->base.id = eng_id;
+	enc3->base.bp = bp;
+	enc3->base.vpg = vpg;
+	enc3->base.apg = apg;
+	enc3->regs = regs;
+	enc3->hpo_se_shift = hpo_se_shift;
+	enc3->hpo_se_mask = hpo_se_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
new file mode 100644
index 000000000000..70b94fc25304
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
@@ -0,0 +1,241 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DAL_DCN31_HPO_DP_STREAM_ENCODER_H__
+#define __DAL_DCN31_HPO_DP_STREAM_ENCODER_H__
+
+#include "dcn30/dcn30_vpg.h"
+#include "dcn31/dcn31_apg.h"
+#include "stream_encoder.h"
+
+
+#define DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(hpo_dp_stream_encoder)\
+	container_of(hpo_dp_stream_encoder, struct dcn31_hpo_dp_stream_encoder, base)
+
+
+/* Define MSA_DATA_LANE_[0-3] fields to make programming easier */
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_0__SHIFT   0x0
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_1__SHIFT   0x8
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_2__SHIFT   0x10
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_3__SHIFT   0x18
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_0_MASK     0x000000FFL
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_1_MASK     0x0000FF00L
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_2_MASK     0x00FF0000L
+#define DP_SYM32_ENC_VID_MSA__MSA_DATA_LANE_3_MASK     0xFF000000L
+
+
+#define DCN3_1_HPO_DP_STREAM_ENC_REG_LIST(id) \
+	SR(DP_STREAM_MAPPER_CONTROL0),\
+	SR(DP_STREAM_MAPPER_CONTROL1),\
+	SR(DP_STREAM_MAPPER_CONTROL2),\
+	SR(DP_STREAM_MAPPER_CONTROL3),\
+	SRI(DP_STREAM_ENC_CLOCK_CONTROL, DP_STREAM_ENC, id),\
+	SRI(DP_STREAM_ENC_INPUT_MUX_CONTROL, DP_STREAM_ENC, id),\
+	SRI(DP_STREAM_ENC_AUDIO_CONTROL, DP_STREAM_ENC, id),\
+	SRI(DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0, DP_STREAM_ENC, id),\
+	SRI(DP_SYM32_ENC_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_PIXEL_FORMAT, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_PIXEL_FORMAT_DOUBLE_BUFFER_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA0, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA1, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA2, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA3, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA4, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA5, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA6, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA7, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA8, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_MSA_DOUBLE_BUFFER_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_FIFO_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_STREAM_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_VBID_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_GSP_CONTROL0, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_GSP_CONTROL2, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_GSP_CONTROL3, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_GSP_CONTROL5, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_GSP_CONTROL11, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_METADATA_PACKET_CONTROL, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_SDP_AUDIO_CONTROL0, DP_SYM32_ENC, id),\
+	SRI(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id)
+
+#define DCN3_1_HPO_DP_STREAM_ENC_REGS \
+	uint32_t DP_STREAM_MAPPER_CONTROL0;\
+	uint32_t DP_STREAM_MAPPER_CONTROL1;\
+	uint32_t DP_STREAM_MAPPER_CONTROL2;\
+	uint32_t DP_STREAM_MAPPER_CONTROL3;\
+	uint32_t DP_STREAM_ENC_CLOCK_CONTROL;\
+	uint32_t DP_STREAM_ENC_INPUT_MUX_CONTROL;\
+	uint32_t DP_STREAM_ENC_AUDIO_CONTROL;\
+	uint32_t DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0;\
+	uint32_t DP_SYM32_ENC_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_PIXEL_FORMAT;\
+	uint32_t DP_SYM32_ENC_VID_PIXEL_FORMAT_DOUBLE_BUFFER_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_MSA0;\
+	uint32_t DP_SYM32_ENC_VID_MSA1;\
+	uint32_t DP_SYM32_ENC_VID_MSA2;\
+	uint32_t DP_SYM32_ENC_VID_MSA3;\
+	uint32_t DP_SYM32_ENC_VID_MSA4;\
+	uint32_t DP_SYM32_ENC_VID_MSA5;\
+	uint32_t DP_SYM32_ENC_VID_MSA6;\
+	uint32_t DP_SYM32_ENC_VID_MSA7;\
+	uint32_t DP_SYM32_ENC_VID_MSA8;\
+	uint32_t DP_SYM32_ENC_VID_MSA_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_MSA_DOUBLE_BUFFER_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_FIFO_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_STREAM_CONTROL;\
+	uint32_t DP_SYM32_ENC_VID_VBID_CONTROL;\
+	uint32_t DP_SYM32_ENC_SDP_CONTROL;\
+	uint32_t DP_SYM32_ENC_SDP_GSP_CONTROL0;\
+	uint32_t DP_SYM32_ENC_SDP_GSP_CONTROL2;\
+	uint32_t DP_SYM32_ENC_SDP_GSP_CONTROL3;\
+	uint32_t DP_SYM32_ENC_SDP_GSP_CONTROL5;\
+	uint32_t DP_SYM32_ENC_SDP_GSP_CONTROL11;\
+	uint32_t DP_SYM32_ENC_SDP_METADATA_PACKET_CONTROL;\
+	uint32_t DP_SYM32_ENC_SDP_AUDIO_CONTROL0;\
+	uint32_t DP_SYM32_ENC_VID_CRC_CONTROL
+
+
+#define DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(mask_sh)\
+	SE_SF(DP_STREAM_MAPPER_CONTROL0, DP_STREAM_LINK_TARGET, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_CLOCK_CONTROL, DP_STREAM_ENC_CLOCK_EN, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_INPUT_MUX_CONTROL, DP_STREAM_ENC_INPUT_MUX_PIXEL_STREAM_SOURCE_SEL, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_AUDIO_CONTROL, DP_STREAM_ENC_INPUT_MUX_AUDIO_STREAM_SOURCE_SEL, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0, FIFO_RESET, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0, FIFO_RESET_DONE, mask_sh),\
+	SE_SF(DP_STREAM_ENC0_DP_STREAM_ENC_CLOCK_RAMP_ADJUSTER_FIFO_STATUS_CONTROL0, FIFO_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_CONTROL, DP_SYM32_ENC_RESET, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_CONTROL, DP_SYM32_ENC_RESET_DONE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_CONTROL, DP_SYM32_ENC_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_PIXEL_FORMAT, PIXEL_ENCODING_TYPE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_PIXEL_FORMAT, UNCOMPRESSED_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_PIXEL_FORMAT, UNCOMPRESSED_COMPONENT_DEPTH, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_PIXEL_FORMAT_DOUBLE_BUFFER_CONTROL, PIXEL_FORMAT_DOUBLE_BUFFER_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_MSA_DOUBLE_BUFFER_CONTROL, MSA_DOUBLE_BUFFER_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC_VID_MSA, MSA_DATA_LANE_0, mask_sh),\
+	SE_SF(DP_SYM32_ENC_VID_MSA, MSA_DATA_LANE_1, mask_sh),\
+	SE_SF(DP_SYM32_ENC_VID_MSA, MSA_DATA_LANE_2, mask_sh),\
+	SE_SF(DP_SYM32_ENC_VID_MSA, MSA_DATA_LANE_3, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_FIFO_CONTROL, PIXEL_TO_SYMBOL_FIFO_RESET, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_FIFO_CONTROL, PIXEL_TO_SYMBOL_FIFO_RESET_DONE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_FIFO_CONTROL, PIXEL_TO_SYMBOL_FIFO_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_STREAM_CONTROL, VID_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_STREAM_CONTROL, VID_STREAM_STATUS, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_VBID_CONTROL, VBID_6_COMPRESSEDSTREAM_FLAG_SOF_REFERENCE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_VBID_CONTROL, VBID_6_COMPRESSEDSTREAM_FLAG_LINE_NUMBER, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_CONTROL, SDP_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_PAYLOAD_SIZE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL0, GSP_TRANSMISSION_LINE_NUMBER, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL5, GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL5, GSP_TRANSMISSION_LINE_NUMBER, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_GSP_CONTROL5, GSP_SOF_REFERENCE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_METADATA_PACKET_CONTROL, METADATA_PACKET_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, AUDIO_MUTE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, ASP_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, ATP_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, AIP_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, ACM_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL, CRC_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL, CRC_CONT_MODE_ENABLE, mask_sh)
+
+
+#define DCN3_1_HPO_DP_STREAM_ENC_REG_FIELD_LIST(type) \
+	type DP_STREAM_LINK_TARGET;\
+	type DP_STREAM_ENC_CLOCK_EN;\
+	type DP_STREAM_ENC_INPUT_MUX_PIXEL_STREAM_SOURCE_SEL;\
+	type DP_STREAM_ENC_INPUT_MUX_AUDIO_STREAM_SOURCE_SEL;\
+	type FIFO_RESET;\
+	type FIFO_RESET_DONE;\
+	type FIFO_ENABLE;\
+	type DP_SYM32_ENC_RESET;\
+	type DP_SYM32_ENC_RESET_DONE;\
+	type DP_SYM32_ENC_ENABLE;\
+	type PIXEL_ENCODING_TYPE;\
+	type UNCOMPRESSED_PIXEL_ENCODING;\
+	type UNCOMPRESSED_COMPONENT_DEPTH;\
+	type PIXEL_FORMAT_DOUBLE_BUFFER_ENABLE;\
+	type MSA_DOUBLE_BUFFER_ENABLE;\
+	type MSA_DATA_LANE_0;\
+	type MSA_DATA_LANE_1;\
+	type MSA_DATA_LANE_2;\
+	type MSA_DATA_LANE_3;\
+	type PIXEL_TO_SYMBOL_FIFO_RESET;\
+	type PIXEL_TO_SYMBOL_FIFO_RESET_DONE;\
+	type PIXEL_TO_SYMBOL_FIFO_ENABLE;\
+	type VID_STREAM_ENABLE;\
+	type VID_STREAM_STATUS;\
+	type VBID_6_COMPRESSEDSTREAM_FLAG_SOF_REFERENCE;\
+	type VBID_6_COMPRESSEDSTREAM_FLAG_LINE_NUMBER;\
+	type SDP_STREAM_ENABLE;\
+	type AUDIO_MUTE;\
+	type ASP_ENABLE;\
+	type ATP_ENABLE;\
+	type AIP_ENABLE;\
+	type ACM_ENABLE;\
+	type GSP_VIDEO_CONTINUOUS_TRANSMISSION_ENABLE;\
+	type GSP_PAYLOAD_SIZE;\
+	type GSP_TRANSMISSION_LINE_NUMBER;\
+	type GSP_SOF_REFERENCE;\
+	type METADATA_PACKET_ENABLE;\
+	type CRC_ENABLE;\
+	type CRC_CONT_MODE_ENABLE
+
+
+struct dcn31_hpo_dp_stream_encoder_registers {
+	DCN3_1_HPO_DP_STREAM_ENC_REGS;
+};
+
+struct dcn31_hpo_dp_stream_encoder_shift {
+	DCN3_1_HPO_DP_STREAM_ENC_REG_FIELD_LIST(uint8_t);
+};
+
+struct dcn31_hpo_dp_stream_encoder_mask {
+	DCN3_1_HPO_DP_STREAM_ENC_REG_FIELD_LIST(uint32_t);
+};
+
+struct dcn31_hpo_dp_stream_encoder {
+	struct hpo_dp_stream_encoder base;
+	const struct dcn31_hpo_dp_stream_encoder_registers *regs;
+	const struct dcn31_hpo_dp_stream_encoder_shift *hpo_se_shift;
+	const struct dcn31_hpo_dp_stream_encoder_mask *hpo_se_mask;
+};
+
+
+void dcn31_hpo_dp_stream_encoder_construct(
+	struct dcn31_hpo_dp_stream_encoder *enc3,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	uint32_t inst,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct apg *apg,
+	const struct dcn31_hpo_dp_stream_encoder_registers *regs,
+	const struct dcn31_hpo_dp_stream_encoder_shift *hpo_se_shift,
+	const struct dcn31_hpo_dp_stream_encoder_mask *hpo_se_mask);
+
+
+#endif   // __DAL_DCN31_HPO_STREAM_ENCODER_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 7355864117e6..1994a8d3883d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -52,6 +52,7 @@
 #include "dcn30/dcn30_vpg.h"
 #include "dcn30/dcn30_afmt.h"
 #include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_stream_encoder.h"
 #include "dcn31/dcn31_apg.h"
 #include "dcn31/dcn31_dio_link_encoder.h"
 #include "dce/dce_clock_source.h"
@@ -564,6 +565,26 @@ static const struct dcn10_link_enc_mask le_mask = {
 	DPP_REG_LIST_DCN30(id),\
 }
 
+#define hpo_dp_stream_encoder_reg_list(id)\
+[id] = {\
+	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST(id)\
+}
+
+static const struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[] = {
+	hpo_dp_stream_encoder_reg_list(0),
+	hpo_dp_stream_encoder_reg_list(1),
+	hpo_dp_stream_encoder_reg_list(2),
+	hpo_dp_stream_encoder_reg_list(3),
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_shift hpo_dp_se_shift = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_mask hpo_dp_se_mask = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(_MASK)
+};
+
 static const struct dcn3_dpp_registers dpp_regs[] = {
 	dpp_regs(0),
 	dpp_regs(1),
@@ -900,6 +921,7 @@ static const struct resource_caps res_cap_dcn31 = {
 	.num_audio = 5,
 	.num_stream_encoder = 5,
 	.num_dig_link_enc = 5,
+	.num_hpo_dp_stream_encoder = 4,
 	.num_pll = 5,
 	.num_dwb = 1,
 	.num_ddc = 5,
@@ -1330,6 +1352,52 @@ static struct stream_encoder *dcn31_stream_encoder_create(
 	return &enc1->base;
 }
 
+static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_stream_encoder *hpo_dp_enc31;
+	struct vpg *vpg;
+	struct apg *apg;
+	uint32_t hpo_dp_inst;
+	uint32_t vpg_inst;
+	uint32_t apg_inst;
+
+	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
+
+	/* Mapping of VPG register blocks to HPO DP block instance:
+	 * VPG[6] -> HPO_DP[0]
+	 * VPG[7] -> HPO_DP[1]
+	 * VPG[8] -> HPO_DP[2]
+	 * VPG[9] -> HPO_DP[3]
+	 */
+	vpg_inst = hpo_dp_inst + 6;
+
+	/* Mapping of APG register blocks to HPO DP block instance:
+	 * APG[0] -> HPO_DP[0]
+	 * APG[1] -> HPO_DP[1]
+	 * APG[2] -> HPO_DP[2]
+	 * APG[3] -> HPO_DP[3]
+	 */
+	apg_inst = hpo_dp_inst;
+
+	/* allocate HPO stream encoder and create VPG sub-block */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_stream_encoder), GFP_KERNEL);
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	apg = dcn31_apg_create(ctx, apg_inst);
+
+	if (!hpo_dp_enc31 || !vpg || !apg)
+		return NULL;
+
+	dcn31_hpo_dp_stream_encoder_construct(hpo_dp_enc31, ctx, ctx->dc_bios,
+					hpo_dp_inst, eng_id, vpg, apg,
+					&hpo_dp_stream_enc_regs[hpo_dp_inst],
+					&hpo_dp_se_shift, &hpo_dp_se_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
 static struct dce_hwseq *dcn31_hwseq_create(
 	struct dc_context *ctx)
 {
@@ -1347,6 +1415,7 @@ static const struct resource_create_funcs res_create_funcs = {
 	.read_dce_straps = read_dce_straps,
 	.create_audio = dcn31_create_audio,
 	.create_stream_encoder = dcn31_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
 	.create_hwseq = dcn31_hwseq_create,
 };
 
@@ -1354,6 +1423,7 @@ static const struct resource_create_funcs res_create_maximus_funcs = {
 	.read_dce_straps = NULL,
 	.create_audio = NULL,
 	.create_stream_encoder = NULL,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
 	.create_hwseq = dcn31_hwseq_create,
 };
 
@@ -1376,6 +1446,21 @@ static void dcn31_resource_destruct(struct dcn31_resource_pool *pool)
 		}
 	}
 
+	for (i = 0; i < pool->base.hpo_dp_stream_enc_count; i++) {
+		if (pool->base.hpo_dp_stream_enc[i] != NULL) {
+			if (pool->base.hpo_dp_stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.hpo_dp_stream_enc[i]->vpg));
+				pool->base.hpo_dp_stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.hpo_dp_stream_enc[i]->apg != NULL) {
+				kfree(DCN31_APG_FROM_APG(pool->base.hpo_dp_stream_enc[i]->apg));
+				pool->base.hpo_dp_stream_enc[i]->apg = NULL;
+			}
+			kfree(DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(pool->base.hpo_dp_stream_enc[i]));
+			pool->base.hpo_dp_stream_enc[i] = NULL;
+		}
+	}
+
 	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
 		if (pool->base.dscs[i] != NULL)
 			dcn20_dsc_destroy(&pool->base.dscs[i]);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 45a6216dfa2a..19dbfc8a44bb 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -246,6 +246,10 @@ struct resource_pool {
 	 */
 	unsigned int dig_link_enc_count;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	unsigned int hpo_dp_stream_enc_count;
+	struct hpo_dp_stream_encoder *hpo_dp_stream_enc[MAX_HPO_DP2_ENCODERS];
+#endif
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_3dlut *mpc_lut[MAX_PIPES];
 	struct dc_transfer_func *mpc_shaper[MAX_PIPES];
@@ -298,6 +302,9 @@ struct stream_resource {
 	struct display_stream_compressor *dsc;
 	struct timing_generator *tg;
 	struct stream_encoder *stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_stream_encoder *hpo_dp_stream_enc;
+#endif
 	struct audio *audio;
 
 	struct pixel_clk_params pix_clk_params;
@@ -388,6 +395,9 @@ struct resource_context {
 	struct link_enc_assignment link_enc_assignments[MAX_PIPES];
 	/* List of available link encoders. Uses engine ID as encoder identifier. */
 	enum engine_id link_enc_avail[MAX_DIG_LINK_ENCODERS];
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	bool is_hpo_dp_stream_enc_acquired[MAX_HPO_DP2_ENCODERS];
+#endif
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool is_mpc_3dlut_acquired[MAX_PIPES];
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
index 31a1713bb49f..ad9e9e2d52b0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
@@ -38,6 +38,9 @@
 #define MAX_PIPES 6
 #define MAX_DIG_LINK_ENCODERS 7
 #define MAX_DWB_PIPES	1
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+#define MAX_HPO_DP2_ENCODERS	4
+#endif
 
 struct gamma_curve {
 	uint32_t offset;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index 564ea6a727b0..40a138a9593f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -242,4 +242,85 @@ struct stream_encoder_funcs {
 		struct stream_encoder *enc);
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+struct hpo_dp_stream_encoder_state {
+	uint32_t stream_enc_enabled;
+	uint32_t vid_stream_enabled;
+	uint32_t otg_inst;
+	uint32_t pixel_encoding;
+	uint32_t component_depth;
+	uint32_t compressed_format;
+	uint32_t sdp_enabled;
+	uint32_t mapped_to_link_enc;
+};
+
+struct hpo_dp_stream_encoder {
+	const struct hpo_dp_stream_encoder_funcs *funcs;
+	struct dc_context *ctx;
+	struct dc_bios *bp;
+	uint32_t inst;
+	enum engine_id id;
+	struct vpg *vpg;
+	struct apg *apg;
+};
+
+struct hpo_dp_stream_encoder_funcs {
+	void (*enable_stream)(
+			struct hpo_dp_stream_encoder *enc);
+
+	void (*dp_unblank)(
+			struct hpo_dp_stream_encoder *enc,
+			uint32_t stream_source);
+
+	void (*dp_blank)(
+			struct hpo_dp_stream_encoder *enc);
+
+	void (*disable)(
+			struct hpo_dp_stream_encoder *enc);
+
+	void (*set_stream_attribute)(
+		struct hpo_dp_stream_encoder *enc,
+		struct dc_crtc_timing *crtc_timing,
+		enum dc_color_space output_color_space,
+		bool use_vsc_sdp_for_colorimetry,
+		bool compressed_format,
+		bool double_buffer_en);
+
+	void (*update_dp_info_packets)(
+		struct hpo_dp_stream_encoder *enc,
+		const struct encoder_info_frame *info_frame);
+
+	void (*stop_dp_info_packets)(
+		struct hpo_dp_stream_encoder *enc);
+
+	void (*dp_set_dsc_pps_info_packet)(
+			struct hpo_dp_stream_encoder *enc,
+			bool enable,
+			uint8_t *dsc_packed_pps);
+
+	void (*map_stream_to_link)(
+			struct hpo_dp_stream_encoder *enc,
+			uint32_t stream_enc_inst,
+			uint32_t link_enc_inst);
+
+	void (*audio_mute_control)(
+			struct hpo_dp_stream_encoder *enc, bool mute);
+
+	void (*dp_audio_setup)(
+			struct hpo_dp_stream_encoder *enc,
+			unsigned int az_inst,
+			struct audio_info *info);
+
+	void (*dp_audio_enable)(
+			struct hpo_dp_stream_encoder *enc);
+
+	void (*dp_audio_disable)(
+			struct hpo_dp_stream_encoder *enc);
+
+	void (*read_state)(
+			struct hpo_dp_stream_encoder *enc,
+			struct hpo_dp_stream_encoder_state *state);
+};
+#endif
+
 #endif /* STREAM_ENCODER_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index fe1e5833c96a..5a2cfc899044 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -49,6 +49,9 @@ struct resource_caps {
 	int num_vmid;
 	int num_dsc;
 	unsigned int num_dig_link_enc; // Total number of DIGs (digital encoders) in DIO (Display Input/Output).
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	int num_hpo_dp_stream_encoder;
+#endif
 	int num_mpc_3dlut;
 };
 
@@ -68,6 +71,11 @@ struct resource_create_funcs {
 	struct stream_encoder *(*create_stream_encoder)(
 			enum engine_id eng_id, struct dc_context *ctx);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_stream_encoder *(*create_hpo_dp_stream_encoder)(
+			enum engine_id eng_id, struct dc_context *ctx);
+#endif
+
 	struct dce_hwseq *(*create_hwseq)(
 			struct dc_context *ctx);
 };
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_defs.h
index 58bb42ed85ca..84b299ff500a 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_defs.h
@@ -140,6 +140,18 @@ enum sync_source {
 	SYNC_SOURCE_DUAL_GPU_PIN
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum tx_ffe_id {
+	TX_FFE0 = 0,
+	TX_FFE1,
+	TX_FFE2,
+	TX_FFE3,
+	TX_FFE_DeEmphasis_Only,
+	TX_FFE_PreShoot_Only,
+	TX_FFE_No_FFE,
+};
+#endif
+
 /* connector sizes in millimeters - from BiosParserTypes.hpp */
 #define CONNECTOR_SIZE_DVI			40
 #define CONNECTOR_SIZE_VGA			32
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_id.h b/drivers/gpu/drm/amd/display/include/grph_object_id.h
index 33b3d755fe65..01775417cf4b 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_id.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_id.h
@@ -184,6 +184,14 @@ enum engine_id {
 	ENGINE_ID_DACA,
 	ENGINE_ID_DACB,
 	ENGINE_ID_VCE,	/* wireless display pseudo-encoder */
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	ENGINE_ID_HPO_0,
+	ENGINE_ID_HPO_1,
+	ENGINE_ID_HPO_DP_0,
+	ENGINE_ID_HPO_DP_1,
+	ENGINE_ID_HPO_DP_2,
+	ENGINE_ID_HPO_DP_3,
+#endif
 	ENGINE_ID_VIRTUAL,
 
 	ENGINE_ID_COUNT,
-- 
2.25.1

