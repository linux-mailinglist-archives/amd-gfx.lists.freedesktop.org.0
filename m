Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20C1A2D6A
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Apr 2020 03:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98116EB33;
	Thu,  9 Apr 2020 01:42:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985B6EB33
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2020 01:28:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z90so1272918qtd.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Apr 2020 18:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5kw2Wbvm+jeuA0TKaixDRv8+MULXqVay3QBIHkyklY=;
 b=IdhsTx1X7K+gu0qszXrpQefgwGzG8CB0RvoL1PoE6xMluCGUybvuH1Y1hDU0yhH3lb
 S7ZxnE671zW/V5dVCMIOgpJYyC6qX5dEi8rT9ldP5rLRXGT846mhZ4uTxSNMgJq8hgiy
 DVf+/oXW92XTx+Ke/57DO0CfcC3ryfBU3gwHz3BbjYvxCYPFGah+zYcwZG7q8cWAt+Bn
 VIcoN22EpwE9vvdtIKTtUjvSq0zQv4hHLEppbWzfwOwGFjYq+r3btl1GVxJzPRz8Otf/
 qDz08PtlqeYREFn5SzmohAt6B1fCFjcFdODvQ8szTdoaDTK7sYBdq6qNVFfqbhUZsGdf
 gcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5kw2Wbvm+jeuA0TKaixDRv8+MULXqVay3QBIHkyklY=;
 b=AbJJqP0sqqET9vBNeaQYlwsI7w6Ga0akOnMX+Rd2EZ+Us9M39CJv60ocQ6kdjgozor
 4ngXCgNQcExnFvlQl/KKiknJe2P/ohV+5Fwd6g2jdOAt7PTVocI/qSVObAdezHi75huU
 rtUgDdXPMe3+sJFV0tpd/NUpwmVZlHULjOHaOIr1m2wO0s3aqyLMpjtpO07jINS4wgFk
 0CdezGFomDT4GjJnpkAGmYlQvFK1YVViqn0Og1q7SW2e34F9smZVSapkHQQaeJISXDPw
 AXEPoXTSm7nbds5wjr6cMIKIJKMiWbfDDA/3s1hPWofamygELcKswwuZf+dNu7K7BgLq
 3f1w==
X-Gm-Message-State: AGi0Pua6bIK6W/uEraH4Ng3exLlWw5WoNns/yZq9Hh5OeOESwWWrDZpc
 CjuqsrZqUMa7iehsyTejkNxWfYGVXa1dJfzzOCo=
X-Google-Smtp-Source: APiQypKkLtyEqv2exCrhc0LFffwP7h8eu9YlvpRilNhQ13nMJibLG+kUqVy7Zkjty2jLqU3zF9iILA==
X-Received: by 2002:ac8:6719:: with SMTP id e25mr10113060qtp.367.1586395704610; 
 Wed, 08 Apr 2020 18:28:24 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id h13sm11710186qkj.21.2020.04.08.18.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:28:24 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: christian.koenig@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com
Subject: [PATCH v2 3/3] drm/amd/amdgpu: remove hardcoded module name in prints
Date: Wed,  8 Apr 2020 21:28:15 -0400
Message-Id: <20200409012815.22309-4-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409012815.22309-1-mail@aurabindo.in>
References: <20200409012815.22309-1-mail@aurabindo.in>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 01:42:45 +0000
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Let format prefixes take care of printing the module name
through pr_fmt and dev_fmt definitions.

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index fa8ac9d19..4afd4ef54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -325,13 +325,13 @@ static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm)
 	ret = amdgpu_vm_validate_pt_bos(adev, vm, amdgpu_amdkfd_validate,
 					&param);
 	if (ret) {
-		pr_err("amdgpu: failed to validate PT BOs\n");
+		pr_err("failed to validate PT BOs\n");
 		return ret;
 	}
 
 	ret = amdgpu_amdkfd_validate(&param, pd);
 	if (ret) {
-		pr_err("amdgpu: failed to validate PD\n");
+		pr_err("failed to validate PD\n");
 		return ret;
 	}
 
@@ -340,7 +340,7 @@ static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm)
 	if (vm->use_cpu_for_update) {
 		ret = amdgpu_bo_kmap(pd, NULL);
 		if (ret) {
-			pr_err("amdgpu: failed to kmap PD, ret=%d\n", ret);
+			pr_err("failed to kmap PD, ret=%d\n", ret);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b8975857d..0a8c4a266 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1092,7 +1092,7 @@ static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switchero
 		return;
 
 	if (state == VGA_SWITCHEROO_ON) {
-		pr_info("amdgpu: switched on\n");
+		pr_info("switched on\n");
 		/* don't suspend or resume card normally */
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 
@@ -1106,7 +1106,7 @@ static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switchero
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
 		drm_kms_helper_poll_enable(dev);
 	} else {
-		pr_info("amdgpu: switched off\n");
+		pr_info("switched off\n");
 		drm_kms_helper_poll_disable(dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 		amdgpu_device_suspend(dev, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 5ed4227f3..0cc4c67f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -260,7 +260,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 		nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
 		if (nvec > 0) {
 			adev->irq.msi_enabled = true;
-			dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
+			dev_dbg(adev->dev, "using MSI/MSI-X.\n");
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index b20503935..c1a530dbe 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -858,7 +858,7 @@ static int gmc_v6_0_sw_init(void *handle)
 
 	r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(44));
 	if (r) {
-		dev_warn(adev->dev, "amdgpu: No suitable DMA available.\n");
+		dev_warn(adev->dev, "No suitable DMA available.\n");
 		return r;
 	}
 	adev->need_swiotlb = drm_need_swiotlb(44);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 9da9596a3..e8529e244 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1019,7 +1019,7 @@ static int gmc_v7_0_sw_init(void *handle)
 
 	r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(40));
 	if (r) {
-		pr_warn("amdgpu: No suitable DMA available\n");
+		pr_warn("No suitable DMA available\n");
 		return r;
 	}
 	adev->need_swiotlb = drm_need_swiotlb(40);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 27d83204f..0aa5b8280 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1144,7 +1144,7 @@ static int gmc_v8_0_sw_init(void *handle)
 
 	r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(40));
 	if (r) {
-		pr_warn("amdgpu: No suitable DMA available\n");
+		pr_warn("No suitable DMA available\n");
 		return r;
 	}
 	adev->need_swiotlb = drm_need_swiotlb(40);
-- 
2.26.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
