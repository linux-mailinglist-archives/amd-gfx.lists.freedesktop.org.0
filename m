Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F62315B3
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 00:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3BA6E42F;
	Tue, 28 Jul 2020 22:46:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0466E42F
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 22:46:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c12so7206901qtn.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IqWEACJimhmrJ/eh2gTpqXSTEO2pSrjLA6HCDZ8Sl34=;
 b=Up2FPRobSsFKwlVtsfNBZ1NCl93Fs1ueqUFNFbPRg/KukCN2ee8Us6GpIdwGUijg4u
 OMtVum7+HKmdLGR2X4NkKUq2M6+wMOml6QIxIQGtWUx+sF4D1NKSrhxjw1wF5OyEnYIk
 VK+YJ7LMIlqweDLoV0i3iN+vGyUyj4p3P4zZyMLft1HblfpAYCLzP2fxvhNBDLY7wAXq
 siBKA5tt7qX7iIrYM/ETKBUIbv+PKHNl6LDQXYViuAp29w7u5VQhMXYRBFsaj8K7ibQF
 d+3sxcX2GZkfCxhISWyijh9RAy8mBgZ2cPMR/v8y7WSfaEF1b5twfrHqCyNGYDrEhujF
 BFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IqWEACJimhmrJ/eh2gTpqXSTEO2pSrjLA6HCDZ8Sl34=;
 b=GZ2m2KGzNJH3moUp4V3kurV7N9BZsNYXKNuquE/8pNpXK5YLyyfnomUok9aYaJg0br
 GvYET9JYT2ZBCvuLBTWM7j7bcKRSWU1hq8HL8E34w5g+KrMp9Rk5dqeHIhXRI2ymfyPQ
 G9nuZ/aUq1fPMpwRkMGYOhBLDRR4rE4A8NlOKo46GUqoQVHR5nIKr4EooQusTVSOLS/z
 Y2aMt5i0HMk2jznqCF/YV2KgGVFp0eBRgSsGt1b+n3yNcNe/7CmTC8bRjUjWsiXd9kIH
 w5edAX/NkS74RwUegC3wBIdz4tYe4YxpmPZLcadkdR7br6a2NxsfO7hKeYDyN8OrXpbD
 qOLg==
X-Gm-Message-State: AOAM5339JkniDPQTpcySCWay8vGH045zgw+l4opAFiW04qaTUtIXPLwm
 r6MNA63x9jLjE4+eo9zkdD9nOWZf
X-Google-Smtp-Source: ABdhPJwUjcWbxxLASotVTIxUodZ0TnwQ8BdqZsbmoaDC4FM6BW2rmvEAe89tYkxRzaQNAbUgJvMLxg==
X-Received: by 2002:aed:208b:: with SMTP id 11mr17841524qtb.234.1595976398256; 
 Tue, 28 Jul 2020 15:46:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id o17sm189233qtr.13.2020.07.28.15.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:46:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/14] drm/amdgpu/gmc: add new helper to get the FB size used
 by pre-OS console
Date: Tue, 28 Jul 2020 18:45:58 -0400
Message-Id: <20200728224605.3919-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200728224605.3919-1-alexander.deucher@amd.com>
References: <20200728224605.3919-1-alexander.deucher@amd.com>
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

This adds a new gmc callback to get the size reserved by the pre-OS
console and provides a helper function for use by gmc IP drivers.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 43 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  5 +++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 21d2c8543f85..fc9e18aaa76e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -27,6 +27,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "amdgpu.h"
+#include "amdgpu_gmc.h"
 #include "amdgpu_ras.h"
 #include "amdgpu_xgmi.h"
 
@@ -431,3 +432,45 @@ void amdgpu_gmc_set_vm_fault_masks(struct amdgpu_device *adev, int hub_type,
 		WREG32(reg, tmp);
 	}
 }
+
+void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev)
+{
+	unsigned size;
+
+	/*
+	 * TODO:
+	 * Currently there is a bug where some memory client outside
+	 * of the driver writes to first 8M of VRAM on S3 resume,
+	 * this overrides GART which by default gets placed in first 8M and
+	 * causes VM_FAULTS once GTT is accessed.
+	 * Keep the stolen memory reservation until the while this is not solved.
+	 */
+	switch (adev->asic_type) {
+	case CHIP_VEGA10:
+	case CHIP_RAVEN:
+	case CHIP_ARCTURUS:
+	case CHIP_RENOIR:
+		adev->gmc.keep_stolen_vga_memory = true;
+		break;
+	default:
+		adev->gmc.keep_stolen_vga_memory = false;
+		break;
+	}
+
+	if (!amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_DCE))
+		size = 0;
+	else
+		size = amdgpu_gmc_get_vbios_fb_size(adev);
+
+	/* set to 0 if the pre-OS buffer uses up most of vram */
+	if ((adev->gmc.real_vram_size - size) < (8 * 1024 * 1024))
+		size = 0;
+
+	if (size > AMDGPU_VBIOS_VGA_ALLOCATION) {
+		adev->gmc.stolen_vga_size = AMDGPU_VBIOS_VGA_ALLOCATION;
+		adev->gmc.stolen_extended_size = size - adev->gmc.stolen_vga_size;
+	} else {
+		adev->gmc.stolen_vga_size = size;
+		adev->gmc.stolen_extended_size = 0;
+	}
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index 8f4af955d72c..c2a85d0b1546 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -131,6 +131,8 @@ struct amdgpu_gmc_funcs {
 	void (*get_vm_pte)(struct amdgpu_device *adev,
 			   struct amdgpu_bo_va_mapping *mapping,
 			   uint64_t *flags);
+	/* get the amount of memory used by the vbios for pre-OS console */
+	unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
 };
 
 struct amdgpu_xgmi {
@@ -253,6 +255,7 @@ struct amdgpu_gmc {
 #define amdgpu_gmc_map_mtype(adev, flags) (adev)->gmc.gmc_funcs->map_mtype((adev),(flags))
 #define amdgpu_gmc_get_vm_pde(adev, level, dst, flags) (adev)->gmc.gmc_funcs->get_vm_pde((adev), (level), (dst), (flags))
 #define amdgpu_gmc_get_vm_pte(adev, mapping, flags) (adev)->gmc.gmc_funcs->get_vm_pte((adev), (mapping), (flags))
+#define amdgpu_gmc_get_vbios_fb_size(adev) (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
 
 /**
  * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through the BAR
@@ -307,4 +310,6 @@ extern void
 amdgpu_gmc_set_vm_fault_masks(struct amdgpu_device *adev, int hub_type,
 			      bool enable);
 
+void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev);
+
 #endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
