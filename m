Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIeCDDRmsWnsugIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2026 13:55:16 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD8263F16
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2026 13:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C8210E8EB;
	Wed, 11 Mar 2026 12:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="PfhfLzrx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6686E10E88F;
 Wed, 11 Mar 2026 11:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773228686; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IxX+zo7Gd/oEBjkZWXW8I2L0Lz4/Xv7FXziEqu1i2F3ibs4ekonxVSop1JsLi6hKSyYHS1u6tz0r+Ox3SH6cB40wgeHHwKslNR/zAVtwcA7nPVxiQD+WEjjoWCcso4gSK5qegByGlEh1qs2C+LtLWL1LN+tMVv8r/aTiI9yG5Kk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773228686;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7Dkscc34h1bPFUV7RCNNNdjClm/eZjD9p2zUaLjFCsU=; 
 b=e3JW38PgMY/lyqEnhSRK0QEC2Q9v4rdkEqvqqZQlJB1pWNsJx6d2QrgU2/hYnbr7/My5SAeMTnMoz1CQnRSbOTne8ts4ScwYqTo2FWoFCzZUM9ZM8IPddljZUrKEQQtoAbG//xRo4wDe1cjAuYRLimne0ic3flhbmT7CpDqbyyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773228686; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=7Dkscc34h1bPFUV7RCNNNdjClm/eZjD9p2zUaLjFCsU=;
 b=PfhfLzrx+4yik1wxTU4BL557hrOzf+6k/zslDWn3jOVeKbx/HSjZtL8XY36CdUzo
 +qb4oGRHeZ2i+m/Uo5l3jgJBGlj+ynWrX+9hC56a6E7tTBVvSPtxEpEOrKo7BQGhn5N
 Jb3DlUrVZqCt5Q2CMjYJTYPc6SPgr9+FZyXZwPG8=
Received: by mx.zohomail.com with SMTPS id 1773228684467924.0850833915475;
 Wed, 11 Mar 2026 04:31:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 11 Mar 2026 12:30:56 +0100
Subject: [PATCH v4 2/2] drm/amd/display: Add support for 'link bpc'
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-link-bpc-v4-2-51775e964720@collabora.com>
References: <20260311-link-bpc-v4-0-51775e964720@collabora.com>
In-Reply-To: <20260311-link-bpc-v4-0-51775e964720@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Daniel Stone <daniels@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-Mailman-Approved-At: Wed, 11 Mar 2026 12:54:53 +0000
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
X-Rspamd-Queue-Id: D4FD8263F16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Action: no action

The 'link bpc' DRM property exposes the connector's current display link
bits per component value. This allows userspace to discover whether a
link has degraded from a higher bit depth to a lower one.

Add support for it in amdgpu.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfe95c9b8746..cca4dd93bb6d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7184,6 +7184,14 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 }
 #endif
 
+static void amdgpu_dm_update_link_bpc(struct drm_connector_state *conn_state,
+				      enum dc_color_depth depth)
+{
+	/* 6 bpc is an experimental internal format only, use 8 as minimum */
+	conn_state->link_bpc = clamp(convert_dc_color_depth_into_bpc(depth), 8,
+				     conn_state->max_bpc);
+}
+
 static struct dc_stream_state *
 create_stream_for_sink(struct drm_connector *connector,
 		       const struct drm_display_mode *drm_mode,
@@ -8981,8 +8989,10 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				adev->mode_info.underscan_vborder_property,
 				0);
 
-	if (!aconnector->mst_root)
+	if (!aconnector->mst_root) {
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
+		drm_connector_attach_link_bpc_property(&aconnector->base, 16);
+	}
 
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
@@ -11425,6 +11435,9 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 			goto fail;
 		}
 
+		amdgpu_dm_update_link_bpc(drm_new_conn_state,
+					  new_stream->timing.display_color_depth);
+
 		/*
 		 * TODO: Check VSDB bits to decide whether this should
 		 * be enabled or not.

-- 
2.53.0

