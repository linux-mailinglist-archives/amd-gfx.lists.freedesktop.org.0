Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ABE1F2134
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jun 2020 23:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377A96E9A0;
	Mon,  8 Jun 2020 21:06:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030826E99F
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:59 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c185so18769619qke.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3lGoCASmqmL0XGiwgCZ6IM26DMk0q5eTR7kt4CPxXww=;
 b=BG19wTK0x5LAh+DAGVfERtOj2MwsfYjUNa05eEj3LkEcCnV2ed/Oa6lxdi42MOkN02
 wdP6DMHAneF9NWov5i5r1CFDOy7hkusEDIaJgnKFxaEHrMUv6EeZHXe2Yyx0uMuSA1Bk
 /FXUh7bKWDuHkLQOikYie/y2e9JZnP+FoSl9f0A1aXxopgbXMFSFucy1aMECnVzm1THG
 jhp55w7SJ+z3yBgMZKwcbfBD+kdKYgapYyevaSZ6fJTVr8KpQeyANibXqhHlRPVHyMci
 myxG8ISvMhiDMO/PyWGsc60TATvNaOLWm1czmQc2kXHcT230sr58ZoGGDkTDrifiwEll
 j/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3lGoCASmqmL0XGiwgCZ6IM26DMk0q5eTR7kt4CPxXww=;
 b=dLAPDPklUqFJf06ONOeCpoCxlHn+vzOo2v4E87RQcd4qwTLrx4Imi5hvyzuLOcCKb7
 OeQvsiT2j8O6Gf/B3k/nzwu5kJKByuxphggASO5C4uXDr7YdJoDaLnupFyTQgHibkMmN
 xvkEj1gqinbFr/HKWO2aY675sI0EqWVp5xnSZGPe1tdW73OEQ8Fw1T0SG/9ILPiLw74r
 mwrjCtKkwKVB2d6sLJam6MRgg2MMuhglWJljM1WxwHCMbNZfhqlPkWxfYcyuh/mztBrM
 l6lrURTeiuRcNIuC3MirMkA6NNQ6sNqgo7LI1city1UyzEAN53o6ZIwx/dVDy4FaJRX8
 EBlg==
X-Gm-Message-State: AOAM531c8sT4JBFnuc9OnSMpcVJMLwIjlow7IStP/Iom5DwY1M+Qxv0Q
 49UUIgMNYNVP0XzOtKUEjDIdmQ==
X-Google-Smtp-Source: ABdhPJw8Jjk7oif/BBxPbHlXuh/tL5TFWd+obsWTrGA596OmBAk4bdIfGNk7j9+0DpB8+KziOP5gVA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr23224008qkj.444.1591650358159; 
 Mon, 08 Jun 2020 14:05:58 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id a27sm8698275qtc.92.2020.06.08.14.05.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:57 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/13] drm/amd: Gate i2c transaction logs on
 drm_debug_syslog
Date: Mon,  8 Jun 2020 17:04:56 -0400
Message-Id: <20200608210505.48519-7-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 ppaalanen@gmail.com, Sean Paul <seanpaul@chromium.org>,
 amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index 9bffbab35041..9bc6baddd302 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -233,7 +233,7 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 	DRM_DEBUG_DRIVER("I2C_Transmit(), address = %x, bytes = %d , data: ",
 		 (uint16_t)address, numbytes);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "data: ", DUMP_PREFIX_NONE,
 			       16, 1, data, numbytes, false);
 	}
@@ -387,7 +387,7 @@ static uint32_t smu_v11_0_i2c_receive(struct i2c_adapter *control,
 	DRM_DEBUG_DRIVER("I2C_Receive(), address = %x, bytes = %d, data :",
 		  (uint16_t)address, bytes_received);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "data: ", DUMP_PREFIX_NONE,
 			       16, 1, data, bytes_received, false);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
