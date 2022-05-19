Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F152CFD5
	for <lists+amd-gfx@lfdr.de>; Thu, 19 May 2022 11:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634EA11B31A;
	Thu, 19 May 2022 09:54:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BDC11B32C;
 Thu, 19 May 2022 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652954096; x=1684490096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XS7DAE30lSTUEbJQlyptEc49QiVX5I/Chljn/cD5ZYI=;
 b=bxb2V8yFm13hEqdblP/B5nEP4E84FPLe8NZvGax2rqLpSokaIhFTrBPY
 Z0BwukjvD4gI3WebQ1JfcbwyLG4MnRs+5D+vipkPQScnWHP4/i4bH77mE
 ARhkKafOx6TFq9v7Gm/z2MJKLpZVspMhG+acSthFJbayarkCQSOKpTfC5
 sigVMBedjN+V3Tqddag6fb04fKhxUt/l4zSWspfwklyJmf+sR1Bx5Qmbj
 NsMcacnx5tH2YIOWZLhieRE34OZlqdH+o6hEC3MpTN6ejbc9IeiE5elks
 8iUXRR4ZKJp/8kVB5wHjiJY4ufB+zwzAoAW/t7zMJsg/2WPnyap0RijYh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252019970"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252019970"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="606404182"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:52 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [CI 2/3] drm/i915/display/debug: Expose crtc current bpc via debugfs
Date: Thu, 19 May 2022 15:21:48 +0530
Message-Id: <20220519095149.3560034-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
References: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This new debugfs will expose the currently using bpc by crtc.
It is very useful for verifying whether we enter the correct
output color depth from IGT.

This patch will also add the connector's max supported bpc to
"i915_display_info" debugfs.

Example:
cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
Current: 8

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 452d773fd4e3..6c3954479047 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -590,6 +590,8 @@ static void intel_connector_info(struct seq_file *m,
 	seq_puts(m, "\tHDCP version: ");
 	intel_hdcp_info(m, intel_connector);

+	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
+
 	intel_panel_info(m, intel_connector);

 	seq_printf(m, "\tmodes:\n");
@@ -2202,6 +2204,29 @@ static const struct file_operations i915_dsc_bpp_fops = {
 	.write = i915_dsc_bpp_write
 };

+/*
+ * Returns the Current CRTC's bpc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
+ */
+static int i915_current_bpc_show(struct seq_file *m, void *data)
+{
+	struct intel_crtc *crtc = to_intel_crtc(m->private);
+	struct intel_crtc_state *crtc_state;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&crtc->base.mutex);
+	if (ret)
+		return ret;
+
+	crtc_state = to_intel_crtc_state(crtc->base.state);
+	seq_printf(m, "Current: %u\n", crtc_state->pipe_bpp / 3);
+
+	drm_modeset_unlock(&crtc->base.mutex);
+
+	return ret;
+}
+DEFINE_SHOW_ATTRIBUTE(i915_current_bpc);
+
 /**
  * intel_connector_debugfs_add - add i915 specific connector debugfs files
  * @connector: pointer to a registered drm_connector
@@ -2272,4 +2297,7 @@ void intel_crtc_debugfs_add(struct drm_crtc *crtc)

 	crtc_updates_add(crtc);
 	intel_fbc_crtc_debugfs_add(to_intel_crtc(crtc));
+
+	debugfs_create_file("i915_current_bpc", 0444, crtc->debugfs_entry, crtc,
+			    &i915_current_bpc_fops);
 }
--
2.35.1

