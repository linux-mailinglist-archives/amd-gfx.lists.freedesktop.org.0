Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VKpdN+uoTmp5RgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 21:45:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B382729F55
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 21:45:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=k8TJB+dQ;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB2410F289;
	Wed,  8 Jul 2026 19:45:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656810F290;
 Wed,  8 Jul 2026 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sl7GiLs+b2sUP7WAzFEwJHZGVFnW/Vn9aKsSJBYpJ6A=; b=k8TJB+dQwZeYdzu/w7coBue20N
 NYFmtnclsERGi9czAeDUtEOtVOHd+wu9s4uGGzPd4v+e1Zv+6W7nbkhfo8HAPRFdAiUuOwzE3P0+K
 lwO/DDpuWpf7V2ugtUK2c2ZXezCHzG2CYWooe/KpACbFw8YsUpX5HWDvxtaKRhiEWnPmwL+RqbL25
 jX6GeYbwl7KJUuw7GPrU2Kj/39+I4wAsqEgIhkrCGgCko9jxuVEx/Idygtr6rjBaECUYXYO2TMRAL
 Wx9fowjBH4zNxRnwibNEXG4iUdrlO+ijvqg54eTxjWXtTwiodbzP2RufwcZj7AO+a4zJJ9g28STOP
 FZi1A4Kg==;
Received: from 100.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.100]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1whYCz-00BtrH-M7; Wed, 08 Jul 2026 21:45:26 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Ariel DAlessandro <ariel.dalessandro@collabora.com>,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>,
 Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Robert Mader <robert.mader@collabora.com>, Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 John Harrison <John.Harrison@Igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 16/19] drm/amd/display: add support to post-blend 1D-Curve
 colorop
Date: Wed,  8 Jul 2026 21:37:31 +0200
Message-ID: <20260708194343.2578387-17-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708194343.2578387-1-mwen@igalia.com>
References: <20260708194343.2578387-1-mwen@igalia.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:from_mime,igalia.com:email,igalia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B382729F55

Add Regamma TF operation as 1D Curve colorop to the AMD post-blend color
pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 62 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 20996af68f04..141c5238021e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1224,6 +1224,36 @@ __set_dm_crtc_colorop_3x4_matrix(struct drm_crtc_state *crtc_state,
 	return 0;
 }
 
+static int
+__set_dm_crtc_colorop_regamma(struct drm_crtc_state *crtc_state,
+			      struct dc_stream_state *dc_stream_state,
+			      struct drm_colorop *colorop,
+			      struct dc_transfer_func *tf)
+{
+	struct drm_colorop_state *colorop_state = NULL;
+	struct drm_atomic_commit *state = crtc_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct drm_device *dev = crtc_state->state->dev;
+	int ret = 0;
+
+	tf->type = TF_TYPE_BYPASS;
+
+	/* 1D Curve - Regamma TF */
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+		drm_dbg(dev, "Regamma TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		ret = __set_output_tf(tf, 0, 0, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_crtc_set_colorop_properties: Set colorop props if programmable by DC.
  * @crtc_state: DRM crtc state
@@ -1249,10 +1279,42 @@ amdgpu_dm_crtc_set_colorop_properties(struct drm_crtc_state *crtc_state,
 				      bool check_only)
 {
 	struct drm_colorop *colorop = crtc_state->color_pipeline;
+	struct drm_device *dev = crtc_state->state->dev;
+	struct dc_transfer_func *out_tf;
 	int ret;
 
 	/* 3x4 matrix */
 	ret = __set_dm_crtc_colorop_3x4_matrix(crtc_state, dc_stream_state, colorop, check_only);
+	if (ret)
+		return ret;
+
+	if (colorop && check_only) {
+		out_tf = kvzalloc_obj(*out_tf);
+		if (!out_tf)
+			return -ENOMEM;
+	} else {
+		out_tf = &dc_stream_state->out_transfer_func;
+		if (!colorop) {
+			out_tf->type = TF_TYPE_BYPASS;
+			return 0;
+		}
+	}
+
+	/* 1D Curve - REGAMMA TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no regamma TF colorop found\n");
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	ret = __set_dm_crtc_colorop_regamma(crtc_state, dc_stream_state, colorop, out_tf);
+	if (ret)
+		goto cleanup;
+
+cleanup:
+	if (check_only)
+		kvfree(out_tf);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 0abe8ab9184b..4c1204c683c4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -258,6 +258,7 @@ int amdgpu_dm_initialize_crtc_default_pipeline(struct drm_crtc *crtc,
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = crtc->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
 	int ret;
 	int i = 0;
 
@@ -279,6 +280,25 @@ int amdgpu_dm_initialize_crtc_default_pipeline(struct drm_crtc *crtc,
 
 	i++;
 
+	if (adev->dm.dc->caps.color.mpc.ogam_ram) {
+		/* 1D Curve - REGAMMA TF */
+		ops[i] = kzalloc_obj(*ops[0]);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_crtc_colorop_curve_1d_init(dev, ops[i], crtc, &dm_colorop_funcs,
+						     amdgpu_dm_supported_shaper_tfs,
+						     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+	}
+
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
 
 	return 0;
-- 
2.53.0

