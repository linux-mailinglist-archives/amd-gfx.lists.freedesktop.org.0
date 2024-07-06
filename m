Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E83929086
	for <lists+amd-gfx@lfdr.de>; Sat,  6 Jul 2024 05:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28A810E2E1;
	Sat,  6 Jul 2024 03:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QfoorOqB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFD010E2D8;
 Sat,  6 Jul 2024 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tysga2l4SoVqTI/x4eC8FUnF0xgSj/zpx15NbbPn3zQ=; b=QfoorOqBzVQs3jDbXG6YR7Xqra
 D9F4MsCH6j+gpDj/YqFJXGilXOYYVGYt+AinKZmSoDGo2KOO6yRHWRrAoytjCAHqcZU3Xv+k8RxvE
 aZsjheCXZWLgdiy6TgsMPWJ5h3A394TTu1JilhR4lwDS/Met7MF/V5CaFsot05koitn8lWqn2m+Qy
 n9+DFCw1rvcGhj5p74gfaW+8J5Kr9p3Q+MamMT3TNYdEYnQYLi1vUM4rwEUqCw0ehxSTNG0FKtESz
 xVytMs8wlP/2NnoDMB1BaaZU/mjjqP70ithtA15Tx6nuwM79v04MpJFizzLrBFOKSswT4/vq9wCUd
 bjZf/6Qg==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwHv-00Bj27-4G; Sat, 06 Jul 2024 05:40:39 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 05/11] drm/amd/display: remove redundant freesync parser
 for DP
Date: Sat,  6 Jul 2024 00:35:06 -0300
Message-ID: <20240706034004.801329-6-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706034004.801329-1-mwen@igalia.com>
References: <20240706034004.801329-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When updating connector under drm_edid infrastructure, many calculations
and validations are already done and become redundant inside AMD driver.
Remove those driver-specific code in favor of the DRM common code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 88 +------------------
 1 file changed, 4 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3f6823fe60b..34e380b4408e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11709,24 +11709,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	return ret;
 }
 
-static bool is_dp_capable_without_timing_msa(struct dc *dc,
-					     struct amdgpu_dm_connector *amdgpu_dm_connector)
-{
-	u8 dpcd_data;
-	bool capable = false;
-
-	if (amdgpu_dm_connector->dc_link &&
-		dm_helpers_dp_read_dpcd(
-				NULL,
-				amdgpu_dm_connector->dc_link,
-				DP_DOWN_STREAM_PORT_COUNT,
-				&dpcd_data,
-				sizeof(dpcd_data))) {
-		capable = (dpcd_data & DP_MSA_TIMING_PAR_IGNORED) ? true:false;
-	}
-
-	return capable;
-}
 
 static bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
 		unsigned int offset,
@@ -11983,9 +11965,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	const struct detailed_timing *timing;
-	const struct detailed_non_pixel *data;
-	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
@@ -12012,8 +11991,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
-		connector->display_info.monitor_range.min_vfreq = 0;
-		connector->display_info.monitor_range.max_vfreq = 0;
 		freesync_capable = false;
 
 		goto update;
@@ -12033,67 +12010,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		bool edid_check_required = false;
+		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
+		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+			freesync_capable = true;
 
-		if (is_dp_capable_without_timing_msa(adev->dm.dc,
-						     amdgpu_dm_connector)) {
-			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
-				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-				if (amdgpu_dm_connector->max_vfreq -
-				    amdgpu_dm_connector->min_vfreq > 10)
-					freesync_capable = true;
-			} else {
-				edid_check_required = edid->version > 1 ||
-						      (edid->version == 1 &&
-						       edid->revision > 1);
-			}
-		}
-
-		if (edid_check_required) {
-			for (i = 0; i < 4; i++) {
-
-				timing	= &edid->detailed_timings[i];
-				data	= &timing->data.other_data;
-				range	= &data->data.range;
-				/*
-				 * Check if monitor has continuous frequency mode
-				 */
-				if (data->type != EDID_DETAIL_MONITOR_RANGE)
-					continue;
-				/*
-				 * Check for flag range limits only. If flag == 1 then
-				 * no additional timing information provided.
-				 * Default GTF, GTF Secondary curve and CVT are not
-				 * supported
-				 */
-				if (range->flags != 1)
-					continue;
-
-				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
-				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
-
-				if (edid->revision >= 4) {
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
-						connector->display_info.monitor_range.min_vfreq += 255;
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
-						connector->display_info.monitor_range.max_vfreq += 255;
-				}
-
-				amdgpu_dm_connector->min_vfreq =
-					connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq =
-					connector->display_info.monitor_range.max_vfreq;
-
-				break;
-			}
-
-			if (amdgpu_dm_connector->max_vfreq -
-			    amdgpu_dm_connector->min_vfreq > 10) {
-
-				freesync_capable = true;
-			}
-		}
 		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 
 		if (vsdb_info.replay_mode) {
@@ -12101,7 +12022,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
-
 	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
-- 
2.43.0

