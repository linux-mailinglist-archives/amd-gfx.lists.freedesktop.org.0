Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FD119AAD
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2019 23:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E26E9A4;
	Tue, 10 Dec 2019 22:08:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060846E9A4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2019 22:08:14 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id n8so4858411qvg.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2019 14:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU9AyQXxv6dwQw1RwcEzSWoq1q5Vy0/cDTIKOFHyr/Q=;
 b=Lj28KlThckbVKFtN9qtJdioFRnjeiMXIatk8PKy5oPym+kGDjmShFn/CxTuOLQKtM7
 bDI0omtLkAniGZ3IMWB9t/0tygc/dHFf9r/8LPWdsrqxJ8TLA04z/SQ0QvPax3Hbe64U
 Pv3r9zsXKt5DVmhDego5RIU/yTTXRwxZ/1CysB0yIBWCBLqs0YFJ7jENPjP0gv9bLWRm
 UpeNrg9v3ahNZb/bUjBsirrkqpII0+CWVAwCgY7GJdfi+BZWrc+GEZUaiW960c48N8oN
 X8tPoES7bTx7xrHoADFP5nribxgm9IlmODgI3n0zRGRrIW30++/eNT37AvIdepWxGZiu
 K9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU9AyQXxv6dwQw1RwcEzSWoq1q5Vy0/cDTIKOFHyr/Q=;
 b=A9aaZjvYWOyVFmmjj/OGllB/Gps8wV5wxbn5hLTmwA4RINT6FExF2KZnBVMQzZhNvW
 V7M2dwLEsNgH6p2U5rFZlrkDAgE0uDpNb0BHMj7uIsbRfqh7mVKt1NRCxuXlcvmci9cu
 fOyHK2mNh7aG2bpccAjE7ilgBGakHRAumqtYxL5tUkltJTD0Bc+2yl/1p0809EgWezfw
 tK4uTG0v+iZf5wLzfkdGOTbYEzfBbnqpHA+dctmhj6LLKRFgs28nlPDDklMmhijTT6uj
 TaGHTR/lkwPiHjjLCQmVKfUJG9UyTYAm3LF2LfylaJFt/w5mBU9VqYQg5bCJw9+R/u6d
 Doiw==
X-Gm-Message-State: APjAAAWYsAO1VMBYjcy5ldSGw2wCX6DIjvbRz13pxgA/nbRTSzKSsESo
 oPIBfKMrij4gHs+AbcGQ74bqO14Z
X-Google-Smtp-Source: APXvYqwpVQzsAsmY6sCgBWyOprHhQK+Bp4GGHy5Y8Rqzn2Dz1lAEiGHoAYBBktgZdTJLy+tN0EdHhQ==
X-Received: by 2002:ad4:4b6e:: with SMTP id m14mr149710qvx.30.1576015692792;
 Tue, 10 Dec 2019 14:08:12 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r5sm1343414qkf.44.2019.12.10.14.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 14:08:12 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: wait for all rings to drain before runtime
 suspending
Date: Tue, 10 Dec 2019 17:08:04 -0500
Message-Id: <20191210220804.1376829-1-alexander.deucher@amd.com>
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
index 2f367146c72c..81322b0a8acf 100644
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
