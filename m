Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D573B85EB
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Jun 2021 17:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877366EA0B;
	Wed, 30 Jun 2021 15:10:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45956EA0B;
 Wed, 30 Jun 2021 15:10:27 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id A015EC80092;
 Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id uccg5-uZn6fh; Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 38968C80085;
 Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 06/17] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
Date: Wed, 30 Jun 2021 17:10:07 +0200
Message-Id: <20210630151018.330354-7-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630151018.330354-1-wse@tuxedocomputers.com>
References: <20210630151018.330354-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add a new general drm property "active color format" which can be used by
graphic drivers to report the used color format back to userspace.

There was no way to check which color format got actually used on a given
monitor. To surely predict this, one must know the exact capabilities of
the monitor, the GPU, and the connection used and what the default
behaviour of the used driver is (e.g. amdgpu prefers YCbCr 4:4:4 while i915
prefers RGB). This property helps eliminating the guessing on this point.

In the future, automatic color calibration for screens might also depend on
this information being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_connector.c | 63 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  9 +++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 6461d00e8e49..075bdc08d5c3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -889,6 +889,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
 };
 
+static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
+	{ 0, "not applicable" },
+	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
+	{ DRM_COLOR_FORMAT_YCRCB444, "ycbcr444" },
+	{ DRM_COLOR_FORMAT_YCRCB422, "ycbcr422" },
+	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
+};
+
 DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
 		 drm_dp_subconnector_enum_list)
 
@@ -1206,6 +1214,15 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	Drivers shall use drm_connector_attach_active_bpc_property() to install
  *	this property. A value of 0 means "not applicable".
  *
+ * active color format:
+ *	This read-only property tells userspace the color format actually used
+ *	by the hardware display engine "on the cable" on a connector. The chosen
+ *	value depends on hardware capabilities, both display engine and
+ *	connected monitor. Drivers shall use
+ *	drm_connector_attach_active_color_format_property() to install this
+ *	property. Possible values are "not applicable", "rgb", "ycbcr444",
+ *	"ycbcr422", and "ycbcr420".
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2205,6 +2222,52 @@ void drm_connector_set_active_bpc_property(struct drm_connector *connector, int
 }
 EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
 
+/**
+ * drm_connector_attach_active_color_format_property - attach "active color format" property
+ * @connector: connector to attach active color format property on.
+ *
+ * This is used to check the applied color format on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_active_color_format_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->active_color_format_property) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "active color format",
+						drm_active_color_format_enum_list,
+						ARRAY_SIZE(drm_active_color_format_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->active_color_format_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_active_color_format_property);
+
+/**
+ * drm_connector_set_active_color_format_property - sets the active color format property for a
+ * connector
+ * @connector: drm connector
+ * @active_color_format: color format for the connector currently active "on the cable"
+ *
+ * Should be used by atomic drivers to update the active color format over a connector.
+ */
+void drm_connector_set_active_color_format_property(struct drm_connector *connector,
+						    u32 active_color_format)
+{
+	drm_object_property_set_value(&connector->base, connector->active_color_format_property,
+				      active_color_format);
+}
+EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
+
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index eee86de62a5f..8a5197f14e87 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1386,6 +1386,12 @@ struct drm_connector {
 	 */
 	struct drm_property *active_bpc_property;
 
+	/**
+	 * @active_color_format_property: Default connector property for the
+	 * active color format to be driven out of the connector.
+	 */
+	struct drm_property *active_color_format_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -1710,6 +1716,9 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
 void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
+int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
+void drm_connector_set_active_color_format_property(struct drm_connector *connector,
+						    u32 active_color_format);
 
 /**
  * struct drm_tile_group - Tile group metadata
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
