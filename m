Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C59F1EDC
	for <lists+amd-gfx@lfdr.de>; Sat, 14 Dec 2024 14:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9B10E341;
	Sat, 14 Dec 2024 13:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ofCGCaze";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EE210E31B
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Dec 2024 13:37:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so4127857e87.1
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Dec 2024 05:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734183437; x=1734788237; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wdwpibg0RRPk6EpwAQK84EDSpk8VUe5onS1+M5umUds=;
 b=ofCGCazeaws9lCSazFEGj9ApEUu/9WldMwn9YdjJyLGrpb/v6f9fHwextuQWg9+mYe
 ntQjxwbUaUWBRLFAKRwVbj7OlzDKlV76ZGcCQOkxKcQA6pScGwzB9OLkvdADRdV1Inph
 7agXlFSlozivnbfHCZAqXNaqqwUP+O96zl23ZQOc+j1t7YgycNjUd/RsBmRsbcrf2UHo
 Oxsx9eB+1l7AvbbvW9EyaAmJ6OCyOaPo3sYOroh0SyHGq+V9QAZlaL5Gz025eRgSaTcg
 dg01uv2XwURLI9dUGZMYnnsLMrZvog00wdMOsaVM6j9IyY3v3R2ZR0FHF5eiT+jLdC51
 00yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734183437; x=1734788237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdwpibg0RRPk6EpwAQK84EDSpk8VUe5onS1+M5umUds=;
 b=raBPNJqexY/GMhmwJ2ehUUcbFW0k0sH1c/a5rG4oCpF9D2NmWL4rTskRwVdIo7ydNY
 GRrxPzSx2h4cu3CfjUs9ZLqv75+exXPxfUGcdr44Xss8V0gpzTP0xak5veEu7IR4aoAE
 Dwn4fJv8E/BwkCTHWvJlaMrxC5vQsynXElYIDavKypMz6HP50qW+a56mbkeOD9Ywtgrb
 WhQRE9FOpoyREQIbdV9C4FS4tI62wZBC/3T7t7aOCyo9mKgGLneCyk3yEc8tFNganM+F
 vRlfLbbXSjqD7Lyz0Pel30jWpRcNzyVF2a6LUHgog3UdGiBBykXJbCaM1/rKjSDlhgCB
 cKwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fw5RWUqqlOC45YvT7iPtntmMbOmVV3fzdyloIx6YcB5qkK30R1nFv3fRglilVqYGTHLHAdoB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdNiyg6Uobvlt4FlsP7yEGSbgIvh9Yh4jYzd8VasuYj9h9PrhC
 3gX2CVfz6Ib32iQ4+VKXiYYs4v+auxIpoC0QAlNivW3x+NnqCWKmrjHv+vk4EhM=
X-Gm-Gg: ASbGnct/W7DIPoQ99Uyqswm8FafDeUgFWZWD+3lAvw4dqOaBjQikxLo+xAMYzR3IGH8
 2VX8+6Enl3Q4gAE1mRFlNC5Jd8rp5A4NB/zaSXWvKDM5xtnrken8XtHQ6zQOeh5RyliOiqzCZHC
 PIZxYfjPxdI2cWF6dopV6Pnb0YtsLoYrQF/E2geeJp+ei1ws1qeyJCwbY2/ulQCWEHT1BrLMWmm
 MrHAS2yfpHaJmTPmhnxipyXZi0IDbTMT2O3imDGKS7TY+JHlpMso4hJHSm+0R9x
X-Google-Smtp-Source: AGHT+IFDFHsf0YSq3F9U24ZzRaZqLHjwAZuUnskSeXvaHoyC4Tfjr1H/Oi+lGDIZJQoDaEfr8W2dtQ==
X-Received: by 2002:a05:6512:1591:b0:540:20c5:f847 with SMTP id
 2adb3069b0e04-5408ad76276mr1606863e87.22.1734183436550; 
 Sat, 14 Dec 2024 05:37:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 05:37:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 15:37:06 +0200
Subject: [PATCH v2 2/5] drm/amdgpu: don't change mode in
 amdgpu_dm_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-drm-connector-mode-valid-const-v2-2-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZBQ31V6liiRq6vidYEbRih6I4hmj1n9WetjDV7X3pNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoEN8DdEbQT15+majQu+ePNp1xNEKgZhouhG
 e8cSSkRWPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KBAAKCRCLPIo+Aiko
 1bo9CACKI34mpGW7I5SEIWTnqccfI1E5Dtim4SK/n6/h7bhcZ4fIdi1jPZNDeFfoInJlcQC8kND
 J2yGE2Waz+dJVLeD9HrrAIss+FWiq5KGvzYWgYBmjLuJJCE3PKkqoV+6+sFD44LUIBLxdTRdh6F
 1T4gKfvqmlDPQFnUhlG3DwphgtSkVOEHHExB8YC0ysIBaeNXz7rClOEu0mGlIZuDjJS/sjgrall
 atWiYOaDofYW+7dTZ9u0SDpxMVllsbKKomyCy6kf/BSVOIp9veKIrgbybIWQXyNIZgk95KFTa4/
 BfCF2//Diwl9V4b6EJ2CMV1tWTpGoVbvzyIZV/xfq0Bc89tB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Make amdgpu_dm_connector_mode_valid() duplicate the mode during the
test rather than modifying the passed mode. This is a preparation to
converting the mode_valid() callback of drm_connector to take a const
struct drm_display_mode argument.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5a503104e38d1514103914a4d012969105877e52..0d9d2e1c4b4fd48baa19f16fb832a9ce5ed09108 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7420,6 +7420,7 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 {
 	int result = MODE_ERROR;
 	struct dc_sink *dc_sink;
+	struct drm_display_mode *test_mode;
 	/* TODO: Unhardcode stream count */
 	struct dc_stream_state *stream;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
@@ -7444,11 +7445,16 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	drm_mode_set_crtcinfo(mode, 0);
+	test_mode = drm_mode_duplicate(connector->dev, mode);
+	if (!test_mode)
+		goto fail;
+
+	drm_mode_set_crtcinfo(test_mode, 0);
 
-	stream = create_validate_stream_for_sink(aconnector, mode,
+	stream = create_validate_stream_for_sink(aconnector, test_mode,
 						 to_dm_connector_state(connector->state),
 						 NULL);
+	drm_mode_destroy(connector->dev, test_mode);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;

-- 
2.39.5

