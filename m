Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEbfEDshd2ntcQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 09:09:31 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D060D85525
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 09:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF7B10E3C3;
	Mon, 26 Jan 2026 08:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1QjkTuV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B9A10E207
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:25 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b8859d3e1c3so43983766b.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366364; x=1769971164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7MhJNXHQ/ZzkYdK/mC1IYoZJ62H8eejAR4KssW2i5ac=;
 b=b1QjkTuVq8anktK1L6e+VC+lUCF9ZZgqtqSztN9nj7VccC73G0oHOYqGCyPuAP9lEa
 HilZFhtrGSmYmkEZU0TyqPAPGxWnbwla9NJCrjgyF/XTuojGgrlHid9szGGy+IfVGuGG
 ARs4DFrFe8YlW+s2Xav/hJojFtcddNhCil/XWNXVEYEN2Nsc98vIC2R788yx9ewWfSOB
 JGAU6UvCEGinNs20lBJYV5mAUWJzsHKSKMbnKDPuB3kCVJCdQVMJdjGfom1wvS72OAoW
 awhvQj7u3ZnUJ7WQXy+BAcltRVWHgED6tthya2qPehtBRJG3T1P4R6EWcqqHZYJEYGHy
 el1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366364; x=1769971164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7MhJNXHQ/ZzkYdK/mC1IYoZJ62H8eejAR4KssW2i5ac=;
 b=R7SxK0y3M0X6GEsxKnE4JMU9uwPoZFF9SkQ2Cnw0U5GT3o2HDUSyaZODXa7OSbw1a3
 PhEEM2QwJtESYVmmoLrPd5dm8jlj2+lmdgmNKPnZJIqV7ufIcU1zUP4uG9bwDn3mWcye
 isfWDtacU7zmU0bAAVeg5HejF89561m1Metgbk4jv+2HHRwF+mzM1oVBB/C37Qc54rGq
 xDf9P4pat1I61Z7oFjiiXjY5nhOjk+dml54qB9xTc/2mst4+5ifLpfkg5MRQhdrVlqMC
 HHJdFL7Yx/oHIsUa96jJTiKlenxtJUVl+jhXuo3LTtm3W5Dg6cKEFjRPAZqSjA7CXcMj
 nRVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPaB4jOKjStUzt/meFM/8djbRtvBt5YTnuI1Ne1HbwQ/Kwq5CLRb0xVWwTFgPPCE2gjtK3SEZ/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXCN1mWUXR55iCxOnEjMa4pVt9ggUl2KPN5prWec2C59gBeocL
 nuat3Yi7GuAk8GucoT5H8hyG1exDQgHh90g6uZX6chYDPHEKUNmLVuIz
X-Gm-Gg: AZuq6aKYc+bHWmTLPzjjs6EDnsXqgXbLeXKuJUDi/h+Fd+jhsmmzzVNaD4td+hrduWB
 m/kuvCteoGbbAHUZtXCyou07dnncD+ltdB7d8KYdwpzVHQDiMyrQBWuyw9xXwM2HZTBP9NqlQnN
 5IY3We+2LsMczUwSmVpMRp4NuIQuNEv1XFnZ+r0wSIFFPuBEH9gQQOTXlALaSm0TziSzjvKXw04
 A6KhsTRRQOmQwQ2E0H9bMARMRGrAwH9kmYvGr8orNWTKT4z5QU+NMCXtLnSYvwvJ51XqFf3X1h5
 EseDQNjMR67HWeJB/8rOEC1yylIMrfXXc6bYnqrJJpS+9+8Tk5tPsrZAuYdsBrL54iE2rpFhx0b
 6Hjh08owu1Fig+emseEyhmJ+Cr7vjeU9o92WhXOuL8tcrg6cZHcO+TSywXmVD5U7tUEZ61sOr1w
 w3zcZvbBpJwbz123n22XqcqJvZPGNSWBX4BP/wMrmsctGs8GpAT3YVHJ4mTKcl9nFx
X-Received: by 2002:a17:907:c28:b0:b87:106c:88eb with SMTP id
 a640c23a62f3a-b8d20d64cdcmr80420966b.0.1769366363818; 
 Sun, 25 Jan 2026 10:39:23 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:23 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 05/19] drm/amd/display: Refactor PCON VRR compatibility
 check
Date: Sun, 25 Jan 2026 19:39:00 +0100
Message-ID: <20260125183914.459228-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jan 2026 08:09:08 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D060D85525
X-Rspamd-Action: no action

[Why]
DP->HDMI PCONs prevously entered the DP path

[How]
Restructure amdgpu_dm_update_freesync_caps() and move
dm_get_adaptive_sync_support_type() to dm_helpers_is_vrr_pcon_allowed()
to better reflect what this function does. It never actually gave us any
other info.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
 3 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 68a59275dead..33b76c1850b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13259,7 +13259,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	bool freesync_capable = false;
 	bool valid_vsdb_cea = false;
 	bool vsdb_freesync = false;
-	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
+	bool pcon_allowed = false;
+	bool is_pcon = false;
 
 	if (!connector->state) {
 		drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
@@ -13287,18 +13288,24 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
 		goto update;
 
+	/* Gather all data */
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	valid_vsdb_cea = parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info) >= 0;
 	vsdb_freesync = valid_vsdb_cea && vsdb_info.freesync_supported;
-	if (amdgpu_dm_connector->dc_link)
+
+	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
+		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
+		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
+	}
 
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
 	if (is_monitor_range_invalid(connector))
 		parse_edid_displayid_vrr(connector, edid);
 
-	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+	/* DP & eDP excluding PCONs */
+	if ((sink->sink_signal == SIGNAL_TYPE_EDP ||
+	     sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT) && !is_pcon) {
 		/*
 		 * Many monitors expose AMD vsdb in CAE even for DP and their
 		 * monitor ranges do not contain Range Limits Only flag
@@ -13323,17 +13330,15 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
+	/* HDMI */
 	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_freesync) {
 		monitor_range_from_vsdb(connector, &vsdb_info);
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
-	}
 
-	if (amdgpu_dm_connector->dc_link)
-		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
-
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_freesync) {
+	/* DP -> HDMI PCON */
+	} else if (pcon_allowed && vsdb_freesync) {
+		amdgpu_dm_connector->as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
 		amdgpu_dm_connector->pack_sdp_v1_3 = true;
-		amdgpu_dm_connector->as_type = as_type;
 		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
 		monitor_range_from_vsdb(connector, &vsdb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 1f41d6540b83..45a91df619d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1381,40 +1381,25 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
 	// TODO
 }
 
-static bool dm_is_freesync_pcon_whitelist(const uint32_t branch_dev_id)
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
 {
-	bool ret_val = false;
+	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
+		return false;
 
-	switch (branch_dev_id) {
+	if (!link->dpcd_caps.allow_invalid_MSA_timing_param)
+		return false;
+
+	if (!link->dpcd_caps.adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT)
+		return false;
+
+	switch (link->dpcd_caps.branch_dev_id) {
 	case DP_BRANCH_DEVICE_ID_0060AD:
 	case DP_BRANCH_DEVICE_ID_00E04C:
 	case DP_BRANCH_DEVICE_ID_90CC24:
-		ret_val = true;
-		break;
-	default:
-		break;
+		return true;
 	}
 
-	return ret_val;
-}
-
-enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
-{
-	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
-	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
-
-	switch (dpcd_caps->dongle_type) {
-	case DISPLAY_DONGLE_DP_HDMI_CONVERTER:
-		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
-			dpcd_caps->allow_invalid_MSA_timing_param == true &&
-			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
-			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
-		break;
-	default:
-		break;
-	}
-
-	return as_type;
+	return false;
 }
 
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream)
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 7014b8c2c956..e51f1e489129 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -220,10 +220,10 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
 		const struct dc_link *link,
 		struct set_config_cmd_payload *payload,
 		enum set_config_status *operation_result);
-enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
 bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
 
-- 
2.52.0

