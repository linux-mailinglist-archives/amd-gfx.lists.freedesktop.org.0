Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF82403BF7
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Sep 2021 16:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D116E1F7;
	Wed,  8 Sep 2021 14:55:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09C6E202
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Sep 2021 14:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzcTC4jRg23pnkXjojTzdyioReirLJMXmCqSjI4V9bPv9IkY8j31czGcBUvW6ogk7z4rvJIW+gMmdYBcmqgIm8Q85Zf58iOoBIp8Rj6zCnWPtg+a7rfIhVfHX4wepCiqRD7QpusbZaceDMGN5zBcrHHszqygmTNWoPDDhMGxiZYEgXC4fJklD4CI/KwLOsfoK5Wm+KKTFDXM1ok39rL4V7H/MKPzsJcLWaiCTPrYACG6CLkw703Pt7qsIpNvgcVReh8o2esX/e8c6HMmUuzAyCO1o8v/PJGZnwVQYLHKiUrifo+FKpxGi6XFturUJNnPgapYBH/DI79yCovzzBds+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8KLA3/jTu3YLFBksW558k/Y97VLVREBpe1T9DGV80Mo=;
 b=VVwMS5Cj4OCZAJBHUQ/IYDLLJBueYilr5Xc3dd8UNOqWwmzF1f7GTHZp7o/iRwhJQUsFGLhJA79A2VFXwj8/P4EI3eVvG7aoip6e5RlBlYDl3G4v3HoZgsyO81MfNzMtoog+i4iot3MN7CzYW0KKb0f1rvM7QOi7FRGv9A2l2XxmbcQMfPVKk24SPgyR+0GDYXRnHxJBgZb119yf8TRybh5dzBlYVxO4ZzZDfHTYnpjhLhKcUuvWjbm1mO1yQVHD86WFMQpJC9f3vp1genMD/4o0aWB+YrVcoWS+CrnSvCPqjNXkzRRQnYLfXpQ4/L2ScHaQ2GXkQ01naEjT7Bj4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KLA3/jTu3YLFBksW558k/Y97VLVREBpe1T9DGV80Mo=;
 b=Eq937pCR2ljdKlhNoPqxe6yiPYOEVTgeHqnLYiETVBYYn0cDIMHwYRzhIZYv/P3IoZOXA+hUHZNViU7qOXTPLmDrldW0pniavHap2GZfFzCaOeiEAjGiwjiLJDuxRb9nEcV1wZr5u29op/lgaZloDK6jlUenN7ZigV5vudtpCe8=
Received: from DM3PR12CA0123.namprd12.prod.outlook.com (2603:10b6:0:51::19) by
 MW2PR12MB2473.namprd12.prod.outlook.com (2603:10b6:907:4::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Wed, 8 Sep 2021 14:55:13 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::3b) by DM3PR12CA0123.outlook.office365.com
 (2603:10b6:0:51::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 14:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:55:13 +0000
Received: from DESKTOP-9DR2N9S.localdomain (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 09:55:11 -0500
From: Mikita Lipski <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Bhawanpreet.Lakha@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <Aurabindo.Pillai@amd.com>, <qingqing.zhuo@amd.com>, <mikita.lipski@amd.com>, 
 <roman.li@amd.com>, <Anson.Jacob@amd.com>, <wayne.lin@amd.com>,
 <stylon.wang@amd.com>, <solomon.chiu@amd.com>, Michael Strauss
 <michael.strauss@amd.com>, Eric Yang <eric.yang2@amd.com>
Subject: [PATCH 31/33] drm/amd/display: Add VPG and AFMT low power support for
 DCN3.1
Date: Wed, 8 Sep 2021 10:54:22 -0400
Message-ID: <20210908145424.3311-32-mikita.lipski@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 856c353d-b448-400d-f390-08d972d8a9af
X-MS-TrafficTypeDiagnostic: MW2PR12MB2473:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2473D6CD58493AF4FC49D38DE4D49@MW2PR12MB2473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCJMJicmkH9OlEkc15WNkGmm3yb1I2kcrY+uWjsQpRFOuOXCqbOrDPKExuWyO5Uv8BHefIWKOPNfZOGMAo8RQnwQhDuVdk1B/FDTmlEd8PKPEWMNWjt9z9uD++W/cDPYS8SR1sGfxCwUSB5XgB0iv5x7aQA5yv9ejuhZtk6foW2ooaBabARJj6uvFSWt9SQdwTTlKsCnF+uKd373tNsAcq3XCv36uzDkPim00SJ/qgwqw6/KsB5tVEVGULjPjO9Q/8EEfCpgdYbejFDkKH4HsF+LKjU/ZHNxDUTYO/0DLCoIsxTl9Oip0AuBbSizNEyMcYwgWPIhuwWTqnjaycrjY9ltRLySR7rOIl7f/ijb0KPkFKKZ6kJRIZ2HXdAUrG91umNOdlbzQh61UO/qyVyAhMwuEoPIIKtmfBZkmiRLI6PHIup3hSmZTM1EYReGC8GtAPLEbuGsqKbYEUkvN1J77E+0szHHr5QUEOVHvmxICg0zdlqttZPFDPIu5pmlTYYloKaWTb3r+aNCDpdH7/Vw0NDYpaPxqMx8jBzDrawSAfFvBByDpWlSgOeUq9fZBktUMC9N31C8ugU5Idtj+AkRSr4ysoV2ADfbHrD6OD5Rq9+MCjvR3b+GwiXWNtDf23c2jglEmCEJLKY8YxWEzR8gLcsN2skjMaEk7DLKQIdpj9vF9giXHg1B/33f/VZi5qoPa1l28/mTS1Ynjd/yP1sCdqOugQRDZPRwKgWsAYgNmA0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(478600001)(30864003)(54906003)(5660300002)(26005)(2616005)(47076005)(36756003)(186003)(16526019)(82310400003)(83380400001)(44832011)(2906002)(86362001)(1076003)(6916009)(316002)(356005)(4326008)(8676002)(8936002)(81166007)(70206006)(70586007)(82740400003)(336012)(36860700001)(426003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:55:13.4049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856c353d-b448-400d-f390-08d972d8a9af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2473
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

From: Michael Strauss <michael.strauss@amd.com>

[WHY]
Power down VPG and AFMT blocks when not in use

[HOW]
Create afmt31 and vpg31 structs and add necessary fields to reg list

Reviewed-by: Eric Yang <eric.yang2@amd.com>
Acked-by: Mikita Lipski <mikita.lipski@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  10 ++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  17 ++
 drivers/gpu/drm/amd/display/dc/dc.h           |   2 +
 .../display/dc/dcn10/dcn10_stream_encoder.c   |  10 ++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  24 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h |  24 +++
 .../dc/dcn30/dcn30_dio_stream_encoder.c       |   2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h  |  11 ++
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |   3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c |  92 ++++++++++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h | 126 ++++++++++++++
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |  50 +++---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c  |  87 ++++++++++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h  | 162 ++++++++++++++++++
 15 files changed, 593 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8bebfb0ca206..e66ca19e2f73 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -71,6 +71,8 @@
 
 #include "dmub/dmub_srv.h"
 
+#include "dcn30/dcn30_vpg.h"
+
 #include "i2caux_interface.h"
 #include "dce/dmub_hw_lock_mgr.h"
 
@@ -2555,6 +2557,9 @@ static void commit_planes_do_stream_update(struct dc *dc,
 		enum surface_update_type update_type,
 		struct dc_state *context)
 {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct vpg *vpg;
+#endif
 	int j;
 
 	// Stream updates
@@ -2575,6 +2580,11 @@ static void commit_planes_do_stream_update(struct dc *dc,
 					stream_update->vrr_infopacket ||
 					stream_update->vsc_infopacket ||
 					stream_update->vsp_infopacket) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+				vpg = pipe_ctx->stream_res.stream_enc->vpg;
+				if (vpg && vpg->funcs->vpg_poweron)
+					vpg->funcs->vpg_poweron(vpg);
+#endif
 				resource_build_info_frame(pipe_ctx);
 				dc->hwss.update_info_frame(pipe_ctx);
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a87a71b815ad..746b31ba2708 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -51,6 +51,8 @@
 #include "inc/link_enc_cfg.h"
 #include "inc/link_dpcd.h"
 
+#include "dc/dcn30/dcn30_vpg.h"
+
 #define DC_LOGGER_INIT(logger)
 
 #define LINK_INFO(...) \
@@ -3653,6 +3655,7 @@ void core_link_enable_stream(
 	struct link_encoder *link_enc;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
+	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 #endif
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
 
@@ -3744,6 +3747,12 @@ void core_link_enable_stream(
 
 		pipe_ctx->stream->apply_edp_fast_boot_optimization = false;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		// Enable VPG before building infoframe
+		if (vpg && vpg->funcs->vpg_poweron)
+			vpg->funcs->vpg_poweron(vpg);
+#endif
+
 		resource_build_info_frame(pipe_ctx);
 		dc->hwss.update_info_frame(pipe_ctx);
 
@@ -3890,6 +3899,9 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 	struct dc  *dc = pipe_ctx->stream->ctx->dc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->sink->link;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
+#endif
 
 	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
 			dc_is_virtual_signal(pipe_ctx->stream->signal))
@@ -3973,6 +3985,11 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
 	}
 #endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	if (vpg && vpg->funcs->vpg_powerdown)
+		vpg->funcs->vpg_powerdown(vpg);
+#endif
 }
 
 void core_link_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 442605354430..15b67239266e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -471,6 +471,8 @@ union mem_low_power_enable_options {
 		bool cm: 1;
 		bool mpc: 1;
 		bool optc: 1;
+		bool vpg: 1;
+		bool afmt: 1;
 	} bits;
 	uint32_t u32All;
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
index b7d55212dc8f..a97bdaa54f73 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
@@ -31,6 +31,7 @@
 #include "hw_shared.h"
 #include "inc/link_dpcd.h"
 #include "dpcd_defs.h"
+#include "dcn30/dcn30_afmt.h"
 
 #define DC_LOGGER \
 		enc1->base.ctx->logger
@@ -1401,6 +1402,11 @@ static void enc1_se_disable_dp_audio(
 	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
 	uint32_t value = 0;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	if (enc->afmt && enc->afmt->funcs->afmt_powerdown)
+		enc->afmt->funcs->afmt_powerdown(enc->afmt);
+#endif
+
 	/* Disable Audio packets */
 	REG_UPDATE_5(DP_SEC_CNTL,
 			DP_SEC_ASP_ENABLE, 0,
@@ -1464,6 +1470,10 @@ void enc1_se_hdmi_audio_setup(
 void enc1_se_hdmi_audio_disable(
 	struct stream_encoder *enc)
 {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	if (enc->afmt && enc->afmt->funcs->afmt_powerdown)
+		enc->afmt->funcs->afmt_powerdown(enc->afmt);
+#endif
 	enc1_se_enable_audio_clock(enc, false);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
index fa981cd04dd0..95528e5ef89e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -44,11 +44,14 @@
 	afmt3->base.ctx
 
 
-static void afmt3_setup_hdmi_audio(
+void afmt3_setup_hdmi_audio(
 	struct afmt *afmt)
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
 
+	if (afmt->funcs->afmt_poweron)
+		afmt->funcs->afmt_poweron(afmt);
+
 	/* AFMT_AUDIO_PACKET_CONTROL */
 	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, 1);
 
@@ -113,7 +116,7 @@ static union audio_cea_channels speakers_to_channels(
 	return cea_channels;
 }
 
-static void afmt3_se_audio_setup(
+void afmt3_se_audio_setup(
 	struct afmt *afmt,
 	unsigned int az_inst,
 	struct audio_info *audio_info)
@@ -138,20 +141,24 @@ static void afmt3_se_audio_setup(
 	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_CHANNEL_ENABLE, channels);
 
 	/* Disable forced mem power off */
-	REG_UPDATE(AFMT_MEM_PWR, AFMT_MEM_PWR_FORCE, 0);
+	if (afmt->funcs->afmt_poweron == NULL)
+		REG_UPDATE(AFMT_MEM_PWR, AFMT_MEM_PWR_FORCE, 0);
 }
 
-static void afmt3_audio_mute_control(
+void afmt3_audio_mute_control(
 	struct afmt *afmt,
 	bool mute)
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
-
+	if (mute && afmt->funcs->afmt_powerdown)
+		afmt->funcs->afmt_powerdown(afmt);
+	if (!mute && afmt->funcs->afmt_poweron)
+		afmt->funcs->afmt_poweron(afmt);
 	/* enable/disable transmission of audio packets */
 	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_AUDIO_SAMPLE_SEND, !mute);
 }
 
-static void afmt3_audio_info_immediate_update(
+void afmt3_audio_info_immediate_update(
 	struct afmt *afmt)
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
@@ -160,11 +167,14 @@ static void afmt3_audio_info_immediate_update(
 	REG_UPDATE(AFMT_INFOFRAME_CONTROL0, AFMT_AUDIO_INFO_UPDATE, 1);
 }
 
-static void afmt3_setup_dp_audio(
+void afmt3_setup_dp_audio(
 		struct afmt *afmt)
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
 
+	if (afmt->funcs->afmt_poweron)
+		afmt->funcs->afmt_poweron(afmt);
+
 	/* AFMT_AUDIO_PACKET_CONTROL */
 	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, 1);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
index 85d4619207e2..97e0cf62f98e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
@@ -121,6 +121,12 @@ struct afmt_funcs {
 
 	void (*setup_dp_audio)(
 		struct afmt *afmt);
+
+	void (*afmt_poweron)(
+		struct afmt *afmt);
+
+	void (*afmt_powerdown)(
+		struct afmt *afmt);
 };
 
 struct afmt {
@@ -136,6 +142,24 @@ struct dcn30_afmt {
 	const struct dcn30_afmt_mask *afmt_mask;
 };
 
+void afmt3_setup_hdmi_audio(
+	struct afmt *afmt);
+
+void afmt3_se_audio_setup(
+	struct afmt *afmt,
+	unsigned int az_inst,
+	struct audio_info *audio_info);
+
+void afmt3_audio_mute_control(
+	struct afmt *afmt,
+	bool mute);
+
+void afmt3_audio_info_immediate_update(
+	struct afmt *afmt);
+
+void afmt3_setup_dp_audio(
+		struct afmt *afmt);
+
 void afmt3_construct(struct dcn30_afmt *afmt3,
 	struct dc_context *ctx,
 	uint32_t inst,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
index 8487516819ef..b73dfd2661b9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
@@ -704,6 +704,8 @@ static void enc3_se_setup_dp_audio(
 static void enc3_se_dp_audio_enable(
 	struct stream_encoder *enc)
 {
+	if (enc->afmt->funcs->afmt_poweron)
+		enc->afmt->funcs->afmt_poweron(enc->afmt);
 	enc1_se_enable_audio_clock(enc, true);
 	enc3_se_setup_dp_audio(enc);
 	enc1_se_enable_dp_audio(enc);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
index 8cfd181b4d5f..9748aaa044f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
@@ -43,7 +43,7 @@
 	vpg3->base.ctx
 
 
-static void vpg3_update_generic_info_packet(
+void vpg3_update_generic_info_packet(
 	struct vpg *vpg,
 	uint32_t packet_index,
 	const struct dc_info_packet *info_packet)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h
index 6161e9e66355..96dccb2f1124 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h
@@ -139,6 +139,12 @@ struct vpg_funcs {
 		struct vpg *vpg,
 		uint32_t packet_index,
 		const struct dc_info_packet *info_packet);
+
+	void (*vpg_poweron)(
+		struct vpg *vpg);
+
+	void (*vpg_powerdown)(
+		struct vpg *vpg);
 };
 
 struct vpg {
@@ -154,6 +160,11 @@ struct dcn30_vpg {
 	const struct dcn30_vpg_mask *vpg_mask;
 };
 
+void vpg3_update_generic_info_packet(
+	struct vpg *vpg,
+	uint32_t packet_index,
+	const struct dc_info_packet *info_packet);
+
 void vpg3_construct(struct dcn30_vpg *vpg3,
 	struct dc_context *ctx,
 	uint32_t inst,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
index 5197825e7965..d20e3b8ccc30 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
@@ -12,7 +12,8 @@
 
 DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o \
 	dcn31_dccg.o dcn31_optc.o dcn31_dio_link_encoder.o dcn31_panel_cntl.o \
-	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o
+	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
+	dcn31_afmt.o dcn31_vpg.o
 
 ifdef CONFIG_X86
 CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -msse
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c
new file mode 100644
index 000000000000..d380a8ec2184
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c
@@ -0,0 +1,92 @@
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
+#include "hw_shared.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dcn31_afmt.h"
+#include "reg_helper.h"
+#include "dc/dc.h"
+
+#define DC_LOGGER \
+		afmt31->base.ctx->logger
+
+#define REG(reg)\
+	(afmt31->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	afmt31->afmt_shift->field_name, afmt31->afmt_mask->field_name
+
+
+#define CTX \
+	afmt31->base.ctx
+
+static struct afmt_funcs dcn31_afmt_funcs = {
+	.setup_hdmi_audio		= afmt3_setup_hdmi_audio,
+	.se_audio_setup			= afmt3_se_audio_setup,
+	.audio_mute_control		= afmt3_audio_mute_control,
+	.audio_info_immediate_update	= afmt3_audio_info_immediate_update,
+	.setup_dp_audio			= afmt3_setup_dp_audio,
+	.afmt_powerdown			= afmt31_powerdown,
+	.afmt_poweron			= afmt31_poweron
+};
+
+void afmt31_powerdown(struct afmt *afmt)
+{
+	struct dcn31_afmt *afmt31 = DCN31_AFMT_FROM_AFMT(afmt);
+
+	if (afmt->ctx->dc->debug.enable_mem_low_power.bits.afmt == false)
+		return;
+
+	REG_UPDATE_2(AFMT_MEM_PWR, AFMT_MEM_PWR_DIS, 0, AFMT_MEM_PWR_FORCE, 1);
+}
+
+void afmt31_poweron(struct afmt *afmt)
+{
+	struct dcn31_afmt *afmt31 = DCN31_AFMT_FROM_AFMT(afmt);
+
+	if (afmt->ctx->dc->debug.enable_mem_low_power.bits.afmt == false)
+		return;
+
+	REG_UPDATE_2(AFMT_MEM_PWR, AFMT_MEM_PWR_DIS, 1, AFMT_MEM_PWR_FORCE, 0);
+}
+
+void afmt31_construct(struct dcn31_afmt *afmt31,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn31_afmt_registers *afmt_regs,
+	const struct dcn31_afmt_shift *afmt_shift,
+	const struct dcn31_afmt_mask *afmt_mask)
+{
+	afmt31->base.ctx = ctx;
+
+	afmt31->base.inst = inst;
+	afmt31->base.funcs = &dcn31_afmt_funcs;
+
+	afmt31->regs = afmt_regs;
+	afmt31->afmt_shift = afmt_shift;
+	afmt31->afmt_mask = afmt_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h
new file mode 100644
index 000000000000..802cb05b6ab9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h
@@ -0,0 +1,126 @@
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
+#ifndef __DAL_DCN31_AFMT_H__
+#define __DAL_DCN31_AFMT_H__
+
+
+#define DCN31_AFMT_FROM_AFMT(afmt)\
+	container_of(afmt, struct dcn31_afmt, base)
+
+#define AFMT_DCN31_REG_LIST(id) \
+	SRI(AFMT_INFOFRAME_CONTROL0, AFMT, id), \
+	SRI(AFMT_VBI_PACKET_CONTROL, AFMT, id), \
+	SRI(AFMT_AUDIO_PACKET_CONTROL, AFMT, id), \
+	SRI(AFMT_AUDIO_PACKET_CONTROL2, AFMT, id), \
+	SRI(AFMT_AUDIO_SRC_CONTROL, AFMT, id), \
+	SRI(AFMT_60958_0, AFMT, id), \
+	SRI(AFMT_60958_1, AFMT, id), \
+	SRI(AFMT_60958_2, AFMT, id), \
+	SRI(AFMT_MEM_PWR, AFMT, id)
+
+struct dcn31_afmt_registers {
+	uint32_t AFMT_INFOFRAME_CONTROL0;
+	uint32_t AFMT_VBI_PACKET_CONTROL;
+	uint32_t AFMT_AUDIO_PACKET_CONTROL;
+	uint32_t AFMT_AUDIO_PACKET_CONTROL2;
+	uint32_t AFMT_AUDIO_SRC_CONTROL;
+	uint32_t AFMT_60958_0;
+	uint32_t AFMT_60958_1;
+	uint32_t AFMT_60958_2;
+	uint32_t AFMT_MEM_PWR;
+};
+
+#define DCN31_AFMT_MASK_SH_LIST(mask_sh)\
+	SE_SF(AFMT0_AFMT_INFOFRAME_CONTROL0, AFMT_AUDIO_INFO_UPDATE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_SRC_CONTROL, AFMT_AUDIO_SRC_SELECT, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_CHANNEL_ENABLE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_LAYOUT_OVRD, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_60958_OSF_OVRD, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_0, AFMT_60958_CS_CHANNEL_NUMBER_L, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_0, AFMT_60958_CS_CLOCK_ACCURACY, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_1, AFMT_60958_CS_CHANNEL_NUMBER_R, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_2, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_3, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_4, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_5, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_6, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_7, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL, AFMT_AUDIO_SAMPLE_SEND, mask_sh),\
+	SE_SF(AFMT0_AFMT_MEM_PWR, AFMT_MEM_PWR_FORCE, mask_sh),\
+	SE_SF(AFMT0_AFMT_MEM_PWR, AFMT_MEM_PWR_DIS, mask_sh),\
+	SE_SF(AFMT0_AFMT_MEM_PWR, AFMT_MEM_PWR_STATE, mask_sh)
+
+#define AFMT_DCN31_REG_FIELD_LIST(type) \
+		type AFMT_AUDIO_INFO_UPDATE;\
+		type AFMT_AUDIO_SRC_SELECT;\
+		type AFMT_AUDIO_CHANNEL_ENABLE;\
+		type AFMT_60958_CS_UPDATE;\
+		type AFMT_AUDIO_LAYOUT_OVRD;\
+		type AFMT_60958_OSF_OVRD;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_L;\
+		type AFMT_60958_CS_CLOCK_ACCURACY;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_R;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_2;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_3;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_4;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_5;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_6;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_7;\
+		type AFMT_AUDIO_SAMPLE_SEND;\
+		type AFMT_MEM_PWR_FORCE;\
+		type AFMT_MEM_PWR_DIS;\
+		type AFMT_MEM_PWR_STATE
+
+struct dcn31_afmt_shift {
+	AFMT_DCN31_REG_FIELD_LIST(uint8_t);
+};
+
+struct dcn31_afmt_mask {
+	AFMT_DCN31_REG_FIELD_LIST(uint32_t);
+};
+
+struct dcn31_afmt {
+	struct afmt base;
+	const struct dcn31_afmt_registers *regs;
+	const struct dcn31_afmt_shift *afmt_shift;
+	const struct dcn31_afmt_mask *afmt_mask;
+};
+
+void afmt31_poweron(
+		struct afmt *afmt);
+
+void afmt31_powerdown(
+		struct afmt *afmt);
+
+void afmt31_construct(struct dcn31_afmt *afmt31,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn31_afmt_registers *afmt_regs,
+	const struct dcn31_afmt_shift *afmt_shift,
+	const struct dcn31_afmt_mask *afmt_mask);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index e0b93665bf55..cf6392eadaf2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -56,6 +56,8 @@
 #include "dcn31/dcn31_hpo_dp_link_encoder.h"
 #include "dcn31/dcn31_apg.h"
 #include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn31/dcn31_vpg.h"
+#include "dcn31/dcn31_afmt.h"
 #include "dce/dce_clock_source.h"
 #include "dce/dce_audio.h"
 #include "dce/dce_hwseq.h"
@@ -414,10 +416,10 @@ static const struct dce_audio_mask audio_mask = {
 
 #define vpg_regs(id)\
 [id] = {\
-	VPG_DCN3_REG_LIST(id)\
+	VPG_DCN31_REG_LIST(id)\
 }
 
-static const struct dcn30_vpg_registers vpg_regs[] = {
+static const struct dcn31_vpg_registers vpg_regs[] = {
 	vpg_regs(0),
 	vpg_regs(1),
 	vpg_regs(2),
@@ -430,20 +432,20 @@ static const struct dcn30_vpg_registers vpg_regs[] = {
 	vpg_regs(9),
 };
 
-static const struct dcn30_vpg_shift vpg_shift = {
-	DCN3_VPG_MASK_SH_LIST(__SHIFT)
+static const struct dcn31_vpg_shift vpg_shift = {
+	DCN31_VPG_MASK_SH_LIST(__SHIFT)
 };
 
-static const struct dcn30_vpg_mask vpg_mask = {
-	DCN3_VPG_MASK_SH_LIST(_MASK)
+static const struct dcn31_vpg_mask vpg_mask = {
+	DCN31_VPG_MASK_SH_LIST(_MASK)
 };
 
 #define afmt_regs(id)\
 [id] = {\
-	AFMT_DCN3_REG_LIST(id)\
+	AFMT_DCN31_REG_LIST(id)\
 }
 
-static const struct dcn30_afmt_registers afmt_regs[] = {
+static const struct dcn31_afmt_registers afmt_regs[] = {
 	afmt_regs(0),
 	afmt_regs(1),
 	afmt_regs(2),
@@ -452,12 +454,12 @@ static const struct dcn30_afmt_registers afmt_regs[] = {
 	afmt_regs(5)
 };
 
-static const struct dcn30_afmt_shift afmt_shift = {
-	DCN3_AFMT_MASK_SH_LIST(__SHIFT)
+static const struct dcn31_afmt_shift afmt_shift = {
+	DCN31_AFMT_MASK_SH_LIST(__SHIFT)
 };
 
-static const struct dcn30_afmt_mask afmt_mask = {
-	DCN3_AFMT_MASK_SH_LIST(_MASK)
+static const struct dcn31_afmt_mask afmt_mask = {
+	DCN31_AFMT_MASK_SH_LIST(_MASK)
 };
 
 #define apg_regs(id)\
@@ -1014,6 +1016,8 @@ static const struct dc_debug_options debug_defaults_drv = {
 			.cm = false,
 			.mpc = false,
 			.optc = false,
+			.vpg = false,
+			.afmt = false,
 		}
 	},
 	.optimize_edp_link_rate = true,
@@ -1298,34 +1302,40 @@ static struct vpg *dcn31_vpg_create(
 	struct dc_context *ctx,
 	uint32_t inst)
 {
-	struct dcn30_vpg *vpg3 = kzalloc(sizeof(struct dcn30_vpg), GFP_KERNEL);
+	struct dcn31_vpg *vpg31 = kzalloc(sizeof(struct dcn31_vpg), GFP_KERNEL);
 
-	if (!vpg3)
+	if (!vpg31)
 		return NULL;
 
-	vpg3_construct(vpg3, ctx, inst,
+	vpg31_construct(vpg31, ctx, inst,
 			&vpg_regs[inst],
 			&vpg_shift,
 			&vpg_mask);
 
-	return &vpg3->base;
+	// Will re-enable hw block when we enable stream
+	// Check for enabled stream before powering down?
+	vpg31_powerdown(&vpg31->base);
+
+	return &vpg31->base;
 }
 
 static struct afmt *dcn31_afmt_create(
 	struct dc_context *ctx,
 	uint32_t inst)
 {
-	struct dcn30_afmt *afmt3 = kzalloc(sizeof(struct dcn30_afmt), GFP_KERNEL);
+	struct dcn31_afmt *afmt31 = kzalloc(sizeof(struct dcn31_afmt), GFP_KERNEL);
 
-	if (!afmt3)
+	if (!afmt31)
 		return NULL;
 
-	afmt3_construct(afmt3, ctx, inst,
+	afmt31_construct(afmt31, ctx, inst,
 			&afmt_regs[inst],
 			&afmt_shift,
 			&afmt_mask);
 
-	return &afmt3->base;
+	// Light sleep by default, no need to power down here
+
+	return &afmt31->base;
 }
 
 static struct apg *dcn31_apg_create(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c
new file mode 100644
index 000000000000..f1deb1c3c363
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c
@@ -0,0 +1,87 @@
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
+#include "dcn30/dcn30_vpg.h"
+#include "dcn31_vpg.h"
+#include "reg_helper.h"
+#include "dc/dc.h"
+
+#define DC_LOGGER \
+		vpg31->base.ctx->logger
+
+#define REG(reg)\
+	(vpg31->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	vpg31->vpg_shift->field_name, vpg31->vpg_mask->field_name
+
+
+#define CTX \
+	vpg31->base.ctx
+
+static struct vpg_funcs dcn31_vpg_funcs = {
+	.update_generic_info_packet	= vpg3_update_generic_info_packet,
+	.vpg_poweron = vpg31_poweron,
+	.vpg_powerdown = vpg31_powerdown,
+};
+
+void vpg31_powerdown(struct vpg *vpg)
+{
+	struct dcn31_vpg *vpg31 = DCN31_VPG_FROM_VPG(vpg);
+
+	if (vpg->ctx->dc->debug.enable_mem_low_power.bits.vpg == false)
+		return;
+
+	REG_UPDATE_2(VPG_MEM_PWR, VPG_GSP_MEM_LIGHT_SLEEP_DIS, 0, VPG_GSP_LIGHT_SLEEP_FORCE, 1);
+}
+
+void vpg31_poweron(struct vpg *vpg)
+{
+	struct dcn31_vpg *vpg31 = DCN31_VPG_FROM_VPG(vpg);
+
+	if (vpg->ctx->dc->debug.enable_mem_low_power.bits.vpg == false)
+		return;
+
+	REG_UPDATE_2(VPG_MEM_PWR, VPG_GSP_MEM_LIGHT_SLEEP_DIS, 1, VPG_GSP_LIGHT_SLEEP_FORCE, 0);
+}
+
+void vpg31_construct(struct dcn31_vpg *vpg31,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn31_vpg_registers *vpg_regs,
+	const struct dcn31_vpg_shift *vpg_shift,
+	const struct dcn31_vpg_mask *vpg_mask)
+{
+	vpg31->base.ctx = ctx;
+
+	vpg31->base.inst = inst;
+	vpg31->base.funcs = &dcn31_vpg_funcs;
+
+	vpg31->regs = vpg_regs;
+	vpg31->vpg_shift = vpg_shift;
+	vpg31->vpg_mask = vpg_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h
new file mode 100644
index 000000000000..0e76eabce441
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h
@@ -0,0 +1,162 @@
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
+#ifndef __DAL_DCN31_VPG_H__
+#define __DAL_DCN31_VPG_H__
+
+
+#define DCN31_VPG_FROM_VPG(vpg)\
+	container_of(vpg, struct dcn31_vpg, base)
+
+#define VPG_DCN31_REG_LIST(id) \
+	SRI(VPG_GENERIC_STATUS, VPG, id), \
+	SRI(VPG_GENERIC_PACKET_ACCESS_CTRL, VPG, id), \
+	SRI(VPG_GENERIC_PACKET_DATA, VPG, id), \
+	SRI(VPG_GSP_FRAME_UPDATE_CTRL, VPG, id), \
+	SRI(VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG, id), \
+	SRI(VPG_MEM_PWR, VPG, id)
+
+struct dcn31_vpg_registers {
+	uint32_t VPG_GENERIC_STATUS;
+	uint32_t VPG_GENERIC_PACKET_ACCESS_CTRL;
+	uint32_t VPG_GENERIC_PACKET_DATA;
+	uint32_t VPG_GSP_FRAME_UPDATE_CTRL;
+	uint32_t VPG_GSP_IMMEDIATE_UPDATE_CTRL;
+	uint32_t VPG_MEM_PWR;
+};
+
+#define DCN31_VPG_MASK_SH_LIST(mask_sh)\
+	SE_SF(VPG0_VPG_GENERIC_STATUS, VPG_GENERIC_CONFLICT_OCCURED, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_STATUS, VPG_GENERIC_CONFLICT_CLR, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_PACKET_ACCESS_CTRL, VPG_GENERIC_DATA_INDEX, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_PACKET_DATA, VPG_GENERIC_DATA_BYTE0, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_PACKET_DATA, VPG_GENERIC_DATA_BYTE1, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_PACKET_DATA, VPG_GENERIC_DATA_BYTE2, mask_sh),\
+	SE_SF(VPG0_VPG_GENERIC_PACKET_DATA, VPG_GENERIC_DATA_BYTE3, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC0_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC1_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC2_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC3_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC4_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC5_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC6_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC7_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC8_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC9_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC10_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC11_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC12_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC13_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_FRAME_UPDATE_CTRL, VPG_GENERIC14_FRAME_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC0_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC1_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC2_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC3_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC4_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC5_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC6_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC7_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC8_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC9_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC10_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC11_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC12_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC13_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_GSP_IMMEDIATE_UPDATE_CTRL, VPG_GENERIC14_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(VPG0_VPG_MEM_PWR, VPG_GSP_MEM_LIGHT_SLEEP_DIS, mask_sh),\
+	SE_SF(VPG0_VPG_MEM_PWR, VPG_GSP_LIGHT_SLEEP_FORCE, mask_sh),\
+	SE_SF(VPG0_VPG_MEM_PWR, VPG_GSP_MEM_PWR_STATE, mask_sh)
+
+#define VPG_DCN31_REG_FIELD_LIST(type) \
+	type VPG_GENERIC_CONFLICT_OCCURED;\
+	type VPG_GENERIC_CONFLICT_CLR;\
+	type VPG_GENERIC_DATA_INDEX;\
+	type VPG_GENERIC_DATA_BYTE0;\
+	type VPG_GENERIC_DATA_BYTE1;\
+	type VPG_GENERIC_DATA_BYTE2;\
+	type VPG_GENERIC_DATA_BYTE3;\
+	type VPG_GENERIC0_FRAME_UPDATE;\
+	type VPG_GENERIC1_FRAME_UPDATE;\
+	type VPG_GENERIC2_FRAME_UPDATE;\
+	type VPG_GENERIC3_FRAME_UPDATE;\
+	type VPG_GENERIC4_FRAME_UPDATE;\
+	type VPG_GENERIC5_FRAME_UPDATE;\
+	type VPG_GENERIC6_FRAME_UPDATE;\
+	type VPG_GENERIC7_FRAME_UPDATE;\
+	type VPG_GENERIC8_FRAME_UPDATE;\
+	type VPG_GENERIC9_FRAME_UPDATE;\
+	type VPG_GENERIC10_FRAME_UPDATE;\
+	type VPG_GENERIC11_FRAME_UPDATE;\
+	type VPG_GENERIC12_FRAME_UPDATE;\
+	type VPG_GENERIC13_FRAME_UPDATE;\
+	type VPG_GENERIC14_FRAME_UPDATE;\
+	type VPG_GENERIC0_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC1_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC2_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC3_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC4_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC5_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC6_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC7_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC8_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC9_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC10_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC11_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC12_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC13_IMMEDIATE_UPDATE;\
+	type VPG_GENERIC14_IMMEDIATE_UPDATE;\
+	type VPG_GSP_MEM_LIGHT_SLEEP_DIS;\
+	type VPG_GSP_LIGHT_SLEEP_FORCE;\
+	type VPG_GSP_MEM_PWR_STATE
+
+struct dcn31_vpg_shift {
+	VPG_DCN31_REG_FIELD_LIST(uint8_t);
+};
+
+struct dcn31_vpg_mask {
+	VPG_DCN31_REG_FIELD_LIST(uint32_t);
+};
+
+struct dcn31_vpg {
+	struct vpg base;
+	const struct dcn31_vpg_registers *regs;
+	const struct dcn31_vpg_shift *vpg_shift;
+	const struct dcn31_vpg_mask *vpg_mask;
+};
+
+void vpg31_poweron(
+		struct vpg *vpg);
+
+void vpg31_powerdown(
+		struct vpg *vpg);
+
+void vpg31_construct(struct dcn31_vpg *vpg31,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn31_vpg_registers *vpg_regs,
+	const struct dcn31_vpg_shift *vpg_shift,
+	const struct dcn31_vpg_mask *vpg_mask);
+
+#endif
-- 
2.25.1

