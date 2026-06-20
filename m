Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mIeVHIa6Nmq/DwcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 20 Jun 2026 18:06:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6A6A9316
	for <lists+amd-gfx@lfdr.de>; Sat, 20 Jun 2026 18:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="AtSP/kQh";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4B910E224;
	Sat, 20 Jun 2026 16:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5610E221;
 Sat, 20 Jun 2026 16:06:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8548C601EE;
 Sat, 20 Jun 2026 16:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AC28C2BCF4;
 Sat, 20 Jun 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1781971579;
 bh=UfZu0IHwZg+nbLV0qKnTVPjPkVRtqSurmt1kE7uxeIs=;
 h=From:Date:Subject:To:Cc:References:In-Reply-To:Reply-To:From;
 b=AtSP/kQhRoxOpBbgC6X9U7RRnzzHL3XAuWMfHT54yMSZPm0E/JSDwVwRkbg4R602g
 G+yK7P1S1bNHFM0D8jaRp3NBT5XH3G4HwVInmHPaowLp6Ua/uwxIYDm+vdKIW1YLh5
 h9FTO0C60y/Bcump8GlFJdrJxnmkarGBBrLPvN8L3k+3PBOGI7DcQEsWkzlW8kaaua
 IkMScHJngwiuZM5rTtIXQBkGxha+KuWRnbCe7FLpGt74kcHQMdiAAr5Pkdzju2za3/
 y4RmvjUX+FeOJKLxV8mk3buATkyoR7WR7x+hoL9kH0JgLmZ1MmfG/Y/mjzF2XZvJys
 E1fFicBn63Csw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1F256CDB46C;
 Sat, 20 Jun 2026 16:06:19 +0000 (UTC)
From: Stephen via B4 Relay <devnull+stevester.codes.gmail.com@kernel.org>
Date: Sat, 20 Jun 2026 10:06:21 -0600
Subject: [PATCH RFC 3/3] drm/amd/display: use HDMI RGB deep color for PCONs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-ch7218-rfc-v1-b4-v1-3-3412debf44b6@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Stephen <stevester.codes@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
References: <20260620-ch7218-rfc-v1-b4-v1-1-3412debf44b6@gmail.com>
In-Reply-To: <20260620-ch7218-rfc-v1-b4-v1-1-3412debf44b6@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781971578; l=4269;
 i=stevester.codes@gmail.com; s=ch7218-rfc; h=from:subject:message-id;
 bh=U409nPgAq2LHqdJTGL6nxmnc+OvZgy/z3WvXz6cKcNA=;
 b=kdMvKSD0HIGgxsrc/zR8mbLTXIX9+Sx+Hv9xQZgZt5FVy89xm9Pg556o79gN5i9ti6usHaY8n
 Jrt+bEH0PUdCSMBCgSlSrvYaFdwllrV4pBNoX4HXrt+bafd0kMpXyVF
X-Developer-Key: i=stevester.codes@gmail.com; a=ed25519;
 pk=3Y74rGwtdwPNG9fzfw+7DSf/KWLeW8BsYVkyhPcx5pY=
X-Endpoint-Received: by B4 Relay for stevester.codes@gmail.com/ch7218-rfc
 with auth_id=834
X-Original-From: Stephen <stevester.codes@gmail.com>
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
Reply-To: stevester.codes@gmail.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.19 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[stevester.codes.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org,amd.com,igalia.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[stevester.codes@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00D6A6A9316

From: Stephen <stevester.codes@gmail.com>

DP-to-HDMI PCON connectors are exposed to DRM as DP connectors, but the
downstream sink capability for RGB deep color is carried in the HDMI CTA
deep-color flags. If AMDGPU only uses the base EDID bpc field for RGB
output, HDMI sinks behind PCONs can be capped at 8 bpc even when the CTA
block advertises RGB 10/12 bpc support.

For RGB output through a recognized DP-HDMI converter, derive the
candidate bpc from edid_hdmi_rgb444_dc_modes before applying the
requested max bpc cap. Keep YCbCr420 on the existing y420 deep-color
path and leave native DP behavior unchanged.

Signed-off-by: Stephen <stevester.codes@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 ++++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8f80420e9f0b..3b814b839ddf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6769,22 +6769,44 @@ static void update_stream_scaling_settings(struct drm_device *dev,
 
 static enum dc_color_depth
 convert_color_depth_from_display_info(const struct drm_connector *connector,
-				      bool is_y420, int requested_bpc)
+				      enum dc_pixel_encoding pixel_encoding,
+				      int requested_bpc)
 {
+	const struct drm_display_info *info = &connector->display_info;
+	bool is_hdmi_pcon = false;
 	u8 bpc;
 
-	if (is_y420) {
+	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK) {
+		const struct amdgpu_dm_connector *aconnector =
+			to_amdgpu_dm_connector(connector);
+
+		is_hdmi_pcon = aconnector->dc_link &&
+			aconnector->dc_link->dpcd_caps.dongle_type ==
+			DISPLAY_DONGLE_DP_HDMI_CONVERTER;
+	}
+
+	if (pixel_encoding == PIXEL_ENCODING_YCBCR420) {
 		bpc = 8;
 
 		/* Cap display bpc based on HDMI 2.0 HF-VSDB */
-		if (connector->display_info.hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48)
+		if (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48)
+			bpc = 16;
+		else if (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36)
+			bpc = 12;
+		else if (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30)
+			bpc = 10;
+	} else if (pixel_encoding == PIXEL_ENCODING_RGB && is_hdmi_pcon) {
+		bpc = 8;
+
+		/* The downstream sink is HDMI even though DRM exposes DP. */
+		if (info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_48)
 			bpc = 16;
-		else if (connector->display_info.hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36)
+		else if (info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)
 			bpc = 12;
-		else if (connector->display_info.hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30)
+		else if (info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)
 			bpc = 10;
 	} else {
-		bpc = (uint8_t)connector->display_info.bpc;
+		bpc = (uint8_t)info->bpc;
 		/* Assume 8 bpc by default if no bpc is specified. */
 		bpc = bpc ? bpc : 8;
 	}
@@ -7004,7 +7026,7 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
 	timing_out->display_color_depth = convert_color_depth_from_display_info(
 		connector,
-		(timing_out->pixel_encoding == PIXEL_ENCODING_YCBCR420),
+		timing_out->pixel_encoding,
 		requested_bpc);
 	timing_out->scan_type = SCANNING_TYPE_NODATA;
 	timing_out->hdmi_vic = 0;
@@ -8761,6 +8783,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 	struct drm_dp_mst_port *mst_port;
 	struct drm_dp_mst_topology_state *mst_state;
 	enum dc_color_depth color_depth;
+	enum dc_pixel_encoding pixel_encoding = PIXEL_ENCODING_RGB;
 	int clock, bpp = 0;
 	bool is_y420 = false;
 
@@ -8801,8 +8824,10 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 
 		is_y420 = drm_mode_is_420_also(&connector->display_info, adjusted_mode) &&
 			  aconnector->force_yuv420_output;
+		if (is_y420)
+			pixel_encoding = PIXEL_ENCODING_YCBCR420;
 		color_depth = convert_color_depth_from_display_info(connector,
-								    is_y420,
+								    pixel_encoding,
 								    max_bpc);
 		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
 		clock = adjusted_mode->clock;

-- 
2.54.0


