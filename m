Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECAC4211CA
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Oct 2021 16:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328DA6EA0A;
	Mon,  4 Oct 2021 14:44:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A036EA0C
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Oct 2021 14:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcdGhkAOsZiQLr3yqVixrmhmDinyvl/VsG2/bx8XW01Est6qjBgpmHsY48tm4A6FP3fcjRREh0ER+IFufh2tLqTE6sjHbaVxQ9Ma2D2GxBf+J7fG1Nh+c8TMz5FIeqpjAI8aa/Sj9L4J773p7mRCmiDND/V8SkHHqX/KrTL4U9d+tJ9FI94AczFDCODelOldDgpDbqfbb8V6LdaQVLG8MPd2cDQmLy0qJFPxZn9zwUXE0eZIOpzWb22GF30IjwP7dk7abEFuJgEQXWK3cbfwEe6JSSSemFQ23tlut9rfU5EYtIpY0ahY0/L78lUgurt/hmVE3WSQoaYnVYj2Jf2Dew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d28hGITk++Y03Hu/M9dwIrUgVOhDkJatOO0zCvQmEhA=;
 b=Qj0I3cMs9fr190Kh9OEbm0rsNRxcXbjDOhLvNJGCYUkVd1xFlPy8+VL9MLwdlGCNW0PYa5IBx8gkqyrZ5kpni5/J/W326osJplMgxHFUbZSHlCkjdm1kTQ+WzCU+BLhNPvx5j8UZ+HCa4S9DDluB9wUmsZfDLsFARGU94Kl5a9as49rNUg53MayaO9SM2CgPricewr8GqcslGBfbpmixYDJ97LPleNGoW0cI8L2WsaIO3C5gFf8GkxxCE3HcMVqckHzSgqd1Lg6UJTgkL7wVqFvtJ+ElyCy1A7XlY/ylTX5bvRorhaJ4/A4E6pabX7xe0JrREfuGNPiZk5cpHhz4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28hGITk++Y03Hu/M9dwIrUgVOhDkJatOO0zCvQmEhA=;
 b=iWmca7HEmdtXR0YeUEnbPsM738BW/mKqw5J9fbje2vdJ2u2xxjjEKp1H50aeHzaVS0xrgJKLtFGDC7L89Tjj8AWkCIeSCZ6NqIGxWMFnkoWKJFcTC52WF/z2vGsLC4g47AKeQY0oJFM6G2QTAoxRBNRd7v6pad5DVSGSzmgV+BU=
Received: from MWHPR17CA0091.namprd17.prod.outlook.com (2603:10b6:300:c2::29)
 by BY5PR12MB5543.namprd12.prod.outlook.com (2603:10b6:a03:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 14:44:35 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::57) by MWHPR17CA0091.outlook.office365.com
 (2603:10b6:300:c2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Mon, 4 Oct 2021 14:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Mon, 4 Oct 2021 14:44:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 4 Oct 2021
 09:44:33 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Mon, 4 Oct 2021 09:44:20 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <Harry.Wentland@amd.com>,
 <nicholas.kazlauskas@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <wayne.lin@amd.com>, <stylon.wang@amd.com>, <jude.shih@amd.com>,
 <jimmy.kizito@amd.com>, <meenakshikumar.somasundaram@amd.com>, Jimmy Kizito
 <Jimmy.Kizito@amd.com>, Jun Lei <Jun.Lei@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH 15/23] drm/amd/display: Read USB4 DP tunneling data from DPCD
Date: Mon, 4 Oct 2021 22:40:42 +0800
Message-ID: <20211004144050.3425351-16-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004144050.3425351-1-Wayne.Lin@amd.com>
References: <20211004144050.3425351-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5de343-4607-4a14-dc16-08d987457be2
X-MS-TrafficTypeDiagnostic: BY5PR12MB5543:
X-Microsoft-Antispam-PRVS: <BY5PR12MB55430C87EA4FE45F40684C9AFCAE9@BY5PR12MB5543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQq0AfpJkgChl4aEgYealRMUcFVIigV2yXykDOz1GAGebwAG+Y4Bt+svn39kq8G4XD+/r9aJVqyq7CAEoAnyShsaLBsNSDNJdDl2qzUzhDFgV0UmXv2zlGw6k6VkjtT2WmARIR1ZDcUmgCgdRIw7slNLB8s8+rpppWwJBxuVrBjI7ku1LTUGXj/sKgOaJhf5xFBKcCEgJDUZvWQNwqhIZBlDyWSlDV7M+OFsTSK80qu4sDtmfL7J7F+WZU3yEOuDk9tMXEvSnGOh+POLJeMHApHsAcwI6PgfLkRiprF1g6M0E09UyJTvpMq9oAn3brrtCREV/GLA0siFV2b0KeS2MTZRxC61Y961wPtwd7/zOeS7UplU/qg7rFlBk5QfZIkWpUAx12MySi5371wauh0nVs6Eg3TpaLXNk1PrDONJ4EpSX6w8T04TMNOZoNpYoSAIFISHmiDFv6U1G/WOqTX93Cg497BIq9BY2c7j5lvuJf4TJVMPCJPMSaNXqMos3U10pP2wQ1b6MAbrxCcpj5oZZzSLf+tDwaUS8EKWvydrRoldlgpDttjyGw2lf3MXvB2t1cDG/bBeXiVeRdghWWAt7YEQJvWt+rNivJrJ0McJjM5NNCmCzO7AKmaafoNR21G8WIY+0y4UGYCGwBSinKGHB/O1i/ra36WLaWKqXmP6NqTtRLllEKiog9T8E215X1sHzTCjiSyR+9mG9kNSAmkxH7QpounnLypH1Hi568GW+JE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(70206006)(2906002)(336012)(6666004)(66574015)(426003)(508600001)(86362001)(36756003)(2616005)(4326008)(47076005)(186003)(83380400001)(8936002)(70586007)(26005)(82310400003)(5660300002)(7696005)(1076003)(54906003)(8676002)(356005)(6916009)(316002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 14:44:34.9044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5de343-4607-4a14-dc16-08d987457be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5543
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

From: Jimmy Kizito <Jimmy.Kizito@amd.com>

[Why]
We requires information from DPCD in order to identify USB4 DP
tunneling targets.

[How]
Add USB4 DP tunneling fields to DPCD struct and populate these fields
during sink detection.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Jimmy Kizito <Jimmy.Kizito@amd.com>
---
 .../drm/amd/display/dc/core/dc_link_dpia.c    | 29 +++++++++++++++--
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  | 31 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/inc/dc_link_dpia.h |  7 +++++
 4 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
index a7fc60565bda..fb0d8b8a840a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
@@ -33,14 +33,39 @@
 #include "inc/link_dpcd.h"
 #include "dm_helpers.h"
 #include "dmub/inc/dmub_cmd.h"
+#include "inc/link_dpcd.h"
 
 #define DC_LOGGER \
 	link->ctx->logger
 
 enum dc_status dpcd_get_tunneling_device_data(struct dc_link *link)
 {
-	/** @todo Read corresponding DPCD region and update link caps. */
-	return DC_OK;
+	enum dc_status status = DC_OK;
+	uint8_t dpcd_dp_tun_data[3] = {0};
+	uint8_t dpcd_topology_data[DPCD_USB4_TOPOLOGY_ID_LEN] = {0};
+	uint8_t i = 0;
+
+	status = core_link_read_dpcd(link,
+			DP_TUNNELING_CAPABILITIES_SUPPORT,
+			dpcd_dp_tun_data,
+			sizeof(dpcd_dp_tun_data));
+
+	status = core_link_read_dpcd(link,
+			DP_USB4_ROUTER_TOPOLOGY_ID,
+			dpcd_topology_data,
+			sizeof(dpcd_topology_data));
+
+	link->dpcd_caps.usb4_dp_tun_info.dp_tun_cap.raw =
+			dpcd_dp_tun_data[DP_TUNNELING_CAPABILITIES_SUPPORT - DP_TUNNELING_CAPABILITIES_SUPPORT];
+	link->dpcd_caps.usb4_dp_tun_info.dpia_info.raw =
+			dpcd_dp_tun_data[DP_IN_ADAPTER_INFO - DP_TUNNELING_CAPABILITIES_SUPPORT];
+	link->dpcd_caps.usb4_dp_tun_info.usb4_driver_id =
+			dpcd_dp_tun_data[DP_USB4_DRIVER_ID - DP_TUNNELING_CAPABILITIES_SUPPORT];
+
+	for (i = 0; i < DPCD_USB4_TOPOLOGY_ID_LEN; i++)
+		link->dpcd_caps.usb4_dp_tun_info.usb4_topology_id[i] = dpcd_topology_data[i];
+
+	return status;
 }
 
 /* Configure link as prescribed in link_setting; set LTTPR mode; and
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 082706c921af..c6b5d4535cb4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1187,6 +1187,7 @@ struct dpcd_caps {
 	struct dpcd_dsc_capabilities dsc_caps;
 	struct dc_lttpr_caps lttpr_caps;
 	struct psr_caps psr_caps;
+	struct dpcd_usb4_dp_tunneling_info usb4_dp_tun_info;
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	union dp_128b_132b_supported_link_rates dp_128b_132b_supported_link_rates;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index a5e798b5da79..4f939578c739 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -859,6 +859,37 @@ struct psr_caps {
 	bool psr_exit_link_training_required;
 };
 
+/* Length of router topology ID read from DPCD in bytes. */
+#define DPCD_USB4_TOPOLOGY_ID_LEN 5
+
+/* DPCD[0xE000D] DP_TUNNELING_CAPABILITIES SUPPORT register. */
+union dp_tun_cap_support {
+	struct {
+		uint8_t dp_tunneling :1;
+		uint8_t rsvd :5;
+		uint8_t panel_replay_tun_opt :1;
+		uint8_t dpia_bw_alloc :1;
+	} bits;
+	uint8_t raw;
+};
+
+/* DPCD[0xE000E] DP_IN_ADAPTER_INFO register. */
+union dpia_info {
+	struct {
+		uint8_t dpia_num :5;
+		uint8_t rsvd :3;
+	} bits;
+	uint8_t raw;
+};
+
+/* DP Tunneling over USB4 */
+struct dpcd_usb4_dp_tunneling_info {
+	union dp_tun_cap_support dp_tun_cap;
+	union dpia_info dpia_info;
+	uint8_t usb4_driver_id;
+	uint8_t usb4_topology_id[DPCD_USB4_TOPOLOGY_ID_LEN];
+};
+
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #define DP_MAIN_LINK_CHANNEL_CODING_CAP			0x006
 #define DP_SINK_VIDEO_FALLBACK_FORMATS			0x020
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
index 76b6b1e23575..790b904e37e1 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
@@ -34,6 +34,13 @@ struct dc_link_settings;
 /* The approximate time (us) it takes to transmit 9 USB4 DP clock sync packets. */
 #define DPIA_CLK_SYNC_DELAY 16000
 
+/** @note Can remove once DP tunneling registers in upstream include/drm/drm_dp_helper.h */
+/* DPCD DP Tunneling over USB4 */
+#define DP_TUNNELING_CAPABILITIES_SUPPORT 0xe000d
+#define DP_IN_ADAPTER_INFO                0xe000e
+#define DP_USB4_DRIVER_ID                 0xe000f
+#define DP_USB4_ROUTER_TOPOLOGY_ID        0xe001b
+
 /* SET_CONFIG message types sent by driver. */
 enum dpia_set_config_type {
 	DPIA_SET_CFG_SET_LINK = 0x01,
-- 
2.25.1

