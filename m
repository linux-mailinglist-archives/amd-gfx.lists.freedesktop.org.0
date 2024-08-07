Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1394B15E
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2024 22:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052910E5D0;
	Wed,  7 Aug 2024 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="he0/hoLp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72210E5CC;
 Wed,  7 Aug 2024 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EQ+V45Om0Kj8lmhmw9h57nW6hoe0DfcT6We6eJmN7cI=; b=he0/hoLpvUW4FIdPgW+ngdwMRe
 +UVw5W37m570j2a87Rk63obzVd3rAv709aEDNSObQ2Xd521asNEpYRr/SlJePtPdBbdZlCYgmsRtw
 azNo54pwnBLPRKda76rguEfHBoj7BioX94vQ5Ok+DkpAqTClWwzOECtDPj88i7ap0T/0pI/HNiin0
 3kM39pa6bL40VEbmpqtjmmwcOsMuMsXvUyIyFfG9ixoP/DUUyfLUibvxRLr7JHUhvabb/1Noe0ep8
 f62QYB6rgjFxzg3O+UrR9gk+NCUuWGNGUXzZvtuYQHsLWnw8pvGuGihT4kAaK7VqkFoYVwWIZXBL1
 O8exmRFw==;
Received: from [189.6.17.125] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbnLf-0098Re-Ef; Wed, 07 Aug 2024 22:33:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/9] drm/amd/display: switch amdgpu_dm_connector to use
 struct drm_edid
Date: Wed,  7 Aug 2024 19:25:03 -0100
Message-ID: <20240807203207.2830-2-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807203207.2830-1-mwen@igalia.com>
References: <20240807203207.2830-1-mwen@igalia.com>
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

Replace raw edid handling (struct edid) with the opaque EDID type
(struct drm_edid) on amdgpu_dm_connector for consistency. It may also
prevent mismatch of approaches in different parts of the driver code.
Working in progress. It was only exercised with IGT tests.

v2: use const to fix warnings (Alex Hung)
v3: fix general protection fault on mst
v4: rename edid to drm_edid in amdgpu_connector (Jani)
    call drm_edid_connector_update to clear edid in case of NULL (Jani)
    keep setting NULL instead of free drm_edid (Jani)
    check drm_edid not NULL, instead of valid (Jani)
v5: remove deprecated comments (Alex H)
    use edid from dc_sink instead of call drm_edid_raw for now (Alex H)
    remove unnecessary cast (Alex H)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 120 ++++++++----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  13 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  32 ++---
 4 files changed, 80 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ec6064d40dbf..fff1f0c524fc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3423,7 +3423,7 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->dc_sink = sink;
 			dc_sink_retain(aconnector->dc_sink);
 			amdgpu_dm_update_freesync_caps(connector,
-					aconnector->edid);
+					aconnector->drm_edid);
 		} else {
 			amdgpu_dm_update_freesync_caps(connector, NULL);
 			if (!aconnector->dc_sink) {
@@ -3482,18 +3482,18 @@ void amdgpu_dm_update_connector_after_detect(
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
 		if (sink->dc_edid.length == 0) {
-			aconnector->edid = NULL;
+			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(
 					&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			aconnector->edid =
-				(struct edid *)sink->dc_edid.raw_edid;
+			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
+			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-						    aconnector->edid);
+				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
 		}
 
 		if (!aconnector->timing_requested) {
@@ -3504,17 +3504,18 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_connector_update_edid_property(connector, aconnector->edid);
-		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
+		drm_edid_connector_update(connector, aconnector->drm_edid);
+		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_connector_update_edid_property(connector, NULL);
+		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		drm_edid_free(aconnector->drm_edid);
+		aconnector->drm_edid = NULL;
 		kfree(aconnector->timing_requested);
 		aconnector->timing_requested = NULL;
 		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
@@ -7013,32 +7014,24 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
-	struct edid *edid;
-	struct i2c_adapter *ddc;
+	const struct drm_edid *drm_edid;
 
-	if (dc_link && dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
-
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	aconnector->edid = edid;
-
+	aconnector->drm_edid = drm_edid;
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
+		// FIXME: Get rid of drm_edid_raw()
+		const struct edid *edid = drm_edid_raw(drm_edid);
+
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
+		memmove(dc_em_sink->dc_edid.raw_edid, edid,
+			(edid->extensions + 1) * EDID_LENGTH);
 		dm_helpers_parse_edid_caps(
 			dc_link,
 			&dc_em_sink->dc_edid,
@@ -7068,36 +7061,26 @@ static int get_modes(struct drm_connector *connector)
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink_init_data init_params = {
 			.link = aconnector->dc_link,
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
-	struct edid *edid;
-	struct i2c_adapter *ddc;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
-	if (dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
-
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	if (drm_detect_hdmi_monitor(edid))
+	if (connector->display_info.is_hdmi)
 		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
 
-	aconnector->edid = edid;
+	aconnector->drm_edid = drm_edid;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
 		(uint8_t *)edid,
@@ -7784,16 +7767,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
 }
 
 static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
-					      struct edid *edid)
+					      const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 
-	if (edid) {
+	if (drm_edid) {
 		/* empty probed_modes */
 		INIT_LIST_HEAD(&connector->probed_modes);
 		amdgpu_dm_connector->num_modes =
-				drm_add_edid_modes(connector, edid);
+				drm_edid_connector_add_modes(connector);
 
 		/* sorting the probed modes before calling function
 		 * amdgpu_dm_get_native_mode() since EDID can have
@@ -7807,10 +7790,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
 		amdgpu_dm_get_native_mode(connector);
 
 		/* Freesync capabilities are reset by calling
-		 * drm_add_edid_modes() and need to be
+		 * drm_edid_connector_add_modes() and need to be
 		 * restored here.
 		 */
-		amdgpu_dm_update_freesync_caps(connector, edid);
+		amdgpu_dm_update_freesync_caps(connector, drm_edid);
 	} else {
 		amdgpu_dm_connector->num_modes = 0;
 	}
@@ -7906,12 +7889,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 }
 
 static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
-						   struct edid *edid)
+						   const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 
-	if (!(amdgpu_freesync_vid_mode && edid))
+	if (!(amdgpu_freesync_vid_mode && drm_edid))
 		return;
 
 	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
@@ -7924,24 +7907,24 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct drm_encoder *encoder;
-	struct edid *edid = amdgpu_dm_connector->edid;
+	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
 	struct dc_link_settings *verified_link_cap =
 			&amdgpu_dm_connector->dc_link->verified_link_cap;
 	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 
-	if (!drm_edid_is_valid(edid)) {
+	if (!drm_edid) {
 		amdgpu_dm_connector->num_modes =
 				drm_add_modes_noedid(connector, 640, 480);
 		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
 			amdgpu_dm_connector->num_modes +=
 				drm_add_modes_noedid(connector, 1920, 1080);
 	} else {
-		amdgpu_dm_connector_ddc_get_modes(connector, edid);
+		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
 		if (encoder)
 			amdgpu_dm_connector_add_common_modes(encoder, connector);
-		amdgpu_dm_connector_add_freesync_modes(connector, edid);
+		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
 	}
 	amdgpu_dm_fbc_init(connector);
 
@@ -11830,7 +11813,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 }
 
 static void parse_edid_displayid_vrr(struct drm_connector *connector,
-		struct edid *edid)
+				     const struct edid *edid)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11873,7 +11856,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 }
 
 static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11908,7 +11891,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 }
 
 static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			       const struct edid *edid,
+			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11950,19 +11934,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * FreeSync parameters.
  */
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-				    struct edid *edid)
+				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	struct detailed_timing *timing;
-	struct detailed_non_pixel *data;
-	struct detailed_data_monitor_range *range;
+	const struct detailed_timing *timing;
+	const struct detailed_non_pixel *data;
+	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
-
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	const struct edid *edid;
 	bool freesync_capable = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
@@ -11975,7 +11959,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
-	if (!edid || !sink) {
+	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
 		amdgpu_dm_connector->min_vfreq = 0;
@@ -11992,6 +11976,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module)
 		goto update;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
 	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
 	     connector->display_info.monitor_range.max_vfreq == 0))
@@ -12068,7 +12054,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
 			timing  = &edid->detailed_timings[i];
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2d7755e2b6c3..c231d3058db8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -673,7 +673,7 @@ struct amdgpu_dm_connector {
 
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* shared with amdgpu */
 	struct amdgpu_hpd hpd;
@@ -951,7 +951,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 				    struct drm_connector *connector);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-					struct edid *edid);
+				    const struct drm_edid *drm_edid);
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 165e010fe69c..2e07ce2e89f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -897,7 +897,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -909,25 +910,27 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 */
 	do {
 
-		edid = drm_get_edid(&aconnector->base, ddc);
+		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
 			drm_dp_send_real_edid_checksum(&aconnector->dm_dp_aux.aux, connector->real_edid_checksum);
 
-		if (!edid && connector->edid_corrupt) {
+		if (!drm_edid && connector->edid_corrupt) {
 			connector->edid_corrupt = false;
 			return EDID_BAD_CHECKSUM;
 		}
 
-		if (!edid)
+		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
+		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
 		/* We don't need the original edid anymore */
-		kfree(edid);
+		drm_edid_free(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 915eb2c08ece..76e74f6acf1e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
 		dc_sink_release(aconnector->dc_sink);
 	}
 
-	kfree(aconnector->edid);
+	drm_edid_free(aconnector->drm_edid);
 
 	drm_connector_cleanup(connector);
 	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
@@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 	}
@@ -302,16 +302,16 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 	if (!aconnector)
 		return drm_add_edid_modes(connector, NULL);
 
-	if (!aconnector->edid) {
-		struct edid *edid;
+	if (!aconnector->drm_edid) {
+		const struct drm_edid *drm_edid;
 
-		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
+		drm_edid = drm_dp_mst_edid_read(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
 
-		if (!edid) {
+		if (!drm_edid) {
 			amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, false);
 
-			drm_connector_update_edid_property(
+			drm_edid_connector_update(
 				&aconnector->base,
 				NULL);
 
@@ -345,7 +345,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 			return ret;
 		}
 
-		aconnector->edid = edid;
+		aconnector->drm_edid = drm_edid;
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, true);
 	}
@@ -360,10 +360,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		struct dc_sink_init_data init_params = {
 				.link = aconnector->dc_link,
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
+		const struct edid *edid;
+
+		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			(uint8_t *)aconnector->edid,
-			(aconnector->edid->extensions + 1) * EDID_LENGTH,
+			(uint8_t *)edid,
+			(edid->extensions + 1) * EDID_LENGTH,
 			&init_params);
 
 		if (!dc_sink) {
@@ -405,7 +408,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 
 		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(
-					connector, aconnector->edid);
+					connector, aconnector->drm_edid);
 
 #if defined(CONFIG_DRM_AMD_DC_FP)
 			if (!validate_dsc_caps_on_connector(aconnector))
@@ -419,10 +422,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	drm_connector_update_edid_property(
-					&aconnector->base, aconnector->edid);
+	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
 
-	ret = drm_add_edid_modes(connector, aconnector->edid);
+	ret = drm_edid_connector_add_modes(connector);
 
 	return ret;
 }
@@ -500,7 +502,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
 
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 
-- 
2.43.0

