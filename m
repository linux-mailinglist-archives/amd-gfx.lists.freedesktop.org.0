Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F509DF3EB
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Dec 2024 00:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8A10E3F6;
	Sat, 30 Nov 2024 23:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yE2c93YY";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59C610E5E2
 for <amd-gfx@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:38 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so3513582e87.1
 for <amd-gfx@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010937; x=1733615737; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
 b=yE2c93YYAeCJu2UqCYPH9mvqB4Wu4+9EyosX19xnyeWxzjo7LchC6TAuwWIKMz1GRF
 TFD3GejzzPBxAuapFWRmyLcwIS87F6/INXqsXo5CNRjr7/C8r+qP5Sa43/+IgoCH6m16
 HtL1qVZ4NE8WU+IaKUlZogGoHhyM1MAv1hPfxdAyppVfrtu4w19MfOG0hWOOdVH4T9q9
 vpb7A0tgdr2EJBuKssSGsOBBpcJ1OY85XTgSKCtUAe1xiAIi/kuKw8tR2UqvvmVIWjOW
 p6GBBlsEzRBkSmyWyB+03WD/0icvwTK9/dPkebO4j/92XptQQXEs+4t1t2lBHCzA7xi6
 9iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010937; x=1733615737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
 b=g6k3/InEz7zrHtz4WN0hEmALoaAO2POAXDirCt2t2e0j0mlrUClqEvyYXCwktc5Hm/
 QVqvgWP8ln958kX83CYqDqGDitVjYfb3/GRPeHIf/4blgv4AUzv46eFKjko6IE/wILzu
 9oFGvKE2Dmg2o/Q0osdBIdBXtCkq9oKmmkFDMXUZTBmHTDwY3RhyArW05bOzC3OnHt3C
 V+0zkcYoj8MArJl5wRpy5ce53fdwjlbAYV/BCIT6atcaU2V7mT2lc0pja1TeObJDEFu7
 0c+tvL7NRLFC0If9SqBom9hW8m7x7rLg+h6IDOlLUCUod9z9qCL9TSuqUpZMRE2b5+fv
 60kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9rLFuNsTAVhZ7PYYpTZOQhA+aYOsNVfQHLkBwlrME/mETaDlUJa4baK6olI2vUnyVv1aPfw5k@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3bNqyORE+FK57A7l4/B8L2/aIjFZ0Qy6kATv35B6tOAY4pTkJ
 CZwuJEtGYllMbQ5oITQoa864arPoP0Khvy4MbWfv8WlpzCkxqRu7uV+63ltDfOw=
X-Gm-Gg: ASbGncuGIbL7Yxz59wowj6NzqscLRdnSdEsc59VOEzAZvdXletV0D1ICJ6qYU+vQxeR
 qPdxPPxp+nKZPINOFMEIIzcoOH4dsIwtEK0W6cEond17+B8crFMtOZkE04Ql+TqG6OuTC1uyRta
 UM4gh6F1TUNfMKcz3Ns/FWXVNAHspTPDD6Hc/xycDZBa3gPbRKRh3UcfajaqdKZJ3jx4XV+tyEa
 OGkqbO2T0yl93mreR/3/p1AZIUr79ImSQRjuUeAGOJSO1bXXwSjTFgP+A==
X-Google-Smtp-Source: AGHT+IGcKx3qxr+rKjFg6uN+w/t1xLv8z34zeudztpmb02c9r0uba4ZBSNTSBCZfWNmdHrXgT/XSFQ==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d431:7f3a with SMTP id
 2adb3069b0e04-53df0108f71mr9006077e87.44.1733010936909; 
 Sat, 30 Nov 2024 15:55:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:20 +0200
Subject: [PATCH 03/10] drm/bridge: ite-it66121: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-3-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ze1FOtye6ODMMZl22hb9QRrfAdzUkHN5Ex5hTjwt+GA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt8KExBULQDlnc0kG9cX6l7/Qf0gOZJfErh
 qwvys0sxCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1X53B/9fdxZ832w1hRpbTcoyQFQHmA0ikcvv4VCzfB6ZaFGrG9T+SoyXM0lcIGKSaZczbYgwyYG
 VSyLd0BAxUhrC8MwHfMgp8Y4wCleisRxlVFA1vUdBWDg5Ra1tMCGv5yeTI8xG89vZvV7H1L56LH
 NJTuXCDHoAtdxiJGvpFCcxy/iyg5+gZ/1OqAZ21gCgzFdy4w/2V+gH4ahWa0JjEUHnsqPrt4sw9
 GAq6r6bDqlUd/3uTwG/u/zV5dSLxpZwsGi5tupF0T0d+UKSbAj73ZOj0Mc5cIt2otyZ3ATuZeIK
 E5n0SMo3O3r0wqRpMmCiTAGk3no1OeU6uM+duf39jYehwa8p
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

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1450,8 +1450,10 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 		dev_dbg(dev, "No connector present, passing empty EDID data");
 		memset(buf, 0, len);
 	} else {
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 	mutex_unlock(&ctx->lock);
 

-- 
2.39.5

