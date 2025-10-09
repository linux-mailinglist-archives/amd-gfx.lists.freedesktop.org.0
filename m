Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE003BC90B4
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Oct 2025 14:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5735510EA14;
	Thu,  9 Oct 2025 12:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rTolYT8P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AFB10EA08
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Oct 2025 12:22:44 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1760012563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+LD5r01PNN7zm04H6bSvacVHamUM/2IZoCmv2ssIeCg=;
 b=rTolYT8PhikH16sOIRDoUQet6iGvoyf7ONa/qlIsqyhBepgupyHs0OdGPTCEDLAqueqrJz
 6+3xmVrUMMBHkVB7ZIHngJD7EoM4lGdiF3zRhX0S6KDP/7l/Cv6v4Pt+r8fqkvIrDOoPft
 iWj+O/j9E1UXsQuYv7v6OYDkc2qBs2k=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: harry.wentland@amd.com, christian.koenig@amd.com, sunpeng.li@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alexander.deucher@amd.com
Cc: linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 Matthew Schwartz <matthew.schwartz@linux.dev>, stable@vger.kernel.org
Subject: [PATCH v2] Revert "drm/amd/display: Only restore backlight after
 amdgpu_dm_init or dm_resume"
Date: Thu,  9 Oct 2025 14:19:00 +0200
Message-ID: <20251009121900.12777-1-matthew.schwartz@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 09 Oct 2025 12:35:29 +0000
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

This fix regressed the original issue that commit d83c747a1225
("drm/amd/display: Fix brightness level not retained over reboot") solved,
so revert it until a different approach to solve the regression that
it caused with AMD_PRIVATE_COLOR is found.

Fixes: a490c8d77d50 ("drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4620
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
v1 -> v2:
- Fix missing stable tag
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 -------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8e1622bf7a42..21281e684b84 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2081,8 +2081,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	dc_hardware_init(adev->dm.dc);
 
-	adev->dm.restore_backlight = true;
-
 	adev->dm.hpd_rx_offload_wq = hpd_rx_irq_create_workqueue(adev);
 	if (!adev->dm.hpd_rx_offload_wq) {
 		drm_err(adev_to_drm(adev), "failed to create hpd rx offload workqueue.\n");
@@ -3438,7 +3436,6 @@ static int dm_resume(struct amdgpu_ip_block *ip_block)
 		dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D0);
 
 		dc_resume(dm->dc);
-		adev->dm.restore_backlight = true;
 
 		amdgpu_dm_irq_resume_early(adev);
 
@@ -9965,6 +9962,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 	bool mode_set_reset_required = false;
 	u32 i;
 	struct dc_commit_streams_params params = {dc_state->streams, dc_state->stream_count};
+	bool set_backlight_level = false;
 
 	/* Disable writeback */
 	for_each_old_connector_in_state(state, connector, old_con_state, i) {
@@ -10084,6 +10082,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 			acrtc->hw_mode = new_crtc_state->mode;
 			crtc->hwmode = new_crtc_state->mode;
 			mode_set_reset_required = true;
+			set_backlight_level = true;
 		} else if (modereset_required(new_crtc_state)) {
 			drm_dbg_atomic(dev,
 				       "Atomic commit: RESET. crtc id %d:[%p]\n",
@@ -10140,16 +10139,13 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 	 * to fix a flicker issue.
 	 * It will cause the dm->actual_brightness is not the current panel brightness
 	 * level. (the dm->brightness is the correct panel level)
-	 * So we set the backlight level with dm->brightness value after initial
-	 * set mode. Use restore_backlight flag to avoid setting backlight level
-	 * for every subsequent mode set.
+	 * So we set the backlight level with dm->brightness value after set mode
 	 */
-	if (dm->restore_backlight) {
+	if (set_backlight_level) {
 		for (i = 0; i < dm->num_of_edps; i++) {
 			if (dm->backlight_dev[i])
 				amdgpu_dm_backlight_set_level(dm, i, dm->brightness[i]);
 		}
-		dm->restore_backlight = false;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 009f206226f0..db75e991ac7b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -630,13 +630,6 @@ struct amdgpu_display_manager {
 	 */
 	u32 actual_brightness[AMDGPU_DM_MAX_NUM_EDP];
 
-	/**
-	 * @restore_backlight:
-	 *
-	 * Flag to indicate whether to restore backlight after modeset.
-	 */
-	bool restore_backlight;
-
 	/**
 	 * @aux_hpd_discon_quirk:
 	 *
-- 
2.51.0

