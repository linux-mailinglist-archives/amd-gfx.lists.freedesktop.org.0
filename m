Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A6493647
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jan 2022 09:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F6E10E682;
	Wed, 19 Jan 2022 08:25:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6F910E67D
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jan 2022 08:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wrx0brfwiHdFqBIMTjZKWfb7w6MrXdbZ2RSgCuWkkTRgU7b/zxGyrUQXJ4L0A3Vli0MybGThyqOuLLA1JM16tYVzrFUQIbrHOWIhp9yaKSQzR9DPcQw3gaTlN18BLVE3tGWv6gtXN5NAOLByUDMM9Y/7n4bDFVGwUQ/KM11gVDmFDaLbjCSSS1h4LtjuRVdIFcRkheKs28VGPCrA2Uw35b8WM8qH68xHZ65jSB1Ns0nuFt3oLcG3Yb0RbHOQk9G+h5gmuJAuRs2LEfxNXMvKw8gD53tYnzwTQ+A0TJlHkXewCxShzN1symCUd/HTRbZpXs+lXZN5oLB7dioV378+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojNQLMFebGm2mSP+wkq78gRBravwHxYtkCCcGbyQlhM=;
 b=KPOGiwyPPouuBMI7wKIvoRrVSRRi/75vNiIqxnjyTv7+LBk0D+nYoyehnmYVnw6xK+TJ+cMVTT4Bk02nMJXcYoUonSWS9uyb7k/9UFgjbDC/i0sj5uRmO6BQLEcHdiJ5lgB2ag3BFNnx6JB4aG/IvJNF2j+NH4C12v+wWpiyKasmHSUFUpdHzrk1zn3G2FdYrmeKVLPzAAQILbmNoOrQLaCQNnca/cbtUwCVMnRSnJZ5yp0wvXhlun8P0bJ1AsFbX7LZ07ezA77N+P1rkwvu4rQzQYwkYIJV6L/dbHwgupHfsZZ7+x/goge7qv0aNmK7Ns0OaoXG5ByX4LScexNLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojNQLMFebGm2mSP+wkq78gRBravwHxYtkCCcGbyQlhM=;
 b=OZ62ixn5Gqgv7zPClZhnlnEfW8DYrtPnjoWTSwIphCv6Zki/GVLoJJIF34z1b0B8solLjbS5kpEwOADV6sYacQGQzCxUCFiqFSoOJXiEGPDKfOX66m6lKv6P+ePINUL+Ncs8RgQb5Jg6xCwATf13hjsFelqeBsJou/nThsApGTk=
Received: from BN9PR03CA0135.namprd03.prod.outlook.com (2603:10b6:408:fe::20)
 by MW2PR12MB2537.namprd12.prod.outlook.com (2603:10b6:907:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 08:25:17 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::ff) by BN9PR03CA0135.outlook.office365.com
 (2603:10b6:408:fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Wed, 19 Jan 2022 08:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 08:25:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 02:25:16 -0600
Received: from wayne-Celadon-CZN.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18
 via Frontend Transport; Wed, 19 Jan 2022 02:25:12 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amd/display: Drop DCN for DP2.x logic
Date: Wed, 19 Jan 2022 16:24:38 +0800
Message-ID: <20220119082443.1046810-4-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119082443.1046810-1-Wayne.Lin@amd.com>
References: <20220119082443.1046810-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 684950d9-4bac-462b-d1cf-08d9db253964
X-MS-TrafficTypeDiagnostic: MW2PR12MB2537:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB253734049F0175D5FA98CAD5FC599@MW2PR12MB2537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++V77Q805kcK2O+r2F0KNkKGkqeOUBFBUj6dWYYLRNytjyeSGD7YWZvQmtxfq5L5GgLw+E7RcjamNUO7RMRu1NURYCeJOsunCerPGgDIQPEJRqD6UVxjWUX+SXwiL9OOnrP7QAddQcGbX+mG8sWKrpHzWGGqvlPgRYcKw7v5+YngxsHlAP3rs6nCLZCwPML9HU9CNrXv/qypy1NUsA15TMC+YJIZdthfRhIL+YdCIJhuBVUenO/hLSWzUS/1nLEDkIcKElXvDn/jfjCz/gdoeQSQGg24+EMW/7cYEioUqXlctyED0A5oXZNIXA/maBrPsJPBXiGdWkTjBOQ1n6vIWrJwNWbN1jDu4yOQYa5BifRbsFM851e2vLeZmg6uBOc8fswils2hOfpA9wX6EMueQAafDAaO+0rL6oETZBNUhhHldiBquO504Nn3sKCGyqweut4BcDUNvMOmJrKZe8F3MOZsDrlyPxgD3qPac6kTB+5jKzcYKcsrTAiw0TakDO/J2uQbweDk4EDwtpCNjl0XkMbDb0vxaGJUdvjbj9a5/OPdJnWSJK+MMtRoUzvcctCFmtEt0xa1+pQg7/kRRie4JfR27rUf5Ff52yZzW/qWLGltocShLzbqk5/4MAckn3x7FPqxiumyE7Ez6QpL1Jd32yxt1pT7P8LSJ+A7bqXhLrgvnNztmE0OtKSrrbcBvyx39jRoquttbvO/DidFZOSmud3JN0UGQ+RW1xL0tK3avma++5ViAh7n6n4UCqxTxHM/NTb8r2MpwopbNazcU+EVDnzJeuzuXUZPPxWHjRFTw00=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(8676002)(2616005)(7696005)(36860700001)(30864003)(6666004)(426003)(4326008)(508600001)(8936002)(82310400004)(336012)(26005)(70206006)(6916009)(70586007)(83380400001)(36756003)(1076003)(40460700001)(2906002)(86362001)(356005)(186003)(5660300002)(47076005)(81166007)(54906003)(316002)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:25:17.2348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 684950d9-4bac-462b-d1cf-08d9db253964
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2537
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
 Jerry Zuo <Jerry.Zuo@amd.com>, Aurabindo.Pillai@amd.com, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[Why & How]
DCN guard is not necessary for DP2.x relevant logic.
Drop them.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Reviewed-by: Jerry Zuo <Jerry.Zuo@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   6 +-
 .../drm/amd/display/dc/bios/bios_parser2.c    |   2 -
 .../drm/amd/display/dc/bios/command_table2.c  |   4 -
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   4 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 292 +++---------------
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 249 +--------------
 .../drm/amd/display/dc/core/dc_link_hwss.c    |  78 +----
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  14 -
 drivers/gpu/drm/amd/display/dc/dc.h           |  13 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  |  43 +--
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   6 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   6 -
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   6 -
 .../display/dc/dce110/dce110_hw_sequencer.c   |  54 +---
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  12 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |   4 +-
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |   2 -
 .../drm/amd/display/dc/inc/hw/link_encoder.h  |   2 -
 .../amd/display/dc/inc/hw/stream_encoder.h    |   2 -
 .../amd/display/dc/inc/hw/timing_generator.h  |   2 -
 .../amd/display/dc/inc/hw_sequencer_private.h |   2 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h |   6 -
 .../amd/display/include/bios_parser_types.h   |   2 -
 .../gpu/drm/amd/display/include/dpcd_defs.h   |   4 -
 .../amd/display/include/grph_object_defs.h    |   2 -
 .../drm/amd/display/include/grph_object_id.h  |   2 -
 .../amd/display/include/link_service_types.h  |  12 -
 27 files changed, 83 insertions(+), 748 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 7490aec3869d..d6b8a360c33f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -797,16 +797,12 @@ void dm_helpers_mst_enable_stream_features(const struct dc_stream_state *stream)
 					 sizeof(new_downspread));
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 void dm_set_phyd32clk(struct dc_context *ctx, int freq_khz)
 {
-       // FPGA programming for this clock in diags framework that
-       // needs to go through dm layer, therefore leave dummy interace here
+       // TODO
 }
 
-
 void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
 {
 	/* TODO: add peridic detection implementation */
 }
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 1e385d55e7fb..23a3b640f0ee 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1692,7 +1692,6 @@ static enum bp_result bios_parser_get_encoder_cap_info(
 			ATOM_ENCODER_CAP_RECORD_HBR3_EN) ? 1 : 0;
 	info->HDMI_6GB_EN = (record->encodercaps &
 			ATOM_ENCODER_CAP_RECORD_HDMI6Gbps_EN) ? 1 : 0;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	info->IS_DP2_CAPABLE = (record->encodercaps &
 			ATOM_ENCODER_CAP_RECORD_DP2) ? 1 : 0;
 	info->DP_UHBR10_EN = (record->encodercaps &
@@ -1701,7 +1700,6 @@ static enum bp_result bios_parser_get_encoder_cap_info(
 			ATOM_ENCODER_CAP_RECORD_UHBR13_5_EN) ? 1 : 0;
 	info->DP_UHBR20_EN = (record->encodercaps &
 			ATOM_ENCODER_CAP_RECORD_UHBR20_EN) ? 1 : 0;
-#endif
 	info->DP_IS_USB_C = (record->encodercaps &
 			ATOM_ENCODER_CAP_RECORD_USB_C_TYPE) ? 1 : 0;
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index 9afa5eb2e6d3..f52f7ff7ead4 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -338,12 +338,10 @@ static enum bp_result transmitter_control_v1_7(
 	const struct command_table_helper *cmd = bp->cmd_helper;
 	struct dmub_dig_transmitter_control_data_v1_7 dig_v1_7 = {0};
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	uint8_t hpo_instance = (uint8_t)cntl->hpo_engine_id - ENGINE_ID_HPO_0;
 
 	if (dc_is_dp_signal(cntl->signal))
 		hpo_instance = (uint8_t)cntl->hpo_engine_id - ENGINE_ID_HPO_DP_0;
-#endif
 
 	dig_v1_7.phyid = cmd->phy_id_to_atom(cntl->transmitter);
 	dig_v1_7.action = (uint8_t)cntl->action;
@@ -358,9 +356,7 @@ static enum bp_result transmitter_control_v1_7(
 	dig_v1_7.hpdsel = cmd->hpd_sel_to_atom(cntl->hpd_sel);
 	dig_v1_7.digfe_sel = cmd->dig_encoder_sel_to_atom(cntl->engine_id);
 	dig_v1_7.connobj_id = (uint8_t)cntl->connector_obj_id.id;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	dig_v1_7.HPO_instance = hpo_instance;
-#endif
 	dig_v1_7.symclk_units.symclk_10khz = cntl->pixel_clock/10;
 
 	if (cntl->action == TRANSMITTER_CONTROL_ENABLE ||
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 6f5528d34093..417c31f51562 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2377,10 +2377,8 @@ static enum surface_update_type check_update_surfaces_for_stream(
 		if (stream_update->dsc_config)
 			su_flags->bits.dsc_changed = 1;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (stream_update->mst_bw_update)
 			su_flags->bits.mst_bw = 1;
-#endif
 
 		if (su_flags->raw != 0)
 			overall_type = UPDATE_TYPE_FULL;
@@ -2759,14 +2757,12 @@ static void commit_planes_do_stream_update(struct dc *dc,
 			if (stream_update->dsc_config)
 				dp_update_dsc_config(pipe_ctx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (stream_update->mst_bw_update) {
 				if (stream_update->mst_bw_update->is_increase)
 					dc_link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
 				else
 					dc_link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
 			}
-#endif
 
 			if (stream_update->pending_test_pattern) {
 				dc_link_dp_set_test_pattern(stream->link,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 6bef6724a700..33a22c90cf4a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -924,14 +924,12 @@ static void verify_link_capability_destructive(struct dc_link *link,
 				dp_get_max_link_cap(link);
 
 		set_all_streams_dpms_off_for_link(link);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&known_limit_link_setting) ==
 				DP_128b_132b_ENCODING)
 			link_res.hpo_dp_link_enc = resource_get_hpo_dp_link_enc_for_det_lt(
 					&link->dc->current_state->res_ctx,
 					link->dc->res_pool,
 					link);
-#endif
 		dp_verify_link_cap_with_retries(
 				link, &link_res, &known_limit_link_setting,
 				LINK_TRAINING_MAX_VERIFY_RETRY);
@@ -1655,9 +1653,7 @@ static bool dc_link_construct_legacy(struct dc_link *link,
 	}
 
 	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
-#endif
 
 	/* Update link encoder tracking variables. These are used for the dynamic
 	 * assignment of link encoders to streams.
@@ -1940,7 +1936,6 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
 		do_fallback = true;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/*
 	 * Temporary w/a to get DP2.0 link rates to work with SST.
 	 * TODO DP2.0 - Workaround: Remove w/a if and when the issue is resolved.
@@ -1950,7 +1945,6 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 			link->dc->debug.set_mst_en_for_sst) {
 		dp_enable_mst_on_sink(link, true);
 	}
-#endif
 
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP) {
 		/*in case it is not on*/
@@ -1958,7 +1952,6 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(&link_settings) == DP_128b_132b_ENCODING) {
 		/* TODO - DP2.0 HW: calculate 32 symbol clock for HPO encoder */
 	} else {
@@ -1968,13 +1961,6 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 			state->clk_mgr->funcs->update_clocks(state->clk_mgr,
 					state, false);
 	}
-#else
-	pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
-		link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
-	if (state->clk_mgr && !apply_seamless_boot_optimization)
-		state->clk_mgr->funcs->update_clocks(state->clk_mgr,
-											state, false);
-#endif
 
 	// during mode switch we do DP_SET_POWER off then on, and OUI is lost
 	dpcd_set_source_specific_data(link);
@@ -2003,12 +1989,8 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 	else
 		fec_enable = true;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
 		dp_set_fec_enable(link, fec_enable);
-#else
-	dp_set_fec_enable(link, fec_enable);
-#endif
 
 	// during mode set we do DP_SET_POWER off then on, aux writes are lost
 	if (link->dpcd_sink_ext_caps.bits.oled == 1 ||
@@ -2564,9 +2546,7 @@ static void disable_link(struct dc_link *link, const struct link_resource *link_
 
 	if (dc_is_dp_signal(signal)) {
 		/* SST DP, eDP */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		struct dc_link_settings link_settings = link->cur_link_settings;
-#endif
 		if (dc_is_dp_sst_signal(signal))
 			dp_disable_link_phy(link, link_res, signal);
 		else
@@ -2574,15 +2554,10 @@ static void disable_link(struct dc_link *link, const struct link_resource *link_
 
 		if (dc_is_dp_sst_signal(signal) ||
 				link->mst_stream_alloc_table.stream_count == 0) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
 				dp_set_fec_enable(link, false);
 				dp_set_fec_ready(link, link_res, false);
 			}
-#else
-			dp_set_fec_enable(link, false);
-			dp_set_fec_ready(link, link_res, false);
-#endif
 		}
 	} else {
 		if (signal != SIGNAL_TYPE_VIRTUAL)
@@ -2765,72 +2740,63 @@ static bool dp_active_dongle_validate_timing(
 		break;
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dpcd_caps->dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER &&
 			dongle_caps->extendedCapValid == true) {
-#else
-	if (dpcd_caps->dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER ||
-		dongle_caps->extendedCapValid == false)
-		return true;
-#endif
-
-	/* Check Pixel Encoding */
-	switch (timing->pixel_encoding) {
-	case PIXEL_ENCODING_RGB:
-	case PIXEL_ENCODING_YCBCR444:
-		break;
-	case PIXEL_ENCODING_YCBCR422:
-		if (!dongle_caps->is_dp_hdmi_ycbcr422_pass_through)
-			return false;
-		break;
-	case PIXEL_ENCODING_YCBCR420:
-		if (!dongle_caps->is_dp_hdmi_ycbcr420_pass_through)
+		/* Check Pixel Encoding */
+		switch (timing->pixel_encoding) {
+		case PIXEL_ENCODING_RGB:
+		case PIXEL_ENCODING_YCBCR444:
+			break;
+		case PIXEL_ENCODING_YCBCR422:
+			if (!dongle_caps->is_dp_hdmi_ycbcr422_pass_through)
+				return false;
+			break;
+		case PIXEL_ENCODING_YCBCR420:
+			if (!dongle_caps->is_dp_hdmi_ycbcr420_pass_through)
+				return false;
+			break;
+		default:
+			/* Invalid Pixel Encoding*/
 			return false;
-		break;
-	default:
-		/* Invalid Pixel Encoding*/
-		return false;
-	}
+		}
 
-	switch (timing->display_color_depth) {
-	case COLOR_DEPTH_666:
-	case COLOR_DEPTH_888:
-		/*888 and 666 should always be supported*/
-		break;
-	case COLOR_DEPTH_101010:
-		if (dongle_caps->dp_hdmi_max_bpc < 10)
-			return false;
-		break;
-	case COLOR_DEPTH_121212:
-		if (dongle_caps->dp_hdmi_max_bpc < 12)
+		switch (timing->display_color_depth) {
+		case COLOR_DEPTH_666:
+		case COLOR_DEPTH_888:
+			/*888 and 666 should always be supported*/
+			break;
+		case COLOR_DEPTH_101010:
+			if (dongle_caps->dp_hdmi_max_bpc < 10)
+				return false;
+			break;
+		case COLOR_DEPTH_121212:
+			if (dongle_caps->dp_hdmi_max_bpc < 12)
+				return false;
+			break;
+		case COLOR_DEPTH_141414:
+		case COLOR_DEPTH_161616:
+		default:
+			/* These color depths are currently not supported */
 			return false;
-		break;
-	case COLOR_DEPTH_141414:
-	case COLOR_DEPTH_161616:
-	default:
-		/* These color depths are currently not supported */
-		return false;
-	}
+		}
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
-		struct dc_crtc_timing outputTiming = *timing;
+		if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
+			struct dc_crtc_timing outputTiming = *timing;
 
-		if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
-			/* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
-			outputTiming.flags.DSC = 0;
-		if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
-			return false;
-	} else { // DP to HDMI TMDS converter
+			if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
+				/* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
+				outputTiming.flags.DSC = 0;
+			if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
+				return false;
+		} else { // DP to HDMI TMDS converter
+			if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
+				return false;
+		}
+#else
 		if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
 			return false;
-	}
-#else
-	if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
-		return false;
 #endif
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	}
 
 	if (dpcd_caps->channel_coding_cap.bits.DP_128b_132b_SUPPORTED == 0 &&
@@ -2911,7 +2877,6 @@ static bool dp_active_dongle_validate_timing(
 				return false;
 		}
 	}
-#endif
 
 	return true;
 }
@@ -3384,9 +3349,7 @@ static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
 static void update_mst_stream_alloc_table(
 	struct dc_link *link,
 	struct stream_encoder *stream_enc,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
-#endif
 	const struct dp_mst_stream_allocation_table *proposed_table)
 {
 	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
@@ -3422,9 +3385,7 @@ static void update_mst_stream_alloc_table(
 			work_table[i].slot_count =
 				proposed_table->stream_allocations[i].slot_count;
 			work_table[i].stream_enc = stream_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
-#endif
 		}
 	}
 
@@ -3435,7 +3396,7 @@ static void update_mst_stream_alloc_table(
 		link->mst_stream_alloc_table.stream_allocations[i] =
 				work_table[i];
 }
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+
 static void dc_log_vcp_x_y(const struct dc_link *link, struct fixed31_32 avg_time_slots_per_mtp)
 {
 	const uint32_t VCP_Y_PRECISION = 1000;
@@ -3537,7 +3498,6 @@ static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
 	 */
 	return DC_OK;
 }
-#endif
 
 /* convert link_mst_stream_alloc_table to dm dp_mst_stream_alloc_table
  * because stream_encoder is not exposed to dm
@@ -3548,10 +3508,8 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_link_encoder *hpo_dp_link_encoder = pipe_ctx->link_res.hpo_dp_link_enc;
 	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
-#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
@@ -3577,17 +3535,12 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		stream->ctx,
 		stream,
 		&proposed_table,
-		true)) {
+		true))
 		update_mst_stream_alloc_table(
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 					link,
 					pipe_ctx->stream_res.stream_enc,
 					pipe_ctx->stream_res.hpo_dp_stream_enc,
 					&proposed_table);
-#else
-					link, pipe_ctx->stream_res.stream_enc, &proposed_table);
-#endif
-	}
 	else
 		DC_LOG_WARNING("Failed to update"
 				"MST allocation table for"
@@ -3600,7 +3553,6 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		DC_LOG_MST("stream_enc[%d]: %p      "
 		"stream[%d].hpo_dp_stream_enc: %p      "
 		"stream[%d].vcp_id: %d      "
@@ -3613,17 +3565,6 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-#else
-		DC_LOG_MST("stream_enc[%d]: %p      "
-		"stream[%d].vcp_id: %d      "
-		"stream[%d].slot_count: %d\n",
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-#endif
 	}
 
 	ASSERT(proposed_table.stream_count > 0);
@@ -3643,7 +3584,6 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	}
 
 	/* program DP source TX for payload */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
 	case DP_8b_10b_ENCODING:
 		link_encoder->funcs->update_mst_stream_allocation_table(
@@ -3659,11 +3599,6 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
-#else
-	link_encoder->funcs->update_mst_stream_allocation_table(
-		link_encoder,
-		&link->mst_stream_alloc_table);
-#endif
 
 	/* send down message */
 	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
@@ -3686,7 +3621,6 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	pbn = get_pbn_from_timing(pipe_ctx);
 	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
 	case DP_8b_10b_ENCODING:
 		stream_encoder->funcs->set_throttled_vcp_size(
@@ -3703,17 +3637,11 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
-#else
-	stream_encoder->funcs->set_throttled_vcp_size(
-		stream_encoder,
-		avg_time_slots_per_mtp);
-#endif
 
 	return DC_OK;
 
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
@@ -3870,7 +3798,6 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 
 	return DC_OK;
 }
-#endif
 
 static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
@@ -3878,10 +3805,8 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_link_encoder *hpo_dp_link_encoder = pipe_ctx->link_res.hpo_dp_link_enc;
 	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
-#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	int i;
@@ -3903,7 +3828,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	 */
 
 	/* slot X.Y */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
 	case DP_8b_10b_ENCODING:
 		stream_encoder->funcs->set_throttled_vcp_size(
@@ -3920,11 +3844,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
-#else
-	stream_encoder->funcs->set_throttled_vcp_size(
-		stream_encoder,
-		avg_time_slots_per_mtp);
-#endif
 
 	/* TODO: which component is responsible for remove payload table? */
 	if (mst_mode) {
@@ -3934,16 +3853,11 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 				&proposed_table,
 				false)) {
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			update_mst_stream_alloc_table(
 						link,
 						pipe_ctx->stream_res.stream_enc,
 						pipe_ctx->stream_res.hpo_dp_stream_enc,
 						&proposed_table);
-#else
-			update_mst_stream_alloc_table(
-				link, pipe_ctx->stream_res.stream_enc, &proposed_table);
-#endif
 		}
 		else {
 				DC_LOG_WARNING("Failed to update"
@@ -3959,7 +3873,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		DC_LOG_MST("stream_enc[%d]: %p      "
 		"stream[%d].hpo_dp_stream_enc: %p      "
 		"stream[%d].vcp_id: %d      "
@@ -3972,17 +3885,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-#else
-		DC_LOG_MST("stream_enc[%d]: %p      "
-		"stream[%d].vcp_id: %d      "
-		"stream[%d].slot_count: %d\n",
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-#endif
 	}
 
 	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
@@ -3999,7 +3901,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 				status, mst_alloc_slots, prev_mst_slots_in_use);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
 	case DP_8b_10b_ENCODING:
 		link_encoder->funcs->update_mst_stream_allocation_table(
@@ -4015,11 +3916,6 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		DC_LOG_ERROR("Failure: unknown encoding format\n");
 		return DC_ERROR_UNEXPECTED;
 	}
-#else
-	link_encoder->funcs->update_mst_stream_allocation_table(
-		link_encoder,
-		&link->mst_stream_alloc_table);
-#endif
 
 	if (mst_mode) {
 		dm_helpers_dp_mst_poll_for_allocation_change_trigger(
@@ -4067,21 +3963,18 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 
 	/* stream encoder index */
 	config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx))
 		config.stream_enc_idx =
 				pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
-#endif
 
 	/* dig back end */
 	config.dig_be = pipe_ctx->stream->link->link_enc_hw_inst;
 
 	/* link encoder index */
 	config.link_enc_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx))
 		config.link_enc_idx = pipe_ctx->link_res.hpo_dp_link_enc->inst;
-#endif
+
 	/* dio output index */
 	config.dio_output_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
 
@@ -4096,9 +3989,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 	config.assr_enabled = (panel_mode == DP_PANEL_MODE_EDP) ? 1 : 0;
 	config.mst_enabled = (pipe_ctx->stream->signal ==
 			SIGNAL_TYPE_DISPLAY_PORT_MST) ? 1 : 0;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	config.dp2_enabled = is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
-#endif
 	config.usb4_enabled = (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) ?
 			1 : 0;
 	config.dpms_off = dpms_off;
@@ -4110,7 +4001,6 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 }
 #endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pipe_ctx *pipe_ctx)
 {
 	struct dc *dc = pipe_ctx->stream->ctx->dc;
@@ -4190,7 +4080,6 @@ static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pi
 
 	dc->hwss.unblank_stream(pipe_ctx, &stream->link->cur_link_settings);
 }
-#endif
 
 void core_link_enable_stream(
 		struct dc_state *state,
@@ -4201,13 +4090,12 @@ void core_link_enable_stream(
 	struct dc_link *link = stream->sink->link;
 	enum dc_status status;
 	struct link_encoder *link_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
 	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 
 	if (is_dp_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
-#endif
+
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
 
 	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
@@ -4220,12 +4108,8 @@ void core_link_enable_stream(
 		link_enc = stream->link->link_enc;
 	ASSERT(link_enc);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
 			&& !is_dp_128b_132b_signal(pipe_ctx)) {
-#else
-	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)) {
-#endif
 		if (link_enc)
 			link_enc->funcs->setup(
 				link_enc,
@@ -4236,7 +4120,6 @@ void core_link_enable_stream(
 			stream->timing.timing_3d_format != TIMING_3D_FORMAT_NONE);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->set_stream_attribute(
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -4254,14 +4137,6 @@ void core_link_enable_stream(
 				stream->use_vsc_sdp_for_colorimetry,
 				stream->link->dpcd_caps.dprx_feature.bits.SST_SPLIT_SDP_CAP);
 	}
-#else
-	pipe_ctx->stream_res.stream_enc->funcs->dp_set_stream_attribute(
-			pipe_ctx->stream_res.stream_enc,
-			&stream->timing,
-			stream->output_color_space,
-			stream->use_vsc_sdp_for_colorimetry,
-			stream->link->dpcd_caps.dprx_feature.bits.SST_SPLIT_SDP_CAP);
-#endif
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
 		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
@@ -4275,10 +4150,8 @@ void core_link_enable_stream(
 
 	pipe_ctx->stream->link->link_state_valid = true;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
 		pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, otg_out_dest);
-#endif
 
 	if (dc_is_dvi_signal(pipe_ctx->stream->signal))
 		pipe_ctx->stream_res.stream_enc->funcs->dvi_set_stream_attribute(
@@ -4298,11 +4171,9 @@ void core_link_enable_stream(
 
 		pipe_ctx->stream->apply_edp_fast_boot_optimization = false;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		// Enable VPG before building infoframe
 		if (vpg && vpg->funcs->vpg_poweron)
 			vpg->funcs->vpg_poweron(vpg);
-#endif
 
 		resource_build_info_frame(pipe_ctx);
 		dc->hwss.update_info_frame(pipe_ctx);
@@ -4388,12 +4259,8 @@ void core_link_enable_stream(
 		 * as a workaround for the incorrect value being applied
 		 * from transmitter control.
 		 */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
 				is_dp_128b_132b_signal(pipe_ctx)))
-#else
-		if (!dc_is_virtual_signal(pipe_ctx->stream->signal))
-#endif
 			if (link_enc)
 				link_enc->funcs->setup(
 					link_enc,
@@ -4412,11 +4279,9 @@ void core_link_enable_stream(
 
 		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 			dc_link_allocate_mst_payload(pipe_ctx);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
 				is_dp_128b_132b_signal(pipe_ctx))
 			dc_link_update_sst_payload(pipe_ctx, true);
-#endif
 
 		dc->hwss.unblank_stream(pipe_ctx,
 			&pipe_ctx->stream->link->cur_link_settings);
@@ -4433,11 +4298,9 @@ void core_link_enable_stream(
 		dc->hwss.enable_audio_stream(pipe_ctx);
 
 	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (is_dp_128b_132b_signal(pipe_ctx)) {
 			fpga_dp_hpo_enable_link_and_stream(state, pipe_ctx);
 		}
-#endif
 		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
 				dc_is_virtual_signal(pipe_ctx->stream->signal))
 			dp_set_dsc_enable(pipe_ctx, true);
@@ -4454,12 +4317,10 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 	struct dc  *dc = pipe_ctx->stream->ctx->dc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->sink->link;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 
 	if (is_dp_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
-#endif
 
 	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
 			dc_is_virtual_signal(pipe_ctx->stream->signal))
@@ -4479,11 +4340,9 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 		deallocate_mst_payload(pipe_ctx);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
 			is_dp_128b_132b_signal(pipe_ctx))
 		dc_link_update_sst_payload(pipe_ctx, false);
-#endif
 
 	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
 		struct ext_hdmi_settings settings = {0};
@@ -4510,7 +4369,6 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 		}
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
 			!is_dp_128b_132b_signal(pipe_ctx)) {
 
@@ -4527,27 +4385,18 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 		dc->hwss.disable_stream(pipe_ctx);
 		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
 	}
-#else
-	disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
-
-	dc->hwss.disable_stream(pipe_ctx);
-#endif
 
 	if (pipe_ctx->stream->timing.flags.DSC) {
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
 			dp_set_dsc_enable(pipe_ctx, false);
 	}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
 		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
 			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
 	}
-#endif
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (vpg && vpg->funcs->vpg_powerdown)
 		vpg->funcs->vpg_powerdown(vpg);
-#endif
 }
 
 void core_link_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
@@ -4686,11 +4535,9 @@ void dc_link_set_preferred_training_settings(struct dc *dc,
 
 	if (link_setting != NULL) {
 		link->preferred_link_setting = *link_setting;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(link_setting) == DP_128b_132b_ENCODING)
 			/* TODO: add dc update for acquiring link res  */
 			skip_immediate_retrain = true;
-#endif
 	} else {
 		link->preferred_link_setting.lane_count = LANE_COUNT_UNKNOWN;
 		link->preferred_link_setting.link_rate = LINK_RATE_UNKNOWN;
@@ -4732,7 +4579,6 @@ uint32_t dc_link_bandwidth_kbps(
 	const struct dc_link *link,
 	const struct dc_link_settings *link_setting)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	uint32_t total_data_bw_efficiency_x10000 = 0;
 	uint32_t link_rate_per_lane_kbps = 0;
 
@@ -4763,40 +4609,6 @@ uint32_t dc_link_bandwidth_kbps(
 
 	/* overall effective link bandwidth = link rate per lane * lane count * total data bandwidth efficiency */
 	return link_rate_per_lane_kbps * link_setting->lane_count / 10000 * total_data_bw_efficiency_x10000;
-#else
-	uint32_t link_bw_kbps =
-		link_setting->link_rate * LINK_RATE_REF_FREQ_IN_KHZ; /* bytes per sec */
-
-	link_bw_kbps *= 8;   /* 8 bits per byte*/
-	link_bw_kbps *= link_setting->lane_count;
-
-	if (dc_link_should_enable_fec(link)) {
-		/* Account for FEC overhead.
-		 * We have to do it based on caps,
-		 * and not based on FEC being set ready,
-		 * because FEC is set ready too late in
-		 * the process to correctly be picked up
-		 * by mode enumeration.
-		 *
-		 * There's enough zeros at the end of 'kbps'
-		 * that make the below operation 100% precise
-		 * for our purposes.
-		 * 'long long' makes it work even for HDMI 2.1
-		 * max bandwidth (and much, much bigger bandwidths
-		 * than that, actually).
-		 *
-		 * NOTE: Reducing link BW by 3% may not be precise
-		 * because it may be a stream BT that increases by 3%, and so
-		 * 1/1.03 = 0.970873 factor should have been used instead,
-		 * but the difference is minimal and is in a safe direction,
-		 * which all works well around potential ambiguity of DP 1.4a spec.
-		 */
-		long long fec_link_bw_kbps = link_bw_kbps * 970LL;
-		link_bw_kbps = (uint32_t)(div64_s64(fec_link_bw_kbps, 1000LL));
-	}
-	return link_bw_kbps;
-
-#endif
 }
 
 const struct dc_link_settings *dc_link_get_link_cap(
@@ -4952,7 +4764,6 @@ const struct link_resource *dc_link_get_cur_link_res(const struct dc_link *link)
  */
 void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_link *link;
 	uint8_t i;
 	uint32_t hpo_dp_recycle_map = 0;
@@ -4972,7 +4783,6 @@ void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
 		}
 		*map |= (hpo_dp_recycle_map << LINK_RES_HPO_DP_REC_MAP__SHIFT);
 	}
-#endif
 }
 
 /**
@@ -4995,7 +4805,6 @@ void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
  */
 void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_link *link;
 	uint8_t i;
 	unsigned int available_hpo_dp_count;
@@ -5033,5 +4842,4 @@ void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
 			}
 		}
 	}
-#endif
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index b3b75a98beaa..9511c65e0603 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -62,7 +62,6 @@ enum {
 	POST_LT_ADJ_REQ_TIMEOUT = 200
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct dp_lt_fallback_entry {
 	enum dc_lane_count lane_count;
 	enum dc_link_rate link_rate;
@@ -97,7 +96,6 @@ static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
 		{LANE_COUNT_ONE, LINK_RATE_HIGH},
 		{LANE_COUNT_ONE, LINK_RATE_LOW},
 };
-#endif
 
 static bool decide_fallback_link_setting(
 		struct dc_link *link,
@@ -114,7 +112,7 @@ static uint32_t get_cr_training_aux_rd_interval(struct dc_link *link,
 {
 	union training_aux_rd_interval training_rd_interval;
 	uint32_t wait_in_micro_secs = 100;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+
 	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
 	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
 			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
@@ -126,15 +124,7 @@ static uint32_t get_cr_training_aux_rd_interval(struct dc_link *link,
 		if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
 			wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
 	}
-#else
-	core_link_read_dpcd(
-			link,
-			DP_TRAINING_AUX_RD_INTERVAL,
-			(uint8_t *)&training_rd_interval,
-			sizeof(training_rd_interval));
-	if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
-		wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;	
-#endif
+
 	return wait_in_micro_secs;
 }
 
@@ -142,7 +132,6 @@ static uint32_t get_eq_training_aux_rd_interval(
 	struct dc_link *link,
 	const struct dc_link_settings *link_settings)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union training_aux_rd_interval training_rd_interval;
 
 	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
@@ -171,41 +160,16 @@ static uint32_t get_eq_training_aux_rd_interval(
 	case 6: return 64000;
 	default: return 400;
 	}
-#else
-	union training_aux_rd_interval training_rd_interval;
-	uint32_t wait_in_micro_secs = 400;
-
-	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
-	/* overwrite the delay if rev > 1.1*/
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
-		/* DP 1.2 or later - retrieve delay through
-		 * "DPCD_ADDR_TRAINING_AUX_RD_INTERVAL" register */
-		core_link_read_dpcd(
-			link,
-			DP_TRAINING_AUX_RD_INTERVAL,
-			(uint8_t *)&training_rd_interval,
-			sizeof(training_rd_interval));
-
-		if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
-			wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
-	}
-
-	return wait_in_micro_secs;
-#endif
 }
 
 void dp_wait_for_training_aux_rd_interval(
 	struct dc_link *link,
 	uint32_t wait_in_micro_secs)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (wait_in_micro_secs > 16000)
 		msleep(wait_in_micro_secs/1000);
 	else
 		udelay(wait_in_micro_secs);
-#else
-	udelay(wait_in_micro_secs);
-#endif
 
 	DC_LOG_HW_LINK_TRAINING("%s:\n wait = %d\n",
 		__func__,
@@ -233,7 +197,6 @@ enum dpcd_training_patterns
 	case DP_TRAINING_PATTERN_SEQUENCE_4:
 		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_4;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case DP_128b_132b_TPS1:
 		dpcd_tr_pattern = DPCD_128b_132b_TPS1;
 		break;
@@ -243,7 +206,6 @@ enum dpcd_training_patterns
 	case DP_128b_132b_TPS2_CDS:
 		dpcd_tr_pattern = DPCD_128b_132b_TPS2_CDS;
 		break;
-#endif
 	case DP_TRAINING_PATTERN_VIDEOIDLE:
 		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_VIDEOIDLE;
 		break;
@@ -286,10 +248,8 @@ static enum dc_dp_training_pattern decide_cr_training_pattern(
 	case DP_8b_10b_ENCODING:
 	default:
 		return DP_TRAINING_PATTERN_SEQUENCE_1;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case DP_128b_132b_ENCODING:
 		return DP_128b_132b_TPS1;
-#endif
 	}
 }
 
@@ -297,7 +257,6 @@ static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *li
 		const struct dc_link_settings *link_settings)
 {
 	struct link_encoder *link_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct encoder_feature_support *enc_caps;
 	struct dpcd_caps *rx_caps = &link->dpcd_caps;
 	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
@@ -332,41 +291,8 @@ static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *li
 		break;
 	}
 	return pattern;
-#else
-	enum dc_dp_training_pattern highest_tp = DP_TRAINING_PATTERN_SEQUENCE_2;
-	struct encoder_feature_support *features;
-	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
-
-	/* Access link encoder capability based on whether it is statically
-	 * or dynamically assigned to a link.
-	 */
-	if (link->is_dig_mapping_flexible &&
-			link->dc->res_pool->funcs->link_encs_assign)
-		link_enc = link_enc_cfg_get_link_enc_used_by_link(link->ctx->dc, link);
-	else
-		link_enc = link->link_enc;
-	ASSERT(link_enc);
-	features = &link_enc->features;
-
-	if (features->flags.bits.IS_TPS3_CAPABLE)
-		highest_tp = DP_TRAINING_PATTERN_SEQUENCE_3;
-
-	if (features->flags.bits.IS_TPS4_CAPABLE)
-		highest_tp = DP_TRAINING_PATTERN_SEQUENCE_4;
-
-	if (dpcd_caps->max_down_spread.bits.TPS4_SUPPORTED &&
-		highest_tp >= DP_TRAINING_PATTERN_SEQUENCE_4)
-		return DP_TRAINING_PATTERN_SEQUENCE_4;
-
-	if (dpcd_caps->max_ln_count.bits.TPS3_SUPPORTED &&
-		highest_tp >= DP_TRAINING_PATTERN_SEQUENCE_3)
-		return DP_TRAINING_PATTERN_SEQUENCE_3;
-
-	return DP_TRAINING_PATTERN_SEQUENCE_2;
-#endif
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
 {
 	uint8_t link_rate = 0;
@@ -394,7 +320,6 @@ static uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
 
 	return link_rate;
 }
-#endif
 
 static void vendor_specific_lttpr_wa_one_start(struct dc_link *link)
 {
@@ -537,10 +462,8 @@ static void vendor_specific_lttpr_wa_four(
 	const uint8_t offset = dp_convert_to_count(
 			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 	uint32_t vendor_lttpr_write_address = 0xF004F;
-#if defined(CONFIG_DRM_AMD_DC_DP2_0)
 	uint8_t sink_status = 0;
 	uint8_t i;
-#endif
 
 	if (offset != 0xFF)
 		vendor_lttpr_write_address +=
@@ -566,7 +489,6 @@ static void vendor_specific_lttpr_wa_four(
 				sizeof(vendor_lttpr_write_data_two));
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DP2_0)
 	/* poll for intra-hop disable */
 	for (i = 0; i < 10; i++) {
 		if ((core_link_read_dpcd(link, DP_SINK_STATUS, &sink_status, 1) == DC_OK) &&
@@ -574,7 +496,6 @@ static void vendor_specific_lttpr_wa_four(
 			break;
 		udelay(1000);
 	}
-#endif
 }
 
 static void vendor_specific_lttpr_wa_five(
@@ -662,11 +583,7 @@ enum dc_status dpcd_set_link_settings(
 		status = core_link_write_dpcd(link, DP_LINK_RATE_SET,
 				&lt_settings->link_settings.link_rate_set, 1);
 	} else {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		rate = get_dpcd_link_rate(&lt_settings->link_settings);
-#else
-		rate = (uint8_t) (lt_settings->link_settings.link_rate);
-#endif
 		if (link->dc->debug.apply_vendor_specific_lttpr_wa &&
 					(link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
 					link->lttpr_mode == LTTPR_MODE_TRANSPARENT)
@@ -717,10 +634,8 @@ uint8_t dc_dp_initialize_scrambling_data_symbols(
 		disable_scrabled_data_symbols = 1;
 		break;
 	case DP_TRAINING_PATTERN_SEQUENCE_4:
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case DP_128b_132b_TPS1:
 	case DP_128b_132b_TPS2:
-#endif
 		disable_scrabled_data_symbols = 0;
 		break;
 	default:
@@ -791,7 +706,6 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 		size_in_bytes);
 
 	if (is_repeater(link, offset)) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
@@ -802,7 +716,6 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
 		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING)
-#endif
 		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
 				" 0x%X VS set = %x PE set = %x max VS Reached = %x  max PE Reached = %x\n",
 			__func__,
@@ -813,7 +726,6 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 			lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
 			lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
 	} else {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
@@ -822,14 +734,13 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
 		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING)
-#endif
-		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
-			__func__,
-			dpcd_base_lt_offset,
-			lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
-			lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
-			lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
-			lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
+			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
+					__func__,
+					dpcd_base_lt_offset,
+					lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
+					lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
+					lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
+					lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
 	}
 	if (edp_workaround) {
 		/* for eDP write in 2 parts because the 5-byte burst is
@@ -847,7 +758,6 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 			(uint8_t *)(lt_settings->dpcd_lane_settings),
 			size_in_bytes);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 			DP_128b_132b_ENCODING) {
 		core_link_write_dpcd(
@@ -855,10 +765,9 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 				dpcd_base_lt_offset,
 				dpcd_lt_buffer,
 				sizeof(dpcd_lt_buffer));
-#endif
-		} else
+	} else
 		/* write it all in (1 + number-of-lanes)-byte burst*/
-			core_link_write_dpcd(
+		core_link_write_dpcd(
 				link,
 				dpcd_base_lt_offset,
 				dpcd_lt_buffer,
@@ -925,13 +834,11 @@ void dp_hw_to_dpcd_lane_settings(
 					(hw_lane_settings[lane].PRE_EMPHASIS ==
 							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
 		}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING) {
 			dpcd_lane_settings[lane].tx_ffe.PRESET_VALUE =
 					hw_lane_settings[lane].FFE_PRESET.settings.level;
 		}
-#endif
 	}
 }
 
@@ -953,13 +860,11 @@ void dp_decide_lane_settings(
 					(enum dc_pre_emphasis)(ln_adjust[lane].bits.
 							PRE_EMPHASIS_LANE);
 		}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_128b_132b_ENCODING) {
 			hw_lane_settings[lane].FFE_PRESET.raw =
 					ln_adjust[lane].tx_ffe.PRESET_VALUE;
 		}
-#endif
 	}
 	dp_hw_to_dpcd_lane_settings(lt_settings, hw_lane_settings, dpcd_lane_settings);
 
@@ -1010,9 +915,7 @@ static void maximize_lane_settings(const struct link_training_settings *lt_setti
 
 	max_requested.VOLTAGE_SWING = lane_settings[0].VOLTAGE_SWING;
 	max_requested.PRE_EMPHASIS = lane_settings[0].PRE_EMPHASIS;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	max_requested.FFE_PRESET = lane_settings[0].FFE_PRESET;
-#endif
 
 	/* Determine what the maximum of the requested settings are*/
 	for (lane = 1; lane < lt_settings->link_settings.lane_count; lane++) {
@@ -1021,12 +924,10 @@ static void maximize_lane_settings(const struct link_training_settings *lt_setti
 
 		if (lane_settings[lane].PRE_EMPHASIS > max_requested.PRE_EMPHASIS)
 			max_requested.PRE_EMPHASIS = lane_settings[lane].PRE_EMPHASIS;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (lane_settings[lane].FFE_PRESET.settings.level >
 				max_requested.FFE_PRESET.settings.level)
 			max_requested.FFE_PRESET.settings.level =
 					lane_settings[lane].FFE_PRESET.settings.level;
-#endif
 	}
 
 	/* make sure the requested settings are
@@ -1036,10 +937,8 @@ static void maximize_lane_settings(const struct link_training_settings *lt_setti
 
 	if (max_requested.PRE_EMPHASIS > PRE_EMPHASIS_MAX_LEVEL)
 		max_requested.PRE_EMPHASIS = PRE_EMPHASIS_MAX_LEVEL;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (max_requested.FFE_PRESET.settings.level > DP_FFE_PRESET_MAX_LEVEL)
 		max_requested.FFE_PRESET.settings.level = DP_FFE_PRESET_MAX_LEVEL;
-#endif
 
 	/* make sure the pre-emphasis matches the voltage swing*/
 	if (max_requested.PRE_EMPHASIS >
@@ -1052,9 +951,7 @@ static void maximize_lane_settings(const struct link_training_settings *lt_setti
 	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
 		lane_settings[lane].VOLTAGE_SWING = max_requested.VOLTAGE_SWING;
 		lane_settings[lane].PRE_EMPHASIS = max_requested.PRE_EMPHASIS;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		lane_settings[lane].FFE_PRESET = max_requested.FFE_PRESET;
-#endif
 	}
 }
 
@@ -1065,9 +962,7 @@ static void override_lane_settings(const struct link_training_settings *lt_setti
 
 	if (lt_settings->voltage_swing == NULL &&
 	    lt_settings->pre_emphasis == NULL &&
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	    lt_settings->ffe_preset == NULL &&
-#endif
 	    lt_settings->post_cursor2 == NULL)
 
 		return;
@@ -1079,10 +974,8 @@ static void override_lane_settings(const struct link_training_settings *lt_setti
 			lane_settings[lane].PRE_EMPHASIS = *lt_settings->pre_emphasis;
 		if (lt_settings->post_cursor2)
 			lane_settings[lane].POST_CURSOR2 = *lt_settings->post_cursor2;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (lt_settings->ffe_preset)
 			lane_settings[lane].FFE_PRESET = *lt_settings->ffe_preset;
-#endif
 	}
 }
 
@@ -1186,7 +1079,6 @@ enum dc_status dpcd_set_lane_settings(
 		link_training_setting->link_settings.lane_count);
 
 	if (is_repeater(link, offset)) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
@@ -1197,7 +1089,6 @@ enum dc_status dpcd_set_lane_settings(
 					link_training_setting->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
 		else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
 				DP_8b_10b_ENCODING)
-#endif
 		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n"
 				" 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
 			__func__,
@@ -1209,7 +1100,6 @@ enum dc_status dpcd_set_lane_settings(
 			link_training_setting->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
 
 	} else {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
 				DP_128b_132b_ENCODING)
 			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
@@ -1218,7 +1108,6 @@ enum dc_status dpcd_set_lane_settings(
 					link_training_setting->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
 		else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
 				DP_8b_10b_ENCODING)
-#endif
 		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
 			__func__,
 			lane0_set_address,
@@ -1354,14 +1243,12 @@ uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval
 	case 0x04:
 		aux_rd_interval_us = 16000;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case 0x05:
 		aux_rd_interval_us = 32000;
 		break;
 	case 0x06:
 		aux_rd_interval_us = 64000;
 		break;
-#endif
 	default:
 		break;
 	}
@@ -1402,13 +1289,8 @@ static enum link_training_result perform_channel_equalization_sequence(
 	/* Note: also check that TPS4 is a supported feature*/
 	tr_pattern = lt_settings->pattern_for_eq;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_repeater(link, offset) && dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
 		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
-#else
-	if (is_repeater(link, offset))
-		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
-#endif
 
 	dp_set_hw_training_pattern(link, link_res, tr_pattern, offset);
 
@@ -1579,15 +1461,10 @@ static enum link_training_result perform_clock_recovery_sequence(
 			return LINK_TRAINING_SUCCESS;
 
 		/* 6. max VS reached*/
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if ((dp_get_link_encoding_format(&lt_settings->link_settings) ==
 				DP_8b_10b_ENCODING) &&
 				dp_is_max_vs_reached(lt_settings))
 			break;
-#else
-		if (dp_is_max_vs_reached(lt_settings))
-			break;
-#endif
 
 		/* 7. same lane settings*/
 		/* Note: settings are the same for all lanes,
@@ -1596,12 +1473,10 @@ static enum link_training_result perform_clock_recovery_sequence(
 				lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
 						dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
 			retries_cr++;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		else if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
 				lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE ==
 						dpcd_lane_adjust[0].tx_ffe.PRESET_VALUE)
 			retries_cr++;
-#endif
 		else
 			retries_cr = 0;
 
@@ -1639,11 +1514,7 @@ static inline enum link_training_result dp_transition_to_video_idle(
 	 * TPS4 must be used instead of POST_LT_ADJ_REQ.
 	 */
 	if (link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED != 1 ||
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			lt_settings->pattern_for_eq >= DP_TRAINING_PATTERN_SEQUENCE_4) {
-#else
-			lt_settings->pattern_for_eq == DP_TRAINING_PATTERN_SEQUENCE_4) {
-#endif
 		/* delay 5ms after Main Link output idle pattern and then check
 		 * DPCD 0202h.
 		 */
@@ -1742,7 +1613,6 @@ static inline void decide_8b_10b_training_settings(
 	dp_hw_to_dpcd_lane_settings(lt_settings, lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static inline void decide_128b_132b_training_settings(struct dc_link *link,
 		const struct dc_link_settings *link_settings,
 		struct link_training_settings *lt_settings)
@@ -1769,7 +1639,6 @@ static inline void decide_128b_132b_training_settings(struct dc_link *link,
 	dp_hw_to_dpcd_lane_settings(lt_settings,
 			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
 }
-#endif
 
 void dp_decide_training_settings(
 		struct dc_link *link,
@@ -1778,10 +1647,8 @@ void dp_decide_training_settings(
 {
 	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
 		decide_8b_10b_training_settings(link, link_settings, lt_settings);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	else if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING)
 		decide_128b_132b_training_settings(link, link_settings, lt_settings);
-#endif
 }
 
 static void override_training_settings(
@@ -1804,10 +1671,8 @@ static void override_training_settings(
 		lt_settings->pre_emphasis = overrides->pre_emphasis;
 	if (overrides->post_cursor2 != NULL)
 		lt_settings->post_cursor2 = overrides->post_cursor2;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (overrides->ffe_preset != NULL)
 		lt_settings->ffe_preset = overrides->ffe_preset;
-#endif
 	/* Override HW lane settings with BIOS forced values if present */
 	if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN &&
 			link->lttpr_mode == LTTPR_MODE_TRANSPARENT) {
@@ -2011,7 +1876,6 @@ static void print_status_message(
 	case LINK_RATE_HIGH3:
 		link_rate = "HBR3";
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case LINK_RATE_UHBR10:
 		link_rate = "UHBR10";
 		break;
@@ -2021,7 +1885,6 @@ static void print_status_message(
 	case LINK_RATE_UHBR20:
 		link_rate = "UHBR20";
 		break;
-#endif
 	default:
 		break;
 	}
@@ -2051,7 +1914,6 @@ static void print_status_message(
 	case LINK_TRAINING_LINK_LOSS:
 		lt_result = "Link loss";
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case DP_128b_132b_LT_FAILED:
 		lt_result = "LT_FAILED received";
 		break;
@@ -2064,7 +1926,6 @@ static void print_status_message(
 	case DP_128b_132b_CDS_DONE_TIMEOUT:
 		lt_result = "CDS timeout";
 		break;
-#endif
 	default:
 		break;
 	}
@@ -2084,9 +1945,9 @@ static void print_status_message(
 	}
 
 	/* Connectivity log: link training */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+
 	/* TODO - DP2.0 Log: add connectivity log for FFE PRESET */
-#endif
+
 	CONN_MSG_LT(link, "%sx%d %s VS=%d, PE=%d, DS=%s",
 				link_rate,
 				lt_settings->link_settings.lane_count,
@@ -2174,15 +2035,12 @@ enum dc_status dpcd_configure_lttpr_mode(struct dc_link *link, struct link_train
 
 static void dpcd_exit_training_mode(struct dc_link *link)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	uint8_t sink_status = 0;
 	uint8_t i;
-#endif
 
 	/* clear training pattern set */
 	dpcd_set_training_pattern(link, DP_TRAINING_PATTERN_VIDEOIDLE);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* poll for intra-hop disable */
 	for (i = 0; i < 10; i++) {
 		if ((core_link_read_dpcd(link, DP_SINK_STATUS, &sink_status, 1) == DC_OK) &&
@@ -2190,7 +2048,6 @@ static void dpcd_exit_training_mode(struct dc_link *link)
 			break;
 		udelay(1000);
 	}
-#endif
 }
 
 enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
@@ -2214,7 +2071,6 @@ enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
 	return status;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static void dpcd_128b_132b_get_aux_rd_interval(struct dc_link *link,
 		uint32_t *interval_in_us)
 {
@@ -2345,7 +2201,6 @@ static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
 
 	return status;
 }
-#endif
 
 static enum link_training_result dp_perform_8b_10b_link_training(
 		struct dc_link *link,
@@ -2406,7 +2261,6 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 	return status;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static enum link_training_result dp_perform_128b_132b_link_training(
 		struct dc_link *link,
 		const struct link_resource *link_res,
@@ -2434,7 +2288,6 @@ static enum link_training_result dp_perform_128b_132b_link_training(
 
 	return result;
 }
-#endif
 
 static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequence(
 	struct dc_link *link,
@@ -2511,11 +2364,7 @@ static enum link_training_result dc_link_dp_perform_fixed_vs_pe_training_sequenc
 	core_link_write_dpcd(link, DP_LANE_COUNT_SET,
 		&lane_count_set.raw, 1);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	rate = get_dpcd_link_rate(&lt_settings->link_settings);
-#else
-	rate = (uint8_t) (lt_settings->link_settings.link_rate);
-#endif
 
 	/* Vendor specific: Toggle link rate */
 	toggle_rate = (rate == 0x6) ? 0xA : 0x6;
@@ -2816,10 +2665,8 @@ enum link_training_result dc_link_dp_perform_link_training(
 		status = dc_link_dp_perform_fixed_vs_pe_training_sequence(link, link_res, &lt_settings);
 	else if (encoding == DP_8b_10b_ENCODING)
 		status = dp_perform_8b_10b_link_training(link, link_res, &lt_settings);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	else if (encoding == DP_128b_132b_ENCODING)
 		status = dp_perform_128b_132b_link_training(link, link_res, &lt_settings);
-#endif
 	else
 		ASSERT(0);
 
@@ -3071,14 +2918,10 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
 		dp_cs_id, link_settings);
 
 	/* Set FEC enable */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
-#endif
 		fec_enable = lt_overrides->fec_enable && *lt_overrides->fec_enable;
 		dp_set_fec_ready(link, NULL, fec_enable);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	}
-#endif
 
 	if (lt_overrides->alternate_scrambler_reset) {
 		if (*lt_overrides->alternate_scrambler_reset)
@@ -3121,13 +2964,9 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
 	 * Still shouldn't turn off dp_receiver (DPCD:600h)
 	 */
 	if (link_down == true) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		struct dc_link_settings link_settings = link->cur_link_settings;
-#endif
 		dp_disable_link_phy(link, NULL, link->connector_signal);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
-#endif
 			dp_set_fec_ready(link, NULL, false);
 	}
 
@@ -3135,7 +2974,6 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
 	return true;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
 {
 	enum dc_link_rate lttpr_max_link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
@@ -3149,7 +2987,6 @@ static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
 
 	return lttpr_max_link_rate;
 }
-#endif
 
 bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
 {
@@ -3555,14 +3392,12 @@ static enum dc_lane_count reduce_lane_count(enum dc_lane_count lane_count)
 static enum dc_link_rate reduce_link_rate(enum dc_link_rate link_rate)
 {
 	switch (link_rate) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case LINK_RATE_UHBR20:
 		return LINK_RATE_UHBR13_5;
 	case LINK_RATE_UHBR13_5:
 		return LINK_RATE_UHBR10;
 	case LINK_RATE_UHBR10:
 		return LINK_RATE_HIGH3;
-#endif
 	case LINK_RATE_HIGH3:
 		return LINK_RATE_HIGH2;
 	case LINK_RATE_HIGH2:
@@ -3597,20 +3432,17 @@ static enum dc_link_rate increase_link_rate(enum dc_link_rate link_rate)
 		return LINK_RATE_HIGH2;
 	case LINK_RATE_HIGH2:
 		return LINK_RATE_HIGH3;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case LINK_RATE_HIGH3:
 		return LINK_RATE_UHBR10;
 	case LINK_RATE_UHBR10:
 		return LINK_RATE_UHBR13_5;
 	case LINK_RATE_UHBR13_5:
 		return LINK_RATE_UHBR20;
-#endif
 	default:
 		return LINK_RATE_UNKNOWN;
 	}
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static bool decide_fallback_link_setting_max_bw_policy(
 		const struct dc_link_settings *max,
 		struct dc_link_settings *cur)
@@ -3644,7 +3476,6 @@ static bool decide_fallback_link_setting_max_bw_policy(
 
 	return found;
 }
-#endif
 
 /*
  * function: set link rate and lane count fallback based
@@ -3662,12 +3493,10 @@ static bool decide_fallback_link_setting(
 {
 	if (!current_link_setting)
 		return false;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(&initial_link_settings) == DP_128b_132b_ENCODING ||
 			link->dc->debug.force_dp2_lt_fallback_method)
 		return decide_fallback_link_setting_max_bw_policy(&initial_link_settings,
 				current_link_setting);
-#endif
 
 	switch (training_result) {
 	case LINK_TRAINING_CR_FAIL_LANE0:
@@ -4205,15 +4034,9 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	union phy_test_pattern dpcd_test_pattern;
 	union lane_adjust dpcd_lane_adjustment[2];
 	unsigned char dpcd_post_cursor_2_adjustment = 0;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	unsigned char test_pattern_buffer[
 			(DP_TEST_264BIT_CUSTOM_PATTERN_263_256 -
 			DP_TEST_264BIT_CUSTOM_PATTERN_7_0)+1] = {0};
-#else
-	unsigned char test_pattern_buffer[
-			(DP_TEST_80BIT_CUSTOM_PATTERN_79_72 -
-			DP_TEST_80BIT_CUSTOM_PATTERN_7_0)+1] = {0};
-#endif
 	unsigned int test_pattern_size = 0;
 	enum dp_test_pattern test_pattern;
 	union lane_adjust dpcd_lane_adjust;
@@ -4284,7 +4107,6 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	case PHY_TEST_PATTERN_CP2520_3:
 		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case PHY_TEST_PATTERN_128b_132b_TPS1:
 		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1;
 		break;
@@ -4312,7 +4134,6 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	case PHY_TEST_PATTERN_SQUARE_PULSE:
 		test_pattern = DP_TEST_PATTERN_SQUARE_PULSE;
 		break;
-#endif
 	default:
 		test_pattern = DP_TEST_PATTERN_VIDEO_MODE;
 	break;
@@ -4328,7 +4149,6 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 				test_pattern_size);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (test_pattern == DP_TEST_PATTERN_SQUARE_PULSE) {
 		test_pattern_size = 1; // Square pattern data is 1 byte (DP spec)
 		core_link_read_dpcd(
@@ -4347,7 +4167,6 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 				test_pattern_buffer,
 				test_pattern_size);
 	}
-#endif
 
 	/* prepare link training settings */
 	link_training_settings.link_settings = link->cur_link_settings;
@@ -4368,14 +4187,11 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 			link_training_settings.hw_lane_settings[lane].POST_CURSOR2 =
 				(enum dc_post_cursor2)
 				((dpcd_post_cursor_2_adjustment >> (lane * 2)) & 0x03);
-		}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-		else if (dp_get_link_encoding_format(&link->cur_link_settings) ==
+		} else if (dp_get_link_encoding_format(&link->cur_link_settings) ==
 				DP_128b_132b_ENCODING) {
 			link_training_settings.hw_lane_settings[lane].FFE_PRESET.raw =
 					dpcd_lane_adjust.tx_ffe.PRESET_VALUE;
 		}
-#endif
 	}
 
 	dp_hw_to_dpcd_lane_settings(&link_training_settings,
@@ -5072,7 +4888,6 @@ static void get_active_converter_info(
 			dp_hw_fw_revision.ieee_fw_rev,
 			sizeof(dp_hw_fw_revision.ieee_fw_rev));
 	}
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14 &&
 			link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
 		union dp_dfp_cap_ext dfp_cap_ext;
@@ -5108,7 +4923,6 @@ static void get_active_converter_info(
 		DC_LOG_DP2("\tdfp_cap_ext.max_video_h_active_width = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width);
 		DC_LOG_DP2("\tdfp_cap_ext.max_video_v_active_height = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height);
 	}
-#endif
 }
 
 static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
@@ -5168,12 +4982,8 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
 
 bool dp_retrieve_lttpr_cap(struct dc_link *link)
 {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	uint8_t lttpr_dpcd_data[8];
 	bool allow_lttpr_non_transparent_mode = 0;
-#else
-	uint8_t lttpr_dpcd_data[6];
-#endif
 	bool vbios_lttpr_enable = link->dc->caps.vbios_lttpr_enable;
 	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
 	enum dc_status status = DC_ERROR_UNEXPECTED;
@@ -5181,7 +4991,6 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 
 	memset(lttpr_dpcd_data, '\0', sizeof(lttpr_dpcd_data));
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
 			link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
 		allow_lttpr_non_transparent_mode = 1;
@@ -5189,7 +4998,6 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 			!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
 		allow_lttpr_non_transparent_mode = 1;
 	}
-#endif
 
 	/*
 	 * Logic to determine LTTPR mode
@@ -5198,21 +5006,12 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 	if (vbios_lttpr_enable && vbios_lttpr_interop)
 		link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
 	else if (!vbios_lttpr_enable && vbios_lttpr_interop) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (allow_lttpr_non_transparent_mode)
-#else
-		if (link->dc->config.allow_lttpr_non_transparent_mode)
-#endif
 			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
 		else
 			link->lttpr_mode = LTTPR_MODE_TRANSPARENT;
 	} else if (!vbios_lttpr_enable && !vbios_lttpr_interop) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (!allow_lttpr_non_transparent_mode || !link->dc->caps.extended_aux_timeout_support)
-#else
-		if (!link->dc->config.allow_lttpr_non_transparent_mode
-			|| !link->dc->caps.extended_aux_timeout_support)
-#endif
 			link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
 		else
 			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
@@ -5262,7 +5061,6 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 				lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
 				lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
@@ -5270,7 +5068,6 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 		link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
 				lttpr_dpcd_data[DP_PHY_REPEATER_128b_132b_RATES -
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-#endif
 
 		/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
 		is_lttpr_present = (dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) != 0 &&
@@ -5528,7 +5325,6 @@ static bool retrieve_link_cap(struct dc_link *link)
 				DP_DSC_SUPPORT,
 				link->dpcd_caps.dsc_caps.dsc_basic_caps.raw,
 				sizeof(link->dpcd_caps.dsc_caps.dsc_basic_caps.raw));
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
 			status = core_link_read_dpcd(
 					link,
@@ -5543,19 +5339,12 @@ static bool retrieve_link_cap(struct dc_link *link)
 			DC_LOG_DSC("\tBRANCH_MAX_LINE_WIDTH 0x%02x",
 					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_MAX_LINE_WIDTH);
 		}
-#else
-		status = core_link_read_dpcd(
-				link,
-				DP_DSC_BRANCH_OVERALL_THROUGHPUT_0,
-				link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw,
-				sizeof(link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw));
-#endif
 
 		/* Apply work around to disable FEC and DSC for USB4 tunneling in TBT3 compatibility mode
 		 * only if required.
 		 */
 		if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
-#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 				!link->dc->debug.dpia_debug.bits.disable_force_tbt3_work_around &&
 #endif
 				link->dpcd_caps.is_branch_dev &&
@@ -5577,7 +5366,6 @@ static bool retrieve_link_cap(struct dc_link *link)
 	if (!dpcd_read_sink_ext_caps(link))
 		link->dpcd_sink_ext_caps.raw = 0;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	link->dpcd_caps.channel_coding_cap.raw = dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_CAP - DP_DPCD_REV];
 
 	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
@@ -5624,7 +5412,6 @@ static bool retrieve_link_cap(struct dc_link *link)
 		if (link->dpcd_caps.fec_cap1.bits.AGGREGATED_ERROR_COUNTERS_CAPABLE)
 			DC_LOG_DP2("\tFEC aggregated error counters are supported");
 	}
-#endif
 
 	/* Connectivity log: detection */
 	CONN_DATA_DETECT(link, dpcd_data, sizeof(dpcd_data), "Rx Caps: ");
@@ -6096,7 +5883,6 @@ bool dc_link_dp_set_test_pattern(
 		case DP_TEST_PATTERN_CP2520_3:
 			pattern = PHY_TEST_PATTERN_CP2520_3;
 			break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		case DP_TEST_PATTERN_128b_132b_TPS1:
 			pattern = PHY_TEST_PATTERN_128b_132b_TPS1;
 			break;
@@ -6124,7 +5910,6 @@ bool dc_link_dp_set_test_pattern(
 		case DP_TEST_PATTERN_SQUARE_PULSE:
 			pattern = PHY_TEST_PATTERN_SQUARE_PULSE;
 			break;
-#endif
 		default:
 			return false;
 		}
@@ -6727,15 +6512,12 @@ enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings
 	if ((link_settings->link_rate >= LINK_RATE_LOW) &&
 			(link_settings->link_rate <= LINK_RATE_HIGH3))
 		return DP_8b_10b_ENCODING;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	else if ((link_settings->link_rate >= LINK_RATE_UHBR10) &&
 			(link_settings->link_rate <= LINK_RATE_UHBR20))
 		return DP_128b_132b_ENCODING;
-#endif
 	return DP_UNKNOWN_ENCODING;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
 {
 	struct dc_link_settings link_settings = {0};
@@ -6952,7 +6734,6 @@ bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->link_res.hpo_dp_link_enc &&
 			dc_is_dp_signal(pipe_ctx->stream->signal));
 }
-#endif
 
 void edp_panel_backlight_power_on(struct dc_link *link)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index e2409c14df34..c84822cd7e53 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -120,49 +120,32 @@ void dp_enable_link_phy(
 
 	link->cur_link_settings = *link_settings;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		/* TODO - DP2.0 HW: notify link rate change here */
 	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 		if (dc->clk_mgr->funcs->notify_link_rate_change)
 			dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
 	}
-#else
-	if (dc->clk_mgr->funcs->notify_link_rate_change)
-		dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
-#endif
+
 	if (dmcu != NULL && dmcu->funcs->lock_phy)
 		dmcu->funcs->lock_phy(dmcu);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
 		enable_dp_hpo_output(link, link_res, link_settings);
 	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
 		if (dc_is_dp_sst_signal(signal)) {
 			link_enc->funcs->enable_dp_output(
-							link_enc,
-							link_settings,
-							clock_source);
+					link_enc,
+					link_settings,
+					clock_source);
 		} else {
 			link_enc->funcs->enable_dp_mst_output(
-							link_enc,
-							link_settings,
-							clock_source);
+					link_enc,
+					link_settings,
+					clock_source);
 		}
 	}
-#else
-	if (dc_is_dp_sst_signal(signal)) {
-		link_enc->funcs->enable_dp_output(
-						link_enc,
-						link_settings,
-						clock_source);
-	} else {
-		link_enc->funcs->enable_dp_mst_output(
-						link_enc,
-						link_settings,
-						clock_source);
-	}
-#endif
+
 	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
@@ -242,9 +225,7 @@ void dp_disable_link_phy(struct dc_link *link, const struct link_resource *link_
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmcu *dmcu = dc->res_pool->dmcu;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_link_encoder *hpo_link_enc = link_res->hpo_dp_link_enc;
-#endif
 	struct link_encoder *link_enc;
 
 	/* Link should always be assigned encoder when en-/disabling. */
@@ -260,28 +241,22 @@ void dp_disable_link_phy(struct dc_link *link, const struct link_resource *link_
 	if (signal == SIGNAL_TYPE_EDP) {
 		if (link->dc->hwss.edp_backlight_control)
 			link->dc->hwss.edp_backlight_control(link, false);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+
 		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
 			disable_dp_hpo_output(link, link_res, signal);
 		else
 			link_enc->funcs->disable_output(link_enc, signal);
-#else
-		link_enc->funcs->disable_output(link_enc, signal);
-#endif
 		link->dc->hwss.edp_power_control(link, false);
 	} else {
 		if (dmcu != NULL && dmcu->funcs->lock_phy)
 			dmcu->funcs->lock_phy(dmcu);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING &&
 				hpo_link_enc)
 			disable_dp_hpo_output(link, link_res, signal);
 		else
 			link_enc->funcs->disable_output(link_enc, signal);
-#else
-		link_enc->funcs->disable_output(link_enc, signal);
-#endif
+
 		if (dmcu != NULL && dmcu->funcs->unlock_phy)
 			dmcu->funcs->unlock_phy(dmcu);
 	}
@@ -330,14 +305,12 @@ bool dp_set_hw_training_pattern(
 	case DP_TRAINING_PATTERN_SEQUENCE_4:
 		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
 		break;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	case DP_128b_132b_TPS1:
 		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE;
 		break;
 	case DP_128b_132b_TPS2:
 		test_pattern = DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE;
 		break;
-#endif
 	default:
 		break;
 	}
@@ -347,10 +320,8 @@ bool dp_set_hw_training_pattern(
 	return true;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #define DC_LOGGER \
 	link->ctx->logger
-#endif
 void dp_set_hw_lane_settings(
 	struct dc_link *link,
 	const struct link_resource *link_res,
@@ -363,7 +334,6 @@ void dp_set_hw_lane_settings(
 		return;
 
 	/* call Encoder to set lane settings */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (dp_get_link_encoding_format(&link_settings->link_settings) ==
 			DP_128b_132b_ENCODING) {
 		link_res->hpo_dp_link_enc->funcs->set_ffe(
@@ -374,9 +344,6 @@ void dp_set_hw_lane_settings(
 			== DP_8b_10b_ENCODING) {
 		encoder->funcs->dp_set_lane_settings(encoder, link_settings);
 	}
-#else
-	encoder->funcs->dp_set_lane_settings(encoder, link_settings);
-#endif
 	memmove(link->cur_lane_setting,
 			link_settings->lane_settings,
 			sizeof(link->cur_lane_setting));
@@ -391,9 +358,7 @@ void dp_set_hw_test_pattern(
 {
 	struct encoder_set_dp_phy_pattern_param pattern_param = {0};
 	struct link_encoder *encoder;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum dp_link_encoding link_encoding_format = dp_get_link_encoding_format(&link->cur_link_settings);
-#endif
 
 	/* Access link encoder based on whether it is statically
 	 * or dynamically assigned to a link.
@@ -409,7 +374,6 @@ void dp_set_hw_test_pattern(
 	pattern_param.custom_pattern_size = custom_pattern_size;
 	pattern_param.dp_panel_mode = dp_get_panel_mode(link);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	switch (link_encoding_format) {
 	case DP_128b_132b_ENCODING:
 		link_res->hpo_dp_link_enc->funcs->set_link_test_pattern(
@@ -423,14 +387,10 @@ void dp_set_hw_test_pattern(
 		DC_LOG_ERROR("%s: Unknown link encoding format.", __func__);
 		break;
 	}
-#else
-	encoder->funcs->dp_set_phy_pattern(encoder, &pattern_param);
-#endif
+
 	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #undef DC_LOGGER
-#endif
 
 void dp_retrain_link_dp_test(struct dc_link *link,
 			struct dc_link_settings *link_setting,
@@ -579,12 +539,8 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		optc_dsc_mode = dsc_optc_cfg.is_pixel_format_444 ? OPTC_DSC_ENABLED_444 : OPTC_DSC_ENABLED_NATIVE_SUBSAMPLED;
 
 		/* Enable DSC in encoder */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
 				&& !is_dp_128b_132b_signal(pipe_ctx)) {
-#else
-		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
-#endif
 			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
 			dsc_optc_config_log(dsc, &dsc_optc_cfg);
 			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
@@ -610,17 +566,13 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 		/* disable DSC in stream encoder */
 		if (dc_is_dp_signal(stream->signal)) {
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
 										false,
 										NULL,
 										true);
-			else
-#endif
-				if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+			else if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
 					pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(
 							pipe_ctx->stream_res.stream_enc,
 							OPTC_DSC_DISABLED, 0, 0);
@@ -696,7 +648,6 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 		dsc->funcs->dsc_get_packed_pps(dsc, &dsc_cfg, &dsc_packed_pps[0]);
 		if (dc_is_dp_signal(stream->signal)) {
 			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -704,7 +655,6 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 										&dsc_packed_pps[0],
 										immediate_update);
 			else
-#endif
 				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.stream_enc,
 										true,
@@ -714,7 +664,6 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 	} else {
 		/* disable DSC PPS in stream encoder */
 		if (dc_is_dp_signal(stream->signal)) {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
 										pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -722,7 +671,6 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_u
 										NULL,
 										true);
 			else
-#endif
 				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
 							pipe_ctx->stream_res.stream_enc, false, NULL, true);
 		}
@@ -746,7 +694,6 @@ bool dp_update_dsc_config(struct pipe_ctx *pipe_ctx)
 	return true;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #undef DC_LOGGER
 #define DC_LOGGER \
 	link->ctx->logger
@@ -898,4 +845,3 @@ void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable)
 }
 
 #undef DC_LOGGER
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index b34bf59cf54b..3aa6d347d73c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -356,7 +356,6 @@ bool resource_construct(
 		}
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	pool->hpo_dp_stream_enc_count = 0;
 	if (create_funcs->create_hpo_dp_stream_encoder) {
 		for (i = 0; i < caps->num_hpo_dp_stream_encoder; i++) {
@@ -377,7 +376,6 @@ bool resource_construct(
 			pool->hpo_dp_link_enc_count++;
 		}
 	}
-#endif
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	for (i = 0; i < caps->num_mpc_3dlut; i++) {
@@ -1713,7 +1711,6 @@ static void update_stream_engine_usage(
 	}
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static void update_hpo_dp_stream_engine_usage(
 		struct resource_context *res_ctx,
 		const struct resource_pool *pool,
@@ -1815,7 +1812,6 @@ static void remove_hpo_dp_link_enc_from_ctx(struct resource_context *res_ctx,
 		pipe_ctx->link_res.hpo_dp_link_enc = NULL;
 	}
 }
-#endif
 
 /* TODO: release audio object */
 void update_audio_usage(
@@ -1861,7 +1857,6 @@ static int acquire_first_free_pipe(
 	return -1;
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 static struct hpo_dp_stream_encoder *find_first_free_match_hpo_dp_stream_enc_for_link(
 		struct resource_context *res_ctx,
 		const struct resource_pool *pool,
@@ -1879,7 +1874,6 @@ static struct hpo_dp_stream_encoder *find_first_free_match_hpo_dp_stream_enc_for
 
 	return NULL;
 }
-#endif
 
 static struct audio *find_first_free_audio(
 		struct resource_context *res_ctx,
@@ -1971,7 +1965,6 @@ enum dc_status dc_remove_stream_from_ctx(
 	if (dc->res_pool->funcs->link_enc_unassign)
 		dc->res_pool->funcs->link_enc_unassign(new_ctx, del_pipe->stream);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(del_pipe)) {
 		update_hpo_dp_stream_engine_usage(
 			&new_ctx->res_ctx, dc->res_pool,
@@ -1979,7 +1972,6 @@ enum dc_status dc_remove_stream_from_ctx(
 			false);
 		remove_hpo_dp_link_enc_from_ctx(&new_ctx->res_ctx, del_pipe, del_pipe->stream);
 	}
-#endif
 
 	if (del_pipe->stream_res.audio)
 		update_audio_usage(
@@ -2232,7 +2224,6 @@ enum dc_status resource_map_pool_resources(
 		pipe_ctx->stream_res.stream_enc,
 		true);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* Allocate DP HPO Stream Encoder based on signal, hw capabilities
 	 * and link settings
 	 */
@@ -2257,7 +2248,6 @@ enum dc_status resource_map_pool_resources(
 				return DC_NO_LINK_ENC_RESOURCE;
 		}
 	}
-#endif
 
 	/* TODO: Add check if ASIC support and EDID audio */
 	if (!stream->converter_disable_audio &&
@@ -2927,12 +2917,10 @@ bool pipe_need_reprogram(
 	if (pipe_ctx_old->stream_res.dsc != pipe_ctx->stream_res.dsc)
 		return true;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (pipe_ctx_old->stream_res.hpo_dp_stream_enc != pipe_ctx->stream_res.hpo_dp_stream_enc)
 		return true;
 	if (pipe_ctx_old->link_res.hpo_dp_link_enc != pipe_ctx->link_res.hpo_dp_link_enc)
 		return true;
-#endif
 
 	/* DIG link encoder resource assignment for stream changed. */
 	if (pipe_ctx_old->stream->ctx->dc->res_pool->funcs->link_encs_assign) {
@@ -3199,7 +3187,6 @@ void get_audio_check(struct audio_info *aud_modes,
 	}
 }
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct hpo_dp_link_encoder *resource_get_hpo_dp_link_enc_for_det_lt(
 		const struct resource_context *res_ctx,
 		const struct resource_pool *pool,
@@ -3218,7 +3205,6 @@ struct hpo_dp_link_encoder *resource_get_hpo_dp_link_enc_for_det_lt(
 
 	return hpo_dp_link_enc;
 }
-#endif
 
 void reset_syncd_pipes_from_disabled_pipes(struct dc *dc,
 		struct dc_state *context)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 14abba495f4a..ff5093e52f2d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -195,10 +195,8 @@ struct dc_caps {
 	unsigned int cursor_cache_size;
 	struct dc_plane_cap planes[MAX_PLANES];
 	struct dc_color_caps color;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool dp_hpo;
 	bool hdmi_frl_pcon_support;
-#endif
 	bool edp_dsc_support;
 	bool vbios_lttpr_aware;
 	bool vbios_lttpr_enable;
@@ -306,7 +304,6 @@ struct dc_cap_funcs {
 
 struct link_training_settings;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 union allow_lttpr_non_transparent_mode {
 	struct {
 		bool DP1_4A : 1;
@@ -314,7 +311,7 @@ union allow_lttpr_non_transparent_mode {
 	} bits;
 	unsigned char raw;
 };
-#endif
+
 /* Structure to hold configuration flags set by dm at dc creation. */
 struct dc_config {
 	bool gpu_vm_support;
@@ -327,11 +324,7 @@ struct dc_config {
 	bool edp_no_power_sequencing;
 	bool force_enum_edp;
 	bool forced_clocks;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union allow_lttpr_non_transparent_mode allow_lttpr_non_transparent_mode;
-#else
-	bool allow_lttpr_non_transparent_mode;
-#endif
 	bool multi_mon_pp_mclk_switch;
 	bool disable_dmcu;
 	bool enable_4to1MPC;
@@ -689,13 +682,11 @@ struct dc_debug_options {
 	bool disable_dsc_edp;
 	unsigned int  force_dsc_edp_policy;
 	bool enable_dram_clock_change_one_display_vactive;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* TODO - remove once tested */
 	bool legacy_dp2_lt;
 	bool set_mst_en_for_sst;
 	bool disable_uhbr;
 	bool force_dp2_lt_fallback_method;
-#endif
 	union mem_low_power_enable_options enable_mem_low_power;
 	union root_clock_optimization_options root_clock_optimization;
 	bool hpo_optimization;
@@ -1239,12 +1230,10 @@ struct dpcd_caps {
 	struct psr_caps psr_caps;
 	struct dpcd_usb4_dp_tunneling_info usb4_dp_tun_info;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union dp_128b_132b_supported_link_rates dp_128b_132b_supported_link_rates;
 	union dp_main_line_channel_coding_cap channel_coding_cap;
 	union dp_sink_video_fallback_formats fallback_formats;
 	union dp_fec_capability1 fec_cap1;
-#endif
 };
 
 union dpcd_sink_ext_caps {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 353dac420f34..6d813db6b8dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -53,7 +53,6 @@ enum dc_link_rate {
 	LINK_RATE_RBR2 = 0x0C,		// Rate_5 (RBR2)- 3.24 Gbps/Lane
 	LINK_RATE_RATE_6 = 0x10,	// Rate_6		- 4.32 Gbps/Lane
 	LINK_RATE_HIGH2 = 0x14,		// Rate_7 (HBR2)- 5.40 Gbps/Lane
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	LINK_RATE_HIGH3 = 0x1E,		// Rate_8 (HBR3)- 8.10 Gbps/Lane
 	/* Starting from DP2.0 link rate enum directly represents actual
 	 * link rate value in unit of 10 mbps
@@ -61,9 +60,6 @@ enum dc_link_rate {
 	LINK_RATE_UHBR10 = 1000,	// UHBR10 - 10.0 Gbps/Lane
 	LINK_RATE_UHBR13_5 = 1350,	// UHBR13.5 - 13.5 Gbps/Lane
 	LINK_RATE_UHBR20 = 2000,	// UHBR10 - 20.0 Gbps/Lane
-#else
-	LINK_RATE_HIGH3 = 0x1E		// Rate_8 (HBR3)- 8.10 Gbps/Lane
-#endif
 };
 
 enum dc_link_spread {
@@ -100,7 +96,6 @@ enum dc_post_cursor2 {
 	POST_CURSOR2_MAX_LEVEL = POST_CURSOR2_LEVEL3,
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dc_dp_ffe_preset_level {
 	DP_FFE_PRESET_LEVEL0 = 0,
 	DP_FFE_PRESET_LEVEL1,
@@ -120,7 +115,6 @@ enum dc_dp_ffe_preset_level {
 	DP_FFE_PRESET_LEVEL15,
 	DP_FFE_PRESET_MAX_LEVEL = DP_FFE_PRESET_LEVEL15,
 };
-#endif
 
 enum dc_dp_training_pattern {
 	DP_TRAINING_PATTERN_SEQUENCE_1 = 0,
@@ -128,19 +122,15 @@ enum dc_dp_training_pattern {
 	DP_TRAINING_PATTERN_SEQUENCE_3,
 	DP_TRAINING_PATTERN_SEQUENCE_4,
 	DP_TRAINING_PATTERN_VIDEOIDLE,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DP_128b_132b_TPS1,
 	DP_128b_132b_TPS2,
 	DP_128b_132b_TPS2_CDS,
-#endif
 };
 
 enum dp_link_encoding {
 	DP_UNKNOWN_ENCODING = 0,
 	DP_8b_10b_ENCODING = 1,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DP_128b_132b_ENCODING = 2,
-#endif
 };
 
 struct dc_link_settings {
@@ -152,7 +142,6 @@ struct dc_link_settings {
 	bool dpcd_source_device_specific_field_support;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 union dc_dp_ffe_preset {
 	struct {
 		uint8_t level		: 4;
@@ -163,24 +152,19 @@ union dc_dp_ffe_preset {
 	} settings;
 	uint8_t raw;
 };
-#endif
 
 struct dc_lane_settings {
 	enum dc_voltage_swing VOLTAGE_SWING;
 	enum dc_pre_emphasis PRE_EMPHASIS;
 	enum dc_post_cursor2 POST_CURSOR2;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union dc_dp_ffe_preset FFE_PRESET;
-#endif
 };
 
 struct dc_link_training_overrides {
 	enum dc_voltage_swing *voltage_swing;
 	enum dc_pre_emphasis *pre_emphasis;
 	enum dc_post_cursor2 *post_cursor2;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union dc_dp_ffe_preset *ffe_preset;
-#endif
 
 	uint16_t *cr_pattern_time;
 	uint16_t *eq_pattern_time;
@@ -194,7 +178,6 @@ struct dc_link_training_overrides {
 	bool *fec_enable;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 union payload_table_update_status {
 	struct {
 		uint8_t  VC_PAYLOAD_TABLE_UPDATED:1;
@@ -202,7 +185,6 @@ union payload_table_update_status {
 	} bits;
 	uint8_t  raw;
 };
-#endif
 
 union dpcd_rev {
 	struct {
@@ -291,14 +273,10 @@ union lane_align_status_updated {
 	struct {
 		uint8_t INTERLANE_ALIGN_DONE:1;
 		uint8_t POST_LT_ADJ_REQ_IN_PROGRESS:1;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		uint8_t EQ_INTERLANE_ALIGN_DONE_128b_132b:1;
 		uint8_t CDS_INTERLANE_ALIGN_DONE_128b_132b:1;
 		uint8_t LT_FAILED_128b_132b:1;
 		uint8_t RESERVED:1;
-#else
-		uint8_t RESERVED:4;
-#endif
 		uint8_t DOWNSTREAM_PORT_STATUS_CHANGED:1;
 		uint8_t LINK_STATUS_UPDATED:1;
 	} bits;
@@ -311,12 +289,10 @@ union lane_adjust {
 		uint8_t PRE_EMPHASIS_LANE:2;
 		uint8_t RESERVED:4;
 	} bits;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct {
 		uint8_t PRESET_VALUE	:4;
 		uint8_t RESERVED	:4;
 	} tx_ffe;
-#endif
 	uint8_t raw;
 };
 
@@ -346,12 +322,10 @@ union dpcd_training_lane {
 		uint8_t MAX_PRE_EMPHASIS_REACHED:1;
 		uint8_t RESERVED:2;
 	} bits;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct {
 		uint8_t PRESET_VALUE	:4;
 		uint8_t RESERVED	:4;
 	} tx_ffe;
-#endif
 	uint8_t raw;
 };
 
@@ -665,18 +639,9 @@ union test_response {
 
 union phy_test_pattern {
 	struct {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		/* This field is 7 bits for DP2.0 */
 		uint8_t PATTERN     :7;
 		uint8_t RESERVED    :1;
-#else
-		/* DpcdPhyTestPatterns. This field is 2 bits for DP1.1
-		 * and 3 bits for DP1.2.
-		 */
-		uint8_t PATTERN     :3;
-		/* BY speci, bit7:2 is 0 for DP1.1. */
-		uint8_t RESERVED    :5;
-#endif
 	} bits;
 	uint8_t raw;
 };
@@ -754,14 +719,10 @@ union dpcd_fec_capability {
 		uint8_t UNCORRECTED_BLOCK_ERROR_COUNT_CAPABLE:1;
 		uint8_t CORRECTED_BLOCK_ERROR_COUNT_CAPABLE:1;
 		uint8_t BIT_ERROR_COUNT_CAPABLE:1;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		uint8_t PARITY_BLOCK_ERROR_COUNT_CAPABLE:1;
 		uint8_t ARITY_BIT_ERROR_COUNT_CAPABLE:1;
 		uint8_t FEC_RUNNING_INDICATOR_SUPPORTED:1;
 		uint8_t FEC_ERROR_REPORTING_POLICY_SUPPORTED:1;
-#else
-		uint8_t RESERVED:4;
-#endif
 	} bits;
 	uint8_t raw;
 };
@@ -925,7 +886,6 @@ struct dpcd_usb4_dp_tunneling_info {
 	uint8_t usb4_topology_id[DPCD_USB4_TOPOLOGY_ID_LEN];
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #ifndef DP_MAIN_LINK_CHANNEL_CODING_CAP
 #define DP_MAIN_LINK_CHANNEL_CODING_CAP			0x006
 #endif
@@ -994,7 +954,6 @@ struct dpcd_usb4_dp_tunneling_info {
 #endif
 #ifndef DP_INTRA_HOP_AUX_REPLY_INDICATION
 #define DP_INTRA_HOP_AUX_REPLY_INDICATION		(1 << 3)
-#endif
 /* TODO - Use DRM header to replace above once available */
 
 union dp_main_line_channel_coding_cap {
@@ -1091,6 +1050,6 @@ union dp_128b_132b_training_aux_rd_interval {
 	} bits;
 	uint8_t raw;
 };
-#endif
 
+#endif // DP_INTRA_HOP_AUX_REPLY_INDICATION
 #endif /* DC_DP_TYPES_H */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 704323654468..9014c0a0a63b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -47,10 +47,8 @@ struct dc_link_status {
 struct link_mst_stream_allocation {
 	/* DIG front */
 	const struct stream_encoder *stream_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* HPO DP Stream Encoder */
 	const struct hpo_dp_stream_encoder *hpo_dp_stream_enc;
-#endif
 	/* associate DRM payload table with DC stream encoder */
 	uint8_t vcp_id;
 	/* number of slots required for the DP stream in transport packet */
@@ -318,10 +316,8 @@ enum dc_detect_reason {
 bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
 bool dc_link_get_hpd_state(struct dc_link *dc_link);
 enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
 enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
-#endif
 
 /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
  * Return:
@@ -455,10 +451,8 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 bool dc_link_is_fec_supported(const struct dc_link *link);
 bool dc_link_should_enable_fec(const struct dc_link *link);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw);
 enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link);
-#endif
 
 const struct link_resource *dc_link_get_cur_link_res(const struct dc_link *link);
 /* take a snapshot of current link resource allocation state */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index e37c4a10bfd5..f631b61abedd 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -115,12 +115,10 @@ struct periodic_interrupt_config {
 	int lines_offset;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct dc_mst_stream_bw_update {
 	bool is_increase; // is bandwidth reduced or increased
 	uint32_t mst_stream_bw; // new mst bandwidth in kbps
 };
-#endif
 
 union stream_update_flags {
 	struct {
@@ -132,9 +130,7 @@ union stream_update_flags {
 		uint32_t gamut_remap:1;
 		uint32_t wb_update:1;
 		uint32_t dsc_changed : 1;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		uint32_t mst_bw : 1;
-#endif
 	} bits;
 
 	uint32_t raw;
@@ -288,9 +284,7 @@ struct dc_stream_update {
 
 	struct dc_writeback_update *wb_update;
 	struct dc_dsc_config *dsc_config;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_mst_stream_bw_update *mst_bw_update;
-#endif
 	struct dc_transfer_func *func_shaper;
 	struct dc_3dlut *lut3d_func;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 0285a4b38d05..48859d5fc172 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -395,14 +395,11 @@ struct dc_lttpr_caps {
 	uint8_t max_link_rate;
 	uint8_t phy_repeater_cnt;
 	uint8_t max_ext_timeout;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	union dp_main_link_channel_coding_lttpr_cap main_link_channel_coding;
 	union dp_128b_132b_supported_lttpr_link_rates supported_128b_132b_rates;
-#endif
 	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct dc_dongle_dfp_cap_ext {
 	bool supported;
 	uint16_t max_pixel_rate_in_mps;
@@ -414,7 +411,6 @@ struct dc_dongle_dfp_cap_ext {
 	struct dp_color_depth_caps ycbcr422_color_depth_caps;
 	struct dp_color_depth_caps ycbcr420_color_depth_caps;
 };
-#endif
 
 struct dc_dongle_caps {
 	/* dongle type (DP converter, CV smart dongle) */
@@ -429,10 +425,8 @@ struct dc_dongle_caps {
 	bool is_dp_hdmi_ycbcr420_converter;
 	uint32_t dp_hdmi_max_bpc;
 	uint32_t dp_hdmi_max_pixel_clk_in_khz;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	uint32_t dp_hdmi_frl_max_link_bw_in_kbps;
 	struct dc_dongle_dfp_cap_ext dfp_cap_ext;
-#endif
 };
 /* Scaling format */
 enum scaling_transformation {
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index f1593186e964..9857e7b1b37d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -49,9 +49,7 @@
 #include "link_enc_cfg.h"
 #include "link_hwss.h"
 #include "dc_link_dp.h"
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "dccg.h"
-#endif
 #include "clock_source.h"
 #include "clk_mgr.h"
 #include "abm.h"
@@ -1112,17 +1110,12 @@ void dce110_enable_audio_stream(struct pipe_ctx *pipe_ctx)
 			clk_mgr->funcs->enable_pme_wa(clk_mgr);
 		/* un-mute audio */
 		/* TODO: audio should be per stream rather than per link */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		if (is_dp_128b_132b_signal(pipe_ctx))
 			pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->audio_mute_control(
 					pipe_ctx->stream_res.hpo_dp_stream_enc, false);
 		else
 			pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
 					pipe_ctx->stream_res.stream_enc, false);
-#else
-		pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
-				pipe_ctx->stream_res.stream_enc, false);
-#endif
 		if (pipe_ctx->stream_res.audio)
 			pipe_ctx->stream_res.audio->enabled = true;
 	}
@@ -1145,32 +1138,22 @@ void dce110_disable_audio_stream(struct pipe_ctx *pipe_ctx)
 	if (pipe_ctx->stream_res.audio && pipe_ctx->stream_res.audio->enabled == false)
 		return;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx))
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->audio_mute_control(
 				pipe_ctx->stream_res.hpo_dp_stream_enc, true);
 	else
 		pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
 				pipe_ctx->stream_res.stream_enc, true);
-#else
-	pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
-			pipe_ctx->stream_res.stream_enc, true);
-#endif
 	if (pipe_ctx->stream_res.audio) {
 		pipe_ctx->stream_res.audio->enabled = false;
 
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_disable(
 						pipe_ctx->stream_res.hpo_dp_stream_enc);
 			else
 				pipe_ctx->stream_res.stream_enc->funcs->dp_audio_disable(
 						pipe_ctx->stream_res.stream_enc);
-#else
-			pipe_ctx->stream_res.stream_enc->funcs->dp_audio_disable(
-					pipe_ctx->stream_res.stream_enc);
-#endif
 		else
 			pipe_ctx->stream_res.stream_enc->funcs->hdmi_audio_disable(
 					pipe_ctx->stream_res.stream_enc);
@@ -1204,14 +1187,10 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->stop_dp_info_packets(
 					pipe_ctx->stream_res.hpo_dp_stream_enc);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal))
-#else
-	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-#endif
 		pipe_ctx->stream_res.stream_enc->funcs->stop_dp_info_packets(
 			pipe_ctx->stream_res.stream_enc);
 
@@ -1224,7 +1203,6 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 		link_enc = link_enc_cfg_get_link_enc_used_by_link(link->ctx->dc, link);
 	ASSERT(link_enc);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->disable(
 				pipe_ctx->stream_res.hpo_dp_stream_enc);
@@ -1237,13 +1215,7 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
 				pipe_ctx->stream_res.stream_enc->id,
 				false);
 	}
-#else
-	if (link_enc)
-		link_enc->funcs->connect_dig_be_to_fe(
-			link->link_enc,
-			pipe_ctx->stream_res.stream_enc->id,
-			false);
-#endif
+
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
 		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
 
@@ -1285,15 +1257,11 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
 	}
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
 		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_blank(
 				pipe_ctx->stream_res.hpo_dp_stream_enc);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
-#else
-	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
-#endif
 		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(link, pipe_ctx->stream_res.stream_enc);
 
 		if (!dc_is_embedded_signal(pipe_ctx->stream->signal)) {
@@ -1535,7 +1503,6 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 		build_audio_output(context, pipe_ctx, &audio_output);
 
 		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 			if (is_dp_128b_132b_signal(pipe_ctx))
 				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_setup(
 						pipe_ctx->stream_res.hpo_dp_stream_enc,
@@ -1546,12 +1513,6 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 						pipe_ctx->stream_res.stream_enc,
 						pipe_ctx->stream_res.audio->inst,
 						&pipe_ctx->stream->audio_info);
-#else
-			pipe_ctx->stream_res.stream_enc->funcs->dp_audio_setup(
-					pipe_ctx->stream_res.stream_enc,
-					pipe_ctx->stream_res.audio->inst,
-					&pipe_ctx->stream->audio_info);
-#endif
 		else
 			pipe_ctx->stream_res.stream_enc->funcs->hdmi_audio_setup(
 					pipe_ctx->stream_res.stream_enc,
@@ -1570,14 +1531,12 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	if (!pipe_ctx->stream->apply_seamless_boot_optimization && dc->config.use_pipe_ctx_sync_logic)
 		check_syncd_pipes_for_disabled_master_pipe(dc, context, pipe_ctx->pipe_idx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* DCN3.1 FPGA Workaround
 	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
 	 * function core_link_enable_stream
 	 */
 	if (!(hws->wa.dp_hpo_and_otg_sequence && is_dp_128b_132b_signal(pipe_ctx)))
-#endif
 		/*  */
 		/* Do not touch stream timing on seamless boot optimization. */
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
@@ -1643,7 +1602,6 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	if (!stream->dpms_off)
 		core_link_enable_stream(context, pipe_ctx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* DCN3.1 FPGA Workaround
 	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
 	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
@@ -1653,7 +1611,6 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
 			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
 	}
-#endif
 
 	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != 0;
 
@@ -2233,8 +2190,6 @@ static void dce110_setup_audio_dto(
 
 			build_audio_output(context, pipe_ctx, &audio_output);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-			/* For DCN3.1, audio to HPO FRL encoder is using audio DTBCLK DTO */
 			if (dc->res_pool->dccg && dc->res_pool->dccg->funcs->set_audio_dtbclk_dto) {
 				/* disable audio DTBCLK DTO */
 				dc->res_pool->dccg->funcs->set_audio_dtbclk_dto(
@@ -2251,13 +2206,6 @@ static void dce110_setup_audio_dto(
 					pipe_ctx->stream->signal,
 					&audio_output.crtc_info,
 					&audio_output.pll_info);
-#else
-			pipe_ctx->stream_res.audio->funcs->wall_dto_setup(
-				pipe_ctx->stream_res.audio,
-				pipe_ctx->stream->signal,
-				&audio_output.crtc_info,
-				&audio_output.pll_info);
-#endif
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 943240e2809e..e90123b0ee0e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -249,12 +249,10 @@ struct resource_pool {
 	/* Number of USB4 DPIA (DisplayPort Input Adapter) link objects created.*/
 	unsigned int usb4_dpia_count;
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	unsigned int hpo_dp_stream_enc_count;
 	struct hpo_dp_stream_encoder *hpo_dp_stream_enc[MAX_HPO_DP2_ENCODERS];
 	unsigned int hpo_dp_link_enc_count;
 	struct hpo_dp_link_encoder *hpo_dp_link_enc[MAX_HPO_DP2_LINK_ENCODERS];
-#endif
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dc_3dlut *mpc_lut[MAX_PIPES];
 	struct dc_transfer_func *mpc_shaper[MAX_PIPES];
@@ -307,9 +305,7 @@ struct stream_resource {
 	struct display_stream_compressor *dsc;
 	struct timing_generator *tg;
 	struct stream_encoder *stream_enc;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_stream_encoder *hpo_dp_stream_enc;
-#endif
 	struct audio *audio;
 
 	struct pixel_clk_params pix_clk_params;
@@ -334,18 +330,12 @@ struct plane_resource {
 	struct dcn_fe_bandwidth bw;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #define LINK_RES_HPO_DP_REC_MAP__MASK 0xFFFF
 #define LINK_RES_HPO_DP_REC_MAP__SHIFT 0
-#endif
 
 /* all mappable hardware resources used to enable a link */
 struct link_resource {
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_link_encoder *hpo_dp_link_enc;
-#else
-	void *dummy;
-#endif
 };
 
 union pipe_update_flags {
@@ -425,11 +415,9 @@ struct resource_context {
 	uint8_t dp_clock_source_ref_count;
 	bool is_dsc_acquired[MAX_PIPES];
 	struct link_enc_cfg_context link_enc_cfg_ctx;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool is_hpo_dp_stream_enc_acquired[MAX_HPO_DP2_ENCODERS];
 	unsigned int hpo_dp_link_enc_to_link_idx[MAX_HPO_DP2_LINK_ENCODERS];
 	int hpo_dp_link_enc_ref_cnts[MAX_HPO_DP2_LINK_ENCODERS];
-#endif
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool is_mpc_3dlut_acquired[MAX_PIPES];
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
index c940fdfda144..b2fa4de47734 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
@@ -79,7 +79,7 @@ struct dccg_funcs {
 	void (*otg_drop_pixel)(struct dccg *dccg,
 			uint32_t otg_inst);
 	void (*dccg_init)(struct dccg *dccg);
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+
 	void (*set_dpstreamclk)(
 			struct dccg *dccg,
 			enum hdmistreamclk_source src,
@@ -102,7 +102,7 @@ struct dccg_funcs {
 	void (*disable_symclk32_le)(
 			struct dccg *dccg,
 			int hpo_le_inst);
-#endif
+
 	void (*set_physymclk)(
 			struct dccg *dccg,
 			int phy_inst,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
index 10ecbc667ffa..d89bd55f110f 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h
@@ -38,10 +38,8 @@
 #define MAX_PIPES 6
 #define MAX_DIG_LINK_ENCODERS 7
 #define MAX_DWB_PIPES	1
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 #define MAX_HPO_DP2_ENCODERS	4
 #define MAX_HPO_DP2_LINK_ENCODERS	2
-#endif
 
 struct gamma_curve {
 	uint32_t offset;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
index 2ce15cd10d80..101444c6f145 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
@@ -220,7 +220,6 @@ enum link_enc_cfg_mode {
 	LINK_ENC_CFG_TRANSIENT /* During commit state - use state to be committed. */
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum dp2_link_mode {
 	DP2_LINK_TRAINING_TPS1,
 	DP2_LINK_TRAINING_TPS2,
@@ -306,6 +305,5 @@ struct hpo_dp_link_encoder_funcs {
 		const struct dc_link_settings *link_settings,
 		uint8_t ffe_preset);
 };
-#endif
 
 #endif /* LINK_ENCODER_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index 073f8b667eff..d9a3a204cc23 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -249,7 +249,6 @@ struct stream_encoder_funcs {
 		struct stream_encoder *enc);
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct hpo_dp_stream_encoder_state {
 	uint32_t stream_enc_enabled;
 	uint32_t vid_stream_enabled;
@@ -329,6 +328,5 @@ struct hpo_dp_stream_encoder_funcs {
 			struct hpo_dp_stream_encoder *enc,
 			struct hpo_dp_stream_encoder_state *state);
 };
-#endif
 
 #endif /* STREAM_ENCODER_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index c29320b3855d..59a704781e34 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -100,9 +100,7 @@ enum crc_selection {
 
 enum otg_out_mux_dest {
 	OUT_MUX_DIO = 0,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	OUT_MUX_HPO_DP = 2,
-#endif
 };
 
 enum h_timing_div_mode {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
index c2008258c50a..280c8764b636 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
@@ -41,9 +41,7 @@ struct dce_hwseq_wa {
 	bool DEGVIDCN10_254;
 	bool DEGVIDCN21;
 	bool disallow_self_refresh_during_multi_plane_transition;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	bool dp_hpo_and_otg_sequence;
-#endif
 };
 
 struct hwseq_wa_state {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index dbfe6690ded8..2a123622564d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -54,10 +54,8 @@ struct resource_caps {
 	int num_dsc;
 	unsigned int num_dig_link_enc; // Total number of DIGs (digital encoders) in DIO (Display Input/Output).
 	unsigned int num_usb4_dpia; // Total number of USB4 DPIA (DisplayPort Input Adapters).
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	int num_hpo_dp_stream_encoder;
 	int num_hpo_dp_link_encoder;
-#endif
 	int num_mpc_3dlut;
 };
 
@@ -77,14 +75,12 @@ struct resource_create_funcs {
 	struct stream_encoder *(*create_stream_encoder)(
 			enum engine_id eng_id, struct dc_context *ctx);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct hpo_dp_stream_encoder *(*create_hpo_dp_stream_encoder)(
 			enum engine_id eng_id, struct dc_context *ctx);
 
 	struct hpo_dp_link_encoder *(*create_hpo_dp_link_encoder)(
 			uint8_t inst,
 			struct dc_context *ctx);
-#endif
 
 	struct dce_hwseq *(*create_hwseq)(
 			struct dc_context *ctx);
@@ -205,12 +201,10 @@ int get_num_mpc_splits(struct pipe_ctx *pipe);
 
 int get_num_odm_splits(struct pipe_ctx *pipe);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 struct hpo_dp_link_encoder *resource_get_hpo_dp_link_enc_for_det_lt(
 		const struct resource_context *res_ctx,
 		const struct resource_pool *pool,
 		const struct dc_link *link);
-#endif
 
 void reset_syncd_pipes_from_disabled_pipes(struct dc *dc,
 	struct dc_state *context);
diff --git a/drivers/gpu/drm/amd/display/include/bios_parser_types.h b/drivers/gpu/drm/amd/display/include/bios_parser_types.h
index b8ffb216ebc4..cf4027cc3f4c 100644
--- a/drivers/gpu/drm/amd/display/include/bios_parser_types.h
+++ b/drivers/gpu/drm/amd/display/include/bios_parser_types.h
@@ -152,10 +152,8 @@ struct bp_transmitter_control {
 	enum signal_type signal;
 	enum dc_color_depth color_depth; /* not used for DCE6.0 */
 	enum hpd_source_id hpd_sel; /* ucHPDSel, used for DCe6.0 */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum tx_ffe_id txffe_sel; /* used for DCN3 */
 	enum engine_id hpo_engine_id; /* used for DCN3 */
-#endif
 	struct graphics_object_id connector_obj_id;
 	/* symClock; in 10kHz, pixel clock, in HDMI deep color mode, it should
 	 * be pixel clock * deep_color_ratio (in KHz)
diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
index ffd0df1701e6..4edaa3318714 100644
--- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
+++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
@@ -144,14 +144,10 @@ enum dpcd_training_patterns {
 	DPCD_TRAINING_PATTERN_1,
 	DPCD_TRAINING_PATTERN_2,
 	DPCD_TRAINING_PATTERN_3,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DPCD_TRAINING_PATTERN_4 = 7,
 	DPCD_128b_132b_TPS1 = 1,
 	DPCD_128b_132b_TPS2 = 2,
 	DPCD_128b_132b_TPS2_CDS = 3,
-#else
-	DPCD_TRAINING_PATTERN_4 = 7
-#endif
 };
 
 /* This enum is for use with PsrSinkPsrStatus.bits.sinkSelfRefreshStatus
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_defs.h
index 84b299ff500a..05ba188a7c3b 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_defs.h
@@ -140,7 +140,6 @@ enum sync_source {
 	SYNC_SOURCE_DUAL_GPU_PIN
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 enum tx_ffe_id {
 	TX_FFE0 = 0,
 	TX_FFE1,
@@ -150,7 +149,6 @@ enum tx_ffe_id {
 	TX_FFE_PreShoot_Only,
 	TX_FFE_No_FFE,
 };
-#endif
 
 /* connector sizes in millimeters - from BiosParserTypes.hpp */
 #define CONNECTOR_SIZE_DVI			40
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_id.h b/drivers/gpu/drm/amd/display/include/grph_object_id.h
index 01775417cf4b..fed1edc038d8 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_id.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_id.h
@@ -184,14 +184,12 @@ enum engine_id {
 	ENGINE_ID_DACA,
 	ENGINE_ID_DACB,
 	ENGINE_ID_VCE,	/* wireless display pseudo-encoder */
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	ENGINE_ID_HPO_0,
 	ENGINE_ID_HPO_1,
 	ENGINE_ID_HPO_DP_0,
 	ENGINE_ID_HPO_DP_1,
 	ENGINE_ID_HPO_DP_2,
 	ENGINE_ID_HPO_DP_3,
-#endif
 	ENGINE_ID_VIRTUAL,
 
 	ENGINE_ID_COUNT,
diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
index 424bccd36434..447a56286dd0 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -74,12 +74,10 @@ enum link_training_result {
 	LINK_TRAINING_LINK_LOSS,
 	/* Abort link training (because sink unplugged) */
 	LINK_TRAINING_ABORT,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DP_128b_132b_LT_FAILED,
 	DP_128b_132b_MAX_LOOP_COUNT_REACHED,
 	DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT,
 	DP_128b_132b_CDS_DONE_TIMEOUT,
-#endif
 };
 
 enum lttpr_mode {
@@ -99,23 +97,19 @@ struct link_training_settings {
 	enum dc_pre_emphasis *pre_emphasis;
 	enum dc_post_cursor2 *post_cursor2;
 	bool should_set_fec_ready;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	/* TODO - factor lane_settings out because it changes during LT */
 	union dc_dp_ffe_preset *ffe_preset;
-#endif
 
 	uint16_t cr_pattern_time;
 	uint16_t eq_pattern_time;
 	uint16_t cds_pattern_time;
 	enum dc_dp_training_pattern pattern_for_cr;
 	enum dc_dp_training_pattern pattern_for_eq;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	enum dc_dp_training_pattern pattern_for_cds;
 
 	uint32_t eq_wait_time_limit;
 	uint8_t eq_loop_count_limit;
 	uint32_t cds_wait_time_limit;
-#endif
 
 	bool enhanced_framing;
 	enum lttpr_mode lttpr_mode;
@@ -161,7 +155,6 @@ enum dp_test_pattern {
 	DP_TEST_PATTERN_CP2520_2,
 	DP_TEST_PATTERN_HBR2_COMPLIANCE_EYE = DP_TEST_PATTERN_CP2520_2,
 	DP_TEST_PATTERN_CP2520_3,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DP_TEST_PATTERN_128b_132b_TPS1,
 	DP_TEST_PATTERN_128b_132b_TPS2,
 	DP_TEST_PATTERN_PRBS9,
@@ -171,20 +164,15 @@ enum dp_test_pattern {
 	DP_TEST_PATTERN_PRBS31,
 	DP_TEST_PATTERN_264BIT_CUSTOM,
 	DP_TEST_PATTERN_SQUARE_PULSE,
-#endif
 
 	/* Link Training Patterns */
 	DP_TEST_PATTERN_TRAINING_PATTERN1,
 	DP_TEST_PATTERN_TRAINING_PATTERN2,
 	DP_TEST_PATTERN_TRAINING_PATTERN3,
 	DP_TEST_PATTERN_TRAINING_PATTERN4,
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 	DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE,
 	DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE,
 	DP_TEST_PATTERN_PHY_PATTERN_END = DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE,
-#else
-	DP_TEST_PATTERN_PHY_PATTERN_END = DP_TEST_PATTERN_TRAINING_PATTERN4,
-#endif
 
 	/* link test patterns*/
 	DP_TEST_PATTERN_COLOR_SQUARES,
-- 
2.25.1

