Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOeKJDGU+GnRwgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 14:42:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8A4BD0E9
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 14:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DFE10E6A3;
	Mon,  4 May 2026 12:42:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 717 seconds by postgrey-1.36 at gabe;
 Fri, 01 May 2026 20:49:00 UTC
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com
 [162.0.218.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438810F5FB
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 May 2026 20:49:00 +0000 (UTC)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [198.54.118.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4g6jXK4rqTz2xKS;
 Fri,  1 May 2026 16:37:37 -0400 (EDT)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 4g6jXH4kKxz3hhTp;
 Fri,  1 May 2026 16:37:35 -0400 (EDT)
Received: from localhost.localdomain
 (bras-base-toroon4332w-grc-26-174-91-51-28.dsl.bell.ca [174.91.51.28])
 by mta-08.privateemail.com (Postfix) with ESMTPA;
 Fri,  1 May 2026 16:37:01 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: dri-devel@lists.freedesktop.org
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 Yussuf Khalil <dev@pp3345.net>, Tom Chung <chiahsuan.chung@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Charlene Liu <charlene.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] drm/amd/display: add DMU timeout recovery support
Date: Fri,  1 May 2026 16:35:44 -0400
Message-ID: <20260501203552.749080-2-someguy@effective-light.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501203552.749080-1-someguy@effective-light.com>
References: <20260501203552.749080-1-someguy@effective-light.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 04 May 2026 12:42:21 +0000
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
X-Rspamd-Queue-Id: 2DD8A4BD0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[64];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[effective-light.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linux.dev,pp3345.net,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:someguy@effective-light.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:ray.wu@amd.com,m:Wayne.Lin@amd.com,m:aurabindo.pillai@amd.com,m:timur.kristof@gmail.com,m:superm1@kernel.org,m:ivan.lipski@amd.com,m:chen-yu.chen@amd.com,m:matthew.schwartz@linux.dev,m:dev@pp3345.net,m:chiahsuan.chung@amd.com,m:colin.i.king@gmail.com,m:charlene.liu@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,m:coliniking@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DMARC_NA(0.00)[effective-light.com];
	FORGED_SENDER(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.771];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:mid,effective-light.com:email]

DMU already has robust hung state tracking, but timeout recovery
was never hooked up, so do so now.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 12 ++++++++--
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e96a12ff2d31..7be4ebee1cb7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1246,7 +1246,7 @@ static  void amdgpu_dm_audio_eld_notify(struct amdgpu_device *adev, int pin)
 	}
 }
 
-static int dm_dmub_hw_init(struct amdgpu_device *adev)
+int amdgpu_dm_dmub_hw_init(struct amdgpu_device *adev)
 {
 	const struct dmcub_firmware_header_v1_0 *hdr;
 	struct dmub_srv *dmub_srv = adev->dm.dmub_srv;
@@ -1315,7 +1315,7 @@ static int dm_dmub_hw_init(struct amdgpu_device *adev)
 	/* if adev->firmware.load_type == AMDGPU_FW_LOAD_PSP,
 	 * amdgpu_ucode_init_single_fw will load dmub firmware
 	 * fw_inst_const part to cw0; otherwise, the firmware back door load
-	 * will be done by dm_dmub_hw_init
+	 * will be done by amdgpu_dm_dmub_hw_init().
 	 */
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
 		memcpy(fb_info->fb[DMUB_WINDOW_0_INST_CONST].cpu_addr, fw_inst_const,
@@ -1457,7 +1457,7 @@ static void dm_dmub_hw_resume(struct amdgpu_device *adev)
 			drm_warn(adev_to_drm(adev), "Wait for DMUB auto-load failed: %d\n", status);
 	} else {
 		/* Perform the full hardware initialization. */
-		r = dm_dmub_hw_init(adev);
+		r = amdgpu_dm_dmub_hw_init(adev);
 		if (r)
 			drm_err(adev_to_drm(adev), "DMUB interface failed to initialize: status=%d\n", r);
 	}
@@ -2041,6 +2041,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		goto error;
 	}
 
+	adev->dm.dc->debug.enable_dmu_recovery =
+		amdgpu_device_should_recover_gpu(adev);
+
 	if (amdgpu_dc_debug_mask & DC_DISABLE_PIPE_SPLIT) {
 		adev->dm.dc->debug.force_single_disp_pipe_split = false;
 		adev->dm.dc->debug.pipe_split_policy = MPC_SPLIT_AVOID;
@@ -2090,7 +2093,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	if (adev->dm.dc->caps.dp_hdmi21_pcon_support)
 		drm_info(adev_to_drm(adev), "DP-HDMI FRL PCON supported\n");
 
-	r = dm_dmub_hw_init(adev);
+	r = amdgpu_dm_dmub_hw_init(adev);
 	if (r) {
 		drm_err(adev_to_drm(adev), "DMUB interface failed to initialize: status=%d\n", r);
 		goto error;
@@ -3604,7 +3607,7 @@ static int dm_resume(struct amdgpu_ip_block *ip_block)
 		 */
 		link_enc_cfg_copy(adev->dm.dc->current_state, dc_state);
 
-		r = dm_dmub_hw_init(adev);
+		r = amdgpu_dm_dmub_hw_init(adev);
 		if (r) {
 			drm_err(adev_to_drm(adev), "DMUB interface failed to initialize: status=%d\n", r);
 			return r;
@@ -9623,7 +9626,15 @@ static void prepare_flip_isr(struct amdgpu_crtc *acrtc)
 {
 
 	assert_spin_locked(&acrtc->base.dev->event_lock);
-	WARN_ON(acrtc->event);
+
+	/*
+	 * Compositors will refuse to make forward progress unless we send
+	 * the previous flip's completion event.
+	 */
+	if (WARN_ON(acrtc->event)) {
+		drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
+		drm_crtc_vblank_put(&acrtc->base);
+	}
 
 	acrtc->event = acrtc->base.state->event;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 74a8fe1a1999..dc808ee83c2a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -1086,6 +1086,7 @@ int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
 
 void amdgpu_dm_init_color_mod(void);
+int amdgpu_dm_dmub_hw_init(struct amdgpu_device *adev);
 int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 3b8ae7798a93..8f10117483e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -33,6 +33,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
 
@@ -1165,8 +1166,15 @@ void dm_set_dcn_clocks(struct dc_context *ctx, struct dc_clocks *clks)
 
 void dm_helpers_dmu_timeout(struct dc_context *ctx)
 {
-	// TODO:
-	//amdgpu_device_gpu_recover(dc_context->driver-context, NULL);
+	struct amdgpu_device *adev = ctx->driver_context;
+
+	lockdep_assert_held(&adev->dm.dc_lock);
+
+	drm_info(adev_to_drm(adev), "attempting firmware reset\n");
+	if (amdgpu_dm_dmub_hw_init(adev))
+		drm_dev_wedged_event(adev_to_drm(adev),
+				     DRM_WEDGE_RECOVERY_REBIND |
+				     DRM_WEDGE_RECOVERY_BUS_RESET, NULL);
 }
 
 void dm_helpers_smu_timeout(struct dc_context *ctx, unsigned int msg_id, unsigned int param, unsigned int timeout_us)
-- 
2.54.0

