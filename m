Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ACD48E836
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jan 2022 11:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CE310E3FE;
	Fri, 14 Jan 2022 10:18:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C0510E459
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 10:18:31 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so13770215pjp.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 02:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBKQ4CufOeLqIoTmEy7ZkjqAF1a5b4cdB+1/usiOdF4=;
 b=nhuNT672TAKKaxjafFtomSOLi7rPNQ05WXsrh2uZBnqtC6HSA2tIyIAoTB48UaD4hW
 Xk0s8xM3Yi2J30dre8rzL2SOhLxPiT5WH6by3XU0VNCrrp11TATEpsHyBWai0GlXIq8Y
 ymBDV76aSXJeHn/eN51cW1gbu9OR7JfoMXo2XcQpCinYOx6UlyvHuU1tiFGV+lYOuvyS
 ZnL8kvFACfkqxZbKnbpzemSdR1SuIPgezL84EOFCgMOmoUYzzGHWZaA/VpMIue04MFj/
 n4cm42R48991eaclKg1A0OuW173xxarBGFm48NJeU8TdH1DY0GxKVMgRxidKS5oyCxvc
 /JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBKQ4CufOeLqIoTmEy7ZkjqAF1a5b4cdB+1/usiOdF4=;
 b=fIEyBIvvX0GgXvswZ+R4zVPEh1HogUKQ6cZOCCxW8c5MlT1iYTCm68xNv/klKBW+A4
 oKAQ+NqTCTCoi49YddlYa+JHltnj7gQmYK6zjDrcck0KL3JQwnOPKQ7gA147R9TENCoZ
 fWZKK4JovW64s6xOYPWsDvRDiNYSMoJIPGSMqugBEgLI6p+8KD608OErRuaMeFa9TOD2
 Mm83C67UQTW7IXfL+Cq6RtRFsU2dmZPiMH35K2u86Zg8Zer4cPyn8JC5J5QMgMCIyakV
 ZrWx50Wnewph683i/C3V6qUsi/h8CxHRkO3Nqhxh+TWJ/poxZBl3CGqjwfLCmCrd/5px
 WkAQ==
X-Gm-Message-State: AOAM530bE/EvCBHbimdrfu8DQopdp/4WolHEEJfRe/VSaUJ9DyG7Vegu
 QuDuUAVpFNEvg8JuOnMJauGF8Q==
X-Google-Smtp-Source: ABdhPJwCXCok9Tnnj36jd/hBgwqx96J9Uuhal8x4cOAflq2B6/Quel6WNHnMh7YjhlAAQhJePR4ZRQ==
X-Received: by 2002:a17:902:c94c:b0:14a:7ad9:8067 with SMTP id
 i12-20020a170902c94c00b0014a7ad98067mr7949307pla.104.1642155511426; 
 Fri, 14 Jan 2022 02:18:31 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id 13sm5555970pfm.161.2022.01.14.02.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:18:30 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 3/3] drm: remove allow_fb_modifiers
Date: Fri, 14 Jan 2022 19:17:53 +0900
Message-Id: <20220114101753.24996-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114101753.24996-1-etom@igel.co.jp>
References: <20220114101753.24996-1-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Tomohito Esaki <etom@igel.co.jp>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The allow_fb_modifiers flag is unnecessary since it has been replaced
with cannot_support_modifiers flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/drm_plane.c                      |  9 ---------
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
 include/drm/drm_mode_config.h                    | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 5aa7e241971e..89a3d044ab59 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -288,15 +288,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		}
 	}
 
-	/* autoset the cap and check for consistency across all planes */
-	if (format_modifier_count) {
-		drm_WARN_ON(dev, !config->allow_fb_modifiers &&
-			    !list_empty(&config->plane_list));
-		config->allow_fb_modifiers = true;
-	} else {
-		drm_WARN_ON(dev, config->allow_fb_modifiers);
-	}
-
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
 					 sizeof(format_modifiers[0]),
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 61b44d3a6a61..f6d66285c5fc 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
@@ -323,7 +323,6 @@ static struct drm_device mock_drm_device = {
 		.max_width = MAX_WIDTH,
 		.min_height = MIN_HEIGHT,
 		.max_height = MAX_HEIGHT,
-		.allow_fb_modifiers = true,
 		.funcs = &mock_config_funcs,
 	},
 };
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index da82f45351c7..5001bda9f9af 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -917,22 +917,6 @@ struct drm_mode_config {
 	 */
 	bool async_page_flip;
 
-	/**
-	 * @allow_fb_modifiers:
-	 *
-	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
-	 * Note that drivers should not set this directly, it is automatically
-	 * set in drm_universal_plane_init().
-	 *
-	 * IMPORTANT:
-	 *
-	 * If this is set the driver must fill out the full implicit modifier
-	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
-	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
-	 * broken for modifier aware userspace.
-	 */
-	bool allow_fb_modifiers;
-
 	/**
 	 * @fb_modifiers_not_supported:
 	 *
-- 
2.25.1

