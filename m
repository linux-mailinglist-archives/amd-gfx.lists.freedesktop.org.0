Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BA790432
	for <lists+amd-gfx@lfdr.de>; Sat,  2 Sep 2023 01:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7230410E83D;
	Fri,  1 Sep 2023 23:42:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE14110E83C
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:55 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a751d2e6ecso1715922b6e.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611775; x=1694216575;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKiMaJ+cEDZwLLCxXqIHb+OBndFjgPpn6nuXSf4hrW0=;
 b=lNykkiFAhlsmA8jPi2qSxaIuI76WYWJznmYKJCi1VY6KjszVosPVYePP0GERA264SR
 jr8ZkRg5DtM8kqd+WFIInSKVmX5nFNNA0g0FpA7Cqtf5l69IWPbQR6xMF3Aq9gvZzABZ
 WXczy/FTRVi9FFhkrxrKAnpCzVsPxjK1ceRNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611775; x=1694216575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKiMaJ+cEDZwLLCxXqIHb+OBndFjgPpn6nuXSf4hrW0=;
 b=ge05i8NWsusdpdhjI3GCnoutEktkMunjN3b7aPNVrfH1a+JlEL28R/wuIhxnnkqjrd
 oKQBGQCI8Jb3MeIgC6jhdmvFygFhfmqXuuG27JIvq/g5GNnKEEKSl3UZIJAU5M4MjLZ5
 X1Tb0+9XcDog8ZgBVOKjJdEaxU1bKP8D/o2l1Rjc/LgBdhCFT9SdCVwxr9nIRZAQxHPX
 iNf3t3+nmfRz+voDR2laMu0RROwipfKv1ZeO0svNHDWPXYFiZk3gNtrtwHLw8lf9QGh2
 YNNzJcF31VoyhKbN3/xVWRmddxM2crndWc1mxkk8AWDCYesjj1IPu4f2yeTuOwn/rjUU
 5vbQ==
X-Gm-Message-State: AOJu0YwFyaj6Tp4xhGLJvGIAhMSSe6o62FxnqnLHZ/iFyHGxMaAOXvFt
 cj5Mbz8n6jEF4fm51mbZeGGEXg==
X-Google-Smtp-Source: AGHT+IH3N6oAfydomdv+c+JnkApo3hK8ntxo9o07pRRK+2oRgBVZbVsjJxP7itMUHip6V7XJUK2i9g==
X-Received: by 2002:a54:458e:0:b0:3a8:847e:c5b7 with SMTP id
 z14-20020a54458e000000b003a8847ec5b7mr4071404oib.31.1693611775021; 
 Fri, 01 Sep 2023 16:42:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 14/15] drm/radeon: Call drm_helper_force_disable_all() at
 shutdown/remove time
Date: Fri,  1 Sep 2023 16:41:25 -0700
Message-ID: <20230901164111.RFT.14.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: Xinhui.Pan@amd.com, Douglas Anderson <dianders@chromium.org>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, airlied@gmail.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown(), or in this case the
non-atomic equivalent drm_helper_force_disable_all(), at system
shutdown time and at driver remove time. This is important because
drm_helper_force_disable_all() will cause panels to get disabled
cleanly which may be important for their power sequencing. Future
changes will remove any custom powering off in individual panel
drivers so the DRM drivers need to start getting this right.

The fact that we should call drm_atomic_helper_shutdown(), or in this
case the non-atomic equivalent drm_helper_force_disable_all(), in the
case of OS shutdown/restart comes straight out of the kernel doc
"driver instance overview" in drm_drv.c.

NOTE: in order to get things inserted in the right place, I had to
replace the old/deprecated drm_put_dev() function with the equivalent
new calls.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I honestly have no idea if I got this patch right. The shutdown()
function already had some special case logic for PPC, Loongson, and
VMs and I don't 100% for sure know how this interacts with
those. Everything here is just compile tested.

 drivers/gpu/drm/radeon/radeon_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 39cdede460b5..67995ea24852 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -357,7 +358,9 @@ radeon_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	drm_put_dev(dev);
+	drm_dev_unregister(dev);
+	drm_helper_force_disable_all(dev);
+	drm_dev_put(dev);
 }
 
 static void
@@ -368,6 +371,8 @@ radeon_pci_shutdown(struct pci_dev *pdev)
 	 */
 	if (radeon_device_is_virtual())
 		radeon_pci_remove(pdev);
+	else
+		drm_helper_force_disable_all(pci_get_drvdata(pdev));
 
 #if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
 	/*
-- 
2.42.0.283.g2d96d420d3-goog

