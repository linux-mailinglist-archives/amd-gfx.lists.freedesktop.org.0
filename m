Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC48403BD4
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Sep 2021 16:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADFE6E12D;
	Wed,  8 Sep 2021 14:54:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DFD6E12D
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Sep 2021 14:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihFy7jvsFyNOhMOy7IkEbZEQQmkKP+bakXe51WNZKKqYro1TQxYvEpFhBmaFIsE+daTD9X20TJso6yKohMlPykXmVBvVjMMR+v70SzZA6VFHB0rUfJasBkmNaHiIcLb41r1pjIsPsPSKaEILEEJiP/sVdTj4GCOfjqe0ERZFjK6Tx2+AsFG0kMt1m9E5zaXfOxWLcz8wZ5aNyNjtrEc/OAkgehQiKoE53aiCfAETAdccUx6/zHc0xLWiWBB6Xp3bRH9m4vxwEMKTbPgmQ3FPOnTHa2a5Kzevu7GHpRguxxGdrsqrKQa6AooRim/l+A/lFzzA3YP68eG893TFae/URQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FUJ8srYqoZ66N4YKxXX66rCY7X+ks/iYkhNhq60bIXo=;
 b=jP2W38nZ0sKbRSBw25bKZs+FMyVII4pSg3osGf4S4EsHB70SBqP3GqiQb2rr7Z8NZvSQzKRDaIZ4Z20GPdt8FBA0sNV/HNfyDrmxrjgpsbk48gAMP+9p1uksimvTJSq+/FkQf+kmyZG8Buu1fXSL9OiNowDxM1zh27uRGQm9nAYR3XhZukypLQQ5njHWoLjHQyzraEmPetl0sXkaAfIujNUOSWMic7iiIMkQJ6mQ+9w3UMYt+Q0hhZG4TKG4uQ7/CvKZIFpHS62j2wdp6IqnGqcZcJdATxbEN3vFmpzYKNBHMSszOrPTaC6FPMBvB1AbPmi036e0L4Pwa1ajc2goUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUJ8srYqoZ66N4YKxXX66rCY7X+ks/iYkhNhq60bIXo=;
 b=HIhpvRvFn9dhY47G+JHZ6vYtvML9bIqOpVzjNmaNqvackhzet0N6ETThi4KKQtT0NNJ67TkYo1GJ0YP+ORJp1jduVKtbbtmV3oat1XSgnmxQ4AgOThaHal1rLvzJ6D/1w78yjqP876VghVgqWYneZxRDJMk9zXbatVFVj5CM4dY=
Received: from DM5PR07CA0099.namprd07.prod.outlook.com (2603:10b6:4:ae::28) by
 BYAPR12MB3510.namprd12.prod.outlook.com (2603:10b6:a03:13a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 14:54:36 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::f7) by DM5PR07CA0099.outlook.office365.com
 (2603:10b6:4:ae::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 14:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:54:35 +0000
Received: from DESKTOP-9DR2N9S.localdomain (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 09:54:33 -0500
From: Mikita Lipski <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Bhawanpreet.Lakha@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <Aurabindo.Pillai@amd.com>, <qingqing.zhuo@amd.com>, <mikita.lipski@amd.com>, 
 <roman.li@amd.com>, <Anson.Jacob@amd.com>, <wayne.lin@amd.com>,
 <stylon.wang@amd.com>, <solomon.chiu@amd.com>, "Leo (Hanghong) Ma"
 <hanghong.ma@amd.com>, Aric Cyr <aric.cyr@amd.com>
Subject: [PATCH 01/33] drm/amd/display: Add DPCD writes at key points
Date: Wed, 8 Sep 2021 10:53:52 -0400
Message-ID: <20210908145424.3311-2-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908145424.3311-1-mikita.lipski@amd.com>
References: <20210908145424.3311-1-mikita.lipski@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 663c2cb8-5c01-4884-4d74-08d972d89333
X-MS-TrafficTypeDiagnostic: BYAPR12MB3510:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3510339F67EC5A79F5518DD0E4D49@BYAPR12MB3510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4juV5MtTXvqTgx+2yagU+OHCV3RcgQyuREmpb6FHwECeH8Avk9pmd/z1kiLOM5DGsPn4wrxVNcdXu6iJBjS8l71hPPOD7KaJta6yMyXQ9aeY1R8mujlMo1QLXC5ze3CwR0Vk9GpveVFiHQZJ6rgaVgExIN5s8c8poQO55NoaaTd92/wp/uOwZfFXj1NMPZinCDSW7ycfFjBgOO2sqmypCcj31aBaIc8btuu4N4Gi9unx1NYXlFwmN31AtwvzU0usx+CeGnxKPYpw/D0tAnlOvRPINc8AOIIBrECFc031Sg55bEGRu9UCIU1/84Kw/wbkbxBE27nHgf2JWxmziI7iI4B4NxVTrmaJPDt41xF3r5oeXFY1eQHnMVkugy3iXGdCKo6Ft4jhgsv6J7vl57CXg9/EzFF74zbyawCcNXQ8r/Ooa/PyEElpkexvHOBtgDDL5iCGL6ZbiVUdOm9iOlE1Bo8Kg8Yb5RoUFUEq7dqGn/T/eeuic3yWdq9k6WllMzd0UC6OFkHUwkBfmPNoutvSP1jqSIW1NEB3zXZnpDi67N2dlrjXQxzyTUEBRbDy5NorVAtfLUmYSBzYVke11ByJOrU4t9ZqKA4x98ll0ad1v1ePJyuVQezmKqLkKhyN2W7s9nDTjL+WBXOlZXTP/eyR2IbFY5oMveE+ha9RiTHznBI9oPe8yZwc4+vsHAsmn1NxN/xGFG/DuYusQ+/oi5j21q9tOkPzb8C20X5nMCPa9OU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(36840700001)(46966006)(70586007)(36756003)(2616005)(70206006)(82740400003)(16526019)(186003)(426003)(336012)(81166007)(478600001)(1076003)(356005)(5660300002)(26005)(54906003)(6666004)(86362001)(6916009)(30864003)(36860700001)(2906002)(82310400003)(44832011)(8676002)(4326008)(8936002)(47076005)(83380400001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:54:35.6821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663c2cb8-5c01-4884-4d74-08d972d89333
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3510
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

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

This reverts commit "Revert "Add DPCD writes at key points" ".
The following patch will fix the system hang issue.

Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
Acked-by: Mikita Lipski <mikita.lipski@amd.com>
Reviewed-by: Aric Cyr <aric.cyr@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  7 ++++++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  3 ++-
 .../drm/amd/display/dc/core/dc_link_hwss.c    | 13 ++++++++++-
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 .../amd/display/dc/dce/dce_stream_encoder.c   |  2 ++
 .../display/dc/dce110/dce110_hw_sequencer.c   | 22 ++++++++++++++-----
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  4 ++--
 .../display/dc/dcn10/dcn10_stream_encoder.c   | 10 +++++++++
 .../display/dc/dcn10/dcn10_stream_encoder.h   |  2 ++
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 10 ++++++++-
 .../display/dc/dcn20/dcn20_stream_encoder.c   |  5 +++++
 .../display/dc/dcn20/dcn20_stream_encoder.h   |  1 +
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  2 +-
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |  2 +-
 .../amd/display/dc/inc/hw/stream_encoder.h    |  2 ++
 .../gpu/drm/amd/display/dc/inc/link_hwss.h    |  1 +
 .../dc/virtual/virtual_stream_encoder.c       |  2 ++
 .../gpu/drm/amd/display/include/dpcd_defs.h   |  1 +
 .../amd/display/include/link_service_types.h  | 16 ++++++++++++++
 19 files changed, 94 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 54ff4fb1ea03..f1c9ee53ac67 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3572,6 +3572,7 @@ void core_link_enable_stream(
 {
 	struct dc *dc = pipe_ctx->stream->ctx->dc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->sink->link;
 	enum dc_status status;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
@@ -3624,6 +3625,9 @@ void core_link_enable_stream(
 			stream->link->dpcd_caps.dprx_feature.bits.SST_SPLIT_SDP_CAP);
 #endif
 
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
+
 	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
 		pipe_ctx->stream_res.stream_enc->funcs->hdmi_set_stream_attribute(
 			pipe_ctx->stream_res.stream_enc,
@@ -3659,6 +3663,9 @@ void core_link_enable_stream(
 		resource_build_info_frame(pipe_ctx);
 		dc->hwss.update_info_frame(pipe_ctx);
 
+		if (dc_is_dp_signal(pipe_ctx->stream->signal))
+			dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+
 		/* Do not touch link on seamless boot optimization. */
 		if (pipe_ctx->stream->apply_seamless_boot_optimization) {
 			pipe_ctx->stream->dpms_off = false;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index e412a096a4b8..53c3c9c1a79d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2375,6 +2375,7 @@ bool perform_link_training_with_retries(
 #endif
 		link_enc->funcs->connect_dig_be_to_fe(link_enc,
 							pipe_ctx->stream_res.stream_enc->id, true);
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
 
 	for (j = 0; j < attempts; ++j) {
 
@@ -5267,7 +5268,7 @@ bool dc_link_dp_set_test_pattern(
 			 * MuteAudioEndpoint(pPathMode->pDisplayPath, true);
 			 */
 			/* Blank stream */
-			pipes->stream_res.stream_enc->funcs->dp_blank(pipe_ctx->stream_res.stream_enc);
+			pipes->stream_res.stream_enc->funcs->dp_blank(link, pipe_ctx->stream_res.stream_enc);
 		}
 
 		dp_set_hw_test_pattern(link, test_pattern,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 29b9c128c87c..58abfa5a7bac 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -62,6 +62,13 @@ void dp_receiver_power_ctrl(struct dc_link *link, bool on)
 			sizeof(state));
 }
 
+void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
+{
+	if (link->dc->debug.enable_driver_sequence_debug)
+		core_link_write_dpcd(link, DP_SOURCE_SEQUENCE,
+					&dp_test_mode, sizeof(dp_test_mode));
+}
+
 void dp_enable_link_phy(
 	struct dc_link *link,
 	enum signal_type signal,
@@ -158,6 +165,7 @@ void dp_enable_link_phy(
 	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
 	dp_receiver_power_ctrl(link, true);
 }
 
@@ -276,6 +284,8 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
 			dmcu->funcs->unlock_phy(dmcu);
 	}
 
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+
 	/* Clear current link setting.*/
 	memset(&link->cur_link_settings, 0,
 			sizeof(link->cur_link_settings));
@@ -407,6 +417,7 @@ void dp_set_hw_test_pattern(
 #else
 	encoder->funcs->dp_set_phy_pattern(encoder, &pattern_param);
 #endif
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #undef DC_LOGGER
@@ -428,7 +439,7 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 			pipes[i].stream->link == link) {
 			udelay(100);
 
-			pipes[i].stream_res.stream_enc->funcs->dp_blank(
+			pipes[i].stream_res.stream_enc->funcs->dp_blank(link,
 					pipes[i].stream_res.stream_enc);
 
 			/* disable any test pattern that might be active */
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 0505081e4fe8..bcae2250a574 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -643,6 +643,7 @@ struct dc_debug_options {
 	bool force_enable_edp_fec;
 	/* FEC/PSR1 sequence enable delay in 100us */
 	uint8_t fec_enable_delay_in100us;
+	bool enable_driver_sequence_debug;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool disable_z10;
 	bool enable_sw_cntl_psr;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
index 8d4263da59f2..779bc92a2968 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
@@ -919,6 +919,7 @@ static void dce110_stream_encoder_stop_dp_info_packets(
 }
 
 static void dce110_stream_encoder_dp_blank(
+	struct dc_link *link,
 	struct stream_encoder *enc)
 {
 	struct dce110_stream_encoder *enc110 = DCE110STRENC_FROM_STRENC(enc);
@@ -967,6 +968,7 @@ static void dce110_stream_encoder_dp_blank(
 
 /* output video stream to link encoder */
 static void dce110_stream_encoder_dp_unblank(
+	struct dc_link *link,
 	struct stream_encoder *enc,
 	const struct encoder_unblank_param *param)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index f660472e71fb..cf8fee721f30 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -57,7 +57,8 @@
 #include "audio.h"
 #include "reg_helper.h"
 #include "panel_cntl.h"
-
+#include "inc/link_dpcd.h"
+#include "dpcd_defs.h"
 /* include DCE11 register header files */
 #include "dce/dce_11_0_d.h"
 #include "dce/dce_11_0_sh_mask.h"
@@ -1122,6 +1123,9 @@ void dce110_enable_audio_stream(struct pipe_ctx *pipe_ctx)
 		if (pipe_ctx->stream_res.audio)
 			pipe_ctx->stream_res.audio->enabled = true;
 	}
+
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(pipe_ctx->stream->link, DPCD_SOURCE_SEQ_AFTER_ENABLE_AUDIO_STREAM);
 }
 
 void dce110_disable_audio_stream(struct pipe_ctx *pipe_ctx)
@@ -1178,6 +1182,9 @@ void dce110_disable_audio_stream(struct pipe_ctx *pipe_ctx)
 		 * stream->stream_engine_id);
 		 */
 	}
+
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(pipe_ctx->stream->link, DPCD_SOURCE_SEQ_AFTER_DISABLE_AUDIO_STREAM);
 }
 
 void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
@@ -1224,7 +1231,8 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc->id,
 			false);
 #endif
-
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
 }
 
 void dce110_unblank_stream(struct pipe_ctx *pipe_ctx,
@@ -1240,7 +1248,7 @@ void dce110_unblank_stream(struct pipe_ctx *pipe_ctx,
 	params.link_settings.link_rate = link_settings->link_rate;
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(pipe_ctx->stream_res.stream_enc, &params);
+		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(link, pipe_ctx->stream_res.stream_enc, &params);
 
 	if (link->local_sink && link->local_sink->sink_signal == SIGNAL_TYPE_EDP) {
 		hws->funcs.edp_backlight_control(link, true);
@@ -1267,7 +1275,7 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 #else
 	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
 #endif
-		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(pipe_ctx->stream_res.stream_enc);
+		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(link, pipe_ctx->stream_res.stream_enc);
 
 		if (!dc_is_embedded_signal(pipe_ctx->stream->signal)) {
 			/*
@@ -1492,6 +1500,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 		struct dc *dc)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
 	struct drr_params params = {0};
 	unsigned int event_triggers = 0;
 	struct pipe_ctx *odm_pipe = pipe_ctx->next_odm_pipe;
@@ -1576,6 +1585,9 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 			pipe_ctx->stream_res.stream_enc,
 			pipe_ctx->stream_res.tg->inst);
 
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG);
+
 	pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
 			pipe_ctx->stream_res.opp,
 			COLOR_SPACE_YCBCR601,
@@ -1632,7 +1644,7 @@ static void power_down_encoders(struct dc *dc)
 	 * hurt for non-DP
 	 */
 	for (i = 0; i < dc->res_pool->stream_enc_count; i++) {
-		dc->res_pool->stream_enc[i]->funcs->dp_blank(
+		dc->res_pool->stream_enc[i]->funcs->dp_blank(dc->links[i],
 					dc->res_pool->stream_enc[i]);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 70d47773c23c..b4cf2e92694c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1489,7 +1489,7 @@ void dcn10_init_hw(struct dc *dc)
 
 					for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
 						if (fe == dc->res_pool->stream_enc[j]->id) {
-							dc->res_pool->stream_enc[j]->funcs->dp_blank(
+							dc->res_pool->stream_enc[j]->funcs->dp_blank(dc->links[i],
 										dc->res_pool->stream_enc[j]);
 							break;
 						}
@@ -3678,7 +3678,7 @@ void dcn10_unblank_stream(struct pipe_ctx *pipe_ctx,
 	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
 		if (params.timing.pixel_encoding == PIXEL_ENCODING_YCBCR420)
 			params.timing.pix_clk_100hz /= 2;
-		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(pipe_ctx->stream_res.stream_enc, &params);
+		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(link, pipe_ctx->stream_res.stream_enc, &params);
 	}
 
 	if (link->local_sink && link->local_sink->sink_signal == SIGNAL_TYPE_EDP) {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
index bccefb6c22c8..b7d55212dc8f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
@@ -29,6 +29,8 @@
 #include "dcn10_stream_encoder.h"
 #include "reg_helper.h"
 #include "hw_shared.h"
+#include "inc/link_dpcd.h"
+#include "dpcd_defs.h"
 
 #define DC_LOGGER \
 		enc1->base.ctx->logger
@@ -894,6 +896,7 @@ void enc1_stream_encoder_stop_dp_info_packets(
 }
 
 void enc1_stream_encoder_dp_blank(
+	struct dc_link *link,
 	struct stream_encoder *enc)
 {
 	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
@@ -924,6 +927,8 @@ void enc1_stream_encoder_dp_blank(
 	/* disable DP stream */
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, 0);
 
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM);
+
 	/* the encoder stops sending the video stream
 	 * at the start of the vertical blanking.
 	 * Poll for DP_VID_STREAM_STATUS == 0
@@ -940,10 +945,13 @@ void enc1_stream_encoder_dp_blank(
 	 */
 
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, true);
+
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET);
 }
 
 /* output video stream to link encoder */
 void enc1_stream_encoder_dp_unblank(
+	struct dc_link *link,
 	struct stream_encoder *enc,
 	const struct encoder_unblank_param *param)
 {
@@ -1010,6 +1018,8 @@ void enc1_stream_encoder_dp_unblank(
 	 */
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
+
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 void enc1_stream_encoder_set_avmute(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
index 0d86df97878c..687d7e4bf7ca 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
@@ -627,9 +627,11 @@ void enc1_stream_encoder_stop_dp_info_packets(
 	struct stream_encoder *enc);
 
 void enc1_stream_encoder_dp_blank(
+	struct dc_link *link,
 	struct stream_encoder *enc);
 
 void enc1_stream_encoder_dp_unblank(
+	struct dc_link *link,
 	struct stream_encoder *enc,
 	const struct encoder_unblank_param *param);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index b9276da87872..ffc0b9ab976f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -52,6 +52,8 @@
 #include "dc_dmub_srv.h"
 #include "dce/dmub_hw_lock_mgr.h"
 #include "hw_sequencer.h"
+#include "inc/link_dpcd.h"
+#include "dpcd_defs.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -2145,7 +2147,7 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 			params.timing.pix_clk_100hz /= 2;
 		pipe_ctx->stream_res.stream_enc->funcs->dp_set_odm_combine(
 				pipe_ctx->stream_res.stream_enc, params.opp_cnt > 1);
-		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(pipe_ctx->stream_res.stream_enc, &params);
+		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(link, pipe_ctx->stream_res.stream_enc, &params);
 	}
 
 	if (link->local_sink && link->local_sink->sink_signal == SIGNAL_TYPE_EDP) {
@@ -2399,6 +2401,9 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 		link->link_enc->funcs->connect_dig_be_to_fe(
 			link->link_enc, pipe_ctx->stream_res.stream_enc->id, true);
 
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
+
 	if (pipe_ctx->plane_state && pipe_ctx->plane_state->flip_immediate != 1) {
 		if (link->dc->hwss.program_dmdata_engine)
 			link->dc->hwss.program_dmdata_engine(pipe_ctx);
@@ -2406,6 +2411,9 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 
 	link->dc->hwss.update_info_frame(pipe_ctx);
 
+	if (dc_is_dp_signal(pipe_ctx->stream->signal))
+		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+
 	/* enable early control to avoid corruption on DP monitor*/
 	active_total_with_borders =
 			timing->h_addressable
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
index e6307397e0d2..44f31b7b9ac9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
@@ -29,6 +29,8 @@
 #include "dcn20_stream_encoder.h"
 #include "reg_helper.h"
 #include "hw_shared.h"
+#include "inc/link_dpcd.h"
+#include "dpcd_defs.h"
 
 #define DC_LOGGER \
 		enc1->base.ctx->logger
@@ -444,6 +446,7 @@ static bool is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
 }
 
 void enc2_stream_encoder_dp_unblank(
+		struct dc_link *link,
 		struct stream_encoder *enc,
 		const struct encoder_unblank_param *param)
 {
@@ -522,6 +525,8 @@ void enc2_stream_encoder_dp_unblank(
 	 */
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
+
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 static void enc2_dp_set_odm_combine(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.h
index f3d1a0237bda..baa1e539f341 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.h
@@ -104,6 +104,7 @@ void enc2_stream_encoder_dp_set_stream_attribute(
 	uint32_t enable_sdp_splitting);
 
 void enc2_stream_encoder_dp_unblank(
+	struct dc_link *link,
 	struct stream_encoder *enc,
 	const struct encoder_unblank_param *param);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index fafed1e4a998..b132ebed09d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -559,7 +559,7 @@ void dcn30_init_hw(struct dc *dc)
 
 					for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
 						if (fe == dc->res_pool->stream_enc[j]->id) {
-							dc->res_pool->stream_enc[j]->funcs->dp_blank(
+							dc->res_pool->stream_enc[j]->funcs->dp_blank(dc->links[i],
 										dc->res_pool->stream_enc[j]);
 							break;
 						}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 3f2333ec67e2..7feba8a0d847 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -194,7 +194,7 @@ void dcn31_init_hw(struct dc *dc)
 
 					for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
 						if (fe == dc->res_pool->stream_enc[j]->id) {
-							dc->res_pool->stream_enc[j]->funcs->dp_blank(
+							dc->res_pool->stream_enc[j]->funcs->dp_blank(dc->links[i],
 										dc->res_pool->stream_enc[j]);
 							break;
 						}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index 40a138a9593f..9f03fda5b965 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -165,9 +165,11 @@ struct stream_encoder_funcs {
 		struct stream_encoder *enc);
 
 	void (*dp_blank)(
+		struct dc_link *link,
 		struct stream_encoder *enc);
 
 	void (*dp_unblank)(
+		struct dc_link *link,
 		struct stream_encoder *enc,
 		const struct encoder_unblank_param *param);
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
index fc1d289bb9fe..ba664bc49595 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_hwss.h
@@ -37,6 +37,7 @@ void dp_enable_link_phy(
 	const struct dc_link_settings *link_settings);
 
 void dp_receiver_power_ctrl(struct dc_link *link, bool on);
+void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode);
 void edp_add_delay_for_T9(struct dc_link *link);
 bool edp_receiver_ready_T9(struct dc_link *link);
 bool edp_receiver_ready_T7(struct dc_link *link);
diff --git a/drivers/gpu/drm/amd/display/dc/virtual/virtual_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/virtual/virtual_stream_encoder.c
index 1053b165c139..42a29b712e0e 100644
--- a/drivers/gpu/drm/amd/display/dc/virtual/virtual_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/virtual/virtual_stream_encoder.c
@@ -69,9 +69,11 @@ static void virtual_stream_encoder_stop_dp_info_packets(
 	struct stream_encoder *enc) {}
 
 static void virtual_stream_encoder_dp_blank(
+	struct dc_link *link,
 	struct stream_encoder *enc) {}
 
 static void virtual_stream_encoder_dp_unblank(
+	struct dc_link *link,
 	struct stream_encoder *enc,
 	const struct encoder_unblank_param *param) {}
 
diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
index 6fb7c0145cb6..ffd0df1701e6 100644
--- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
+++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
@@ -165,6 +165,7 @@ enum dpcd_psr_sink_states {
 	PSR_SINK_STATE_SINK_INTERNAL_ERROR = 7,
 };
 
+#define DP_SOURCE_SEQUENCE    		    0x30c
 #define DP_SOURCE_TABLE_REVISION	    0x310
 #define DP_SOURCE_PAYLOAD_SIZE		    0x311
 #define DP_SOURCE_SINK_CAP		    0x317
diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
index c729b50c4f20..9ffea7b40545 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -191,6 +191,22 @@ enum dp_panel_mode {
 	DP_PANEL_MODE_SPECIAL
 };
 
+enum dpcd_source_sequence {
+	DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG = 1, /*done in apply_single_controller_ctx_to_hw */
+	DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR,         /*done in core_link_enable_stream */
+	DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME,      /*done in core_link_enable_stream/dcn20_enable_stream */
+	DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE,      /*done in perform_link_training_with_retries/dcn20_enable_stream */
+	DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY,        /*done in dp_enable_link_phy */
+	DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN,     /*done in dp_set_hw_test_pattern */
+	DPCD_SOURCE_SEQ_AFTER_ENABLE_AUDIO_STREAM,    /*done in dce110_enable_audio_stream */
+	DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM,   /*done in enc1_stream_encoder_dp_unblank */
+	DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM,  /*done in enc1_stream_encoder_dp_blank */
+	DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET,       /*done in enc1_stream_encoder_dp_blank */
+	DPCD_SOURCE_SEQ_AFTER_DISABLE_AUDIO_STREAM,   /*done in dce110_disable_audio_stream */
+	DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY,       /*done in dp_disable_link_phy */
+	DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE,   /*done in dce110_disable_stream */
+};
+
 /* DPCD_ADDR_TRAINING_LANEx_SET registers value */
 union dpcd_training_lane_set {
 	struct {
-- 
2.25.1

