Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F87ADFD4
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Sep 2023 21:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0510E2DF;
	Mon, 25 Sep 2023 19:49:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4101110E2DC;
 Mon, 25 Sep 2023 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRCcBXnmGSKr8m7ip5h6qqs877Fiim5Th5OQ4js85NY=; b=URgZZiCMkb67zD9+PbA2FUc3ZB
 F+AVS7I3Junq6CltgGuBhLlq9zqGMThSwYpry3QvFp2sfiJrFPHqaLhFC7A5C7O7BdaFSp17tyJFL
 49IykiJ5dkKIpIPRBfDIhTQTEkp6rG7XKtxz3n1d+mRIWiiqzclbkfZ7dy+N3VQMwXFZ0KKp9ZVSa
 lRCs1Z9ywOxbINvglbd09Ge7vFr3ncGGLLSUWKviHxgLtyigIDxnqcVzUNutZXEln6Qm5JSBj6rHK
 225ahxppbAxQxRJP3BJ8F1c53voj5Jb8t9XoeYeMU8sOk1xWbUN1IDhpNL/r16CG0M9ewtpoT7JLv
 bAK4Hccg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkraR-008GsG-0u; Mon, 25 Sep 2023 21:49:43 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 03/32] drm/drm_plane: track color mgmt changes per plane
Date: Mon, 25 Sep 2023 18:49:03 -0100
Message-Id: <20230925194932.1329483-4-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We will add color mgmt properties to DRM planes in the next patches and
we want to track when one of this properties change to define atomic
commit behaviors. Using a similar approach from CRTC color props, we set
a color_mgmt_changed boolean whenever a plane color prop changes.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c              | 1 +
 drivers/gpu/drm/drm_atomic_state_helper.c | 1 +
 include/drm/drm_plane.h                   | 7 +++++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2c454568a607..2925371d230d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -724,6 +724,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..25bb0859fda7 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -338,6 +338,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
+	state->color_mgmt_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..52c3287da0da 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -237,6 +237,13 @@ struct drm_plane_state {
 
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
+
+	/**
+	 * @color_mgmt_changed: Color management properties have changed. Used
+	 * by the atomic helpers and drivers to steer the atomic commit control
+	 * flow.
+	 */
+	bool color_mgmt_changed : 1;
 };
 
 static inline struct drm_rect
-- 
2.40.1

