Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7992D942
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2024 21:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77D910E8A2;
	Wed, 10 Jul 2024 19:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="decV/KG4";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661310E89C
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2024 19:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON6eOR2etDokTaHV+drMPEmPfXhEN4Qzwi0ofhVZezcoMIdR+AhVTwzjGcAvAcq2jCUsvNLR+oNJlCyFzc1bSlRAt9zKypNj+Nbd6vzgxZxdSpxDJKs6kXRI8YflCUqg+X0xn91aDDCj/K0mTod81+Zl8uto0W1qwHZfbR4evCPh8grD7LmQVmXO86DrCgUQOgCm1bri5qfks65U8z6LY5swDOcMMgcjThntmWTGjJD9y4Wlc/nmSVPwOfWLPtibh/NtlAmdua7BJXv2KcDWKsiYF4hv/ckeKyhTc57NBQhsF8ICmcpeDbST4Qrlm8WnPKKZgWdKr8fUsVd8xSYHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPpb9fMV4cYbs9AigTXsv+tT/lh2rt4iad2dK30ki0g=;
 b=MPRnpBAwgSITNm1lZ6bqJonNv+8XI/cjP+hSsfhLorwqyWO+5HMVDkBnCk++/1zHTDknDFnCBSPuxf1gZBkl2HvBIX0B8IcUCSiFldlpaFdIOApWWUh9JIPjmyFfi4xr5NrxH0LLUKiQwtAkcSyEWDWU/1XSZ/jADneGlJrxsCwrZKdQ4zUueTPGJFIxvGesdf6OHl0xWHtSQoNTn1/P93AcbynzjXMHnQx/MjoYAxswSWHCB9wPfvMvB8yzRykJmUDgdxNyWggiq/fnSg+IsPCbAmDrXDgDudeSEH60NeNhVfupds1X5xx9UwFJVXBFalUPcA9Ro1F1pzwMR59jzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPpb9fMV4cYbs9AigTXsv+tT/lh2rt4iad2dK30ki0g=;
 b=decV/KG4ytIytgEbHmlHL+Gr/MaQEecmUMEgvf7yWyov1TpsRvA67+C8UGtxWR3vMsHOxfFIO4BTVypOYrkasMEyEueo/+7UQCkRqLQrxbDQadT5lZl33fmu+9ZUzEnVFRutca5Kwr0AY1fypG6z2Bgtw0VtktF/tLi7kDNLFxQ=
Received: from BL1P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::22)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 19:37:29 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::f3) by BL1P221CA0006.outlook.office365.com
 (2603:10b6:208:2c5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Wed, 10 Jul 2024 19:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 19:37:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 14:37:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 14:37:26 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 14:37:26 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Samson Tam <samson.tam@amd.com>, Jun Lei
 <jun.lei@amd.com>
Subject: [PATCH 03/50] drm/amd/display: quality improvements for EASF and
 ISHARP
Date: Wed, 10 Jul 2024 15:36:20 -0400
Message-ID: <20240710193707.43754-4-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710193707.43754-1-Jerry.Zuo@amd.com>
References: <20240710193707.43754-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7054b5-1da0-4ff2-ed6e-08dca117bc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lrpv5JCE/x44qTZPpyjO3Zm4LFf3Sl19dEa5cNSCD+q1VsCUKMSiWi4H5okw?=
 =?us-ascii?Q?LOYhMRBBd1gyzaqx4S7RJ2PT6Ik0O8B8pQYmNZqbJLJ6R/CtSAK6qtD0POU9?=
 =?us-ascii?Q?v+cSAimQT7BXMvewOdiJZLI9lD5bQHGcb+wQfgfbDIjVNAt4CwQ3sIjVG8XU?=
 =?us-ascii?Q?0qhehJd7ngMVaX4QhwHY6TIBIUDpshZ9vlpEJzvSdFBU1xk4vjYDh2lFI1rv?=
 =?us-ascii?Q?1W3MdfoQNCFkrU1dKWc+Fq5NERLL2mwLDmRkwbURvvHPJ17X1v6t/7GbgvLS?=
 =?us-ascii?Q?uEdtCwlbyS++SdHZdhYYA7mkydMGk5MLSUSncn6S9ILC7qWyB3Cks0EzDeix?=
 =?us-ascii?Q?pYeUyUt3sAumjTHxn+U115PC/gGP41e+RBJE095KECnfSfWXi3/XdQWgKF1E?=
 =?us-ascii?Q?OGhf5V/Nz8L0EV6ZwrTcaLOddlPaZoU/+t/mckKh7kv5bxHGDsav9G+0466Z?=
 =?us-ascii?Q?QL69BYHsv37D7iCN6sHeI4fbnhomBi08Kvc5QFpZW6qpfAp/jj0DuZPyymFx?=
 =?us-ascii?Q?6/uqVYpPqdbLs8ASo/VAAcHxWoerLpvlVbgtQoP7ejY+qB2xk4u7qsQ4xTGz?=
 =?us-ascii?Q?PgcMiPVjUds0IuNnnpbJL6oEai5TC5X+C8QdVrlbuOi8QjgnUA3YVXEpr/B/?=
 =?us-ascii?Q?XAdcCbHKHbx3q7+EfgXfkVkKWXUwBww0kgo0M6sc/uUn6IEeyk7eJS7qRd4h?=
 =?us-ascii?Q?OxglxurfD3tUauT/by20dwkPMpNvqLZ3soFOWn8FPzRk4VEN+G1hLhWnj+Wj?=
 =?us-ascii?Q?zdFQ0YKR2I+5bDpLXoQBaxaX1CFnJRhYn8Xlnkwgr28q6ug81/wPD/FusSFZ?=
 =?us-ascii?Q?qAH845Wb/EMAs1RNJAjA/WKEjqtoLY51yVIMJ39bpyyXx/TDk+gEZPelJCPY?=
 =?us-ascii?Q?4l5ugMB283ri6MK0injZDvqR2CtubO5vppcJpyQsBpX50FRjtbt9D6ZtxaqH?=
 =?us-ascii?Q?yV0evJk48lT328JpiZg7LTQnRuQR3ZMFB7ukDicwLF3e8j3WDQVtzM3DMBpX?=
 =?us-ascii?Q?PjZSQGC2kaeLz8pybF9+JloGmz1Ilhc/NBJqAh2TGi1BGGi4O73OqKUAuc7g?=
 =?us-ascii?Q?JzxSSjaZGFKUXNZxqLikLCvYPSDUWOYzasPwrmxme+ZWoBXsaLnQbS5c6QXk?=
 =?us-ascii?Q?hsfm4pcgTAObmJSEnwF6PRlAsSWpudfNj/6BpcX5xLIEPJv+HK5SmdD2yhlS?=
 =?us-ascii?Q?8SewW+3slapt4POst7WwB4PskhGuFbJPu9HbgFGZM+Vv3atZw+mGzhTehotj?=
 =?us-ascii?Q?Lqow8q2pQmC/O+Jdx2pidXkm7cOc4y02FCrHM0T8xTZhCDLqUBG2xxXxYhCi?=
 =?us-ascii?Q?fepYvG9gRw2ysKObGQtzoQBIzCpcLzrDbWt3eXYG6bzxPj5Nh96gto857b5i?=
 =?us-ascii?Q?GbyFCNWysMb+2+8Uoz63OzJ2r22UJaLdvoJoMGpDtYrCMRcLZmJ/NTV0Gop+?=
 =?us-ascii?Q?jRZL8KjAS+JUpJXn9jZE7HoBQ3T+5p/V?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 19:37:29.2034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7054b5-1da0-4ff2-ed6e-08dca117bc3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

From: Samson Tam <samson.tam@amd.com>

[Why]
Update coefficients and LUT tables for scaler and sharpener
 to improve quality and support different use cases (SDR/HDR)

[How]
Move scaler coefficients to new file dc_spl_scl_easf_filters.c
Remove older coefficients file dc_sp_scl_filters_old.c
Update default taps for EASF support
Update LLS policy for DON'T CARE case
Update cositing offset from 0.5 to 0.25
Add support to adjust sharpness based on level, use case,
 and scaling ratio ( using discrete levels )
Apply sharpness to all RGB surfaces and both NV12 and P010
 video ( in fullscreen only ).  Upscale and 1:1 ratios only
Enable scaler when sharpening 1:1 ratios
Add support for coefficients that are in S1.10 format
 (convert to S1.12 format)

Reviewed-by: Jun Lei <jun.lei@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Samson Tam <samson.tam@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   12 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |    7 -
 .../gpu/drm/amd/display/dc/dc_spl_translate.c |    5 +
 .../gpu/drm/amd/display/dc/dc_spl_translate.h |    1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    3 +
 .../dc/dml2/dml21/dml21_translation_helper.c  |    8 +
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  540 +++---
 .../dc/resource/dcn401/dcn401_resource.c      |    7 +
 drivers/gpu/drm/amd/display/dc/spl/Makefile   |    2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   |  954 +++++----
 .../drm/amd/display/dc/spl/dc_spl_filters.c   |   15 +
 .../drm/amd/display/dc/spl/dc_spl_filters.h   |   15 +
 .../display/dc/spl/dc_spl_isharp_filters.c    |  427 +++-
 .../display/dc/spl/dc_spl_isharp_filters.h    |   33 +-
 .../display/dc/spl/dc_spl_scl_easf_filters.c  | 1725 +++++++++++++++++
 .../display/dc/spl/dc_spl_scl_easf_filters.h  |   38 +
 .../amd/display/dc/spl/dc_spl_scl_filters.c   |   26 +
 .../amd/display/dc/spl/dc_spl_scl_filters.h   |   39 +-
 .../gpu/drm/amd/display/dc/spl/dc_spl_types.h |   12 +
 19 files changed, 3160 insertions(+), 709 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b34301e4ab9b..cea3a16943c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1286,3 +1286,15 @@ enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
 
 	return as_type;
 }
+
+bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream)
+{
+	// TODO
+	return false;
+}
+
+bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream)
+{
+	// TODO
+	return false;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 959ae0df1e56..c10567ec1c81 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -763,13 +763,6 @@ enum scanning_type {
 	SCANNING_TYPE_UNDEFINED
 };
 
-enum chroma_cositing {
-	CHROMA_COSITING_NONE,
-	CHROMA_COSITING_LEFT,
-	CHROMA_COSITING_TOPLEFT,
-	CHROMA_COSITING_COUNT
-};
-
 struct dc_crtc_timing_flags {
 	uint32_t INTERLACE :1;
 	uint32_t HSYNC_POSITIVE_POLARITY :1; /* when set to 1,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
index 582606319764..49ff59258c8d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
@@ -170,6 +170,11 @@ void translate_SPL_in_params_from_pipe_ctx(struct pipe_ctx *pipe_ctx, struct spl
 	/* Translate transfer function */
 	spl_in->basic_in.tf_type = (enum spl_transfer_func_type) plane_state->in_transfer_func.type;
 	spl_in->basic_in.tf_predefined_type = (enum spl_transfer_func_predefined) plane_state->in_transfer_func.tf;
+	/* Check if it is stream is in fullscreen and if its HDR.
+	 * Use this to determine sharpness levels
+	 */
+	spl_in->is_fullscreen = dm_helpers_is_fullscreen(pipe_ctx->stream->ctx, pipe_ctx->stream);
+	spl_in->is_hdr_on = dm_helpers_is_hdr_on(pipe_ctx->stream->ctx, pipe_ctx->stream);
 
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
index c73d640c3632..eaa5c5373b28 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
@@ -6,6 +6,7 @@
 #define __DC_SPL_TRANSLATE_H__
 #include "dc.h"
 #include "resource.h"
+#include "dm_helpers.h"
 
 /* Map SPL input parameters to pipe context
  * @pipe_ctx: pipe context
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 34adae7ab6e8..2e4a46f1b499 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -210,4 +210,7 @@ enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
+bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
+bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
+
 #endif /* __DM_HELPERS__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 06387b8b0aee..a50fe3ec79c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -788,6 +788,14 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 		 * certain cases. Hence do corrective active and disable scaling.
 		 */
 		plane->composition.scaler_info.enabled = false;
+	} else if ((plane_state->ctx->dc->config.use_spl == true) &&
+		(plane->composition.scaler_info.enabled == false)) {
+		/* To enable sharpener for 1:1, scaler must be enabled.  If use_spl is set, then
+		 *  allow case where ratio is 1 but taps > 1
+		 */
+		if ((scaler_data->taps.h_taps > 1) || (scaler_data->taps.v_taps > 1) ||
+			(scaler_data->taps.h_taps_c > 1) || (scaler_data->taps.v_taps_c > 1))
+			plane->composition.scaler_info.enabled = true;
 	}
 
 	/* always_scale is only used for debug purposes not used in production but has to be
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index 505929800426..27cbda1cf8cf 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -656,274 +656,252 @@ static void dpp401_dscl_set_recout(struct dcn401_dpp *dpp,
 		  RECOUT_HEIGHT, recout->height);
 }
 /**
- * dpp401_dscl_program_easf - Program EASF
+ * dpp401_dscl_program_easf_v - Program EASF_V
  *
  * @dpp_base: High level DPP struct
  * @scl_data: scalaer_data info
  *
- * This is the primary function to program EASF
+ * This is the primary function to program vertical EASF registers
  *
  */
-static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
+static void dpp401_dscl_program_easf_v(struct dpp *dpp_base, const struct scaler_data *scl_data)
 {
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
 
 	PERF_TRACE();
-	REG_UPDATE(DSCL_SC_MODE,
-			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode);
-	REG_UPDATE(DSCL_SC_MODE,
-			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
 	/* DSCL_EASF_V_MODE */
-	REG_UPDATE(DSCL_EASF_V_MODE,
-			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
-	REG_UPDATE(DSCL_EASF_V_MODE,
-			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor);
-	REG_UPDATE(DSCL_EASF_V_MODE,
+	REG_SET_3(DSCL_EASF_V_MODE, 0,
+			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en,
+			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor,
 			SCL_EASF_V_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_v_ring);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
-			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain);
-	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
+
+	if (!scl_data->dscl_prog_data.easf_v_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* DSCL_EASF_V_BF_CNTL */
+	REG_SET_6(DSCL_EASF_V_BF_CNTL, 0,
+			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en,
+			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode,
+			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode,
+			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain,
+			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain,
 			SCL_EASF_V_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_v_bf2_roc_gain);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
-		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
+	/* DSCL_EASF_V_RINGEST_3TAP_CNTLn */
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL1, 0,
+		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT_MAXVAL, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt_max);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
-		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL2, 0,
+		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT1_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt1_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
-		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
+	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL3, 0,
+		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope,
 		SCL_EASF_V_RINGEST_3TAP_UPTILT2_OFFSET, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_offset);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
-		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
+	/* DSCL_EASF_V_RINGEST_EVENTAP_REDUCE */
+	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE, 0,
+		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1,
 		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg2);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
-		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1);
-	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
+	/* DSCL_EASF_V_RINGEST_EVENTAP_GAIN */
+	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_GAIN, 0,
+		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1,
 		SCL_EASF_V_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain2);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
-			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina);
-	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
+	/* DSCL_EASF_V_BF_FINAL_MAX_MIN */
+	REG_SET_4(DSCL_EASF_V_BF_FINAL_MAX_MIN, 0,
+			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa,
+			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb,
+			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina,
 			SCL_EASF_V_BF_MINB, scl_data->dscl_prog_data.easf_v_bf_minb);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
-			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
-			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
+	/* DSCL_EASF_V_BF1_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG0, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0,
+			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg0);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
-			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
-			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG1, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1,
+			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg1);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
-			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
-			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG2, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2,
+			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg2);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
-			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
-			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG3, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3,
+			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg3);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
-			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
-			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG4, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4,
+			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg4);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
-			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
-			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG5, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5,
+			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg5);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
-			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
-			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
+	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG6, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6,
+			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6,
 			SCL_EASF_V_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg6);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
-			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7);
-	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
+	REG_SET_2(DSCL_EASF_V_BF1_PWL_SEG7, 0,
+			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7,
 			SCL_EASF_V_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg7);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
-			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
-			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
+	/* DSCL_EASF_V_BF3_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG0, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0,
+			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set0);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
-			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
-			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG1, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1,
+			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set1);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
-			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
-			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG2, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2,
+			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set2);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
-			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
-			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG3, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3,
+			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set3);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
-			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
-			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG4, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4,
+			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4,
 			SCL_EASF_V_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set4);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
-			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5);
-	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
+	REG_SET_2(DSCL_EASF_V_BF3_PWL_SEG5, 0,
+			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5,
 			SCL_EASF_V_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set5);
+	PERF_TRACE();
+}
+/**
+ * dpp401_dscl_program_easf_h - Program EASF_H
+ *
+ * @dpp_base: High level DPP struct
+ * @scl_data: scalaer_data info
+ *
+ * This is the primary function to program horizontal EASF registers
+ *
+ */
+static void dpp401_dscl_program_easf_h(struct dpp *dpp_base, const struct scaler_data *scl_data)
+{
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+
+	PERF_TRACE();
 	/* DSCL_EASF_H_MODE */
-	REG_UPDATE(DSCL_EASF_H_MODE,
-			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
-	REG_UPDATE(DSCL_EASF_H_MODE,
-			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor);
-	REG_UPDATE(DSCL_EASF_H_MODE,
+	REG_SET_3(DSCL_EASF_H_MODE, 0,
+			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en,
+			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor,
 			SCL_EASF_H_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_h_ring);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
-			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain);
-	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
+
+	if (!scl_data->dscl_prog_data.easf_h_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* DSCL_EASF_H_BF_CNTL */
+	REG_SET_6(DSCL_EASF_H_BF_CNTL, 0,
+			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en,
+			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode,
+			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode,
+			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain,
+			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain,
 			SCL_EASF_H_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_h_bf2_roc_gain);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
-			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
+	/* DSCL_EASF_H_RINGEST_EVENTAP_REDUCE */
+	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE, 0,
+			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1,
 			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg2);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
-			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1);
-	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
+	/* DSCL_EASF_H_RINGEST_EVENTAP_GAIN */
+	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_GAIN, 0,
+			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1,
 			SCL_EASF_H_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain2);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
-			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina);
-	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
+	/* DSCL_EASF_H_BF_FINAL_MAX_MIN */
+	REG_SET_4(DSCL_EASF_H_BF_FINAL_MAX_MIN, 0,
+			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa,
+			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb,
+			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina,
 			SCL_EASF_H_BF_MINB, scl_data->dscl_prog_data.easf_h_bf_minb);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
-			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
-			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
+	/* DSCL_EASF_H_BF1_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG0, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0,
+			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg0);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
-			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
-			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG1, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1,
+			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg1);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
-			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
-			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG2, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2,
+			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg2);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
-			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
-			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG3, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3,
+			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg3);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
-			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
-			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG4, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4,
+			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg4);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
-			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
-			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG5, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5,
+			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg5);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
-			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
-			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
+	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG6, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6,
+			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6,
 			SCL_EASF_H_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg6);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
-			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7);
-	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
+	REG_SET_2(DSCL_EASF_H_BF1_PWL_SEG7, 0,
+			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7,
 			SCL_EASF_H_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg7);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
-			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
-			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
+	/* DSCL_EASF_H_BF3_PWL_SEGn */
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG0, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0,
+			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set0);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
-			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
-			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG1, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1,
+			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set1);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
-			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
-			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG2, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2,
+			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set2);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
-			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
-			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG3, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3,
+			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set3);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
-			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
-			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
+	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG4, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4,
+			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4,
 			SCL_EASF_H_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set4);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
-			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5);
-	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
+	REG_SET_2(DSCL_EASF_H_BF3_PWL_SEG5, 0,
+			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5,
 			SCL_EASF_H_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set5);
+	PERF_TRACE();
+}
+/**
+ * dpp401_dscl_program_easf - Program EASF
+ *
+ * @dpp_base: High level DPP struct
+ * @scl_data: scalaer_data info
+ *
+ * This is the primary function to program EASF
+ *
+ */
+static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
+{
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+
+	PERF_TRACE();
+	/* DSCL_SC_MODE */
+	REG_SET_2(DSCL_SC_MODE, 0,
+			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode,
+			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
 	/* DSCL_EASF_SC_MATRIX_C0C1, DSCL_EASF_SC_MATRIX_C2C3 */
-	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
-			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0);
-	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
+	REG_SET_2(DSCL_SC_MATRIX_C0C1, 0,
+			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0,
 			SCL_SC_MATRIX_C1, scl_data->dscl_prog_data.easf_matrix_c1);
-	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
-			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2);
-	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
+	REG_SET_2(DSCL_SC_MATRIX_C2C3, 0,
+			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2,
 			SCL_SC_MATRIX_C3, scl_data->dscl_prog_data.easf_matrix_c3);
+	dpp401_dscl_program_easf_v(dpp_base, scl_data);
+	dpp401_dscl_program_easf_h(dpp_base, scl_data);
 	PERF_TRACE();
 }
 /**
@@ -958,10 +936,11 @@ static void dpp401_dscl_set_isharp_filter(
 
 	REG_UPDATE(ISHARP_DELTA_CTRL,
 		ISHARP_DELTA_LUT_HOST_SELECT, 0);
+	/* LUT data write is auto-indexed.  Write index once */
+	REG_SET(ISHARP_DELTA_INDEX, 0,
+			ISHARP_DELTA_INDEX, 0);
 	for (level = 0; level < NUM_LEVELS; level++)	{
 		filter_data = filter[level];
-		REG_SET(ISHARP_DELTA_INDEX, 0,
-				ISHARP_DELTA_INDEX, level);
 		REG_SET(ISHARP_DELTA_DATA, 0,
 				ISHARP_DELTA_DATA, filter_data);
 	}
@@ -981,102 +960,67 @@ static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
 
 	PERF_TRACE();
-	/* ISHARP_EN */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
-	/* ISHARP_NOISEDET_EN */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable);
-	/* ISHARP_NOISEDET_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-	/* ISHARP_NOISEDET_UTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-	/* ISHARP_NOISEDET_DTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-	/* ISHARP_NOISEDET_UTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
-		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-	/* ISHARP_NOISEDET_DTHRE */
-	REG_UPDATE(ISHARP_NOISEDET_THRESHOLD,
+	/* ISHARP_MODE */
+	REG_SET_6(ISHARP_MODE, 0,
+		ISHARP_EN, scl_data->dscl_prog_data.isharp_en,
+		ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable,
+		ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode,
+		ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode,
+		ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode,
+		ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
+
+	/* Skip remaining register programming if ISHARP is disabled */
+	if (!scl_data->dscl_prog_data.isharp_en) {
+		PERF_TRACE();
+		return;
+	}
+
+	/* ISHARP_NOISEDET_THRESHOLD */
+	REG_SET_2(ISHARP_NOISEDET_THRESHOLD, 0,
+		ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold,
 		ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-	/* ISHARP_NOISEDET_PWL_START_IN */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
-		ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
-	/* ISHARP_NOISEDET_PWL_END_IN */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
-		ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
-	/* ISHARP_NOISEDET_PWL_SLOPE */
-	REG_UPDATE(ISHARP_NOISE_GAIN_PWL,
+
+	/* ISHARP_NOISE_GAIN_PWL */
+	REG_SET_3(ISHARP_NOISE_GAIN_PWL, 0,
+		ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in,
+		ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in,
 		ISHARP_NOISEDET_PWL_SLOPE, scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
-	/* ISHARP_LBA_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode);
+
 	/* ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG */
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
-		ISHARP_LBA_PWL_IN_SEG0, scl_data->dscl_prog_data.isharp_lba.in_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
-		ISHARP_LBA_PWL_BASE_SEG0, scl_data->dscl_prog_data.isharp_lba.base_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG0,
+	REG_SET_3(ISHARP_LBA_PWL_SEG0, 0,
+		ISHARP_LBA_PWL_IN_SEG0, scl_data->dscl_prog_data.isharp_lba.in_seg[0],
+		ISHARP_LBA_PWL_BASE_SEG0, scl_data->dscl_prog_data.isharp_lba.base_seg[0],
 		ISHARP_LBA_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.isharp_lba.slope_seg[0]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
-		ISHARP_LBA_PWL_IN_SEG1, scl_data->dscl_prog_data.isharp_lba.in_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
-		ISHARP_LBA_PWL_BASE_SEG1, scl_data->dscl_prog_data.isharp_lba.base_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG1,
+	REG_SET_3(ISHARP_LBA_PWL_SEG1, 0,
+		ISHARP_LBA_PWL_IN_SEG1, scl_data->dscl_prog_data.isharp_lba.in_seg[1],
+		ISHARP_LBA_PWL_BASE_SEG1, scl_data->dscl_prog_data.isharp_lba.base_seg[1],
 		ISHARP_LBA_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.isharp_lba.slope_seg[1]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
-		ISHARP_LBA_PWL_IN_SEG2, scl_data->dscl_prog_data.isharp_lba.in_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
-		ISHARP_LBA_PWL_BASE_SEG2, scl_data->dscl_prog_data.isharp_lba.base_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG2,
+	REG_SET_3(ISHARP_LBA_PWL_SEG2, 0,
+		ISHARP_LBA_PWL_IN_SEG2, scl_data->dscl_prog_data.isharp_lba.in_seg[2],
+		ISHARP_LBA_PWL_BASE_SEG2, scl_data->dscl_prog_data.isharp_lba.base_seg[2],
 		ISHARP_LBA_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.isharp_lba.slope_seg[2]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
-		ISHARP_LBA_PWL_IN_SEG3, scl_data->dscl_prog_data.isharp_lba.in_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
-		ISHARP_LBA_PWL_BASE_SEG3, scl_data->dscl_prog_data.isharp_lba.base_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG3,
+	REG_SET_3(ISHARP_LBA_PWL_SEG3, 0,
+		ISHARP_LBA_PWL_IN_SEG3, scl_data->dscl_prog_data.isharp_lba.in_seg[3],
+		ISHARP_LBA_PWL_BASE_SEG3, scl_data->dscl_prog_data.isharp_lba.base_seg[3],
 		ISHARP_LBA_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.isharp_lba.slope_seg[3]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
-		ISHARP_LBA_PWL_IN_SEG4, scl_data->dscl_prog_data.isharp_lba.in_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
-		ISHARP_LBA_PWL_BASE_SEG4, scl_data->dscl_prog_data.isharp_lba.base_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG4,
+	REG_SET_3(ISHARP_LBA_PWL_SEG4, 0,
+		ISHARP_LBA_PWL_IN_SEG4, scl_data->dscl_prog_data.isharp_lba.in_seg[4],
+		ISHARP_LBA_PWL_BASE_SEG4, scl_data->dscl_prog_data.isharp_lba.base_seg[4],
 		ISHARP_LBA_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.isharp_lba.slope_seg[4]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG5,
-		ISHARP_LBA_PWL_IN_SEG5, scl_data->dscl_prog_data.isharp_lba.in_seg[5]);
-	REG_UPDATE(ISHARP_LBA_PWL_SEG5,
+	REG_SET_2(ISHARP_LBA_PWL_SEG5, 0,
+		ISHARP_LBA_PWL_IN_SEG5, scl_data->dscl_prog_data.isharp_lba.in_seg[5],
 		ISHARP_LBA_PWL_BASE_SEG5, scl_data->dscl_prog_data.isharp_lba.base_seg[5]);
 
-	/* ISHARP_FMT_MODE */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode);
-	/* ISHARP_FMT_NORM */
-	REG_UPDATE(ISHARP_MODE,
-		ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
 	/* ISHARP_DELTA_LUT */
 	dpp401_dscl_set_isharp_filter(dpp, scl_data->dscl_prog_data.isharp_delta);
-	/* ISHARP_NLDELTA_SCLIP_EN_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
-	/* ISHARP_NLDELTA_SCLIP_PIVOT_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
-	/* ISHARP_NLDELTA_SCLIP_SLOPE_P */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
-	/* ISHARP_NLDELTA_SCLIP_EN_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
-	/* ISHARP_NLDELTA_SCLIP_PIVOT_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
-		ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
-	/* ISHARP_NLDELTA_SCLIP_SLOPE_N */
-	REG_UPDATE(ISHARP_NLDELTA_SOFT_CLIP,
+
+	/* ISHARP_NLDELTA_SOFT_CLIP */
+	REG_SET_6(ISHARP_NLDELTA_SOFT_CLIP, 0,
+		ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p,
+		ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p,
+		ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p,
+		ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n,
+		ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n,
 		ISHARP_NLDELTA_SCLIP_SLOPE_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
 
 	/* Blur and Scale Coefficients - SCL_COEF_RAM_TAP_SELECT */
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index a05a2209a44e..d3808c49d298 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -76,6 +76,9 @@
 
 #include "dml2/dml2_wrapper.h"
 
+#include "spl/dc_spl_scl_easf_filters.h"
+#include "spl/dc_spl_isharp_filters.h"
+
 #define DC_LOGGER_INIT(logger)
 
 enum dcn401_clk_src_array_id {
@@ -2123,6 +2126,10 @@ static bool dcn401_resource_construct(
 	dc->dml2_options.max_segments_per_hubp = 20;
 	dc->dml2_options.det_segment_size = DCN4_01_CRB_SEGMENT_SIZE_KB;
 
+	/* SPL */
+	spl_init_easf_filter_coeffs();
+	spl_init_blur_scale_coeffs();
+
 	return true;
 
 create_fail:
diff --git a/drivers/gpu/drm/amd/display/dc/spl/Makefile b/drivers/gpu/drm/amd/display/dc/spl/Makefile
index 89cad60b1a10..af7eaf839970 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/spl/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'spl' sub-component of DAL.
 # It provides the scaling library interface.
 
-SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_isharp_filters.o
+SPL = dc_spl.o dc_spl_scl_filters.o dc_spl_scl_easf_filters.o dc_spl_isharp_filters.o dc_spl_filters.o
 
 AMD_DAL_SPL = $(addprefix $(AMDDALPATH)/dc/spl/,$(SPL))
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index e3e20cd86af6..d3d45aa7e08d 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -5,6 +5,7 @@
 #include "dc_spl.h"
 #include "dc_spl_scl_filters.h"
 #include "dc_spl_isharp_filters.h"
+#include "dc_spl_scl_easf_filters.h"
 
 #define IDENTITY_RATIO(ratio) (dc_fixpt_u2d19(ratio) == (1 << 19))
 #define MIN_VIEWPORT_SIZE 12
@@ -352,6 +353,7 @@ static void spl_calculate_recout(struct spl_in *spl_in, struct spl_out *spl_out)
 		memset(&spl_out->scl_data.recout, 0,
 				sizeof(struct spl_rect));
 }
+
 /* Calculate scaling ratios */
 static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *spl_out)
 {
@@ -399,7 +401,22 @@ static void spl_calculate_scaling_ratios(struct spl_in *spl_in, struct spl_out *
 			spl_out->scl_data.ratios.horz_c, 19);
 	spl_out->scl_data.ratios.vert_c = dc_fixpt_truncate(
 			spl_out->scl_data.ratios.vert_c, 19);
+
+	/*
+	 * Coefficient table and some registers are different based on ratio
+	 * that is output/input.  Currently we calculate input/output
+	 * Store 1/ratio in recip_ratio for those lookups
+	 */
+	spl_out->scl_data.recip_ratios.horz = dc_fixpt_recip(
+			spl_out->scl_data.ratios.horz);
+	spl_out->scl_data.recip_ratios.vert = dc_fixpt_recip(
+			spl_out->scl_data.ratios.vert);
+	spl_out->scl_data.recip_ratios.horz_c = dc_fixpt_recip(
+			spl_out->scl_data.ratios.horz_c);
+	spl_out->scl_data.recip_ratios.vert_c = dc_fixpt_recip(
+			spl_out->scl_data.ratios.vert_c);
 }
+
 /* Calculate Viewport size */
 static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_out *spl_out)
 {
@@ -417,6 +434,7 @@ static void spl_calculate_viewport_size(struct spl_in *spl_in, struct spl_out *s
 		swap(spl_out->scl_data.viewport_c.width, spl_out->scl_data.viewport_c.height);
 	}
 }
+
 static void spl_get_vp_scan_direction(enum spl_rotation_angle rotation,
 			   bool horizontal_mirror,
 			   bool *orthogonal_rotation,
@@ -440,6 +458,7 @@ static void spl_get_vp_scan_direction(enum spl_rotation_angle rotation,
 	if (horizontal_mirror)
 		*flip_horz_scan_dir = !*flip_horz_scan_dir;
 }
+
 /*
  * We completely calculate vp offset, size and inits here based entirely on scaling
  * ratios and recout for pixel perfect pipe combine.
@@ -509,8 +528,8 @@ static void spl_calculate_init_and_vp(bool flip_scan_dir,
 
 static bool spl_is_yuv420(enum spl_pixel_format format)
 {
-	if ((format >= SPL_PIXEL_FORMAT_VIDEO_BEGIN) &&
-		(format <= SPL_PIXEL_FORMAT_VIDEO_END))
+	if ((format >= SPL_PIXEL_FORMAT_420BPP8) &&
+		(format <= SPL_PIXEL_FORMAT_420BPP10))
 		return true;
 
 	return false;
@@ -569,11 +588,11 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 
 		case CHROMA_COSITING_LEFT:
 			init_adj_h = dc_fixpt_zero;
-			init_adj_v = dc_fixpt_from_fraction(sign, 2);
+			init_adj_v = dc_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_NONE:
-			init_adj_h = dc_fixpt_from_fraction(sign, 2);
-			init_adj_v = dc_fixpt_from_fraction(sign, 2);
+			init_adj_h = dc_fixpt_from_fraction(sign, 4);
+			init_adj_v = dc_fixpt_from_fraction(sign, 4);
 			break;
 		case CHROMA_COSITING_TOPLEFT:
 		default:
@@ -639,6 +658,7 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in, struct spl_
 	spl_out->scl_data.viewport_c.x += src.x / vpc_div;
 	spl_out->scl_data.viewport_c.y += src.y / vpc_div;
 }
+
 static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
 {
 	/*
@@ -665,6 +685,7 @@ static void spl_clamp_viewport(struct spl_rect *viewport)
 	if (viewport->width < MIN_VIEWPORT_SIZE)
 		viewport->width = MIN_VIEWPORT_SIZE;
 }
+
 static bool spl_dscl_is_420_format(enum spl_pixel_format format)
 {
 	if (format == SPL_PIXEL_FORMAT_420BPP8 ||
@@ -673,6 +694,7 @@ static bool spl_dscl_is_420_format(enum spl_pixel_format format)
 	else
 		return false;
 }
+
 static bool spl_dscl_is_video_format(enum spl_pixel_format format)
 {
 	if (format >= SPL_PIXEL_FORMAT_VIDEO_BEGIN
@@ -681,17 +703,21 @@ static bool spl_dscl_is_video_format(enum spl_pixel_format format)
 	else
 		return false;
 }
+
 static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
-				const struct spl_scaler_data *data)
+				const struct spl_scaler_data *data,
+				bool enable_isharp, bool enable_easf)
 {
 	const long long one = dc_fixpt_one.value;
 	enum spl_pixel_format pixel_format = spl_in->basic_in.format;
 
+	/* Bypass if ratio is 1:1 with no ISHARP or force scale on */
 	if (data->ratios.horz.value == one
 			&& data->ratios.vert.value == one
 			&& data->ratios.horz_c.value == one
 			&& data->ratios.vert_c.value == one
-			&& !spl_in->basic_out.always_scale)
+			&& !spl_in->basic_out.always_scale
+			&& !enable_isharp)
 		return SCL_MODE_SCALING_444_BYPASS;
 
 	if (!spl_dscl_is_420_format(pixel_format)) {
@@ -700,65 +726,200 @@ static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
 		else
 			return SCL_MODE_SCALING_444_RGB_ENABLE;
 	}
-	if (data->ratios.horz.value == one && data->ratios.vert.value == one)
-		return SCL_MODE_SCALING_420_LUMA_BYPASS;
-	if (data->ratios.horz_c.value == one && data->ratios.vert_c.value == one)
-		return SCL_MODE_SCALING_420_CHROMA_BYPASS;
+
+	/* Bypass YUV if at 1:1 with no ISHARP or if doing 2:1 YUV
+	 *  downscale without EASF
+	 */
+	if ((!enable_isharp) && (!enable_easf)) {
+		if (data->ratios.horz.value == one && data->ratios.vert.value == one)
+			return SCL_MODE_SCALING_420_LUMA_BYPASS;
+		if (data->ratios.horz_c.value == one && data->ratios.vert_c.value == one)
+			return SCL_MODE_SCALING_420_CHROMA_BYPASS;
+	}
 
 	return SCL_MODE_SCALING_420_YCBCR_ENABLE;
 }
+
+static bool spl_choose_lls_policy(enum spl_pixel_format format,
+	enum spl_transfer_func_type tf_type,
+	enum spl_transfer_func_predefined tf_predefined_type,
+	enum linear_light_scaling *lls_pref)
+{
+	if (spl_is_yuv420(format)) {
+		*lls_pref = LLS_PREF_NO;
+		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
+			(tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
+			return true;
+	} else { /* RGB or YUV444 */
+		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
+			(tf_type == SPL_TF_TYPE_BYPASS)) {
+			*lls_pref = LLS_PREF_YES;
+			return true;
+		}
+	}
+	*lls_pref = LLS_PREF_NO;
+	return false;
+}
+
+/* Enable EASF ?*/
+static bool enable_easf(struct spl_in *spl_in, struct spl_out *spl_out)
+{
+	int vratio = 0;
+	int hratio = 0;
+	bool skip_easf = false;
+	bool lls_enable_easf = true;
+
+	/*
+	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format and transfer
+	 *  function to determine whether to use LINEAR or NONLINEAR scaling
+	 */
+	if (spl_in->lls_pref == LLS_PREF_DONT_CARE)
+		lls_enable_easf = spl_choose_lls_policy(spl_in->basic_in.format,
+			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
+			&spl_in->lls_pref);
+
+	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
+	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+
+	if (!lls_enable_easf || spl_in->disable_easf)
+		skip_easf = true;
+
+	/*
+	 * No EASF support for downscaling > 2:1
+	 * EASF support for upscaling or downscaling up to 2:1
+	 */
+	if ((vratio > 2) || (hratio > 2))
+		skip_easf = true;
+
+	/* Check for linear scaling or EASF preferred */
+	if (spl_in->lls_pref != LLS_PREF_YES && !spl_in->prefer_easf)
+		skip_easf = true;
+
+	return skip_easf;
+}
+
+/* Check if video is in fullscreen mode */
+static bool spl_is_video_fullscreen(struct spl_in *spl_in, struct spl_out *spl_out)
+{
+	if (spl_is_yuv420(spl_in->basic_in.format) && spl_in->is_fullscreen)
+		return true;
+	return false;
+}
+
+static bool spl_get_isharp_en(struct spl_in *spl_in,
+	struct spl_out *spl_out)
+{
+	bool enable_isharp = false;
+	int vratio = 0;
+	int hratio = 0;
+	struct spl_taps taps = spl_out->scl_data.taps;
+	bool fullscreen = spl_is_video_fullscreen(spl_in, spl_out);
+
+	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
+	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+
+	/* Return if adaptive sharpness is disabled */
+	if (spl_in->adaptive_sharpness.enable == false)
+		return enable_isharp;
+
+	/* No iSHARP support for downscaling */
+	if (vratio > 1 || hratio > 1)
+		return enable_isharp;
+
+	// Scaling is up to 1:1 (no scaling) or upscaling
+
+	/*
+	 * Apply sharpness to all RGB surfaces and to
+	 *  NV12/P010 surfaces if in fullscreen
+	 */
+	if (spl_is_yuv420(spl_in->basic_in.format) && !fullscreen)
+		return enable_isharp;
+
+	/*
+	 * Apply sharpness if supports horizontal taps 4,6 AND
+	 *  vertical taps 3, 4, 6
+	 */
+	if ((taps.h_taps == 4 || taps.h_taps == 6) &&
+		(taps.v_taps == 3 || taps.v_taps == 4 || taps.v_taps == 6))
+		enable_isharp = true;
+
+	return enable_isharp;
+}
+
 /* Calculate optimal number of taps */
 static bool spl_get_optimal_number_of_taps(
 	  int max_downscale_src_width, struct spl_in *spl_in, struct spl_out *spl_out,
-	  const struct spl_taps *in_taps)
+	  const struct spl_taps *in_taps, bool *enable_easf_v, bool *enable_easf_h,
+	  bool *enable_isharp)
 {
 	int num_part_y, num_part_c;
 	int max_taps_y, max_taps_c;
 	int min_taps_y, min_taps_c;
 	enum lb_memory_config lb_config;
+	bool skip_easf = false;
 
 	if (spl_out->scl_data.viewport.width > spl_out->scl_data.h_active &&
 		max_downscale_src_width != 0 &&
 		spl_out->scl_data.viewport.width > max_downscale_src_width)
 		return false;
+
+	/* Check if we are using EASF or not */
+	skip_easf = enable_easf(spl_in, spl_out);
+
 	/*
 	 * Set default taps if none are provided
 	 * From programming guide: taps = min{ ceil(2*H_RATIO,1), 8} for downscaling
 	 * taps = 4 for upscaling
 	 */
-	if (in_taps->h_taps == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz) > 1)
-			spl_out->scl_data.taps.h_taps = min(2 * dc_fixpt_ceil(spl_out->scl_data.ratios.horz), 8);
-		else
-			spl_out->scl_data.taps.h_taps = 4;
-	} else
-		spl_out->scl_data.taps.h_taps = in_taps->h_taps;
-	if (in_taps->v_taps == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 1)
-			spl_out->scl_data.taps.v_taps = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-							spl_out->scl_data.ratios.vert, 2)), 8);
-		else
-			spl_out->scl_data.taps.v_taps = 4;
-	} else
-		spl_out->scl_data.taps.v_taps = in_taps->v_taps;
-	if (in_taps->v_taps_c == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 1)
-			spl_out->scl_data.taps.v_taps_c = min(dc_fixpt_ceil(dc_fixpt_mul_int(
-							spl_out->scl_data.ratios.vert_c, 2)), 8);
-		else
-			spl_out->scl_data.taps.v_taps_c = 4;
-	} else
-		spl_out->scl_data.taps.v_taps_c = in_taps->v_taps_c;
-	if (in_taps->h_taps_c == 0) {
-		if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c) > 1)
-			spl_out->scl_data.taps.h_taps_c = min(2 * dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c), 8);
+	if (skip_easf) {
+		if (in_taps->h_taps == 0) {
+			if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz) > 1)
+				spl_out->scl_data.taps.h_taps = min(2 * dc_fixpt_ceil(
+					spl_out->scl_data.ratios.horz), 8);
+			else
+				spl_out->scl_data.taps.h_taps = 4;
+		} else
+			spl_out->scl_data.taps.h_taps = in_taps->h_taps;
+		if (in_taps->v_taps == 0) {
+			if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert) > 1)
+				spl_out->scl_data.taps.v_taps = min(dc_fixpt_ceil(dc_fixpt_mul_int(
+					spl_out->scl_data.ratios.vert, 2)), 8);
+			else
+				spl_out->scl_data.taps.v_taps = 4;
+		} else
+			spl_out->scl_data.taps.v_taps = in_taps->v_taps;
+		if (in_taps->v_taps_c == 0) {
+			if (dc_fixpt_ceil(spl_out->scl_data.ratios.vert_c) > 1)
+				spl_out->scl_data.taps.v_taps_c = min(dc_fixpt_ceil(dc_fixpt_mul_int(
+					spl_out->scl_data.ratios.vert_c, 2)), 8);
+			else
+				spl_out->scl_data.taps.v_taps_c = 4;
+		} else
+			spl_out->scl_data.taps.v_taps_c = in_taps->v_taps_c;
+		if (in_taps->h_taps_c == 0) {
+			if (dc_fixpt_ceil(spl_out->scl_data.ratios.horz_c) > 1)
+				spl_out->scl_data.taps.h_taps_c = min(2 * dc_fixpt_ceil(
+					spl_out->scl_data.ratios.horz_c), 8);
+			else
+				spl_out->scl_data.taps.h_taps_c = 4;
+		} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
+			/* Only 1 and even h_taps_c are supported by hw */
+			spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
 		else
+			spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c;
+	} else {
+		if (spl_is_yuv420(spl_in->basic_in.format)) {
+			spl_out->scl_data.taps.h_taps = 6;
+			spl_out->scl_data.taps.v_taps = 6;
 			spl_out->scl_data.taps.h_taps_c = 4;
-	} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
-		/* Only 1 and even h_taps_c are supported by hw */
-		spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c - 1;
-	else
-		spl_out->scl_data.taps.h_taps_c = in_taps->h_taps_c;
+			spl_out->scl_data.taps.v_taps_c = 4;
+		} else { /* RGB */
+			spl_out->scl_data.taps.h_taps = 6;
+			spl_out->scl_data.taps.v_taps = 6;
+			spl_out->scl_data.taps.h_taps_c = 6;
+			spl_out->scl_data.taps.v_taps_c = 6;
+		}
+	}
 
 	/*Ensure we can support the requested number of vtaps*/
 	min_taps_y = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
@@ -794,43 +955,103 @@ static bool spl_get_optimal_number_of_taps(
 
 	if (spl_out->scl_data.taps.v_taps_c > max_taps_c)
 		spl_out->scl_data.taps.v_taps_c = max_taps_c;
-	if (spl_in->prefer_easf)	{
-		// EASF can be enabled only for taps 3,4,6
-		// If optimal no of taps is 5, then set it to 4
-		// If optimal no of taps is 7 or 8, then set it to 6
+
+	if (!skip_easf) {
+		/*
+		 * RGB ( L + NL ) and Linear HDR support 6x6, 6x4, 6x3, 4x4, 4x3
+		 * NL YUV420 only supports 6x6, 6x4 for Y and 4x4 for UV
+		 *
+		 * If LB does not support 3, 4, or 6 taps, then disable EASF_V
+		 *  and only enable EASF_H.  So for RGB, support 6x2, 4x2
+		 *  and for NL YUV420, support 6x2 for Y and 4x2 for UV
+		 *
+		 * All other cases, have to disable EASF_V and EASF_H
+		 *
+		 * If optimal no of taps is 5, then set it to 4
+		 * If optimal no of taps is 7 or 8, then fine since max tap is 6
+		 *
+		 */
 		if (spl_out->scl_data.taps.v_taps == 5)
 			spl_out->scl_data.taps.v_taps = 4;
-		if (spl_out->scl_data.taps.v_taps == 7 || spl_out->scl_data.taps.v_taps == 8)
-			spl_out->scl_data.taps.v_taps = 6;
 
 		if (spl_out->scl_data.taps.v_taps_c == 5)
 			spl_out->scl_data.taps.v_taps_c = 4;
-		if (spl_out->scl_data.taps.v_taps_c == 7 || spl_out->scl_data.taps.v_taps_c == 8)
-			spl_out->scl_data.taps.v_taps_c = 6;
 
 		if (spl_out->scl_data.taps.h_taps == 5)
 			spl_out->scl_data.taps.h_taps = 4;
-		if (spl_out->scl_data.taps.h_taps == 7 || spl_out->scl_data.taps.h_taps == 8)
-			spl_out->scl_data.taps.h_taps = 6;
 
 		if (spl_out->scl_data.taps.h_taps_c == 5)
 			spl_out->scl_data.taps.h_taps_c = 4;
-		if (spl_out->scl_data.taps.h_taps_c == 7 || spl_out->scl_data.taps.h_taps_c == 8)
-			spl_out->scl_data.taps.h_taps_c = 6;
 
+		if (spl_is_yuv420(spl_in->basic_in.format)) {
+			if ((spl_out->scl_data.taps.h_taps <= 4) ||
+				(spl_out->scl_data.taps.h_taps_c <= 3)) {
+				*enable_easf_v = false;
+				*enable_easf_h = false;
+			} else if ((spl_out->scl_data.taps.v_taps <= 3) ||
+				(spl_out->scl_data.taps.v_taps_c <= 3)) {
+				*enable_easf_v = false;
+				*enable_easf_h = true;
+			} else {
+				*enable_easf_v = true;
+				*enable_easf_h = true;
+			}
+			ASSERT((spl_out->scl_data.taps.v_taps > 1) &&
+				(spl_out->scl_data.taps.v_taps_c > 1));
+		} else { /* RGB */
+			if (spl_out->scl_data.taps.h_taps <= 3) {
+				*enable_easf_v = false;
+				*enable_easf_h = false;
+			} else if (spl_out->scl_data.taps.v_taps < 3) {
+				*enable_easf_v = false;
+				*enable_easf_h = true;
+			} else {
+				*enable_easf_v = true;
+				*enable_easf_h = true;
+			}
+			ASSERT(spl_out->scl_data.taps.v_taps > 1);
+		}
+	} else {
+		*enable_easf_v = false;
+		*enable_easf_h = false;
 	} // end of if prefer_easf
-	if (!spl_in->basic_out.always_scale)	{
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz))
+
+	/* Sharpener requires scaler to be enabled, including for 1:1
+	 * Check if ISHARP can be enabled
+	 * If ISHARP is not enabled, for 1:1, set taps to 1 and disable
+	 *  EASF
+	 * For case of 2:1 YUV where chroma is 1:1, set taps to 1 if
+	 *  EASF is not enabled
+	 */
+
+	*enable_isharp = spl_get_isharp_en(spl_in, spl_out);
+	if (!*enable_isharp && !spl_in->basic_out.always_scale)	{
+		if ((IDENTITY_RATIO(spl_out->scl_data.ratios.horz)) &&
+			(IDENTITY_RATIO(spl_out->scl_data.ratios.vert))) {
 			spl_out->scl_data.taps.h_taps = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert))
 			spl_out->scl_data.taps.v_taps = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c))
-			spl_out->scl_data.taps.h_taps_c = 1;
-		if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c))
-			spl_out->scl_data.taps.v_taps_c = 1;
+
+			if (IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c))
+				spl_out->scl_data.taps.h_taps_c = 1;
+
+			if (IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c))
+				spl_out->scl_data.taps.v_taps_c = 1;
+
+			*enable_easf_v = false;
+			*enable_easf_h = false;
+		} else {
+			if ((!*enable_easf_h) &&
+				(IDENTITY_RATIO(spl_out->scl_data.ratios.horz_c)))
+				spl_out->scl_data.taps.h_taps_c = 1;
+
+			if ((!*enable_easf_v) &&
+				(IDENTITY_RATIO(spl_out->scl_data.ratios.vert_c)))
+				spl_out->scl_data.taps.v_taps_c = 1;
+		}
 	}
 	return true;
 }
+
 static void spl_set_black_color_data(enum spl_pixel_format format,
 			struct scl_black_color *scl_black_color)
 {
@@ -890,62 +1111,10 @@ static void spl_set_taps_data(struct dscl_prog_data *dscl_prog_data,
 	dscl_prog_data->taps.v_taps_c = scl_data->taps.v_taps_c - 1;
 	dscl_prog_data->taps.h_taps_c = scl_data->taps.h_taps_c - 1;
 }
-static const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
-{
-	if (taps == 8)
-		return spl_get_filter_8tap_64p(ratio);
-	else if (taps == 7)
-		return spl_get_filter_7tap_64p(ratio);
-	else if (taps == 6)
-		return spl_get_filter_6tap_64p(ratio);
-	else if (taps == 5)
-		return spl_get_filter_5tap_64p(ratio);
-	else if (taps == 4)
-		return spl_get_filter_4tap_64p(ratio);
-	else if (taps == 3)
-		return spl_get_filter_3tap_64p(ratio);
-	else if (taps == 2)
-		return spl_get_filter_2tap_64p();
-	else if (taps == 1)
-		return NULL;
-	else {
-		/* should never happen, bug */
-		return NULL;
-	}
-}
-static void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
-		const struct spl_scaler_data *data)
-{
-	dscl_prog_data->filter_h = spl_dscl_get_filter_coeffs_64p(
-				data->taps.h_taps, data->ratios.horz);
-	dscl_prog_data->filter_v = spl_dscl_get_filter_coeffs_64p(
-				data->taps.v_taps, data->ratios.vert);
-	dscl_prog_data->filter_h_c = spl_dscl_get_filter_coeffs_64p(
-				data->taps.h_taps_c, data->ratios.horz_c);
-	dscl_prog_data->filter_v_c = spl_dscl_get_filter_coeffs_64p(
-				data->taps.v_taps_c, data->ratios.vert_c);
-}
-
-static const uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
-{
-	if ((taps == 3) || (taps == 4) || (taps == 6))
-		return spl_get_filter_isharp_bs_4tap_64p();
-	else {
-		/* should never happen, bug */
-		return NULL;
-	}
-}
-static void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
-		const struct spl_scaler_data *data)
-{
-	dscl_prog_data->filter_blur_scale_h = spl_dscl_get_blur_scale_coeffs_64p(
-				data->taps.h_taps);
-	dscl_prog_data->filter_blur_scale_v = spl_dscl_get_blur_scale_coeffs_64p(
-				data->taps.v_taps);
-}
 
 /* Populate dscl prog data structure from scaler data calculated by SPL */
-static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_out)
+static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_out,
+	bool enable_easf_v, bool enable_easf_h, bool enable_isharp)
 {
 	struct dscl_prog_data *dscl_prog_data = spl_out->dscl_prog_data;
 
@@ -953,6 +1122,8 @@ static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_ou
 
 	struct scl_black_color *scl_black_color = &dscl_prog_data->scl_black_color;
 
+	bool enable_easf = enable_easf_v || enable_easf_h;
+
 	// Set values for recout
 	dscl_prog_data->recout = spl_out->scl_data.recout;
 	// Set values for MPC Size
@@ -960,7 +1131,8 @@ static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_ou
 	dscl_prog_data->mpc_size.height = spl_out->scl_data.v_active;
 
 	// SCL_MODE - Set SCL_MODE data
-	dscl_prog_data->dscl_mode = spl_get_dscl_mode(spl_in, data);
+	dscl_prog_data->dscl_mode = spl_get_dscl_mode(spl_in, data, enable_isharp,
+		enable_easf);
 
 	// SCL_BLACK_COLOR
 	spl_set_black_color_data(spl_in->basic_in.format, scl_black_color);
@@ -975,99 +1147,97 @@ static void spl_set_dscl_prog_data(struct spl_in *spl_in, struct spl_out *spl_ou
 	// Set viewport_c
 	dscl_prog_data->viewport_c = spl_out->scl_data.viewport_c;
 	// Set filters data
-	spl_set_filters_data(dscl_prog_data, data);
-}
-/* Enable EASF ?*/
-static bool enable_easf(int scale_ratio, int taps,
-		enum linear_light_scaling lls_pref, bool prefer_easf)
-{
-	// Is downscaling > 6:1 ?
-	if (scale_ratio > 6) {
-		// END - No EASF support for downscaling > 6:1
-		return false;
-	}
-	// Is upscaling or downscaling up to 2:1?
-	if (scale_ratio <= 2) {
-		// Is linear scaling or EASF preferred?
-		if (lls_pref == LLS_PREF_YES || prefer_easf)	{
-			// LB support taps 3, 4, 6
-			if (taps == 3 || taps == 4 || taps == 6) {
-				// END - EASF supported
-				return true;
-			}
-		}
-	}
-	// END - EASF not supported
-	return false;
+	spl_set_filters_data(dscl_prog_data, data, enable_easf_v, enable_easf_h);
 }
+
 /* Set EASF data */
-static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
-	bool enable_easf_v, bool enable_easf_h, enum linear_light_scaling lls_pref,
-	enum spl_pixel_format format)
+static void spl_set_easf_data(struct spl_out *spl_out, bool enable_easf_v,
+	bool enable_easf_h, enum linear_light_scaling lls_pref,
+	enum spl_pixel_format format, enum system_setup setup)
 {
-	if (spl_is_yuv420(format)) /* TODO: 0 = RGB, 1 = YUV */
-		dscl_prog_data->easf_matrix_mode = 1;
-	else
-		dscl_prog_data->easf_matrix_mode = 0;
-
+	struct dscl_prog_data *dscl_prog_data = spl_out->dscl_prog_data;
 	if (enable_easf_v) {
 		dscl_prog_data->easf_v_en = true;
 		dscl_prog_data->easf_v_ring = 0;
-		dscl_prog_data->easf_v_sharp_factor = 1;
+		dscl_prog_data->easf_v_sharp_factor = 0;
 		dscl_prog_data->easf_v_bf1_en = 1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_v_bf2_mode = 0xF;	// 4-bit, BF2 calculation mode
-		dscl_prog_data->easf_v_bf3_mode = 2;	// 2-bit, BF3 chroma mode correction calculation mode
-		dscl_prog_data->easf_v_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
-		dscl_prog_data->easf_v_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
-		dscl_prog_data->easf_v_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+		/* 2-bit, BF3 chroma mode correction calculation mode */
+		dscl_prog_data->easf_v_bf3_mode = spl_get_v_bf3_mode(
+			spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ minCoef ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_uptilt =
-			0x9F00;// FP1.5.10 [minCoef]           (-0.036109167214271)
+			spl_get_3tap_dntilt_uptilt_offset(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTiltMaxVal ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt_max =
-			0x24FE;       // FP1.5.10 [upTiltMaxVal]      ( 0.904556445553545)
+			spl_get_3tap_uptilt_maxval(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ dnTiltSlope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_dntilt_slope =
-			0x3940;       // FP1.5.10 [dnTiltSlope]       ( 0.910488988173371)
+			spl_get_3tap_dntilt_slope(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt1Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt1_slope =
-			0x359C;       // FP1.5.10 [upTilt1Slope]      ( 0.125620179040899)
+			spl_get_3tap_uptilt1_slope(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt2Slope ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_slope =
-			0x359C;       // FP1.5.10 [upTilt2Slope]      ( 0.006786817723568)
+			spl_get_3tap_uptilt2_slope(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10 [ upTilt2Offset ]*/
 		dscl_prog_data->easf_v_ringest_3tap_uptilt2_offset =
-			0x9F00;       // FP1.5.10 [upTilt2Offset]     (-0.006139059716651)
+			spl_get_3tap_uptilt2_offset(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg1 =
-			0x4000;   // FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4]
+			spl_get_reducer_gain4(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_v_ringest_eventap_reduceg2 =
-			0x4100;   // FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6]
+			spl_get_reducer_gain6(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain1 =
-			0xB058;   // FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024
+			spl_get_gainRing4(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
+		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_v_ringest_eventap_gain2 =
-			0xA640;    // FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024
+			spl_get_gainRing6(spl_out->scl_data.taps.v_taps,
+				spl_out->scl_data.recip_ratios.vert);
 		dscl_prog_data->easf_v_bf_maxa = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 0
 		dscl_prog_data->easf_v_bf_maxb = 63; //Vertical Max BF value A in U0.6 format.Selected if V_FCNTL == 1
 		dscl_prog_data->easf_v_bf_mina = 0;	//Vertical Min BF value A in U0.6 format.Selected if V_FCNTL == 0
 		dscl_prog_data->easf_v_bf_minb = 0;	//Vertical Min BF value A in U0.6 format.Selected if V_FCNTL == 1
-		dscl_prog_data->easf_v_bf1_pwl_in_seg0 = -512;	// S0.10, BF1 PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
-		dscl_prog_data->easf_v_bf1_pwl_in_seg1 = -20;	// S0.10, BF1 PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
-		dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
-		dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = -56;	// S7.3, BF1 Slope PWL Segment 3
-		dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = -48;	// S7.3, BF1 Slope PWL Segment 4
-		dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = -240;	// S7.3, BF1 Slope PWL Segment 5
-		dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = -160;	// S7.3, BF1 Slope PWL Segment 6
-		dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
-		dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
 		if (lls_pref == LLS_PREF_YES)	{
+			dscl_prog_data->easf_v_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_v_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_v_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_v_bf1_pwl_in_seg0 = 0x600;	// S0.10, BF1 PWL Segment 0 = -512
+			dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_in_seg1 = 0x7EC;	// S0.10, BF1 PWL Segment 1 = -20
+			dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = 0x7C8;	// S7.3, BF1 Slope PWL Segment 3 = -56
+			dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = 0x7D0;	// S7.3, BF1 Slope PWL Segment 4 = -48
+			dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = 0x710;	// S7.3, BF1 Slope PWL Segment 5 = -240
+			dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = 0x760;	// S7.3, BF1 Slope PWL Segment 6 = -160
+			dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_v_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_slope_set0 = 0x12C5;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1088,13 +1258,41 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x136B;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_v_bf3_pwl_in_set4 =
 				0x0C37;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.125 * 125^3)
-			dscl_prog_data->easf_v_bf3_pwl_base_set4 = -50;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf3_pwl_base_set4 = 0x4E;	// S0.6, BF3 Base PWL Segment 4 = -50
 			dscl_prog_data->easf_v_bf3_pwl_slope_set4 =
 				0x1200;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_v_bf3_pwl_in_set5 =
 				0x0CF7;	// FP0.6.6, BF3 Input value PWL Segment 5 (1.0 * 125^3)
-			dscl_prog_data->easf_v_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		}	else	{
+			dscl_prog_data->easf_v_bf2_flat1_gain = 13;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_v_bf2_flat2_gain = 15;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_v_bf2_roc_gain = 14;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_v_bf1_pwl_in_seg0 = 0x440;	// S0.10, BF1 PWL Segment 0 = -960
+			dscl_prog_data->easf_v_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg0 = 2;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_v_bf1_pwl_in_seg1 = 0x7C4;	// S0.10, BF1 PWL Segment 1 = -60
+			dscl_prog_data->easf_v_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg1 = 109;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_v_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_v_bf1_pwl_in_seg3 = 48;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg3 = 0x7ED;	// S7.3, BF1 Slope PWL Segment 3 = -19
+			dscl_prog_data->easf_v_bf1_pwl_in_seg4 = 96;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg4 = 0x7F0;	// S7.3, BF1 Slope PWL Segment 4 = -16
+			dscl_prog_data->easf_v_bf1_pwl_in_seg5 = 144;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg5 = 0x7B0;	// S7.3, BF1 Slope PWL Segment 5 = -80
+			dscl_prog_data->easf_v_bf1_pwl_in_seg6 = 192;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_v_bf1_pwl_slope_seg6 = 0x7CB;	// S7.3, BF1 Slope PWL Segment 6 = -53
+			dscl_prog_data->easf_v_bf1_pwl_in_seg7 = 240;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_v_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_v_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_v_bf3_pwl_slope_set0 = 0x0000;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1113,11 +1311,11 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 				0x1878;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_v_bf3_pwl_in_set4 =
 				0x0761;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.375)
-			dscl_prog_data->easf_v_bf3_pwl_base_set4 = -60;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_v_bf3_pwl_base_set4 = 0x44;	// S0.6, BF3 Base PWL Segment 4 = -60
 			dscl_prog_data->easf_v_bf3_pwl_slope_set4 = 0x1760;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_v_bf3_pwl_in_set5 =
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
-			dscl_prog_data->easf_v_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_v_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		}
 	} else
 		dscl_prog_data->easf_v_en = false;
@@ -1125,52 +1323,63 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 	if (enable_easf_h) {
 		dscl_prog_data->easf_h_en = true;
 		dscl_prog_data->easf_h_ring = 0;
-		dscl_prog_data->easf_h_sharp_factor = 1;
+		dscl_prog_data->easf_h_sharp_factor = 0;
 		dscl_prog_data->easf_h_bf1_en =
 			1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_h_bf2_mode =
 			0xF;	// 4-bit, BF2 calculation mode
-		dscl_prog_data->easf_h_bf3_mode =
-			2;	// 2-bit, BF3 chroma mode correction calculation mode
-		dscl_prog_data->easf_h_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
-		dscl_prog_data->easf_h_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
-		dscl_prog_data->easf_h_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+		/* 2-bit, BF3 chroma mode correction calculation mode */
+		dscl_prog_data->easf_h_bf3_mode = spl_get_h_bf3_mode(
+			spl_out->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg1 =
-			0x4000;	// FP1.5.10; (2.0) Ring reducer gain for 4 or 6-tap mode [H_REDUCER_GAIN4]
+			spl_get_reducer_gain4(spl_out->scl_data.taps.h_taps,
+				spl_out->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6] */
 		dscl_prog_data->easf_h_ringest_eventap_reduceg2 =
-			0x4100;	// FP1.5.10; (2.5) Ring reducer gain for 6-tap mode [V_REDUCER_GAIN6]
+			spl_get_reducer_gain6(spl_out->scl_data.taps.h_taps,
+				spl_out->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain1 =
-			0xB058;	// FP1.5.10; (-0.135742) Ring gain for 6-tap set to -139/1024
+			spl_get_gainRing4(spl_out->scl_data.taps.h_taps,
+				spl_out->scl_data.recip_ratios.horz);
+		/* FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024 */
 		dscl_prog_data->easf_h_ringest_eventap_gain2 =
-			0xA640;	// FP1.5.10; (-0.024414) Ring gain for 6-tap set to -25/1024
+			spl_get_gainRing6(spl_out->scl_data.taps.h_taps,
+				spl_out->scl_data.recip_ratios.horz);
 		dscl_prog_data->easf_h_bf_maxa = 63; //Horz Max BF value A in U0.6 format.Selected if H_FCNTL==0
 		dscl_prog_data->easf_h_bf_maxb = 63; //Horz Max BF value B in U0.6 format.Selected if H_FCNTL==1
 		dscl_prog_data->easf_h_bf_mina = 0;	//Horz Min BF value B in U0.6 format.Selected if H_FCNTL==0
 		dscl_prog_data->easf_h_bf_minb = 0;	//Horz Min BF value B in U0.6 format.Selected if H_FCNTL==1
-		dscl_prog_data->easf_h_bf1_pwl_in_seg0 = -512;	// S0.10, BF1 PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
-		dscl_prog_data->easf_h_bf1_pwl_in_seg1 = -20;	// S0.10, BF1 PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
-		dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
-		dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = -56;	// S7.3, BF1 Slope PWL Segment 3
-		dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = -48;	// S7.3, BF1 Slope PWL Segment 4
-		dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = -240;	// S7.3, BF1 Slope PWL Segment 5
-		dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = -160;	// S7.3, BF1 Slope PWL Segment 6
-		dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
-		dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
 		if (lls_pref == LLS_PREF_YES)	{
+			dscl_prog_data->easf_h_bf2_flat1_gain = 4;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_h_bf2_flat2_gain = 8;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_h_bf2_roc_gain = 4;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_h_bf1_pwl_in_seg0 = 0x600;	// S0.10, BF1 PWL Segment 0 = -512
+			dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 3;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_in_seg1 = 0x7EC;	// S0.10, BF1 PWL Segment 1 = -20
+			dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 326;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 16;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = 0x7C8;	// S7.3, BF1 Slope PWL Segment 3 = -56
+			dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 32;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = 0x7D0;	// S7.3, BF1 Slope PWL Segment 4 = -48
+			dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 48;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = 0x710;	// S7.3, BF1 Slope PWL Segment 5 = -240
+			dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 64;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = 0x760;	// S7.3, BF1 Slope PWL Segment 6 = -160
+			dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 80;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_h_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_slope_set0 = 0x12C5;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1188,12 +1397,40 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 			dscl_prog_data->easf_h_bf3_pwl_slope_set3 =	0x136B;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_h_bf3_pwl_in_set4 =
 				0x0C37;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.125 * 125^3)
-			dscl_prog_data->easf_h_bf3_pwl_base_set4 = -50;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf3_pwl_base_set4 = 0x4E;	// S0.6, BF3 Base PWL Segment 4 = -50
 			dscl_prog_data->easf_h_bf3_pwl_slope_set4 = 0x1200;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_h_bf3_pwl_in_set5 =
 				0x0CF7;	// FP0.6.6, BF3 Input value PWL Segment 5 (1.0 * 125^3)
-			dscl_prog_data->easf_h_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		} else {
+			dscl_prog_data->easf_h_bf2_flat1_gain = 13;	// U1.3, BF2 Flat1 Gain control
+			dscl_prog_data->easf_h_bf2_flat2_gain = 15;	// U4.0, BF2 Flat2 Gain control
+			dscl_prog_data->easf_h_bf2_roc_gain = 14;	// U2.2, Rate Of Change control
+
+			dscl_prog_data->easf_h_bf1_pwl_in_seg0 = 0x440;	// S0.10, BF1 PWL Segment 0 = -960
+			dscl_prog_data->easf_h_bf1_pwl_base_seg0 = 0;	// U0.6, BF1 Base PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg0 = 2;	// S7.3, BF1 Slope PWL Segment 0
+			dscl_prog_data->easf_h_bf1_pwl_in_seg1 = 0x7C4;	// S0.10, BF1 PWL Segment 1 = -60
+			dscl_prog_data->easf_h_bf1_pwl_base_seg1 = 12;	// U0.6, BF1 Base PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg1 = 109;	// S7.3, BF1 Slope PWL Segment 1
+			dscl_prog_data->easf_h_bf1_pwl_in_seg2 = 0;	// S0.10, BF1 PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_base_seg2 = 63;	// U0.6, BF1 Base PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg2 = 0;	// S7.3, BF1 Slope PWL Segment 2
+			dscl_prog_data->easf_h_bf1_pwl_in_seg3 = 48;	// S0.10, BF1 PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_base_seg3 = 63;	// U0.6, BF1 Base PWL Segment 3
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg3 = 0x7ED;	// S7.3, BF1 Slope PWL Segment 3 = -19
+			dscl_prog_data->easf_h_bf1_pwl_in_seg4 = 96;	// S0.10, BF1 PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_base_seg4 = 56;	// U0.6, BF1 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg4 = 0x7F0;	// S7.3, BF1 Slope PWL Segment 4 = -16
+			dscl_prog_data->easf_h_bf1_pwl_in_seg5 = 144;	// S0.10, BF1 PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_base_seg5 = 50;	// U0.6, BF1 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg5 = 0x7B0;	// S7.3, BF1 Slope PWL Segment 5 = -80
+			dscl_prog_data->easf_h_bf1_pwl_in_seg6 = 192;	// S0.10, BF1 PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_base_seg6 = 20;	// U0.6, BF1 Base PWL Segment 6
+			dscl_prog_data->easf_h_bf1_pwl_slope_seg6 = 0x7CB;	// S7.3, BF1 Slope PWL Segment 6 = -53
+			dscl_prog_data->easf_h_bf1_pwl_in_seg7 = 240;	// S0.10, BF1 PWL Segment 7
+			dscl_prog_data->easf_h_bf1_pwl_base_seg7 = 0;	// U0.6, BF1 Base PWL Segment 7
+
 			dscl_prog_data->easf_h_bf3_pwl_in_set0 = 0x000;	// FP0.6.6, BF3 Input value PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_base_set0 = 63;	// S0.6, BF3 Base PWL Segment 0
 			dscl_prog_data->easf_h_bf3_pwl_slope_set0 = 0x0000;	// FP1.6.6, BF3 Slope PWL Segment 0
@@ -1211,25 +1448,36 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 			dscl_prog_data->easf_h_bf3_pwl_slope_set3 = 0x1878;	// FP1.6.6, BF3 Slope PWL Segment 3
 			dscl_prog_data->easf_h_bf3_pwl_in_set4 =
 				0x0761;	// FP0.6.6, BF3 Input value PWL Segment 4 (0.375)
-			dscl_prog_data->easf_h_bf3_pwl_base_set4 = -60;	// S0.6, BF3 Base PWL Segment 4
+			dscl_prog_data->easf_h_bf3_pwl_base_set4 = 0x44;	// S0.6, BF3 Base PWL Segment 4 = -60
 			dscl_prog_data->easf_h_bf3_pwl_slope_set4 = 0x1760;	// FP1.6.6, BF3 Slope PWL Segment 4
 			dscl_prog_data->easf_h_bf3_pwl_in_set5 =
 				0x0780;	// FP0.6.6, BF3 Input value PWL Segment 5 (0.5)
-			dscl_prog_data->easf_h_bf3_pwl_base_set5 = -63;	// S0.6, BF3 Base PWL Segment 5
+			dscl_prog_data->easf_h_bf3_pwl_base_set5 = 0x41;	// S0.6, BF3 Base PWL Segment 5 = -63
 		} // if (lls_pref == LLS_PREF_YES)
 	} else
 		dscl_prog_data->easf_h_en = false;
 
 	if (lls_pref == LLS_PREF_YES)	{
 		dscl_prog_data->easf_ltonl_en = 1;	// Linear input
-		dscl_prog_data->easf_matrix_c0 =
-			0x504E;	// fp1.5.10, C0 coefficient (LN_BT2020:  0.2627 * (2^14)/125 = 34.43750000)
-		dscl_prog_data->easf_matrix_c1 =
-			0x558E;	// fp1.5.10, C1 coefficient (LN_BT2020:  0.6780 * (2^14)/125 = 88.87500000)
-		dscl_prog_data->easf_matrix_c2 =
-			0x47C6;	// fp1.5.10, C2 coefficient (LN_BT2020:  0.0593 * (2^14)/125 = 7.77343750)
-		dscl_prog_data->easf_matrix_c3 =
-			0x0;	// fp1.5.10, C3 coefficient
+		if (setup == HDR_L) {
+			dscl_prog_data->easf_matrix_c0 =
+				0x504E;	// fp1.5.10, C0 coefficient (LN_BT2020:  0.2627 * (2^14)/125 = 34.43750000)
+			dscl_prog_data->easf_matrix_c1 =
+				0x558E;	// fp1.5.10, C1 coefficient (LN_BT2020:  0.6780 * (2^14)/125 = 88.87500000)
+			dscl_prog_data->easf_matrix_c2 =
+				0x47C6;	// fp1.5.10, C2 coefficient (LN_BT2020:  0.0593 * (2^14)/125 = 7.77343750)
+			dscl_prog_data->easf_matrix_c3 =
+				0x0;	// fp1.5.10, C3 coefficient
+		} else { // SDR_L
+			dscl_prog_data->easf_matrix_c0 =
+				0x4EF7;	// fp1.5.10, C0 coefficient (LN_rec709:  0.2126 * (2^14)/125 = 27.86590720)
+			dscl_prog_data->easf_matrix_c1 =
+				0x55DC;	// fp1.5.10, C1 coefficient (LN_rec709:  0.7152 * (2^14)/125 = 93.74269440)
+			dscl_prog_data->easf_matrix_c2 =
+				0x48BB;	// fp1.5.10, C2 coefficient (LN_rec709:  0.0722 * (2^14)/125 = 9.46339840)
+			dscl_prog_data->easf_matrix_c3 =
+				0x0;	// fp1.5.10, C3 coefficient
+		}
 	}	else	{
 		dscl_prog_data->easf_ltonl_en = 0;	// Non-Linear input
 		dscl_prog_data->easf_matrix_c0 =
@@ -1241,27 +1489,43 @@ static void spl_set_easf_data(struct dscl_prog_data *dscl_prog_data,
 		dscl_prog_data->easf_matrix_c3 =
 			0x0;	// fp1.5.10, C3 coefficient
 	}
+
+	if (spl_is_yuv420(format)) { /* TODO: 0 = RGB, 1 = YUV */
+		dscl_prog_data->easf_matrix_mode = 1;
+		/*
+		 * 2-bit, BF3 chroma mode correction calculation mode
+		 * Needs to be disabled for YUV420 mode
+		 * Override lookup value
+		 */
+		dscl_prog_data->easf_v_bf3_mode = 0;
+		dscl_prog_data->easf_h_bf3_mode = 0;
+	} else
+		dscl_prog_data->easf_matrix_mode = 0;
+
 }
+
 /*Set isharp noise detection */
-static void spl_set_isharp_noise_det_mode(struct dscl_prog_data *dscl_prog_data)
+static void spl_set_isharp_noise_det_mode(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data)
 {
 	// ISHARP_NOISEDET_MODE
 	// 0: 3x5 as VxH
 	// 1: 4x5 as VxH
 	// 2:
 	// 3: 5x5 as VxH
-	if (dscl_prog_data->taps.v_taps == 6)
-		dscl_prog_data->isharp_noise_det.mode = 3;	// ISHARP_NOISEDET_MODE
-	else if (dscl_prog_data->taps.h_taps == 4)
-		dscl_prog_data->isharp_noise_det.mode = 1;	// ISHARP_NOISEDET_MODE
-	else if (dscl_prog_data->taps.h_taps == 3)
-		dscl_prog_data->isharp_noise_det.mode = 0;	// ISHARP_NOISEDET_MODE
+	if (data->taps.v_taps == 6)
+		dscl_prog_data->isharp_noise_det.mode = 3;
+	else if (data->taps.v_taps == 4)
+		dscl_prog_data->isharp_noise_det.mode = 1;
+	else if (data->taps.v_taps == 3)
+		dscl_prog_data->isharp_noise_det.mode = 0;
 };
 /* Set Sharpener data */
 static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 		struct adaptive_sharpness adp_sharpness, bool enable_isharp,
 		enum linear_light_scaling lls_pref, enum spl_pixel_format format,
-		const struct spl_scaler_data *data)
+		const struct spl_scaler_data *data, struct fixed31_32 ratio,
+		enum system_setup setup)
 {
 	/* Turn off sharpener if not required */
 	if (!enable_isharp) {
@@ -1270,10 +1534,12 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	}
 
 	dscl_prog_data->isharp_en = 1;	// ISHARP_EN
-	dscl_prog_data->isharp_noise_det.enable = 1;	// ISHARP_NOISEDET_EN
 	// Set ISHARP_NOISEDET_MODE if htaps = 6-tap
-	if (dscl_prog_data->taps.h_taps == 6)
-		spl_set_isharp_noise_det_mode(dscl_prog_data);	// ISHARP_NOISEDET_MODE
+	if (data->taps.h_taps == 6) {
+		dscl_prog_data->isharp_noise_det.enable = 1;	/* ISHARP_NOISEDET_EN */
+		spl_set_isharp_noise_det_mode(dscl_prog_data, data);	/* ISHARP_NOISEDET_MODE */
+	} else
+		dscl_prog_data->isharp_noise_det.enable = 0;	// ISHARP_NOISEDET_EN
 	// Program noise detection threshold
 	dscl_prog_data->isharp_noise_det.uthreshold = 24;	// ISHARP_NOISEDET_UTHRE
 	dscl_prog_data->isharp_noise_det.dthreshold = 4;	// ISHARP_NOISEDET_DTHRE
@@ -1282,50 +1548,67 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	dscl_prog_data->isharp_noise_det.pwl_end_in = 13;	// ISHARP_NOISEDET_PWL_END_IN
 	dscl_prog_data->isharp_noise_det.pwl_slope = 1623;	// ISHARP_NOISEDET_PWL_SLOPE
 
-	if ((lls_pref == LLS_PREF_NO) && !spl_is_yuv420(format)) /* ISHARP_FMT_MODE */
+	if (lls_pref == LLS_PREF_NO) /* ISHARP_FMT_MODE */
 		dscl_prog_data->isharp_fmt.mode = 1;
 	else
 		dscl_prog_data->isharp_fmt.mode = 0;
 
 	dscl_prog_data->isharp_fmt.norm = 0x3C00;	// ISHARP_FMT_NORM
 	dscl_prog_data->isharp_lba.mode = 0;	// ISHARP_LBA_MODE
-	// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
-	dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[0] = 32;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
-	dscl_prog_data->isharp_lba.in_seg[1] = 256;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
-	dscl_prog_data->isharp_lba.in_seg[2] = 614; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[2] = -20; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
-	dscl_prog_data->isharp_lba.in_seg[3] = 1023; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
-	dscl_prog_data->isharp_lba.in_seg[4] = 1023; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
-	dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
-	// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
-	dscl_prog_data->isharp_lba.in_seg[5] = 1023; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
-	dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
-	switch (adp_sharpness.sharpness) {
-	case SHARPNESS_LOW:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_0p5x();
-		break;
-	case SHARPNESS_MID:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_1p0x();
-		break;
-	case SHARPNESS_HIGH:
-		dscl_prog_data->isharp_delta = spl_get_filter_isharp_1D_lut_2p0x();
-    break;
-	default:
-		BREAK_TO_DEBUGGER();
+	if (setup == SDR_L) {
+		// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
+		dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[0] = 62;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
+		dscl_prog_data->isharp_lba.in_seg[1] = 130;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
+		dscl_prog_data->isharp_lba.in_seg[2] = 312; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[2] = 0x1D9; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format = -39
+		// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
+		dscl_prog_data->isharp_lba.in_seg[3] = 520; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
+		dscl_prog_data->isharp_lba.in_seg[4] = 520; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
+		dscl_prog_data->isharp_lba.in_seg[5] = 520; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
+	} else {
+		// ISHARP_LBA_PWL_SEG0: ISHARP Local Brightness Adjustment PWL Segment 0
+		dscl_prog_data->isharp_lba.in_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[0] = 0;	// ISHARP LBA PWL for Seg 0. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[0] = 32;	// ISHARP LBA for Seg 0. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG1: ISHARP LBA PWL Segment 1
+		dscl_prog_data->isharp_lba.in_seg[1] = 256;	// ISHARP LBA PWL for Seg 1. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[1] = 63; // ISHARP LBA PWL for Seg 1. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[1] = 0; // ISHARP LBA for Seg 1. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG2: ISHARP LBA PWL Segment 2
+		dscl_prog_data->isharp_lba.in_seg[2] = 614; // ISHARP LBA PWL for Seg 2. INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[2] = 63; // ISHARP LBA PWL for Seg 2. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[2] = 0x1EC; // ISHARP LBA for Seg 2. SLOPE value in S5.3 format = -20
+		// ISHARP_LBA_PWL_SEG3: ISHARP LBA PWL Segment 3
+		dscl_prog_data->isharp_lba.in_seg[3] = 1023; // ISHARP LBA PWL for Seg 3.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[3] = 0; // ISHARP LBA PWL for Seg 3. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[3] = 0; // ISHARP LBA for Seg 3. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG4: ISHARP LBA PWL Segment 4
+		dscl_prog_data->isharp_lba.in_seg[4] = 1023; // ISHARP LBA PWL for Seg 4.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[4] = 0; // ISHARP LBA PWL for Seg 4. BASE value in U0.6 format
+		dscl_prog_data->isharp_lba.slope_seg[4] = 0; // ISHARP LBA for Seg 4. SLOPE value in S5.3 format
+		// ISHARP_LBA_PWL_SEG5: ISHARP LBA PWL Segment 5
+		dscl_prog_data->isharp_lba.in_seg[5] = 1023; // ISHARP LBA PWL for Seg 5.INPUT value in U0.10 format
+		dscl_prog_data->isharp_lba.base_seg[5] = 0;	// ISHARP LBA PWL for Seg 5. BASE value in U0.6 format
 	}
 
+	spl_build_isharp_1dlut_from_reference_curve(ratio, setup);
+	dscl_prog_data->isharp_delta = spl_get_pregen_filter_isharp_1D_lut(
+		adp_sharpness.sharpness);
+
 	// Program the nldelta soft clip values
 	if (lls_pref == LLS_PREF_YES) {
 		dscl_prog_data->isharp_nldelta_sclip.enable_p = 0;	/* ISHARP_NLDELTA_SCLIP_EN_P */
@@ -1346,59 +1629,6 @@ static void spl_set_isharp_data(struct dscl_prog_data *dscl_prog_data,
 	// Set the values as per lookup table
 	spl_set_blur_scale_data(dscl_prog_data, data);
 }
-static bool spl_get_isharp_en(struct adaptive_sharpness adp_sharpness,
-		int vscale_ratio, int hscale_ratio, struct spl_taps taps,
-		enum spl_pixel_format format)
-{
-	bool enable_isharp = false;
-
-	if (adp_sharpness.enable == false)
-		return enable_isharp; // Return if adaptive sharpness is disabled
-	// Is downscaling ?
-	if (vscale_ratio > 1 || hscale_ratio > 1) {
-		// END - No iSHARP support for downscaling
-		return enable_isharp;
-	}
-	// Scaling is up to 1:1 (no scaling) or upscaling
-
-	/* Only apply sharpness to NV12 and not P010 */
-	if (format != SPL_PIXEL_FORMAT_420BPP8)
-		return enable_isharp;
-
-	// LB support horizontal taps 4,6 or vertical taps 3, 4, 6
-	if (taps.h_taps == 4 || taps.h_taps == 6 ||
-		taps.v_taps == 3 || taps.v_taps == 4 || taps.v_taps == 6) {
-		// END - iSHARP supported
-		enable_isharp = true;
-	}
-	return enable_isharp;
-}
-
-static bool spl_choose_lls_policy(enum spl_pixel_format format,
-	enum spl_transfer_func_type tf_type,
-	enum spl_transfer_func_predefined tf_predefined_type,
-	enum linear_light_scaling *lls_pref)
-{
-	if (spl_is_yuv420(format)) {
-		*lls_pref = LLS_PREF_NO;
-		if ((tf_type == SPL_TF_TYPE_PREDEFINED) || (tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
-			return true;
-	} else { /* RGB or YUV444 */
-		if (tf_type == SPL_TF_TYPE_PREDEFINED) {
-			if ((tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG) ||
-				(tf_predefined_type == SPL_TRANSFER_FUNCTION_HLG12))
-				*lls_pref = LLS_PREF_NO;
-			else
-				*lls_pref = LLS_PREF_YES;
-			return true;
-		} else if (tf_type == SPL_TF_TYPE_BYPASS) {
-			*lls_pref = LLS_PREF_YES;
-			return true;
-		}
-	}
-	*lls_pref = LLS_PREF_NO;
-	return false;
-}
 
 /* Calculate scaler parameters */
 bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
@@ -1406,8 +1636,13 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 	bool res = false;
 	bool enable_easf_v = false;
 	bool enable_easf_h = false;
-	bool lls_enable_easf = true;
+	int vratio = 0;
+	int hratio = 0;
 	const struct spl_scaler_data *data = &spl_out->scl_data;
+	struct fixed31_32 isharp_scale_ratio;
+	enum system_setup setup;
+	bool enable_isharp = false;
+
 	// All SPL calls
 	/* recout calculation */
 	/* depends on h_active */
@@ -1419,7 +1654,8 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 
 	res = spl_get_optimal_number_of_taps(
 			  spl_in->basic_out.max_downscale_src_width, spl_in,
-			  spl_out, &spl_in->scaling_quality);
+			  spl_out, &spl_in->scaling_quality, &enable_easf_v,
+			  &enable_easf_h, &enable_isharp);
 	/*
 	 * Depends on recout, scaling ratios, h_active and taps
 	 * May need to re-check lb size after this in some obscure scenario
@@ -1434,37 +1670,33 @@ bool spl_calculate_scaler_params(struct spl_in *spl_in, struct spl_out *spl_out)
 	if (!res)
 		return res;
 
-	/*
-	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format and transfer
-	 *  function to determine whether to use LINEAR or NONLINEAR scaling
-	 */
-	if (spl_in->lls_pref == LLS_PREF_DONT_CARE)
-		lls_enable_easf = spl_choose_lls_policy(spl_in->basic_in.format,
-			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
-			&spl_in->lls_pref);
-
 	// Save all calculated parameters in dscl_prog_data structure to program hw registers
-	spl_set_dscl_prog_data(spl_in, spl_out);
+	spl_set_dscl_prog_data(spl_in, spl_out, enable_easf_v, enable_easf_h, enable_isharp);
 
-	int vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
-	int hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
-	if (!lls_enable_easf || spl_in->disable_easf) {
-		enable_easf_v = false;
-		enable_easf_h = false;
+	if (spl_in->lls_pref == LLS_PREF_YES) {
+		if (spl_in->is_hdr_on)
+			setup = HDR_L;
+		else
+			setup = SDR_L;
 	} else {
-		/* Enable EASF on vertical? */
-		enable_easf_v = enable_easf(vratio, spl_out->scl_data.taps.v_taps, spl_in->lls_pref, spl_in->prefer_easf);
-		/* Enable EASF on horizontal? */
-		enable_easf_h = enable_easf(hratio, spl_out->scl_data.taps.h_taps, spl_in->lls_pref, spl_in->prefer_easf);
+		if (spl_in->is_hdr_on)
+			setup = HDR_NL;
+		else
+			setup = SDR_NL;
 	}
 	// Set EASF
 	spl_set_easf_data(spl_out->dscl_prog_data, enable_easf_v, enable_easf_h, spl_in->lls_pref,
-		spl_in->basic_in.format);
+		spl_in->basic_in.format, setup);
 	// Set iSHARP
-	bool enable_isharp = spl_get_isharp_en(spl_in->adaptive_sharpness, vratio, hratio,
-		spl_out->scl_data.taps, spl_in->basic_in.format);
+	vratio = dc_fixpt_ceil(spl_out->scl_data.ratios.vert);
+	hratio = dc_fixpt_ceil(spl_out->scl_data.ratios.horz);
+	if (vratio <= hratio)
+		isharp_scale_ratio = spl_out->scl_data.recip_ratios.vert;
+	else
+		isharp_scale_ratio = spl_out->scl_data.recip_ratios.horz;
+
 	spl_set_isharp_data(spl_out->dscl_prog_data, spl_in->adaptive_sharpness, enable_isharp,
-		spl_in->lls_pref, spl_in->basic_in.format, data);
+		spl_in->lls_pref, spl_in->basic_in.format, data, isharp_scale_ratio, setup);
 
 	return res;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
new file mode 100644
index 000000000000..99238644e0a1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dc_spl_filters.h"
+
+void convert_filter_s1_10_to_s1_12(const uint16_t *s1_10_filter,
+	uint16_t *s1_12_filter, int num_taps)
+{
+	int num_entries = NUM_PHASES_COEFF * num_taps;
+	int i;
+
+	for (i = 0; i < num_entries; i++)
+		*(s1_12_filter + i) = *(s1_10_filter + i) * 4;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
new file mode 100644
index 000000000000..20439cdbdb10
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __DC_SPL_FILTERS_H__
+#define __DC_SPL_FILTERS_H__
+
+#include "dc_spl_types.h"
+
+#define NUM_PHASES_COEFF 33
+
+void convert_filter_s1_10_to_s1_12(const uint16_t *s1_10_filter,
+	uint16_t *s1_12_filter, int num_taps);
+
+#endif /* __DC_SPL_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
index 8bc838c7c3c5..a5e544406e91 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
@@ -3,6 +3,7 @@
 // Copyright 2024 Advanced Micro Devices, Inc.
 
 #include "dc_spl_types.h"
+#include "dc_spl_filters.h"
 #include "dc_spl_isharp_filters.h"
 
 //========================================
@@ -231,6 +232,53 @@ static const uint32_t filter_isharp_1D_lut_2p0x[32] = {
 0x080B0D0E,
 0x00020406,
 };
+//========================================
+// Delta Gain 1DLUT
+// LUT content is packed as 4-bytes into one DWORD/entry
+// A_start = 0.000000
+// A_end   = 10.000000
+// A_gain  = 3.000000
+// B_start = 11.000000
+// B_end   = 127.000000
+// C_start = 40.000000
+// C_end   = 127.000000
+//========================================
+static const uint32_t filter_isharp_1D_lut_3p0x[32] = {
+0x03010000,
+0x0F0B0805,
+0x211E1813,
+0x2B292624,
+0x3533302E,
+0x3E3C3A37,
+0x46444240,
+0x4D4B4A48,
+0x5352504F,
+0x59575655,
+0x5D5C5B5A,
+0x61605F5E,
+0x64646362,
+0x66666565,
+0x68686767,
+0x68686868,
+0x68686868,
+0x67676868,
+0x65656666,
+0x62636464,
+0x5E5F6061,
+0x5A5B5C5D,
+0x55565759,
+0x4F505253,
+0x484A4B4D,
+0x40424446,
+0x373A3C3E,
+0x2E303335,
+0x2426292B,
+0x191B1E21,
+0x0D101316,
+0x0003060A,
+};
+
+//========================================
 // Wide scaler coefficients
 //========================================================
 // <using>			gen_scaler_coeffs.m
@@ -285,7 +333,7 @@ static const uint16_t filter_isharp_wide_6tap_64p[198] = {
 // <CoefType>		Blur & Scale LPF
 // <CoefQuant>		S1.10
 //========================================================
-static const uint16_t filter_isharp_bs_4tap_64p[198] = {
+static const uint16_t filter_isharp_bs_4tap_in_6_64p[198] = {
 0x0000, 0x00E5, 0x0237, 0x00E4, 0x0000, 0x0000,
 0x0000, 0x00DE, 0x0237, 0x00EB, 0x0000, 0x0000,
 0x0000, 0x00D7, 0x0236, 0x00F2, 0x0001, 0x0000,
@@ -320,6 +368,228 @@ static const uint16_t filter_isharp_bs_4tap_64p[198] = {
 0x0000, 0x003B, 0x01CF, 0x01C2, 0x0034, 0x0000,
 0x0000, 0x0037, 0x01C9, 0x01C9, 0x0037, 0x0000
 };
+//========================================================
+// <using>			gen_BlurScale_coeffs.m
+// <date>			25-Apr-2022
+// <num_taps>		4
+// <num_phases>		64
+// <CoefType>		Blur & Scale LPF
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t filter_isharp_bs_4tap_64p[132] = {
+0x00E5, 0x0237, 0x00E4, 0x0000,
+0x00DE, 0x0237, 0x00EB, 0x0000,
+0x00D7, 0x0236, 0x00F2, 0x0001,
+0x00D0, 0x0235, 0x00FA, 0x0001,
+0x00C9, 0x0234, 0x0101, 0x0002,
+0x00C2, 0x0233, 0x0108, 0x0003,
+0x00BB, 0x0232, 0x0110, 0x0003,
+0x00B5, 0x0230, 0x0117, 0x0004,
+0x00AE, 0x022E, 0x011F, 0x0005,
+0x00A8, 0x022C, 0x0126, 0x0006,
+0x00A2, 0x022A, 0x012D, 0x0007,
+0x009C, 0x0228, 0x0134, 0x0008,
+0x0096, 0x0225, 0x013C, 0x0009,
+0x0090, 0x0222, 0x0143, 0x000B,
+0x008A, 0x021F, 0x014B, 0x000C,
+0x0085, 0x021C, 0x0151, 0x000E,
+0x007F, 0x0218, 0x015A, 0x000F,
+0x007A, 0x0215, 0x0160, 0x0011,
+0x0074, 0x0211, 0x0168, 0x0013,
+0x006F, 0x020D, 0x016F, 0x0015,
+0x006A, 0x0209, 0x0176, 0x0017,
+0x0065, 0x0204, 0x017E, 0x0019,
+0x0060, 0x0200, 0x0185, 0x001B,
+0x005C, 0x01FB, 0x018C, 0x001D,
+0x0057, 0x01F6, 0x0193, 0x0020,
+0x0053, 0x01F1, 0x019A, 0x0022,
+0x004E, 0x01EC, 0x01A1, 0x0025,
+0x004A, 0x01E6, 0x01A8, 0x0028,
+0x0046, 0x01E1, 0x01AF, 0x002A,
+0x0042, 0x01DB, 0x01B6, 0x002D,
+0x003F, 0x01D5, 0x01BB, 0x0031,
+0x003B, 0x01CF, 0x01C2, 0x0034,
+0x0037, 0x01C9, 0x01C9, 0x0037,
+};
+//========================================================
+// <using>			gen_BlurScale_coeffs.m
+// <date>			09-Jun-2022
+// <num_taps>		3
+// <num_phases>		64
+// <CoefType>		Blur & Scale LPF
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t filter_isharp_bs_3tap_64p[99] = {
+0x0200, 0x0200, 0x0000,
+0x01F6, 0x0206, 0x0004,
+0x01EC, 0x020B, 0x0009,
+0x01E2, 0x0211, 0x000D,
+0x01D8, 0x0216, 0x0012,
+0x01CE, 0x021C, 0x0016,
+0x01C4, 0x0221, 0x001B,
+0x01BA, 0x0226, 0x0020,
+0x01B0, 0x022A, 0x0026,
+0x01A6, 0x022F, 0x002B,
+0x019C, 0x0233, 0x0031,
+0x0192, 0x0238, 0x0036,
+0x0188, 0x023C, 0x003C,
+0x017E, 0x0240, 0x0042,
+0x0174, 0x0244, 0x0048,
+0x016A, 0x0248, 0x004E,
+0x0161, 0x024A, 0x0055,
+0x0157, 0x024E, 0x005B,
+0x014D, 0x0251, 0x0062,
+0x0144, 0x0253, 0x0069,
+0x013A, 0x0256, 0x0070,
+0x0131, 0x0258, 0x0077,
+0x0127, 0x025B, 0x007E,
+0x011E, 0x025C, 0x0086,
+0x0115, 0x025E, 0x008D,
+0x010B, 0x0260, 0x0095,
+0x0102, 0x0262, 0x009C,
+0x00F9, 0x0263, 0x00A4,
+0x00F0, 0x0264, 0x00AC,
+0x00E7, 0x0265, 0x00B4,
+0x00DF, 0x0264, 0x00BD,
+0x00D6, 0x0265, 0x00C5,
+0x00CD, 0x0266, 0x00CD,
+};
+
+/* Converted Blur & Scale coeff tables from S1.10 to S1.12 */
+static uint16_t filter_isharp_bs_4tap_in_6_64p_s1_12[198];
+static uint16_t filter_isharp_bs_4tap_64p_s1_12[132];
+static uint16_t filter_isharp_bs_3tap_64p_s1_12[99];
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_sdr_nl[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 2, 1},
+		{11, 10, 175, 100},
+		{1075, 1000, 15, 10},
+		{105, 100, 125, 100},
+		{1025, 1000, 1, 1},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 35, 10},
+		{11, 10, 32, 10},
+		{1075, 1000, 29, 10},
+		{105, 100, 26, 10},
+		{1025, 1000, 23, 10},
+		{1, 1, 2, 1},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_sdr_l[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 15, 10},
+		{11, 10, 135, 100},
+		{1075, 1000, 12, 10},
+		{105, 100, 105, 100},
+		{1025, 1000, 9, 10},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 25, 10},
+		{11, 10, 23, 10},
+		{1075, 1000, 21, 10},
+		{105, 100, 19, 10},
+		{1025, 1000, 17, 10},
+		{1, 1, 15, 10},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_hdr_nl[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 5, 10},
+		{11, 10, 4, 10},
+		{1075, 1000, 3, 10},
+		{105, 100, 2, 10},
+		{1025, 1000, 1, 10},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 1, 1},
+		{11, 10, 9, 10},
+		{1075, 1000, 8, 10},
+		{105, 100, 7, 10},
+		{1025, 1000, 6, 10},
+		{1, 1, 5, 10},
+	},
+	{ /* HIGH */
+		{1125, 1000, 15, 10},
+		{11, 10, 14, 10},
+		{1075, 1000, 13, 10},
+		{105, 100, 12, 10},
+		{1025, 1000, 11, 10},
+		{1, 1, 1, 1},
+	},
+};
+
+struct scale_ratio_to_sharpness_level_lookup scale_to_sharp_hdr_l[3][6] = {
+	{ /* LOW */
+		{1125, 1000, 75, 100},
+		{11, 10, 6, 10},
+		{1075, 1000, 45, 100},
+		{105, 100, 3, 10},
+		{1025, 1000, 15, 100},
+		{1, 1, 0, 1},
+	},
+	{ /* MID */
+		{1125, 1000, 15, 10},
+		{11, 10, 135, 100},
+		{1075, 1000, 12, 10},
+		{105, 100, 105, 100},
+		{1025, 1000, 9, 10},
+		{1, 1, 75, 100},
+	},
+	{ /* HIGH */
+		{1125, 1000, 25, 10},
+		{11, 10, 23, 10},
+		{1075, 1000, 21, 10},
+		{105, 100, 19, 10},
+		{1025, 1000, 17, 10},
+		{1, 1, 15, 10},
+	},
+};
+
+/* Pre-generated 1DLUT for LOW for given setup and sharpness level */
+uint32_t filter_isharp_1D_lut_pregen[3][32] = {
+	{
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+	},
+	{
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+	},
+	{
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0, 0, 0, 0, 0, 0, 0,
+	},
+};
+
 const uint32_t *spl_get_filter_isharp_1D_lut_0(void)
 {
 	return filter_isharp_1D_lut_0;
@@ -340,11 +610,162 @@ const uint32_t *spl_get_filter_isharp_1D_lut_2p0x(void)
 {
 	return filter_isharp_1D_lut_2p0x;
 }
+const uint32_t *spl_get_filter_isharp_1D_lut_3p0x(void)
+{
+	return filter_isharp_1D_lut_3p0x;
+}
 const uint16_t *spl_get_filter_isharp_wide_6tap_64p(void)
 {
 	return filter_isharp_wide_6tap_64p;
 }
-const uint16_t *spl_get_filter_isharp_bs_4tap_64p(void)
+uint16_t *spl_get_filter_isharp_bs_4tap_in_6_64p(void)
+{
+	return filter_isharp_bs_4tap_in_6_64p_s1_12;
+}
+uint16_t *spl_get_filter_isharp_bs_4tap_64p(void)
+{
+	return filter_isharp_bs_4tap_64p_s1_12;
+}
+uint16_t *spl_get_filter_isharp_bs_3tap_64p(void)
+{
+	return filter_isharp_bs_3tap_64p_s1_12;
+}
+
+void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum system_setup setup)
+{
+	uint8_t *byte_ptr_1dlut_src, *byte_ptr_1dlut_dst;
+	struct fixed31_32 sharp_base, sharp_calc, sharp_level, ratio_level;
+	int i, j;
+	struct scale_ratio_to_sharpness_level_lookup *setup_lookup_ptr;
+	int num_sharp_ramp_levels;
+	int size_1dlut;
+	int sharp_calc_int;
+	uint32_t filter_pregen_store[32];
+
+	/*
+	 * Given scaling ratio and current system setup, build pregenerated
+	 * 1DLUT tables for three sharpness levels - LOW, MID, HIGH
+	 */
+	for (i = 0; i < 3; i++) {
+		/*
+		 * Based on setup ( HDR/SDR, L/NL ), get base scale ratio to
+		 *  sharpness curve
+		 */
+		switch (setup) {
+		case HDR_L:
+			setup_lookup_ptr = scale_to_sharp_hdr_l[i];
+			num_sharp_ramp_levels = sizeof(scale_to_sharp_hdr_l[i])/
+				sizeof(struct scale_ratio_to_sharpness_level_lookup);
+			break;
+		case HDR_NL:
+			setup_lookup_ptr = scale_to_sharp_hdr_nl[i];
+			num_sharp_ramp_levels = sizeof(scale_to_sharp_hdr_nl[i])/
+				sizeof(struct scale_ratio_to_sharpness_level_lookup);
+			break;
+		case SDR_L:
+			setup_lookup_ptr = scale_to_sharp_sdr_l[i];
+			num_sharp_ramp_levels = sizeof(scale_to_sharp_sdr_l[i])/
+				sizeof(struct scale_ratio_to_sharpness_level_lookup);
+			break;
+		case SDR_NL:
+		default:
+			setup_lookup_ptr = scale_to_sharp_sdr_nl[i];
+			num_sharp_ramp_levels = sizeof(scale_to_sharp_sdr_nl[i])/
+				sizeof(struct scale_ratio_to_sharpness_level_lookup);
+			break;
+		}
+
+		/*
+		 * Compare desired scaling ratio and find adjusted sharpness from
+		 *  base scale ratio to sharpness curve
+		 */
+		j = 0;
+		sharp_level = dc_fixpt_zero;
+		while (j < num_sharp_ramp_levels) {
+			ratio_level = dc_fixpt_from_fraction(setup_lookup_ptr->ratio_numer,
+				setup_lookup_ptr->ratio_denom);
+			if (ratio.value >= ratio_level.value) {
+				sharp_level = dc_fixpt_from_fraction(setup_lookup_ptr->sharpness_numer,
+					setup_lookup_ptr->sharpness_denom);
+				break;
+			}
+			setup_lookup_ptr++;
+			j++;
+		}
+
+		/*
+		 * Calculate LUT_128_gained with this equation:
+		 *
+		 * LUT_128_gained[i] = (uint8)(0.5 + min(255,(double)(LUT_128[i])*sharpLevel/iGain))
+		 *  where LUT_128[i] is contents of 3p0x isharp 1dlut
+		 *  where sharpLevel is desired sharpness level
+		 *  where iGain is base sharpness level 3.0
+		 *  where LUT_128_gained[i] is adjusted 1dlut value based on desired sharpness level
+		 */
+		byte_ptr_1dlut_src = (uint8_t *)filter_isharp_1D_lut_3p0x;
+		byte_ptr_1dlut_dst = (uint8_t *)filter_pregen_store;
+		size_1dlut = sizeof(filter_isharp_1D_lut_3p0x);
+		memset(byte_ptr_1dlut_dst, 0, size_1dlut);
+		for (j = 0; j < size_1dlut; j++) {
+			sharp_base = dc_fixpt_from_int((int)*byte_ptr_1dlut_src);
+			sharp_calc = dc_fixpt_mul(sharp_base, sharp_level);
+			sharp_calc = dc_fixpt_div(sharp_calc, dc_fixpt_from_int(3));
+			sharp_calc = dc_fixpt_min(dc_fixpt_from_int(255), sharp_calc);
+			sharp_calc = dc_fixpt_add(sharp_calc, dc_fixpt_from_fraction(1, 2));
+			sharp_calc_int = dc_fixpt_floor(sharp_calc);
+			if (sharp_calc_int > 255)
+				sharp_calc_int = 255;
+			*byte_ptr_1dlut_dst = (uint8_t)sharp_calc_int;
+
+			byte_ptr_1dlut_src++;
+			byte_ptr_1dlut_dst++;
+		}
+
+		/* Compare if filter has change, if so update */
+		if (memcmp((void *)filter_isharp_1D_lut_pregen[i], (void *)filter_pregen_store, size_1dlut) != 0)
+			memcpy((void *)filter_isharp_1D_lut_pregen[i], (void *)filter_pregen_store, size_1dlut);
+	}
+}
+
+uint32_t *spl_get_pregen_filter_isharp_1D_lut(enum explicit_sharpness sharpness)
+{
+	return filter_isharp_1D_lut_pregen[sharpness];
+}
+
+void spl_init_blur_scale_coeffs(void)
 {
-	return filter_isharp_bs_4tap_64p;
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_3tap_64p,
+		filter_isharp_bs_3tap_64p_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_4tap_64p,
+		filter_isharp_bs_4tap_64p_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(filter_isharp_bs_4tap_in_6_64p,
+		filter_isharp_bs_4tap_in_6_64p_s1_12, 6);
 }
+
+#ifdef CONFIG_DRM_AMD_DC_FP
+uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps)
+{
+	if (taps == 3)
+		return spl_get_filter_isharp_bs_3tap_64p();
+	else if (taps == 4)
+		return spl_get_filter_isharp_bs_4tap_64p();
+	else if (taps == 6)
+		return spl_get_filter_isharp_bs_4tap_in_6_64p();
+	else {
+		/* should never happen, bug */
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
+void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
+		const struct spl_scaler_data *data)
+{
+	dscl_prog_data->filter_blur_scale_h =
+		spl_dscl_get_blur_scale_coeffs_64p(data->taps.h_taps);
+
+	dscl_prog_data->filter_blur_scale_v =
+		spl_dscl_get_blur_scale_coeffs_64p(data->taps.v_taps);
+}
+#endif
+
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
index 1aaf4c50c1bc..c8b7cd6404dd 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
@@ -12,6 +12,37 @@ const uint32_t *spl_get_filter_isharp_1D_lut_0p5x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_1p0x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_1p5x(void);
 const uint32_t *spl_get_filter_isharp_1D_lut_2p0x(void);
-const uint16_t *spl_get_filter_isharp_bs_4tap_64p(void);
+const uint32_t *spl_get_filter_isharp_1D_lut_3p0x(void);
+uint16_t *spl_get_filter_isharp_bs_4tap_in_6_64p(void);
+uint16_t *spl_get_filter_isharp_bs_4tap_64p(void);
+uint16_t *spl_get_filter_isharp_bs_3tap_64p(void);
 const uint16_t *spl_get_filter_isharp_wide_6tap_64p(void);
+uint16_t *spl_dscl_get_blur_scale_coeffs_64p(int taps);
+
+struct scale_ratio_to_sharpness_level_lookup {
+	unsigned int ratio_numer;
+	unsigned int ratio_denom;
+	unsigned int sharpness_numer;
+	unsigned int sharpness_denom;
+};
+
+struct sharpness_level_mapping {
+	unsigned int level;
+	unsigned int level_numer;
+	unsigned int level_denom;
+};
+
+enum system_setup {
+	SDR_NL = 0,
+	SDR_L,
+	HDR_NL,
+	HDR_L
+};
+
+void spl_init_blur_scale_coeffs(void);
+void spl_set_blur_scale_data(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data);
+
+void spl_build_isharp_1dlut_from_reference_curve(struct fixed31_32 ratio, enum system_setup setup);
+uint32_t *spl_get_pregen_filter_isharp_1D_lut(enum explicit_sharpness sharpness);
 #endif /* __DC_SPL_ISHARP_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
new file mode 100644
index 000000000000..83dd3435ebcc
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
@@ -0,0 +1,1725 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dc_spl_filters.h"
+#include "dc_spl_scl_filters.h"
+#include "dc_spl_scl_easf_filters.h"
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_30[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F6, 0x0206, 0x0004,
+	0x01EC, 0x020B, 0x0009,
+	0x01E2, 0x0211, 0x000D,
+	0x01D8, 0x0216, 0x0012,
+	0x01CE, 0x021C, 0x0016,
+	0x01C4, 0x0221, 0x001B,
+	0x01BA, 0x0226, 0x0020,
+	0x01B0, 0x022A, 0x0026,
+	0x01A6, 0x022F, 0x002B,
+	0x019C, 0x0233, 0x0031,
+	0x0192, 0x0238, 0x0036,
+	0x0188, 0x023C, 0x003C,
+	0x017E, 0x0240, 0x0042,
+	0x0174, 0x0244, 0x0048,
+	0x016A, 0x0248, 0x004E,
+	0x0161, 0x024A, 0x0055,
+	0x0157, 0x024E, 0x005B,
+	0x014D, 0x0251, 0x0062,
+	0x0144, 0x0253, 0x0069,
+	0x013A, 0x0256, 0x0070,
+	0x0131, 0x0258, 0x0077,
+	0x0127, 0x025B, 0x007E,
+	0x011E, 0x025C, 0x0086,
+	0x0115, 0x025E, 0x008D,
+	0x010B, 0x0260, 0x0095,
+	0x0102, 0x0262, 0x009C,
+	0x00F9, 0x0263, 0x00A4,
+	0x00F0, 0x0264, 0x00AC,
+	0x00E7, 0x0265, 0x00B4,
+	0x00DF, 0x0264, 0x00BD,
+	0x00D6, 0x0265, 0x00C5,
+	0x00CD, 0x0266, 0x00CD,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_40[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F6, 0x0206, 0x0004,
+	0x01EB, 0x020E, 0x0007,
+	0x01E1, 0x0214, 0x000B,
+	0x01D7, 0x021A, 0x000F,
+	0x01CD, 0x0220, 0x0013,
+	0x01C2, 0x0226, 0x0018,
+	0x01B8, 0x022C, 0x001C,
+	0x01AE, 0x0231, 0x0021,
+	0x01A3, 0x0237, 0x0026,
+	0x0199, 0x023C, 0x002B,
+	0x018F, 0x0240, 0x0031,
+	0x0185, 0x0245, 0x0036,
+	0x017A, 0x024A, 0x003C,
+	0x0170, 0x024F, 0x0041,
+	0x0166, 0x0253, 0x0047,
+	0x015C, 0x0257, 0x004D,
+	0x0152, 0x025A, 0x0054,
+	0x0148, 0x025E, 0x005A,
+	0x013E, 0x0261, 0x0061,
+	0x0134, 0x0264, 0x0068,
+	0x012B, 0x0266, 0x006F,
+	0x0121, 0x0269, 0x0076,
+	0x0117, 0x026C, 0x007D,
+	0x010E, 0x026E, 0x0084,
+	0x0104, 0x0270, 0x008C,
+	0x00FB, 0x0271, 0x0094,
+	0x00F2, 0x0272, 0x009C,
+	0x00E9, 0x0273, 0x00A4,
+	0x00E0, 0x0274, 0x00AC,
+	0x00D7, 0x0275, 0x00B4,
+	0x00CE, 0x0275, 0x00BD,
+	0x00C5, 0x0276, 0x00C5,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_50[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F5, 0x0209, 0x0002,
+	0x01EA, 0x0211, 0x0005,
+	0x01DF, 0x021A, 0x0007,
+	0x01D4, 0x0222, 0x000A,
+	0x01C9, 0x022A, 0x000D,
+	0x01BE, 0x0232, 0x0010,
+	0x01B3, 0x0239, 0x0014,
+	0x01A8, 0x0241, 0x0017,
+	0x019D, 0x0248, 0x001B,
+	0x0192, 0x024F, 0x001F,
+	0x0187, 0x0255, 0x0024,
+	0x017C, 0x025C, 0x0028,
+	0x0171, 0x0262, 0x002D,
+	0x0166, 0x0268, 0x0032,
+	0x015B, 0x026E, 0x0037,
+	0x0150, 0x0273, 0x003D,
+	0x0146, 0x0278, 0x0042,
+	0x013B, 0x027D, 0x0048,
+	0x0130, 0x0282, 0x004E,
+	0x0126, 0x0286, 0x0054,
+	0x011B, 0x028A, 0x005B,
+	0x0111, 0x028D, 0x0062,
+	0x0107, 0x0290, 0x0069,
+	0x00FD, 0x0293, 0x0070,
+	0x00F3, 0x0296, 0x0077,
+	0x00E9, 0x0298, 0x007F,
+	0x00DF, 0x029A, 0x0087,
+	0x00D5, 0x029C, 0x008F,
+	0x00CC, 0x029D, 0x0097,
+	0x00C3, 0x029E, 0x009F,
+	0x00BA, 0x029E, 0x00A8,
+	0x00B1, 0x029E, 0x00B1,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_60[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F4, 0x020B, 0x0001,
+	0x01E8, 0x0216, 0x0002,
+	0x01DC, 0x0221, 0x0003,
+	0x01D0, 0x022B, 0x0005,
+	0x01C4, 0x0235, 0x0007,
+	0x01B8, 0x0240, 0x0008,
+	0x01AC, 0x0249, 0x000B,
+	0x01A0, 0x0253, 0x000D,
+	0x0194, 0x025C, 0x0010,
+	0x0188, 0x0265, 0x0013,
+	0x017C, 0x026E, 0x0016,
+	0x0170, 0x0277, 0x0019,
+	0x0164, 0x027F, 0x001D,
+	0x0158, 0x0287, 0x0021,
+	0x014C, 0x028F, 0x0025,
+	0x0140, 0x0297, 0x0029,
+	0x0135, 0x029D, 0x002E,
+	0x0129, 0x02A4, 0x0033,
+	0x011D, 0x02AB, 0x0038,
+	0x0112, 0x02B0, 0x003E,
+	0x0107, 0x02B5, 0x0044,
+	0x00FC, 0x02BA, 0x004A,
+	0x00F1, 0x02BF, 0x0050,
+	0x00E6, 0x02C3, 0x0057,
+	0x00DB, 0x02C7, 0x005E,
+	0x00D1, 0x02CA, 0x0065,
+	0x00C7, 0x02CC, 0x006D,
+	0x00BD, 0x02CE, 0x0075,
+	0x00B3, 0x02D0, 0x007D,
+	0x00A9, 0x02D2, 0x0085,
+	0x00A0, 0x02D2, 0x008E,
+	0x0097, 0x02D2, 0x0097,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_70[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F3, 0x020D, 0x0000,
+	0x01E5, 0x021B, 0x0000,
+	0x01D8, 0x0228, 0x0000,
+	0x01CB, 0x0235, 0x0000,
+	0x01BD, 0x0243, 0x0000,
+	0x01B0, 0x024F, 0x0001,
+	0x01A2, 0x025C, 0x0002,
+	0x0195, 0x0268, 0x0003,
+	0x0187, 0x0275, 0x0004,
+	0x017A, 0x0280, 0x0006,
+	0x016D, 0x028C, 0x0007,
+	0x015F, 0x0298, 0x0009,
+	0x0152, 0x02A2, 0x000C,
+	0x0145, 0x02AD, 0x000E,
+	0x0138, 0x02B7, 0x0011,
+	0x012B, 0x02C0, 0x0015,
+	0x011E, 0x02CA, 0x0018,
+	0x0111, 0x02D3, 0x001C,
+	0x0105, 0x02DB, 0x0020,
+	0x00F8, 0x02E3, 0x0025,
+	0x00EC, 0x02EA, 0x002A,
+	0x00E0, 0x02F1, 0x002F,
+	0x00D5, 0x02F6, 0x0035,
+	0x00C9, 0x02FC, 0x003B,
+	0x00BE, 0x0301, 0x0041,
+	0x00B3, 0x0305, 0x0048,
+	0x00A8, 0x0309, 0x004F,
+	0x009E, 0x030C, 0x0056,
+	0x0094, 0x030E, 0x005E,
+	0x008A, 0x0310, 0x0066,
+	0x0081, 0x0310, 0x006F,
+	0x0077, 0x0312, 0x0077,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_80[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01F1, 0x0210, 0x0FFF,
+	0x01E2, 0x0220, 0x0FFE,
+	0x01D2, 0x0232, 0x0FFC,
+	0x01C3, 0x0241, 0x0FFC,
+	0x01B4, 0x0251, 0x0FFB,
+	0x01A4, 0x0262, 0x0FFA,
+	0x0195, 0x0271, 0x0FFA,
+	0x0186, 0x0281, 0x0FF9,
+	0x0176, 0x0291, 0x0FF9,
+	0x0167, 0x02A0, 0x0FF9,
+	0x0158, 0x02AE, 0x0FFA,
+	0x0149, 0x02BD, 0x0FFA,
+	0x013A, 0x02CB, 0x0FFB,
+	0x012C, 0x02D7, 0x0FFD,
+	0x011D, 0x02E5, 0x0FFE,
+	0x010F, 0x02F1, 0x0000,
+	0x0101, 0x02FD, 0x0002,
+	0x00F3, 0x0308, 0x0005,
+	0x00E5, 0x0313, 0x0008,
+	0x00D8, 0x031D, 0x000B,
+	0x00CB, 0x0326, 0x000F,
+	0x00BE, 0x032F, 0x0013,
+	0x00B2, 0x0337, 0x0017,
+	0x00A6, 0x033E, 0x001C,
+	0x009A, 0x0345, 0x0021,
+	0x008F, 0x034A, 0x0027,
+	0x0084, 0x034F, 0x002D,
+	0x0079, 0x0353, 0x0034,
+	0x006F, 0x0356, 0x003B,
+	0x0065, 0x0358, 0x0043,
+	0x005C, 0x0359, 0x004B,
+	0x0053, 0x035A, 0x0053,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_0_90[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01EE, 0x0214, 0x0FFE,
+	0x01DC, 0x0228, 0x0FFC,
+	0x01CA, 0x023C, 0x0FFA,
+	0x01B9, 0x024F, 0x0FF8,
+	0x01A7, 0x0262, 0x0FF7,
+	0x0195, 0x0276, 0x0FF5,
+	0x0183, 0x028A, 0x0FF3,
+	0x0172, 0x029C, 0x0FF2,
+	0x0160, 0x02AF, 0x0FF1,
+	0x014F, 0x02C2, 0x0FEF,
+	0x013E, 0x02D4, 0x0FEE,
+	0x012D, 0x02E5, 0x0FEE,
+	0x011C, 0x02F7, 0x0FED,
+	0x010C, 0x0307, 0x0FED,
+	0x00FB, 0x0318, 0x0FED,
+	0x00EC, 0x0327, 0x0FED,
+	0x00DC, 0x0336, 0x0FEE,
+	0x00CD, 0x0344, 0x0FEF,
+	0x00BE, 0x0352, 0x0FF0,
+	0x00B0, 0x035E, 0x0FF2,
+	0x00A2, 0x036A, 0x0FF4,
+	0x0095, 0x0375, 0x0FF6,
+	0x0088, 0x037F, 0x0FF9,
+	0x007B, 0x0388, 0x0FFD,
+	0x006F, 0x0391, 0x0000,
+	0x0064, 0x0397, 0x0005,
+	0x0059, 0x039D, 0x000A,
+	0x004E, 0x03A3, 0x000F,
+	0x0045, 0x03A6, 0x0015,
+	0x003B, 0x03A9, 0x001C,
+	0x0033, 0x03AA, 0x0023,
+	0x002A, 0x03AC, 0x002A,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	3t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		3
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_3tap_64p_ratio_1_00[99] = {
+	0x0200, 0x0200, 0x0000,
+	0x01EB, 0x0217, 0x0FFE,
+	0x01D5, 0x022F, 0x0FFC,
+	0x01C0, 0x0247, 0x0FF9,
+	0x01AB, 0x025E, 0x0FF7,
+	0x0196, 0x0276, 0x0FF4,
+	0x0181, 0x028D, 0x0FF2,
+	0x016C, 0x02A5, 0x0FEF,
+	0x0158, 0x02BB, 0x0FED,
+	0x0144, 0x02D1, 0x0FEB,
+	0x0130, 0x02E8, 0x0FE8,
+	0x011C, 0x02FE, 0x0FE6,
+	0x0109, 0x0313, 0x0FE4,
+	0x00F6, 0x0328, 0x0FE2,
+	0x00E4, 0x033C, 0x0FE0,
+	0x00D2, 0x034F, 0x0FDF,
+	0x00C0, 0x0363, 0x0FDD,
+	0x00B0, 0x0374, 0x0FDC,
+	0x009F, 0x0385, 0x0FDC,
+	0x0090, 0x0395, 0x0FDB,
+	0x0081, 0x03A4, 0x0FDB,
+	0x0072, 0x03B3, 0x0FDB,
+	0x0064, 0x03C0, 0x0FDC,
+	0x0057, 0x03CC, 0x0FDD,
+	0x004B, 0x03D6, 0x0FDF,
+	0x003F, 0x03E0, 0x0FE1,
+	0x0034, 0x03E8, 0x0FE4,
+	0x002A, 0x03EF, 0x0FE7,
+	0x0020, 0x03F5, 0x0FEB,
+	0x0017, 0x03FA, 0x0FEF,
+	0x000F, 0x03FD, 0x0FF4,
+	0x0007, 0x03FF, 0x0FFA,
+	0x0000, 0x0400, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_30[132] = {
+	0x0104, 0x01F8, 0x0104, 0x0000,
+	0x00FE, 0x01F7, 0x010A, 0x0001,
+	0x00F8, 0x01F6, 0x010F, 0x0003,
+	0x00F2, 0x01F5, 0x0114, 0x0005,
+	0x00EB, 0x01F4, 0x011B, 0x0006,
+	0x00E5, 0x01F3, 0x0120, 0x0008,
+	0x00DF, 0x01F2, 0x0125, 0x000A,
+	0x00DA, 0x01F0, 0x012A, 0x000C,
+	0x00D4, 0x01EE, 0x0130, 0x000E,
+	0x00CE, 0x01ED, 0x0135, 0x0010,
+	0x00C8, 0x01EB, 0x013A, 0x0013,
+	0x00C2, 0x01E9, 0x0140, 0x0015,
+	0x00BD, 0x01E7, 0x0145, 0x0017,
+	0x00B7, 0x01E5, 0x014A, 0x001A,
+	0x00B1, 0x01E2, 0x0151, 0x001C,
+	0x00AC, 0x01E0, 0x0155, 0x001F,
+	0x00A7, 0x01DD, 0x015A, 0x0022,
+	0x00A1, 0x01DB, 0x015F, 0x0025,
+	0x009C, 0x01D8, 0x0165, 0x0027,
+	0x0097, 0x01D5, 0x016A, 0x002A,
+	0x0092, 0x01D2, 0x016E, 0x002E,
+	0x008C, 0x01CF, 0x0174, 0x0031,
+	0x0087, 0x01CC, 0x0179, 0x0034,
+	0x0083, 0x01C9, 0x017D, 0x0037,
+	0x007E, 0x01C5, 0x0182, 0x003B,
+	0x0079, 0x01C2, 0x0187, 0x003E,
+	0x0074, 0x01BE, 0x018C, 0x0042,
+	0x0070, 0x01BA, 0x0190, 0x0046,
+	0x006B, 0x01B7, 0x0195, 0x0049,
+	0x0066, 0x01B3, 0x019A, 0x004D,
+	0x0062, 0x01AF, 0x019E, 0x0051,
+	0x005E, 0x01AB, 0x01A2, 0x0055,
+	0x005A, 0x01A6, 0x01A6, 0x005A,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_40[132] = {
+	0x00FB, 0x0209, 0x00FC, 0x0000,
+	0x00F5, 0x0209, 0x0101, 0x0001,
+	0x00EE, 0x0208, 0x0108, 0x0002,
+	0x00E8, 0x0207, 0x010E, 0x0003,
+	0x00E2, 0x0206, 0x0114, 0x0004,
+	0x00DB, 0x0205, 0x011A, 0x0006,
+	0x00D5, 0x0204, 0x0120, 0x0007,
+	0x00CF, 0x0203, 0x0125, 0x0009,
+	0x00C9, 0x0201, 0x012C, 0x000A,
+	0x00C3, 0x01FF, 0x0132, 0x000C,
+	0x00BD, 0x01FD, 0x0138, 0x000E,
+	0x00B7, 0x01FB, 0x013E, 0x0010,
+	0x00B1, 0x01F9, 0x0144, 0x0012,
+	0x00AC, 0x01F7, 0x0149, 0x0014,
+	0x00A6, 0x01F4, 0x0150, 0x0016,
+	0x00A0, 0x01F2, 0x0156, 0x0018,
+	0x009B, 0x01EF, 0x015C, 0x001A,
+	0x0095, 0x01EC, 0x0162, 0x001D,
+	0x0090, 0x01E9, 0x0168, 0x001F,
+	0x008B, 0x01E6, 0x016D, 0x0022,
+	0x0085, 0x01E3, 0x0173, 0x0025,
+	0x0080, 0x01DF, 0x0179, 0x0028,
+	0x007B, 0x01DC, 0x017E, 0x002B,
+	0x0076, 0x01D8, 0x0184, 0x002E,
+	0x0071, 0x01D4, 0x018A, 0x0031,
+	0x006D, 0x01D1, 0x018E, 0x0034,
+	0x0068, 0x01CD, 0x0193, 0x0038,
+	0x0063, 0x01C8, 0x019A, 0x003B,
+	0x005F, 0x01C4, 0x019E, 0x003F,
+	0x005B, 0x01C0, 0x01A3, 0x0042,
+	0x0056, 0x01BB, 0x01A9, 0x0046,
+	0x0052, 0x01B7, 0x01AD, 0x004A,
+	0x004E, 0x01B2, 0x01B2, 0x004E,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_50[132] = {
+	0x00E5, 0x0236, 0x00E5, 0x0000,
+	0x00DE, 0x0235, 0x00ED, 0x0000,
+	0x00D7, 0x0235, 0x00F4, 0x0000,
+	0x00D0, 0x0235, 0x00FB, 0x0000,
+	0x00C9, 0x0234, 0x0102, 0x0001,
+	0x00C2, 0x0233, 0x010A, 0x0001,
+	0x00BC, 0x0232, 0x0111, 0x0001,
+	0x00B5, 0x0230, 0x0119, 0x0002,
+	0x00AE, 0x022F, 0x0121, 0x0002,
+	0x00A8, 0x022D, 0x0128, 0x0003,
+	0x00A2, 0x022B, 0x012F, 0x0004,
+	0x009B, 0x0229, 0x0137, 0x0005,
+	0x0095, 0x0226, 0x013F, 0x0006,
+	0x008F, 0x0224, 0x0146, 0x0007,
+	0x0089, 0x0221, 0x014E, 0x0008,
+	0x0083, 0x021E, 0x0155, 0x000A,
+	0x007E, 0x021B, 0x015C, 0x000B,
+	0x0078, 0x0217, 0x0164, 0x000D,
+	0x0072, 0x0213, 0x016D, 0x000E,
+	0x006D, 0x0210, 0x0173, 0x0010,
+	0x0068, 0x020C, 0x017A, 0x0012,
+	0x0063, 0x0207, 0x0182, 0x0014,
+	0x005E, 0x0203, 0x0189, 0x0016,
+	0x0059, 0x01FE, 0x0191, 0x0018,
+	0x0054, 0x01F9, 0x0198, 0x001B,
+	0x0050, 0x01F4, 0x019F, 0x001D,
+	0x004B, 0x01EF, 0x01A6, 0x0020,
+	0x0047, 0x01EA, 0x01AC, 0x0023,
+	0x0043, 0x01E4, 0x01B3, 0x0026,
+	0x003F, 0x01DF, 0x01B9, 0x0029,
+	0x003B, 0x01D9, 0x01C0, 0x002C,
+	0x0037, 0x01D3, 0x01C6, 0x0030,
+	0x0033, 0x01CD, 0x01CD, 0x0033,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_60[132] = {
+	0x00C8, 0x026F, 0x00C9, 0x0000,
+	0x00C0, 0x0270, 0x00D1, 0x0FFF,
+	0x00B8, 0x0270, 0x00D9, 0x0FFF,
+	0x00B1, 0x0270, 0x00E1, 0x0FFE,
+	0x00A9, 0x026F, 0x00EB, 0x0FFD,
+	0x00A2, 0x026E, 0x00F3, 0x0FFD,
+	0x009A, 0x026D, 0x00FD, 0x0FFC,
+	0x0093, 0x026C, 0x0105, 0x0FFC,
+	0x008C, 0x026A, 0x010F, 0x0FFB,
+	0x0085, 0x0268, 0x0118, 0x0FFB,
+	0x007E, 0x0265, 0x0122, 0x0FFB,
+	0x0078, 0x0263, 0x012A, 0x0FFB,
+	0x0071, 0x0260, 0x0134, 0x0FFB,
+	0x006B, 0x025C, 0x013E, 0x0FFB,
+	0x0065, 0x0259, 0x0147, 0x0FFB,
+	0x005F, 0x0255, 0x0151, 0x0FFB,
+	0x0059, 0x0251, 0x015A, 0x0FFC,
+	0x0054, 0x024D, 0x0163, 0x0FFC,
+	0x004E, 0x0248, 0x016D, 0x0FFD,
+	0x0049, 0x0243, 0x0176, 0x0FFE,
+	0x0044, 0x023E, 0x017F, 0x0FFF,
+	0x003F, 0x0238, 0x0189, 0x0000,
+	0x003A, 0x0232, 0x0193, 0x0001,
+	0x0036, 0x022C, 0x019C, 0x0002,
+	0x0031, 0x0226, 0x01A5, 0x0004,
+	0x002D, 0x021F, 0x01AF, 0x0005,
+	0x0029, 0x0218, 0x01B8, 0x0007,
+	0x0025, 0x0211, 0x01C1, 0x0009,
+	0x0022, 0x020A, 0x01C9, 0x000B,
+	0x001E, 0x0203, 0x01D2, 0x000D,
+	0x001B, 0x01FB, 0x01DA, 0x0010,
+	0x0018, 0x01F3, 0x01E3, 0x0012,
+	0x0015, 0x01EB, 0x01EB, 0x0015,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_70[132] = {
+	0x00A3, 0x02B9, 0x00A4, 0x0000,
+	0x009A, 0x02BA, 0x00AD, 0x0FFF,
+	0x0092, 0x02BA, 0x00B6, 0x0FFE,
+	0x0089, 0x02BA, 0x00C1, 0x0FFC,
+	0x0081, 0x02B9, 0x00CB, 0x0FFB,
+	0x0079, 0x02B8, 0x00D5, 0x0FFA,
+	0x0071, 0x02B7, 0x00DF, 0x0FF9,
+	0x0069, 0x02B5, 0x00EA, 0x0FF8,
+	0x0062, 0x02B3, 0x00F4, 0x0FF7,
+	0x005B, 0x02B0, 0x00FF, 0x0FF6,
+	0x0054, 0x02AD, 0x010B, 0x0FF4,
+	0x004D, 0x02A9, 0x0117, 0x0FF3,
+	0x0046, 0x02A5, 0x0123, 0x0FF2,
+	0x0040, 0x02A1, 0x012D, 0x0FF2,
+	0x003A, 0x029C, 0x0139, 0x0FF1,
+	0x0034, 0x0297, 0x0145, 0x0FF0,
+	0x002F, 0x0292, 0x0150, 0x0FEF,
+	0x0029, 0x028C, 0x015C, 0x0FEF,
+	0x0024, 0x0285, 0x0169, 0x0FEE,
+	0x001F, 0x027F, 0x0174, 0x0FEE,
+	0x001B, 0x0278, 0x017F, 0x0FEE,
+	0x0016, 0x0270, 0x018D, 0x0FED,
+	0x0012, 0x0268, 0x0199, 0x0FED,
+	0x000E, 0x0260, 0x01A4, 0x0FEE,
+	0x000B, 0x0258, 0x01AF, 0x0FEE,
+	0x0007, 0x024F, 0x01BC, 0x0FEE,
+	0x0004, 0x0246, 0x01C7, 0x0FEF,
+	0x0001, 0x023D, 0x01D3, 0x0FEF,
+	0x0FFE, 0x0233, 0x01DF, 0x0FF0,
+	0x0FFC, 0x0229, 0x01EA, 0x0FF1,
+	0x0FFA, 0x021F, 0x01F4, 0x0FF3,
+	0x0FF8, 0x0215, 0x01FF, 0x0FF4,
+	0x0FF6, 0x020A, 0x020A, 0x0FF6,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_80[132] = {
+	0x0075, 0x0315, 0x0076, 0x0000,
+	0x006C, 0x0316, 0x007F, 0x0FFF,
+	0x0062, 0x0316, 0x008A, 0x0FFE,
+	0x0059, 0x0315, 0x0096, 0x0FFC,
+	0x0050, 0x0314, 0x00A1, 0x0FFB,
+	0x0048, 0x0312, 0x00AD, 0x0FF9,
+	0x0040, 0x0310, 0x00B8, 0x0FF8,
+	0x0038, 0x030D, 0x00C5, 0x0FF6,
+	0x0030, 0x030A, 0x00D1, 0x0FF5,
+	0x0029, 0x0306, 0x00DE, 0x0FF3,
+	0x0022, 0x0301, 0x00EB, 0x0FF2,
+	0x001C, 0x02FC, 0x00F8, 0x0FF0,
+	0x0015, 0x02F7, 0x0106, 0x0FEE,
+	0x0010, 0x02F1, 0x0112, 0x0FED,
+	0x000A, 0x02EA, 0x0121, 0x0FEB,
+	0x0005, 0x02E3, 0x012F, 0x0FE9,
+	0x0000, 0x02DB, 0x013D, 0x0FE8,
+	0x0FFB, 0x02D3, 0x014C, 0x0FE6,
+	0x0FF7, 0x02CA, 0x015A, 0x0FE5,
+	0x0FF3, 0x02C1, 0x0169, 0x0FE3,
+	0x0FF0, 0x02B7, 0x0177, 0x0FE2,
+	0x0FEC, 0x02AD, 0x0186, 0x0FE1,
+	0x0FE9, 0x02A2, 0x0196, 0x0FDF,
+	0x0FE7, 0x0297, 0x01A4, 0x0FDE,
+	0x0FE4, 0x028C, 0x01B3, 0x0FDD,
+	0x0FE2, 0x0280, 0x01C2, 0x0FDC,
+	0x0FE0, 0x0274, 0x01D0, 0x0FDC,
+	0x0FDF, 0x0268, 0x01DE, 0x0FDB,
+	0x0FDD, 0x025B, 0x01EE, 0x0FDA,
+	0x0FDC, 0x024E, 0x01FC, 0x0FDA,
+	0x0FDB, 0x0241, 0x020A, 0x0FDA,
+	0x0FDB, 0x0233, 0x0218, 0x0FDA,
+	0x0FDA, 0x0226, 0x0226, 0x0FDA,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_0_90[132] = {
+	0x003F, 0x0383, 0x003E, 0x0000,
+	0x0034, 0x0383, 0x004A, 0x0FFF,
+	0x002B, 0x0383, 0x0054, 0x0FFE,
+	0x0021, 0x0381, 0x0061, 0x0FFD,
+	0x0019, 0x037F, 0x006C, 0x0FFC,
+	0x0010, 0x037C, 0x0079, 0x0FFB,
+	0x0008, 0x0378, 0x0086, 0x0FFA,
+	0x0001, 0x0374, 0x0093, 0x0FF8,
+	0x0FFA, 0x036E, 0x00A1, 0x0FF7,
+	0x0FF3, 0x0368, 0x00B0, 0x0FF5,
+	0x0FED, 0x0361, 0x00BF, 0x0FF3,
+	0x0FE8, 0x035A, 0x00CD, 0x0FF1,
+	0x0FE2, 0x0352, 0x00DC, 0x0FF0,
+	0x0FDE, 0x0349, 0x00EB, 0x0FEE,
+	0x0FD9, 0x033F, 0x00FC, 0x0FEC,
+	0x0FD5, 0x0335, 0x010D, 0x0FE9,
+	0x0FD2, 0x032A, 0x011D, 0x0FE7,
+	0x0FCF, 0x031E, 0x012E, 0x0FE5,
+	0x0FCC, 0x0312, 0x013F, 0x0FE3,
+	0x0FCA, 0x0305, 0x0150, 0x0FE1,
+	0x0FC8, 0x02F8, 0x0162, 0x0FDE,
+	0x0FC6, 0x02EA, 0x0174, 0x0FDC,
+	0x0FC5, 0x02DC, 0x0185, 0x0FDA,
+	0x0FC4, 0x02CD, 0x0197, 0x0FD8,
+	0x0FC3, 0x02BE, 0x01AA, 0x0FD5,
+	0x0FC3, 0x02AF, 0x01BB, 0x0FD3,
+	0x0FC3, 0x029F, 0x01CD, 0x0FD1,
+	0x0FC3, 0x028E, 0x01E0, 0x0FCF,
+	0x0FC3, 0x027E, 0x01F2, 0x0FCD,
+	0x0FC4, 0x026D, 0x0203, 0x0FCC,
+	0x0FC5, 0x025C, 0x0215, 0x0FCA,
+	0x0FC6, 0x024B, 0x0227, 0x0FC8,
+	0x0FC7, 0x0239, 0x0239, 0x0FC7,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			03-Apr-2024
+// <coeffDescrip>	4t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		4
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_4tap_64p_ratio_1_00[132] = {
+	0x0000, 0x0400, 0x0000, 0x0000,
+	0x0FF6, 0x03FF, 0x000B, 0x0000,
+	0x0FED, 0x03FE, 0x0015, 0x0000,
+	0x0FE4, 0x03FB, 0x0022, 0x0FFF,
+	0x0FDC, 0x03F7, 0x002E, 0x0FFF,
+	0x0FD5, 0x03F2, 0x003B, 0x0FFE,
+	0x0FCE, 0x03EC, 0x0048, 0x0FFE,
+	0x0FC8, 0x03E5, 0x0056, 0x0FFD,
+	0x0FC3, 0x03DC, 0x0065, 0x0FFC,
+	0x0FBE, 0x03D3, 0x0075, 0x0FFA,
+	0x0FB9, 0x03C9, 0x0085, 0x0FF9,
+	0x0FB6, 0x03BE, 0x0094, 0x0FF8,
+	0x0FB2, 0x03B2, 0x00A6, 0x0FF6,
+	0x0FB0, 0x03A5, 0x00B7, 0x0FF4,
+	0x0FAD, 0x0397, 0x00CA, 0x0FF2,
+	0x0FAB, 0x0389, 0x00DC, 0x0FF0,
+	0x0FAA, 0x0379, 0x00EF, 0x0FEE,
+	0x0FA9, 0x0369, 0x0102, 0x0FEC,
+	0x0FA9, 0x0359, 0x0115, 0x0FE9,
+	0x0FA9, 0x0348, 0x0129, 0x0FE6,
+	0x0FA9, 0x0336, 0x013D, 0x0FE4,
+	0x0FA9, 0x0323, 0x0153, 0x0FE1,
+	0x0FAA, 0x0310, 0x0168, 0x0FDE,
+	0x0FAC, 0x02FD, 0x017C, 0x0FDB,
+	0x0FAD, 0x02E9, 0x0192, 0x0FD8,
+	0x0FAF, 0x02D5, 0x01A7, 0x0FD5,
+	0x0FB1, 0x02C0, 0x01BD, 0x0FD2,
+	0x0FB3, 0x02AC, 0x01D2, 0x0FCF,
+	0x0FB5, 0x0296, 0x01E9, 0x0FCC,
+	0x0FB8, 0x0281, 0x01FE, 0x0FC9,
+	0x0FBA, 0x026C, 0x0214, 0x0FC6,
+	0x0FBD, 0x0256, 0x022A, 0x0FC3,
+	0x0FC0, 0x0240, 0x0240, 0x0FC0,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.3_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.300000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_30[198] = {
+	0x004B, 0x0100, 0x0169, 0x0101, 0x004B, 0x0000,
+	0x0049, 0x00FD, 0x0169, 0x0103, 0x004E, 0x0000,
+	0x0047, 0x00FA, 0x0169, 0x0106, 0x0050, 0x0000,
+	0x0045, 0x00F7, 0x0168, 0x0109, 0x0052, 0x0001,
+	0x0043, 0x00F5, 0x0168, 0x010B, 0x0054, 0x0001,
+	0x0040, 0x00F2, 0x0168, 0x010E, 0x0057, 0x0001,
+	0x003E, 0x00EF, 0x0168, 0x0110, 0x0059, 0x0002,
+	0x003C, 0x00EC, 0x0167, 0x0113, 0x005C, 0x0002,
+	0x003A, 0x00E9, 0x0167, 0x0116, 0x005E, 0x0002,
+	0x0038, 0x00E6, 0x0166, 0x0118, 0x0061, 0x0003,
+	0x0036, 0x00E3, 0x0165, 0x011C, 0x0063, 0x0003,
+	0x0034, 0x00E0, 0x0165, 0x011D, 0x0066, 0x0004,
+	0x0033, 0x00DD, 0x0164, 0x0120, 0x0068, 0x0004,
+	0x0031, 0x00DA, 0x0163, 0x0122, 0x006B, 0x0005,
+	0x002F, 0x00D7, 0x0163, 0x0125, 0x006D, 0x0005,
+	0x002D, 0x00D3, 0x0162, 0x0128, 0x0070, 0x0006,
+	0x002B, 0x00D0, 0x0161, 0x012A, 0x0073, 0x0007,
+	0x002A, 0x00CD, 0x0160, 0x012D, 0x0075, 0x0007,
+	0x0028, 0x00CA, 0x015F, 0x012F, 0x0078, 0x0008,
+	0x0026, 0x00C7, 0x015E, 0x0131, 0x007B, 0x0009,
+	0x0025, 0x00C4, 0x015D, 0x0133, 0x007E, 0x0009,
+	0x0023, 0x00C1, 0x015C, 0x0136, 0x0080, 0x000A,
+	0x0022, 0x00BE, 0x015A, 0x0138, 0x0083, 0x000B,
+	0x0020, 0x00BB, 0x0159, 0x013A, 0x0086, 0x000C,
+	0x001F, 0x00B8, 0x0158, 0x013B, 0x0089, 0x000D,
+	0x001E, 0x00B5, 0x0156, 0x013E, 0x008C, 0x000D,
+	0x001C, 0x00B2, 0x0155, 0x0140, 0x008F, 0x000E,
+	0x001B, 0x00AF, 0x0153, 0x0143, 0x0091, 0x000F,
+	0x0019, 0x00AC, 0x0152, 0x0145, 0x0094, 0x0010,
+	0x0018, 0x00A9, 0x0150, 0x0147, 0x0097, 0x0011,
+	0x0017, 0x00A6, 0x014F, 0x0148, 0x009A, 0x0012,
+	0x0016, 0x00A3, 0x014D, 0x0149, 0x009D, 0x0014,
+	0x0015, 0x00A0, 0x014B, 0x014B, 0x00A0, 0x0015,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.4_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.400000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_40[198] = {
+	0x0028, 0x0106, 0x01A3, 0x0107, 0x0028, 0x0000,
+	0x0026, 0x0102, 0x01A3, 0x010A, 0x002B, 0x0000,
+	0x0024, 0x00FE, 0x01A3, 0x010F, 0x002D, 0x0FFF,
+	0x0022, 0x00FA, 0x01A3, 0x0113, 0x002F, 0x0FFF,
+	0x0021, 0x00F6, 0x01A3, 0x0116, 0x0031, 0x0FFF,
+	0x001F, 0x00F2, 0x01A2, 0x011B, 0x0034, 0x0FFE,
+	0x001D, 0x00EE, 0x01A2, 0x011F, 0x0036, 0x0FFE,
+	0x001B, 0x00EA, 0x01A1, 0x0123, 0x0039, 0x0FFE,
+	0x0019, 0x00E6, 0x01A1, 0x0127, 0x003B, 0x0FFE,
+	0x0018, 0x00E2, 0x01A0, 0x012A, 0x003E, 0x0FFE,
+	0x0016, 0x00DE, 0x01A0, 0x012E, 0x0041, 0x0FFD,
+	0x0015, 0x00DA, 0x019F, 0x0132, 0x0043, 0x0FFD,
+	0x0013, 0x00D6, 0x019E, 0x0136, 0x0046, 0x0FFD,
+	0x0012, 0x00D2, 0x019D, 0x0139, 0x0049, 0x0FFD,
+	0x0010, 0x00CE, 0x019C, 0x013D, 0x004C, 0x0FFD,
+	0x000F, 0x00CA, 0x019A, 0x0141, 0x004F, 0x0FFD,
+	0x000E, 0x00C6, 0x0199, 0x0144, 0x0052, 0x0FFD,
+	0x000D, 0x00C2, 0x0197, 0x0148, 0x0055, 0x0FFD,
+	0x000B, 0x00BE, 0x0196, 0x014C, 0x0058, 0x0FFD,
+	0x000A, 0x00BA, 0x0195, 0x014F, 0x005B, 0x0FFD,
+	0x0009, 0x00B6, 0x0193, 0x0153, 0x005E, 0x0FFD,
+	0x0008, 0x00B2, 0x0191, 0x0157, 0x0061, 0x0FFD,
+	0x0007, 0x00AE, 0x0190, 0x015A, 0x0064, 0x0FFD,
+	0x0006, 0x00AA, 0x018E, 0x015D, 0x0068, 0x0FFD,
+	0x0005, 0x00A6, 0x018C, 0x0161, 0x006B, 0x0FFD,
+	0x0005, 0x00A2, 0x0189, 0x0164, 0x006F, 0x0FFD,
+	0x0004, 0x009E, 0x0187, 0x0167, 0x0072, 0x0FFE,
+	0x0003, 0x009A, 0x0185, 0x016B, 0x0075, 0x0FFE,
+	0x0002, 0x0096, 0x0183, 0x016E, 0x0079, 0x0FFE,
+	0x0002, 0x0093, 0x0180, 0x016F, 0x007D, 0x0FFF,
+	0x0001, 0x008F, 0x017E, 0x0173, 0x0080, 0x0FFF,
+	0x0001, 0x008B, 0x017B, 0x0175, 0x0084, 0x0000,
+	0x0000, 0x0087, 0x0179, 0x0179, 0x0087, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.5_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.500000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_50[198] = {
+	0x0000, 0x0107, 0x01F3, 0x0106, 0x0000, 0x0000,
+	0x0FFE, 0x0101, 0x01F3, 0x010D, 0x0002, 0x0FFF,
+	0x0FFD, 0x00FB, 0x01F3, 0x0113, 0x0003, 0x0FFF,
+	0x0FFC, 0x00F6, 0x01F3, 0x0118, 0x0005, 0x0FFE,
+	0x0FFA, 0x00F0, 0x01F3, 0x011E, 0x0007, 0x0FFE,
+	0x0FF9, 0x00EB, 0x01F2, 0x0124, 0x0009, 0x0FFD,
+	0x0FF8, 0x00E5, 0x01F2, 0x0129, 0x000B, 0x0FFD,
+	0x0FF7, 0x00E0, 0x01F1, 0x012F, 0x000D, 0x0FFC,
+	0x0FF6, 0x00DA, 0x01F0, 0x0135, 0x0010, 0x0FFB,
+	0x0FF5, 0x00D4, 0x01EF, 0x013B, 0x0012, 0x0FFB,
+	0x0FF4, 0x00CF, 0x01EE, 0x0141, 0x0014, 0x0FFA,
+	0x0FF3, 0x00C9, 0x01ED, 0x0147, 0x0017, 0x0FF9,
+	0x0FF2, 0x00C4, 0x01EB, 0x014C, 0x001A, 0x0FF9,
+	0x0FF1, 0x00BF, 0x01EA, 0x0152, 0x001C, 0x0FF8,
+	0x0FF1, 0x00B9, 0x01E8, 0x0157, 0x001F, 0x0FF8,
+	0x0FF0, 0x00B4, 0x01E6, 0x015D, 0x0022, 0x0FF7,
+	0x0FF0, 0x00AE, 0x01E4, 0x0163, 0x0025, 0x0FF6,
+	0x0FEF, 0x00A9, 0x01E2, 0x0168, 0x0028, 0x0FF6,
+	0x0FEF, 0x00A4, 0x01DF, 0x016E, 0x002B, 0x0FF5,
+	0x0FEF, 0x009F, 0x01DD, 0x0172, 0x002E, 0x0FF5,
+	0x0FEE, 0x009A, 0x01DA, 0x0178, 0x0032, 0x0FF4,
+	0x0FEE, 0x0094, 0x01D8, 0x017E, 0x0035, 0x0FF3,
+	0x0FEE, 0x008F, 0x01D5, 0x0182, 0x0039, 0x0FF3,
+	0x0FEE, 0x008A, 0x01D2, 0x0188, 0x003C, 0x0FF2,
+	0x0FEE, 0x0085, 0x01CF, 0x018C, 0x0040, 0x0FF2,
+	0x0FEE, 0x0081, 0x01CB, 0x0191, 0x0044, 0x0FF1,
+	0x0FEE, 0x007C, 0x01C8, 0x0196, 0x0047, 0x0FF1,
+	0x0FEE, 0x0077, 0x01C4, 0x019C, 0x004B, 0x0FF0,
+	0x0FEE, 0x0072, 0x01C1, 0x01A0, 0x004F, 0x0FF0,
+	0x0FEE, 0x006E, 0x01BD, 0x01A4, 0x0053, 0x0FF0,
+	0x0FEE, 0x0069, 0x01B9, 0x01A9, 0x0058, 0x0FEF,
+	0x0FEE, 0x0065, 0x01B5, 0x01AD, 0x005C, 0x0FEF,
+	0x0FEF, 0x0060, 0x01B1, 0x01B1, 0x0060, 0x0FEF,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.6_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.600000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_60[198] = {
+	0x0FD9, 0x00FB, 0x0258, 0x00FB, 0x0FD9, 0x0000,
+	0x0FD9, 0x00F3, 0x0258, 0x0102, 0x0FDA, 0x0000,
+	0x0FD8, 0x00EB, 0x0258, 0x010B, 0x0FDB, 0x0FFF,
+	0x0FD8, 0x00E3, 0x0258, 0x0112, 0x0FDC, 0x0FFF,
+	0x0FD8, 0x00DC, 0x0257, 0x011B, 0x0FDC, 0x0FFE,
+	0x0FD7, 0x00D4, 0x0256, 0x0123, 0x0FDE, 0x0FFE,
+	0x0FD7, 0x00CD, 0x0255, 0x012B, 0x0FDF, 0x0FFD,
+	0x0FD7, 0x00C5, 0x0254, 0x0133, 0x0FE0, 0x0FFD,
+	0x0FD7, 0x00BE, 0x0252, 0x013C, 0x0FE1, 0x0FFC,
+	0x0FD7, 0x00B6, 0x0251, 0x0143, 0x0FE3, 0x0FFC,
+	0x0FD8, 0x00AF, 0x024F, 0x014B, 0x0FE4, 0x0FFB,
+	0x0FD8, 0x00A8, 0x024C, 0x0154, 0x0FE6, 0x0FFA,
+	0x0FD8, 0x00A1, 0x024A, 0x015B, 0x0FE8, 0x0FFA,
+	0x0FD9, 0x009A, 0x0247, 0x0163, 0x0FEA, 0x0FF9,
+	0x0FD9, 0x0093, 0x0244, 0x016C, 0x0FEC, 0x0FF8,
+	0x0FD9, 0x008C, 0x0241, 0x0174, 0x0FEF, 0x0FF7,
+	0x0FDA, 0x0085, 0x023E, 0x017B, 0x0FF1, 0x0FF7,
+	0x0FDB, 0x007F, 0x023A, 0x0183, 0x0FF3, 0x0FF6,
+	0x0FDB, 0x0078, 0x0237, 0x018B, 0x0FF6, 0x0FF5,
+	0x0FDC, 0x0072, 0x0233, 0x0192, 0x0FF9, 0x0FF4,
+	0x0FDD, 0x006C, 0x022F, 0x0199, 0x0FFC, 0x0FF3,
+	0x0FDD, 0x0065, 0x022A, 0x01A3, 0x0FFF, 0x0FF2,
+	0x0FDE, 0x005F, 0x0226, 0x01AA, 0x0002, 0x0FF1,
+	0x0FDF, 0x005A, 0x0221, 0x01B0, 0x0006, 0x0FF0,
+	0x0FE0, 0x0054, 0x021C, 0x01B7, 0x0009, 0x0FF0,
+	0x0FE1, 0x004E, 0x0217, 0x01BE, 0x000D, 0x0FEF,
+	0x0FE2, 0x0048, 0x0212, 0x01C6, 0x0010, 0x0FEE,
+	0x0FE3, 0x0043, 0x020C, 0x01CD, 0x0014, 0x0FED,
+	0x0FE4, 0x003E, 0x0207, 0x01D3, 0x0018, 0x0FEC,
+	0x0FE5, 0x0039, 0x0200, 0x01DA, 0x001D, 0x0FEB,
+	0x0FE6, 0x0034, 0x01FA, 0x01E1, 0x0021, 0x0FEA,
+	0x0FE7, 0x002F, 0x01F5, 0x01E7, 0x0025, 0x0FE9,
+	0x0FE8, 0x002A, 0x01EE, 0x01EE, 0x002A, 0x0FE8,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.7_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.700000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_70[198] = {
+	0x0FC0, 0x00DA, 0x02CC, 0x00DA, 0x0FC0, 0x0000,
+	0x0FC1, 0x00D0, 0x02CC, 0x00E4, 0x0FBF, 0x0000,
+	0x0FC2, 0x00C6, 0x02CB, 0x00EF, 0x0FBE, 0x0000,
+	0x0FC3, 0x00BC, 0x02CA, 0x00F9, 0x0FBE, 0x0000,
+	0x0FC4, 0x00B2, 0x02C9, 0x0104, 0x0FBD, 0x0000,
+	0x0FC5, 0x00A8, 0x02C7, 0x010F, 0x0FBD, 0x0000,
+	0x0FC7, 0x009F, 0x02C5, 0x0119, 0x0FBC, 0x0000,
+	0x0FC8, 0x0095, 0x02C3, 0x0124, 0x0FBC, 0x0000,
+	0x0FC9, 0x008C, 0x02C0, 0x012F, 0x0FBC, 0x0000,
+	0x0FCB, 0x0083, 0x02BD, 0x0139, 0x0FBC, 0x0000,
+	0x0FCC, 0x007A, 0x02BA, 0x0144, 0x0FBC, 0x0000,
+	0x0FCE, 0x0072, 0x02B6, 0x014D, 0x0FBD, 0x0000,
+	0x0FD0, 0x0069, 0x02B2, 0x0159, 0x0FBD, 0x0FFF,
+	0x0FD1, 0x0061, 0x02AD, 0x0164, 0x0FBE, 0x0FFF,
+	0x0FD3, 0x0059, 0x02A9, 0x016E, 0x0FBF, 0x0FFE,
+	0x0FD4, 0x0051, 0x02A4, 0x017A, 0x0FBF, 0x0FFE,
+	0x0FD6, 0x0049, 0x029E, 0x0184, 0x0FC1, 0x0FFE,
+	0x0FD8, 0x0042, 0x0299, 0x018E, 0x0FC2, 0x0FFD,
+	0x0FD9, 0x003A, 0x0293, 0x019B, 0x0FC3, 0x0FFC,
+	0x0FDB, 0x0033, 0x028D, 0x01A4, 0x0FC5, 0x0FFC,
+	0x0FDC, 0x002D, 0x0286, 0x01AF, 0x0FC7, 0x0FFB,
+	0x0FDE, 0x0026, 0x0280, 0x01BA, 0x0FC8, 0x0FFA,
+	0x0FE0, 0x001F, 0x0279, 0x01C4, 0x0FCB, 0x0FF9,
+	0x0FE1, 0x0019, 0x0272, 0x01CE, 0x0FCD, 0x0FF9,
+	0x0FE3, 0x0013, 0x026A, 0x01D9, 0x0FCF, 0x0FF8,
+	0x0FE4, 0x000D, 0x0263, 0x01E3, 0x0FD2, 0x0FF7,
+	0x0FE6, 0x0008, 0x025B, 0x01EC, 0x0FD5, 0x0FF6,
+	0x0FE7, 0x0002, 0x0253, 0x01F7, 0x0FD8, 0x0FF5,
+	0x0FE9, 0x0FFD, 0x024A, 0x0202, 0x0FDB, 0x0FF3,
+	0x0FEA, 0x0FF8, 0x0242, 0x020B, 0x0FDF, 0x0FF2,
+	0x0FEC, 0x0FF3, 0x0239, 0x0215, 0x0FE2, 0x0FF1,
+	0x0FED, 0x0FEF, 0x0230, 0x021E, 0x0FE6, 0x0FF0,
+	0x0FEF, 0x0FEB, 0x0226, 0x0226, 0x0FEB, 0x0FEF,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.8_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.800000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_80[198] = {
+	0x0FBF, 0x00A1, 0x0340, 0x00A1, 0x0FBF, 0x0000,
+	0x0FC1, 0x0095, 0x0340, 0x00AD, 0x0FBC, 0x0001,
+	0x0FC4, 0x0089, 0x033E, 0x00BA, 0x0FBA, 0x0001,
+	0x0FC6, 0x007D, 0x033D, 0x00C6, 0x0FB8, 0x0002,
+	0x0FC9, 0x0072, 0x033A, 0x00D3, 0x0FB6, 0x0002,
+	0x0FCC, 0x0067, 0x0338, 0x00DF, 0x0FB3, 0x0003,
+	0x0FCE, 0x005C, 0x0334, 0x00EE, 0x0FB1, 0x0003,
+	0x0FD1, 0x0051, 0x0331, 0x00FA, 0x0FAF, 0x0004,
+	0x0FD3, 0x0047, 0x032D, 0x0108, 0x0FAD, 0x0004,
+	0x0FD6, 0x003D, 0x0328, 0x0116, 0x0FAB, 0x0004,
+	0x0FD8, 0x0033, 0x0323, 0x0123, 0x0FAA, 0x0005,
+	0x0FDB, 0x002A, 0x031D, 0x0131, 0x0FA8, 0x0005,
+	0x0FDD, 0x0021, 0x0317, 0x013F, 0x0FA7, 0x0005,
+	0x0FDF, 0x0018, 0x0311, 0x014D, 0x0FA5, 0x0006,
+	0x0FE2, 0x0010, 0x030A, 0x015A, 0x0FA4, 0x0006,
+	0x0FE4, 0x0008, 0x0302, 0x0169, 0x0FA3, 0x0006,
+	0x0FE6, 0x0000, 0x02FB, 0x0177, 0x0FA2, 0x0006,
+	0x0FE8, 0x0FF9, 0x02F3, 0x0185, 0x0FA1, 0x0006,
+	0x0FEB, 0x0FF1, 0x02EA, 0x0193, 0x0FA1, 0x0006,
+	0x0FED, 0x0FEB, 0x02E1, 0x01A1, 0x0FA0, 0x0006,
+	0x0FEE, 0x0FE4, 0x02D8, 0x01B0, 0x0FA0, 0x0006,
+	0x0FF0, 0x0FDE, 0x02CE, 0x01BE, 0x0FA0, 0x0006,
+	0x0FF2, 0x0FD8, 0x02C5, 0x01CB, 0x0FA0, 0x0006,
+	0x0FF4, 0x0FD3, 0x02BA, 0x01D8, 0x0FA1, 0x0006,
+	0x0FF6, 0x0FCD, 0x02B0, 0x01E7, 0x0FA1, 0x0005,
+	0x0FF7, 0x0FC8, 0x02A5, 0x01F5, 0x0FA2, 0x0005,
+	0x0FF9, 0x0FC4, 0x029A, 0x0202, 0x0FA3, 0x0004,
+	0x0FFA, 0x0FC0, 0x028E, 0x0210, 0x0FA4, 0x0004,
+	0x0FFB, 0x0FBC, 0x0283, 0x021D, 0x0FA6, 0x0003,
+	0x0FFD, 0x0FB8, 0x0276, 0x022A, 0x0FA8, 0x0003,
+	0x0FFE, 0x0FB4, 0x026B, 0x0237, 0x0FAA, 0x0002,
+	0x0FFF, 0x0FB1, 0x025E, 0x0245, 0x0FAC, 0x0001,
+	0x0000, 0x0FAE, 0x0252, 0x0252, 0x0FAE, 0x0000,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_0.9_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 0.900000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_0_90[198] = {
+	0x0FD8, 0x0055, 0x03A7, 0x0054, 0x0FD8, 0x0000,
+	0x0FDB, 0x0047, 0x03A7, 0x0063, 0x0FD4, 0x0000,
+	0x0FDF, 0x003B, 0x03A5, 0x006F, 0x0FD1, 0x0001,
+	0x0FE2, 0x002E, 0x03A3, 0x007E, 0x0FCD, 0x0002,
+	0x0FE5, 0x0022, 0x03A0, 0x008D, 0x0FCA, 0x0002,
+	0x0FE8, 0x0017, 0x039D, 0x009B, 0x0FC6, 0x0003,
+	0x0FEB, 0x000C, 0x0398, 0x00AC, 0x0FC2, 0x0003,
+	0x0FEE, 0x0001, 0x0394, 0x00BA, 0x0FBF, 0x0004,
+	0x0FF1, 0x0FF7, 0x038E, 0x00CA, 0x0FBB, 0x0005,
+	0x0FF4, 0x0FED, 0x0388, 0x00DA, 0x0FB8, 0x0005,
+	0x0FF6, 0x0FE4, 0x0381, 0x00EB, 0x0FB4, 0x0006,
+	0x0FF9, 0x0FDB, 0x037A, 0x00FA, 0x0FB1, 0x0007,
+	0x0FFB, 0x0FD3, 0x0372, 0x010B, 0x0FAD, 0x0008,
+	0x0FFD, 0x0FCB, 0x0369, 0x011D, 0x0FAA, 0x0008,
+	0x0000, 0x0FC3, 0x0360, 0x012E, 0x0FA6, 0x0009,
+	0x0002, 0x0FBC, 0x0356, 0x013F, 0x0FA3, 0x000A,
+	0x0003, 0x0FB6, 0x034C, 0x0150, 0x0FA0, 0x000B,
+	0x0005, 0x0FB0, 0x0341, 0x0162, 0x0F9D, 0x000B,
+	0x0007, 0x0FAA, 0x0336, 0x0173, 0x0F9A, 0x000C,
+	0x0008, 0x0FA5, 0x032A, 0x0185, 0x0F97, 0x000D,
+	0x000A, 0x0FA0, 0x031E, 0x0197, 0x0F94, 0x000D,
+	0x000B, 0x0F9B, 0x0311, 0x01A9, 0x0F92, 0x000E,
+	0x000C, 0x0F97, 0x0303, 0x01BC, 0x0F8F, 0x000F,
+	0x000D, 0x0F94, 0x02F6, 0x01CD, 0x0F8D, 0x000F,
+	0x000E, 0x0F91, 0x02E8, 0x01DE, 0x0F8B, 0x0010,
+	0x000F, 0x0F8E, 0x02D9, 0x01F1, 0x0F89, 0x0010,
+	0x0010, 0x0F8B, 0x02CA, 0x0202, 0x0F88, 0x0011,
+	0x0010, 0x0F89, 0x02BB, 0x0214, 0x0F87, 0x0011,
+	0x0011, 0x0F87, 0x02AB, 0x0226, 0x0F86, 0x0011,
+	0x0011, 0x0F86, 0x029C, 0x0236, 0x0F85, 0x0012,
+	0x0011, 0x0F85, 0x028B, 0x0249, 0x0F84, 0x0012,
+	0x0012, 0x0F84, 0x027B, 0x0259, 0x0F84, 0x0012,
+	0x0012, 0x0F84, 0x026A, 0x026A, 0x0F84, 0x0012,
+};
+
+//========================================================
+// <using>			gen_scaler_coeffs_cnf_file.m
+// <using>			make_test_script.m
+// <date>			02-Apr-2024
+// <coeffDescrip>	6t_64p_LanczosEd_p_1_p_10qb_
+// <num_taps>		6
+// <num_phases>		64
+// <scale_ratio>	 input/output = 1.000000000000
+// <CoefType>		LanczosEd
+// <CoefQuant>		S1.10
+//========================================================
+static const uint16_t easf_filter_6tap_64p_ratio_1_00[198] = {
+	0x0000, 0x0000, 0x0400, 0x0000, 0x0000, 0x0000,
+	0x0003, 0x0FF3, 0x0400, 0x000D, 0x0FFD, 0x0000,
+	0x0006, 0x0FE7, 0x03FE, 0x001C, 0x0FF9, 0x0000,
+	0x0009, 0x0FDB, 0x03FC, 0x002B, 0x0FF5, 0x0000,
+	0x000C, 0x0FD0, 0x03F9, 0x003A, 0x0FF1, 0x0000,
+	0x000E, 0x0FC5, 0x03F5, 0x004A, 0x0FED, 0x0001,
+	0x0011, 0x0FBB, 0x03F0, 0x005A, 0x0FE9, 0x0001,
+	0x0013, 0x0FB2, 0x03EB, 0x006A, 0x0FE5, 0x0001,
+	0x0015, 0x0FA9, 0x03E4, 0x007B, 0x0FE1, 0x0002,
+	0x0017, 0x0FA1, 0x03DD, 0x008D, 0x0FDC, 0x0002,
+	0x0018, 0x0F99, 0x03D4, 0x00A0, 0x0FD8, 0x0003,
+	0x001A, 0x0F92, 0x03CB, 0x00B2, 0x0FD3, 0x0004,
+	0x001B, 0x0F8C, 0x03C1, 0x00C6, 0x0FCE, 0x0004,
+	0x001C, 0x0F86, 0x03B7, 0x00D9, 0x0FC9, 0x0005,
+	0x001D, 0x0F80, 0x03AB, 0x00EE, 0x0FC4, 0x0006,
+	0x001E, 0x0F7C, 0x039F, 0x0101, 0x0FBF, 0x0007,
+	0x001F, 0x0F78, 0x0392, 0x0115, 0x0FBA, 0x0008,
+	0x001F, 0x0F74, 0x0385, 0x012B, 0x0FB5, 0x0008,
+	0x0020, 0x0F71, 0x0376, 0x0140, 0x0FB0, 0x0009,
+	0x0020, 0x0F6E, 0x0367, 0x0155, 0x0FAB, 0x000B,
+	0x0020, 0x0F6C, 0x0357, 0x016B, 0x0FA6, 0x000C,
+	0x0020, 0x0F6A, 0x0347, 0x0180, 0x0FA2, 0x000D,
+	0x0020, 0x0F69, 0x0336, 0x0196, 0x0F9D, 0x000E,
+	0x0020, 0x0F69, 0x0325, 0x01AB, 0x0F98, 0x000F,
+	0x001F, 0x0F68, 0x0313, 0x01C3, 0x0F93, 0x0010,
+	0x001F, 0x0F69, 0x0300, 0x01D8, 0x0F8F, 0x0011,
+	0x001E, 0x0F69, 0x02ED, 0x01EF, 0x0F8B, 0x0012,
+	0x001D, 0x0F6A, 0x02D9, 0x0205, 0x0F87, 0x0014,
+	0x001D, 0x0F6C, 0x02C5, 0x021A, 0x0F83, 0x0015,
+	0x001C, 0x0F6E, 0x02B1, 0x0230, 0x0F7F, 0x0016,
+	0x001B, 0x0F70, 0x029C, 0x0247, 0x0F7B, 0x0017,
+	0x001A, 0x0F72, 0x0287, 0x025D, 0x0F78, 0x0018,
+	0x0019, 0x0F75, 0x0272, 0x0272, 0x0F75, 0x0019,
+};
+
+/* Converted scaler coeff tables from S1.10 to S1.12 */
+static uint16_t easf_filter_3tap_64p_ratio_0_30_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_40_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_50_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_60_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_70_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_80_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_0_90_s1_12[99];
+static uint16_t easf_filter_3tap_64p_ratio_1_00_s1_12[99];
+static uint16_t easf_filter_4tap_64p_ratio_0_30_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_40_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_50_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_60_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_70_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_80_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_0_90_s1_12[132];
+static uint16_t easf_filter_4tap_64p_ratio_1_00_s1_12[132];
+static uint16_t easf_filter_6tap_64p_ratio_0_30_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_40_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_50_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_60_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_70_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_80_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_0_90_s1_12[198];
+static uint16_t easf_filter_6tap_64p_ratio_1_00_s1_12[198];
+
+struct scale_ratio_to_reg_value_lookup easf_v_bf3_mode_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0002},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_h_bf3_mode_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0002},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain6_6tap_lookup[] = {
+	{3, 10, 0x4100},
+	{4, 10, 0x4100},
+	{5, 10, 0x4100},
+	{6, 10, 0x4100},
+	{7, 10, 0x4100},
+	{8, 10, 0x4100},
+	{9, 10, 0x4100},
+	{1, 1, 0x4100},
+	{-1, -1, 0x4100},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain4_6tap_lookup[] = {
+	{3, 10, 0x4000},
+	{4, 10, 0x4000},
+	{5, 10, 0x4000},
+	{6, 10, 0x4000},
+	{7, 10, 0x4000},
+	{8, 10, 0x4000},
+	{9, 10, 0x4000},
+	{1, 1, 0x4000},
+	{-1, -1, 0x4000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring6_6tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x251F},
+	{5, 10, 0x291F},
+	{6, 10, 0xA51F},
+	{7, 10, 0xA51F},
+	{8, 10, 0xAA66},
+	{9, 10, 0xA51F},
+	{1, 1, 0xA640},
+	{-1, -1, 0xA640},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring4_6tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x9600},
+	{5, 10, 0xA460},
+	{6, 10, 0xA8E0},
+	{7, 10, 0xAC00},
+	{8, 10, 0xAD20},
+	{9, 10, 0xAFC0},
+	{1, 1, 0xB058},
+	{-1, -1, 0xB058},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain6_4tap_lookup[] = {
+	{3, 10, 0x4100},
+	{4, 10, 0x4100},
+	{5, 10, 0x4100},
+	{6, 10, 0x4100},
+	{7, 10, 0x4100},
+	{8, 10, 0x4100},
+	{9, 10, 0x4100},
+	{1, 1, 0x4100},
+	{-1, -1, 0x4100},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_reducer_gain4_4tap_lookup[] = {
+	{3, 10, 0x4000},
+	{4, 10, 0x4000},
+	{5, 10, 0x4000},
+	{6, 10, 0x4000},
+	{7, 10, 0x4000},
+	{8, 10, 0x4000},
+	{9, 10, 0x4000},
+	{1, 1, 0x4000},
+	{-1, -1, 0x4000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring6_4tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x0000},
+	{1, 1, 0x0000},
+	{-1, -1, 0x0000},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_gain_ring4_4tap_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x9900},
+	{7, 10, 0xA100},
+	{8, 10, 0xA8C0},
+	{9, 10, 0xAB20},
+	{1, 1, 0xAC00},
+	{-1, -1, 0xAC00},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_dntilt_uptilt_offset_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x4100},
+	{9, 10, 0x9F00},
+	{1, 1, 0xA4C0},
+	{-1, -1, 0xA8D8},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt_maxval_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x4000},
+	{9, 10, 0x24FE},
+	{1, 1, 0x2D64},
+	{-1, -1, 0x3ADB},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_dntilt_slope_lookup[] = {
+	{3, 10, 0x3800},
+	{4, 10, 0x3800},
+	{5, 10, 0x3800},
+	{6, 10, 0x3800},
+	{7, 10, 0x3800},
+	{8, 10, 0x3886},
+	{9, 10, 0x3940},
+	{1, 1, 0x3A4E},
+	{-1, -1, 0x3B66},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt1_slope_lookup[] = {
+	{3, 10, 0x3800},
+	{4, 10, 0x3800},
+	{5, 10, 0x3800},
+	{6, 10, 0x3800},
+	{7, 10, 0x3800},
+	{8, 10, 0x36F4},
+	{9, 10, 0x359C},
+	{1, 1, 0x3360},
+	{-1, -1, 0x2F20},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt2_slope_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x359C},
+	{1, 1, 0x31F0},
+	{-1, -1, 0x1F00},
+};
+
+struct scale_ratio_to_reg_value_lookup easf_3tap_uptilt2_offset_lookup[] = {
+	{3, 10, 0x0000},
+	{4, 10, 0x0000},
+	{5, 10, 0x0000},
+	{6, 10, 0x0000},
+	{7, 10, 0x0000},
+	{8, 10, 0x0000},
+	{9, 10, 0x9F00},
+	{1, 1, 0xA400},
+	{-1, -1, 0x9E00},
+};
+
+void spl_init_easf_filter_coeffs(void)
+{
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_30,
+		easf_filter_3tap_64p_ratio_0_30_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_40,
+		easf_filter_3tap_64p_ratio_0_40_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_50,
+		easf_filter_3tap_64p_ratio_0_50_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_60,
+		easf_filter_3tap_64p_ratio_0_60_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_70,
+		easf_filter_3tap_64p_ratio_0_70_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_80,
+		easf_filter_3tap_64p_ratio_0_80_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_0_90,
+		easf_filter_3tap_64p_ratio_0_90_s1_12, 3);
+	convert_filter_s1_10_to_s1_12(easf_filter_3tap_64p_ratio_1_00,
+		easf_filter_3tap_64p_ratio_1_00_s1_12, 3);
+
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_30,
+		easf_filter_4tap_64p_ratio_0_30_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_40,
+		easf_filter_4tap_64p_ratio_0_40_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_50,
+		easf_filter_4tap_64p_ratio_0_50_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_60,
+		easf_filter_4tap_64p_ratio_0_60_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_70,
+		easf_filter_4tap_64p_ratio_0_70_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_80,
+		easf_filter_4tap_64p_ratio_0_80_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_0_90,
+		easf_filter_4tap_64p_ratio_0_90_s1_12, 4);
+	convert_filter_s1_10_to_s1_12(easf_filter_4tap_64p_ratio_1_00,
+		easf_filter_4tap_64p_ratio_1_00_s1_12, 4);
+
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_30,
+		easf_filter_6tap_64p_ratio_0_30_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_40,
+		easf_filter_6tap_64p_ratio_0_40_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_50,
+		easf_filter_6tap_64p_ratio_0_50_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_60,
+		easf_filter_6tap_64p_ratio_0_60_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_70,
+		easf_filter_6tap_64p_ratio_0_70_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_80,
+		easf_filter_6tap_64p_ratio_0_80_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_0_90,
+		easf_filter_6tap_64p_ratio_0_90_s1_12, 6);
+	convert_filter_s1_10_to_s1_12(easf_filter_6tap_64p_ratio_1_00,
+		easf_filter_6tap_64p_ratio_1_00_s1_12, 6);
+}
+
+uint16_t *spl_get_easf_filter_3tap_64p(struct fixed31_32 ratio)
+{
+	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+		return easf_filter_3tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+		return easf_filter_3tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+		return easf_filter_3tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+		return easf_filter_3tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+		return easf_filter_3tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+		return easf_filter_3tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+		return easf_filter_3tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_3tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_get_easf_filter_4tap_64p(struct fixed31_32 ratio)
+{
+	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+		return easf_filter_4tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+		return easf_filter_4tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+		return easf_filter_4tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+		return easf_filter_4tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+		return easf_filter_4tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+		return easf_filter_4tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+		return easf_filter_4tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_4tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_get_easf_filter_6tap_64p(struct fixed31_32 ratio)
+{
+	if (ratio.value < dc_fixpt_from_fraction(3, 10).value)
+		return easf_filter_6tap_64p_ratio_0_30_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(4, 10).value)
+		return easf_filter_6tap_64p_ratio_0_40_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(5, 10).value)
+		return easf_filter_6tap_64p_ratio_0_50_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(6, 10).value)
+		return easf_filter_6tap_64p_ratio_0_60_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(7, 10).value)
+		return easf_filter_6tap_64p_ratio_0_70_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(8, 10).value)
+		return easf_filter_6tap_64p_ratio_0_80_s1_12;
+	else if (ratio.value < dc_fixpt_from_fraction(9, 10).value)
+		return easf_filter_6tap_64p_ratio_0_90_s1_12;
+	else
+		return easf_filter_6tap_64p_ratio_1_00_s1_12;
+}
+
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
+{
+	if (taps == 6)
+		return spl_get_easf_filter_6tap_64p(ratio);
+	else if (taps == 4)
+		return spl_get_easf_filter_4tap_64p(ratio);
+	else if (taps == 3)
+		return spl_get_easf_filter_3tap_64p(ratio);
+	else {
+		/* should never happen, bug */
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
+void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
+		const struct spl_scaler_data *data, bool enable_easf_v,
+		bool enable_easf_h)
+{
+	/*
+	 * Old coefficients calculated scaling ratio = input / output
+	 * New coefficients are calculated based on = output / input
+	 */
+	if (enable_easf_h) {
+		dscl_prog_data->filter_h = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.h_taps, data->recip_ratios.horz);
+
+		dscl_prog_data->filter_h_c = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.h_taps_c, data->recip_ratios.horz_c);
+	} else {
+		dscl_prog_data->filter_h = spl_dscl_get_filter_coeffs_64p(
+			data->taps.h_taps, data->ratios.horz);
+
+		dscl_prog_data->filter_h_c = spl_dscl_get_filter_coeffs_64p(
+			data->taps.h_taps_c, data->ratios.horz_c);
+	}
+	if (enable_easf_v) {
+		dscl_prog_data->filter_v = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.v_taps, data->recip_ratios.vert);
+
+		dscl_prog_data->filter_v_c = spl_dscl_get_easf_filter_coeffs_64p(
+			data->taps.v_taps_c, data->recip_ratios.vert_c);
+	} else {
+		dscl_prog_data->filter_v = spl_dscl_get_filter_coeffs_64p(
+			data->taps.v_taps, data->ratios.vert);
+
+		dscl_prog_data->filter_v_c = spl_dscl_get_filter_coeffs_64p(
+			data->taps.v_taps_c, data->ratios.vert_c);
+	}
+}
+
+static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct fixed31_32 ratio,
+	struct scale_ratio_to_reg_value_lookup *lookup_table_base_ptr,
+	unsigned int num_entries)
+{
+	unsigned int count = 0;
+	uint32_t value = 0;
+	struct scale_ratio_to_reg_value_lookup *lookup_table_index_ptr;
+
+	lookup_table_index_ptr = (lookup_table_base_ptr + num_entries - 1);
+	value = lookup_table_index_ptr->reg_value;
+
+	while (count < num_entries) {
+
+		lookup_table_index_ptr = (lookup_table_base_ptr + count);
+		if (lookup_table_index_ptr->numer < 0)
+			break;
+
+		if (ratio.value < dc_fixpt_from_fraction(
+			lookup_table_index_ptr->numer,
+			lookup_table_index_ptr->denom).value) {
+			value = lookup_table_index_ptr->reg_value;
+			break;
+		}
+
+		count++;
+	}
+	return value;
+}
+uint32_t spl_get_v_bf3_mode(struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
+		sizeof(struct scale_ratio_to_reg_value_lookup);
+	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+		easf_v_bf3_mode_lookup, num_entries);
+	return value;
+}
+uint32_t spl_get_h_bf3_mode(struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
+		sizeof(struct scale_ratio_to_reg_value_lookup);
+	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+		easf_h_bf3_mode_lookup, num_entries);
+	return value;
+}
+uint32_t spl_get_reducer_gain6(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_reducer_gain6_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain6_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_reducer_gain6_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain6_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_reducer_gain4(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_reducer_gain4_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain4_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_reducer_gain4_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_reducer_gain4_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_gainRing6(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_gain_ring6_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring6_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_gain_ring6_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring6_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_gainRing4(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 4) {
+		num_entries = sizeof(easf_gain_ring4_4tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring4_4tap_lookup, num_entries);
+	} else if (taps == 6) {
+		num_entries = sizeof(easf_gain_ring4_6tap_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_gain_ring4_6tap_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_dntilt_uptilt_offset_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_dntilt_uptilt_offset_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt_maxval_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt_maxval_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_dntilt_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_dntilt_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt1_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt1_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt2_slope_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt2_slope_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct fixed31_32 ratio)
+{
+	uint32_t value;
+	unsigned int num_entries;
+
+	if (taps == 3) {
+		num_entries = sizeof(easf_3tap_uptilt2_offset_lookup) /
+			sizeof(struct scale_ratio_to_reg_value_lookup);
+		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
+			easf_3tap_uptilt2_offset_lookup, num_entries);
+	} else
+		value = 0;
+	return value;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
new file mode 100644
index 000000000000..542b5ce1a385
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright 2024 Advanced Micro Devices, Inc. */
+
+#ifndef __DC_SPL_SCL_EASF_FILTERS_H__
+#define __DC_SPL_SCL_EASF_FILTERS_H__
+
+#include "dc_spl_types.h"
+
+struct scale_ratio_to_reg_value_lookup {
+	int numer;
+	int denom;
+	const uint32_t reg_value;
+};
+
+void spl_init_easf_filter_coeffs(void);
+uint16_t *spl_get_easf_filter_3tap_64p(struct fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_4tap_64p(struct fixed31_32 ratio);
+uint16_t *spl_get_easf_filter_6tap_64p(struct fixed31_32 ratio);
+uint16_t *spl_dscl_get_easf_filter_coeffs_64p(int taps, struct fixed31_32 ratio);
+void spl_set_filters_data(struct dscl_prog_data *dscl_prog_data,
+	const struct spl_scaler_data *data, bool enable_easf_v,
+	bool enable_easf_h);
+
+uint32_t spl_get_v_bf3_mode(struct fixed31_32 ratio);
+uint32_t spl_get_h_bf3_mode(struct fixed31_32 ratio);
+uint32_t spl_get_reducer_gain6(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_reducer_gain4(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_gainRing6(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_gainRing4(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt_maxval(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_dntilt_slope(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt1_slope(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_slope(int taps, struct fixed31_32 ratio);
+uint32_t spl_get_3tap_uptilt2_offset(int taps, struct fixed31_32 ratio);
+
+#endif /* __DC_SPL_SCL_EASF_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
index c174b2e8a150..156f8171e44f 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
@@ -1423,3 +1423,29 @@ const uint16_t *spl_get_filter_2tap_64p(void)
 {
 	return filter_2tap_64p;
 }
+
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio)
+{
+	if (taps == 8)
+		return spl_get_filter_8tap_64p(ratio);
+	else if (taps == 7)
+		return spl_get_filter_7tap_64p(ratio);
+	else if (taps == 6)
+		return spl_get_filter_6tap_64p(ratio);
+	else if (taps == 5)
+		return spl_get_filter_5tap_64p(ratio);
+	else if (taps == 4)
+		return spl_get_filter_4tap_64p(ratio);
+	else if (taps == 3)
+		return spl_get_filter_3tap_64p(ratio);
+	else if (taps == 2)
+		return spl_get_filter_2tap_64p();
+	else if (taps == 1)
+		return NULL;
+	else {
+		/* should never happen, bug */
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
index 6d96aca53b24..27590846d92a 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
@@ -17,43 +17,6 @@ const uint16_t *spl_get_filter_7tap_64p(struct fixed31_32 ratio);
 const uint16_t *spl_get_filter_8tap_64p(struct fixed31_32 ratio);
 const uint16_t *spl_get_filter_2tap_16p(void);
 const uint16_t *spl_get_filter_2tap_64p(void);
-const uint16_t *spl_get_filter_3tap_16p_upscale(void);
-const uint16_t *spl_get_filter_3tap_16p_116(void);
-const uint16_t *spl_get_filter_3tap_16p_149(void);
-const uint16_t *spl_get_filter_3tap_16p_183(void);
+const uint16_t *spl_dscl_get_filter_coeffs_64p(int taps, struct fixed31_32 ratio);
 
-const uint16_t *spl_get_filter_4tap_16p_upscale(void);
-const uint16_t *spl_get_filter_4tap_16p_116(void);
-const uint16_t *spl_get_filter_4tap_16p_149(void);
-const uint16_t *spl_get_filter_4tap_16p_183(void);
-
-const uint16_t *spl_get_filter_3tap_64p_upscale(void);
-const uint16_t *spl_get_filter_3tap_64p_116(void);
-const uint16_t *spl_get_filter_3tap_64p_149(void);
-const uint16_t *spl_get_filter_3tap_64p_183(void);
-
-const uint16_t *spl_get_filter_4tap_64p_upscale(void);
-const uint16_t *spl_get_filter_4tap_64p_116(void);
-const uint16_t *spl_get_filter_4tap_64p_149(void);
-const uint16_t *spl_get_filter_4tap_64p_183(void);
-
-const uint16_t *spl_get_filter_5tap_64p_upscale(void);
-const uint16_t *spl_get_filter_5tap_64p_116(void);
-const uint16_t *spl_get_filter_5tap_64p_149(void);
-const uint16_t *spl_get_filter_5tap_64p_183(void);
-
-const uint16_t *spl_get_filter_6tap_64p_upscale(void);
-const uint16_t *spl_get_filter_6tap_64p_116(void);
-const uint16_t *spl_get_filter_6tap_64p_149(void);
-const uint16_t *spl_get_filter_6tap_64p_183(void);
-
-const uint16_t *spl_get_filter_7tap_64p_upscale(void);
-const uint16_t *spl_get_filter_7tap_64p_116(void);
-const uint16_t *spl_get_filter_7tap_64p_149(void);
-const uint16_t *spl_get_filter_7tap_64p_183(void);
-
-const uint16_t *spl_get_filter_8tap_64p_upscale(void);
-const uint16_t *spl_get_filter_8tap_64p_116(void);
-const uint16_t *spl_get_filter_8tap_64p_149(void);
-const uint16_t *spl_get_filter_8tap_64p_183(void);
 #endif /* __DC_SPL_SCL_FILTERS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
index 201201d3f55b..865e2095ed0d 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
@@ -81,6 +81,8 @@ enum spl_pixel_format {
 	SPL_PIXEL_FORMAT_420BPP10,
 	/*end of pixel format definition*/
 	SPL_PIXEL_FORMAT_INVALID,
+	SPL_PIXEL_FORMAT_422BPP8,
+	SPL_PIXEL_FORMAT_422BPP10,
 	SPL_PIXEL_FORMAT_GRPH_BEGIN = SPL_PIXEL_FORMAT_INDEX8,
 	SPL_PIXEL_FORMAT_GRPH_END = SPL_PIXEL_FORMAT_FP16,
 	SPL_PIXEL_FORMAT_VIDEO_BEGIN = SPL_PIXEL_FORMAT_420BPP8,
@@ -120,6 +122,13 @@ enum spl_color_space {
 	SPL_COLOR_SPACE_YCBCR709_BLACK,
 };
 
+enum chroma_cositing {
+        CHROMA_COSITING_NONE,
+        CHROMA_COSITING_LEFT,
+        CHROMA_COSITING_TOPLEFT,
+        CHROMA_COSITING_COUNT
+};
+
 // Scratch space for calculating scaler params
 struct spl_scaler_data {
 	int h_active;
@@ -129,6 +138,7 @@ struct spl_scaler_data {
 	struct spl_rect viewport_c;
 	struct spl_rect recout;
 	struct spl_ratios ratios;
+	struct spl_ratios recip_ratios;
 	struct spl_inits inits;
 };
 
@@ -485,6 +495,8 @@ struct spl_in	{
 	bool prefer_easf;
 	bool disable_easf;
 	struct spl_debug debug;
+	bool is_fullscreen;
+	bool is_hdr_on;
 };
 // end of SPL inputs
 
-- 
2.34.1

