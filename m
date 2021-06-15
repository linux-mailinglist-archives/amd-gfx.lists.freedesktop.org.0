Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA733A8256
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Jun 2021 16:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15396E42C;
	Tue, 15 Jun 2021 14:14:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8466E332;
 Tue, 15 Jun 2021 14:14:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id E18C2C800BA;
 Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id UpiFaJekt_VD; Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3949009F7CF2Abd5Da2787.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:9f7c:f2ab:d5da:2787])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 6A7CEC800B5;
 Tue, 15 Jun 2021 16:14:38 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 12/14] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
Date: Tue, 15 Jun 2021 16:14:23 +0200
Message-Id: <20210615141426.6001-13-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615141426.6001-1-wse@tuxedocomputers.com>
References: <20210615141426.6001-1-wse@tuxedocomputers.com>
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

Add a new general drm property "preferred color format" which can be used by
userspace to tell the graphic drivers to which color format to use.

Possible options are:
    - auto (default/current behaviour)
    - rgb
    - ycbcr444
    - ycbcr422 (not supported by both amdgpu and i915)
    - ycbcr420

In theory the auto option should choose the best available option for the
current setup, but because of bad internal conversion some monitors look better
with rgb and some with ycbcr444.

Also, because of bad shielded connectors and/or cables, it might be preferable
to use the less bandwidth heavy ycbcr422 and ycbcr420 formats for a signal that
is less deceptible to interference.

In the future, automatic color calibration for screens might also depend on this
option being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
 drivers/gpu/drm/drm_connector.c     | 46 ++++++++++++++++++++++++++++-
 include/drm/drm_connector.h         | 17 +++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5..90d62f305257 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -687,6 +687,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->preferred_color_format !=
+			    new_connector_state->preferred_color_format)
+				new_crtc_state->connectors_changed = true;
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 438e9585b225..c536f5e22016 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -796,6 +796,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 						   fence_ptr);
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
+	} else if (property == connector->preferred_color_format_property) {
+		state->preferred_color_format = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -873,6 +875,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->preferred_color_format_property) {
+		*val = state->preferred_color_format;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b4aff7d6910f..1dc537514c71 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -889,6 +889,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
 };
 
+static const struct drm_prop_enum_list drm_preferred_color_format_enum_list[] = {
+	{ 0, "auto" },
+	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
+	{ DRM_COLOR_FORMAT_YCRCB444, "ycbcr444" },
+	{ DRM_COLOR_FORMAT_YCRCB422, "ycbcr422" },
+	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
+};
+
 static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
 	{ 0, "unknown" },
 	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
@@ -1219,11 +1227,19 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	Drivers shall use drm_connector_attach_active_bpc_property() to install
  *	this property.
  *
+ * preferred color format:
+ *	This property is used by userspace to change the used color format. When
+ *	used the driver will use the selected format if valid for the hardware,
+ *	sink, and current resolution and refresh rate combination. Drivers to
+ *	use the function drm_connector_attach_preferred_color_format_property()
+ *	to create and attach the property to the connector during
+ *	initialization.
+ *
  * active color format:
  *	This read-only property tells userspace the color format actually used
  *	by the hardware display engine on "the cable" on a connector. The chosen
  *	value depends on hardware capabilities, both display engine and
- *	connected monitor. Drivers shall use
+ *	connected monitor, and the "preferred color format". Drivers shall use
  *	drm_connector_attach_active_color_format_property() to install this
  *	property.
  *
@@ -2232,6 +2248,34 @@ void drm_connector_set_active_bpc_property(struct drm_connector *connector, int
 }
 EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
 
+/**
+ * drm_connector_attach_preferred_color_format_property - attach "preferred color format" property
+ * @connector: connector to attach active color format property on.
+ *
+ * This is used to add support for selecting a color format on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->preferred_color_format_property) {
+		prop = drm_property_create_enum(dev, 0, "preferred color format", drm_preferred_color_format_enum_list, ARRAY_SIZE(drm_preferred_color_format_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->preferred_color_format_property = prop;
+		drm_object_attach_property(&connector->base, prop, 0);
+		connector->state->preferred_color_format = 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_preferred_color_format_property);
+
 /**
  * drm_connector_attach_active_color_format_property - attach "active color format" property
  * @connector: connector to attach active color format property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5cb122812727..e52e0d2c3c4e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -799,6 +799,16 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/**
+	 * preferred_color_format: Property set by userspace to tell the GPU
+	 * driver which color format to use. It only gets applied if hardware,
+	 * meaning both the computer and the monitor, and the driver support the
+	 * given format at the current resolution and refresh rate. Userspace
+	 * can check for (un-)successful application via the active_color_format
+	 * property.
+	 */
+	u32 preferred_color_format;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1404,6 +1414,12 @@ struct drm_connector {
 	 */
 	struct drm_property *active_bpc_property;
 
+	/**
+	 * @preferred_color_format_property: Default connector property for the
+	 * preferred color format to be driven out of the connector.
+	 */
+	struct drm_property *preferred_color_format_property;
+
 	/**
 	 * @active_color_format_property: Default connector property for the
 	 * active color format to be driven out of the connector.
@@ -1740,6 +1756,7 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
 void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector);
 int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
 void drm_connector_set_active_color_format_property(struct drm_connector *connector, u32 active_color_format);
 int drm_connector_attach_active_color_range_property(struct drm_connector *connector);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
