Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F352CFDB
	for <lists+amd-gfx@lfdr.de>; Thu, 19 May 2022 11:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF64411B322;
	Thu, 19 May 2022 09:55:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A4511B327;
 Thu, 19 May 2022 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652954099; x=1684490099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsbZCYbBbnba1CBDltDOxPXUjcKxWpMBUmL7u9S8k94=;
 b=VCHvlOEp5EkWFdhgPH0Icjj+1N+XTc298xcHjdRoLDwmG6fXIgky7nwT
 72Nst1gVBf8/KnwMhvU4o42lqt/LAjLp868iHorqIW7ZnQKvNZJo/WqCp
 DXk9la5xD2KteOv0UcE7izIO8G6jzelThh2fYxP3F7ou2HByL7g1vAyyu
 /xb88RAUuLRKA6KTOLxN4Ybtpo/oNto+WbMZsrA/MEbRkFgNYTxoLzaES
 t9QRuyLEFt03m0kX8k4pltBykw75MOszM/QEJ1pDUJvYRIAvOO73+QHi7
 0Iy2KuOk52sx1pgPK3P5VIJFnSZ2+Y+h6z5HS5ZGPNHS9bqgj9/f20nPV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252019988"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252019988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="606404200"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:55 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [CI 3/3] drm/amd/display: Move connector debugfs to drm
Date: Thu, 19 May 2022 15:21:49 +0530
Message-Id: <20220519095149.3560034-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
References: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, kernel test robot <lkp@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

As drm_connector already have the display_info, instead of creating
"output_bpc" debugfs in vendor specific driver, move the logic to
the drm layer.

This patch will also move "Current" bpc to the crtc debugfs from
connector debugfs, since we are getting this info from crtc_state.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
 3 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f9ce8cb45e6d..dae0b772865c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6617,14 +6617,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &state->base;
 }

-#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 {
 	crtc_debugfs_init(crtc);

 	return 0;
 }
-#endif

 static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
@@ -6722,9 +6720,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 	.late_register = amdgpu_dm_crtc_late_register,
-#endif
 };

 static enum drm_connector_status
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 188039f14544..78f3974ef7b8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -873,28 +873,18 @@ static int psr_capability_show(struct seq_file *m, void *data)
 }

 /*
- * Returns the current and maximum output bpc for the connector.
- * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
+ * Returns the current bpc for the crtc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_bpc
  */
-static int output_bpc_show(struct seq_file *m, void *data)
+static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 {
-	struct drm_connector *connector = m->private;
-	struct drm_device *dev = connector->dev;
-	struct drm_crtc *crtc = NULL;
+	struct drm_crtc *crtc = m->private;
+	struct drm_device *dev = crtc->dev;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 	unsigned int bpc;

 	mutex_lock(&dev->mode_config.mutex);
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-
-	if (connector->state == NULL)
-		goto unlock;
-
-	crtc = connector->state->crtc;
-	if (crtc == NULL)
-		goto unlock;
-
 	drm_modeset_lock(&crtc->mutex, NULL);
 	if (crtc->state == NULL)
 		goto unlock;
@@ -924,18 +914,15 @@ static int output_bpc_show(struct seq_file *m, void *data)
 	}

 	seq_printf(m, "Current: %u\n", bpc);
-	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
 	res = 0;

 unlock:
-	if (crtc)
-		drm_modeset_unlock(&crtc->mutex);
-
-	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	drm_modeset_unlock(&crtc->mutex);
 	mutex_unlock(&dev->mode_config.mutex);

 	return res;
 }
+DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);

 /*
  * Example usage:
@@ -2541,7 +2528,6 @@ static int target_backlight_show(struct seq_file *m, void *unused)
 DEFINE_SHOW_ATTRIBUTE(dp_dsc_fec_support);
 DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
 DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
-DEFINE_SHOW_ATTRIBUTE(output_bpc);
 DEFINE_SHOW_ATTRIBUTE(dp_lttpr_status);
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
@@ -2788,7 +2774,6 @@ static const struct {
 	const struct file_operations *fops;
 } connector_debugfs_entries[] = {
 		{"force_yuv420_output", &force_yuv420_output_fops},
-		{"output_bpc", &output_bpc_fops},
 		{"trigger_hotplug", &trigger_hotplug_debugfs_fops},
 		{"internal_display", &internal_display_fops}
 };
@@ -3172,9 +3157,10 @@ static int crc_win_update_get(void *data, u64 *val)

 DEFINE_DEBUGFS_ATTRIBUTE(crc_win_update_fops, crc_win_update_get,
 			 crc_win_update_set, "%llu\n");
-
+#endif
 void crtc_debugfs_init(struct drm_crtc *crtc)
 {
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 	struct dentry *dir = debugfs_lookup("crc", crtc->debugfs_entry);

 	if (!dir)
@@ -3190,9 +3176,11 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 				   &crc_win_y_end_fops);
 	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
 				   &crc_win_update_fops);
-
-}
 #endif
+	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_bpc_fops);
+}
+
 /*
  * Writes DTN log state to the user supplied buffer.
  * Example usage: cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
index 3366cb644053..071200473c27 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
@@ -31,8 +31,6 @@

 void connector_debugfs_init(struct amdgpu_dm_connector *connector);
 void dtn_debugfs_init(struct amdgpu_device *adev);
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 void crtc_debugfs_init(struct drm_crtc *crtc);
-#endif

 #endif
--
2.35.1

