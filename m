Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F49767D3B
	for <lists+amd-gfx@lfdr.de>; Sat, 29 Jul 2023 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758210E0DA;
	Sat, 29 Jul 2023 08:41:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1D10E7B2
 for <amd-gfx@lists.freedesktop.org>; Sat, 29 Jul 2023 00:49:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so4624449e87.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jul 2023 17:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690591756; x=1691196556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YW+vdrPDM+RdVg71eRxchKCcF3Il7t8mgNv0e+r+q2g=;
 b=xbQCDRAAiTnRqvox2bcIt4oxrXiYymd8UqsOCvmuKhvZOr8APVzW3956/nnW/arxhy
 9bYPRQww95RD/53CrRVkzlmNVRikim+c5eGIk0E74b/aPgRCGC9qZyyGvEf8qhOCJwzC
 UiVueEM5x6nMqvWK6JLngSHi11HdNjD8rS7P9YFnWczDI5xZCiUM9ADDh1BeoM8hgWkX
 npjhO1DPncPj4dS76lDD3XD+9jhimJz4ylm8bKGISwM69fl8fmvBeYd7QHkyfkVNB9+L
 tUO267/J9Alg+Aoqk2+nCD3BpfSpqhvpf+uIJ0hpcBByBjgGc2snRfLTgjlEjgtlT+3r
 WCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690591756; x=1691196556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YW+vdrPDM+RdVg71eRxchKCcF3Il7t8mgNv0e+r+q2g=;
 b=Frt6OeBZJ9PmK4FN4n+a3XHRI8xhF3yNTsLOVVw0R/veHI4Dx0rM3Dl5qf8CP7xPZz
 5sYAI1YdgZRlfYS49djIArNliXED0Oh4G/Wq/6EhDaFL7Hly3mvGoR/rN/jwQKJnERyK
 GLaXlPo1BTNrzikXL98Xec2GCLQnAzAQZmmgroLJ/xKvZByrRPUpFHEvIR8Qnslgid4R
 Q5JPr/FaWurwJmzsAHt55E1cgplRrb9mrViirGfKaU5g0P2KSF/2C+f14e+H3OUaFwV1
 VghqQ4Sfa96jM0942vkyIZOGClxBAX5UfIxsPCxQhf5zWDxQ0o2c+Cyog8Sn/EXI1I0A
 Qvgw==
X-Gm-Message-State: ABy/qLbRkih3rQYCXmARGFxR1/iEwhKdZ9GMKxLu8hhToREBcm+pvVEX
 VWySxuCUw+Ny1eoBODiEqkfC+w==
X-Google-Smtp-Source: APBJJlHxkNkwO/iPuYTiXx1h0xuPIgYhC0FuY/A0rwJ8a+n7wJCY6wfeH1lslHO85cVzE3F+Zwgqog==
X-Received: by 2002:a19:915c:0:b0:4f8:711b:18b0 with SMTP id
 y28-20020a19915c000000b004f8711b18b0mr2325597lfj.3.1690591756020; 
 Fri, 28 Jul 2023 17:49:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a19f818000000b004fe20d1b288sm500702lff.159.2023.07.28.17.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 17:49:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Simon Ser <contact@emersion.fr>,
 Janne Grunau <j@jannau.net>
Subject: [PATCH 2/4] drm/bridge-connector: handle subconnector types
Date: Sat, 29 Jul 2023 03:49:11 +0300
Message-Id: <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jul 2023 08:41:52 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

If the created connector type supports subconnector type property,
create and attach corresponding it. The default subtype value is 0,
which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 33 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h               |  4 ++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 07b5930b1282..a7b92f0d2430 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -329,7 +329,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	enum drm_mode_subconnector subconnector;
 	int connector_type;
+	int ret;
 
 	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
@@ -365,8 +367,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (!drm_bridge_get_next_bridge(bridge)) {
 			connector_type = bridge->type;
+			subconnector = bridge->subtype;
+		}
 
 #ifdef CONFIG_OF
 		if (!drm_bridge_get_next_bridge(bridge) &&
@@ -399,6 +403,33 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_dp_subconnector_property(connector, subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
+		ret = drm_mode_create_dvi_i_properties(drm);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.dvi_i_subconnector_property,
+					   subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_TV) {
+		ret = drm_mode_create_tv_properties(drm,
+						    BIT(DRM_MODE_TV_MODE_NTSC) |
+						    BIT(DRM_MODE_TV_MODE_NTSC_443) |
+						    BIT(DRM_MODE_TV_MODE_NTSC_J) |
+						    BIT(DRM_MODE_TV_MODE_PAL) |
+						    BIT(DRM_MODE_TV_MODE_PAL_M) |
+						    BIT(DRM_MODE_TV_MODE_PAL_N) |
+						    BIT(DRM_MODE_TV_MODE_SECAM));
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.tv_subconnector_property,
+					   subconnector);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bf964cdfb330..68b14ac5ac0d 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -739,6 +739,10 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
+	 */
+	enum drm_mode_subconnector subtype;
 	/**
 	 * @interlace_allowed: Indicate that the bridge can handle interlaced
 	 * modes.
-- 
2.39.2

