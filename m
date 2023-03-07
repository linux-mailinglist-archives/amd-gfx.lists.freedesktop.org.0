Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AC6AF5C0
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Mar 2023 20:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7F10E0FF;
	Tue,  7 Mar 2023 19:34:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1710E538
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Mar 2023 19:14:47 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-176d93cd0daso6786407fac.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Mar 2023 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1678216486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fOmFgPIp3hsAGCIR1UQk10Ns785Ii9Fwxb0/rzbOnLo=;
 b=UHWjvJrMrIq+eRFMDFQf/pbjkYRjQ5yIARLh2yEmCdtaNGcHLlx6+jNP/96jqtlcNu
 1j8k7mMQLlpdSkJo6raWWeII1vbtUI420xR57K6e2JLGGT36jbw8KV41JX0NDhXnGExL
 PW7m0uKtf7Lcgevzhv8pzMwCf9K9vYXJ3IzgrVAhWg0CoyPdIE8SqiniN+qeKqt/vKrk
 2E35u4Tl84WThv32YiJHu4HxVjmfUQJREY4P0k14fIrauow8hDvIuTsizqM88lTV09q/
 KWpjOc15QAqjvTjhwnC1ch/b1YVwgKfbR0eGMXI9gVO4lzY3a4MviKCZQrW5WSb/yRiz
 ojzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678216486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fOmFgPIp3hsAGCIR1UQk10Ns785Ii9Fwxb0/rzbOnLo=;
 b=gZSNe2cbn6eSmhfKTCd9nvk9CxfivZYJSTcYEYxEtF5BRLsFwszvKNiSGxZYHP9qwB
 lQfjIuLJkw8+7Oxngng4eKRCAiXAQwOKV4Do17TSH8TFYuB7ggb45T0n8ZpGkvZP6a3u
 2tLiKcjjG2PIAKxowVUUiBI1nVBPmSfn/ABUjH38UtnErvijAukO+MEeMfhvSWNg3OZ4
 jb/bdSwH2tyyRVmOVxNQ1cJS1c9v05OVbP99W+h1paXdCQS9/aSuKNbWKe/JGk3nYyh/
 aEiDqCVzX9jYUMWZVkBTbpmqgsr0f6ROWIm8gDHU1V+JH9r51r27DoIquQP58l2JL89r
 SvDQ==
X-Gm-Message-State: AO0yUKWyfA5XSZXRBX7RaYmip+Pv6aVb083L80kkjG84kAGexRT5LLu/
 H6ox5GUMdp0Xm0FGWuCycVAsWw==
X-Google-Smtp-Source: AK7set8bM251vzn1Z7Yw0sjF24Yg41uoEcJULEUsr7v+wss7hrx/n1mS+3lgmuhxIJdiztwFJDE4XQ==
X-Received: by 2002:a05:6870:9724:b0:16d:e3ce:a701 with SMTP id
 n36-20020a056870972400b0016de3cea701mr10537874oaq.35.1678216486652; 
 Tue, 07 Mar 2023 11:14:46 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:63:8ae3:4d1f:9fc2:9fe6:c88e])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056870d30500b001724742cfcesm5341794oag.38.2023.03.07.11.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 11:14:46 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: add prefix to amdgpu_dm_crtc.h functions
Date: Tue,  7 Mar 2023 16:14:17 -0300
Message-Id: <20230307191417.150823-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Mar 2023 19:34:23 +0000
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
Cc: David Tadokoro <davidbtadokoro@usp.br>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Some amdgpu_dm_crtc.h functions didn't have names that indicated where
they were declared.

To better filter results in debug tools like ftrace, prefix these
functions with 'amdgpu_dm_crtc_'.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 26 +++++++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.h    | 14 ++++----
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b472931cb7ca..b3e874589617 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -342,7 +342,7 @@ static inline bool is_dc_timing_adjust_needed(struct dm_crtc_state *old_state,
 {
 	if (new_state->freesync_config.state ==  VRR_STATE_ACTIVE_FIXED)
 		return true;
-	else if (amdgpu_dm_vrr_active(old_state) != amdgpu_dm_vrr_active(new_state))
+	else if (amdgpu_dm_crtc_vrr_active(old_state) != amdgpu_dm_crtc_vrr_active(new_state))
 		return true;
 	else
 		return false;
@@ -436,7 +436,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 
 	WARN_ON(!e);
 
-	vrr_active = amdgpu_dm_vrr_active_irq(amdgpu_crtc);
+	vrr_active = amdgpu_dm_crtc_vrr_active_irq(amdgpu_crtc);
 
 	/* Fixed refresh rate, or VRR scanout position outside front-porch? */
 	if (!vrr_active ||
@@ -510,7 +510,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 	acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VUPDATE);
 
 	if (acrtc) {
-		vrr_active = amdgpu_dm_vrr_active_irq(acrtc);
+		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
 		drm_dev = acrtc->base.dev;
 		vblank = &drm_dev->vblank[acrtc->base.index];
 		previous_timestamp = atomic64_read(&irq_params->previous_timestamp);
@@ -534,7 +534,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 		 * if a pageflip happened inside front-porch.
 		 */
 		if (vrr_active) {
-			dm_crtc_handle_vblank(acrtc);
+			amdgpu_dm_crtc_handle_vblank(acrtc);
 
 			/* BTR processing for pre-DCE12 ASICs */
 			if (acrtc->dm_irq_params.stream &&
@@ -574,7 +574,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 	if (!acrtc)
 		return;
 
-	vrr_active = amdgpu_dm_vrr_active_irq(acrtc);
+	vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
 
 	DC_LOG_VBLANK("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
 		      vrr_active, acrtc->dm_irq_params.active_planes);
@@ -586,7 +586,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 	 * to dm_vupdate_high_irq after end of front-porch.
 	 */
 	if (!vrr_active)
-		dm_crtc_handle_vblank(acrtc);
+		amdgpu_dm_crtc_handle_vblank(acrtc);
 
 	/**
 	 * Following stuff must happen at start of vblank, for crc
@@ -2483,11 +2483,11 @@ static void dm_gpureset_toggle_interrupts(struct amdgpu_device *adev,
 					 enable ? "enable" : "disable");
 
 			if (enable) {
-				rc = dm_enable_vblank(&acrtc->base);
+				rc = amdgpu_dm_crtc_enable_vblank(&acrtc->base);
 				if (rc)
 					DRM_WARN("Failed to enable vblank interrupts\n");
 			} else {
-				dm_disable_vblank(&acrtc->base);
+				amdgpu_dm_crtc_disable_vblank(&acrtc->base);
 			}
 
 		}
@@ -7746,7 +7746,7 @@ static void update_freesync_state_on_stream(
 			&vrr_params);
 
 		if (adev->family < AMDGPU_FAMILY_AI &&
-		    amdgpu_dm_vrr_active(new_crtc_state)) {
+		    amdgpu_dm_crtc_vrr_active(new_crtc_state)) {
 			mod_freesync_handle_v_update(dm->freesync_module,
 						     new_stream, &vrr_params);
 
@@ -7864,8 +7864,8 @@ static void update_stream_irq_parameters(
 static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
 					    struct dm_crtc_state *new_state)
 {
-	bool old_vrr_active = amdgpu_dm_vrr_active(old_state);
-	bool new_vrr_active = amdgpu_dm_vrr_active(new_state);
+	bool old_vrr_active = amdgpu_dm_crtc_vrr_active(old_state);
+	bool new_vrr_active = amdgpu_dm_crtc_vrr_active(new_state);
 
 	if (!old_vrr_active && new_vrr_active) {
 		/* Transition VRR inactive -> active:
@@ -7876,7 +7876,7 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
 		 * We also need vupdate irq for the actual core vblank handling
 		 * at end of vblank.
 		 */
-		WARN_ON(dm_set_vupdate_irq(new_state->base.crtc, true) != 0);
+		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
 		WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
 		DRM_DEBUG_DRIVER("%s: crtc=%u VRR off->on: Get vblank ref\n",
 				 __func__, new_state->base.crtc->base.id);
@@ -7884,7 +7884,7 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
 		/* Transition VRR active -> inactive:
 		 * Allow vblank irq disable again for fixed refresh rate.
 		 */
-		WARN_ON(dm_set_vupdate_irq(new_state->base.crtc, false) != 0);
+		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, false) != 0);
 		drm_crtc_vblank_put(new_state->base.crtc);
 		DRM_DEBUG_DRIVER("%s: crtc=%u VRR on->off: Drop vblank ref\n",
 				 __func__, new_state->base.crtc->base.id);
@@ -7926,7 +7926,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	int planes_count = 0, vpos, hpos;
 	unsigned long flags;
 	u32 target_vblank, last_flip_vblank;
-	bool vrr_active = amdgpu_dm_vrr_active(acrtc_state);
+	bool vrr_active = amdgpu_dm_crtc_vrr_active(acrtc_state);
 	bool cursor_update = false;
 	bool pflip_present = false;
 	bool dirty_rects_changed = false;
@@ -8476,7 +8476,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		 * aconnector as needed
 		 */
 
-		if (modeset_required(new_crtc_state, dm_new_crtc_state->stream, dm_old_crtc_state->stream)) {
+		if (amdgpu_dm_crtc_modeset_required(new_crtc_state, dm_new_crtc_state->stream, dm_old_crtc_state->stream)) {
 
 			DRM_DEBUG_ATOMIC("Atomic commit: SET crtc id %d: [%p]\n", acrtc->crtc_id, acrtc);
 
@@ -9301,7 +9301,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		if (modereset_required(new_crtc_state))
 			goto skip_modeset;
 
-		if (modeset_required(new_crtc_state, new_stream,
+		if (amdgpu_dm_crtc_modeset_required(new_crtc_state, new_stream,
 				     dm_old_crtc_state->stream)) {
 
 			WARN_ON(dm_new_crtc_state->stream);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index dc4f37240beb..1d924dc51a3e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -34,7 +34,7 @@
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_debugfs.h"
 
-void dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc)
+void amdgpu_dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc)
 {
 	struct drm_crtc *crtc = &acrtc->base;
 	struct drm_device *dev = crtc->dev;
@@ -54,14 +54,14 @@ void dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-bool modeset_required(struct drm_crtc_state *crtc_state,
+bool amdgpu_dm_crtc_modeset_required(struct drm_crtc_state *crtc_state,
 			     struct dc_stream_state *new_stream,
 			     struct dc_stream_state *old_stream)
 {
 	return crtc_state->active && drm_atomic_crtc_needs_modeset(crtc_state);
 }
 
-bool amdgpu_dm_vrr_active_irq(struct amdgpu_crtc *acrtc)
+bool amdgpu_dm_crtc_vrr_active_irq(struct amdgpu_crtc *acrtc)
 
 {
 	return acrtc->dm_irq_params.freesync_config.state ==
@@ -70,7 +70,7 @@ bool amdgpu_dm_vrr_active_irq(struct amdgpu_crtc *acrtc)
 		       VRR_STATE_ACTIVE_FIXED;
 }
 
-int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
+int amdgpu_dm_crtc_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
@@ -89,7 +89,7 @@ int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 	return rc;
 }
 
-bool amdgpu_dm_vrr_active(struct dm_crtc_state *dm_state)
+bool amdgpu_dm_crtc_vrr_active(struct dm_crtc_state *dm_state)
 {
 	return dm_state->freesync_config.state == VRR_STATE_ACTIVE_VARIABLE ||
 	       dm_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
@@ -159,11 +159,11 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 
 	if (enable) {
 		/* vblank irq on -> Only need vupdate irq in vrr mode */
-		if (amdgpu_dm_vrr_active(acrtc_state))
-			rc = dm_set_vupdate_irq(crtc, true);
+		if (amdgpu_dm_crtc_vrr_active(acrtc_state))
+			rc = amdgpu_dm_crtc_set_vupdate_irq(crtc, true);
 	} else {
 		/* vblank irq off -> vupdate irq off */
-		rc = dm_set_vupdate_irq(crtc, false);
+		rc = amdgpu_dm_crtc_set_vupdate_irq(crtc, false);
 	}
 
 	if (rc)
@@ -199,12 +199,12 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 	return 0;
 }
 
-int dm_enable_vblank(struct drm_crtc *crtc)
+int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	return dm_set_vblank(crtc, true);
 }
 
-void dm_disable_vblank(struct drm_crtc *crtc)
+void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	dm_set_vblank(crtc, false);
 }
@@ -300,8 +300,8 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
 	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
 	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
-	.enable_vblank = dm_enable_vblank,
-	.disable_vblank = dm_disable_vblank,
+	.enable_vblank = amdgpu_dm_crtc_enable_vblank,
+	.disable_vblank = amdgpu_dm_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
@@ -381,7 +381,7 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	dm_update_crtc_active_planes(crtc, crtc_state);
 
 	if (WARN_ON(unlikely(!dm_crtc_state->stream &&
-			modeset_required(crtc_state, NULL, dm_crtc_state->stream)))) {
+			amdgpu_dm_crtc_modeset_required(crtc_state, NULL, dm_crtc_state->stream)))) {
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
index 1ac8692354cf..17e948753f59 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
@@ -27,21 +27,21 @@
 #ifndef __AMDGPU_DM_CRTC_H__
 #define __AMDGPU_DM_CRTC_H__
 
-void dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc);
+void amdgpu_dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc);
 
-bool modeset_required(struct drm_crtc_state *crtc_state,
+bool amdgpu_dm_crtc_modeset_required(struct drm_crtc_state *crtc_state,
 		      struct dc_stream_state *new_stream,
 		      struct dc_stream_state *old_stream);
 
-int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable);
+int amdgpu_dm_crtc_set_vupdate_irq(struct drm_crtc *crtc, bool enable);
 
-bool amdgpu_dm_vrr_active_irq(struct amdgpu_crtc *acrtc);
+bool amdgpu_dm_crtc_vrr_active_irq(struct amdgpu_crtc *acrtc);
 
-bool amdgpu_dm_vrr_active(struct dm_crtc_state *dm_state);
+bool amdgpu_dm_crtc_vrr_active(struct dm_crtc_state *dm_state);
 
-int dm_enable_vblank(struct drm_crtc *crtc);
+int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc);
 
-void dm_disable_vblank(struct drm_crtc *crtc);
+void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc);
 
 int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			struct drm_plane *plane,
-- 
2.39.2

