Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A05F704D
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Oct 2022 23:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF98410E8B6;
	Thu,  6 Oct 2022 21:28:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DECF10E8B7
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Oct 2022 21:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQG9RR3CUBiTdqaVbiuM9oe+fhlIxsRWAJUOL/xSBwUnzcxhIVTUNhA0jIe8kcwIZsCQuZk2HKnEZQxwbfZI5pjcxiT5xDh5XFoPmqchXylfyRQKxkVP5fDDhjj6vg/BL94A9Mmv8om6XryyiK0BSYRYAhoSbizob+hZUlLTQJ/P54Xut2paXGbkfjz8BbYPLi3sx1wJi5kI5cAqeHgNuUwh//TVJbeF/YoQ9va+b9ggVTG1tQRgSL+UOarLKWb1Fj1mYl0yk5Rwlmvi+86lkeXFeSJXqTnedEGJzg7lWToYnIQg0vOA8gAifXiF9IcTo+8/xzOa18Fym+//KXicIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiAWhGsl7fuIoZC+aqqD+9ygXmtoE3c92fGB4eeGWt4=;
 b=mgFtlkxGz6x98nOXmKwq87iL17UrrJZFeXiaqUa4OwWpoDSCUhaf24B4bWzpyCkzvV8RBzTVz/quuK77+KvWQRP4TMuWM5+Xr019utnyF4PWsQT6rvIkkOtmbThE3U+SjPxUc22ul5vaUoo1FUySyqrzlHgLKCxcHa19mwYxEFP79RcUOW+dLjTnl70yALP9DIUdGHVIPdKM75CxQYjf+upzUpITJfXPDYz1u05MlPejpPWF/GPmxt7IP/9bTk7cuo8J5H8Cz9Bf+G3o7SjehY1+m/XBCDTIkYWE5ePnd7g0HBdKcLypDYdmCtFTYL9Cmul9eCdk8M8GufNRDDWa5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiAWhGsl7fuIoZC+aqqD+9ygXmtoE3c92fGB4eeGWt4=;
 b=OcSs2onGSM6Nmg5Squl7ISBLl48vvJzEUEiTCG0L0Qr7E4VreW7WCi+g+qTXZtzBYg7K/mDGDRS6qVgyF9/7/IPGBUGeAjNTAJibGXsgfnJu/ZvQa0xh8BZkfrF8mG5wjEkALaebMjRZ60F7tdcYNJhNYoz5ksqMqj5L22SsjSQ=
Received: from BN9PR03CA0176.namprd03.prod.outlook.com (2603:10b6:408:f4::31)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Thu, 6 Oct
 2022 21:27:46 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::52) by BN9PR03CA0176.outlook.office365.com
 (2603:10b6:408:f4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Thu, 6 Oct 2022 21:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 21:27:46 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 6 Oct
 2022 16:27:44 -0500
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/23] drm/amd/display: Use the same cursor info across
 features
Date: Thu, 6 Oct 2022 17:26:40 -0400
Message-ID: <20221006212650.561923-14-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006212650.561923-1-qingqing.zhuo@amd.com>
References: <20221006212650.561923-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 1426efe5-47b6-456f-dbdd-08daa7e19ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2IVg/ahDMaRPXXzyKnCraz2ElvBjsQPcsJ/2osDCoLdYyxHcJr6RCDvlOuOVTxrid5QW9P2gJ5cM9vmcfJXIkhTXta04hlglv9dwZRk9RC8a/KH4KeWLrc2dSRzndJhsXE3WY/07GyjDBF7lVCJw8AwkVR04eZGSUblqAJkYHD3Cw3ScwRDsnpauGtl8s/bZVjtfi2FlGFRu9FJkDKSeYqle3A7aLPF+URdu67UI/zjqoafSqzutNdYt/FZTlMmCxtvSkxDas5wEzYQn0X9PXj0QagbHviWFVDD+xrBCvxiooeLggvw6gGj/ZBAqPm9UyULjqugFPD+aHTqOM6elPiLPFcgq9PLxBaT7o4O4r8XvwHXAJFpdDROwY0pXuwlKElHh9EDjjbELq+n/LAAOAFkX8fdcSqizDSyWHEJzNXpT6jAXPP21xevMjy5b4KFI/5KklmrgSt7806oPEOQkX8c4WHbd4PKzSHkCpWa9DwCx7UrPhpDki/NHLpoY0khtGGBsb3g/VD4XFCVUg0RzrlC6nkVIxmdpr3RK9HPxlW0JY4ddD0N4+IEwFjJ/mO/rxqSAiGAWDnmr8G5NU71a3ipSqadI9NmSSsKYO1HTDj8F1Ot0VJ5BqhsHvBPRKozE4oNpZEfLDlXmTYh/ZT5Rg8m6J9anuG0FmRK/kZdqHHvI11dSWhqgCuOXIbw/v0ZI90mtS0WL1hPoLzg/eKFUFOpdiEWr93uFYEV/PkwybXL3S3JKcuAbVpP/UIBEPg4E8EoV1Zk4lDZBidXu/ChnV8271w45thj3YzA3QSzWXkU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(40480700001)(82740400003)(356005)(40460700003)(6666004)(5660300002)(4326008)(82310400005)(8676002)(41300700001)(26005)(8936002)(70586007)(44832011)(36860700001)(30864003)(316002)(478600001)(86362001)(6916009)(70206006)(36756003)(1076003)(426003)(186003)(47076005)(336012)(2616005)(16526019)(2906002)(54906003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 21:27:46.3054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1426efe5-47b6-456f-dbdd-08daa7e19ca1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
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
Cc: stylon.wang@amd.com, Anthony Koo <Anthony.Koo@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Max Tseng <Max.Tseng@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Max Tseng <Max.Tseng@amd.com>

[Why]
Since different features would need to update cursor registers,
However, they would use different approaches.

To unify varied methods, this refactor is implemented the same
update cursor info method for current varied features.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Max Tseng <Max.Tseng@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |   4 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 145 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |   1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c  |   1 +
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 141 -----------------
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c |  30 ++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |   4 +
 .../amd/display/dc/inc/hw/cursor_reg_cache.h  |  98 ++++++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |   5 +
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 115 +++++++++++++-
 11 files changed, 400 insertions(+), 148 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..9998f58c14b9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -276,6 +276,8 @@ static void program_cursor_attributes(
 		}
 
 		dc->hwss.set_cursor_attribute(pipe_ctx);
+
+		dc_send_update_cursor_info_to_dmu(pipe_ctx, i);
 		if (dc->hwss.set_cursor_sdr_white_level)
 			dc->hwss.set_cursor_sdr_white_level(pipe_ctx);
 	}
@@ -382,6 +384,8 @@ static void program_cursor_position(
 		}
 
 		dc->hwss.set_cursor_position(pipe_ctx);
+
+		dc_send_update_cursor_info_to_dmu(pipe_ctx, i);
 	}
 
 	if (pipe_to_program)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 89d7d3fd3321..bbde635c56fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -30,6 +30,7 @@
 #include "dc_hw_types.h"
 #include "core_types.h"
 #include "../basics/conversion.h"
+#include "cursor_reg_cache.h"
 
 #define CTX dc_dmub_srv->ctx
 #define DC_LOGGER CTX->logger
@@ -880,3 +881,147 @@ void dc_dmub_srv_log_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv)
 		diag_data.is_cw0_enabled,
 		diag_data.is_cw6_enabled);
 }
+
+static bool dc_dmub_should_update_cursor_data(struct pipe_ctx *pipe_ctx)
+{
+	if (pipe_ctx->plane_state != NULL) {
+		if (pipe_ctx->plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
+			return false;
+	}
+
+	if ((pipe_ctx->stream->link->psr_settings.psr_version == DC_PSR_VERSION_SU_1 ||
+		pipe_ctx->stream->link->psr_settings.psr_version == DC_PSR_VERSION_1) &&
+		pipe_ctx->stream->ctx->dce_version >= DCN_VERSION_3_1)
+		return true;
+
+	return false;
+}
+
+static void dc_build_cursor_update_payload0(
+		struct pipe_ctx *pipe_ctx, uint8_t p_idx,
+		struct dmub_cmd_update_cursor_payload0 *payload)
+{
+	struct hubp *hubp = pipe_ctx->plane_res.hubp;
+	unsigned int panel_inst = 0;
+
+	if (!dc_get_edp_link_panel_inst(hubp->ctx->dc,
+		pipe_ctx->stream->link, &panel_inst))
+		return;
+
+	/* Payload: Cursor Rect is built from position & attribute
+	 * x & y are obtained from postion
+	 */
+	payload->cursor_rect.x = hubp->cur_rect.x;
+	payload->cursor_rect.y = hubp->cur_rect.y;
+	/* w & h are obtained from attribute */
+	payload->cursor_rect.width  = hubp->cur_rect.w;
+	payload->cursor_rect.height = hubp->cur_rect.h;
+
+	payload->enable      = hubp->pos.cur_ctl.bits.cur_enable;
+	payload->pipe_idx    = p_idx;
+	payload->cmd_version = DMUB_CMD_PSR_CONTROL_VERSION_1;
+	payload->panel_inst  = panel_inst;
+}
+
+static void dc_send_cmd_to_dmu(struct dc_dmub_srv *dmub_srv,
+		union dmub_rb_cmd *cmd)
+{
+	dc_dmub_srv_cmd_queue(dmub_srv, cmd);
+	dc_dmub_srv_cmd_execute(dmub_srv);
+	dc_dmub_srv_wait_idle(dmub_srv);
+}
+
+static void dc_build_cursor_position_update_payload0(
+		struct dmub_cmd_update_cursor_payload0 *pl, const uint8_t p_idx,
+		const struct hubp *hubp, const struct dpp *dpp)
+{
+	/* Hubp */
+	pl->position_cfg.pHubp.cur_ctl.raw  = hubp->pos.cur_ctl.raw;
+	pl->position_cfg.pHubp.position.raw = hubp->pos.position.raw;
+	pl->position_cfg.pHubp.hot_spot.raw = hubp->pos.hot_spot.raw;
+	pl->position_cfg.pHubp.dst_offset.raw = hubp->pos.dst_offset.raw;
+
+	/* dpp */
+	pl->position_cfg.pDpp.cur0_ctl.raw = dpp->pos.cur0_ctl.raw;
+	pl->position_cfg.pipe_idx = p_idx;
+}
+
+static void dc_build_cursor_attribute_update_payload1(
+		struct dmub_cursor_attributes_cfg *pl_A, const uint8_t p_idx,
+		const struct hubp *hubp, const struct dpp *dpp)
+{
+	/* Hubp */
+	pl_A->aHubp.SURFACE_ADDR_HIGH = hubp->att.SURFACE_ADDR_HIGH;
+	pl_A->aHubp.SURFACE_ADDR = hubp->att.SURFACE_ADDR;
+	pl_A->aHubp.cur_ctl.raw  = hubp->att.cur_ctl.raw;
+	pl_A->aHubp.size.raw     = hubp->att.size.raw;
+	pl_A->aHubp.settings.raw = hubp->att.settings.raw;
+
+	/* dpp */
+	pl_A->aDpp.cur0_ctl.raw = dpp->att.cur0_ctl.raw;
+}
+
+/**
+ * ***************************************************************************************
+ * dc_send_update_cursor_info_to_dmu: Populate the DMCUB Cursor update info command
+ *
+ * This function would store the cursor related information and pass it into dmub
+ *
+ * @param [in] pCtx: pipe context
+ * @param [in] pipe_idx: pipe index
+ *
+ * @return: void
+ *
+ * ***************************************************************************************
+ */
+
+void dc_send_update_cursor_info_to_dmu(
+		struct pipe_ctx *pCtx, uint8_t pipe_idx)
+{
+	union dmub_rb_cmd cmd = { 0 };
+	union dmub_cmd_update_cursor_info_data *update_cursor_info =
+					&cmd.update_cursor_info.update_cursor_info_data;
+
+	if (!dc_dmub_should_update_cursor_data(pCtx))
+		return;
+	/*
+	 * Since we use multi_cmd_pending for dmub command, the 2nd command is
+	 * only assigned to store cursor attributes info.
+	 * 1st command can view as 2 parts, 1st is for PSR/Replay data, the other
+	 * is to store cursor position info.
+	 *
+	 * Command heaer type must be the same type if using  multi_cmd_pending.
+	 * Besides, while process 2nd command in DMU, the sub type is useless.
+	 * So it's meanless to pass the sub type header with different type.
+	 */
+
+	{
+		/* Build Payload#0 Header */
+		cmd.update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
+		cmd.update_cursor_info.header.payload_bytes =
+				sizeof(cmd.update_cursor_info.update_cursor_info_data);
+		cmd.update_cursor_info.header.multi_cmd_pending = 1; /* To combine multi dmu cmd, 1st cmd */
+
+		/* Prepare Payload */
+		dc_build_cursor_update_payload0(pCtx, pipe_idx, &update_cursor_info->payload0);
+
+		dc_build_cursor_position_update_payload0(&update_cursor_info->payload0, pipe_idx,
+				pCtx->plane_res.hubp, pCtx->plane_res.dpp);
+		/* Send update_curosr_info to queue */
+		dc_dmub_srv_cmd_queue(pCtx->stream->ctx->dmub_srv, &cmd);
+	}
+	{
+		/* Build Payload#1 Header */
+		memset(update_cursor_info, 0, sizeof(union dmub_cmd_update_cursor_info_data));
+		cmd.update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
+		cmd.update_cursor_info.header.payload_bytes = sizeof(struct cursor_attributes_cfg);
+		cmd.update_cursor_info.header.multi_cmd_pending = 0; /* Indicate it's the last command. */
+
+		dc_build_cursor_attribute_update_payload1(
+				&cmd.update_cursor_info.update_cursor_info_data.payload1.attribute_cfg,
+				pipe_idx, pCtx->plane_res.hubp, pCtx->plane_res.dpp);
+
+		/* Combine 2nd cmds update_curosr_info to DMU */
+		dc_send_cmd_to_dmu(pCtx->stream->ctx->dmub_srv, &cmd);
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index 7e438345b1a8..d34f5563df2e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -88,4 +88,5 @@ bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmu
 void dc_dmub_setup_subvp_dmub_command(struct dc *dc, struct dc_state *context, bool enable);
 void dc_dmub_srv_log_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv);
 
+void dc_send_update_cursor_info_to_dmu(struct pipe_ctx *pCtx, uint8_t pipe_idx);
 #endif /* _DMUB_DC_SRV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
index 897f412f539e..b9765b3899e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
@@ -469,6 +469,7 @@ void dpp1_set_cursor_position(
 	REG_UPDATE(CURSOR0_CONTROL,
 			CUR0_ENABLE, cur_en);
 
+	dpp_base->pos.cur0_ctl.bits.cur0_enable = cur_en;
 }
 
 void dpp1_cnv_set_optional_cursor_attributes(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 305e0c545374..11e4c4e46947 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -3372,127 +3372,6 @@ static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
 	return false;
 }
 
-static bool dcn10_dmub_should_update_cursor_data(
-		struct pipe_ctx *pipe_ctx,
-		struct dc_debug_options *debug)
-{
-	if (pipe_ctx->plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
-		return false;
-
-	if (dcn10_can_pipe_disable_cursor(pipe_ctx))
-		return false;
-
-	if ((pipe_ctx->stream->link->psr_settings.psr_version == DC_PSR_VERSION_SU_1 || pipe_ctx->stream->link->psr_settings.psr_version == DC_PSR_VERSION_1)
-			&& pipe_ctx->stream->ctx->dce_version >= DCN_VERSION_3_1)
-		return true;
-
-	return false;
-}
-
-static void dcn10_dmub_update_cursor_data(
-		struct pipe_ctx *pipe_ctx,
-		struct hubp *hubp,
-		const struct dc_cursor_mi_param *param,
-		const struct dc_cursor_position *cur_pos,
-		const struct dc_cursor_attributes *cur_attr)
-{
-	union dmub_rb_cmd cmd;
-	struct dmub_cmd_update_cursor_info_data *update_cursor_info;
-	const struct dc_cursor_position *pos;
-	const struct dc_cursor_attributes *attr;
-	int src_x_offset = 0;
-	int src_y_offset = 0;
-	int x_hotspot = 0;
-	int cursor_height = 0;
-	int cursor_width = 0;
-	uint32_t cur_en = 0;
-	unsigned int panel_inst = 0;
-
-	struct dc_debug_options *debug = &hubp->ctx->dc->debug;
-
-	if (!dcn10_dmub_should_update_cursor_data(pipe_ctx, debug))
-		return;
-	/**
-	 * if cur_pos == NULL means the caller is from cursor_set_attribute
-	 * then driver use previous cursor position data
-	 * if cur_attr == NULL means the caller is from cursor_set_position
-	 * then driver use previous cursor attribute
-	 * if cur_pos or cur_attr is not NULL then update it
-	 */
-	if (cur_pos != NULL)
-		pos = cur_pos;
-	else
-		pos = &hubp->curs_pos;
-
-	if (cur_attr != NULL)
-		attr = cur_attr;
-	else
-		attr = &hubp->curs_attr;
-
-	if (!dc_get_edp_link_panel_inst(hubp->ctx->dc, pipe_ctx->stream->link, &panel_inst))
-		return;
-
-	src_x_offset = pos->x - pos->x_hotspot - param->viewport.x;
-	src_y_offset = pos->y - pos->y_hotspot - param->viewport.y;
-	x_hotspot = pos->x_hotspot;
-	cursor_height = (int)attr->height;
-	cursor_width = (int)attr->width;
-	cur_en = pos->enable ? 1:0;
-
-	// Rotated cursor width/height and hotspots tweaks for offset calculation
-	if (param->rotation == ROTATION_ANGLE_90 || param->rotation == ROTATION_ANGLE_270) {
-		swap(cursor_height, cursor_width);
-		if (param->rotation == ROTATION_ANGLE_90) {
-			src_x_offset = pos->x - pos->y_hotspot - param->viewport.x;
-			src_y_offset = pos->y - pos->x_hotspot - param->viewport.y;
-		}
-	} else if (param->rotation == ROTATION_ANGLE_180) {
-		src_x_offset = pos->x - param->viewport.x;
-		src_y_offset = pos->y - param->viewport.y;
-	}
-
-	if (param->mirror) {
-		x_hotspot = param->viewport.width - x_hotspot;
-		src_x_offset = param->viewport.x + param->viewport.width - src_x_offset;
-	}
-
-	if (src_x_offset >= (int)param->viewport.width)
-		cur_en = 0;  /* not visible beyond right edge*/
-
-	if (src_x_offset + cursor_width <= 0)
-		cur_en = 0;  /* not visible beyond left edge*/
-
-	if (src_y_offset >= (int)param->viewport.height)
-		cur_en = 0;  /* not visible beyond bottom edge*/
-
-	if (src_y_offset + cursor_height <= 0)
-		cur_en = 0;  /* not visible beyond top edge*/
-
-	// Cursor bitmaps have different hotspot values
-	// There's a possibility that the above logic returns a negative value, so we clamp them to 0
-	if (src_x_offset < 0)
-		src_x_offset = 0;
-	if (src_y_offset < 0)
-		src_y_offset = 0;
-
-	memset(&cmd, 0x0, sizeof(cmd));
-	cmd.update_cursor_info.header.type = DMUB_CMD__UPDATE_CURSOR_INFO;
-	cmd.update_cursor_info.header.payload_bytes =
-			sizeof(cmd.update_cursor_info.update_cursor_info_data);
-	update_cursor_info = &cmd.update_cursor_info.update_cursor_info_data;
-	update_cursor_info->cursor_rect.x = src_x_offset + param->viewport.x;
-	update_cursor_info->cursor_rect.y = src_y_offset + param->viewport.y;
-	update_cursor_info->cursor_rect.width = attr->width;
-	update_cursor_info->cursor_rect.height = attr->height;
-	update_cursor_info->enable = cur_en;
-	update_cursor_info->pipe_idx = pipe_ctx->pipe_idx;
-	update_cursor_info->cmd_version = DMUB_CMD_PSR_CONTROL_VERSION_1;
-	update_cursor_info->panel_inst = panel_inst;
-	dc_dmub_srv_cmd_queue(pipe_ctx->stream->ctx->dmub_srv, &cmd);
-	dc_dmub_srv_cmd_execute(pipe_ctx->stream->ctx->dmub_srv);
-	dc_dmub_srv_wait_idle(pipe_ctx->stream->ctx->dmub_srv);
-}
-
 void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
@@ -3727,7 +3606,6 @@ void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->plane_res.scl_data.viewport.height - pos_cpy.y;
 	}
 
-	dcn10_dmub_update_cursor_data(pipe_ctx, hubp, &param, &pos_cpy, NULL);
 	hubp->funcs->set_cursor_position(hubp, &pos_cpy, &param);
 	dpp->funcs->set_cursor_position(dpp, &pos_cpy, &param, hubp->curs_attr.width, hubp->curs_attr.height);
 }
@@ -3735,25 +3613,6 @@ void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 void dcn10_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_cursor_attributes *attributes = &pipe_ctx->stream->cursor_attributes;
-	struct dc_cursor_mi_param param = { 0 };
-
-	/**
-	 * If enter PSR without cursor attribute update
-	 * the cursor attribute of dmub_restore_plane
-	 * are initial value. call dmub to exit PSR and
-	 * restore plane then update cursor attribute to
-	 * avoid override with initial value
-	 */
-	if (pipe_ctx->plane_state != NULL) {
-		param.pixel_clk_khz = pipe_ctx->stream->timing.pix_clk_100hz / 10;
-		param.ref_clk_khz = pipe_ctx->stream->ctx->dc->res_pool->ref_clocks.dchub_ref_clock_inKhz;
-		param.viewport = pipe_ctx->plane_res.scl_data.viewport;
-		param.h_scale_ratio = pipe_ctx->plane_res.scl_data.ratios.horz;
-		param.v_scale_ratio = pipe_ctx->plane_res.scl_data.ratios.vert;
-		param.rotation = pipe_ctx->plane_state->rotation;
-		param.mirror = pipe_ctx->plane_state->horizontal_mirror;
-		dcn10_dmub_update_cursor_data(pipe_ctx, pipe_ctx->plane_res.hubp, &param, NULL, attributes);
-	}
 
 	pipe_ctx->plane_res.hubp->funcs->set_cursor_attributes(
 			pipe_ctx->plane_res.hubp, attributes);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index b1ec0e6f7f58..4996d2810edb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -617,6 +617,17 @@ void hubp2_cursor_set_attributes(
 			CURSOR0_DST_Y_OFFSET, 0,
 			 /* used to shift the cursor chunk request deadline */
 			CURSOR0_CHUNK_HDL_ADJUST, 3);
+
+	hubp->att.SURFACE_ADDR_HIGH  = attr->address.high_part;
+	hubp->att.SURFACE_ADDR       = attr->address.low_part;
+	hubp->att.size.bits.width    = attr->width;
+	hubp->att.size.bits.height   = attr->height;
+	hubp->att.cur_ctl.bits.mode  = attr->color_format;
+	hubp->att.cur_ctl.bits.pitch = hw_pitch;
+	hubp->att.cur_ctl.bits.line_per_chunk = lpc;
+	hubp->att.cur_ctl.bits.cur_2x_magnify = attr->attribute_flags.bits.ENABLE_MAGNIFICATION;
+	hubp->att.settings.bits.dst_y_offset  = 0;
+	hubp->att.settings.bits.chunk_hdl_adjust = 3;
 }
 
 void hubp2_dmdata_set_attributes(
@@ -1033,6 +1044,25 @@ void hubp2_cursor_set_position(
 	REG_SET(CURSOR_DST_OFFSET, 0,
 			CURSOR_DST_X_OFFSET, dst_x_offset);
 	/* TODO Handle surface pixel formats other than 4:4:4 */
+	/* Cursor Position Register Config */
+	hubp->pos.cur_ctl.bits.cur_enable = cur_en;
+	hubp->pos.position.bits.x_pos = pos->x;
+	hubp->pos.position.bits.y_pos = pos->y;
+	hubp->pos.hot_spot.bits.x_hot = x_hotspot;
+	hubp->pos.hot_spot.bits.y_hot = y_hotspot;
+	hubp->pos.dst_offset.bits.dst_x_offset = dst_x_offset;
+	/* Cursor Rectangle Cache
+	 * Cursor bitmaps have different hotspot values
+	 * There's a possibility that the above logic returns a negative value,
+	 * so we clamp them to 0
+	 */
+	if (src_x_offset < 0)
+		src_x_offset = 0;
+	if (src_y_offset < 0)
+		src_y_offset = 0;
+	/* Save necessary cursor info x, y position. w, h is saved in attribute func. */
+	hubp->cur_rect.x = src_x_offset + param->viewport.x;
+	hubp->cur_rect.y = src_y_offset + param->viewport.y;
 }
 
 void hubp2_clk_cntl(struct hubp *hubp, bool enable)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 4a668d6563df..e5b7ef7422b8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -372,6 +372,10 @@ void dpp3_set_cursor_attributes(
 		REG_UPDATE(CURSOR0_COLOR1,
 				CUR0_COLOR1, 0xFFFFFFFF);
 	}
+
+	dpp_base->att.cur0_ctl.bits.expansion_mode = 0;
+	dpp_base->att.cur0_ctl.bits.cur0_rom_en = cur_rom_en;
+	dpp_base->att.cur0_ctl.bits.mode = color_format;
 }
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.h b/drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.h
new file mode 100644
index 000000000000..0e7c5880e867
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.h
@@ -0,0 +1,98 @@
+/* Copyright © 2022 Advanced Micro Devices, Inc. All rights reserved. */
+
+#ifndef __DAL_CURSOR_CACHE_H__
+#define __DAL_CURSOR_CACHE_H__
+
+union reg_cursor_control_cfg {
+	struct {
+		uint32_t     cur_enable: 1;
+		uint32_t         reser0: 3;
+		uint32_t cur_2x_magnify: 1;
+		uint32_t         reser1: 3;
+		uint32_t           mode: 3;
+		uint32_t         reser2: 5;
+		uint32_t          pitch: 2;
+		uint32_t         reser3: 6;
+		uint32_t line_per_chunk: 5;
+		uint32_t         reser4: 3;
+	} bits;
+	uint32_t raw;
+};
+struct cursor_position_cache_hubp {
+	union reg_cursor_control_cfg cur_ctl;
+	union reg_position_cfg {
+		struct {
+			uint32_t x_pos: 16;
+			uint32_t y_pos: 16;
+		} bits;
+		uint32_t raw;
+	} position;
+	union reg_hot_spot_cfg {
+		struct {
+			uint32_t x_hot: 16;
+			uint32_t y_hot: 16;
+		} bits;
+		uint32_t raw;
+	} hot_spot;
+	union reg_dst_offset_cfg {
+		struct {
+			uint32_t dst_x_offset: 13;
+			uint32_t     reserved: 19;
+		} bits;
+		uint32_t raw;
+	} dst_offset;
+};
+
+struct cursor_attribute_cache_hubp {
+	uint32_t SURFACE_ADDR_HIGH;
+	uint32_t SURFACE_ADDR;
+	union    reg_cursor_control_cfg  cur_ctl;
+	union    reg_cursor_size_cfg {
+		struct {
+			uint32_t  width: 16;
+			uint32_t height: 16;
+		} bits;
+		uint32_t raw;
+	} size;
+	union    reg_cursor_settings_cfg {
+		struct {
+			uint32_t     dst_y_offset: 8;
+			uint32_t chunk_hdl_adjust: 2;
+			uint32_t         reserved: 22;
+		} bits;
+		uint32_t raw;
+	} settings;
+};
+
+struct cursor_rect {
+	uint32_t x;
+	uint32_t y;
+	uint32_t w;
+	uint32_t h;
+};
+
+union reg_cur0_control_cfg {
+	struct {
+		uint32_t     cur0_enable: 1;
+		uint32_t  expansion_mode: 1;
+		uint32_t          reser0: 1;
+		uint32_t     cur0_rom_en: 1;
+		uint32_t            mode: 3;
+		uint32_t        reserved: 25;
+	} bits;
+	uint32_t raw;
+};
+struct cursor_position_cache_dpp {
+	union reg_cur0_control_cfg cur0_ctl;
+};
+
+struct cursor_attribute_cache_dpp {
+	union reg_cur0_control_cfg cur0_ctl;
+};
+
+struct cursor_attributes_cfg {
+	struct  cursor_attribute_cache_hubp aHubp;
+	struct  cursor_attribute_cache_dpp  aDpp;
+};
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 3ef7faa92052..dcb80c4747b0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -28,6 +28,7 @@
 #define __DAL_DPP_H__
 
 #include "transform.h"
+#include "cursor_reg_cache.h"
 
 union defer_reg_writes {
 	struct {
@@ -58,6 +59,9 @@ struct dpp {
 
 	struct pwl_params shaper_params;
 	bool cm_bypass_mode;
+
+	struct cursor_position_cache_dpp  pos;
+	struct cursor_attribute_cache_dpp att;
 };
 
 struct dpp_input_csc_matrix {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index 44c4578193a3..d5ea7545583e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -27,6 +27,7 @@
 #define __DAL_HUBP_H__
 
 #include "mem_input.h"
+#include "cursor_reg_cache.h"
 
 #define OPP_ID_INVALID 0xf
 #define MAX_TTU 0xffffff
@@ -65,6 +66,10 @@ struct hubp {
 	struct dc_cursor_attributes curs_attr;
 	struct dc_cursor_position curs_pos;
 	bool power_gated;
+
+	struct cursor_position_cache_hubp  pos;
+	struct cursor_attribute_cache_hubp att;
+	struct cursor_rect cur_rect;
 };
 
 struct surface_flip_registers {
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 5d1aadade8a5..834707dfc189 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -760,11 +760,6 @@ enum dmub_cmd_dpia_type {
 	DMUB_CMD__DPIA_MST_ALLOC_SLOTS = 2,
 };
 
-enum dmub_cmd_header_sub_type {
-	DMUB_CMD__SUB_TYPE_GENERAL         = 0,
-	DMUB_CMD__SUB_TYPE_CURSOR_POSITION = 1
-};
-
 #pragma pack(push, 1)
 
 /**
@@ -2089,7 +2084,99 @@ struct dmub_rb_cmd_update_dirty_rect {
 /**
  * Data passed from driver to FW in a DMUB_CMD__UPDATE_CURSOR_INFO command.
  */
-struct dmub_cmd_update_cursor_info_data {
+union dmub_reg_cursor_control_cfg {
+	struct {
+		uint32_t     cur_enable: 1;
+		uint32_t         reser0: 3;
+		uint32_t cur_2x_magnify: 1;
+		uint32_t         reser1: 3;
+		uint32_t           mode: 3;
+		uint32_t         reser2: 5;
+		uint32_t          pitch: 2;
+		uint32_t         reser3: 6;
+		uint32_t line_per_chunk: 5;
+		uint32_t         reser4: 3;
+	} bits;
+	uint32_t raw;
+};
+struct dmub_cursor_position_cache_hubp {
+	union dmub_reg_cursor_control_cfg cur_ctl;
+	union dmub_reg_position_cfg {
+		struct {
+			uint32_t cur_x_pos: 16;
+			uint32_t cur_y_pos: 16;
+		} bits;
+		uint32_t raw;
+	} position;
+	union dmub_reg_hot_spot_cfg {
+		struct {
+			uint32_t hot_x: 16;
+			uint32_t hot_y: 16;
+		} bits;
+		uint32_t raw;
+	} hot_spot;
+	union dmub_reg_dst_offset_cfg {
+		struct {
+			uint32_t dst_x_offset: 13;
+			uint32_t reserved: 19;
+		} bits;
+		uint32_t raw;
+	} dst_offset;
+};
+
+union dmub_reg_cur0_control_cfg {
+	struct {
+		uint32_t     cur0_enable: 1;
+		uint32_t  expansion_mode: 1;
+		uint32_t          reser0: 1;
+		uint32_t     cur0_rom_en: 1;
+		uint32_t            mode: 3;
+		uint32_t        reserved: 25;
+	} bits;
+	uint32_t raw;
+};
+struct dmub_cursor_position_cache_dpp {
+	union dmub_reg_cur0_control_cfg cur0_ctl;
+};
+struct dmub_cursor_position_cfg {
+	struct  dmub_cursor_position_cache_hubp pHubp;
+	struct  dmub_cursor_position_cache_dpp  pDpp;
+	uint8_t pipe_idx;
+	/*
+	 * Padding is required. To be 4 Bytes Aligned.
+	 */
+	uint8_t padding[3];
+};
+
+struct dmub_cursor_attribute_cache_hubp {
+	uint32_t SURFACE_ADDR_HIGH;
+	uint32_t SURFACE_ADDR;
+	union    dmub_reg_cursor_control_cfg  cur_ctl;
+	union    dmub_reg_cursor_size_cfg {
+		struct {
+			uint32_t width: 16;
+			uint32_t height: 16;
+		} bits;
+		uint32_t raw;
+	} size;
+	union    dmub_reg_cursor_settings_cfg {
+		struct {
+			uint32_t     dst_y_offset: 8;
+			uint32_t chunk_hdl_adjust: 2;
+			uint32_t         reserved: 22;
+		} bits;
+		uint32_t raw;
+	} settings;
+};
+struct dmub_cursor_attribute_cache_dpp {
+	union dmub_reg_cur0_control_cfg cur0_ctl;
+};
+struct dmub_cursor_attributes_cfg {
+	struct  dmub_cursor_attribute_cache_hubp aHubp;
+	struct  dmub_cursor_attribute_cache_dpp  aDpp;
+};
+
+struct dmub_cmd_update_cursor_payload0 {
 	/**
 	 * Cursor dirty rects.
 	 */
@@ -2116,6 +2203,20 @@ struct dmub_cmd_update_cursor_info_data {
 	 * Currently the support is only for 0 or 1
 	 */
 	uint8_t panel_inst;
+	/**
+	 * Cursor Position Register.
+	 * Registers contains Hubp & Dpp modules
+	 */
+	struct dmub_cursor_position_cfg position_cfg;
+};
+
+struct dmub_cmd_update_cursor_payload1 {
+	struct dmub_cursor_attributes_cfg attribute_cfg;
+};
+
+union dmub_cmd_update_cursor_info_data {
+	struct dmub_cmd_update_cursor_payload0 payload0;
+	struct dmub_cmd_update_cursor_payload1 payload1;
 };
 /**
  * Definition of a DMUB_CMD__UPDATE_CURSOR_INFO command.
@@ -2128,7 +2229,7 @@ struct dmub_rb_cmd_update_cursor_info {
 	/**
 	 * Data passed from driver to FW in a DMUB_CMD__UPDATE_CURSOR_INFO command.
 	 */
-	struct dmub_cmd_update_cursor_info_data update_cursor_info_data;
+	union dmub_cmd_update_cursor_info_data update_cursor_info_data;
 };
 
 /**
-- 
2.25.1

