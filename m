Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C379F5622BB
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jun 2022 21:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ED611A1ED;
	Thu, 30 Jun 2022 19:13:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8111120DD
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jun 2022 19:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7eo7a5ZsanAQp4upTNg5cFwyPxvY3vUaxr8/6n6gQsFKQWGQmfR8uckjO/cpWfoik33gGsBUa6zgRtAwrZTqLkQYjNoJCXq47YizjRAp++A74VCB18rH38mXaa0BVCXI0/SKa2l9bUYG8wyzZw+r4wzvu5VhM0RGafQzUyuMHHBPn6Vw4edCoDEe62WhdXCGDTQqq7JYJJYVofv7vmc+zWZsA0t6aecxwf2lUEDDpb1VD4WvYpe8KwSGiHjy7LUecbUk4MjUdf1oszQpSnmAp9pZJBR2z6Ge+j4oiAbNXBjiZc8EwNT9zpjcN+91/P9OlXpKiGonAglABismlT6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL7WuAvnh1tCAEkm1e8sAZ/UznSqvgHpPytyvL6qXoM=;
 b=mPR6nrbnXxw3G16u5efF0IFuY7aWdO6kAdG0SUqBKfxwr9fcrvm7NYHqSDpDT5/9+2bOGsYv//B4HEDCtQ0KwXoPY9F7W8iSbnl/rNSHZELYj1c/nwcIFvB4t65yCJrXVVaXdsbD+CMyrES4IXSQi0qlLjuA3u6ELw81WIONhERTLUqm76whhgAkw/Iuxg7KxB5smquNUg3XcVlKaBjjzI50TT12r7LwYHVTWtUBw8514AuDohnXTyn20hNxiUywKZHjJD+bsp6F2SA41hNrQAloIZ3Fx/UDWyJOIZ3O14Lvy1qrXM7PG5bo5Pv8MXucOVeBubwlJoYeQUyeIyoddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL7WuAvnh1tCAEkm1e8sAZ/UznSqvgHpPytyvL6qXoM=;
 b=B1BWOfalMcf3VvBBw41Z+pO7Bx4GnCkngzHtpW+pxrAP5NWiWMbNTRd+x1VXTkBmgXlYq0M++4I2mNse492bcQhIH4Ku89tKtaTRdZ6tZpe5N0NXtY37Q+iWVTAXKFY/xHu4zD/Rjyldilxs+FKMxZyUDrH8m7Sm5ynvyKHyts4=
Received: from BN6PR17CA0060.namprd17.prod.outlook.com (2603:10b6:405:75::49)
 by BYAPR12MB2823.namprd12.prod.outlook.com (2603:10b6:a03:96::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 19:13:52 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::3e) by BN6PR17CA0060.outlook.office365.com
 (2603:10b6:405:75::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 19:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 19:13:51 +0000
Received: from atma2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 14:13:49 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/40] drm/amd/display: Add SubVP required code
Date: Thu, 30 Jun 2022 15:12:44 -0400
Message-ID: <20220630191322.909650-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dca4217-9595-426e-93e9-08da5accab28
X-MS-TrafficTypeDiagnostic: BYAPR12MB2823:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77BhRfdud3BUwt7NiOZnGfV3P71MkXST2SVQsOyr0mcjcsdA/3Kv/aoKAZFlPOGRP01eHrmV0KdM3q/LaYUcIG684fXDcYhyK2V1NZJA4Hb/sIf8/Si6YmsQKl7+D0y7u2kHhgGuXbfpuQn5bNUOsCXG9EQci1RTDjrrjGkBAEe+B9F0tqgNooRma/LQRmRlqgQny9CAcQ/li3SDvh1d/nQg1h/o5jiZ7O09fIHiqsbUBeeGwj4w0dG8kh7zCAoyRrsFue8xbNf5/r7tS1wV8dg5am76hVE+86QTp9vV21oYd3zg+xyVwYwK9gtu7BK7Xgs7cWBY0vTyV1I2BsNhoWNcb4yzQCDCj2gpB+rrXxwxKJotiCARHP3bnxQfBlcsCGTwunOGKWaStmCdROn1RkjvxaZiOxsw8NxjRYNBkoz2tEN9TzzOtFn3+STsw8sZmZUZN0VK69gmfFcPG5kQjg/D6bxLAmeuVxvpCX/AoSBQI9eS+zHl6w+yTmVn9OtC3dghklRQGoJjfjXlYZo/DN+sEgKGxvsz2YdDU/TgzkfK/XF/cyIldxjLvi1vslmCCRekh2Bo41ZnK6Y2YT4vaRA1+/RtPX1GAYeVZFUd+VvuuQsaLfHmp+l8b2YeipvIcvF17YfSJJBup6SQB9gTKZF34DCzxWPxT8DBdeFdfU4q7Ruh95HKqncN3M6lLpuZa4nnPO+u2n9jwsiYWH67U3l43agldPHmwWW6r/c3NiqPA56WUWUl/ZTyDCjhjSD8dU+2KN6zJR3pPFQZNN2yzB4cnO1EEohK3liage/0Lb/TvF2PhYGy0O099whm+8eTyi485ElLQ0+wiQ0UvbvPhkgimj/CsNYjfo1mpCyqH5/aH3OakBrjNBUu8wYaglQV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(40470700004)(36840700001)(16526019)(47076005)(356005)(82310400005)(40460700003)(426003)(36756003)(36860700001)(30864003)(336012)(478600001)(41300700001)(2616005)(40480700001)(83380400001)(70206006)(1076003)(186003)(6666004)(8676002)(8936002)(86362001)(82740400003)(6916009)(4326008)(54906003)(316002)(5660300002)(7696005)(2906002)(81166007)(70586007)(26005)(36900700001)(559001)(579004)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 19:13:51.7113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dca4217-9595-426e-93e9-08da5accab28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2823
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
Cc: stylon.wang@amd.com, Alan Liu <HaoPing.Liu@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Alvin Lee <Alvin.Lee2@amd.com>, solomon.chiu@amd.com,
 jerry.zuo@amd.com, Aurabindo.Pillai@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, Jun Lei <Jun.Lei@amd.com>, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

This commit enables the SubVP feature. To achieve that, we need to:

- Don't force p-state disallow on SubVP (can't block dummy p-state)
- Send calculated watermark to DMCUB for SubVP
- Adjust CAB mode message to PMFW
- Add a proper locking sequence for SubVP
- Various fixes to SubVP static analysis and determining SubVP config
- Currently SubVP not supported with pipe split so merge all pipes
  before setting up SubVp

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |  27 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   6 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  65 +++-
 drivers/gpu/drm/amd/display/dc/dc.h           |   2 -
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 329 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   4 -
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  39 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile |  14 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |  73 +++-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.h    |   7 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |   1 +
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 115 +++---
 .../drm/amd/display/dc/dcn32/dcn32_resource.h |  20 +-
 .../display/dc/dcn32/dcn32_resource_helpers.c | 260 ++++++++++++++
 .../amd/display/dc/dml/display_mode_structs.h |   1 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   5 +-
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   7 +
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  89 +++++
 .../amd/display/dmub/inc/dmub_subvp_state.h   | 160 +++++++++
 20 files changed, 1162 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 4de8e1871711..dfe82bcdd17d 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -21,7 +21,31 @@
 #
 #
 # Makefile for Display Core (dc) component.
-#
+
+ifdef CONFIG_X86
+dmub_ccflags := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+dmub_ccflags := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+dmub_ccflags += -mpreferred-stack-boundary=4
+else
+dmub_ccflags += -msse2
+endif
+endif
 
 DC_LIBS = basics bios dml clk_mgr dce gpio irq link virtual
 
@@ -75,6 +99,7 @@ AMD_DISPLAY_FILES += $(AMD_DISPLAY_CORE)
 AMD_DISPLAY_FILES += $(AMD_DM_REG_UPDATE)
 
 DC_DMUB += dc_dmub_srv.o
+CFLAGS_$(AMDDALPATH)/dc/dc_dmub_srv.o := $(dmub_ccflags)
 DC_EDID += dc_edid_parser.o
 AMD_DISPLAY_DMUB = $(addprefix $(AMDDALPATH)/dc/,$(DC_DMUB))
 AMD_DISPLAY_EDID = $(addprefix $(AMDDALPATH)/dc/,$(DC_EDID))
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index d145dcbca778..6972f99e9a9a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -58,6 +58,12 @@ int clk_mgr_helper_get_active_display_cnt(
 	for (i = 0; i < context->stream_count; i++) {
 		const struct dc_stream_state *stream = context->streams[i];
 
+		/* Don't count SubVP phantom pipes as part of active
+		 * display count
+		 */
+		if (stream->mall_stream_config.type == SUBVP_PHANTOM)
+			continue;
+
 		/*
 		 * Only notify active stream or virtual stream.
 		 * Need to notify virtual stream to work around
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
index 3137b987f0a0..fb524fe4ab26 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
@@ -100,9 +100,10 @@ void dcn32_smu_send_fclk_pstate_message(struct clk_mgr_internal *clk_mgr, bool e
 
 void dcn32_smu_send_cab_for_uclk_message(struct clk_mgr_internal *clk_mgr, unsigned int num_ways)
 {
-	smu_print("Numways for SubVP : %d\n", num_ways);
+	uint32_t param = (num_ways << 1) | (num_ways > 0);
 
-	dcn32_smu_send_msg_with_param(clk_mgr, DALSMC_MSG_SetCabForUclkPstate, num_ways, NULL);
+	dcn32_smu_send_msg_with_param(clk_mgr, DALSMC_MSG_SetCabForUclkPstate, param, NULL);
+	smu_print("Numways for SubVP : %d\n", num_ways);
 }
 
 void dcn32_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 146fd4b864b2..fcb503b6a1a2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1905,7 +1905,8 @@ static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (!pipe->plane_state)
+		// Don't check flip pending on phantom pipes
+		if (!pipe->plane_state || (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM))
 			continue;
 
 		/* Must set to false to start with, due to OR in update function */
@@ -2917,6 +2918,13 @@ static void commit_planes_for_stream(struct dc *dc,
 	int i, j;
 	struct pipe_ctx *top_pipe_to_program = NULL;
 	bool should_lock_all_pipes = (update_type != UPDATE_TYPE_FAST);
+	bool subvp_prev_use = false;
+
+	// Once we apply the new subvp context to hardware it won't be in the
+	// dc->current_state anymore, so we have to cache it before we apply
+	// the new SubVP context
+	subvp_prev_use = false;
+
 
 	dc_z10_restore(dc);
 
@@ -2955,6 +2963,15 @@ static void commit_planes_for_stream(struct dc *dc,
 		}
 	}
 
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		// Check old context for SubVP
+		subvp_prev_use |= (old_pipe->stream && old_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM);
+		if (subvp_prev_use)
+			break;
+	}
+
 	if (stream->test_pattern.type != DP_TEST_PATTERN_VIDEO_MODE) {
 		struct pipe_ctx *mpcc_pipe;
 		struct pipe_ctx *odm_pipe;
@@ -2984,8 +3001,13 @@ static void commit_planes_for_stream(struct dc *dc,
 		}
 
 	if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
+		if (dc->hwss.subvp_pipe_control_lock)
+				dc->hwss.subvp_pipe_control_lock(dc, context, true, should_lock_all_pipes, NULL, subvp_prev_use);
 		dc->hwss.interdependent_update_lock(dc, context, true);
+
 	} else {
+		if (dc->hwss.subvp_pipe_control_lock)
+			dc->hwss.subvp_pipe_control_lock(dc, context, true, should_lock_all_pipes, top_pipe_to_program, subvp_prev_use);
 		/* Lock the top pipe while updating plane addrs, since freesync requires
 		 *  plane addr update event triggers to be synchronized.
 		 *  top_pipe_to_program is expected to never be NULL
@@ -2993,8 +3015,40 @@ static void commit_planes_for_stream(struct dc *dc,
 		dc->hwss.pipe_control_lock(dc, top_pipe_to_program, true);
 	}
 
+	if (update_type != UPDATE_TYPE_FAST) {
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
+
+			if ((new_pipe->stream && new_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) ||
+					subvp_prev_use) {
+				// If old context or new context has phantom pipes, apply
+				// the phantom timings now. We can't change the phantom
+				// pipe configuration safely without driver acquiring
+				// the DMCUB lock first.
+				dc->hwss.apply_ctx_to_hw(dc, context);
+				break;
+			}
+		}
+	}
+
 	dc_dmub_update_dirty_rect(dc, surface_count, stream, srf_updates, context);
 
+	if (update_type != UPDATE_TYPE_FAST) {
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
+			struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
+
+			if ((new_pipe->stream && new_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) ||
+					subvp_prev_use) {
+				// If old context or new context has phantom pipes, apply
+				// the phantom timings now. We can't change the phantom
+				// pipe configuration safely without driver acquiring
+				// the DMCUB lock first.
+				dc->hwss.apply_ctx_to_hw(dc, context);
+				break;
+			}
+		}
+	}
+
 	// Stream updates
 	if (stream_update)
 		commit_planes_do_stream_update(dc, stream, stream_update, update_type, context);
@@ -3009,11 +3063,20 @@ static void commit_planes_for_stream(struct dc *dc,
 		if (dc->hwss.program_front_end_for_ctx)
 			dc->hwss.program_front_end_for_ctx(dc, context);
 
+		if (update_type != UPDATE_TYPE_FAST)
+			if (dc->hwss.commit_subvp_config)
+				dc->hwss.commit_subvp_config(dc, context);
+
 		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
 			dc->hwss.interdependent_update_lock(dc, context, false);
+			if (dc->hwss.subvp_pipe_control_lock)
+				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
 		} else {
 			dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
+			if (dc->hwss.subvp_pipe_control_lock)
+				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
 		}
+
 		dc->hwss.post_unlock_program_front_end(dc, context);
 		return;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 8292f27c1516..447647ac3d80 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -207,7 +207,6 @@ struct dc_caps {
 	bool vbios_lttpr_aware;
 	bool vbios_lttpr_enable;
 	uint32_t max_otg_num;
-#ifdef CONFIG_DRM_AMD_DC_DCN
 	uint32_t max_cab_allocation_bytes;
 	uint32_t cache_line_size;
 	uint32_t cache_num_ways;
@@ -215,7 +214,6 @@ struct dc_caps {
 	uint16_t subvp_prefetch_end_to_mall_start_us;
 	uint16_t subvp_pstate_allow_width_us;
 	uint16_t subvp_vertical_int_margin_us;
-#endif
 	bool seamless_odm;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 548c91ad1b82..ae63159e5d86 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -283,6 +283,335 @@ void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
 	}
 }
 
+/**
+ * ***********************************************************************************************
+ * populate_subvp_cmd_drr_info: Helper to populate DRR pipe info for the DMCUB subvp command
+ *
+ * Populate the DMCUB SubVP command with DRR pipe info. All the information required for calculating
+ * the SubVP + DRR microschedule is populated here.
+ *
+ * High level algorithm:
+ * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
+ * 2. Calculate the min and max vtotal which supports SubVP + DRR microschedule
+ * 3. Populate the drr_info with the min and max supported vtotal values
+ *
+ * @param [in] dc: current dc state
+ * @param [in] subvp_pipe: pipe_ctx for the SubVP pipe
+ * @param [in] vblank_pipe: pipe_ctx for the DRR pipe
+ * @param [in] pipe_data: Pipe data which stores the VBLANK/DRR info
+ *
+ * @return: void
+ *
+ * ***********************************************************************************************
+ */
+static void populate_subvp_cmd_drr_info(struct dc *dc,
+		struct pipe_ctx *subvp_pipe,
+		struct pipe_ctx *vblank_pipe,
+		struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data)
+{
+	struct dc_crtc_timing *main_timing = &subvp_pipe->stream->timing;
+	struct dc_crtc_timing *phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+	struct dc_crtc_timing *drr_timing = &vblank_pipe->stream->timing;
+	int16_t drr_frame_us = 0;
+	int16_t min_drr_supported_us = 0;
+	int16_t max_drr_supported_us = 0;
+	int16_t max_drr_vblank_us = 0;
+	int16_t max_drr_mallregion_us = 0;
+	int16_t mall_region_us = 0;
+	int16_t prefetch_us = 0;
+	int16_t subvp_active_us = 0;
+	int16_t drr_active_us = 0;
+	int16_t min_vtotal_supported = 0;
+	int16_t max_vtotal_supported = 0;
+
+	pipe_data->pipe_config.vblank_data.drr_info.drr_in_use = true;
+	pipe_data->pipe_config.vblank_data.drr_info.use_ramping = false; // for now don't use ramping
+	pipe_data->pipe_config.vblank_data.drr_info.drr_window_size_ms = 4; // hardcode 4ms DRR window for now
+
+	drr_frame_us = drr_timing->v_total * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000;
+	// P-State allow width and FW delays already included phantom_timing->v_addressable
+	mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
+	min_drr_supported_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
+	min_vtotal_supported = drr_timing->pix_clk_100hz * 100 * ((double)min_drr_supported_us / 1000000) /
+			(double)drr_timing->h_total;
+
+	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
+			dc->caps.subvp_prefetch_end_to_mall_start_us;
+	subvp_active_us = main_timing->v_addressable * main_timing->h_total /
+			(double)(main_timing->pix_clk_100hz * 100) * 1000000;
+	drr_active_us = drr_timing->v_addressable * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000;
+	max_drr_vblank_us = (double)(subvp_active_us - prefetch_us - drr_active_us) / 2 + drr_active_us;
+	max_drr_mallregion_us = subvp_active_us - prefetch_us - mall_region_us;
+	max_drr_supported_us = max_drr_vblank_us > max_drr_mallregion_us ? max_drr_vblank_us : max_drr_mallregion_us;
+	max_vtotal_supported = drr_timing->pix_clk_100hz * 100 * ((double)max_drr_supported_us / 1000000) /
+			(double)drr_timing->h_total;
+
+	pipe_data->pipe_config.vblank_data.drr_info.min_vtotal_supported = min_vtotal_supported;
+	pipe_data->pipe_config.vblank_data.drr_info.max_vtotal_supported = max_vtotal_supported;
+}
+
+/**
+ * ***********************************************************************************************
+ * populate_subvp_cmd_vblank_pipe_info: Helper to populate VBLANK pipe info for the DMUB subvp command
+ *
+ * Populate the DMCUB SubVP command with VBLANK pipe info. All the information required to calculate
+ * the microschedule for SubVP + VBLANK case is stored in the pipe_data (subvp_data and vblank_data).
+ * Also check if the VBLANK pipe is a DRR display -- if it is make a call to populate drr_info.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] cmd: DMUB cmd to be populated with SubVP info
+ * @param [in] vblank_pipe: pipe_ctx for the VBLANK pipe
+ * @param [in] cmd_pipe_index: index for the pipe array in DMCUB SubVP cmd
+ *
+ * @return: void
+ *
+ * ***********************************************************************************************
+ */
+static void populate_subvp_cmd_vblank_pipe_info(struct dc *dc,
+		struct dc_state *context,
+		union dmub_rb_cmd *cmd,
+		struct pipe_ctx *vblank_pipe,
+		uint8_t cmd_pipe_index)
+{
+	uint32_t i;
+	struct pipe_ctx *pipe = NULL;
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data =
+			&cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[cmd_pipe_index];
+
+	// Find the SubVP pipe
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		// We check for master pipe, but it shouldn't matter since we only need
+		// the pipe for timing info (stream should be same for any pipe splits)
+		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		// Find the SubVP pipe
+		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			break;
+	}
+
+	pipe_data->mode = VBLANK;
+	pipe_data->pipe_config.vblank_data.pix_clk_100hz = vblank_pipe->stream->timing.pix_clk_100hz;
+	pipe_data->pipe_config.vblank_data.vblank_start = vblank_pipe->stream->timing.v_total -
+							vblank_pipe->stream->timing.v_front_porch;
+	pipe_data->pipe_config.vblank_data.vtotal = vblank_pipe->stream->timing.v_total;
+	pipe_data->pipe_config.vblank_data.htotal = vblank_pipe->stream->timing.h_total;
+	pipe_data->pipe_config.vblank_data.vblank_pipe_index = vblank_pipe->pipe_idx;
+	pipe_data->pipe_config.vblank_data.vstartup_start = vblank_pipe->pipe_dlg_param.vstartup_start;
+	pipe_data->pipe_config.vblank_data.vblank_end =
+			vblank_pipe->stream->timing.v_total - vblank_pipe->stream->timing.v_front_porch - vblank_pipe->stream->timing.v_addressable;
+
+	if (vblank_pipe->stream->ignore_msa_timing_param)
+		populate_subvp_cmd_drr_info(dc, pipe, vblank_pipe, pipe_data);
+}
+
+/**
+ * ***********************************************************************************************
+ * update_subvp_prefetch_end_to_mall_start: Helper for SubVP + SubVP case
+ *
+ * For SubVP + SubVP, we use a single vertical interrupt to start the microschedule for both
+ * SubVP pipes. In order for this to work correctly, the MALL REGION of both SubVP pipes must
+ * start at the same time. This function lengthens the prefetch end to mall start delay of the
+ * SubVP pipe that has the shorter prefetch so that both MALL REGION's will start at the same time.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] cmd: DMUB cmd to be populated with SubVP info
+ * @param [in] subvp_pipes: Array of SubVP pipes (should always be length 2)
+ *
+ * @return: void
+ *
+ * ***********************************************************************************************
+ */
+static void update_subvp_prefetch_end_to_mall_start(struct dc *dc,
+		struct dc_state *context,
+		union dmub_rb_cmd *cmd,
+		struct pipe_ctx *subvp_pipes[])
+{
+	uint32_t subvp0_prefetch_us = 0;
+	uint32_t subvp1_prefetch_us = 0;
+	uint32_t prefetch_delta_us = 0;
+	struct dc_crtc_timing *phantom_timing0 = &subvp_pipes[0]->stream->mall_stream_config.paired_stream->timing;
+	struct dc_crtc_timing *phantom_timing1 = &subvp_pipes[1]->stream->mall_stream_config.paired_stream->timing;
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data = NULL;
+
+	subvp0_prefetch_us = (phantom_timing0->v_total - phantom_timing0->v_front_porch) * phantom_timing0->h_total /
+				(double)(phantom_timing0->pix_clk_100hz * 100) * 1000000 + dc->caps.subvp_prefetch_end_to_mall_start_us;
+	subvp1_prefetch_us = (phantom_timing1->v_total - phantom_timing1->v_front_porch) * phantom_timing1->h_total /
+					(double)(phantom_timing1->pix_clk_100hz * 100) * 1000000 + dc->caps.subvp_prefetch_end_to_mall_start_us;
+
+	// Whichever SubVP PIPE has the smaller prefetch (including the prefetch end to mall start time)
+	// should increase it's prefetch time to match the other
+	if (subvp0_prefetch_us > subvp1_prefetch_us) {
+		pipe_data = &cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[1];
+		prefetch_delta_us = subvp0_prefetch_us - subvp1_prefetch_us;
+		pipe_data->pipe_config.subvp_data.prefetch_to_mall_start_lines =
+					(((double)(dc->caps.subvp_prefetch_end_to_mall_start_us + prefetch_delta_us) / 1000000) *
+					(phantom_timing1->pix_clk_100hz * 100) + phantom_timing1->h_total - 1) /
+					(double)phantom_timing1->h_total;
+	} else if (subvp1_prefetch_us >  subvp0_prefetch_us) {
+		pipe_data = &cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[0];
+		prefetch_delta_us = subvp1_prefetch_us - subvp0_prefetch_us;
+		pipe_data->pipe_config.subvp_data.prefetch_to_mall_start_lines =
+					(((double)(dc->caps.subvp_prefetch_end_to_mall_start_us + prefetch_delta_us) / 1000000) *
+					(phantom_timing0->pix_clk_100hz * 100) + phantom_timing0->h_total - 1) /
+					(double)phantom_timing0->h_total;
+	}
+}
+
+/**
+ * ***************************************************************************************
+ * setup_subvp_dmub_command: Helper to populate the SubVP pipe info for the DMUB subvp command
+ *
+ * Populate the DMCUB SubVP command with SubVP pipe info. All the information required to
+ * calculate the microschedule for the SubVP pipe is stored in the pipe_data of the DMCUB
+ * SubVP command.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] cmd: DMUB cmd to be populated with SubVP info
+ * @param [in] subvp_pipe: pipe_ctx for the SubVP pipe
+ * @param [in] cmd_pipe_index: index for the pipe array in DMCUB SubVP cmd
+ *
+ * @return: void
+ *
+ * ***************************************************************************************
+ */
+static void populate_subvp_cmd_pipe_info(struct dc *dc,
+		struct dc_state *context,
+		union dmub_rb_cmd *cmd,
+		struct pipe_ctx *subvp_pipe,
+		uint8_t cmd_pipe_index)
+{
+	uint32_t j;
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data =
+			&cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[cmd_pipe_index];
+	struct dc_crtc_timing *main_timing = &subvp_pipe->stream->timing;
+	struct dc_crtc_timing *phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+
+	pipe_data->mode = SUBVP;
+	pipe_data->pipe_config.subvp_data.pix_clk_100hz = subvp_pipe->stream->timing.pix_clk_100hz;
+	pipe_data->pipe_config.subvp_data.htotal = subvp_pipe->stream->timing.h_total;
+	pipe_data->pipe_config.subvp_data.vtotal = subvp_pipe->stream->timing.v_total;
+	pipe_data->pipe_config.subvp_data.main_vblank_start =
+			main_timing->v_total - main_timing->v_front_porch;
+	pipe_data->pipe_config.subvp_data.main_vblank_end =
+			main_timing->v_total - main_timing->v_front_porch - main_timing->v_addressable;
+	pipe_data->pipe_config.subvp_data.mall_region_lines = phantom_timing->v_addressable;
+	pipe_data->pipe_config.subvp_data.main_pipe_index = subvp_pipe->pipe_idx;
+
+	// Prefetch lines is equal to VACTIVE + BP + VSYNC
+	pipe_data->pipe_config.subvp_data.prefetch_lines =
+			phantom_timing->v_total - phantom_timing->v_front_porch;
+
+	// Round up
+	pipe_data->pipe_config.subvp_data.prefetch_to_mall_start_lines =
+			(((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
+			(phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
+			(double)phantom_timing->h_total;
+	pipe_data->pipe_config.subvp_data.processing_delay_lines =
+			(((double)dc->caps.subvp_fw_processing_delay_us / 1000000) *
+			(phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
+			(double)phantom_timing->h_total;
+	// Find phantom pipe index based on phantom stream
+	for (j = 0; j < dc->res_pool->pipe_count; j++) {
+		struct pipe_ctx *phantom_pipe = &context->res_ctx.pipe_ctx[j];
+
+		if (phantom_pipe->stream == subvp_pipe->stream->mall_stream_config.paired_stream) {
+			pipe_data->pipe_config.subvp_data.phantom_pipe_index = phantom_pipe->pipe_idx;
+			break;
+		}
+	}
+}
+
+/**
+ * ***************************************************************************************
+ * dc_dmub_setup_subvp_dmub_command: Populate the DMCUB SubVP command
+ *
+ * This function loops through each pipe and populates the DMUB
+ * SubVP CMD info based on the pipe (e.g. SubVP, VBLANK).
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] cmd: DMUB cmd to be populated with SubVP info
+ *
+ * @return: void
+ *
+ * ***************************************************************************************
+ */
+void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
+		struct dc_state *context,
+		bool enable)
+{
+	uint8_t cmd_pipe_index = 0;
+	uint32_t i, pipe_idx;
+	uint8_t subvp_count = 0;
+	union dmub_rb_cmd cmd;
+	struct pipe_ctx *subvp_pipes[2];
+	uint32_t wm_val_refclk = 0;
+
+	memset(&cmd, 0, sizeof(cmd));
+	// FW command for SUBVP
+	cmd.fw_assisted_mclk_switch_v2.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
+	cmd.fw_assisted_mclk_switch_v2.header.sub_type = DMUB_CMD__HANDLE_SUBVP_CMD;
+	cmd.fw_assisted_mclk_switch_v2.header.payload_bytes =
+			sizeof(cmd.fw_assisted_mclk_switch_v2) - sizeof(cmd.fw_assisted_mclk_switch_v2.header);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			subvp_pipes[subvp_count++] = pipe;
+	}
+
+	if (enable) {
+		// For each pipe that is a "main" SUBVP pipe, fill in pipe data for DMUB SUBVP cmd
+		for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+			struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+			if (!pipe->stream)
+				continue;
+
+			if (pipe->plane_state && pipe->stream->mall_stream_config.paired_stream &&
+					pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+				populate_subvp_cmd_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
+			} else if (pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+				// Don't need to check for ActiveDRAMClockChangeMargin < 0, not valid in cases where
+				// we run through DML without calculating "natural" P-state support
+				populate_subvp_cmd_vblank_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
+
+			}
+			pipe_idx++;
+		}
+		if (subvp_count == 2) {
+			update_subvp_prefetch_end_to_mall_start(dc, context, &cmd, subvp_pipes);
+		}
+		cmd.fw_assisted_mclk_switch_v2.config_data.pstate_allow_width_us = dc->caps.subvp_pstate_allow_width_us;
+		cmd.fw_assisted_mclk_switch_v2.config_data.vertical_int_margin_us = dc->caps.subvp_vertical_int_margin_us;
+
+		// Store the original watermark value for this SubVP config so we can lower it when the
+		// MCLK switch starts
+		wm_val_refclk = context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns *
+				dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000 / 1000;
+
+		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
+	}
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+}
+
 bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmub_diagnostic_data *diag_data)
 {
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub || !diag_data)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 6f79327e0035..1820c19d14d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -145,7 +145,6 @@ struct test_pattern {
 	unsigned int cust_pattern_size;
 };
 
-#ifdef CONFIG_DRM_AMD_DC_DCN
 #define SUBVP_DRR_MARGIN_US 500 // 500us for DRR margin (SubVP + DRR)
 
 enum mall_stream_type {
@@ -161,7 +160,6 @@ struct mall_stream_config {
 	enum mall_stream_type type;
 	struct dc_stream_state *paired_stream;	// master / slave stream
 };
-#endif
 
 struct dc_stream_state {
 	// sink is deprecated, new code should not reference
@@ -277,9 +275,7 @@ struct dc_stream_state {
 
 	bool has_non_synchronizable_pclk;
 	bool vblank_synchronized;
-#ifdef CONFIG_DRM_AMD_DC_DCN
 	struct mall_stream_config mall_stream_config;
-#endif
 };
 
 #define ABM_LEVEL_IMMEDIATE_DISABLE 255
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 76f8b40b2165..9f07c1b170c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1308,6 +1308,15 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 		}
 		return;
 	}
+
+	/* For SubVP we need to unconditionally enable because any phantom pipes are
+	 * always removed then newly added for every full updates whenever SubVP is in use.
+	 * The remove-add sequence of the phantom pipe always results in the pipe
+	 * being blanked in enable_stream_timing (DPG).
+	 */
+	if (new_pipe->stream && new_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		new_pipe->update_flags.bits.enable = 1;
+
 	if (old_pipe->plane_state && !new_pipe->plane_state) {
 		new_pipe->update_flags.bits.disable = 1;
 		return;
@@ -1810,7 +1819,9 @@ void dcn20_post_unlock_program_front_end(
 	 */
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable) {
+		// Don't check flip pending on phantom pipes
+		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable &&
+				pipe->stream->mall_stream_config.type != SUBVP_PHANTOM) {
 			struct hubp *hubp = pipe->plane_res.hubp;
 			int j = 0;
 
@@ -1864,18 +1875,34 @@ void dcn20_prepare_bandwidth(
 {
 	struct hubbub *hubbub = dc->res_pool->hubbub;
 	unsigned int compbuf_size_kb = 0;
+	unsigned int cache_wm_a = context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns;
+	unsigned int i;
 
 	dc->clk_mgr->funcs->update_clocks(
 			dc->clk_mgr,
 			context,
 			false);
 
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// At optimize don't restore the original watermark value
+		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
+			context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 4U * 1000U * 1000U * 1000U;
+			break;
+		}
+	}
+
 	/* program dchubbub watermarks */
 	dc->wm_optimized_required = hubbub->funcs->program_watermarks(hubbub,
 					&context->bw_ctx.bw.dcn.watermarks,
 					dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000,
 					false);
 
+	// Restore the real watermark so we can commit the value to DMCUB
+	// DMCUB uses the "original" watermark value in SubVP MCLK switch
+	context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = cache_wm_a;
+
 	/* decrease compbuf size */
 	if (hubbub->funcs->program_compbuf_size) {
 		if (context->bw_ctx.dml.ip.min_comp_buffer_size_kbytes)
@@ -1894,6 +1921,16 @@ void dcn20_optimize_bandwidth(
 	struct hubbub *hubbub = dc->res_pool->hubbub;
 	int i;
 
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// At optimize don't need  to restore the original watermark value
+		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
+			context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 4U * 1000U * 1000U * 1000U;
+			break;
+		}
+	}
+
 	/* program dchubbub watermarks */
 	hubbub->funcs->program_watermarks(hubbub,
 					&context->bw_ctx.bw.dcn.watermarks,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/Makefile b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
index 34f2e37b6704..fe29725b4c06 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
@@ -13,20 +13,21 @@
 DCN32 = dcn32_resource.o dcn32_hubbub.o dcn32_hwseq.o dcn32_init.o \
 		dcn32_dccg.o dcn32_optc.o dcn32_mmhubbub.o dcn32_hubp.o dcn32_dpp.o \
 		dcn32_dio_stream_encoder.o dcn32_dio_link_encoder.o dcn32_hpo_dp_link_encoder.o \
-		dcn32_mpc.o
+		dcn32_resource_helpers.o dcn32_mpc.o
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o := -mhard-float -msse
+dcn32_ccflags := -mhard-float -msse
 endif
 
 ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o := -mhard-float -maltivec
+dcn32_ccflags := -mhard-float -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+dcn32_ccflags += -mhard-float
 endif
 
 ifdef CONFIG_X86
@@ -34,12 +35,15 @@ ifdef IS_OLD_GCC
 # Stack alignment mismatch, proceed with caution.
 # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
 # (8B stack alignment).
-CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o += -mpreferred-stack-boundary=4
+dcn32_ccflags += -mpreferred-stack-boundary=4
 else
-CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o += -msse2
+dcn32_ccflags += -msse2
 endif
 endif
 
+CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource_helpers.o := $(dcn32_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o := $(dcn32_ccflags)
+
 AMD_DAL_DCN32 = $(addprefix $(AMDDALPATH)/dc/dcn32/,$(DCN32))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN32)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index a10ec5919194..e865dafc3229 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -47,7 +47,10 @@
 #include "clk_mgr.h"
 #include "dsc.h"
 #include "dcn20/dcn20_optc.h"
+#include "dmub_subvp_state.h"
+#include "dce/dmub_hw_lock_mgr.h"
 #include "dc_link_dp.h"
+#include "dmub/inc/dmub_subvp_state.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -403,6 +406,65 @@ void dcn32_commit_subvp_config(struct dc *dc, struct dc_state *context)
 */
 }
 
+/* Sub-Viewport DMUB lock needs to be acquired by driver whenever SubVP is active and:
+ * 1. Any full update for any SubVP main pipe
+ * 2. Any immediate flip for any SubVP pipe
+ * 3. Any flip for DRR pipe
+ * 4. If SubVP was previously in use (i.e. in old context)
+ */
+void dcn32_subvp_pipe_control_lock(struct dc *dc,
+		struct dc_state *context,
+		bool lock,
+		bool should_lock_all_pipes,
+		struct pipe_ctx *top_pipe_to_program,
+		bool subvp_prev_use)
+{
+	unsigned int i = 0;
+	bool subvp_immediate_flip = false;
+	bool subvp_in_use = false;
+	bool drr_pipe = false;
+	struct pipe_ctx *pipe, *old_pipe;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+		old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			subvp_in_use = true;
+			break;
+		}
+	}
+
+	if (top_pipe_to_program && top_pipe_to_program->stream && top_pipe_to_program->plane_state) {
+		if (top_pipe_to_program->stream->mall_stream_config.type == SUBVP_MAIN &&
+				top_pipe_to_program->plane_state->flip_immediate)
+			subvp_immediate_flip = true;
+		else if (top_pipe_to_program->stream->mall_stream_config.type == SUBVP_NONE &&
+				top_pipe_to_program->stream->ignore_msa_timing_param)
+			drr_pipe = true;
+	}
+
+	if ((subvp_in_use && (should_lock_all_pipes || subvp_immediate_flip || drr_pipe)) || (!subvp_in_use && subvp_prev_use)) {
+		union dmub_inbox0_cmd_lock_hw hw_lock_cmd = { 0 };
+
+		if (!lock) {
+			for (i = 0; i < dc->res_pool->pipe_count; i++) {
+				pipe = &context->res_ctx.pipe_ctx[i];
+				if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN &&
+						should_lock_all_pipes)
+					pipe->stream_res.tg->funcs->wait_for_state(pipe->stream_res.tg, CRTC_STATE_VBLANK);
+			}
+		}
+
+		hw_lock_cmd.bits.command_code = DMUB_INBOX0_CMD__HW_LOCK;
+		hw_lock_cmd.bits.hw_lock_client = HW_LOCK_CLIENT_DRIVER;
+		hw_lock_cmd.bits.lock = lock;
+		hw_lock_cmd.bits.should_release = !lock;
+		dmub_hw_lock_mgr_inbox0_cmd(dc->ctx->dmub_srv, hw_lock_cmd);
+	}
+}
+
+
 static bool dcn32_set_mpc_shaper_3dlut(
 	struct pipe_ctx *pipe_ctx, const struct dc_stream_state *stream)
 {
@@ -498,7 +560,11 @@ void dcn32_subvp_update_force_pstate(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+		// For SubVP + DRR, also force disallow on the DRR pipe
+		// (We will force allow in the DMUB sequence -- some DRR timings by default won't allow P-State so we have
+		// to force once the vblank is stretched).
+		if (pipe->stream && pipe->plane_state && (pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
+				(pipe->stream->mall_stream_config.type == SUBVP_NONE && pipe->stream->ignore_msa_timing_param))) {
 			struct hubp *hubp = pipe->plane_res.hubp;
 
 			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
@@ -542,9 +608,8 @@ void dcn32_program_mall_pipe_config(struct dc *dc, struct dc_state *context)
 {
 	int i;
 	struct dce_hwseq *hws = dc->hwseq;
-	// Update force P-state for each pipe accordingly
-	if (hws && hws->funcs.subvp_update_force_pstate)
-		hws->funcs.subvp_update_force_pstate(dc, context);
+
+	// Don't force p-state disallow -- can't block dummy p-state
 
 	// Update MALL_SEL register for each pipe
 	if (hws && hws->funcs.update_mall_sel)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
index 2a5bdcf58bc6..170cf4ae03b6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
@@ -63,4 +63,11 @@ void dcn32_update_odm(struct dc *dc, struct dc_state *context, struct pipe_ctx *
 
 unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsigned int *k1_div, unsigned int *k2_div);
 
+void dcn32_subvp_pipe_control_lock(struct dc *dc,
+		struct dc_state *context,
+		bool lock,
+		bool should_lock_all_pipes,
+		struct pipe_ctx *top_pipe_to_program,
+		bool subvp_prev_use);
+
 #endif /* __DC_HWSS_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index 7f492734f881..643058d8ce4d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -102,6 +102,7 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.set_disp_pattern_generator = dcn30_set_disp_pattern_generator,
 	.get_dcc_en_bits = dcn10_get_dcc_en_bits,
 	.commit_subvp_config = dcn32_commit_subvp_config,
+	.subvp_pipe_control_lock = dcn32_subvp_pipe_control_lock,
 	.update_visual_confirm_color = dcn20_update_visual_confirm_color,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 1ea6d258a20d..528f055c5ffc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1779,7 +1779,7 @@ static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *con
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->plane_state && !pipe->top_pipe) {
+		if (pipe->stream && !pipe->top_pipe) {
 			while (pipe) {
 				num_pipes++;
 				pipe = pipe->bottom_pipe;
@@ -1802,9 +1802,10 @@ static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *con
  * The number of pipes used for the chosen surface must be less than or equal to the
  * number of free pipes available.
  *
- * In general we choose surfaces that have ActiveDRAMClockChangeLatencyMargin <= 0 first,
- * then among those surfaces we choose the one with the smallest VBLANK time. We only consider
- * surfaces with ActiveDRAMClockChangeLatencyMargin > 0 if we are forcing a Sub-VP config.
+ * In general we choose surfaces with the longest frame time first (better for SubVP + VBLANK).
+ * For multi-display cases the ActiveDRAMClockChangeMargin doesn't provide enough info on its own
+ * for determining which should be the SubVP pipe (need a way to determine if a pipe / plane doesn't
+ * support MCLK switching naturally [i.e. ACTIVE or VBLANK]).
  *
  * @param [in] dc: current dc state
  * @param [in] context: new dc state
@@ -1820,10 +1821,10 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		unsigned int *index)
 {
 	unsigned int i, pipe_idx;
-	unsigned int min_vblank_us = INT_MAX;
-	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	unsigned int max_frame_time = 0;
 	bool valid_assignment_found = false;
 	unsigned int free_pipes = dcn32_get_num_free_pipes(dc, context);
+	bool current_assignment_freesync = false;
 
 	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
@@ -1842,20 +1843,21 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 			pipe = &context->res_ctx.pipe_ctx[i];
 			if (num_pipes <= free_pipes) {
 				struct dc_stream_state *stream = pipe->stream;
-				unsigned int vblank_us = ((stream->timing.v_total - stream->timing.v_addressable) *
-							stream->timing.h_total /
-							(double)(stream->timing.pix_clk_100hz * 100)) * 1000000;
-				if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] <= 0 &&
-						vblank_us < min_vblank_us) {
+				unsigned int frame_us = (stream->timing.v_total * stream->timing.h_total /
+						(double)(stream->timing.pix_clk_100hz * 100)) * 1000000;
+				if (frame_us > max_frame_time && !stream->ignore_msa_timing_param) {
 					*index = i;
-					min_vblank_us = vblank_us;
+					max_frame_time = frame_us;
 					valid_assignment_found = true;
-				} else if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0 &&
-						dc->debug.force_subvp_mclk_switch && !valid_assignment_found) {
-					// Handle case for forcing Sub-VP config. In this case we can assign
-					// phantom pipes to a surface that has active margin > 0.
+					current_assignment_freesync = false;
+				/* For the 2-Freesync display case, still choose the one with the
+			     * longest frame time
+			     */
+				} else if (stream->ignore_msa_timing_param && (!valid_assignment_found ||
+						(current_assignment_freesync && frame_us > max_frame_time))) {
 					*index = i;
 					valid_assignment_found = true;
+					current_assignment_freesync = true;
 				}
 			}
 		}
@@ -1896,7 +1898,7 @@ static bool dcn32_enough_pipes_for_subvp(struct dc *dc, struct dc_state *context
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		// Find the minimum pipe split count for non SubVP pipes
-		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+		if (pipe->stream && !pipe->top_pipe &&
 				pipe->stream->mall_stream_config.type == SUBVP_NONE) {
 			split_cnt = 0;
 			while (pipe) {
@@ -2074,7 +2076,8 @@ static struct dc_stream_state *dcn32_enable_phantom_stream(struct dc *dc,
 	return phantom_stream;
 }
 
-void dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context)
+// return true if removed piped from ctx, false otherwise
+bool dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context)
 {
 	int i;
 	bool removed_pipe = false;
@@ -2094,8 +2097,7 @@ void dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context)
 			pipe->stream->mall_stream_config.paired_stream = NULL;
 		}
 	}
-	if (removed_pipe)
-		dc->hwss.apply_ctx_to_hw(dc, context);
+	return removed_pipe;
 }
 
 /* TODO: Input to this function should indicate which pipe indexes (or streams)
@@ -2289,12 +2291,11 @@ static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
 			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
 					phantom->timing.v_addressable;
 
-			// Round up when calculating microschedule time
-			time_us = ((microschedule_lines * phantom->timing.h_total +
-					phantom->timing.pix_clk_100hz * 100 - 1) /
-					(double)(phantom->timing.pix_clk_100hz * 100)) * 1000000 +
+			// Round up when calculating microschedule time (+ 1 at the end)
+			time_us = (microschedule_lines * phantom->timing.h_total) /
+					(double)(phantom->timing.pix_clk_100hz * 100) * 1000000 +
 						dc->caps.subvp_prefetch_end_to_mall_start_us +
-						dc->caps.subvp_fw_processing_delay_us;
+						dc->caps.subvp_fw_processing_delay_us + 1;
 			if (time_us > max_microschedule_us)
 				max_microschedule_us = time_us;
 
@@ -2428,12 +2429,12 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 	bool schedulable = false;
 	uint32_t i = 0;
 	uint8_t vblank_index = 0;
-	int16_t prefetch_us = 0;
-	int16_t mall_region_us = 0;
-	int16_t vblank_frame_us = 0;
-	int16_t subvp_active_us = 0;
-	int16_t vblank_blank_us = 0;
-	int16_t max_vblank_mallregion = 0;
+	uint16_t prefetch_us = 0;
+	uint16_t mall_region_us = 0;
+	uint16_t vblank_frame_us = 0;
+	uint16_t subvp_active_us = 0;
+	uint16_t vblank_blank_us = 0;
+	uint16_t max_vblank_mallregion = 0;
 	struct dc_crtc_timing *main_timing = NULL;
 	struct dc_crtc_timing *phantom_timing = NULL;
 	struct dc_crtc_timing *vblank_timing = NULL;
@@ -2462,7 +2463,7 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 			subvp_pipe = pipe;
 	}
 	// Use ignore_msa_timing_param flag to identify as DRR
-	if (found && pipe->stream->ignore_msa_timing_param) {
+	if (found && context->res_ctx.pipe_ctx[vblank_index].stream->ignore_msa_timing_param) {
 		// SUBVP + DRR case
 		schedulable = subvp_drr_schedulable(dc, context, &context->res_ctx.pipe_ctx[vblank_index]);
 	} else if (found) {
@@ -2592,14 +2593,34 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 	 * 4. Display configuration passes validation
 	 * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
 	 */
-	if (!dc->debug.force_disable_subvp &&
+	if (!dc->debug.force_disable_subvp && dcn32_all_pipes_have_stream_and_plane(dc, context) &&
 			(*vlevel == context->bw_ctx.dml.soc.num_states ||
 			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported ||
 			dc->debug.force_subvp_mclk_switch)) {
 
+		dcn32_merge_pipes_for_subvp(dc, context);
+
 		while (!found_supported_config && dcn32_enough_pipes_for_subvp(dc, context) &&
 				dcn32_assign_subvp_pipe(dc, context, &dc_pipe_idx)) {
 
+			/* For the case where *vlevel = num_states, bandwidth validation has failed for this config.
+			 * Adding phantom pipes won't change the validation result, so change the DML input param
+			 * for P-State support before adding phantom pipes and recalculating the DML result.
+			 * However, this case is only applicable for SubVP + DRR cases because the prefetch mode
+			 * will not allow for switch in VBLANK. The DRR display must have it's VBLANK stretched
+			 * enough to support support MCLK switching.
+			 */
+			if (*vlevel == context->bw_ctx.dml.soc.num_states) {
+				context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
+								dm_prefetch_support_stutter;
+				/* There are params (such as FabricClock) that need to be recalculated
+				 * after validation fails (otherwise it will be 0). Calculation for
+				 * phantom vactive requires call into DML, so we must ensure all the
+				 * vba params are valid otherwise we'll get incorrect phantom vactive.
+				 */
+				*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+			}
+
 			dc->res_pool->funcs->add_phantom_pipes(dc, context, pipes, *pipe_cnt, dc_pipe_idx);
 
 			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
@@ -2640,6 +2661,7 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 		// remove phantom pipes and repopulate dml pipes
 		if (!found_supported_config) {
 			dc->res_pool->funcs->remove_phantom_pipes(dc, context);
+			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] = dm_dram_clock_change_unsupported;
 			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
 		} else {
 			// only call dcn20_validate_apply_pipe_split_flags if we found a supported config
@@ -2647,9 +2669,8 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 			memset(merge, 0, MAX_PIPES * sizeof(bool));
 			*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
 
-			// If found a supported SubVP config, phantom pipes were added to the context.
-			// Program timing for the phantom pipes.
-			dc->hwss.apply_ctx_to_hw(dc, context);
+			// Note: We can't apply the phantom pipes to hardware at this time. We have to wait
+			// until driver has acquired the DMCUB lock to do it safely.
 		}
 	}
 }
@@ -2990,7 +3011,9 @@ int dcn32_populate_dml_pipes_from_context(
 			break;
 		case SUBVP_PHANTOM:
 			pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_phantom_pipe;
-			pipes[pipe_cnt].pipe.src.use_mall_for_static_screen = dm_use_mall_static_screen_enable;
+			pipes[pipe_cnt].pipe.src.use_mall_for_static_screen = dm_use_mall_static_screen_disable;
+			// Disallow unbounded req for SubVP according to DCHUB programming guide
+			pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 			break;
 		case SUBVP_NONE:
 			pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_disable;
@@ -3055,13 +3078,18 @@ void dcn32_calculate_wm_and_dlg_fp(
 		int vlevel)
 {
 	int i, pipe_idx, vlevel_temp = 0;
-
 	double dcfclk = dcn3_2_soc.clock_limits[0].dcfclk_mhz;
 	double dcfclk_from_validation = context->bw_ctx.dml.vba.DCFCLKState[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
 	unsigned int min_dram_speed_mts = context->bw_ctx.dml.vba.DRAMSpeed;
 	bool pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] !=
 			dm_dram_clock_change_unsupported;
 
+	// Override DRAMClockChangeSupport for SubVP + DRR case where the DRR cannot switch without stretching it's VBLANK
+	if (!pstate_en && dcn32_subvp_in_use(dc, context)) {
+		context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] = dm_dram_clock_change_vblank_w_mall_sub_vp;
+		pstate_en = true;
+	}
+
 	/* Set B:
 	 * For Set B calculations use clocks from clock_limits[2] when available i.e. when SMU is present,
 	 * otherwise use arbitrary low value from spreadsheet for DCFCLK as lower is safer for watermark
@@ -3136,6 +3164,10 @@ void dcn32_calculate_wm_and_dlg_fp(
 	 * UCLK  : Min,  as reported by PM FW, when available
 	 * pstate latency as per UCLK state dummy pstate latency
 	 */
+	// For Set A and Set C use values from validation
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk_from_validation;
+	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;
 
 	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid) {
 		unsigned int min_dram_speed_mts_margin = 160;
@@ -3191,10 +3223,6 @@ void dcn32_calculate_wm_and_dlg_fp(
 		context->bw_ctx.bw.dcn.watermarks.a.usr_retraining_ns = get_usr_retraining_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	}
 
-	pipes[0].clks_cfg.voltage = vlevel;
-	pipes[0].clks_cfg.dcfclk_mhz = dcfclk_from_validation;
-	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;
-
 	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
 		if (!context->res_ctx.pipe_ctx[i].stream)
 			continue;
@@ -3297,8 +3325,9 @@ void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context, display
 	context->bw_ctx.bw.dcn.clk.p_state_change_support =
 			context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb]
 					!= dm_dram_clock_change_unsupported;
-
+	context->bw_ctx.bw.dcn.clk.num_ways = dcn32_helper_calculate_num_ways_for_subvp(dc, context);
 	/*
+ *
 	 * TODO: needs FAMS
 	 * Pstate change might not be supported by hardware, but it might be
 	 * possible with firmware driven vertical blank stretching.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
index 10b58f1c724a..db4546317cb5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
@@ -28,6 +28,8 @@
 
 #include "core_types.h"
 
+#define DCN3_2_DET_SEG_SIZE 64
+
 #define TO_DCN32_RES_POOL(pool)\
 	container_of(pool, struct dcn32_resource_pool, base)
 
@@ -61,7 +63,7 @@ bool dcn32_release_post_bldn_3dlut(
 		struct dc_3dlut **lut,
 		struct dc_transfer_func **shaper);
 
-void dcn32_remove_phantom_pipes(struct dc *dc,
+bool dcn32_remove_phantom_pipes(struct dc *dc,
 		struct dc_state *context);
 
 void dcn32_add_phantom_pipes(struct dc *dc,
@@ -85,4 +87,20 @@ void dcn32_calculate_wm_and_dlg(
 		int pipe_cnt,
 		int vlevel);
 
+uint32_t dcn32_helper_calculate_num_ways_for_subvp
+		(struct dc *dc,
+		struct dc_state *context);
+
+void dcn32_merge_pipes_for_subvp(struct dc *dc,
+		struct dc_state *context);
+
+bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
+		struct dc_state *context);
+
+bool dcn32_subvp_in_use(struct dc *dc,
+		struct dc_state *context);
+
+void dcn32_update_det_override_for_mpo(struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes);
+
 #endif /* _DCN32_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
new file mode 100644
index 000000000000..e001f6d1f6c3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -0,0 +1,260 @@
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
+ * Authors: AMD
+ *
+ */
+
+// header file of functions being implemented
+#include "dcn32_resource.h"
+#include "dcn20/dcn20_resource.h"
+/**
+ * ********************************************************************************************
+ * dcn32_helper_populate_phantom_dlg_params: Get DLG params for phantom pipes and populate pipe_ctx
+ * with those params.
+ *
+ * This function must be called AFTER the phantom pipes are added to context and run through DML
+ * (so that the DLG params for the phantom pipes can be populated), and BEFORE we program the
+ * timing for the phantom pipes.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] pipes: DML pipe params array
+ * @param [in] pipe_cnt: DML pipe count
+ *
+ * @return: void
+ *
+ * ********************************************************************************************
+ */
+void dcn32_helper_populate_phantom_dlg_params(struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt)
+{
+	uint32_t i, pipe_idx;
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			pipes[pipe_idx].pipe.dest.vstartup_start = get_vstartup(&context->bw_ctx.dml, pipes, pipe_cnt,
+					pipe_idx);
+			pipes[pipe_idx].pipe.dest.vupdate_offset = get_vupdate_offset(&context->bw_ctx.dml, pipes, pipe_cnt,
+					pipe_idx);
+			pipes[pipe_idx].pipe.dest.vupdate_width = get_vupdate_width(&context->bw_ctx.dml, pipes, pipe_cnt,
+					pipe_idx);
+			pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt,
+					pipe_idx);
+			pipe->pipe_dlg_param = pipes[pipe_idx].pipe.dest;
+		}
+		pipe_idx++;
+	}
+}
+
+/**
+ * ********************************************************************************************
+ * dcn32_helper_calculate_num_ways_for_subvp: Calculate number of ways needed for SubVP
+ *
+ * This function first checks the bytes required per pixel on the SubVP pipe, then calculates
+ * the total number of pixels required in the SubVP MALL region. These are used to calculate
+ * the number of cache lines used (then number of ways required) for SubVP MCLK switching.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ *
+ * @return: number of ways required for SubVP
+ *
+ * ********************************************************************************************
+ */
+uint32_t dcn32_helper_calculate_num_ways_for_subvp(struct dc *dc, struct dc_state *context)
+{
+	uint32_t num_ways = 0;
+	uint32_t mall_region_pixels = 0;
+	uint32_t bytes_per_pixel = 0;
+	uint32_t cache_lines_used = 0;
+	uint32_t lines_per_way = 0;
+	uint32_t total_cache_lines = 0;
+	uint32_t i = 0;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// Find the phantom pipes
+		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			bytes_per_pixel = pipe->plane_state->format >= SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 ? 8 : 4;
+			mall_region_pixels = pipe->stream->timing.h_addressable * pipe->stream->timing.v_addressable;
+			// cache lines used is total bytes / cache_line size. Add +2 for worst case alignment
+			// (MALL is 64-byte aligned)
+			cache_lines_used += (bytes_per_pixel * mall_region_pixels) / dc->caps.cache_line_size + 2;
+		}
+	}
+
+	total_cache_lines = dc->caps.max_cab_allocation_bytes / dc->caps.cache_line_size;
+	lines_per_way = total_cache_lines / dc->caps.cache_num_ways;
+	num_ways = cache_lines_used / lines_per_way;
+	if (cache_lines_used % lines_per_way > 0)
+		num_ways++;
+
+	return num_ways;
+}
+
+void dcn32_merge_pipes_for_subvp(struct dc *dc,
+		struct dc_state *context)
+{
+	uint32_t i;
+
+	/* merge pipes if necessary */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// For now merge all pipes for SubVP since pipe split case isn't supported yet
+
+		/* if ODM merge we ignore mpc tree, mpo pipes will have their own flags */
+		if (pipe->prev_odm_pipe) {
+			/*split off odm pipe*/
+			pipe->prev_odm_pipe->next_odm_pipe = pipe->next_odm_pipe;
+			if (pipe->next_odm_pipe)
+				pipe->next_odm_pipe->prev_odm_pipe = pipe->prev_odm_pipe;
+
+			pipe->bottom_pipe = NULL;
+			pipe->next_odm_pipe = NULL;
+			pipe->plane_state = NULL;
+			pipe->stream = NULL;
+			pipe->top_pipe = NULL;
+			pipe->prev_odm_pipe = NULL;
+			if (pipe->stream_res.dsc)
+				dcn20_release_dsc(&context->res_ctx, dc->res_pool, &pipe->stream_res.dsc);
+			memset(&pipe->plane_res, 0, sizeof(pipe->plane_res));
+			memset(&pipe->stream_res, 0, sizeof(pipe->stream_res));
+		} else if (pipe->top_pipe && pipe->top_pipe->plane_state == pipe->plane_state) {
+			struct pipe_ctx *top_pipe = pipe->top_pipe;
+			struct pipe_ctx *bottom_pipe = pipe->bottom_pipe;
+
+			top_pipe->bottom_pipe = bottom_pipe;
+			if (bottom_pipe)
+				bottom_pipe->top_pipe = top_pipe;
+
+			pipe->top_pipe = NULL;
+			pipe->bottom_pipe = NULL;
+			pipe->plane_state = NULL;
+			pipe->stream = NULL;
+			memset(&pipe->plane_res, 0, sizeof(pipe->plane_res));
+			memset(&pipe->stream_res, 0, sizeof(pipe->stream_res));
+		}
+	}
+}
+
+bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
+		struct dc_state *context)
+{
+	uint32_t i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (!pipe->plane_state)
+			return false;
+	}
+	return true;
+}
+
+bool dcn32_subvp_in_use(struct dc *dc,
+		struct dc_state *context)
+{
+	uint32_t i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE)
+			return true;
+	}
+	return false;
+}
+
+/* For MPO we adjust the DET allocation to ensure we have enough DET buffer when an MPO pipe
+ * is removed. For example for 1 MPO + 1 non-MPO normally we would allocate 6 DET segments
+ * for each pipe [6, 6, 6]. But when transitioning out of MPO it would change from
+ * [6, 6, 6] -> [9, 9]. However, if VUPDATE for the non-MPO pipe comes first we would be
+ * trying to allocate more DET than what's currently available which would result in underflow.
+ *
+ * In this case we must ensure there is enough buffer when transitioning in and out of MPO:
+ *
+ * 1 MPO (2 plane) + 1 non-MPO case:
+ * [4, 4, 9]<->[9, 9]: Allocate 4 each for MPO pipes, and maintain 9 for non-MPO pipe
+ *
+ * 1 MPO (2 plane) + 2 non-MPO case:
+ * [3, 3, 5, 5]<->[6, 6, 6]
+ *
+ * 1 MPO (3 plane) + 1 non-MPO case:
+ * [3, 3, 3, 9]<->[4, 4, 9] or [3, 3, 3, 6]<->[9, 9]
+ *
+ * For multi-display MPO case all pipes will have 4 segments:
+ * Removing MPO on one of the displays will result in 3 pipes
+ * (1 MPO and 1 non-MPO which is covered by single MPO stream case).
+ */
+void dcn32_update_det_override_for_mpo(struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes)
+{
+	uint8_t i, mpo_stream_index, pipe_cnt;
+	uint8_t mpo_stream_count = 0;
+	uint8_t mpo_planes = 0; // Only used in single display MPO case
+	unsigned int j;
+	struct resource_context *res_ctx = &context->res_ctx;
+
+	for (i = 0; i < context->stream_count; i++) {
+		if (context->stream_status[i].plane_count > 1) {
+			mpo_stream_index = i;
+			mpo_stream_count++;
+			mpo_planes = context->stream_status[i].plane_count;
+		}
+	}
+
+	if (mpo_stream_count == 1) {
+		for (j = 0, pipe_cnt = 0; j < dc->res_pool->pipe_count; j++) {
+			if (!res_ctx->pipe_ctx[j].stream)
+				continue;
+
+			if (context->res_ctx.pipe_ctx[j].stream == context->streams[mpo_stream_index]) {
+				// For 3 plane MPO + 1 non-MPO, do [3, 3, 3, 9]
+				// For 2 plane MPO + 1 non-MPO, do [4, 4, 9]
+				if (context->stream_count - mpo_stream_count == 1)
+					pipes[pipe_cnt].pipe.src.det_size_override = DCN3_2_DET_SEG_SIZE * (mpo_planes == 2 ? 4 : 3);
+				else if (context->stream_count - mpo_stream_count == 2)
+					pipes[pipe_cnt].pipe.src.det_size_override = DCN3_2_DET_SEG_SIZE * 3;
+
+			} else if (context->res_ctx.pipe_ctx[j].stream &&
+					context->res_ctx.pipe_ctx[j].stream != context->streams[mpo_stream_index]) {
+				// Update for non-MPO pipes
+				if (context->stream_count - mpo_stream_count == 1)
+					pipes[pipe_cnt].pipe.src.det_size_override = DCN3_2_DET_SEG_SIZE * 9;
+				else if (context->stream_count - mpo_stream_count == 2)
+					pipes[pipe_cnt].pipe.src.det_size_override = DCN3_2_DET_SEG_SIZE * 5;
+			}
+			pipe_cnt++;
+		}
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index 2bdf60846762..00acf2079b06 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -362,6 +362,7 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	unsigned int hostvm_levels_force;
 	int source_scan;
 	int source_rotation; // new in dml32
+	unsigned int det_size_override; // use to populate DETSizeOverride in vba struct
 	int sw_mode;
 	int macro_tile_size;
 	unsigned int surface_width_y;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 0317af5bb8ca..078c0c3ca2c5 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -202,9 +202,8 @@ struct resource_funcs {
             display_e2e_pipe_params_st *pipes,
 			unsigned int pipe_cnt,
             unsigned int index);
-	void (*remove_phantom_pipes)(
-            struct dc *dc,
-            struct dc_state *context);
+
+	bool (*remove_phantom_pipes)(struct dc *dc, struct dc_state *context);
 };
 
 struct audio_support{
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index eb616a4ed508..ccb3c719fc4d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -246,6 +246,13 @@ struct hw_sequencer_funcs {
 			int mpcc_id);
 
 	void (*commit_subvp_config)(struct dc *dc, struct dc_state *context);
+	void (*subvp_pipe_control_lock)(struct dc *dc,
+			struct dc_state *context,
+			bool lock,
+			bool should_lock_all_pipes,
+			struct pipe_ctx *top_pipe_to_program,
+			bool subvp_prev_use);
+
 };
 
 void color_space_to_black_color(
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index bf6f017858a6..4e21ff32800f 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -92,6 +92,9 @@
  */
 #define NUM_BL_CURVE_SEGS               16
 
+/* Maximum number of SubVP streams */
+#define DMUB_MAX_SUBVP_STREAMS 2
+
 /* Maximum number of streams on any ASIC. */
 #define DMUB_MAX_STREAMS 6
 
@@ -689,6 +692,9 @@ enum dmub_cmd_type {
 	 * Command type used for <TODO:description>
 	 */
 	DMUB_CMD__CAB_FOR_SS = 75,
+
+	DMUB_CMD__FW_ASSISTED_MCLK_SWITCH = 76,
+
 	/**
 	 * Command type used for interfacing with DPIA.
 	 */
@@ -942,6 +948,80 @@ struct dmub_rb_cmd_cab_for_ss {
 	uint8_t cab_alloc_ways; /* total number of ways */
 	uint8_t debug_bits;     /* debug bits */
 };
+
+enum mclk_switch_mode {
+	NONE = 0,
+	FPO = 1,
+	SUBVP = 2,
+	VBLANK = 3,
+};
+
+/* Per pipe struct which stores the MCLK switch mode
+ * data to be sent to DMUB.
+ * Named "v2" for now -- once FPO and SUBVP are fully merged
+ * the type name can be updated
+ */
+struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 {
+	union {
+		struct {
+			uint32_t pix_clk_100hz;
+			uint16_t main_vblank_start;
+			uint16_t main_vblank_end;
+			uint16_t mall_region_lines;
+			uint16_t prefetch_lines;
+			uint16_t prefetch_to_mall_start_lines;
+			uint16_t processing_delay_lines;
+			uint16_t htotal; // required to calculate line time for multi-display cases
+			uint16_t vtotal;
+			uint8_t main_pipe_index;
+			uint8_t phantom_pipe_index;
+			uint8_t padding[2];
+		} subvp_data;
+
+		struct {
+			uint32_t pix_clk_100hz;
+			uint16_t vblank_start;
+			uint16_t vblank_end;
+			uint16_t vstartup_start;
+			uint16_t vtotal;
+			uint16_t htotal;
+			uint8_t vblank_pipe_index;
+			uint8_t padding[2];
+			struct {
+				uint8_t drr_in_use;
+				uint8_t drr_window_size_ms;	// Indicates largest VMIN/VMAX adjustment per frame
+				uint16_t min_vtotal_supported;	// Min VTOTAL that supports switching in VBLANK
+				uint16_t max_vtotal_supported;	// Max VTOTAL that can support SubVP static scheduling
+				uint8_t use_ramping;		// Use ramping or not
+			} drr_info;				// DRR considered as part of SubVP + VBLANK case
+		} vblank_data;
+	} pipe_config;
+
+	enum mclk_switch_mode mode;
+};
+
+/**
+ * Config data for Sub-VP and FPO
+ * Named "v2" for now -- once FPO and SUBVP are fully merged
+ * the type name can be updated
+ */
+struct dmub_cmd_fw_assisted_mclk_switch_config_v2 {
+	uint16_t watermark_a_cache;
+	uint8_t vertical_int_margin_us;
+	uint8_t pstate_allow_width_us;
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 pipe_data[DMUB_MAX_SUBVP_STREAMS];
+};
+
+/**
+ * DMUB rb command definition for Sub-VP and FPO
+ * Named "v2" for now -- once FPO and SUBVP are fully merged
+ * the type name can be updated
+ */
+struct dmub_rb_cmd_fw_assisted_mclk_switch_v2 {
+	struct dmub_cmd_header header;
+	struct dmub_cmd_fw_assisted_mclk_switch_config_v2 config_data;
+};
+
 /**
  * enum dmub_cmd_idle_opt_type - Idle optimization command type.
  */
@@ -1494,6 +1574,12 @@ enum dmub_cmd_psr_type {
 	DMUB_CMD__SET_PSR_POWER_OPT = 7,
 };
 
+enum dmub_cmd_fams_type {
+	DMUB_CMD__FAMS_SETUP_FW_CTRL	= 0,
+	DMUB_CMD__FAMS_DRR_UPDATE		= 1,
+	DMUB_CMD__HANDLE_SUBVP_CMD	= 2, // specifically for SubVP cmd
+};
+
 /**
  * PSR versions.
  */
@@ -2958,6 +3044,9 @@ union dmub_rb_cmd {
 	 * Definition of a DMUB_CMD__CAB command.
 	 */
 	struct dmub_rb_cmd_cab_for_ss cab;
+
+	struct dmub_rb_cmd_fw_assisted_mclk_switch_v2 fw_assisted_mclk_switch_v2;
+
 	/**
 	 * Definition of a DMUB_CMD__IDLE_OPT_DCN_RESTORE command.
 	 */
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h
new file mode 100644
index 000000000000..86b2b16f702b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h
@@ -0,0 +1,160 @@
+/* Copyright � 2019 Advanced Micro Devices, Inc. All rights reserved. */
+
+#ifndef DMUB_SUBVP_STATE_H
+#define DMUB_SUBVP_STATE_H
+
+#include "dmub_cmd.h"
+
+#define DMUB_SUBVP_INST0 0
+#define DMUB_SUBVP_INST1 1
+#define SUBVP_MAX_WATERMARK 0xFFFF
+
+struct dmub_subvp_hubp_state {
+	uint32_t CURSOR0_0_CURSOR_POSITION;
+	uint32_t CURSOR0_0_CURSOR_HOT_SPOT;
+	uint32_t CURSOR0_0_CURSOR_DST_OFFSET;
+	uint32_t CURSOR0_0_CURSOR_SURFACE_ADDRESS_HIGH;
+	uint32_t CURSOR0_0_CURSOR_SURFACE_ADDRESS;
+	uint32_t CURSOR0_0_CURSOR_SIZE;
+	uint32_t CURSOR0_0_CURSOR_CONTROL;
+	uint32_t HUBPREQ0_CURSOR_SETTINGS;
+	uint32_t HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_HIGH;
+	uint32_t HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_C;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C;
+	uint32_t HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_C;
+};
+
+enum subvp_error_code {
+	DMUB_SUBVP_INVALID_STATE,
+	DMUB_SUBVP_INVALID_TRANSITION,
+};
+
+enum subvp_state {
+	DMUB_SUBVP_DISABLED,
+	DMUB_SUBVP_IDLE,
+	DMUB_SUBVP_TRY_ACQUIRE_LOCKS,
+	DMUB_SUBVP_WAIT_FOR_LOCKS,
+	DMUB_SUBVP_PRECONFIGURE,
+	DMUB_SUBVP_PREPARE,
+	DMUB_SUBVP_ENABLE,
+	DMUB_SUBVP_SWITCHING,
+	DMUB_SUBVP_END,
+	DMUB_SUBVP_RESTORE,
+};
+
+/* Defines information for SUBVP to handle vertical interrupts. */
+struct dmub_subvp_vertical_interrupt_event {
+	/**
+	 * @inst: Hardware instance of vertical interrupt.
+	 */
+	uint8_t otg_inst;
+
+	/**
+	 * @pad: Align structure to 4 byte boundary.
+	 */
+	uint8_t pad[3];
+
+	enum subvp_state curr_state;
+};
+
+struct dmub_subvp_vertical_interrupt_state {
+	/**
+	 * @events: Event list.
+	 */
+	struct dmub_subvp_vertical_interrupt_event events[DMUB_MAX_STREAMS];
+};
+
+struct dmub_subvp_vline_interrupt_event {
+
+	uint8_t hubp_inst;
+	uint8_t pad[3];
+};
+
+struct dmub_subvp_vline_interrupt_state {
+	struct dmub_subvp_vline_interrupt_event events[DMUB_MAX_PLANES];
+};
+
+struct dmub_subvp_interrupt_ctx {
+	struct dmub_subvp_vertical_interrupt_state vertical_int;
+	struct dmub_subvp_vline_interrupt_state vline_int;
+};
+
+struct dmub_subvp_pipe_state {
+	uint32_t pix_clk_100hz;
+	uint16_t main_vblank_start;
+	uint16_t main_vblank_end;
+	uint16_t mall_region_lines;
+	uint16_t prefetch_lines;
+	uint16_t prefetch_to_mall_start_lines;
+	uint16_t processing_delay_lines;
+	uint8_t main_pipe_index;
+	uint8_t phantom_pipe_index;
+	uint16_t htotal; // htotal for main / phantom pipe
+	uint16_t vtotal;
+	uint16_t optc_underflow_count;
+	uint16_t hubp_underflow_count;
+	uint8_t pad[2];
+};
+
+/**
+ * struct dmub_subvp_vblank_drr_info - Store DRR state when handling
+ * SubVP + VBLANK with DRR multi-display case.
+ *
+ * The info stored in this struct is only valid if drr_in_use = 1.
+ */
+struct dmub_subvp_vblank_drr_info {
+	uint8_t drr_in_use;
+	uint8_t drr_window_size_ms;	// DRR window size -- indicates largest VMIN/VMAX adjustment per frame
+	uint16_t min_vtotal_supported;	// Min VTOTAL that supports switching in VBLANK
+	uint16_t max_vtotal_supported;	// Max VTOTAL that can still support SubVP static scheduling requirements
+	uint16_t prev_vmin;		// Store VMIN value before MCLK switch (used to restore after MCLK end)
+	uint16_t prev_vmax;		// Store VMAX value before MCLK switch (used to restore after MCLK end)
+	uint8_t use_ramping;		// Use ramping or not
+	uint8_t pad[1];
+};
+
+struct dmub_subvp_vblank_pipe_info {
+	uint32_t pix_clk_100hz;
+	uint16_t vblank_start;
+	uint16_t vblank_end;
+	uint16_t vstartup_start;
+	uint16_t vtotal;
+	uint16_t htotal;
+	uint8_t pipe_index;
+	uint8_t pad[1];
+	struct dmub_subvp_vblank_drr_info drr_info;	// DRR considered as part of SubVP + VBLANK case
+};
+
+enum subvp_switch_type {
+	DMUB_SUBVP_ONLY, // Used for SubVP only, and SubVP + VACTIVE
+	DMUB_SUBVP_AND_SUBVP, // 2 SubVP displays
+	DMUB_SUBVP_AND_VBLANK,
+	DMUB_SUBVP_AND_FPO,
+};
+
+/* SubVP state. */
+struct dmub_subvp_state {
+	struct dmub_subvp_pipe_state pipe_state[DMUB_MAX_SUBVP_STREAMS];
+	struct dmub_subvp_interrupt_ctx int_ctx;
+	struct dmub_subvp_vblank_pipe_info vblank_info;
+	enum subvp_state state; // current state
+	enum subvp_switch_type switch_type; // enum take up 4 bytes (?)
+	uint8_t mclk_pending;
+	uint8_t num_subvp_streams;
+	uint8_t vertical_int_margin_us;
+	uint8_t pstate_allow_width_us;
+	uint32_t subvp_mclk_switch_count;
+	uint32_t subvp_wait_lock_count;
+	uint32_t driver_wait_lock_count;
+	uint32_t subvp_vblank_frame_count;
+	uint16_t watermark_a_cache;
+	uint8_t pad[2];
+};
+
+#endif /* _DMUB_SUBVP_STATE_H_ */
-- 
2.25.1

