Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6E34B09B
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Mar 2021 21:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230B66F4CF;
	Fri, 26 Mar 2021 20:40:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885566F4CA
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjMzh1HvXy7Xkjl8NcwZQHHoP1mJgDV0cr7CXF5/YeA=;
 b=h2GZW7JjmtiA8Psg8bUtVP65EQ3O7Z68+ckJB4uGGWegN4JrnZDyL/cmStwA2SOFkFbKFx
 sfZlps2xRhwGynVAw2whiuFuVj4Ut+F+o/OWR1usZeruBM4Epva/WTgI5PZJBVLqAH65MN
 w8UMpErqlTCYxUPANTirSpdztpXRbQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-buLiS88QN8mEK2lITT3LzQ-1; Fri, 26 Mar 2021 16:40:10 -0400
X-MC-Unique: buLiS88QN8mEK2lITT3LzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23501853024;
 Fri, 26 Mar 2021 20:40:08 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFB5F5DAA5;
 Fri, 26 Mar 2021 20:40:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 18/20] drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c
 to using drm_err/drm_dbg_kms()
Date: Fri, 26 Mar 2021 16:38:05 -0400
Message-Id: <20210326203807.105754-19-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Next step in the conversion, move everything in drm_dp_dual_mode_helper.c
over to using drm_err() and drm_dbg_kms(). This was done using the
following cocci script:

  @@
  expression list expr;
  @@

  (
  - DRM_DEBUG_KMS(expr);
  + drm_dbg_kms(dev, expr);
  |
  - DRM_ERROR(expr);
  + drm_err(dev, expr);
  )

And correcting the indentation of the resulting code by hand.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c | 45 +++++++++++------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index dbf9b1fdec63..9faf49354cab 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_dp_dual_mode_helper.h>
 #include <drm/drm_print.h>
 
@@ -202,8 +203,8 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 	 */
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_HDMI_ID,
 				    hdmi_id, sizeof(hdmi_id));
-	DRM_DEBUG_KMS("DP dual mode HDMI ID: %*pE (err %zd)\n",
-		      ret ? 0 : (int)sizeof(hdmi_id), hdmi_id, ret);
+	drm_dbg_kms(dev, "DP dual mode HDMI ID: %*pE (err %zd)\n",
+		    ret ? 0 : (int)sizeof(hdmi_id), hdmi_id, ret);
 	if (ret)
 		return DRM_DP_DUAL_MODE_UNKNOWN;
 
@@ -221,8 +222,7 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 	 */
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_ADAPTOR_ID,
 				    &adaptor_id, sizeof(adaptor_id));
-	DRM_DEBUG_KMS("DP dual mode adaptor ID: %02x (err %zd)\n",
-		      adaptor_id, ret);
+	drm_dbg_kms(dev, "DP dual mode adaptor ID: %02x (err %zd)\n", adaptor_id, ret);
 	if (ret == 0) {
 		if (is_lspcon_adaptor(hdmi_id, adaptor_id))
 			return DRM_DP_DUAL_MODE_LSPCON;
@@ -238,8 +238,7 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 		 * that we may have misdetected the type.
 		 */
 		if (!is_type1_adaptor(adaptor_id) && adaptor_id != hdmi_id[0])
-			DRM_ERROR("Unexpected DP dual mode adaptor ID %02x\n",
-				  adaptor_id);
+			drm_err(dev, "Unexpected DP dual mode adaptor ID %02x\n", adaptor_id);
 
 	}
 
@@ -286,7 +285,7 @@ int drm_dp_dual_mode_max_tmds_clock(const struct drm_device *dev, enum drm_dp_du
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_MAX_TMDS_CLOCK,
 				    &max_tmds_clock, sizeof(max_tmds_clock));
 	if (ret || max_tmds_clock == 0x00 || max_tmds_clock == 0xff) {
-		DRM_DEBUG_KMS("Failed to query max TMDS clock\n");
+		drm_dbg_kms(dev, "Failed to query max TMDS clock\n");
 		return 165000;
 	}
 
@@ -326,7 +325,7 @@ int drm_dp_dual_mode_get_tmds_output(const struct drm_device *dev,
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_TMDS_OEN,
 				    &tmds_oen, sizeof(tmds_oen));
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to query state of TMDS output buffers\n");
+		drm_dbg_kms(dev, "Failed to query state of TMDS output buffers\n");
 		return ret;
 	}
 
@@ -372,18 +371,17 @@ int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_d
 		ret = drm_dp_dual_mode_write(adapter, DP_DUAL_MODE_TMDS_OEN,
 					     &tmds_oen, sizeof(tmds_oen));
 		if (ret) {
-			DRM_DEBUG_KMS("Failed to %s TMDS output buffers (%d attempts)\n",
-				      enable ? "enable" : "disable",
-				      retry + 1);
+			drm_dbg_kms(dev, "Failed to %s TMDS output buffers (%d attempts)\n",
+				    enable ? "enable" : "disable", retry + 1);
 			return ret;
 		}
 
 		ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_TMDS_OEN,
 					    &tmp, sizeof(tmp));
 		if (ret) {
-			DRM_DEBUG_KMS("I2C read failed during TMDS output buffer %s (%d attempts)\n",
-				      enable ? "enabling" : "disabling",
-				      retry + 1);
+			drm_dbg_kms(dev,
+				    "I2C read failed during TMDS output buffer %s (%d attempts)\n",
+				    enable ? "enabling" : "disabling", retry + 1);
 			return ret;
 		}
 
@@ -391,8 +389,8 @@ int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_d
 			return 0;
 	}
 
-	DRM_DEBUG_KMS("I2C write value mismatch during TMDS output buffer %s\n",
-		      enable ? "enabling" : "disabling");
+	drm_dbg_kms(dev, "I2C write value mismatch during TMDS output buffer %s\n",
+		    enable ? "enabling" : "disabling");
 
 	return -EIO;
 }
@@ -446,7 +444,7 @@ int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	int retry;
 
 	if (!mode) {
-		DRM_ERROR("NULL input\n");
+		drm_err(dev, "NULL input\n");
 		return -EINVAL;
 	}
 
@@ -463,7 +461,7 @@ int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	}
 
 	if (ret < 0) {
-		DRM_DEBUG_KMS("LSPCON read(0x80, 0x41) failed\n");
+		drm_dbg_kms(dev, "LSPCON read(0x80, 0x41) failed\n");
 		return -EFAULT;
 	}
 
@@ -500,7 +498,7 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	ret = drm_dp_dual_mode_write(adapter, DP_DUAL_MODE_LSPCON_MODE_CHANGE,
 				     &data, sizeof(data));
 	if (ret < 0) {
-		DRM_ERROR("LSPCON mode change failed\n");
+		drm_err(dev, "LSPCON mode change failed\n");
 		return ret;
 	}
 
@@ -512,22 +510,21 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	do {
 		ret = drm_lspcon_get_mode(dev, adapter, &current_mode);
 		if (ret) {
-			DRM_ERROR("can't confirm LSPCON mode change\n");
+			drm_err(dev, "can't confirm LSPCON mode change\n");
 			return ret;
 		} else {
 			if (current_mode != mode) {
 				msleep(10);
 				time_out -= 10;
 			} else {
-				DRM_DEBUG_KMS("LSPCON mode changed to %s\n",
-						mode == DRM_LSPCON_MODE_LS ?
-						"LS" : "PCON");
+				drm_dbg_kms(dev, "LSPCON mode changed to %s\n",
+					    mode == DRM_LSPCON_MODE_LS ? "LS" : "PCON");
 				return 0;
 			}
 		}
 	} while (time_out);
 
-	DRM_ERROR("LSPCON mode change timed out\n");
+	drm_err(dev, "LSPCON mode change timed out\n");
 	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL(drm_lspcon_set_mode);
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
