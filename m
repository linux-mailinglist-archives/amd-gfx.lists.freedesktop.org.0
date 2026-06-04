Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2j/MN+RIWpyJAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 16:55:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E4641202
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 16:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=s4AF0QRm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE511284B;
	Thu,  4 Jun 2026 14:55:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013011.outbound.protection.outlook.com
 [40.93.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66CC112843
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 14:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEXjHaz2ZtXKgBYnjC28ZWgvXvm6yVhVLn8sgLxdnGCa1P+oPlWJaQfp8FpPpXB7yuv0A1w3J/osV0YArwKlBUuflxxmakUdLSGqWM9+vguWZPJDXY6vX6DvMaBk3LO9q10x2VwRvCEzOXrfaNZci895Sh0nVgyJENVfq1ZYfwQJfpQsjuU8cH7qroQcMOqsBq13xp3Q16TCopzrhWdq/HOnZ+4ODWhMBW4UvVy/WkmC3s28+teFeoaU5tOMPK/+UMWdzvSj2A6QgIU0ToyJGa9tmzDpjI97PswZyScXoztsL3IacRVCfkO7yHPSXteHZV7JYVf/mhRdKYaxouGc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91jEVEtLOPPmARDrBeoNbgfI2uLP1Tfb5tzZZx3pYIQ=;
 b=Bc4Ou4UBRQOji/h41Ktis1JPU/lSyCECrb9KQIotzYpI/lSGWinSzA3NZpXr5Fjk99ZFG7N/q8klyoZWL5SnnQS818pHlctU7yK6/2eIyw+cP2JUxeFKVZqkCF5N+CXvvuibFfWRYTGoLlj0snbdy/NAO3TNhMwukme+1PqQSn675xiPsRwQb96aueQgRF2CKctaXmpOES+UX2mInl6yutgk1List7SIerqnQxhZwd3JyCe44u+14TMKCCIPRJ7ARkp0+tGBkbAax0T/eUGuQ5O14dYWmRzsVxKcm5jx5Bl4eYgFF7rGTGrURZGI4LXc2FRSkXHv6LQCpZRDgfCZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91jEVEtLOPPmARDrBeoNbgfI2uLP1Tfb5tzZZx3pYIQ=;
 b=s4AF0QRmgJPcPVAvEZGYkrP4OYsInxSZ4SD2SsFvxWCzNrzthTuWDftPeihPEpIA2wrn9OM7RB91qzSny3z/i9LqE2aWBDLttK1kePZ2LYFKhpFC0BjNJER7A96Jt8QWqNmUr28qTeyxvG2mQZKn0rh2ErZCbZYOs4D6/BcdRgE=
Received: from BN9P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::34)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 14:55:17 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::8f) by BN9P223CA0029.outlook.office365.com
 (2603:10b6:408:10b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 14:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 14:55:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 09:55:02 -0500
Received: from aaurabin-tumbleweed.king-squeaker.ts.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Thu, 4 Jun 2026 09:55:01 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Subject: [PATCH 11/24] drm/amd/display: Add KUnit tests for amdgpu_dm_mst_types
Date: Thu, 4 Jun 2026 10:52:05 -0400
Message-ID: <20260604145428.809959-12-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604145428.809959-1-aurabindo.pillai@amd.com>
References: <20260604145428.809959-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eab7975-f6b3-40a4-8c99-08dec24949d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ptpKMDvgS7vMijBZTBAKWhzOeX5ILWlQYvODCndEgRbeEJ337mSjVQ/xDBkzYW1cXCXQtzx3YmNPSEQHR/yp1EJrI6BIerihwFXyD7hGjhdyS8ixoBFY1VSiuHI/Wr/zVSnkPNsY0BJvcYDM6wfBl1oiAQnCpJc6RY8/HBP93oaTpTPokgyhQAx2kp6eoXVMtzWkEEDPm/Iugxoj7yzOZyNRUOwlJ/r5g5K0Wm1dNCavnyr5MWo02xPf5wNZOBkL6reULdwBK5UEUPdccJIJcg9WVW24fMKxOGwvjGwyxEtqLRqfGmbOEkBNmJX4jf+L7UW6hXV7ZoFMtDfXdYmOER5LRT2CQf/pPJIqaFoRkB0p66T+Rk6oGdfYaMLR8lf8x/4qHJJyAmPaW6o6DsWNiKvKpIBeoqCutLaldAGA1gcwmFXV/E8Yu2KFD6JaQPNtePzd0PPZ3csDCyFIG8qYvocz2joEMzzGkc+/4wV2vv5mhiiOyv/zXPgdjMQM8RAhIOF1UFMK4IVGkFECwLIVoLsX8zb7hhZVg057STzi24Bkq+nIqbN31BSJK8R9wP5aH5ASf1vK4murc8a9Jty9SRYHOee3O0Zz+sBe+Z+Wd5HZo+I3hGKcmUam8qcY0uYUx7ttVi93oxrtnDxVJyMoJ8PJUInTxoWk4Apk5WR0XLIf2C+Zo4TKcVYRKdEKYhWdwyT4V1IkcmUswDykLCi6v2V6pwFEc2ae2xqG2WbETAA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lVyzokG+kngTzuX7wNs4TpRzdqTwdcm+oenOE3EX6hCAr+ztaOXO7yVhmJEe/PQiDSfiWLZI0AH7f2ZQDyLLiOHQwI2zSMQd5hwV95q90SLFnEJ1TWfWwKS+J3bpaXl5CyMHW6yXxGIx26q8Fis9YOzCNf1np9T6QaZHCSjWv1LLeTvr8i4Gx24OH5PbQesQIlGdzythsEx4QwimynYQ6ZBKqvvFXmFjSpHEpuYpWputJz7sT5ZuOe9cE+SX2oqSQ63U/ekpCx+LXIRWSnUje9HFmZ/oofS+JOrG4l3sPFEEQGHqLjJTyrVUy617DaAYmn4E+kMzc4OjUqpQ2ZBfmLERmzFlTUcRbMds2xBfFVr8H089hLAsRAor3bMzBptM0w5ziNW+TOf5x1bsOwJoq7yaxrp4jm8HkjwRu0T+SUQwJFeiYx5H9xL838vjHhOW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 14:55:15.9812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eab7975-f6b3-40a4-8c99-08dec24949d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aurabindo.pillai@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 716E4641202

From: Alex Hung <alex.hung@amd.com>

[WHAT]
Add KUnit test coverage for needs_dsc_aux_workaround() in
amdgpu_dm_mst_types.c. Tests verify the function correctly
identifies links requiring the DSC AUX workaround based on
branch device ID, DPCD revision, and sink count.

Assisted-by: Copilot:Claude-Opus-4.6
Reviewed-by: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |   6 +
 .../drm/amd/display/amdgpu_dm/tests/Makefile  |   1 +
 .../tests/amdgpu_dm_mst_types_test.c          | 124 ++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 3b6433fb1345..9a70d1487b62 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -39,6 +39,7 @@
 
 #include "dc.h"
 #include "dm_helpers.h"
+#include "amdgpu_dm_kunit_helpers.h"
 
 #include "ddc_service_types.h"
 #include "dpcd_defs.h"
@@ -248,6 +249,7 @@ bool needs_dsc_aux_workaround(struct dc_link *link)
 
 	return false;
 }
+EXPORT_IF_KUNIT(needs_dsc_aux_workaround);
 
 #if defined(CONFIG_DRM_AMD_DC_FP)
 static bool is_synaptics_cascaded_panamera(struct dc_link *link, struct drm_dp_mst_port *port)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
index 6f7ea684b555..5a7065e53645 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
@@ -57,8 +57,14 @@ enum mst_msg_ready_type {
 	DOWN_OR_UP_MSG_RDY_EVENT = 3
 };
 
+struct amdgpu_device;
 struct amdgpu_display_manager;
 struct amdgpu_dm_connector;
+struct dc_state;
+struct dc_stream_state;
+struct dm_atomic_state;
+struct drm_atomic_state;
+struct drm_dp_mst_topology_mgr;
 
 uint32_t dm_mst_get_pbn_divider(struct dc_link *link);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
index ce1e46acb7af..fe9f32c9bdde 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_DRM_AMD_DC_KUNIT_TEST) += amdgpu_dm_psr_test.o
 obj-$(CONFIG_DRM_AMD_DC_KUNIT_TEST) += amdgpu_dm_replay_test.o
 obj-$(CONFIG_DRM_AMD_DC_KUNIT_TEST) += amdgpu_dm_ism_test.o
 obj-$(CONFIG_DRM_AMD_DC_KUNIT_TEST) += amdgpu_dm_wb_test.o
+obj-$(CONFIG_DRM_AMD_DC_KUNIT_TEST) += amdgpu_dm_mst_types_test.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
new file mode 100644
index 000000000000..e21386819ea1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * KUnit tests for amdgpu_dm_mst_types.c
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <kunit/test.h>
+
+#include "dc.h"
+#include "dpcd_defs.h"
+#include "amdgpu_dm_mst_types.h"
+
+/* Tests for needs_dsc_aux_workaround */
+
+/**
+ * dm_mst_test_needs_dsc_aux_workaround_match - Test workaround triggers for matching device
+ * @test: KUnit test context
+ *
+ * Verify that needs_dsc_aux_workaround() returns true when the link has
+ * the specific branch device ID, DPCD rev 1.4, and sink count >= 2.
+ */
+static void dm_mst_test_needs_dsc_aux_workaround_match(struct kunit *test)
+{
+	struct dc_link link = {0};
+
+	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
+	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
+	link.dpcd_caps.sink_count.bits.SINK_COUNT = 2;
+
+	KUNIT_EXPECT_TRUE(test, needs_dsc_aux_workaround(&link));
+}
+
+/**
+ * dm_mst_test_needs_dsc_aux_workaround_rev12 - Test workaround triggers for DPCD rev 1.2
+ * @test: KUnit test context
+ *
+ * Verify that needs_dsc_aux_workaround() returns true when the link has
+ * the specific branch device ID, DPCD rev 1.2, and sink count >= 2.
+ */
+static void dm_mst_test_needs_dsc_aux_workaround_rev12(struct kunit *test)
+{
+	struct dc_link link = {0};
+
+	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
+	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_12;
+	link.dpcd_caps.sink_count.bits.SINK_COUNT = 3;
+
+	KUNIT_EXPECT_TRUE(test, needs_dsc_aux_workaround(&link));
+}
+
+/**
+ * dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id - Test workaround skipped for wrong device
+ * @test: KUnit test context
+ *
+ * Verify that needs_dsc_aux_workaround() returns false when the branch
+ * device ID does not match DP_BRANCH_DEVICE_ID_90CC24.
+ */
+static void dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id(struct kunit *test)
+{
+	struct dc_link link = {0};
+
+	link.dpcd_caps.branch_dev_id = 0x123456;
+	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
+	link.dpcd_caps.sink_count.bits.SINK_COUNT = 2;
+
+	KUNIT_EXPECT_FALSE(test, needs_dsc_aux_workaround(&link));
+}
+
+/**
+ * dm_mst_test_needs_dsc_aux_workaround_wrong_rev - Test workaround skipped for unsupported rev
+ * @test: KUnit test context
+ *
+ * Verify that needs_dsc_aux_workaround() returns false when the DPCD
+ * revision is neither 1.2 nor 1.4.
+ */
+static void dm_mst_test_needs_dsc_aux_workaround_wrong_rev(struct kunit *test)
+{
+	struct dc_link link = {0};
+
+	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
+	link.dpcd_caps.dpcd_rev.raw = 0x11; /* DPCD 1.1 */
+	link.dpcd_caps.sink_count.bits.SINK_COUNT = 2;
+
+	KUNIT_EXPECT_FALSE(test, needs_dsc_aux_workaround(&link));
+}
+
+/**
+ * dm_mst_test_needs_dsc_aux_workaround_low_sink_count - Test workaround skipped for single sink
+ * @test: KUnit test context
+ *
+ * Verify that needs_dsc_aux_workaround() returns false when the sink
+ * count is less than 2, even if device ID and DPCD rev match.
+ */
+static void dm_mst_test_needs_dsc_aux_workaround_low_sink_count(struct kunit *test)
+{
+	struct dc_link link = {0};
+
+	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
+	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
+	link.dpcd_caps.sink_count.bits.SINK_COUNT = 1;
+
+	KUNIT_EXPECT_FALSE(test, needs_dsc_aux_workaround(&link));
+}
+
+static struct kunit_case dm_mst_types_test_cases[] = {
+	/* needs_dsc_aux_workaround tests */
+	KUNIT_CASE(dm_mst_test_needs_dsc_aux_workaround_match),
+	KUNIT_CASE(dm_mst_test_needs_dsc_aux_workaround_rev12),
+	KUNIT_CASE(dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id),
+	KUNIT_CASE(dm_mst_test_needs_dsc_aux_workaround_wrong_rev),
+	KUNIT_CASE(dm_mst_test_needs_dsc_aux_workaround_low_sink_count),
+	{}
+};
+
+static struct kunit_suite dm_mst_types_test_suite = {
+	.name = "amdgpu_dm_mst_types",
+	.test_cases = dm_mst_types_test_cases,
+};
+
+kunit_test_suite(dm_mst_types_test_suite);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("KUnit tests for amdgpu_dm_mst_types");
-- 
2.54.0

