Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092C6B3A88
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Mar 2023 10:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1210E9A6;
	Fri, 10 Mar 2023 09:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232A10E9A9
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Mar 2023 09:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+WVOMN8kNXwXggBFcd3DJj5LfP/HxJ873yRrBLIlAbU5/UXlLgXIDvt+VO01SmJzMLTPP/VakICwkOi2DSz/AAnE/gyPYUYzWMVmNNl4X2QtO0GzGuuRFCXGSi36MjJBEnGFh8J/WS2fcJf4kipl/OQWhV5Ez4f1g9Wia0WQdIGHLKJev+mTlArJRVqKSa4djhxTOiwfryx6U2uIEeAirdb+SpboRlC4WHUfihbCr7ERTvIEtoTBSD0E5YTDfBRmzfwTNqe58IErld7ZeX/Wt7lBnSNJgnSe4RC/2m2simlCfmgZnRiI6126aH4RGbO1eFNVhOA0DzMRTxlIF6Lbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQZ8IV9b9nJyhnKDuK8eX6KIObDD7RHzcuvqW5YLvYs=;
 b=I844vMQAqKPKmlHBlq7od3HtHgZMzeZlS7S4IrSUP2kNbBpO8dunO4zWk/cPnygU2oCedy2+kQ8GNc10eyyemZGgEEYi8tlrnSAH+cItYvhIoa3Mds59sM+1c0K00VVOBfktEMP+K64opJEn62Ype0NovC3lXbKeE2dRRJ3lZdUlfgbPecw6rVgQulszB0GBuXu2s0AbHhqbHk6v8ax2E65iS0oriqi5+GVUVtwv8tsl3J1RL3IAvcB+FDvbMTMQjTSpmUc0p+vqW3sP8DOKzIjsGXoDSTPpF9oIkkMLmPOawACcVpBECLJKCAMk7yZ3C72O6TIiaONmadv14KacBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQZ8IV9b9nJyhnKDuK8eX6KIObDD7RHzcuvqW5YLvYs=;
 b=FV3h5Snf43s2JxZUq1kTu/jYpwyvkQPsiOg0kzf2+l6IiSpB0uJjVITrm+IK9x/BOjs4FXQuNIhc3o3wW3VrXaKq0PvShCButqfeJ5/Qffgx0ro1ghrFe/MLx7qo625YUelPPpLZMVrDoU8r5odoNZamyWaiWU1XR9Hzgbl/OV8=
Received: from CY5PR19CA0117.namprd19.prod.outlook.com (2603:10b6:930:64::18)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:32:20 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:64:cafe::e2) by CY5PR19CA0117.outlook.office365.com
 (2603:10b6:930:64::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 09:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Fri, 10 Mar 2023 09:32:20 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 03:32:13 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/19] drm/amd/display: convert link.h functions to function
 pointer style
Date: Fri, 10 Mar 2023 04:31:04 -0500
Message-ID: <20230310093117.3030-7-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310093117.3030-1-qingqing.zhuo@amd.com>
References: <20230310093117.3030-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca17362-cd8f-4cb6-4b1d-08db214a58d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MyzSzdHtRuueuHIwg5vp/x1ltZnQC3AIGvNaH0/7CVYhQ8+UFSwKzjkvT5RxE+oSrExPtmyFBO/XSFeQ1lIPVEABOlr6EnlD7CSoJ74Q4gs+I8nWFMT/xkakyD57xDiXY0Azy8c/wb39jKkuNwGFrtR6IGsZZvthUpyJLkcrwYAt2239MXD3saX3mCjJVK1BhXhsF/EHkgKSJxUZmuYBEBhMJ1CRhHhowS97GBBg8KCYI6nP/1mgGERuqjJbkuAajz76jGcO+76GAx2ex9EdqUIidMgIPGf4SCxuoPJEnzI4RX1OmGFtXHo00sguTufF55PJGtTTBf0mWBGvg2JtntvNPKJAuCxM+KWzZuxwiy/usn+YH0FZb+Ab7PCIz+vKLNQXaZFNjbXF56CnXB7z4Qy5Cb2QkBGfY5xQaWtKA8IXZJFIJg/MEyjgLMGmX07nqtajgJLtC4S6GlYUdulWR3vB5jQrKci+63LMwnUgLrADH3Uf5vNXxIz9ikSjIMDumJ8pkL+AE/3n3dMSo7Wb8CPheqX4sVbUCo4olBtaJpBdwnYH+R6Qaf4zp++0Z++9k0sHH7JByplmfdN8PgotecNPLc2MsElnofZBaermd+5tr/cN2KCna/o4bw9GZar4Gbn+uBW9M3cetK6P5KR+EwaIPlv7YzE76kF5tBj//3fg68YqVGICldBxEC8Cv3uxQq+1wteevcnAl8p0DETlkpUR16AzA9uN8dp25lCQ0npvOVPOGgFPgixw9ysLNZqA
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(66899018)(82310400005)(36756003)(82740400003)(36860700001)(6666004)(47076005)(83380400001)(426003)(478600001)(40480700001)(54906003)(81166007)(356005)(316002)(336012)(2616005)(40460700003)(26005)(186003)(16526019)(1076003)(2906002)(70586007)(5660300002)(30864003)(44832011)(70206006)(8676002)(8936002)(6916009)(41300700001)(4326008)(86362001)(21314003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:32:20.3698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca17362-cd8f-4cb6-4b1d-08db214a58d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[Why & How]
All dc subcomponents should call another dc component via function pointers
stored in a component structure. This is part of dc coding convention since
the beginning. The reason behind this is to improve encapsulation and
polymorphism. The function contract is extracted into a single link service
structure defined in link.h header file and implemented only in link_factory.c instead
of spreading across multiple files in link component file structure.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  33 +-
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c |   2 +-
 .../drm/amd/display/dc/core/dc_link_exports.c |  34 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  13 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |  13 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |  60 ++--
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   6 +-
 .../display/dc/dcn10/dcn10_stream_encoder.c   |   7 +-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  14 +-
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |   9 +-
 .../display/dc/dcn20/dcn20_stream_encoder.c   |   3 +-
 .../drm/amd/display/dc/dcn21/dcn21_hwseq.c    |   4 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   2 +-
 .../drm/amd/display/dc/dcn30/dcn30_resource.c |   9 +-
 .../amd/display/dc/dcn302/dcn302_resource.c   |   9 +-
 .../amd/display/dc/dcn303/dcn303_resource.c   |   9 +-
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |  10 +-
 .../dc/dcn314/dcn314_dio_stream_encoder.c     |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  |   2 +-
 .../dc/dcn32/dcn32_dio_stream_encoder.c       |   2 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |  13 +-
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |   9 +-
 .../amd/display/dc/dcn321/dcn321_resource.c   |   9 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |   4 +-
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  53 +++
 drivers/gpu/drm/amd/display/dc/inc/link.h     | 314 ++++++++++--------
 .../display/dc/link/accessories/link_dp_cts.c |   1 +
 .../dc/link/accessories/link_dp_trace.c       |   8 +-
 .../dc/link/accessories/link_dp_trace.h       |   5 +
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |  22 +-
 .../display/dc/link/hwss/link_hwss_hpo_dp.c   |   8 +-
 .../drm/amd/display/dc/link/link_detection.c  |   2 +-
 .../drm/amd/display/dc/link/link_detection.h  |   9 +-
 .../gpu/drm/amd/display/dc/link/link_dpms.c   |  43 +--
 .../gpu/drm/amd/display/dc/link/link_dpms.h   |  23 +-
 .../drm/amd/display/dc/link/link_factory.c    | 313 +++++++++++++----
 .../drm/amd/display/dc/link/link_factory.h    |   2 +
 .../drm/amd/display/dc/link/link_resource.h   |   4 +
 .../drm/amd/display/dc/link/link_validation.c |   5 +-
 .../drm/amd/display/dc/link/link_validation.h |   7 +
 .../amd/display/dc/link/protocols/link_ddc.h  |  28 ++
 .../dc/link/protocols/link_dp_capability.c    |  10 +-
 .../dc/link/protocols/link_dp_capability.h    |   9 +
 .../display/dc/link/protocols/link_dp_phy.h   |   5 +
 .../dc/link/protocols/link_dp_training.c      |   6 +-
 .../link/protocols/link_edp_panel_control.c   |  20 +-
 .../link/protocols/link_edp_panel_control.h   |  10 +
 .../amd/display/dc/link/protocols/link_hpd.h  |   3 +
 51 files changed, 805 insertions(+), 392 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 51afc937308a..7b5c32f52cc7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7190,13 +7190,14 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	struct edid *edid = amdgpu_dm_connector->edid;
 	struct dc_link_settings *verified_link_cap =
 			&amdgpu_dm_connector->dc_link->verified_link_cap;
+	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 
 	if (!drm_edid_is_valid(edid)) {
 		amdgpu_dm_connector->num_modes =
 				drm_add_modes_noedid(connector, 640, 480);
-		if (link_dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
+		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
 			amdgpu_dm_connector->num_modes +=
 				drm_add_modes_noedid(connector, 1920, 1080);
 	} else {
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index ee81d36146e4..6127d6045336 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -116,7 +116,7 @@ void clk_mgr_exit_optimized_pwr_state(const struct dc *dc, struct clk_mgr *clk_m
 			if (!edp_link->psr_settings.psr_feature_enabled)
 				continue;
 			clk_mgr->psr_allow_active_cache = edp_link->psr_settings.psr_allow_active;
-			dc_link_set_psr_allow_active(edp_link, &allow_active, false, false, NULL);
+			dc->link_srv->edp_set_psr_allow_active(edp_link, &allow_active, false, false, NULL);
 		}
 	}
 
@@ -135,7 +135,7 @@ void clk_mgr_optimize_pwr_state(const struct dc *dc, struct clk_mgr *clk_mgr)
 			edp_link = edp_links[panel_inst];
 			if (!edp_link->psr_settings.psr_feature_enabled)
 				continue;
-			dc_link_set_psr_allow_active(edp_link,
+			dc->link_srv->edp_set_psr_allow_active(edp_link,
 					&clk_mgr->psr_allow_active_cache, false, false, NULL);
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index a5f2f880610d..ae5f1b7b4fef 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -148,7 +148,7 @@ static void destroy_links(struct dc *dc)
 
 	for (i = 0; i < dc->link_count; i++) {
 		if (NULL != dc->links[i])
-			link_destroy(&dc->links[i]);
+			dc->link_srv->destroy_link(&dc->links[i]);
 	}
 }
 
@@ -217,7 +217,7 @@ static bool create_links(
 		link_init_params.connector_index = i;
 		link_init_params.link_index = dc->link_count;
 		link_init_params.dc = dc;
-		link = link_create(&link_init_params);
+		link = dc->link_srv->create_link(&link_init_params);
 
 		if (link) {
 			dc->links[dc->link_count] = link;
@@ -239,7 +239,7 @@ static bool create_links(
 		link_init_params.dc = dc;
 		link_init_params.is_dpia_link = true;
 
-		link = link_create(&link_init_params);
+		link = dc->link_srv->create_link(&link_init_params);
 		if (link) {
 			dc->links[dc->link_count] = link;
 			link->dc = dc;
@@ -823,6 +823,9 @@ static void dc_destruct(struct dc *dc)
 
 	dc_destroy_resource_pool(dc);
 
+	if (dc->link_srv)
+		link_destroy_link_service(&dc->link_srv);
+
 	if (dc->ctx->gpio_service)
 		dal_gpio_service_destroy(&dc->ctx->gpio_service);
 
@@ -982,7 +985,7 @@ static bool dc_construct(struct dc *dc,
 		goto fail;
 	}
 
-	dc->link_srv = link_get_link_service();
+	dc->link_srv = link_create_link_service();
 
 	dc->res_pool = dc_create_resource_pool(dc, init_params, dc_ctx->dce_version);
 	if (!dc->res_pool)
@@ -1263,7 +1266,7 @@ static void disable_vbios_mode_if_required(
 						pipe->stream_res.pix_clk_params.requested_pix_clk_100hz;
 
 					if (pix_clk_100hz != requested_pix_clk_100hz) {
-						link_set_dpms_off(pipe);
+						dc->link_srv->set_dpms_off(pipe);
 						pipe->stream->dpms_off = false;
 					}
 				}
@@ -1718,7 +1721,7 @@ bool dc_validate_boot_timing(const struct dc *dc,
 		return false;
 	}
 
-	if (link_is_edp_ilr_optimization_required(link, crtc_timing)) {
+	if (dc->link_srv->edp_is_ilr_optimization_required(link, crtc_timing)) {
 		DC_LOG_EVENT_LINK_TRAINING("Seamless boot disabled to optimize eDP link rate\n");
 		return false;
 	}
@@ -3192,7 +3195,9 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				dc->hwss.update_info_frame(pipe_ctx);
 
 				if (dc_is_dp_signal(pipe_ctx->stream->signal))
-					link_dp_source_sequence_trace(pipe_ctx->stream->link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+					dc->link_srv->dp_trace_source_sequence(
+							pipe_ctx->stream->link,
+							DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
 			}
 
 			if (stream_update->hdr_static_metadata &&
@@ -3228,13 +3233,15 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				continue;
 
 			if (stream_update->dsc_config)
-				link_update_dsc_config(pipe_ctx);
+				dc->link_srv->update_dsc_config(pipe_ctx);
 
 			if (stream_update->mst_bw_update) {
 				if (stream_update->mst_bw_update->is_increase)
-					link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+					dc->link_srv->increase_mst_payload(pipe_ctx,
+							stream_update->mst_bw_update->mst_stream_bw);
  				else
-					link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+					dc->link_srv->reduce_mst_payload(pipe_ctx,
+							stream_update->mst_bw_update->mst_stream_bw);
  			}
 
 			if (stream_update->pending_test_pattern) {
@@ -3248,7 +3255,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 
 			if (stream_update->dpms_off) {
 				if (*stream_update->dpms_off) {
-					link_set_dpms_off(pipe_ctx);
+					dc->link_srv->set_dpms_off(pipe_ctx);
 					/* for dpms, keep acquired resources*/
 					if (pipe_ctx->stream_res.audio && !dc->debug.az_endpoint_mute_only)
 						pipe_ctx->stream_res.audio->funcs->az_disable(pipe_ctx->stream_res.audio);
@@ -3258,7 +3265,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				} else {
 					if (get_seamless_boot_stream_count(context) == 0)
 						dc->hwss.prepare_bandwidth(dc, dc->current_state);
-					link_set_dpms_on(dc->current_state, pipe_ctx);
+					dc->link_srv->set_dpms_on(dc->current_state, pipe_ctx);
 				}
 			}
 
@@ -4322,7 +4329,7 @@ void dc_resume(struct dc *dc)
 	uint32_t i;
 
 	for (i = 0; i < dc->link_count; i++)
-		link_resume(dc->links[i]);
+		dc->link_srv->resume(dc->links[i]);
 }
 
 bool dc_is_dmcu_initialized(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 74e465ba158d..41198c729d90 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -48,7 +48,7 @@ static bool is_dig_link_enc_stream(struct dc_stream_state *stream)
 					/* DIGs do not support DP2.0 streams with 128b/132b encoding. */
 					struct dc_link_settings link_settings = {0};
 
-					link_decide_link_settings(stream, &link_settings);
+					stream->ctx->dc->link_srv->dp_decide_link_settings(stream, &link_settings);
 					if ((link_settings.link_rate >= LINK_RATE_LOW) &&
 							link_settings.link_rate <= LINK_RATE_HIGH3) {
 						is_dig_stream = true;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index 217c80db190d..58fa911b1417 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -80,67 +80,63 @@ bool dc_get_edp_link_panel_inst(const struct dc *dc,
 
 bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
 {
-	return link_detect(link, reason);
+	return link->dc->link_srv->detect_link(link, reason);
 }
 
 bool dc_link_detect_connection_type(struct dc_link *link,
 		enum dc_connection_type *type)
 {
-	return link_detect_connection_type(link, type);
+	return link->dc->link_srv->detect_connection_type(link, type);
 }
 
 const struct dc_link_status *dc_link_get_status(const struct dc_link *link)
 {
-	return link_get_status(link);
+	return link->dc->link_srv->get_status(link);
 }
 
 /* return true if the connected receiver supports the hdcp version */
 bool dc_link_is_hdcp14(struct dc_link *link, enum signal_type signal)
 {
-	return link_is_hdcp14(link, signal);
+	return link->dc->link_srv->is_hdcp1x_supported(link, signal);
 }
 
 bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal)
 {
-	return link_is_hdcp22(link, signal);
+	return link->dc->link_srv->is_hdcp2x_supported(link, signal);
 }
 
 void dc_link_clear_dprx_states(struct dc_link *link)
 {
-	link_clear_dprx_states(link);
+	link->dc->link_srv->clear_dprx_states(link);
 }
 
 bool dc_link_reset_cur_dp_mst_topology(struct dc_link *link)
 {
-	return link_reset_cur_dp_mst_topology(link);
+	return link->dc->link_srv->reset_cur_dp_mst_topology(link);
 }
 
 uint32_t dc_link_bandwidth_kbps(
 	const struct dc_link *link,
 	const struct dc_link_settings *link_settings)
 {
-	return dp_link_bandwidth_kbps(link, link_settings);
-}
-
-uint32_t dc_bandwidth_in_kbps_from_timing(
-	const struct dc_crtc_timing *timing)
-{
-	return link_timing_bandwidth_kbps(timing);
+	return link->dc->link_srv->dp_link_bandwidth_kbps(link, link_settings);
 }
 
 void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
 {
-	link_get_cur_res_map(dc, map);
+	dc->link_srv->get_cur_res_map(dc, map);
 }
 
 void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
 {
-	link_restore_res_map(dc, map);
+	dc->link_srv->restore_res_map(dc, map);
 }
 
 bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx)
 {
-	return link_update_dsc_config(pipe_ctx);
+	struct dc_link *link = pipe_ctx->stream->link;
+
+	return link->dc->link_srv->update_dsc_config(pipe_ctx);
 }
 
 bool dc_is_oem_i2c_device_present(
@@ -210,8 +206,8 @@ void dc_link_set_drive_settings(struct dc *dc,
 {
 	struct link_resource link_res;
 
-	link_get_cur_link_res(link, &link_res);
-	dp_set_drive_settings(link, &link_res, lt_settings);
+	dc->link_srv->get_cur_link_res(link, &link_res);
+	dc->link_srv->dp_set_drive_settings(link, &link_res, lt_settings);
 }
 
 void dc_link_set_preferred_link_settings(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 2e3b2fd23b56..85d54bfb595c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2213,7 +2213,7 @@ enum dc_status dc_remove_stream_from_ctx(
 			del_pipe->stream_res.stream_enc,
 			false);
 
-	if (link_is_dp_128b_132b_signal(del_pipe)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(del_pipe)) {
 		update_hpo_dp_stream_engine_usage(
 			&new_ctx->res_ctx, dc->res_pool,
 			del_pipe->stream_res.hpo_dp_stream_enc,
@@ -2513,9 +2513,10 @@ enum dc_status resource_map_pool_resources(
 	 * and link settings
 	 */
 	if (dc_is_dp_signal(stream->signal)) {
-		if (!link_decide_link_settings(stream, &pipe_ctx->link_config.dp_link_settings))
+		if (!dc->link_srv->dp_decide_link_settings(stream, &pipe_ctx->link_config.dp_link_settings))
 			return DC_FAIL_DP_LINK_BANDWIDTH;
-		if (link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
+		if (dc->link_srv->dp_get_encoding_format(
+				&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
 			pipe_ctx->stream_res.hpo_dp_stream_enc =
 					find_first_free_match_hpo_dp_stream_enc_for_link(
 							&context->res_ctx, pool, stream);
@@ -3685,7 +3686,7 @@ enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
 	/* TODO: validate audio ASIC caps, encoder */
 
 	if (res == DC_OK)
-		res = link_validate_mode_timing(stream,
+		res = dc->link_srv->validate_mode_timing(stream,
 		      link,
 		      &stream->timing);
 
@@ -3812,7 +3813,7 @@ bool get_temp_dp_link_res(struct dc_link *link,
 
 	memset(link_res, 0, sizeof(*link_res));
 
-	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+	if (dc->link_srv->dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		link_res->hpo_dp_link_enc = get_temp_hpo_dp_link_enc(res_ctx,
 				dc->res_pool, link);
 		if (!link_res->hpo_dp_link_enc)
@@ -4046,7 +4047,7 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 		struct dc_state *context,
 		struct pipe_ctx *pipe_ctx)
 {
-	if (link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
+	if (dc->link_srv->dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings) == DP_128b_132b_ENCODING) {
 		if (pipe_ctx->stream_res.hpo_dp_stream_enc == NULL) {
 			pipe_ctx->stream_res.hpo_dp_stream_enc =
 					find_first_free_match_hpo_dp_stream_enc_for_link(
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ccc27d482640..3f25a1620f4f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -889,7 +889,7 @@ struct dc {
 
 	uint8_t link_count;
 	struct dc_link *links[MAX_PIPES * 2];
-	const struct link_service *link_srv;
+	struct link_service *link_srv;
 
 	struct dc_state *current_state;
 	struct resource_pool *res_pool;
@@ -1370,6 +1370,11 @@ struct dc_plane_state *dc_get_surface_for_mpcc(struct dc *dc,
 
 uint32_t dc_get_opp_for_plane(struct dc *dc, struct dc_plane_state *plane);
 
+/* The function returns minimum bandwidth required to drive a given timing
+ * return - minimum required timing bandwidth in kbps.
+ */
+uint32_t dc_bandwidth_in_kbps_from_timing(const struct dc_crtc_timing *timing);
+
 /* Link Interfaces */
 /*
  * A link contains one or more sinks and their connected status.
@@ -1724,12 +1729,6 @@ uint32_t dc_link_bandwidth_kbps(
 	const struct dc_link *link,
 	const struct dc_link_settings *link_setting);
 
-/* The function returns minimum bandwidth required to drive a given timing
- * return - minimum required timing bandwidth in kbps.
- */
-uint32_t dc_bandwidth_in_kbps_from_timing(
-	const struct dc_crtc_timing *timing);
-
 /* The function takes a snapshot of current link resource allocation state
  * @dc: pointer to dc of the dm calling this
  * @map: a dc link resource snapshot defined internally to dc.
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index cb3bb5402c52..9fe0ce91db00 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -741,7 +741,7 @@ void dce110_edp_wait_for_hpd_ready(
 
 	/* obtain HPD */
 	/* TODO what to do with this? */
-	hpd = link_get_hpd_gpio(ctx->dc_bios, connector, ctx->gpio_service);
+	hpd = ctx->dc->link_srv->get_hpd_gpio(ctx->dc_bios, connector, ctx->gpio_service);
 
 	if (!hpd) {
 		BREAK_TO_DEBUGGER();
@@ -809,19 +809,19 @@ void dce110_edp_power_control(
 				div64_u64(dm_get_elapse_time_in_ns(
 						ctx,
 						current_ts,
-						link_dp_trace_get_edp_poweroff_timestamp(link)), 1000000);
+						ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link)), 1000000);
 		unsigned long long time_since_edp_poweron_ms =
 				div64_u64(dm_get_elapse_time_in_ns(
 						ctx,
 						current_ts,
-						link_dp_trace_get_edp_poweron_timestamp(link)), 1000000);
+						ctx->dc->link_srv->dp_trace_get_edp_poweron_timestamp(link)), 1000000);
 		DC_LOG_HW_RESUME_S3(
 				"%s: transition: power_up=%d current_ts=%llu edp_poweroff=%llu edp_poweron=%llu time_since_edp_poweroff_ms=%llu time_since_edp_poweron_ms=%llu",
 				__func__,
 				power_up,
 				current_ts,
-				link_dp_trace_get_edp_poweroff_timestamp(link),
-				link_dp_trace_get_edp_poweron_timestamp(link),
+				ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link),
+				ctx->dc->link_srv->dp_trace_get_edp_poweron_timestamp(link),
 				time_since_edp_poweroff_ms,
 				time_since_edp_poweron_ms);
 
@@ -836,7 +836,7 @@ void dce110_edp_power_control(
 					link->panel_config.pps.extra_t12_ms;
 
 			/* Adjust remaining_min_edp_poweroff_time_ms if this is not the first time. */
-			if (link_dp_trace_get_edp_poweroff_timestamp(link) != 0) {
+			if (ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link) != 0) {
 				if (time_since_edp_poweroff_ms < remaining_min_edp_poweroff_time_ms)
 					remaining_min_edp_poweroff_time_ms =
 						remaining_min_edp_poweroff_time_ms - time_since_edp_poweroff_ms;
@@ -896,13 +896,13 @@ void dce110_edp_power_control(
 				__func__, (power_up ? "On":"Off"),
 				bp_result);
 
-		link_dp_trace_set_edp_power_timestamp(link, power_up);
+		ctx->dc->link_srv->dp_trace_set_edp_power_timestamp(link, power_up);
 
 		DC_LOG_HW_RESUME_S3(
 				"%s: updated values: edp_poweroff=%llu edp_poweron=%llu\n",
 				__func__,
-				link_dp_trace_get_edp_poweroff_timestamp(link),
-				link_dp_trace_get_edp_poweron_timestamp(link));
+				ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link),
+				ctx->dc->link_srv->dp_trace_get_edp_poweron_timestamp(link));
 
 		if (bp_result != BP_RESULT_OK)
 			DC_LOG_ERROR(
@@ -930,14 +930,14 @@ void dce110_edp_wait_for_T12(
 		return;
 
 	if (!link->panel_cntl->funcs->is_panel_powered_on(link->panel_cntl) &&
-			link_dp_trace_get_edp_poweroff_timestamp(link) != 0) {
+			ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link) != 0) {
 		unsigned int t12_duration = 500; // Default T12 as per spec
 		unsigned long long current_ts = dm_get_timestamp(ctx);
 		unsigned long long time_since_edp_poweroff_ms =
 				div64_u64(dm_get_elapse_time_in_ns(
 						ctx,
 						current_ts,
-						link_dp_trace_get_edp_poweroff_timestamp(link)), 1000000);
+						ctx->dc->link_srv->dp_trace_get_edp_poweroff_timestamp(link)), 1000000);
 
 		t12_duration += link->panel_config.pps.extra_t12_ms; // Add extra T12
 
@@ -1018,7 +1018,7 @@ void dce110_edp_backlight_control(
 		 * we shouldn't be doing power-sequencing, hence we can skip
 		 * waiting for T7-ready.
 		 */
-			link_edp_receiver_ready_T7(link);
+			ctx->dc->link_srv->edp_receiver_ready_T7(link);
 		else
 			DC_LOG_DC("edp_receiver_ready_T7 skipped\n");
 	}
@@ -1049,7 +1049,7 @@ void dce110_edp_backlight_control(
 	if (link->dpcd_sink_ext_caps.bits.oled ||
 		link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1 ||
 		link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1)
-		link_backlight_enable_aux(link, enable);
+		ctx->dc->link_srv->edp_backlight_enable_aux(link, enable);
 
 	/*edp 1.2*/
 	if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_OFF) {
@@ -1061,7 +1061,7 @@ void dce110_edp_backlight_control(
 		 * we shouldn't be doing power-sequencing, hence we can skip
 		 * waiting for T9-ready.
 		 */
-			link_edp_add_delay_for_T9(link);
+			ctx->dc->link_srv->edp_add_delay_for_T9(link);
 		else
 			DC_LOG_DC("edp_receiver_ready_T9 skipped\n");
 	}
@@ -1161,7 +1161,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc);
 	}
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->stop_dp_info_packets(
 					pipe_ctx->stream_res.hpo_dp_stream_enc);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal))
@@ -1172,7 +1172,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 
 	link_hwss->reset_stream_encoder(pipe_ctx);
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		dto_params.otg_inst = tg->inst;
 		dto_params.timing = &pipe_ctx->stream->timing;
 		dp_hpo_inst = pipe_ctx->stream_res.hpo_dp_stream_enc->inst;
@@ -1181,7 +1181,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 		dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst, dp_hpo_inst);
 	}
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		/* TODO: This looks like a bug to me as we are disabling HPO IO when
 		 * we are just disabling a single HPO stream. Shouldn't we disable HPO
 		 * HW control only when HPOs for all streams are disabled?
@@ -1223,7 +1223,7 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
 	}
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_blank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc);
@@ -1245,7 +1245,7 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 				 * we shouldn't be doing power-sequencing, hence we can skip
 				 * waiting for T9-ready.
 				 */
-				link_edp_receiver_ready_T9(link);
+				link->dc->link_srv->edp_receiver_ready_T9(link);
 			}
 		}
 	}
@@ -1428,7 +1428,7 @@ static enum dc_status dce110_enable_stream_timing(
 		if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 				pipe_ctx->clock_source,
 				&pipe_ctx->stream_res.pix_clk_params,
-				link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+				dc->link_srv->dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 				&pipe_ctx->pll_settings)) {
 			BREAK_TO_DEBUGGER();
 			return DC_ERROR_UNEXPECTED;
@@ -1532,7 +1532,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
 	 * function core_link_enable_stream
 	 */
-	if (!(hws->wa.dp_hpo_and_otg_sequence && link_is_dp_128b_132b_signal(pipe_ctx)))
+	if (!(hws->wa.dp_hpo_and_otg_sequence && dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)))
 		/*  */
 		/* Do not touch stream timing on seamless boot optimization. */
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
@@ -1564,17 +1564,17 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 			pipe_ctx->stream_res.tg->inst);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG);
+		dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG);
 
 	if (!stream->dpms_off)
-		link_set_dpms_on(context, pipe_ctx);
+		dc->link_srv->set_dpms_on(context, pipe_ctx);
 
 	/* DCN3.1 FPGA Workaround
 	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
 	 * function core_link_enable_stream
 	 */
-	if (hws->wa.dp_hpo_and_otg_sequence && link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (hws->wa.dp_hpo_and_otg_sequence && dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
 			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
 	}
@@ -1600,7 +1600,7 @@ static void power_down_encoders(struct dc *dc)
 	for (i = 0; i < dc->link_count; i++) {
 		enum signal_type signal = dc->links[i]->connector_signal;
 
-		link_blank_dp_stream(dc->links[i], false);
+		dc->link_srv->blank_dp_stream(dc->links[i], false);
 
 		if (signal != SIGNAL_TYPE_EDP)
 			signal = SIGNAL_TYPE_NONE;
@@ -2083,7 +2083,7 @@ static void dce110_reset_hw_ctx_wrap(
 			 * disabled already, no need to disable again.
 			 */
 			if (!pipe_ctx->stream || !pipe_ctx->stream->dpms_off) {
-				link_set_dpms_off(pipe_ctx_old);
+				dc->link_srv->set_dpms_off(pipe_ctx_old);
 
 				/* free acquired resources*/
 				if (pipe_ctx_old->stream_res.audio) {
@@ -3054,13 +3054,13 @@ void dce110_enable_dp_link_output(
 				pipes[i].clock_source->funcs->program_pix_clk(
 						pipes[i].clock_source,
 						&pipes[i].stream_res.pix_clk_params,
-						link_dp_get_encoding_format(link_settings),
+						dc->link_srv->dp_get_encoding_format(link_settings),
 						&pipes[i].pll_settings);
 			}
 		}
 	}
 
-	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
+	if (dc->link_srv->dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 		if (dc->clk_mgr->funcs->notify_link_rate_change)
 			dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
 	}
@@ -3077,7 +3077,7 @@ void dce110_enable_dp_link_output(
 	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
+	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
 }
 
 void dce110_disable_link_output(struct dc_link *link,
@@ -3102,7 +3102,7 @@ void dce110_disable_link_output(struct dc_link *link,
 		link->dc->hwss.edp_power_control(link, false);
 	else if (dmcu != NULL && dmcu->funcs->lock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 }
 
 static const struct hw_sequencer_funcs dce110_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 5b34066ffcf6..7f9cceb49f4e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -919,7 +919,7 @@ enum dc_status dcn10_enable_stream_timing(
 	if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 			pipe_ctx->clock_source,
 			&pipe_ctx->stream_res.pix_clk_params,
-			link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+			dc->link_srv->dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 			&pipe_ctx->pll_settings)) {
 		BREAK_TO_DEBUGGER();
 		return DC_ERROR_UNEXPECTED;
@@ -1017,7 +1017,7 @@ static void dcn10_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			link_set_dpms_off(pipe_ctx);
+			dc->link_srv->set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -1564,7 +1564,7 @@ void dcn10_init_hw(struct dc *dc)
 	}
 
 	/* we want to turn off all dp displays before doing detection */
-	link_blank_all_dp_displays(dc);
+	dc->link_srv->blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
index 2e5f8dc401ff..f496e952ceec 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
@@ -933,7 +933,7 @@ void enc1_stream_encoder_dp_blank(
 	/* disable DP stream */
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, 0);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM);
 
 	/* the encoder stops sending the video stream
 	 * at the start of the vertical blanking.
@@ -952,7 +952,7 @@ void enc1_stream_encoder_dp_blank(
 
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, true);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET);
 }
 
 /* output video stream to link encoder */
@@ -1025,7 +1025,8 @@ void enc1_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link->dc->link_srv->dp_trace_source_sequence(link,
+			DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 void enc1_stream_encoder_set_avmute(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 8b5181f3d13a..53669f832ba5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -720,7 +720,7 @@ enum dc_status dcn20_enable_stream_timing(
 	if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
 			pipe_ctx->clock_source,
 			&pipe_ctx->stream_res.pix_clk_params,
-			link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+			dc->link_srv->dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
 			&pipe_ctx->pll_settings)) {
 		BREAK_TO_DEBUGGER();
 		return DC_ERROR_UNEXPECTED;
@@ -2405,7 +2405,7 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 
 	params.link_settings.link_rate = link_settings->link_rate;
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_unblank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -2458,7 +2458,7 @@ static void dcn20_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			link_set_dpms_off(pipe_ctx);
+			dc->link_srv->set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -2478,7 +2478,7 @@ static void dcn20_reset_back_end_for_pipe(
 		}
 	}
 	else if (pipe_ctx->stream_res.dsc) {
-		link_set_dsc_enable(pipe_ctx, false);
+		dc->link_srv->set_dsc_enable(pipe_ctx, false);
 	}
 
 	/* by upper caller loop, parent pipe: pipe0, will be reset last.
@@ -2713,12 +2713,12 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 	unsigned int k1_div = PIXEL_RATE_DIV_NA;
 	unsigned int k2_div = PIXEL_RATE_DIV_NA;
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		if (dc->hwseq->funcs.setup_hpo_hw_control)
 			dc->hwseq->funcs.setup_hpo_hw_control(dc->hwseq, true);
 	}
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		dp_hpo_inst = pipe_ctx->stream_res.hpo_dp_stream_enc->inst;
 		dccg->funcs->set_dpstreamclk(dccg, DTBCLK0, tg->inst, dp_hpo_inst);
 
@@ -2752,7 +2752,7 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 	dc->hwss.update_info_frame(pipe_ctx);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+		dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
 
 	/* enable early control to avoid corruption on DP monitor*/
 	active_total_with_borders =
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 00668df0938e..77ef474ced07 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -1211,8 +1211,11 @@ static void dcn20_resource_destruct(struct dcn20_resource_pool *pool)
 	if (pool->base.pp_smu != NULL)
 		dcn20_pp_smu_destroy(&pool->base.pp_smu);
 
-	if (pool->base.oem_device != NULL)
-		link_destroy_ddc_service(&pool->base.oem_device);
+	if (pool->base.oem_device != NULL) {
+		struct dc *dc = pool->base.oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->base.oem_device);
+	}
 }
 
 struct hubp *dcn20_hubp_create(
@@ -2763,7 +2766,7 @@ static bool dcn20_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->base.oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
index 42865d6c0cdd..0b47aeb60e79 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
@@ -546,7 +546,8 @@ void enc2_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link->dc->link_srv->dp_trace_source_sequence(link,
+			DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 static void enc2_dp_set_odm_combine(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
index 15475c7e2cf9..2a182c2f57d6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
@@ -132,8 +132,8 @@ void dcn21_PLAT_58856_wa(struct dc_state *context, struct pipe_ctx *pipe_ctx)
 		return;
 
 	pipe_ctx->stream->dpms_off = false;
-	link_set_dpms_on(context, pipe_ctx);
-	link_set_dpms_off(pipe_ctx);
+	pipe_ctx->stream->ctx->dc->link_srv->set_dpms_on(context, pipe_ctx);
+	pipe_ctx->stream->ctx->dc->link_srv->set_dpms_off(pipe_ctx);
 	pipe_ctx->stream->dpms_off = true;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index f8733ff6970e..586de81fc2da 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -532,7 +532,7 @@ void dcn30_init_hw(struct dc *dc)
 	}
 
 	/* we want to turn off all dp displays before doing detection */
-	link_blank_all_dp_displays(dc);
+	dc->link_srv->blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index d60c17d5a0d8..c9e45da6ccd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -1205,8 +1205,11 @@ static void dcn30_resource_destruct(struct dcn30_resource_pool *pool)
 	if (pool->base.dccg != NULL)
 		dcn_dccg_destroy(&pool->base.dccg);
 
-	if (pool->base.oem_device != NULL)
-		link_destroy_ddc_service(&pool->base.oem_device);
+	if (pool->base.oem_device != NULL) {
+		struct dc *dc = pool->base.oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->base.oem_device);
+	}
 }
 
 static struct hubp *dcn30_hubp_create(
@@ -2590,7 +2593,7 @@ static bool dcn30_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->base.oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index 6ccad53f1e49..9f93c43115ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -1125,8 +1125,11 @@ static void dcn302_resource_destruct(struct resource_pool *pool)
 	if (pool->dccg != NULL)
 		dcn_dccg_destroy(&pool->dccg);
 
-	if (pool->oem_device != NULL)
-		link_destroy_ddc_service(&pool->oem_device);
+	if (pool->oem_device != NULL) {
+		struct dc *dc = pool->oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->oem_device);
+	}
 }
 
 static void dcn302_destroy_resource_pool(struct resource_pool **pool)
@@ -1506,7 +1509,7 @@ static bool dcn302_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index 5c28f7151d13..7f72ef882ca4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -1051,8 +1051,11 @@ static void dcn303_resource_destruct(struct resource_pool *pool)
 	if (pool->dccg != NULL)
 		dcn_dccg_destroy(&pool->dccg);
 
-	if (pool->oem_device != NULL)
-		link_destroy_ddc_service(&pool->oem_device);
+	if (pool->oem_device != NULL) {
+		struct dc *dc = pool->oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->oem_device);
+	}
 }
 
 static void dcn303_destroy_resource_pool(struct resource_pool **pool)
@@ -1417,7 +1420,7 @@ static bool dcn303_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 80a0c5a575a9..10e3cc17f71a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -202,7 +202,7 @@ void dcn31_init_hw(struct dc *dc)
 		dmub_enable_outbox_notification(dc->ctx->dmub_srv);
 
 	/* we want to turn off all dp displays before doing detection */
-	link_blank_all_dp_displays(dc);
+	dc->link_srv->blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
@@ -230,7 +230,7 @@ void dcn31_init_hw(struct dc *dc)
 				}
 
 				if (num_opps > 1) {
-					link_blank_all_edp_displays(dc);
+					dc->link_srv->blank_all_edp_displays(dc);
 					break;
 				}
 			}
@@ -414,7 +414,7 @@ void dcn31_update_info_frame(struct pipe_ctx *pipe_ctx)
 		pipe_ctx->stream_res.stream_enc->funcs->update_hdmi_info_packets(
 			pipe_ctx->stream_res.stream_enc,
 			&pipe_ctx->stream_res.encoder_info_frame);
-	else if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	else if (pipe_ctx->stream->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->update_dp_info_packets(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
 				&pipe_ctx->stream_res.encoder_info_frame);
@@ -565,7 +565,7 @@ static void dcn31_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			link_set_dpms_off(pipe_ctx);
+			dc->link_srv->set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -584,7 +584,7 @@ static void dcn31_reset_back_end_for_pipe(
 			}
 		}
 	} else if (pipe_ctx->stream_res.dsc) {
-			link_set_dsc_enable(pipe_ctx, false);
+		dc->link_srv->set_dsc_enable(pipe_ctx, false);
 	}
 
 	pipe_ctx->stream = NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
index 742e43cb8880..467509a65fa7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
@@ -372,7 +372,7 @@ static void enc314_stream_encoder_dp_unblank(
 	 */
 	enc314_enable_fifo(enc);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 /* Set DSC-related configuration.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index 575d3501c848..bcc03426fc3e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -346,7 +346,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (stream->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) || dc_is_dvi_signal(pipe_ctx->stream->signal)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
index ccf6b181c349..c72448125976 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
@@ -371,7 +371,7 @@ static void enc32_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 /* Set DSC-related configuration.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index f87db2271924..5016b1313f3d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -801,7 +801,7 @@ void dcn32_init_hw(struct dc *dc)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
 
 	/* we want to turn off all dp displays before doing detection */
-	link_blank_all_dp_displays(dc);
+	dc->link_srv->blank_all_dp_displays(dc);
 
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
@@ -1102,7 +1102,7 @@ unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsign
 	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (stream->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(stream->signal) || dc_is_dvi_signal(stream->signal)) {
@@ -1166,7 +1166,7 @@ void dcn32_unblank_stream(struct pipe_ctx *pipe_ctx,
 
 	params.link_settings.link_rate = link_settings->link_rate;
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (link->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_unblank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -1193,7 +1193,7 @@ bool dcn32_is_dp_dig_pixel_rate_div_policy(struct pipe_ctx *pipe_ctx)
 	if (!is_h_timing_divisible_by_2(pipe_ctx->stream))
 		return false;
 
-	if (dc_is_dp_signal(pipe_ctx->stream->signal) && !link_is_dp_128b_132b_signal(pipe_ctx) &&
+	if (dc_is_dp_signal(pipe_ctx->stream->signal) && !dc->link_srv->dp_is_128b_132b_signal(pipe_ctx) &&
 		dc->debug.enable_dp_dig_pixel_rate_div_policy)
 		return true;
 	return false;
@@ -1227,7 +1227,8 @@ static void apply_symclk_on_tx_off_wa(struct dc_link *link)
 				pipe_ctx->clock_source->funcs->program_pix_clk(
 						pipe_ctx->clock_source,
 						&pipe_ctx->stream_res.pix_clk_params,
-						link_dp_get_encoding_format(&pipe_ctx->link_config.dp_link_settings),
+						dc->link_srv->dp_get_encoding_format(
+								&pipe_ctx->link_config.dp_link_settings),
 						&pipe_ctx->pll_settings);
 				link->phy_state.symclk_state = SYMCLK_ON_TX_OFF;
 				break;
@@ -1259,7 +1260,7 @@ void dcn32_disable_link_output(struct dc_link *link,
 	else if (dmcu != NULL && dmcu->funcs->lock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 
 	apply_symclk_on_tx_off_wa(link);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 100b6df33b33..f6f72e7c9e86 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1505,8 +1505,11 @@ static void dcn32_resource_destruct(struct dcn32_resource_pool *pool)
 	if (pool->base.dccg != NULL)
 		dcn_dccg_destroy(&pool->base.dccg);
 
-	if (pool->base.oem_device != NULL)
-		link_destroy_ddc_service(&pool->base.oem_device);
+	if (pool->base.oem_device != NULL) {
+		struct dc *dc = pool->base.oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->base.oem_device);
+	}
 }
 
 
@@ -2451,7 +2454,7 @@ static bool dcn32_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->base.oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index 0f477d50e935..c6a0e84885a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -1490,8 +1490,11 @@ static void dcn321_resource_destruct(struct dcn321_resource_pool *pool)
 	if (pool->base.dccg != NULL)
 		dcn_dccg_destroy(&pool->base.dccg);
 
-	if (pool->base.oem_device != NULL)
-		link_destroy_ddc_service(&pool->base.oem_device);
+	if (pool->base.oem_device != NULL) {
+		struct dc *dc = pool->base.oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->base.oem_device);
+	}
 }
 
 
@@ -1995,7 +1998,7 @@ static bool dcn321_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
+		pool->base.oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index f3cfc144e358..38d1f2be8cf3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -938,7 +938,7 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (!context->res_ctx.pipe_ctx[i].stream)
 			continue;
-		if (link_is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+		if (dc->link_srv->dp_is_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
 			return true;
 	}
 	return false;
@@ -1341,7 +1341,7 @@ int dcn20_populate_dml_pipes_from_context(
 		case SIGNAL_TYPE_DISPLAY_PORT_MST:
 		case SIGNAL_TYPE_DISPLAY_PORT:
 			pipes[pipe_cnt].dout.output_type = dm_dp;
-			if (link_is_dp_128b_132b_signal(&res_ctx->pipe_ctx[i]))
+			if (dc->link_srv->dp_is_128b_132b_signal(&res_ctx->pipe_ctx[i]))
 				pipes[pipe_cnt].dout.output_type = dm_dp2p0;
 			break;
 		case SIGNAL_TYPE_EDP:
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 077674be452b..6b29d3a9520f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1270,7 +1270,7 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (!context->res_ctx.pipe_ctx[i].stream)
 			continue;
-		if (link_is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+		if (dc->link_srv->dp_is_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
 			return true;
 	}
 	return false;
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index d9622a0f448a..4f04bf13b226 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -47,6 +47,59 @@ static bool dsc_policy_disable_dsc_stream_overhead;
 #define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
 #endif
 
+uint32_t dc_bandwidth_in_kbps_from_timing(
+	const struct dc_crtc_timing *timing)
+{
+	uint32_t bits_per_channel = 0;
+	uint32_t kbps;
+
+	if (timing->flags.DSC)
+		return dc_dsc_stream_bandwidth_in_kbps(timing,
+				timing->dsc_cfg.bits_per_pixel,
+				timing->dsc_cfg.num_slices_h,
+				timing->dsc_cfg.is_dp);
+
+	switch (timing->display_color_depth) {
+	case COLOR_DEPTH_666:
+		bits_per_channel = 6;
+		break;
+	case COLOR_DEPTH_888:
+		bits_per_channel = 8;
+		break;
+	case COLOR_DEPTH_101010:
+		bits_per_channel = 10;
+		break;
+	case COLOR_DEPTH_121212:
+		bits_per_channel = 12;
+		break;
+	case COLOR_DEPTH_141414:
+		bits_per_channel = 14;
+		break;
+	case COLOR_DEPTH_161616:
+		bits_per_channel = 16;
+		break;
+	default:
+		ASSERT(bits_per_channel != 0);
+		bits_per_channel = 8;
+		break;
+	}
+
+	kbps = timing->pix_clk_100hz / 10;
+	kbps *= bits_per_channel;
+
+	if (timing->flags.Y_ONLY != 1) {
+		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
+		kbps *= 3;
+		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
+			kbps /= 2;
+		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
+			kbps = kbps * 2 / 3;
+	}
+
+	return kbps;
+}
+
+ 
 /* Forward Declerations */
 static bool decide_dsc_bandwidth_range(
 		const uint32_t min_bpp_x16,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 45cdf3bce2d3..11aaa7a9518a 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -28,13 +28,58 @@
 
 /* FILE POLICY AND INTENDED USAGE:
  *
- * This header declares link functions exposed to dc. All functions must use
- * function pointers. This header is strictly private in dc and should never be
- * included by DM. If DM needs to call a new link function, it needs to be
- * translated by dc_link_exports.c.
+ * This header defines link component function interfaces aka link_service.
+ * link_service provides the only entry point to link functions with function
+ * pointer style. This header is strictly private in dc and should never be
+ * included by DM because it exposes too much dc detail including all dc
+ * private types defined in core_types.h. Otherwise it will break DM - DC
+ * encapsulation and turn DM into a maintenance nightmare.
+ *
+ * The following shows a link component relation map.
+ *
+ * DM to DC:
+ * DM includes dc.h
+ * dc_link_exports.c or other dc files implement dc.h
+ *
+ * DC to Link:
+ * dc_link_exports.c or other dc files include link.h
+ * link_factory.c implements link.h
+ *
+ * Link sub-component to Link sub-component:
+ * link_factory.c includes --> link_xxx.h
+ * link_xxx.c implements link_xxx.h
+
+ * As you can see if you ever need to add a new dc link function and call it on
+ * DM/dc side, it is very difficult because you will need layers of translation.
+ * The most appropriate approach to implement new requirements on DM/dc side is
+ * to extend or generalize the functionality of existing link function
+ * interfaces so minimal modification is needed outside link component to
+ * achieve your new requirements. This approach reduces or even eliminates the
+ * effort needed outside link component to support a new link feature. This also
+ * reduces code discrepancy among DMs to support the same link feature. If we
+ * test full code path on one version of DM, and there is no feature specific
+ * modification required on other DMs, then we can have higher confidence that
+ * the feature will run on other DMs and produce the same result. The following
+ * are some good examples to start with:
+ *
+ * - detect_link --> to add new link detection or capability retrieval routines
+ *
+ * - validate_mode_timing --> to add new timing validation conditions
+ *
+ * - set_dpms_on/set_dpms_off --> to include new link enablement sequences
+ *
+ * If you must add new link functions, you will need to:
+ * 1. declare the function pointer here under the suitable commented category.
+ * 2. Implement your function in the suitable link_xxx.c file.
+ * 3. Assign the function to link_service in link_factory.c
+ * 4. NEVER include link_xxx.h headers outside link component.
+ * 5. NEVER include link.h on DM side.
  */
 #include "core_types.h"
 
+struct link_service *link_create_link_service(void);
+void link_destroy_link_service(struct link_service **link_srv);
+
 struct link_init_data {
 	const struct dc *dc;
 	struct dc_context *ctx; /* TODO: remove 'dal' when DC is complete. */
@@ -44,8 +89,24 @@ struct link_init_data {
 	bool is_dpia_link;
 };
 
+struct ddc_service_init_data {
+	struct graphics_object_id id;
+	struct dc_context *ctx;
+	struct dc_link *link;
+	bool is_dpia_link;
+};
+
 struct link_service {
-	/* Detection */
+	/************************** Factory ***********************************/
+	struct dc_link *(*create_link)(
+			const struct link_init_data *init_params);
+	void (*destroy_link)(struct dc_link **link);
+
+
+	/************************** Detection *********************************/
+	bool (*detect_link)(struct dc_link *link, enum dc_detect_reason reason);
+	bool (*detect_connection_type)(struct dc_link *link,
+			enum dc_connection_type *type);
 	struct dc_sink *(*add_remote_sink)(
 			struct dc_link *link,
 			const uint8_t *edid,
@@ -53,24 +114,90 @@ struct link_service {
 			struct dc_sink_init_data *init_data);
 	void (*remove_remote_sink)(struct dc_link *link, struct dc_sink *sink);
 	bool (*get_hpd_state)(struct dc_link *link);
+	struct gpio *(*get_hpd_gpio)(struct dc_bios *dcb,
+			struct graphics_object_id link_id,
+			struct gpio_service *gpio_service);
 	void (*enable_hpd)(const struct dc_link *link);
 	void (*disable_hpd)(const struct dc_link *link);
 	void (*enable_hpd_filter)(struct dc_link *link, bool enable);
+	bool (*reset_cur_dp_mst_topology)(struct dc_link *link);
+	const struct dc_link_status *(*get_status)(const struct dc_link *link);
+	bool (*is_hdcp1x_supported)(struct dc_link *link,
+			enum signal_type signal);
+	bool (*is_hdcp2x_supported)(struct dc_link *link,
+			enum signal_type signal);
+	void (*clear_dprx_states)(struct dc_link *link);
+
+
+	/*************************** Resource *********************************/
+	void (*get_cur_res_map)(const struct dc *dc, uint32_t *map);
+	void (*restore_res_map)(const struct dc *dc, uint32_t *map);
+	void (*get_cur_link_res)(const struct dc_link *link,
+			struct link_resource *link_res);
+
+
+	/*************************** Validation *******************************/
+	enum dc_status (*validate_mode_timing)(
+			const struct dc_stream_state *stream,
+			struct dc_link *link,
+			const struct dc_crtc_timing *timing);
+	uint32_t (*dp_link_bandwidth_kbps)(
+		const struct dc_link *link,
+		const struct dc_link_settings *link_settings);
+
+
+	/*************************** DPMS *************************************/
+	void (*set_dpms_on)(struct dc_state *state, struct pipe_ctx *pipe_ctx);
+	void (*set_dpms_off)(struct pipe_ctx *pipe_ctx);
+	void (*resume)(struct dc_link *link);
+	void (*blank_all_dp_displays)(struct dc *dc);
+	void (*blank_all_edp_displays)(struct dc *dc);
+	void (*blank_dp_stream)(struct dc_link *link, bool hw_init);
+	enum dc_status (*increase_mst_payload)(
+			struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+	enum dc_status (*reduce_mst_payload)(
+			struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+	void (*set_dsc_on_stream)(struct pipe_ctx *pipe_ctx, bool enable);
+	bool (*set_dsc_enable)(struct pipe_ctx *pipe_ctx, bool enable);
+	bool (*update_dsc_config)(struct pipe_ctx *pipe_ctx);
 
-	/* DDC */
+
+	/*************************** DDC **************************************/
+	struct ddc_service *(*create_ddc_service)(
+			struct ddc_service_init_data *ddc_init_data);
+	void (*destroy_ddc_service)(struct ddc_service **ddc);
+	bool (*query_ddc_data)(
+			struct ddc_service *ddc,
+			uint32_t address,
+			uint8_t *write_buf,
+			uint32_t write_size,
+			uint8_t *read_buf,
+			uint32_t read_size);
 	int (*aux_transfer_raw)(struct ddc_service *ddc,
 			struct aux_payload *payload,
 			enum aux_return_code_type *operation_result);
+	bool (*aux_transfer_with_retries_no_mutex)(struct ddc_service *ddc,
+			struct aux_payload *payload);
+	bool (*is_in_aux_transaction_mode)(struct ddc_service *ddc);
+	uint32_t (*get_aux_defer_delay)(struct ddc_service *ddc);
+
 
-	/* DP Capability */
+	/*************************** DP Capability ****************************/
 	bool (*dp_is_sink_present)(struct dc_link *link);
 	bool (*dp_is_fec_supported)(const struct dc_link *link);
+	bool (*dp_is_128b_132b_signal)(struct pipe_ctx *pipe_ctx);
 	bool (*dp_get_max_link_enc_cap)(const struct dc_link *link,
 			struct dc_link_settings *max_link_enc_cap);
 	const struct dc_link_settings *(*dp_get_verified_link_cap)(
 			const struct dc_link *link);
+	enum dp_link_encoding (*dp_get_encoding_format)(
+			const struct dc_link_settings *link_settings);
 	bool (*dp_should_enable_fec)(const struct dc_link *link);
-	enum dp_link_encoding (*mst_decide_link_encoding_format)(const struct dc_link *link);
+	bool (*dp_decide_link_settings)(
+		struct dc_stream_state *stream,
+		struct dc_link_settings *link_setting);
+	enum dp_link_encoding (*mst_decide_link_encoding_format)(
+			const struct dc_link *link);
 	bool (*edp_decide_link_settings)(struct dc_link *link,
 			struct dc_link_settings *link_setting, uint32_t req_bw);
 	uint32_t (*bw_kbps_from_raw_frl_link_rate_data)(uint8_t bw);
@@ -78,12 +205,20 @@ struct link_service {
 	enum lttpr_mode (*dp_decide_lttpr_mode)(struct dc_link *link,
 			struct dc_link_settings *link_setting);
 
-	/* DP DPIA/PHY */
-	int (*dpia_handle_usb4_bandwidth_allocation_for_link)(struct dc_link *link, int peak_bw);
-	void (*dpia_handle_bw_alloc_response)(struct dc_link *link, uint8_t bw, uint8_t result);
+
+	/*************************** DP DPIA/PHY ******************************/
+	int (*dpia_handle_usb4_bandwidth_allocation_for_link)(
+			struct dc_link *link, int peak_bw);
+	void (*dpia_handle_bw_alloc_response)(
+			struct dc_link *link, uint8_t bw, uint8_t result);
+	void (*dp_set_drive_settings)(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings);
 	void (*dpcd_write_rx_power_ctrl)(struct dc_link *link, bool on);
 
-	/* DP IRQ Handler */
+
+	/*************************** DP IRQ Handler ***************************/
 	bool (*dp_parse_link_loss_status)(
 		struct dc_link *link,
 		union hpd_irq_data *hpd_irq_dpcd_data);
@@ -93,11 +228,14 @@ struct link_service {
 		struct dc_link *link,
 		union hpd_irq_data *irq_data);
 	bool (*dp_handle_hpd_rx_irq)(struct dc_link *link,
-			union hpd_irq_data *out_hpd_irq_dpcd_data, bool *out_link_loss,
+			union hpd_irq_data *out_hpd_irq_dpcd_data,
+			bool *out_link_loss,
 			bool defer_handling, bool *has_left_work);
 
-	/* eDP Panel Control */
-	void (*edp_panel_backlight_power_on)(struct dc_link *link, bool wait_for_hpd);
+
+	/*************************** eDP Panel Control ************************/
+	void (*edp_panel_backlight_power_on)(
+			struct dc_link *link, bool wait_for_hpd);
 	int (*edp_get_backlight_level)(const struct dc_link *link);
 	bool (*edp_get_backlight_level_nits)(struct dc_link *link,
 			uint32_t *backlight_millinits_avg,
@@ -110,16 +248,35 @@ struct link_service {
 			uint32_t backlight_millinits,
 			uint32_t transition_time_in_ms);
 	int (*edp_get_target_backlight_pwm)(const struct dc_link *link);
-	bool (*edp_get_psr_state)(const struct dc_link *link, enum dc_psr_state *state);
-	bool (*edp_set_psr_allow_active)(struct dc_link *link, const bool *allow_active,
-			bool wait, bool force_static, const unsigned int *power_opts);
+	bool (*edp_get_psr_state)(
+			const struct dc_link *link, enum dc_psr_state *state);
+	bool (*edp_set_psr_allow_active)(
+			struct dc_link *link,
+			const bool *allow_active,
+			bool wait,
+			bool force_static,
+			const unsigned int *power_opts);
 	bool (*edp_setup_psr)(struct dc_link *link,
 			const struct dc_stream_state *stream,
 			struct psr_config *psr_config,
 			struct psr_context *psr_context);
+	bool (*edp_set_sink_vtotal_in_psr_active)(
+			const struct dc_link *link,
+			uint16_t psr_vtotal_idle,
+			uint16_t psr_vtotal_su);
+	void (*edp_get_psr_residency)(
+			const struct dc_link *link, uint32_t *residency);
 	bool (*edp_wait_for_t12)(struct dc_link *link);
+	bool (*edp_is_ilr_optimization_required)(struct dc_link *link,
+			struct dc_crtc_timing *crtc_timing);
+	bool (*edp_backlight_enable_aux)(struct dc_link *link, bool enable);
+	void (*edp_add_delay_for_T9)(struct dc_link *link);
+	bool (*edp_receiver_ready_T9)(struct dc_link *link);
+	bool (*edp_receiver_ready_T7)(struct dc_link *link);
+	bool (*edp_power_alpm_dpcd_enable)(struct dc_link *link, bool enable);
 
-	/* DP CTS */
+
+	/*************************** DP CTS ************************************/
 	void (*dp_handle_automated_test)(struct dc_link *link);
 	bool (*dp_set_test_pattern)(
 			struct dc_link *link,
@@ -137,7 +294,8 @@ struct link_service {
 			struct dc_link *link,
 			bool skip_immediate_retrain);
 
-	/* DP Trace */
+
+	/*************************** DP Trace *********************************/
 	bool (*dp_trace_is_initialized)(struct dc_link *link);
 	void (*dp_trace_set_is_logged_flag)(struct dc_link *link,
 			bool in_detection,
@@ -148,115 +306,11 @@ struct link_service {
 	const struct dp_trace_lt_counts *(*dp_trace_get_lt_counts)(
 			struct dc_link *link, bool in_detection);
 	unsigned int (*dp_trace_get_link_loss_count)(struct dc_link *link);
+	void (*dp_trace_set_edp_power_timestamp)(struct dc_link *link,
+			bool power_up);
+	uint64_t (*dp_trace_get_edp_poweron_timestamp)(struct dc_link *link);
+	uint64_t (*dp_trace_get_edp_poweroff_timestamp)(struct dc_link *link);
+	void (*dp_trace_source_sequence)(
+			struct dc_link *link, uint8_t dp_test_mode);
 };
-
-struct dc_link *link_create(const struct link_init_data *init_params);
-void link_destroy(struct dc_link **link);
-const struct link_service *link_get_link_service(void);
-
-// TODO - convert any function declarations below to function pointers
-struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
-		struct graphics_object_id link_id,
-		struct gpio_service *gpio_service);
-
-struct ddc_service_init_data {
-	struct graphics_object_id id;
-	struct dc_context *ctx;
-	struct dc_link *link;
-	bool is_dpia_link;
-};
-
-struct ddc_service *link_create_ddc_service(
-		struct ddc_service_init_data *ddc_init_data);
-
-void link_destroy_ddc_service(struct ddc_service **ddc);
-
-bool link_is_in_aux_transaction_mode(struct ddc_service *ddc);
-
-bool link_query_ddc_data(
-		struct ddc_service *ddc,
-		uint32_t address,
-		uint8_t *write_buf,
-		uint32_t write_size,
-		uint8_t *read_buf,
-		uint32_t read_size);
-
-
-/* Attempt to submit an aux payload, retrying on timeouts, defers, and busy
- * states as outlined in the DP spec.  Returns true if the request was
- * successful.
- *
- * NOTE: The function requires explicit mutex on DM side in order to prevent
- * potential race condition. DC components should call the dpcd read/write
- * function in dm_helpers in order to access dpcd safely
- */
-bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
-		struct aux_payload *payload);
-
-uint32_t link_get_aux_defer_delay(struct ddc_service *ddc);
-
-bool link_is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
-
-enum dp_link_encoding link_dp_get_encoding_format(
-		const struct dc_link_settings *link_settings);
-
-bool link_decide_link_settings(
-	struct dc_stream_state *stream,
-	struct dc_link_settings *link_setting);
-
-void link_dp_trace_set_edp_power_timestamp(struct dc_link *link,
-		bool power_up);
-uint64_t link_dp_trace_get_edp_poweron_timestamp(struct dc_link *link);
-uint64_t link_dp_trace_get_edp_poweroff_timestamp(struct dc_link *link);
-
-bool link_is_edp_ilr_optimization_required(struct dc_link *link,
-		struct dc_crtc_timing *crtc_timing);
-
-bool link_backlight_enable_aux(struct dc_link *link, bool enable);
-void link_edp_add_delay_for_T9(struct dc_link *link);
-bool link_edp_receiver_ready_T9(struct dc_link *link);
-bool link_edp_receiver_ready_T7(struct dc_link *link);
-bool link_power_alpm_dpcd_enable(struct dc_link *link, bool enable);
-bool link_set_sink_vtotal_in_psr_active(const struct dc_link *link,
-		uint16_t psr_vtotal_idle, uint16_t psr_vtotal_su);
-void link_get_psr_residency(const struct dc_link *link, uint32_t *residency);
-enum dc_status link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
-enum dc_status link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
-void link_blank_all_dp_displays(struct dc *dc);
-void link_blank_all_edp_displays(struct dc *dc);
-void link_blank_dp_stream(struct dc_link *link, bool hw_init);
-void link_resume(struct dc_link *link);
-void link_set_dpms_on(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx);
-void link_set_dpms_off(struct pipe_ctx *pipe_ctx);
-void link_dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode);
-void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable);
-bool link_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
-bool link_update_dsc_config(struct pipe_ctx *pipe_ctx);
-enum dc_status link_validate_mode_timing(
-		const struct dc_stream_state *stream,
-		struct dc_link *link,
-		const struct dc_crtc_timing *timing);
-bool link_detect(struct dc_link *link, enum dc_detect_reason reason);
-bool link_detect_connection_type(struct dc_link *link,
-		enum dc_connection_type *type);
-const struct dc_link_status *link_get_status(const struct dc_link *link);
-/* return true if the connected receiver supports the hdcp version */
-bool link_is_hdcp14(struct dc_link *link, enum signal_type signal);
-bool link_is_hdcp22(struct dc_link *link, enum signal_type signal);
-void link_clear_dprx_states(struct dc_link *link);
-bool link_reset_cur_dp_mst_topology(struct dc_link *link);
-uint32_t dp_link_bandwidth_kbps(
-	const struct dc_link *link,
-	const struct dc_link_settings *link_settings);
-uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing);
-void link_get_cur_res_map(const struct dc *dc, uint32_t *map);
-void link_restore_res_map(const struct dc *dc, uint32_t *map);
-void link_get_cur_link_res(const struct dc_link *link,
-		struct link_resource *link_res);
-void dp_set_drive_settings(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings);
 #endif /* __DC_LINK_HPD_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 704373d4d110..db9f1baa27e5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -28,6 +28,7 @@
 #include "link/protocols/link_dp_training.h"
 #include "link/protocols/link_dp_phy.h"
 #include "link/protocols/link_dp_training_fixed_vs_pe_retimer.h"
+#include "link/protocols/link_dp_capability.h"
 #include "link/link_dpms.h"
 #include "resource.h"
 #include "dm_helpers.h"
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
index 277fe9137a97..fbcd8fb58ea8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
@@ -145,7 +145,7 @@ unsigned int dp_trace_get_link_loss_count(struct dc_link *link)
 	return link->dp_trace.link_loss_count;
 }
 
-void link_dp_trace_set_edp_power_timestamp(struct dc_link *link,
+void dp_trace_set_edp_power_timestamp(struct dc_link *link,
 		bool power_up)
 {
 	if (!power_up)
@@ -155,17 +155,17 @@ void link_dp_trace_set_edp_power_timestamp(struct dc_link *link,
 		link->dp_trace.edp_trace_power_timestamps.poweron = dm_get_timestamp(link->dc->ctx);
 }
 
-uint64_t link_dp_trace_get_edp_poweron_timestamp(struct dc_link *link)
+uint64_t dp_trace_get_edp_poweron_timestamp(struct dc_link *link)
 {
 	return link->dp_trace.edp_trace_power_timestamps.poweron;
 }
 
-uint64_t link_dp_trace_get_edp_poweroff_timestamp(struct dc_link *link)
+uint64_t dp_trace_get_edp_poweroff_timestamp(struct dc_link *link)
 {
 	return link->dp_trace.edp_trace_power_timestamps.poweroff;
 }
 
-void link_dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
+void dp_trace_source_sequence(struct dc_link *link, uint8_t dp_test_mode)
 {
 	if (link != NULL && link->dc->debug.enable_driver_sequence_debug)
 		core_link_write_dpcd(link, DP_SOURCE_SEQUENCE,
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
index 9a0aff81a251..ab437a0c9101 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
@@ -54,5 +54,10 @@ unsigned long long dp_trace_get_lt_end_timestamp(struct dc_link *link,
 const struct dp_trace_lt_counts *dp_trace_get_lt_counts(struct dc_link *link,
 		bool in_detection);
 unsigned int dp_trace_get_link_loss_count(struct dc_link *link);
+void dp_trace_set_edp_power_timestamp(struct dc_link *link,
+		bool power_up);
+uint64_t dp_trace_get_edp_poweron_timestamp(struct dc_link *link);
+uint64_t dp_trace_get_edp_poweroff_timestamp(struct dc_link *link);
+void dp_trace_source_sequence(struct dc_link *link, uint8_t dp_test_mode);
 
 #endif /* __LINK_DP_TRACE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
index b092b00b3599..bebf9c4c8702 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
@@ -44,7 +44,7 @@ void setup_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
 	link_enc->funcs->connect_dig_be_to_fe(link_enc,
 			pipe_ctx->stream_res.stream_enc->id, true);
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(pipe_ctx->stream->link,
+		pipe_ctx->stream->ctx->dc->link_srv->dp_trace_source_sequence(pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
 	if (stream_enc->funcs->enable_fifo)
 		stream_enc->funcs->enable_fifo(stream_enc);
@@ -63,7 +63,8 @@ void reset_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc->id,
 			false);
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(pipe_ctx->stream->link,
+		pipe_ctx->stream->ctx->dc->link_srv->dp_trace_source_sequence(
+				pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
 
 }
@@ -105,7 +106,8 @@ void setup_dio_stream_attribute(struct pipe_ctx *pipe_ctx)
 				&stream->timing);
 
 	if (dc_is_dp_signal(stream->signal))
-		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
+		link->dc->link_srv->dp_trace_source_sequence(link,
+				DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
 }
 
 void enable_dio_dp_link_output(struct dc_link *link,
@@ -126,7 +128,8 @@ void enable_dio_dp_link_output(struct dc_link *link,
 				link_enc,
 				link_settings,
 				clock_source);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
+	link->dc->link_srv->dp_trace_source_sequence(link,
+			DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
 }
 
 void disable_dio_link_output(struct dc_link *link,
@@ -136,7 +139,8 @@ void disable_dio_link_output(struct dc_link *link,
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
 
 	link_enc->funcs->disable_output(link_enc, signal);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	link->dc->link_srv->dp_trace_source_sequence(link,
+			DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 }
 
 void set_dio_dp_link_test_pattern(struct dc_link *link,
@@ -146,7 +150,7 @@ void set_dio_dp_link_test_pattern(struct dc_link *link,
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
 
 	link_enc->funcs->dp_set_phy_pattern(link_enc, tp_params);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
 
 void set_dio_dp_lane_settings(struct dc_link *link,
@@ -195,7 +199,8 @@ void enable_dio_audio_packet(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc, false);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(pipe_ctx->stream->link,
+		pipe_ctx->stream->ctx->dc->link_srv->dp_trace_source_sequence(
+				pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_ENABLE_AUDIO_STREAM);
 }
 
@@ -214,7 +219,8 @@ void disable_dio_audio_packet(struct pipe_ctx *pipe_ctx)
 	}
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		link_dp_source_sequence_trace(pipe_ctx->stream->link,
+		pipe_ctx->stream->ctx->dc->link_srv->dp_trace_source_sequence(
+				pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_DISABLE_AUDIO_STREAM);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
index aa1c5e253b43..edd7d026a762 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
@@ -68,7 +68,8 @@ static void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
 	struct dc_crtc_timing *timing = &pipe_ctx->stream->timing;
 	struct fixed31_32 h_blank_in_ms, time_slot_in_ms, mtp_cnt_per_h_blank;
 	uint32_t link_bw_in_kbps =
-			dc_link_bandwidth_kbps(pipe_ctx->stream->link, link_settings);
+			hpo_dp_stream_encoder->ctx->dc->link_srv->dp_link_bandwidth_kbps(
+					pipe_ctx->stream->link, link_settings);
 	uint16_t hblank_min_symbol_width = 0;
 
 	if (link_bw_in_kbps > 0) {
@@ -115,7 +116,8 @@ static void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx)
 			stream->use_vsc_sdp_for_colorimetry,
 			stream->timing.flags.DSC,
 			false);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
+	link->dc->link_srv->dp_trace_source_sequence(link,
+			DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
 }
 
 static void enable_hpo_dp_fpga_link_output(struct dc_link *link,
@@ -201,7 +203,7 @@ static void set_hpo_dp_link_test_pattern(struct dc_link *link,
 {
 	link_res->hpo_dp_link_enc->funcs->set_link_test_pattern(
 			link_res->hpo_dp_link_enc, tp_params);
-	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
 
 static void set_hpo_dp_lane_settings(struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index a51f761ba018..13e5222249ec 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -876,7 +876,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		return true;
 	}
 
-	if (!dc_link_detect_connection_type(link, &new_connection_type)) {
+	if (!link_detect_connection_type(link, &new_connection_type)) {
 		BREAK_TO_DEBUGGER();
 		return false;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.h b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
index 4b1731c4fd3d..7da05078721e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
@@ -26,11 +26,18 @@
 #ifndef __DC_LINK_DETECTION_H__
 #define __DC_LINK_DETECTION_H__
 #include "link.h"
+bool link_detect(struct dc_link *link, enum dc_detect_reason reason);
+bool link_detect_connection_type(struct dc_link *link,
+		enum dc_connection_type *type);
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
 		const uint8_t *edid,
 		int len,
 		struct dc_sink_init_data *init_data);
 void link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink);
-
+bool link_reset_cur_dp_mst_topology(struct dc_link *link);
+const struct dc_link_status *link_get_status(const struct dc_link *link);
+bool link_is_hdcp14(struct dc_link *link, enum signal_type signal);
+bool link_is_hdcp22(struct dc_link *link, enum signal_type signal);
+void link_clear_dprx_states(struct dc_link *link);
 #endif /* __DC_LINK_DETECTION_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 00d441cacbff..020d668ce09e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -37,6 +37,7 @@
 
 #include "link_dpms.h"
 #include "link_hwss.h"
+#include "link_validation.h"
 #include "accessories/link_fpga.h"
 #include "accessories/link_dp_trace.h"
 #include "protocols/link_dpcd.h"
@@ -672,7 +673,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 
 	/* stream encoder index */
 	config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
+	if (dp_is_128b_132b_signal(pipe_ctx))
 		config.stream_enc_idx =
 				pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
 
@@ -681,7 +682,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 
 	/* link encoder index */
 	config.link_enc_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
+	if (dp_is_128b_132b_signal(pipe_ctx))
 		config.link_enc_idx = pipe_ctx->link_res.hpo_dp_link_enc->inst;
 
 	/* dio output index is dpia index for DPIA endpoint & dcio index by default */
@@ -702,7 +703,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 	config.assr_enabled = (panel_mode == DP_PANEL_MODE_EDP) ? 1 : 0;
 	config.mst_enabled = (pipe_ctx->stream->signal ==
 			SIGNAL_TYPE_DISPLAY_PORT_MST) ? 1 : 0;
-	config.dp2_enabled = link_is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
+	config.dp2_enabled = dp_is_128b_132b_signal(pipe_ctx) ? 1 : 0;
 	config.usb4_enabled = (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) ?
 			1 : 0;
 	config.dpms_off = dpms_off;
@@ -816,7 +817,7 @@ void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 		/* Enable DSC in encoder */
 		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
-				&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
+				&& !dp_is_128b_132b_signal(pipe_ctx)) {
 			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
 			dsc_optc_config_log(dsc, &dsc_optc_cfg);
 			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
@@ -842,7 +843,7 @@ void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 		/* disable DSC in stream encoder */
 		if (dc_is_dp_signal(stream->signal)) {
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
+			if (dp_is_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										false,
@@ -901,7 +902,7 @@ bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx, bool enable, bool immedi
 		memcpy(&stream->dsc_packed_pps[0], &dsc_packed_pps[0], sizeof(stream->dsc_packed_pps));
 		if (dc_is_dp_signal(stream->signal)) {
 			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
+			if (dp_is_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										true,
@@ -918,7 +919,7 @@ bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx, bool enable, bool immedi
 		/* disable DSC PPS in stream encoder */
 		memset(&stream->dsc_packed_pps[0], 0, sizeof(stream->dsc_packed_pps));
 		if (dc_is_dp_signal(stream->signal)) {
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
+			if (dp_is_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										false,
@@ -1043,7 +1044,7 @@ static void log_vcp_x_y(const struct dc_link *link, struct fixed31_32 avg_time_s
 static struct fixed31_32 get_pbn_per_slot(struct dc_stream_state *stream)
 {
 	struct fixed31_32 mbytes_per_sec;
-	uint32_t link_rate_in_mbytes_per_sec = dc_link_bandwidth_kbps(stream->link,
+	uint32_t link_rate_in_mbytes_per_sec = dp_link_bandwidth_kbps(stream->link,
 			&stream->link->cur_link_settings);
 	link_rate_in_mbytes_per_sec /= 8000; /* Kbits to MBytes */
 
@@ -1534,7 +1535,7 @@ struct fixed31_32 link_calculate_sst_avg_time_slots_per_mtp(
 {
 	struct fixed31_32 link_bw_effective =
 			dc_fixpt_from_int(
-					dc_link_bandwidth_kbps(link, &link->cur_link_settings));
+					dp_link_bandwidth_kbps(link, &link->cur_link_settings));
 	struct fixed31_32 timeslot_bw_effective =
 			dc_fixpt_div_int(link_bw_effective, MAX_MTP_SLOT_COUNT);
 	struct fixed31_32 timing_bw =
@@ -2122,7 +2123,7 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 		set_default_brightness_aux(link); // TODO: use cached if known
 		if (link->dpcd_sink_ext_caps.bits.oled == 1)
 			msleep(bl_oled_enable_delay);
-		link_backlight_enable_aux(link, true);
+		edp_backlight_enable_aux(link, true);
 	}
 
 	return status;
@@ -2242,7 +2243,7 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 
 	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
+	if (dp_is_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
@@ -2273,7 +2274,7 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 		deallocate_mst_payload(pipe_ctx);
 	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			link_is_dp_128b_132b_signal(pipe_ctx))
+			dp_is_128b_132b_signal(pipe_ctx))
 		update_sst_payload(pipe_ctx, false);
 
 	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
@@ -2302,7 +2303,7 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 	}
 
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			!link_is_dp_128b_132b_signal(pipe_ctx)) {
+			!dp_is_128b_132b_signal(pipe_ctx)) {
 
 		/* In DP1.x SST mode, our encoder will go to TPS1
 		 * when link is on but stream is off.
@@ -2322,7 +2323,7 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
 			link_set_dsc_enable(pipe_ctx, false);
 	}
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+	if (dp_is_128b_132b_signal(pipe_ctx)) {
 		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
 			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
 	}
@@ -2346,7 +2347,7 @@ void link_set_dpms_on(
 
 	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
 
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
+	if (dp_is_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
@@ -2368,7 +2369,7 @@ void link_set_dpms_on(
 	ASSERT(link_enc);
 
 	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
-			&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
+			&& !dp_is_128b_132b_signal(pipe_ctx)) {
 		if (link_enc)
 			link_enc->funcs->setup(
 				link_enc,
@@ -2378,7 +2379,7 @@ void link_set_dpms_on(
 	pipe_ctx->stream->link->link_state_valid = true;
 
 	if (pipe_ctx->stream_res.tg->funcs->set_out_mux) {
-		if (link_is_dp_128b_132b_signal(pipe_ctx))
+		if (dp_is_128b_132b_signal(pipe_ctx))
 			otg_out_dest = OUT_MUX_HPO_DP;
 		else
 			otg_out_dest = OUT_MUX_DIO;
@@ -2401,7 +2402,7 @@ void link_set_dpms_on(
 		dc->hwss.update_info_frame(pipe_ctx);
 
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-			link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+			dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
 
 		/* Do not touch link on seamless boot optimization. */
 		if (pipe_ctx->stream->apply_seamless_boot_optimization) {
@@ -2476,7 +2477,7 @@ void link_set_dpms_on(
 		 * from transmitter control.
 		 */
 		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
-				link_is_dp_128b_132b_signal(pipe_ctx)))
+				dp_is_128b_132b_signal(pipe_ctx)))
 			if (link_enc)
 				link_enc->funcs->setup(
 					link_enc,
@@ -2496,7 +2497,7 @@ void link_set_dpms_on(
 		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 			allocate_mst_payload(pipe_ctx);
 		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-				link_is_dp_128b_132b_signal(pipe_ctx))
+				dp_is_128b_132b_signal(pipe_ctx))
 			update_sst_payload(pipe_ctx, true);
 
 		dc->hwss.unblank_stream(pipe_ctx,
@@ -2512,7 +2513,7 @@ void link_set_dpms_on(
 		dc->hwss.enable_audio_stream(pipe_ctx);
 
 	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-		if (link_is_dp_128b_132b_signal(pipe_ctx))
+		if (dp_is_128b_132b_signal(pipe_ctx))
 			dp_fpga_hpo_enable_link_and_stream(state, pipe_ctx);
 		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
 				dc_is_virtual_signal(pipe_ctx->stream->signal))
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.h b/drivers/gpu/drm/amd/display/dc/link/link_dpms.h
index 33d312dabdb8..9398f9c1666a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.h
@@ -27,14 +27,27 @@
 #define __DC_LINK_DPMS_H__
 
 #include "link.h"
-bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx,
-		bool enable, bool immediate_update);
-struct fixed31_32 link_calculate_sst_avg_time_slots_per_mtp(
-		const struct dc_stream_state *stream,
-		const struct dc_link *link);
+void link_set_dpms_on(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx);
+void link_set_dpms_off(struct pipe_ctx *pipe_ctx);
+void link_resume(struct dc_link *link);
+void link_blank_all_dp_displays(struct dc *dc);
+void link_blank_all_edp_displays(struct dc *dc);
+void link_blank_dp_stream(struct dc_link *link, bool hw_init);
 void link_set_all_streams_dpms_off_for_link(struct dc_link *link);
 void link_get_master_pipes_with_dpms_on(const struct dc_link *link,
 		struct dc_state *state,
 		uint8_t *count,
 		struct pipe_ctx *pipes[MAX_PIPES]);
+enum dc_status link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+enum dc_status link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx,
+		bool enable, bool immediate_update);
+struct fixed31_32 link_calculate_sst_avg_time_slots_per_mtp(
+		const struct dc_stream_state *stream,
+		const struct dc_link *link);
+void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable);
+bool link_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
+bool link_update_dsc_config(struct pipe_ctx *pipe_ctx);
 #endif /* __DC_LINK_DPMS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index d9ce83f0bbef..995032a341b3 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -28,6 +28,9 @@
  */
 #include "link_factory.h"
 #include "link_detection.h"
+#include "link_resource.h"
+#include "link_validation.h"
+#include "link_dpms.h"
 #include "accessories/link_dp_cts.h"
 #include "accessories/link_dp_trace.h"
 #include "accessories/link_fpga.h"
@@ -49,69 +52,248 @@
 	DC_LOG_HW_HOTPLUG(  \
 		__VA_ARGS__)
 
-static struct link_service link_srv = {
-	/* Detection */
-	.add_remote_sink = link_add_remote_sink,
-	.remove_remote_sink = link_remove_remote_sink,
-	.get_hpd_state = link_get_hpd_state,
-	.enable_hpd = link_enable_hpd,
-	.disable_hpd = link_disable_hpd,
-	.enable_hpd_filter = link_enable_hpd_filter,
-
-	/* DDC */
-	.aux_transfer_raw = link_aux_transfer_raw,
-
-	/* DP Capability */
-	.dp_is_sink_present = dp_is_sink_present,
-	.dp_is_fec_supported = dp_is_fec_supported,
-	.dp_get_max_link_enc_cap = dp_get_max_link_enc_cap,
-	.dp_get_verified_link_cap = dp_get_verified_link_cap,
-	.dp_should_enable_fec = dp_should_enable_fec,
-	.mst_decide_link_encoding_format = mst_decide_link_encoding_format,
-	.edp_decide_link_settings = edp_decide_link_settings,
-	.bw_kbps_from_raw_frl_link_rate_data = link_bw_kbps_from_raw_frl_link_rate_data,
-	.dp_overwrite_extended_receiver_cap = dp_overwrite_extended_receiver_cap,
-	.dp_decide_lttpr_mode = dp_decide_lttpr_mode,
-
-	/* DP DPIA/PHY */
-	.dpia_handle_usb4_bandwidth_allocation_for_link = dpia_handle_usb4_bandwidth_allocation_for_link,
-	.dpia_handle_bw_alloc_response = dpia_handle_bw_alloc_response,
-	/* DP IRQ Handler */
-	.dp_parse_link_loss_status = dp_parse_link_loss_status,
-	.dp_should_allow_hpd_rx_irq = dp_should_allow_hpd_rx_irq,
-	.dp_handle_link_loss = dp_handle_link_loss,
-	.dp_read_hpd_rx_irq_data = dp_read_hpd_rx_irq_data,
-	.dp_handle_hpd_rx_irq = dp_handle_hpd_rx_irq,
-	.dpcd_write_rx_power_ctrl = dpcd_write_rx_power_ctrl,
-
-	/* eDP Panel Control */
-	.edp_panel_backlight_power_on = edp_panel_backlight_power_on,
-	.edp_get_backlight_level = edp_get_backlight_level,
-	.edp_get_backlight_level_nits = edp_get_backlight_level_nits,
-	.edp_set_backlight_level = edp_set_backlight_level,
-	.edp_set_backlight_level_nits = edp_set_backlight_level_nits,
-	.edp_get_target_backlight_pwm = edp_get_target_backlight_pwm,
-	.edp_get_psr_state = edp_get_psr_state,
-	.edp_set_psr_allow_active = edp_set_psr_allow_active,
-	.edp_setup_psr = edp_setup_psr,
-	.edp_wait_for_t12 = edp_wait_for_t12,
-
-	/* DP CTS */
-	.dp_handle_automated_test = dp_handle_automated_test,
-	.dp_set_test_pattern = dp_set_test_pattern,
-	.dp_set_preferred_link_settings = dp_set_preferred_link_settings,
-	.dp_set_preferred_training_settings = dp_set_preferred_training_settings,
-
-	/* DP Trace */
-	.dp_trace_is_initialized = dp_trace_is_initialized,
-	.dp_trace_set_is_logged_flag = dp_trace_set_is_logged_flag,
-	.dp_trace_is_logged = dp_trace_is_logged,
-	.dp_trace_get_lt_end_timestamp = dp_trace_get_lt_end_timestamp,
-	.dp_trace_get_lt_counts = dp_trace_get_lt_counts,
-	.dp_trace_get_link_loss_count = dp_trace_get_link_loss_count,
-};
-
-static enum transmitter translate_encoder_to_transmitter(struct graphics_object_id encoder)
+/* link factory owns the creation/destruction of link structures. */
+static void construct_link_service_factory(struct link_service *link_srv)
+{
+
+	link_srv->create_link = link_create;
+	link_srv->destroy_link = link_destroy;
+}
+
+/* link_detection manages link detection states and receiver states by using
+ * various link protocols. It also provides helper functions to interpret
+ * certain capabilities or status based on the states it manages or retrieve
+ * them directly from connected receivers.
+ */
+static void construct_link_service_detection(struct link_service *link_srv)
+{
+	link_srv->detect_link = link_detect;
+	link_srv->detect_connection_type = link_detect_connection_type;
+	link_srv->add_remote_sink = link_add_remote_sink;
+	link_srv->remove_remote_sink = link_remove_remote_sink;
+	link_srv->get_hpd_state = link_get_hpd_state;
+	link_srv->get_hpd_gpio = link_get_hpd_gpio;
+	link_srv->enable_hpd = link_enable_hpd;
+	link_srv->disable_hpd = link_disable_hpd;
+	link_srv->enable_hpd_filter = link_enable_hpd_filter;
+	link_srv->reset_cur_dp_mst_topology = link_reset_cur_dp_mst_topology;
+	link_srv->get_status = link_get_status;
+	link_srv->is_hdcp1x_supported = link_is_hdcp14;
+	link_srv->is_hdcp2x_supported = link_is_hdcp22;
+	link_srv->clear_dprx_states = link_clear_dprx_states;
+}
+
+/* link resource implements accessors to link resource. */
+static void construct_link_service_resource(struct link_service *link_srv)
+{
+	link_srv->get_cur_res_map = link_get_cur_res_map;
+	link_srv->restore_res_map = link_restore_res_map;
+	link_srv->get_cur_link_res = link_get_cur_link_res;
+}
+
+/* link validation owns timing validation against various link limitations. (ex.
+ * link bandwidth, receiver capability or our hardware capability) It also
+ * provides helper functions exposing bandwidth formulas used in validation.
+ */
+static void construct_link_service_validation(struct link_service *link_srv)
+{
+	link_srv->validate_mode_timing = link_validate_mode_timing;
+	link_srv->dp_link_bandwidth_kbps = dp_link_bandwidth_kbps;
+}
+
+/* link dpms owns the programming sequence of stream's dpms state associated
+ * with the link and link's enable/disable sequences as result of the stream's
+ * dpms state change.
+ */
+static void construct_link_service_dpms(struct link_service *link_srv)
+{
+	link_srv->set_dpms_on = link_set_dpms_on;
+	link_srv->set_dpms_off = link_set_dpms_off;
+	link_srv->resume = link_resume;
+	link_srv->blank_all_dp_displays = link_blank_all_dp_displays;
+	link_srv->blank_all_edp_displays = link_blank_all_edp_displays;
+	link_srv->blank_dp_stream = link_blank_dp_stream;
+	link_srv->increase_mst_payload = link_increase_mst_payload;
+	link_srv->reduce_mst_payload = link_reduce_mst_payload;
+	link_srv->set_dsc_on_stream = link_set_dsc_on_stream;
+	link_srv->set_dsc_enable = link_set_dsc_enable;
+	link_srv->update_dsc_config = link_update_dsc_config;
+}
+
+/* link ddc implements generic display communication protocols such as i2c, aux
+ * and scdc. It should not contain any specific applications of these
+ * protocols such as display capability query, detection, or handshaking such as
+ * link training.
+ */
+static void construct_link_service_ddc(struct link_service *link_srv)
+{
+	link_srv->create_ddc_service = link_create_ddc_service;
+	link_srv->destroy_ddc_service = link_destroy_ddc_service;
+	link_srv->query_ddc_data = link_query_ddc_data;
+	link_srv->aux_transfer_raw = link_aux_transfer_raw;
+	link_srv->aux_transfer_with_retries_no_mutex =
+			link_aux_transfer_with_retries_no_mutex;
+	link_srv->is_in_aux_transaction_mode = link_is_in_aux_transaction_mode;
+	link_srv->get_aux_defer_delay = link_get_aux_defer_delay;
+}
+
+/* link dp capability implements dp specific link capability retrieval sequence.
+ * It is responsible for retrieving, parsing, overriding, deciding capability
+ * obtained from dp link. Link capability consists of encoders, DPRXs, cables,
+ * retimers, usb and all other possible backend capabilities.
+ */
+static void construct_link_service_dp_capability(struct link_service *link_srv)
+{
+	link_srv->dp_is_sink_present = dp_is_sink_present;
+	link_srv->dp_is_fec_supported = dp_is_fec_supported;
+	link_srv->dp_is_128b_132b_signal = dp_is_128b_132b_signal;
+	link_srv->dp_get_max_link_enc_cap = dp_get_max_link_enc_cap;
+	link_srv->dp_get_verified_link_cap = dp_get_verified_link_cap;
+	link_srv->dp_get_encoding_format = link_dp_get_encoding_format;
+	link_srv->dp_should_enable_fec = dp_should_enable_fec;
+	link_srv->dp_decide_link_settings = link_decide_link_settings;
+	link_srv->mst_decide_link_encoding_format =
+			mst_decide_link_encoding_format;
+	link_srv->edp_decide_link_settings = edp_decide_link_settings;
+	link_srv->bw_kbps_from_raw_frl_link_rate_data =
+			link_bw_kbps_from_raw_frl_link_rate_data;
+	link_srv->dp_overwrite_extended_receiver_cap =
+			dp_overwrite_extended_receiver_cap;
+	link_srv->dp_decide_lttpr_mode = dp_decide_lttpr_mode;
+}
+
+/* link dp phy/dpia implements basic dp phy/dpia functionality such as
+ * enable/disable output and set lane/drive settings. It is responsible for
+ * maintaining and update software state representing current phy/dpia status
+ * such as current link settings.
+ */
+static void construct_link_service_dp_phy_or_dpia(struct link_service *link_srv)
+{
+	link_srv->dpia_handle_usb4_bandwidth_allocation_for_link =
+			dpia_handle_usb4_bandwidth_allocation_for_link;
+	link_srv->dpia_handle_bw_alloc_response = dpia_handle_bw_alloc_response;
+	link_srv->dp_set_drive_settings = dp_set_drive_settings;
+	link_srv->dpcd_write_rx_power_ctrl = dpcd_write_rx_power_ctrl;
+}
+
+/* link dp irq handler implements DP HPD short pulse handling sequence according
+ * to DP specifications
+ */
+static void construct_link_service_dp_irq_handler(struct link_service *link_srv)
+{
+	link_srv->dp_parse_link_loss_status = dp_parse_link_loss_status;
+	link_srv->dp_should_allow_hpd_rx_irq = dp_should_allow_hpd_rx_irq;
+	link_srv->dp_handle_link_loss = dp_handle_link_loss;
+	link_srv->dp_read_hpd_rx_irq_data = dp_read_hpd_rx_irq_data;
+	link_srv->dp_handle_hpd_rx_irq = dp_handle_hpd_rx_irq;
+}
+
+/* link edp panel control implements retrieval and configuration of eDP panel
+ * features such as PSR and ABM and it also manages specs defined eDP panel
+ * power sequences.
+ */
+static void construct_link_service_edp_panel_control(struct link_service *link_srv)
+{
+	link_srv->edp_panel_backlight_power_on = edp_panel_backlight_power_on;
+	link_srv->edp_get_backlight_level = edp_get_backlight_level;
+	link_srv->edp_get_backlight_level_nits = edp_get_backlight_level_nits;
+	link_srv->edp_set_backlight_level = edp_set_backlight_level;
+	link_srv->edp_set_backlight_level_nits = edp_set_backlight_level_nits;
+	link_srv->edp_get_target_backlight_pwm = edp_get_target_backlight_pwm;
+	link_srv->edp_get_psr_state = edp_get_psr_state;
+	link_srv->edp_set_psr_allow_active = edp_set_psr_allow_active;
+	link_srv->edp_setup_psr = edp_setup_psr;
+	link_srv->edp_set_sink_vtotal_in_psr_active =
+			edp_set_sink_vtotal_in_psr_active;
+	link_srv->edp_get_psr_residency = edp_get_psr_residency;
+	link_srv->edp_wait_for_t12 = edp_wait_for_t12;
+	link_srv->edp_is_ilr_optimization_required =
+			edp_is_ilr_optimization_required;
+	link_srv->edp_backlight_enable_aux = edp_backlight_enable_aux;
+	link_srv->edp_add_delay_for_T9 = edp_add_delay_for_T9;
+	link_srv->edp_receiver_ready_T9 = edp_receiver_ready_T9;
+	link_srv->edp_receiver_ready_T7 = edp_receiver_ready_T7;
+	link_srv->edp_power_alpm_dpcd_enable = edp_power_alpm_dpcd_enable;
+}
+
+/* link dp cts implements dp compliance test automation protocols and manual
+ * testing interfaces for debugging and certification purpose.
+ */
+static void construct_link_service_dp_cts(struct link_service *link_srv)
+{
+	link_srv->dp_handle_automated_test = dp_handle_automated_test;
+	link_srv->dp_set_test_pattern = dp_set_test_pattern;
+	link_srv->dp_set_preferred_link_settings =
+			dp_set_preferred_link_settings;
+	link_srv->dp_set_preferred_training_settings =
+			dp_set_preferred_training_settings;
+}
+
+/* link dp trace implements tracing interfaces for tracking major dp sequences
+ * including execution status and timestamps
+ */
+static void construct_link_service_dp_trace(struct link_service *link_srv)
+{
+	link_srv->dp_trace_is_initialized = dp_trace_is_initialized;
+	link_srv->dp_trace_set_is_logged_flag = dp_trace_set_is_logged_flag;
+	link_srv->dp_trace_is_logged = dp_trace_is_logged;
+	link_srv->dp_trace_get_lt_end_timestamp = dp_trace_get_lt_end_timestamp;
+	link_srv->dp_trace_get_lt_counts = dp_trace_get_lt_counts;
+	link_srv->dp_trace_get_link_loss_count = dp_trace_get_link_loss_count;
+	link_srv->dp_trace_set_edp_power_timestamp =
+			dp_trace_set_edp_power_timestamp;
+	link_srv->dp_trace_get_edp_poweron_timestamp =
+			dp_trace_get_edp_poweron_timestamp;
+	link_srv->dp_trace_get_edp_poweroff_timestamp =
+			dp_trace_get_edp_poweroff_timestamp;
+	link_srv->dp_trace_source_sequence = dp_trace_source_sequence;
+}
+
+static void construct_link_service(struct link_service *link_srv)
+{
+	/* All link service functions should fall under some sub categories.
+	 * If a new function doesn't perfectly fall under an existing sub
+	 * category, it must be that you are either adding a whole new aspect of
+	 * responsibility to link service or something doesn't belong to link
+	 * service. In that case please contact the arch owner to arrange a
+	 * design review meeting.
+	 */
+	construct_link_service_factory(link_srv);
+	construct_link_service_detection(link_srv);
+	construct_link_service_resource(link_srv);
+	construct_link_service_validation(link_srv);
+	construct_link_service_dpms(link_srv);
+	construct_link_service_ddc(link_srv);
+	construct_link_service_dp_capability(link_srv);
+	construct_link_service_dp_phy_or_dpia(link_srv);
+	construct_link_service_dp_irq_handler(link_srv);
+	construct_link_service_edp_panel_control(link_srv);
+	construct_link_service_dp_cts(link_srv);
+	construct_link_service_dp_trace(link_srv);
+}
+
+struct link_service *link_create_link_service(void)
+{
+	struct link_service *link_srv = kzalloc(sizeof(*link_srv), GFP_KERNEL);
+
+	if (link_srv == NULL)
+		goto fail;
+
+	construct_link_service(link_srv);
+
+	return link_srv;
+fail:
+	return NULL;
+}
+
+void link_destroy_link_service(struct link_service **link_srv)
+{
+	kfree(*link_srv);
+	*link_srv = NULL;
+}
+
+static enum transmitter translate_encoder_to_transmitter(
+		struct graphics_object_id encoder)
 {
 	switch (encoder.id) {
 	case ENCODER_ID_INTERNAL_UNIPHY:
@@ -646,8 +828,3 @@ void link_destroy(struct dc_link **link)
 	kfree(*link);
 	*link = NULL;
 }
-
-const struct link_service *link_get_link_service(void)
-{
-	return &link_srv;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.h b/drivers/gpu/drm/amd/display/dc/link/link_factory.h
index 5b846147c4a6..e96220d48d03 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.h
@@ -25,5 +25,7 @@
 #ifndef __LINK_FACTORY_H__
 #define __LINK_FACTORY_H__
 #include "link.h"
+struct dc_link *link_create(const struct link_init_data *init_params);
+void link_destroy(struct dc_link **link);
 
 #endif /* __LINK_FACTORY_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_resource.h b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
index 68dfbfc973cc..1907bda3cb6e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
@@ -25,4 +25,8 @@
 #ifndef __LINK_RESOURCE_H__
 #define __LINK_RESOURCE_H__
 #include "link.h"
+void link_get_cur_res_map(const struct dc *dc, uint32_t *map);
+void link_restore_res_map(const struct dc *dc, uint32_t *map);
+void link_get_cur_link_res(const struct dc_link *link,
+		struct link_resource *link_res);
 #endif /* __LINK_RESOURCE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
index 62aa5f6b1f0c..9a5010f86003 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_validation.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
@@ -255,8 +255,7 @@ uint32_t dp_link_bandwidth_kbps(
 	return link_rate_per_lane_kbps * link_settings->lane_count / 10000 * total_data_bw_efficiency_x10000;
 }
 
-uint32_t link_timing_bandwidth_kbps(
-	const struct dc_crtc_timing *timing)
+uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing)
 {
 	uint32_t bits_per_channel = 0;
 	uint32_t kbps;
@@ -337,7 +336,7 @@ static bool dp_validate_mode_timing(
 	*/
 
 	req_bw = dc_bandwidth_in_kbps_from_timing(timing);
-	max_bw = dc_link_bandwidth_kbps(link, link_setting);
+	max_bw = dp_link_bandwidth_kbps(link, link_setting);
 
 	if (req_bw <= max_bw) {
 		/* remember the biggest mode here, during
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.h b/drivers/gpu/drm/amd/display/dc/link/link_validation.h
index ab6a44f50032..2191d3a4950c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_validation.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.h
@@ -25,4 +25,11 @@
 #ifndef __LINK_VALIDATION_H__
 #define __LINK_VALIDATION_H__
 #include "link.h"
+enum dc_status link_validate_mode_timing(
+		const struct dc_stream_state *stream,
+		struct dc_link *link,
+		const struct dc_crtc_timing *timing);
+uint32_t dp_link_bandwidth_kbps(
+	const struct dc_link *link,
+	const struct dc_link_settings *link_settings);
 #endif /* __LINK_VALIDATION_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
index f002fa01508e..860ef15d7f1b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
@@ -37,13 +37,41 @@
 
 #define EDID_SEGMENT_SIZE 256
 
+struct ddc_service *link_create_ddc_service(
+		struct ddc_service_init_data *ddc_init_data);
+
+void link_destroy_ddc_service(struct ddc_service **ddc);
+
 void set_ddc_transaction_type(
 		struct ddc_service *ddc,
 		enum ddc_transaction_type type);
 
+uint32_t link_get_aux_defer_delay(struct ddc_service *ddc);
+
+bool link_is_in_aux_transaction_mode(struct ddc_service *ddc);
+
 bool try_to_configure_aux_timeout(struct ddc_service *ddc,
 		uint32_t timeout);
 
+bool link_query_ddc_data(
+		struct ddc_service *ddc,
+		uint32_t address,
+		uint8_t *write_buf,
+		uint32_t write_size,
+		uint8_t *read_buf,
+		uint32_t read_size);
+
+/* Attempt to submit an aux payload, retrying on timeouts, defers, and busy
+ * states as outlined in the DP spec.  Returns true if the request was
+ * successful.
+ *
+ * NOTE: The function requires explicit mutex on DM side in order to prevent
+ * potential race condition. DC components should call the dpcd read/write
+ * function in dm_helpers in order to access dpcd safely
+ */
+bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
+		struct aux_payload *payload);
+
 void write_scdc_data(
 		struct ddc_service *ddc_service,
 		uint32_t pix_clk,
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 75e1a687608a..e9bcb35ae185 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -347,7 +347,7 @@ bool dp_should_enable_fec(const struct dc_link *link)
 	return !force_disable && dp_is_fec_supported(link);
 }
 
-bool link_is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
+bool dp_is_128b_132b_signal(struct pipe_ctx *pipe_ctx)
 {
 	/* If this assert is hit then we have a link encoder dynamic management issue */
 	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
@@ -656,7 +656,7 @@ static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_setting
 	 */
 	while (current_link_setting.link_rate <=
 			link->verified_link_cap.link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
+		link_bw = dp_link_bandwidth_kbps(
 				link,
 				&current_link_setting);
 		if (req_bw <= link_bw) {
@@ -712,7 +712,7 @@ bool edp_decide_link_settings(struct dc_link *link,
 	 */
 	while (current_link_setting.link_rate <=
 			link->verified_link_cap.link_rate) {
-		link_bw = dc_link_bandwidth_kbps(
+		link_bw = dp_link_bandwidth_kbps(
 				link,
 				&current_link_setting);
 		if (req_bw <= link_bw) {
@@ -891,7 +891,7 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 	struct dc_link_settings *link_setting)
 {
 	struct dc_link *link = stream->link;
-	uint32_t req_bw = link_timing_bandwidth_kbps(&stream->timing);
+	uint32_t req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
 
 	memset(link_setting, 0, sizeof(*link_setting));
 
@@ -924,7 +924,7 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 
 				tmp_link_setting.link_rate = LINK_RATE_UNKNOWN;
 				tmp_timing.flags.DSC = 0;
-				orig_req_bw = link_timing_bandwidth_kbps(&tmp_timing);
+				orig_req_bw = dc_bandwidth_in_kbps_from_timing(&tmp_timing);
 				edp_decide_link_settings(link, &tmp_link_setting, orig_req_bw);
 				max_link_rate = tmp_link_setting.link_rate;
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.h
index 62980ae17d41..8f0ce97f2362 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.h
@@ -40,6 +40,9 @@ bool dp_get_max_link_enc_cap(const struct dc_link *link,
 const struct dc_link_settings *dp_get_verified_link_cap(
 		const struct dc_link *link);
 
+enum dp_link_encoding link_dp_get_encoding_format(
+		const struct dc_link_settings *link_settings);
+
 enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link);
 
 /* Convert PHY repeater count read from DPCD uint8_t. */
@@ -59,12 +62,18 @@ void dpcd_write_cable_id_to_dprx(struct dc_link *link);
 
 bool dp_should_enable_fec(const struct dc_link *link);
 
+bool dp_is_128b_132b_signal(struct pipe_ctx *pipe_ctx);
+
 /* Initialize output parameter lt_settings. */
 void dp_decide_training_settings(
 	struct dc_link *link,
 	const struct dc_link_settings *link_setting,
 	struct link_training_settings *lt_settings);
 
+bool link_decide_link_settings(
+	struct dc_stream_state *stream,
+	struct dc_link_settings *link_setting);
+
 bool edp_decide_link_settings(struct dc_link *link,
 		struct dc_link_settings *link_setting, uint32_t req_bw);
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
index 207bff2ec32e..1eb0619d6710 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
@@ -44,6 +44,11 @@ void dp_set_hw_lane_settings(
 		const struct link_training_settings *link_settings,
 		uint32_t offset);
 
+void dp_set_drive_settings(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings);
+
 enum dc_status dp_set_fec_ready(struct dc_link *link,
 		const struct link_resource *link_res, bool ready);
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index eee1853f6b32..a9025671ee4a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -42,6 +42,7 @@
 #include "link_dp_capability.h"
 #include "link_edp_panel_control.h"
 #include "link/link_detection.h"
+#include "link/link_validation.h"
 #include "atomfirmware.h"
 #include "link_enc_cfg.h"
 #include "resource.h"
@@ -861,8 +862,9 @@ static enum dc_status configure_lttpr_mode_non_transparent(
 	uint8_t repeater_id;
 	enum dc_status result = DC_ERROR_UNEXPECTED;
 	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
+	const struct dc *dc = link->dc;
 
-	enum dp_link_encoding encoding = link_dp_get_encoding_format(&lt_settings->link_settings);
+	enum dp_link_encoding encoding = dc->link_srv->dp_get_encoding_format(&lt_settings->link_settings);
 
 	if (encoding == DP_8b_10b_ENCODING) {
 		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
@@ -1675,7 +1677,7 @@ bool perform_link_training_with_retries(
 			/* Flag if reduced link bandwidth no longer meets stream requirements or fallen back to
 			 * minimum link bandwidth.
 			 */
-			req_bw = link_timing_bandwidth_kbps(&stream->timing);
+			req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
 			link_bw = dp_link_bandwidth_kbps(link, &cur_link_settings);
 			is_link_bw_low = (req_bw > link_bw);
 			is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index 4d78ac932845..93a6bbe954bb 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -201,7 +201,7 @@ bool edp_get_backlight_level_nits(struct dc_link *link,
 	return true;
 }
 
-bool link_backlight_enable_aux(struct dc_link *link, bool enable)
+bool edp_backlight_enable_aux(struct dc_link *link, bool enable)
 {
 	uint8_t backlight_enable = enable ? 1 : 0;
 
@@ -249,7 +249,7 @@ bool set_default_brightness_aux(struct dc_link *link)
 	return false;
 }
 
-bool link_is_edp_ilr_optimization_required(struct dc_link *link,
+bool edp_is_ilr_optimization_required(struct dc_link *link,
 		struct dc_crtc_timing *crtc_timing)
 {
 	struct dc_link_settings link_setting;
@@ -282,7 +282,7 @@ bool link_is_edp_ilr_optimization_required(struct dc_link *link,
 	core_link_read_dpcd(link, DP_LANE_COUNT_SET,
 				&lane_count_set.raw, sizeof(lane_count_set));
 
-	req_bw = link_timing_bandwidth_kbps(crtc_timing);
+	req_bw = dc_bandwidth_in_kbps_from_timing(crtc_timing);
 
 	if (!crtc_timing->flags.DSC)
 		edp_decide_link_settings(link, &link_setting, req_bw);
@@ -322,13 +322,13 @@ bool edp_wait_for_t12(struct dc_link *link)
 	return false;
 }
 
-void link_edp_add_delay_for_T9(struct dc_link *link)
+void edp_add_delay_for_T9(struct dc_link *link)
 {
 	if (link && link->panel_config.pps.extra_delay_backlight_off > 0)
 		fsleep(link->panel_config.pps.extra_delay_backlight_off * 1000);
 }
 
-bool link_edp_receiver_ready_T9(struct dc_link *link)
+bool edp_receiver_ready_T9(struct dc_link *link)
 {
 	unsigned int tries = 0;
 	unsigned char sinkstatus = 0;
@@ -353,7 +353,7 @@ bool link_edp_receiver_ready_T9(struct dc_link *link)
 	return result;
 }
 
-bool link_edp_receiver_ready_T7(struct dc_link *link)
+bool edp_receiver_ready_T7(struct dc_link *link)
 {
 	unsigned char sinkstatus = 0;
 	unsigned char edpRev = 0;
@@ -388,7 +388,7 @@ bool link_edp_receiver_ready_T7(struct dc_link *link)
 	return result;
 }
 
-bool link_power_alpm_dpcd_enable(struct dc_link *link, bool enable)
+bool edp_power_alpm_dpcd_enable(struct dc_link *link, bool enable)
 {
 	bool ret = false;
 	union dpcd_alpm_configuration alpm_config;
@@ -623,7 +623,7 @@ bool edp_setup_psr(struct dc_link *link,
 		sizeof(psr_configuration.raw));
 
 	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1) {
-		link_power_alpm_dpcd_enable(link, true);
+		edp_power_alpm_dpcd_enable(link, true);
 		psr_context->su_granularity_required =
 			psr_config->su_granularity_required;
 		psr_context->su_y_granularity =
@@ -752,7 +752,7 @@ bool edp_setup_psr(struct dc_link *link,
 
 }
 
-void link_get_psr_residency(const struct dc_link *link, uint32_t *residency)
+void edp_get_psr_residency(const struct dc_link *link, uint32_t *residency)
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmub_psr *psr = dc->res_pool->psr;
@@ -767,7 +767,7 @@ void link_get_psr_residency(const struct dc_link *link, uint32_t *residency)
 	else
 		*residency = 0;
 }
-bool link_set_sink_vtotal_in_psr_active(const struct dc_link *link, uint16_t psr_vtotal_idle, uint16_t psr_vtotal_su)
+bool edp_set_sink_vtotal_in_psr_active(const struct dc_link *link, uint16_t psr_vtotal_idle, uint16_t psr_vtotal_su)
 {
 	struct dc *dc = link->ctx->dc;
 	struct dmub_psr *psr = dc->res_pool->psr;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
index 4439598f9f7d..28f552080558 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
@@ -49,5 +49,15 @@ bool edp_set_psr_allow_active(struct dc_link *link, const bool *allow_active,
 bool edp_setup_psr(struct dc_link *link,
 		const struct dc_stream_state *stream, struct psr_config *psr_config,
 		struct psr_context *psr_context);
+bool edp_set_sink_vtotal_in_psr_active(const struct dc_link *link,
+       uint16_t psr_vtotal_idle, uint16_t psr_vtotal_su);
+void edp_get_psr_residency(const struct dc_link *link, uint32_t *residency);
 bool edp_wait_for_t12(struct dc_link *link);
+bool edp_is_ilr_optimization_required(struct dc_link *link,
+       struct dc_crtc_timing *crtc_timing);
+bool edp_backlight_enable_aux(struct dc_link *link, bool enable);
+void edp_add_delay_for_T9(struct dc_link *link);
+bool edp_receiver_ready_T9(struct dc_link *link);
+bool edp_receiver_ready_T7(struct dc_link *link);
+bool edp_power_alpm_dpcd_enable(struct dc_link *link, bool enable);
 #endif /* __DC_LINK_EDP_POWER_CONTROL_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.h
index bd471b63476e..4fb526b264f9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.h
@@ -45,6 +45,9 @@ bool program_hpd_filter(const struct dc_link *link);
 bool dpia_query_hpd_status(struct dc_link *link);
 bool query_hpd_status(struct dc_link *link, uint32_t *is_hpd_high);
 bool link_get_hpd_state(struct dc_link *link);
+struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
+		struct graphics_object_id link_id,
+		struct gpio_service *gpio_service);
 void link_enable_hpd(const struct dc_link *link);
 void link_disable_hpd(const struct dc_link *link);
 void link_enable_hpd_filter(struct dc_link *link, bool enable);
-- 
2.34.1

