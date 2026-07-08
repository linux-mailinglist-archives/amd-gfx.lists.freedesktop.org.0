Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wv7AB6GoTmpJRgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 21:44:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B688F729EE0
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 21:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=JSwHy0hh;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D460C10F26F;
	Wed,  8 Jul 2026 19:44:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B4410F260;
 Wed,  8 Jul 2026 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9G3kQItU6v4A1JLe7MM4sPnTCAQ8PtusRLOSDDlkytc=; b=JSwHy0hh9qIWHdPipw4qhOwwzq
 Yh0UvPt+Y3Ks+KP7BjxabqFqrddW0PY8IltKqUI+C2Cd0TaRX67jyqjc3KGi++FIiostnOpM5QQTN
 JTVMtG8r5iiu72tdtPGTEizxCw+P3doXhq4kyh33zf+b8hHBM3yaVRKuWudzYUm9uyNwNPAVdbIsc
 A6IDNjRYxsajMgCiFZV32nhOnKYcezRkFrDzcK+IMi9f1LoGRBaWKkQkA/nQcf1npbg+W+O8pUWVF
 uW/wRAH6gt5aGNOVmpZTCjmrwQt7V8ro6lJ8hGAdDFK+4DTxi+YoBF1J7WdUBBqnVHwT1UDQTZnuJ
 oDbjGbMw==;
Received: from 100.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.100]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1whYBb-00BtrH-2E; Wed, 08 Jul 2026 21:43:59 +0200
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
 kernel-dev@igalia.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 06/19] drm/atomic: Pass crtc_color_pipeline client cap to
 atomic check
Date: Wed,  8 Jul 2026 21:37:21 +0200
Message-ID: <20260708194343.2578387-7-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708194343.2578387-1-mwen@igalia.com>
References: <20260708194343.2578387-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B688F729EE0

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Pass the state of the CRTC (post-blend) color pipeline client cap to the
atomic state so that drivers can rely on it to enable color pipeline
functionality and ignore the deprecated color management CRTC
properties.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 8f9c11bd94c6..0ee44976031e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1738,6 +1738,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
+	state->crtc_color_pipeline = file_priv->crtc_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 88087910ab1a..a28701704e01 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -575,6 +575,26 @@ struct drm_atomic_commit {
 	 */
 	bool plane_color_pipeline : 1;
 
+	/**
+	 * @crtc_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - GAMMA_LUT
+	 *  - DEGAMMA_LUT
+	 *  - GAMMA_LUT_SIZE
+	 *  - CTM
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool crtc_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.53.0

