Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96E32FE77
	for <lists+amd-gfx@lfdr.de>; Sun,  7 Mar 2021 03:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1776E0C8;
	Sun,  7 Mar 2021 02:26:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ABF6E0C8
 for <amd-gfx@lists.freedesktop.org>; Sun,  7 Mar 2021 02:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyd3qhm7ji7s8kYZrQmNfGtvQZ037mEnBeyVIdFbZLdqme8k0JEckKtAyMXp9s3SIH59qz4/ZIet4XVvMQXi2JPhzxhoGHamiCcoy55tNRETOtsdvd7s4v/0e7yVVbshQBOK7Ze99P5pkiJxugjFnuyHS9d6qBp+6dcJNWnWLnBNYwECe8gppicH53hchipX9wP//JKu/JoLGhMyInS3A3Lr1icomtLL3T/XhT5ZfJcvczgJpvupx8dk6VB8OgrMR3SsS5VYI9m8kSbJnAv4mzrItOPrDr4emUnavW3WL6/8ztsziOZjjqjsyZyyCJVmDKiBNC9Ch3GjbqnYHMfZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34yCqdhcqyWYIvE5/9jnQqMHmi8Yy3hDBmjlLcJcBj4=;
 b=Hz9LaURytalY411CWTR2KguZi4SPorz2klhQgDUnoLXPnOlS3F7LhavkZmJFDvCBY4hlcthO1U5B7g5T6G/teivSbV3MQps2PDB9E6sIUVpc/dDBp/tzIBbjsq/Ar3isEC2XGtgrRt+vyQJ3U+gQWU7PShJH+VDZQRhuR0XaboN6PvudR2k60RmmJJ/v1HsvHRTarjYRrSM7CCdDgP9MKr6XGNK1/8bSopCkvizxesxO05BsQVpYsdMDzm7LS1NmhXbkBP8UjUt6wYpsl0PviKvJ433aqCNmHywqiXAJNXXGJ+ykgs5zs9b98/FoNP8mZI04gLE3+f947VtVSll5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34yCqdhcqyWYIvE5/9jnQqMHmi8Yy3hDBmjlLcJcBj4=;
 b=qqT3ugJyhTOn2SgyeBPz0fBV8IxAtnqerE2F3HYNtL6uYWLa8bujF33kUKdgivtGC9ha5PuLBNt7BrJ/BgbA60kIcEHIKDtVG7WDU6BP43C6d2RYBD8EoxdyotmMxfYoyluvF/IJ8ilnR0qHaOQ5uFNbsWFWCmvhzFFVnSN0yuY=
Received: from MW4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:303:8f::28)
 by DM5PR12MB1434.namprd12.prod.outlook.com (2603:10b6:3:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.22; Sun, 7 Mar
 2021 02:26:38 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::b0) by MW4PR03CA0023.outlook.office365.com
 (2603:10b6:303:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Sun, 7 Mar 2021 02:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB02.amd.com;
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.17 via Frontend Transport; Sun, 7 Mar 2021 02:26:37 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sat, 6 Mar 2021
 20:26:36 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.2106.2 via
 Frontend Transport; Sat, 6 Mar 2021 20:26:35 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert freesync video patches temporarily
Date: Sat, 6 Mar 2021 21:26:28 -0500
Message-ID: <20210307022635.200468-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01963871-e180-45eb-c8c6-08d8e1106f48
X-MS-TrafficTypeDiagnostic: DM5PR12MB1434:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14345E6A4B7A0D7A57C0EF4C8B949@DM5PR12MB1434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iI7iMTj1sPJq0+SVR9BuBqQDMD/lQIreof5aNrAzHu1vF/JtCP9TTofiSmfVdKJAXSru1D0rpAAF3aNAHAlvN49FmAK9fZDAHXNMa8qH3iwTvL3kgL90iRyhCjDDIlawDNb27C4QUl4cC0x4rYgrl7N9R0ovuyWj8NfYXH+oElYNKHP/TKzQXsXoJGjWcxBvdnAG9K+iiDmF6dE+P2iFWUH4wp4R5BqxVUgvFreqnUGCx7vQFw9UjE+pZL9JZ/h5lYYCpDB+PIVnMOdwUT9Vzq5RFSVAF+PLicTBraKSB+RaGuPErKb8PXuwx8l+fCgufHuvoZz1uvIpNn7vSqeFVaj7Us3g6/TRofGZhdUiMewrqcMjO0H7g2c7hfG9XoT4moPmbZ6dDda1eoSqxiz0BnvnUCAKjLNw6avg2p8y6Nbwlx4jRjS5s1RPf3yiRSsvin5zNA2XEJolSMUTZcgjX/kotQ8peSQtSlUqGo3v1wnfF3kutCsTVRpTC9K8sgsywhGnLtLs4QO+x4DDHZWM3eK/oEsx0AbHmRxkII3eMpLuEynaecKxkXm8wo/rXK+Rmlcj37anvXLbMDTHOoRra8g9gML9zFpWT8+YDM2wtSPnk4SYgpiXqhHGaVMaEbGiRHI2ZQFERXW654x6+eN496NLnIqjJAUMQqN08+CC0z3BsBDzo/wCKtNMQx3lwYOx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(426003)(1076003)(70586007)(26005)(70206006)(44832011)(83380400001)(47076005)(30864003)(186003)(2616005)(316002)(336012)(478600001)(2906002)(54906003)(5660300002)(7696005)(82310400003)(356005)(8676002)(6666004)(6916009)(82740400003)(36756003)(36860700001)(4326008)(8936002)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2021 02:26:37.4133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01963871-e180-45eb-c8c6-08d8e1106f48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1434
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
Cc: anson.jacob@amd.com, aurabindo.pillai@amd.com, nikola.cornij@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This temporarily reverts freesync video patches since it causes regression with
eDP displays. This patch is a squashed revert of the following patches:

a372f4abecb1 drm/amd/display: Skip modeset for front porch change
952bc47fb2ca drm/amd/display: Add freesync video modes based on preferred modes
d03ee581eee6 drm/amd/display: Add module parameter for freesync video mode

Signed-off-by: Aurabindo Pillai <aurabindo.pillai at amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 369 ++----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 -
 4 files changed, 35 insertions(+), 349 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 67279a40ab2c..a6b9b6aa5cd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -185,7 +185,6 @@ extern int amdgpu_emu_mode;
 extern uint amdgpu_smu_memory_pool_size;
 extern int amdgpu_smu_pptable_id;
 extern uint amdgpu_dc_feature_mask;
-extern uint amdgpu_freesync_vid_mode;
 extern uint amdgpu_dc_debug_mask;
 extern uint amdgpu_dm_abm_level;
 extern int amdgpu_backlight;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 865f924772b0..1eca88c23acb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -165,7 +165,6 @@ int amdgpu_mes;
 int amdgpu_noretry = -1;
 int amdgpu_force_asic_type = -1;
 int amdgpu_tmz = -1; /* auto */
-uint amdgpu_freesync_vid_mode;
 int amdgpu_reset_method = -1; /* auto */
 int amdgpu_num_kcq = -1;
 
@@ -823,17 +822,6 @@ module_param_named(backlight, amdgpu_backlight, bint, 0444);
 MODULE_PARM_DESC(tmz, "Enable TMZ feature (-1 = auto (default), 0 = off, 1 = on)");
 module_param_named(tmz, amdgpu_tmz, int, 0444);
 
-/**
- * DOC: freesync_video (uint)
- * Enabled the optimization to adjust front porch timing to achieve seamless mode change experience
- * when setting a freesync supported mode for which full modeset is not needed.
- * The default value: 0 (off).
- */
-MODULE_PARM_DESC(
-	freesync_video,
-	"Enable freesync modesetting optimization feature (0 = off (default), 1 = on)");
-module_param_named(freesync_video, amdgpu_freesync_vid_mode, uint, 0444);
-
 /**
  * DOC: reset_method (int)
  * GPU reset method (-1 = auto (default), 0 = legacy, 1 = mode0, 2 = mode1, 3 = mode2, 4 = baco, 5 = pci)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d559d01b9c27..0085a5e5f342 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -213,9 +213,6 @@ static bool amdgpu_dm_psr_disable_all(struct amdgpu_display_manager *dm);
 static const struct drm_format_info *
 amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
 
-static bool
-is_timing_unchanged_for_freesync(struct drm_crtc_state *old_crtc_state,
-				 struct drm_crtc_state *new_crtc_state);
 /*
  * dm_vblank_get_counter
  *
@@ -339,17 +336,6 @@ static inline bool amdgpu_dm_vrr_active(struct dm_crtc_state *dm_state)
 	       dm_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
 }
 
-static inline bool is_dc_timing_adjust_needed(struct dm_crtc_state *old_state,
-					      struct dm_crtc_state *new_state)
-{
-	if (new_state->freesync_config.state ==  VRR_STATE_ACTIVE_FIXED)
-		return true;
-	else if (amdgpu_dm_vrr_active(old_state) != amdgpu_dm_vrr_active(new_state))
-		return true;
-	else
-		return false;
-}
-
 /**
  * dm_pflip_high_irq() - Handle pageflip interrupt
  * @interrupt_params: ignored
@@ -5158,16 +5144,19 @@ static void fill_stream_properties_from_drm_display_mode(
 		timing_out->hdmi_vic = hv_frame.vic;
 	}
 
-	timing_out->h_addressable = mode_in->hdisplay;
-	timing_out->h_total = mode_in->htotal;
-	timing_out->h_sync_width = mode_in->hsync_end - mode_in->hsync_start;
-	timing_out->h_front_porch = mode_in->hsync_start - mode_in->hdisplay;
-	timing_out->v_total = mode_in->vtotal;
-	timing_out->v_addressable = mode_in->vdisplay;
-	timing_out->v_front_porch = mode_in->vsync_start - mode_in->vdisplay;
-	timing_out->v_sync_width = mode_in->vsync_end - mode_in->vsync_start;
-	timing_out->pix_clk_100hz = mode_in->clock * 10;
-
+	timing_out->h_addressable = mode_in->crtc_hdisplay;
+	timing_out->h_total = mode_in->crtc_htotal;
+	timing_out->h_sync_width =
+		mode_in->crtc_hsync_end - mode_in->crtc_hsync_start;
+	timing_out->h_front_porch =
+		mode_in->crtc_hsync_start - mode_in->crtc_hdisplay;
+	timing_out->v_total = mode_in->crtc_vtotal;
+	timing_out->v_addressable = mode_in->crtc_vdisplay;
+	timing_out->v_front_porch =
+		mode_in->crtc_vsync_start - mode_in->crtc_vdisplay;
+	timing_out->v_sync_width =
+		mode_in->crtc_vsync_end - mode_in->crtc_vsync_start;
+	timing_out->pix_clk_100hz = mode_in->crtc_clock * 10;
 	timing_out->aspect_ratio = get_aspect_ratio(mode_in);
 
 	stream->output_color_space = get_output_color_space(timing_out);
@@ -5334,86 +5323,6 @@ static void dm_enable_per_frame_crtc_master_sync(struct dc_state *context)
 	set_master_stream(context->streams, context->stream_count);
 }
 
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
-	aconnector->freesync_vid_base = *m_pref;
-	return m_pref;
-}
-
-static bool is_freesync_video_mode(struct drm_display_mode *mode,
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
-
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
-}
-
 static struct dc_stream_state *
 create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 		       const struct drm_display_mode *drm_mode,
@@ -5427,10 +5336,8 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 		dm_state ? &dm_state->base : NULL;
 	struct dc_stream_state *stream = NULL;
 	struct drm_display_mode mode = *drm_mode;
-	struct drm_display_mode saved_mode;
-	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
-	bool recalculate_timing = dm_state ? (dm_state->scaling != RMX_OFF) : false;
+	bool scale = dm_state ? (dm_state->scaling != RMX_OFF) : false;
 	int mode_refresh;
 	int preferred_refresh = 0;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
@@ -5438,9 +5345,6 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	uint32_t link_bandwidth_kbps;
 #endif
 	struct dc_sink *sink = NULL;
-
-	memset(&saved_mode, 0, sizeof(saved_mode));
-
 	if (aconnector == NULL) {
 		DRM_ERROR("aconnector is NULL!\n");
 		return stream;
@@ -5493,38 +5397,25 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 		 */
 		DRM_DEBUG_DRIVER("No preferred mode found\n");
 	} else {
-		recalculate_timing |= amdgpu_freesync_vid_mode &&
-				 is_freesync_video_mode(&mode, aconnector);
-		if (recalculate_timing) {
-			freesync_mode = get_highest_refresh_rate_mode(aconnector, false);
-			saved_mode = mode;
-			mode = *freesync_mode;
-		} else {
-			decide_crtc_timing_for_drm_display_mode(
+		decide_crtc_timing_for_drm_display_mode(
 				&mode, preferred_mode,
 				dm_state ? (dm_state->scaling != RMX_OFF) : false);
-		}
-
 		preferred_refresh = drm_mode_vrefresh(preferred_mode);
 	}
 
-	if (recalculate_timing)
-		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else
+	if (!dm_state)
 		drm_mode_set_crtcinfo(&mode, 0);
 
-       /*
+	/*
 	* If scaling is enabled and refresh rate didn't change
 	* we copy the vic and polarities of the old timings
 	*/
-	if (!recalculate_timing || mode_refresh != preferred_refresh)
-		fill_stream_properties_from_drm_display_mode(
-			stream, &mode, &aconnector->base, con_state, NULL,
-			requested_bpc);
+	if (!scale || mode_refresh != preferred_refresh)
+		fill_stream_properties_from_drm_display_mode(stream,
+			&mode, &aconnector->base, con_state, NULL, requested_bpc);
 	else
-		fill_stream_properties_from_drm_display_mode(
-			stream, &mode, &aconnector->base, con_state, old_stream,
-			requested_bpc);
+		fill_stream_properties_from_drm_display_mode(stream,
+			&mode, &aconnector->base, con_state, old_stream, requested_bpc);
 
 	stream->timing.flags.DSC = 0;
 
@@ -7256,107 +7147,6 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
 	}
 }
 
-static bool is_duplicate_mode(struct amdgpu_dm_connector *aconnector,
-			      struct drm_display_mode *mode)
-{
-	struct drm_display_mode *m;
-
-	list_for_each_entry (m, &aconnector->base.probed_modes, head) {
-		if (drm_mode_equal(m, mode))
-			return true;
-	}
-
-	return false;
-}
-
-static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
-{
-	const struct drm_display_mode *m;
-	struct drm_display_mode *new_mode;
-	uint i;
-	uint32_t new_modes_count = 0;
-
-	/* Standard FPS values
-	 *
-	 * 23.976   - TV/NTSC
-	 * 24 	    - Cinema
-	 * 25 	    - TV/PAL
-	 * 29.97    - TV/NTSC
-	 * 30 	    - TV/NTSC
-	 * 48 	    - Cinema HFR
-	 * 50 	    - TV/PAL
-	 * 60 	    - Commonly used
-	 * 48,72,96 - Multiples of 24
-	 */
-	const uint32_t common_rates[] = { 23976, 24000, 25000, 29970, 30000,
-					 48000, 50000, 60000, 72000, 96000 };
-
-	/*
-	 * Find mode with highest refresh rate with the same resolution
-	 * as the preferred mode. Some monitors report a preferred mode
-	 * with lower resolution than the highest refresh rate supported.
-	 */
-
-	m = get_highest_refresh_rate_mode(aconnector, true);
-	if (!m)
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(common_rates); i++) {
-		uint64_t target_vtotal, target_vtotal_diff;
-		uint64_t num, den;
-
-		if (drm_mode_vrefresh(m) * 1000 < common_rates[i])
-			continue;
-
-		if (common_rates[i] < aconnector->min_vfreq * 1000 ||
-		    common_rates[i] > aconnector->max_vfreq * 1000)
-			continue;
-
-		num = (unsigned long long)m->clock * 1000 * 1000;
-		den = common_rates[i] * (unsigned long long)m->htotal;
-		target_vtotal = div_u64(num, den);
-		target_vtotal_diff = target_vtotal - m->vtotal;
-
-		/* Check for illegal modes */
-		if (m->vsync_start + target_vtotal_diff < m->vdisplay ||
-		    m->vsync_end + target_vtotal_diff < m->vsync_start ||
-		    m->vtotal + target_vtotal_diff < m->vsync_end)
-			continue;
-
-		new_mode = drm_mode_duplicate(aconnector->base.dev, m);
-		if (!new_mode)
-			goto out;
-
-		new_mode->vtotal += (u16)target_vtotal_diff;
-		new_mode->vsync_start += (u16)target_vtotal_diff;
-		new_mode->vsync_end += (u16)target_vtotal_diff;
-		new_mode->type &= ~DRM_MODE_TYPE_PREFERRED;
-		new_mode->type |= DRM_MODE_TYPE_DRIVER;
-
-		if (!is_duplicate_mode(aconnector, new_mode)) {
-			drm_mode_probed_add(&aconnector->base, new_mode);
-			new_modes_count += 1;
-		} else
-			drm_mode_destroy(aconnector->base.dev, new_mode);
-	}
- out:
-	return new_modes_count;
-}
-
-static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
-						   struct edid *edid)
-{
-	struct amdgpu_dm_connector *amdgpu_dm_connector =
-		to_amdgpu_dm_connector(connector);
-
-	if (!(amdgpu_freesync_vid_mode && edid))
-		return;
-	
-	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-		amdgpu_dm_connector->num_modes +=
-			add_fs_modes(amdgpu_dm_connector);
-}
-
 static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
@@ -7372,7 +7162,6 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	} else {
 		amdgpu_dm_connector_ddc_get_modes(connector, edid);
 		amdgpu_dm_connector_add_common_modes(encoder, connector);
-		amdgpu_dm_connector_add_freesync_modes(connector, edid);
 	}
 	amdgpu_dm_fbc_init(connector);
 
@@ -8049,22 +7838,9 @@ static void update_stream_irq_parameters(
 	if (new_crtc_state->vrr_supported &&
 	    config.min_refresh_in_uhz &&
 	    config.max_refresh_in_uhz) {
-		/*
-		 * if freesync compatible mode was set, config.state will be set
-		 * in atomic check
-		 */
-		if (config.state == VRR_STATE_ACTIVE_FIXED && config.fixed_refresh_in_uhz &&
-		    (!drm_atomic_crtc_needs_modeset(&new_crtc_state->base) ||
-		     new_crtc_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED)) {
-			vrr_params.max_refresh_in_uhz = config.max_refresh_in_uhz;
-			vrr_params.min_refresh_in_uhz = config.min_refresh_in_uhz;
-			vrr_params.fixed_refresh_in_uhz = config.fixed_refresh_in_uhz;
-			vrr_params.state = VRR_STATE_ACTIVE_FIXED;
-		} else {
-			config.state = new_crtc_state->base.vrr_enabled ?
-						     VRR_STATE_ACTIVE_VARIABLE :
-						     VRR_STATE_INACTIVE;
-		}
+		config.state = new_crtc_state->base.vrr_enabled ?
+			VRR_STATE_ACTIVE_VARIABLE :
+			VRR_STATE_INACTIVE;
 	} else {
 		config.state = VRR_STATE_UNSUPPORTED;
 	}
@@ -8385,7 +8161,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * re-adjust the min/max bounds now that DC doesn't handle this
 		 * as part of commit.
 		 */
-		if (is_dc_timing_adjust_needed(dm_old_crtc_state, acrtc_state)) {
+		if (amdgpu_dm_vrr_active(dm_old_crtc_state) !=
+		    amdgpu_dm_vrr_active(acrtc_state)) {
 			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
 			dc_stream_adjust_vmin_vmax(
 				dm->dc, acrtc_state->stream,
@@ -8670,7 +8447,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			/* i.e. reset mode */
 			if (dm_old_crtc_state->stream)
 				remove_stream(adev, acrtc, dm_old_crtc_state->stream);
-
 			mode_set_reset_required = true;
 		}
 	} /* for_each_crtc_in_state() */
@@ -9081,7 +8857,6 @@ static void get_freesync_config_for_crtc(
 			to_amdgpu_dm_connector(new_con_state->base.connector);
 	struct drm_display_mode *mode = &new_crtc_state->base.mode;
 	int vrefresh = drm_mode_vrefresh(mode);
-	bool fs_vid_mode = false;
 
 	new_crtc_state->vrr_supported = new_con_state->freesync_capable &&
 					vrefresh >= aconnector->min_vfreq &&
@@ -9089,24 +8864,17 @@ static void get_freesync_config_for_crtc(
 
 	if (new_crtc_state->vrr_supported) {
 		new_crtc_state->stream->ignore_msa_timing_param = true;
-		fs_vid_mode = new_crtc_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
-
-		config.min_refresh_in_uhz = aconnector->min_vfreq * 1000000;
-		config.max_refresh_in_uhz = aconnector->max_vfreq * 1000000;
+		config.state = new_crtc_state->base.vrr_enabled ?
+				VRR_STATE_ACTIVE_VARIABLE :
+				VRR_STATE_INACTIVE;
+		config.min_refresh_in_uhz =
+				aconnector->min_vfreq * 1000000;
+		config.max_refresh_in_uhz =
+				aconnector->max_vfreq * 1000000;
 		config.vsif_supported = true;
 		config.btr = true;
-
-		if (fs_vid_mode) {
-			config.state = VRR_STATE_ACTIVE_FIXED;
-			config.fixed_refresh_in_uhz = new_crtc_state->freesync_config.fixed_refresh_in_uhz;
-			goto out;
-		} else if (new_crtc_state->base.vrr_enabled) {
-			config.state = VRR_STATE_ACTIVE_VARIABLE;
-		} else {
-			config.state = VRR_STATE_INACTIVE;
-		}
 	}
-out:
+
 	new_crtc_state->freesync_config = config;
 }
 
@@ -9119,50 +8887,6 @@ static void reset_freesync_config_for_crtc(
 	       sizeof(new_crtc_state->vrr_infopacket));
 }
 
-static bool
-is_timing_unchanged_for_freesync(struct drm_crtc_state *old_crtc_state,
-				 struct drm_crtc_state *new_crtc_state)
-{
-	struct drm_display_mode old_mode, new_mode;
-
-	if (!old_crtc_state || !new_crtc_state)
-		return false;
-
-	old_mode = old_crtc_state->mode;
-	new_mode = new_crtc_state->mode;
-
-	if (old_mode.clock       == new_mode.clock &&
-	    old_mode.hdisplay    == new_mode.hdisplay &&
-	    old_mode.vdisplay    == new_mode.vdisplay &&
-	    old_mode.htotal      == new_mode.htotal &&
-	    old_mode.vtotal      != new_mode.vtotal &&
-	    old_mode.hsync_start == new_mode.hsync_start &&
-	    old_mode.vsync_start != new_mode.vsync_start &&
-	    old_mode.hsync_end   == new_mode.hsync_end &&
-	    old_mode.vsync_end   != new_mode.vsync_end &&
-	    old_mode.hskew       == new_mode.hskew &&
-	    old_mode.vscan       == new_mode.vscan &&
-	    (old_mode.vsync_end - old_mode.vsync_start) ==
-	    (new_mode.vsync_end - new_mode.vsync_start))
-		return true;
-
-	return false;
-}
-
-static void set_freesync_fixed_config(struct dm_crtc_state *dm_new_crtc_state) {
-	uint64_t num, den, res;
-	struct drm_crtc_state *new_crtc_state = &dm_new_crtc_state->base;
-
-	dm_new_crtc_state->freesync_config.state = VRR_STATE_ACTIVE_FIXED;
-
-	num = (unsigned long long)new_crtc_state->mode.clock * 1000 * 1000000;
-	den = (unsigned long long)new_crtc_state->mode.htotal *
-	      (unsigned long long)new_crtc_state->mode.vtotal;
-
-	res = div_u64(num, den);
-	dm_new_crtc_state->freesync_config.fixed_refresh_in_uhz = res;
-}
-
 static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 				struct drm_atomic_state *state,
 				struct drm_crtc *crtc,
@@ -9253,11 +8977,6 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		 * TODO: Refactor this function to allow this check to work
 		 * in all conditions.
 		 */
-		if (amdgpu_freesync_vid_mode &&
-		    dm_new_crtc_state->stream &&
-		    is_timing_unchanged_for_freesync(new_crtc_state, old_crtc_state))
-			goto skip_modeset;
-
 		if (dm_new_crtc_state->stream &&
 		    dc_is_stream_unchanged(new_stream, dm_old_crtc_state->stream) &&
 		    dc_is_stream_scaling_unchanged(new_stream, dm_old_crtc_state->stream)) {
@@ -9289,24 +9008,6 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		if (!dm_old_crtc_state->stream)
 			goto skip_modeset;
 
-		if (amdgpu_freesync_vid_mode && dm_new_crtc_state->stream &&
-		    is_timing_unchanged_for_freesync(new_crtc_state,
-						     old_crtc_state)) {
-			new_crtc_state->mode_changed = false;
-			DRM_DEBUG_DRIVER(
-				"Mode change not required for front porch change, "
-				"setting mode_changed to %d",
-				new_crtc_state->mode_changed);
-
-			set_freesync_fixed_config(dm_new_crtc_state);
-
-			goto skip_modeset;
-		} else if (amdgpu_freesync_vid_mode && aconnector &&
-			   is_freesync_video_mode(&new_crtc_state->mode,
-						  aconnector)) {
-			set_freesync_fixed_config(dm_new_crtc_state);
-		}
-
 		ret = dm_atomic_get_state(state, &dm_state);
 		if (ret)
 			goto fail;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index dba2b5da25c1..c14604710ee7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -440,8 +440,6 @@ struct amdgpu_dm_connector {
 #endif
 	bool force_yuv420_output;
 	struct dsc_preferred_settings dsc_settings;
-	/* Cached display modes */
-	struct drm_display_mode freesync_vid_base;
 };
 
 #define to_amdgpu_dm_connector(x) container_of(x, struct amdgpu_dm_connector, base)
-- 
2.30.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
