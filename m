Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41376A9B05
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Mar 2023 16:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084A10E6D3;
	Fri,  3 Mar 2023 15:48:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DB910E6D3
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Mar 2023 15:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N567I4pqmE2GkFYFUueq7/lPsHlkBzUmFkGOuiKStPuNg7ATk+HUI8LuTIqA5gF8qE/F3WtQoksiMYrIW3o8AjBFpr27KxEXIntpY5r0y86mYB+qFFOCNRP0/CApkX0xVIEbbO1i1P0pmsY6MI3poNOpu8s+13lLNu4Q9B3LhPLN+8QREs96DUjjQNcKJiIwKvqnk4xRiKyapYd1KHkDMnxqWLfnjCwIqCKL9aQ/2UUggSK4GA4+ik4yTMAEnISACx7woK0QM1+iTPtN6b3jbWLD6t0X8ytlEMI8FD4DMxo3XzFy5t2RJasGaNTOLtx7qHGQYERoS2euInWJS6rdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP54hyivM7QxsywygMNcNb41r1d2XrIOPBQsoppTU70=;
 b=fDGSZZdf3kKChVw6RRDdCeHNqoOZq3gNQuM0b55u0sq2OOMDFhyAu5cCwF/0HjVMzs8wDqERvD8APGWbWjESwCTbSnM9POKjMHoeWeDQ8g8RsYAfY3MTQK/1SVzvglQNiwSG9kWnuQch+dioo1Um21Wh/Rt2bDUXdS6iC6xejFxIKIpMg6lawAXiqq1FjSWTSc7xy1n9Gyr3dXDmfVlau1tEKFX5e08AvQcjouBMxqyNi5tf8OhSOTBZreCRV7jVWGM2FUrG+RZfq8MDV2Jot/fGGMCfoplzCI4xI/IQn7SM8I6Ha6sWjB/GH7w61GU0L0mkwJCF+D1FDLbfB4is7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP54hyivM7QxsywygMNcNb41r1d2XrIOPBQsoppTU70=;
 b=GBDIUDRTxigLKP2KBByy0cXM2pbrS74AbJ0fKWD/+FhbLipjyZJUCjCrQdWknRVlbYL+K2cDs5VGDZZ1fDS3D+KWq9xroyLyzAgfwllSYeLsR2AvoLxgokfoTAYyJbO1Si6SINgl4vdSmneh8pjdSZi9E3ciywFHHq/D6vLce7M=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by CH2PR12MB5514.namprd12.prod.outlook.com (2603:10b6:610:62::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 15:47:54 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::50) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 15:47:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 15:47:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 09:47:39 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/33] drm/amd/display: move dc_link functions in accessories
 folder to dc_link_exports
Date: Fri, 3 Mar 2023 10:40:02 -0500
Message-ID: <20230303154022.2667-14-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303154022.2667-1-qingqing.zhuo@amd.com>
References: <20230303154022.2667-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|CH2PR12MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d31a0d8-0ac9-41da-b562-08db1bfea6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLtjl9GGGKWuQlEMv+2R30lK8i2Mu03hWiR3jEWbt2Tx6dlQn1w9+TjwUcfAku5qFD7x2i1jhGiT/fRk8clQodf2Zzdy6BQCKpEBaXNO2hYDOo88NKtInWDL2pmb523Y0becz4Y90JD7H9UQB8O/s9umr184rQr5KKtMzl3ES772J5DMfL0GlhHU22i7/e2HKvgNfrKDwgXcr5+C6WWc/B+kn0gjFP9h9rvG9qMegxq1SPWt4LcWeD3LadmT8LC0XUSzPd/MUvUo0NG+hkKCQ+nSzbLfqsSjFGjHnCE/itpVvN2pVdLdOXVhiVWshARhijLS4lo5EtEJPq13qecr/wd8z4ra3r/IOCOtvyATmo3NZyhm2rKw/ONrqQdFnKYJ+xprS2YygtBXdrr3pIdO09W22OiIwKa0vaF2pF1QiNca7KEctqNW8c2KYWCpU+xBBl+OEtLmzUD5GVOaudrFmRTGZ+i6rwn+TTP9rh0XuSjWqvPRAG3fb38BGUCkOjvwvfe673FejxYT6DPMrwNpjC8UP9LHle+bOZGIjadTDII8ysttfzDCwEA8Et/6k3u9ND3jZmPa1Af9Eh9SAWs6F3Wg2K/lDUrel1HEInqLuFdwEKX6Iz6Gp/D4DozRnL/A+0fLOpuZZs7Ub0f0ecrefRnzkFmzy7lZngfIzx1as+q0uzXdchOlmKWp6o+44t9NoC7+8HOX1XxwUuBVZXTopQXg2OO8CR7djG8Pq53t5c4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(40480700001)(2906002)(81166007)(70586007)(8676002)(6916009)(4326008)(70206006)(82740400003)(40460700003)(36756003)(478600001)(54906003)(83380400001)(316002)(186003)(5660300002)(2616005)(36860700001)(8936002)(16526019)(356005)(47076005)(426003)(44832011)(41300700001)(26005)(1076003)(6666004)(86362001)(336012)(30864003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:47:53.7562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d31a0d8-0ac9-41da-b562-08db1bfea6e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5514
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

[why]
link component should only have one interface serving dc.

[how]
We are moving dc_link functions exposed to DM to dc_link_exports
and unify link component interface in link.h with function pointer
to match the style of other dc component. This is the first step to move
dc_link functions under accessories folder to dc_link_exports.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  2 +
 .../drm/amd/display/dc/core/dc_link_exports.c | 78 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  6 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h     | 37 ++++++++-
 .../display/dc/link/accessories/link_dp_cts.c | 41 +++-------
 .../display/dc/link/accessories/link_dp_cts.h | 19 ++++-
 .../dc/link/accessories/link_dp_trace.c       | 13 ++--
 .../dc/link/accessories/link_dp_trace.h       | 12 +--
 .../drm/amd/display/dc/link/link_factory.c    | 20 +++++
 .../drm/amd/display/dc/link/link_resource.h   |  3 -
 .../display/dc/link/protocols/link_dp_phy.h   |  5 --
 11 files changed, 178 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 5378b09471d3..8282401f6fb3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -981,6 +981,8 @@ static bool dc_construct(struct dc *dc,
 		goto fail;
 	}
 
+	dc->link_srv = link_get_link_service();
+
 	dc->res_pool = dc_create_resource_pool(dc, init_params, dc_ctx->dce_version);
 	if (!dc->res_pool)
 		goto fail;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index 565c62a272d6..79e763b8209d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -186,3 +186,81 @@ bool dc_submit_i2c_oem(
 	return false;
 }
 
+void dc_link_dp_handle_automated_test(struct dc_link *link)
+{
+	link->dc->link_srv->dp_handle_automated_test(link);
+}
+
+bool dc_link_dp_set_test_pattern(
+	struct dc_link *link,
+	enum dp_test_pattern test_pattern,
+	enum dp_test_pattern_color_space test_pattern_color_space,
+	const struct link_training_settings *p_link_settings,
+	const unsigned char *p_custom_pattern,
+	unsigned int cust_pattern_size)
+{
+	return link->dc->link_srv->dp_set_test_pattern(link, test_pattern,
+			test_pattern_color_space, p_link_settings,
+			p_custom_pattern, cust_pattern_size);
+}
+
+void dc_link_set_drive_settings(struct dc *dc,
+				struct link_training_settings *lt_settings,
+				struct dc_link *link)
+{
+	struct link_resource link_res;
+
+	link_get_cur_link_res(link, &link_res);
+	dp_set_drive_settings(link, &link_res, lt_settings);
+}
+
+void dc_link_set_preferred_link_settings(struct dc *dc,
+					 struct dc_link_settings *link_setting,
+					 struct dc_link *link)
+{
+	dc->link_srv->dp_set_preferred_link_settings(dc, link_setting, link);
+}
+
+void dc_link_set_preferred_training_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link_training_overrides *lt_overrides,
+		struct dc_link *link,
+		bool skip_immediate_retrain)
+{
+	dc->link_srv->dp_set_preferred_training_settings(dc, link_setting,
+			lt_overrides, link, skip_immediate_retrain);
+}
+
+bool dc_dp_trace_is_initialized(struct dc_link *link)
+{
+	return link->dc->link_srv->dp_trace_is_initialized(link);
+}
+
+void dc_dp_trace_set_is_logged_flag(struct dc_link *link,
+		bool in_detection,
+		bool is_logged)
+{
+	link->dc->link_srv->dp_trace_set_is_logged_flag(link, in_detection, is_logged);
+}
+
+bool dc_dp_trace_is_logged(struct dc_link *link, bool in_detection)
+{
+	return link->dc->link_srv->dp_trace_is_logged(link, in_detection);
+}
+
+unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
+		bool in_detection)
+{
+	return link->dc->link_srv->dp_trace_get_lt_end_timestamp(link, in_detection);
+}
+
+const struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
+		bool in_detection)
+{
+	return link->dc->link_srv->dp_trace_get_lt_counts(link, in_detection);
+}
+
+unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link)
+{
+	return link->dc->link_srv->dp_trace_get_link_loss_count(link);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ae9d31cf9a23..555d3aa65889 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -714,6 +714,7 @@ struct dc_bounding_box_overrides {
 struct dc_state;
 struct resource_pool;
 struct dce_hwseq;
+struct link_service;
 
 /**
  * struct dc_debug_options - DC debug struct
@@ -890,6 +891,7 @@ struct dc {
 
 	uint8_t link_count;
 	struct dc_link *links[MAX_PIPES * 2];
+	const struct link_service *link_srv;
 
 	struct dc_state *current_state;
 	struct resource_pool *res_pool;
@@ -1828,7 +1830,7 @@ bool dc_link_is_dp_sink_present(struct dc_link *link);
  */
 void dc_link_set_drive_settings(struct dc *dc,
 				struct link_training_settings *lt_settings,
-				const struct dc_link *link);
+				struct dc_link *link);
 
 /* Enable a test pattern in Link or PHY layer in an active link for compliance
  * test or debugging purpose. The test pattern will remain until next un-plug.
@@ -1986,7 +1988,7 @@ unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
  * training in detection sequence. false to get link training count of last link
  * training in commit (dpms) sequence
  */
-struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
+const struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
 		bool in_detection);
 
 /* Get how many link loss has happened since last link training attempts */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index a3fcfa918a8f..cfe6fc48b6e9 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -48,8 +48,38 @@ struct link_init_data {
 	bool is_dpia_link;
 };
 
+struct link_service {
+	void (*dp_handle_automated_test)(struct dc_link *link);
+	bool (*dp_set_test_pattern)(
+			struct dc_link *link,
+			enum dp_test_pattern test_pattern,
+			enum dp_test_pattern_color_space test_pattern_color_space,
+			const struct link_training_settings *p_link_settings,
+			const unsigned char *p_custom_pattern,
+			unsigned int cust_pattern_size);
+	void (*dp_set_preferred_link_settings)(struct dc *dc,
+			struct dc_link_settings *link_setting,
+			struct dc_link *link);
+	void (*dp_set_preferred_training_settings)(struct dc *dc,
+			struct dc_link_settings *link_setting,
+			struct dc_link_training_overrides *lt_overrides,
+			struct dc_link *link,
+			bool skip_immediate_retrain);
+	bool (*dp_trace_is_initialized)(struct dc_link *link);
+	void (*dp_trace_set_is_logged_flag)(struct dc_link *link,
+			bool in_detection,
+			bool is_logged);
+	bool (*dp_trace_is_logged)(struct dc_link *link, bool in_detection);
+	unsigned long long (*dp_trace_get_lt_end_timestamp)(
+			struct dc_link *link, bool in_detection);
+	const struct dp_trace_lt_counts *(*dp_trace_get_lt_counts)(
+			struct dc_link *link, bool in_detection);
+	unsigned int (*dp_trace_get_link_loss_count)(struct dc_link *link);
+};
+
 struct dc_link *link_create(const struct link_init_data *init_params);
 void link_destroy(struct dc_link **link);
+const struct link_service *link_get_link_service(void);
 
 // TODO - convert any function declarations below to function pointers
 struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
@@ -150,5 +180,10 @@ uint32_t dp_link_bandwidth_kbps(
 uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing);
 void link_get_cur_res_map(const struct dc *dc, uint32_t *map);
 void link_restore_res_map(const struct dc *dc, uint32_t *map);
-
+void link_get_cur_link_res(const struct dc_link *link,
+		struct link_resource *link_res);
+void dp_set_drive_settings(
+	struct dc_link *link,
+	const struct link_resource *link_res,
+	struct link_training_settings *lt_settings);
 #endif /* __DC_LINK_HPD_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 7f36d733bfca..080019f4252f 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -75,7 +75,7 @@ static bool is_dp_phy_pattern(enum dp_test_pattern test_pattern)
 		return false;
 }
 
-void dp_retrain_link_dp_test(struct dc_link *link,
+static void dp_retrain_link_dp_test(struct dc_link *link,
 			struct dc_link_settings *link_setting,
 			bool skip_video_pattern)
 {
@@ -585,7 +585,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
 	}
 }
 
-void dc_link_dp_handle_automated_test(struct dc_link *link)
+void dp_handle_automated_test(struct dc_link *link)
 {
 	union test_request test_request;
 	union test_response test_response;
@@ -651,7 +651,7 @@ void dc_link_dp_handle_automated_test(struct dc_link *link)
 			sizeof(test_response));
 }
 
-bool dc_link_dp_set_test_pattern(
+bool dp_set_test_pattern(
 	struct dc_link *link,
 	enum dp_test_pattern test_pattern,
 	enum dp_test_pattern_color_space test_pattern_color_space,
@@ -941,28 +941,9 @@ bool dc_link_dp_set_test_pattern(
 	return true;
 }
 
-void dc_link_set_drive_settings(struct dc *dc,
-				struct link_training_settings *lt_settings,
-				const struct dc_link *link)
-{
-
-	int i;
-	struct link_resource link_res;
-
-	for (i = 0; i < dc->link_count; i++)
-		if (dc->links[i] == link)
-			break;
-
-	if (i >= dc->link_count)
-		ASSERT_CRITICAL(false);
-
-	link_get_cur_link_res(link, &link_res);
-	dp_set_drive_settings(dc->links[i], &link_res, lt_settings);
-}
-
-void dc_link_set_preferred_link_settings(struct dc *dc,
-					 struct dc_link_settings *link_setting,
-					 struct dc_link *link)
+void dp_set_preferred_link_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link *link)
 {
 	int i;
 	struct pipe_ctx *pipe;
@@ -1001,11 +982,11 @@ void dc_link_set_preferred_link_settings(struct dc *dc,
 		dp_retrain_link_dp_test(link, &store_settings, false);
 }
 
-void dc_link_set_preferred_training_settings(struct dc *dc,
-						 struct dc_link_settings *link_setting,
-						 struct dc_link_training_overrides *lt_overrides,
-						 struct dc_link *link,
-						 bool skip_immediate_retrain)
+void dp_set_preferred_training_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link_training_overrides *lt_overrides,
+		struct dc_link *link,
+		bool skip_immediate_retrain)
 {
 	if (lt_overrides != NULL)
 		link->preferred_training_settings = *lt_overrides;
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h
index 7f17838b653b..eae23ea7f6ec 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h
@@ -25,9 +25,20 @@
 #ifndef __LINK_DP_CTS_H__
 #define __LINK_DP_CTS_H__
 #include "link.h"
-
-void dp_retrain_link_dp_test(struct dc_link *link,
+void dp_handle_automated_test(struct dc_link *link);
+bool dp_set_test_pattern(
+		struct dc_link *link,
+		enum dp_test_pattern test_pattern,
+		enum dp_test_pattern_color_space test_pattern_color_space,
+		const struct link_training_settings *p_link_settings,
+		const unsigned char *p_custom_pattern,
+		unsigned int cust_pattern_size);
+void dp_set_preferred_link_settings(struct dc *dc,
 		struct dc_link_settings *link_setting,
-		bool skip_video_pattern);
-
+		struct dc_link *link);
+void dp_set_preferred_training_settings(struct dc *dc,
+		struct dc_link_settings *link_setting,
+		struct dc_link_training_overrides *lt_overrides,
+		struct dc_link *link,
+		bool skip_immediate_retrain);
 #endif /* __LINK_DP_CTS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
index 459b362ed374..277fe9137a97 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
@@ -37,7 +37,7 @@ void dp_trace_reset(struct dc_link *link)
 	memset(&link->dp_trace, 0, sizeof(link->dp_trace));
 }
 
-bool dc_dp_trace_is_initialized(struct dc_link *link)
+bool dp_trace_is_initialized(struct dc_link *link)
 {
 	return link->dp_trace.is_initialized;
 }
@@ -76,7 +76,7 @@ void dp_trace_lt_total_count_increment(struct dc_link *link,
 		link->dp_trace.commit_lt_trace.counts.total++;
 }
 
-void dc_dp_trace_set_is_logged_flag(struct dc_link *link,
+void dp_trace_set_is_logged_flag(struct dc_link *link,
 		bool in_detection,
 		bool is_logged)
 {
@@ -86,8 +86,7 @@ void dc_dp_trace_set_is_logged_flag(struct dc_link *link,
 		link->dp_trace.commit_lt_trace.is_logged = is_logged;
 }
 
-bool dc_dp_trace_is_logged(struct dc_link *link,
-		bool in_detection)
+bool dp_trace_is_logged(struct dc_link *link, bool in_detection)
 {
 	if (in_detection)
 		return link->dp_trace.detect_lt_trace.is_logged;
@@ -123,7 +122,7 @@ void dp_trace_set_lt_end_timestamp(struct dc_link *link,
 		link->dp_trace.commit_lt_trace.timestamps.end = dm_get_timestamp(link->dc->ctx);
 }
 
-unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
+unsigned long long dp_trace_get_lt_end_timestamp(struct dc_link *link,
 		bool in_detection)
 {
 	if (in_detection)
@@ -132,7 +131,7 @@ unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
 		return link->dp_trace.commit_lt_trace.timestamps.end;
 }
 
-struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
+const struct dp_trace_lt_counts *dp_trace_get_lt_counts(struct dc_link *link,
 		bool in_detection)
 {
 	if (in_detection)
@@ -141,7 +140,7 @@ struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
 		return &link->dp_trace.commit_lt_trace.counts;
 }
 
-unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link)
+unsigned int dp_trace_get_link_loss_count(struct dc_link *link)
 {
 	return link->dp_trace.link_loss_count;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
index 89feea1b2692..9a0aff81a251 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
@@ -28,7 +28,7 @@
 
 void dp_trace_init(struct dc_link *link);
 void dp_trace_reset(struct dc_link *link);
-bool dc_dp_trace_is_initialized(struct dc_link *link);
+bool dp_trace_is_initialized(struct dc_link *link);
 void dp_trace_detect_lt_init(struct dc_link *link);
 void dp_trace_commit_lt_init(struct dc_link *link);
 void dp_trace_link_loss_increment(struct dc_link *link);
@@ -37,10 +37,10 @@ void dp_trace_lt_fail_count_update(struct dc_link *link,
 		bool in_detection);
 void dp_trace_lt_total_count_increment(struct dc_link *link,
 		bool in_detection);
-void dc_dp_trace_set_is_logged_flag(struct dc_link *link,
+void dp_trace_set_is_logged_flag(struct dc_link *link,
 		bool in_detection,
 		bool is_logged);
-bool dc_dp_trace_is_logged(struct dc_link *link,
+bool dp_trace_is_logged(struct dc_link *link,
 		bool in_detection);
 void dp_trace_lt_result_update(struct dc_link *link,
 		enum link_training_result result,
@@ -49,10 +49,10 @@ void dp_trace_set_lt_start_timestamp(struct dc_link *link,
 		bool in_detection);
 void dp_trace_set_lt_end_timestamp(struct dc_link *link,
 		bool in_detection);
-unsigned long long dc_dp_trace_get_lt_end_timestamp(struct dc_link *link,
+unsigned long long dp_trace_get_lt_end_timestamp(struct dc_link *link,
 		bool in_detection);
-struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
+const struct dp_trace_lt_counts *dp_trace_get_lt_counts(struct dc_link *link,
 		bool in_detection);
-unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link);
+unsigned int dp_trace_get_link_loss_count(struct dc_link *link);
 
 #endif /* __LINK_DP_TRACE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index aeb26a4d539e..88fbd04e92f2 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -27,6 +27,9 @@
  * This file owns the creation/destruction of link structure.
  */
 #include "link_factory.h"
+#include "accessories/link_dp_cts.h"
+#include "accessories/link_dp_trace.h"
+#include "accessories/link_fpga.h"
 #include "protocols/link_ddc.h"
 #include "protocols/link_edp_panel_control.h"
 #include "protocols/link_hpd.h"
@@ -39,6 +42,19 @@
 	DC_LOG_HW_HOTPLUG(  \
 		__VA_ARGS__)
 
+static struct link_service link_srv = {
+	.dp_handle_automated_test = dp_handle_automated_test,
+	.dp_set_test_pattern = dp_set_test_pattern,
+	.dp_set_preferred_link_settings = dp_set_preferred_link_settings,
+	.dp_set_preferred_training_settings = dp_set_preferred_training_settings,
+	.dp_trace_is_initialized = dp_trace_is_initialized,
+	.dp_trace_set_is_logged_flag = dp_trace_set_is_logged_flag,
+	.dp_trace_is_logged = dp_trace_is_logged,
+	.dp_trace_get_lt_end_timestamp = dp_trace_get_lt_end_timestamp,
+	.dp_trace_get_lt_counts = dp_trace_get_lt_counts,
+	.dp_trace_get_link_loss_count = dp_trace_get_link_loss_count,
+};
+
 static enum transmitter translate_encoder_to_transmitter(struct graphics_object_id encoder)
 {
 	switch (encoder.id) {
@@ -575,3 +591,7 @@ void link_destroy(struct dc_link **link)
 	*link = NULL;
 }
 
+const struct link_service *link_get_link_service(void)
+{
+	return &link_srv;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_resource.h b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
index 45554d30adf0..68dfbfc973cc 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
@@ -25,7 +25,4 @@
 #ifndef __LINK_RESOURCE_H__
 #define __LINK_RESOURCE_H__
 #include "link.h"
-void link_get_cur_link_res(const struct dc_link *link,
-		struct link_resource *link_res);
-
 #endif /* __LINK_RESOURCE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
index dba1f29df319..831ffd456291 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
@@ -44,11 +44,6 @@ void dp_set_hw_lane_settings(
 		const struct link_training_settings *link_settings,
 		uint32_t offset);
 
-void dp_set_drive_settings(
-	struct dc_link *link,
-	const struct link_resource *link_res,
-	struct link_training_settings *lt_settings);
-
 enum dc_status dp_set_fec_ready(struct dc_link *link,
 		const struct link_resource *link_res, bool ready);
 void dp_set_fec_enable(struct dc_link *link, bool enable);
-- 
2.34.1

