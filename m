Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A197905E81
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2024 00:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D055610E931;
	Wed, 12 Jun 2024 22:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CL1Sdwc7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BD110E931
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2024 22:28:42 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1f44b45d6abso3470415ad.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2024 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231322; x=1718836122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/jWWU1pq804c3ou2ews3riGNTGElQFQ1wAS5cHqZxA=;
 b=CL1Sdwc7x4iD/dvwaI/nUYtWyd5Sek3vn6LCVQ84wzWJXrgKpC47jEvoNgjAcqJoA2
 xAHjnyMc+zeDzoPn2sWaJanppASjpRkvjdLhGSLwIbJWk+UsPPozmenE5YlV74/sx0hh
 1UnqiL1b0KNcvmso3Gt/V3W8/zGoWwjBbyUkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231322; x=1718836122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/jWWU1pq804c3ou2ews3riGNTGElQFQ1wAS5cHqZxA=;
 b=FckiHpdzpfcEyxR5VQ7dvHV8iCPksMn0nQ5TiQPfSS5NZUxbGQRhavNP7exmA/esa8
 jvgTs9VBSkDstt0WgizApv36LyTXlxZrJIlUOzhsjNQNJN7vTedvturEdJOcfmV++M/P
 YJKwJd/KiaLJbrm4lpLn7+kHzd6lSjRWlKy4EDJkHMPxZfQ6zALl7fufRCVo2nVR5pxu
 B4zs5lO7nxFftjt1ZNuw78QS4rWIj5gZJJKAP/EkYocMn1XXnd8wsDvN41iYS/jrivyQ
 H2rWDkqGvlC2QjGaAHqoSagnoL5sVNMlVklFCLOmqIzugaFsNcEFM8OJ3iqBNz6TZRHV
 CN+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnQ8ydrR3N1OIHLO1KaQK5TVm8CxhCA4i7NIfGjiZrJUsb7uAO0OnC7z92MHnoLOVvoA0gK5kf/CRIAJQiefuWnothABZl5f2+wgKr+Q==
X-Gm-Message-State: AOJu0YxfUJ1kLPMOsuyF0IbRLkwr0oxXLM4w+KQrtb4+qMO9+i6cNd/2
 9tRtWYjqXYA5ZnfgIW5qFHfLI+zI1m7s+FfiIHGvBpiKHscVmE1ZvwIkPPiXUw==
X-Google-Smtp-Source: AGHT+IF/TlcvLXIfZfu54yCkggfRcKPb4J9ZvGiYz9EXPf3MwPKKQhOCuUiLPrDC9MOJJ/dvVbiIOQ==
X-Received: by 2002:a17:903:234a:b0:1f7:187f:cb5b with SMTP id
 d9443c01a7336-1f83b7f5871mr39623195ad.64.1718231321795; 
 Wed, 12 Jun 2024 15:28:41 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f336d172sm87788575ad.247.2024.06.12.15.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:28:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] drm/radeon: Call drm_helper_force_disable_all() at
 shutdown/remove time
Date: Wed, 12 Jun 2024 15:28:03 -0700
Message-ID: <20240612152752.v2.7.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I honestly have no idea if I got this patch right. The shutdown()
function already had some special case logic for PPC, Loongson, and
VMs and I don't 100% for sure know how this interacts with
those. Everything here is just compile tested.

(no changes since v1)

 drivers/gpu/drm/radeon/radeon_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..9ea7f163a731 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -330,7 +331,9 @@ radeon_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	drm_put_dev(dev);
+	drm_dev_unregister(dev);
+	drm_helper_force_disable_all(dev);
+	drm_dev_put(dev);
 }
 
 static void
@@ -341,6 +344,8 @@ radeon_pci_shutdown(struct pci_dev *pdev)
 	 */
 	if (radeon_device_is_virtual())
 		radeon_pci_remove(pdev);
+	else
+		drm_helper_force_disable_all(pci_get_drvdata(pdev));
 
 #if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
 	/*
-- 
2.45.2.505.gda0bf45e8d-goog

