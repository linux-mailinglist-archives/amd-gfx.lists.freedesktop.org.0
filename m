Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B4576ECC
	for <lists+amd-gfx@lfdr.de>; Sat, 16 Jul 2022 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C4A10E58C;
	Sat, 16 Jul 2022 14:35:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE5310E275
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Jul 2022 18:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFHr0A1Nqy2cXU+P0kxtwo+S07IiUdxV3TyRtaeFtz2G5bTHeWS7FPZwjnvNiucUcQEcjlUbuNVRJHbLTJ7HGrDIaDZQ9pEiR+qNVzOsrsANde9iuBLfJXO/chKgC9Z4FSSejVmcCb32XKtt5B5299gT8iV5ixE9nDEBGBCQ+EMba1hAxazzplvdW6f+6Uvc93+DcBxc4iOi0ctslgto4fJlF0UgUsX8Bpv2XDEhMnlAy6+xjVKY/F1CzIbMnM+jP5wTQoMxyGQ5lIiVNpSc7/AHaDV0vhKk5vMd9HcW27p/rn46Y7M174K8cSeg6AZ5nWs7QxHCWdE7pESSh6VQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wzgn06NjmrVAThyzYQSrpYbcxDgcWvrtEjdXr/eJRY=;
 b=fEG4WB4/B/XctOi3szvoMe6iS+foQuRTkoIL1N7wk39ltFX8sifDBZO8lKIg7dDqNTVR93BS4K8B7U5gGFGgare1MGT90HjQTiiAA01/kMYbOYstY9u1Tvoxsa/xquEBAipzAfKDiLpmcdXce7gKKQINALz6YO/7/oiTMKvUILBjbCq32cZ3fnW2Id2P8IpKnmlC0hzmjfHm5hW4RSuGCFSo7Tb4AkXPjN4Hz4DVv6jQg5MUHiZAX1x3edHuclfFAEEgEBHx88eCS/qxTgr8hO5THfTw9/UPW4yqSsmqoWh0DvUUPAKaJBH2ATOQOyq1tco/QfEyDH5XxjsEd+Ysqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wzgn06NjmrVAThyzYQSrpYbcxDgcWvrtEjdXr/eJRY=;
 b=MldoJZJ7Nd7jz783H6vczdZfYsKxFtDkgI9tF2KB/LR88ProzEQi+0trn6BhmF89j1nWgpcXgdkSqv+LEV0gNoejv9020Wc0UIMol52bYa55UVDWFVCw3AKHsbq+fat2+8YYGdPdPQc7LUm5593lm+D60M351NoKtTV9Iz2U+DI=
Received: from MW4PR03CA0132.namprd03.prod.outlook.com (2603:10b6:303:8c::17)
 by DM6PR12MB3851.namprd12.prod.outlook.com (2603:10b6:5:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Fri, 15 Jul
 2022 18:17:41 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::58) by MW4PR03CA0132.outlook.office365.com
 (2603:10b6:303:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20 via Frontend
 Transport; Fri, 15 Jul 2022 18:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 18:17:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 13:17:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 13:17:36 -0500
Received: from arch-sec.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 15 Jul 2022 13:17:35 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/31] drm/amd/display: Create a file dedicated to planes
Date: Fri, 15 Jul 2022 14:16:42 -0400
Message-ID: <20220715181705.1030401-9-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715181705.1030401-1-Rodrigo.Siqueira@amd.com>
References: <20220715181705.1030401-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d230ee-ae8b-4c07-0e77-08da668e4e41
X-MS-TrafficTypeDiagnostic: DM6PR12MB3851:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvbiXn03Q+1LeLgu4+XCX30QCTErTw1RvrFA6vbiIB2F7EZ6ChYvdidOIUTPi6lFMu9kvf/hwCpHaXAT3yepO7fUVeDU8Bp4IWy0MnJRfAQszqiqov1sIlQf3Ll+cE3qMnPc84ty3XlxPXPNbdDfTiRBzPeP4LZTEE3M8rNJBdt/IaXLEDaKJszRbBzn5mNfDBuGhthk0477mm8lH/BTLVUoPQbBKQgq1SGKyH8pyDabyp44Ei9c2RElXu66pjpfczW++bMvf6cowfkXDJoh6h/3V00B2WHje31sle/rgjVCTqnErhUxioPvPA9QlXP5wgeHkGuFZtrEO0EguK9rbF1Z1Ot3MLTYjShUZ6bco3A/SxRK8Usf2mBJb8thViyLwLcpmeCzb4Bwb7hbTFng2ogb4/lMrPeRfOVpe+gUOtU9X4+qb45s5gz2WAhIUthZGiUJdiEx14v/xEGK8MocLp49XzoJZeDY/VyI69pQEVX0LR61+Xj2h47wiEURaDh2MIazw8+F2ernjLvNvD+9tE9ucE7GOuVTAGTfnuIRbQk4Sf4bySXFWowzS+Nzlk2pb8YmM1iFr/BrqJEywqpIneI5Usu4n7/ERtmmBa0feyRY4QJZxPlXvLzxc3yHNplgmIm/H2YaagfzP4AW9irunHTSkDd45HrKtkFpjFUH+/q094L+dpZtBVCeHMg8Bp7VmGXuJZ1BDloQBxDaAYiuBx32GaUUR/DGW4ej0aNOQ4axGXrphP8giu/2Jo7fq+OLpq+is/wkUk4UyXimB7il3cPYbjH14vVUexcospYWrlABeTQqeC8KWsDoBNUl1xyAgrc6+pX2prrDTeTy8EorZEdM1EvbQ5sjjZLqpdKEhDEDYYf73Y0Ip9XsJ1eH5hUC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(40470700004)(70586007)(70206006)(82310400005)(2616005)(47076005)(356005)(1076003)(40460700003)(336012)(478600001)(426003)(6666004)(8676002)(186003)(316002)(6916009)(83380400001)(8936002)(86362001)(5660300002)(30864003)(81166007)(26005)(41300700001)(4326008)(54906003)(36860700001)(40480700001)(82740400003)(2906002)(36756003)(21314003)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 18:17:40.8747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d230ee-ae8b-4c07-0e77-08da668e4e41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3851
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
 roman.li@amd.com, solomon.chiu@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
The amdgpu_dm file contains most of the code that works as an interface
between DRM API and DC. As a result, this file becomes very large since
it comprises multiple abstractions such as plane manipulation.

[How]
This commit extracts the plane code to its specific file named
amdgpu_dm_plane. This change does not change anything inside the
functions; the only exception is converting some static functions to a
global function.

Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |    7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2135 +++--------------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 1637 +++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   73 +
 4 files changed, 2057 insertions(+), 1795 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 718e123a3230..ec559ea902a3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -25,7 +25,12 @@
 
 
 
-AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
+AMDGPUDM = \
+	amdgpu_dm.o \
+	amdgpu_dm_plane.o \
+	amdgpu_dm_irq.o \
+	amdgpu_dm_mst_types.o \
+	amdgpu_dm_color.o
 
 ifdef CONFIG_DRM_AMD_DC_DCN
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dae998e014b0..ceac70e93ece 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -46,6 +46,7 @@
 #include "amdgpu_ucode.h"
 #include "atom.h"
 #include "amdgpu_dm.h"
+#include "amdgpu_dm_plane.h"
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 #include "amdgpu_dm_hdcp.h"
 #include <drm/drm_hdcp.h>
@@ -203,10 +204,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev);
 /* removes and deallocates the drm structures, created by the above function */
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm);
 
-static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
-				struct drm_plane *plane,
-				unsigned long possible_crtcs,
-				const struct dc_plane_cap *plane_cap);
 static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			       struct drm_plane *plane,
 			       uint32_t link_index);
@@ -225,12 +222,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state);
 static int amdgpu_dm_atomic_check(struct drm_device *dev,
 				  struct drm_atomic_state *state);
 
-static void handle_cursor_update(struct drm_plane *plane,
-				 struct drm_plane_state *old_plane_state);
-
-static const struct drm_format_info *
-amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
-
 static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector);
 static void handle_hpd_rx_irq(void *param);
 
@@ -4315,11 +4306,11 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 1, 2):
 	case IP_VERSION(3, 1, 3):
-	case IP_VERSION(3, 1, 4):
 	case IP_VERSION(3, 1, 5):
 	case IP_VERSION(3, 1, 6):
 	case IP_VERSION(3, 2, 0):
 	case IP_VERSION(3, 2, 1):
+	case IP_VERSION(3, 1, 4):
 	case IP_VERSION(2, 1, 0):
 		if (register_outbox_irq_handlers(dm->adev)) {
 			DRM_ERROR("DM: Failed to initialize IRQ\n");
@@ -4707,1104 +4698,222 @@ static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
 	.destroy = amdgpu_dm_encoder_destroy,
 };
 
-
-static void get_min_max_dc_plane_scaling(struct drm_device *dev,
-					 struct drm_framebuffer *fb,
-					 int *min_downscale, int *max_upscale)
-{
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dc *dc = adev->dm.dc;
-	/* Caps for all supported planes are the same on DCE and DCN 1 - 3 */
-	struct dc_plane_cap *plane_cap = &dc->caps.planes[0];
-
-	switch (fb->format->format) {
-	case DRM_FORMAT_P010:
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_NV21:
-		*max_upscale = plane_cap->max_upscale_factor.nv12;
-		*min_downscale = plane_cap->max_downscale_factor.nv12;
-		break;
-
-	case DRM_FORMAT_XRGB16161616F:
-	case DRM_FORMAT_ARGB16161616F:
-	case DRM_FORMAT_XBGR16161616F:
-	case DRM_FORMAT_ABGR16161616F:
-		*max_upscale = plane_cap->max_upscale_factor.fp16;
-		*min_downscale = plane_cap->max_downscale_factor.fp16;
-		break;
-
-	default:
-		*max_upscale = plane_cap->max_upscale_factor.argb8888;
-		*min_downscale = plane_cap->max_downscale_factor.argb8888;
-		break;
-	}
-
-	/*
-	 * A factor of 1 in the plane_cap means to not allow scaling, ie. use a
-	 * scaling factor of 1.0 == 1000 units.
-	 */
-	if (*max_upscale == 1)
-		*max_upscale = 1000;
-
-	if (*min_downscale == 1)
-		*min_downscale = 1000;
-}
-
-
-static int fill_dc_scaling_info(struct amdgpu_device *adev,
-				const struct drm_plane_state *state,
-				struct dc_scaling_info *scaling_info)
+static int
+fill_plane_color_attributes(const struct drm_plane_state *plane_state,
+			    const enum surface_pixel_format format,
+			    enum dc_color_space *color_space)
 {
-	int scale_w, scale_h, min_downscale, max_upscale;
-
-	memset(scaling_info, 0, sizeof(*scaling_info));
-
-	/* Source is fixed 16.16 but we ignore mantissa for now... */
-	scaling_info->src_rect.x = state->src_x >> 16;
-	scaling_info->src_rect.y = state->src_y >> 16;
+	bool full_range;
 
-	/*
-	 * For reasons we don't (yet) fully understand a non-zero
-	 * src_y coordinate into an NV12 buffer can cause a
-	 * system hang on DCN1x.
-	 * To avoid hangs (and maybe be overly cautious)
-	 * let's reject both non-zero src_x and src_y.
-	 *
-	 * We currently know of only one use-case to reproduce a
-	 * scenario with non-zero src_x and src_y for NV12, which
-	 * is to gesture the YouTube Android app into full screen
-	 * on ChromeOS.
-	 */
-	if (((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
-	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1))) &&
-	    (state->fb && state->fb->format->format == DRM_FORMAT_NV12 &&
-	    (scaling_info->src_rect.x != 0 || scaling_info->src_rect.y != 0)))
-		return -EINVAL;
+	*color_space = COLOR_SPACE_SRGB;
 
-	scaling_info->src_rect.width = state->src_w >> 16;
-	if (scaling_info->src_rect.width == 0)
-		return -EINVAL;
+	/* DRM color properties only affect non-RGB formats. */
+	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
+		return 0;
 
-	scaling_info->src_rect.height = state->src_h >> 16;
-	if (scaling_info->src_rect.height == 0)
-		return -EINVAL;
+	full_range = (plane_state->color_range == DRM_COLOR_YCBCR_FULL_RANGE);
 
-	scaling_info->dst_rect.x = state->crtc_x;
-	scaling_info->dst_rect.y = state->crtc_y;
+	switch (plane_state->color_encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		if (full_range)
+			*color_space = COLOR_SPACE_YCBCR601;
+		else
+			*color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		break;
 
-	if (state->crtc_w == 0)
-		return -EINVAL;
+	case DRM_COLOR_YCBCR_BT709:
+		if (full_range)
+			*color_space = COLOR_SPACE_YCBCR709;
+		else
+			*color_space = COLOR_SPACE_YCBCR709_LIMITED;
+		break;
 
-	scaling_info->dst_rect.width = state->crtc_w;
+	case DRM_COLOR_YCBCR_BT2020:
+		if (full_range)
+			*color_space = COLOR_SPACE_2020_YCBCR;
+		else
+			return -EINVAL;
+		break;
 
-	if (state->crtc_h == 0)
+	default:
 		return -EINVAL;
-
-	scaling_info->dst_rect.height = state->crtc_h;
-
-	/* DRM doesn't specify clipping on destination output. */
-	scaling_info->clip_rect = scaling_info->dst_rect;
-
-	/* Validate scaling per-format with DC plane caps */
-	if (state->plane && state->plane->dev && state->fb) {
-		get_min_max_dc_plane_scaling(state->plane->dev, state->fb,
-					     &min_downscale, &max_upscale);
-	} else {
-		min_downscale = 250;
-		max_upscale = 16000;
 	}
 
-	scale_w = scaling_info->dst_rect.width * 1000 /
-		  scaling_info->src_rect.width;
-
-	if (scale_w < min_downscale || scale_w > max_upscale)
-		return -EINVAL;
-
-	scale_h = scaling_info->dst_rect.height * 1000 /
-		  scaling_info->src_rect.height;
-
-	if (scale_h < min_downscale || scale_h > max_upscale)
-		return -EINVAL;
-
-	/*
-	 * The "scaling_quality" can be ignored for now, quality = 0 has DC
-	 * assume reasonable defaults based on the format.
-	 */
-
 	return 0;
 }
 
-static void
-fill_gfx8_tiling_info_from_flags(union dc_tiling_info *tiling_info,
-				 uint64_t tiling_flags)
-{
-	/* Fill GFX8 params */
-	if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE) == DC_ARRAY_2D_TILED_THIN1) {
-		unsigned int bankw, bankh, mtaspect, tile_split, num_banks;
-
-		bankw = AMDGPU_TILING_GET(tiling_flags, BANK_WIDTH);
-		bankh = AMDGPU_TILING_GET(tiling_flags, BANK_HEIGHT);
-		mtaspect = AMDGPU_TILING_GET(tiling_flags, MACRO_TILE_ASPECT);
-		tile_split = AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT);
-		num_banks = AMDGPU_TILING_GET(tiling_flags, NUM_BANKS);
-
-		/* XXX fix me for VI */
-		tiling_info->gfx8.num_banks = num_banks;
-		tiling_info->gfx8.array_mode =
-				DC_ARRAY_2D_TILED_THIN1;
-		tiling_info->gfx8.tile_split = tile_split;
-		tiling_info->gfx8.bank_width = bankw;
-		tiling_info->gfx8.bank_height = bankh;
-		tiling_info->gfx8.tile_aspect = mtaspect;
-		tiling_info->gfx8.tile_mode =
-				DC_ADDR_SURF_MICRO_TILING_DISPLAY;
-	} else if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE)
-			== DC_ARRAY_1D_TILED_THIN1) {
-		tiling_info->gfx8.array_mode = DC_ARRAY_1D_TILED_THIN1;
-	}
-
-	tiling_info->gfx8.pipe_config =
-			AMDGPU_TILING_GET(tiling_flags, PIPE_CONFIG);
-}
-
-static void
-fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
-				  union dc_tiling_info *tiling_info)
-{
-	tiling_info->gfx9.num_pipes =
-		adev->gfx.config.gb_addr_config_fields.num_pipes;
-	tiling_info->gfx9.num_banks =
-		adev->gfx.config.gb_addr_config_fields.num_banks;
-	tiling_info->gfx9.pipe_interleave =
-		adev->gfx.config.gb_addr_config_fields.pipe_interleave_size;
-	tiling_info->gfx9.num_shader_engines =
-		adev->gfx.config.gb_addr_config_fields.num_se;
-	tiling_info->gfx9.max_compressed_frags =
-		adev->gfx.config.gb_addr_config_fields.max_compress_frags;
-	tiling_info->gfx9.num_rb_per_se =
-		adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
-	tiling_info->gfx9.shaderEnable = 1;
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
-		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
-}
-
 static int
-validate_dcc(struct amdgpu_device *adev,
-	     const enum surface_pixel_format format,
-	     const enum dc_rotation_angle rotation,
-	     const union dc_tiling_info *tiling_info,
-	     const struct dc_plane_dcc_param *dcc,
-	     const struct dc_plane_address *address,
-	     const struct plane_size *plane_size)
+fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
+			    const struct drm_plane_state *plane_state,
+			    const uint64_t tiling_flags,
+			    struct dc_plane_info *plane_info,
+			    struct dc_plane_address *address,
+			    bool tmz_surface,
+			    bool force_disable_dcc)
 {
-	struct dc *dc = adev->dm.dc;
-	struct dc_dcc_surface_param input;
-	struct dc_surface_dcc_cap output;
-
-	memset(&input, 0, sizeof(input));
-	memset(&output, 0, sizeof(output));
+	const struct drm_framebuffer *fb = plane_state->fb;
+	const struct amdgpu_framebuffer *afb =
+		to_amdgpu_framebuffer(plane_state->fb);
+	int ret;
 
-	if (!dcc->enable)
-		return 0;
+	memset(plane_info, 0, sizeof(*plane_info));
 
-	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN ||
-	    !dc->cap_funcs.get_dcc_compression_cap)
+	switch (fb->format->format) {
+	case DRM_FORMAT_C8:
+		plane_info->format =
+			SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS;
+		break;
+	case DRM_FORMAT_RGB565:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_RGB565;
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
+		break;
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB2101010;
+		break;
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010;
+		break;
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR8888;
+		break;
+	case DRM_FORMAT_NV21:
+		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr;
+		break;
+	case DRM_FORMAT_NV12:
+		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb;
+		break;
+	case DRM_FORMAT_P010:
+		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb;
+		break;
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_ARGB16161616F:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F;
+		break;
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F;
+		break;
+	case DRM_FORMAT_XRGB16161616:
+	case DRM_FORMAT_ARGB16161616:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616;
+		break;
+	case DRM_FORMAT_XBGR16161616:
+	case DRM_FORMAT_ABGR16161616:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616;
+		break;
+	default:
+		DRM_ERROR(
+			"Unsupported screen format %p4cc\n",
+			&fb->format->format);
 		return -EINVAL;
+	}
 
-	input.format = format;
-	input.surface_size.width = plane_size->surface_size.width;
-	input.surface_size.height = plane_size->surface_size.height;
-	input.swizzle_mode = tiling_info->gfx9.swizzle;
-
-	if (rotation == ROTATION_ANGLE_0 || rotation == ROTATION_ANGLE_180)
-		input.scan = SCAN_DIRECTION_HORIZONTAL;
-	else if (rotation == ROTATION_ANGLE_90 || rotation == ROTATION_ANGLE_270)
-		input.scan = SCAN_DIRECTION_VERTICAL;
+	switch (plane_state->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_0:
+		plane_info->rotation = ROTATION_ANGLE_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		plane_info->rotation = ROTATION_ANGLE_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		plane_info->rotation = ROTATION_ANGLE_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		plane_info->rotation = ROTATION_ANGLE_270;
+		break;
+	default:
+		plane_info->rotation = ROTATION_ANGLE_0;
+		break;
+	}
 
-	if (!dc->cap_funcs.get_dcc_compression_cap(dc, &input, &output))
-		return -EINVAL;
 
-	if (!output.capable)
-		return -EINVAL;
+	plane_info->visible = true;
+	plane_info->stereo_format = PLANE_STEREO_FORMAT_NONE;
 
-	if (dcc->independent_64b_blks == 0 &&
-	    output.grph.rgb.independent_64b_blks != 0)
-		return -EINVAL;
+	plane_info->layer_index = 0;
 
-	return 0;
-}
+	ret = fill_plane_color_attributes(plane_state, plane_info->format,
+					  &plane_info->color_space);
+	if (ret)
+		return ret;
 
-static bool
-modifier_has_dcc(uint64_t modifier)
-{
-	return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier);
-}
+	ret = fill_plane_buffer_attributes(adev, afb, plane_info->format,
+					   plane_info->rotation, tiling_flags,
+					   &plane_info->tiling_info,
+					   &plane_info->plane_size,
+					   &plane_info->dcc, address,
+					   tmz_surface, force_disable_dcc);
+	if (ret)
+		return ret;
 
-static unsigned
-modifier_gfx9_swizzle_mode(uint64_t modifier)
-{
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return 0;
+	fill_blending_from_plane_state(
+		plane_state, &plane_info->per_pixel_alpha, &plane_info->pre_multiplied_alpha,
+		&plane_info->global_alpha, &plane_info->global_alpha_value);
 
-	return AMD_FMT_MOD_GET(TILE, modifier);
+	return 0;
 }
 
-static const struct drm_format_info *
-amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+static int fill_dc_plane_attributes(struct amdgpu_device *adev,
+				    struct dc_plane_state *dc_plane_state,
+				    struct drm_plane_state *plane_state,
+				    struct drm_crtc_state *crtc_state)
 {
-	return amdgpu_lookup_format_info(cmd->pixel_format, cmd->modifier[0]);
-}
+	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
+	struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)plane_state->fb;
+	struct dc_scaling_info scaling_info;
+	struct dc_plane_info plane_info;
+	int ret;
+	bool force_disable_dcc = false;
 
-static void
-fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
-				    union dc_tiling_info *tiling_info,
-				    uint64_t modifier)
-{
-	unsigned int mod_bank_xor_bits = AMD_FMT_MOD_GET(BANK_XOR_BITS, modifier);
-	unsigned int mod_pipe_xor_bits = AMD_FMT_MOD_GET(PIPE_XOR_BITS, modifier);
-	unsigned int pkrs_log2 = AMD_FMT_MOD_GET(PACKERS, modifier);
-	unsigned int pipes_log2;
+	ret = fill_dc_scaling_info(adev, plane_state, &scaling_info);
+	if (ret)
+		return ret;
 
-	pipes_log2 = min(5u, mod_pipe_xor_bits);
+	dc_plane_state->src_rect = scaling_info.src_rect;
+	dc_plane_state->dst_rect = scaling_info.dst_rect;
+	dc_plane_state->clip_rect = scaling_info.clip_rect;
+	dc_plane_state->scaling_quality = scaling_info.scaling_quality;
 
-	fill_gfx9_tiling_info_from_device(adev, tiling_info);
+	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
+	ret = fill_dc_plane_info_and_addr(adev, plane_state,
+					  afb->tiling_flags,
+					  &plane_info,
+					  &dc_plane_state->address,
+					  afb->tmz_surface,
+					  force_disable_dcc);
+	if (ret)
+		return ret;
 
-	if (!IS_AMD_FMT_MOD(modifier))
-		return;
+	dc_plane_state->format = plane_info.format;
+	dc_plane_state->color_space = plane_info.color_space;
+	dc_plane_state->format = plane_info.format;
+	dc_plane_state->plane_size = plane_info.plane_size;
+	dc_plane_state->rotation = plane_info.rotation;
+	dc_plane_state->horizontal_mirror = plane_info.horizontal_mirror;
+	dc_plane_state->stereo_format = plane_info.stereo_format;
+	dc_plane_state->tiling_info = plane_info.tiling_info;
+	dc_plane_state->visible = plane_info.visible;
+	dc_plane_state->per_pixel_alpha = plane_info.per_pixel_alpha;
+	dc_plane_state->pre_multiplied_alpha = plane_info.pre_multiplied_alpha;
+	dc_plane_state->global_alpha = plane_info.global_alpha;
+	dc_plane_state->global_alpha_value = plane_info.global_alpha_value;
+	dc_plane_state->dcc = plane_info.dcc;
+	dc_plane_state->layer_index = plane_info.layer_index; // Always returns 0
+	dc_plane_state->flip_int_enabled = true;
 
-	tiling_info->gfx9.num_pipes = 1u << pipes_log2;
-	tiling_info->gfx9.num_shader_engines = 1u << (mod_pipe_xor_bits - pipes_log2);
-
-	if (adev->family >= AMDGPU_FAMILY_NV) {
-		tiling_info->gfx9.num_pkrs = 1u << pkrs_log2;
-	} else {
-		tiling_info->gfx9.num_banks = 1u << mod_bank_xor_bits;
-
-		/* for DCC we know it isn't rb aligned, so rb_per_se doesn't matter. */
-	}
-}
-
-enum dm_micro_swizzle {
-	MICRO_SWIZZLE_Z = 0,
-	MICRO_SWIZZLE_S = 1,
-	MICRO_SWIZZLE_D = 2,
-	MICRO_SWIZZLE_R = 3
-};
-
-static bool dm_plane_format_mod_supported(struct drm_plane *plane,
-					  uint32_t format,
-					  uint64_t modifier)
-{
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
-	const struct drm_format_info *info = drm_format_info(format);
-	int i;
-
-	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
-
-	if (!info)
-		return false;
-
-	/*
-	 * We always have to allow these modifiers:
-	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
-	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
-	 */
-	if (modifier == DRM_FORMAT_MOD_LINEAR ||
-	    modifier == DRM_FORMAT_MOD_INVALID) {
-		return true;
-	}
-
-	/* Check that the modifier is on the list of the plane's supported modifiers. */
-	for (i = 0; i < plane->modifier_count; i++) {
-		if (modifier == plane->modifiers[i])
-			break;
-	}
-	if (i == plane->modifier_count)
-		return false;
-
-	/*
-	 * For D swizzle the canonical modifier depends on the bpp, so check
-	 * it here.
-	 */
-	if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) == AMD_FMT_MOD_TILE_VER_GFX9 &&
-	    adev->family >= AMDGPU_FAMILY_NV) {
-		if (microtile == MICRO_SWIZZLE_D && info->cpp[0] == 4)
-			return false;
-	}
-
-	if (adev->family >= AMDGPU_FAMILY_RV && microtile == MICRO_SWIZZLE_D &&
-	    info->cpp[0] < 8)
-		return false;
-
-	if (modifier_has_dcc(modifier)) {
-		/* Per radeonsi comments 16/64 bpp are more complicated. */
-		if (info->cpp[0] != 4)
-			return false;
-		/* We support multi-planar formats, but not when combined with
-		 * additional DCC metadata planes. */
-		if (info->num_planes > 1)
-			return false;
-	}
-
-	return true;
-}
-
-static void
-add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t mod)
-{
-	if (!*mods)
-		return;
-
-	if (*cap - *size < 1) {
-		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
-
-		if (!new_mods) {
-			kfree(*mods);
-			*mods = NULL;
-			return;
-		}
-
-		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
-		kfree(*mods);
-		*mods = new_mods;
-		*cap = new_cap;
-	}
-
-	(*mods)[*size] = mod;
-	*size += 1;
-}
-
-static void
-add_gfx9_modifiers(const struct amdgpu_device *adev,
-		   uint64_t **mods, uint64_t *size, uint64_t *capacity)
-{
-	int pipes = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
-	int pipe_xor_bits = min(8, pipes +
-				ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
-	int bank_xor_bits = min(8 - pipe_xor_bits,
-				ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
-	int rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
-		 ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
-
-
-	if (adev->family == AMDGPU_FAMILY_RV) {
-		/* Raven2 and later */
-		bool has_constant_encode = adev->asic_type > CHIP_RAVEN || adev->external_rev_id >= 0x81;
-
-		/*
-		 * No _D DCC swizzles yet because we only allow 32bpp, which
-		 * doesn't support _D on DCN
-		 */
-
-		if (has_constant_encode) {
-			add_modifier(mods, size, capacity, AMD_FMT_MOD |
-				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
-				    AMD_FMT_MOD_SET(DCC, 1) |
-				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
-				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
-		}
-
-		add_modifier(mods, size, capacity, AMD_FMT_MOD |
-			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
-			    AMD_FMT_MOD_SET(DCC, 1) |
-			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
-			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
-
-		if (has_constant_encode) {
-			add_modifier(mods, size, capacity, AMD_FMT_MOD |
-				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
-				    AMD_FMT_MOD_SET(DCC, 1) |
-				    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
-				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
-
-				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-				    AMD_FMT_MOD_SET(RB, rb) |
-				    AMD_FMT_MOD_SET(PIPE, pipes));
-		}
-
-		add_modifier(mods, size, capacity, AMD_FMT_MOD |
-			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
-			    AMD_FMT_MOD_SET(DCC, 1) |
-			    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
-			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
-			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
-			    AMD_FMT_MOD_SET(RB, rb) |
-			    AMD_FMT_MOD_SET(PIPE, pipes));
-	}
-
-	/*
-	 * Only supported for 64bpp on Raven, will be filtered on format in
-	 * dm_plane_format_mod_supported.
-	 */
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
-
-	if (adev->family == AMDGPU_FAMILY_RV) {
-		add_modifier(mods, size, capacity, AMD_FMT_MOD |
-			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
-			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
-	}
-
-	/*
-	 * Only supported for 64bpp on Raven, will be filtered on format in
-	 * dm_plane_format_mod_supported.
-	 */
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-
-	if (adev->family == AMDGPU_FAMILY_RV) {
-		add_modifier(mods, size, capacity, AMD_FMT_MOD |
-			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
-			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-	}
-}
-
-static void
-add_gfx10_1_modifiers(const struct amdgpu_device *adev,
-		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
-{
-	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
-
-
-	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-}
-
-static void
-add_gfx10_3_modifiers(const struct amdgpu_device *adev,
-		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
-{
-	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
-	int pkrs = ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
-		    AMD_FMT_MOD_SET(DCC, 1) |
-		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
-		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
-		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
-		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-		    AMD_FMT_MOD_SET(PACKERS, pkrs));
-
-	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
-		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
-}
-
-static void
-add_gfx11_modifiers(struct amdgpu_device *adev,
-		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
-{
-	int num_pipes = 0;
-	int pipe_xor_bits = 0;
-	int num_pkrs = 0;
-	int pkrs = 0;
-	u32 gb_addr_config;
-	u8 i = 0;
-	unsigned swizzle_r_x;
-	uint64_t modifier_r_x;
-	uint64_t modifier_dcc_best;
-	uint64_t modifier_dcc_4k;
-
-	/* TODO: GFX11 IP HW init hasnt finish and we get zero if we read from
-	 * adev->gfx.config.gb_addr_config_fields.num_{pkrs,pipes} */
-	gb_addr_config = RREG32_SOC15(GC, 0, regGB_ADDR_CONFIG);
-	ASSERT(gb_addr_config != 0);
-
-	num_pkrs = 1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PKRS);
-	pkrs = ilog2(num_pkrs);
-	num_pipes = 1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PIPES);
-	pipe_xor_bits = ilog2(num_pipes);
-
-	for (i = 0; i < 2; i++) {
-		/* Insert the best one first. */
-		/* R_X swizzle modes are the best for rendering and DCC requires them. */
-		if (num_pipes > 16)
-			swizzle_r_x = !i ? AMD_FMT_MOD_TILE_GFX11_256K_R_X : AMD_FMT_MOD_TILE_GFX9_64K_R_X;
-		else
-			swizzle_r_x = !i ? AMD_FMT_MOD_TILE_GFX9_64K_R_X : AMD_FMT_MOD_TILE_GFX11_256K_R_X;
-
-		modifier_r_x = AMD_FMT_MOD |
-			       AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX11) |
-			       AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
-			       AMD_FMT_MOD_SET(TILE, swizzle_r_x) |
-			       AMD_FMT_MOD_SET(PACKERS, pkrs);
-
-		/* DCC_CONSTANT_ENCODE is not set because it can't vary with gfx11 (it's implied to be 1). */
-		modifier_dcc_best = modifier_r_x | AMD_FMT_MOD_SET(DCC, 1) |
-				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 0) |
-				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B);
-
-		/* DCC settings for 4K and greater resolutions. (required by display hw) */
-		modifier_dcc_4k = modifier_r_x | AMD_FMT_MOD_SET(DCC, 1) |
-				  AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
-				  AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
-				  AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B);
-
-		add_modifier(mods, size, capacity, modifier_dcc_best);
-		add_modifier(mods, size, capacity, modifier_dcc_4k);
-
-		add_modifier(mods, size, capacity, modifier_dcc_best | AMD_FMT_MOD_SET(DCC_RETILE, 1));
-		add_modifier(mods, size, capacity, modifier_dcc_4k | AMD_FMT_MOD_SET(DCC_RETILE, 1));
-
-		add_modifier(mods, size, capacity, modifier_r_x);
-	}
-
-	add_modifier(mods, size, capacity, AMD_FMT_MOD |
-             AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX11) |
-			 AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D));
-}
-
-static int
-get_plane_modifiers(struct amdgpu_device *adev, unsigned int plane_type, uint64_t **mods)
-{
-	uint64_t size = 0, capacity = 128;
-	*mods = NULL;
-
-	/* We have not hooked up any pre-GFX9 modifiers. */
-	if (adev->family < AMDGPU_FAMILY_AI)
-		return 0;
-
-	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
-
-	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
-		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
-		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
-		return *mods ? 0 : -ENOMEM;
-	}
-
-	switch (adev->family) {
-	case AMDGPU_FAMILY_AI:
-	case AMDGPU_FAMILY_RV:
-		add_gfx9_modifiers(adev, mods, &size, &capacity);
-		break;
-	case AMDGPU_FAMILY_NV:
-	case AMDGPU_FAMILY_VGH:
-	case AMDGPU_FAMILY_YC:
-	case AMDGPU_FAMILY_GC_10_3_6:
-	case AMDGPU_FAMILY_GC_10_3_7:
-		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
-			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
-		else
-			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
-		break;
-	case AMDGPU_FAMILY_GC_11_0_0:
-	case AMDGPU_FAMILY_GC_11_0_2:
-		add_gfx11_modifiers(adev, mods, &size, &capacity);
-		break;
-	}
-
-	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
-
-	/* INVALID marks the end of the list. */
-	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
-
-	if (!*mods)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int
-fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
-					  const struct amdgpu_framebuffer *afb,
-					  const enum surface_pixel_format format,
-					  const enum dc_rotation_angle rotation,
-					  const struct plane_size *plane_size,
-					  union dc_tiling_info *tiling_info,
-					  struct dc_plane_dcc_param *dcc,
-					  struct dc_plane_address *address,
-					  const bool force_disable_dcc)
-{
-	const uint64_t modifier = afb->base.modifier;
-	int ret = 0;
-
-	fill_gfx9_tiling_info_from_modifier(adev, tiling_info, modifier);
-	tiling_info->gfx9.swizzle = modifier_gfx9_swizzle_mode(modifier);
-
-	if (modifier_has_dcc(modifier) && !force_disable_dcc) {
-		uint64_t dcc_address = afb->address + afb->base.offsets[1];
-		bool independent_64b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_64B, modifier);
-		bool independent_128b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_128B, modifier);
-
-		dcc->enable = 1;
-		dcc->meta_pitch = afb->base.pitches[1];
-		dcc->independent_64b_blks = independent_64b_blks;
-		if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) >= AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) {
-			if (independent_64b_blks && independent_128b_blks)
-				dcc->dcc_ind_blk = hubp_ind_block_64b_no_128bcl;
-			else if (independent_128b_blks)
-				dcc->dcc_ind_blk = hubp_ind_block_128b;
-			else if (independent_64b_blks && !independent_128b_blks)
-				dcc->dcc_ind_blk = hubp_ind_block_64b;
-			else
-				dcc->dcc_ind_blk = hubp_ind_block_unconstrained;
-		} else {
-			if (independent_64b_blks)
-				dcc->dcc_ind_blk = hubp_ind_block_64b;
-			else
-				dcc->dcc_ind_blk = hubp_ind_block_unconstrained;
-		}
-
-		address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
-		address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
-	}
-
-	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
-	if (ret)
-		drm_dbg_kms(adev_to_drm(adev), "validate_dcc: returned error: %d\n", ret);
-
-	return ret;
-}
-
-static int
-fill_plane_buffer_attributes(struct amdgpu_device *adev,
-			     const struct amdgpu_framebuffer *afb,
-			     const enum surface_pixel_format format,
-			     const enum dc_rotation_angle rotation,
-			     const uint64_t tiling_flags,
-			     union dc_tiling_info *tiling_info,
-			     struct plane_size *plane_size,
-			     struct dc_plane_dcc_param *dcc,
-			     struct dc_plane_address *address,
-			     bool tmz_surface,
-			     bool force_disable_dcc)
-{
-	const struct drm_framebuffer *fb = &afb->base;
-	int ret;
-
-	memset(tiling_info, 0, sizeof(*tiling_info));
-	memset(plane_size, 0, sizeof(*plane_size));
-	memset(dcc, 0, sizeof(*dcc));
-	memset(address, 0, sizeof(*address));
-
-	address->tmz_surface = tmz_surface;
-
-	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
-		uint64_t addr = afb->address + fb->offsets[0];
-
-		plane_size->surface_size.x = 0;
-		plane_size->surface_size.y = 0;
-		plane_size->surface_size.width = fb->width;
-		plane_size->surface_size.height = fb->height;
-		plane_size->surface_pitch =
-			fb->pitches[0] / fb->format->cpp[0];
-
-		address->type = PLN_ADDR_TYPE_GRAPHICS;
-		address->grph.addr.low_part = lower_32_bits(addr);
-		address->grph.addr.high_part = upper_32_bits(addr);
-	} else if (format < SURFACE_PIXEL_FORMAT_INVALID) {
-		uint64_t luma_addr = afb->address + fb->offsets[0];
-		uint64_t chroma_addr = afb->address + fb->offsets[1];
-
-		plane_size->surface_size.x = 0;
-		plane_size->surface_size.y = 0;
-		plane_size->surface_size.width = fb->width;
-		plane_size->surface_size.height = fb->height;
-		plane_size->surface_pitch =
-			fb->pitches[0] / fb->format->cpp[0];
-
-		plane_size->chroma_size.x = 0;
-		plane_size->chroma_size.y = 0;
-		/* TODO: set these based on surface format */
-		plane_size->chroma_size.width = fb->width / 2;
-		plane_size->chroma_size.height = fb->height / 2;
-
-		plane_size->chroma_pitch =
-			fb->pitches[1] / fb->format->cpp[1];
-
-		address->type = PLN_ADDR_TYPE_VIDEO_PROGRESSIVE;
-		address->video_progressive.luma_addr.low_part =
-			lower_32_bits(luma_addr);
-		address->video_progressive.luma_addr.high_part =
-			upper_32_bits(luma_addr);
-		address->video_progressive.chroma_addr.low_part =
-			lower_32_bits(chroma_addr);
-		address->video_progressive.chroma_addr.high_part =
-			upper_32_bits(chroma_addr);
-	}
-
-	if (adev->family >= AMDGPU_FAMILY_AI) {
-		ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
-								rotation, plane_size,
-								tiling_info, dcc,
-								address,
-								force_disable_dcc);
-		if (ret)
-			return ret;
-	} else {
-		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
-	}
-
-	return 0;
-}
-
-static void
-fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
-			       bool *per_pixel_alpha, bool *pre_multiplied_alpha,
-			       bool *global_alpha, int *global_alpha_value)
-{
-	*per_pixel_alpha = false;
-	*pre_multiplied_alpha = true;
-	*global_alpha = false;
-	*global_alpha_value = 0xff;
-
-	if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
-		return;
-
-	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
-		plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
-		static const uint32_t alpha_formats[] = {
-			DRM_FORMAT_ARGB8888,
-			DRM_FORMAT_RGBA8888,
-			DRM_FORMAT_ABGR8888,
-		};
-		uint32_t format = plane_state->fb->format->format;
-		unsigned int i;
-
-		for (i = 0; i < ARRAY_SIZE(alpha_formats); ++i) {
-			if (format == alpha_formats[i]) {
-				*per_pixel_alpha = true;
-				break;
-			}
-		}
-
-		if (*per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
-			*pre_multiplied_alpha = false;
-	}
-
-	if (plane_state->alpha < 0xffff) {
-		*global_alpha = true;
-		*global_alpha_value = plane_state->alpha >> 8;
-	}
-}
-
-static int
-fill_plane_color_attributes(const struct drm_plane_state *plane_state,
-			    const enum surface_pixel_format format,
-			    enum dc_color_space *color_space)
-{
-	bool full_range;
-
-	*color_space = COLOR_SPACE_SRGB;
-
-	/* DRM color properties only affect non-RGB formats. */
-	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
-		return 0;
-
-	full_range = (plane_state->color_range == DRM_COLOR_YCBCR_FULL_RANGE);
-
-	switch (plane_state->color_encoding) {
-	case DRM_COLOR_YCBCR_BT601:
-		if (full_range)
-			*color_space = COLOR_SPACE_YCBCR601;
-		else
-			*color_space = COLOR_SPACE_YCBCR601_LIMITED;
-		break;
-
-	case DRM_COLOR_YCBCR_BT709:
-		if (full_range)
-			*color_space = COLOR_SPACE_YCBCR709;
-		else
-			*color_space = COLOR_SPACE_YCBCR709_LIMITED;
-		break;
-
-	case DRM_COLOR_YCBCR_BT2020:
-		if (full_range)
-			*color_space = COLOR_SPACE_2020_YCBCR;
-		else
-			return -EINVAL;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int
-fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
-			    const struct drm_plane_state *plane_state,
-			    const uint64_t tiling_flags,
-			    struct dc_plane_info *plane_info,
-			    struct dc_plane_address *address,
-			    bool tmz_surface,
-			    bool force_disable_dcc)
-{
-	const struct drm_framebuffer *fb = plane_state->fb;
-	const struct amdgpu_framebuffer *afb =
-		to_amdgpu_framebuffer(plane_state->fb);
-	int ret;
-
-	memset(plane_info, 0, sizeof(*plane_info));
-
-	switch (fb->format->format) {
-	case DRM_FORMAT_C8:
-		plane_info->format =
-			SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS;
-		break;
-	case DRM_FORMAT_RGB565:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_RGB565;
-		break;
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_ARGB8888:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
-		break;
-	case DRM_FORMAT_XRGB2101010:
-	case DRM_FORMAT_ARGB2101010:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB2101010;
-		break;
-	case DRM_FORMAT_XBGR2101010:
-	case DRM_FORMAT_ABGR2101010:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010;
-		break;
-	case DRM_FORMAT_XBGR8888:
-	case DRM_FORMAT_ABGR8888:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR8888;
-		break;
-	case DRM_FORMAT_NV21:
-		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr;
-		break;
-	case DRM_FORMAT_NV12:
-		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb;
-		break;
-	case DRM_FORMAT_P010:
-		plane_info->format = SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb;
-		break;
-	case DRM_FORMAT_XRGB16161616F:
-	case DRM_FORMAT_ARGB16161616F:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F;
-		break;
-	case DRM_FORMAT_XBGR16161616F:
-	case DRM_FORMAT_ABGR16161616F:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F;
-		break;
-	case DRM_FORMAT_XRGB16161616:
-	case DRM_FORMAT_ARGB16161616:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616;
-		break;
-	case DRM_FORMAT_XBGR16161616:
-	case DRM_FORMAT_ABGR16161616:
-		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616;
-		break;
-	default:
-		DRM_ERROR(
-			"Unsupported screen format %p4cc\n",
-			&fb->format->format);
-		return -EINVAL;
-	}
-
-	switch (plane_state->rotation & DRM_MODE_ROTATE_MASK) {
-	case DRM_MODE_ROTATE_0:
-		plane_info->rotation = ROTATION_ANGLE_0;
-		break;
-	case DRM_MODE_ROTATE_90:
-		plane_info->rotation = ROTATION_ANGLE_90;
-		break;
-	case DRM_MODE_ROTATE_180:
-		plane_info->rotation = ROTATION_ANGLE_180;
-		break;
-	case DRM_MODE_ROTATE_270:
-		plane_info->rotation = ROTATION_ANGLE_270;
-		break;
-	default:
-		plane_info->rotation = ROTATION_ANGLE_0;
-		break;
-	}
-
-	plane_info->visible = true;
-	plane_info->stereo_format = PLANE_STEREO_FORMAT_NONE;
-
-	plane_info->layer_index = 0;
-
-	ret = fill_plane_color_attributes(plane_state, plane_info->format,
-					  &plane_info->color_space);
-	if (ret)
-		return ret;
-
-	ret = fill_plane_buffer_attributes(adev, afb, plane_info->format,
-					   plane_info->rotation, tiling_flags,
-					   &plane_info->tiling_info,
-					   &plane_info->plane_size,
-					   &plane_info->dcc, address, tmz_surface,
-					   force_disable_dcc);
-	if (ret)
-		return ret;
-
-	fill_blending_from_plane_state(
-		plane_state, &plane_info->per_pixel_alpha, &plane_info->pre_multiplied_alpha,
-		&plane_info->global_alpha, &plane_info->global_alpha_value);
-
-	return 0;
-}
-
-static int fill_dc_plane_attributes(struct amdgpu_device *adev,
-				    struct dc_plane_state *dc_plane_state,
-				    struct drm_plane_state *plane_state,
-				    struct drm_crtc_state *crtc_state)
-{
-	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
-	struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)plane_state->fb;
-	struct dc_scaling_info scaling_info;
-	struct dc_plane_info plane_info;
-	int ret;
-	bool force_disable_dcc = false;
-
-	ret = fill_dc_scaling_info(adev, plane_state, &scaling_info);
-	if (ret)
-		return ret;
-
-	dc_plane_state->src_rect = scaling_info.src_rect;
-	dc_plane_state->dst_rect = scaling_info.dst_rect;
-	dc_plane_state->clip_rect = scaling_info.clip_rect;
-	dc_plane_state->scaling_quality = scaling_info.scaling_quality;
-
-	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
-	ret = fill_dc_plane_info_and_addr(adev, plane_state,
-					  afb->tiling_flags,
-					  &plane_info,
-					  &dc_plane_state->address,
-					  afb->tmz_surface,
-					  force_disable_dcc);
-	if (ret)
-		return ret;
-
-	dc_plane_state->format = plane_info.format;
-	dc_plane_state->color_space = plane_info.color_space;
-	dc_plane_state->format = plane_info.format;
-	dc_plane_state->plane_size = plane_info.plane_size;
-	dc_plane_state->rotation = plane_info.rotation;
-	dc_plane_state->horizontal_mirror = plane_info.horizontal_mirror;
-	dc_plane_state->stereo_format = plane_info.stereo_format;
-	dc_plane_state->tiling_info = plane_info.tiling_info;
-	dc_plane_state->visible = plane_info.visible;
-	dc_plane_state->per_pixel_alpha = plane_info.per_pixel_alpha;
-	dc_plane_state->pre_multiplied_alpha = plane_info.pre_multiplied_alpha;
-	dc_plane_state->global_alpha = plane_info.global_alpha;
-	dc_plane_state->global_alpha_value = plane_info.global_alpha_value;
-	dc_plane_state->dcc = plane_info.dcc;
-	dc_plane_state->layer_index = plane_info.layer_index; // Always returns 0
-	dc_plane_state->flip_int_enabled = true;
-
-	/*
-	 * Always set input transfer function, since plane state is refreshed
-	 * every time.
-	 */
-	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state, dc_plane_state);
-	if (ret)
-		return ret;
+	/*
+	 * Always set input transfer function, since plane state is refreshed
+	 * every time.
+	 */
+	ret = amdgpu_dm_update_plane_color_mgmt(dm_crtc_state, dc_plane_state);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -6165,7 +5274,7 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->scan_type = SCANNING_TYPE_NODATA;
 	timing_out->hdmi_vic = 0;
 
-	if(old_stream) {
+	if (old_stream) {
 		timing_out->vic = old_stream->timing.vic;
 		timing_out->flags.HSYNC_POSITIVE_POLARITY = old_stream->timing.flags.HSYNC_POSITIVE_POLARITY;
 		timing_out->flags.VSYNC_POSITIVE_POLARITY = old_stream->timing.flags.VSYNC_POSITIVE_POLARITY;
@@ -6387,16 +5496,126 @@ static void dm_enable_per_frame_crtc_master_sync(struct dc_state *context)
 	}
 }
 
+/**
+ * DOC: FreeSync Video
+ *
+ * When a userspace application wants to play a video, the content follows a
+ * standard format definition that usually specifies the FPS for that format.
+ * The below list illustrates some video format and the expected FPS,
+ * respectively:
+ *
+ * - TV/NTSC (23.976 FPS)
+ * - Cinema (24 FPS)
+ * - TV/PAL (25 FPS)
+ * - TV/NTSC (29.97 FPS)
+ * - TV/NTSC (30 FPS)
+ * - Cinema HFR (48 FPS)
+ * - TV/PAL (50 FPS)
+ * - Commonly used (60 FPS)
+ * - Multiples of 24 (48,72,96 FPS)
+ *
+ * The list of standards video format is not huge and can be added to the
+ * connector modeset list beforehand. With that, userspace can leverage
+ * FreeSync to extends the front porch in order to attain the target refresh
+ * rate. Such a switch will happen seamlessly, without screen blanking or
+ * reprogramming of the output in any other way. If the userspace requests a
+ * modesetting change compatible with FreeSync modes that only differ in the
+ * refresh rate, DC will skip the full update and avoid blink during the
+ * transition. For example, the video player can change the modesetting from
+ * 60Hz to 30Hz for playing TV/NTSC content when it goes full screen without
+ * causing any display blink. This same concept can be applied to a mode
+ * setting change.
+ */
+static struct drm_display_mode *
+get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
+		bool use_probed_modes)
+{
+	struct drm_display_mode *m, *m_pref = NULL;
+	u16 current_refresh, highest_refresh;
+	struct list_head *list_head = use_probed_modes ?
+		&aconnector->base.probed_modes :
+		&aconnector->base.modes;
+
+	if (aconnector->freesync_vid_base.clock != 0)
+		return &aconnector->freesync_vid_base;
+
+	/* Find the preferred mode */
+	list_for_each_entry (m, list_head, head) {
+		if (m->type & DRM_MODE_TYPE_PREFERRED) {
+			m_pref = m;
+			break;
+		}
+	}
+
+	if (!m_pref) {
+		/* Probably an EDID with no preferred mode. Fallback to first entry */
+		m_pref = list_first_entry_or_null(
+				&aconnector->base.modes, struct drm_display_mode, head);
+		if (!m_pref) {
+			DRM_DEBUG_DRIVER("No preferred mode found in EDID\n");
+			return NULL;
+		}
+	}
+
+	highest_refresh = drm_mode_vrefresh(m_pref);
+
+	/*
+	 * Find the mode with highest refresh rate with same resolution.
+	 * For some monitors, preferred mode is not the mode with highest
+	 * supported refresh rate.
+	 */
+	list_for_each_entry (m, list_head, head) {
+		current_refresh  = drm_mode_vrefresh(m);
+
+		if (m->hdisplay == m_pref->hdisplay &&
+		    m->vdisplay == m_pref->vdisplay &&
+		    highest_refresh < current_refresh) {
+			highest_refresh = current_refresh;
+			m_pref = m;
+		}
+	}
+
+	drm_mode_copy(&aconnector->freesync_vid_base, m_pref);
+	return m_pref;
+}
+
+static bool is_freesync_video_mode(const struct drm_display_mode *mode,
+		struct amdgpu_dm_connector *aconnector)
+{
+	struct drm_display_mode *high_mode;
+	int timing_diff;
+
+	high_mode = get_highest_refresh_rate_mode(aconnector, false);
+	if (!high_mode || !mode)
+		return false;
+
+	timing_diff = high_mode->vtotal - mode->vtotal;
+
+	if (high_mode->clock == 0 || high_mode->clock != mode->clock ||
+	    high_mode->hdisplay != mode->hdisplay ||
+	    high_mode->vdisplay != mode->vdisplay ||
+	    high_mode->hsync_start != mode->hsync_start ||
+	    high_mode->hsync_end != mode->hsync_end ||
+	    high_mode->htotal != mode->htotal ||
+	    high_mode->hskew != mode->hskew ||
+	    high_mode->vscan != mode->vscan ||
+	    high_mode->vsync_start - mode->vsync_start != timing_diff ||
+	    high_mode->vsync_end - mode->vsync_end != timing_diff)
+		return false;
+	else
+		return true;
+}
+
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 static void update_dsc_caps(struct amdgpu_dm_connector *aconnector,
-							struct dc_sink *sink, struct dc_stream_state *stream,
-							struct dsc_dec_dpcd_caps *dsc_caps)
+			    struct dc_sink *sink, struct dc_stream_state *stream,
+			    struct dsc_dec_dpcd_caps *dsc_caps)
 {
 	stream->timing.flags.DSC = 0;
 	dsc_caps->is_dsc_supported = false;
 
 	if (aconnector->dc_link && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-		sink->sink_signal == SIGNAL_TYPE_EDP)) {
+	    sink->sink_signal == SIGNAL_TYPE_EDP)) {
 		if (sink->link->dpcd_caps.dongle_type == DISPLAY_DONGLE_NONE ||
 			sink->link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER)
 			dc_dsc_parse_dsc_dpcd(aconnector->dc_link->ctx->dc,
@@ -6406,6 +5625,7 @@ static void update_dsc_caps(struct amdgpu_dm_connector *aconnector,
 	}
 }
 
+
 static void apply_dsc_policy_for_edp(struct amdgpu_dm_connector *aconnector,
 				    struct dc_sink *sink, struct dc_stream_state *stream,
 				    struct dsc_dec_dpcd_caps *dsc_caps,
@@ -6464,9 +5684,10 @@ static void apply_dsc_policy_for_edp(struct amdgpu_dm_connector *aconnector,
 	}
 }
 
+
 static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
-										struct dc_sink *sink, struct dc_stream_state *stream,
-										struct dsc_dec_dpcd_caps *dsc_caps)
+					struct dc_sink *sink, struct dc_stream_state *stream,
+					struct dsc_dec_dpcd_caps *dsc_caps)
 {
 	struct drm_connector *drm_connector = &aconnector->base;
 	uint32_t link_bandwidth_kbps;
@@ -6477,7 +5698,6 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 
 	link_bandwidth_kbps = dc_link_bandwidth_kbps(aconnector->dc_link,
 							dc_link_get_link_cap(aconnector->dc_link));
-
 	if (stream->link && stream->link->local_sink)
 		max_dsc_target_bpp_limit_override =
 			stream->link->local_sink->edid_caps.panel_patch.max_dsc_target_bpp_limit;
@@ -6501,8 +5721,7 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 						&stream->timing,
 						&stream->timing.dsc_cfg)) {
 				stream->timing.flags.DSC = 1;
-				DRM_DEBUG_DRIVER("%s: [%s] DSC is selected from SST RX\n",
-								 __func__, drm_connector->name);
+				DRM_DEBUG_DRIVER("%s: [%s] DSC is selected from SST RX\n", __func__, drm_connector->name);
 			}
 		} else if (sink->link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER) {
 			timing_bw_in_kbps = dc_bandwidth_in_kbps_from_timing(&stream->timing);
@@ -6530,126 +5749,16 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 	if (aconnector->dsc_settings.dsc_force_enable == DSC_CLK_FORCE_ENABLE)
 		stream->timing.flags.DSC = 1;
 
-	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_num_slices_h)
-		stream->timing.dsc_cfg.num_slices_h = aconnector->dsc_settings.dsc_num_slices_h;
-
-	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_num_slices_v)
-		stream->timing.dsc_cfg.num_slices_v = aconnector->dsc_settings.dsc_num_slices_v;
-
-	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_bits_per_pixel)
-		stream->timing.dsc_cfg.bits_per_pixel = aconnector->dsc_settings.dsc_bits_per_pixel;
-}
-#endif /* CONFIG_DRM_AMD_DC_DCN */
-
-/**
- * DOC: FreeSync Video
- *
- * When a userspace application wants to play a video, the content follows a
- * standard format definition that usually specifies the FPS for that format.
- * The below list illustrates some video format and the expected FPS,
- * respectively:
- *
- * - TV/NTSC (23.976 FPS)
- * - Cinema (24 FPS)
- * - TV/PAL (25 FPS)
- * - TV/NTSC (29.97 FPS)
- * - TV/NTSC (30 FPS)
- * - Cinema HFR (48 FPS)
- * - TV/PAL (50 FPS)
- * - Commonly used (60 FPS)
- * - Multiples of 24 (48,72,96,120 FPS)
- *
- * The list of standards video format is not huge and can be added to the
- * connector modeset list beforehand. With that, userspace can leverage
- * FreeSync to extends the front porch in order to attain the target refresh
- * rate. Such a switch will happen seamlessly, without screen blanking or
- * reprogramming of the output in any other way. If the userspace requests a
- * modesetting change compatible with FreeSync modes that only differ in the
- * refresh rate, DC will skip the full update and avoid blink during the
- * transition. For example, the video player can change the modesetting from
- * 60Hz to 30Hz for playing TV/NTSC content when it goes full screen without
- * causing any display blink. This same concept can be applied to a mode
- * setting change.
- */
-static struct drm_display_mode *
-get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
-			  bool use_probed_modes)
-{
-	struct drm_display_mode *m, *m_pref = NULL;
-	u16 current_refresh, highest_refresh;
-	struct list_head *list_head = use_probed_modes ?
-						    &aconnector->base.probed_modes :
-						    &aconnector->base.modes;
-
-	if (aconnector->freesync_vid_base.clock != 0)
-		return &aconnector->freesync_vid_base;
-
-	/* Find the preferred mode */
-	list_for_each_entry (m, list_head, head) {
-		if (m->type & DRM_MODE_TYPE_PREFERRED) {
-			m_pref = m;
-			break;
-		}
-	}
-
-	if (!m_pref) {
-		/* Probably an EDID with no preferred mode. Fallback to first entry */
-		m_pref = list_first_entry_or_null(
-			&aconnector->base.modes, struct drm_display_mode, head);
-		if (!m_pref) {
-			DRM_DEBUG_DRIVER("No preferred mode found in EDID\n");
-			return NULL;
-		}
-	}
-
-	highest_refresh = drm_mode_vrefresh(m_pref);
-
-	/*
-	 * Find the mode with highest refresh rate with same resolution.
-	 * For some monitors, preferred mode is not the mode with highest
-	 * supported refresh rate.
-	 */
-	list_for_each_entry (m, list_head, head) {
-		current_refresh  = drm_mode_vrefresh(m);
-
-		if (m->hdisplay == m_pref->hdisplay &&
-		    m->vdisplay == m_pref->vdisplay &&
-		    highest_refresh < current_refresh) {
-			highest_refresh = current_refresh;
-			m_pref = m;
-		}
-	}
-
-	drm_mode_copy(&aconnector->freesync_vid_base, m_pref);
-	return m_pref;
-}
-
-static bool is_freesync_video_mode(const struct drm_display_mode *mode,
-				   struct amdgpu_dm_connector *aconnector)
-{
-	struct drm_display_mode *high_mode;
-	int timing_diff;
-
-	high_mode = get_highest_refresh_rate_mode(aconnector, false);
-	if (!high_mode || !mode)
-		return false;
-
-	timing_diff = high_mode->vtotal - mode->vtotal;
+	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_num_slices_h)
+		stream->timing.dsc_cfg.num_slices_h = aconnector->dsc_settings.dsc_num_slices_h;
 
-	if (high_mode->clock == 0 || high_mode->clock != mode->clock ||
-	    high_mode->hdisplay != mode->hdisplay ||
-	    high_mode->vdisplay != mode->vdisplay ||
-	    high_mode->hsync_start != mode->hsync_start ||
-	    high_mode->hsync_end != mode->hsync_end ||
-	    high_mode->htotal != mode->htotal ||
-	    high_mode->hskew != mode->hskew ||
-	    high_mode->vscan != mode->vscan ||
-	    high_mode->vsync_start - mode->vsync_start != timing_diff ||
-	    high_mode->vsync_end - mode->vsync_end != timing_diff)
-		return false;
-	else
-		return true;
+	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_num_slices_v)
+		stream->timing.dsc_cfg.num_slices_v = aconnector->dsc_settings.dsc_num_slices_v;
+
+	if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_bits_per_pixel)
+		stream->timing.dsc_cfg.bits_per_pixel = aconnector->dsc_settings.dsc_bits_per_pixel;
 }
+#endif /* CONFIG_DRM_AMD_DC_DCN */
 
 static struct dc_stream_state *
 create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
@@ -6674,6 +5783,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dsc_dec_dpcd_caps dsc_caps;
 #endif
+
 	struct dc_sink *sink = NULL;
 
 	memset(&saved_mode, 0, sizeof(saved_mode));
@@ -6737,7 +5847,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 			drm_mode_copy(&mode, freesync_mode);
 		} else {
 			decide_crtc_timing_for_drm_display_mode(
-				&mode, preferred_mode, scale);
+					&mode, preferred_mode, scale);
 
 			preferred_refresh = drm_mode_vrefresh(preferred_mode);
 		}
@@ -6748,7 +5858,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	else if (!dm_state)
 		drm_mode_set_crtcinfo(&mode, 0);
 
-       /*
+	/*
 	* If scaling is enabled and refresh rate didn't change
 	* we copy the vic and polarities of the old timings
 	*/
@@ -6996,7 +6106,8 @@ amdgpu_dm_connector_detect(struct drm_connector *connector, bool force)
 	    !aconnector->fake_enable)
 		connected = (aconnector->dc_sink != NULL);
 	else
-		connected = (aconnector->base.force == DRM_FORCE_ON);
+		connected = (aconnector->base.force == DRM_FORCE_ON ||
+				aconnector->base.force == DRM_FORCE_ON_DIGITAL);
 
 	update_subconnector_property(aconnector);
 
@@ -7120,18 +6231,21 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 	int i;
 
 	/*
-	 * Call only if mst_mgr was iniitalized before since it's not done
+	 * Call only if mst_mgr was initialized before since it's not done
 	 * for all connector types.
 	 */
 	if (aconnector->mst_mgr.dev)
 		drm_dp_mst_topology_mgr_destroy(&aconnector->mst_mgr);
 
+#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
+	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 	for (i = 0; i < dm->num_of_edps; i++) {
 		if ((link == dm->backlight_link[i]) && dm->backlight_dev[i]) {
 			backlight_device_unregister(dm->backlight_dev[i]);
 			dm->backlight_dev[i] = NULL;
 		}
 	}
+#endif
 
 	if (aconnector->dc_em_sink)
 		dc_sink_release(aconnector->dc_em_sink);
@@ -7172,6 +6286,7 @@ void amdgpu_dm_connector_funcs_reset(struct drm_connector *connector)
 		state->base.max_requested_bpc = 8;
 		state->vcpi_slots = 0;
 		state->pbn = 0;
+
 		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
 			state->abm_level = amdgpu_dm_abm_level;
 
@@ -7561,10 +6676,10 @@ static void dm_update_crtc_active_planes(struct drm_crtc *crtc,
 }
 
 static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
-									  crtc);
+										crtc);
 	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct dc *dc = adev->dm.dc;
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
@@ -7575,7 +6690,7 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	dm_update_crtc_active_planes(crtc, crtc_state);
 
 	if (WARN_ON(unlikely(!dm_crtc_state->stream &&
-		     modeset_required(crtc_state, NULL, dm_crtc_state->stream)))) {
+			modeset_required(crtc_state, NULL, dm_crtc_state->stream)))) {
 		return ret;
 	}
 
@@ -7586,7 +6701,7 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	 * userspace which stops using the HW cursor altogether in response to the resulting EINVAL.
 	 */
 	if (crtc_state->enable &&
-	    !(crtc_state->plane_mask & drm_plane_mask(crtc->primary))) {
+		!(crtc_state->plane_mask & drm_plane_mask(crtc->primary))) {
 		DRM_DEBUG_ATOMIC("Can't enable a CRTC without enabling the primary plane\n");
 		return -EINVAL;
 	}
@@ -7624,21 +6739,21 @@ static void dm_encoder_helper_disable(struct drm_encoder *encoder)
 int convert_dc_color_depth_into_bpc(enum dc_color_depth display_color_depth)
 {
 	switch (display_color_depth) {
-		case COLOR_DEPTH_666:
-			return 6;
-		case COLOR_DEPTH_888:
-			return 8;
-		case COLOR_DEPTH_101010:
-			return 10;
-		case COLOR_DEPTH_121212:
-			return 12;
-		case COLOR_DEPTH_141414:
-			return 14;
-		case COLOR_DEPTH_161616:
-			return 16;
-		default:
-			break;
-		}
+	case COLOR_DEPTH_666:
+		return 6;
+	case COLOR_DEPTH_888:
+		return 8;
+	case COLOR_DEPTH_101010:
+		return 10;
+	case COLOR_DEPTH_121212:
+		return 12;
+	case COLOR_DEPTH_141414:
+		return 14;
+	case COLOR_DEPTH_161616:
+		return 16;
+	default:
+		break;
+	}
 	return 0;
 }
 
@@ -7669,7 +6784,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 	if (!state->duplicated) {
 		int max_bpc = conn_state->max_requested_bpc;
 		is_y420 = drm_mode_is_420_also(&connector->display_info, adjusted_mode) &&
-				aconnector->force_yuv420_output;
+			  aconnector->force_yuv420_output;
 		color_depth = convert_color_depth_from_display_info(connector,
 								    is_y420,
 								    max_bpc);
@@ -7724,7 +6839,7 @@ static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
 			if (!stream)
 				continue;
 
-			if ((struct amdgpu_dm_connector*)stream->dm_stream_context == aconnector)
+			if ((struct amdgpu_dm_connector *)stream->dm_stream_context == aconnector)
 				break;
 
 			stream = NULL;
@@ -7773,466 +6888,6 @@ static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
 }
 #endif
 
-static void dm_drm_plane_reset(struct drm_plane *plane)
-{
-	struct dm_plane_state *amdgpu_state = NULL;
-
-	if (plane->state)
-		plane->funcs->atomic_destroy_state(plane, plane->state);
-
-	amdgpu_state = kzalloc(sizeof(*amdgpu_state), GFP_KERNEL);
-	WARN_ON(amdgpu_state == NULL);
-
-	if (amdgpu_state)
-		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
-}
-
-static struct drm_plane_state *
-dm_drm_plane_duplicate_state(struct drm_plane *plane)
-{
-	struct dm_plane_state *dm_plane_state, *old_dm_plane_state;
-
-	old_dm_plane_state = to_dm_plane_state(plane->state);
-	dm_plane_state = kzalloc(sizeof(*dm_plane_state), GFP_KERNEL);
-	if (!dm_plane_state)
-		return NULL;
-
-	__drm_atomic_helper_plane_duplicate_state(plane, &dm_plane_state->base);
-
-	if (old_dm_plane_state->dc_state) {
-		dm_plane_state->dc_state = old_dm_plane_state->dc_state;
-		dc_plane_state_retain(dm_plane_state->dc_state);
-	}
-
-	return &dm_plane_state->base;
-}
-
-static void dm_drm_plane_destroy_state(struct drm_plane *plane,
-				struct drm_plane_state *state)
-{
-	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
-
-	if (dm_plane_state->dc_state)
-		dc_plane_state_release(dm_plane_state->dc_state);
-
-	drm_atomic_helper_plane_destroy_state(plane, state);
-}
-
-static const struct drm_plane_funcs dm_plane_funcs = {
-	.update_plane	= drm_atomic_helper_update_plane,
-	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy	= drm_primary_helper_destroy,
-	.reset = dm_drm_plane_reset,
-	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
-	.atomic_destroy_state = dm_drm_plane_destroy_state,
-	.format_mod_supported = dm_plane_format_mod_supported,
-};
-
-static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
-				      struct drm_plane_state *new_state)
-{
-	struct amdgpu_framebuffer *afb;
-	struct drm_gem_object *obj;
-	struct amdgpu_device *adev;
-	struct amdgpu_bo *rbo;
-	struct dm_plane_state *dm_plane_state_new, *dm_plane_state_old;
-	struct list_head list;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	uint32_t domain;
-	int r;
-
-	if (!new_state->fb) {
-		DRM_DEBUG_KMS("No FB bound\n");
-		return 0;
-	}
-
-	afb = to_amdgpu_framebuffer(new_state->fb);
-	obj = new_state->fb->obj[0];
-	rbo = gem_to_amdgpu_bo(obj);
-	adev = amdgpu_ttm_adev(rbo->tbo.bdev);
-	INIT_LIST_HEAD(&list);
-
-	tv.bo = &rbo->tbo;
-	tv.num_shared = 1;
-	list_add(&tv.head, &list);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
-	if (r) {
-		dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
-		return r;
-	}
-
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		domain = amdgpu_display_supported_domains(adev, rbo->flags);
-	else
-		domain = AMDGPU_GEM_DOMAIN_VRAM;
-
-	r = amdgpu_bo_pin(rbo, domain);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("Failed to pin framebuffer with error %d\n", r);
-		ttm_eu_backoff_reservation(&ticket, &list);
-		return r;
-	}
-
-	r = amdgpu_ttm_alloc_gart(&rbo->tbo);
-	if (unlikely(r != 0)) {
-		amdgpu_bo_unpin(rbo);
-		ttm_eu_backoff_reservation(&ticket, &list);
-		DRM_ERROR("%p bind failed\n", rbo);
-		return r;
-	}
-
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-	afb->address = amdgpu_bo_gpu_offset(rbo);
-
-	amdgpu_bo_ref(rbo);
-
-	/**
-	 * We don't do surface updates on planes that have been newly created,
-	 * but we also don't have the afb->address during atomic check.
-	 *
-	 * Fill in buffer attributes depending on the address here, but only on
-	 * newly created planes since they're not being used by DC yet and this
-	 * won't modify global state.
-	 */
-	dm_plane_state_old = to_dm_plane_state(plane->state);
-	dm_plane_state_new = to_dm_plane_state(new_state);
-
-	if (dm_plane_state_new->dc_state &&
-	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
-		struct dc_plane_state *plane_state =
-			dm_plane_state_new->dc_state;
-		bool force_disable_dcc = !plane_state->dcc.enable;
-
-		fill_plane_buffer_attributes(
-			adev, afb, plane_state->format, plane_state->rotation,
-			afb->tiling_flags,
-			&plane_state->tiling_info, &plane_state->plane_size,
-			&plane_state->dcc, &plane_state->address,
-			afb->tmz_surface, force_disable_dcc);
-	}
-
-	return 0;
-}
-
-static void dm_plane_helper_cleanup_fb(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
-{
-	struct amdgpu_bo *rbo;
-	int r;
-
-	if (!old_state->fb)
-		return;
-
-	rbo = gem_to_amdgpu_bo(old_state->fb->obj[0]);
-	r = amdgpu_bo_reserve(rbo, false);
-	if (unlikely(r)) {
-		DRM_ERROR("failed to reserve rbo before unpin\n");
-		return;
-	}
-
-	amdgpu_bo_unpin(rbo);
-	amdgpu_bo_unreserve(rbo);
-	amdgpu_bo_unref(&rbo);
-}
-
-static int dm_plane_helper_check_state(struct drm_plane_state *state,
-				       struct drm_crtc_state *new_crtc_state)
-{
-	struct drm_framebuffer *fb = state->fb;
-	int min_downscale, max_upscale;
-	int min_scale = 0;
-	int max_scale = INT_MAX;
-
-	/* Plane enabled? Validate viewport and get scaling factors from plane caps. */
-	if (fb && state->crtc) {
-		/* Validate viewport to cover the case when only the position changes */
-		if (state->plane->type != DRM_PLANE_TYPE_CURSOR) {
-			int viewport_width = state->crtc_w;
-			int viewport_height = state->crtc_h;
-
-			if (state->crtc_x < 0)
-				viewport_width += state->crtc_x;
-			else if (state->crtc_x + state->crtc_w > new_crtc_state->mode.crtc_hdisplay)
-				viewport_width = new_crtc_state->mode.crtc_hdisplay - state->crtc_x;
-
-			if (state->crtc_y < 0)
-				viewport_height += state->crtc_y;
-			else if (state->crtc_y + state->crtc_h > new_crtc_state->mode.crtc_vdisplay)
-				viewport_height = new_crtc_state->mode.crtc_vdisplay - state->crtc_y;
-
-			if (viewport_width < 0 || viewport_height < 0) {
-				DRM_DEBUG_ATOMIC("Plane completely outside of screen\n");
-				return -EINVAL;
-			} else if (viewport_width < MIN_VIEWPORT_SIZE*2) { /* x2 for width is because of pipe-split. */
-				DRM_DEBUG_ATOMIC("Viewport width %d smaller than %d\n", viewport_width, MIN_VIEWPORT_SIZE*2);
-				return -EINVAL;
-			} else if (viewport_height < MIN_VIEWPORT_SIZE) {
-				DRM_DEBUG_ATOMIC("Viewport height %d smaller than %d\n", viewport_height, MIN_VIEWPORT_SIZE);
-				return -EINVAL;
-			}
-
-		}
-
-		/* Get min/max allowed scaling factors from plane caps. */
-		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
-					     &min_downscale, &max_upscale);
-		/*
-		 * Convert to drm convention: 16.16 fixed point, instead of dc's
-		 * 1.0 == 1000. Also drm scaling is src/dst instead of dc's
-		 * dst/src, so min_scale = 1.0 / max_upscale, etc.
-		 */
-		min_scale = (1000 << 16) / max_upscale;
-		max_scale = (1000 << 16) / min_downscale;
-	}
-
-	return drm_atomic_helper_check_plane_state(
-		state, new_crtc_state, min_scale, max_scale, true, true);
-}
-
-static int dm_plane_atomic_check(struct drm_plane *plane,
-				 struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
-	struct dc *dc = adev->dm.dc;
-	struct dm_plane_state *dm_plane_state;
-	struct dc_scaling_info scaling_info;
-	struct drm_crtc_state *new_crtc_state;
-	int ret;
-
-	trace_amdgpu_dm_plane_atomic_check(new_plane_state);
-
-	dm_plane_state = to_dm_plane_state(new_plane_state);
-
-	if (!dm_plane_state->dc_state)
-		return 0;
-
-	new_crtc_state =
-		drm_atomic_get_new_crtc_state(state,
-					      new_plane_state->crtc);
-	if (!new_crtc_state)
-		return -EINVAL;
-
-	ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
-	if (ret)
-		return ret;
-
-	ret = fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
-	if (ret)
-		return ret;
-
-	if (dc_validate_plane(dc, dm_plane_state->dc_state) == DC_OK)
-		return 0;
-
-	return -EINVAL;
-}
-
-static int dm_plane_atomic_async_check(struct drm_plane *plane,
-				       struct drm_atomic_state *state)
-{
-	/* Only support async updates on cursor planes. */
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		return -EINVAL;
-
-	return 0;
-}
-
-static void dm_plane_atomic_async_update(struct drm_plane *plane,
-					 struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
-	struct drm_plane_state *old_state =
-		drm_atomic_get_old_plane_state(state, plane);
-
-	trace_amdgpu_dm_atomic_update_cursor(new_state);
-
-	swap(plane->state->fb, new_state->fb);
-
-	plane->state->src_x = new_state->src_x;
-	plane->state->src_y = new_state->src_y;
-	plane->state->src_w = new_state->src_w;
-	plane->state->src_h = new_state->src_h;
-	plane->state->crtc_x = new_state->crtc_x;
-	plane->state->crtc_y = new_state->crtc_y;
-	plane->state->crtc_w = new_state->crtc_w;
-	plane->state->crtc_h = new_state->crtc_h;
-
-	handle_cursor_update(plane, old_state);
-}
-
-static const struct drm_plane_helper_funcs dm_plane_helper_funcs = {
-	.prepare_fb = dm_plane_helper_prepare_fb,
-	.cleanup_fb = dm_plane_helper_cleanup_fb,
-	.atomic_check = dm_plane_atomic_check,
-	.atomic_async_check = dm_plane_atomic_async_check,
-	.atomic_async_update = dm_plane_atomic_async_update
-};
-
-/*
- * TODO: these are currently initialized to rgb formats only.
- * For future use cases we should either initialize them dynamically based on
- * plane capabilities, or initialize this array to all formats, so internal drm
- * check will succeed, and let DC implement proper check
- */
-static const uint32_t rgb_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_XRGB2101010,
-	DRM_FORMAT_XBGR2101010,
-	DRM_FORMAT_ARGB2101010,
-	DRM_FORMAT_ABGR2101010,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_XBGR16161616,
-	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_ABGR16161616,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_RGB565,
-};
-
-static const uint32_t overlay_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_RGB565
-};
-
-static const u32 cursor_formats[] = {
-	DRM_FORMAT_ARGB8888
-};
-
-static int get_plane_formats(const struct drm_plane *plane,
-			     const struct dc_plane_cap *plane_cap,
-			     uint32_t *formats, int max_formats)
-{
-	int i, num_formats = 0;
-
-	/*
-	 * TODO: Query support for each group of formats directly from
-	 * DC plane caps. This will require adding more formats to the
-	 * caps list.
-	 */
-
-	switch (plane->type) {
-	case DRM_PLANE_TYPE_PRIMARY:
-		for (i = 0; i < ARRAY_SIZE(rgb_formats); ++i) {
-			if (num_formats >= max_formats)
-				break;
-
-			formats[num_formats++] = rgb_formats[i];
-		}
-
-		if (plane_cap && plane_cap->pixel_format_support.nv12)
-			formats[num_formats++] = DRM_FORMAT_NV12;
-		if (plane_cap && plane_cap->pixel_format_support.p010)
-			formats[num_formats++] = DRM_FORMAT_P010;
-		if (plane_cap && plane_cap->pixel_format_support.fp16) {
-			formats[num_formats++] = DRM_FORMAT_XRGB16161616F;
-			formats[num_formats++] = DRM_FORMAT_ARGB16161616F;
-			formats[num_formats++] = DRM_FORMAT_XBGR16161616F;
-			formats[num_formats++] = DRM_FORMAT_ABGR16161616F;
-		}
-		break;
-
-	case DRM_PLANE_TYPE_OVERLAY:
-		for (i = 0; i < ARRAY_SIZE(overlay_formats); ++i) {
-			if (num_formats >= max_formats)
-				break;
-
-			formats[num_formats++] = overlay_formats[i];
-		}
-		break;
-
-	case DRM_PLANE_TYPE_CURSOR:
-		for (i = 0; i < ARRAY_SIZE(cursor_formats); ++i) {
-			if (num_formats >= max_formats)
-				break;
-
-			formats[num_formats++] = cursor_formats[i];
-		}
-		break;
-	}
-
-	return num_formats;
-}
-
-static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
-				struct drm_plane *plane,
-				unsigned long possible_crtcs,
-				const struct dc_plane_cap *plane_cap)
-{
-	uint32_t formats[32];
-	int num_formats;
-	int res = -EPERM;
-	unsigned int supported_rotations;
-	uint64_t *modifiers = NULL;
-
-	num_formats = get_plane_formats(plane, plane_cap, formats,
-					ARRAY_SIZE(formats));
-
-	res = get_plane_modifiers(dm->adev, plane->type, &modifiers);
-	if (res)
-		return res;
-
-	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
-				       &dm_plane_funcs, formats, num_formats,
-				       modifiers, plane->type, NULL);
-	kfree(modifiers);
-	if (res)
-		return res;
-
-	if (plane->type == DRM_PLANE_TYPE_OVERLAY &&
-	    plane_cap && plane_cap->per_pixel_alpha) {
-		unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-					  BIT(DRM_MODE_BLEND_PREMULTI) |
-					  BIT(DRM_MODE_BLEND_COVERAGE);
-
-		drm_plane_create_alpha_property(plane);
-		drm_plane_create_blend_mode_property(plane, blend_caps);
-	}
-
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY &&
-	    plane_cap &&
-	    (plane_cap->pixel_format_support.nv12 ||
-	     plane_cap->pixel_format_support.p010)) {
-		/* This only affects YUV formats. */
-		drm_plane_create_color_properties(
-			plane,
-			BIT(DRM_COLOR_YCBCR_BT601) |
-			BIT(DRM_COLOR_YCBCR_BT709) |
-			BIT(DRM_COLOR_YCBCR_BT2020),
-			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
-	}
-
-	supported_rotations =
-		DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
-		DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
-
-	if (dm->adev->asic_type >= CHIP_BONAIRE &&
-	    plane->type != DRM_PLANE_TYPE_CURSOR)
-		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
-						   supported_rotations);
-
-	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
-
-	/* Create (reset) the plane state */
-	if (plane->funcs->reset)
-		plane->funcs->reset(plane);
-
-	return 0;
-}
-
 static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			       struct drm_plane *plane,
 			       uint32_t crtc_index)
@@ -9072,114 +7727,6 @@ static void remove_stream(struct amdgpu_device *adev,
 	acrtc->enabled = false;
 }
 
-static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
-			       struct dc_cursor_position *position)
-{
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	int x, y;
-	int xorigin = 0, yorigin = 0;
-
-	if (!crtc || !plane->state->fb)
-		return 0;
-
-	if ((plane->state->crtc_w > amdgpu_crtc->max_cursor_width) ||
-	    (plane->state->crtc_h > amdgpu_crtc->max_cursor_height)) {
-		DRM_ERROR("%s: bad cursor width or height %d x %d\n",
-			  __func__,
-			  plane->state->crtc_w,
-			  plane->state->crtc_h);
-		return -EINVAL;
-	}
-
-	x = plane->state->crtc_x;
-	y = plane->state->crtc_y;
-
-	if (x <= -amdgpu_crtc->max_cursor_width ||
-	    y <= -amdgpu_crtc->max_cursor_height)
-		return 0;
-
-	if (x < 0) {
-		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
-		x = 0;
-	}
-	if (y < 0) {
-		yorigin = min(-y, amdgpu_crtc->max_cursor_height - 1);
-		y = 0;
-	}
-	position->enable = true;
-	position->translate_by_source = true;
-	position->x = x;
-	position->y = y;
-	position->x_hotspot = xorigin;
-	position->y_hotspot = yorigin;
-
-	return 0;
-}
-
-static void handle_cursor_update(struct drm_plane *plane,
-				 struct drm_plane_state *old_plane_state)
-{
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
-	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
-	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
-	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	uint64_t address = afb ? afb->address : 0;
-	struct dc_cursor_position position = {0};
-	struct dc_cursor_attributes attributes;
-	int ret;
-
-	if (!plane->state->fb && !old_plane_state->fb)
-		return;
-
-	DC_LOG_CURSOR("%s: crtc_id=%d with size %d to %d\n",
-		      __func__,
-		      amdgpu_crtc->crtc_id,
-		      plane->state->crtc_w,
-		      plane->state->crtc_h);
-
-	ret = get_cursor_position(plane, crtc, &position);
-	if (ret)
-		return;
-
-	if (!position.enable) {
-		/* turn off cursor */
-		if (crtc_state && crtc_state->stream) {
-			mutex_lock(&adev->dm.dc_lock);
-			dc_stream_set_cursor_position(crtc_state->stream,
-						      &position);
-			mutex_unlock(&adev->dm.dc_lock);
-		}
-		return;
-	}
-
-	amdgpu_crtc->cursor_width = plane->state->crtc_w;
-	amdgpu_crtc->cursor_height = plane->state->crtc_h;
-
-	memset(&attributes, 0, sizeof(attributes));
-	attributes.address.high_part = upper_32_bits(address);
-	attributes.address.low_part  = lower_32_bits(address);
-	attributes.width             = plane->state->crtc_w;
-	attributes.height            = plane->state->crtc_h;
-	attributes.color_format      = CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA;
-	attributes.rotation_angle    = 0;
-	attributes.attribute_flags.value = 0;
-
-	attributes.pitch = afb->base.pitches[0] / afb->base.format->cpp[0];
-
-	if (crtc_state->stream) {
-		mutex_lock(&adev->dm.dc_lock);
-		if (!dc_stream_set_cursor_attributes(crtc_state->stream,
-							 &attributes))
-			DRM_ERROR("DC failed to set cursor attributes\n");
-
-		if (!dc_stream_set_cursor_position(crtc_state->stream,
-						   &position))
-			DRM_ERROR("DC failed to set cursor position\n");
-		mutex_unlock(&adev->dm.dc_lock);
-	}
-}
-
 static void prepare_flip_isr(struct amdgpu_crtc *acrtc)
 {
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
new file mode 100644
index 000000000000..e27621e11947
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -0,0 +1,1637 @@
+// SPDX-License-Identifier: MIT
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
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_fourcc.h>
+
+#include "amdgpu.h"
+#include "dal_asic_id.h"
+#include "amdgpu_display.h"
+#include "amdgpu_dm_trace.h"
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+
+/*
+ * TODO: these are currently initialized to rgb formats only.
+ * For future use cases we should either initialize them dynamically based on
+ * plane capabilities, or initialize this array to all formats, so internal drm
+ * check will succeed, and let DC implement proper check
+ */
+static const uint32_t rgb_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGB565,
+};
+
+static const uint32_t overlay_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGB565
+};
+
+static const u32 cursor_formats[] = {
+	DRM_FORMAT_ARGB8888
+};
+
+enum dm_micro_swizzle {
+	MICRO_SWIZZLE_Z = 0,
+	MICRO_SWIZZLE_S = 1,
+	MICRO_SWIZZLE_D = 2,
+	MICRO_SWIZZLE_R = 3
+};
+
+const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+{
+	return amdgpu_lookup_format_info(cmd->pixel_format, cmd->modifier[0]);
+}
+
+void fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
+			       bool *per_pixel_alpha, bool *pre_multiplied_alpha,
+			       bool *global_alpha, int *global_alpha_value)
+{
+	*per_pixel_alpha = false;
+	*pre_multiplied_alpha = true;
+	*global_alpha = false;
+	*global_alpha_value = 0xff;
+
+	if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
+		return;
+
+	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
+		plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
+		static const uint32_t alpha_formats[] = {
+			DRM_FORMAT_ARGB8888,
+			DRM_FORMAT_RGBA8888,
+			DRM_FORMAT_ABGR8888,
+		};
+		uint32_t format = plane_state->fb->format->format;
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(alpha_formats); ++i) {
+			if (format == alpha_formats[i]) {
+				*per_pixel_alpha = true;
+				break;
+			}
+		}
+
+		if (*per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
+			*pre_multiplied_alpha = false;
+	}
+
+	if (plane_state->alpha < 0xffff) {
+		*global_alpha = true;
+		*global_alpha_value = plane_state->alpha >> 8;
+	}
+}
+
+static void add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t mod)
+{
+	if (!*mods)
+		return;
+
+	if (*cap - *size < 1) {
+		uint64_t new_cap = *cap * 2;
+		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+
+		if (!new_mods) {
+			kfree(*mods);
+			*mods = NULL;
+			return;
+		}
+
+		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
+		kfree(*mods);
+		*mods = new_mods;
+		*cap = new_cap;
+	}
+
+	(*mods)[*size] = mod;
+	*size += 1;
+}
+
+bool modifier_has_dcc(uint64_t modifier)
+{
+	return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier);
+}
+
+unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
+{
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return 0;
+
+	return AMD_FMT_MOD_GET(TILE, modifier);
+}
+
+static void fill_gfx8_tiling_info_from_flags(union dc_tiling_info *tiling_info,
+				 uint64_t tiling_flags)
+{
+	/* Fill GFX8 params */
+	if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE) == DC_ARRAY_2D_TILED_THIN1) {
+		unsigned int bankw, bankh, mtaspect, tile_split, num_banks;
+
+		bankw = AMDGPU_TILING_GET(tiling_flags, BANK_WIDTH);
+		bankh = AMDGPU_TILING_GET(tiling_flags, BANK_HEIGHT);
+		mtaspect = AMDGPU_TILING_GET(tiling_flags, MACRO_TILE_ASPECT);
+		tile_split = AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT);
+		num_banks = AMDGPU_TILING_GET(tiling_flags, NUM_BANKS);
+
+		/* XXX fix me for VI */
+		tiling_info->gfx8.num_banks = num_banks;
+		tiling_info->gfx8.array_mode =
+				DC_ARRAY_2D_TILED_THIN1;
+		tiling_info->gfx8.tile_split = tile_split;
+		tiling_info->gfx8.bank_width = bankw;
+		tiling_info->gfx8.bank_height = bankh;
+		tiling_info->gfx8.tile_aspect = mtaspect;
+		tiling_info->gfx8.tile_mode =
+				DC_ADDR_SURF_MICRO_TILING_DISPLAY;
+	} else if (AMDGPU_TILING_GET(tiling_flags, ARRAY_MODE)
+			== DC_ARRAY_1D_TILED_THIN1) {
+		tiling_info->gfx8.array_mode = DC_ARRAY_1D_TILED_THIN1;
+	}
+
+	tiling_info->gfx8.pipe_config =
+			AMDGPU_TILING_GET(tiling_flags, PIPE_CONFIG);
+}
+
+static void fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
+				  union dc_tiling_info *tiling_info)
+{
+	/* Fill GFX9 params */
+	tiling_info->gfx9.num_pipes =
+		adev->gfx.config.gb_addr_config_fields.num_pipes;
+	tiling_info->gfx9.num_banks =
+		adev->gfx.config.gb_addr_config_fields.num_banks;
+	tiling_info->gfx9.pipe_interleave =
+		adev->gfx.config.gb_addr_config_fields.pipe_interleave_size;
+	tiling_info->gfx9.num_shader_engines =
+		adev->gfx.config.gb_addr_config_fields.num_se;
+	tiling_info->gfx9.max_compressed_frags =
+		adev->gfx.config.gb_addr_config_fields.max_compress_frags;
+	tiling_info->gfx9.num_rb_per_se =
+		adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
+	tiling_info->gfx9.shaderEnable = 1;
+	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
+}
+
+static void fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
+				    union dc_tiling_info *tiling_info,
+				    uint64_t modifier)
+{
+	unsigned int mod_bank_xor_bits = AMD_FMT_MOD_GET(BANK_XOR_BITS, modifier);
+	unsigned int mod_pipe_xor_bits = AMD_FMT_MOD_GET(PIPE_XOR_BITS, modifier);
+	unsigned int pkrs_log2 = AMD_FMT_MOD_GET(PACKERS, modifier);
+	unsigned int pipes_log2;
+
+	pipes_log2 = min(5u, mod_pipe_xor_bits);
+
+	fill_gfx9_tiling_info_from_device(adev, tiling_info);
+
+	if (!IS_AMD_FMT_MOD(modifier))
+		return;
+
+	tiling_info->gfx9.num_pipes = 1u << pipes_log2;
+	tiling_info->gfx9.num_shader_engines = 1u << (mod_pipe_xor_bits - pipes_log2);
+
+	if (adev->family >= AMDGPU_FAMILY_NV) {
+		tiling_info->gfx9.num_pkrs = 1u << pkrs_log2;
+	} else {
+		tiling_info->gfx9.num_banks = 1u << mod_bank_xor_bits;
+
+		/* for DCC we know it isn't rb aligned, so rb_per_se doesn't matter. */
+	}
+}
+
+static int validate_dcc(struct amdgpu_device *adev,
+	     const enum surface_pixel_format format,
+	     const enum dc_rotation_angle rotation,
+	     const union dc_tiling_info *tiling_info,
+	     const struct dc_plane_dcc_param *dcc,
+	     const struct dc_plane_address *address,
+	     const struct plane_size *plane_size)
+{
+	struct dc *dc = adev->dm.dc;
+	struct dc_dcc_surface_param input;
+	struct dc_surface_dcc_cap output;
+
+	memset(&input, 0, sizeof(input));
+	memset(&output, 0, sizeof(output));
+
+	if (!dcc->enable)
+		return 0;
+
+	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN ||
+	    !dc->cap_funcs.get_dcc_compression_cap)
+		return -EINVAL;
+
+	input.format = format;
+	input.surface_size.width = plane_size->surface_size.width;
+	input.surface_size.height = plane_size->surface_size.height;
+	input.swizzle_mode = tiling_info->gfx9.swizzle;
+
+	if (rotation == ROTATION_ANGLE_0 || rotation == ROTATION_ANGLE_180)
+		input.scan = SCAN_DIRECTION_HORIZONTAL;
+	else if (rotation == ROTATION_ANGLE_90 || rotation == ROTATION_ANGLE_270)
+		input.scan = SCAN_DIRECTION_VERTICAL;
+
+	if (!dc->cap_funcs.get_dcc_compression_cap(dc, &input, &output))
+		return -EINVAL;
+
+	if (!output.capable)
+		return -EINVAL;
+
+	if (dcc->independent_64b_blks == 0 &&
+	    output.grph.rgb.independent_64b_blks != 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
+					  const struct amdgpu_framebuffer *afb,
+					  const enum surface_pixel_format format,
+					  const enum dc_rotation_angle rotation,
+					  const struct plane_size *plane_size,
+					  union dc_tiling_info *tiling_info,
+					  struct dc_plane_dcc_param *dcc,
+					  struct dc_plane_address *address,
+					  const bool force_disable_dcc)
+{
+	const uint64_t modifier = afb->base.modifier;
+	int ret = 0;
+
+	fill_gfx9_tiling_info_from_modifier(adev, tiling_info, modifier);
+	tiling_info->gfx9.swizzle = modifier_gfx9_swizzle_mode(modifier);
+
+	if (modifier_has_dcc(modifier) && !force_disable_dcc) {
+		uint64_t dcc_address = afb->address + afb->base.offsets[1];
+		bool independent_64b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_64B, modifier);
+		bool independent_128b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_128B, modifier);
+
+		dcc->enable = 1;
+		dcc->meta_pitch = afb->base.pitches[1];
+		dcc->independent_64b_blks = independent_64b_blks;
+		if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) >= AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) {
+			if (independent_64b_blks && independent_128b_blks)
+				dcc->dcc_ind_blk = hubp_ind_block_64b_no_128bcl;
+			else if (independent_128b_blks)
+				dcc->dcc_ind_blk = hubp_ind_block_128b;
+			else if (independent_64b_blks && !independent_128b_blks)
+				dcc->dcc_ind_blk = hubp_ind_block_64b;
+			else
+				dcc->dcc_ind_blk = hubp_ind_block_unconstrained;
+		} else {
+			if (independent_64b_blks)
+				dcc->dcc_ind_blk = hubp_ind_block_64b;
+			else
+				dcc->dcc_ind_blk = hubp_ind_block_unconstrained;
+		}
+
+		address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
+		address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
+	}
+
+	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
+	if (ret)
+		drm_dbg_kms(adev_to_drm(adev), "validate_dcc: returned error: %d\n", ret);
+
+	return ret;
+}
+
+static void add_gfx10_1_modifiers(const struct amdgpu_device *adev,
+		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+
+	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static void add_gfx9_modifiers(const struct amdgpu_device *adev,
+		   uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipes = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pipe_xor_bits = min(8, pipes +
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
+	int bank_xor_bits = min(8 - pipe_xor_bits,
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
+	int rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
+		 ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
+
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		/* Raven2 and later */
+		bool has_constant_encode = adev->asic_type > CHIP_RAVEN || adev->external_rev_id >= 0x81;
+
+		/*
+		 * No _D DCC swizzles yet because we only allow 32bpp, which
+		 * doesn't support _D on DCN
+		 */
+
+		if (has_constant_encode) {
+			add_modifier(mods, size, capacity, AMD_FMT_MOD |
+				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+				    AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
+		}
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
+
+		if (has_constant_encode) {
+			add_modifier(mods, size, capacity, AMD_FMT_MOD |
+				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+				    AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+
+				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+				    AMD_FMT_MOD_SET(RB, rb) |
+				    AMD_FMT_MOD_SET(PIPE, pipes));
+		}
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
+			    AMD_FMT_MOD_SET(RB, rb) |
+			    AMD_FMT_MOD_SET(PIPE, pipes));
+	}
+
+	/*
+	 * Only supported for 64bpp on Raven, will be filtered on format in
+	 * dm_plane_format_mod_supported.
+	 */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+	}
+
+	/*
+	 * Only supported for 64bpp on Raven, will be filtered on format in
+	 * dm_plane_format_mod_supported.
+	 */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+	}
+}
+
+static void add_gfx10_3_modifiers(const struct amdgpu_device *adev,
+		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pkrs = ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static void add_gfx11_modifiers(struct amdgpu_device *adev,
+		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int num_pipes = 0;
+	int pipe_xor_bits = 0;
+	int num_pkrs = 0;
+	int pkrs = 0;
+	u32 gb_addr_config;
+	u8 i = 0;
+	unsigned swizzle_r_x;
+	uint64_t modifier_r_x;
+	uint64_t modifier_dcc_best;
+	uint64_t modifier_dcc_4k;
+
+	/* TODO: GFX11 IP HW init hasnt finish and we get zero if we read from
+	 * adev->gfx.config.gb_addr_config_fields.num_{pkrs,pipes}
+	 */
+	gb_addr_config = RREG32_SOC15(GC, 0, regGB_ADDR_CONFIG);
+	ASSERT(gb_addr_config != 0);
+
+	num_pkrs = 1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PKRS);
+	pkrs = ilog2(num_pkrs);
+	num_pipes = 1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PIPES);
+	pipe_xor_bits = ilog2(num_pipes);
+
+	for (i = 0; i < 2; i++) {
+		/* Insert the best one first. */
+		/* R_X swizzle modes are the best for rendering and DCC requires them. */
+		if (num_pipes > 16)
+			swizzle_r_x = !i ? AMD_FMT_MOD_TILE_GFX11_256K_R_X : AMD_FMT_MOD_TILE_GFX9_64K_R_X;
+		else
+			swizzle_r_x = !i ? AMD_FMT_MOD_TILE_GFX9_64K_R_X : AMD_FMT_MOD_TILE_GFX11_256K_R_X;
+
+		modifier_r_x = AMD_FMT_MOD |
+			       AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX11) |
+			       AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			       AMD_FMT_MOD_SET(TILE, swizzle_r_x) |
+			       AMD_FMT_MOD_SET(PACKERS, pkrs);
+
+		/* DCC_CONSTANT_ENCODE is not set because it can't vary with gfx11 (it's implied to be 1). */
+		modifier_dcc_best = modifier_r_x | AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 0) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B);
+
+		/* DCC settings for 4K and greater resolutions. (required by display hw) */
+		modifier_dcc_4k = modifier_r_x | AMD_FMT_MOD_SET(DCC, 1) |
+				  AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+				  AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+				  AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B);
+
+		add_modifier(mods, size, capacity, modifier_dcc_best);
+		add_modifier(mods, size, capacity, modifier_dcc_4k);
+
+		add_modifier(mods, size, capacity, modifier_dcc_best | AMD_FMT_MOD_SET(DCC_RETILE, 1));
+		add_modifier(mods, size, capacity, modifier_dcc_4k | AMD_FMT_MOD_SET(DCC_RETILE, 1));
+
+		add_modifier(mods, size, capacity, modifier_r_x);
+	}
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX11) |
+			AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D));
+}
+
+static int get_plane_modifiers(struct amdgpu_device *adev, unsigned int plane_type, uint64_t **mods)
+{
+	uint64_t size = 0, capacity = 128;
+	*mods = NULL;
+
+	/* We have not hooked up any pre-GFX9 modifiers. */
+	if (adev->family < AMDGPU_FAMILY_AI)
+		return 0;
+
+	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+
+	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+		return *mods ? 0 : -ENOMEM;
+	}
+
+	switch (adev->family) {
+	case AMDGPU_FAMILY_AI:
+	case AMDGPU_FAMILY_RV:
+		add_gfx9_modifiers(adev, mods, &size, &capacity);
+		break;
+	case AMDGPU_FAMILY_NV:
+	case AMDGPU_FAMILY_VGH:
+	case AMDGPU_FAMILY_YC:
+	case AMDGPU_FAMILY_GC_10_3_6:
+	case AMDGPU_FAMILY_GC_10_3_7:
+		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
+		else
+			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
+		break;
+	case AMDGPU_FAMILY_GC_11_0_0:
+	case AMDGPU_FAMILY_GC_11_0_2:
+		add_gfx11_modifiers(adev, mods, &size, &capacity);
+		break;
+	}
+
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+
+	/* INVALID marks the end of the list. */
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+
+	if (!*mods)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int get_plane_formats(const struct drm_plane *plane,
+			     const struct dc_plane_cap *plane_cap,
+			     uint32_t *formats, int max_formats)
+{
+	int i, num_formats = 0;
+
+	/*
+	 * TODO: Query support for each group of formats directly from
+	 * DC plane caps. This will require adding more formats to the
+	 * caps list.
+	 */
+
+	switch (plane->type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		for (i = 0; i < ARRAY_SIZE(rgb_formats); ++i) {
+			if (num_formats >= max_formats)
+				break;
+
+			formats[num_formats++] = rgb_formats[i];
+		}
+
+		if (plane_cap && plane_cap->pixel_format_support.nv12)
+			formats[num_formats++] = DRM_FORMAT_NV12;
+		if (plane_cap && plane_cap->pixel_format_support.p010)
+			formats[num_formats++] = DRM_FORMAT_P010;
+		if (plane_cap && plane_cap->pixel_format_support.fp16) {
+			formats[num_formats++] = DRM_FORMAT_XRGB16161616F;
+			formats[num_formats++] = DRM_FORMAT_ARGB16161616F;
+			formats[num_formats++] = DRM_FORMAT_XBGR16161616F;
+			formats[num_formats++] = DRM_FORMAT_ABGR16161616F;
+		}
+		break;
+
+	case DRM_PLANE_TYPE_OVERLAY:
+		for (i = 0; i < ARRAY_SIZE(overlay_formats); ++i) {
+			if (num_formats >= max_formats)
+				break;
+
+			formats[num_formats++] = overlay_formats[i];
+		}
+		break;
+
+	case DRM_PLANE_TYPE_CURSOR:
+		for (i = 0; i < ARRAY_SIZE(cursor_formats); ++i) {
+			if (num_formats >= max_formats)
+				break;
+
+			formats[num_formats++] = cursor_formats[i];
+		}
+		break;
+	}
+
+	return num_formats;
+}
+
+#ifdef CONFIG_DRM_AMD_DC_HDR
+static int attach_color_mgmt_properties(struct amdgpu_display_manager *dm, struct drm_plane *plane)
+{
+	drm_object_attach_property(&plane->base,
+				   dm->degamma_lut_property,
+				   0);
+	drm_object_attach_property(&plane->base,
+				   dm->degamma_lut_size_property,
+				   MAX_COLOR_LUT_ENTRIES);
+	drm_object_attach_property(&plane->base, dm->ctm_property,
+				   0);
+	drm_object_attach_property(&plane->base, dm->sdr_boost_property,
+				   DEFAULT_SDR_BOOST);
+
+	return 0;
+}
+#endif
+
+int fill_plane_buffer_attributes(struct amdgpu_device *adev,
+			     const struct amdgpu_framebuffer *afb,
+			     const enum surface_pixel_format format,
+			     const enum dc_rotation_angle rotation,
+			     const uint64_t tiling_flags,
+			     union dc_tiling_info *tiling_info,
+			     struct plane_size *plane_size,
+			     struct dc_plane_dcc_param *dcc,
+			     struct dc_plane_address *address,
+			     bool tmz_surface,
+			     bool force_disable_dcc)
+{
+	const struct drm_framebuffer *fb = &afb->base;
+	int ret;
+
+	memset(tiling_info, 0, sizeof(*tiling_info));
+	memset(plane_size, 0, sizeof(*plane_size));
+	memset(dcc, 0, sizeof(*dcc));
+	memset(address, 0, sizeof(*address));
+
+	address->tmz_surface = tmz_surface;
+
+	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
+		uint64_t addr = afb->address + fb->offsets[0];
+
+		plane_size->surface_size.x = 0;
+		plane_size->surface_size.y = 0;
+		plane_size->surface_size.width = fb->width;
+		plane_size->surface_size.height = fb->height;
+		plane_size->surface_pitch =
+			fb->pitches[0] / fb->format->cpp[0];
+
+		address->type = PLN_ADDR_TYPE_GRAPHICS;
+		address->grph.addr.low_part = lower_32_bits(addr);
+		address->grph.addr.high_part = upper_32_bits(addr);
+	} else if (format < SURFACE_PIXEL_FORMAT_INVALID) {
+		uint64_t luma_addr = afb->address + fb->offsets[0];
+		uint64_t chroma_addr = afb->address + fb->offsets[1];
+
+		plane_size->surface_size.x = 0;
+		plane_size->surface_size.y = 0;
+		plane_size->surface_size.width = fb->width;
+		plane_size->surface_size.height = fb->height;
+		plane_size->surface_pitch =
+			fb->pitches[0] / fb->format->cpp[0];
+
+		plane_size->chroma_size.x = 0;
+		plane_size->chroma_size.y = 0;
+		/* TODO: set these based on surface format */
+		plane_size->chroma_size.width = fb->width / 2;
+		plane_size->chroma_size.height = fb->height / 2;
+
+		plane_size->chroma_pitch =
+			fb->pitches[1] / fb->format->cpp[1];
+
+		address->type = PLN_ADDR_TYPE_VIDEO_PROGRESSIVE;
+		address->video_progressive.luma_addr.low_part =
+			lower_32_bits(luma_addr);
+		address->video_progressive.luma_addr.high_part =
+			upper_32_bits(luma_addr);
+		address->video_progressive.chroma_addr.low_part =
+			lower_32_bits(chroma_addr);
+		address->video_progressive.chroma_addr.high_part =
+			upper_32_bits(chroma_addr);
+	}
+
+	if (adev->family >= AMDGPU_FAMILY_AI) {
+		ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
+								rotation, plane_size,
+								tiling_info, dcc,
+								address,
+								force_disable_dcc);
+		if (ret)
+			return ret;
+	} else {
+		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
+	}
+
+	return 0;
+}
+
+static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
+				      struct drm_plane_state *new_state)
+{
+	struct amdgpu_framebuffer *afb;
+	struct drm_gem_object *obj;
+	struct amdgpu_device *adev;
+	struct amdgpu_bo *rbo;
+	struct dm_plane_state *dm_plane_state_new, *dm_plane_state_old;
+	struct list_head list;
+	struct ttm_validate_buffer tv;
+	struct ww_acquire_ctx ticket;
+	uint32_t domain;
+	int r;
+
+	if (!new_state->fb) {
+		DRM_DEBUG_KMS("No FB bound\n");
+		return 0;
+	}
+
+	afb = to_amdgpu_framebuffer(new_state->fb);
+	obj = new_state->fb->obj[0];
+	rbo = gem_to_amdgpu_bo(obj);
+	adev = amdgpu_ttm_adev(rbo->tbo.bdev);
+	INIT_LIST_HEAD(&list);
+
+	tv.bo = &rbo->tbo;
+	tv.num_shared = 1;
+	list_add(&tv.head, &list);
+
+	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
+	if (r) {
+		dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
+		return r;
+	}
+
+	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+		domain = amdgpu_display_supported_domains(adev, rbo->flags);
+	else
+		domain = AMDGPU_GEM_DOMAIN_VRAM;
+
+	r = amdgpu_bo_pin(rbo, domain);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("Failed to pin framebuffer with error %d\n", r);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		return r;
+	}
+
+	r = amdgpu_ttm_alloc_gart(&rbo->tbo);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unpin(rbo);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		DRM_ERROR("%p bind failed\n", rbo);
+		return r;
+	}
+
+	ttm_eu_backoff_reservation(&ticket, &list);
+
+	afb->address = amdgpu_bo_gpu_offset(rbo);
+
+	amdgpu_bo_ref(rbo);
+
+	/**
+	 * We don't do surface updates on planes that have been newly created,
+	 * but we also don't have the afb->address during atomic check.
+	 *
+	 * Fill in buffer attributes depending on the address here, but only on
+	 * newly created planes since they're not being used by DC yet and this
+	 * won't modify global state.
+	 */
+	dm_plane_state_old = to_dm_plane_state(plane->state);
+	dm_plane_state_new = to_dm_plane_state(new_state);
+
+	if (dm_plane_state_new->dc_state &&
+	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
+		struct dc_plane_state *plane_state =
+			dm_plane_state_new->dc_state;
+		bool force_disable_dcc = !plane_state->dcc.enable;
+
+		fill_plane_buffer_attributes(
+			adev, afb, plane_state->format, plane_state->rotation,
+			afb->tiling_flags,
+			&plane_state->tiling_info, &plane_state->plane_size,
+			&plane_state->dcc, &plane_state->address,
+			afb->tmz_surface, force_disable_dcc);
+	}
+
+	return 0;
+}
+
+static void dm_plane_helper_cleanup_fb(struct drm_plane *plane,
+				       struct drm_plane_state *old_state)
+{
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!old_state->fb)
+		return;
+
+	rbo = gem_to_amdgpu_bo(old_state->fb->obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
+	if (unlikely(r)) {
+		DRM_ERROR("failed to reserve rbo before unpin\n");
+		return;
+	}
+
+	amdgpu_bo_unpin(rbo);
+	amdgpu_bo_unreserve(rbo);
+	amdgpu_bo_unref(&rbo);
+}
+
+static void get_min_max_dc_plane_scaling(struct drm_device *dev,
+					 struct drm_framebuffer *fb,
+					 int *min_downscale, int *max_upscale)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
+	/* Caps for all supported planes are the same on DCE and DCN 1 - 3 */
+	struct dc_plane_cap *plane_cap = &dc->caps.planes[0];
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		*max_upscale = plane_cap->max_upscale_factor.nv12;
+		*min_downscale = plane_cap->max_downscale_factor.nv12;
+		break;
+
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		*max_upscale = plane_cap->max_upscale_factor.fp16;
+		*min_downscale = plane_cap->max_downscale_factor.fp16;
+		break;
+
+	default:
+		*max_upscale = plane_cap->max_upscale_factor.argb8888;
+		*min_downscale = plane_cap->max_downscale_factor.argb8888;
+		break;
+	}
+
+	/*
+	 * A factor of 1 in the plane_cap means to not allow scaling, ie. use a
+	 * scaling factor of 1.0 == 1000 units.
+	 */
+	if (*max_upscale == 1)
+		*max_upscale = 1000;
+
+	if (*min_downscale == 1)
+		*min_downscale = 1000;
+}
+
+int dm_plane_helper_check_state(struct drm_plane_state *state,
+				       struct drm_crtc_state *new_crtc_state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	int min_downscale, max_upscale;
+	int min_scale = 0;
+	int max_scale = INT_MAX;
+
+	/* Plane enabled? Validate viewport and get scaling factors from plane caps. */
+	if (fb && state->crtc) {
+		/* Validate viewport to cover the case when only the position changes */
+		if (state->plane->type != DRM_PLANE_TYPE_CURSOR) {
+			int viewport_width = state->crtc_w;
+			int viewport_height = state->crtc_h;
+
+			if (state->crtc_x < 0)
+				viewport_width += state->crtc_x;
+			else if (state->crtc_x + state->crtc_w > new_crtc_state->mode.crtc_hdisplay)
+				viewport_width = new_crtc_state->mode.crtc_hdisplay - state->crtc_x;
+
+			if (state->crtc_y < 0)
+				viewport_height += state->crtc_y;
+			else if (state->crtc_y + state->crtc_h > new_crtc_state->mode.crtc_vdisplay)
+				viewport_height = new_crtc_state->mode.crtc_vdisplay - state->crtc_y;
+
+			if (viewport_width < 0 || viewport_height < 0) {
+				DRM_DEBUG_ATOMIC("Plane completely outside of screen\n");
+				return -EINVAL;
+			} else if (viewport_width < MIN_VIEWPORT_SIZE*2) { /* x2 for width is because of pipe-split. */
+				DRM_DEBUG_ATOMIC("Viewport width %d smaller than %d\n", viewport_width, MIN_VIEWPORT_SIZE*2);
+				return -EINVAL;
+			} else if (viewport_height < MIN_VIEWPORT_SIZE) {
+				DRM_DEBUG_ATOMIC("Viewport height %d smaller than %d\n", viewport_height, MIN_VIEWPORT_SIZE);
+				return -EINVAL;
+			}
+
+		}
+
+		/* Get min/max allowed scaling factors from plane caps. */
+		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
+					     &min_downscale, &max_upscale);
+		/*
+		 * Convert to drm convention: 16.16 fixed point, instead of dc's
+		 * 1.0 == 1000. Also drm scaling is src/dst instead of dc's
+		 * dst/src, so min_scale = 1.0 / max_upscale, etc.
+		 */
+		min_scale = (1000 << 16) / max_upscale;
+		max_scale = (1000 << 16) / min_downscale;
+	}
+
+	return drm_atomic_helper_check_plane_state(
+		state, new_crtc_state, min_scale, max_scale, true, true);
+}
+
+int fill_dc_scaling_info(struct amdgpu_device *adev,
+				const struct drm_plane_state *state,
+				struct dc_scaling_info *scaling_info)
+{
+	int scale_w, scale_h, min_downscale, max_upscale;
+
+	memset(scaling_info, 0, sizeof(*scaling_info));
+
+	/* Source is fixed 16.16 but we ignore mantissa for now... */
+	scaling_info->src_rect.x = state->src_x >> 16;
+	scaling_info->src_rect.y = state->src_y >> 16;
+
+	/*
+	 * For reasons we don't (yet) fully understand a non-zero
+	 * src_y coordinate into an NV12 buffer can cause a
+	 * system hang on DCN1x.
+	 * To avoid hangs (and maybe be overly cautious)
+	 * let's reject both non-zero src_x and src_y.
+	 *
+	 * We currently know of only one use-case to reproduce a
+	 * scenario with non-zero src_x and src_y for NV12, which
+	 * is to gesture the YouTube Android app into full screen
+	 * on ChromeOS.
+	 */
+	if (((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
+	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1))) &&
+	    (state->fb && state->fb->format->format == DRM_FORMAT_NV12 &&
+	    (scaling_info->src_rect.x != 0 || scaling_info->src_rect.y != 0)))
+		return -EINVAL;
+
+	scaling_info->src_rect.width = state->src_w >> 16;
+	if (scaling_info->src_rect.width == 0)
+		return -EINVAL;
+
+	scaling_info->src_rect.height = state->src_h >> 16;
+	if (scaling_info->src_rect.height == 0)
+		return -EINVAL;
+
+	scaling_info->dst_rect.x = state->crtc_x;
+	scaling_info->dst_rect.y = state->crtc_y;
+
+	if (state->crtc_w == 0)
+		return -EINVAL;
+
+	scaling_info->dst_rect.width = state->crtc_w;
+
+	if (state->crtc_h == 0)
+		return -EINVAL;
+
+	scaling_info->dst_rect.height = state->crtc_h;
+
+	/* DRM doesn't specify clipping on destination output. */
+	scaling_info->clip_rect = scaling_info->dst_rect;
+
+	/* Validate scaling per-format with DC plane caps */
+	if (state->plane && state->plane->dev && state->fb) {
+		get_min_max_dc_plane_scaling(state->plane->dev, state->fb,
+					     &min_downscale, &max_upscale);
+	} else {
+		min_downscale = 250;
+		max_upscale = 16000;
+	}
+
+	scale_w = scaling_info->dst_rect.width * 1000 /
+		  scaling_info->src_rect.width;
+
+	if (scale_w < min_downscale || scale_w > max_upscale)
+		return -EINVAL;
+
+	scale_h = scaling_info->dst_rect.height * 1000 /
+		  scaling_info->src_rect.height;
+
+	if (scale_h < min_downscale || scale_h > max_upscale)
+		return -EINVAL;
+
+	/*
+	 * The "scaling_quality" can be ignored for now, quality = 0 has DC
+	 * assume reasonable defaults based on the format.
+	 */
+
+	return 0;
+}
+
+static int dm_plane_atomic_check(struct drm_plane *plane,
+				 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct dc *dc = adev->dm.dc;
+	struct dm_plane_state *dm_plane_state;
+	struct dc_scaling_info scaling_info;
+	struct drm_crtc_state *new_crtc_state;
+	int ret;
+
+	trace_amdgpu_dm_plane_atomic_check(new_plane_state);
+
+	dm_plane_state = to_dm_plane_state(new_plane_state);
+
+	if (!dm_plane_state->dc_state)
+		return 0;
+
+	new_crtc_state =
+		drm_atomic_get_new_crtc_state(state,
+					      new_plane_state->crtc);
+	if (!new_crtc_state)
+		return -EINVAL;
+
+	ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
+	if (ret)
+		return ret;
+
+	ret = fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
+	if (ret)
+		return ret;
+
+	if (dc_validate_plane(dc, dm_plane_state->dc_state) == DC_OK)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int dm_plane_atomic_async_check(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	/* Only support async updates on cursor planes. */
+	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
+			       struct dc_cursor_position *position)
+{
+	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
+	int x, y;
+	int xorigin = 0, yorigin = 0;
+
+	if (!crtc || !plane->state->fb)
+		return 0;
+
+	if ((plane->state->crtc_w > amdgpu_crtc->max_cursor_width) ||
+	    (plane->state->crtc_h > amdgpu_crtc->max_cursor_height)) {
+		DRM_ERROR("%s: bad cursor width or height %d x %d\n",
+			  __func__,
+			  plane->state->crtc_w,
+			  plane->state->crtc_h);
+		return -EINVAL;
+	}
+
+	x = plane->state->crtc_x;
+	y = plane->state->crtc_y;
+
+	if (x <= -amdgpu_crtc->max_cursor_width ||
+	    y <= -amdgpu_crtc->max_cursor_height)
+		return 0;
+
+	if (x < 0) {
+		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
+		x = 0;
+	}
+	if (y < 0) {
+		yorigin = min(-y, amdgpu_crtc->max_cursor_height - 1);
+		y = 0;
+	}
+	position->enable = true;
+	position->translate_by_source = true;
+	position->x = x;
+	position->y = y;
+	position->x_hotspot = xorigin;
+	position->y_hotspot = yorigin;
+
+	return 0;
+}
+
+void handle_cursor_update(struct drm_plane *plane,
+				 struct drm_plane_state *old_plane_state)
+{
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
+	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
+	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
+	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
+	uint64_t address = afb ? afb->address : 0;
+	struct dc_cursor_position position = {0};
+	struct dc_cursor_attributes attributes;
+	int ret;
+
+	if (!plane->state->fb && !old_plane_state->fb)
+		return;
+
+	DC_LOG_CURSOR("%s: crtc_id=%d with size %d to %d\n",
+		      __func__,
+		      amdgpu_crtc->crtc_id,
+		      plane->state->crtc_w,
+		      plane->state->crtc_h);
+
+	ret = get_cursor_position(plane, crtc, &position);
+	if (ret)
+		return;
+
+	if (!position.enable) {
+		/* turn off cursor */
+		if (crtc_state && crtc_state->stream) {
+			mutex_lock(&adev->dm.dc_lock);
+			dc_stream_set_cursor_position(crtc_state->stream,
+						      &position);
+			mutex_unlock(&adev->dm.dc_lock);
+		}
+		return;
+	}
+
+	amdgpu_crtc->cursor_width = plane->state->crtc_w;
+	amdgpu_crtc->cursor_height = plane->state->crtc_h;
+
+	memset(&attributes, 0, sizeof(attributes));
+	attributes.address.high_part = upper_32_bits(address);
+	attributes.address.low_part  = lower_32_bits(address);
+	attributes.width             = plane->state->crtc_w;
+	attributes.height            = plane->state->crtc_h;
+	attributes.color_format      = CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA;
+	attributes.rotation_angle    = 0;
+	attributes.attribute_flags.value = 0;
+
+	attributes.pitch = afb->base.pitches[0] / afb->base.format->cpp[0];
+
+	if (crtc_state->stream) {
+		mutex_lock(&adev->dm.dc_lock);
+		if (!dc_stream_set_cursor_attributes(crtc_state->stream,
+							 &attributes))
+			DRM_ERROR("DC failed to set cursor attributes\n");
+
+		if (!dc_stream_set_cursor_position(crtc_state->stream,
+						   &position))
+			DRM_ERROR("DC failed to set cursor position\n");
+		mutex_unlock(&adev->dm.dc_lock);
+	}
+}
+
+static void dm_plane_atomic_async_update(struct drm_plane *plane,
+					 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct drm_plane_state *old_state =
+		drm_atomic_get_old_plane_state(state, plane);
+
+	trace_amdgpu_dm_atomic_update_cursor(new_state);
+
+	swap(plane->state->fb, new_state->fb);
+
+	plane->state->src_x = new_state->src_x;
+	plane->state->src_y = new_state->src_y;
+	plane->state->src_w = new_state->src_w;
+	plane->state->src_h = new_state->src_h;
+	plane->state->crtc_x = new_state->crtc_x;
+	plane->state->crtc_y = new_state->crtc_y;
+	plane->state->crtc_w = new_state->crtc_w;
+	plane->state->crtc_h = new_state->crtc_h;
+
+	handle_cursor_update(plane, old_state);
+}
+
+static const struct drm_plane_helper_funcs dm_plane_helper_funcs = {
+	.prepare_fb = dm_plane_helper_prepare_fb,
+	.cleanup_fb = dm_plane_helper_cleanup_fb,
+	.atomic_check = dm_plane_atomic_check,
+	.atomic_async_check = dm_plane_atomic_async_check,
+	.atomic_async_update = dm_plane_atomic_async_update
+};
+
+static void dm_drm_plane_reset(struct drm_plane *plane)
+{
+	struct dm_plane_state *amdgpu_state = NULL;
+
+	if (plane->state)
+		plane->funcs->atomic_destroy_state(plane, plane->state);
+
+	amdgpu_state = kzalloc(sizeof(*amdgpu_state), GFP_KERNEL);
+	WARN_ON(amdgpu_state == NULL);
+
+	if (amdgpu_state)
+		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+#ifdef CONFIG_DRM_AMD_DC_HDR
+	if (amdgpu_state)
+		amdgpu_state->sdr_boost = DEFAULT_SDR_BOOST;
+#endif
+}
+
+static struct drm_plane_state *
+dm_drm_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct dm_plane_state *dm_plane_state, *old_dm_plane_state;
+
+	old_dm_plane_state = to_dm_plane_state(plane->state);
+	dm_plane_state = kzalloc(sizeof(*dm_plane_state), GFP_KERNEL);
+	if (!dm_plane_state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &dm_plane_state->base);
+
+	if (old_dm_plane_state->dc_state) {
+		dm_plane_state->dc_state = old_dm_plane_state->dc_state;
+		dc_plane_state_retain(dm_plane_state->dc_state);
+	}
+
+#ifdef CONFIG_DRM_AMD_DC_HDR
+	if (dm_plane_state->degamma_lut)
+		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->ctm)
+		drm_property_blob_get(dm_plane_state->ctm);
+
+	dm_plane_state->sdr_boost = old_dm_plane_state->sdr_boost;
+#endif
+
+	return &dm_plane_state->base;
+}
+
+static bool dm_plane_format_mod_supported(struct drm_plane *plane,
+					  uint32_t format,
+					  uint64_t modifier)
+{
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	const struct drm_format_info *info = drm_format_info(format);
+	struct hw_asic_id asic_id = adev->dm.dc->ctx->asic_id;
+
+	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
+
+	if (!info)
+		return false;
+
+	/*
+	 * We always have to allow these modifiers:
+	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
+	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
+	 */
+	if (modifier == DRM_FORMAT_MOD_LINEAR ||
+	    modifier == DRM_FORMAT_MOD_INVALID) {
+		return true;
+	}
+
+	/* check if swizzle mode is supported by this version of DCN */
+	switch (asic_id.chip_family) {
+	case FAMILY_SI:
+	case FAMILY_CI:
+	case FAMILY_KV:
+	case FAMILY_CZ:
+	case FAMILY_VI:
+		/* asics before AI does not have modifier support */
+		return false;
+	case FAMILY_AI:
+	case FAMILY_RV:
+	case FAMILY_NV:
+	case FAMILY_VGH:
+	case FAMILY_YELLOW_CARP:
+	case AMDGPU_FAMILY_GC_10_3_6:
+	case AMDGPU_FAMILY_GC_10_3_7:
+		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
+		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_D:
+			return true;
+		default:
+			return false;
+		}
+		break;
+	case AMDGPU_FAMILY_GC_11_0_0:
+		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
+		case AMD_FMT_MOD_TILE_GFX11_256K_R_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
+		case AMD_FMT_MOD_TILE_GFX9_64K_D:
+			return true;
+		default:
+			return false;
+		}
+		break;
+	default:
+		ASSERT(0); /* Unknown asic */
+		break;
+	}
+
+	/*
+	 * For D swizzle the canonical modifier depends on the bpp, so check
+	 * it here.
+	 */
+	if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) == AMD_FMT_MOD_TILE_VER_GFX9 &&
+	    adev->family >= AMDGPU_FAMILY_NV) {
+		if (microtile == MICRO_SWIZZLE_D && info->cpp[0] == 4)
+			return false;
+	}
+
+	if (adev->family >= AMDGPU_FAMILY_RV && microtile == MICRO_SWIZZLE_D &&
+	    info->cpp[0] < 8)
+		return false;
+
+	if (modifier_has_dcc(modifier)) {
+		/* Per radeonsi comments 16/64 bpp are more complicated. */
+		if (info->cpp[0] != 4)
+			return false;
+		/* We support multi-planar formats, but not when combined with
+		 * additional DCC metadata planes.
+		 */
+		if (info->num_planes > 1)
+			return false;
+	}
+
+	return true;
+}
+
+static void dm_drm_plane_destroy_state(struct drm_plane *plane,
+				struct drm_plane_state *state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+
+#ifdef CONFIG_DRM_AMD_DC_HDR
+	drm_property_blob_put(dm_plane_state->degamma_lut);
+	drm_property_blob_put(dm_plane_state->ctm);
+#endif
+	if (dm_plane_state->dc_state)
+		dc_plane_state_release(dm_plane_state->dc_state);
+
+	drm_atomic_helper_plane_destroy_state(plane, state);
+}
+
+#ifdef CONFIG_DRM_AMD_DC_HDR
+/* copied from drm_atomic_uapi.c */
+static int atomic_replace_property_blob_from_id(struct drm_device *dev,
+					 struct drm_property_blob **blob,
+					 uint64_t blob_id,
+					 ssize_t expected_size,
+					 ssize_t expected_elem_size,
+					 bool *replaced)
+{
+	struct drm_property_blob *new_blob = NULL;
+
+	if (blob_id != 0) {
+		new_blob = drm_property_lookup_blob(dev, blob_id);
+		if (new_blob == NULL)
+			return -EINVAL;
+
+		if (expected_size > 0 &&
+		    new_blob->length != expected_size) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+		if (expected_elem_size > 0 &&
+		    new_blob->length % expected_elem_size != 0) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+	}
+
+	*replaced |= drm_property_replace_blob(blob, new_blob);
+	drm_property_blob_put(new_blob);
+
+	return 0;
+}
+
+int dm_drm_plane_set_property(struct drm_plane *plane,
+			      struct drm_plane_state *state,
+			      struct drm_property *property,
+			      uint64_t val)
+{
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+	int ret = 0;
+	bool replaced;
+
+	if (property == adev->dm.degamma_lut_property) {
+		ret = atomic_replace_property_blob_from_id(adev_to_drm(adev),
+				&dm_plane_state->degamma_lut,
+				val, -1, sizeof(struct drm_color_lut),
+				&replaced);
+	} else if (property == adev->dm.ctm_property) {
+		ret = atomic_replace_property_blob_from_id(adev_to_drm(adev),
+				&dm_plane_state->ctm,
+				val,
+				sizeof(struct drm_color_ctm), -1,
+				&replaced);
+	} else if (property == adev->dm.sdr_boost_property) {
+		dm_plane_state->sdr_boost = val;
+	} else {
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int dm_drm_plane_get_property(struct drm_plane *plane,
+			      const struct drm_plane_state *state,
+			      struct drm_property *property,
+			      uint64_t *val)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+
+	if (property == adev->dm.degamma_lut_property) {
+		*val = (dm_plane_state->degamma_lut) ?
+			dm_plane_state->degamma_lut->base.id : 0;
+	} else if (property == adev->dm.ctm_property) {
+		*val = (dm_plane_state->ctm) ? dm_plane_state->ctm->base.id : 0;
+	} else if (property == adev->dm.sdr_boost_property) {
+		*val = dm_plane_state->sdr_boost;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct drm_plane_funcs dm_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_primary_helper_destroy,
+	.reset = dm_drm_plane_reset,
+	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
+	.atomic_destroy_state = dm_drm_plane_destroy_state,
+	.format_mod_supported = dm_plane_format_mod_supported,
+#ifdef CONFIG_DRM_AMD_DC_HDR
+	.atomic_set_property = dm_drm_plane_set_property,
+	.atomic_get_property = dm_drm_plane_get_property,
+#endif
+};
+
+int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
+				struct drm_plane *plane,
+				unsigned long possible_crtcs,
+				const struct dc_plane_cap *plane_cap)
+{
+	uint32_t formats[32];
+	int num_formats;
+	int res = -EPERM;
+	unsigned int supported_rotations;
+	uint64_t *modifiers = NULL;
+
+	num_formats = get_plane_formats(plane, plane_cap, formats,
+					ARRAY_SIZE(formats));
+
+	res = get_plane_modifiers(dm->adev, plane->type, &modifiers);
+	if (res)
+		return res;
+
+	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
+				       &dm_plane_funcs, formats, num_formats,
+				       modifiers, plane->type, NULL);
+	kfree(modifiers);
+	if (res)
+		return res;
+
+	if (plane->type == DRM_PLANE_TYPE_OVERLAY &&
+	    plane_cap && plane_cap->per_pixel_alpha) {
+		unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					  BIT(DRM_MODE_BLEND_PREMULTI) |
+					  BIT(DRM_MODE_BLEND_COVERAGE);
+
+		drm_plane_create_alpha_property(plane);
+		drm_plane_create_blend_mode_property(plane, blend_caps);
+	}
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY &&
+	    plane_cap &&
+	    (plane_cap->pixel_format_support.nv12 ||
+	     plane_cap->pixel_format_support.p010)) {
+		/* This only affects YUV formats. */
+		drm_plane_create_color_properties(
+			plane,
+			BIT(DRM_COLOR_YCBCR_BT601) |
+			BIT(DRM_COLOR_YCBCR_BT709) |
+			BIT(DRM_COLOR_YCBCR_BT2020),
+			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
+	}
+
+	supported_rotations =
+		DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
+		DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
+
+	if (dm->adev->asic_type >= CHIP_BONAIRE &&
+	    plane->type != DRM_PLANE_TYPE_CURSOR)
+		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
+						   supported_rotations);
+
+	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
+
+#ifdef CONFIG_DRM_AMD_DC_HDR
+	attach_color_mgmt_properties(dm, plane);
+#endif
+	/* Create (reset) the plane state */
+	if (plane->funcs->reset)
+		plane->funcs->reset(plane);
+
+	return 0;
+}
+
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
new file mode 100644
index 000000000000..95168c2cfa6f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
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
+#ifndef __AMDGPU_DM_PLANE_H__
+#define __AMDGPU_DM_PLANE_H__
+
+#include "dc.h"
+
+void handle_cursor_update(struct drm_plane *plane,
+			  struct drm_plane_state *old_plane_state);
+
+int fill_dc_scaling_info(struct amdgpu_device *adev,
+			 const struct drm_plane_state *state,
+			 struct dc_scaling_info *scaling_info);
+
+void get_min_max_dc_plane_scaling(struct drm_device *dev,
+				  struct drm_framebuffer *fb,
+				  int *min_downscale, int *max_upscale);
+
+int dm_plane_helper_check_state(struct drm_plane_state *state,
+				struct drm_crtc_state *new_crtc_state);
+
+bool modifier_has_dcc(uint64_t modifier);
+
+unsigned int modifier_gfx9_swizzle_mode(uint64_t modifier);
+
+int fill_plane_buffer_attributes(struct amdgpu_device *adev,
+				 const struct amdgpu_framebuffer *afb,
+				 const enum surface_pixel_format format,
+				 const enum dc_rotation_angle rotation,
+				 const uint64_t tiling_flags,
+				 union dc_tiling_info *tiling_info,
+				 struct plane_size *plane_size,
+				 struct dc_plane_dcc_param *dcc,
+				 struct dc_plane_address *address,
+				 bool tmz_surface,
+				 bool force_disable_dcc);
+
+int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
+			 struct drm_plane *plane,
+			 unsigned long possible_crtcs,
+			 const struct dc_plane_cap *plane_cap);
+
+const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
+
+void fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
+				    bool *per_pixel_alpha, bool *pre_multiplied_alpha,
+				    bool *global_alpha, int *global_alpha_value);
+
+#endif
-- 
2.37.0

