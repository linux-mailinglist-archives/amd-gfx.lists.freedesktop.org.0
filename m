Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA73776350
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Aug 2023 17:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B7910E451;
	Wed,  9 Aug 2023 15:07:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF7410E44F
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Aug 2023 15:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbOBB8RsKDXQCrKnCJGlWl6vQb6/YKmYbrlLx1/1B1JdXhvcBniVexngkD+4eKAQgeEipEd6iwsX2Xr4E+XEJAoWExvDi2bwvoSw1aM+HPTMkKAWcZgIbeUS7k4rfVXQT8mu3q0UpZ/zra83Wu2V/br/ukMVVYsJFstT3gn6BYFV2X5klPHNhmlnGX0cMyhTeFBWUILJzzVVtdauQ6SgFgUkM6ZqopeVyG2AS+QOFKkn6nhO9KXIhMwsxHsSRlg4jMaXF/Bc3SK9lFIHPtwG+T8b2OZpOWkiesw8uCcY/xMykYFqvEWEciUY1B6tqKwddz1wPnXN4b2vq6A1z0ASFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz3/FwWm7yd0pQ2jKZe8uKM7POYRiX1IP67v2I9yI14=;
 b=YJW3zHiWOfQM6Zu8Xni/pcoOSVCWQ8Icuc9DfJfXoPmqWy38zv0bWiwkbaDpqXs/ijeg0zD7C6GYetRFbfiOnUm2TmzKAA03vytgJKXlQEW68vutB9nJE1Yi/GHmcG8n7iJW17CX6+n3+p89KuTCzie6Xy0mVmOGDoBp11UqpBfLp6f+dno2sN9AkUZMiOSmolbM8pEsrezUpMPnMyYzLBngZPvLiu4t3rKIEaFVubQhg34XOnhQJugOtiJLEbiNCEXs0wulyw4vSJILNd62o02/0d6CWYdooKy2XViXRI9BKhjSVsmUiyk+dJSTcF9XCGihaZ5QEMFuy7lv5BGj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz3/FwWm7yd0pQ2jKZe8uKM7POYRiX1IP67v2I9yI14=;
 b=J78qsbVq5GuAiX1v+gh+gpbEg8f+SS+beS3R6WE75FkQSvNFp3yPDNW5N8g04jFIrzM181qpFe+SXayg1U9XQQwSTGzo/rNGNHvB8NOiWiSgaZZEdW1sxguoOIbqLN1FoqzLLALxiYXOXo0Pp7jVP1+blEGEPMo2X5FLcvULkvc=
Received: from DS7PR03CA0343.namprd03.prod.outlook.com (2603:10b6:8:55::17) by
 CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.28; Wed, 9 Aug 2023 15:07:03 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::e9) by DS7PR03CA0343.outlook.office365.com
 (2603:10b6:8:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 15:07:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 9 Aug 2023 15:07:02 +0000
Received: from stylon-EliteDesk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 10:06:57 -0500
From: Stylon Wang <stylon.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/15] drm/amd/display: Support Compliance Test Pattern
 Generation with DP2 Retimer
Date: Wed, 9 Aug 2023 23:04:51 +0800
Message-ID: <20230809150620.1071566-2-stylon.wang@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809150620.1071566-1-stylon.wang@amd.com>
References: <20230809150620.1071566-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CY5PR12MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f387e01-813a-4032-09b5-08db98ea49c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoSpzHF2UuewSx2fJBFDHUnEg84Z3dQwByCd2npP33FPcmHZo/6+rKeBfM2lSurAxgPZz7qLgdaV/vv8PWJD+g9++k4wZ/pmjprCxLhxqg4tJF4LCUztqVx7LCWJlRfVV10nRBzpSjZ97rXS8Xz2Q7JJMFmodlzqXHlbgADWi+cR07B2XlRbBuB/es27GpwtiVKSoSppMaazyU6wRnXEnJioq3UpTDSwMjhsDz5ByfPgksuxOA4xv/Ke8Z2V0eoHh2fzakSCMHVog9ikmRywuq8Tw+2ldfhUu3fSz2oeNyTTPiXvdLzULqI7hcUMwIONvZH5N2NiX8+7SThLOzAquLlarQ03Dg2zDXJRrwfRkJJn4MYJxnuuvwMVivY7idpJn9L6bD6dLO6xewnP1bEnIuRZF8kiPvNiWYz7w2IanQsCpr9wgTc9GGIKs5AdqIzPdOKB7S0QT2p2G3Plk+tFXfX0I4QXXNUMKKuaQHVksniSM3m3wW3S1ARaOhKDgYfs2IYOtcxPhQWkafmbtVsodvuOgBUEK8jVWsTTCRKXafxuBRShGSpdWLKs4piOX6VsW0xWfuqEpjuXsYe0tkP831oGG5bD7TCMtg+RSytazNW4fTFy22RgxA7sziNXnMFzyOmRONzMW6Nmg8yKmk1ZtUHwOr0EGuE0LkUAcyPa2O/q4mqvVi/Nj4F8idnM2lri9IrCETTYNNRE6i1gQoBtu++5ReN5hc8B8pNPTJ7SFQvmgl+/5dTotwggoqEQNrGVfl5zcJ7uhRMkfupEh3lObg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(82310400008)(451199021)(1800799006)(186006)(40470700004)(36840700001)(46966006)(2906002)(30864003)(66899021)(40460700003)(5660300002)(41300700001)(83380400001)(40480700001)(44832011)(8676002)(8936002)(82740400003)(356005)(81166007)(86362001)(70586007)(6666004)(7696005)(36756003)(70206006)(2616005)(426003)(16526019)(47076005)(36860700001)(478600001)(26005)(336012)(6916009)(4326008)(316002)(54906003)(1076003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:07:02.9513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f387e01-813a-4032-09b5-08db98ea49c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178
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
Cc: stylon.wang@amd.com, Hansen Dsouza <hansen.dsouza@amd.com>,
 Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com,
 Michael Strauss <michael.strauss@amd.com>, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[WHY]
Certain retimer requires workarounds in order to correctly output test patterns.

[HOW]
Add vendor-specific aux sequences to program retimer's TX and pattern generator
when specific compliance test patterns are requested by sink.
Note: SQ128 w/a in DPMF mode only works in one flip orientation currently

Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h     |   4 +
 drivers/gpu/drm/amd/display/dc/link/Makefile  |   3 +-
 .../display/dc/link/accessories/link_dp_cts.c |   3 +
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |   2 +-
 .../amd/display/dc/link/hwss/link_hwss_dio.h  |   3 +
 .../hwss/link_hwss_dio_fixed_vs_pe_retimer.c  | 200 ++++++++++++
 .../hwss/link_hwss_dio_fixed_vs_pe_retimer.h  |  37 +++
 .../display/dc/link/hwss/link_hwss_hpo_dp.c   |  22 +-
 .../display/dc/link/hwss/link_hwss_hpo_dp.h   |  28 +-
 .../link_hwss_hpo_fixed_vs_pe_retimer_dp.c    | 229 +++++++++++++
 .../link_hwss_hpo_fixed_vs_pe_retimer_dp.h    |  33 ++
 .../drm/amd/display/dc/link/link_factory.c    |   1 +
 .../amd/display/dc/link/protocols/link_ddc.c  |  82 +++++
 .../amd/display/dc/link/protocols/link_ddc.h  |  14 +
 .../link_dp_training_fixed_vs_pe_retimer.c    | 305 +++++-------------
 17 files changed, 738 insertions(+), 237 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 7561fe748c72..853e5b99dd62 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -45,6 +45,8 @@
 #include "link/hwss/link_hwss_dio.h"
 #include "link/hwss/link_hwss_dpia.h"
 #include "link/hwss/link_hwss_hpo_dp.h"
+#include "link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h"
+#include "link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h"
 
 #if defined(CONFIG_DRM_AMD_DC_SI)
 #include "dce60/dce60_resource.h"
@@ -4198,11 +4200,13 @@ const struct link_hwss *get_link_hwss(const struct dc_link *link,
 		 * with an hpo encoder. Or we can return a very dummy one that doesn't
 		 * do work for all functions
 		 */
-		return get_hpo_dp_link_hwss();
+		return (requires_fixed_vs_pe_retimer_hpo_link_hwss(link) ?
+				get_hpo_fixed_vs_pe_retimer_dp_link_hwss() : get_hpo_dp_link_hwss());
 	else if (can_use_dpia_link_hwss(link, link_res))
 		return get_dpia_link_hwss();
 	else if (can_use_dio_link_hwss(link, link_res))
-		return get_dio_link_hwss();
+		return (requires_fixed_vs_pe_retimer_dio_link_hwss(link)) ?
+				get_dio_fixed_vs_pe_retimer_link_hwss() : get_dio_link_hwss();
 	else
 		return get_virtual_link_hwss();
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 44b6172da170..fc9756ea7cc5 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1498,6 +1498,7 @@ struct dc_link {
 	enum engine_id eng_id;
 
 	bool test_pattern_enabled;
+	enum dp_test_pattern current_test_pattern;
 	union compliance_test_state compliance_test_state;
 
 	void *priv;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index c07096e59201..e3e8c76c17cf 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -179,6 +179,10 @@ struct link_service {
 	int (*aux_transfer_raw)(struct ddc_service *ddc,
 			struct aux_payload *payload,
 			enum aux_return_code_type *operation_result);
+	bool (*configure_fixed_vs_pe_retimer)(
+			struct ddc_service *ddc,
+			const uint8_t *data,
+			uint32_t len);
 	bool (*aux_transfer_with_retries_no_mutex)(struct ddc_service *ddc,
 			struct aux_payload *payload);
 	bool (*is_in_aux_transaction_mode)(struct ddc_service *ddc);
diff --git a/drivers/gpu/drm/amd/display/dc/link/Makefile b/drivers/gpu/drm/amd/display/dc/link/Makefile
index a52b56e2859e..6af8a97d4a77 100644
--- a/drivers/gpu/drm/amd/display/dc/link/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/link/Makefile
@@ -42,7 +42,8 @@ AMD_DISPLAY_FILES += $(AMD_DAL_LINK_ACCESSORIES)
 ###############################################################################
 # hwss
 ###############################################################################
-LINK_HWSS = link_hwss_dio.o link_hwss_dpia.o link_hwss_hpo_dp.o
+LINK_HWSS = link_hwss_dio.o link_hwss_dpia.o link_hwss_hpo_dp.o \
+link_hwss_dio_fixed_vs_pe_retimer.o link_hwss_hpo_fixed_vs_pe_retimer_dp.o
 
 AMD_DAL_LINK_HWSS = $(addprefix $(AMDDALPATH)/dc/link/hwss/, \
 $(LINK_HWSS))
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 9fd68a11fad2..c7e1f2229afd 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -703,6 +703,7 @@ bool dp_set_test_pattern(
 
 		/* Reset Test Pattern state */
 		link->test_pattern_enabled = false;
+		link->current_test_pattern = test_pattern;
 
 		return true;
 	}
@@ -740,6 +741,7 @@ bool dp_set_test_pattern(
 		if (test_pattern != DP_TEST_PATTERN_VIDEO_MODE) {
 			/* Set Test Pattern state */
 			link->test_pattern_enabled = true;
+			link->current_test_pattern = test_pattern;
 			if (p_link_settings != NULL)
 				dpcd_set_link_settings(link,
 						p_link_settings);
@@ -938,6 +940,7 @@ bool dp_set_test_pattern(
 
 		/* Set Test Pattern state */
 		link->test_pattern_enabled = true;
+		link->current_test_pattern = test_pattern;
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
index d19a0a958fbb..1328a0ade342 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
@@ -166,7 +166,7 @@ void set_dio_dp_lane_settings(struct dc_link *link,
 	link_enc->funcs->dp_set_lane_settings(link_enc, link_settings, lane_settings);
 }
 
-static void update_dio_stream_allocation_table(struct dc_link *link,
+void update_dio_stream_allocation_table(struct dc_link *link,
 		const struct link_resource *link_res,
 		const struct link_mst_stream_allocation_table *table)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h
index 8b8a099feeb0..f4633d3cf9b9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h
@@ -55,5 +55,8 @@ void setup_dio_audio_output(struct pipe_ctx *pipe_ctx,
 		struct audio_output *audio_output, uint32_t audio_inst);
 void enable_dio_audio_packet(struct pipe_ctx *pipe_ctx);
 void disable_dio_audio_packet(struct pipe_ctx *pipe_ctx);
+void update_dio_stream_allocation_table(struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct link_mst_stream_allocation_table *table);
 
 #endif /* __LINK_HWSS_DIO_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c
new file mode 100644
index 000000000000..b659baa23147
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c
@@ -0,0 +1,200 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "link_hwss_dio.h"
+#include "link_hwss_dio_fixed_vs_pe_retimer.h"
+#include "link_enc_cfg.h"
+
+uint8_t dp_dio_fixed_vs_pe_retimer_lane_cfg_to_hw_cfg(struct dc_link *link)
+{
+	// TODO: Get USB-C cable orientation
+	if (link->cur_link_settings.lane_count == LANE_COUNT_FOUR)
+		return 0xF2;
+	else
+		return 0x12;
+}
+
+void dp_dio_fixed_vs_pe_retimer_exit_manual_automation(struct dc_link *link)
+{
+	const uint8_t dp_type = dp_dio_fixed_vs_pe_retimer_lane_cfg_to_hw_cfg(link);
+	const uint8_t vendor_lttpr_exit_manual_automation_0[4] = {0x1, 0x11, 0x0, 0x06};
+	const uint8_t vendor_lttpr_exit_manual_automation_1[4] = {0x1, 0x50, dp_type, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_2[4] = {0x1, 0x50, 0x50, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_3[4] = {0x1, 0x51, 0x50, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_4[4] = {0x1, 0x10, 0x58, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_5[4] = {0x1, 0x10, 0x59, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_6[4] = {0x1, 0x30, 0x51, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_7[4] = {0x1, 0x30, 0x52, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_8[4] = {0x1, 0x30, 0x54, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_9[4] = {0x1, 0x30, 0x55, 0x0};
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_0[0], sizeof(vendor_lttpr_exit_manual_automation_0));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_1[0], sizeof(vendor_lttpr_exit_manual_automation_1));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_2[0], sizeof(vendor_lttpr_exit_manual_automation_2));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_3[0], sizeof(vendor_lttpr_exit_manual_automation_3));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_4[0], sizeof(vendor_lttpr_exit_manual_automation_4));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_5[0], sizeof(vendor_lttpr_exit_manual_automation_5));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_6[0], sizeof(vendor_lttpr_exit_manual_automation_6));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_7[0], sizeof(vendor_lttpr_exit_manual_automation_7));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_8[0], sizeof(vendor_lttpr_exit_manual_automation_8));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_exit_manual_automation_9[0], sizeof(vendor_lttpr_exit_manual_automation_9));
+}
+
+static bool set_dio_fixed_vs_pe_retimer_dp_link_test_pattern_override(struct dc_link *link,
+		const struct link_resource *link_res, struct encoder_set_dp_phy_pattern_param *tp_params,
+		const struct link_hwss *link_hwss)
+{
+	struct encoder_set_dp_phy_pattern_param hw_tp_params = { 0 };
+	const uint8_t pltpat_custom[10] = {0x1F, 0x7C, 0xF0, 0xC1, 0x07, 0x1F, 0x7C, 0xF0, 0xC1, 0x07};
+	const uint8_t vendor_lttpr_write_data_pg0[4] = {0x1, 0x11, 0x0, 0x0};
+	const uint8_t vendor_lttpr_exit_manual_automation_0[4] = {0x1, 0x11, 0x0, 0x06};
+
+
+	if (tp_params == NULL)
+		return false;
+
+	if (link->current_test_pattern >= DP_TEST_PATTERN_SQUARE_BEGIN &&
+			link->current_test_pattern <= DP_TEST_PATTERN_SQUARE_END) {
+		// Deprogram overrides from previous test pattern
+		dp_dio_fixed_vs_pe_retimer_exit_manual_automation(link);
+	}
+
+	switch (tp_params->dp_phy_pattern) {
+	case DP_TEST_PATTERN_80BIT_CUSTOM:
+		if (tp_params->custom_pattern_size == 0 || memcmp(tp_params->custom_pattern,
+				pltpat_custom, tp_params->custom_pattern_size) != 0)
+			return false;
+		break;
+	case DP_TEST_PATTERN_D102:
+		break;
+	default:
+		if (link->current_test_pattern == DP_TEST_PATTERN_80BIT_CUSTOM ||
+				link->current_test_pattern == DP_TEST_PATTERN_D102)
+			// Deprogram overrides from previous test pattern
+			link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_exit_manual_automation_0[0],
+					sizeof(vendor_lttpr_exit_manual_automation_0));
+
+		return false;
+	}
+
+	hw_tp_params.dp_phy_pattern = tp_params->dp_phy_pattern;
+	hw_tp_params.dp_panel_mode = tp_params->dp_panel_mode;
+
+	if (link_hwss->ext.set_dp_link_test_pattern)
+		link_hwss->ext.set_dp_link_test_pattern(link, link_res, &hw_tp_params);
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg0[0], sizeof(vendor_lttpr_write_data_pg0));
+
+	return true;
+}
+
+static void set_dio_fixed_vs_pe_retimer_dp_link_test_pattern(struct dc_link *link,
+		const struct link_resource *link_res,
+		struct encoder_set_dp_phy_pattern_param *tp_params)
+{
+	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
+
+	if (!set_dio_fixed_vs_pe_retimer_dp_link_test_pattern_override(
+			link, link_res, tp_params, get_dio_link_hwss())) {
+		link_enc->funcs->dp_set_phy_pattern(link_enc, tp_params);
+	}
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+}
+
+void enable_dio_fixed_vs_pe_retimer_program_4lane_output(struct dc_link *link)
+{
+	const uint8_t vendor_lttpr_write_data_4lane_1[4] = {0x1, 0x6E, 0xF2, 0x19};
+	const uint8_t vendor_lttpr_write_data_4lane_2[4] = {0x1, 0x6B, 0xF2, 0x01};
+	const uint8_t vendor_lttpr_write_data_4lane_3[4] = {0x1, 0x6D, 0xF2, 0x18};
+	const uint8_t vendor_lttpr_write_data_4lane_4[4] = {0x1, 0x6C, 0xF2, 0x03};
+	const uint8_t vendor_lttpr_write_data_4lane_5[4] = {0x1, 0x03, 0xF3, 0x06};
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_4lane_1[0], sizeof(vendor_lttpr_write_data_4lane_1));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_4lane_2[0], sizeof(vendor_lttpr_write_data_4lane_2));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_4lane_3[0], sizeof(vendor_lttpr_write_data_4lane_3));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_4lane_4[0], sizeof(vendor_lttpr_write_data_4lane_4));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_4lane_5[0], sizeof(vendor_lttpr_write_data_4lane_5));
+}
+
+static void enable_dio_fixed_vs_pe_retimer_dp_link_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal,
+		enum clock_source_id clock_source,
+		const struct dc_link_settings *link_settings)
+{
+	if (link_settings->lane_count == LANE_COUNT_FOUR)
+		enable_dio_fixed_vs_pe_retimer_program_4lane_output(link);
+
+	enable_dio_dp_link_output(link, link_res, signal, clock_source, link_settings);
+}
+
+static const struct link_hwss dio_fixed_vs_pe_retimer_link_hwss = {
+	.setup_stream_encoder = setup_dio_stream_encoder,
+	.reset_stream_encoder = reset_dio_stream_encoder,
+	.setup_stream_attribute = setup_dio_stream_attribute,
+	.disable_link_output = disable_dio_link_output,
+	.setup_audio_output = setup_dio_audio_output,
+	.enable_audio_packet = enable_dio_audio_packet,
+	.disable_audio_packet = disable_dio_audio_packet,
+	.ext = {
+		.set_throttled_vcp_size = set_dio_throttled_vcp_size,
+		.enable_dp_link_output = enable_dio_fixed_vs_pe_retimer_dp_link_output,
+		.set_dp_link_test_pattern = set_dio_fixed_vs_pe_retimer_dp_link_test_pattern,
+		.set_dp_lane_settings = set_dio_dp_lane_settings,
+		.update_stream_allocation_table = update_dio_stream_allocation_table,
+	},
+};
+
+bool requires_fixed_vs_pe_retimer_dio_link_hwss(const struct dc_link *link)
+{
+	if (!(link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN))
+		return false;
+
+	if (!link->dpcd_caps.lttpr_caps.main_link_channel_coding.bits.DP_128b_132b_SUPPORTED)
+		return false;
+
+	return true;
+}
+
+const struct link_hwss *get_dio_fixed_vs_pe_retimer_link_hwss(void)
+{
+	return &dio_fixed_vs_pe_retimer_link_hwss;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h
new file mode 100644
index 000000000000..9ac08a332540
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef __LINK_HWSS_DIO_FIXED_VS_PE_RETIMER_H__
+#define __LINK_HWSS_DIO_FIXED_VS_PE_RETIMER_H__
+
+#include "link.h"
+
+uint32_t dp_dio_fixed_vs_pe_retimer_get_lttpr_write_address(struct dc_link *link);
+uint8_t dp_dio_fixed_vs_pe_retimer_lane_cfg_to_hw_cfg(struct dc_link *link);
+void dp_dio_fixed_vs_pe_retimer_exit_manual_automation(struct dc_link *link);
+void enable_dio_fixed_vs_pe_retimer_program_4lane_output(struct dc_link *link);
+bool requires_fixed_vs_pe_retimer_dio_link_hwss(const struct dc_link *link);
+const struct link_hwss *get_dio_fixed_vs_pe_retimer_link_hwss(void);
+
+#endif /* __LINK_HWSS_DIO_FIXED_VS_PE_RETIMER_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
index dc1cb5478e08..e1257404357b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
@@ -28,7 +28,7 @@
 #include "dccg.h"
 #include "clk_mgr.h"
 
-static void set_hpo_dp_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
+void set_hpo_dp_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
 		struct fixed31_32 throttled_vcp_size)
 {
 	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder =
@@ -41,7 +41,7 @@ static void set_hpo_dp_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
 			throttled_vcp_size);
 }
 
-static void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
+void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
 		const struct dc_link_settings *link_settings,
 		struct fixed31_32 throttled_vcp_size)
 {
@@ -69,7 +69,7 @@ static void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
 			hblank_min_symbol_width);
 }
 
-static void setup_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
+void setup_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
 {
 	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
 	struct hpo_dp_link_encoder *link_enc = pipe_ctx->link_res.hpo_dp_link_enc;
@@ -78,14 +78,14 @@ static void setup_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
 	stream_enc->funcs->map_stream_to_link(stream_enc, stream_enc->inst, link_enc->inst);
 }
 
-static void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
+void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
 {
 	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
 
 	stream_enc->funcs->disable(stream_enc);
 }
 
-static void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx)
+void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx)
 {
 	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
@@ -102,7 +102,7 @@ static void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx)
 			DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
 }
 
-static void enable_hpo_dp_link_output(struct dc_link *link,
+void enable_hpo_dp_link_output(struct dc_link *link,
 		const struct link_resource *link_res,
 		enum signal_type signal,
 		enum clock_source_id clock_source,
@@ -120,7 +120,7 @@ static void enable_hpo_dp_link_output(struct dc_link *link,
 			link->link_enc->hpd_source);
 }
 
-static void disable_hpo_dp_link_output(struct dc_link *link,
+void disable_hpo_dp_link_output(struct dc_link *link,
 		const struct link_resource *link_res,
 		enum signal_type signal)
 {
@@ -154,7 +154,7 @@ static void set_hpo_dp_lane_settings(struct dc_link *link,
 			lane_settings[0].FFE_PRESET.raw);
 }
 
-static void update_hpo_dp_stream_allocation_table(struct dc_link *link,
+void update_hpo_dp_stream_allocation_table(struct dc_link *link,
 		const struct link_resource *link_res,
 		const struct link_mst_stream_allocation_table *table)
 {
@@ -163,7 +163,7 @@ static void update_hpo_dp_stream_allocation_table(struct dc_link *link,
 			table);
 }
 
-static void setup_hpo_dp_audio_output(struct pipe_ctx *pipe_ctx,
+void setup_hpo_dp_audio_output(struct pipe_ctx *pipe_ctx,
 		struct audio_output *audio_output, uint32_t audio_inst)
 {
 	pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_setup(
@@ -172,13 +172,13 @@ static void setup_hpo_dp_audio_output(struct pipe_ctx *pipe_ctx,
 			&pipe_ctx->stream->audio_info);
 }
 
-static void enable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx)
+void enable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx)
 {
 	pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_enable(
 			pipe_ctx->stream_res.hpo_dp_stream_enc);
 }
 
-static void disable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx)
+void disable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx)
 {
 	if (pipe_ctx->stream_res.audio)
 		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_disable(
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.h b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.h
index 3cbb94b41a23..1d3ed8ca83b5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.h
@@ -28,9 +28,35 @@
 #include "link_hwss.h"
 #include "link.h"
 
+void set_hpo_dp_throttled_vcp_size(struct pipe_ctx *pipe_ctx,
+		struct fixed31_32 throttled_vcp_size);
+void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
+		const struct dc_link_settings *link_settings,
+		struct fixed31_32 throttled_vcp_size);
+void set_hpo_dp_hblank_min_symbol_width(struct pipe_ctx *pipe_ctx,
+		const struct dc_link_settings *link_settings,
+		struct fixed31_32 throttled_vcp_size);
+void setup_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx);
+void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx);
+void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx);
+void enable_hpo_dp_link_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal,
+		enum clock_source_id clock_source,
+		const struct dc_link_settings *link_settings);
+void disable_hpo_dp_link_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal);
+void update_hpo_dp_stream_allocation_table(struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct link_mst_stream_allocation_table *table);
+void setup_hpo_dp_audio_output(struct pipe_ctx *pipe_ctx,
+		struct audio_output *audio_output, uint32_t audio_inst);
+void enable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx);
+void disable_hpo_dp_audio_packet(struct pipe_ctx *pipe_ctx);
+const struct link_hwss *get_hpo_dp_link_hwss(void);
 bool can_use_hpo_dp_link_hwss(const struct dc_link *link,
 		const struct link_resource *link_res);
-const struct link_hwss *get_hpo_dp_link_hwss(void);
 
 
 #endif /* __LINK_HWSS_HPO_DP_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
new file mode 100644
index 000000000000..b621b97711b6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
@@ -0,0 +1,229 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "link_hwss_hpo_dp.h"
+#include "link_hwss_hpo_fixed_vs_pe_retimer_dp.h"
+#include "link_hwss_dio_fixed_vs_pe_retimer.h"
+
+static void dp_hpo_fixed_vs_pe_retimer_set_tx_ffe(struct dc_link *link,
+		const struct dc_lane_settings *hw_lane_settings)
+{
+	const uint8_t vendor_ffe_preset_table[16] = {
+											0x01, 0x41, 0x61, 0x81,
+											0xB1, 0x05, 0x35, 0x65,
+											0x85, 0xA5, 0x09, 0x39,
+											0x59, 0x89, 0x0F, 0x24};
+
+	const uint8_t ffe_mask[4] = {
+			(hw_lane_settings[0].FFE_PRESET.settings.no_deemphasis != 0 ? 0x0F : 0xFF)
+				& (hw_lane_settings[0].FFE_PRESET.settings.no_preshoot != 0 ? 0xF1 : 0xFF),
+			(hw_lane_settings[1].FFE_PRESET.settings.no_deemphasis != 0 ? 0x0F : 0xFF)
+				& (hw_lane_settings[1].FFE_PRESET.settings.no_preshoot != 0 ? 0xF1 : 0xFF),
+			(hw_lane_settings[2].FFE_PRESET.settings.no_deemphasis != 0 ? 0x0F : 0xFF)
+				& (hw_lane_settings[2].FFE_PRESET.settings.no_preshoot != 0 ? 0xF1 : 0xFF),
+			(hw_lane_settings[3].FFE_PRESET.settings.no_deemphasis != 0 ? 0x0F : 0xFF)
+				& (hw_lane_settings[3].FFE_PRESET.settings.no_preshoot != 0 ? 0xF1 : 0xFF)};
+
+	const uint8_t ffe_cfg[4] = {
+			vendor_ffe_preset_table[hw_lane_settings[0].FFE_PRESET.settings.level] & ffe_mask[0],
+			vendor_ffe_preset_table[hw_lane_settings[1].FFE_PRESET.settings.level] & ffe_mask[1],
+			vendor_ffe_preset_table[hw_lane_settings[2].FFE_PRESET.settings.level] & ffe_mask[2],
+			vendor_ffe_preset_table[hw_lane_settings[3].FFE_PRESET.settings.level] & ffe_mask[3]};
+
+	const uint8_t dp_type = dp_dio_fixed_vs_pe_retimer_lane_cfg_to_hw_cfg(link);
+
+	const uint8_t vendor_lttpr_write_data_ffe1[4] = {0x01, 0x50, dp_type, 0x0F};
+	const uint8_t vendor_lttpr_write_data_ffe2[4] = {0x01, 0x55, dp_type, ffe_cfg[0]};
+	const uint8_t vendor_lttpr_write_data_ffe3[4] = {0x01, 0x56, dp_type, ffe_cfg[1]};
+	const uint8_t vendor_lttpr_write_data_ffe4[4] = {0x01, 0x57, dp_type, ffe_cfg[2]};
+	const uint8_t vendor_lttpr_write_data_ffe5[4] = {0x01, 0x58, dp_type, ffe_cfg[3]};
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_ffe1[0], sizeof(vendor_lttpr_write_data_ffe1));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_ffe2[0], sizeof(vendor_lttpr_write_data_ffe2));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_ffe3[0], sizeof(vendor_lttpr_write_data_ffe3));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_ffe4[0], sizeof(vendor_lttpr_write_data_ffe4));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_ffe5[0], sizeof(vendor_lttpr_write_data_ffe5));
+}
+
+static void dp_hpo_fixed_vs_pe_retimer_program_override_test_pattern(struct dc_link *link,
+		struct encoder_set_dp_phy_pattern_param *tp_params)
+{
+	const uint8_t vendor_lttpr_write_data_pg0[4] = {0x1, 0x11, 0x0, 0x0};
+	const uint8_t vendor_lttpr_write_data_pg1[4] = {0x1, 0x50, 0x50, 0x0};
+	const uint8_t vendor_lttpr_write_data_pg2[4] = {0x1, 0x51, 0x50, 0x0};
+	const uint8_t vendor_lttpr_write_data_pg3[4]  = {0x1, 0x10, 0x58, 0x21};
+	const uint8_t vendor_lttpr_write_data_pg4[4]  = {0x1, 0x10, 0x59, 0x21};
+	const uint8_t vendor_lttpr_write_data_pg5[4] = {0x1, 0x1C, 0x58, 0x4F};
+	const uint8_t vendor_lttpr_write_data_pg6[4] = {0x1, 0x1C, 0x59, 0x4F};
+	const uint8_t vendor_lttpr_write_data_pg7[4]  = {0x1, 0x30, 0x51, 0x20};
+	const uint8_t vendor_lttpr_write_data_pg8[4]  = {0x1, 0x30, 0x52, 0x20};
+	const uint8_t vendor_lttpr_write_data_pg9[4]  = {0x1, 0x30, 0x54, 0x20};
+	const uint8_t vendor_lttpr_write_data_pg10[4] = {0x1, 0x30, 0x55, 0x20};
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg0[0], sizeof(vendor_lttpr_write_data_pg0));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg1[0], sizeof(vendor_lttpr_write_data_pg1));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg2[0], sizeof(vendor_lttpr_write_data_pg2));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg3[0], sizeof(vendor_lttpr_write_data_pg3));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg4[0], sizeof(vendor_lttpr_write_data_pg4));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg5[0], sizeof(vendor_lttpr_write_data_pg5));
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg6[0], sizeof(vendor_lttpr_write_data_pg6));
+
+	if (link->cur_link_settings.lane_count == LANE_COUNT_FOUR)
+		link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_pg7[0], sizeof(vendor_lttpr_write_data_pg7));
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg8[0], sizeof(vendor_lttpr_write_data_pg8));
+
+	if (link->cur_link_settings.lane_count == LANE_COUNT_FOUR)
+		link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_pg9[0], sizeof(vendor_lttpr_write_data_pg9));
+
+	link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pg10[0], sizeof(vendor_lttpr_write_data_pg10));
+}
+
+static bool dp_hpo_fixed_vs_pe_retimer_set_override_test_pattern(struct dc_link *link,
+		const struct link_resource *link_res, struct encoder_set_dp_phy_pattern_param *tp_params,
+		const struct link_hwss *link_hwss)
+{
+	struct encoder_set_dp_phy_pattern_param hw_tp_params = { 0 };
+	const uint8_t vendor_lttpr_exit_manual_automation_0[4] = {0x1, 0x11, 0x0, 0x06};
+
+	if (tp_params == NULL)
+		return false;
+
+	if (tp_params->dp_phy_pattern < DP_TEST_PATTERN_SQUARE_BEGIN ||
+			tp_params->dp_phy_pattern > DP_TEST_PATTERN_SQUARE_END) {
+		// Deprogram overrides from previously set square wave override
+		if (link->current_test_pattern == DP_TEST_PATTERN_80BIT_CUSTOM ||
+				link->current_test_pattern == DP_TEST_PATTERN_D102)
+			link->dc->link_srv->configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_exit_manual_automation_0[0],
+					sizeof(vendor_lttpr_exit_manual_automation_0));
+		else
+			dp_dio_fixed_vs_pe_retimer_exit_manual_automation(link);
+
+		return false;
+	}
+
+	hw_tp_params.dp_phy_pattern = DP_TEST_PATTERN_PRBS31;
+	hw_tp_params.dp_panel_mode = tp_params->dp_panel_mode;
+
+	if (link_hwss->ext.set_dp_link_test_pattern)
+		link_hwss->ext.set_dp_link_test_pattern(link, link_res, &hw_tp_params);
+
+	dp_hpo_fixed_vs_pe_retimer_program_override_test_pattern(link, tp_params);
+
+	dp_hpo_fixed_vs_pe_retimer_set_tx_ffe(link, &link->cur_lane_setting[0]);
+
+	return true;
+}
+
+static void set_hpo_fixed_vs_pe_retimer_dp_link_test_pattern(struct dc_link *link,
+		const struct link_resource *link_res,
+		struct encoder_set_dp_phy_pattern_param *tp_params)
+{
+	if (!dp_hpo_fixed_vs_pe_retimer_set_override_test_pattern(
+			link, link_res, tp_params, get_hpo_dp_link_hwss())) {
+		link_res->hpo_dp_link_enc->funcs->set_link_test_pattern(
+				link_res->hpo_dp_link_enc, tp_params);
+	}
+	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+}
+
+static void set_hpo_fixed_vs_pe_retimer_dp_lane_settings(struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct dc_link_settings *link_settings,
+		const struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX])
+{
+	link_res->hpo_dp_link_enc->funcs->set_ffe(
+			link_res->hpo_dp_link_enc,
+			link_settings,
+			lane_settings[0].FFE_PRESET.raw);
+
+	// FFE is programmed when retimer is programmed for SQ128, but explicit
+	// programming needed here as well in case FFE-only update is requested
+	if (link->current_test_pattern >= DP_TEST_PATTERN_SQUARE_BEGIN &&
+			link->current_test_pattern <= DP_TEST_PATTERN_SQUARE_END)
+		dp_hpo_fixed_vs_pe_retimer_set_tx_ffe(link, &lane_settings[0]);
+}
+
+static void enable_hpo_fixed_vs_pe_retimer_dp_link_output(struct dc_link *link,
+		const struct link_resource *link_res,
+		enum signal_type signal,
+		enum clock_source_id clock_source,
+		const struct dc_link_settings *link_settings)
+{
+	if (link_settings->lane_count == LANE_COUNT_FOUR)
+		enable_dio_fixed_vs_pe_retimer_program_4lane_output(link);
+
+	enable_hpo_dp_link_output(link, link_res, signal, clock_source, link_settings);
+}
+
+static const struct link_hwss hpo_fixed_vs_pe_retimer_dp_link_hwss = {
+	.setup_stream_encoder = setup_hpo_dp_stream_encoder,
+	.reset_stream_encoder = reset_hpo_dp_stream_encoder,
+	.setup_stream_attribute = setup_hpo_dp_stream_attribute,
+	.disable_link_output = disable_hpo_dp_link_output,
+	.setup_audio_output = setup_hpo_dp_audio_output,
+	.enable_audio_packet = enable_hpo_dp_audio_packet,
+	.disable_audio_packet = disable_hpo_dp_audio_packet,
+	.ext = {
+		.set_throttled_vcp_size = set_hpo_dp_throttled_vcp_size,
+		.set_hblank_min_symbol_width = set_hpo_dp_hblank_min_symbol_width,
+		.enable_dp_link_output = enable_hpo_fixed_vs_pe_retimer_dp_link_output,
+		.set_dp_link_test_pattern  = set_hpo_fixed_vs_pe_retimer_dp_link_test_pattern,
+		.set_dp_lane_settings = set_hpo_fixed_vs_pe_retimer_dp_lane_settings,
+		.update_stream_allocation_table = update_hpo_dp_stream_allocation_table,
+	},
+};
+
+bool requires_fixed_vs_pe_retimer_hpo_link_hwss(const struct dc_link *link)
+{
+	if (!(link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN))
+		return false;
+
+	if (!link->dpcd_caps.lttpr_caps.main_link_channel_coding.bits.DP_128b_132b_SUPPORTED)
+		return false;
+
+	return true;
+}
+
+const struct link_hwss *get_hpo_fixed_vs_pe_retimer_dp_link_hwss(void)
+{
+	return &hpo_fixed_vs_pe_retimer_dp_link_hwss;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h
new file mode 100644
index 000000000000..82301187bc7c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef __LINK_HWSS_HPO_FIXED_VS_PE_RETIMER_DP_H__
+#define __LINK_HWSS_HPO_FIXED_VS_PE_RETIMER_DP_H__
+
+#include "link.h"
+
+bool requires_fixed_vs_pe_retimer_hpo_link_hwss(const struct dc_link *link);
+const struct link_hwss *get_hpo_fixed_vs_pe_retimer_dp_link_hwss(void);
+
+#endif /* __LINK_HWSS_HPO_FIXED_VS_PE_RETIMER_DP_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index bb063e1491a2..195ca9e52eda 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -132,6 +132,7 @@ static void construct_link_service_ddc(struct link_service *link_srv)
 	link_srv->destroy_ddc_service = link_destroy_ddc_service;
 	link_srv->query_ddc_data = link_query_ddc_data;
 	link_srv->aux_transfer_raw = link_aux_transfer_raw;
+	link_srv->configure_fixed_vs_pe_retimer = link_configure_fixed_vs_pe_retimer;
 	link_srv->aux_transfer_with_retries_no_mutex =
 			link_aux_transfer_with_retries_no_mutex;
 	link_srv->is_in_aux_transaction_mode = link_is_in_aux_transaction_mode;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
index 0f19c07011b5..ecfd83299e75 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
@@ -412,6 +412,88 @@ int link_aux_transfer_raw(struct ddc_service *ddc,
 	}
 }
 
+uint32_t link_get_fixed_vs_pe_retimer_write_address(struct dc_link *link)
+{
+	uint32_t vendor_lttpr_write_address = 0xF004F;
+	uint8_t offset;
+
+	switch (link->dpcd_caps.lttpr_caps.phy_repeater_cnt) {
+	case 0x80: // 1 lttpr repeater
+		offset =  1;
+		break;
+	case 0x40: // 2 lttpr repeaters
+		offset = 2;
+		break;
+	case 0x20: // 3 lttpr repeaters
+		offset = 3;
+		break;
+	case 0x10: // 4 lttpr repeaters
+		offset = 4;
+		break;
+	case 0x08: // 5 lttpr repeaters
+		offset = 5;
+		break;
+	case 0x04: // 6 lttpr repeaters
+		offset = 6;
+		break;
+	case 0x02: // 7 lttpr repeaters
+		offset = 7;
+		break;
+	case 0x01: // 8 lttpr repeaters
+		offset = 8;
+		break;
+	default:
+		offset = 0xFF;
+	}
+
+	if (offset != 0xFF) {
+		vendor_lttpr_write_address +=
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+	}
+	return vendor_lttpr_write_address;
+}
+
+uint32_t link_get_fixed_vs_pe_retimer_read_address(struct dc_link *link)
+{
+	return link_get_fixed_vs_pe_retimer_write_address(link) + 4;
+}
+
+bool link_configure_fixed_vs_pe_retimer(struct ddc_service *ddc, const uint8_t *data, uint32_t length)
+{
+	struct aux_payload write_payload = {
+		.i2c_over_aux = false,
+		.write = true,
+		.address = link_get_fixed_vs_pe_retimer_write_address(ddc->link),
+		.length = length,
+		.data = (uint8_t *) data,
+		.reply = NULL,
+		.mot = I2C_MOT_UNDEF,
+		.write_status_update = false,
+		.defer_delay = 0,
+	};
+
+	return link_aux_transfer_with_retries_no_mutex(ddc,
+			&write_payload);
+}
+
+bool link_query_fixed_vs_pe_retimer(struct ddc_service *ddc, uint8_t *data, uint32_t length)
+{
+	struct aux_payload read_payload = {
+		.i2c_over_aux = false,
+		.write = false,
+		.address = link_get_fixed_vs_pe_retimer_read_address(ddc->link),
+		.length = length,
+		.data = data,
+		.reply = NULL,
+		.mot = I2C_MOT_UNDEF,
+		.write_status_update = false,
+		.defer_delay = 0,
+	};
+
+	return link_aux_transfer_with_retries_no_mutex(ddc,
+			&read_payload);
+}
+
 bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
 		struct aux_payload *payload)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
index 860ef15d7f1b..a3e25e55bed6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.h
@@ -72,6 +72,20 @@ bool link_query_ddc_data(
 bool link_aux_transfer_with_retries_no_mutex(struct ddc_service *ddc,
 		struct aux_payload *payload);
 
+bool link_configure_fixed_vs_pe_retimer(
+		struct ddc_service *ddc,
+		const uint8_t *data,
+		uint32_t length);
+
+bool link_query_fixed_vs_pe_retimer(
+		struct ddc_service *ddc,
+		uint8_t *data,
+		uint32_t length);
+
+uint32_t link_get_fixed_vs_pe_retimer_read_address(struct dc_link *link);
+uint32_t link_get_fixed_vs_pe_retimer_write_address(struct dc_link *link);
+
+
 void write_scdc_data(
 		struct ddc_service *ddc_service,
 		uint32_t pix_clk,
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
index ca0543e62917..fd8f6f198146 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
@@ -36,6 +36,7 @@
 #include "link_dpcd.h"
 #include "link_dp_phy.h"
 #include "link_dp_capability.h"
+#include "link_ddc.h"
 
 #define DC_LOGGER \
 	link->ctx->logger
@@ -46,42 +47,20 @@ void dp_fixed_vs_pe_read_lane_adjust(
 {
 	const uint8_t vendor_lttpr_write_data_vs[3] = {0x0, 0x53, 0x63};
 	const uint8_t vendor_lttpr_write_data_pe[3] = {0x0, 0x54, 0x63};
-	const uint8_t offset = dp_parse_lttpr_repeater_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-	uint32_t vendor_lttpr_write_address = 0xF004F;
-	uint32_t vendor_lttpr_read_address = 0xF0053;
 	uint8_t dprx_vs = 0;
 	uint8_t dprx_pe = 0;
 	uint8_t lane;
 
-	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-		vendor_lttpr_read_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-	}
-
 	/* W/A to read lane settings requested by DPRX */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_vs[0],
-			sizeof(vendor_lttpr_write_data_vs));
-	core_link_read_dpcd(
-			link,
-			vendor_lttpr_read_address,
-			&dprx_vs,
-			1);
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_pe[0],
-			sizeof(vendor_lttpr_write_data_pe));
-	core_link_read_dpcd(
-			link,
-			vendor_lttpr_read_address,
-			&dprx_pe,
-			1);
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+
+	link_query_fixed_vs_pe_retimer(link->ddc, &dprx_vs, 1);
+
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
+
+	link_query_fixed_vs_pe_retimer(link->ddc, &dprx_pe, 1);
 
 	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
 		dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET  = (dprx_vs >> (2 * lane)) & 0x3;
@@ -95,19 +74,11 @@ void dp_fixed_vs_pe_set_retimer_lane_settings(
 	const union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX],
 	uint8_t lane_count)
 {
-	const uint8_t offset = dp_parse_lttpr_repeater_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
 	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
-	uint32_t vendor_lttpr_write_address = 0xF004F;
 	uint8_t vendor_lttpr_write_data_vs[4] = {0x1, 0x51, 0x63, 0x0};
 	uint8_t vendor_lttpr_write_data_pe[4] = {0x1, 0x52, 0x63, 0x0};
 	uint8_t lane = 0;
 
-	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-	}
-
 	for (lane = 0; lane < lane_count; lane++) {
 		vendor_lttpr_write_data_vs[3] |=
 				dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
@@ -116,21 +87,14 @@ void dp_fixed_vs_pe_set_retimer_lane_settings(
 	}
 
 	/* Force LTTPR to output desired VS and PE */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_reset[0],
-			sizeof(vendor_lttpr_write_data_reset));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_vs[0],
-			sizeof(vendor_lttpr_write_data_vs));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_pe[0],
-			sizeof(vendor_lttpr_write_data_pe));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_reset[0], sizeof(vendor_lttpr_write_data_reset));
+
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 }
 
 static enum link_training_result perform_fixed_vs_pe_nontransparent_training_sequence(
@@ -241,7 +205,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 	const uint8_t vendor_lttpr_write_data_4lane_3[4] = {0x1, 0x6D, 0xF2, 0x18};
 	const uint8_t vendor_lttpr_write_data_4lane_4[4] = {0x1, 0x6C, 0xF2, 0x03};
 	const uint8_t vendor_lttpr_write_data_4lane_5[4] = {0x1, 0x03, 0xF3, 0x06};
-	uint32_t vendor_lttpr_write_address = 0xF004F;
 	enum link_training_result status = LINK_TRAINING_SUCCESS;
 	uint8_t lane = 0;
 	union down_spread_ctrl downspread = {0};
@@ -259,8 +222,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 	}
 
 	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
 		if (offset == 2) {
 			pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa;
 
@@ -271,28 +232,17 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 	}
 
 	/* Vendor specific: Reset lane settings */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_reset[0],
-			sizeof(vendor_lttpr_write_data_reset));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_vs[0],
-			sizeof(vendor_lttpr_write_data_vs));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_pe[0],
-			sizeof(vendor_lttpr_write_data_pe));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_reset[0], sizeof(vendor_lttpr_write_data_reset));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 	/* Vendor specific: Enable intercept */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_intercept_en[0],
-			sizeof(vendor_lttpr_write_data_intercept_en));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_intercept_en[0], sizeof(vendor_lttpr_write_data_intercept_en));
+
 
 	/* 1. set link rate, lane count and spread. */
 
@@ -344,31 +294,16 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 		lt_settings->link_settings.link_spread);
 
 	if (lt_settings->link_settings.lane_count == LANE_COUNT_FOUR) {
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_1[0],
-				sizeof(vendor_lttpr_write_data_4lane_1));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_2[0],
-				sizeof(vendor_lttpr_write_data_4lane_2));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_3[0],
-				sizeof(vendor_lttpr_write_data_4lane_3));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_4[0],
-				sizeof(vendor_lttpr_write_data_4lane_4));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_5[0],
-				sizeof(vendor_lttpr_write_data_4lane_5));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_1[0], sizeof(vendor_lttpr_write_data_4lane_1));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_2[0], sizeof(vendor_lttpr_write_data_4lane_2));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_3[0], sizeof(vendor_lttpr_write_data_4lane_3));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_4[0], sizeof(vendor_lttpr_write_data_4lane_4));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_5[0], sizeof(vendor_lttpr_write_data_4lane_5));
 	}
 
 	/* 2. Perform link training */
@@ -383,7 +318,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
 		union lane_align_status_updated dpcd_lane_status_updated;
 		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-		enum dc_status dpcd_status = DC_OK;
 		uint8_t i = 0;
 
 		retries_cr = 0;
@@ -418,18 +352,12 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 				for (i = 0; i < max_vendor_dpcd_retries; i++) {
 					if (pre_disable_intercept_delay_ms != 0)
 						msleep(pre_disable_intercept_delay_ms);
-					dpcd_status = core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
+					if (link_configure_fixed_vs_pe_retimer(link->ddc,
 							&vendor_lttpr_write_data_intercept_dis[0],
-							sizeof(vendor_lttpr_write_data_intercept_dis));
-
-					if (dpcd_status == DC_OK)
+							sizeof(vendor_lttpr_write_data_intercept_dis)))
 						break;
 
-					core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
+					link_configure_fixed_vs_pe_retimer(link->ddc,
 							&vendor_lttpr_write_data_intercept_en[0],
 							sizeof(vendor_lttpr_write_data_intercept_en));
 				}
@@ -445,16 +373,10 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 				}
 
 				/* Vendor specific: Update VS and PE to DPRX requested value */
-				core_link_write_dpcd(
-						link,
-						vendor_lttpr_write_address,
-						&vendor_lttpr_write_data_vs[0],
-						sizeof(vendor_lttpr_write_data_vs));
-				core_link_write_dpcd(
-						link,
-						vendor_lttpr_write_address,
-						&vendor_lttpr_write_data_pe[0],
-						sizeof(vendor_lttpr_write_data_pe));
+				link_configure_fixed_vs_pe_retimer(link->ddc,
+						&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+				link_configure_fixed_vs_pe_retimer(link->ddc,
+						&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 				dpcd_set_lane_settings(
 						link,
@@ -550,16 +472,10 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence_legacy(
 			}
 
 			/* Vendor specific: Update VS and PE to DPRX requested value */
-			core_link_write_dpcd(
-					link,
-					vendor_lttpr_write_address,
-					&vendor_lttpr_write_data_vs[0],
-					sizeof(vendor_lttpr_write_data_vs));
-			core_link_write_dpcd(
-					link,
-					vendor_lttpr_write_address,
-					&vendor_lttpr_write_data_pe[0],
-					sizeof(vendor_lttpr_write_data_pe));
+			link_configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+			link_configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 			/* 2. update DPCD*/
 			if (!retries_ch_eq)
@@ -636,7 +552,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	const uint8_t vendor_lttpr_write_data_4lane_3[4] = {0x1, 0x6D, 0xF2, 0x18};
 	const uint8_t vendor_lttpr_write_data_4lane_4[4] = {0x1, 0x6C, 0xF2, 0x03};
 	const uint8_t vendor_lttpr_write_data_4lane_5[4] = {0x1, 0x03, 0xF3, 0x06};
-	uint32_t vendor_lttpr_write_address = 0xF004F;
 	enum link_training_result status = LINK_TRAINING_SUCCESS;
 	uint8_t lane = 0;
 	union down_spread_ctrl downspread = {0};
@@ -654,8 +569,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	}
 
 	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
 		if (offset == 2) {
 			pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa;
 
@@ -666,28 +579,16 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	}
 
 	/* Vendor specific: Reset lane settings */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_reset[0],
-			sizeof(vendor_lttpr_write_data_reset));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_vs[0],
-			sizeof(vendor_lttpr_write_data_vs));
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_pe[0],
-			sizeof(vendor_lttpr_write_data_pe));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_reset[0], sizeof(vendor_lttpr_write_data_reset));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 	/* Vendor specific: Enable intercept */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_intercept_en[0],
-			sizeof(vendor_lttpr_write_data_intercept_en));
+	link_configure_fixed_vs_pe_retimer(link->ddc,
+			&vendor_lttpr_write_data_intercept_en[0], sizeof(vendor_lttpr_write_data_intercept_en));
 
 	/* 1. set link rate, lane count and spread. */
 
@@ -739,31 +640,16 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 		lt_settings->link_settings.link_spread);
 
 	if (lt_settings->link_settings.lane_count == LANE_COUNT_FOUR) {
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_1[0],
-				sizeof(vendor_lttpr_write_data_4lane_1));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_2[0],
-				sizeof(vendor_lttpr_write_data_4lane_2));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_3[0],
-				sizeof(vendor_lttpr_write_data_4lane_3));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_4[0],
-				sizeof(vendor_lttpr_write_data_4lane_4));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
-				&vendor_lttpr_write_data_4lane_5[0],
-				sizeof(vendor_lttpr_write_data_4lane_5));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_1[0], sizeof(vendor_lttpr_write_data_4lane_1));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_2[0], sizeof(vendor_lttpr_write_data_4lane_2));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_3[0], sizeof(vendor_lttpr_write_data_4lane_3));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_4[0], sizeof(vendor_lttpr_write_data_4lane_4));
+		link_configure_fixed_vs_pe_retimer(link->ddc,
+				&vendor_lttpr_write_data_4lane_5[0], sizeof(vendor_lttpr_write_data_4lane_5));
 	}
 
 	/* 2. Perform link training */
@@ -778,7 +664,6 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
 		union lane_align_status_updated dpcd_lane_status_updated;
 		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-		enum dc_status dpcd_status = DC_OK;
 		uint8_t i = 0;
 
 		retries_cr = 0;
@@ -813,18 +698,12 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 				for (i = 0; i < max_vendor_dpcd_retries; i++) {
 					if (pre_disable_intercept_delay_ms != 0)
 						msleep(pre_disable_intercept_delay_ms);
-					dpcd_status = core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
+					if (link_configure_fixed_vs_pe_retimer(link->ddc,
 							&vendor_lttpr_write_data_intercept_dis[0],
-							sizeof(vendor_lttpr_write_data_intercept_dis));
-
-					if (dpcd_status == DC_OK)
+							sizeof(vendor_lttpr_write_data_intercept_dis)))
 						break;
 
-					core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
+					link_configure_fixed_vs_pe_retimer(link->ddc,
 							&vendor_lttpr_write_data_intercept_en[0],
 							sizeof(vendor_lttpr_write_data_intercept_en));
 				}
@@ -840,16 +719,10 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 				}
 
 				/* Vendor specific: Update VS and PE to DPRX requested value */
-				core_link_write_dpcd(
-						link,
-						vendor_lttpr_write_address,
-						&vendor_lttpr_write_data_vs[0],
-						sizeof(vendor_lttpr_write_data_vs));
-				core_link_write_dpcd(
-						link,
-						vendor_lttpr_write_address,
-						&vendor_lttpr_write_data_pe[0],
-						sizeof(vendor_lttpr_write_data_pe));
+				link_configure_fixed_vs_pe_retimer(link->ddc,
+						&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+				link_configure_fixed_vs_pe_retimer(link->ddc,
+						&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 				dpcd_set_lane_settings(
 						link,
@@ -922,17 +795,14 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
 		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
 
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
+		link_configure_fixed_vs_pe_retimer(link->ddc,
 				&vendor_lttpr_write_data_adicora_eq1[0],
 				sizeof(vendor_lttpr_write_data_adicora_eq1));
-		core_link_write_dpcd(
-				link,
-				vendor_lttpr_write_address,
+		link_configure_fixed_vs_pe_retimer(link->ddc,
 				&vendor_lttpr_write_data_adicora_eq2[0],
 				sizeof(vendor_lttpr_write_data_adicora_eq2));
 
+
 		/* Note: also check that TPS4 is a supported feature*/
 		tr_pattern = lt_settings->pattern_for_eq;
 
@@ -956,16 +826,10 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 			}
 
 			/* Vendor specific: Update VS and PE to DPRX requested value */
-			core_link_write_dpcd(
-					link,
-					vendor_lttpr_write_address,
-					&vendor_lttpr_write_data_vs[0],
-					sizeof(vendor_lttpr_write_data_vs));
-			core_link_write_dpcd(
-					link,
-					vendor_lttpr_write_address,
-					&vendor_lttpr_write_data_pe[0],
-					sizeof(vendor_lttpr_write_data_pe));
+			link_configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_write_data_vs[0], sizeof(vendor_lttpr_write_data_vs));
+			link_configure_fixed_vs_pe_retimer(link->ddc,
+					&vendor_lttpr_write_data_pe[0], sizeof(vendor_lttpr_write_data_pe));
 
 			/* 2. update DPCD*/
 			if (!retries_ch_eq) {
@@ -978,11 +842,10 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 					lt_settings,
 					tr_pattern, 0);
 
-				core_link_write_dpcd(
-					link,
-					vendor_lttpr_write_address,
-					&vendor_lttpr_write_data_adicora_eq3[0],
-					sizeof(vendor_lttpr_write_data_adicora_eq3));
+				link_configure_fixed_vs_pe_retimer(link->ddc,
+						&vendor_lttpr_write_data_adicora_eq3[0],
+						sizeof(vendor_lttpr_write_data_adicora_eq3));
+
 			} else
 				dpcd_set_lane_settings(link, lt_settings, 0);
 
-- 
2.41.0

