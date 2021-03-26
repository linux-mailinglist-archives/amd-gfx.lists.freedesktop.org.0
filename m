Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0934B07E
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Mar 2021 21:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950D76F4BD;
	Fri, 26 Mar 2021 20:39:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BA96F4B2
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VP0V0L/BTTYQxWaLh1/aw3FlVG9OlwvQO5d3r9G4bEA=;
 b=QbLD1XSPcQLSmAcJbT3Hk9t4BrQndSESXyH74jpK4fIZatNfPIPfcQBg3IfBqnu6/5QRAf
 f3zinsPNnB63pNjsjfbG0EvzXoYZhdVN9anHqXKcpZAonHSqKu0tmSAwxW/H/5vDYT96Q7
 p+KXSrgTc5fq9XIwkz5VJM+Z+ebtUyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503--sRfaVPYMCu6i2Dz4myx3g-1; Fri, 26 Mar 2021 16:39:49 -0400
X-MC-Unique: -sRfaVPYMCu6i2Dz4myx3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C42501E0;
 Fri, 26 Mar 2021 20:39:46 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 776435DAA5;
 Fri, 26 Mar 2021 20:39:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/20] drm/dp_dual_mode: Pass drm_device to
 drm_dp_dual_mode_max_tmds_clock()
Date: Fri, 26 Mar 2021 16:38:00 -0400
Message-Id: <20210326203807.105754-14-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Oliver Barta <oliver.barta@aptiv.com>, Matt Roper <matthew.d.roper@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Another function we need to pass drm_device down to in order to start using
drm_dbg_*().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 include/drm/drm_dp_dual_mode_helper.h     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index a63d7de85309..4a26b3e1f78f 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -252,6 +252,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_detect);
 
 /**
  * drm_dp_dual_mode_max_tmds_clock - Max TMDS clock for DP dual mode adaptor
+ * @dev: &drm_device to use
  * @type: DP dual mode adaptor type
  * @adapter: I2C adapter for the DDC bus
  *
@@ -265,7 +266,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_detect);
  * Returns:
  * Maximum supported TMDS clock rate for the DP dual mode adaptor in kHz.
  */
-int drm_dp_dual_mode_max_tmds_clock(enum drm_dp_dual_mode_type type,
+int drm_dp_dual_mode_max_tmds_clock(const struct drm_device *dev, enum drm_dp_dual_mode_type type,
 				    struct i2c_adapter *adapter)
 {
 	uint8_t max_tmds_clock;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index fdc43f545cad..9c172dd6fb5b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2255,7 +2255,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
 
 	hdmi->dp_dual_mode.type = type;
 	hdmi->dp_dual_mode.max_tmds_clock =
-		drm_dp_dual_mode_max_tmds_clock(type, adapter);
+		drm_dp_dual_mode_max_tmds_clock(&dev_priv->drm, type, adapter);
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "DP dual mode adaptor (%s) detected (max TMDS clock: %d kHz)\n",
diff --git a/include/drm/drm_dp_dual_mode_helper.h b/include/drm/drm_dp_dual_mode_helper.h
index 8cb0dcd98a99..aabf9c951380 100644
--- a/include/drm/drm_dp_dual_mode_helper.h
+++ b/include/drm/drm_dp_dual_mode_helper.h
@@ -106,7 +106,7 @@ enum drm_dp_dual_mode_type {
 
 enum drm_dp_dual_mode_type
 drm_dp_dual_mode_detect(const struct drm_device *dev, struct i2c_adapter *adapter);
-int drm_dp_dual_mode_max_tmds_clock(enum drm_dp_dual_mode_type type,
+int drm_dp_dual_mode_max_tmds_clock(const struct drm_device *dev, enum drm_dp_dual_mode_type type,
 				    struct i2c_adapter *adapter);
 int drm_dp_dual_mode_get_tmds_output(enum drm_dp_dual_mode_type type,
 				     struct i2c_adapter *adapter, bool *enabled);
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
