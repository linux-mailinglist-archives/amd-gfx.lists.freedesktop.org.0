Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A16646BF
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Jan 2023 17:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5910E60F;
	Tue, 10 Jan 2023 16:57:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CEF10E609
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Jan 2023 16:57:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ji1wliB6su5OaysbOCVAbs+CnYXxjkYBIihFB3xyIir/stWLS7WpmI3f7mmsd1dJ+ZFDRS4I/HBelzNYyPMLqPx0RYAsbMxTBTkY0KXHPqDYc10flOM7IIvF3MWG1HkkrWkv+BPfTIXGpO/aSfWrvJSoLqBAbni0WMdPGL4ZHD2i/CWVMPu4j2tOD0mqzryPnXzTr4jNAaObl0J8JFWOfE1t4U8Ho6koXDLbdCUG7B27AU3wnBcu6h0jmq0bREtTlev9jv3AM4qSFDWDc5RGQGoDo9kNVSKwTzELalS8KICdVIrdnDgijZ8nxtF3zmT4ceazjFBzLySDmKcvzV0CEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0WWOPCuk9UGRpEDck/KiV5HzyqdC1T7PCqqMV/plQ4=;
 b=cer5cR8eVgPP4tzEUq5Yg+yi/fE9I1NyWvaEAy4V5aPVUn74Rkbqjvboj/KXDWnsbKZCgEblZ7vaHtNdL16RHHw0dIYKTPgAePIRNLHg1IlupUeOEU1E3ighPmm5TgmQJCzaTWFF/AhXiA9LSEh+vYFzq9Upec1xYKtf1U1aUwelCztHMRqodpW6Wws00qzsF4iaK9J9WdDpomMS2MRkdIkJJr04kBmkqfVFi/t+1f1Xt8v8bDgWN5cz4OBb3huEe0QOLKALgVdOBTPcMzBZJa89YOXh45eb3pMqIirnlNKkSjfzO4Q4KIFZyxzZH966pQuxrST3OEkfhBMpdjSZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0WWOPCuk9UGRpEDck/KiV5HzyqdC1T7PCqqMV/plQ4=;
 b=zOEOnJ8DssNzhpOZVFKQzAl3ueE+vlMZN/UIc4d1PKvUWrYsy/5HeTc0sDeVEDjqLZoDhwH/DkmznHtKKfs/I13OrJ95POOM9SFjvqGGZ6REcjGT+ppSaxb1CpHoDPZ3jiJ3Z6kyw7PzqUpPURSyjkB3ESGSGC2Sjb1EmaJzAHs=
Received: from MW4PR04CA0181.namprd04.prod.outlook.com (2603:10b6:303:86::6)
 by DS0PR12MB7875.namprd12.prod.outlook.com (2603:10b6:8:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:57:08 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::60) by MW4PR04CA0181.outlook.office365.com
 (2603:10b6:303:86::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 16:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 16:57:07 +0000
Received: from atma-again.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 10 Jan
 2023 10:56:49 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/37] drm/amd/display: refactor ddc logic from dc_link_ddc to
 link_ddc
Date: Tue, 10 Jan 2023 11:55:05 -0500
Message-ID: <20230110165535.3358492-8-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110165535.3358492-1-Rodrigo.Siqueira@amd.com>
References: <20230110165535.3358492-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|DS0PR12MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7ede18-d4d7-463e-d975-08daf32bb587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /C7vDGXG64yneOnBKjF6aT7jrIH9GVZgAXHaUSFQxOtCp/P5qIWNf6a7BV5M0KE1QdGkDRRDwZjVfJqi8SJRid+4AoyoyqK27mrcRDOZR2Qv6hyLs/3v/gaD3LWETysbGvzsYyEC6MkcK/7s3xrIgWfXroyA1S4m8+liokcVaky2e17ygx3G8OkAG3JLzEOHTCWUyAQgLijMvW5M4XxhIabrSAMKVSD0D/DXQp4I/aXBgpLPpsGd5MDqEDURVNTN0u2pFeNHE0v+H4KM3X8fzMp5eGxnkM+/85VoiyGMDf3J1bH7GET0a8XpmnhbDnuMRbsilGuRpkBvcwAVX6jq/jdLTmOm3HFwOghaMus2iZe69YQOtRh2kifEm0/MxHgn8utkB263Dcce7ZuUl7o++6ec1nAQHZ27KVz6rDVI33sMHE8vfRVa/O7J+0NxOmf0I02DeHeLRQGHxMST3+VvQ0NGBzPczfWhWFW6Onm8N1Kon+ZLbMWkLhESKOkiu9mUxwJ87BuMMFeN+h6P0uYwhyf2YjtvKQSXdO2dPTwtG+GNSYxAbVoXmbIa/CaJ5xlJiyzn0CA5EpnwVVKmMGV8IkiyXyFRYsH1ZOd42FlkWH/M1xtATP72mGxnA6uf0cp7+hp+oxgdyqjz95qRvbAFWABZqgmupsRjmRIxWgmERyTV9ZBRoFyqYELvsso9s3DWmB3gAKz+QIAJ+VK9ob3JQFtzqeHE5JJ40/CDT9cjScg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(6916009)(8676002)(70586007)(7696005)(316002)(70206006)(4326008)(54906003)(30864003)(356005)(5660300002)(2906002)(40460700003)(8936002)(47076005)(81166007)(426003)(41300700001)(36756003)(36860700001)(83380400001)(6666004)(478600001)(40480700001)(2616005)(1076003)(336012)(82740400003)(26005)(16526019)(86362001)(186003)(66899015)(82310400005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:57:07.9662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7ede18-d4d7-463e-d975-08daf32bb587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875
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
 Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com, jerry.zuo@amd.com,
 Aurabindo.Pillai@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
1. Move dd_link_ddc functions to link_ddc.
2. Move link ddc functions declaration exposed in dc to link.h
3. Move link ddc functions declaration exposed in dm to dc_link.h
4. Remove i2caux_interface.h file

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 -
 drivers/gpu/drm/amd/display/dc/Makefile       |   4 +-
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |   1 -
 .../drm/amd/display/dc/bios/bios_parser2.c    |   1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 200 ++++++++-
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h |  28 ++
 .../gpu/drm/amd/display/dc/dc_hdmi_types.h    | 114 +++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |  10 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h  |   2 +-
 .../drm/amd/display/dc/dce/dce_link_encoder.c |   1 -
 .../amd/display/dc/dcn10/dcn10_link_encoder.c |   1 -
 .../amd/display/dc/dcn20/dcn20_link_encoder.c |   1 -
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |   6 +-
 .../display/dc/dcn201/dcn201_link_encoder.c   |   1 -
 .../amd/display/dc/dcn21/dcn21_link_encoder.c |   1 -
 .../display/dc/dcn30/dcn30_dio_link_encoder.c |   1 -
 .../drm/amd/display/dc/dcn30/dcn30_resource.c |   6 +-
 .../dc/dcn301/dcn301_dio_link_encoder.c       |   1 -
 .../amd/display/dc/dcn302/dcn302_resource.c   |  16 +
 .../amd/display/dc/dcn303/dcn303_resource.c   |   6 +-
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |   1 -
 .../display/dc/dcn32/dcn32_dio_link_encoder.c |   1 -
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |   6 +-
 .../dc/dcn321/dcn321_dio_link_encoder.c       |   1 -
 .../amd/display/dc/dcn321/dcn321_resource.c   |   6 +-
 .../gpu/drm/amd/display/dc/hdcp/hdcp_msg.c    |   3 +-
 .../gpu/drm/amd/display/dc/inc/dc_link_ddc.h  | 133 ------
 .../drm/amd/display/dc/inc/hw/aux_engine.h    |   8 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h     |  37 ++
 drivers/gpu/drm/amd/display/dc/link/Makefile  |   2 +-
 .../{core/dc_link_ddc.c => link/link_ddc.c}   | 409 +++---------------
 .../i2caux_interface.h => dc/link/link_ddc.h} |  69 +--
 36 files changed, 512 insertions(+), 584 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_ddc.c => link/link_ddc.c} (57%)
 rename drivers/gpu/drm/amd/display/{include/i2caux_interface.h => dc/link/link_ddc.h} (52%)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b4d60eedbcbf..28f03c558af1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -66,7 +66,6 @@
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
-#include "i2caux_interface.h"
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 41f35d75d0a8..bbeeee7c5d7c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -39,12 +39,10 @@
 #include "dc.h"
 #include "dm_helpers.h"
 
-#include "dc_link_ddc.h"
 #include "dc_link_dp.h"
 #include "ddc_service_types.h"
 #include "dpcd_defs.h"
 
-#include "i2caux_interface.h"
 #include "dmub_cmd.h"
 #if defined(CONFIG_DEBUG_FS)
 #include "amdgpu_dm_debugfs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index b9effadfc4bb..4438f3c16636 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -64,8 +64,8 @@ AMD_DC = $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/dc/,$(DC_LI
 
 include $(AMD_DC)
 
-DISPLAY_CORE = dc.o  dc_stat.o dc_link.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
-dc_surface.o dc_link_dp.o dc_link_ddc.o dc_debug.o dc_stream.o \
+DISPLAY_CORE = dc.o dc_stat.o dc_link.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
+dc_surface.o dc_link_dp.o dc_debug.o dc_stream.o \
 dc_link_enc_cfg.o dc_link_dpia.o dc_link_dpcd.o
 
 DISPLAY_CORE += dc_vm_helper.o
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index a1a00f432168..27af9d3c2b73 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -33,7 +33,6 @@
 #include "include/gpio_service_interface.h"
 #include "include/grph_object_ctrl_defs.h"
 #include "include/bios_parser_interface.h"
-#include "include/i2caux_interface.h"
 #include "include/logger_interface.h"
 
 #include "command_table.h"
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 074e70a5c458..8ca50c088858 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -32,7 +32,6 @@
 #include "dc_bios_types.h"
 #include "include/grph_object_ctrl_defs.h"
 #include "include/bios_parser_interface.h"
-#include "include/i2caux_interface.h"
 #include "include/logger_interface.h"
 
 #include "command_table2.h"
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 2c18c8527079..e4b0a47c283b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -33,6 +33,7 @@
 
 #include "resource.h"
 
+#include "gpio_service_interface.h"
 #include "clk_mgr.h"
 #include "clock_source.h"
 #include "dc_bios_types.h"
@@ -53,7 +54,7 @@
 #include "link_enc_cfg.h"
 
 #include "dc_link.h"
-#include "dc_link_ddc.h"
+#include "link.h"
 #include "dm_helpers.h"
 #include "mem_input.h"
 
@@ -68,8 +69,6 @@
 
 #include "dmub/dmub_srv.h"
 
-#include "i2caux_interface.h"
-
 #include "dce/dmub_psr.h"
 
 #include "dce/dmub_hw_lock_mgr.h"
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 13e33f581e73..b5572f5202ca 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -34,7 +34,7 @@
 #include "core_status.h"
 #include "dc_link_dp.h"
 #include "dc_link_dpia.h"
-#include "dc_link_ddc.h"
+#include "link/link_ddc.h"
 #include "link_hwss.h"
 #include "link.h"
 #include "opp.h"
@@ -80,7 +80,7 @@ static void dc_link_destruct(struct dc_link *link)
 	}
 
 	if (link->ddc)
-		dal_ddc_service_destroy(&link->ddc);
+		link_destroy_ddc_service(&link->ddc);
 
 	if (link->panel_cntl)
 		link->panel_cntl->funcs->destroy(&link->panel_cntl);
@@ -277,7 +277,7 @@ bool dc_link_is_dp_sink_present(struct dc_link *link)
 		(connector_id == CONNECTOR_ID_EDP) ||
 		(connector_id == CONNECTOR_ID_USBC));
 
-	ddc = dal_ddc_service_get_ddc_pin(link->ddc);
+	ddc = get_ddc_pin(link->ddc);
 
 	if (!ddc) {
 		BREAK_TO_DEBUGGER();
@@ -422,11 +422,179 @@ static enum signal_type decide_signal_from_strap_and_dongle_type(enum display_do
 	return signal;
 }
 
+static bool i2c_read(
+	struct ddc_service *ddc,
+	uint32_t address,
+	uint8_t *buffer,
+	uint32_t len)
+{
+	uint8_t offs_data = 0;
+	struct i2c_payload payloads[2] = {
+		{
+		.write = true,
+		.address = address,
+		.length = 1,
+		.data = &offs_data },
+		{
+		.write = false,
+		.address = address,
+		.length = len,
+		.data = buffer } };
+
+	struct i2c_command command = {
+		.payloads = payloads,
+		.number_of_payloads = 2,
+		.engine = DDC_I2C_COMMAND_ENGINE,
+		.speed = ddc->ctx->dc->caps.i2c_speed_in_khz };
+
+	return dm_helpers_submit_i2c(
+			ddc->ctx,
+			ddc->link,
+			&command);
+}
+
+enum {
+	DP_SINK_CAP_SIZE =
+		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV + 1
+};
+
+static void query_dp_dual_mode_adaptor(
+	struct ddc_service *ddc,
+	struct display_sink_capability *sink_cap)
+{
+	uint8_t i;
+	bool is_valid_hdmi_signature;
+	enum display_dongle_type *dongle = &sink_cap->dongle_type;
+	uint8_t type2_dongle_buf[DP_ADAPTOR_TYPE2_SIZE];
+	bool is_type2_dongle = false;
+	int retry_count = 2;
+	struct dp_hdmi_dongle_signature_data *dongle_signature;
+
+	/* Assume we have no valid DP passive dongle connected */
+	*dongle = DISPLAY_DONGLE_NONE;
+	sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK;
+
+	/* Read DP-HDMI dongle I2c (no response interpreted as DP-DVI dongle)*/
+	if (!i2c_read(
+		ddc,
+		DP_HDMI_DONGLE_ADDRESS,
+		type2_dongle_buf,
+		sizeof(type2_dongle_buf))) {
+		/* Passive HDMI dongles can sometimes fail here without retrying*/
+		while (retry_count > 0) {
+			if (i2c_read(ddc,
+				DP_HDMI_DONGLE_ADDRESS,
+				type2_dongle_buf,
+				sizeof(type2_dongle_buf)))
+				break;
+			retry_count--;
+		}
+		if (retry_count == 0) {
+			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
+			sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_DVI_MAX_TMDS_CLK;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf, sizeof(type2_dongle_buf),
+					"DP-DVI passive dongle %dMhz: ",
+					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
+			return;
+		}
+	}
+
+	/* Check if Type 2 dongle.*/
+	if (type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_ID] == DP_ADAPTOR_TYPE2_ID)
+		is_type2_dongle = true;
+
+	dongle_signature =
+		(struct dp_hdmi_dongle_signature_data *)type2_dongle_buf;
+
+	is_valid_hdmi_signature = true;
+
+	/* Check EOT */
+	if (dongle_signature->eot != DP_HDMI_DONGLE_SIGNATURE_EOT) {
+		is_valid_hdmi_signature = false;
+	}
+
+	/* Check signature */
+	for (i = 0; i < sizeof(dongle_signature->id); ++i) {
+		/* If its not the right signature,
+		 * skip mismatch in subversion byte.*/
+		if (dongle_signature->id[i] !=
+			dp_hdmi_dongle_signature_str[i] && i != 3) {
+
+			if (is_type2_dongle) {
+				is_valid_hdmi_signature = false;
+				break;
+			}
+
+		}
+	}
+
+	if (is_type2_dongle) {
+		uint32_t max_tmds_clk =
+			type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK];
+
+		max_tmds_clk = max_tmds_clk * 2 + max_tmds_clk / 2;
+
+		if (0 == max_tmds_clk ||
+				max_tmds_clk < DP_ADAPTOR_TYPE2_MIN_TMDS_CLK ||
+				max_tmds_clk > DP_ADAPTOR_TYPE2_MAX_TMDS_CLK) {
+			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"DP-DVI passive dongle %dMhz: ",
+					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
+		} else {
+			if (is_valid_hdmi_signature == true) {
+				*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
+
+				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+						sizeof(type2_dongle_buf),
+						"Type 2 DP-HDMI passive dongle %dMhz: ",
+						max_tmds_clk);
+			} else {
+				*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
+
+				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+						sizeof(type2_dongle_buf),
+						"Type 2 DP-HDMI passive dongle (no signature) %dMhz: ",
+						max_tmds_clk);
+
+			}
+
+			/* Multiply by 1000 to convert to kHz. */
+			sink_cap->max_hdmi_pixel_clock =
+				max_tmds_clk * 1000;
+		}
+		sink_cap->is_dongle_type_one = false;
+
+	} else {
+		if (is_valid_hdmi_signature == true) {
+			*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"Type 1 DP-HDMI passive dongle %dMhz: ",
+					sink_cap->max_hdmi_pixel_clock / 1000);
+		} else {
+			*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"Type 1 DP-HDMI passive dongle (no signature) %dMhz: ",
+					sink_cap->max_hdmi_pixel_clock / 1000);
+		}
+		sink_cap->is_dongle_type_one = true;
+	}
+
+	return;
+}
+
 static enum signal_type dp_passive_dongle_detection(struct ddc_service *ddc,
 						    struct display_sink_capability *sink_cap,
 						    struct audio_support *audio_support)
 {
-	dal_ddc_service_i2c_query_dp_dual_mode_adaptor(ddc, sink_cap);
+	query_dp_dual_mode_adaptor(ddc, sink_cap);
 
 	return decide_signal_from_strap_and_dongle_type(sink_cap->dongle_type,
 							audio_support);
@@ -1046,11 +1214,11 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		else
 			link->dpcd_sink_count = 1;
 
-		dal_ddc_service_set_transaction_type(link->ddc,
+		set_ddc_transaction_type(link->ddc,
 						     sink_caps.transaction_type);
 
 		link->aux_mode =
-			dal_ddc_service_is_in_aux_transaction_mode(link->ddc);
+			link_is_in_aux_transaction_mode(link->ddc);
 
 		sink_init_data.link = link;
 		sink_init_data.sink_signal = sink_caps.signal;
@@ -1265,7 +1433,7 @@ static enum channel_id get_ddc_line(struct dc_link *link)
 
 	channel = CHANNEL_ID_UNKNOWN;
 
-	ddc = dal_ddc_service_get_ddc_pin(link->ddc);
+	ddc = get_ddc_pin(link->ddc);
 
 	if (ddc) {
 		switch (dal_ddc_get_line(ddc)) {
@@ -1502,7 +1670,7 @@ static bool dc_link_construct_legacy(struct dc_link *link,
 	ddc_service_init_data.ctx = link->ctx;
 	ddc_service_init_data.id = link->link_id;
 	ddc_service_init_data.link = link;
-	link->ddc = dal_ddc_service_create(&ddc_service_init_data);
+	link->ddc = link_create_ddc_service(&ddc_service_init_data);
 
 	if (!link->ddc) {
 		DC_ERROR("Failed to create ddc_service!\n");
@@ -1515,7 +1683,7 @@ static bool dc_link_construct_legacy(struct dc_link *link,
 	}
 
 	link->ddc_hw_inst =
-		dal_ddc_get_line(dal_ddc_service_get_ddc_pin(link->ddc));
+		dal_ddc_get_line(get_ddc_pin(link->ddc));
 
 
 	if (link->dc->res_pool->funcs->panel_cntl_create &&
@@ -1652,7 +1820,7 @@ static bool dc_link_construct_legacy(struct dc_link *link,
 	if (link->panel_cntl != NULL)
 		link->panel_cntl->funcs->destroy(&link->panel_cntl);
 panel_cntl_create_fail:
-	dal_ddc_service_destroy(&link->ddc);
+	link_destroy_ddc_service(&link->ddc);
 ddc_create_fail:
 create_fail:
 
@@ -1710,7 +1878,7 @@ static bool dc_link_construct_dpia(struct dc_link *link,
 	/* Set indicator for dpia link so that ddc won't be created */
 	ddc_service_init_data.is_dpia_link = true;
 
-	link->ddc = dal_ddc_service_create(&ddc_service_init_data);
+	link->ddc = link_create_ddc_service(&ddc_service_init_data);
 	if (!link->ddc) {
 		DC_ERROR("Failed to create ddc_service!\n");
 		goto ddc_create_fail;
@@ -2178,7 +2346,7 @@ static void write_i2c_retimer_setting(
 					value = settings->reg_settings[i].i2c_reg_val;
 				else {
 					i2c_success =
-						dal_ddc_service_query_ddc_data(
+						link_query_ddc_data(
 						pipe_ctx->stream->link->ddc,
 						slave_address, &offset, 1, &value, 1);
 					if (!i2c_success)
@@ -2228,7 +2396,7 @@ static void write_i2c_retimer_setting(
 						value = settings->reg_settings_6g[i].i2c_reg_val;
 					else {
 						i2c_success =
-								dal_ddc_service_query_ddc_data(
+								link_query_ddc_data(
 								pipe_ctx->stream->link->ddc,
 								slave_address, &offset, 1, &value, 1);
 						if (!i2c_success)
@@ -2526,7 +2694,7 @@ static void enable_link_hdmi(struct pipe_ctx *pipe_ctx)
 	}
 
 	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
-		dal_ddc_service_write_scdc_data(
+		write_scdc_data(
 			stream->link->ddc,
 			stream->phy_pix_clk,
 			stream->timing.flags.LTE_340MCSC_SCRAMBLE);
@@ -2547,7 +2715,7 @@ static void enable_link_hdmi(struct pipe_ctx *pipe_ctx)
 			stream->phy_pix_clk);
 
 	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
-		dal_ddc_service_read_scdc_data(link->ddc);
+		read_scdc_data(link->ddc);
 }
 
 static void enable_link_lvds(struct pipe_ctx *pipe_ctx)
@@ -4312,7 +4480,7 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
 		unsigned short masked_chip_caps = link->chip_caps &
 				EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK;
 		//Need to inform that sink is going to use legacy HDMI mode.
-		dal_ddc_service_write_scdc_data(
+		write_scdc_data(
 			link->ddc,
 			165000,//vbios only handles 165Mhz.
 			false);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 51945593f74b..815652da4126 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -32,7 +32,7 @@
 
 #include "inc/core_types.h"
 #include "link_hwss.h"
-#include "dc_link_ddc.h"
+#include "link/link_ddc.h"
 #include "core_status.h"
 #include "dpcd_defs.h"
 #include "dc_dmub_srv.h"
@@ -4866,7 +4866,7 @@ static void get_active_converter_info(
 	/* decode converter info*/
 	if (!ds_port.fields.PORT_PRESENT) {
 		link->dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
-		ddc_service_set_dongle_type(link->ddc,
+		set_dongle_type(link->ddc,
 				link->dpcd_caps.dongle_type);
 		link->dpcd_caps.is_branch_dev = false;
 		return;
@@ -4974,7 +4974,7 @@ static void get_active_converter_info(
 		}
 	}
 
-	ddc_service_set_dongle_type(link->ddc, link->dpcd_caps.dongle_type);
+	set_dongle_type(link->ddc, link->dpcd_caps.dongle_type);
 
 	{
 		struct dp_sink_hw_fw_revision dp_hw_fw_revision;
@@ -5352,7 +5352,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 	 * default to LTTPR timeout (3.2ms) first as a W/A for DP link layer
 	 * CTS 4.2.1.1 regression introduced by CTS specs requirement update.
 	 */
-	dc_link_aux_try_to_configure_timeout(link->ddc,
+	try_to_configure_aux_timeout(link->ddc,
 			LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD);
 
 	status = dp_retrieve_lttpr_cap(link);
@@ -5393,7 +5393,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 	}
 
 	if (!dp_is_lttpr_present(link))
-		dc_link_aux_try_to_configure_timeout(link->ddc, LINK_AUX_DEFAULT_TIMEOUT_PERIOD);
+		try_to_configure_aux_timeout(link->ddc, LINK_AUX_DEFAULT_TIMEOUT_PERIOD);
 
 	{
 		union training_aux_rd_interval aux_rd_interval;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
index 7769bd099a5a..7b036a772b0c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
@@ -77,6 +77,32 @@ struct aux_reply_transaction_data {
 	uint8_t *data;
 };
 
+struct aux_payload {
+	/* set following flag to read/write I2C data,
+	 * reset it to read/write DPCD data */
+	bool i2c_over_aux;
+	/* set following flag to write data,
+	 * reset it to read data */
+	bool write;
+	bool mot;
+	bool write_status_update;
+
+	uint32_t address;
+	uint32_t length;
+	uint8_t *data;
+	/*
+	 * used to return the reply type of the transaction
+	 * ignored if NULL
+	 */
+	uint8_t *reply;
+	/* expressed in milliseconds
+	 * zero means "use default value"
+	 */
+	uint32_t defer_delay;
+
+};
+#define DEFAULT_AUX_MAX_DATA_SIZE 16
+
 struct i2c_payload {
 	bool write;
 	uint8_t address;
@@ -90,6 +116,8 @@ enum i2c_command_engine {
 	I2C_COMMAND_ENGINE_HW
 };
 
+#define DDC_I2C_COMMAND_ENGINE I2C_COMMAND_ENGINE_SW
+
 struct i2c_command {
 	struct i2c_payload *payloads;
 	uint8_t number_of_payloads;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
new file mode 100644
index 000000000000..faf0d175bf19
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
@@ -0,0 +1,114 @@
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
+#ifndef DC_HDMI_TYPES_H
+#define DC_HDMI_TYPES_H
+
+#include "os_types.h"
+
+/* Address range from 0x00 to 0x1F.*/
+#define DP_ADAPTOR_TYPE2_SIZE 0x20
+#define DP_ADAPTOR_TYPE2_REG_ID 0x10
+#define DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK 0x1D
+/* Identifies adaptor as Dual-mode adaptor */
+#define DP_ADAPTOR_TYPE2_ID 0xA0
+/* MHz*/
+#define DP_ADAPTOR_TYPE2_MAX_TMDS_CLK 600
+/* MHz*/
+#define DP_ADAPTOR_TYPE2_MIN_TMDS_CLK 25
+/* kHZ*/
+#define DP_ADAPTOR_DVI_MAX_TMDS_CLK 165000
+/* kHZ*/
+#define DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK 165000
+
+struct dp_hdmi_dongle_signature_data {
+	int8_t id[15];/* "DP-HDMI ADAPTOR"*/
+	uint8_t eot;/* end of transmition '\x4' */
+};
+
+/* DP-HDMI dongle slave address for retrieving dongle signature*/
+#define DP_HDMI_DONGLE_ADDRESS 0x40
+static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
+#define DP_HDMI_DONGLE_SIGNATURE_EOT 0x04
+
+
+/* SCDC Address defines (HDMI 2.0)*/
+#define HDMI_SCDC_WRITE_UPDATE_0_ARRAY 3
+#define HDMI_SCDC_ADDRESS  0x54
+#define HDMI_SCDC_SINK_VERSION 0x01
+#define HDMI_SCDC_SOURCE_VERSION 0x02
+#define HDMI_SCDC_UPDATE_0 0x10
+#define HDMI_SCDC_TMDS_CONFIG 0x20
+#define HDMI_SCDC_SCRAMBLER_STATUS 0x21
+#define HDMI_SCDC_CONFIG_0 0x30
+#define HDMI_SCDC_CONFIG_1 0x31
+#define HDMI_SCDC_SOURCE_TEST_REQ 0x35
+#define HDMI_SCDC_STATUS_FLAGS 0x40
+#define HDMI_SCDC_ERR_DETECT 0x50
+#define HDMI_SCDC_TEST_CONFIG 0xC0
+
+union hdmi_scdc_update_read_data {
+	uint8_t byte[2];
+	struct {
+		uint8_t STATUS_UPDATE:1;
+		uint8_t CED_UPDATE:1;
+		uint8_t RR_TEST:1;
+		uint8_t RESERVED:5;
+		uint8_t RESERVED2:8;
+	} fields;
+};
+
+union hdmi_scdc_status_flags_data {
+	uint8_t byte;
+	struct {
+		uint8_t CLOCK_DETECTED:1;
+		uint8_t CH0_LOCKED:1;
+		uint8_t CH1_LOCKED:1;
+		uint8_t CH2_LOCKED:1;
+		uint8_t RESERVED:4;
+	} fields;
+};
+
+union hdmi_scdc_ced_data {
+	uint8_t byte[11];
+	struct {
+		uint8_t CH0_8LOW:8;
+		uint8_t CH0_7HIGH:7;
+		uint8_t CH0_VALID:1;
+		uint8_t CH1_8LOW:8;
+		uint8_t CH1_7HIGH:7;
+		uint8_t CH1_VALID:1;
+		uint8_t CH2_8LOW:8;
+		uint8_t CH2_7HIGH:7;
+		uint8_t CH2_VALID:1;
+		uint8_t CHECKSUM:8;
+		uint8_t RESERVED:8;
+		uint8_t RESERVED2:8;
+		uint8_t RESERVED3:8;
+		uint8_t RESERVED4:4;
+	} fields;
+};
+
+#endif /* DC_HDMI_TYPES_H */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index fbd6f11a63db..d0d2d964d601 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -31,6 +31,7 @@
 #include "grph_object_defs.h"
 
 struct link_resource;
+enum aux_return_code_type;
 
 enum dc_link_fec_state {
 	dc_link_fec_not_ready,
@@ -591,4 +592,13 @@ unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link);
 
 /* Destruct the mst topology of the link and reset the allocated payload table */
 bool reset_cur_dp_mst_topology(struct dc_link *link);
+
+/* Attempt to transfer the given aux payload. This function does not perform
+ * retries or handle error states. The reply is returned in the payload->reply
+ * and the result through operation_result. Returns the number of bytes
+ * transferred,or -1 on a failure.
+ */
+int dc_link_aux_transfer_raw(struct ddc_service *ddc,
+		struct aux_payload *payload,
+		enum aux_return_code_type *operation_result);
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index dc78e2404b48..c73a655bd687 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -33,6 +33,7 @@
 #include "fixed31_32.h"
 #include "irq_types.h"
 #include "dc_dp_types.h"
+#include "dc_hdmi_types.h"
 #include "dc_hw_types.h"
 #include "dal_types.h"
 #include "grph_object_defs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
index e69f1899fbf0..c850ed49281f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
@@ -26,7 +26,7 @@
 #ifndef __DAL_AUX_ENGINE_DCE110_H__
 #define __DAL_AUX_ENGINE_DCE110_H__
 
-#include "i2caux_interface.h"
+#include "gpio_service_interface.h"
 #include "inc/hw/aux_engine.h"
 
 enum aux_return_code_type;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
index 09260c23c3bd..fa314493ffc5 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dce_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
index fbccb7263ad2..c4287147b853 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dcn10_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.c
index 2f9bfaeaba8d..51a57dae1811 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dcn20_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 71c7237413ef..531f405d2554 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -62,7 +62,6 @@
 #include "dml/display_mode_vba.h"
 #include "dcn20_dccg.h"
 #include "dcn20_vmid.h"
-#include "dc_link_ddc.h"
 #include "dce/dce_panel_cntl.h"
 
 #include "navi10_ip_offset.h"
@@ -90,6 +89,7 @@
 
 #include "amdgpu_socbb.h"
 
+#include "link.h"
 #define DC_LOGGER_INIT(logger)
 
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
@@ -1214,7 +1214,7 @@ static void dcn20_resource_destruct(struct dcn20_resource_pool *pool)
 		dcn20_pp_smu_destroy(&pool->base.pp_smu);
 
 	if (pool->base.oem_device != NULL)
-		dal_ddc_service_destroy(&pool->base.oem_device);
+		link_destroy_ddc_service(&pool->base.oem_device);
 }
 
 struct hubp *dcn20_hubp_create(
@@ -2769,7 +2769,7 @@ static bool dcn20_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = dal_ddc_service_create(&ddc_init_data);
+		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
index 7f9ec59ef443..8d31fa131cd6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dcn201_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
index 0a1ba6e7081c..eb9abb9f9698 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
@@ -31,7 +31,6 @@
 #include "dcn21_link_encoder.h"
 #include "stream_encoder.h"
 
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
index 6f3c2fb60790..1fb8fd7afc95 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dcn30_dio_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 /* #include "dcn3ag/dcn3ag_phy_fw.h" */
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index c18c52a60100..feb4bb491525 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -60,7 +60,7 @@
 #include "dml/display_mode_vba.h"
 #include "dcn30/dcn30_dccg.h"
 #include "dcn10/dcn10_resource.h"
-#include "dc_link_ddc.h"
+#include "link.h"
 #include "dce/dce_panel_cntl.h"
 
 #include "dcn30/dcn30_dwb.h"
@@ -1208,7 +1208,7 @@ static void dcn30_resource_destruct(struct dcn30_resource_pool *pool)
 		dcn_dccg_destroy(&pool->base.dccg);
 
 	if (pool->base.oem_device != NULL)
-		dal_ddc_service_destroy(&pool->base.oem_device);
+		link_destroy_ddc_service(&pool->base.oem_device);
 }
 
 static struct hubp *dcn30_hubp_create(
@@ -2590,7 +2590,7 @@ static bool dcn30_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = dal_ddc_service_create(&ddc_init_data);
+		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
index c9fbaed23965..1b39a6e8a1ac 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dio_link_encoder.c
@@ -29,7 +29,6 @@
 #include "link_encoder.h"
 #include "dcn301_dio_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 #include "gpio_service_interface.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index 47cffd0e6830..03ddf4f5f065 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -47,6 +47,7 @@
 
 #include "dcn10/dcn10_resource.h"
 
+#include "link.h"
 #include "dce/dce_abm.h"
 #include "dce/dce_audio.h"
 #include "dce/dce_aux.h"
@@ -1125,6 +1126,9 @@ static void dcn302_resource_destruct(struct resource_pool *pool)
 
 	if (pool->dccg != NULL)
 		dcn_dccg_destroy(&pool->dccg);
+
+	if (pool->oem_device != NULL)
+		link_destroy_ddc_service(&pool->oem_device);
 }
 
 static void dcn302_destroy_resource_pool(struct resource_pool **pool)
@@ -1216,6 +1220,7 @@ static bool dcn302_resource_construct(
 	int i;
 	struct dc_context *ctx = dc->ctx;
 	struct irq_service_init_data init_data;
+	struct ddc_service_init_data ddc_init_data = {0};
 
 	ctx->dc_bios->regs = &bios_regs;
 
@@ -1497,6 +1502,17 @@ static bool dcn302_resource_construct(
 
 	dc->cap_funcs = cap_funcs;
 
+	if (dc->ctx->dc_bios->fw_info.oem_i2c_present) {
+		ddc_init_data.ctx = dc->ctx;
+		ddc_init_data.link = NULL;
+		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
+		ddc_init_data.id.enum_id = 0;
+		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
+		pool->oem_device = link_create_ddc_service(&ddc_init_data);
+	} else {
+		pool->oem_device = NULL;
+	}
+
 	return true;
 
 create_fail:
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index c14d35894b2e..31e212064168 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -29,7 +29,7 @@
 
 #include "dcn10/dcn10_resource.h"
 
-#include "dc_link_ddc.h"
+#include "link.h"
 
 #include "dce/dce_abm.h"
 #include "dce/dce_audio.h"
@@ -1054,7 +1054,7 @@ static void dcn303_resource_destruct(struct resource_pool *pool)
 		dcn_dccg_destroy(&pool->dccg);
 
 	if (pool->oem_device != NULL)
-		dal_ddc_service_destroy(&pool->oem_device);
+		link_destroy_ddc_service(&pool->oem_device);
 }
 
 static void dcn303_destroy_resource_pool(struct resource_pool **pool)
@@ -1421,7 +1421,7 @@ static bool dcn303_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->oem_device = dal_ddc_service_create(&ddc_init_data);
+		pool->oem_device = link_create_ddc_service(&ddc_init_data);
 	} else {
 		pool->oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index ab70ebd8f223..275e78c06dee 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -30,7 +30,6 @@
 #include "link_encoder.h"
 #include "dcn31_dio_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
index 076969d928af..501388014855 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
@@ -31,7 +31,6 @@
 #include "dcn31/dcn31_dio_link_encoder.h"
 #include "dcn32_dio_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 #include "link_enc_cfg.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index dfecdf3e25e9..47dc96acdacb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -69,7 +69,7 @@
 #include "dml/display_mode_vba.h"
 #include "dcn32/dcn32_dccg.h"
 #include "dcn10/dcn10_resource.h"
-#include "dc_link_ddc.h"
+#include "link.h"
 #include "dcn31/dcn31_panel_cntl.h"
 
 #include "dcn30/dcn30_dwb.h"
@@ -1508,7 +1508,7 @@ static void dcn32_resource_destruct(struct dcn32_resource_pool *pool)
 		dcn_dccg_destroy(&pool->base.dccg);
 
 	if (pool->base.oem_device != NULL)
-		dal_ddc_service_destroy(&pool->base.oem_device);
+		link_destroy_ddc_service(&pool->base.oem_device);
 }
 
 
@@ -2450,7 +2450,7 @@ static bool dcn32_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = dal_ddc_service_create(&ddc_init_data);
+		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c
index fa9b6603cfd3..13be5f06d987 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c
@@ -31,7 +31,6 @@
 #include "dcn321_dio_link_encoder.h"
 #include "dcn31/dcn31_dio_link_encoder.h"
 #include "stream_encoder.h"
-#include "i2caux_interface.h"
 #include "dc_bios_types.h"
 
 #include "gpio_service_interface.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index 62e400e90b56..260d71ca0205 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -73,7 +73,7 @@
 #include "dml/display_mode_vba.h"
 #include "dcn32/dcn32_dccg.h"
 #include "dcn10/dcn10_resource.h"
-#include "dc_link_ddc.h"
+#include "link.h"
 #include "dcn31/dcn31_panel_cntl.h"
 
 #include "dcn30/dcn30_dwb.h"
@@ -1493,7 +1493,7 @@ static void dcn321_resource_destruct(struct dcn321_resource_pool *pool)
 		dcn_dccg_destroy(&pool->base.dccg);
 
 	if (pool->base.oem_device != NULL)
-		dal_ddc_service_destroy(&pool->base.oem_device);
+		link_destroy_ddc_service(&pool->base.oem_device);
 }
 
 
@@ -1991,7 +1991,7 @@ static bool dcn321_resource_construct(
 		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
 		ddc_init_data.id.enum_id = 0;
 		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
-		pool->base.oem_device = dal_ddc_service_create(&ddc_init_data);
+		pool->base.oem_device = link_create_ddc_service(&ddc_init_data);
 	} else {
 		pool->base.oem_device = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
index 4233955e3c47..6c4b47f90d49 100644
--- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
+++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
@@ -28,10 +28,9 @@
 #include "dm_services.h"
 #include "dm_helpers.h"
 #include "include/hdcp_types.h"
-#include "include/i2caux_interface.h"
 #include "include/signal_types.h"
 #include "core_types.h"
-#include "dc_link_ddc.h"
+#include "link.h"
 #include "link_hwss.h"
 #include "inc/link_dpcd.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
deleted file mode 100644
index 95fb61d62778..000000000000
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- * Copyright 2012-15 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: AMD
- *
- */
-
-#ifndef __DAL_DDC_SERVICE_H__
-#define __DAL_DDC_SERVICE_H__
-
-#include "include/ddc_service_types.h"
-#include "include/i2caux_interface.h"
-
-#define EDID_SEGMENT_SIZE 256
-
-/* Address range from 0x00 to 0x1F.*/
-#define DP_ADAPTOR_TYPE2_SIZE 0x20
-#define DP_ADAPTOR_TYPE2_REG_ID 0x10
-#define DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK 0x1D
-/* Identifies adaptor as Dual-mode adaptor */
-#define DP_ADAPTOR_TYPE2_ID 0xA0
-/* MHz*/
-#define DP_ADAPTOR_TYPE2_MAX_TMDS_CLK 600
-/* MHz*/
-#define DP_ADAPTOR_TYPE2_MIN_TMDS_CLK 25
-/* kHZ*/
-#define DP_ADAPTOR_DVI_MAX_TMDS_CLK 165000
-/* kHZ*/
-#define DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK 165000
-
-#define DDC_I2C_COMMAND_ENGINE I2C_COMMAND_ENGINE_SW
-
-struct ddc_service;
-struct graphics_object_id;
-enum ddc_result;
-struct av_sync_data;
-struct dp_receiver_id_info;
-
-struct i2c_payloads;
-struct aux_payloads;
-enum aux_return_code_type;
-
-void dal_ddc_i2c_payloads_add(
-		struct i2c_payloads *payloads,
-		uint32_t address,
-		uint32_t len,
-		uint8_t *data,
-		bool write);
-
-struct ddc_service_init_data {
-	struct graphics_object_id id;
-	struct dc_context *ctx;
-	struct dc_link *link;
-	bool is_dpia_link;
-};
-
-struct ddc_service *dal_ddc_service_create(
-		struct ddc_service_init_data *ddc_init_data);
-
-void dal_ddc_service_destroy(struct ddc_service **ddc);
-
-enum ddc_service_type dal_ddc_service_get_type(struct ddc_service *ddc);
-
-void dal_ddc_service_set_transaction_type(
-		struct ddc_service *ddc,
-		enum ddc_transaction_type type);
-
-bool dal_ddc_service_is_in_aux_transaction_mode(struct ddc_service *ddc);
-
-void dal_ddc_service_i2c_query_dp_dual_mode_adaptor(
-		struct ddc_service *ddc,
-		struct display_sink_capability *sink_cap);
-
-bool dal_ddc_service_query_ddc_data(
-		struct ddc_service *ddc,
-		uint32_t address,
-		uint8_t *write_buf,
-		uint32_t write_size,
-		uint8_t *read_buf,
-		uint32_t read_size);
-
-bool dal_ddc_submit_aux_command(struct ddc_service *ddc,
-		struct aux_payload *payload);
-
-int dc_link_aux_transfer_raw(struct ddc_service *ddc,
-		struct aux_payload *payload,
-		enum aux_return_code_type *operation_result);
-
-bool dc_link_aux_transfer_with_retries(struct ddc_service *ddc,
-		struct aux_payload *payload);
-
-bool dc_link_aux_try_to_configure_timeout(struct ddc_service *ddc,
-		uint32_t timeout);
-
-void dal_ddc_service_write_scdc_data(
-		struct ddc_service *ddc_service,
-		uint32_t pix_clk,
-		bool lte_340_scramble);
-
-void dal_ddc_service_read_scdc_data(
-		struct ddc_service *ddc_service);
-
-void ddc_service_set_dongle_type(struct ddc_service *ddc,
-		enum display_dongle_type dongle_type);
-
-void dal_ddc_service_set_ddc_pin(
-		struct ddc_service *ddc_service,
-		struct ddc *ddc);
-
-struct ddc *dal_ddc_service_get_ddc_pin(struct ddc_service *ddc_service);
-
-uint32_t get_defer_delay(struct ddc_service *ddc);
-
-#endif /* __DAL_DDC_SERVICE_H__ */
-
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h b/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
index 2ae630bf2aee..7254182b7c72 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
@@ -27,7 +27,6 @@
 #define __DAL_AUX_ENGINE_H__
 
 #include "dc_ddc_types.h"
-#include "include/i2caux_interface.h"
 
 enum aux_return_code_type;
 
@@ -81,7 +80,12 @@ enum i2c_default_speed {
 	I2CAUX_DEFAULT_I2C_SW_SPEED = 50
 };
 
-union aux_config;
+union aux_config {
+	struct {
+		uint32_t ALLOW_AUX_WHEN_HPD_LOW:1;
+	} bits;
+	uint32_t raw;
+};
 
 struct aux_engine {
 	uint32_t inst;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 51ddf7a34d98..8774d3a39f05 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -44,4 +44,41 @@ struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
 		struct graphics_object_id link_id,
 		struct gpio_service *gpio_service);
 
+struct ddc_service_init_data {
+	struct graphics_object_id id;
+	struct dc_context *ctx;
+	struct dc_link *link;
+	bool is_dpia_link;
+};
+
+struct ddc_service *link_create_ddc_service(
+		struct ddc_service_init_data *ddc_init_data);
+
+void link_destroy_ddc_service(struct ddc_service **ddc);
+
+bool link_is_in_aux_transaction_mode(struct ddc_service *ddc);
+
+bool link_query_ddc_data(
+		struct ddc_service *ddc,
+		uint32_t address,
+		uint8_t *write_buf,
+		uint32_t write_size,
+		uint8_t *read_buf,
+		uint32_t read_size);
+
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
+uint32_t link_get_aux_defer_delay(struct ddc_service *ddc);
+
+
 #endif /* __DC_LINK_HPD_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/Makefile b/drivers/gpu/drm/amd/display/dc/link/Makefile
index 835a2febf2db..d1b1bb3c5352 100644
--- a/drivers/gpu/drm/amd/display/dc/link/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/link/Makefile
@@ -24,7 +24,7 @@
 # PHY, HPD, DDC and etc).
 
 LINK = link_hwss_dio.o link_hwss_dpia.o link_hwss_hpo_dp.o link_dp_trace.o \
-link_hpd.o
+link_hpd.o link_ddc.o
 
 AMD_DAL_LINK = $(addprefix $(AMDDALPATH)/dc/link/,$(LINK))
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/link/link_ddc.c
similarity index 57%
rename from drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
rename to drivers/gpu/drm/amd/display/dc/link/link_ddc.c
index 651231387043..5269125bc2a4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_ddc.c
@@ -23,20 +23,20 @@
  *
  */
 
-#include "dm_services.h"
-#include "dm_helpers.h"
-#include "gpio_service_interface.h"
-#include "include/ddc_service_types.h"
-#include "include/grph_object_id.h"
-#include "include/dpcd_defs.h"
-#include "include/logger_interface.h"
-#include "include/vector.h"
-#include "core_types.h"
-#include "dc_link_ddc.h"
+/* FILE POLICY AND INTENDED USAGE:
+ *
+ * This file implements generic display communication protocols such as i2c, aux
+ * and scdc. The file should not contain any specific applications of these
+ * protocols such as display capability query, detection, or handshaking such as
+ * link training.
+ */
+#include "link_ddc.h"
+#include "vector.h"
 #include "dce/dce_aux.h"
-#include "dmub/inc/dmub_cmd.h"
+#include "dal_asic_id.h"
 #include "link_dpcd.h"
-#include "include/dal_asic_id.h"
+#include "dm_helpers.h"
+#include "atomfirmware.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -45,86 +45,6 @@ static const uint8_t DP_VGA_DONGLE_BRANCH_DEV_NAME[] = "DpVga";
 static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
 static const uint8_t DP_DVI_CONVERTER_ID_5[] = "3393N2";
 
-#define AUX_POWER_UP_WA_DELAY 500
-#define I2C_OVER_AUX_DEFER_WA_DELAY 70
-#define DPVGA_DONGLE_AUX_DEFER_WA_DELAY 40
-#define I2C_OVER_AUX_DEFER_WA_DELAY_1MS 1
-
-/* CV smart dongle slave address for retrieving supported HDTV modes*/
-#define CV_SMART_DONGLE_ADDRESS 0x20
-/* DVI-HDMI dongle slave address for retrieving dongle signature*/
-#define DVI_HDMI_DONGLE_ADDRESS 0x68
-struct dvi_hdmi_dongle_signature_data {
-	int8_t vendor[3];/* "AMD" */
-	uint8_t version[2];
-	uint8_t size;
-	int8_t id[11];/* "6140063500G"*/
-};
-/* DP-HDMI dongle slave address for retrieving dongle signature*/
-#define DP_HDMI_DONGLE_ADDRESS 0x40
-static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
-#define DP_HDMI_DONGLE_SIGNATURE_EOT 0x04
-
-struct dp_hdmi_dongle_signature_data {
-	int8_t id[15];/* "DP-HDMI ADAPTOR"*/
-	uint8_t eot;/* end of transmition '\x4' */
-};
-
-/* SCDC Address defines (HDMI 2.0)*/
-#define HDMI_SCDC_WRITE_UPDATE_0_ARRAY 3
-#define HDMI_SCDC_ADDRESS  0x54
-#define HDMI_SCDC_SINK_VERSION 0x01
-#define HDMI_SCDC_SOURCE_VERSION 0x02
-#define HDMI_SCDC_UPDATE_0 0x10
-#define HDMI_SCDC_TMDS_CONFIG 0x20
-#define HDMI_SCDC_SCRAMBLER_STATUS 0x21
-#define HDMI_SCDC_CONFIG_0 0x30
-#define HDMI_SCDC_STATUS_FLAGS 0x40
-#define HDMI_SCDC_ERR_DETECT 0x50
-#define HDMI_SCDC_TEST_CONFIG 0xC0
-
-union hdmi_scdc_update_read_data {
-	uint8_t byte[2];
-	struct {
-		uint8_t STATUS_UPDATE:1;
-		uint8_t CED_UPDATE:1;
-		uint8_t RR_TEST:1;
-		uint8_t RESERVED:5;
-		uint8_t RESERVED2:8;
-	} fields;
-};
-
-union hdmi_scdc_status_flags_data {
-	uint8_t byte;
-	struct {
-		uint8_t CLOCK_DETECTED:1;
-		uint8_t CH0_LOCKED:1;
-		uint8_t CH1_LOCKED:1;
-		uint8_t CH2_LOCKED:1;
-		uint8_t RESERVED:4;
-	} fields;
-};
-
-union hdmi_scdc_ced_data {
-	uint8_t byte[7];
-	struct {
-		uint8_t CH0_8LOW:8;
-		uint8_t CH0_7HIGH:7;
-		uint8_t CH0_VALID:1;
-		uint8_t CH1_8LOW:8;
-		uint8_t CH1_7HIGH:7;
-		uint8_t CH1_VALID:1;
-		uint8_t CH2_8LOW:8;
-		uint8_t CH2_7HIGH:7;
-		uint8_t CH2_VALID:1;
-		uint8_t CHECKSUM:8;
-		uint8_t RESERVED:8;
-		uint8_t RESERVED2:8;
-		uint8_t RESERVED3:8;
-		uint8_t RESERVED4:4;
-	} fields;
-};
-
 struct i2c_payloads {
 	struct vector payloads;
 };
@@ -157,7 +77,7 @@ static uint32_t dal_ddc_i2c_payloads_get_count(struct i2c_payloads *p)
 
 #define DDC_MIN(a, b) (((a) < (b)) ? (a) : (b))
 
-void dal_ddc_i2c_payloads_add(
+static void i2c_payloads_add(
 	struct i2c_payloads *payloads,
 	uint32_t address,
 	uint32_t len,
@@ -225,7 +145,7 @@ static void ddc_service_construct(
 	ddc_service->wa.raw = 0;
 }
 
-struct ddc_service *dal_ddc_service_create(
+struct ddc_service *link_create_ddc_service(
 	struct ddc_service_init_data *init_data)
 {
 	struct ddc_service *ddc_service;
@@ -245,7 +165,7 @@ static void ddc_service_destruct(struct ddc_service *ddc)
 		dal_gpio_destroy_ddc(&ddc->ddc_pin);
 }
 
-void dal_ddc_service_destroy(struct ddc_service **ddc)
+void link_destroy_ddc_service(struct ddc_service **ddc)
 {
 	if (!ddc || !*ddc) {
 		BREAK_TO_DEBUGGER();
@@ -256,19 +176,14 @@ void dal_ddc_service_destroy(struct ddc_service **ddc)
 	*ddc = NULL;
 }
 
-enum ddc_service_type dal_ddc_service_get_type(struct ddc_service *ddc)
-{
-	return DDC_SERVICE_TYPE_CONNECTOR;
-}
-
-void dal_ddc_service_set_transaction_type(
+void set_ddc_transaction_type(
 	struct ddc_service *ddc,
 	enum ddc_transaction_type type)
 {
 	ddc->transaction_type = type;
 }
 
-bool dal_ddc_service_is_in_aux_transaction_mode(struct ddc_service *ddc)
+bool link_is_in_aux_transaction_mode(struct ddc_service *ddc)
 {
 	switch (ddc->transaction_type) {
 	case DDC_TRANSACTION_TYPE_I2C_OVER_AUX:
@@ -281,7 +196,7 @@ bool dal_ddc_service_is_in_aux_transaction_mode(struct ddc_service *ddc)
 	return false;
 }
 
-void ddc_service_set_dongle_type(struct ddc_service *ddc,
+void set_dongle_type(struct ddc_service *ddc,
 		enum display_dongle_type dongle_type)
 {
 	ddc->dongle_type = dongle_type;
@@ -323,7 +238,7 @@ static uint32_t defer_delay_converter_wa(
 
 #define DP_TRANSLATOR_DELAY 5
 
-uint32_t get_defer_delay(struct ddc_service *ddc)
+uint32_t link_get_aux_defer_delay(struct ddc_service *ddc)
 {
 	uint32_t defer_delay = 0;
 
@@ -351,175 +266,45 @@ uint32_t get_defer_delay(struct ddc_service *ddc)
 	return defer_delay;
 }
 
-static bool i2c_read(
-	struct ddc_service *ddc,
-	uint32_t address,
-	uint8_t *buffer,
-	uint32_t len)
-{
-	uint8_t offs_data = 0;
-	struct i2c_payload payloads[2] = {
-		{
-		.write = true,
-		.address = address,
-		.length = 1,
-		.data = &offs_data },
-		{
-		.write = false,
-		.address = address,
-		.length = len,
-		.data = buffer } };
-
-	struct i2c_command command = {
-		.payloads = payloads,
-		.number_of_payloads = 2,
-		.engine = DDC_I2C_COMMAND_ENGINE,
-		.speed = ddc->ctx->dc->caps.i2c_speed_in_khz };
-
-	return dm_helpers_submit_i2c(
-			ddc->ctx,
-			ddc->link,
-			&command);
-}
-
-void dal_ddc_service_i2c_query_dp_dual_mode_adaptor(
-	struct ddc_service *ddc,
-	struct display_sink_capability *sink_cap)
+static bool submit_aux_command(struct ddc_service *ddc,
+		struct aux_payload *payload)
 {
-	uint8_t i;
-	bool is_valid_hdmi_signature;
-	enum display_dongle_type *dongle = &sink_cap->dongle_type;
-	uint8_t type2_dongle_buf[DP_ADAPTOR_TYPE2_SIZE];
-	bool is_type2_dongle = false;
-	int retry_count = 2;
-	struct dp_hdmi_dongle_signature_data *dongle_signature;
-
-	/* Assume we have no valid DP passive dongle connected */
-	*dongle = DISPLAY_DONGLE_NONE;
-	sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK;
-
-	/* Read DP-HDMI dongle I2c (no response interpreted as DP-DVI dongle)*/
-	if (!i2c_read(
-		ddc,
-		DP_HDMI_DONGLE_ADDRESS,
-		type2_dongle_buf,
-		sizeof(type2_dongle_buf))) {
-		/* Passive HDMI dongles can sometimes fail here without retrying*/
-		while (retry_count > 0) {
-			if (i2c_read(ddc,
-				DP_HDMI_DONGLE_ADDRESS,
-				type2_dongle_buf,
-				sizeof(type2_dongle_buf)))
-				break;
-			retry_count--;
-		}
-		if (retry_count == 0) {
-			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
-			sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_DVI_MAX_TMDS_CLK;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf, sizeof(type2_dongle_buf),
-					"DP-DVI passive dongle %dMhz: ",
-					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
-			return;
-		}
-	}
-
-	/* Check if Type 2 dongle.*/
-	if (type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_ID] == DP_ADAPTOR_TYPE2_ID)
-		is_type2_dongle = true;
-
-	dongle_signature =
-		(struct dp_hdmi_dongle_signature_data *)type2_dongle_buf;
+	uint32_t retrieved = 0;
+	bool ret = false;
 
-	is_valid_hdmi_signature = true;
+	if (!ddc)
+		return false;
 
-	/* Check EOT */
-	if (dongle_signature->eot != DP_HDMI_DONGLE_SIGNATURE_EOT) {
-		is_valid_hdmi_signature = false;
-	}
+	if (!payload)
+		return false;
 
-	/* Check signature */
-	for (i = 0; i < sizeof(dongle_signature->id); ++i) {
-		/* If its not the right signature,
-		 * skip mismatch in subversion byte.*/
-		if (dongle_signature->id[i] !=
-			dp_hdmi_dongle_signature_str[i] && i != 3) {
+	do {
+		struct aux_payload current_payload;
+		bool is_end_of_payload = (retrieved + DEFAULT_AUX_MAX_DATA_SIZE) >=
+				payload->length;
+		uint32_t payload_length = is_end_of_payload ?
+				payload->length - retrieved : DEFAULT_AUX_MAX_DATA_SIZE;
 
-			if (is_type2_dongle) {
-				is_valid_hdmi_signature = false;
-				break;
-			}
+		current_payload.address = payload->address;
+		current_payload.data = &payload->data[retrieved];
+		current_payload.defer_delay = payload->defer_delay;
+		current_payload.i2c_over_aux = payload->i2c_over_aux;
+		current_payload.length = payload_length;
+		/* set mot (middle of transaction) to false if it is the last payload */
+		current_payload.mot = is_end_of_payload ? payload->mot:true;
+		current_payload.write_status_update = false;
+		current_payload.reply = payload->reply;
+		current_payload.write = payload->write;
 
-		}
-	}
+		ret = link_aux_transfer_with_retries_no_mutex(ddc, &current_payload);
 
-	if (is_type2_dongle) {
-		uint32_t max_tmds_clk =
-			type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK];
-
-		max_tmds_clk = max_tmds_clk * 2 + max_tmds_clk / 2;
-
-		if (0 == max_tmds_clk ||
-				max_tmds_clk < DP_ADAPTOR_TYPE2_MIN_TMDS_CLK ||
-				max_tmds_clk > DP_ADAPTOR_TYPE2_MAX_TMDS_CLK) {
-			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"DP-DVI passive dongle %dMhz: ",
-					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
-		} else {
-			if (is_valid_hdmi_signature == true) {
-				*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
-
-				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-						sizeof(type2_dongle_buf),
-						"Type 2 DP-HDMI passive dongle %dMhz: ",
-						max_tmds_clk);
-			} else {
-				*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
-
-				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-						sizeof(type2_dongle_buf),
-						"Type 2 DP-HDMI passive dongle (no signature) %dMhz: ",
-						max_tmds_clk);
-
-			}
-
-			/* Multiply by 1000 to convert to kHz. */
-			sink_cap->max_hdmi_pixel_clock =
-				max_tmds_clk * 1000;
-		}
-		sink_cap->is_dongle_type_one = false;
-
-	} else {
-		if (is_valid_hdmi_signature == true) {
-			*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"Type 1 DP-HDMI passive dongle %dMhz: ",
-					sink_cap->max_hdmi_pixel_clock / 1000);
-		} else {
-			*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"Type 1 DP-HDMI passive dongle (no signature) %dMhz: ",
-					sink_cap->max_hdmi_pixel_clock / 1000);
-		}
-		sink_cap->is_dongle_type_one = true;
-	}
+		retrieved += payload_length;
+	} while (retrieved < payload->length && ret == true);
 
-	return;
+	return ret;
 }
 
-enum {
-	DP_SINK_CAP_SIZE =
-		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV + 1
-};
-
-bool dal_ddc_service_query_ddc_data(
+bool link_query_ddc_data(
 	struct ddc_service *ddc,
 	uint32_t address,
 	uint8_t *write_buf,
@@ -529,7 +314,7 @@ bool dal_ddc_service_query_ddc_data(
 {
 	bool success = true;
 	uint32_t payload_size =
-		dal_ddc_service_is_in_aux_transaction_mode(ddc) ?
+		link_is_in_aux_transaction_mode(ddc) ?
 			DEFAULT_AUX_MAX_DATA_SIZE : EDID_SEGMENT_SIZE;
 
 	uint32_t write_payloads =
@@ -543,13 +328,13 @@ bool dal_ddc_service_query_ddc_data(
 	if (!payloads_num)
 		return false;
 
-	if (dal_ddc_service_is_in_aux_transaction_mode(ddc)) {
+	if (link_is_in_aux_transaction_mode(ddc)) {
 		struct aux_payload payload;
 
 		payload.i2c_over_aux = true;
 		payload.address = address;
 		payload.reply = NULL;
-		payload.defer_delay = get_defer_delay(ddc);
+		payload.defer_delay = link_get_aux_defer_delay(ddc);
 		payload.write_status_update = false;
 
 		if (write_size != 0) {
@@ -561,7 +346,7 @@ bool dal_ddc_service_query_ddc_data(
 			payload.length = write_size;
 			payload.data = write_buf;
 
-			success = dal_ddc_submit_aux_command(ddc, &payload);
+			success = submit_aux_command(ddc, &payload);
 		}
 
 		if (read_size != 0 && success) {
@@ -573,7 +358,7 @@ bool dal_ddc_service_query_ddc_data(
 			payload.length = read_size;
 			payload.data = read_buf;
 
-			success = dal_ddc_submit_aux_command(ddc, &payload);
+			success = submit_aux_command(ddc, &payload);
 		}
 	} else {
 		struct i2c_command command = {0};
@@ -587,10 +372,10 @@ bool dal_ddc_service_query_ddc_data(
 		command.engine = DDC_I2C_COMMAND_ENGINE;
 		command.speed = ddc->ctx->dc->caps.i2c_speed_in_khz;
 
-		dal_ddc_i2c_payloads_add(
+		i2c_payloads_add(
 			&payloads, address, write_size, write_buf, true);
 
-		dal_ddc_i2c_payloads_add(
+		i2c_payloads_add(
 			&payloads, address, read_size, read_buf, false);
 
 		command.number_of_payloads =
@@ -607,51 +392,6 @@ bool dal_ddc_service_query_ddc_data(
 	return success;
 }
 
-bool dal_ddc_submit_aux_command(struct ddc_service *ddc,
-		struct aux_payload *payload)
-{
-	uint32_t retrieved = 0;
-	bool ret = false;
-
-	if (!ddc)
-		return false;
-
-	if (!payload)
-		return false;
-
-	do {
-		struct aux_payload current_payload;
-		bool is_end_of_payload = (retrieved + DEFAULT_AUX_MAX_DATA_SIZE) >=
-				payload->length;
-		uint32_t payload_length = is_end_of_payload ?
-				payload->length - retrieved : DEFAULT_AUX_MAX_DATA_SIZE;
-
-		current_payload.address = payload->address;
-		current_payload.data = &payload->data[retrieved];
-		current_payload.defer_delay = payload->defer_delay;
-		current_payload.i2c_over_aux = payload->i2c_over_aux;
-		current_payload.length = payload_length;
-		/* set mot (middle of transaction) to false if it is the last payload */
-		current_payload.mot = is_end_of_payload ? payload->mot:true;
-		current_payload.write_status_update = false;
-		current_payload.reply = payload->reply;
-		current_payload.write = payload->write;
-
-		ret = dc_link_aux_transfer_with_retries(ddc, &current_payload);
-
-		retrieved += payload_length;
-	} while (retrieved < payload->length && ret == true);
-
-	return ret;
-}
-
-/* dc_link_aux_transfer_raw() - Attempt to transfer
- * the given aux payload.  This function does not perform
- * retries or handle error states.  The reply is returned
- * in the payload->reply and the result through
- * *operation_result.  Returns the number of bytes transferred,
- * or -1 on a failure.
- */
 int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *payload,
 		enum aux_return_code_type *operation_result)
@@ -664,22 +404,14 @@ int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 	}
 }
 
-/* dc_link_aux_transfer_with_retries() - Attempt to submit an
- * aux payload, retrying on timeouts, defers, and busy states
- * as outlined in the DP spec.  Returns true if the request
- * was successful.
- *
- * Unless you want to implement your own retry semantics, this
- * is probably the one you want.
- */
-bool dc_link_aux_transfer_with_retries(struct ddc_service *ddc,
+bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
 		struct aux_payload *payload)
 {
 	return dce_aux_transfer_with_retries(ddc, payload);
 }
 
 
-bool dc_link_aux_try_to_configure_timeout(struct ddc_service *ddc,
+bool try_to_configure_aux_timeout(struct ddc_service *ddc,
 		uint32_t timeout)
 {
 	bool result = false;
@@ -712,20 +444,12 @@ bool dc_link_aux_try_to_configure_timeout(struct ddc_service *ddc,
 	return result;
 }
 
-/*test only function*/
-void dal_ddc_service_set_ddc_pin(
-	struct ddc_service *ddc_service,
-	struct ddc *ddc)
-{
-	ddc_service->ddc_pin = ddc;
-}
-
-struct ddc *dal_ddc_service_get_ddc_pin(struct ddc_service *ddc_service)
+struct ddc *get_ddc_pin(struct ddc_service *ddc_service)
 {
 	return ddc_service->ddc_pin;
 }
 
-void dal_ddc_service_write_scdc_data(struct ddc_service *ddc_service,
+void write_scdc_data(struct ddc_service *ddc_service,
 		uint32_t pix_clk,
 		bool lte_340_scramble)
 {
@@ -740,13 +464,13 @@ void dal_ddc_service_write_scdc_data(struct ddc_service *ddc_service,
 		ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
 		return;
 
-	dal_ddc_service_query_ddc_data(ddc_service, slave_address, &offset,
+	link_query_ddc_data(ddc_service, slave_address, &offset,
 			sizeof(offset), &sink_version, sizeof(sink_version));
 	if (sink_version == 1) {
 		/*Source Version = 1*/
 		write_buffer[0] = HDMI_SCDC_SOURCE_VERSION;
 		write_buffer[1] = 1;
-		dal_ddc_service_query_ddc_data(ddc_service, slave_address,
+		link_query_ddc_data(ddc_service, slave_address,
 				write_buffer, sizeof(write_buffer), NULL, 0);
 		/*Read Request from SCDC caps*/
 	}
@@ -759,11 +483,11 @@ void dal_ddc_service_write_scdc_data(struct ddc_service *ddc_service,
 	} else {
 		write_buffer[1] = 0;
 	}
-	dal_ddc_service_query_ddc_data(ddc_service, slave_address, write_buffer,
+	link_query_ddc_data(ddc_service, slave_address, write_buffer,
 			sizeof(write_buffer), NULL, 0);
 }
 
-void dal_ddc_service_read_scdc_data(struct ddc_service *ddc_service)
+void read_scdc_data(struct ddc_service *ddc_service)
 {
 	uint8_t slave_address = HDMI_SCDC_ADDRESS;
 	uint8_t offset = HDMI_SCDC_TMDS_CONFIG;
@@ -773,20 +497,19 @@ void dal_ddc_service_read_scdc_data(struct ddc_service *ddc_service)
 		ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
 		return;
 
-	dal_ddc_service_query_ddc_data(ddc_service, slave_address, &offset,
+	link_query_ddc_data(ddc_service, slave_address, &offset,
 			sizeof(offset), &tmds_config, sizeof(tmds_config));
 	if (tmds_config & 0x1) {
 		union hdmi_scdc_status_flags_data status_data = {0};
 		uint8_t scramble_status = 0;
 
 		offset = HDMI_SCDC_SCRAMBLER_STATUS;
-		dal_ddc_service_query_ddc_data(ddc_service, slave_address,
+		link_query_ddc_data(ddc_service, slave_address,
 				&offset, sizeof(offset), &scramble_status,
 				sizeof(scramble_status));
 		offset = HDMI_SCDC_STATUS_FLAGS;
-		dal_ddc_service_query_ddc_data(ddc_service, slave_address,
+		link_query_ddc_data(ddc_service, slave_address,
 				&offset, sizeof(offset), &status_data.byte,
 				sizeof(status_data.byte));
 	}
 }
-
diff --git a/drivers/gpu/drm/amd/display/include/i2caux_interface.h b/drivers/gpu/drm/amd/display/dc/link/link_ddc.h
similarity index 52%
rename from drivers/gpu/drm/amd/display/include/i2caux_interface.h
rename to drivers/gpu/drm/amd/display/dc/link/link_ddc.h
index 418fbf8c5c3a..71a342d0395e 100644
--- a/drivers/gpu/drm/amd/display/include/i2caux_interface.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_ddc.h
@@ -23,60 +23,37 @@
  *
  */
 
-#ifndef __DAL_I2CAUX_INTERFACE_H__
-#define __DAL_I2CAUX_INTERFACE_H__
+#ifndef __DAL_DDC_SERVICE_H__
+#define __DAL_DDC_SERVICE_H__
 
-#include "dc_types.h"
-#include "gpio_service_interface.h"
+#include "link.h"
 
+#define AUX_POWER_UP_WA_DELAY 500
+#define I2C_OVER_AUX_DEFER_WA_DELAY 70
+#define DPVGA_DONGLE_AUX_DEFER_WA_DELAY 40
+#define I2C_OVER_AUX_DEFER_WA_DELAY_1MS 1
 
-#define DEFAULT_AUX_MAX_DATA_SIZE 16
-#define AUX_MAX_DEFER_WRITE_RETRY 20
+#define EDID_SEGMENT_SIZE 256
 
-struct aux_payload {
-	/* set following flag to read/write I2C data,
-	 * reset it to read/write DPCD data */
-	bool i2c_over_aux;
-	/* set following flag to write data,
-	 * reset it to read data */
-	bool write;
-	bool mot;
-	bool write_status_update;
+void set_ddc_transaction_type(
+		struct ddc_service *ddc,
+		enum ddc_transaction_type type);
 
-	uint32_t address;
-	uint32_t length;
-	uint8_t *data;
-	/*
-	 * used to return the reply type of the transaction
-	 * ignored if NULL
-	 */
-	uint8_t *reply;
-	/* expressed in milliseconds
-	 * zero means "use default value"
-	 */
-	uint32_t defer_delay;
+bool try_to_configure_aux_timeout(struct ddc_service *ddc,
+		uint32_t timeout);
 
-};
+void write_scdc_data(
+		struct ddc_service *ddc_service,
+		uint32_t pix_clk,
+		bool lte_340_scramble);
 
-struct aux_command {
-	struct aux_payload *payloads;
-	uint8_t number_of_payloads;
+void read_scdc_data(
+		struct ddc_service *ddc_service);
 
-	/* expressed in milliseconds
-	 * zero means "use default value" */
-	uint32_t defer_delay;
+void set_dongle_type(struct ddc_service *ddc,
+		enum display_dongle_type dongle_type);
 
-	/* zero means "use default value" */
-	uint32_t max_defer_write_retry;
+struct ddc *get_ddc_pin(struct ddc_service *ddc_service);
 
-	enum i2c_mot_mode mot;
-};
+#endif /* __DAL_DDC_SERVICE_H__ */
 
-union aux_config {
-	struct {
-		uint32_t ALLOW_AUX_WHEN_HPD_LOW:1;
-	} bits;
-	uint32_t raw;
-};
-
-#endif
-- 
2.39.0

