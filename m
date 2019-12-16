Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4A121195
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Dec 2019 18:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E659A6E844;
	Mon, 16 Dec 2019 17:18:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9F6E842
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2019 17:18:47 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c16so2083482qko.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2019 09:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fpKAg7/41AO2LunV4ssoKruVVkoNFZaPuS9W4xrYVY=;
 b=R/M6F4qRnXzwbMq0dil42pTSMOxIMaTTjjb+6UH4MqIve9PZ2cyuWqFG8gVI3hW+Bu
 V3L2tsJn3cDY49/VvfYBH6oIOQn99Gc5ltQMfV3RLq4dpGSWZnUJAhXvaPLR76BuKdUb
 KGuetm4bGQvFfbRAjYsw3phm29ZTO1fERfHTv/EajRRoHGZm7PmrIqZOwHWGPhmiAo39
 F20BpLGBdf4c2EBw1pqr3lBs5jbtUYfUkBZM1RycQ+Y68R4SltLX2iyTzxd/nNipjrlu
 dJDu+MaQajMQIXLyZTr/b25D7uLY9zA1IJh+5Q1ZLTS/wJPSPiQ2l+7R1kypYkjCF2WS
 sGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fpKAg7/41AO2LunV4ssoKruVVkoNFZaPuS9W4xrYVY=;
 b=AG1SUwM1YBx/N0g14q0kmeIY8hgdnRdxHAMPTT8KiCV1KbbXnjdNCpfar2o2ZsMwjd
 Ij1ZWPPGuyk7vnLFmfLPSHqwgpimMlX/IvkHEQhgQ0Hp/m+rtRJzv6HBOBV0UL8WTXra
 sv9ykBFjuIAmjIUXJTtiynNo0vTHhlnIH+OVVgLCSBl/3HR7NJIr9E3Q15Y+nR3bHpHL
 fGdiNFf/bEvLxMFqfoMMdn0nFjBvXnIoAO188xeOcTOz82etsn7ngys3OwMT46REUKAU
 VEDnOX9lOPKS6xmSjTNur7B4xVrNZoiZOTgPC8aI2ZJHMjj20ltDRrOE3qj2tC+HvkCG
 h+sg==
X-Gm-Message-State: APjAAAXIjVOhZnfg8kbSbiLRpHJshSobPzOrKc15zbFf186brPMrmEot
 7mLlStwtwRzhbooCB6EXQe1T8R20
X-Google-Smtp-Source: APXvYqwuN+B2AQSmTy2K0JjGr6Twl+jWgWhnMPTeUWt7oshccZ2RTvIv00QmbyfVtiKgHWtfjrN2LQ==
X-Received: by 2002:a05:620a:1114:: with SMTP id
 o20mr369061qkk.128.1576516725222; 
 Mon, 16 Dec 2019 09:18:45 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id k50sm7219291qtc.90.2019.12.16.09.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 09:18:44 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: wait for all rings to drain before runtime
 suspending
Date: Mon, 16 Dec 2019 12:18:32 -0500
Message-Id: <20191216171834.217251-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add a safety check to runtime suspend to make sure all outstanding
fences have signaled before we suspend.  Doesn't fix any known issue.

We already do this via the fence driver suspend function, but we
just force completion rather than bailing.  This bails on runtime
suspend so we can try again later once the fences are signaled to
avoid missing any outstanding work.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d1e9946ac218..61dc26515c7e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1214,13 +1214,23 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	struct amdgpu_device *adev = drm_dev->dev_private;
-	int ret;
+	int ret, i;
 
 	if (!adev->runpm) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
 
+	/* wait for all rings to drain before suspending */
+	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
+		struct amdgpu_ring *ring = adev->rings[i];
+		if (ring && ring->sched.ready) {
+			ret = amdgpu_fence_wait_empty(ring);
+			if (ret)
+				return -EBUSY;
+		}
+	}
+
 	if (amdgpu_device_supports_boco(drm_dev))
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 	drm_kms_helper_poll_disable(drm_dev);
-- 
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
