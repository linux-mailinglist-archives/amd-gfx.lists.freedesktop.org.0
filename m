Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBE910BCA
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2024 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F9D10EB06;
	Thu, 20 Jun 2024 16:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EcqKR3wo";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A18910EB06
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2024 16:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXP4tZPozBdxoIfgBIWl6cEgnCwtnKqgJnJyT5raXpkq817oo6FRSSEsEjvKhuGFIVKIt3cmFQiNrD1cDcEFB8V+nh6s8hE/J5rKujXmYYp+8zNkB9mX8KkZNBmGEtnZ2/AcFWkg2gTNmKKUYRqr4NVc6Fbe5qF/Lh+PWaPNXm9gGVSTTNnWzXC+IT1JPbeRa6Srd++XSpwIQzNaGd+iP1ce0T09zpeL2Lr1aubO3wpcK5LYNpNQxUfnfshL671XCSPBEtt7uILl877wiNksaJvb+EUDEaQ1gdkh7sLwvrrcMbsPVtC2Y6bVv5x390B1nxWduNcL6SDcJieejWewLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XROjbGZc1kcwGc3oTpz03f62tl3i71CNdISpqCAS70=;
 b=EpPRWd4lCtPi6hYhYclOMjCe0mlyrT2t+yXUSqabhh92cYltmlsVil0kBROyvrz7ycQQKXTLs9kczMdsczIgtKiVg4oLzA+RGTAP9ZbJUMp1D0mrFDyLA/Uy6GaHomkumJkSPaHpQXRouWn5s8MK4Lo8tAQ6exKQU7cV/vKNAshAd0h9IXG7fZGDFj58KRKzaS6GdJAoBnpp1z5S0OhntYt/KH33cd6gRy+o3aVLmJx7K8927yPO+AtWs3iqWNKSe+YaLyHeaOotgBzm+GvPfXUAEqG3doyfmXCUy9BnliwYlDV6md0b4dkFI4kuc3JV71Ti148jK+rw393Tutaxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XROjbGZc1kcwGc3oTpz03f62tl3i71CNdISpqCAS70=;
 b=EcqKR3wordW07gO5VkzbodX4lORJg4OzZAisZCBqDBPfR6PHE/ZX1hBmMkMMSS/dhLMgT59dKh/OSQDomWp/mY8alU3DcfOEal4sq8zL3ZQc+TGPCZ56VS29D2gCafwxcDjaDR2kOO7x5pQ7U4q0il6hTrOUoN0AbCeEViioZIY=
Received: from CH0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:610:119::27)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 16:17:10 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::3) by CH0PR03CA0361.outlook.office365.com
 (2603:10b6:610:119::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34 via Frontend
 Transport; Thu, 20 Jun 2024 16:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 16:17:09 +0000
Received: from 10.254.92.128.in-addr.arpa (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:17:03 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Dillon Varone <dillon.varone@amd.com>, Alvin Lee
 <alvin.lee2@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 21/39] drm/amd/display: Make DML2.1 P-State method force per
 stream
Date: Thu, 20 Jun 2024 10:11:27 -0600
Message-ID: <20240620161145.2489774-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620161145.2489774-1-alex.hung@amd.com>
References: <20240620161145.2489774-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d14a0be-c43a-4c6f-0e5f-08dc91446fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|82310400023|1800799021|36860700010; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jaMa8M9omZeL7sFdKrR684nyLDdNW4v6DnHz5kpf1Rg5NpACHZ2E9H5QlSU7?=
 =?us-ascii?Q?2DE0AEU0vvTtHkTGKii400tMcESg1hjnm+Z2BGVzTA7bMQ5tQI7ChwColdhJ?=
 =?us-ascii?Q?4txogkKXxrpLLs9jsbbFrun2aodBWVKkFE2vZyhTYGrwWg+C7ZmvyAM622LF?=
 =?us-ascii?Q?57cfFKMAlAaHVltkEOGK+TOi9MTtYkloIw5VNnxTkQfO0o0Wu9wkuoN6j+CB?=
 =?us-ascii?Q?3Xag4ddYIEC5F99QrmsEW0LxWbd+b+z7ySseS1IvOb8DgrC1TwlygRAcjiH7?=
 =?us-ascii?Q?7Xq4sO71H3x2lCIydVLqBqKs0AtnTlzqvEpBynzssshs8/qdWRWyzrlQZw/i?=
 =?us-ascii?Q?rdUs3UPHHJNjz9iwDkzO5Nr2X5IpJD697r3Y9EZzBhcJ7HrSEi54xEvRLt0G?=
 =?us-ascii?Q?koLbYXHP+UvymALgckyhMeBjwyCVtvjm1tic7hSvYyinbHaVxGZHJhWdFmCT?=
 =?us-ascii?Q?m3BUYbBHbrQRLE4vE06oZpPf5AJ9wnDj6OUV8fsfP41qeN/owrOd2OS7az8G?=
 =?us-ascii?Q?3WmkXhjhViLNzUQL7HGP5F42SBh54GONMlV+1Vd2Sdr+X5dPykyuM6jg0tUE?=
 =?us-ascii?Q?ttu9wlNAVtLP8vvf4DRpUR7BRyix1juXO3++rjkEzjTmehHMWu/1V8AdAj6j?=
 =?us-ascii?Q?zy0HgRT2s/O73QO0y/sL6loHOtik/Okd1+DbauCwNInfORXJjp13odzugT++?=
 =?us-ascii?Q?ZpT7XwE/dOZ8qlA79ON5EDqy1qJXlHb4wyw8RtnQE5e/pW8VQAnztGElAlKq?=
 =?us-ascii?Q?0yDgy90ZAQ0vwNHMfnCyQudkig3MRIyGHY2J27W9sswn1rbfp0uZ0kBrwULW?=
 =?us-ascii?Q?S6G0bIAz5i/CyOUWoHHxfHBxjgMFC4CKr7Opl+3U7a1x5umNeMqoz1LgqNu6?=
 =?us-ascii?Q?6bH2WANKyW1xkTiXNeGhuAer7YK7W8Ide8g1yr7VmVMPl+6JmzZp3HSvf+uW?=
 =?us-ascii?Q?gJpcM2gohy5XGTzDhunjlAyMkGvAyDztzkjMpEJ8fQQVKLPR7bpJ20kbalFj?=
 =?us-ascii?Q?PdJSRxW6Bwyifdil7vW/h/Q3TVU51p9GbAT6R69mgsH7C5vP05KoMNOoqhqm?=
 =?us-ascii?Q?C+vZfKE6NB1XPZ9RQeR4aiPPL1NbfOYr3a1bkrot3mB2f7EA4JVPM11vW9Dl?=
 =?us-ascii?Q?QZAZe0bMqSB2llE5w8syIi56P739YhD4/9d9Tt+qUK3Q86Vxq0JNZwAlFWJK?=
 =?us-ascii?Q?QG5228N4p8/T3SmEueDRPFMZviC9ylw4XOKtJl+44TkfPV+y+Mt/h/+ZLTXr?=
 =?us-ascii?Q?j4kWBP0zcsrVtcXPaY4qyxSX5gFf6V7/sX+ttye1749fTt/s+oGYD/XwPoMr?=
 =?us-ascii?Q?xWke2ljQyoRtfkByg6L61vhEfbow8J5pb5jJo7026eEP6iEHXQ4gk2dDVsxa?=
 =?us-ascii?Q?c6B7QbzO48qKOc0eGBfzGDnvmzB5kINwMFRy7C6UZ8mk6Rzm3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(82310400023)(1800799021)(36860700010); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:17:09.8630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d14a0be-c43a-4c6f-0e5f-08dc91446fcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749
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

From: Dillon Varone <dillon.varone@amd.com>

[WHY & HOW]
Currently the force only works for a single display, make it so it can
be forced per stream.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h                            | 2 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c      | 3 ++-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h             | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d0d1af451b64..e0334b573f2d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1038,7 +1038,7 @@ struct dc_debug_options {
 	bool force_chroma_subsampling_1tap;
 	bool disable_422_left_edge_pixel;
 	bool dml21_force_pstate_method;
-	uint32_t dml21_force_pstate_method_value;
+	uint32_t dml21_force_pstate_method_values[MAX_PIPES];
 	uint32_t dml21_disable_pstate_method_mask;
 	union dmub_fams2_global_feature_config fams2_config;
 	bool enable_legacy_clock_update;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index d5ead0205053..06387b8b0aee 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -1000,7 +1000,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 				/* apply forced pstate policy */
 				if (dml_ctx->config.pmo.force_pstate_method_enable) {
 					dml_dispcfg->plane_descriptors[disp_cfg_plane_location].overrides.uclk_pstate_change_strategy =
-							dml21_force_pstate_method_to_uclk_state_change_strategy(dml_ctx->config.pmo.force_pstate_method_value);
+							dml21_force_pstate_method_to_uclk_state_change_strategy(dml_ctx->config.pmo.force_pstate_method_values[stream_index]);
 				}
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index 9c28304568d2..c310354cd5fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -47,7 +47,8 @@ static void dml21_apply_debug_options(const struct dc *in_dc, struct dml2_contex
 	/* UCLK P-State options */
 	if (in_dc->debug.dml21_force_pstate_method) {
 		dml_ctx->config.pmo.force_pstate_method_enable = true;
-		dml_ctx->config.pmo.force_pstate_method_value = in_dc->debug.dml21_force_pstate_method_value;
+		for (int i = 0; i < MAX_PIPES; i++)
+			dml_ctx->config.pmo.force_pstate_method_values[i] = in_dc->debug.dml21_force_pstate_method_values[i];
 	} else {
 		dml_ctx->config.pmo.force_pstate_method_enable = false;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 79bf2d757804..1e891a3297c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -230,7 +230,7 @@ struct dml2_configuration_options {
 	struct socbb_ip_params_external *external_socbb_ip_params;
 	struct {
 		bool force_pstate_method_enable;
-		enum dml2_force_pstate_methods force_pstate_method_value;
+		enum dml2_force_pstate_methods force_pstate_method_values[MAX_PIPES];
 	} pmo;
 	bool map_dc_pipes_with_callbacks;
 
-- 
2.34.1

