Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE753413D
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 18:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AED710E686;
	Wed, 25 May 2022 16:20:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D123910E2AA
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 16:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcQx15cKTxcqm/bTtmKG6jGEJHPws8SmJZ/EqrUH9PgidaUcKjRwtfRnYltd8zTm626VLeFDNPkNmneEfyu9XmArKCJBGmUbDx2cJY2Nc6EUxj9G9gFKI2gWRQprmr27poVcf2W2018i9XFJkjzn+CUBsYIomH/2wIum2lVWD+HWdYo6sZf0TdpFoG+ueoY4yqUmaPtG9cCbj11YptW2nEvlDslo+nFiNKUMbPdQtOS4medL9j/2Axe1C8jxD+2SL5oJOKin49GQP+FoVjJ4Pcaiv8pyBPluowZGBg6oiEgQ5H8XM0XHp963Q6Z9TsjZqM0nOvIH1YpgiMXjcBLGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsqZOh9+aC8jylrt365BS+lGI/gkthT3bfLMTNvP8/4=;
 b=iNDCY9ojFQKFseyMyKIAeg9uyyqQzs1/wxNxIlRbDGqQ8ZwmrBzfpF9FhVVG2J2kPPUz+cxYgtgOgNejWQpjXZ6SBdyr0yMPbdS2V23s7cKAiTY9S8sGFDBr9QPlk3ZOEpV1/+6PcdcCPG5TVIZ+oWAVVGV0oFDm9cbpFcZRRIwnti6QntNWrPz0lB+1mMMSPpf4JpZuMIb1gRvb93KmlUK3yiqobdJSJ4delDCyBJN37mnxOjNaSjP9MlgOQW9kOqM7kjbytBE5kTPPELcHavgmadPgRvywGUn6JRUqP1yJCWOCu9E2CHrBbzFgZL42n8W76x2no69xc88jrcRZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsqZOh9+aC8jylrt365BS+lGI/gkthT3bfLMTNvP8/4=;
 b=yOitkPlawEzmiC7jl0yROGMvJnsMIu36CkUaoJY6u4n7zu06DKk/LeXQbs6SPidGvenhYtZaQrqpBMaxHfVMeB4cbrxNr4ulskE0x6g56ohCm5U5BxxtSOnPhNrFjLWxQa6UJjbVU1rWm+Cyd03kBuRYUAmdaujnYSRCYkVslg4=
Received: from DM6PR04CA0023.namprd04.prod.outlook.com (2603:10b6:5:334::28)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 25 May
 2022 16:20:03 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::8e) by DM6PR04CA0023.outlook.office365.com
 (2603:10b6:5:334::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 16:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 16:20:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 11:20:01 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/43] drm/amd/display: Add DMCUB source files and changes for
 DCN32/321
Date: Wed, 25 May 2022 12:19:03 -0400
Message-ID: <20220525161941.2544055-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525161941.2544055-1-alexander.deucher@amd.com>
References: <20220525161941.2544055-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24854844-2168-45c6-b1a4-08da3e6a6cb8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4391CD341FA028F8E0AE11D1F7D69@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghe3+YbtYnnlGpj9DIivtOkoPU0uhXNxGvoUMkY1n6BfPILoXdLVbBPtzxw5moYohz3Hka8xltKtOw7X9/kgc6BTbvQUKyqTcpq+tSr0K2+jTOzCeIhPXJlxtdBB49+IY6pY0J9VS5V6YnTKyc8PJeH/c2wOz3NTOuMAaqARonAstDxl73yRNApqP0ABWHbcEYt8WMpjIPls1Skem4pvbNTz4/mDs6OFP3o8ve1PWp1V+aYQcTZNWXfsCb+GJ7UGqZq6yZdhSdBqkC1bgifBZdxlblXAhbPlpenqiRpEfkpOBcTBfvIY/dDIwV1maqhzcn/+NY3iWz9XoJGuqSKGKuCx54nUw2RtlPi8lccT1PkgxQyo5ezbwBLWzx+L4GodIbh6FTXqQdqKYR/AHQN8P2ApQ+AgBGRYKzR10i+MNM5EJO6XnPN5a6YQ0IOGSQrYZKyrtbBMyRUMHs/RRYQ0lq+js1ZkVyJN1EyhOClRAutDeZoKSRSRDAoUgAnE6zoh1ZO+TvDFePKJhxGpFk/H3Q4nX4sACGwAxOj0Qjkdy8UFfa5r3KGiAzNGhiWTn2RYqOTYv5jkrgQ16qHjFrvj8h8H1uerLlaAw7Z4V/zKlLyv7lDLfZPMteU9Yu2t8vlinurgZQJEBUM8iWALNcNUPAGwXzzWM7V5xOvQBeQaE6lvXVurU3ktnP7f8tTWUY21d5pS+5ihu/uhSg0LWIqH8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(336012)(1076003)(16526019)(2616005)(426003)(186003)(86362001)(81166007)(6916009)(356005)(40460700003)(83380400001)(316002)(4326008)(26005)(30864003)(54906003)(36756003)(36860700001)(5660300002)(82310400005)(2906002)(8936002)(8676002)(70586007)(70206006)(508600001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:20:03.6751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24854844-2168-45c6-b1a4-08da3e6a6cb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

DMCUB is the display engine microcontroller which aids in modesetting
and other display related features.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  31 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |   6 +
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  26 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile |   1 +
 .../gpu/drm/amd/display/dmub/src/dmub_dcn32.c | 488 ++++++++++++++++++
 .../gpu/drm/amd/display/dmub/src/dmub_dcn32.h | 256 +++++++++
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  51 +-
 8 files changed, 859 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 541376fabbef..11597bca966a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -250,6 +250,37 @@ void dc_dmub_trace_event_control(struct dc *dc, bool enable)
 	dm_helpers_dmub_outbox_interrupt_control(dc->ctx, enable);
 }
 
+void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
+{
+	union dmub_rb_cmd cmd = { 0 };
+	enum dmub_status status;
+
+	if (!dmub) {
+		return;
+	}
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	/* Prepare fw command */
+	cmd.query_feature_caps.header.type = DMUB_CMD__QUERY_FEATURE_CAPS;
+	cmd.query_feature_caps.header.sub_type = 0;
+	cmd.query_feature_caps.header.ret_status = 1;
+	cmd.query_feature_caps.header.payload_bytes = sizeof(struct dmub_cmd_query_feature_caps_data);
+
+	/* Send command to fw */
+	status = dmub_srv_cmd_with_reply_data(dmub, &cmd);
+
+	ASSERT(status == DMUB_STATUS_OK);
+
+	/* If command was processed, copy feature caps to dmub srv */
+	if (status == DMUB_STATUS_OK &&
+	    cmd.query_feature_caps.header.ret_status == 0) {
+		memcpy(&dmub->feature_caps,
+		       &cmd.query_feature_caps.query_feature_caps_data,
+		       sizeof(struct dmub_feature_caps));
+	}
+}
+
 bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmub_diagnostic_data *diag_data)
 {
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub || !diag_data)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index 7e4e2ec5915d..50e44b53f14c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -68,6 +68,8 @@ bool dc_dmub_srv_get_dmub_outbox0_msg(const struct dc *dc, struct dmcub_trace_bu
 
 void dc_dmub_trace_event_control(struct dc *dc, bool enable);
 
+void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub);
+
 void dc_dmub_srv_clear_inbox0_ack(struct dc_dmub_srv *dmub_srv);
 void dc_dmub_srv_wait_for_inbox0_ack(struct dc_dmub_srv *dmub_srv);
 void dc_dmub_srv_send_inbox0_cmd(struct dc_dmub_srv *dmub_srv, union dmub_inbox0_data_register data);
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 7dbc9fb55459..04049dc5d9df 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -246,6 +246,7 @@ struct dmub_srv_hw_params {
 	bool dpia_supported;
 	bool disable_dpia;
 	bool usb4_cm_version;
+	bool fw_in_system_memory;
 };
 
 /**
@@ -310,6 +311,9 @@ struct dmub_srv_hw_funcs {
 			      const struct dmub_window *cw0,
 			      const struct dmub_window *cw1);
 
+	void (*backdoor_load_zfb_mode)(struct dmub_srv *dmub,
+			      const struct dmub_window *cw0,
+			      const struct dmub_window *cw1);
 	void (*setup_windows)(struct dmub_srv *dmub,
 			      const struct dmub_window *cw2,
 			      const struct dmub_window *cw3,
@@ -365,6 +369,7 @@ struct dmub_srv_hw_funcs {
 
 	uint32_t (*get_gpint_dataout)(struct dmub_srv *dmub);
 
+	void (*configure_dmub_in_system_memory)(struct dmub_srv *dmub);
 	void (*clear_inbox0_ack_register)(struct dmub_srv *dmub);
 	uint32_t (*read_inbox0_ack_register)(struct dmub_srv *dmub);
 	void (*send_inbox0_cmd)(struct dmub_srv *dmub, union dmub_inbox0_data_register data);
@@ -412,6 +417,7 @@ struct dmub_srv {
 	/* private: internal use only */
 	const struct dmub_srv_common_regs *regs;
 	const struct dmub_srv_dcn31_regs *regs_dcn31;
+	const struct dmub_srv_dcn32_regs *regs_dcn32;
 
 	struct dmub_srv_base_funcs funcs;
 	struct dmub_srv_hw_funcs hw_funcs;
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 385c28238beb..8fc1846f0708 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -641,7 +641,10 @@ enum dmub_cmd_type {
 	 * Command type used for all panel control commands.
 	 */
 	DMUB_CMD__PANEL_CNTL = 74,
-
+	/**
+	 * Command type used for <TODO:description>
+	 */
+	DMUB_CMD__CAB_FOR_SS = 75,
 	/**
 	 * Command type used for interfacing with DPIA.
 	 */
@@ -878,6 +881,23 @@ struct dmub_rb_cmd_mall {
 	uint8_t reserved2; /**< Reserved bits */
 };
 
+/**
+ * enum dmub_cmd_cab_type - TODO:
+ */
+enum dmub_cmd_cab_type {
+	DMUB_CMD__CAB_NO_IDLE_OPTIMIZATION = 0,
+	DMUB_CMD__CAB_NO_DCN_REQ = 1,
+	DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB = 2,
+};
+
+/**
+ * struct dmub_rb_cmd_cab_for_ss - TODO:
+ */
+struct dmub_rb_cmd_cab_for_ss {
+	struct dmub_cmd_header header;
+	uint8_t cab_alloc_ways; /* total number of ways */
+	uint8_t debug_bits;     /* debug bits */
+};
 /**
  * enum dmub_cmd_idle_opt_type - Idle optimization command type.
  */
@@ -2693,6 +2713,10 @@ union dmub_rb_cmd {
 	 * Definition of a DMUB_CMD__MALL command.
 	 */
 	struct dmub_rb_cmd_mall mall;
+	/**
+	 * Definition of a DMUB_CMD__CAB command.
+	 */
+	struct dmub_rb_cmd_cab_for_ss cab;
 	/**
 	 * Definition of a DMUB_CMD__IDLE_OPT_DCN_RESTORE command.
 	 */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index 856c7f48de7a..0589ad4778ee 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -23,6 +23,7 @@
 DMUB = dmub_srv.o dmub_srv_stat.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
 DMUB += dmub_dcn30.o dmub_dcn301.o dmub_dcn302.o dmub_dcn303.o
 DMUB += dmub_dcn31.o dmub_dcn315.o dmub_dcn316.o
+DMUB += dmub_dcn32.o
 
 AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
new file mode 100644
index 000000000000..0a498082ccc6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
@@ -0,0 +1,488 @@
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
+#include "../dmub_srv.h"
+#include "dmub_reg.h"
+#include "dmub_dcn32.h"
+
+#include "dcn/dcn_3_2_0_offset.h"
+#include "dcn/dcn_3_2_0_sh_mask.h"
+
+#define DCN_BASE__INST0_SEG2                       0x000034C0
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG##seg
+#define CTX dmub
+#define REGS dmub->regs_dcn32
+#define REG_OFFSET_EXP(reg_name) (BASE(reg##reg_name##_BASE_IDX) + reg##reg_name)
+
+const struct dmub_srv_dcn32_regs dmub_srv_dcn32_regs = {
+#define DMUB_SR(reg) REG_OFFSET_EXP(reg),
+		{ DMUB_DCN32_REGS() },
+#undef DMUB_SR
+
+#define DMUB_SF(reg, field) FD_MASK(reg, field),
+		{ DMUB_DCN32_FIELDS() },
+#undef DMUB_SF
+
+#define DMUB_SF(reg, field) FD_SHIFT(reg, field),
+		{ DMUB_DCN32_FIELDS() },
+#undef DMUB_SF
+};
+
+static void dmub_dcn32_get_fb_base_offset(struct dmub_srv *dmub,
+		uint64_t *fb_base,
+		uint64_t *fb_offset)
+{
+	uint32_t tmp;
+
+	if (dmub->fb_base || dmub->fb_offset) {
+		*fb_base = dmub->fb_base;
+		*fb_offset = dmub->fb_offset;
+		return;
+	}
+
+	REG_GET(DCN_VM_FB_LOCATION_BASE, FB_BASE, &tmp);
+	*fb_base = (uint64_t)tmp << 24;
+
+	REG_GET(DCN_VM_FB_OFFSET, FB_OFFSET, &tmp);
+	*fb_offset = (uint64_t)tmp << 24;
+}
+
+static inline void dmub_dcn32_translate_addr(const union dmub_addr *addr_in,
+		uint64_t fb_base,
+		uint64_t fb_offset,
+		union dmub_addr *addr_out)
+{
+	addr_out->quad_part = addr_in->quad_part - fb_base + fb_offset;
+}
+
+void dmub_dcn32_reset(struct dmub_srv *dmub)
+{
+	union dmub_gpint_data_register cmd;
+	const uint32_t timeout = 30;
+	uint32_t in_reset, scratch, i;
+
+	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &in_reset);
+
+	if (in_reset == 0) {
+		cmd.bits.status = 1;
+		cmd.bits.command_code = DMUB_GPINT__STOP_FW;
+		cmd.bits.param = 0;
+
+		dmub->hw_funcs.set_gpint(dmub, cmd);
+
+		/**
+		 * Timeout covers both the ACK and the wait
+		 * for remaining work to finish.
+		 *
+		 * This is mostly bound by the PHY disable sequence.
+		 * Each register check will be greater than 1us, so
+		 * don't bother using udelay.
+		 */
+
+		for (i = 0; i < timeout; ++i) {
+			if (dmub->hw_funcs.is_gpint_acked(dmub, cmd))
+				break;
+		}
+
+		for (i = 0; i < timeout; ++i) {
+			scratch = dmub->hw_funcs.get_gpint_response(dmub);
+			if (scratch == DMUB_GPINT__STOP_FW_RESPONSE)
+				break;
+		}
+
+		/* Clear the GPINT command manually so we don't reset again. */
+		cmd.all = 0;
+		dmub->hw_funcs.set_gpint(dmub, cmd);
+
+		/* Force reset in case we timed out, DMCUB is likely hung. */
+	}
+
+	REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 1);
+	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
+	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
+	REG_WRITE(DMCUB_INBOX1_RPTR, 0);
+	REG_WRITE(DMCUB_INBOX1_WPTR, 0);
+	REG_WRITE(DMCUB_OUTBOX1_RPTR, 0);
+	REG_WRITE(DMCUB_OUTBOX1_WPTR, 0);
+	REG_WRITE(DMCUB_SCRATCH0, 0);
+}
+
+void dmub_dcn32_reset_release(struct dmub_srv *dmub)
+{
+	REG_WRITE(DMCUB_GPINT_DATAIN1, 0);
+	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 0);
+	REG_WRITE(DMCUB_SCRATCH15, dmub->psp_version & 0x001100FF);
+	REG_UPDATE_2(DMCUB_CNTL, DMCUB_ENABLE, 1, DMCUB_TRACEPORT_EN, 1);
+	REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 0);
+}
+
+void dmub_dcn32_backdoor_load(struct dmub_srv *dmub,
+		const struct dmub_window *cw0,
+		const struct dmub_window *cw1)
+{
+	union dmub_addr offset;
+	uint64_t fb_base, fb_offset;
+
+	dmub_dcn32_get_fb_base_offset(dmub, &fb_base, &fb_offset);
+
+	REG_UPDATE(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 1);
+
+	dmub_dcn32_translate_addr(&cw0->offset, fb_base, fb_offset, &offset);
+
+	REG_WRITE(DMCUB_REGION3_CW0_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW0_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW0_BASE_ADDRESS, cw0->region.base);
+	REG_SET_2(DMCUB_REGION3_CW0_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW0_TOP_ADDRESS, cw0->region.top,
+			DMCUB_REGION3_CW0_ENABLE, 1);
+
+	dmub_dcn32_translate_addr(&cw1->offset, fb_base, fb_offset, &offset);
+
+	REG_WRITE(DMCUB_REGION3_CW1_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW1_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW1_BASE_ADDRESS, cw1->region.base);
+	REG_SET_2(DMCUB_REGION3_CW1_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW1_TOP_ADDRESS, cw1->region.top,
+			DMCUB_REGION3_CW1_ENABLE, 1);
+
+	REG_UPDATE_2(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 0, DMCUB_MEM_UNIT_ID,
+			0x20);
+}
+
+void dmub_dcn32_backdoor_load_zfb_mode(struct dmub_srv *dmub,
+		      const struct dmub_window *cw0,
+		      const struct dmub_window *cw1)
+{
+	union dmub_addr offset;
+
+	REG_UPDATE(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 1);
+
+	offset = cw0->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW0_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW0_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW0_BASE_ADDRESS, cw0->region.base);
+	REG_SET_2(DMCUB_REGION3_CW0_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW0_TOP_ADDRESS, cw0->region.top,
+			DMCUB_REGION3_CW0_ENABLE, 1);
+
+	offset = cw1->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW1_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW1_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW1_BASE_ADDRESS, cw1->region.base);
+	REG_SET_2(DMCUB_REGION3_CW1_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW1_TOP_ADDRESS, cw1->region.top,
+			DMCUB_REGION3_CW1_ENABLE, 1);
+
+	REG_UPDATE_2(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 0, DMCUB_MEM_UNIT_ID,
+			0x20);
+}
+
+void dmub_dcn32_setup_windows(struct dmub_srv *dmub,
+		const struct dmub_window *cw2,
+		const struct dmub_window *cw3,
+		const struct dmub_window *cw4,
+		const struct dmub_window *cw5,
+		const struct dmub_window *cw6)
+{
+	union dmub_addr offset;
+
+	offset = cw3->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW3_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW3_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW3_BASE_ADDRESS, cw3->region.base);
+	REG_SET_2(DMCUB_REGION3_CW3_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW3_TOP_ADDRESS, cw3->region.top,
+			DMCUB_REGION3_CW3_ENABLE, 1);
+
+	offset = cw4->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW4_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW4_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW4_BASE_ADDRESS, cw4->region.base);
+	REG_SET_2(DMCUB_REGION3_CW4_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW4_TOP_ADDRESS, cw4->region.top,
+			DMCUB_REGION3_CW4_ENABLE, 1);
+
+	offset = cw5->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW5_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW5_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW5_BASE_ADDRESS, cw5->region.base);
+	REG_SET_2(DMCUB_REGION3_CW5_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW5_TOP_ADDRESS, cw5->region.top,
+			DMCUB_REGION3_CW5_ENABLE, 1);
+
+	REG_WRITE(DMCUB_REGION5_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION5_OFFSET_HIGH, offset.u.high_part);
+	REG_SET_2(DMCUB_REGION5_TOP_ADDRESS, 0,
+			DMCUB_REGION5_TOP_ADDRESS,
+			cw5->region.top - cw5->region.base - 1,
+			DMCUB_REGION5_ENABLE, 1);
+
+	offset = cw6->offset;
+
+	REG_WRITE(DMCUB_REGION3_CW6_OFFSET, offset.u.low_part);
+	REG_WRITE(DMCUB_REGION3_CW6_OFFSET_HIGH, offset.u.high_part);
+	REG_WRITE(DMCUB_REGION3_CW6_BASE_ADDRESS, cw6->region.base);
+	REG_SET_2(DMCUB_REGION3_CW6_TOP_ADDRESS, 0,
+			DMCUB_REGION3_CW6_TOP_ADDRESS, cw6->region.top,
+			DMCUB_REGION3_CW6_ENABLE, 1);
+}
+
+void dmub_dcn32_setup_mailbox(struct dmub_srv *dmub,
+		const struct dmub_region *inbox1)
+{
+	REG_WRITE(DMCUB_INBOX1_BASE_ADDRESS, inbox1->base);
+	REG_WRITE(DMCUB_INBOX1_SIZE, inbox1->top - inbox1->base);
+}
+
+uint32_t dmub_dcn32_get_inbox1_rptr(struct dmub_srv *dmub)
+{
+	return REG_READ(DMCUB_INBOX1_RPTR);
+}
+
+void dmub_dcn32_set_inbox1_wptr(struct dmub_srv *dmub, uint32_t wptr_offset)
+{
+	REG_WRITE(DMCUB_INBOX1_WPTR, wptr_offset);
+}
+
+void dmub_dcn32_setup_out_mailbox(struct dmub_srv *dmub,
+		const struct dmub_region *outbox1)
+{
+	REG_WRITE(DMCUB_OUTBOX1_BASE_ADDRESS, outbox1->base);
+	REG_WRITE(DMCUB_OUTBOX1_SIZE, outbox1->top - outbox1->base);
+}
+
+uint32_t dmub_dcn32_get_outbox1_wptr(struct dmub_srv *dmub)
+{
+	/**
+	 * outbox1 wptr register is accessed without locks (dal & dc)
+	 * and to be called only by dmub_srv_stat_get_notification()
+	 */
+	return REG_READ(DMCUB_OUTBOX1_WPTR);
+}
+
+void dmub_dcn32_set_outbox1_rptr(struct dmub_srv *dmub, uint32_t rptr_offset)
+{
+	/**
+	 * outbox1 rptr register is accessed without locks (dal & dc)
+	 * and to be called only by dmub_srv_stat_get_notification()
+	 */
+	REG_WRITE(DMCUB_OUTBOX1_RPTR, rptr_offset);
+}
+
+bool dmub_dcn32_is_hw_init(struct dmub_srv *dmub)
+{
+	uint32_t is_hw_init;
+
+	REG_GET(DMCUB_CNTL, DMCUB_ENABLE, &is_hw_init);
+
+	return is_hw_init != 0;
+}
+
+bool dmub_dcn32_is_supported(struct dmub_srv *dmub)
+{
+	uint32_t supported = 0;
+
+	REG_GET(CC_DC_PIPE_DIS, DC_DMCUB_ENABLE, &supported);
+
+	return supported;
+}
+
+void dmub_dcn32_set_gpint(struct dmub_srv *dmub,
+		union dmub_gpint_data_register reg)
+{
+	REG_WRITE(DMCUB_GPINT_DATAIN1, reg.all);
+}
+
+bool dmub_dcn32_is_gpint_acked(struct dmub_srv *dmub,
+		union dmub_gpint_data_register reg)
+{
+	union dmub_gpint_data_register test;
+
+	reg.bits.status = 0;
+	test.all = REG_READ(DMCUB_GPINT_DATAIN1);
+
+	return test.all == reg.all;
+}
+
+uint32_t dmub_dcn32_get_gpint_response(struct dmub_srv *dmub)
+{
+	return REG_READ(DMCUB_SCRATCH7);
+}
+
+uint32_t dmub_dcn32_get_gpint_dataout(struct dmub_srv *dmub)
+{
+	uint32_t dataout = REG_READ(DMCUB_GPINT_DATAOUT);
+
+	REG_UPDATE(DMCUB_INTERRUPT_ENABLE, DMCUB_GPINT_IH_INT_EN, 0);
+
+	REG_WRITE(DMCUB_GPINT_DATAOUT, 0);
+	REG_UPDATE(DMCUB_INTERRUPT_ACK, DMCUB_GPINT_IH_INT_ACK, 1);
+	REG_UPDATE(DMCUB_INTERRUPT_ACK, DMCUB_GPINT_IH_INT_ACK, 0);
+
+	REG_UPDATE(DMCUB_INTERRUPT_ENABLE, DMCUB_GPINT_IH_INT_EN, 1);
+
+	return dataout;
+}
+
+union dmub_fw_boot_status dmub_dcn32_get_fw_boot_status(struct dmub_srv *dmub)
+{
+	union dmub_fw_boot_status status;
+
+	status.all = REG_READ(DMCUB_SCRATCH0);
+	return status;
+}
+
+void dmub_dcn32_enable_dmub_boot_options(struct dmub_srv *dmub, const struct dmub_srv_hw_params *params)
+{
+	union dmub_fw_boot_options boot_options = {0};
+
+	boot_options.bits.z10_disable = params->disable_z10;
+
+	REG_WRITE(DMCUB_SCRATCH14, boot_options.all);
+}
+
+void dmub_dcn32_skip_dmub_panel_power_sequence(struct dmub_srv *dmub, bool skip)
+{
+	union dmub_fw_boot_options boot_options;
+	boot_options.all = REG_READ(DMCUB_SCRATCH14);
+	boot_options.bits.skip_phy_init_panel_sequence = skip;
+	REG_WRITE(DMCUB_SCRATCH14, boot_options.all);
+}
+
+void dmub_dcn32_setup_outbox0(struct dmub_srv *dmub,
+		const struct dmub_region *outbox0)
+{
+	REG_WRITE(DMCUB_OUTBOX0_BASE_ADDRESS, outbox0->base);
+
+	REG_WRITE(DMCUB_OUTBOX0_SIZE, outbox0->top - outbox0->base);
+}
+
+uint32_t dmub_dcn32_get_outbox0_wptr(struct dmub_srv *dmub)
+{
+	return REG_READ(DMCUB_OUTBOX0_WPTR);
+}
+
+void dmub_dcn32_set_outbox0_rptr(struct dmub_srv *dmub, uint32_t rptr_offset)
+{
+	REG_WRITE(DMCUB_OUTBOX0_RPTR, rptr_offset);
+}
+
+uint32_t dmub_dcn32_get_current_time(struct dmub_srv *dmub)
+{
+	return REG_READ(DMCUB_TIMER_CURRENT);
+}
+
+void dmub_dcn32_get_diagnostic_data(struct dmub_srv *dmub, struct dmub_diagnostic_data *diag_data)
+{
+	uint32_t is_dmub_enabled, is_soft_reset, is_sec_reset;
+	uint32_t is_traceport_enabled, is_cw0_enabled, is_cw6_enabled;
+
+	if (!dmub || !diag_data)
+		return;
+
+	memset(diag_data, 0, sizeof(*diag_data));
+
+	diag_data->dmcub_version = dmub->fw_version;
+
+	diag_data->scratch[0] = REG_READ(DMCUB_SCRATCH0);
+	diag_data->scratch[1] = REG_READ(DMCUB_SCRATCH1);
+	diag_data->scratch[2] = REG_READ(DMCUB_SCRATCH2);
+	diag_data->scratch[3] = REG_READ(DMCUB_SCRATCH3);
+	diag_data->scratch[4] = REG_READ(DMCUB_SCRATCH4);
+	diag_data->scratch[5] = REG_READ(DMCUB_SCRATCH5);
+	diag_data->scratch[6] = REG_READ(DMCUB_SCRATCH6);
+	diag_data->scratch[7] = REG_READ(DMCUB_SCRATCH7);
+	diag_data->scratch[8] = REG_READ(DMCUB_SCRATCH8);
+	diag_data->scratch[9] = REG_READ(DMCUB_SCRATCH9);
+	diag_data->scratch[10] = REG_READ(DMCUB_SCRATCH10);
+	diag_data->scratch[11] = REG_READ(DMCUB_SCRATCH11);
+	diag_data->scratch[12] = REG_READ(DMCUB_SCRATCH12);
+	diag_data->scratch[13] = REG_READ(DMCUB_SCRATCH13);
+	diag_data->scratch[14] = REG_READ(DMCUB_SCRATCH14);
+	diag_data->scratch[15] = REG_READ(DMCUB_SCRATCH15);
+
+	diag_data->undefined_address_fault_addr = REG_READ(DMCUB_UNDEFINED_ADDRESS_FAULT_ADDR);
+	diag_data->inst_fetch_fault_addr = REG_READ(DMCUB_INST_FETCH_FAULT_ADDR);
+	diag_data->data_write_fault_addr = REG_READ(DMCUB_DATA_WRITE_FAULT_ADDR);
+
+	diag_data->inbox1_rptr = REG_READ(DMCUB_INBOX1_RPTR);
+	diag_data->inbox1_wptr = REG_READ(DMCUB_INBOX1_WPTR);
+	diag_data->inbox1_size = REG_READ(DMCUB_INBOX1_SIZE);
+
+	diag_data->inbox0_rptr = REG_READ(DMCUB_INBOX0_RPTR);
+	diag_data->inbox0_wptr = REG_READ(DMCUB_INBOX0_WPTR);
+	diag_data->inbox0_size = REG_READ(DMCUB_INBOX0_SIZE);
+
+	REG_GET(DMCUB_CNTL, DMCUB_ENABLE, &is_dmub_enabled);
+	diag_data->is_dmcub_enabled = is_dmub_enabled;
+
+	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &is_soft_reset);
+	diag_data->is_dmcub_soft_reset = is_soft_reset;
+
+	REG_GET(DMCUB_SEC_CNTL, DMCUB_SEC_RESET_STATUS, &is_sec_reset);
+	diag_data->is_dmcub_secure_reset = is_sec_reset;
+
+	REG_GET(DMCUB_CNTL, DMCUB_TRACEPORT_EN, &is_traceport_enabled);
+	diag_data->is_traceport_en  = is_traceport_enabled;
+
+	REG_GET(DMCUB_REGION3_CW0_TOP_ADDRESS, DMCUB_REGION3_CW0_ENABLE, &is_cw0_enabled);
+	diag_data->is_cw0_enabled = is_cw0_enabled;
+
+	REG_GET(DMCUB_REGION3_CW6_TOP_ADDRESS, DMCUB_REGION3_CW6_ENABLE, &is_cw6_enabled);
+	diag_data->is_cw6_enabled = is_cw6_enabled;
+}
+void dmub_dcn32_configure_dmub_in_system_memory(struct dmub_srv *dmub)
+{
+	/* DMCUB_REGION3_TMR_AXI_SPACE values:
+	 * 0b011 (0x3) - FB physical address
+	 * 0b100 (0x4) - GPU virtual address
+	 *
+	 * Default value is 0x3 (FB Physical address for TMR). When programming
+	 * DMUB to be in system memory, change to 0x4. The system memory allocated
+	 * is accessible by both GPU and CPU, so we use GPU virtual address.
+	 */
+	REG_WRITE(DMCUB_REGION3_TMR_AXI_SPACE, 0x4);
+}
+
+void dmub_dcn32_send_inbox0_cmd(struct dmub_srv *dmub, union dmub_inbox0_data_register data)
+{
+	REG_WRITE(DMCUB_INBOX0_WPTR, data.inbox0_cmd_common.all);
+}
+
+void dmub_dcn32_clear_inbox0_ack_register(struct dmub_srv *dmub)
+{
+	REG_WRITE(DMCUB_SCRATCH17, 0);
+}
+
+uint32_t dmub_dcn32_read_inbox0_ack_register(struct dmub_srv *dmub)
+{
+	return REG_READ(DMCUB_SCRATCH17);
+}
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h
new file mode 100644
index 000000000000..7d1a6eb4d665
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h
@@ -0,0 +1,256 @@
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
+#ifndef _DMUB_DCN32_H_
+#define _DMUB_DCN32_H_
+
+#include "dmub_dcn31.h"
+
+struct dmub_srv;
+
+/* DCN32 register definitions. */
+
+#define DMUB_DCN32_REGS() \
+	DMUB_SR(DMCUB_CNTL) \
+	DMUB_SR(DMCUB_CNTL2) \
+	DMUB_SR(DMCUB_SEC_CNTL) \
+	DMUB_SR(DMCUB_INBOX0_SIZE) \
+	DMUB_SR(DMCUB_INBOX0_RPTR) \
+	DMUB_SR(DMCUB_INBOX0_WPTR) \
+	DMUB_SR(DMCUB_INBOX1_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_INBOX1_SIZE) \
+	DMUB_SR(DMCUB_INBOX1_RPTR) \
+	DMUB_SR(DMCUB_INBOX1_WPTR) \
+	DMUB_SR(DMCUB_OUTBOX0_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_OUTBOX0_SIZE) \
+	DMUB_SR(DMCUB_OUTBOX0_RPTR) \
+	DMUB_SR(DMCUB_OUTBOX0_WPTR) \
+	DMUB_SR(DMCUB_OUTBOX1_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_OUTBOX1_SIZE) \
+	DMUB_SR(DMCUB_OUTBOX1_RPTR) \
+	DMUB_SR(DMCUB_OUTBOX1_WPTR) \
+	DMUB_SR(DMCUB_REGION3_CW0_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW1_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW2_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW3_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW4_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW5_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW6_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW7_OFFSET) \
+	DMUB_SR(DMCUB_REGION3_CW0_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW1_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW2_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW3_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW4_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW5_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW6_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW7_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION3_CW0_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW1_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW2_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW3_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW4_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW5_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW6_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW7_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW0_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW1_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW2_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW3_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW4_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW5_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW6_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION3_CW7_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION4_OFFSET) \
+	DMUB_SR(DMCUB_REGION4_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION4_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_REGION5_OFFSET) \
+	DMUB_SR(DMCUB_REGION5_OFFSET_HIGH) \
+	DMUB_SR(DMCUB_REGION5_TOP_ADDRESS) \
+	DMUB_SR(DMCUB_SCRATCH0) \
+	DMUB_SR(DMCUB_SCRATCH1) \
+	DMUB_SR(DMCUB_SCRATCH2) \
+	DMUB_SR(DMCUB_SCRATCH3) \
+	DMUB_SR(DMCUB_SCRATCH4) \
+	DMUB_SR(DMCUB_SCRATCH5) \
+	DMUB_SR(DMCUB_SCRATCH6) \
+	DMUB_SR(DMCUB_SCRATCH7) \
+	DMUB_SR(DMCUB_SCRATCH8) \
+	DMUB_SR(DMCUB_SCRATCH9) \
+	DMUB_SR(DMCUB_SCRATCH10) \
+	DMUB_SR(DMCUB_SCRATCH11) \
+	DMUB_SR(DMCUB_SCRATCH12) \
+	DMUB_SR(DMCUB_SCRATCH13) \
+	DMUB_SR(DMCUB_SCRATCH14) \
+	DMUB_SR(DMCUB_SCRATCH15) \
+	DMUB_SR(DMCUB_SCRATCH16) \
+	DMUB_SR(DMCUB_SCRATCH17) \
+	DMUB_SR(DMCUB_GPINT_DATAIN1) \
+	DMUB_SR(DMCUB_GPINT_DATAOUT) \
+	DMUB_SR(CC_DC_PIPE_DIS) \
+	DMUB_SR(MMHUBBUB_SOFT_RESET) \
+	DMUB_SR(DCN_VM_FB_LOCATION_BASE) \
+	DMUB_SR(DCN_VM_FB_OFFSET) \
+	DMUB_SR(DMCUB_TIMER_CURRENT) \
+	DMUB_SR(DMCUB_INST_FETCH_FAULT_ADDR) \
+	DMUB_SR(DMCUB_UNDEFINED_ADDRESS_FAULT_ADDR) \
+	DMUB_SR(DMCUB_DATA_WRITE_FAULT_ADDR) \
+	DMUB_SR(DMCUB_REGION3_TMR_AXI_SPACE) \
+	DMUB_SR(DMCUB_INTERRUPT_ENABLE) \
+	DMUB_SR(DMCUB_INTERRUPT_ACK)
+
+#define DMUB_DCN32_FIELDS() \
+	DMUB_SF(DMCUB_CNTL, DMCUB_ENABLE) \
+	DMUB_SF(DMCUB_CNTL, DMCUB_TRACEPORT_EN) \
+	DMUB_SF(DMCUB_CNTL2, DMCUB_SOFT_RESET) \
+	DMUB_SF(DMCUB_SEC_CNTL, DMCUB_SEC_RESET) \
+	DMUB_SF(DMCUB_SEC_CNTL, DMCUB_MEM_UNIT_ID) \
+	DMUB_SF(DMCUB_SEC_CNTL, DMCUB_SEC_RESET_STATUS) \
+	DMUB_SF(DMCUB_REGION3_CW0_TOP_ADDRESS, DMCUB_REGION3_CW0_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW0_TOP_ADDRESS, DMCUB_REGION3_CW0_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW1_TOP_ADDRESS, DMCUB_REGION3_CW1_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW1_TOP_ADDRESS, DMCUB_REGION3_CW1_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW2_TOP_ADDRESS, DMCUB_REGION3_CW2_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW2_TOP_ADDRESS, DMCUB_REGION3_CW2_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW3_TOP_ADDRESS, DMCUB_REGION3_CW3_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW3_TOP_ADDRESS, DMCUB_REGION3_CW3_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW4_TOP_ADDRESS, DMCUB_REGION3_CW4_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW4_TOP_ADDRESS, DMCUB_REGION3_CW4_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW5_TOP_ADDRESS, DMCUB_REGION3_CW5_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW5_TOP_ADDRESS, DMCUB_REGION3_CW5_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW6_TOP_ADDRESS, DMCUB_REGION3_CW6_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW6_TOP_ADDRESS, DMCUB_REGION3_CW6_ENABLE) \
+	DMUB_SF(DMCUB_REGION3_CW7_TOP_ADDRESS, DMCUB_REGION3_CW7_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION3_CW7_TOP_ADDRESS, DMCUB_REGION3_CW7_ENABLE) \
+	DMUB_SF(DMCUB_REGION4_TOP_ADDRESS, DMCUB_REGION4_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION4_TOP_ADDRESS, DMCUB_REGION4_ENABLE) \
+	DMUB_SF(DMCUB_REGION5_TOP_ADDRESS, DMCUB_REGION5_TOP_ADDRESS) \
+	DMUB_SF(DMCUB_REGION5_TOP_ADDRESS, DMCUB_REGION5_ENABLE) \
+	DMUB_SF(CC_DC_PIPE_DIS, DC_DMCUB_ENABLE) \
+	DMUB_SF(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET) \
+	DMUB_SF(DCN_VM_FB_LOCATION_BASE, FB_BASE) \
+	DMUB_SF(DCN_VM_FB_OFFSET, FB_OFFSET) \
+	DMUB_SF(DMCUB_INBOX0_WPTR, DMCUB_INBOX0_WPTR) \
+	DMUB_SF(DMCUB_REGION3_TMR_AXI_SPACE, DMCUB_REGION3_TMR_AXI_SPACE) \
+	DMUB_SF(DMCUB_INTERRUPT_ENABLE, DMCUB_GPINT_IH_INT_EN) \
+	DMUB_SF(DMCUB_INTERRUPT_ACK, DMCUB_GPINT_IH_INT_ACK)
+
+struct dmub_srv_dcn32_reg_offset {
+#define DMUB_SR(reg) uint32_t reg;
+	DMUB_DCN32_REGS()
+	DMCUB_INTERNAL_REGS()
+#undef DMUB_SR
+};
+
+struct dmub_srv_dcn32_reg_shift {
+#define DMUB_SF(reg, field) uint8_t reg##__##field;
+	DMUB_DCN32_FIELDS()
+#undef DMUB_SF
+};
+
+struct dmub_srv_dcn32_reg_mask {
+#define DMUB_SF(reg, field) uint32_t reg##__##field;
+	DMUB_DCN32_FIELDS()
+#undef DMUB_SF
+};
+
+struct dmub_srv_dcn32_regs {
+	const struct dmub_srv_dcn32_reg_offset offset;
+	const struct dmub_srv_dcn32_reg_mask mask;
+	const struct dmub_srv_dcn32_reg_shift shift;
+};
+
+extern const struct dmub_srv_dcn32_regs dmub_srv_dcn32_regs;
+
+void dmub_dcn32_reset(struct dmub_srv *dmub);
+
+void dmub_dcn32_reset_release(struct dmub_srv *dmub);
+
+void dmub_dcn32_backdoor_load(struct dmub_srv *dmub,
+			      const struct dmub_window *cw0,
+			      const struct dmub_window *cw1);
+
+void dmub_dcn32_backdoor_load_zfb_mode(struct dmub_srv *dmub,
+		      const struct dmub_window *cw0,
+		      const struct dmub_window *cw1);
+
+void dmub_dcn32_setup_windows(struct dmub_srv *dmub,
+			      const struct dmub_window *cw2,
+			      const struct dmub_window *cw3,
+			      const struct dmub_window *cw4,
+			      const struct dmub_window *cw5,
+			      const struct dmub_window *cw6);
+
+void dmub_dcn32_setup_mailbox(struct dmub_srv *dmub,
+			      const struct dmub_region *inbox1);
+
+uint32_t dmub_dcn32_get_inbox1_rptr(struct dmub_srv *dmub);
+
+void dmub_dcn32_set_inbox1_wptr(struct dmub_srv *dmub, uint32_t wptr_offset);
+
+void dmub_dcn32_setup_out_mailbox(struct dmub_srv *dmub,
+			      const struct dmub_region *outbox1);
+
+uint32_t dmub_dcn32_get_outbox1_wptr(struct dmub_srv *dmub);
+
+void dmub_dcn32_set_outbox1_rptr(struct dmub_srv *dmub, uint32_t rptr_offset);
+
+bool dmub_dcn32_is_hw_init(struct dmub_srv *dmub);
+
+bool dmub_dcn32_is_supported(struct dmub_srv *dmub);
+
+void dmub_dcn32_set_gpint(struct dmub_srv *dmub,
+			  union dmub_gpint_data_register reg);
+
+bool dmub_dcn32_is_gpint_acked(struct dmub_srv *dmub,
+			       union dmub_gpint_data_register reg);
+
+uint32_t dmub_dcn32_get_gpint_response(struct dmub_srv *dmub);
+
+uint32_t dmub_dcn32_get_gpint_dataout(struct dmub_srv *dmub);
+
+void dmub_dcn32_enable_dmub_boot_options(struct dmub_srv *dmub, const struct dmub_srv_hw_params *params);
+
+void dmub_dcn32_skip_dmub_panel_power_sequence(struct dmub_srv *dmub, bool skip);
+
+union dmub_fw_boot_status dmub_dcn32_get_fw_boot_status(struct dmub_srv *dmub);
+
+void dmub_dcn32_setup_outbox0(struct dmub_srv *dmub,
+			      const struct dmub_region *outbox0);
+
+uint32_t dmub_dcn32_get_outbox0_wptr(struct dmub_srv *dmub);
+
+void dmub_dcn32_set_outbox0_rptr(struct dmub_srv *dmub, uint32_t rptr_offset);
+
+uint32_t dmub_dcn32_get_current_time(struct dmub_srv *dmub);
+
+void dmub_dcn32_get_diagnostic_data(struct dmub_srv *dmub, struct dmub_diagnostic_data *diag_data);
+
+void dmub_dcn32_configure_dmub_in_system_memory(struct dmub_srv *dmub);
+void dmub_dcn32_send_inbox0_cmd(struct dmub_srv *dmub, union dmub_inbox0_data_register data);
+void dmub_dcn32_clear_inbox0_ack_register(struct dmub_srv *dmub);
+uint32_t dmub_dcn32_read_inbox0_ack_register(struct dmub_srv *dmub);
+
+#endif /* _DMUB_DCN32_H_ */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 66db5e538c7f..4c6a624f04a7 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -34,6 +34,7 @@
 #include "dmub_dcn31.h"
 #include "dmub_dcn315.h"
 #include "dmub_dcn316.h"
+#include "dmub_dcn32.h"
 #include "os_types.h"
 /*
  * Note: the DMUB service is standalone. No additional headers should be
@@ -260,6 +261,43 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 
 		break;
 
+	case DMUB_ASIC_DCN32:
+	case DMUB_ASIC_DCN321:
+		dmub->regs_dcn32 = &dmub_srv_dcn32_regs;
+		funcs->configure_dmub_in_system_memory = dmub_dcn32_configure_dmub_in_system_memory;
+		funcs->send_inbox0_cmd = dmub_dcn32_send_inbox0_cmd;
+		funcs->clear_inbox0_ack_register = dmub_dcn32_clear_inbox0_ack_register;
+		funcs->read_inbox0_ack_register = dmub_dcn32_read_inbox0_ack_register;
+		funcs->reset = dmub_dcn32_reset;
+		funcs->reset_release = dmub_dcn32_reset_release;
+		funcs->backdoor_load = dmub_dcn32_backdoor_load;
+		funcs->backdoor_load_zfb_mode = dmub_dcn32_backdoor_load_zfb_mode;
+		funcs->setup_windows = dmub_dcn32_setup_windows;
+		funcs->setup_mailbox = dmub_dcn32_setup_mailbox;
+		funcs->get_inbox1_rptr = dmub_dcn32_get_inbox1_rptr;
+		funcs->set_inbox1_wptr = dmub_dcn32_set_inbox1_wptr;
+		funcs->setup_out_mailbox = dmub_dcn32_setup_out_mailbox;
+		funcs->get_outbox1_wptr = dmub_dcn32_get_outbox1_wptr;
+		funcs->set_outbox1_rptr = dmub_dcn32_set_outbox1_rptr;
+		funcs->is_supported = dmub_dcn32_is_supported;
+		funcs->is_hw_init = dmub_dcn32_is_hw_init;
+		funcs->set_gpint = dmub_dcn32_set_gpint;
+		funcs->is_gpint_acked = dmub_dcn32_is_gpint_acked;
+		funcs->get_gpint_response = dmub_dcn32_get_gpint_response;
+		funcs->get_gpint_dataout = dmub_dcn32_get_gpint_dataout;
+		funcs->get_fw_status = dmub_dcn32_get_fw_boot_status;
+		funcs->enable_dmub_boot_options = dmub_dcn32_enable_dmub_boot_options;
+		funcs->skip_dmub_panel_power_sequence = dmub_dcn32_skip_dmub_panel_power_sequence;
+
+		/* outbox0 call stacks */
+		funcs->setup_outbox0 = dmub_dcn32_setup_outbox0;
+		funcs->get_outbox0_wptr = dmub_dcn32_get_outbox0_wptr;
+		funcs->set_outbox0_rptr = dmub_dcn32_set_outbox0_rptr;
+		funcs->get_current_time = dmub_dcn32_get_current_time;
+		funcs->get_diagnostic_data = dmub_dcn32_get_diagnostic_data;
+
+		break;
+
 	default:
 		return false;
 	}
@@ -501,6 +539,9 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 	cw1.region.base = DMUB_CW1_BASE;
 	cw1.region.top = cw1.region.base + stack_fb->size - 1;
 
+	if (params->fw_in_system_memory && dmub->hw_funcs.configure_dmub_in_system_memory)
+		dmub->hw_funcs.configure_dmub_in_system_memory(dmub);
+
 	if (params->load_inst_const && dmub->hw_funcs.backdoor_load) {
 		/**
 		 * Read back all the instruction memory so we don't hang the
@@ -508,7 +549,11 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 		 * flushed yet. This only occurs in backdoor loading.
 		 */
 		dmub_flush_buffer_mem(inst_fb);
-		dmub->hw_funcs.backdoor_load(dmub, &cw0, &cw1);
+
+		if (params->fw_in_system_memory && dmub->hw_funcs.backdoor_load_zfb_mode)
+			dmub->hw_funcs.backdoor_load_zfb_mode(dmub, &cw0, &cw1);
+		else
+			dmub->hw_funcs.backdoor_load(dmub, &cw0, &cw1);
 	}
 
 	cw2.offset.quad_part = data_fb->gpu_addr;
@@ -583,6 +628,10 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 	if (dmub->hw_funcs.enable_dmub_boot_options)
 		dmub->hw_funcs.enable_dmub_boot_options(dmub, params);
 
+	if (dmub->hw_funcs.skip_dmub_panel_power_sequence)
+		dmub->hw_funcs.skip_dmub_panel_power_sequence(dmub,
+			params->skip_panel_power_sequence);
+
 	if (dmub->hw_funcs.reset_release)
 		dmub->hw_funcs.reset_release(dmub);
 
-- 
2.35.3

