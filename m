Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4E6646D0
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Jan 2023 17:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC5910E614;
	Tue, 10 Jan 2023 16:58:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C176010E61F
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Jan 2023 16:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK5/MDTliqbqvsrgHYTM/9A9W8tUjF+NeEG8Q6Mb20phHIrgencoPd5an/eoXnZIOliazWavwE5l2LlUGC7vxucrjEKvrgbwqM306zoIkakT9b00o+8aUADAYq1bV4ZYefoxentQXiri8EYdurk2e+UK2EMaGBb5RfWMlC1W1cMHmpUcY4vq5Q47VZMKSIdQUFBweaMEuq6Z+LIsAo8SwtwAd/uhNy1ZC1egOqHwPpjjt4cCbZoAQmOhBJ5RdHu9z6WBc86TVBXyF24oFCitNgA7lYdNtTVB80R45MLg5oic+LMGXFNYFCOqPEEdOq/cnqkvpE/UUXXDMgfgObCSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zHmjkjCnH/YZa8/kFTNispHSTXKYhoJCI1FkmxMeEQ=;
 b=Ckwq+sqZEzsA4LHpK/NaTbMdmVUgrnOmqUVxL9pdYfWLmP1p1M/JznURo6cv1EjJlw87LsR1ffTRcvq8u17rJ2VG+6V2IMYOoPxsGt3Oi5WplMX/jG00BBmXmhQKBd1YUMtxSiGOZ1Vmv7EXvJoOO0MS1XGeE6hdextFNcEDSmU/Xx64Jm27KAmj260gEIRtqgUKKdr9F0+/V7mVBH62moZZCDMpXgRzhLtwUkfwBEG8kj+kqQEhEqKXnrQAIJTxE5nRwYD/6wHMiMIBKZ2TNf31+vXY/gcpCbw1rkr9tKwf5psqUGYcC+mYm21Kjm8h5t9EIl+Q+zKDE1KVbP2Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zHmjkjCnH/YZa8/kFTNispHSTXKYhoJCI1FkmxMeEQ=;
 b=xRikCQsegRUjvgUXPL2leHzhAuanZc6LS7Nleq0CvXZMOvykFBGg/RehieyufMO1f/j8MOg1MncfrqqremDWwWyfPitWM+MZR3DYaMPutS4VxHHXu5EYfCtRcFL68JzEdXXbqRRh5o1LkXRPu9TznDvlkSLNxo/6hKucQ85S4/k=
Received: from MW4PR04CA0123.namprd04.prod.outlook.com (2603:10b6:303:84::8)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:58:21 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::71) by MW4PR04CA0123.outlook.office365.com
 (2603:10b6:303:84::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 16:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 16:58:21 +0000
Received: from atma-again.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 10 Jan
 2023 10:57:56 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/37] drm/amd/display: move dp link training logic to
 link_dp_training
Date: Tue, 10 Jan 2023 11:55:17 -0500
Message-ID: <20230110165535.3358492-20-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: c11d3f8b-671f-4c9e-86c3-08daf32be152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMx/m5AprKiDyGOz03i0kB6sWHz8qRRjB72ye1Vz13rKYUzu1l9hI7VCZV0IfPIjtOH97RCVmhxQVc/c9MeyC8B2j75mMXszmC7S7YDzOCRDv8u5xsCn6Y4gScR7hJ//USa8fKbcALKzVc86a4ciKOIp9RuZGRBvk0R+rInMfzP0VyZ6gXON7VmHCXy7KpxL2NQ1z9oMdlCzUFZrRkMCA5LLxxDXpHVFxpQK8pWOkLoSt9CYz4sqNJdubiHfbHQlc/ea48MwUaiMywl1rZeC+fAoxWoZQ7uw1Ebn6Sf2Xba5A50anBaHktoCdiE7JI+Q0ms8zZ9mbXo0EwBIpV0ySYipqJHyEnAnrM0a1B8vYOX6fANQ/KplyOxttvyhGjW1Qvf87gDtqy+/RN2uobXuuuIih2jhY3IQEzz9Z46ieFT5bH+aIElLDdNTD7LIYIMsMrFlqVOqA0Wv3E3siSFJly5ZaIGNMTkp7H1DgbIJ7tDcEuyI8899NVMIsV4hFzg0eFmvOoScVzP1pyG99hwpTBXQAvmCrzmFbA2LFHJwLU1WNCdViUM+471akeFrEVOsL0p2Wzgftxlrc8SfeP29fQyg0V53mlJt89wgJIQRlWH4cUJ6EIwpxXc1Gj/3dC9WB6DjOKUNcKizwll1j+dYmOAbIb31CCAzVpbwpYE2uy9X64y1ceb2MQdQ/Xo7R0B+A8D6q8fj4Qt2JFGhgKfKHEYJJT6UfIpsHgxURKrCNeE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(40460700003)(66574015)(41300700001)(426003)(47076005)(4326008)(2616005)(1076003)(19627235002)(8676002)(6916009)(336012)(36756003)(70586007)(54906003)(316002)(70206006)(82310400005)(40480700001)(86362001)(36860700001)(8936002)(356005)(81166007)(5660300002)(83380400001)(30864003)(82740400003)(2906002)(66899015)(16526019)(26005)(6666004)(186003)(478600001)(7696005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:58:21.4209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11d3f8b-671f-4c9e-86c3-08daf32be152
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
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
Cc: stylon.wang@amd.com, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
Extract dp link training logic out to their own files.
link_dp_training - high level training sequence and helper functions.
link_dp_training_8b_10b - dp1.x training
link_dp_training_auxless - aux-less training
link_dp_traininig_dpia - dpia training
link_dp_training_fixed_vs_pe_retimer - fixed vs pe retimer training
link_dp_training_128b_132b - dp2.1 training

Reviewed-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |    1 +
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 3237 +----------------
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  |    3 +
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   24 +-
 .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |  114 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile  |    4 +-
 .../drm/amd/display/dc/link/link_dp_dpia.c    |  945 +----
 .../drm/amd/display/dc/link/link_dp_dpia.h    |   60 -
 .../amd/display/dc/link/link_dp_training.c    | 1698 +++++++++
 .../amd/display/dc/link/link_dp_training.h    |  179 +
 .../dc/link/link_dp_training_128b_132b.c      |  258 ++
 .../dc/link/link_dp_training_128b_132b.h      |   42 +
 .../display/dc/link/link_dp_training_8b_10b.c |  413 +++
 .../display/dc/link/link_dp_training_8b_10b.h |   61 +
 .../dc/link/link_dp_training_auxless.c        |   80 +
 .../dc/link/link_dp_training_auxless.h        |   35 +
 .../display/dc/link/link_dp_training_dpia.c   | 1044 ++++++
 .../display/dc/link/link_dp_training_dpia.h   |   41 +
 .../link_dp_training_fixed_vs_pe_retimer.c    |  578 +++
 .../link_dp_training_fixed_vs_pe_retimer.h    |   45 +
 .../gpu/drm/amd/display/dc/link/link_dpcd.h   |    1 +
 .../amd/display/include/ddc_service_types.h   |    5 +
 22 files changed, 4647 insertions(+), 4221 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index cb3a57190cb7..6a2e0d867853 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -54,6 +54,7 @@
 #include "link/link_dpcd.h"
 #include "link/link_dp_trace.h"
 #include "link/link_hpd.h"
+#include "link/link_dp_training.h"
 
 #include "dc/dcn30/dcn30_vpg.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 9edfcdf3db3b..baf2e35d0ac6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -27,2838 +27,131 @@
 #include "dm_helpers.h"
 #include "opp.h"
 #include "dsc.h"
-#include "clk_mgr.h"
-#include "resource.h"
-
-#include "inc/core_types.h"
-#include "link_hwss.h"
-#include "link/link_ddc.h"
-#include "core_status.h"
-#include "dpcd_defs.h"
-#include "dc_dmub_srv.h"
-#include "dce/dmub_hw_lock_mgr.h"
-#include "link/link_dp_dpia.h"
-#include "inc/link_enc_cfg.h"
-#include "link/link_dp_trace.h"
-
-/*Travis*/
-static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
-/*Nutmeg*/
-static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
-
-#define DC_LOGGER \
-	link->ctx->logger
-#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
-
-#include "link/link_dpcd.h"
-
-#ifndef MAX
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
-#endif
-#ifndef MIN
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#endif
-
-	/* maximum pre emphasis level allowed for each voltage swing level*/
-	static const enum dc_pre_emphasis
-	voltage_swing_to_pre_emphasis[] = { PRE_EMPHASIS_LEVEL3,
-					    PRE_EMPHASIS_LEVEL2,
-					    PRE_EMPHASIS_LEVEL1,
-					    PRE_EMPHASIS_DISABLED };
-
-enum {
-	POST_LT_ADJ_REQ_LIMIT = 6,
-	POST_LT_ADJ_REQ_TIMEOUT = 200
-};
-
-struct dp_lt_fallback_entry {
-	enum dc_lane_count lane_count;
-	enum dc_link_rate link_rate;
-};
-
-static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
-		/* This link training fallback array is ordered by
-		 * link bandwidth from highest to lowest.
-		 * DP specs makes it a normative policy to always
-		 * choose the next highest link bandwidth during
-		 * link training fallback.
-		 */
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR20},
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR20},
-		{LANE_COUNT_FOUR, LINK_RATE_UHBR10},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH3},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR20},
-		{LANE_COUNT_TWO, LINK_RATE_UHBR10},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH2},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR13_5},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH3},
-		{LANE_COUNT_ONE, LINK_RATE_UHBR10},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH2},
-		{LANE_COUNT_FOUR, LINK_RATE_HIGH},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH3},
-		{LANE_COUNT_FOUR, LINK_RATE_LOW},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH2},
-		{LANE_COUNT_TWO, LINK_RATE_HIGH},
-		{LANE_COUNT_TWO, LINK_RATE_LOW},
-		{LANE_COUNT_ONE, LINK_RATE_HIGH},
-		{LANE_COUNT_ONE, LINK_RATE_LOW},
-};
-
-static const struct dc_link_settings fail_safe_link_settings = {
-		.lane_count = LANE_COUNT_ONE,
-		.link_rate = LINK_RATE_LOW,
-		.link_spread = LINK_SPREAD_DISABLED,
-};
-
-static bool decide_fallback_link_setting(
-		struct dc_link *link,
-		struct dc_link_settings *max,
-		struct dc_link_settings *cur,
-		enum link_training_result training_result);
-static void maximize_lane_settings(const struct link_training_settings *lt_settings,
-		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX]);
-static void override_lane_settings(const struct link_training_settings *lt_settings,
-		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX]);
-
-static uint32_t get_cr_training_aux_rd_interval(struct dc_link *link,
-		const struct dc_link_settings *link_settings)
-{
-	union training_aux_rd_interval training_rd_interval;
-	uint32_t wait_in_micro_secs = 100;
-
-	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
-			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
-		core_link_read_dpcd(
-				link,
-				DP_TRAINING_AUX_RD_INTERVAL,
-				(uint8_t *)&training_rd_interval,
-				sizeof(training_rd_interval));
-		if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
-			wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
-	}
-
-	return wait_in_micro_secs;
-}
-
-static uint32_t get_eq_training_aux_rd_interval(
-	struct dc_link *link,
-	const struct dc_link_settings *link_settings)
-{
-	union training_aux_rd_interval training_rd_interval;
-
-	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
-	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
-		core_link_read_dpcd(
-				link,
-				DP_128b_132b_TRAINING_AUX_RD_INTERVAL,
-				(uint8_t *)&training_rd_interval,
-				sizeof(training_rd_interval));
-	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
-			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
-		core_link_read_dpcd(
-				link,
-				DP_TRAINING_AUX_RD_INTERVAL,
-				(uint8_t *)&training_rd_interval,
-				sizeof(training_rd_interval));
-	}
-
-	switch (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL) {
-	case 0: return 400;
-	case 1: return 4000;
-	case 2: return 8000;
-	case 3: return 12000;
-	case 4: return 16000;
-	case 5: return 32000;
-	case 6: return 64000;
-	default: return 400;
-	}
-}
-
-void dp_wait_for_training_aux_rd_interval(
-	struct dc_link *link,
-	uint32_t wait_in_micro_secs)
-{
-	if (wait_in_micro_secs > 1000)
-		msleep(wait_in_micro_secs/1000);
-	else
-		udelay(wait_in_micro_secs);
-
-	DC_LOG_HW_LINK_TRAINING("%s:\n wait = %d\n",
-		__func__,
-		wait_in_micro_secs);
-}
-
-enum dpcd_training_patterns
-	dc_dp_training_pattern_to_dpcd_training_pattern(
-	struct dc_link *link,
-	enum dc_dp_training_pattern pattern)
-{
-	enum dpcd_training_patterns dpcd_tr_pattern =
-	DPCD_TRAINING_PATTERN_VIDEOIDLE;
-
-	switch (pattern) {
-	case DP_TRAINING_PATTERN_SEQUENCE_1:
-		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_1;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_2:
-		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_2;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_3:
-		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_3;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_4:
-		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_4;
-		break;
-	case DP_128b_132b_TPS1:
-		dpcd_tr_pattern = DPCD_128b_132b_TPS1;
-		break;
-	case DP_128b_132b_TPS2:
-		dpcd_tr_pattern = DPCD_128b_132b_TPS2;
-		break;
-	case DP_128b_132b_TPS2_CDS:
-		dpcd_tr_pattern = DPCD_128b_132b_TPS2_CDS;
-		break;
-	case DP_TRAINING_PATTERN_VIDEOIDLE:
-		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_VIDEOIDLE;
-		break;
-	default:
-		ASSERT(0);
-		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
-			__func__, pattern);
-		break;
-	}
-
-	return dpcd_tr_pattern;
-}
-
-static void dpcd_set_training_pattern(
-	struct dc_link *link,
-	enum dc_dp_training_pattern training_pattern)
-{
-	union dpcd_training_pattern dpcd_pattern = {0};
-
-	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
-			dc_dp_training_pattern_to_dpcd_training_pattern(
-					link, training_pattern);
-
-	core_link_write_dpcd(
-		link,
-		DP_TRAINING_PATTERN_SET,
-		&dpcd_pattern.raw,
-		1);
-
-	DC_LOG_HW_LINK_TRAINING("%s\n %x pattern = %x\n",
-		__func__,
-		DP_TRAINING_PATTERN_SET,
-		dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-}
-
-static enum dc_dp_training_pattern decide_cr_training_pattern(
-		const struct dc_link_settings *link_settings)
-{
-	switch (dp_get_link_encoding_format(link_settings)) {
-	case DP_8b_10b_ENCODING:
-	default:
-		return DP_TRAINING_PATTERN_SEQUENCE_1;
-	case DP_128b_132b_ENCODING:
-		return DP_128b_132b_TPS1;
-	}
-}
-
-static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
-		const struct dc_link_settings *link_settings)
-{
-	struct link_encoder *link_enc;
-	struct encoder_feature_support *enc_caps;
-	struct dpcd_caps *rx_caps = &link->dpcd_caps;
-	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-	enc_caps = &link_enc->features;
-
-	switch (dp_get_link_encoding_format(link_settings)) {
-	case DP_8b_10b_ENCODING:
-		if (enc_caps->flags.bits.IS_TPS4_CAPABLE &&
-				rx_caps->max_down_spread.bits.TPS4_SUPPORTED)
-			pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
-		else if (enc_caps->flags.bits.IS_TPS3_CAPABLE &&
-				rx_caps->max_ln_count.bits.TPS3_SUPPORTED)
-			pattern = DP_TRAINING_PATTERN_SEQUENCE_3;
-		else
-			pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
-		break;
-	case DP_128b_132b_ENCODING:
-		pattern = DP_128b_132b_TPS2;
-		break;
-	default:
-		pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
-		break;
-	}
-	return pattern;
-}
-
-static uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
-{
-	uint8_t link_rate = 0;
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_settings);
-
-	if (encoding == DP_128b_132b_ENCODING)
-		switch (link_settings->link_rate) {
-		case LINK_RATE_UHBR10:
-			link_rate = 0x1;
-			break;
-		case LINK_RATE_UHBR20:
-			link_rate = 0x2;
-			break;
-		case LINK_RATE_UHBR13_5:
-			link_rate = 0x4;
-			break;
-		default:
-			link_rate = 0;
-			break;
-		}
-	else if (encoding == DP_8b_10b_ENCODING)
-		link_rate = (uint8_t) link_settings->link_rate;
-	else
-		link_rate = 0;
-
-	return link_rate;
-}
-
-static void dp_fixed_vs_pe_read_lane_adjust(
-	struct dc_link *link,
-	union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX])
-{
-	const uint8_t vendor_lttpr_write_data_vs[3] = {0x0, 0x53, 0x63};
-	const uint8_t vendor_lttpr_write_data_pe[3] = {0x0, 0x54, 0x63};
-	const uint8_t offset = dp_convert_to_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-	uint32_t vendor_lttpr_write_address = 0xF004F;
-	uint32_t vendor_lttpr_read_address = 0xF0053;
-	uint8_t dprx_vs = 0;
-	uint8_t dprx_pe = 0;
-	uint8_t lane;
-
-	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-		vendor_lttpr_read_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-	}
-
-	/* W/A to read lane settings requested by DPRX */
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
-
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET  = (dprx_vs >> (2 * lane)) & 0x3;
-		dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_SET = (dprx_pe >> (2 * lane)) & 0x3;
-	}
-}
-
-static void dp_fixed_vs_pe_set_retimer_lane_settings(
-	struct dc_link *link,
-	const union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX],
-	uint8_t lane_count)
-{
-	const uint8_t offset = dp_convert_to_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
-	uint32_t vendor_lttpr_write_address = 0xF004F;
-	uint8_t vendor_lttpr_write_data_vs[4] = {0x1, 0x51, 0x63, 0x0};
-	uint8_t vendor_lttpr_write_data_pe[4] = {0x1, 0x52, 0x63, 0x0};
-	uint8_t lane = 0;
-
-	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-	}
-
-	for (lane = 0; lane < lane_count; lane++) {
-		vendor_lttpr_write_data_vs[3] |=
-				dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
-		vendor_lttpr_write_data_pe[3] |=
-				dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
-	}
-
-	/* Force LTTPR to output desired VS and PE */
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
-}
-
-enum dc_status dpcd_set_link_settings(
-	struct dc_link *link,
-	const struct link_training_settings *lt_settings)
-{
-	uint8_t rate;
-	enum dc_status status;
-
-	union down_spread_ctrl downspread = {0};
-	union lane_count_set lane_count_set = {0};
-
-	downspread.raw = (uint8_t)
-	(lt_settings->link_settings.link_spread);
-
-	lane_count_set.bits.LANE_COUNT_SET =
-	lt_settings->link_settings.lane_count;
-
-	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
-	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
-
-
-	if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
-			lt_settings->pattern_for_eq < DP_TRAINING_PATTERN_SEQUENCE_4) {
-		lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED =
-				link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED;
-	}
-
-	status = core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
-		&downspread.raw, sizeof(downspread));
-
-	status = core_link_write_dpcd(link, DP_LANE_COUNT_SET,
-		&lane_count_set.raw, 1);
-
-	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_13 &&
-			lt_settings->link_settings.use_link_rate_set == true) {
-		rate = 0;
-		/* WA for some MUX chips that will power down with eDP and lose supported
-		 * link rate set for eDP 1.4. Source reads DPCD 0x010 again to ensure
-		 * MUX chip gets link rate set back before link training.
-		 */
-		if (link->connector_signal == SIGNAL_TYPE_EDP) {
-			uint8_t supported_link_rates[16];
-
-			core_link_read_dpcd(link, DP_SUPPORTED_LINK_RATES,
-					supported_link_rates, sizeof(supported_link_rates));
-		}
-		status = core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
-		status = core_link_write_dpcd(link, DP_LINK_RATE_SET,
-				&lt_settings->link_settings.link_rate_set, 1);
-	} else {
-		rate = get_dpcd_link_rate(&lt_settings->link_settings);
-
-		status = core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
-	}
-
-	if (rate) {
-		DC_LOG_HW_LINK_TRAINING("%s\n %x rate = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
-			__func__,
-			DP_LINK_BW_SET,
-			lt_settings->link_settings.link_rate,
-			DP_LANE_COUNT_SET,
-			lt_settings->link_settings.lane_count,
-			lt_settings->enhanced_framing,
-			DP_DOWNSPREAD_CTRL,
-			lt_settings->link_settings.link_spread);
-	} else {
-		DC_LOG_HW_LINK_TRAINING("%s\n %x rate set = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
-			__func__,
-			DP_LINK_RATE_SET,
-			lt_settings->link_settings.link_rate_set,
-			DP_LANE_COUNT_SET,
-			lt_settings->link_settings.lane_count,
-			lt_settings->enhanced_framing,
-			DP_DOWNSPREAD_CTRL,
-			lt_settings->link_settings.link_spread);
-	}
-
-	return status;
-}
-
-uint8_t dc_dp_initialize_scrambling_data_symbols(
-	struct dc_link *link,
-	enum dc_dp_training_pattern pattern)
-{
-	uint8_t disable_scrabled_data_symbols = 0;
-
-	switch (pattern) {
-	case DP_TRAINING_PATTERN_SEQUENCE_1:
-	case DP_TRAINING_PATTERN_SEQUENCE_2:
-	case DP_TRAINING_PATTERN_SEQUENCE_3:
-		disable_scrabled_data_symbols = 1;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_4:
-	case DP_128b_132b_TPS1:
-	case DP_128b_132b_TPS2:
-		disable_scrabled_data_symbols = 0;
-		break;
-	default:
-		ASSERT(0);
-		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
-			__func__, pattern);
-		break;
-	}
-	return disable_scrabled_data_symbols;
-}
-
-static inline bool is_repeater(const struct link_training_settings *lt_settings, uint32_t offset)
-{
-	return (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) && (offset != 0);
-}
-
-static void dpcd_set_lt_pattern_and_lane_settings(
-	struct dc_link *link,
-	const struct link_training_settings *lt_settings,
-	enum dc_dp_training_pattern pattern,
-	uint32_t offset)
-{
-	uint32_t dpcd_base_lt_offset;
-
-	uint8_t dpcd_lt_buffer[5] = {0};
-	union dpcd_training_pattern dpcd_pattern = {0};
-	uint32_t size_in_bytes;
-	bool edp_workaround = false; /* TODO link_prop.INTERNAL */
-	dpcd_base_lt_offset = DP_TRAINING_PATTERN_SET;
-
-	if (is_repeater(lt_settings, offset))
-		dpcd_base_lt_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
-			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-
-	/*****************************************************************
-	* DpcdAddress_TrainingPatternSet
-	*****************************************************************/
-	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
-		dc_dp_training_pattern_to_dpcd_training_pattern(link, pattern);
-
-	dpcd_pattern.v1_4.SCRAMBLING_DISABLE =
-		dc_dp_initialize_scrambling_data_symbols(link, pattern);
-
-	dpcd_lt_buffer[DP_TRAINING_PATTERN_SET - DP_TRAINING_PATTERN_SET]
-		= dpcd_pattern.raw;
-
-	if (is_repeater(lt_settings, offset)) {
-		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n 0x%X pattern = %x\n",
-			__func__,
-			offset,
-			dpcd_base_lt_offset,
-			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-	} else {
-		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X pattern = %x\n",
-			__func__,
-			dpcd_base_lt_offset,
-			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-	}
-
-	/* concatenate everything into one buffer*/
-	size_in_bytes = lt_settings->link_settings.lane_count *
-			sizeof(lt_settings->dpcd_lane_settings[0]);
-
-	 // 0x00103 - 0x00102
-	memmove(
-		&dpcd_lt_buffer[DP_TRAINING_LANE0_SET - DP_TRAINING_PATTERN_SET],
-		lt_settings->dpcd_lane_settings,
-		size_in_bytes);
-
-	if (is_repeater(lt_settings, offset)) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_128b_132b_ENCODING)
-			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
-					" 0x%X TX_FFE_PRESET_VALUE = %x\n",
-					__func__,
-					offset,
-					dpcd_base_lt_offset,
-					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_8b_10b_ENCODING)
-		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
-				" 0x%X VS set = %x PE set = %x max VS Reached = %x  max PE Reached = %x\n",
-			__func__,
-			offset,
-			dpcd_base_lt_offset,
-			lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
-			lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
-			lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
-			lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
-	} else {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_128b_132b_ENCODING)
-			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
-					__func__,
-					dpcd_base_lt_offset,
-					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_8b_10b_ENCODING)
-			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
-					__func__,
-					dpcd_base_lt_offset,
-					lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
-					lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
-					lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
-					lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
-	}
-	if (edp_workaround) {
-		/* for eDP write in 2 parts because the 5-byte burst is
-		* causing issues on some eDP panels (EPR#366724)
-		*/
-		core_link_write_dpcd(
-			link,
-			DP_TRAINING_PATTERN_SET,
-			&dpcd_pattern.raw,
-			sizeof(dpcd_pattern.raw));
-
-		core_link_write_dpcd(
-			link,
-			DP_TRAINING_LANE0_SET,
-			(uint8_t *)(lt_settings->dpcd_lane_settings),
-			size_in_bytes);
-
-	} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-			DP_128b_132b_ENCODING) {
-		core_link_write_dpcd(
-				link,
-				dpcd_base_lt_offset,
-				dpcd_lt_buffer,
-				sizeof(dpcd_lt_buffer));
-	} else
-		/* write it all in (1 + number-of-lanes)-byte burst*/
-		core_link_write_dpcd(
-				link,
-				dpcd_base_lt_offset,
-				dpcd_lt_buffer,
-				size_in_bytes + sizeof(dpcd_pattern.raw));
-}
-
-bool dp_is_cr_done(enum dc_lane_count ln_count,
-	union lane_status *dpcd_lane_status)
-{
-	uint32_t lane;
-	/*LANEx_CR_DONE bits All 1's?*/
-	for (lane = 0; lane < (uint32_t)(ln_count); lane++) {
-		if (!dpcd_lane_status[lane].bits.CR_DONE_0)
-			return false;
-	}
-	return true;
-}
-
-bool dp_is_ch_eq_done(enum dc_lane_count ln_count,
-		union lane_status *dpcd_lane_status)
-{
-	bool done = true;
-	uint32_t lane;
-	for (lane = 0; lane < (uint32_t)(ln_count); lane++)
-		if (!dpcd_lane_status[lane].bits.CHANNEL_EQ_DONE_0)
-			done = false;
-	return done;
-}
-
-bool dp_is_symbol_locked(enum dc_lane_count ln_count,
-		union lane_status *dpcd_lane_status)
-{
-	bool locked = true;
-	uint32_t lane;
-	for (lane = 0; lane < (uint32_t)(ln_count); lane++)
-		if (!dpcd_lane_status[lane].bits.SYMBOL_LOCKED_0)
-			locked = false;
-	return locked;
-}
-
-bool dp_is_interlane_aligned(union lane_align_status_updated align_status)
-{
-	return align_status.bits.INTERLANE_ALIGN_DONE == 1;
-}
-
-void dp_hw_to_dpcd_lane_settings(
-		const struct link_training_settings *lt_settings,
-		const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-		union dpcd_training_lane dpcd_lane_settings[])
-{
-	uint8_t lane = 0;
-
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_8b_10b_ENCODING) {
-			dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET =
-					(uint8_t)(hw_lane_settings[lane].VOLTAGE_SWING);
-			dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET =
-					(uint8_t)(hw_lane_settings[lane].PRE_EMPHASIS);
-			dpcd_lane_settings[lane].bits.MAX_SWING_REACHED =
-					(hw_lane_settings[lane].VOLTAGE_SWING ==
-							VOLTAGE_SWING_MAX_LEVEL ? 1 : 0);
-			dpcd_lane_settings[lane].bits.MAX_PRE_EMPHASIS_REACHED =
-					(hw_lane_settings[lane].PRE_EMPHASIS ==
-							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
-		}
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_128b_132b_ENCODING) {
-			dpcd_lane_settings[lane].tx_ffe.PRESET_VALUE =
-					hw_lane_settings[lane].FFE_PRESET.settings.level;
-		}
-	}
-}
-
-void dp_decide_lane_settings(
-		const struct link_training_settings *lt_settings,
-		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
-		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-		union dpcd_training_lane dpcd_lane_settings[])
-{
-	uint32_t lane;
-
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_8b_10b_ENCODING) {
-			hw_lane_settings[lane].VOLTAGE_SWING =
-					(enum dc_voltage_swing)(ln_adjust[lane].bits.
-							VOLTAGE_SWING_LANE);
-			hw_lane_settings[lane].PRE_EMPHASIS =
-					(enum dc_pre_emphasis)(ln_adjust[lane].bits.
-							PRE_EMPHASIS_LANE);
-		}
-		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_128b_132b_ENCODING) {
-			hw_lane_settings[lane].FFE_PRESET.raw =
-					ln_adjust[lane].tx_ffe.PRESET_VALUE;
-		}
-	}
-	dp_hw_to_dpcd_lane_settings(lt_settings, hw_lane_settings, dpcd_lane_settings);
-
-	if (lt_settings->disallow_per_lane_settings) {
-		/* we find the maximum of the requested settings across all lanes*/
-		/* and set this maximum for all lanes*/
-		maximize_lane_settings(lt_settings, hw_lane_settings);
-		override_lane_settings(lt_settings, hw_lane_settings);
-
-		if (lt_settings->always_match_dpcd_with_hw_lane_settings)
-			dp_hw_to_dpcd_lane_settings(lt_settings, hw_lane_settings, dpcd_lane_settings);
-	}
-
-}
-
-static uint8_t get_nibble_at_index(const uint8_t *buf,
-	uint32_t index)
-{
-	uint8_t nibble;
-	nibble = buf[index / 2];
-
-	if (index % 2)
-		nibble >>= 4;
-	else
-		nibble &= 0x0F;
-
-	return nibble;
-}
-
-static enum dc_pre_emphasis get_max_pre_emphasis_for_voltage_swing(
-	enum dc_voltage_swing voltage)
-{
-	enum dc_pre_emphasis pre_emphasis;
-	pre_emphasis = PRE_EMPHASIS_MAX_LEVEL;
-
-	if (voltage <= VOLTAGE_SWING_MAX_LEVEL)
-		pre_emphasis = voltage_swing_to_pre_emphasis[voltage];
-
-	return pre_emphasis;
-
-}
-
-static void maximize_lane_settings(const struct link_training_settings *lt_settings,
-		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX])
-{
-	uint32_t lane;
-	struct dc_lane_settings max_requested;
-
-	max_requested.VOLTAGE_SWING = lane_settings[0].VOLTAGE_SWING;
-	max_requested.PRE_EMPHASIS = lane_settings[0].PRE_EMPHASIS;
-	max_requested.FFE_PRESET = lane_settings[0].FFE_PRESET;
-
-	/* Determine what the maximum of the requested settings are*/
-	for (lane = 1; lane < lt_settings->link_settings.lane_count; lane++) {
-		if (lane_settings[lane].VOLTAGE_SWING > max_requested.VOLTAGE_SWING)
-			max_requested.VOLTAGE_SWING = lane_settings[lane].VOLTAGE_SWING;
-
-		if (lane_settings[lane].PRE_EMPHASIS > max_requested.PRE_EMPHASIS)
-			max_requested.PRE_EMPHASIS = lane_settings[lane].PRE_EMPHASIS;
-		if (lane_settings[lane].FFE_PRESET.settings.level >
-				max_requested.FFE_PRESET.settings.level)
-			max_requested.FFE_PRESET.settings.level =
-					lane_settings[lane].FFE_PRESET.settings.level;
-	}
-
-	/* make sure the requested settings are
-	 * not higher than maximum settings*/
-	if (max_requested.VOLTAGE_SWING > VOLTAGE_SWING_MAX_LEVEL)
-		max_requested.VOLTAGE_SWING = VOLTAGE_SWING_MAX_LEVEL;
-
-	if (max_requested.PRE_EMPHASIS > PRE_EMPHASIS_MAX_LEVEL)
-		max_requested.PRE_EMPHASIS = PRE_EMPHASIS_MAX_LEVEL;
-	if (max_requested.FFE_PRESET.settings.level > DP_FFE_PRESET_MAX_LEVEL)
-		max_requested.FFE_PRESET.settings.level = DP_FFE_PRESET_MAX_LEVEL;
-
-	/* make sure the pre-emphasis matches the voltage swing*/
-	if (max_requested.PRE_EMPHASIS >
-		get_max_pre_emphasis_for_voltage_swing(
-			max_requested.VOLTAGE_SWING))
-		max_requested.PRE_EMPHASIS =
-		get_max_pre_emphasis_for_voltage_swing(
-			max_requested.VOLTAGE_SWING);
-
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		lane_settings[lane].VOLTAGE_SWING = max_requested.VOLTAGE_SWING;
-		lane_settings[lane].PRE_EMPHASIS = max_requested.PRE_EMPHASIS;
-		lane_settings[lane].FFE_PRESET = max_requested.FFE_PRESET;
-	}
-}
-
-static void override_lane_settings(const struct link_training_settings *lt_settings,
-		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX])
-{
-	uint32_t lane;
-
-	if (lt_settings->voltage_swing == NULL &&
-	    lt_settings->pre_emphasis == NULL &&
-	    lt_settings->ffe_preset == NULL &&
-	    lt_settings->post_cursor2 == NULL)
-
-		return;
-
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		if (lt_settings->voltage_swing)
-			lane_settings[lane].VOLTAGE_SWING = *lt_settings->voltage_swing;
-		if (lt_settings->pre_emphasis)
-			lane_settings[lane].PRE_EMPHASIS = *lt_settings->pre_emphasis;
-		if (lt_settings->post_cursor2)
-			lane_settings[lane].POST_CURSOR2 = *lt_settings->post_cursor2;
-		if (lt_settings->ffe_preset)
-			lane_settings[lane].FFE_PRESET = *lt_settings->ffe_preset;
-	}
-}
-
-enum dc_status dp_get_lane_status_and_lane_adjust(
-	struct dc_link *link,
-	const struct link_training_settings *link_training_setting,
-	union lane_status ln_status[LANE_COUNT_DP_MAX],
-	union lane_align_status_updated *ln_align,
-	union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
-	uint32_t offset)
-{
-	unsigned int lane01_status_address = DP_LANE0_1_STATUS;
-	uint8_t lane_adjust_offset = 4;
-	unsigned int lane01_adjust_address;
-	uint8_t dpcd_buf[6] = {0};
-	uint32_t lane;
-	enum dc_status status;
-
-	if (is_repeater(link_training_setting, offset)) {
-		lane01_status_address =
-				DP_LANE0_1_STATUS_PHY_REPEATER1 +
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-		lane_adjust_offset = 3;
-	}
-
-	status = core_link_read_dpcd(
-		link,
-		lane01_status_address,
-		(uint8_t *)(dpcd_buf),
-		sizeof(dpcd_buf));
-
-	if (status != DC_OK) {
-		DC_LOG_HW_LINK_TRAINING("%s:\n Failed to read from address 0x%X,"
-			" keep current lane status and lane adjust unchanged",
-			__func__,
-			lane01_status_address);
-		return status;
-	}
-
-	for (lane = 0; lane <
-		(uint32_t)(link_training_setting->link_settings.lane_count);
-		lane++) {
-
-		ln_status[lane].raw =
-			get_nibble_at_index(&dpcd_buf[0], lane);
-		ln_adjust[lane].raw =
-			get_nibble_at_index(&dpcd_buf[lane_adjust_offset], lane);
-	}
-
-	ln_align->raw = dpcd_buf[2];
-
-	if (is_repeater(link_training_setting, offset)) {
-		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
-				" 0x%X Lane01Status = %x\n 0x%X Lane23Status = %x\n ",
-			__func__,
-			offset,
-			lane01_status_address, dpcd_buf[0],
-			lane01_status_address + 1, dpcd_buf[1]);
-
-		lane01_adjust_address = DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1 +
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-
-		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
-				" 0x%X Lane01AdjustRequest = %x\n 0x%X Lane23AdjustRequest = %x\n",
-					__func__,
-					offset,
-					lane01_adjust_address,
-					dpcd_buf[lane_adjust_offset],
-					lane01_adjust_address + 1,
-					dpcd_buf[lane_adjust_offset + 1]);
-	} else {
-		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X Lane01Status = %x\n 0x%X Lane23Status = %x\n ",
-			__func__,
-			lane01_status_address, dpcd_buf[0],
-			lane01_status_address + 1, dpcd_buf[1]);
-
-		lane01_adjust_address = DP_ADJUST_REQUEST_LANE0_1;
-
-		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X Lane01AdjustRequest = %x\n 0x%X Lane23AdjustRequest = %x\n",
-			__func__,
-			lane01_adjust_address,
-			dpcd_buf[lane_adjust_offset],
-			lane01_adjust_address + 1,
-			dpcd_buf[lane_adjust_offset + 1]);
-	}
-
-	return status;
-}
-
-static enum dc_status dpcd_128b_132b_set_lane_settings(
-		struct dc_link *link,
-		const struct link_training_settings *link_training_setting)
-{
-	enum dc_status status = core_link_write_dpcd(link,
-			DP_TRAINING_LANE0_SET,
-			(uint8_t *)(link_training_setting->dpcd_lane_settings),
-			sizeof(link_training_setting->dpcd_lane_settings));
-
-	DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
-			__func__,
-			DP_TRAINING_LANE0_SET,
-			link_training_setting->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
-	return status;
-}
-
-
-enum dc_status dpcd_set_lane_settings(
-	struct dc_link *link,
-	const struct link_training_settings *link_training_setting,
-	uint32_t offset)
-{
-	unsigned int lane0_set_address;
-	enum dc_status status;
-
-	lane0_set_address = DP_TRAINING_LANE0_SET;
-
-	if (is_repeater(link_training_setting, offset))
-		lane0_set_address = DP_TRAINING_LANE0_SET_PHY_REPEATER1 +
-		((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-
-	status = core_link_write_dpcd(link,
-		lane0_set_address,
-		(uint8_t *)(link_training_setting->dpcd_lane_settings),
-		link_training_setting->link_settings.lane_count);
-
-	if (is_repeater(link_training_setting, offset)) {
-		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n"
-				" 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
-			__func__,
-			offset,
-			lane0_set_address,
-			link_training_setting->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
-			link_training_setting->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
-			link_training_setting->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
-			link_training_setting->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
-
-	} else {
-		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
-			__func__,
-			lane0_set_address,
-			link_training_setting->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
-			link_training_setting->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
-			link_training_setting->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
-			link_training_setting->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
-	}
-
-	return status;
-}
-
-bool dp_is_max_vs_reached(
-	const struct link_training_settings *lt_settings)
-{
-	uint32_t lane;
-	for (lane = 0; lane <
-		(uint32_t)(lt_settings->link_settings.lane_count);
-		lane++) {
-		if (lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET
-			== VOLTAGE_SWING_MAX_LEVEL)
-			return true;
-	}
-	return false;
-
-}
-
-static bool perform_post_lt_adj_req_sequence(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings)
-{
-	enum dc_lane_count lane_count =
-	lt_settings->link_settings.lane_count;
-
-	uint32_t adj_req_count;
-	uint32_t adj_req_timer;
-	bool req_drv_setting_changed;
-	uint32_t lane;
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	req_drv_setting_changed = false;
-	for (adj_req_count = 0; adj_req_count < POST_LT_ADJ_REQ_LIMIT;
-	adj_req_count++) {
-
-		req_drv_setting_changed = false;
-
-		for (adj_req_timer = 0;
-			adj_req_timer < POST_LT_ADJ_REQ_TIMEOUT;
-			adj_req_timer++) {
-
-			dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				DPRX);
-
-			if (dpcd_lane_status_updated.bits.
-					POST_LT_ADJ_REQ_IN_PROGRESS == 0)
-				return true;
-
-			if (!dp_is_cr_done(lane_count, dpcd_lane_status))
-				return false;
-
-			if (!dp_is_ch_eq_done(lane_count, dpcd_lane_status) ||
-					!dp_is_symbol_locked(lane_count, dpcd_lane_status) ||
-					!dp_is_interlane_aligned(dpcd_lane_status_updated))
-				return false;
-
-			for (lane = 0; lane < (uint32_t)(lane_count); lane++) {
-
-				if (lt_settings->
-				dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET !=
-				dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_LANE ||
-				lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET !=
-				dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_LANE) {
-
-					req_drv_setting_changed = true;
-					break;
-				}
-			}
-
-			if (req_drv_setting_changed) {
-				dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-						lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-
-				dc_link_dp_set_drive_settings(link,
-						link_res,
-						lt_settings);
-				break;
-			}
-
-			msleep(1);
-		}
-
-		if (!req_drv_setting_changed) {
-			DC_LOG_WARNING("%s: Post Link Training Adjust Request Timed out\n",
-				__func__);
-
-			ASSERT(0);
-			return true;
-		}
-	}
-	DC_LOG_WARNING("%s: Post Link Training Adjust Request limit reached\n",
-		__func__);
-
-	ASSERT(0);
-	return true;
-
-}
-
-/* Only used for channel equalization */
-uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval)
-{
-	unsigned int aux_rd_interval_us = 400;
-
-	switch (dpcd_aux_read_interval) {
-	case 0x01:
-		aux_rd_interval_us = 4000;
-		break;
-	case 0x02:
-		aux_rd_interval_us = 8000;
-		break;
-	case 0x03:
-		aux_rd_interval_us = 12000;
-		break;
-	case 0x04:
-		aux_rd_interval_us = 16000;
-		break;
-	case 0x05:
-		aux_rd_interval_us = 32000;
-		break;
-	case 0x06:
-		aux_rd_interval_us = 64000;
-		break;
-	default:
-		break;
-	}
-
-	return aux_rd_interval_us;
-}
-
-enum link_training_result dp_get_cr_failure(enum dc_lane_count ln_count,
-					union lane_status *dpcd_lane_status)
-{
-	enum link_training_result result = LINK_TRAINING_SUCCESS;
-
-	if (ln_count >= LANE_COUNT_ONE && !dpcd_lane_status[0].bits.CR_DONE_0)
-		result = LINK_TRAINING_CR_FAIL_LANE0;
-	else if (ln_count >= LANE_COUNT_TWO && !dpcd_lane_status[1].bits.CR_DONE_0)
-		result = LINK_TRAINING_CR_FAIL_LANE1;
-	else if (ln_count >= LANE_COUNT_FOUR && !dpcd_lane_status[2].bits.CR_DONE_0)
-		result = LINK_TRAINING_CR_FAIL_LANE23;
-	else if (ln_count >= LANE_COUNT_FOUR && !dpcd_lane_status[3].bits.CR_DONE_0)
-		result = LINK_TRAINING_CR_FAIL_LANE23;
-	return result;
-}
-
-static enum link_training_result perform_channel_equalization_sequence(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings,
-	uint32_t offset)
-{
-	enum dc_dp_training_pattern tr_pattern;
-	uint32_t retries_ch_eq;
-	uint32_t wait_time_microsec;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	/* Note: also check that TPS4 is a supported feature*/
-	tr_pattern = lt_settings->pattern_for_eq;
-
-	if (is_repeater(lt_settings, offset) && dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
-		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
-
-	dp_set_hw_training_pattern(link, link_res, tr_pattern, offset);
-
-	for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
-		retries_ch_eq++) {
-
-		dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
-
-		/* 2. update DPCD*/
-		if (!retries_ch_eq)
-			/* EPR #361076 - write as a 5-byte burst,
-			 * but only for the 1-st iteration
-			 */
-
-			dpcd_set_lt_pattern_and_lane_settings(
-				link,
-				lt_settings,
-				tr_pattern, offset);
-		else
-			dpcd_set_lane_settings(link, lt_settings, offset);
-
-		/* 3. wait for receiver to lock-on*/
-		wait_time_microsec = lt_settings->eq_pattern_time;
-
-		if (is_repeater(lt_settings, offset))
-			wait_time_microsec =
-					dp_translate_training_aux_read_interval(
-						link->dpcd_caps.lttpr_caps.aux_rd_interval[offset - 1]);
-
-		dp_wait_for_training_aux_rd_interval(
-				link,
-				wait_time_microsec);
-
-		/* 4. Read lane status and requested
-		 * drive settings as set by the sink*/
-
-		dp_get_lane_status_and_lane_adjust(
-			link,
-			lt_settings,
-			dpcd_lane_status,
-			&dpcd_lane_status_updated,
-			dpcd_lane_adjust,
-			offset);
-
-		/* 5. check CR done*/
-		if (!dp_is_cr_done(lane_count, dpcd_lane_status))
-			return dpcd_lane_status[0].bits.CR_DONE_0 ?
-					LINK_TRAINING_EQ_FAIL_CR_PARTIAL :
-					LINK_TRAINING_EQ_FAIL_CR;
-
-		/* 6. check CHEQ done*/
-		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
-				dp_is_symbol_locked(lane_count, dpcd_lane_status) &&
-				dp_is_interlane_aligned(dpcd_lane_status_updated))
-			return LINK_TRAINING_SUCCESS;
-
-		/* 7. update VS/PE/PC2 in lt_settings*/
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-	}
-
-	return LINK_TRAINING_EQ_FAIL_EQ;
-
-}
-
-static void start_clock_recovery_pattern_early(struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings,
-		uint32_t offset)
-{
-	DC_LOG_HW_LINK_TRAINING("%s\n GPU sends TPS1. Wait 400us.\n",
-			__func__);
-	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
-	dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
-	udelay(400);
-}
-
-static enum link_training_result perform_clock_recovery_sequence(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings,
-	uint32_t offset)
-{
-	uint32_t retries_cr;
-	uint32_t retry_count;
-	uint32_t wait_time_microsec;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
-	union lane_align_status_updated dpcd_lane_status_updated;
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	retries_cr = 0;
-	retry_count = 0;
-
-	memset(&dpcd_lane_status, '\0', sizeof(dpcd_lane_status));
-	memset(&dpcd_lane_status_updated, '\0',
-	sizeof(dpcd_lane_status_updated));
-
-	if (!link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
-
-	/* najeeb - The synaptics MST hub can put the LT in
-	* infinite loop by switching the VS
-	*/
-	/* between level 0 and level 1 continuously, here
-	* we try for CR lock for LinkTrainingMaxCRRetry count*/
-	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
-		(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
-
-
-		/* 1. call HWSS to set lane settings*/
-		dp_set_hw_lane_settings(
-				link,
-				link_res,
-				lt_settings,
-				offset);
-
-		/* 2. update DPCD of the receiver*/
-		if (!retry_count)
-			/* EPR #361076 - write as a 5-byte burst,
-			 * but only for the 1-st iteration.*/
-			dpcd_set_lt_pattern_and_lane_settings(
-					link,
-					lt_settings,
-					lt_settings->pattern_for_cr,
-					offset);
-		else
-			dpcd_set_lane_settings(
-					link,
-					lt_settings,
-					offset);
-
-		/* 3. wait receiver to lock-on*/
-		wait_time_microsec = lt_settings->cr_pattern_time;
-
-		dp_wait_for_training_aux_rd_interval(
-				link,
-				wait_time_microsec);
-
-		/* 4. Read lane status and requested drive
-		* settings as set by the sink
-		*/
-		dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				offset);
-
-		/* 5. check CR done*/
-		if (dp_is_cr_done(lane_count, dpcd_lane_status))
-			return LINK_TRAINING_SUCCESS;
-
-		/* 6. max VS reached*/
-		if ((dp_get_link_encoding_format(&lt_settings->link_settings) ==
-				DP_8b_10b_ENCODING) &&
-				dp_is_max_vs_reached(lt_settings))
-			break;
-
-		/* 7. same lane settings*/
-		/* Note: settings are the same for all lanes,
-		 * so comparing first lane is sufficient*/
-		if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING) &&
-				lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
-						dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
-			retries_cr++;
-		else if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
-				lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE ==
-						dpcd_lane_adjust[0].tx_ffe.PRESET_VALUE)
-			retries_cr++;
-		else
-			retries_cr = 0;
-
-		/* 8. update VS/PE/PC2 in lt_settings*/
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-		retry_count++;
-	}
-
-	if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
-		ASSERT(0);
-		DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
-			__func__,
-			LINK_TRAINING_MAX_CR_RETRY);
-
-	}
-
-	return dp_get_cr_failure(lane_count, dpcd_lane_status);
-}
-
-static inline enum link_training_result dp_transition_to_video_idle(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings,
-	enum link_training_result status)
-{
-	union lane_count_set lane_count_set = {0};
-
-	/* 4. mainlink output idle pattern*/
-	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
-
-	/*
-	 * 5. post training adjust if required
-	 * If the upstream DPTX and downstream DPRX both support TPS4,
-	 * TPS4 must be used instead of POST_LT_ADJ_REQ.
-	 */
-	if (link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED != 1 ||
-			lt_settings->pattern_for_eq >= DP_TRAINING_PATTERN_SEQUENCE_4) {
-		/* delay 5ms after Main Link output idle pattern and then check
-		 * DPCD 0202h.
-		 */
-		if (link->connector_signal != SIGNAL_TYPE_EDP && status == LINK_TRAINING_SUCCESS) {
-			msleep(5);
-			status = dp_check_link_loss_status(link, lt_settings);
-		}
-		return status;
-	}
-
-	if (status == LINK_TRAINING_SUCCESS &&
-		perform_post_lt_adj_req_sequence(link, link_res, lt_settings) == false)
-		status = LINK_TRAINING_LQA_FAIL;
-
-	lane_count_set.bits.LANE_COUNT_SET = lt_settings->link_settings.lane_count;
-	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
-	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
-
-	core_link_write_dpcd(
-		link,
-		DP_LANE_COUNT_SET,
-		&lane_count_set.raw,
-		sizeof(lane_count_set));
-
-	return status;
-}
-
-enum link_training_result dp_check_link_loss_status(
-	struct dc_link *link,
-	const struct link_training_settings *link_training_setting)
-{
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-	union lane_status lane_status;
-	uint8_t dpcd_buf[6] = {0};
-	uint32_t lane;
-
-	core_link_read_dpcd(
-			link,
-			DP_SINK_COUNT,
-			(uint8_t *)(dpcd_buf),
-			sizeof(dpcd_buf));
-
-	/*parse lane status*/
-	for (lane = 0; lane < link->cur_link_settings.lane_count; lane++) {
-		/*
-		 * check lanes status
-		 */
-		lane_status.raw = get_nibble_at_index(&dpcd_buf[2], lane);
-
-		if (!lane_status.bits.CHANNEL_EQ_DONE_0 ||
-			!lane_status.bits.CR_DONE_0 ||
-			!lane_status.bits.SYMBOL_LOCKED_0) {
-			/* if one of the channel equalization, clock
-			 * recovery or symbol lock is dropped
-			 * consider it as (link has been
-			 * dropped) dp sink status has changed
-			 */
-			status = LINK_TRAINING_LINK_LOSS;
-			break;
-		}
-	}
-
-	return status;
-}
-
-static inline void decide_8b_10b_training_settings(
-	 struct dc_link *link,
-	const struct dc_link_settings *link_setting,
-	struct link_training_settings *lt_settings)
-{
-	memset(lt_settings, '\0', sizeof(struct link_training_settings));
-
-	/* Initialize link settings */
-	lt_settings->link_settings.use_link_rate_set = link_setting->use_link_rate_set;
-	lt_settings->link_settings.link_rate_set = link_setting->link_rate_set;
-	lt_settings->link_settings.link_rate = link_setting->link_rate;
-	lt_settings->link_settings.lane_count = link_setting->lane_count;
-	/* TODO hard coded to SS for now
-	 * lt_settings.link_settings.link_spread =
-	 * dal_display_path_is_ss_supported(
-	 * path_mode->display_path) ?
-	 * LINK_SPREAD_05_DOWNSPREAD_30KHZ :
-	 * LINK_SPREAD_DISABLED;
-	 */
-	lt_settings->link_settings.link_spread = link->dp_ss_off ?
-			LINK_SPREAD_DISABLED : LINK_SPREAD_05_DOWNSPREAD_30KHZ;
-	lt_settings->cr_pattern_time = get_cr_training_aux_rd_interval(link, link_setting);
-	lt_settings->eq_pattern_time = get_eq_training_aux_rd_interval(link, link_setting);
-	lt_settings->pattern_for_cr = decide_cr_training_pattern(link_setting);
-	lt_settings->pattern_for_eq = decide_eq_training_pattern(link, link_setting);
-	lt_settings->enhanced_framing = 1;
-	lt_settings->should_set_fec_ready = true;
-	lt_settings->disallow_per_lane_settings = true;
-	lt_settings->always_match_dpcd_with_hw_lane_settings = true;
-	lt_settings->lttpr_mode = dp_decide_8b_10b_lttpr_mode(link);
-	dp_hw_to_dpcd_lane_settings(lt_settings, lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-}
-
-static inline void decide_128b_132b_training_settings(struct dc_link *link,
-		const struct dc_link_settings *link_settings,
-		struct link_training_settings *lt_settings)
-{
-	memset(lt_settings, 0, sizeof(*lt_settings));
-
-	lt_settings->link_settings = *link_settings;
-	/* TODO: should decide link spread when populating link_settings */
-	lt_settings->link_settings.link_spread = link->dp_ss_off ? LINK_SPREAD_DISABLED :
-			LINK_SPREAD_05_DOWNSPREAD_30KHZ;
-
-	lt_settings->pattern_for_cr = decide_cr_training_pattern(link_settings);
-	lt_settings->pattern_for_eq = decide_eq_training_pattern(link, link_settings);
-	lt_settings->eq_pattern_time = 2500;
-	lt_settings->eq_wait_time_limit = 400000;
-	lt_settings->eq_loop_count_limit = 20;
-	lt_settings->pattern_for_cds = DP_128b_132b_TPS2_CDS;
-	lt_settings->cds_pattern_time = 2500;
-	lt_settings->cds_wait_time_limit = (dp_convert_to_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt) + 1) * 20000;
-	lt_settings->disallow_per_lane_settings = true;
-	lt_settings->lttpr_mode = dp_decide_128b_132b_lttpr_mode(link);
-	dp_hw_to_dpcd_lane_settings(lt_settings,
-			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-}
-
-void dp_decide_training_settings(
-		struct dc_link *link,
-		const struct dc_link_settings *link_settings,
-		struct link_training_settings *lt_settings)
-{
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
-		decide_8b_10b_training_settings(link, link_settings, lt_settings);
-	else if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING)
-		decide_128b_132b_training_settings(link, link_settings, lt_settings);
-}
-
-static void override_training_settings(
-		struct dc_link *link,
-		const struct dc_link_training_overrides *overrides,
-		struct link_training_settings *lt_settings)
-{
-	uint32_t lane;
-
-	/* Override link spread */
-	if (!link->dp_ss_off && overrides->downspread != NULL)
-		lt_settings->link_settings.link_spread = *overrides->downspread ?
-				LINK_SPREAD_05_DOWNSPREAD_30KHZ
-				: LINK_SPREAD_DISABLED;
-
-	/* Override lane settings */
-	if (overrides->voltage_swing != NULL)
-		lt_settings->voltage_swing = overrides->voltage_swing;
-	if (overrides->pre_emphasis != NULL)
-		lt_settings->pre_emphasis = overrides->pre_emphasis;
-	if (overrides->post_cursor2 != NULL)
-		lt_settings->post_cursor2 = overrides->post_cursor2;
-	if (overrides->ffe_preset != NULL)
-		lt_settings->ffe_preset = overrides->ffe_preset;
-	/* Override HW lane settings with BIOS forced values if present */
-	if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN &&
-			lt_settings->lttpr_mode == LTTPR_MODE_TRANSPARENT) {
-		lt_settings->voltage_swing = &link->bios_forced_drive_settings.VOLTAGE_SWING;
-		lt_settings->pre_emphasis = &link->bios_forced_drive_settings.PRE_EMPHASIS;
-		lt_settings->always_match_dpcd_with_hw_lane_settings = false;
-	}
-	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-		lt_settings->hw_lane_settings[lane].VOLTAGE_SWING =
-			lt_settings->voltage_swing != NULL ?
-			*lt_settings->voltage_swing :
-			VOLTAGE_SWING_LEVEL0;
-		lt_settings->hw_lane_settings[lane].PRE_EMPHASIS =
-			lt_settings->pre_emphasis != NULL ?
-			*lt_settings->pre_emphasis
-			: PRE_EMPHASIS_DISABLED;
-		lt_settings->hw_lane_settings[lane].POST_CURSOR2 =
-			lt_settings->post_cursor2 != NULL ?
-			*lt_settings->post_cursor2
-			: POST_CURSOR2_DISABLED;
-	}
-
-	if (lt_settings->always_match_dpcd_with_hw_lane_settings)
-		dp_hw_to_dpcd_lane_settings(lt_settings,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-
-	/* Initialize training timings */
-	if (overrides->cr_pattern_time != NULL)
-		lt_settings->cr_pattern_time = *overrides->cr_pattern_time;
-
-	if (overrides->eq_pattern_time != NULL)
-		lt_settings->eq_pattern_time = *overrides->eq_pattern_time;
-
-	if (overrides->pattern_for_cr != NULL)
-		lt_settings->pattern_for_cr = *overrides->pattern_for_cr;
-	if (overrides->pattern_for_eq != NULL)
-		lt_settings->pattern_for_eq = *overrides->pattern_for_eq;
-
-	if (overrides->enhanced_framing != NULL)
-		lt_settings->enhanced_framing = *overrides->enhanced_framing;
-
-	if (link->preferred_training_settings.fec_enable != NULL)
-		lt_settings->should_set_fec_ready = *link->preferred_training_settings.fec_enable;
-
-	#if defined(CONFIG_DRM_AMD_DC_DCN)
-	/* Check DP tunnel LTTPR mode debug option. */
-	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA && link->dc->debug.dpia_debug.bits.force_non_lttpr)
-		lt_settings->lttpr_mode = LTTPR_MODE_NON_LTTPR;
-
-#endif
-	dp_get_lttpr_mode_override(link, &lt_settings->lttpr_mode);
-
-}
-
-uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count)
-{
-	switch (lttpr_repeater_count) {
-	case 0x80: // 1 lttpr repeater
-		return 1;
-	case 0x40: // 2 lttpr repeaters
-		return 2;
-	case 0x20: // 3 lttpr repeaters
-		return 3;
-	case 0x10: // 4 lttpr repeaters
-		return 4;
-	case 0x08: // 5 lttpr repeaters
-		return 5;
-	case 0x04: // 6 lttpr repeaters
-		return 6;
-	case 0x02: // 7 lttpr repeaters
-		return 7;
-	case 0x01: // 8 lttpr repeaters
-		return 8;
-	default:
-		break;
-	}
-	return 0; // invalid value
-}
-
-static enum dc_status configure_lttpr_mode_transparent(struct dc_link *link)
-{
-	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
-
-	DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
-	return core_link_write_dpcd(link,
-			DP_PHY_REPEATER_MODE,
-			(uint8_t *)&repeater_mode,
-			sizeof(repeater_mode));
-}
-
-static enum dc_status configure_lttpr_mode_non_transparent(
-		struct dc_link *link,
-		const struct link_training_settings *lt_settings)
-{
-	/* aux timeout is already set to extended */
-	/* RESET/SET lttpr mode to enable non transparent mode */
-	uint8_t repeater_cnt;
-	uint32_t aux_interval_address;
-	uint8_t repeater_id;
-	enum dc_status result = DC_ERROR_UNEXPECTED;
-	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
-
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(&lt_settings->link_settings);
-
-	if (encoding == DP_8b_10b_ENCODING) {
-		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
-		result = core_link_write_dpcd(link,
-				DP_PHY_REPEATER_MODE,
-				(uint8_t *)&repeater_mode,
-				sizeof(repeater_mode));
-
-	}
-
-	if (result == DC_OK) {
-		link->dpcd_caps.lttpr_caps.mode = repeater_mode;
-	}
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-
-		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Non Transparent Mode\n", __func__);
-
-		repeater_mode = DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
-		result = core_link_write_dpcd(link,
-				DP_PHY_REPEATER_MODE,
-				(uint8_t *)&repeater_mode,
-				sizeof(repeater_mode));
-
-		if (result == DC_OK) {
-			link->dpcd_caps.lttpr_caps.mode = repeater_mode;
-		}
-
-		if (encoding == DP_8b_10b_ENCODING) {
-			repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-			/* Driver does not need to train the first hop. Skip DPCD read and clear
-			 * AUX_RD_INTERVAL for DPTX-to-DPIA hop.
-			 */
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-				link->dpcd_caps.lttpr_caps.aux_rd_interval[--repeater_cnt] = 0;
-
-			for (repeater_id = repeater_cnt; repeater_id > 0; repeater_id--) {
-				aux_interval_address = DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1 +
-							((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (repeater_id - 1));
-				core_link_read_dpcd(
-					link,
-					aux_interval_address,
-					(uint8_t *)&link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1],
-					sizeof(link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1]));
-				link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1] &= 0x7F;
-			}
-		}
-	}
-
-	return result;
-}
-
-static void repeater_training_done(struct dc_link *link, uint32_t offset)
-{
-	union dpcd_training_pattern dpcd_pattern = {0};
-
-	const uint32_t dpcd_base_lt_offset =
-			DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-	/* Set training not in progress*/
-	dpcd_pattern.v1_4.TRAINING_PATTERN_SET = DPCD_TRAINING_PATTERN_VIDEOIDLE;
-
-	core_link_write_dpcd(
-		link,
-		dpcd_base_lt_offset,
-		&dpcd_pattern.raw,
-		1);
-
-	DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Id: %d 0x%X pattern = %x\n",
-		__func__,
-		offset,
-		dpcd_base_lt_offset,
-		dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-}
-
-static void print_status_message(
-	struct dc_link *link,
-	const struct link_training_settings *lt_settings,
-	enum link_training_result status)
-{
-	char *link_rate = "Unknown";
-	char *lt_result = "Unknown";
-	char *lt_spread = "Disabled";
-
-	switch (lt_settings->link_settings.link_rate) {
-	case LINK_RATE_LOW:
-		link_rate = "RBR";
-		break;
-	case LINK_RATE_RATE_2:
-		link_rate = "R2";
-		break;
-	case LINK_RATE_RATE_3:
-		link_rate = "R3";
-		break;
-	case LINK_RATE_HIGH:
-		link_rate = "HBR";
-		break;
-	case LINK_RATE_RBR2:
-		link_rate = "RBR2";
-		break;
-	case LINK_RATE_RATE_6:
-		link_rate = "R6";
-		break;
-	case LINK_RATE_HIGH2:
-		link_rate = "HBR2";
-		break;
-	case LINK_RATE_HIGH3:
-		link_rate = "HBR3";
-		break;
-	case LINK_RATE_UHBR10:
-		link_rate = "UHBR10";
-		break;
-	case LINK_RATE_UHBR13_5:
-		link_rate = "UHBR13.5";
-		break;
-	case LINK_RATE_UHBR20:
-		link_rate = "UHBR20";
-		break;
-	default:
-		break;
-	}
-
-	switch (status) {
-	case LINK_TRAINING_SUCCESS:
-		lt_result = "pass";
-		break;
-	case LINK_TRAINING_CR_FAIL_LANE0:
-		lt_result = "CR failed lane0";
-		break;
-	case LINK_TRAINING_CR_FAIL_LANE1:
-		lt_result = "CR failed lane1";
-		break;
-	case LINK_TRAINING_CR_FAIL_LANE23:
-		lt_result = "CR failed lane23";
-		break;
-	case LINK_TRAINING_EQ_FAIL_CR:
-		lt_result = "CR failed in EQ";
-		break;
-	case LINK_TRAINING_EQ_FAIL_CR_PARTIAL:
-		lt_result = "CR failed in EQ partially";
-		break;
-	case LINK_TRAINING_EQ_FAIL_EQ:
-		lt_result = "EQ failed";
-		break;
-	case LINK_TRAINING_LQA_FAIL:
-		lt_result = "LQA failed";
-		break;
-	case LINK_TRAINING_LINK_LOSS:
-		lt_result = "Link loss";
-		break;
-	case DP_128b_132b_LT_FAILED:
-		lt_result = "LT_FAILED received";
-		break;
-	case DP_128b_132b_MAX_LOOP_COUNT_REACHED:
-		lt_result = "max loop count reached";
-		break;
-	case DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT:
-		lt_result = "channel EQ timeout";
-		break;
-	case DP_128b_132b_CDS_DONE_TIMEOUT:
-		lt_result = "CDS timeout";
-		break;
-	default:
-		break;
-	}
-
-	switch (lt_settings->link_settings.link_spread) {
-	case LINK_SPREAD_DISABLED:
-		lt_spread = "Disabled";
-		break;
-	case LINK_SPREAD_05_DOWNSPREAD_30KHZ:
-		lt_spread = "0.5% 30KHz";
-		break;
-	case LINK_SPREAD_05_DOWNSPREAD_33KHZ:
-		lt_spread = "0.5% 33KHz";
-		break;
-	default:
-		break;
-	}
-
-	/* Connectivity log: link training */
-
-	/* TODO - DP2.0 Log: add connectivity log for FFE PRESET */
-
-	CONN_MSG_LT(link, "%sx%d %s VS=%d, PE=%d, DS=%s",
-				link_rate,
-				lt_settings->link_settings.lane_count,
-				lt_result,
-				lt_settings->hw_lane_settings[0].VOLTAGE_SWING,
-				lt_settings->hw_lane_settings[0].PRE_EMPHASIS,
-				lt_spread);
-}
-
-void dc_link_dp_set_drive_settings(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings)
-{
-	/* program ASIC PHY settings*/
-	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
-
-	dp_hw_to_dpcd_lane_settings(lt_settings,
-			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-
-	/* Notify DP sink the PHY settings from source */
-	dpcd_set_lane_settings(link, lt_settings, DPRX);
-}
-
-bool dc_link_dp_perform_link_training_skip_aux(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_setting)
-{
-	struct link_training_settings lt_settings = {0};
-
-	dp_decide_training_settings(
-			link,
-			link_setting,
-			&lt_settings);
-	override_training_settings(
-			link,
-			&link->preferred_training_settings,
-			&lt_settings);
-
-	/* 1. Perform_clock_recovery_sequence. */
-
-	/* transmit training pattern for clock recovery */
-	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_cr, DPRX);
-
-	/* call HWSS to set lane settings*/
-	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
-
-	/* wait receiver to lock-on*/
-	dp_wait_for_training_aux_rd_interval(link, lt_settings.cr_pattern_time);
-
-	/* 2. Perform_channel_equalization_sequence. */
-
-	/* transmit training pattern for channel equalization. */
-	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_eq, DPRX);
-
-	/* call HWSS to set lane settings*/
-	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
-
-	/* wait receiver to lock-on. */
-	dp_wait_for_training_aux_rd_interval(link, lt_settings.eq_pattern_time);
-
-	/* 3. Perform_link_training_int. */
-
-	/* Mainlink output idle pattern. */
-	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
-
-	print_status_message(link, &lt_settings, LINK_TRAINING_SUCCESS);
-
-	return true;
-}
-
-enum dc_status dpcd_configure_lttpr_mode(struct dc_link *link, struct link_training_settings *lt_settings)
-{
-	enum dc_status status = DC_OK;
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_TRANSPARENT)
-		status = configure_lttpr_mode_transparent(link);
-
-	else if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		status = configure_lttpr_mode_non_transparent(link, lt_settings);
-
-	return status;
-}
-
-static void dpcd_exit_training_mode(struct dc_link *link, enum dp_link_encoding encoding)
-{
-	uint8_t sink_status = 0;
-	uint8_t i;
-
-	/* clear training pattern set */
-	dpcd_set_training_pattern(link, DP_TRAINING_PATTERN_VIDEOIDLE);
-
-	if (encoding == DP_128b_132b_ENCODING) {
-		/* poll for intra-hop disable */
-		for (i = 0; i < 10; i++) {
-			if ((core_link_read_dpcd(link, DP_SINK_STATUS, &sink_status, 1) == DC_OK) &&
-					(sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION) == 0)
-				break;
-			udelay(1000);
-		}
-	}
-}
-
-enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
-		struct link_training_settings *lt_settings)
-{
-	enum dp_link_encoding encoding =
-			dp_get_link_encoding_format(
-					&lt_settings->link_settings);
-	enum dc_status status;
-
-	status = core_link_write_dpcd(
-			link,
-			DP_MAIN_LINK_CHANNEL_CODING_SET,
-			(uint8_t *) &encoding,
-			1);
-	DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X MAIN_LINK_CHANNEL_CODING_SET = %x\n",
-					__func__,
-					DP_MAIN_LINK_CHANNEL_CODING_SET,
-					encoding);
-
-	return status;
-}
-
-static void dpcd_128b_132b_get_aux_rd_interval(struct dc_link *link,
-		uint32_t *interval_in_us)
-{
-	union dp_128b_132b_training_aux_rd_interval dpcd_interval;
-	uint32_t interval_unit = 0;
-
-	dpcd_interval.raw = 0;
-	core_link_read_dpcd(link, DP_128b_132b_TRAINING_AUX_RD_INTERVAL,
-			&dpcd_interval.raw, sizeof(dpcd_interval.raw));
-	interval_unit = dpcd_interval.bits.UNIT ? 1 : 2; /* 0b = 2 ms, 1b = 1 ms */
-	/* (128b/132b_TRAINING_AUX_RD_INTERVAL value + 1) *
-	 * INTERVAL_UNIT. The maximum is 256 ms
-	 */
-	*interval_in_us = (dpcd_interval.bits.VALUE + 1) * interval_unit * 1000;
-}
-
-static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	uint8_t loop_count;
-	uint32_t aux_rd_interval = 0;
-	uint32_t wait_time = 0;
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	enum dc_status status = DC_OK;
-	enum link_training_result result = LINK_TRAINING_SUCCESS;
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	/* Transmit 128b/132b_TPS1 over Main-Link */
-	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, DPRX);
-	/* Set TRAINING_PATTERN_SET to 01h */
-	dpcd_set_training_pattern(link, lt_settings->pattern_for_cr);
-
-	/* Adjust TX_FFE_PRESET_VALUE and Transmit 128b/132b_TPS2 over Main-Link */
-	dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
-	dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
-			&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
-	dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
-	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_eq, DPRX);
-
-	/* Set loop counter to start from 1 */
-	loop_count = 1;
-
-	/* Set TRAINING_PATTERN_SET to 02h and TX_FFE_PRESET_VALUE in one AUX transaction */
-	dpcd_set_lt_pattern_and_lane_settings(link, lt_settings,
-			lt_settings->pattern_for_eq, DPRX);
-
-	/* poll for channel EQ done */
-	while (result == LINK_TRAINING_SUCCESS) {
-		dp_wait_for_training_aux_rd_interval(link, aux_rd_interval);
-		wait_time += aux_rd_interval;
-		status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
-				&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-		dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-		} else if (dp_is_ch_eq_done(lt_settings->link_settings.lane_count,
-				dpcd_lane_status)) {
-			/* pass */
-			break;
-		} else if (loop_count >= lt_settings->eq_loop_count_limit) {
-			result = DP_128b_132b_MAX_LOOP_COUNT_REACHED;
-		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
-			result = DP_128b_132b_LT_FAILED;
-		} else {
-			dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
-			dpcd_128b_132b_set_lane_settings(link, lt_settings);
-		}
-		loop_count++;
-	}
-
-	/* poll for EQ interlane align done */
-	while (result == LINK_TRAINING_SUCCESS) {
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-		} else if (dpcd_lane_status_updated.bits.EQ_INTERLANE_ALIGN_DONE_128b_132b) {
-			/* pass */
-			break;
-		} else if (wait_time >= lt_settings->eq_wait_time_limit) {
-			result = DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT;
-		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
-			result = DP_128b_132b_LT_FAILED;
-		} else {
-			dp_wait_for_training_aux_rd_interval(link,
-					lt_settings->eq_pattern_time);
-			wait_time += lt_settings->eq_pattern_time;
-			status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
-					&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
-		}
-	}
-
-	return result;
-}
-
-static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	/* Assumption: assume hardware has transmitted eq pattern */
-	enum dc_status status = DC_OK;
-	enum link_training_result result = LINK_TRAINING_SUCCESS;
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-	uint32_t wait_time = 0;
-
-	/* initiate CDS done sequence */
-	dpcd_set_training_pattern(link, lt_settings->pattern_for_cds);
-
-	/* poll for CDS interlane align done and symbol lock */
-	while (result  == LINK_TRAINING_SUCCESS) {
-		dp_wait_for_training_aux_rd_interval(link,
-				lt_settings->cds_pattern_time);
-		wait_time += lt_settings->cds_pattern_time;
-		status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
-						&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-		} else if (dp_is_symbol_locked(lt_settings->link_settings.lane_count, dpcd_lane_status) &&
-				dpcd_lane_status_updated.bits.CDS_INTERLANE_ALIGN_DONE_128b_132b) {
-			/* pass */
-			break;
-		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
-			result = DP_128b_132b_LT_FAILED;
-		} else if (wait_time >= lt_settings->cds_wait_time_limit) {
-			result = DP_128b_132b_CDS_DONE_TIMEOUT;
-		}
-	}
-
-	return result;
-}
-
-static enum link_training_result dp_perform_8b_10b_link_training(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-
-	uint8_t repeater_cnt;
-	uint8_t repeater_id;
-	uint8_t lane = 0;
-
-	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		start_clock_recovery_pattern_early(link, link_res, lt_settings, DPRX);
-
-	/* 1. set link rate, lane count and spread. */
-	dpcd_set_link_settings(link, lt_settings);
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-
-		/* 2. perform link training (set link training done
-		 *  to false is done as well)
-		 */
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
-				repeater_id--) {
-			status = perform_clock_recovery_sequence(link, link_res, lt_settings, repeater_id);
-
-			if (status != LINK_TRAINING_SUCCESS) {
-				repeater_training_done(link, repeater_id);
-				break;
-			}
-
-			status = perform_channel_equalization_sequence(link,
-					link_res,
-					lt_settings,
-					repeater_id);
-
-			repeater_training_done(link, repeater_id);
-
-			if (status != LINK_TRAINING_SUCCESS)
-				break;
-
-			for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-				lt_settings->dpcd_lane_settings[lane].raw = 0;
-				lt_settings->hw_lane_settings[lane].VOLTAGE_SWING = 0;
-				lt_settings->hw_lane_settings[lane].PRE_EMPHASIS = 0;
-			}
-		}
-	}
-
-	if (status == LINK_TRAINING_SUCCESS) {
-		status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
-		if (status == LINK_TRAINING_SUCCESS) {
-			status = perform_channel_equalization_sequence(link,
-								       link_res,
-								       lt_settings,
-								       DPRX);
-		}
-	}
-
-	return status;
-}
-
-static enum link_training_result dp_perform_128b_132b_link_training(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	enum link_training_result result = LINK_TRAINING_SUCCESS;
-
-	/* TODO - DP2.0 Link: remove legacy_dp2_lt logic */
-	if (link->dc->debug.legacy_dp2_lt) {
-		struct link_training_settings legacy_settings;
-
-		decide_8b_10b_training_settings(link,
-				&lt_settings->link_settings,
-				&legacy_settings);
-		return dp_perform_8b_10b_link_training(link, link_res, &legacy_settings);
-	}
-
-	dpcd_set_link_settings(link, lt_settings);
-
-	if (result == LINK_TRAINING_SUCCESS)
-		result = dp_perform_128b_132b_channel_eq_done_sequence(link, link_res, lt_settings);
-
-	if (result == LINK_TRAINING_SUCCESS)
-		result = dp_perform_128b_132b_cds_done_sequence(link, link_res, lt_settings);
-
-	return result;
-}
-
-static enum link_training_result perform_fixed_vs_pe_nontransparent_training_sequence(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-	uint8_t lane = 0;
-	uint8_t toggle_rate = 0x6;
-	uint8_t target_rate = 0x6;
-	bool apply_toggle_rate_wa = false;
-	uint8_t repeater_cnt;
-	uint8_t repeater_id;
-
-	/* Fixed VS/PE specific: Force CR AUX RD Interval to at least 16ms */
-	if (lt_settings->cr_pattern_time < 16000)
-		lt_settings->cr_pattern_time = 16000;
-
-	/* Fixed VS/PE specific: Toggle link rate */
-	apply_toggle_rate_wa = (link->vendor_specific_lttpr_link_rate_wa == target_rate);
-	target_rate = get_dpcd_link_rate(&lt_settings->link_settings);
-	toggle_rate = (target_rate == 0x6) ? 0xA : 0x6;
-
-	if (apply_toggle_rate_wa)
-		lt_settings->link_settings.link_rate = toggle_rate;
-
-	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		start_clock_recovery_pattern_early(link, link_res, lt_settings, DPRX);
-
-	/* 1. set link rate, lane count and spread. */
-	dpcd_set_link_settings(link, lt_settings);
-
-	/* Fixed VS/PE specific: Toggle link rate back*/
-	if (apply_toggle_rate_wa) {
-		core_link_write_dpcd(
-				link,
-				DP_LINK_BW_SET,
-				&target_rate,
-				1);
-	}
-
-	link->vendor_specific_lttpr_link_rate_wa = target_rate;
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-
-		/* 2. perform link training (set link training done
-		 *  to false is done as well)
-		 */
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
-				repeater_id--) {
-			status = perform_clock_recovery_sequence(link, link_res, lt_settings, repeater_id);
-
-			if (status != LINK_TRAINING_SUCCESS) {
-				repeater_training_done(link, repeater_id);
-				break;
-			}
-
-			status = perform_channel_equalization_sequence(link,
-					link_res,
-					lt_settings,
-					repeater_id);
-
-			repeater_training_done(link, repeater_id);
-
-			if (status != LINK_TRAINING_SUCCESS)
-				break;
-
-			for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
-				lt_settings->dpcd_lane_settings[lane].raw = 0;
-				lt_settings->hw_lane_settings[lane].VOLTAGE_SWING = 0;
-				lt_settings->hw_lane_settings[lane].PRE_EMPHASIS = 0;
-			}
-		}
-	}
-
-	if (status == LINK_TRAINING_SUCCESS) {
-		status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
-		if (status == LINK_TRAINING_SUCCESS) {
-			status = perform_channel_equalization_sequence(link,
-								       link_res,
-								       lt_settings,
-								       DPRX);
-		}
-	}
-
-	return status;
-}
-
-static enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings)
-{
-	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
-	const uint8_t offset = dp_convert_to_count(
-			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-	const uint8_t vendor_lttpr_write_data_intercept_en[4] = {0x1, 0x55, 0x63, 0x0};
-	const uint8_t vendor_lttpr_write_data_intercept_dis[4] = {0x1, 0x55, 0x63, 0x68};
-	uint32_t pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa;
-	uint8_t vendor_lttpr_write_data_vs[4] = {0x1, 0x51, 0x63, 0x0};
-	uint8_t vendor_lttpr_write_data_pe[4] = {0x1, 0x52, 0x63, 0x0};
-	uint32_t vendor_lttpr_write_address = 0xF004F;
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-	uint8_t lane = 0;
-	union down_spread_ctrl downspread = {0};
-	union lane_count_set lane_count_set = {0};
-	uint8_t toggle_rate;
-	uint8_t rate;
-
-	/* Only 8b/10b is supported */
-	ASSERT(dp_get_link_encoding_format(&lt_settings->link_settings) ==
-			DP_8b_10b_ENCODING);
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-		status = perform_fixed_vs_pe_nontransparent_training_sequence(link, link_res, lt_settings);
-		return status;
-	}
-
-	if (offset != 0xFF) {
-		vendor_lttpr_write_address +=
-				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
-
-		/* Certain display and cable configuration require extra delay */
-		if (offset > 2)
-			pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa * 2;
-	}
-
-	/* Vendor specific: Reset lane settings */
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
-
-	/* Vendor specific: Enable intercept */
-	core_link_write_dpcd(
-			link,
-			vendor_lttpr_write_address,
-			&vendor_lttpr_write_data_intercept_en[0],
-			sizeof(vendor_lttpr_write_data_intercept_en));
-
-	/* 1. set link rate, lane count and spread. */
-
-	downspread.raw = (uint8_t)(lt_settings->link_settings.link_spread);
-
-	lane_count_set.bits.LANE_COUNT_SET =
-	lt_settings->link_settings.lane_count;
-
-	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
-	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
-
-
-	if (lt_settings->pattern_for_eq < DP_TRAINING_PATTERN_SEQUENCE_4) {
-		lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED =
-				link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED;
-	}
-
-	core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
-		&downspread.raw, sizeof(downspread));
-
-	core_link_write_dpcd(link, DP_LANE_COUNT_SET,
-		&lane_count_set.raw, 1);
-
-	rate = get_dpcd_link_rate(&lt_settings->link_settings);
-
-	/* Vendor specific: Toggle link rate */
-	toggle_rate = (rate == 0x6) ? 0xA : 0x6;
-
-	if (link->vendor_specific_lttpr_link_rate_wa == rate) {
-		core_link_write_dpcd(
-				link,
-				DP_LINK_BW_SET,
-				&toggle_rate,
-				1);
-	}
-
-	link->vendor_specific_lttpr_link_rate_wa = rate;
-
-	core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
-
-	DC_LOG_HW_LINK_TRAINING("%s\n %x rate = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
-		__func__,
-		DP_LINK_BW_SET,
-		lt_settings->link_settings.link_rate,
-		DP_LANE_COUNT_SET,
-		lt_settings->link_settings.lane_count,
-		lt_settings->enhanced_framing,
-		DP_DOWNSPREAD_CTRL,
-		lt_settings->link_settings.link_spread);
-
-	/* 2. Perform link training */
-
-	/* Perform Clock Recovery Sequence */
-	if (status == LINK_TRAINING_SUCCESS) {
-		const uint8_t max_vendor_dpcd_retries = 10;
-		uint32_t retries_cr;
-		uint32_t retry_count;
-		uint32_t wait_time_microsec;
-		enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
-		union lane_align_status_updated dpcd_lane_status_updated;
-		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-		enum dc_status dpcd_status = DC_OK;
-		uint8_t i = 0;
-
-		retries_cr = 0;
-		retry_count = 0;
-
-		memset(&dpcd_lane_status, '\0', sizeof(dpcd_lane_status));
-		memset(&dpcd_lane_status_updated, '\0',
-		sizeof(dpcd_lane_status_updated));
-
-		while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
-			(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
-
-
-			/* 1. call HWSS to set lane settings */
-			dp_set_hw_lane_settings(
-					link,
-					link_res,
-					lt_settings,
-					0);
-
-			/* 2. update DPCD of the receiver */
-			if (!retry_count) {
-				/* EPR #361076 - write as a 5-byte burst,
-				 * but only for the 1-st iteration.
-				 */
-				dpcd_set_lt_pattern_and_lane_settings(
-						link,
-						lt_settings,
-						lt_settings->pattern_for_cr,
-						0);
-				/* Vendor specific: Disable intercept */
-				for (i = 0; i < max_vendor_dpcd_retries; i++) {
-					msleep(pre_disable_intercept_delay_ms);
-					dpcd_status = core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
-							&vendor_lttpr_write_data_intercept_dis[0],
-							sizeof(vendor_lttpr_write_data_intercept_dis));
-
-					if (dpcd_status == DC_OK)
-						break;
-
-					core_link_write_dpcd(
-							link,
-							vendor_lttpr_write_address,
-							&vendor_lttpr_write_data_intercept_en[0],
-							sizeof(vendor_lttpr_write_data_intercept_en));
-				}
-			} else {
-				vendor_lttpr_write_data_vs[3] = 0;
-				vendor_lttpr_write_data_pe[3] = 0;
-
-				for (lane = 0; lane < lane_count; lane++) {
-					vendor_lttpr_write_data_vs[3] |=
-							lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
-					vendor_lttpr_write_data_pe[3] |=
-							lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
-				}
-
-				/* Vendor specific: Update VS and PE to DPRX requested value */
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
-
-				dpcd_set_lane_settings(
-						link,
-						lt_settings,
-						0);
-			}
-
-			/* 3. wait receiver to lock-on*/
-			wait_time_microsec = lt_settings->cr_pattern_time;
-
-			dp_wait_for_training_aux_rd_interval(
-					link,
-					wait_time_microsec);
-
-			/* 4. Read lane status and requested drive
-			 * settings as set by the sink
-			 */
-			dp_get_lane_status_and_lane_adjust(
-					link,
-					lt_settings,
-					dpcd_lane_status,
-					&dpcd_lane_status_updated,
-					dpcd_lane_adjust,
-					0);
-
-			/* 5. check CR done*/
-			if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
-				status = LINK_TRAINING_SUCCESS;
-				break;
-			}
-
-			/* 6. max VS reached*/
-			if (dp_is_max_vs_reached(lt_settings))
-				break;
-
-			/* 7. same lane settings */
-			/* Note: settings are the same for all lanes,
-			 * so comparing first lane is sufficient
-			 */
-			if (lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
-					dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
-				retries_cr++;
-			else
-				retries_cr = 0;
-
-			/* 8. update VS/PE/PC2 in lt_settings*/
-			dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-					lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-			retry_count++;
-		}
-
-		if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
-			ASSERT(0);
-			DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
-				__func__,
-				LINK_TRAINING_MAX_CR_RETRY);
-
-		}
-
-		status = dp_get_cr_failure(lane_count, dpcd_lane_status);
-	}
-
-	/* Perform Channel EQ Sequence */
-	if (status == LINK_TRAINING_SUCCESS) {
-		enum dc_dp_training_pattern tr_pattern;
-		uint32_t retries_ch_eq;
-		uint32_t wait_time_microsec;
-		enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-		union lane_align_status_updated dpcd_lane_status_updated = {0};
-		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-		/* Note: also check that TPS4 is a supported feature*/
-		tr_pattern = lt_settings->pattern_for_eq;
-
-		dp_set_hw_training_pattern(link, link_res, tr_pattern, 0);
-
-		status = LINK_TRAINING_EQ_FAIL_EQ;
-
-		for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
-			retries_ch_eq++) {
-
-			dp_set_hw_lane_settings(link, link_res, lt_settings, 0);
-
-			vendor_lttpr_write_data_vs[3] = 0;
-			vendor_lttpr_write_data_pe[3] = 0;
-
-			for (lane = 0; lane < lane_count; lane++) {
-				vendor_lttpr_write_data_vs[3] |=
-						lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
-				vendor_lttpr_write_data_pe[3] |=
-						lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
-			}
-
-			/* Vendor specific: Update VS and PE to DPRX requested value */
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
-
-			/* 2. update DPCD*/
-			if (!retries_ch_eq)
-				/* EPR #361076 - write as a 5-byte burst,
-				 * but only for the 1-st iteration
-				 */
-
-				dpcd_set_lt_pattern_and_lane_settings(
-					link,
-					lt_settings,
-					tr_pattern, 0);
-			else
-				dpcd_set_lane_settings(link, lt_settings, 0);
-
-			/* 3. wait for receiver to lock-on*/
-			wait_time_microsec = lt_settings->eq_pattern_time;
-
-			dp_wait_for_training_aux_rd_interval(
-					link,
-					wait_time_microsec);
-
-			/* 4. Read lane status and requested
-			 * drive settings as set by the sink
-			 */
-			dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				0);
-
-			/* 5. check CR done*/
-			if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
-				status = LINK_TRAINING_EQ_FAIL_CR;
-				break;
-			}
-
-			/* 6. check CHEQ done*/
-			if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
-					dp_is_symbol_locked(lane_count, dpcd_lane_status) &&
-					dp_is_interlane_aligned(dpcd_lane_status_updated)) {
-				status = LINK_TRAINING_SUCCESS;
-				break;
-			}
-
-			/* 7. update VS/PE/PC2 in lt_settings*/
-			dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-					lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-		}
-	}
-
-	return status;
-}
-
-
-enum link_training_result dc_link_dp_perform_link_training(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_settings,
-	bool skip_video_pattern)
-{
-	enum link_training_result status = LINK_TRAINING_SUCCESS;
-	struct link_training_settings lt_settings = {0};
-	enum dp_link_encoding encoding =
-			dp_get_link_encoding_format(link_settings);
-
-	/* decide training settings */
-	dp_decide_training_settings(
-			link,
-			link_settings,
-			&lt_settings);
-
-	override_training_settings(
-			link,
-			&link->preferred_training_settings,
-			&lt_settings);
-
-	/* reset previous training states */
-	dpcd_exit_training_mode(link, encoding);
-
-	/* configure link prior to entering training mode */
-	dpcd_configure_lttpr_mode(link, &lt_settings);
-	dp_set_fec_ready(link, link_res, lt_settings.should_set_fec_ready);
-	dpcd_configure_channel_coding(link, &lt_settings);
-
-	/* enter training mode:
-	 * Per DP specs starting from here, DPTX device shall not issue
-	 * Non-LT AUX transactions inside training mode.
-	 */
-	if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN && encoding == DP_8b_10b_ENCODING)
-		status = dp_perform_fixed_vs_pe_training_sequence(link, link_res, &lt_settings);
-	else if (encoding == DP_8b_10b_ENCODING)
-		status = dp_perform_8b_10b_link_training(link, link_res, &lt_settings);
-	else if (encoding == DP_128b_132b_ENCODING)
-		status = dp_perform_128b_132b_link_training(link, link_res, &lt_settings);
-	else
-		ASSERT(0);
-
-	/* exit training mode */
-	dpcd_exit_training_mode(link, encoding);
-
-	/* switch to video idle */
-	if ((status == LINK_TRAINING_SUCCESS) || !skip_video_pattern)
-		status = dp_transition_to_video_idle(link,
-				link_res,
-				&lt_settings,
-				status);
-
-	/* dump debug data */
-	print_status_message(link, &lt_settings, status);
-	if (status != LINK_TRAINING_SUCCESS)
-		link->ctx->dc->debug_data.ltFailCount++;
-	return status;
-}
-
-bool perform_link_training_with_retries(
-	const struct dc_link_settings *link_setting,
-	bool skip_video_pattern,
-	int attempts,
-	struct pipe_ctx *pipe_ctx,
-	enum signal_type signal,
-	bool do_fallback)
-{
-	int j;
-	uint8_t delay_between_attempts = LINK_TRAINING_RETRY_DELAY;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	enum dp_panel_mode panel_mode = dp_get_panel_mode(link);
-	enum link_training_result status = LINK_TRAINING_CR_FAIL_LANE0;
-	struct dc_link_settings cur_link_settings = *link_setting;
-	struct dc_link_settings max_link_settings = *link_setting;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	int fail_count = 0;
-	bool is_link_bw_low = false; /* link bandwidth < stream bandwidth */
-	bool is_link_bw_min = /* RBR x 1 */
-		(cur_link_settings.link_rate <= LINK_RATE_LOW) &&
-		(cur_link_settings.lane_count <= LANE_COUNT_ONE);
-
-	dp_trace_commit_lt_init(link);
-
-	if (dp_get_link_encoding_format(&cur_link_settings) == DP_8b_10b_ENCODING)
-		/* We need to do this before the link training to ensure the idle
-		 * pattern in SST mode will be sent right after the link training
-		 */
-		link_hwss->setup_stream_encoder(pipe_ctx);
-
-	dp_trace_set_lt_start_timestamp(link, false);
-	j = 0;
-	while (j < attempts && fail_count < (attempts * 10)) {
-
-		DC_LOG_HW_LINK_TRAINING("%s: Beginning link(%d) training attempt %u of %d @ rate(%d) x lane(%d)\n",
-			__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
-			cur_link_settings.lane_count);
+#include "resource.h"
 
-		dp_enable_link_phy(
-			link,
-			&pipe_ctx->link_res,
-			signal,
-			pipe_ctx->clock_source->id,
-			&cur_link_settings);
+#include "inc/core_types.h"
+#include "link_hwss.h"
+#include "link/link_ddc.h"
+#include "core_status.h"
+#include "dpcd_defs.h"
 
-		if (stream->sink_patches.dppowerup_delay > 0) {
-			int delay_dp_power_up_in_ms = stream->sink_patches.dppowerup_delay;
+#include "dc_dmub_srv.h"
+#include "dce/dmub_hw_lock_mgr.h"
+#include "link/link_dp_dpia.h"
+#include "inc/link_enc_cfg.h"
+#include "clk_mgr.h"
+#include "link/link_dp_trace.h"
+#include "link/link_dp_training.h"
+#include "link/link_dp_training_fixed_vs_pe_retimer.h"
+#include "link/link_dp_training_dpia.h"
+#include "link/link_dp_training_auxless.h"
+#include "resource.h"
+#define DC_LOGGER \
+	link->ctx->logger
 
-			msleep(delay_dp_power_up_in_ms);
-		}
+#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
+#include "link/link_dpcd.h"
 
-#ifdef CONFIG_DRM_AMD_DC_HDCP
-		if (panel_mode == DP_PANEL_MODE_EDP) {
-			struct cp_psp *cp_psp = &stream->ctx->cp_psp;
-
-			if (cp_psp && cp_psp->funcs.enable_assr)
-				/* ASSR is bound to fail with unsigned PSP
-				 * verstage used during devlopment phase.
-				 * Report and continue with eDP panel mode to
-				 * perform eDP link training with right settings
-				 */
-				cp_psp->funcs.enable_assr(cp_psp->handle, link);
-		}
+#ifndef MAX
+#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
+#endif
+#ifndef MIN
+#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
 #endif
 
-		dp_set_panel_mode(link, panel_mode);
+struct dp_lt_fallback_entry {
+	enum dc_lane_count lane_count;
+	enum dc_link_rate link_rate;
+};
 
-		if (link->aux_access_disabled) {
-			dc_link_dp_perform_link_training_skip_aux(link, &pipe_ctx->link_res, &cur_link_settings);
-			return true;
-		} else {
-			/** @todo Consolidate USB4 DP and DPx.x training. */
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
-				status = dc_link_dpia_perform_link_training(link,
-						&pipe_ctx->link_res,
-						&cur_link_settings,
-						skip_video_pattern);
-
-				/* Transmit idle pattern once training successful. */
-				if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low) {
-					dp_set_hw_test_pattern(link, &pipe_ctx->link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
-					/* Update verified link settings to current one
-					 * Because DPIA LT might fallback to lower link setting.
-					 */
-					if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-						link->verified_link_cap.link_rate = link->cur_link_settings.link_rate;
-						link->verified_link_cap.lane_count = link->cur_link_settings.lane_count;
-						dm_helpers_dp_mst_update_branch_bandwidth(link->ctx, link);
-					}
-				}
-			} else {
-				status = dc_link_dp_perform_link_training(link,
-						&pipe_ctx->link_res,
-						&cur_link_settings,
-						skip_video_pattern);
-			}
+static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
+		/* This link training fallback array is ordered by
+		 * link bandwidth from highest to lowest.
+		 * DP specs makes it a normative policy to always
+		 * choose the next highest link bandwidth during
+		 * link training fallback.
+		 */
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR20},
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR20},
+		{LANE_COUNT_FOUR, LINK_RATE_UHBR10},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH3},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR20},
+		{LANE_COUNT_TWO, LINK_RATE_UHBR10},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH2},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR13_5},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH3},
+		{LANE_COUNT_ONE, LINK_RATE_UHBR10},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH2},
+		{LANE_COUNT_FOUR, LINK_RATE_HIGH},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH3},
+		{LANE_COUNT_FOUR, LINK_RATE_LOW},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH2},
+		{LANE_COUNT_TWO, LINK_RATE_HIGH},
+		{LANE_COUNT_TWO, LINK_RATE_LOW},
+		{LANE_COUNT_ONE, LINK_RATE_HIGH},
+		{LANE_COUNT_ONE, LINK_RATE_LOW},
+};
 
-			dp_trace_lt_total_count_increment(link, false);
-			dp_trace_lt_result_update(link, status, false);
-			dp_trace_set_lt_end_timestamp(link, false);
-			if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low)
-				return true;
-		}
+static const struct dc_link_settings fail_safe_link_settings = {
+		.lane_count = LANE_COUNT_ONE,
+		.link_rate = LINK_RATE_LOW,
+		.link_spread = LINK_SPREAD_DISABLED,
+};
 
-		fail_count++;
-		dp_trace_lt_fail_count_update(link, fail_count, false);
-		if (link->ep_type == DISPLAY_ENDPOINT_PHY) {
-			/* latest link training still fail or link training is aborted
-			 * skip delay and keep PHY on
-			 */
-			if (j == (attempts - 1) || (status == LINK_TRAINING_ABORT))
-				break;
-		}
+static uint8_t get_nibble_at_index(const uint8_t *buf,
+	uint32_t index)
+{
+	uint8_t nibble;
+	nibble = buf[index / 2];
 
-		DC_LOG_WARNING("%s: Link(%d) training attempt %u of %d failed @ rate(%d) x lane(%d) : fail reason:(%d)\n",
-			__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
-			cur_link_settings.lane_count, status);
+	if (index % 2)
+		nibble >>= 4;
+	else
+		nibble &= 0x0F;
 
-		dp_disable_link_phy(link, &pipe_ctx->link_res, signal);
+	return nibble;
+}
 
-		/* Abort link training if failure due to sink being unplugged. */
-		if (status == LINK_TRAINING_ABORT) {
-			enum dc_connection_type type = dc_connection_none;
+uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count)
+{
+	switch (lttpr_repeater_count) {
+	case 0x80: // 1 lttpr repeater
+		return 1;
+	case 0x40: // 2 lttpr repeaters
+		return 2;
+	case 0x20: // 3 lttpr repeaters
+		return 3;
+	case 0x10: // 4 lttpr repeaters
+		return 4;
+	case 0x08: // 5 lttpr repeaters
+		return 5;
+	case 0x04: // 6 lttpr repeaters
+		return 6;
+	case 0x02: // 7 lttpr repeaters
+		return 7;
+	case 0x01: // 8 lttpr repeaters
+		return 8;
+	default:
+		break;
+	}
+	return 0; // invalid value
+}
 
-			dc_link_detect_sink(link, &type);
-			if (type == dc_connection_none) {
-				DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
-				break;
-			}
-		}
+void dc_link_dp_set_drive_settings(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings)
+{
+	/* program ASIC PHY settings*/
+	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
 
-		/* Try to train again at original settings if:
-		 * - not falling back between training attempts;
-		 * - aborted previous attempt due to reasons other than sink unplug;
-		 * - successfully trained but at a link rate lower than that required by stream;
-		 * - reached minimum link bandwidth.
-		 */
-		if (!do_fallback || (status == LINK_TRAINING_ABORT) ||
-				(status == LINK_TRAINING_SUCCESS && is_link_bw_low) ||
-				is_link_bw_min) {
-			j++;
-			cur_link_settings = *link_setting;
-			delay_between_attempts += LINK_TRAINING_RETRY_DELAY;
-			is_link_bw_low = false;
-			is_link_bw_min = (cur_link_settings.link_rate <= LINK_RATE_LOW) &&
-				(cur_link_settings.lane_count <= LANE_COUNT_ONE);
-
-		} else if (do_fallback) { /* Try training at lower link bandwidth if doing fallback. */
-			uint32_t req_bw;
-			uint32_t link_bw;
-
-			decide_fallback_link_setting(link, &max_link_settings,
-					&cur_link_settings, status);
-			/* Fail link training if reduced link bandwidth no longer meets
-			 * stream requirements.
-			 */
-			req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
-			link_bw = dc_link_bandwidth_kbps(link, &cur_link_settings);
-			is_link_bw_low = (req_bw > link_bw);
-			is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
-				(cur_link_settings.lane_count <= LANE_COUNT_ONE));
-			if (is_link_bw_low)
-				DC_LOG_WARNING(
-					"%s: Link(%d) bandwidth too low after fallback req_bw(%d) > link_bw(%d)\n",
-					__func__, link->link_index, req_bw, link_bw);
-		}
+	dp_hw_to_dpcd_lane_settings(lt_settings,
+			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
 
-		msleep(delay_between_attempts);
-	}
-	return false;
+	/* Notify DP sink the PHY settings from source */
+	dpcd_set_lane_settings(link, lt_settings, DPRX);
 }
 
 static enum clock_source_id get_clock_source_id(struct dc_link *link)
@@ -2879,136 +172,6 @@ static enum clock_source_id get_clock_source_id(struct dc_link *link)
 	return dp_cs_id;
 }
 
-static void set_dp_mst_mode(struct dc_link *link, const struct link_resource *link_res,
-		bool mst_enable)
-{
-	if (mst_enable == false &&
-		link->type == dc_connection_mst_branch) {
-		/* Disable MST on link. Use only local sink. */
-		dp_disable_link_phy_mst(link, link_res, link->connector_signal);
-
-		link->type = dc_connection_single;
-		link->local_sink = link->remote_sinks[0];
-		link->local_sink->sink_signal = SIGNAL_TYPE_DISPLAY_PORT;
-		dc_sink_retain(link->local_sink);
-		dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
-	} else if (mst_enable == true &&
-			link->type == dc_connection_single &&
-			link->remote_sinks[0] != NULL) {
-		/* Re-enable MST on link. */
-		dp_disable_link_phy(link, link_res, link->connector_signal);
-		dp_enable_mst_on_sink(link, true);
-
-		link->type = dc_connection_mst_branch;
-		link->local_sink->sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST;
-	}
-}
-
-bool dc_link_dp_sync_lt_begin(struct dc_link *link)
-{
-	/* Begin Sync LT. During this time,
-	 * DPCD:600h must not be powered down.
-	 */
-	link->sync_lt_in_progress = true;
-
-	/*Clear any existing preferred settings.*/
-	memset(&link->preferred_training_settings, 0,
-		sizeof(struct dc_link_training_overrides));
-	memset(&link->preferred_link_setting, 0,
-		sizeof(struct dc_link_settings));
-
-	return true;
-}
-
-enum link_training_result dc_link_dp_sync_lt_attempt(
-    struct dc_link *link,
-    const struct link_resource *link_res,
-    struct dc_link_settings *link_settings,
-    struct dc_link_training_overrides *lt_overrides)
-{
-	struct link_training_settings lt_settings = {0};
-	enum link_training_result lt_status = LINK_TRAINING_SUCCESS;
-	enum dp_panel_mode panel_mode = DP_PANEL_MODE_DEFAULT;
-	enum clock_source_id dp_cs_id = CLOCK_SOURCE_ID_EXTERNAL;
-	bool fec_enable = false;
-
-	dp_decide_training_settings(
-			link,
-			link_settings,
-			&lt_settings);
-	override_training_settings(
-			link,
-			lt_overrides,
-			&lt_settings);
-	/* Setup MST Mode */
-	if (lt_overrides->mst_enable)
-		set_dp_mst_mode(link, link_res, *lt_overrides->mst_enable);
-
-	/* Disable link */
-	dp_disable_link_phy(link, link_res, link->connector_signal);
-
-	/* Enable link */
-	dp_cs_id = get_clock_source_id(link);
-	dp_enable_link_phy(link, link_res, link->connector_signal,
-		dp_cs_id, link_settings);
-
-	/* Set FEC enable */
-	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
-		fec_enable = lt_overrides->fec_enable && *lt_overrides->fec_enable;
-		dp_set_fec_ready(link, NULL, fec_enable);
-	}
-
-	if (lt_overrides->alternate_scrambler_reset) {
-		if (*lt_overrides->alternate_scrambler_reset)
-			panel_mode = DP_PANEL_MODE_EDP;
-		else
-			panel_mode = DP_PANEL_MODE_DEFAULT;
-	} else
-		panel_mode = dp_get_panel_mode(link);
-
-	dp_set_panel_mode(link, panel_mode);
-
-	/* Attempt to train with given link training settings */
-	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
-		start_clock_recovery_pattern_early(link, link_res, &lt_settings, DPRX);
-
-	/* Set link rate, lane count and spread. */
-	dpcd_set_link_settings(link, &lt_settings);
-
-	/* 2. perform link training (set link training done
-	 *  to false is done as well)
-	 */
-	lt_status = perform_clock_recovery_sequence(link, link_res, &lt_settings, DPRX);
-	if (lt_status == LINK_TRAINING_SUCCESS) {
-		lt_status = perform_channel_equalization_sequence(link,
-						link_res,
-						&lt_settings,
-						DPRX);
-	}
-
-	/* 3. Sync LT must skip TRAINING_PATTERN_SET:0 (video pattern)*/
-	/* 4. print status message*/
-	print_status_message(link, &lt_settings, lt_status);
-
-	return lt_status;
-}
-
-bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
-{
-	/* If input parameter is set, shut down phy.
-	 * Still shouldn't turn off dp_receiver (DPCD:600h)
-	 */
-	if (link_down == true) {
-		struct dc_link_settings link_settings = link->cur_link_settings;
-		dp_disable_link_phy(link, NULL, link->connector_signal);
-		if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
-			dp_set_fec_ready(link, NULL, false);
-	}
-
-	link->sync_lt_in_progress = false;
-	return true;
-}
-
 static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
 {
 	enum dc_link_rate lttpr_max_link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
@@ -3060,7 +223,6 @@ bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_
 	return false;
 }
 
-
 struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 {
 	struct dc_link_settings max_link_cap = {0};
@@ -3285,7 +447,7 @@ static bool dp_verify_link_cap(
 				dp_cs_id,
 				&cur_link_settings);
 
-		status = dc_link_dp_perform_link_training(
+		status = dp_perform_link_training(
 				link,
 				&link_res,
 				&cur_link_settings,
@@ -3540,7 +702,7 @@ static bool decide_fallback_link_setting_max_bw_policy(
  *			false - has reached minimum setting
  *					and no further fallback could be done
  */
-static bool decide_fallback_link_setting(
+bool decide_fallback_link_setting(
 		struct dc_link *link,
 		struct dc_link_settings *max,
 		struct dc_link_settings *cur,
@@ -3548,8 +710,8 @@ static bool decide_fallback_link_setting(
 {
 	if (dp_get_link_encoding_format(max) == DP_128b_132b_ENCODING ||
 			link->dc->debug.force_dp2_lt_fallback_method)
-		return decide_fallback_link_setting_max_bw_policy(link, max, cur,
-				training_result);
+		return decide_fallback_link_setting_max_bw_policy(link, max,
+				cur, training_result);
 
 	switch (training_result) {
 	case LINK_TRAINING_CR_FAIL_LANE0:
@@ -4139,7 +1301,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	/* prepare link training settings */
 	link_training_settings.link_settings = link->cur_link_settings;
 
-	link_training_settings.lttpr_mode = dp_decide_lttpr_mode(link, &link->cur_link_settings);
+	link_training_settings.lttpr_mode = dc_link_decide_lttpr_mode(link, &link->cur_link_settings);
 
 	if ((link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
 			link_training_settings.lttpr_mode == LTTPR_MODE_TRANSPARENT)
@@ -4782,8 +1944,6 @@ static int translate_dpcd_max_bpc(enum dpcd_downstream_port_max_bpc bpc)
 
 	return -1;
 }
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 uint32_t dc_link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw)
 {
 	switch (bw) {
@@ -4831,7 +1991,6 @@ static uint32_t intersect_frl_link_bw_support(
 
 	return supported_bw_in_kbps;
 }
-#endif
 
 static void read_dp_device_vendor_id(struct dc_link *link)
 {
@@ -4944,7 +2103,6 @@ static void get_active_converter_info(
 						translate_dpcd_max_bpc(
 							hdmi_color_caps.bits.MAX_BITS_PER_COLOR_COMPONENT);
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 					if (link->dc->caps.dp_hdmi21_pcon_support) {
 						union hdmi_encoded_link_bw hdmi_encoded_link_bw;
 
@@ -4963,7 +2121,6 @@ static void get_active_converter_info(
 						if (link->dpcd_caps.dongle_caps.dp_hdmi_frl_max_link_bw_in_kbps > 0)
 							link->dpcd_caps.dongle_caps.extendedCapValid = true;
 					}
-#endif
 
 					if (link->dpcd_caps.dongle_caps.dp_hdmi_max_pixel_clk_in_khz != 0)
 						link->dpcd_caps.dongle_caps.extendedCapValid = true;
@@ -5034,6 +2191,7 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 		int length)
 {
 	int retry = 0;
+	union dp_downstream_port_present ds_port = { 0 };
 
 	if (!link->dpcd_caps.dpcd_rev.raw) {
 		do {
@@ -5046,6 +2204,9 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 		} while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
 	}
 
+	ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
+				 DP_DPCD_REV];
+
 	if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
 		switch (link->dpcd_caps.branch_dev_id) {
 		/* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
@@ -5070,6 +2231,7 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 
 /* Read additional sink caps defined in source specific DPCD area
  * This function currently only reads from SinkCapability address (DP_SOURCE_SINK_CAP)
+ * TODO: Add FS caps and read from DP_SOURCE_SINK_FS_CAP as well
  */
 static bool dpcd_read_sink_ext_caps(struct dc_link *link)
 {
@@ -5100,7 +2262,8 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 	/* By reading LTTPR capability, RX assumes that we will enable
 	 * LTTPR extended aux timeout if LTTPR is present.
 	 */
-	status = core_link_read_dpcd(link,
+	status = core_link_read_dpcd(
+			link,
 			DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
 			lttpr_dpcd_data,
 			sizeof(lttpr_dpcd_data));
@@ -5137,8 +2300,7 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 
 	/* If this chip cap is set, at least one retimer must exist in the chain
-	 * Override count to 1 if we receive a known bad count (0 or an invalid value)
-	 */
+	 * Override count to 1 if we receive a known bad count (0 or an invalid value) */
 	if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN &&
 			(dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) == 0)) {
 		ASSERT(0);
@@ -5164,74 +2326,6 @@ bool dp_is_lttpr_present(struct dc_link *link)
 			link->dpcd_caps.lttpr_caps.revision.raw >= 0x14);
 }
 
-enum lttpr_mode dp_decide_lttpr_mode(struct dc_link *link, struct dc_link_settings *link_setting)
-{
-	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_setting);
-
-	if (encoding == DP_8b_10b_ENCODING)
-		return dp_decide_8b_10b_lttpr_mode(link);
-	else if (encoding == DP_128b_132b_ENCODING)
-		return dp_decide_128b_132b_lttpr_mode(link);
-
-	ASSERT(0);
-	return LTTPR_MODE_NON_LTTPR;
-}
-
-void dp_get_lttpr_mode_override(struct dc_link *link, enum lttpr_mode *override)
-{
-	if (!dp_is_lttpr_present(link))
-		return;
-
-	if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_TRANSPARENT) {
-		*override = LTTPR_MODE_TRANSPARENT;
-	} else if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_NON_TRANSPARENT) {
-		*override = LTTPR_MODE_NON_TRANSPARENT;
-	} else if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_NON_LTTPR) {
-		*override = LTTPR_MODE_NON_LTTPR;
-	}
-	DC_LOG_DC("lttpr_mode_override chose LTTPR_MODE = %d\n", (uint8_t)(*override));
-}
-
-enum lttpr_mode dp_decide_8b_10b_lttpr_mode(struct dc_link *link)
-{
-	bool is_lttpr_present = dp_is_lttpr_present(link);
-	bool vbios_lttpr_force_non_transparent = link->dc->caps.vbios_lttpr_enable;
-	bool vbios_lttpr_aware = link->dc->caps.vbios_lttpr_aware;
-
-	if (!is_lttpr_present)
-		return LTTPR_MODE_NON_LTTPR;
-
-	if (vbios_lttpr_aware) {
-		if (vbios_lttpr_force_non_transparent) {
-			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT due to VBIOS DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
-			return LTTPR_MODE_NON_TRANSPARENT;
-		} else {
-			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT by default due to VBIOS not set DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
-			return LTTPR_MODE_TRANSPARENT;
-		}
-	}
-
-	if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
-			link->dc->caps.extended_aux_timeout_support) {
-		DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT by default and dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A set to 1.\n");
-		return LTTPR_MODE_NON_TRANSPARENT;
-	}
-
-	DC_LOG_DC("chose LTTPR_MODE_NON_LTTPR.\n");
-	return LTTPR_MODE_NON_LTTPR;
-}
-
-enum lttpr_mode dp_decide_128b_132b_lttpr_mode(struct dc_link *link)
-{
-	enum lttpr_mode mode = LTTPR_MODE_NON_LTTPR;
-
-	if (dp_is_lttpr_present(link))
-		mode = LTTPR_MODE_NON_TRANSPARENT;
-
-	DC_LOG_DC("128b_132b chose LTTPR_MODE %d.\n", mode);
-	return mode;
-}
-
 static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 {
 	union dmub_rb_cmd cmd;
@@ -5387,6 +2481,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 			break;
 	}
 
+
 	if (status != DC_OK) {
 		dm_error("%s: Read receiver caps dpcd data failed.\n", __func__);
 		return false;
@@ -5395,6 +2490,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 	if (!dp_is_lttpr_present(link))
 		try_to_configure_aux_timeout(link->ddc, LINK_AUX_DEFAULT_TIMEOUT_PERIOD);
 
+
 	{
 		union training_aux_rd_interval aux_rd_interval;
 
@@ -5402,7 +2498,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 			dpcd_data[DP_TRAINING_AUX_RD_INTERVAL];
 
 		link->dpcd_caps.ext_receiver_cap_field_present =
-				aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1;
+				aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1 ? true:false;
 
 		if (aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1) {
 			uint8_t ext_cap_data[16];
@@ -5523,17 +2619,6 @@ static bool retrieve_link_cap(struct dc_link *link)
 		sink_id.ieee_device_id,
 		sizeof(sink_id.ieee_device_id));
 
-	/* Quirk Apple MBP 2017 15" Retina panel: Wrong DP_MAX_LINK_RATE */
-	{
-		uint8_t str_mbp_2017[] = { 101, 68, 21, 101, 98, 97 };
-
-		if ((link->dpcd_caps.sink_dev_id == 0x0010fa) &&
-		    !memcmp(link->dpcd_caps.sink_dev_id_str, str_mbp_2017,
-			    sizeof(str_mbp_2017))) {
-			link->reported_link_cap.link_rate = 0x0c;
-		}
-	}
-
 	core_link_read_dpcd(
 		link,
 		DP_SINK_HW_REVISION_START,
@@ -5626,7 +2711,7 @@ static bool retrieve_link_cap(struct dc_link *link)
 		DC_LOG_DP2("128b/132b encoding is supported at link %d", link->link_index);
 
 		core_link_read_dpcd(link,
-				DP_128b_132b_SUPPORTED_LINK_RATES,
+				DP_128B132B_SUPPORTED_LINK_RATES,
 				&link->dpcd_caps.dp_128b_132b_supported_link_rates.raw,
 				sizeof(link->dpcd_caps.dp_128b_132b_supported_link_rates.raw));
 		if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR20)
@@ -5743,7 +2828,7 @@ bool detect_dp_sink_caps(struct dc_link *link)
 	return retrieve_link_cap(link);
 }
 
-static enum dc_link_rate linkRateInKHzToLinkRateMultiplier(uint32_t link_rate_in_khz)
+enum dc_link_rate linkRateInKHzToLinkRateMultiplier(uint32_t link_rate_in_khz)
 {
 	enum dc_link_rate link_rate;
 	// LinkRate is normally stored as a multiplier of 0.27 Gbps per lane. Do the translation.
@@ -6529,7 +3614,7 @@ void dp_set_fec_enable(struct dc_link *link, bool enable)
 void dpcd_set_source_specific_data(struct dc_link *link)
 {
 	if (!link->dc->vendor_signature.is_valid) {
-		enum dc_status __maybe_unused result_write_min_hblank = DC_NOT_SUPPORTED;
+		enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
 		struct dpcd_amd_signature amd_signature = {0};
 		struct dpcd_amd_device_id amd_device_id = {0};
 
@@ -6652,9 +3737,9 @@ bool dc_link_get_backlight_level_nits(struct dc_link *link,
 			link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
+	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
 			dpcd_backlight_get.raw,
-			sizeof(union dpcd_source_backlight_get)) != DC_OK)
+			sizeof(union dpcd_source_backlight_get)))
 		return false;
 
 	*backlight_millinits_avg =
@@ -6693,9 +3778,9 @@ bool dc_link_read_default_bl_aux(struct dc_link *link, uint32_t *backlight_milli
 		link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
+	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
 		(uint8_t *) backlight_millinits,
-		sizeof(uint32_t)) != DC_OK)
+		sizeof(uint32_t)))
 		return false;
 
 	return true;
@@ -6767,6 +3852,7 @@ bool is_edp_ilr_optimization_required(struct dc_link *link, struct dc_crtc_timin
 	return false;
 }
 
+
 enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings *link_settings)
 {
 	if ((link_settings->link_rate >= LINK_RATE_LOW) &&
@@ -7180,42 +4266,6 @@ void dp_disable_link_phy_mst(struct dc_link *link, const struct link_resource *l
 	dp_enable_mst_on_sink(link, false);
 }
 
-bool dp_set_hw_training_pattern(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	enum dc_dp_training_pattern pattern,
-	uint32_t offset)
-{
-	enum dp_test_pattern test_pattern = DP_TEST_PATTERN_UNSUPPORTED;
-
-	switch (pattern) {
-	case DP_TRAINING_PATTERN_SEQUENCE_1:
-		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN1;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_2:
-		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN2;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_3:
-		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN3;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_4:
-		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
-		break;
-	case DP_128b_132b_TPS1:
-		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE;
-		break;
-	case DP_128b_132b_TPS2:
-		test_pattern = DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE;
-		break;
-	default:
-		break;
-	}
-
-	dp_set_hw_test_pattern(link, link_res, test_pattern, NULL, 0);
-
-	return true;
-}
-
 void dp_set_hw_lane_settings(
 	struct dc_link *link,
 	const struct link_resource *link_res,
@@ -7237,25 +4287,6 @@ void dp_set_hw_lane_settings(
 			sizeof(link->cur_lane_setting));
 }
 
-void dp_set_hw_test_pattern(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	enum dp_test_pattern test_pattern,
-	uint8_t *custom_pattern,
-	uint32_t custom_pattern_size)
-{
-	const struct link_hwss *link_hwss = get_link_hwss(link, link_res);
-	struct encoder_set_dp_phy_pattern_param pattern_param = {0};
-
-	pattern_param.dp_phy_pattern = test_pattern;
-	pattern_param.custom_pattern = custom_pattern;
-	pattern_param.custom_pattern_size = custom_pattern_size;
-	pattern_param.dp_panel_mode = dp_get_panel_mode(link);
-
-	if (link_hwss->ext.set_dp_link_test_pattern)
-		link_hwss->ext.set_dp_link_test_pattern(link, link_res, &pattern_param);
-}
-
 void dp_retrain_link_dp_test(struct dc_link *link,
 			struct dc_link_settings *link_setting,
 			bool skip_video_pattern)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 73f58ac3b93f..b7e53b7dc4ed 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -975,6 +975,9 @@ struct dpcd_usb4_dp_tunneling_info {
 /* TODO - Use DRM header to replace above once available */
 #endif // DP_INTRA_HOP_AUX_REPLY_INDICATION
 
+#ifndef DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE
+#define DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE	0x50
+#endif
 union dp_main_line_channel_coding_cap {
 	struct {
 		uint8_t DP_8b_10b_SUPPORTED	:1;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index d0d2d964d601..e349976f385f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -459,27 +459,6 @@ void dc_link_dp_set_drive_settings(
 	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings);
 
-bool dc_link_dp_perform_link_training_skip_aux(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_setting);
-
-enum link_training_result dc_link_dp_perform_link_training(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_settings,
-	bool skip_video_pattern);
-
-bool dc_link_dp_sync_lt_begin(struct dc_link *link);
-
-enum link_training_result dc_link_dp_sync_lt_attempt(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct dc_link_settings *link_setting,
-	struct dc_link_training_overrides *lt_settings);
-
-bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down);
-
 bool dc_link_dp_set_test_pattern(
 	struct dc_link *link,
 	enum dp_test_pattern test_pattern,
@@ -601,4 +580,7 @@ bool reset_cur_dp_mst_topology(struct dc_link *link);
 int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *payload,
 		enum aux_return_code_type *operation_result);
+
+enum lttpr_mode dc_link_decide_lttpr_mode(struct dc_link *link,
+		struct dc_link_settings *link_setting);
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
index e8d8c5cb1309..a4d9f1fea046 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
@@ -31,7 +31,6 @@
 #define LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD 3200 /*us*/
 #define LINK_AUX_DEFAULT_TIMEOUT_PERIOD 552 /*us*/
 #define MAX_MTP_SLOT_COUNT 64
-#define DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE 0x50
 #define TRAINING_AUX_RD_INTERVAL 100 //us
 #define LINK_AUX_WAKE_TIMEOUT_MS 1500 // Timeout when trying to wake unresponsive DPRX.
 
@@ -40,11 +39,6 @@ struct dc_stream_state;
 struct dc_link_settings;
 
 enum {
-	LINK_TRAINING_MAX_RETRY_COUNT = 5,
-	/* to avoid infinite loop where-in the receiver
-	 * switches between different VS
-	 */
-	LINK_TRAINING_MAX_CR_RETRY = 100,
 	/*
 	 * Some receivers fail to train on first try and are good
 	 * on subsequent tries. 2 retries should be plenty. If we
@@ -74,17 +68,8 @@ bool decide_link_settings(
 	struct dc_stream_state *stream,
 	struct dc_link_settings *link_setting);
 
-bool perform_link_training_with_retries(
-	const struct dc_link_settings *link_setting,
-	bool skip_video_pattern,
-	int attempts,
-	struct pipe_ctx *pipe_ctx,
-	enum signal_type signal,
-	bool do_fallback);
-
-bool hpd_rx_irq_check_link_loss_status(
-	struct dc_link *link,
-	union hpd_irq_data *hpd_irq_dpcd_data);
+bool hpd_rx_irq_check_link_loss_status(struct dc_link *link,
+				       union hpd_irq_data *hpd_irq_dpcd_data);
 
 bool is_mst_supported(struct dc_link *link);
 
@@ -109,63 +94,6 @@ void dpcd_set_source_specific_data(struct dc_link *link);
 
 void dpcd_write_cable_id_to_dprx(struct dc_link *link);
 
-/* Write DPCD link configuration data. */
-enum dc_status dpcd_set_link_settings(
-	struct dc_link *link,
-	const struct link_training_settings *lt_settings);
-/* Write DPCD drive settings. */
-enum dc_status dpcd_set_lane_settings(
-	struct dc_link *link,
-	const struct link_training_settings *link_training_setting,
-	uint32_t offset);
-/* Read training status and adjustment requests from DPCD. */
-enum dc_status dp_get_lane_status_and_lane_adjust(
-	struct dc_link *link,
-	const struct link_training_settings *link_training_setting,
-	union lane_status ln_status[LANE_COUNT_DP_MAX],
-	union lane_align_status_updated *ln_align,
-	union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
-	uint32_t offset);
-
-void dp_wait_for_training_aux_rd_interval(
-	struct dc_link *link,
-	uint32_t wait_in_micro_secs);
-
-bool dp_is_cr_done(enum dc_lane_count ln_count,
-	union lane_status *dpcd_lane_status);
-
-enum link_training_result dp_get_cr_failure(enum dc_lane_count ln_count,
-	union lane_status *dpcd_lane_status);
-
-bool dp_is_ch_eq_done(enum dc_lane_count ln_count,
-	union lane_status *dpcd_lane_status);
-bool dp_is_symbol_locked(enum dc_lane_count ln_count,
-	union lane_status *dpcd_lane_status);
-bool dp_is_interlane_aligned(union lane_align_status_updated align_status);
-
-bool dp_is_max_vs_reached(
-	const struct link_training_settings *lt_settings);
-void dp_hw_to_dpcd_lane_settings(
-	const struct link_training_settings *lt_settings,
-	const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-	union dpcd_training_lane dpcd_lane_settings[]);
-void dp_decide_lane_settings(
-	const struct link_training_settings *lt_settings,
-	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
-	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-	union dpcd_training_lane dpcd_lane_settings[]);
-
-uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval);
-
-enum dpcd_training_patterns
-	dc_dp_training_pattern_to_dpcd_training_pattern(
-	struct dc_link *link,
-	enum dc_dp_training_pattern pattern);
-
-uint8_t dc_dp_initialize_scrambling_data_symbols(
-	struct dc_link *link,
-	enum dc_dp_training_pattern pattern);
-
 enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready);
 void dp_set_fec_enable(struct dc_link *link, bool enable);
 bool dp_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
@@ -183,32 +111,15 @@ void dp_decide_training_settings(
 /* Convert PHY repeater count read from DPCD uint8_t. */
 uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count);
 
-/* Check DPCD training status registers to detect link loss. */
-enum link_training_result dp_check_link_loss_status(
-		struct dc_link *link,
-		const struct link_training_settings *link_training_setting);
-
-enum dc_status dpcd_configure_lttpr_mode(
-		struct dc_link *link,
-		struct link_training_settings *lt_settings);
-
 enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings *link_settings);
 enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link);
 bool dp_is_lttpr_present(struct dc_link *link);
-enum lttpr_mode dp_decide_lttpr_mode(struct dc_link *link, struct dc_link_settings *link_setting);
-void dp_get_lttpr_mode_override(struct dc_link *link, enum lttpr_mode *override);
-enum lttpr_mode dp_decide_8b_10b_lttpr_mode(struct dc_link *link);
-enum lttpr_mode dp_decide_128b_132b_lttpr_mode(struct dc_link *link);
 bool dpcd_write_128b_132b_sst_payload_allocation_table(
 		const struct dc_stream_state *stream,
 		struct dc_link *link,
 		struct link_mst_stream_allocation_table *proposed_table,
 		bool allocate);
 
-enum dc_status dpcd_configure_channel_coding(
-		struct dc_link *link,
-		struct link_training_settings *lt_settings);
-
 bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link);
 
 struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
@@ -220,7 +131,6 @@ void enable_dp_hpo_output(struct dc_link *link,
 void disable_dp_hpo_output(struct dc_link *link,
 		const struct link_resource *link_res,
 		enum signal_type signal);
-
 void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
 bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
 void edp_panel_backlight_power_on(struct dc_link *link, bool wait_for_hpd);
@@ -242,26 +152,20 @@ void dp_disable_link_phy(struct dc_link *link, const struct link_resource *link_
 void dp_disable_link_phy_mst(struct dc_link *link, const struct link_resource *link_res,
 		enum signal_type signal);
 
-bool dp_set_hw_training_pattern(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		enum dc_dp_training_pattern pattern,
-		uint32_t offset);
-
 void dp_set_hw_lane_settings(
 		struct dc_link *link,
 		const struct link_resource *link_res,
 		const struct link_training_settings *link_settings,
 		uint32_t offset);
 
-void dp_set_hw_test_pattern(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		enum dp_test_pattern test_pattern,
-		uint8_t *custom_pattern,
-		uint32_t custom_pattern_size);
-
 void dp_retrain_link_dp_test(struct dc_link *link,
 		struct dc_link_settings *link_setting,
 		bool skip_video_pattern);
+
+bool decide_fallback_link_setting(
+		struct dc_link *link,
+		struct dc_link_settings *max,
+		struct dc_link_settings *cur,
+		enum link_training_result training_result);
+
 #endif /* __DC_LINK_DP_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/Makefile b/drivers/gpu/drm/amd/display/dc/link/Makefile
index 69333ac9bab0..2e3d2073f8bd 100644
--- a/drivers/gpu/drm/amd/display/dc/link/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/link/Makefile
@@ -24,7 +24,9 @@
 # PHY, HPD, DDC and etc).
 
 LINK = link_hwss_dio.o link_hwss_dpia.o link_hwss_hpo_dp.o link_dp_trace.o \
-link_hpd.o link_ddc.o link_dpcd.o link_dp_dpia.o
+link_hpd.o link_ddc.o link_dpcd.o link_dp_dpia.o link_dp_training.o \
+link_dp_training_8b_10b.o link_dp_training_128b_132b.o link_dp_training_dpia.o \
+link_dp_training_auxless.o link_dp_training_fixed_vs_pe_retimer.o
 
 AMD_DAL_LINK = $(addprefix $(AMDDALPATH)/dc/link/,$(LINK))
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c
index 47ad2cae483b..6136db392548 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.c
@@ -34,12 +34,20 @@
 #include "link_hwss.h"
 #include "dm_helpers.h"
 #include "dmub/inc/dmub_cmd.h"
-#include "link/link_dpcd.h"
+#include "link_dpcd.h"
+#include "link_dp_training.h"
 #include "dc_dmub_srv.h"
 
 #define DC_LOGGER \
 	link->ctx->logger
 
+/** @note Can remove once DP tunneling registers in upstream include/drm/drm_dp_helper.h */
+/* DPCD DP Tunneling over USB4 */
+#define DP_TUNNELING_CAPABILITIES_SUPPORT 0xe000d
+#define DP_IN_ADAPTER_INFO                0xe000e
+#define DP_USB4_DRIVER_ID                 0xe000f
+#define DP_USB4_ROUTER_TOPOLOGY_ID        0xe001b
+
 enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link)
 {
 	enum dc_status status = DC_OK;
@@ -47,19 +55,20 @@ enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link)
 	uint8_t dpcd_topology_data[DPCD_USB4_TOPOLOGY_ID_LEN] = {0};
 	uint8_t i = 0;
 
-	status = core_link_read_dpcd(link,
+	status = core_link_read_dpcd(
+			link,
 			DP_TUNNELING_CAPABILITIES_SUPPORT,
 			dpcd_dp_tun_data,
 			sizeof(dpcd_dp_tun_data));
 
-	status = core_link_read_dpcd(link,
+	status = core_link_read_dpcd(
+			link,
 			DP_USB4_ROUTER_TOPOLOGY_ID,
 			dpcd_topology_data,
 			sizeof(dpcd_topology_data));
 
 	link->dpcd_caps.usb4_dp_tun_info.dp_tun_cap.raw =
-			dpcd_dp_tun_data[DP_TUNNELING_CAPABILITIES_SUPPORT -
-					 DP_TUNNELING_CAPABILITIES_SUPPORT];
+			dpcd_dp_tun_data[DP_TUNNELING_CAPABILITIES_SUPPORT - DP_TUNNELING_CAPABILITIES_SUPPORT];
 	link->dpcd_caps.usb4_dp_tun_info.dpia_info.raw =
 			dpcd_dp_tun_data[DP_IN_ADAPTER_INFO - DP_TUNNELING_CAPABILITIES_SUPPORT];
 	link->dpcd_caps.usb4_dp_tun_info.usb4_driver_id =
@@ -96,929 +105,3 @@ bool dc_link_dpia_query_hpd_status(struct dc_link *link)
 	return is_hpd_high;
 }
 
-/* Configure link as prescribed in link_setting; set LTTPR mode; and
- * Initialize link training settings.
- * Abort link training if sink unplug detected.
- *
- * @param link DPIA link being trained.
- * @param[in] link_setting Lane count, link rate and downspread control.
- * @param[out] lt_settings Link settings and drive settings (voltage swing and pre-emphasis).
- */
-static enum link_training_result dpia_configure_link(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		const struct dc_link_settings *link_setting,
-		struct link_training_settings *lt_settings)
-{
-	enum dc_status status;
-	bool fec_enable;
-
-	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) configuring\n - LTTPR mode(%d)\n",
-				__func__,
-				link->link_id.enum_id - ENUM_ID_1,
-				lt_settings->lttpr_mode);
-
-	dp_decide_training_settings(link,
-		link_setting,
-		lt_settings);
-
-	dp_get_lttpr_mode_override(link, &lt_settings->lttpr_mode);
-
-	status = dpcd_configure_channel_coding(link, lt_settings);
-	if (status != DC_OK && link->is_hpd_pending)
-		return LINK_TRAINING_ABORT;
-
-	/* Configure lttpr mode */
-	status = dpcd_configure_lttpr_mode(link, lt_settings);
-	if (status != DC_OK && link->is_hpd_pending)
-		return LINK_TRAINING_ABORT;
-
-	/* Set link rate, lane count and spread. */
-	status = dpcd_set_link_settings(link, lt_settings);
-	if (status != DC_OK && link->is_hpd_pending)
-		return LINK_TRAINING_ABORT;
-
-	if (link->preferred_training_settings.fec_enable)
-		fec_enable = *link->preferred_training_settings.fec_enable;
-	else
-		fec_enable = true;
-	status = dp_set_fec_ready(link, link_res, fec_enable);
-	if (status != DC_OK && link->is_hpd_pending)
-		return LINK_TRAINING_ABORT;
-
-	return LINK_TRAINING_SUCCESS;
-}
-
-static enum dc_status core_link_send_set_config(struct dc_link *link,
-	uint8_t msg_type,
-	uint8_t msg_data)
-{
-	struct set_config_cmd_payload payload;
-	enum set_config_status set_config_result = SET_CONFIG_PENDING;
-
-	/* prepare set_config payload */
-	payload.msg_type = msg_type;
-	payload.msg_data = msg_data;
-
-	if (!link->ddc->ddc_pin && !link->aux_access_disabled &&
-	    (dm_helpers_dmub_set_config_sync(link->ctx, link,
-					     &payload, &set_config_result) == -1)) {
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	/* set_config should return ACK if successful */
-	return (set_config_result == SET_CONFIG_ACK_RECEIVED) ? DC_OK : DC_ERROR_UNEXPECTED;
-}
-
-/* Build SET_CONFIG message data payload for specified message type. */
-static uint8_t dpia_build_set_config_data(enum dpia_set_config_type type,
-		struct dc_link *link,
-		struct link_training_settings *lt_settings)
-{
-	union dpia_set_config_data data;
-
-	data.raw = 0;
-
-	switch (type) {
-	case DPIA_SET_CFG_SET_LINK:
-		data.set_link.mode = lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT ? 1 : 0;
-		break;
-	case DPIA_SET_CFG_SET_PHY_TEST_MODE:
-		break;
-	case DPIA_SET_CFG_SET_VSPE:
-		/* Assume all lanes have same drive settings. */
-		data.set_vspe.swing = lt_settings->hw_lane_settings[0].VOLTAGE_SWING;
-		data.set_vspe.pre_emph = lt_settings->hw_lane_settings[0].PRE_EMPHASIS;
-		data.set_vspe.max_swing_reached =
-			lt_settings->hw_lane_settings[0].VOLTAGE_SWING ==
-			VOLTAGE_SWING_MAX_LEVEL ? 1 : 0;
-		data.set_vspe.max_pre_emph_reached =
-			lt_settings->hw_lane_settings[0].PRE_EMPHASIS ==
-			PRE_EMPHASIS_MAX_LEVEL ? 1 : 0;
-		break;
-	default:
-		ASSERT(false); /* Message type not supported by helper function. */
-		break;
-	}
-
-	return data.raw;
-}
-
-/* Convert DC training pattern to DPIA training stage. */
-static enum dc_status convert_trng_ptn_to_trng_stg(enum dc_dp_training_pattern tps, enum dpia_set_config_ts *ts)
-{
-	enum dc_status status = DC_OK;
-
-	switch (tps) {
-	case DP_TRAINING_PATTERN_SEQUENCE_1:
-		*ts = DPIA_TS_TPS1;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_2:
-		*ts = DPIA_TS_TPS2;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_3:
-		*ts = DPIA_TS_TPS3;
-		break;
-	case DP_TRAINING_PATTERN_SEQUENCE_4:
-		*ts = DPIA_TS_TPS4;
-		break;
-	case DP_TRAINING_PATTERN_VIDEOIDLE:
-		*ts = DPIA_TS_DPRX_DONE;
-		break;
-	default: /* TPS not supported by helper function. */
-		ASSERT(false);
-		*ts = DPIA_TS_DPRX_DONE;
-		status = DC_UNSUPPORTED_VALUE;
-		break;
-	}
-
-	return status;
-}
-
-/* Write training pattern to DPCD. */
-static enum dc_status dpcd_set_lt_pattern(struct dc_link *link,
-	enum dc_dp_training_pattern pattern,
-	uint32_t hop)
-{
-	union dpcd_training_pattern dpcd_pattern = {0};
-	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
-	enum dc_status status;
-
-	if (hop != DPRX)
-		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
-			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
-
-	/* DpcdAddress_TrainingPatternSet */
-	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
-		dc_dp_training_pattern_to_dpcd_training_pattern(link, pattern);
-
-	dpcd_pattern.v1_4.SCRAMBLING_DISABLE =
-		dc_dp_initialize_scrambling_data_symbols(link, pattern);
-
-	if (hop != DPRX) {
-		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n 0x%X pattern = %x\n",
-					__func__,
-					hop,
-					dpcd_tps_offset,
-					dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-	} else {
-		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X pattern = %x\n",
-					__func__,
-					dpcd_tps_offset,
-					dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
-	}
-
-	status = core_link_write_dpcd(link,
-				      dpcd_tps_offset,
-				      &dpcd_pattern.raw,
-				      sizeof(dpcd_pattern.raw));
-
-	return status;
-}
-
-/* Execute clock recovery phase of link training for specified hop in display
- * path.in non-transparent mode:
- * - Driver issues both DPCD and SET_CONFIG transactions.
- * - TPS1 is transmitted for any hops downstream of DPOA.
- * - Drive (VS/PE) only transmitted for the hop immediately downstream of DPOA.
- * - CR for the first hop (DPTX-to-DPIA) is assumed to be successful.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_cr_non_transparent(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
-	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
-	enum dc_status status;
-	uint32_t retries_cr = 0; /* Number of consecutive attempts with same VS or PE. */
-	uint32_t retry_count = 0;
-	/* From DP spec, CR read interval is always 100us. */
-	uint32_t wait_time_microsec = TRAINING_AUX_RD_INTERVAL;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-	uint8_t set_cfg_data;
-	enum dpia_set_config_ts ts;
-
-	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-	/* Cap of LINK_TRAINING_MAX_CR_RETRY attempts at clock recovery.
-	 * Fix inherited from perform_clock_recovery_sequence() -
-	 * the DP equivalent of this function:
-	 * Required for Synaptics MST hub which can put the LT in
-	 * infinite loop by switching the VS between level 0 and level 1
-	 * continuously.
-	 */
-	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
-	       (retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
-		/* DPTX-to-DPIA */
-		if (hop == repeater_cnt) {
-			/* Send SET_CONFIG(SET_LINK:LC,LR,LTTPR) to notify DPOA that
-			 * non-transparent link training has started.
-			 * This also enables the transmission of clk_sync packets.
-			 */
-			set_cfg_data = dpia_build_set_config_data(DPIA_SET_CFG_SET_LINK,
-					link,
-					lt_settings);
-			status = core_link_send_set_config(link,
-					DPIA_SET_CFG_SET_LINK,
-					set_cfg_data);
-			/* CR for this hop is considered successful as long as
-			 * SET_CONFIG message is acknowledged by DPOA.
-			 */
-			if (status == DC_OK)
-				result = LINK_TRAINING_SUCCESS;
-			else
-				result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* DPOA-to-x */
-		/* Instruct DPOA to transmit TPS1 then update DPCD. */
-		if (retry_count == 0) {
-			status = convert_trng_ptn_to_trng_stg(lt_settings->pattern_for_cr, &ts);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-			status = dpcd_set_lt_pattern(link, lt_settings->pattern_for_cr, hop);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-
-		/* Update DPOA drive settings then DPCD. DPOA does only adjusts
-		 * drive settings for hops immediately downstream.
-		 */
-		if (hop == repeater_cnt - 1) {
-			set_cfg_data = dpia_build_set_config_data(DPIA_SET_CFG_SET_VSPE,
-					link,
-					lt_settings);
-			status = core_link_send_set_config(link,
-					DPIA_SET_CFG_SET_VSPE,
-					set_cfg_data);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-		status = dpcd_set_lane_settings(link, lt_settings, hop);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
-
-		/* Read status and adjustment requests from DPCD. */
-		status = dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				hop);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* Check if clock recovery successful. */
-		if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
-			result = LINK_TRAINING_SUCCESS;
-			break;
-		}
-
-		result = dp_get_cr_failure(lane_count, dpcd_lane_status);
-
-		if (dp_is_max_vs_reached(lt_settings))
-			break;
-
-		/* Count number of attempts with same drive settings.
-		 * Note: settings are the same for all lanes,
-		 * so comparing first lane is sufficient.
-		 */
-		if ((lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
-				dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
-				&& (lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET ==
-						dpcd_lane_adjust[0].bits.PRE_EMPHASIS_LANE))
-			retries_cr++;
-		else
-			retries_cr = 0;
-
-		/* Update VS/PE. */
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings,
-				lt_settings->dpcd_lane_settings);
-		retry_count++;
-	}
-
-	/* Abort link training if clock recovery failed due to HPD unplug. */
-	if (link->is_hpd_pending)
-		result = LINK_TRAINING_ABORT;
-
-	DC_LOG_HW_LINK_TRAINING(
-		"%s\n DPIA(%d) clock recovery\n -hop(%d)\n - result(%d)\n - retries(%d)\n - status(%d)\n",
-		__func__,
-		link->link_id.enum_id - ENUM_ID_1,
-		hop,
-		result,
-		retry_count,
-		status);
-
-	return result;
-}
-
-/* Execute clock recovery phase of link training in transparent LTTPR mode:
- * - Driver only issues DPCD transactions and leaves USB4 tunneling (SET_CONFIG) messages to DPIA.
- * - Driver writes TPS1 to DPCD to kick off training.
- * - Clock recovery (CR) for link is handled by DPOA, which reports result to DPIA on completion.
- * - DPIA communicates result to driver by updating CR status when driver reads DPCD.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- */
-static enum link_training_result dpia_training_cr_transparent(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
-	enum dc_status status;
-	uint32_t retries_cr = 0; /* Number of consecutive attempts with same VS or PE. */
-	uint32_t retry_count = 0;
-	uint32_t wait_time_microsec = lt_settings->cr_pattern_time;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	/* Cap of LINK_TRAINING_MAX_CR_RETRY attempts at clock recovery.
-	 * Fix inherited from perform_clock_recovery_sequence() -
-	 * the DP equivalent of this function:
-	 * Required for Synaptics MST hub which can put the LT in
-	 * infinite loop by switching the VS between level 0 and level 1
-	 * continuously.
-	 */
-	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
-	       (retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
-		/* Write TPS1 (not VS or PE) to DPCD to start CR phase.
-		 * DPIA sends SET_CONFIG(SET_LINK) to notify DPOA to
-		 * start link training.
-		 */
-		if (retry_count == 0) {
-			status = dpcd_set_lt_pattern(link, lt_settings->pattern_for_cr, DPRX);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-
-		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
-
-		/* Read status and adjustment requests from DPCD. */
-		status = dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				DPRX);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* Check if clock recovery successful. */
-		if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
-			result = LINK_TRAINING_SUCCESS;
-			break;
-		}
-
-		result = dp_get_cr_failure(lane_count, dpcd_lane_status);
-
-		if (dp_is_max_vs_reached(lt_settings))
-			break;
-
-		/* Count number of attempts with same drive settings.
-		 * Note: settings are the same for all lanes,
-		 * so comparing first lane is sufficient.
-		 */
-		if ((lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
-				dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
-				&& (lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET ==
-						dpcd_lane_adjust[0].bits.PRE_EMPHASIS_LANE))
-			retries_cr++;
-		else
-			retries_cr = 0;
-
-		/* Update VS/PE. */
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-		retry_count++;
-	}
-
-	/* Abort link training if clock recovery failed due to HPD unplug. */
-	if (link->is_hpd_pending)
-		result = LINK_TRAINING_ABORT;
-
-	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) clock recovery\n"
-		" -hop(%d)\n - result(%d)\n - retries(%d)\n",
-		__func__,
-		link->link_id.enum_id - ENUM_ID_1,
-		DPRX,
-		result,
-		retry_count);
-
-	return result;
-}
-
-/* Execute clock recovery phase of link training for specified hop in display
- * path.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_cr_phase(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		result = dpia_training_cr_non_transparent(link, link_res, lt_settings, hop);
-	else
-		result = dpia_training_cr_transparent(link, link_res, lt_settings);
-
-	return result;
-}
-
-/* Return status read interval during equalization phase. */
-static uint32_t dpia_get_eq_aux_rd_interval(const struct dc_link *link,
-		const struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	uint32_t wait_time_microsec;
-
-	if (hop == DPRX)
-		wait_time_microsec = lt_settings->eq_pattern_time;
-	else
-		wait_time_microsec =
-				dp_translate_training_aux_read_interval(
-					link->dpcd_caps.lttpr_caps.aux_rd_interval[hop - 1]);
-
-	/* Check debug option for extending aux read interval. */
-	if (link->dc->debug.dpia_debug.bits.extend_aux_rd_interval)
-		wait_time_microsec = DPIA_DEBUG_EXTENDED_AUX_RD_INTERVAL_US;
-
-	return wait_time_microsec;
-}
-
-/* Execute equalization phase of link training for specified hop in display
- * path in non-transparent mode:
- * - driver issues both DPCD and SET_CONFIG transactions.
- * - TPSx is transmitted for any hops downstream of DPOA.
- * - Drive (VS/PE) only transmitted for the hop immediately downstream of DPOA.
- * - EQ for the first hop (DPTX-to-DPIA) is assumed to be successful.
- * - DPRX EQ only reported successful when both DPRX and DPIA requirements
- * (clk sync packets sent) fulfilled.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_eq_non_transparent(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
-	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
-	uint32_t retries_eq = 0;
-	enum dc_status status;
-	enum dc_dp_training_pattern tr_pattern;
-	uint32_t wait_time_microsec;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-	uint8_t set_cfg_data;
-	enum dpia_set_config_ts ts;
-
-	/* Training pattern is TPS4 for repeater;
-	 * TPS2/3/4 for DPRX depending on what it supports.
-	 */
-	if (hop == DPRX)
-		tr_pattern = lt_settings->pattern_for_eq;
-	else
-		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
-
-	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-	for (retries_eq = 0; retries_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
-		/* DPTX-to-DPIA equalization always successful. */
-		if (hop == repeater_cnt) {
-			result = LINK_TRAINING_SUCCESS;
-			break;
-		}
-
-		/* Instruct DPOA to transmit TPSn then update DPCD. */
-		if (retries_eq == 0) {
-			status = convert_trng_ptn_to_trng_stg(tr_pattern, &ts);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-			status = core_link_send_set_config(link,
-					DPIA_SET_CFG_SET_TRAINING,
-					ts);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-			status = dpcd_set_lt_pattern(link, tr_pattern, hop);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-
-		/* Update DPOA drive settings then DPCD. DPOA only adjusts
-		 * drive settings for hop immediately downstream.
-		 */
-		if (hop == repeater_cnt - 1) {
-			set_cfg_data = dpia_build_set_config_data(DPIA_SET_CFG_SET_VSPE,
-								  link,
-								  lt_settings);
-			status = core_link_send_set_config(link,
-							   DPIA_SET_CFG_SET_VSPE,
-							   set_cfg_data);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-		status = dpcd_set_lane_settings(link, lt_settings, hop);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* Extend wait time on second equalisation attempt on final hop to
-		 * ensure clock sync packets have been sent.
-		 */
-		if (hop == DPRX && retries_eq == 1)
-			wait_time_microsec = max(wait_time_microsec, (uint32_t)DPIA_CLK_SYNC_DELAY);
-		else
-			wait_time_microsec = dpia_get_eq_aux_rd_interval(link, lt_settings, hop);
-
-		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
-
-		/* Read status and adjustment requests from DPCD. */
-		status = dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				hop);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* CR can still fail during EQ phase. Fail training if CR fails. */
-		if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
-			result = LINK_TRAINING_EQ_FAIL_CR;
-			break;
-		}
-
-		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
-		    dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status) &&
-		    dp_is_interlane_aligned(dpcd_lane_status_updated)) {
-			result =  LINK_TRAINING_SUCCESS;
-			break;
-		}
-
-		/* Update VS/PE. */
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-	}
-
-	/* Abort link training if equalization failed due to HPD unplug. */
-	if (link->is_hpd_pending)
-		result = LINK_TRAINING_ABORT;
-
-	DC_LOG_HW_LINK_TRAINING(
-		"%s\n DPIA(%d) equalization\n - hop(%d)\n - result(%d)\n - retries(%d)\n - status(%d)\n",
-		__func__,
-		link->link_id.enum_id - ENUM_ID_1,
-		hop,
-		result,
-		retries_eq,
-		status);
-
-	return result;
-}
-
-/* Execute equalization phase of link training for specified hop in display
- * path in transparent LTTPR mode:
- * - driver only issues DPCD transactions leaves USB4 tunneling (SET_CONFIG) messages to DPIA.
- * - driver writes TPSx to DPCD to notify DPIA that is in equalization phase.
- * - equalization (EQ) for link is handled by DPOA, which reports result to DPIA on completion.
- * - DPIA communicates result to driver by updating EQ status when driver reads DPCD.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_eq_transparent(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings)
-{
-	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
-	uint32_t retries_eq = 0;
-	enum dc_status status;
-	enum dc_dp_training_pattern tr_pattern = lt_settings->pattern_for_eq;
-	uint32_t wait_time_microsec;
-	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
-	union lane_align_status_updated dpcd_lane_status_updated = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
-	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
-
-	wait_time_microsec = dpia_get_eq_aux_rd_interval(link, lt_settings, DPRX);
-
-	for (retries_eq = 0; retries_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
-		if (retries_eq == 0) {
-			status = dpcd_set_lt_pattern(link, tr_pattern, DPRX);
-			if (status != DC_OK) {
-				result = LINK_TRAINING_ABORT;
-				break;
-			}
-		}
-
-		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
-
-		/* Read status and adjustment requests from DPCD. */
-		status = dp_get_lane_status_and_lane_adjust(
-				link,
-				lt_settings,
-				dpcd_lane_status,
-				&dpcd_lane_status_updated,
-				dpcd_lane_adjust,
-				DPRX);
-		if (status != DC_OK) {
-			result = LINK_TRAINING_ABORT;
-			break;
-		}
-
-		/* CR can still fail during EQ phase. Fail training if CR fails. */
-		if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
-			result = LINK_TRAINING_EQ_FAIL_CR;
-			break;
-		}
-
-		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
-				dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status)) {
-			/* Take into consideration corner case for DP 1.4a LL Compliance CTS as USB4
-			 * has to share encoders unlike DP and USBC
-			 */
-			if (dp_is_interlane_aligned(dpcd_lane_status_updated) || (link->is_automated && retries_eq)) {
-				result =  LINK_TRAINING_SUCCESS;
-				break;
-			}
-		}
-
-		/* Update VS/PE. */
-		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
-				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
-	}
-
-	/* Abort link training if equalization failed due to HPD unplug. */
-	if (link->is_hpd_pending)
-		result = LINK_TRAINING_ABORT;
-
-	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) equalization\n"
-		" - hop(%d)\n - result(%d)\n - retries(%d)\n",
-		__func__,
-		link->link_id.enum_id - ENUM_ID_1,
-		DPRX,
-		result,
-		retries_eq);
-
-	return result;
-}
-
-/* Execute equalization phase of link training for specified hop in display
- * path.
- *
- * @param link DPIA link being trained.
- * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_eq_phase(
-		struct dc_link *link,
-		const struct link_resource *link_res,
-		struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	enum link_training_result result;
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		result = dpia_training_eq_non_transparent(link, link_res, lt_settings, hop);
-	else
-		result = dpia_training_eq_transparent(link, link_res, lt_settings);
-
-	return result;
-}
-
-/* End training of specified hop in display path. */
-static enum dc_status dpcd_clear_lt_pattern(struct dc_link *link, uint32_t hop)
-{
-	union dpcd_training_pattern dpcd_pattern = {0};
-	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
-	enum dc_status status;
-
-	if (hop != DPRX)
-		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
-			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
-
-	status = core_link_write_dpcd(link,
-			dpcd_tps_offset,
-			&dpcd_pattern.raw,
-			sizeof(dpcd_pattern.raw));
-
-	return status;
-}
-
-/* End training of specified hop in display path.
- *
- * In transparent LTTPR mode:
- * - driver clears training pattern for the specified hop in DPCD.
- * In non-transparent LTTPR mode:
- * - in addition to clearing training pattern, driver issues USB4 tunneling
- * (SET_CONFIG) messages to notify DPOA when training is done for first hop
- * (DPTX-to-DPIA) and last hop (DPRX).
- *
- * @param link DPIA link being trained.
- * @param hop The Hop in display path. DPRX = 0.
- */
-static enum link_training_result dpia_training_end(struct dc_link *link,
-		struct link_training_settings *lt_settings,
-		uint32_t hop)
-{
-	enum link_training_result result = LINK_TRAINING_SUCCESS;
-	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
-	enum dc_status status;
-
-	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-		if (hop == repeater_cnt) { /* DPTX-to-DPIA */
-			/* Send SET_CONFIG(SET_TRAINING:0xff) to notify DPOA that
-			 * DPTX-to-DPIA hop trained. No DPCD write needed for first hop.
-			 */
-			status = core_link_send_set_config(link,
-					DPIA_SET_CFG_SET_TRAINING,
-					DPIA_TS_UFP_DONE);
-			if (status != DC_OK)
-				result = LINK_TRAINING_ABORT;
-		} else { /* DPOA-to-x */
-			/* Write 0x0 to TRAINING_PATTERN_SET */
-			status = dpcd_clear_lt_pattern(link, hop);
-			if (status != DC_OK)
-				result = LINK_TRAINING_ABORT;
-		}
-
-		/* Notify DPOA that non-transparent link training of DPRX done. */
-		if (hop == DPRX && result != LINK_TRAINING_ABORT) {
-			status = core_link_send_set_config(link,
-					DPIA_SET_CFG_SET_TRAINING,
-					DPIA_TS_DPRX_DONE);
-			if (status != DC_OK)
-				result = LINK_TRAINING_ABORT;
-		}
-
-	} else { /* non-LTTPR or transparent LTTPR. */
-		/* Write 0x0 to TRAINING_PATTERN_SET */
-		status = dpcd_clear_lt_pattern(link, hop);
-		if (status != DC_OK)
-			result = LINK_TRAINING_ABORT;
-	}
-
-	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) end\n - hop(%d)\n - result(%d)\n - LTTPR mode(%d)\n",
-				__func__,
-				link->link_id.enum_id - ENUM_ID_1,
-				hop,
-				result,
-				lt_settings->lttpr_mode);
-
-	return result;
-}
-
-/* When aborting training of specified hop in display path, clean up by:
- * - Attempting to clear DPCD TRAINING_PATTERN_SET, LINK_BW_SET and LANE_COUNT_SET.
- * - Sending SET_CONFIG(SET_LINK) with lane count and link rate set to 0.
- *
- * @param link DPIA link being trained.
- * @param hop The Hop in display path. DPRX = 0.
- */
-static void dpia_training_abort(struct dc_link *link,
-	struct link_training_settings *lt_settings,
-	uint32_t hop)
-{
-	uint8_t data = 0;
-	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
-
-	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) aborting\n - LTTPR mode(%d)\n - HPD(%d)\n",
-				__func__,
-				link->link_id.enum_id - ENUM_ID_1,
-				lt_settings->lttpr_mode,
-				link->is_hpd_pending);
-
-	/* Abandon clean-up if sink unplugged. */
-	if (link->is_hpd_pending)
-		return;
-
-	if (hop != DPRX)
-		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
-			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
-
-	core_link_write_dpcd(link, dpcd_tps_offset, &data, 1);
-	core_link_write_dpcd(link, DP_LINK_BW_SET, &data, 1);
-	core_link_write_dpcd(link, DP_LANE_COUNT_SET, &data, 1);
-	core_link_send_set_config(link, DPIA_SET_CFG_SET_LINK, data);
-}
-
-enum link_training_result dc_link_dpia_perform_link_training(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_setting,
-	bool skip_video_pattern)
-{
-	enum link_training_result result;
-	struct link_training_settings lt_settings = {0};
-	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
-	int8_t repeater_id; /* Current hop. */
-
-	struct dc_link_settings link_settings = *link_setting; // non-const copy to pass in
-
-	lt_settings.lttpr_mode = dp_decide_lttpr_mode(link, &link_settings);
-
-	/* Configure link as prescribed in link_setting and set LTTPR mode. */
-	result = dpia_configure_link(link, link_res, link_setting, &lt_settings);
-	if (result != LINK_TRAINING_SUCCESS)
-		return result;
-
-	if (lt_settings.lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
-		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
-
-	/* Train each hop in turn starting with the one closest to DPTX.
-	 * In transparent or non-LTTPR mode, train only the final hop (DPRX).
-	 */
-	for (repeater_id = repeater_cnt; repeater_id >= 0; repeater_id--) {
-		/* Clock recovery. */
-		result = dpia_training_cr_phase(link, link_res, &lt_settings, repeater_id);
-		if (result != LINK_TRAINING_SUCCESS)
-			break;
-
-		/* Equalization. */
-		result = dpia_training_eq_phase(link, link_res, &lt_settings, repeater_id);
-		if (result != LINK_TRAINING_SUCCESS)
-			break;
-
-		/* Stop training hop. */
-		result = dpia_training_end(link, &lt_settings, repeater_id);
-		if (result != LINK_TRAINING_SUCCESS)
-			break;
-	}
-
-	/* Double-check link status if training successful; gracefully abort
-	 * training of current hop if training failed due to message tunneling
-	 * failure; end training of hop if training ended conventionally and
-	 * falling back to lower bandwidth settings possible.
-	 */
-	if (result == LINK_TRAINING_SUCCESS) {
-		msleep(5);
-		if (!link->is_automated)
-			result = dp_check_link_loss_status(link, &lt_settings);
-	} else if (result == LINK_TRAINING_ABORT) {
-		dpia_training_abort(link, &lt_settings, repeater_id);
-	} else {
-		dpia_training_end(link, &lt_settings, repeater_id);
-	}
-	return result;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h
index 1e97e4264dde..98935cc10bb7 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_dpia.h
@@ -28,57 +28,6 @@
 #define __DC_LINK_DPIA_H__
 
 #include "link.h"
-/* This module implements functionality for training DPIA links. */
-
-/* The approximate time (us) it takes to transmit 9 USB4 DP clock sync packets. */
-#define DPIA_CLK_SYNC_DELAY 16000
-
-/* Extend interval between training status checks for manual testing. */
-#define DPIA_DEBUG_EXTENDED_AUX_RD_INTERVAL_US 60000000
-
-/** @note Can remove once DP tunneling registers in upstream include/drm/drm_dp_helper.h */
-/* DPCD DP Tunneling over USB4 */
-#define DP_TUNNELING_CAPABILITIES_SUPPORT 0xe000d
-#define DP_IN_ADAPTER_INFO                0xe000e
-#define DP_USB4_DRIVER_ID                 0xe000f
-#define DP_USB4_ROUTER_TOPOLOGY_ID        0xe001b
-
-/* SET_CONFIG message types sent by driver. */
-enum dpia_set_config_type {
-	DPIA_SET_CFG_SET_LINK = 0x01,
-	DPIA_SET_CFG_SET_PHY_TEST_MODE = 0x05,
-	DPIA_SET_CFG_SET_TRAINING = 0x18,
-	DPIA_SET_CFG_SET_VSPE = 0x19
-};
-
-/* Training stages (TS) in SET_CONFIG(SET_TRAINING) message. */
-enum dpia_set_config_ts {
-	DPIA_TS_DPRX_DONE = 0x00, /* Done training DPRX. */
-	DPIA_TS_TPS1 = 0x01,
-	DPIA_TS_TPS2 = 0x02,
-	DPIA_TS_TPS3 = 0x03,
-	DPIA_TS_TPS4 = 0x07,
-	DPIA_TS_UFP_DONE = 0xff /* Done training DPTX-to-DPIA hop. */
-};
-
-/* SET_CONFIG message data associated with messages sent by driver. */
-union dpia_set_config_data {
-	struct {
-		uint8_t mode : 1;
-		uint8_t reserved : 7;
-	} set_link;
-	struct {
-		uint8_t stage;
-	} set_training;
-	struct {
-		uint8_t swing : 2;
-		uint8_t max_swing_reached : 1;
-		uint8_t pre_emph : 2;
-		uint8_t max_pre_emph_reached : 1;
-		uint8_t reserved : 2;
-	} set_vspe;
-	uint8_t raw;
-};
 
 /* Read tunneling device capability from DPCD and update link capability
  * accordingly.
@@ -90,14 +39,5 @@ enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link);
  */
 bool dc_link_dpia_query_hpd_status(struct dc_link *link);
 
-/* Train DP tunneling link for USB4 DPIA display endpoint.
- * DPIA equivalent of dc_link_dp_perfrorm_link_training.
- * Aborts link training upon detection of sink unplug.
- */
-enum link_training_result dc_link_dpia_perform_link_training(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	const struct dc_link_settings *link_setting,
-	bool skip_video_pattern);
 
 #endif /* __DC_LINK_DPIA_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
new file mode 100644
index 000000000000..0011618ae978
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.c
@@ -0,0 +1,1698 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements all generic dp link training helper functions and top
+ * level generic training sequence. All variations of dp link training sequence
+ * should be called inside the top level training functions in this file to
+ * ensure the integrity of our overall training procedure across different types
+ * of link encoding and back end hardware.
+ */
+#include "link_dp_training.h"
+#include "link_dp_training_8b_10b.h"
+#include "link_dp_training_128b_132b.h"
+#include "link_dp_training_auxless.h"
+#include "link_dp_training_dpia.h"
+#include "link_dp_training_fixed_vs_pe_retimer.h"
+#include "link_dpcd.h"
+#include "link_dp_trace.h"
+#include "dc_link_dp.h"
+#include "atomfirmware.h"
+#include "link_enc_cfg.h"
+#include "resource.h"
+#include "dm_helpers.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+
+#define POST_LT_ADJ_REQ_LIMIT 6
+#define POST_LT_ADJ_REQ_TIMEOUT 200
+
+void dp_log_training_result(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings,
+	enum link_training_result status)
+{
+	char *link_rate = "Unknown";
+	char *lt_result = "Unknown";
+	char *lt_spread = "Disabled";
+
+	switch (lt_settings->link_settings.link_rate) {
+	case LINK_RATE_LOW:
+		link_rate = "RBR";
+		break;
+	case LINK_RATE_RATE_2:
+		link_rate = "R2";
+		break;
+	case LINK_RATE_RATE_3:
+		link_rate = "R3";
+		break;
+	case LINK_RATE_HIGH:
+		link_rate = "HBR";
+		break;
+	case LINK_RATE_RBR2:
+		link_rate = "RBR2";
+		break;
+	case LINK_RATE_RATE_6:
+		link_rate = "R6";
+		break;
+	case LINK_RATE_HIGH2:
+		link_rate = "HBR2";
+		break;
+	case LINK_RATE_HIGH3:
+		link_rate = "HBR3";
+		break;
+	case LINK_RATE_UHBR10:
+		link_rate = "UHBR10";
+		break;
+	case LINK_RATE_UHBR13_5:
+		link_rate = "UHBR13.5";
+		break;
+	case LINK_RATE_UHBR20:
+		link_rate = "UHBR20";
+		break;
+	default:
+		break;
+	}
+
+	switch (status) {
+	case LINK_TRAINING_SUCCESS:
+		lt_result = "pass";
+		break;
+	case LINK_TRAINING_CR_FAIL_LANE0:
+		lt_result = "CR failed lane0";
+		break;
+	case LINK_TRAINING_CR_FAIL_LANE1:
+		lt_result = "CR failed lane1";
+		break;
+	case LINK_TRAINING_CR_FAIL_LANE23:
+		lt_result = "CR failed lane23";
+		break;
+	case LINK_TRAINING_EQ_FAIL_CR:
+		lt_result = "CR failed in EQ";
+		break;
+	case LINK_TRAINING_EQ_FAIL_CR_PARTIAL:
+		lt_result = "CR failed in EQ partially";
+		break;
+	case LINK_TRAINING_EQ_FAIL_EQ:
+		lt_result = "EQ failed";
+		break;
+	case LINK_TRAINING_LQA_FAIL:
+		lt_result = "LQA failed";
+		break;
+	case LINK_TRAINING_LINK_LOSS:
+		lt_result = "Link loss";
+		break;
+	case DP_128b_132b_LT_FAILED:
+		lt_result = "LT_FAILED received";
+		break;
+	case DP_128b_132b_MAX_LOOP_COUNT_REACHED:
+		lt_result = "max loop count reached";
+		break;
+	case DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT:
+		lt_result = "channel EQ timeout";
+		break;
+	case DP_128b_132b_CDS_DONE_TIMEOUT:
+		lt_result = "CDS timeout";
+		break;
+	default:
+		break;
+	}
+
+	switch (lt_settings->link_settings.link_spread) {
+	case LINK_SPREAD_DISABLED:
+		lt_spread = "Disabled";
+		break;
+	case LINK_SPREAD_05_DOWNSPREAD_30KHZ:
+		lt_spread = "0.5% 30KHz";
+		break;
+	case LINK_SPREAD_05_DOWNSPREAD_33KHZ:
+		lt_spread = "0.5% 33KHz";
+		break;
+	default:
+		break;
+	}
+
+	/* Connectivity log: link training */
+
+	/* TODO - DP2.0 Log: add connectivity log for FFE PRESET */
+
+	CONN_MSG_LT(link, "%sx%d %s VS=%d, PE=%d, DS=%s",
+				link_rate,
+				lt_settings->link_settings.lane_count,
+				lt_result,
+				lt_settings->hw_lane_settings[0].VOLTAGE_SWING,
+				lt_settings->hw_lane_settings[0].PRE_EMPHASIS,
+				lt_spread);
+}
+
+uint8_t dp_initialize_scrambling_data_symbols(
+	struct dc_link *link,
+	enum dc_dp_training_pattern pattern)
+{
+	uint8_t disable_scrabled_data_symbols = 0;
+
+	switch (pattern) {
+	case DP_TRAINING_PATTERN_SEQUENCE_1:
+	case DP_TRAINING_PATTERN_SEQUENCE_2:
+	case DP_TRAINING_PATTERN_SEQUENCE_3:
+		disable_scrabled_data_symbols = 1;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_4:
+	case DP_128b_132b_TPS1:
+	case DP_128b_132b_TPS2:
+		disable_scrabled_data_symbols = 0;
+		break;
+	default:
+		ASSERT(0);
+		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
+			__func__, pattern);
+		break;
+	}
+	return disable_scrabled_data_symbols;
+}
+
+enum dpcd_training_patterns
+	dp_training_pattern_to_dpcd_training_pattern(
+	struct dc_link *link,
+	enum dc_dp_training_pattern pattern)
+{
+	enum dpcd_training_patterns dpcd_tr_pattern =
+	DPCD_TRAINING_PATTERN_VIDEOIDLE;
+
+	switch (pattern) {
+	case DP_TRAINING_PATTERN_SEQUENCE_1:
+		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_1;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_2:
+		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_2;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_3:
+		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_3;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_4:
+		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_4;
+		break;
+	case DP_128b_132b_TPS1:
+		dpcd_tr_pattern = DPCD_128b_132b_TPS1;
+		break;
+	case DP_128b_132b_TPS2:
+		dpcd_tr_pattern = DPCD_128b_132b_TPS2;
+		break;
+	case DP_128b_132b_TPS2_CDS:
+		dpcd_tr_pattern = DPCD_128b_132b_TPS2_CDS;
+		break;
+	case DP_TRAINING_PATTERN_VIDEOIDLE:
+		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_VIDEOIDLE;
+		break;
+	default:
+		ASSERT(0);
+		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
+			__func__, pattern);
+		break;
+	}
+
+	return dpcd_tr_pattern;
+}
+
+static uint8_t get_nibble_at_index(const uint8_t *buf,
+	uint32_t index)
+{
+	uint8_t nibble;
+	nibble = buf[index / 2];
+
+	if (index % 2)
+		nibble >>= 4;
+	else
+		nibble &= 0x0F;
+
+	return nibble;
+}
+
+void dp_wait_for_training_aux_rd_interval(
+	struct dc_link *link,
+	uint32_t wait_in_micro_secs)
+{
+	if (wait_in_micro_secs > 1000)
+		msleep(wait_in_micro_secs/1000);
+	else
+		udelay(wait_in_micro_secs);
+
+	DC_LOG_HW_LINK_TRAINING("%s:\n wait = %d\n",
+		__func__,
+		wait_in_micro_secs);
+}
+
+/* maximum pre emphasis level allowed for each voltage swing level*/
+static const enum dc_pre_emphasis voltage_swing_to_pre_emphasis[] = {
+		PRE_EMPHASIS_LEVEL3,
+		PRE_EMPHASIS_LEVEL2,
+		PRE_EMPHASIS_LEVEL1,
+		PRE_EMPHASIS_DISABLED };
+
+static enum dc_pre_emphasis get_max_pre_emphasis_for_voltage_swing(
+	enum dc_voltage_swing voltage)
+{
+	enum dc_pre_emphasis pre_emphasis;
+	pre_emphasis = PRE_EMPHASIS_MAX_LEVEL;
+
+	if (voltage <= VOLTAGE_SWING_MAX_LEVEL)
+		pre_emphasis = voltage_swing_to_pre_emphasis[voltage];
+
+	return pre_emphasis;
+
+}
+
+static void maximize_lane_settings(const struct link_training_settings *lt_settings,
+		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX])
+{
+	uint32_t lane;
+	struct dc_lane_settings max_requested;
+
+	max_requested.VOLTAGE_SWING = lane_settings[0].VOLTAGE_SWING;
+	max_requested.PRE_EMPHASIS = lane_settings[0].PRE_EMPHASIS;
+	max_requested.FFE_PRESET = lane_settings[0].FFE_PRESET;
+
+	/* Determine what the maximum of the requested settings are*/
+	for (lane = 1; lane < lt_settings->link_settings.lane_count; lane++) {
+		if (lane_settings[lane].VOLTAGE_SWING > max_requested.VOLTAGE_SWING)
+			max_requested.VOLTAGE_SWING = lane_settings[lane].VOLTAGE_SWING;
+
+		if (lane_settings[lane].PRE_EMPHASIS > max_requested.PRE_EMPHASIS)
+			max_requested.PRE_EMPHASIS = lane_settings[lane].PRE_EMPHASIS;
+		if (lane_settings[lane].FFE_PRESET.settings.level >
+				max_requested.FFE_PRESET.settings.level)
+			max_requested.FFE_PRESET.settings.level =
+					lane_settings[lane].FFE_PRESET.settings.level;
+	}
+
+	/* make sure the requested settings are
+	 * not higher than maximum settings*/
+	if (max_requested.VOLTAGE_SWING > VOLTAGE_SWING_MAX_LEVEL)
+		max_requested.VOLTAGE_SWING = VOLTAGE_SWING_MAX_LEVEL;
+
+	if (max_requested.PRE_EMPHASIS > PRE_EMPHASIS_MAX_LEVEL)
+		max_requested.PRE_EMPHASIS = PRE_EMPHASIS_MAX_LEVEL;
+	if (max_requested.FFE_PRESET.settings.level > DP_FFE_PRESET_MAX_LEVEL)
+		max_requested.FFE_PRESET.settings.level = DP_FFE_PRESET_MAX_LEVEL;
+
+	/* make sure the pre-emphasis matches the voltage swing*/
+	if (max_requested.PRE_EMPHASIS >
+		get_max_pre_emphasis_for_voltage_swing(
+			max_requested.VOLTAGE_SWING))
+		max_requested.PRE_EMPHASIS =
+		get_max_pre_emphasis_for_voltage_swing(
+			max_requested.VOLTAGE_SWING);
+
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		lane_settings[lane].VOLTAGE_SWING = max_requested.VOLTAGE_SWING;
+		lane_settings[lane].PRE_EMPHASIS = max_requested.PRE_EMPHASIS;
+		lane_settings[lane].FFE_PRESET = max_requested.FFE_PRESET;
+	}
+}
+
+void dp_hw_to_dpcd_lane_settings(
+		const struct link_training_settings *lt_settings,
+		const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
+		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
+{
+	uint8_t lane = 0;
+
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_8b_10b_ENCODING) {
+			dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET =
+					(uint8_t)(hw_lane_settings[lane].VOLTAGE_SWING);
+			dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET =
+					(uint8_t)(hw_lane_settings[lane].PRE_EMPHASIS);
+			dpcd_lane_settings[lane].bits.MAX_SWING_REACHED =
+					(hw_lane_settings[lane].VOLTAGE_SWING ==
+							VOLTAGE_SWING_MAX_LEVEL ? 1 : 0);
+			dpcd_lane_settings[lane].bits.MAX_PRE_EMPHASIS_REACHED =
+					(hw_lane_settings[lane].PRE_EMPHASIS ==
+							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
+		} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_128b_132b_ENCODING) {
+			dpcd_lane_settings[lane].tx_ffe.PRESET_VALUE =
+					hw_lane_settings[lane].FFE_PRESET.settings.level;
+		}
+	}
+}
+
+uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
+{
+	uint8_t link_rate = 0;
+	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_settings);
+
+	if (encoding == DP_128b_132b_ENCODING)
+		switch (link_settings->link_rate) {
+		case LINK_RATE_UHBR10:
+			link_rate = 0x1;
+			break;
+		case LINK_RATE_UHBR20:
+			link_rate = 0x2;
+			break;
+		case LINK_RATE_UHBR13_5:
+			link_rate = 0x4;
+			break;
+		default:
+			link_rate = 0;
+			break;
+		}
+	else if (encoding == DP_8b_10b_ENCODING)
+		link_rate = (uint8_t) link_settings->link_rate;
+	else
+		link_rate = 0;
+
+	return link_rate;
+}
+
+/* Only used for channel equalization */
+uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval)
+{
+	unsigned int aux_rd_interval_us = 400;
+
+	switch (dpcd_aux_read_interval) {
+	case 0x01:
+		aux_rd_interval_us = 4000;
+		break;
+	case 0x02:
+		aux_rd_interval_us = 8000;
+		break;
+	case 0x03:
+		aux_rd_interval_us = 12000;
+		break;
+	case 0x04:
+		aux_rd_interval_us = 16000;
+		break;
+	case 0x05:
+		aux_rd_interval_us = 32000;
+		break;
+	case 0x06:
+		aux_rd_interval_us = 64000;
+		break;
+	default:
+		break;
+	}
+
+	return aux_rd_interval_us;
+}
+
+enum link_training_result dp_get_cr_failure(enum dc_lane_count ln_count,
+					union lane_status *dpcd_lane_status)
+{
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+
+	if (ln_count >= LANE_COUNT_ONE && !dpcd_lane_status[0].bits.CR_DONE_0)
+		result = LINK_TRAINING_CR_FAIL_LANE0;
+	else if (ln_count >= LANE_COUNT_TWO && !dpcd_lane_status[1].bits.CR_DONE_0)
+		result = LINK_TRAINING_CR_FAIL_LANE1;
+	else if (ln_count >= LANE_COUNT_FOUR && !dpcd_lane_status[2].bits.CR_DONE_0)
+		result = LINK_TRAINING_CR_FAIL_LANE23;
+	else if (ln_count >= LANE_COUNT_FOUR && !dpcd_lane_status[3].bits.CR_DONE_0)
+		result = LINK_TRAINING_CR_FAIL_LANE23;
+	return result;
+}
+
+bool is_repeater(const struct link_training_settings *lt_settings, uint32_t offset)
+{
+	return (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) && (offset != 0);
+}
+
+bool dp_is_max_vs_reached(
+	const struct link_training_settings *lt_settings)
+{
+	uint32_t lane;
+	for (lane = 0; lane <
+		(uint32_t)(lt_settings->link_settings.lane_count);
+		lane++) {
+		if (lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET
+			== VOLTAGE_SWING_MAX_LEVEL)
+			return true;
+	}
+	return false;
+
+}
+
+bool dp_is_cr_done(enum dc_lane_count ln_count,
+	union lane_status *dpcd_lane_status)
+{
+	bool done = true;
+	uint32_t lane;
+	/*LANEx_CR_DONE bits All 1's?*/
+	for (lane = 0; lane < (uint32_t)(ln_count); lane++) {
+		if (!dpcd_lane_status[lane].bits.CR_DONE_0)
+			done = false;
+	}
+	return done;
+
+}
+
+bool dp_is_ch_eq_done(enum dc_lane_count ln_count,
+		union lane_status *dpcd_lane_status)
+{
+	bool done = true;
+	uint32_t lane;
+	for (lane = 0; lane < (uint32_t)(ln_count); lane++)
+		if (!dpcd_lane_status[lane].bits.CHANNEL_EQ_DONE_0)
+			done = false;
+	return done;
+}
+
+bool dp_is_symbol_locked(enum dc_lane_count ln_count,
+		union lane_status *dpcd_lane_status)
+{
+	bool locked = true;
+	uint32_t lane;
+	for (lane = 0; lane < (uint32_t)(ln_count); lane++)
+		if (!dpcd_lane_status[lane].bits.SYMBOL_LOCKED_0)
+			locked = false;
+	return locked;
+}
+
+bool dp_is_interlane_aligned(union lane_align_status_updated align_status)
+{
+	return align_status.bits.INTERLANE_ALIGN_DONE == 1;
+}
+
+enum link_training_result dp_check_link_loss_status(
+	struct dc_link *link,
+	const struct link_training_settings *link_training_setting)
+{
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+	union lane_status lane_status;
+	uint8_t dpcd_buf[6] = {0};
+	uint32_t lane;
+
+	core_link_read_dpcd(
+			link,
+			DP_SINK_COUNT,
+			(uint8_t *)(dpcd_buf),
+			sizeof(dpcd_buf));
+
+	/*parse lane status*/
+	for (lane = 0; lane < link->cur_link_settings.lane_count; lane++) {
+		/*
+		 * check lanes status
+		 */
+		lane_status.raw = get_nibble_at_index(&dpcd_buf[2], lane);
+
+		if (!lane_status.bits.CHANNEL_EQ_DONE_0 ||
+			!lane_status.bits.CR_DONE_0 ||
+			!lane_status.bits.SYMBOL_LOCKED_0) {
+			/* if one of the channel equalization, clock
+			 * recovery or symbol lock is dropped
+			 * consider it as (link has been
+			 * dropped) dp sink status has changed
+			 */
+			status = LINK_TRAINING_LINK_LOSS;
+			break;
+		}
+	}
+
+	return status;
+}
+
+enum dc_status dp_get_lane_status_and_lane_adjust(
+	struct dc_link *link,
+	const struct link_training_settings *link_training_setting,
+	union lane_status ln_status[LANE_COUNT_DP_MAX],
+	union lane_align_status_updated *ln_align,
+	union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
+	uint32_t offset)
+{
+	unsigned int lane01_status_address = DP_LANE0_1_STATUS;
+	uint8_t lane_adjust_offset = 4;
+	unsigned int lane01_adjust_address;
+	uint8_t dpcd_buf[6] = {0};
+	uint32_t lane;
+	enum dc_status status;
+
+	if (is_repeater(link_training_setting, offset)) {
+		lane01_status_address =
+				DP_LANE0_1_STATUS_PHY_REPEATER1 +
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+		lane_adjust_offset = 3;
+	}
+
+	status = core_link_read_dpcd(
+		link,
+		lane01_status_address,
+		(uint8_t *)(dpcd_buf),
+		sizeof(dpcd_buf));
+
+	if (status != DC_OK) {
+		DC_LOG_HW_LINK_TRAINING("%s:\n Failed to read from address 0x%X,"
+			" keep current lane status and lane adjust unchanged",
+			__func__,
+			lane01_status_address);
+		return status;
+	}
+
+	for (lane = 0; lane <
+		(uint32_t)(link_training_setting->link_settings.lane_count);
+		lane++) {
+
+		ln_status[lane].raw =
+			get_nibble_at_index(&dpcd_buf[0], lane);
+		ln_adjust[lane].raw =
+			get_nibble_at_index(&dpcd_buf[lane_adjust_offset], lane);
+	}
+
+	ln_align->raw = dpcd_buf[2];
+
+	if (is_repeater(link_training_setting, offset)) {
+		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
+				" 0x%X Lane01Status = %x\n 0x%X Lane23Status = %x\n ",
+			__func__,
+			offset,
+			lane01_status_address, dpcd_buf[0],
+			lane01_status_address + 1, dpcd_buf[1]);
+
+		lane01_adjust_address = DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1 +
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+
+		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
+				" 0x%X Lane01AdjustRequest = %x\n 0x%X Lane23AdjustRequest = %x\n",
+					__func__,
+					offset,
+					lane01_adjust_address,
+					dpcd_buf[lane_adjust_offset],
+					lane01_adjust_address + 1,
+					dpcd_buf[lane_adjust_offset + 1]);
+	} else {
+		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X Lane01Status = %x\n 0x%X Lane23Status = %x\n ",
+			__func__,
+			lane01_status_address, dpcd_buf[0],
+			lane01_status_address + 1, dpcd_buf[1]);
+
+		lane01_adjust_address = DP_ADJUST_REQUEST_LANE0_1;
+
+		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X Lane01AdjustRequest = %x\n 0x%X Lane23AdjustRequest = %x\n",
+			__func__,
+			lane01_adjust_address,
+			dpcd_buf[lane_adjust_offset],
+			lane01_adjust_address + 1,
+			dpcd_buf[lane_adjust_offset + 1]);
+	}
+
+	return status;
+}
+
+static void override_lane_settings(const struct link_training_settings *lt_settings,
+		struct dc_lane_settings lane_settings[LANE_COUNT_DP_MAX])
+{
+	uint32_t lane;
+
+	if (lt_settings->voltage_swing == NULL &&
+			lt_settings->pre_emphasis == NULL &&
+			lt_settings->ffe_preset == NULL &&
+			lt_settings->post_cursor2 == NULL)
+
+		return;
+
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		if (lt_settings->voltage_swing)
+			lane_settings[lane].VOLTAGE_SWING = *lt_settings->voltage_swing;
+		if (lt_settings->pre_emphasis)
+			lane_settings[lane].PRE_EMPHASIS = *lt_settings->pre_emphasis;
+		if (lt_settings->post_cursor2)
+			lane_settings[lane].POST_CURSOR2 = *lt_settings->post_cursor2;
+		if (lt_settings->ffe_preset)
+			lane_settings[lane].FFE_PRESET = *lt_settings->ffe_preset;
+	}
+}
+
+void dp_get_lttpr_mode_override(struct dc_link *link, enum lttpr_mode *override)
+{
+	if (!dp_is_lttpr_present(link))
+		return;
+
+	if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_TRANSPARENT) {
+		*override = LTTPR_MODE_TRANSPARENT;
+	} else if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_NON_TRANSPARENT) {
+		*override = LTTPR_MODE_NON_TRANSPARENT;
+	} else if (link->dc->debug.lttpr_mode_override == LTTPR_MODE_NON_LTTPR) {
+		*override = LTTPR_MODE_NON_LTTPR;
+	}
+	DC_LOG_DC("lttpr_mode_override chose LTTPR_MODE = %d\n", (uint8_t)(*override));
+}
+
+void override_training_settings(
+		struct dc_link *link,
+		const struct dc_link_training_overrides *overrides,
+		struct link_training_settings *lt_settings)
+{
+	uint32_t lane;
+
+	/* Override link spread */
+	if (!link->dp_ss_off && overrides->downspread != NULL)
+		lt_settings->link_settings.link_spread = *overrides->downspread ?
+				LINK_SPREAD_05_DOWNSPREAD_30KHZ
+				: LINK_SPREAD_DISABLED;
+
+	/* Override lane settings */
+	if (overrides->voltage_swing != NULL)
+		lt_settings->voltage_swing = overrides->voltage_swing;
+	if (overrides->pre_emphasis != NULL)
+		lt_settings->pre_emphasis = overrides->pre_emphasis;
+	if (overrides->post_cursor2 != NULL)
+		lt_settings->post_cursor2 = overrides->post_cursor2;
+	if (overrides->ffe_preset != NULL)
+		lt_settings->ffe_preset = overrides->ffe_preset;
+	/* Override HW lane settings with BIOS forced values if present */
+	if ((link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) &&
+			lt_settings->lttpr_mode == LTTPR_MODE_TRANSPARENT) {
+		lt_settings->voltage_swing = &link->bios_forced_drive_settings.VOLTAGE_SWING;
+		lt_settings->pre_emphasis = &link->bios_forced_drive_settings.PRE_EMPHASIS;
+		lt_settings->always_match_dpcd_with_hw_lane_settings = false;
+	}
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		lt_settings->hw_lane_settings[lane].VOLTAGE_SWING =
+			lt_settings->voltage_swing != NULL ?
+			*lt_settings->voltage_swing :
+			VOLTAGE_SWING_LEVEL0;
+		lt_settings->hw_lane_settings[lane].PRE_EMPHASIS =
+			lt_settings->pre_emphasis != NULL ?
+			*lt_settings->pre_emphasis
+			: PRE_EMPHASIS_DISABLED;
+		lt_settings->hw_lane_settings[lane].POST_CURSOR2 =
+			lt_settings->post_cursor2 != NULL ?
+			*lt_settings->post_cursor2
+			: POST_CURSOR2_DISABLED;
+	}
+
+	if (lt_settings->always_match_dpcd_with_hw_lane_settings)
+		dp_hw_to_dpcd_lane_settings(lt_settings,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+
+	/* Override training timings */
+	if (overrides->cr_pattern_time != NULL)
+		lt_settings->cr_pattern_time = *overrides->cr_pattern_time;
+	if (overrides->eq_pattern_time != NULL)
+		lt_settings->eq_pattern_time = *overrides->eq_pattern_time;
+	if (overrides->pattern_for_cr != NULL)
+		lt_settings->pattern_for_cr = *overrides->pattern_for_cr;
+	if (overrides->pattern_for_eq != NULL)
+		lt_settings->pattern_for_eq = *overrides->pattern_for_eq;
+	if (overrides->enhanced_framing != NULL)
+		lt_settings->enhanced_framing = *overrides->enhanced_framing;
+	if (link->preferred_training_settings.fec_enable != NULL)
+		lt_settings->should_set_fec_ready = *link->preferred_training_settings.fec_enable;
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	/* Check DP tunnel LTTPR mode debug option. */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA && link->dc->debug.dpia_debug.bits.force_non_lttpr)
+		lt_settings->lttpr_mode = LTTPR_MODE_NON_LTTPR;
+
+#endif
+	dp_get_lttpr_mode_override(link, &lt_settings->lttpr_mode);
+
+}
+
+enum dc_dp_training_pattern decide_cr_training_pattern(
+		const struct dc_link_settings *link_settings)
+{
+	switch (dp_get_link_encoding_format(link_settings)) {
+	case DP_8b_10b_ENCODING:
+	default:
+		return DP_TRAINING_PATTERN_SEQUENCE_1;
+	case DP_128b_132b_ENCODING:
+		return DP_128b_132b_TPS1;
+	}
+}
+
+enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
+		const struct dc_link_settings *link_settings)
+{
+	struct link_encoder *link_enc;
+	struct encoder_feature_support *enc_caps;
+	struct dpcd_caps *rx_caps = &link->dpcd_caps;
+	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+	enc_caps = &link_enc->features;
+
+	switch (dp_get_link_encoding_format(link_settings)) {
+	case DP_8b_10b_ENCODING:
+		if (enc_caps->flags.bits.IS_TPS4_CAPABLE &&
+				rx_caps->max_down_spread.bits.TPS4_SUPPORTED)
+			pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
+		else if (enc_caps->flags.bits.IS_TPS3_CAPABLE &&
+				rx_caps->max_ln_count.bits.TPS3_SUPPORTED)
+			pattern = DP_TRAINING_PATTERN_SEQUENCE_3;
+		else
+			pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
+		break;
+	case DP_128b_132b_ENCODING:
+		pattern = DP_128b_132b_TPS2;
+		break;
+	default:
+		pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
+		break;
+	}
+	return pattern;
+}
+
+enum lttpr_mode dc_link_decide_lttpr_mode(struct dc_link *link,
+		struct dc_link_settings *link_setting)
+{
+	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_setting);
+
+	if (encoding == DP_8b_10b_ENCODING)
+		return dp_decide_8b_10b_lttpr_mode(link);
+	else if (encoding == DP_128b_132b_ENCODING)
+		return dp_decide_128b_132b_lttpr_mode(link);
+
+	ASSERT(0);
+	return LTTPR_MODE_NON_LTTPR;
+}
+
+void dp_decide_lane_settings(
+		const struct link_training_settings *lt_settings,
+		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
+		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
+		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
+{
+	uint32_t lane;
+
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_8b_10b_ENCODING) {
+			hw_lane_settings[lane].VOLTAGE_SWING =
+					(enum dc_voltage_swing)(ln_adjust[lane].bits.
+							VOLTAGE_SWING_LANE);
+			hw_lane_settings[lane].PRE_EMPHASIS =
+					(enum dc_pre_emphasis)(ln_adjust[lane].bits.
+							PRE_EMPHASIS_LANE);
+		} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_128b_132b_ENCODING) {
+			hw_lane_settings[lane].FFE_PRESET.raw =
+					ln_adjust[lane].tx_ffe.PRESET_VALUE;
+		}
+	}
+	dp_hw_to_dpcd_lane_settings(lt_settings, hw_lane_settings, dpcd_lane_settings);
+
+	if (lt_settings->disallow_per_lane_settings) {
+		/* we find the maximum of the requested settings across all lanes*/
+		/* and set this maximum for all lanes*/
+		maximize_lane_settings(lt_settings, hw_lane_settings);
+		override_lane_settings(lt_settings, hw_lane_settings);
+
+		if (lt_settings->always_match_dpcd_with_hw_lane_settings)
+			dp_hw_to_dpcd_lane_settings(lt_settings, hw_lane_settings, dpcd_lane_settings);
+	}
+
+}
+
+void dp_decide_training_settings(
+		struct dc_link *link,
+		const struct dc_link_settings *link_settings,
+		struct link_training_settings *lt_settings)
+{
+	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
+		decide_8b_10b_training_settings(link, link_settings, lt_settings);
+	else if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING)
+		decide_128b_132b_training_settings(link, link_settings, lt_settings);
+}
+
+
+enum dc_status configure_lttpr_mode_transparent(struct dc_link *link)
+{
+	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
+
+	DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
+	return core_link_write_dpcd(link,
+			DP_PHY_REPEATER_MODE,
+			(uint8_t *)&repeater_mode,
+			sizeof(repeater_mode));
+}
+
+static enum dc_status configure_lttpr_mode_non_transparent(
+		struct dc_link *link,
+		const struct link_training_settings *lt_settings)
+{
+	/* aux timeout is already set to extended */
+	/* RESET/SET lttpr mode to enable non transparent mode */
+	uint8_t repeater_cnt;
+	uint32_t aux_interval_address;
+	uint8_t repeater_id;
+	enum dc_status result = DC_ERROR_UNEXPECTED;
+	uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
+
+	enum dp_link_encoding encoding = dp_get_link_encoding_format(&lt_settings->link_settings);
+
+	if (encoding == DP_8b_10b_ENCODING) {
+		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Transparent Mode\n", __func__);
+		result = core_link_write_dpcd(link,
+				DP_PHY_REPEATER_MODE,
+				(uint8_t *)&repeater_mode,
+				sizeof(repeater_mode));
+
+	}
+
+	if (result == DC_OK) {
+		link->dpcd_caps.lttpr_caps.mode = repeater_mode;
+	}
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+
+		DC_LOG_HW_LINK_TRAINING("%s\n Set LTTPR to Non Transparent Mode\n", __func__);
+
+		repeater_mode = DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+		result = core_link_write_dpcd(link,
+				DP_PHY_REPEATER_MODE,
+				(uint8_t *)&repeater_mode,
+				sizeof(repeater_mode));
+
+		if (result == DC_OK) {
+			link->dpcd_caps.lttpr_caps.mode = repeater_mode;
+		}
+
+		if (encoding == DP_8b_10b_ENCODING) {
+			repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+			/* Driver does not need to train the first hop. Skip DPCD read and clear
+			 * AUX_RD_INTERVAL for DPTX-to-DPIA hop.
+			 */
+			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+				link->dpcd_caps.lttpr_caps.aux_rd_interval[--repeater_cnt] = 0;
+
+			for (repeater_id = repeater_cnt; repeater_id > 0; repeater_id--) {
+				aux_interval_address = DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1 +
+						((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (repeater_id - 1));
+				core_link_read_dpcd(
+						link,
+						aux_interval_address,
+						(uint8_t *)&link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1],
+						sizeof(link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1]));
+				link->dpcd_caps.lttpr_caps.aux_rd_interval[repeater_id - 1] &= 0x7F;
+			}
+		}
+	}
+
+	return result;
+}
+
+enum dc_status dpcd_configure_lttpr_mode(struct dc_link *link, struct link_training_settings *lt_settings)
+{
+	enum dc_status status = DC_OK;
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_TRANSPARENT)
+		status = configure_lttpr_mode_transparent(link);
+
+	else if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
+		status = configure_lttpr_mode_non_transparent(link, lt_settings);
+
+	return status;
+}
+
+void repeater_training_done(struct dc_link *link, uint32_t offset)
+{
+	union dpcd_training_pattern dpcd_pattern = {0};
+
+	const uint32_t dpcd_base_lt_offset =
+			DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+	/* Set training not in progress*/
+	dpcd_pattern.v1_4.TRAINING_PATTERN_SET = DPCD_TRAINING_PATTERN_VIDEOIDLE;
+
+	core_link_write_dpcd(
+		link,
+		dpcd_base_lt_offset,
+		&dpcd_pattern.raw,
+		1);
+
+	DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Id: %d 0x%X pattern = %x\n",
+		__func__,
+		offset,
+		dpcd_base_lt_offset,
+		dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+}
+
+static void dpcd_exit_training_mode(struct dc_link *link, enum dp_link_encoding encoding)
+{
+	uint8_t sink_status = 0;
+	uint8_t i;
+
+	/* clear training pattern set */
+	dpcd_set_training_pattern(link, DP_TRAINING_PATTERN_VIDEOIDLE);
+
+	if (encoding == DP_128b_132b_ENCODING) {
+		/* poll for intra-hop disable */
+		for (i = 0; i < 10; i++) {
+			if ((core_link_read_dpcd(link, DP_SINK_STATUS, &sink_status, 1) == DC_OK) &&
+					(sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION) == 0)
+				break;
+			udelay(1000);
+		}
+	}
+}
+
+enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
+		struct link_training_settings *lt_settings)
+{
+	enum dp_link_encoding encoding =
+			dp_get_link_encoding_format(
+					&lt_settings->link_settings);
+	enum dc_status status;
+
+	status = core_link_write_dpcd(
+			link,
+			DP_MAIN_LINK_CHANNEL_CODING_SET,
+			(uint8_t *) &encoding,
+			1);
+	DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X MAIN_LINK_CHANNEL_CODING_SET = %x\n",
+					__func__,
+					DP_MAIN_LINK_CHANNEL_CODING_SET,
+					encoding);
+
+	return status;
+}
+
+void dpcd_set_training_pattern(
+	struct dc_link *link,
+	enum dc_dp_training_pattern training_pattern)
+{
+	union dpcd_training_pattern dpcd_pattern = {0};
+
+	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
+			dp_training_pattern_to_dpcd_training_pattern(
+					link, training_pattern);
+
+	core_link_write_dpcd(
+		link,
+		DP_TRAINING_PATTERN_SET,
+		&dpcd_pattern.raw,
+		1);
+
+	DC_LOG_HW_LINK_TRAINING("%s\n %x pattern = %x\n",
+		__func__,
+		DP_TRAINING_PATTERN_SET,
+		dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+}
+
+enum dc_status dpcd_set_link_settings(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings)
+{
+	uint8_t rate;
+	enum dc_status status;
+
+	union down_spread_ctrl downspread = {0};
+	union lane_count_set lane_count_set = {0};
+
+	downspread.raw = (uint8_t)
+	(lt_settings->link_settings.link_spread);
+
+	lane_count_set.bits.LANE_COUNT_SET =
+	lt_settings->link_settings.lane_count;
+
+	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
+	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
+
+
+	if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
+			lt_settings->pattern_for_eq < DP_TRAINING_PATTERN_SEQUENCE_4) {
+		lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED =
+				link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED;
+	}
+
+	status = core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
+		&downspread.raw, sizeof(downspread));
+
+	status = core_link_write_dpcd(link, DP_LANE_COUNT_SET,
+		&lane_count_set.raw, 1);
+
+	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_13 &&
+			lt_settings->link_settings.use_link_rate_set == true) {
+		rate = 0;
+		/* WA for some MUX chips that will power down with eDP and lose supported
+		 * link rate set for eDP 1.4. Source reads DPCD 0x010 again to ensure
+		 * MUX chip gets link rate set back before link training.
+		 */
+		if (link->connector_signal == SIGNAL_TYPE_EDP) {
+			uint8_t supported_link_rates[16];
+
+			core_link_read_dpcd(link, DP_SUPPORTED_LINK_RATES,
+					supported_link_rates, sizeof(supported_link_rates));
+		}
+		status = core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
+		status = core_link_write_dpcd(link, DP_LINK_RATE_SET,
+				&lt_settings->link_settings.link_rate_set, 1);
+	} else {
+		rate = get_dpcd_link_rate(&lt_settings->link_settings);
+
+		status = core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
+	}
+
+	if (rate) {
+		DC_LOG_HW_LINK_TRAINING("%s\n %x rate = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
+			__func__,
+			DP_LINK_BW_SET,
+			lt_settings->link_settings.link_rate,
+			DP_LANE_COUNT_SET,
+			lt_settings->link_settings.lane_count,
+			lt_settings->enhanced_framing,
+			DP_DOWNSPREAD_CTRL,
+			lt_settings->link_settings.link_spread);
+	} else {
+		DC_LOG_HW_LINK_TRAINING("%s\n %x rate set = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
+			__func__,
+			DP_LINK_RATE_SET,
+			lt_settings->link_settings.link_rate_set,
+			DP_LANE_COUNT_SET,
+			lt_settings->link_settings.lane_count,
+			lt_settings->enhanced_framing,
+			DP_DOWNSPREAD_CTRL,
+			lt_settings->link_settings.link_spread);
+	}
+
+	return status;
+}
+
+enum dc_status dpcd_set_lane_settings(
+	struct dc_link *link,
+	const struct link_training_settings *link_training_setting,
+	uint32_t offset)
+{
+	unsigned int lane0_set_address;
+	enum dc_status status;
+	lane0_set_address = DP_TRAINING_LANE0_SET;
+
+	if (is_repeater(link_training_setting, offset))
+		lane0_set_address = DP_TRAINING_LANE0_SET_PHY_REPEATER1 +
+		((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+
+	status = core_link_write_dpcd(link,
+		lane0_set_address,
+		(uint8_t *)(link_training_setting->dpcd_lane_settings),
+		link_training_setting->link_settings.lane_count);
+
+	if (is_repeater(link_training_setting, offset)) {
+		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n"
+				" 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
+			__func__,
+			offset,
+			lane0_set_address,
+			link_training_setting->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
+			link_training_setting->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
+			link_training_setting->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
+			link_training_setting->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
+
+	} else {
+		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
+			__func__,
+			lane0_set_address,
+			link_training_setting->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
+			link_training_setting->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
+			link_training_setting->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
+			link_training_setting->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
+	}
+
+	return status;
+}
+
+void dpcd_set_lt_pattern_and_lane_settings(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings,
+	enum dc_dp_training_pattern pattern,
+	uint32_t offset)
+{
+	uint32_t dpcd_base_lt_offset;
+	uint8_t dpcd_lt_buffer[5] = {0};
+	union dpcd_training_pattern dpcd_pattern = {0};
+	uint32_t size_in_bytes;
+	bool edp_workaround = false; /* TODO link_prop.INTERNAL */
+	dpcd_base_lt_offset = DP_TRAINING_PATTERN_SET;
+
+	if (is_repeater(lt_settings, offset))
+		dpcd_base_lt_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+
+	/*****************************************************************
+	* DpcdAddress_TrainingPatternSet
+	*****************************************************************/
+	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
+		dp_training_pattern_to_dpcd_training_pattern(link, pattern);
+
+	dpcd_pattern.v1_4.SCRAMBLING_DISABLE =
+		dp_initialize_scrambling_data_symbols(link, pattern);
+
+	dpcd_lt_buffer[DP_TRAINING_PATTERN_SET - DP_TRAINING_PATTERN_SET]
+		= dpcd_pattern.raw;
+
+	if (is_repeater(lt_settings, offset)) {
+		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n 0x%X pattern = %x\n",
+			__func__,
+			offset,
+			dpcd_base_lt_offset,
+			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+	} else {
+		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X pattern = %x\n",
+			__func__,
+			dpcd_base_lt_offset,
+			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+	}
+
+	/* concatenate everything into one buffer*/
+	size_in_bytes = lt_settings->link_settings.lane_count *
+			sizeof(lt_settings->dpcd_lane_settings[0]);
+
+	 // 0x00103 - 0x00102
+	memmove(
+		&dpcd_lt_buffer[DP_TRAINING_LANE0_SET - DP_TRAINING_PATTERN_SET],
+		lt_settings->dpcd_lane_settings,
+		size_in_bytes);
+
+	if (is_repeater(lt_settings, offset)) {
+		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_128b_132b_ENCODING)
+			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
+					" 0x%X TX_FFE_PRESET_VALUE = %x\n",
+					__func__,
+					offset,
+					dpcd_base_lt_offset,
+					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
+		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_8b_10b_ENCODING)
+		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
+				" 0x%X VS set = %x PE set = %x max VS Reached = %x  max PE Reached = %x\n",
+			__func__,
+			offset,
+			dpcd_base_lt_offset,
+			lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
+			lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
+			lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
+			lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
+	} else {
+		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_128b_132b_ENCODING)
+			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
+					__func__,
+					dpcd_base_lt_offset,
+					lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
+		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_8b_10b_ENCODING)
+			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
+					__func__,
+					dpcd_base_lt_offset,
+					lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET,
+					lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET,
+					lt_settings->dpcd_lane_settings[0].bits.MAX_SWING_REACHED,
+					lt_settings->dpcd_lane_settings[0].bits.MAX_PRE_EMPHASIS_REACHED);
+	}
+	if (edp_workaround) {
+		/* for eDP write in 2 parts because the 5-byte burst is
+		* causing issues on some eDP panels (EPR#366724)
+		*/
+		core_link_write_dpcd(
+			link,
+			DP_TRAINING_PATTERN_SET,
+			&dpcd_pattern.raw,
+			sizeof(dpcd_pattern.raw));
+
+		core_link_write_dpcd(
+			link,
+			DP_TRAINING_LANE0_SET,
+			(uint8_t *)(lt_settings->dpcd_lane_settings),
+			size_in_bytes);
+
+	} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
+			DP_128b_132b_ENCODING) {
+		core_link_write_dpcd(
+				link,
+				dpcd_base_lt_offset,
+				dpcd_lt_buffer,
+				sizeof(dpcd_lt_buffer));
+	} else
+		/* write it all in (1 + number-of-lanes)-byte burst*/
+		core_link_write_dpcd(
+				link,
+				dpcd_base_lt_offset,
+				dpcd_lt_buffer,
+				size_in_bytes + sizeof(dpcd_pattern.raw));
+}
+
+void start_clock_recovery_pattern_early(struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t offset)
+{
+	DC_LOG_HW_LINK_TRAINING("%s\n GPU sends TPS1. Wait 400us.\n",
+			__func__);
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
+	dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
+	udelay(400);
+}
+
+void dp_set_hw_test_pattern(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	enum dp_test_pattern test_pattern,
+	uint8_t *custom_pattern,
+	uint32_t custom_pattern_size)
+{
+	const struct link_hwss *link_hwss = get_link_hwss(link, link_res);
+	struct encoder_set_dp_phy_pattern_param pattern_param = {0};
+
+	pattern_param.dp_phy_pattern = test_pattern;
+	pattern_param.custom_pattern = custom_pattern;
+	pattern_param.custom_pattern_size = custom_pattern_size;
+	pattern_param.dp_panel_mode = dp_get_panel_mode(link);
+
+	if (link_hwss->ext.set_dp_link_test_pattern)
+		link_hwss->ext.set_dp_link_test_pattern(link, link_res, &pattern_param);
+}
+
+bool dp_set_hw_training_pattern(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	enum dc_dp_training_pattern pattern,
+	uint32_t offset)
+{
+	enum dp_test_pattern test_pattern = DP_TEST_PATTERN_UNSUPPORTED;
+
+	switch (pattern) {
+	case DP_TRAINING_PATTERN_SEQUENCE_1:
+		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN1;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_2:
+		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN2;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_3:
+		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN3;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_4:
+		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
+		break;
+	case DP_128b_132b_TPS1:
+		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE;
+		break;
+	case DP_128b_132b_TPS2:
+		test_pattern = DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE;
+		break;
+	default:
+		break;
+	}
+
+	dp_set_hw_test_pattern(link, link_res, test_pattern, NULL, 0);
+
+	return true;
+}
+
+static bool perform_post_lt_adj_req_sequence(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum dc_lane_count lane_count =
+	lt_settings->link_settings.lane_count;
+
+	uint32_t adj_req_count;
+	uint32_t adj_req_timer;
+	bool req_drv_setting_changed;
+	uint32_t lane;
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+	req_drv_setting_changed = false;
+	for (adj_req_count = 0; adj_req_count < POST_LT_ADJ_REQ_LIMIT;
+	adj_req_count++) {
+
+		req_drv_setting_changed = false;
+
+		for (adj_req_timer = 0;
+			adj_req_timer < POST_LT_ADJ_REQ_TIMEOUT;
+			adj_req_timer++) {
+
+			dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				DPRX);
+
+			if (dpcd_lane_status_updated.bits.
+					POST_LT_ADJ_REQ_IN_PROGRESS == 0)
+				return true;
+
+			if (!dp_is_cr_done(lane_count, dpcd_lane_status))
+				return false;
+
+			if (!dp_is_ch_eq_done(lane_count, dpcd_lane_status) ||
+					!dp_is_symbol_locked(lane_count, dpcd_lane_status) ||
+					!dp_is_interlane_aligned(dpcd_lane_status_updated))
+				return false;
+
+			for (lane = 0; lane < (uint32_t)(lane_count); lane++) {
+
+				if (lt_settings->
+				dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET !=
+				dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_LANE ||
+				lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET !=
+				dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_LANE) {
+
+					req_drv_setting_changed = true;
+					break;
+				}
+			}
+
+			if (req_drv_setting_changed) {
+				dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+						lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+
+				dc_link_dp_set_drive_settings(link,
+						link_res,
+						lt_settings);
+				break;
+			}
+
+			msleep(1);
+		}
+
+		if (!req_drv_setting_changed) {
+			DC_LOG_WARNING("%s: Post Link Training Adjust Request Timed out\n",
+				__func__);
+
+			ASSERT(0);
+			return true;
+		}
+	}
+	DC_LOG_WARNING("%s: Post Link Training Adjust Request limit reached\n",
+		__func__);
+
+	ASSERT(0);
+	return true;
+
+}
+
+static enum link_training_result dp_transition_to_video_idle(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings,
+	enum link_training_result status)
+{
+	union lane_count_set lane_count_set = {0};
+
+	/* 4. mainlink output idle pattern*/
+	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+
+	/*
+	 * 5. post training adjust if required
+	 * If the upstream DPTX and downstream DPRX both support TPS4,
+	 * TPS4 must be used instead of POST_LT_ADJ_REQ.
+	 */
+	if (link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED != 1 ||
+			lt_settings->pattern_for_eq >= DP_TRAINING_PATTERN_SEQUENCE_4) {
+		/* delay 5ms after Main Link output idle pattern and then check
+		 * DPCD 0202h.
+		 */
+		if (link->connector_signal != SIGNAL_TYPE_EDP && status == LINK_TRAINING_SUCCESS) {
+			msleep(5);
+			status = dp_check_link_loss_status(link, lt_settings);
+		}
+		return status;
+	}
+
+	if (status == LINK_TRAINING_SUCCESS &&
+		perform_post_lt_adj_req_sequence(link, link_res, lt_settings) == false)
+		status = LINK_TRAINING_LQA_FAIL;
+
+	lane_count_set.bits.LANE_COUNT_SET = lt_settings->link_settings.lane_count;
+	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
+	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
+
+	core_link_write_dpcd(
+		link,
+		DP_LANE_COUNT_SET,
+		&lane_count_set.raw,
+		sizeof(lane_count_set));
+
+	return status;
+}
+
+enum link_training_result dp_perform_link_training(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	const struct dc_link_settings *link_settings,
+	bool skip_video_pattern)
+{
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+	struct link_training_settings lt_settings = {0};
+	enum dp_link_encoding encoding =
+			dp_get_link_encoding_format(link_settings);
+
+	/* decide training settings */
+	dp_decide_training_settings(
+			link,
+			link_settings,
+			&lt_settings);
+
+	override_training_settings(
+			link,
+			&link->preferred_training_settings,
+			&lt_settings);
+
+	/* reset previous training states */
+	dpcd_exit_training_mode(link, encoding);
+
+	/* configure link prior to entering training mode */
+	dpcd_configure_lttpr_mode(link, &lt_settings);
+	dp_set_fec_ready(link, link_res, lt_settings.should_set_fec_ready);
+	dpcd_configure_channel_coding(link, &lt_settings);
+
+	/* enter training mode:
+	 * Per DP specs starting from here, DPTX device shall not issue
+	 * Non-LT AUX transactions inside training mode.
+	 */
+	if ((link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) && encoding == DP_8b_10b_ENCODING)
+		status = dp_perform_fixed_vs_pe_training_sequence(link, link_res, &lt_settings);
+	else if (encoding == DP_8b_10b_ENCODING)
+		status = dp_perform_8b_10b_link_training(link, link_res, &lt_settings);
+	else if (encoding == DP_128b_132b_ENCODING)
+		status = dp_perform_128b_132b_link_training(link, link_res, &lt_settings);
+	else
+		ASSERT(0);
+
+	/* exit training mode */
+	dpcd_exit_training_mode(link, encoding);
+
+	/* switch to video idle */
+	if ((status == LINK_TRAINING_SUCCESS) || !skip_video_pattern)
+		status = dp_transition_to_video_idle(link,
+				link_res,
+				&lt_settings,
+				status);
+
+	/* dump debug data */
+	dp_log_training_result(link, &lt_settings, status);
+	if (status != LINK_TRAINING_SUCCESS)
+		link->ctx->dc->debug_data.ltFailCount++;
+	return status;
+}
+
+bool perform_link_training_with_retries(
+	const struct dc_link_settings *link_setting,
+	bool skip_video_pattern,
+	int attempts,
+	struct pipe_ctx *pipe_ctx,
+	enum signal_type signal,
+	bool do_fallback)
+{
+	int j;
+	uint8_t delay_between_attempts = LINK_TRAINING_RETRY_DELAY;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	enum dp_panel_mode panel_mode = dp_get_panel_mode(link);
+	enum link_training_result status = LINK_TRAINING_CR_FAIL_LANE0;
+	struct dc_link_settings cur_link_settings = *link_setting;
+	struct dc_link_settings max_link_settings = *link_setting;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	int fail_count = 0;
+	bool is_link_bw_low = false; /* link bandwidth < stream bandwidth */
+	bool is_link_bw_min = /* RBR x 1 */
+		(cur_link_settings.link_rate <= LINK_RATE_LOW) &&
+		(cur_link_settings.lane_count <= LANE_COUNT_ONE);
+
+	dp_trace_commit_lt_init(link);
+
+
+	if (dp_get_link_encoding_format(&cur_link_settings) == DP_8b_10b_ENCODING)
+		/* We need to do this before the link training to ensure the idle
+		 * pattern in SST mode will be sent right after the link training
+		 */
+		link_hwss->setup_stream_encoder(pipe_ctx);
+
+	dp_trace_set_lt_start_timestamp(link, false);
+	j = 0;
+	while (j < attempts && fail_count < (attempts * 10)) {
+
+		DC_LOG_HW_LINK_TRAINING("%s: Beginning link(%d) training attempt %u of %d @ rate(%d) x lane(%d)\n",
+			__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
+			cur_link_settings.lane_count);
+
+		dp_enable_link_phy(
+			link,
+			&pipe_ctx->link_res,
+			signal,
+			pipe_ctx->clock_source->id,
+			&cur_link_settings);
+
+		if (stream->sink_patches.dppowerup_delay > 0) {
+			int delay_dp_power_up_in_ms = stream->sink_patches.dppowerup_delay;
+
+			msleep(delay_dp_power_up_in_ms);
+		}
+
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+		if (panel_mode == DP_PANEL_MODE_EDP) {
+			struct cp_psp *cp_psp = &stream->ctx->cp_psp;
+
+			if (cp_psp && cp_psp->funcs.enable_assr) {
+				/* ASSR is bound to fail with unsigned PSP
+				 * verstage used during devlopment phase.
+				 * Report and continue with eDP panel mode to
+				 * perform eDP link training with right settings
+				 */
+				bool result;
+				result = cp_psp->funcs.enable_assr(cp_psp->handle, link);
+			}
+		}
+#endif
+
+		dp_set_panel_mode(link, panel_mode);
+
+		if (link->aux_access_disabled) {
+			dc_link_dp_perform_link_training_skip_aux(link, &pipe_ctx->link_res, &cur_link_settings);
+			return true;
+		} else {
+			/** @todo Consolidate USB4 DP and DPx.x training. */
+			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
+				status = dc_link_dpia_perform_link_training(
+						link,
+						&pipe_ctx->link_res,
+						&cur_link_settings,
+						skip_video_pattern);
+
+				/* Transmit idle pattern once training successful. */
+				if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low) {
+					dp_set_hw_test_pattern(link, &pipe_ctx->link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+					// Update verified link settings to current one
+					// Because DPIA LT might fallback to lower link setting.
+					if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+						link->verified_link_cap.link_rate = link->cur_link_settings.link_rate;
+						link->verified_link_cap.lane_count = link->cur_link_settings.lane_count;
+						dm_helpers_dp_mst_update_branch_bandwidth(link->ctx, link);
+					}
+				}
+			} else {
+				status = dp_perform_link_training(
+						link,
+						&pipe_ctx->link_res,
+						&cur_link_settings,
+						skip_video_pattern);
+			}
+
+			dp_trace_lt_total_count_increment(link, false);
+			dp_trace_lt_result_update(link, status, false);
+			dp_trace_set_lt_end_timestamp(link, false);
+			if (status == LINK_TRAINING_SUCCESS && !is_link_bw_low)
+				return true;
+		}
+
+		fail_count++;
+		dp_trace_lt_fail_count_update(link, fail_count, false);
+		if (link->ep_type == DISPLAY_ENDPOINT_PHY) {
+			/* latest link training still fail or link training is aborted
+			 * skip delay and keep PHY on
+			 */
+			if (j == (attempts - 1) || (status == LINK_TRAINING_ABORT))
+				break;
+		}
+
+		DC_LOG_WARNING("%s: Link(%d) training attempt %u of %d failed @ rate(%d) x lane(%d) : fail reason:(%d)\n",
+			__func__, link->link_index, (unsigned int)j + 1, attempts, cur_link_settings.link_rate,
+			cur_link_settings.lane_count, status);
+
+		dp_disable_link_phy(link, &pipe_ctx->link_res, signal);
+
+		/* Abort link training if failure due to sink being unplugged. */
+		if (status == LINK_TRAINING_ABORT) {
+			enum dc_connection_type type = dc_connection_none;
+
+			dc_link_detect_sink(link, &type);
+			if (type == dc_connection_none) {
+				DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
+				break;
+			}
+		}
+
+		/* Try to train again at original settings if:
+		 * - not falling back between training attempts;
+		 * - aborted previous attempt due to reasons other than sink unplug;
+		 * - successfully trained but at a link rate lower than that required by stream;
+		 * - reached minimum link bandwidth.
+		 */
+		if (!do_fallback || (status == LINK_TRAINING_ABORT) ||
+				(status == LINK_TRAINING_SUCCESS && is_link_bw_low) ||
+				is_link_bw_min) {
+			j++;
+			cur_link_settings = *link_setting;
+			delay_between_attempts += LINK_TRAINING_RETRY_DELAY;
+			is_link_bw_low = false;
+			is_link_bw_min = (cur_link_settings.link_rate <= LINK_RATE_LOW) &&
+				(cur_link_settings.lane_count <= LANE_COUNT_ONE);
+
+		} else if (do_fallback) { /* Try training at lower link bandwidth if doing fallback. */
+			uint32_t req_bw;
+			uint32_t link_bw;
+
+			decide_fallback_link_setting(link, &max_link_settings,
+					&cur_link_settings, status);
+			/* Flag if reduced link bandwidth no longer meets stream requirements or fallen back to
+			 * minimum link bandwidth.
+			 */
+			req_bw = dc_bandwidth_in_kbps_from_timing(&stream->timing);
+			link_bw = dc_link_bandwidth_kbps(link, &cur_link_settings);
+			is_link_bw_low = (req_bw > link_bw);
+			is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
+				(cur_link_settings.lane_count <= LANE_COUNT_ONE));
+
+			if (is_link_bw_low)
+				DC_LOG_WARNING(
+					"%s: Link(%d) bandwidth too low after fallback req_bw(%d) > link_bw(%d)\n",
+					__func__, link->link_index, req_bw, link_bw);
+		}
+
+		msleep(delay_between_attempts);
+	}
+
+	return false;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.h
new file mode 100644
index 000000000000..376d370e3bbb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training.h
@@ -0,0 +1,179 @@
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
+
+#ifndef __DC_LINK_DP_TRAINING_H__
+#define __DC_LINK_DP_TRAINING_H__
+#include "link.h"
+
+bool perform_link_training_with_retries(
+	const struct dc_link_settings *link_setting,
+	bool skip_video_pattern,
+	int attempts,
+	struct pipe_ctx *pipe_ctx,
+	enum signal_type signal,
+	bool do_fallback);
+
+enum link_training_result dp_perform_link_training(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct dc_link_settings *link_settings,
+		bool skip_video_pattern);
+
+bool dp_set_hw_training_pattern(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		enum dc_dp_training_pattern pattern,
+		uint32_t offset);
+
+void dp_set_hw_test_pattern(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		enum dp_test_pattern test_pattern,
+		uint8_t *custom_pattern,
+		uint32_t custom_pattern_size);
+
+void dpcd_set_training_pattern(
+	struct dc_link *link,
+	enum dc_dp_training_pattern training_pattern);
+
+/* Write DPCD drive settings. */
+enum dc_status dpcd_set_lane_settings(
+	struct dc_link *link,
+	const struct link_training_settings *link_training_setting,
+	uint32_t offset);
+
+/* Write DPCD link configuration data. */
+enum dc_status dpcd_set_link_settings(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings);
+
+void dpcd_set_lt_pattern_and_lane_settings(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings,
+	enum dc_dp_training_pattern pattern,
+	uint32_t offset);
+
+/* Read training status and adjustment requests from DPCD. */
+enum dc_status dp_get_lane_status_and_lane_adjust(
+	struct dc_link *link,
+	const struct link_training_settings *link_training_setting,
+	union lane_status ln_status[LANE_COUNT_DP_MAX],
+	union lane_align_status_updated *ln_align,
+	union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
+	uint32_t offset);
+
+enum dc_status dpcd_configure_lttpr_mode(
+		struct dc_link *link,
+		struct link_training_settings *lt_settings);
+
+enum dc_status configure_lttpr_mode_transparent(struct dc_link *link);
+
+enum dc_status dpcd_configure_channel_coding(
+		struct dc_link *link,
+		struct link_training_settings *lt_settings);
+
+void repeater_training_done(struct dc_link *link, uint32_t offset);
+
+void start_clock_recovery_pattern_early(struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t offset);
+
+void dp_decide_training_settings(
+		struct dc_link *link,
+		const struct dc_link_settings *link_settings,
+		struct link_training_settings *lt_settings);
+
+void dp_decide_lane_settings(
+	const struct link_training_settings *lt_settings,
+	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
+	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
+	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
+
+enum dc_dp_training_pattern decide_cr_training_pattern(
+		const struct dc_link_settings *link_settings);
+
+enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
+		const struct dc_link_settings *link_settings);
+
+void dp_get_lttpr_mode_override(struct dc_link *link,
+		enum lttpr_mode *override);
+
+void override_training_settings(
+		struct dc_link *link,
+		const struct dc_link_training_overrides *overrides,
+		struct link_training_settings *lt_settings);
+
+/* Check DPCD training status registers to detect link loss. */
+enum link_training_result dp_check_link_loss_status(
+		struct dc_link *link,
+		const struct link_training_settings *link_training_setting);
+
+bool dp_is_cr_done(enum dc_lane_count ln_count,
+	union lane_status *dpcd_lane_status);
+
+bool dp_is_ch_eq_done(enum dc_lane_count ln_count,
+	union lane_status *dpcd_lane_status);
+bool dp_is_symbol_locked(enum dc_lane_count ln_count,
+	union lane_status *dpcd_lane_status);
+bool dp_is_interlane_aligned(union lane_align_status_updated align_status);
+
+bool is_repeater(const struct link_training_settings *lt_settings, uint32_t offset);
+
+bool dp_is_max_vs_reached(
+	const struct link_training_settings *lt_settings);
+
+uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings);
+
+enum link_training_result dp_get_cr_failure(enum dc_lane_count ln_count,
+	union lane_status *dpcd_lane_status);
+
+void dp_hw_to_dpcd_lane_settings(
+	const struct link_training_settings *lt_settings,
+	const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
+	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
+
+void dp_wait_for_training_aux_rd_interval(
+	struct dc_link *link,
+	uint32_t wait_in_micro_secs);
+
+enum dpcd_training_patterns
+	dp_training_pattern_to_dpcd_training_pattern(
+	struct dc_link *link,
+	enum dc_dp_training_pattern pattern);
+
+uint8_t dp_initialize_scrambling_data_symbols(
+	struct dc_link *link,
+	enum dc_dp_training_pattern pattern);
+
+void dp_log_training_result(
+	struct dc_link *link,
+	const struct link_training_settings *lt_settings,
+	enum link_training_result status);
+
+uint32_t dp_translate_training_aux_read_interval(
+		uint32_t dpcd_aux_read_interval);
+#endif /* __DC_LINK_DP_TRAINING_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
new file mode 100644
index 000000000000..3a02ba0724c1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.c
@@ -0,0 +1,258 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements dp 128b/132b link training software policies and
+ * sequences.
+ */
+#include "link_dp_training_128b_132b.h"
+#include "link_dp_training_8b_10b.h"
+#include "link_dpcd.h"
+#include "dc_link_dp.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+
+static enum dc_status dpcd_128b_132b_set_lane_settings(
+		struct dc_link *link,
+		const struct link_training_settings *link_training_setting)
+{
+	enum dc_status status = core_link_write_dpcd(link,
+			DP_TRAINING_LANE0_SET,
+			(uint8_t *)(link_training_setting->dpcd_lane_settings),
+			sizeof(link_training_setting->dpcd_lane_settings));
+
+	DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
+			__func__,
+			DP_TRAINING_LANE0_SET,
+			link_training_setting->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE);
+	return status;
+}
+
+static void dpcd_128b_132b_get_aux_rd_interval(struct dc_link *link,
+		uint32_t *interval_in_us)
+{
+	union dp_128b_132b_training_aux_rd_interval dpcd_interval;
+	uint32_t interval_unit = 0;
+
+	dpcd_interval.raw = 0;
+	core_link_read_dpcd(link, DP_128B132B_TRAINING_AUX_RD_INTERVAL,
+			&dpcd_interval.raw, sizeof(dpcd_interval.raw));
+	interval_unit = dpcd_interval.bits.UNIT ? 1 : 2; /* 0b = 2 ms, 1b = 1 ms */
+	/* (128b/132b_TRAINING_AUX_RD_INTERVAL value + 1) *
+	 * INTERVAL_UNIT. The maximum is 256 ms
+	 */
+	*interval_in_us = (dpcd_interval.bits.VALUE + 1) * interval_unit * 1000;
+}
+
+static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	uint8_t loop_count;
+	uint32_t aux_rd_interval = 0;
+	uint32_t wait_time = 0;
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+	enum dc_status status = DC_OK;
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+
+	/* Transmit 128b/132b_TPS1 over Main-Link */
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, DPRX);
+
+	/* Set TRAINING_PATTERN_SET to 01h */
+	dpcd_set_training_pattern(link, lt_settings->pattern_for_cr);
+
+	/* Adjust TX_FFE_PRESET_VALUE and Transmit 128b/132b_TPS2 over Main-Link */
+	dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
+	dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
+			&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
+	dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+	dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
+	dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_eq, DPRX);
+
+	/* Set loop counter to start from 1 */
+	loop_count = 1;
+
+	/* Set TRAINING_PATTERN_SET to 02h and TX_FFE_PRESET_VALUE in one AUX transaction */
+	dpcd_set_lt_pattern_and_lane_settings(link, lt_settings,
+			lt_settings->pattern_for_eq, DPRX);
+
+	/* poll for channel EQ done */
+	while (result == LINK_TRAINING_SUCCESS) {
+		dp_wait_for_training_aux_rd_interval(link, aux_rd_interval);
+		wait_time += aux_rd_interval;
+		status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
+				&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+		dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+		} else if (dp_is_ch_eq_done(lt_settings->link_settings.lane_count,
+				dpcd_lane_status)) {
+			/* pass */
+			break;
+		} else if (loop_count >= lt_settings->eq_loop_count_limit) {
+			result = DP_128b_132b_MAX_LOOP_COUNT_REACHED;
+		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
+			result = DP_128b_132b_LT_FAILED;
+		} else {
+			dp_set_hw_lane_settings(link, link_res, lt_settings, DPRX);
+			dpcd_128b_132b_set_lane_settings(link, lt_settings);
+		}
+		loop_count++;
+	}
+
+	/* poll for EQ interlane align done */
+	while (result == LINK_TRAINING_SUCCESS) {
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+		} else if (dpcd_lane_status_updated.bits.EQ_INTERLANE_ALIGN_DONE_128b_132b) {
+			/* pass */
+			break;
+		} else if (wait_time >= lt_settings->eq_wait_time_limit) {
+			result = DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT;
+		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
+			result = DP_128b_132b_LT_FAILED;
+		} else {
+			dp_wait_for_training_aux_rd_interval(link,
+					lt_settings->eq_pattern_time);
+			wait_time += lt_settings->eq_pattern_time;
+			status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
+					&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
+		}
+	}
+
+	return result;
+}
+
+static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	/* Assumption: assume hardware has transmitted eq pattern */
+	enum dc_status status = DC_OK;
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+	uint32_t wait_time = 0;
+
+	/* initiate CDS done sequence */
+	dpcd_set_training_pattern(link, lt_settings->pattern_for_cds);
+
+	/* poll for CDS interlane align done and symbol lock */
+	while (result == LINK_TRAINING_SUCCESS) {
+		dp_wait_for_training_aux_rd_interval(link,
+				lt_settings->cds_pattern_time);
+		wait_time += lt_settings->cds_pattern_time;
+		status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
+						&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+		} else if (dp_is_symbol_locked(lt_settings->link_settings.lane_count, dpcd_lane_status) &&
+				dpcd_lane_status_updated.bits.CDS_INTERLANE_ALIGN_DONE_128b_132b) {
+			/* pass */
+			break;
+		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
+			result = DP_128b_132b_LT_FAILED;
+		} else if (wait_time >= lt_settings->cds_wait_time_limit) {
+			result = DP_128b_132b_CDS_DONE_TIMEOUT;
+		}
+	}
+
+	return result;
+}
+
+enum link_training_result dp_perform_128b_132b_link_training(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+
+	/* TODO - DP2.0 Link: remove legacy_dp2_lt logic */
+	if (link->dc->debug.legacy_dp2_lt) {
+		struct link_training_settings legacy_settings;
+
+		decide_8b_10b_training_settings(link,
+				&lt_settings->link_settings,
+				&legacy_settings);
+		return dp_perform_8b_10b_link_training(link, link_res, &legacy_settings);
+	}
+
+	dpcd_set_link_settings(link, lt_settings);
+
+	if (result == LINK_TRAINING_SUCCESS)
+		result = dp_perform_128b_132b_channel_eq_done_sequence(link, link_res, lt_settings);
+
+	if (result == LINK_TRAINING_SUCCESS)
+		result = dp_perform_128b_132b_cds_done_sequence(link, link_res, lt_settings);
+
+	return result;
+}
+
+void decide_128b_132b_training_settings(struct dc_link *link,
+		const struct dc_link_settings *link_settings,
+		struct link_training_settings *lt_settings)
+{
+	memset(lt_settings, 0, sizeof(*lt_settings));
+
+	lt_settings->link_settings = *link_settings;
+	/* TODO: should decide link spread when populating link_settings */
+	lt_settings->link_settings.link_spread = link->dp_ss_off ? LINK_SPREAD_DISABLED :
+			LINK_SPREAD_05_DOWNSPREAD_30KHZ;
+
+	lt_settings->pattern_for_cr = decide_cr_training_pattern(link_settings);
+	lt_settings->pattern_for_eq = decide_eq_training_pattern(link, link_settings);
+	lt_settings->eq_pattern_time = 2500;
+	lt_settings->eq_wait_time_limit = 400000;
+	lt_settings->eq_loop_count_limit = 20;
+	lt_settings->pattern_for_cds = DP_128b_132b_TPS2_CDS;
+	lt_settings->cds_pattern_time = 2500;
+	lt_settings->cds_wait_time_limit = (dp_convert_to_count(
+			link->dpcd_caps.lttpr_caps.phy_repeater_cnt) + 1) * 20000;
+	lt_settings->disallow_per_lane_settings = true;
+	lt_settings->lttpr_mode = dp_decide_128b_132b_lttpr_mode(link);
+	dp_hw_to_dpcd_lane_settings(lt_settings,
+			lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+}
+
+enum lttpr_mode dp_decide_128b_132b_lttpr_mode(struct dc_link *link)
+{
+	enum lttpr_mode mode = LTTPR_MODE_NON_LTTPR;
+
+	if (dp_is_lttpr_present(link))
+		mode = LTTPR_MODE_NON_TRANSPARENT;
+
+	DC_LOG_DC("128b_132b chose LTTPR_MODE %d.\n", mode);
+	return mode;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.h
new file mode 100644
index 000000000000..2147f24efc8b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_128b_132b.h
@@ -0,0 +1,42 @@
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
+
+#ifndef __DC_LINK_DP_TRAINING_128B_132B_H__
+#define __DC_LINK_DP_TRAINING_128B_132B_H__
+#include "link_dp_training.h"
+
+enum link_training_result dp_perform_128b_132b_link_training(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings);
+
+void decide_128b_132b_training_settings(struct dc_link *link,
+		const struct dc_link_settings *link_settings,
+		struct link_training_settings *lt_settings);
+
+enum lttpr_mode dp_decide_128b_132b_lttpr_mode(struct dc_link *link);
+
+#endif /* __DC_LINK_DP_TRAINING_128B_132B_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
new file mode 100644
index 000000000000..9021f7bca166
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.c
@@ -0,0 +1,413 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements dp 8b/10b link training software policies and
+ * sequences.
+ */
+#include "link_dp_training_8b_10b.h"
+#include "link_dpcd.h"
+#include "dc_link_dp.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+
+static int32_t get_cr_training_aux_rd_interval(struct dc_link *link,
+		const struct dc_link_settings *link_settings)
+{
+	union training_aux_rd_interval training_rd_interval;
+	uint32_t wait_in_micro_secs = 100;
+
+	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
+	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
+			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
+		core_link_read_dpcd(
+				link,
+				DP_TRAINING_AUX_RD_INTERVAL,
+				(uint8_t *)&training_rd_interval,
+				sizeof(training_rd_interval));
+		if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
+			wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
+	}
+	return wait_in_micro_secs;
+}
+
+static uint32_t get_eq_training_aux_rd_interval(
+	struct dc_link *link,
+	const struct dc_link_settings *link_settings)
+{
+	union training_aux_rd_interval training_rd_interval;
+
+	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
+	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+		core_link_read_dpcd(
+				link,
+				DP_128B132B_TRAINING_AUX_RD_INTERVAL,
+				(uint8_t *)&training_rd_interval,
+				sizeof(training_rd_interval));
+	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
+			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
+		core_link_read_dpcd(
+				link,
+				DP_TRAINING_AUX_RD_INTERVAL,
+				(uint8_t *)&training_rd_interval,
+				sizeof(training_rd_interval));
+	}
+
+	switch (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL) {
+	case 0: return 400;
+	case 1: return 4000;
+	case 2: return 8000;
+	case 3: return 12000;
+	case 4: return 16000;
+	case 5: return 32000;
+	case 6: return 64000;
+	default: return 400;
+	}
+}
+
+void decide_8b_10b_training_settings(
+	 struct dc_link *link,
+	const struct dc_link_settings *link_setting,
+	struct link_training_settings *lt_settings)
+{
+	memset(lt_settings, '\0', sizeof(struct link_training_settings));
+
+	/* Initialize link settings */
+	lt_settings->link_settings.use_link_rate_set = link_setting->use_link_rate_set;
+	lt_settings->link_settings.link_rate_set = link_setting->link_rate_set;
+	lt_settings->link_settings.link_rate = link_setting->link_rate;
+	lt_settings->link_settings.lane_count = link_setting->lane_count;
+	/* TODO hard coded to SS for now
+	 * lt_settings.link_settings.link_spread =
+	 * dal_display_path_is_ss_supported(
+	 * path_mode->display_path) ?
+	 * LINK_SPREAD_05_DOWNSPREAD_30KHZ :
+	 * LINK_SPREAD_DISABLED;
+	 */
+	lt_settings->link_settings.link_spread = link->dp_ss_off ?
+			LINK_SPREAD_DISABLED : LINK_SPREAD_05_DOWNSPREAD_30KHZ;
+	lt_settings->cr_pattern_time = get_cr_training_aux_rd_interval(link, link_setting);
+	lt_settings->eq_pattern_time = get_eq_training_aux_rd_interval(link, link_setting);
+	lt_settings->pattern_for_cr = decide_cr_training_pattern(link_setting);
+	lt_settings->pattern_for_eq = decide_eq_training_pattern(link, link_setting);
+	lt_settings->enhanced_framing = 1;
+	lt_settings->should_set_fec_ready = true;
+	lt_settings->disallow_per_lane_settings = true;
+	lt_settings->always_match_dpcd_with_hw_lane_settings = true;
+	lt_settings->lttpr_mode = dp_decide_8b_10b_lttpr_mode(link);
+	dp_hw_to_dpcd_lane_settings(lt_settings, lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+}
+
+enum lttpr_mode dp_decide_8b_10b_lttpr_mode(struct dc_link *link)
+{
+	bool is_lttpr_present = dp_is_lttpr_present(link);
+	bool vbios_lttpr_force_non_transparent = link->dc->caps.vbios_lttpr_enable;
+	bool vbios_lttpr_aware = link->dc->caps.vbios_lttpr_aware;
+
+	if (!is_lttpr_present)
+		return LTTPR_MODE_NON_LTTPR;
+
+	if (vbios_lttpr_aware) {
+		if (vbios_lttpr_force_non_transparent) {
+			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT due to VBIOS DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
+			return LTTPR_MODE_NON_TRANSPARENT;
+		} else {
+			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT by default due to VBIOS not set DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
+			return LTTPR_MODE_TRANSPARENT;
+		}
+	}
+
+	if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
+			link->dc->caps.extended_aux_timeout_support) {
+		DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT by default and dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A set to 1.\n");
+		return LTTPR_MODE_NON_TRANSPARENT;
+	}
+
+	DC_LOG_DC("chose LTTPR_MODE_NON_LTTPR.\n");
+	return LTTPR_MODE_NON_LTTPR;
+}
+
+enum link_training_result perform_8b_10b_clock_recovery_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings,
+	uint32_t offset)
+{
+	uint32_t retries_cr;
+	uint32_t retry_count;
+	uint32_t wait_time_microsec;
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
+	union lane_align_status_updated dpcd_lane_status_updated;
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+	retries_cr = 0;
+	retry_count = 0;
+
+	memset(&dpcd_lane_status, '\0', sizeof(dpcd_lane_status));
+	memset(&dpcd_lane_status_updated, '\0',
+	sizeof(dpcd_lane_status_updated));
+
+	if (!link->ctx->dc->work_arounds.lt_early_cr_pattern)
+		dp_set_hw_training_pattern(link, link_res, lt_settings->pattern_for_cr, offset);
+
+	/* najeeb - The synaptics MST hub can put the LT in
+	* infinite loop by switching the VS
+	*/
+	/* between level 0 and level 1 continuously, here
+	* we try for CR lock for LinkTrainingMaxCRRetry count*/
+	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
+		(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
+
+
+		/* 1. call HWSS to set lane settings*/
+		dp_set_hw_lane_settings(
+				link,
+				link_res,
+				lt_settings,
+				offset);
+
+		/* 2. update DPCD of the receiver*/
+		if (!retry_count)
+			/* EPR #361076 - write as a 5-byte burst,
+			 * but only for the 1-st iteration.*/
+			dpcd_set_lt_pattern_and_lane_settings(
+					link,
+					lt_settings,
+					lt_settings->pattern_for_cr,
+					offset);
+		else
+			dpcd_set_lane_settings(
+					link,
+					lt_settings,
+					offset);
+
+		/* 3. wait receiver to lock-on*/
+		wait_time_microsec = lt_settings->cr_pattern_time;
+
+		dp_wait_for_training_aux_rd_interval(
+				link,
+				wait_time_microsec);
+
+		/* 4. Read lane status and requested drive
+		* settings as set by the sink
+		*/
+		dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				offset);
+
+		/* 5. check CR done*/
+		if (dp_is_cr_done(lane_count, dpcd_lane_status))
+			return LINK_TRAINING_SUCCESS;
+
+		/* 6. max VS reached*/
+		if ((dp_get_link_encoding_format(&lt_settings->link_settings) ==
+				DP_8b_10b_ENCODING) &&
+				dp_is_max_vs_reached(lt_settings))
+			break;
+
+		/* 7. same lane settings*/
+		/* Note: settings are the same for all lanes,
+		 * so comparing first lane is sufficient*/
+		if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING) &&
+				lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
+						dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
+			retries_cr++;
+		else if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
+				lt_settings->dpcd_lane_settings[0].tx_ffe.PRESET_VALUE ==
+						dpcd_lane_adjust[0].tx_ffe.PRESET_VALUE)
+			retries_cr++;
+		else
+			retries_cr = 0;
+
+		/* 8. update VS/PE/PC2 in lt_settings*/
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+		retry_count++;
+	}
+
+	if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
+		ASSERT(0);
+		DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
+			__func__,
+			LINK_TRAINING_MAX_CR_RETRY);
+
+	}
+
+	return dp_get_cr_failure(lane_count, dpcd_lane_status);
+}
+
+enum link_training_result perform_8b_10b_channel_equalization_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings,
+	uint32_t offset)
+{
+	enum dc_dp_training_pattern tr_pattern;
+	uint32_t retries_ch_eq;
+	uint32_t wait_time_microsec;
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+	/* Note: also check that TPS4 is a supported feature*/
+	tr_pattern = lt_settings->pattern_for_eq;
+
+	if (is_repeater(lt_settings, offset) && dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
+		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
+
+	dp_set_hw_training_pattern(link, link_res, tr_pattern, offset);
+
+	for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
+		retries_ch_eq++) {
+
+		dp_set_hw_lane_settings(link, link_res, lt_settings, offset);
+
+		/* 2. update DPCD*/
+		if (!retries_ch_eq)
+			/* EPR #361076 - write as a 5-byte burst,
+			 * but only for the 1-st iteration
+			 */
+
+			dpcd_set_lt_pattern_and_lane_settings(
+				link,
+				lt_settings,
+				tr_pattern, offset);
+		else
+			dpcd_set_lane_settings(link, lt_settings, offset);
+
+		/* 3. wait for receiver to lock-on*/
+		wait_time_microsec = lt_settings->eq_pattern_time;
+
+		if (is_repeater(lt_settings, offset))
+			wait_time_microsec =
+					dp_translate_training_aux_read_interval(
+						link->dpcd_caps.lttpr_caps.aux_rd_interval[offset - 1]);
+
+		dp_wait_for_training_aux_rd_interval(
+				link,
+				wait_time_microsec);
+
+		/* 4. Read lane status and requested
+		 * drive settings as set by the sink*/
+
+		dp_get_lane_status_and_lane_adjust(
+			link,
+			lt_settings,
+			dpcd_lane_status,
+			&dpcd_lane_status_updated,
+			dpcd_lane_adjust,
+			offset);
+
+		/* 5. check CR done*/
+		if (!dp_is_cr_done(lane_count, dpcd_lane_status))
+			return dpcd_lane_status[0].bits.CR_DONE_0 ?
+					LINK_TRAINING_EQ_FAIL_CR_PARTIAL :
+					LINK_TRAINING_EQ_FAIL_CR;
+
+		/* 6. check CHEQ done*/
+		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
+				dp_is_symbol_locked(lane_count, dpcd_lane_status) &&
+				dp_is_interlane_aligned(dpcd_lane_status_updated))
+			return LINK_TRAINING_SUCCESS;
+
+		/* 7. update VS/PE/PC2 in lt_settings*/
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+	}
+
+	return LINK_TRAINING_EQ_FAIL_EQ;
+
+}
+
+enum link_training_result dp_perform_8b_10b_link_training(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+
+	uint8_t repeater_cnt;
+	uint8_t repeater_id;
+	uint8_t lane = 0;
+
+	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
+		start_clock_recovery_pattern_early(link, link_res, lt_settings, DPRX);
+
+	/* 1. set link rate, lane count and spread. */
+	dpcd_set_link_settings(link, lt_settings);
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+
+		/* 2. perform link training (set link training done
+		 *  to false is done as well)
+		 */
+		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
+				repeater_id--) {
+			status = perform_8b_10b_clock_recovery_sequence(link, link_res, lt_settings, repeater_id);
+
+			if (status != LINK_TRAINING_SUCCESS) {
+				repeater_training_done(link, repeater_id);
+				break;
+			}
+
+			status = perform_8b_10b_channel_equalization_sequence(link,
+					link_res,
+					lt_settings,
+					repeater_id);
+
+			repeater_training_done(link, repeater_id);
+
+			if (status != LINK_TRAINING_SUCCESS)
+				break;
+
+			for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+				lt_settings->dpcd_lane_settings[lane].raw = 0;
+				lt_settings->hw_lane_settings[lane].VOLTAGE_SWING = 0;
+				lt_settings->hw_lane_settings[lane].PRE_EMPHASIS = 0;
+			}
+		}
+	}
+
+	if (status == LINK_TRAINING_SUCCESS) {
+		status = perform_8b_10b_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
+		if (status == LINK_TRAINING_SUCCESS) {
+			status = perform_8b_10b_channel_equalization_sequence(link,
+					link_res,
+					lt_settings,
+					DPRX);
+		}
+	}
+
+	return status;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.h
new file mode 100644
index 000000000000..d26de15ce954
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_8b_10b.h
@@ -0,0 +1,61 @@
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
+
+#ifndef __DC_LINK_DP_TRAINING_8B_10B_H__
+#define __DC_LINK_DP_TRAINING_8B_10B_H__
+#include "link_dp_training.h"
+
+/* to avoid infinite loop where-in the receiver
+ * switches between different VS
+ */
+#define LINK_TRAINING_MAX_CR_RETRY 100
+#define LINK_TRAINING_MAX_RETRY_COUNT 5
+
+enum link_training_result dp_perform_8b_10b_link_training(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings);
+
+enum link_training_result perform_8b_10b_clock_recovery_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings,
+	uint32_t offset);
+
+enum link_training_result perform_8b_10b_channel_equalization_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings,
+	uint32_t offset);
+
+enum lttpr_mode dp_decide_8b_10b_lttpr_mode(struct dc_link *link);
+
+void decide_8b_10b_training_settings(
+	 struct dc_link *link,
+	const struct dc_link_settings *link_setting,
+	struct link_training_settings *lt_settings);
+
+#endif /* __DC_LINK_DP_TRAINING_8B_10B_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.c
new file mode 100644
index 000000000000..319f0a59a3c8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.c
@@ -0,0 +1,80 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ *
+ */
+#include "link_dp_training_auxless.h"
+#include "dc_link_dp.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+bool dc_link_dp_perform_link_training_skip_aux(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	const struct dc_link_settings *link_setting)
+{
+	struct link_training_settings lt_settings = {0};
+
+	dp_decide_training_settings(
+			link,
+			link_setting,
+			&lt_settings);
+	override_training_settings(
+			link,
+			&link->preferred_training_settings,
+			&lt_settings);
+
+	/* 1. Perform_clock_recovery_sequence. */
+
+	/* transmit training pattern for clock recovery */
+	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_cr, DPRX);
+
+	/* call HWSS to set lane settings*/
+	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
+
+	/* wait receiver to lock-on*/
+	dp_wait_for_training_aux_rd_interval(link, lt_settings.cr_pattern_time);
+
+	/* 2. Perform_channel_equalization_sequence. */
+
+	/* transmit training pattern for channel equalization. */
+	dp_set_hw_training_pattern(link, link_res, lt_settings.pattern_for_eq, DPRX);
+
+	/* call HWSS to set lane settings*/
+	dp_set_hw_lane_settings(link, link_res, &lt_settings, DPRX);
+
+	/* wait receiver to lock-on. */
+	dp_wait_for_training_aux_rd_interval(link, lt_settings.eq_pattern_time);
+
+	/* 3. Perform_link_training_int. */
+
+	/* Mainlink output idle pattern. */
+	dp_set_hw_test_pattern(link, link_res, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+
+	dp_log_training_result(link, &lt_settings, LINK_TRAINING_SUCCESS);
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.h
new file mode 100644
index 000000000000..413999cd03c4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_auxless.h
@@ -0,0 +1,35 @@
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
+
+#ifndef __DC_LINK_DP_TRAINING_AUXLESS_H__
+#define __DC_LINK_DP_TRAINING_AUXLESS_H__
+#include "link_dp_training.h"
+
+bool dc_link_dp_perform_link_training_skip_aux(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	const struct dc_link_settings *link_setting);
+#endif /* __DC_LINK_DP_TRAINING_AUXLESS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
new file mode 100644
index 000000000000..7f005d053595
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.c
@@ -0,0 +1,1044 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This module implements functionality for training DPIA links.
+ */
+#include "link_dp_training_dpia.h"
+#include "dc.h"
+#include "inc/core_status.h"
+#include "dc_link.h"
+#include "dc_link_dp.h"
+#include "dpcd_defs.h"
+
+#include "link_dp_dpia.h"
+#include "link_hwss.h"
+#include "dm_helpers.h"
+#include "dmub/inc/dmub_cmd.h"
+#include "link_dpcd.h"
+#include "link_dp_training_8b_10b.h"
+#include "dc_dmub_srv.h"
+#define DC_LOGGER \
+	link->ctx->logger
+
+/* The approximate time (us) it takes to transmit 9 USB4 DP clock sync packets. */
+#define DPIA_CLK_SYNC_DELAY 16000
+
+/* Extend interval between training status checks for manual testing. */
+#define DPIA_DEBUG_EXTENDED_AUX_RD_INTERVAL_US 60000000
+
+/* SET_CONFIG message types sent by driver. */
+enum dpia_set_config_type {
+	DPIA_SET_CFG_SET_LINK = 0x01,
+	DPIA_SET_CFG_SET_PHY_TEST_MODE = 0x05,
+	DPIA_SET_CFG_SET_TRAINING = 0x18,
+	DPIA_SET_CFG_SET_VSPE = 0x19
+};
+
+/* Training stages (TS) in SET_CONFIG(SET_TRAINING) message. */
+enum dpia_set_config_ts {
+	DPIA_TS_DPRX_DONE = 0x00, /* Done training DPRX. */
+	DPIA_TS_TPS1 = 0x01,
+	DPIA_TS_TPS2 = 0x02,
+	DPIA_TS_TPS3 = 0x03,
+	DPIA_TS_TPS4 = 0x07,
+	DPIA_TS_UFP_DONE = 0xff /* Done training DPTX-to-DPIA hop. */
+};
+
+/* SET_CONFIG message data associated with messages sent by driver. */
+union dpia_set_config_data {
+	struct {
+		uint8_t mode : 1;
+		uint8_t reserved : 7;
+	} set_link;
+	struct {
+		uint8_t stage;
+	} set_training;
+	struct {
+		uint8_t swing : 2;
+		uint8_t max_swing_reached : 1;
+		uint8_t pre_emph : 2;
+		uint8_t max_pre_emph_reached : 1;
+		uint8_t reserved : 2;
+	} set_vspe;
+	uint8_t raw;
+};
+
+
+/* Configure link as prescribed in link_setting; set LTTPR mode; and
+ * Initialize link training settings.
+ * Abort link training if sink unplug detected.
+ *
+ * @param link DPIA link being trained.
+ * @param[in] link_setting Lane count, link rate and downspread control.
+ * @param[out] lt_settings Link settings and drive settings (voltage swing and pre-emphasis).
+ */
+static enum link_training_result dpia_configure_link(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		const struct dc_link_settings *link_setting,
+		struct link_training_settings *lt_settings)
+{
+	enum dc_status status;
+	bool fec_enable;
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) configuring\n - LTTPR mode(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		lt_settings->lttpr_mode);
+
+	dp_decide_training_settings(
+		link,
+		link_setting,
+		lt_settings);
+
+	dp_get_lttpr_mode_override(link, &lt_settings->lttpr_mode);
+
+	status = dpcd_configure_channel_coding(link, lt_settings);
+	if (status != DC_OK && link->is_hpd_pending)
+		return LINK_TRAINING_ABORT;
+
+	/* Configure lttpr mode */
+	status = dpcd_configure_lttpr_mode(link, lt_settings);
+	if (status != DC_OK && link->is_hpd_pending)
+		return LINK_TRAINING_ABORT;
+
+	/* Set link rate, lane count and spread. */
+	status = dpcd_set_link_settings(link, lt_settings);
+	if (status != DC_OK && link->is_hpd_pending)
+		return LINK_TRAINING_ABORT;
+
+	if (link->preferred_training_settings.fec_enable != NULL)
+		fec_enable = *link->preferred_training_settings.fec_enable;
+	else
+		fec_enable = true;
+	status = dp_set_fec_ready(link, link_res, fec_enable);
+	if (status != DC_OK && link->is_hpd_pending)
+		return LINK_TRAINING_ABORT;
+
+	return LINK_TRAINING_SUCCESS;
+}
+
+static enum dc_status core_link_send_set_config(
+	struct dc_link *link,
+	uint8_t msg_type,
+	uint8_t msg_data)
+{
+	struct set_config_cmd_payload payload;
+	enum set_config_status set_config_result = SET_CONFIG_PENDING;
+
+	/* prepare set_config payload */
+	payload.msg_type = msg_type;
+	payload.msg_data = msg_data;
+
+	if (!link->ddc->ddc_pin && !link->aux_access_disabled &&
+			(dm_helpers_dmub_set_config_sync(link->ctx,
+			link, &payload, &set_config_result) == -1)) {
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	/* set_config should return ACK if successful */
+	return (set_config_result == SET_CONFIG_ACK_RECEIVED) ? DC_OK : DC_ERROR_UNEXPECTED;
+}
+
+/* Build SET_CONFIG message data payload for specified message type. */
+static uint8_t dpia_build_set_config_data(
+		enum dpia_set_config_type type,
+		struct dc_link *link,
+		struct link_training_settings *lt_settings)
+{
+	union dpia_set_config_data data;
+
+	data.raw = 0;
+
+	switch (type) {
+	case DPIA_SET_CFG_SET_LINK:
+		data.set_link.mode = lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT ? 1 : 0;
+		break;
+	case DPIA_SET_CFG_SET_PHY_TEST_MODE:
+		break;
+	case DPIA_SET_CFG_SET_VSPE:
+		/* Assume all lanes have same drive settings. */
+		data.set_vspe.swing = lt_settings->hw_lane_settings[0].VOLTAGE_SWING;
+		data.set_vspe.pre_emph = lt_settings->hw_lane_settings[0].PRE_EMPHASIS;
+		data.set_vspe.max_swing_reached =
+				lt_settings->hw_lane_settings[0].VOLTAGE_SWING == VOLTAGE_SWING_MAX_LEVEL ? 1 : 0;
+		data.set_vspe.max_pre_emph_reached =
+				lt_settings->hw_lane_settings[0].PRE_EMPHASIS == PRE_EMPHASIS_MAX_LEVEL ? 1 : 0;
+		break;
+	default:
+		ASSERT(false); /* Message type not supported by helper function. */
+		break;
+	}
+
+	return data.raw;
+}
+
+/* Convert DC training pattern to DPIA training stage. */
+static enum dc_status convert_trng_ptn_to_trng_stg(enum dc_dp_training_pattern tps, enum dpia_set_config_ts *ts)
+{
+	enum dc_status status = DC_OK;
+
+	switch (tps) {
+	case DP_TRAINING_PATTERN_SEQUENCE_1:
+		*ts = DPIA_TS_TPS1;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_2:
+		*ts = DPIA_TS_TPS2;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_3:
+		*ts = DPIA_TS_TPS3;
+		break;
+	case DP_TRAINING_PATTERN_SEQUENCE_4:
+		*ts = DPIA_TS_TPS4;
+		break;
+	case DP_TRAINING_PATTERN_VIDEOIDLE:
+		*ts = DPIA_TS_DPRX_DONE;
+		break;
+	default: /* TPS not supported by helper function. */
+		ASSERT(false);
+		*ts = DPIA_TS_DPRX_DONE;
+		status = DC_UNSUPPORTED_VALUE;
+		break;
+	}
+
+	return status;
+}
+
+/* Write training pattern to DPCD. */
+static enum dc_status dpcd_set_lt_pattern(
+	struct dc_link *link,
+	enum dc_dp_training_pattern pattern,
+	uint32_t hop)
+{
+	union dpcd_training_pattern dpcd_pattern = {0};
+	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
+	enum dc_status status;
+
+	if (hop != DPRX)
+		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
+
+	/* DpcdAddress_TrainingPatternSet */
+	dpcd_pattern.v1_4.TRAINING_PATTERN_SET =
+		dp_training_pattern_to_dpcd_training_pattern(link, pattern);
+
+	dpcd_pattern.v1_4.SCRAMBLING_DISABLE =
+		dp_initialize_scrambling_data_symbols(link, pattern);
+
+	if (hop != DPRX) {
+		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n 0x%X pattern = %x\n",
+			__func__,
+			hop,
+			dpcd_tps_offset,
+			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+	} else {
+		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X pattern = %x\n",
+			__func__,
+			dpcd_tps_offset,
+			dpcd_pattern.v1_4.TRAINING_PATTERN_SET);
+	}
+
+	status = core_link_write_dpcd(
+			link,
+			dpcd_tps_offset,
+			&dpcd_pattern.raw,
+			sizeof(dpcd_pattern.raw));
+
+	return status;
+}
+
+/* Execute clock recovery phase of link training for specified hop in display
+ * path.in non-transparent mode:
+ * - Driver issues both DPCD and SET_CONFIG transactions.
+ * - TPS1 is transmitted for any hops downstream of DPOA.
+ * - Drive (VS/PE) only transmitted for the hop immediately downstream of DPOA.
+ * - CR for the first hop (DPTX-to-DPIA) is assumed to be successful.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_cr_non_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
+	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
+	enum dc_status status;
+	uint32_t retries_cr = 0; /* Number of consecutive attempts with same VS or PE. */
+	uint32_t retry_count = 0;
+	uint32_t wait_time_microsec = TRAINING_AUX_RD_INTERVAL; /* From DP spec, CR read interval is always 100us. */
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+	uint8_t set_cfg_data;
+	enum dpia_set_config_ts ts;
+
+	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+	/* Cap of LINK_TRAINING_MAX_CR_RETRY attempts at clock recovery.
+	 * Fix inherited from perform_clock_recovery_sequence() -
+	 * the DP equivalent of this function:
+	 * Required for Synaptics MST hub which can put the LT in
+	 * infinite loop by switching the VS between level 0 and level 1
+	 * continuously.
+	 */
+	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
+			(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
+
+		/* DPTX-to-DPIA */
+		if (hop == repeater_cnt) {
+			/* Send SET_CONFIG(SET_LINK:LC,LR,LTTPR) to notify DPOA that
+			 * non-transparent link training has started.
+			 * This also enables the transmission of clk_sync packets.
+			 */
+			set_cfg_data = dpia_build_set_config_data(
+					DPIA_SET_CFG_SET_LINK,
+					link,
+					lt_settings);
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_LINK,
+					set_cfg_data);
+			/* CR for this hop is considered successful as long as
+			 * SET_CONFIG message is acknowledged by DPOA.
+			 */
+			if (status == DC_OK)
+				result = LINK_TRAINING_SUCCESS;
+			else
+				result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* DPOA-to-x */
+		/* Instruct DPOA to transmit TPS1 then update DPCD. */
+		if (retry_count == 0) {
+			status = convert_trng_ptn_to_trng_stg(lt_settings->pattern_for_cr, &ts);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_TRAINING,
+					ts);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+			status = dpcd_set_lt_pattern(link, lt_settings->pattern_for_cr, hop);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+
+		/* Update DPOA drive settings then DPCD. DPOA does only adjusts
+		 * drive settings for hops immediately downstream.
+		 */
+		if (hop == repeater_cnt - 1) {
+			set_cfg_data = dpia_build_set_config_data(
+					DPIA_SET_CFG_SET_VSPE,
+					link,
+					lt_settings);
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_VSPE,
+					set_cfg_data);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+		status = dpcd_set_lane_settings(link, lt_settings, hop);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
+
+		/* Read status and adjustment requests from DPCD. */
+		status = dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				hop);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* Check if clock recovery successful. */
+		if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
+			result = LINK_TRAINING_SUCCESS;
+			break;
+		}
+
+		result = dp_get_cr_failure(lane_count, dpcd_lane_status);
+
+		if (dp_is_max_vs_reached(lt_settings))
+			break;
+
+		/* Count number of attempts with same drive settings.
+		 * Note: settings are the same for all lanes,
+		 * so comparing first lane is sufficient.
+		 */
+		if ((lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
+				dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
+				&& (lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET ==
+						dpcd_lane_adjust[0].bits.PRE_EMPHASIS_LANE))
+			retries_cr++;
+		else
+			retries_cr = 0;
+
+		/* Update VS/PE. */
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings,
+				lt_settings->dpcd_lane_settings);
+		retry_count++;
+	}
+
+	/* Abort link training if clock recovery failed due to HPD unplug. */
+	if (link->is_hpd_pending)
+		result = LINK_TRAINING_ABORT;
+
+	DC_LOG_HW_LINK_TRAINING(
+		"%s\n DPIA(%d) clock recovery\n -hop(%d)\n - result(%d)\n - retries(%d)\n - status(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		hop,
+		result,
+		retry_count,
+		status);
+
+	return result;
+}
+
+/* Execute clock recovery phase of link training in transparent LTTPR mode:
+ * - Driver only issues DPCD transactions and leaves USB4 tunneling (SET_CONFIG) messages to DPIA.
+ * - Driver writes TPS1 to DPCD to kick off training.
+ * - Clock recovery (CR) for link is handled by DPOA, which reports result to DPIA on completion.
+ * - DPIA communicates result to driver by updating CR status when driver reads DPCD.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ */
+static enum link_training_result dpia_training_cr_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
+	enum dc_status status;
+	uint32_t retries_cr = 0; /* Number of consecutive attempts with same VS or PE. */
+	uint32_t retry_count = 0;
+	uint32_t wait_time_microsec = lt_settings->cr_pattern_time;
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+	/* Cap of LINK_TRAINING_MAX_CR_RETRY attempts at clock recovery.
+	 * Fix inherited from perform_clock_recovery_sequence() -
+	 * the DP equivalent of this function:
+	 * Required for Synaptics MST hub which can put the LT in
+	 * infinite loop by switching the VS between level 0 and level 1
+	 * continuously.
+	 */
+	while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
+			(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
+
+		/* Write TPS1 (not VS or PE) to DPCD to start CR phase.
+		 * DPIA sends SET_CONFIG(SET_LINK) to notify DPOA to
+		 * start link training.
+		 */
+		if (retry_count == 0) {
+			status = dpcd_set_lt_pattern(link, lt_settings->pattern_for_cr, DPRX);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+
+		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
+
+		/* Read status and adjustment requests from DPCD. */
+		status = dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				DPRX);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* Check if clock recovery successful. */
+		if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
+			result = LINK_TRAINING_SUCCESS;
+			break;
+		}
+
+		result = dp_get_cr_failure(lane_count, dpcd_lane_status);
+
+		if (dp_is_max_vs_reached(lt_settings))
+			break;
+
+		/* Count number of attempts with same drive settings.
+		 * Note: settings are the same for all lanes,
+		 * so comparing first lane is sufficient.
+		 */
+		if ((lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
+				dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
+				&& (lt_settings->dpcd_lane_settings[0].bits.PRE_EMPHASIS_SET ==
+						dpcd_lane_adjust[0].bits.PRE_EMPHASIS_LANE))
+			retries_cr++;
+		else
+			retries_cr = 0;
+
+		/* Update VS/PE. */
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+		retry_count++;
+	}
+
+	/* Abort link training if clock recovery failed due to HPD unplug. */
+	if (link->is_hpd_pending)
+		result = LINK_TRAINING_ABORT;
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) clock recovery\n -hop(%d)\n - result(%d)\n - retries(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		DPRX,
+		result,
+		retry_count);
+
+	return result;
+}
+
+/* Execute clock recovery phase of link training for specified hop in display
+ * path.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_cr_phase(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	enum link_training_result result = LINK_TRAINING_CR_FAIL_LANE0;
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
+		result = dpia_training_cr_non_transparent(link, link_res, lt_settings, hop);
+	else
+		result = dpia_training_cr_transparent(link, link_res, lt_settings);
+
+	return result;
+}
+
+/* Return status read interval during equalization phase. */
+static uint32_t dpia_get_eq_aux_rd_interval(
+		const struct dc_link *link,
+		const struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	uint32_t wait_time_microsec;
+
+	if (hop == DPRX)
+		wait_time_microsec = lt_settings->eq_pattern_time;
+	else
+		wait_time_microsec =
+				dp_translate_training_aux_read_interval(
+					link->dpcd_caps.lttpr_caps.aux_rd_interval[hop - 1]);
+
+	/* Check debug option for extending aux read interval. */
+	if (link->dc->debug.dpia_debug.bits.extend_aux_rd_interval)
+		wait_time_microsec = DPIA_DEBUG_EXTENDED_AUX_RD_INTERVAL_US;
+
+	return wait_time_microsec;
+}
+
+/* Execute equalization phase of link training for specified hop in display
+ * path in non-transparent mode:
+ * - driver issues both DPCD and SET_CONFIG transactions.
+ * - TPSx is transmitted for any hops downstream of DPOA.
+ * - Drive (VS/PE) only transmitted for the hop immediately downstream of DPOA.
+ * - EQ for the first hop (DPTX-to-DPIA) is assumed to be successful.
+ * - DPRX EQ only reported successful when both DPRX and DPIA requirements (clk sync packets sent) fulfilled.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_eq_non_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
+	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
+	uint32_t retries_eq = 0;
+	enum dc_status status;
+	enum dc_dp_training_pattern tr_pattern;
+	uint32_t wait_time_microsec;
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+	uint8_t set_cfg_data;
+	enum dpia_set_config_ts ts;
+
+	/* Training pattern is TPS4 for repeater;
+	 * TPS2/3/4 for DPRX depending on what it supports.
+	 */
+	if (hop == DPRX)
+		tr_pattern = lt_settings->pattern_for_eq;
+	else
+		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
+
+	repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+	for (retries_eq = 0; retries_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
+
+		/* DPTX-to-DPIA equalization always successful. */
+		if (hop == repeater_cnt) {
+			result = LINK_TRAINING_SUCCESS;
+			break;
+		}
+
+		/* Instruct DPOA to transmit TPSn then update DPCD. */
+		if (retries_eq == 0) {
+			status = convert_trng_ptn_to_trng_stg(tr_pattern, &ts);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_TRAINING,
+					ts);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+			status = dpcd_set_lt_pattern(link, tr_pattern, hop);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+
+		/* Update DPOA drive settings then DPCD. DPOA only adjusts
+		 * drive settings for hop immediately downstream.
+		 */
+		if (hop == repeater_cnt - 1) {
+			set_cfg_data = dpia_build_set_config_data(
+					DPIA_SET_CFG_SET_VSPE,
+					link,
+					lt_settings);
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_VSPE,
+					set_cfg_data);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+		status = dpcd_set_lane_settings(link, lt_settings, hop);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* Extend wait time on second equalisation attempt on final hop to
+		 * ensure clock sync packets have been sent.
+		 */
+		if (hop == DPRX && retries_eq == 1)
+			wait_time_microsec = max(wait_time_microsec, (uint32_t) DPIA_CLK_SYNC_DELAY);
+		else
+			wait_time_microsec = dpia_get_eq_aux_rd_interval(link, lt_settings, hop);
+
+		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
+
+		/* Read status and adjustment requests from DPCD. */
+		status = dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				hop);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* CR can still fail during EQ phase. Fail training if CR fails. */
+		if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
+			result = LINK_TRAINING_EQ_FAIL_CR;
+			break;
+		}
+
+		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
+				dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status) &&
+				dp_is_interlane_aligned(dpcd_lane_status_updated)) {
+			result =  LINK_TRAINING_SUCCESS;
+			break;
+		}
+
+		/* Update VS/PE. */
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+	}
+
+	/* Abort link training if equalization failed due to HPD unplug. */
+	if (link->is_hpd_pending)
+		result = LINK_TRAINING_ABORT;
+
+	DC_LOG_HW_LINK_TRAINING(
+		"%s\n DPIA(%d) equalization\n - hop(%d)\n - result(%d)\n - retries(%d)\n - status(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		hop,
+		result,
+		retries_eq,
+		status);
+
+	return result;
+}
+
+/* Execute equalization phase of link training for specified hop in display
+ * path in transparent LTTPR mode:
+ * - driver only issues DPCD transactions leaves USB4 tunneling (SET_CONFIG) messages to DPIA.
+ * - driver writes TPSx to DPCD to notify DPIA that is in equalization phase.
+ * - equalization (EQ) for link is handled by DPOA, which reports result to DPIA on completion.
+ * - DPIA communicates result to driver by updating EQ status when driver reads DPCD.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_eq_transparent(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
+	uint32_t retries_eq = 0;
+	enum dc_status status;
+	enum dc_dp_training_pattern tr_pattern = lt_settings->pattern_for_eq;
+	uint32_t wait_time_microsec;
+	enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+	union lane_align_status_updated dpcd_lane_status_updated = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+	union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+	wait_time_microsec = dpia_get_eq_aux_rd_interval(link, lt_settings, DPRX);
+
+	for (retries_eq = 0; retries_eq < LINK_TRAINING_MAX_RETRY_COUNT; retries_eq++) {
+
+		if (retries_eq == 0) {
+			status = dpcd_set_lt_pattern(link, tr_pattern, DPRX);
+			if (status != DC_OK) {
+				result = LINK_TRAINING_ABORT;
+				break;
+			}
+		}
+
+		dp_wait_for_training_aux_rd_interval(link, wait_time_microsec);
+
+		/* Read status and adjustment requests from DPCD. */
+		status = dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				DPRX);
+		if (status != DC_OK) {
+			result = LINK_TRAINING_ABORT;
+			break;
+		}
+
+		/* CR can still fail during EQ phase. Fail training if CR fails. */
+		if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
+			result = LINK_TRAINING_EQ_FAIL_CR;
+			break;
+		}
+
+		if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
+				dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status)) {
+			/* Take into consideration corner case for DP 1.4a LL Compliance CTS as USB4
+			 * has to share encoders unlike DP and USBC
+			 */
+			if (dp_is_interlane_aligned(dpcd_lane_status_updated) || (link->is_automated && retries_eq)) {
+				result =  LINK_TRAINING_SUCCESS;
+				break;
+			}
+		}
+
+		/* Update VS/PE. */
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+	}
+
+	/* Abort link training if equalization failed due to HPD unplug. */
+	if (link->is_hpd_pending)
+		result = LINK_TRAINING_ABORT;
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) equalization\n - hop(%d)\n - result(%d)\n - retries(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		DPRX,
+		result,
+		retries_eq);
+
+	return result;
+}
+
+/* Execute equalization phase of link training for specified hop in display
+ * path.
+ *
+ * @param link DPIA link being trained.
+ * @param lt_settings link_setting and drive settings (voltage swing and pre-emphasis).
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_eq_phase(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	enum link_training_result result;
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
+		result = dpia_training_eq_non_transparent(link, link_res, lt_settings, hop);
+	else
+		result = dpia_training_eq_transparent(link, link_res, lt_settings);
+
+	return result;
+}
+
+/* End training of specified hop in display path. */
+static enum dc_status dpcd_clear_lt_pattern(
+	struct dc_link *link,
+	uint32_t hop)
+{
+	union dpcd_training_pattern dpcd_pattern = {0};
+	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
+	enum dc_status status;
+
+	if (hop != DPRX)
+		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
+
+	status = core_link_write_dpcd(
+			link,
+			dpcd_tps_offset,
+			&dpcd_pattern.raw,
+			sizeof(dpcd_pattern.raw));
+
+	return status;
+}
+
+/* End training of specified hop in display path.
+ *
+ * In transparent LTTPR mode:
+ * - driver clears training pattern for the specified hop in DPCD.
+ * In non-transparent LTTPR mode:
+ * - in addition to clearing training pattern, driver issues USB4 tunneling
+ * (SET_CONFIG) messages to notify DPOA when training is done for first hop
+ * (DPTX-to-DPIA) and last hop (DPRX).
+ *
+ * @param link DPIA link being trained.
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static enum link_training_result dpia_training_end(
+		struct dc_link *link,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
+	enum dc_status status;
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+
+		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+		if (hop == repeater_cnt) { /* DPTX-to-DPIA */
+			/* Send SET_CONFIG(SET_TRAINING:0xff) to notify DPOA that
+			 * DPTX-to-DPIA hop trained. No DPCD write needed for first hop.
+			 */
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_TRAINING,
+					DPIA_TS_UFP_DONE);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		} else { /* DPOA-to-x */
+			/* Write 0x0 to TRAINING_PATTERN_SET */
+			status = dpcd_clear_lt_pattern(link, hop);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		}
+
+		/* Notify DPOA that non-transparent link training of DPRX done. */
+		if (hop == DPRX && result != LINK_TRAINING_ABORT) {
+			status = core_link_send_set_config(
+					link,
+					DPIA_SET_CFG_SET_TRAINING,
+					DPIA_TS_DPRX_DONE);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		}
+
+	} else { /* non-LTTPR or transparent LTTPR. */
+
+		/* Write 0x0 to TRAINING_PATTERN_SET */
+		status = dpcd_clear_lt_pattern(link, hop);
+		if (status != DC_OK)
+			result = LINK_TRAINING_ABORT;
+
+	}
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) end\n - hop(%d)\n - result(%d)\n - LTTPR mode(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		hop,
+		result,
+		lt_settings->lttpr_mode);
+
+	return result;
+}
+
+/* When aborting training of specified hop in display path, clean up by:
+ * - Attempting to clear DPCD TRAINING_PATTERN_SET, LINK_BW_SET and LANE_COUNT_SET.
+ * - Sending SET_CONFIG(SET_LINK) with lane count and link rate set to 0.
+ *
+ * @param link DPIA link being trained.
+ * @param hop Hop in display path. DPRX = 0.
+ */
+static void dpia_training_abort(
+		struct dc_link *link,
+		struct link_training_settings *lt_settings,
+		uint32_t hop)
+{
+	uint8_t data = 0;
+	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) aborting\n - LTTPR mode(%d)\n - HPD(%d)\n",
+		__func__,
+		link->link_id.enum_id - ENUM_ID_1,
+		lt_settings->lttpr_mode,
+		link->is_hpd_pending);
+
+	/* Abandon clean-up if sink unplugged. */
+	if (link->is_hpd_pending)
+		return;
+
+	if (hop != DPRX)
+		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
+
+	core_link_write_dpcd(link, dpcd_tps_offset, &data, 1);
+	core_link_write_dpcd(link, DP_LINK_BW_SET, &data, 1);
+	core_link_write_dpcd(link, DP_LANE_COUNT_SET, &data, 1);
+	core_link_send_set_config(link, DPIA_SET_CFG_SET_LINK, data);
+}
+
+enum link_training_result dc_link_dpia_perform_link_training(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	const struct dc_link_settings *link_setting,
+	bool skip_video_pattern)
+{
+	enum link_training_result result;
+	struct link_training_settings lt_settings = {0};
+	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
+	int8_t repeater_id; /* Current hop. */
+
+	struct dc_link_settings link_settings = *link_setting; // non-const copy to pass in
+
+	lt_settings.lttpr_mode = dc_link_decide_lttpr_mode(link, &link_settings);
+
+	/* Configure link as prescribed in link_setting and set LTTPR mode. */
+	result = dpia_configure_link(link, link_res, link_setting, &lt_settings);
+	if (result != LINK_TRAINING_SUCCESS)
+		return result;
+
+	if (lt_settings.lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
+		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+	/* Train each hop in turn starting with the one closest to DPTX.
+	 * In transparent or non-LTTPR mode, train only the final hop (DPRX).
+	 */
+	for (repeater_id = repeater_cnt; repeater_id >= 0; repeater_id--) {
+		/* Clock recovery. */
+		result = dpia_training_cr_phase(link, link_res, &lt_settings, repeater_id);
+		if (result != LINK_TRAINING_SUCCESS)
+			break;
+
+		/* Equalization. */
+		result = dpia_training_eq_phase(link, link_res, &lt_settings, repeater_id);
+		if (result != LINK_TRAINING_SUCCESS)
+			break;
+
+		/* Stop training hop. */
+		result = dpia_training_end(link, &lt_settings, repeater_id);
+		if (result != LINK_TRAINING_SUCCESS)
+			break;
+	}
+
+	/* Double-check link status if training successful; gracefully abort
+	 * training of current hop if training failed due to message tunneling
+	 * failure; end training of hop if training ended conventionally and
+	 * falling back to lower bandwidth settings possible.
+	 */
+	if (result == LINK_TRAINING_SUCCESS) {
+		msleep(5);
+		if (!link->is_automated)
+			result = dp_check_link_loss_status(link, &lt_settings);
+	} else if (result == LINK_TRAINING_ABORT)
+		dpia_training_abort(link, &lt_settings, repeater_id);
+	else
+		dpia_training_end(link, &lt_settings, repeater_id);
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.h
new file mode 100644
index 000000000000..0150f2916421
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_dpia.h
@@ -0,0 +1,41 @@
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
+
+#ifndef __DC_LINK_DP_TRAINING_DPIA_H__
+#define __DC_LINK_DP_TRAINING_DPIA_H__
+#include "link_dp_training.h"
+
+/* Train DP tunneling link for USB4 DPIA display endpoint.
+ * DPIA equivalent of dc_link_dp_perfrorm_link_training.
+ * Aborts link training upon detection of sink unplug.
+ */
+enum link_training_result dc_link_dpia_perform_link_training(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	const struct dc_link_settings *link_setting,
+	bool skip_video_pattern);
+
+#endif /* __DC_LINK_DP_TRAINING_DPIA_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
new file mode 100644
index 000000000000..821f4896d77a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.c
@@ -0,0 +1,578 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements 8b/10b link training specially modified to support an
+ * embedded retimer chip. This retimer chip is referred as fixed vs pe retimer.
+ * Unlike native dp connection this chip requires a modified link training
+ * protocol based on 8b/10b link training. Since this is a non standard sequence
+ * and we must support this hardware, we decided to isolate it in its own
+ * training sequence inside its own file.
+ */
+#include "link_dp_training_fixed_vs_pe_retimer.h"
+#include "link_dp_training_8b_10b.h"
+#include "link_dpcd.h"
+#include "dc_link_dp.h"
+
+#define DC_LOGGER \
+	link->ctx->logger
+
+void dp_fixed_vs_pe_read_lane_adjust(
+	struct dc_link *link,
+	union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX])
+{
+	const uint8_t vendor_lttpr_write_data_vs[3] = {0x0, 0x53, 0x63};
+	const uint8_t vendor_lttpr_write_data_pe[3] = {0x0, 0x54, 0x63};
+	const uint8_t offset = dp_convert_to_count(
+			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	uint32_t vendor_lttpr_write_address = 0xF004F;
+	uint32_t vendor_lttpr_read_address = 0xF0053;
+	uint8_t dprx_vs = 0;
+	uint8_t dprx_pe = 0;
+	uint8_t lane;
+
+	if (offset != 0xFF) {
+		vendor_lttpr_write_address +=
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+		vendor_lttpr_read_address +=
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+	}
+
+	/* W/A to read lane settings requested by DPRX */
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_vs[0],
+			sizeof(vendor_lttpr_write_data_vs));
+	core_link_read_dpcd(
+			link,
+			vendor_lttpr_read_address,
+			&dprx_vs,
+			1);
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_pe[0],
+			sizeof(vendor_lttpr_write_data_pe));
+	core_link_read_dpcd(
+			link,
+			vendor_lttpr_read_address,
+			&dprx_pe,
+			1);
+
+	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+		dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET  = (dprx_vs >> (2 * lane)) & 0x3;
+		dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_SET = (dprx_pe >> (2 * lane)) & 0x3;
+	}
+}
+
+
+void dp_fixed_vs_pe_set_retimer_lane_settings(
+	struct dc_link *link,
+	const union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX],
+	uint8_t lane_count)
+{
+	const uint8_t offset = dp_convert_to_count(
+			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
+	uint32_t vendor_lttpr_write_address = 0xF004F;
+	uint8_t vendor_lttpr_write_data_vs[4] = {0x1, 0x51, 0x63, 0x0};
+	uint8_t vendor_lttpr_write_data_pe[4] = {0x1, 0x52, 0x63, 0x0};
+	uint8_t lane = 0;
+
+	if (offset != 0xFF) {
+		vendor_lttpr_write_address +=
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+	}
+
+	for (lane = 0; lane < lane_count; lane++) {
+		vendor_lttpr_write_data_vs[3] |=
+				dpcd_lane_adjust[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
+		vendor_lttpr_write_data_pe[3] |=
+				dpcd_lane_adjust[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
+	}
+
+	/* Force LTTPR to output desired VS and PE */
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_reset[0],
+			sizeof(vendor_lttpr_write_data_reset));
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_vs[0],
+			sizeof(vendor_lttpr_write_data_vs));
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_pe[0],
+			sizeof(vendor_lttpr_write_data_pe));
+}
+
+static enum link_training_result perform_fixed_vs_pe_nontransparent_training_sequence(
+		struct dc_link *link,
+		const struct link_resource *link_res,
+		struct link_training_settings *lt_settings)
+{
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+	uint8_t lane = 0;
+	uint8_t toggle_rate = 0x6;
+	uint8_t target_rate = 0x6;
+	bool apply_toggle_rate_wa = false;
+	uint8_t repeater_cnt;
+	uint8_t repeater_id;
+
+	/* Fixed VS/PE specific: Force CR AUX RD Interval to at least 16ms */
+	if (lt_settings->cr_pattern_time < 16000)
+		lt_settings->cr_pattern_time = 16000;
+
+	/* Fixed VS/PE specific: Toggle link rate */
+	apply_toggle_rate_wa = (link->vendor_specific_lttpr_link_rate_wa == target_rate);
+	target_rate = get_dpcd_link_rate(&lt_settings->link_settings);
+	toggle_rate = (target_rate == 0x6) ? 0xA : 0x6;
+
+	if (apply_toggle_rate_wa)
+		lt_settings->link_settings.link_rate = toggle_rate;
+
+	if (link->ctx->dc->work_arounds.lt_early_cr_pattern)
+		start_clock_recovery_pattern_early(link, link_res, lt_settings, DPRX);
+
+	/* 1. set link rate, lane count and spread. */
+	dpcd_set_link_settings(link, lt_settings);
+
+	/* Fixed VS/PE specific: Toggle link rate back*/
+	if (apply_toggle_rate_wa) {
+		core_link_write_dpcd(
+				link,
+				DP_LINK_BW_SET,
+				&target_rate,
+				1);
+	}
+
+	link->vendor_specific_lttpr_link_rate_wa = target_rate;
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+
+		/* 2. perform link training (set link training done
+		 *  to false is done as well)
+		 */
+		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+		for (repeater_id = repeater_cnt; (repeater_id > 0 && status == LINK_TRAINING_SUCCESS);
+				repeater_id--) {
+			status = perform_8b_10b_clock_recovery_sequence(link, link_res, lt_settings, repeater_id);
+
+			if (status != LINK_TRAINING_SUCCESS) {
+				repeater_training_done(link, repeater_id);
+				break;
+			}
+
+			status = perform_8b_10b_channel_equalization_sequence(link,
+					link_res,
+					lt_settings,
+					repeater_id);
+
+			repeater_training_done(link, repeater_id);
+
+			if (status != LINK_TRAINING_SUCCESS)
+				break;
+
+			for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
+				lt_settings->dpcd_lane_settings[lane].raw = 0;
+				lt_settings->hw_lane_settings[lane].VOLTAGE_SWING = 0;
+				lt_settings->hw_lane_settings[lane].PRE_EMPHASIS = 0;
+			}
+		}
+	}
+
+	if (status == LINK_TRAINING_SUCCESS) {
+		status = perform_8b_10b_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
+		if (status == LINK_TRAINING_SUCCESS) {
+			status = perform_8b_10b_channel_equalization_sequence(link,
+								       link_res,
+								       lt_settings,
+								       DPRX);
+		}
+	}
+
+	return status;
+}
+
+
+enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings)
+{
+	const uint8_t vendor_lttpr_write_data_reset[4] = {0x1, 0x50, 0x63, 0xFF};
+	const uint8_t offset = dp_convert_to_count(
+			link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+	const uint8_t vendor_lttpr_write_data_intercept_en[4] = {0x1, 0x55, 0x63, 0x0};
+	const uint8_t vendor_lttpr_write_data_intercept_dis[4] = {0x1, 0x55, 0x63, 0x68};
+	uint32_t pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa;
+	uint8_t vendor_lttpr_write_data_vs[4] = {0x1, 0x51, 0x63, 0x0};
+	uint8_t vendor_lttpr_write_data_pe[4] = {0x1, 0x52, 0x63, 0x0};
+	uint32_t vendor_lttpr_write_address = 0xF004F;
+	enum link_training_result status = LINK_TRAINING_SUCCESS;
+	uint8_t lane = 0;
+	union down_spread_ctrl downspread = {0};
+	union lane_count_set lane_count_set = {0};
+	uint8_t toggle_rate;
+	uint8_t rate;
+
+	/* Only 8b/10b is supported */
+	ASSERT(dp_get_link_encoding_format(&lt_settings->link_settings) ==
+			DP_8b_10b_ENCODING);
+
+	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+		status = perform_fixed_vs_pe_nontransparent_training_sequence(link, link_res, lt_settings);
+		return status;
+	}
+
+	if (offset != 0xFF) {
+		vendor_lttpr_write_address +=
+				((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (offset - 1));
+
+		/* Certain display and cable configuration require extra delay */
+		if (offset > 2)
+			pre_disable_intercept_delay_ms = link->dc->debug.fixed_vs_aux_delay_config_wa * 2;
+	}
+
+	/* Vendor specific: Reset lane settings */
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_reset[0],
+			sizeof(vendor_lttpr_write_data_reset));
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_vs[0],
+			sizeof(vendor_lttpr_write_data_vs));
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_pe[0],
+			sizeof(vendor_lttpr_write_data_pe));
+
+	/* Vendor specific: Enable intercept */
+	core_link_write_dpcd(
+			link,
+			vendor_lttpr_write_address,
+			&vendor_lttpr_write_data_intercept_en[0],
+			sizeof(vendor_lttpr_write_data_intercept_en));
+
+	/* 1. set link rate, lane count and spread. */
+
+	downspread.raw = (uint8_t)(lt_settings->link_settings.link_spread);
+
+	lane_count_set.bits.LANE_COUNT_SET =
+	lt_settings->link_settings.lane_count;
+
+	lane_count_set.bits.ENHANCED_FRAMING = lt_settings->enhanced_framing;
+	lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED = 0;
+
+
+	if (lt_settings->pattern_for_eq < DP_TRAINING_PATTERN_SEQUENCE_4) {
+		lane_count_set.bits.POST_LT_ADJ_REQ_GRANTED =
+				link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED;
+	}
+
+	core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
+		&downspread.raw, sizeof(downspread));
+
+	core_link_write_dpcd(link, DP_LANE_COUNT_SET,
+		&lane_count_set.raw, 1);
+
+	rate = get_dpcd_link_rate(&lt_settings->link_settings);
+
+	/* Vendor specific: Toggle link rate */
+	toggle_rate = (rate == 0x6) ? 0xA : 0x6;
+
+	if (link->vendor_specific_lttpr_link_rate_wa == rate) {
+		core_link_write_dpcd(
+				link,
+				DP_LINK_BW_SET,
+				&toggle_rate,
+				1);
+	}
+
+	link->vendor_specific_lttpr_link_rate_wa = rate;
+
+	core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
+
+	DC_LOG_HW_LINK_TRAINING("%s\n %x rate = %x\n %x lane = %x framing = %x\n %x spread = %x\n",
+		__func__,
+		DP_LINK_BW_SET,
+		lt_settings->link_settings.link_rate,
+		DP_LANE_COUNT_SET,
+		lt_settings->link_settings.lane_count,
+		lt_settings->enhanced_framing,
+		DP_DOWNSPREAD_CTRL,
+		lt_settings->link_settings.link_spread);
+
+	/* 2. Perform link training */
+
+	/* Perform Clock Recovery Sequence */
+	if (status == LINK_TRAINING_SUCCESS) {
+		const uint8_t max_vendor_dpcd_retries = 10;
+		uint32_t retries_cr;
+		uint32_t retry_count;
+		uint32_t wait_time_microsec;
+		enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
+		union lane_align_status_updated dpcd_lane_status_updated;
+		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+		enum dc_status dpcd_status = DC_OK;
+		uint8_t i = 0;
+
+		retries_cr = 0;
+		retry_count = 0;
+
+		memset(&dpcd_lane_status, '\0', sizeof(dpcd_lane_status));
+		memset(&dpcd_lane_status_updated, '\0',
+		sizeof(dpcd_lane_status_updated));
+
+		while ((retries_cr < LINK_TRAINING_MAX_RETRY_COUNT) &&
+			(retry_count < LINK_TRAINING_MAX_CR_RETRY)) {
+
+
+			/* 1. call HWSS to set lane settings */
+			dp_set_hw_lane_settings(
+					link,
+					link_res,
+					lt_settings,
+					0);
+
+			/* 2. update DPCD of the receiver */
+			if (!retry_count) {
+				/* EPR #361076 - write as a 5-byte burst,
+				 * but only for the 1-st iteration.
+				 */
+				dpcd_set_lt_pattern_and_lane_settings(
+						link,
+						lt_settings,
+						lt_settings->pattern_for_cr,
+						0);
+				/* Vendor specific: Disable intercept */
+				for (i = 0; i < max_vendor_dpcd_retries; i++) {
+					msleep(pre_disable_intercept_delay_ms);
+					dpcd_status = core_link_write_dpcd(
+							link,
+							vendor_lttpr_write_address,
+							&vendor_lttpr_write_data_intercept_dis[0],
+							sizeof(vendor_lttpr_write_data_intercept_dis));
+
+					if (dpcd_status == DC_OK)
+						break;
+
+					core_link_write_dpcd(
+							link,
+							vendor_lttpr_write_address,
+							&vendor_lttpr_write_data_intercept_en[0],
+							sizeof(vendor_lttpr_write_data_intercept_en));
+				}
+			} else {
+				vendor_lttpr_write_data_vs[3] = 0;
+				vendor_lttpr_write_data_pe[3] = 0;
+
+				for (lane = 0; lane < lane_count; lane++) {
+					vendor_lttpr_write_data_vs[3] |=
+							lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
+					vendor_lttpr_write_data_pe[3] |=
+							lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
+				}
+
+				/* Vendor specific: Update VS and PE to DPRX requested value */
+				core_link_write_dpcd(
+						link,
+						vendor_lttpr_write_address,
+						&vendor_lttpr_write_data_vs[0],
+						sizeof(vendor_lttpr_write_data_vs));
+				core_link_write_dpcd(
+						link,
+						vendor_lttpr_write_address,
+						&vendor_lttpr_write_data_pe[0],
+						sizeof(vendor_lttpr_write_data_pe));
+
+				dpcd_set_lane_settings(
+						link,
+						lt_settings,
+						0);
+			}
+
+			/* 3. wait receiver to lock-on*/
+			wait_time_microsec = lt_settings->cr_pattern_time;
+
+			dp_wait_for_training_aux_rd_interval(
+					link,
+					wait_time_microsec);
+
+			/* 4. Read lane status and requested drive
+			 * settings as set by the sink
+			 */
+			dp_get_lane_status_and_lane_adjust(
+					link,
+					lt_settings,
+					dpcd_lane_status,
+					&dpcd_lane_status_updated,
+					dpcd_lane_adjust,
+					0);
+
+			/* 5. check CR done*/
+			if (dp_is_cr_done(lane_count, dpcd_lane_status)) {
+				status = LINK_TRAINING_SUCCESS;
+				break;
+			}
+
+			/* 6. max VS reached*/
+			if (dp_is_max_vs_reached(lt_settings))
+				break;
+
+			/* 7. same lane settings */
+			/* Note: settings are the same for all lanes,
+			 * so comparing first lane is sufficient
+			 */
+			if (lt_settings->dpcd_lane_settings[0].bits.VOLTAGE_SWING_SET ==
+					dpcd_lane_adjust[0].bits.VOLTAGE_SWING_LANE)
+				retries_cr++;
+			else
+				retries_cr = 0;
+
+			/* 8. update VS/PE/PC2 in lt_settings*/
+			dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+					lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+			retry_count++;
+		}
+
+		if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
+			ASSERT(0);
+			DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
+				__func__,
+				LINK_TRAINING_MAX_CR_RETRY);
+
+		}
+
+		status = dp_get_cr_failure(lane_count, dpcd_lane_status);
+	}
+
+	/* Perform Channel EQ Sequence */
+	if (status == LINK_TRAINING_SUCCESS) {
+		enum dc_dp_training_pattern tr_pattern;
+		uint32_t retries_ch_eq;
+		uint32_t wait_time_microsec;
+		enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
+		union lane_align_status_updated dpcd_lane_status_updated = {0};
+		union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {0};
+		union lane_adjust dpcd_lane_adjust[LANE_COUNT_DP_MAX] = {0};
+
+		/* Note: also check that TPS4 is a supported feature*/
+		tr_pattern = lt_settings->pattern_for_eq;
+
+		dp_set_hw_training_pattern(link, link_res, tr_pattern, 0);
+
+		status = LINK_TRAINING_EQ_FAIL_EQ;
+
+		for (retries_ch_eq = 0; retries_ch_eq <= LINK_TRAINING_MAX_RETRY_COUNT;
+			retries_ch_eq++) {
+
+			dp_set_hw_lane_settings(link, link_res, lt_settings, 0);
+
+			vendor_lttpr_write_data_vs[3] = 0;
+			vendor_lttpr_write_data_pe[3] = 0;
+
+			for (lane = 0; lane < lane_count; lane++) {
+				vendor_lttpr_write_data_vs[3] |=
+						lt_settings->dpcd_lane_settings[lane].bits.VOLTAGE_SWING_SET << (2 * lane);
+				vendor_lttpr_write_data_pe[3] |=
+						lt_settings->dpcd_lane_settings[lane].bits.PRE_EMPHASIS_SET << (2 * lane);
+			}
+
+			/* Vendor specific: Update VS and PE to DPRX requested value */
+			core_link_write_dpcd(
+					link,
+					vendor_lttpr_write_address,
+					&vendor_lttpr_write_data_vs[0],
+					sizeof(vendor_lttpr_write_data_vs));
+			core_link_write_dpcd(
+					link,
+					vendor_lttpr_write_address,
+					&vendor_lttpr_write_data_pe[0],
+					sizeof(vendor_lttpr_write_data_pe));
+
+			/* 2. update DPCD*/
+			if (!retries_ch_eq)
+				/* EPR #361076 - write as a 5-byte burst,
+				 * but only for the 1-st iteration
+				 */
+
+				dpcd_set_lt_pattern_and_lane_settings(
+					link,
+					lt_settings,
+					tr_pattern, 0);
+			else
+				dpcd_set_lane_settings(link, lt_settings, 0);
+
+			/* 3. wait for receiver to lock-on*/
+			wait_time_microsec = lt_settings->eq_pattern_time;
+
+			dp_wait_for_training_aux_rd_interval(
+					link,
+					wait_time_microsec);
+
+			/* 4. Read lane status and requested
+			 * drive settings as set by the sink
+			 */
+			dp_get_lane_status_and_lane_adjust(
+				link,
+				lt_settings,
+				dpcd_lane_status,
+				&dpcd_lane_status_updated,
+				dpcd_lane_adjust,
+				0);
+
+			/* 5. check CR done*/
+			if (!dp_is_cr_done(lane_count, dpcd_lane_status)) {
+				status = LINK_TRAINING_EQ_FAIL_CR;
+				break;
+			}
+
+			/* 6. check CHEQ done*/
+			if (dp_is_ch_eq_done(lane_count, dpcd_lane_status) &&
+					dp_is_symbol_locked(lane_count, dpcd_lane_status) &&
+					dp_is_interlane_aligned(dpcd_lane_status_updated)) {
+				status = LINK_TRAINING_SUCCESS;
+				break;
+			}
+
+			/* 7. update VS/PE/PC2 in lt_settings*/
+			dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+					lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
+		}
+	}
+
+	return status;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.h b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.h
new file mode 100644
index 000000000000..e61970e27661
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_training_fixed_vs_pe_retimer.h
@@ -0,0 +1,45 @@
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
+
+#ifndef __DC_LINK_DP_FIXED_VS_PE_RETIMER_H__
+#define __DC_LINK_DP_FIXED_VS_PE_RETIMER_H__
+#include "link_dp_training.h"
+
+enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings);
+
+void dp_fixed_vs_pe_set_retimer_lane_settings(
+	struct dc_link *link,
+	const union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX],
+	uint8_t lane_count);
+
+void dp_fixed_vs_pe_read_lane_adjust(
+	struct dc_link *link,
+	union dpcd_training_lane dpcd_lane_adjust[LANE_COUNT_DP_MAX]);
+
+#endif /* __DC_LINK_DP_FIXED_VS_PE_RETIMER_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpcd.h b/drivers/gpu/drm/amd/display/dc/link/link_dpcd.h
index 27b08cdbb4a1..08d787a1e451 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpcd.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpcd.h
@@ -26,6 +26,7 @@
 #ifndef __LINK_DPCD_H__
 #define __LINK_DPCD_H__
 #include "link.h"
+#include "dpcd_defs.h"
 
 enum dc_status core_link_read_dpcd(
 		struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index a7ba5bd8dc16..3610f71891a3 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -133,6 +133,11 @@ static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
 
 static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
 
+/*Travis*/
+static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
+/*Nutmeg*/
+static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
+
 /*MST Dock*/
 static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
 
-- 
2.39.0

