Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI6fJyc+wWk9RwQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 14:20:39 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FC2F2BD8
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 14:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B320F10E11E;
	Mon, 23 Mar 2026 13:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZJefgWNU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B510E3EE;
 Mon, 23 Mar 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ukfnB5R8mZ+GokTHvDOlZuqhmwMNQHpfoizw9ZvrQYk=; b=ZJefgWNUTW3RjV72Ofd0m3/Enm
 wze3OwftYF3ek/6YRRXVUJ6J2/GK+tTIx6lAlbXYU6NINTXAOyinbQTdOzsg4oPPwtwVIbkV70qn6
 RxA6yavXiy42lDAZA2TYDR9SMlMDOA+KcWwGCGG6Lz2wNlE9DYjqB83L24/6Ks4iqIfSGpDGoLgyV
 scllkqNjF1++/uf2kqqokRMI4FxUaFxUQ0rqsEtx8R/P+OU9/+WdYFrXuIB2j1jsBXrv59NeDr89M
 DGEStSiRKVWOSfXxbCFiY7HJg1spYir0q9710jWIar88crNkLTp3SIzlsp0rQA8SXzQod3CvkK0Bo
 3L44eA2A==;
Received: from [186.208.74.38] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w4fCI-004rx9-9A; Mon, 23 Mar 2026 14:19:58 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/atomic: track individual colorop updates
Date: Mon, 23 Mar 2026 10:15:13 -0300
Message-ID: <20260323131942.494217-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323131942.494217-1-mwen@igalia.com>
References: <20260323131942.494217-1-mwen@igalia.com>
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
X-Spamd-Result: default: False [1.99 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,intel.com,emersion.fr,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.225];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 325FC2F2BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
track any value changes in the color pipeline of a given plane, so that
drivers can update color blocks as soon as plane color pipeline or
individual colorop values change.

Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

 v2: add linux types to provide bool for MSM driver (kernel bot)
---
 drivers/gpu/drm/drm_atomic_uapi.c | 53 ++++++++++++++++++++++++-------
 include/drm/drm_atomic_uapi.h     |  4 ++-
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 87de41fb4459..713fa9e81732 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
  *
  * Helper function to select the color pipeline on a plane by setting
  * it to the first drm_colorop element of the pipeline.
+ *
+ * Return: true if plane color pipeline value changed, false otherwise.
  */
-void
+bool
 drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_colorop *colorop)
 {
 	struct drm_plane *plane = plane_state->plane;
 
+	/* Color pipeline didn't change */
+	if (plane_state->color_pipeline == colorop)
+		return false;
+
 	if (colorop)
 		drm_dbg_atomic(plane->dev,
 			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
@@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 			       plane->base.id, plane->name, plane_state);
 
 	plane_state->color_pipeline = colorop;
+
+	return true;
 }
 EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
 
@@ -600,7 +608,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		if (val && !colorop)
 			return -EACCES;
 
-		drm_atomic_set_colorop_for_plane(state, colorop);
+		state->color_mgmt_changed |= drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -709,11 +717,11 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 					      struct drm_colorop_state *state,
 					      struct drm_property *property,
-					      uint64_t val)
+					      uint64_t val,
+					      bool *replaced)
 {
 	ssize_t elem_size = -1;
 	ssize_t size = -1;
-	bool replaced = false;
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_LUT:
@@ -735,28 +743,39 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 						 &state->data,
 						 val,
 						 -1, size, elem_size,
-						 &replaced);
+						 replaced);
 }
 
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 					   struct drm_colorop_state *state,
 					   struct drm_file *file_priv,
 					   struct drm_property *property,
-					   uint64_t val)
+					   uint64_t val,
+					   bool *replaced)
 {
 	if (property == colorop->bypass_property) {
-		state->bypass = val;
+		if (state->bypass != val) {
+			state->bypass = val;
+			*replaced = true;
+		}
 	} else if (property == colorop->lut1d_interpolation_property) {
 		colorop->lut1d_interpolation = val;
 	} else if (property == colorop->curve_1d_type_property) {
-		state->curve_1d_type = val;
+		if (state->curve_1d_type != val) {
+			state->curve_1d_type = val;
+			*replaced = true;
+		}
 	} else if (property == colorop->multiplier_property) {
-		state->multiplier = val;
+		if (state->multiplier != val) {
+			state->multiplier = val;
+			*replaced = true;
+		}
 	} else if (property == colorop->lut3d_interpolation_property) {
 		colorop->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
-							  property, val);
+							  property, val,
+							  replaced);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
@@ -1273,6 +1292,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	case DRM_MODE_OBJECT_COLOROP: {
 		struct drm_colorop *colorop = obj_to_colorop(obj);
 		struct drm_colorop_state *colorop_state;
+		struct drm_plane_state *plane_state;
+		bool replaced = false;
 
 		colorop_state = drm_atomic_get_colorop_state(state, colorop);
 		if (IS_ERR(colorop_state)) {
@@ -1281,7 +1302,17 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		}
 
 		ret = drm_atomic_colorop_set_property(colorop, colorop_state,
-						      file_priv, prop, prop_value);
+						      file_priv, prop, prop_value,
+						      &replaced);
+		if (ret || !replaced)
+			break;
+
+		plane_state = drm_atomic_get_plane_state(state, colorop->plane);
+		if (IS_ERR(plane_state)) {
+			ret = PTR_ERR(plane_state);
+			break;
+		}
+		plane_state->color_mgmt_changed = true;
 		break;
 	}
 	default:
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 436315523326..4e7e78f711e2 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -29,6 +29,8 @@
 #ifndef DRM_ATOMIC_UAPI_H_
 #define DRM_ATOMIC_UAPI_H_
 
+#include <linux/types.h>
+
 struct drm_crtc_state;
 struct drm_display_mode;
 struct drm_property_blob;
@@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 			      struct drm_crtc *crtc);
 void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
-void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+bool drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 				      struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
-- 
2.53.0

