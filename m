Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E972791AE
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090F66ED70;
	Fri, 25 Sep 2020 20:11:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543226ED70
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:26 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id z18so2033316qvp.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30JEhXl2OWbRqp/sWO4usYBhWEFla3P72OTKI2XMnEQ=;
 b=ZPfbblTR+bXJLGTFJie9Klxht4xouJC+OW5HE+jD5tsWdycm2xxms2MjDqnpXgdAy3
 dOUT8GoBvcVZHiy7Xahx8d72KmTVCoxyEMO5xOXEpPBwz/eAw/clkrDsymvhHQ1Ga4tT
 C9YdPr5aa0853IBOH0jsu/sL3KV7mEhEqVy8W7WiYinNI8XtP5QlnBVtqwc+skcHgcm0
 YfFs1ANnl/7G2G8dH/9+rWpl0Xrjxeh+VnMqpW9nRFOIO/DHznOTWvdqDy5WZTMOy4pY
 Jf3TtKkeMwCNMKd/BB/LmKDg0O4Td4lF2IzFziBXERSVGC2c1cje+dPkFGSN4J5Yl6ks
 9z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30JEhXl2OWbRqp/sWO4usYBhWEFla3P72OTKI2XMnEQ=;
 b=rU1ewJB7nV7fXbXA3Lweo09LE++DdzW6CfRnel75YJFvrg4J8gBq0/UI0bIhh+3Jnt
 y+1gfJwKutLggehilDu+5jpsbcOAKuOhGqv0Lcxt/rd9gEqQQTIi5vYD61WlslGjShPa
 4bkRAyrx4vvA3gRGBPKgUqKYp0DENLHsgSLoPQmEoKPW35TeDAurweQOXHYsdAlfUHd8
 v8qN2zYONeAhtpozg8rZhBvy2NT/Id9Zcq9b397sWR6+i6fIyercUo2SA//OAkzL0lrJ
 bnH8VI6RkYx/1w1KKlIlfLFP1yI79vWYVgr7JLP3wFEloAaxBCmJWpdhwgH5NvORuil6
 umEg==
X-Gm-Message-State: AOAM530aekOOIXSn82M+g3RwE0BgF8wnEb+ExhpPWIojAi6bBa7aXyBt
 iuv3pjgPUsEvD3HZRX0W0qHjtXHIqOs=
X-Google-Smtp-Source: ABdhPJycWI3fOV7ERd5eNyLLP1KGCauQU8UO0VMIK/EeceGWH6iFqDmPSi0dqAMyOU4FU8VhBJ1vzQ==
X-Received: by 2002:ad4:47cc:: with SMTP id p12mr376876qvw.22.1601064684482;
 Fri, 25 Sep 2020 13:11:24 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/45] drm/amdgpu: add mmhub v2.3 for vangogh (v4)
Date: Fri, 25 Sep 2020 16:10:06 -0400
Message-Id: <20200925201029.1738724-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200925201029.1738724-1-alexander.deucher@amd.com>
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

There are too many register offset mismatch between mmhub v2.0 and v2.3.

E.X:

mmMM_ATC_L2_MISC_CG:  0x064a(v2.0)  0x06cd(v2.3)
mmMMVM_L2_PROTECTION_FAULT_CNTL: 0x0688(v2.0) 0x0708(v2.3)
mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32: 0x072b(v2.0) 0x0940(v2.3)
mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32: 0x072c(v2.0) 0x0941(v2.3)
mmMMVM_INVALIDATE_ENG0_REQ: 0x06e3(v2.0) 0x0a01(v2.3)
mmMMVM_INVALIDATE_ENG0_ACK: 0x06f5(v2.0) 0x0a02(v2.3)
mmMMVM_CONTEXT0_CNTL: 0x06c0(v2.0) 0x0740(v2.3)
mmMMVM_L2_PROTECTION_FAULT_STATUS: 0x068c(v2.0) 0x070c(v2.3)
mmMMVM_L2_PROTECTION_FAULT_CNTL: 0x0688(v2.0) 0x0708(v2.3)
mmMM_ATC_L2_MISC_CG: 0x064a(v2.0) 0x06cd(v2.3)
mmDAGB0_CNTL_MISC2: 0x0071(v2.0) 0x0096(v2.3)
...

Continuing using the same file mmhub v2.0 is not good choice, it will
introduce a lot of checking with ASIC types. And also easy to introduce the
issues that offset not align, this kind of issues are really hard to find. Van
Gogh's mmhub vm invalidation is actually caused by the offset mismatch as well.

So it would like to create a new file rather than stick to re-use orignal mmhub
v2.0 here.

v2: add missed translate_further programming.
v3: sync with latest code
v4: add missing callbacks

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  |  10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 552 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.h |  28 ++
 4 files changed, 590 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 7866e4666a43..7c7e34824c51 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -81,7 +81,7 @@ amdgpu-y += \
 	gmc_v7_0.o \
 	gmc_v8_0.o \
 	gfxhub_v1_0.o mmhub_v1_0.o gmc_v9_0.o gfxhub_v1_1.o mmhub_v9_4.o \
-	gfxhub_v2_0.o mmhub_v2_0.o gmc_v10_0.o gfxhub_v2_1.o
+	gfxhub_v2_0.o mmhub_v2_0.o gmc_v10_0.o gfxhub_v2_1.o mmhub_v2_3.o
 
 # add UMC block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index fa0a0c8a6b11..df14880cf97e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -46,6 +46,7 @@
 #include "gfxhub_v2_0.h"
 #include "gfxhub_v2_1.h"
 #include "mmhub_v2_0.h"
+#include "mmhub_v2_3.h"
 #include "athub_v2_0.h"
 #include "athub_v2_1.h"
 
@@ -631,7 +632,14 @@ static void gmc_v10_0_set_umc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v10_0_set_mmhub_funcs(struct amdgpu_device *adev)
 {
-	adev->mmhub.funcs = &mmhub_v2_0_funcs;
+	switch (adev->asic_type) {
+	case CHIP_VANGOGH:
+		adev->mmhub.funcs = &mmhub_v2_3_funcs;
+		break;
+	default:
+		adev->mmhub.funcs = &mmhub_v2_0_funcs;
+		break;
+	}
 }
 
 static int gmc_v10_0_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
new file mode 100644
index 000000000000..b39dc2023b5f
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -0,0 +1,552 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include "amdgpu.h"
+#include "mmhub_v2_3.h"
+
+#include "mmhub/mmhub_2_3_0_offset.h"
+#include "mmhub/mmhub_2_3_0_sh_mask.h"
+#include "mmhub/mmhub_2_3_0_default.h"
+#include "navi10_enum.h"
+
+#include "soc15_common.h"
+
+static uint32_t mmhub_v2_3_get_invalidate_req(unsigned int vmid,
+					      uint32_t flush_type)
+{
+	u32 req = 0;
+
+	/* invalidate using legacy mode on vmid*/
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ,
+			    PER_VMID_INVALIDATE_REQ, 1 << vmid);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, FLUSH_TYPE, flush_type);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PTES, 1);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE0, 1);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE1, 1);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE2, 1);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ, INVALIDATE_L1_PTES, 1);
+	req = REG_SET_FIELD(req, MMVM_INVALIDATE_ENG0_REQ,
+			    CLEAR_PROTECTION_FAULT_STATUS_ADDR,	0);
+
+	return req;
+}
+
+static void
+mmhub_v2_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
+					     uint32_t status)
+{
+	dev_err(adev->dev,
+		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
+		status);
+	dev_err(adev->dev, "\t Faulty UTCL2 client ID: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, CID));
+	dev_err(adev->dev, "\t MORE_FAULTS: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, MORE_FAULTS));
+	dev_err(adev->dev, "\t WALKER_ERROR: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, WALKER_ERROR));
+	dev_err(adev->dev, "\t PERMISSION_FAULTS: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, PERMISSION_FAULTS));
+	dev_err(adev->dev, "\t MAPPING_ERROR: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, MAPPING_ERROR));
+	dev_err(adev->dev, "\t RW: 0x%lx\n",
+		REG_GET_FIELD(status,
+		MMVM_L2_PROTECTION_FAULT_STATUS, RW));
+}
+
+static void mmhub_v2_3_setup_vm_pt_regs(struct amdgpu_device *adev,
+					uint32_t vmid,
+					uint64_t page_table_base)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
+
+	WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
+			    hub->ctx_addr_distance * vmid, lower_32_bits(page_table_base));
+
+	WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
+			    hub->ctx_addr_distance * vmid, upper_32_bits(page_table_base));
+}
+
+static void mmhub_v2_3_init_gart_aperture_regs(struct amdgpu_device *adev)
+{
+	uint64_t pt_base = amdgpu_gmc_pd_addr(adev->gart.bo);
+
+	mmhub_v2_3_setup_vm_pt_regs(adev, 0, pt_base);
+
+	WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_START_ADDR_LO32,
+		     (u32)(adev->gmc.gart_start >> 12));
+	WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_START_ADDR_HI32,
+		     (u32)(adev->gmc.gart_start >> 44));
+
+	WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_END_ADDR_LO32,
+		     (u32)(adev->gmc.gart_end >> 12));
+	WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_END_ADDR_HI32,
+		     (u32)(adev->gmc.gart_end >> 44));
+}
+
+static void mmhub_v2_3_init_system_aperture_regs(struct amdgpu_device *adev)
+{
+	uint64_t value;
+	uint32_t tmp;
+
+	/* Disable AGP. */
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, 0x00FFFFFF);
+
+	/* Program the system aperture low logical page number. */
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
+		     adev->gmc.vram_start >> 18);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
+		     adev->gmc.vram_end >> 18);
+
+	/* Set default page address. */
+	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start +
+		adev->vm_manager.vram_base_offset;
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB,
+		     (u32)(value >> 12));
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
+		     (u32)(value >> 44));
+
+	/* Program "protection fault". */
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
+		     (u32)(adev->dummy_page_addr >> 12));
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
+		     (u32)((u64)adev->dummy_page_addr >> 44));
+
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_CNTL2);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL2,
+			    ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_CNTL2, tmp);
+}
+
+static void mmhub_v2_3_init_tlb_regs(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	/* Setup TLB control */
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMMC_VM_MX_L1_TLB_CNTL);
+
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB, 1);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL, SYSTEM_ACCESS_MODE, 3);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL,
+			    ENABLE_ADVANCED_DRIVER_MODEL, 1);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL,
+			    SYSTEM_APERTURE_UNMAPPED_ACCESS, 0);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL, ECO_BITS, 0);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL,
+			    MTYPE, MTYPE_UC); /* UC, uncached */
+
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_MX_L1_TLB_CNTL, tmp);
+}
+
+static void mmhub_v2_3_init_cache_regs(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	/* Setup L2 cache */
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, ENABLE_L2_CACHE, 1);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, ENABLE_L2_FRAGMENT_PROCESSING, 0);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL,
+			    ENABLE_DEFAULT_PAGE_OUT_TO_SYSTEM_MEMORY, 1);
+	/* XXX for emulation, Refer to closed source code.*/
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, L2_PDE0_CACHE_TAG_GENERATION_MODE,
+			    0);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, PDE_FAULT_CLASSIFICATION, 0);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, CONTEXT1_IDENTITY_ACCESS_MODE, 1);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, IDENTITY_MODE_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL, tmp);
+
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL2);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL2, INVALIDATE_ALL_L1_TLBS, 1);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL2, INVALIDATE_L2_CACHE, 1);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL2, tmp);
+
+	tmp = mmMMVM_L2_CNTL3_DEFAULT;
+	if (adev->gmc.translate_further) {
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL3, BANK_SELECT, 12);
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL3,
+				    L2_CACHE_BIGK_FRAGMENT_SIZE, 9);
+	} else {
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL3, BANK_SELECT, 9);
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL3,
+				    L2_CACHE_BIGK_FRAGMENT_SIZE, 6);
+	}
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL3, tmp);
+
+	tmp = mmMMVM_L2_CNTL4_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL4, VMC_TAP_PDE_REQUEST_PHYSICAL, 0);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL4, VMC_TAP_PTE_REQUEST_PHYSICAL, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL4, tmp);
+
+	tmp = mmMMVM_L2_CNTL5_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL5, L2_CACHE_SMALLK_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(GC, 0, mmMMVM_L2_CNTL5, tmp);
+}
+
+static void mmhub_v2_3_enable_system_domain(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_CNTL);
+	tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT0_CNTL, ENABLE_CONTEXT, 1);
+	tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT0_CNTL, PAGE_TABLE_DEPTH, 0);
+	tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT0_CNTL,
+			    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_CNTL, tmp);
+}
+
+static void mmhub_v2_3_disable_identity_aperture(struct amdgpu_device *adev)
+{
+	WREG32_SOC15(MMHUB, 0,
+		     mmMMVM_L2_CONTEXT1_IDENTITY_APERTURE_LOW_ADDR_LO32,
+		     0xFFFFFFFF);
+	WREG32_SOC15(MMHUB, 0,
+		     mmMMVM_L2_CONTEXT1_IDENTITY_APERTURE_LOW_ADDR_HI32,
+		     0x0000000F);
+
+	WREG32_SOC15(MMHUB, 0,
+		     mmMMVM_L2_CONTEXT1_IDENTITY_APERTURE_HIGH_ADDR_LO32, 0);
+	WREG32_SOC15(MMHUB, 0,
+		     mmMMVM_L2_CONTEXT1_IDENTITY_APERTURE_HIGH_ADDR_HI32, 0);
+
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CONTEXT_IDENTITY_PHYSICAL_OFFSET_LO32,
+		     0);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CONTEXT_IDENTITY_PHYSICAL_OFFSET_HI32,
+		     0);
+}
+
+static void mmhub_v2_3_setup_vmid_config(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
+	int i;
+	uint32_t tmp;
+
+	for (i = 0; i <= 14; i++) {
+		tmp = RREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_CNTL, i);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL, ENABLE_CONTEXT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL, PAGE_TABLE_DEPTH,
+				    adev->vm_manager.num_level);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    RANGE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    DUMMY_PAGE_PROTECTION_FAULT_ENABLE_DEFAULT,
+				    1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    PDE0_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    VALID_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    READ_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    WRITE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    EXECUTE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    PAGE_TABLE_BLOCK_SIZE,
+				    adev->vm_manager.block_size - 9);
+		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		tmp = REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
+				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
+				    !amdgpu_noretry);
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_CNTL,
+				    i * hub->ctx_distance, tmp);
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
+				    i * hub->ctx_addr_distance, 0);
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_START_ADDR_HI32,
+				    i * hub->ctx_addr_distance, 0);
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_END_ADDR_LO32,
+				    i * hub->ctx_addr_distance,
+				    lower_32_bits(adev->vm_manager.max_pfn - 1));
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_END_ADDR_HI32,
+				    i * hub->ctx_addr_distance,
+				    upper_32_bits(adev->vm_manager.max_pfn - 1));
+	}
+}
+
+static void mmhub_v2_3_program_invalidation(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
+	unsigned i;
+
+	for (i = 0; i < 18; ++i) {
+		WREG32_SOC15_OFFSET(MMHUB, 0,
+				    mmMMVM_INVALIDATE_ENG0_ADDR_RANGE_LO32,
+				    i * hub->eng_addr_distance, 0xffffffff);
+		WREG32_SOC15_OFFSET(MMHUB, 0,
+				    mmMMVM_INVALIDATE_ENG0_ADDR_RANGE_HI32,
+				    i * hub->eng_addr_distance, 0x1f);
+	}
+}
+
+static int mmhub_v2_3_gart_enable(struct amdgpu_device *adev)
+{
+	if (amdgpu_sriov_vf(adev)) {
+		/*
+		 * MMMC_VM_FB_LOCATION_BASE/TOP is NULL for VF, becuase they are
+		 * VF copy registers so vbios post doesn't program them, for
+		 * SRIOV driver need to program them
+		 */
+		WREG32_SOC15(MMHUB, 0, mmMMMC_VM_FB_LOCATION_BASE,
+			     adev->gmc.vram_start >> 24);
+		WREG32_SOC15(MMHUB, 0, mmMMMC_VM_FB_LOCATION_TOP,
+			     adev->gmc.vram_end >> 24);
+	}
+
+	/* GART Enable. */
+	mmhub_v2_3_init_gart_aperture_regs(adev);
+	mmhub_v2_3_init_system_aperture_regs(adev);
+	mmhub_v2_3_init_tlb_regs(adev);
+	mmhub_v2_3_init_cache_regs(adev);
+
+	mmhub_v2_3_enable_system_domain(adev);
+	mmhub_v2_3_disable_identity_aperture(adev);
+	mmhub_v2_3_setup_vmid_config(adev);
+	mmhub_v2_3_program_invalidation(adev);
+
+	return 0;
+}
+
+static void mmhub_v2_3_gart_disable(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
+	u32 tmp;
+	u32 i;
+
+	/* Disable all tables */
+	for (i = 0; i < 16; i++)
+		WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_CNTL,
+				    i * hub->ctx_distance, 0);
+
+	/* Setup TLB control */
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMMC_VM_MX_L1_TLB_CNTL);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB, 0);
+	tmp = REG_SET_FIELD(tmp, MMMC_VM_MX_L1_TLB_CNTL,
+			    ENABLE_ADVANCED_DRIVER_MODEL, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_MX_L1_TLB_CNTL, tmp);
+
+	/* Setup L2 cache */
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL, ENABLE_L2_CACHE, 0);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL, tmp);
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL3, 0);
+}
+
+/**
+ * mmhub_v2_3_set_fault_enable_default - update GART/VM fault handling
+ *
+ * @adev: amdgpu_device pointer
+ * @value: true redirects VM faults to the default page
+ */
+static void mmhub_v2_3_set_fault_enable_default(struct amdgpu_device *adev,
+						bool value)
+{
+	u32 tmp;
+	tmp = RREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_CNTL);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    RANGE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE0_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE1_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE2_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    TRANSLATE_FURTHER_PROTECTION_FAULT_ENABLE_DEFAULT,
+			    value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    NACK_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    DUMMY_PAGE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    VALID_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    READ_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    WRITE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+			    EXECUTE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	if (!value) {
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+				CRASH_ON_NO_RETRY_FAULT, 1);
+		tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL,
+				CRASH_ON_RETRY_FAULT, 1);
+	}
+	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_CNTL, tmp);
+}
+
+static const struct amdgpu_vmhub_funcs mmhub_v2_3_vmhub_funcs = {
+	.print_l2_protection_fault_status = mmhub_v2_3_print_l2_protection_fault_status,
+	.get_invalidate_req = mmhub_v2_3_get_invalidate_req,
+};
+
+static void mmhub_v2_3_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
+
+	hub->ctx0_ptb_addr_lo32 =
+		SOC15_REG_OFFSET(MMHUB, 0,
+				 mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32);
+	hub->ctx0_ptb_addr_hi32 =
+		SOC15_REG_OFFSET(MMHUB, 0,
+				 mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32);
+	hub->vm_inv_eng0_sem =
+		SOC15_REG_OFFSET(MMHUB, 0,
+				 mmMMVM_INVALIDATE_ENG0_SEM);
+	hub->vm_inv_eng0_req =
+		SOC15_REG_OFFSET(MMHUB, 0, mmMMVM_INVALIDATE_ENG0_REQ);
+	hub->vm_inv_eng0_ack =
+		SOC15_REG_OFFSET(MMHUB, 0, mmMMVM_INVALIDATE_ENG0_ACK);
+	hub->vm_context0_cntl =
+		SOC15_REG_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_CNTL);
+	hub->vm_l2_pro_fault_status =
+		SOC15_REG_OFFSET(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_STATUS);
+	hub->vm_l2_pro_fault_cntl =
+		SOC15_REG_OFFSET(MMHUB, 0, mmMMVM_L2_PROTECTION_FAULT_CNTL);
+
+	hub->ctx_distance = mmMMVM_CONTEXT1_CNTL - mmMMVM_CONTEXT0_CNTL;
+	hub->ctx_addr_distance = mmMMVM_CONTEXT1_PAGE_TABLE_BASE_ADDR_LO32 -
+		mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32;
+	hub->eng_distance = mmMMVM_INVALIDATE_ENG1_REQ -
+		mmMMVM_INVALIDATE_ENG0_REQ;
+	hub->eng_addr_distance = mmMMVM_INVALIDATE_ENG1_ADDR_RANGE_LO32 -
+		mmMMVM_INVALIDATE_ENG0_ADDR_RANGE_LO32;
+
+	hub->vm_cntx_cntl_vm_fault = MMVM_CONTEXT1_CNTL__RANGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__DUMMY_PAGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__PDE0_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__VALID_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__READ_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__WRITE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		MMVM_CONTEXT1_CNTL__EXECUTE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK;
+
+	hub->vmhub_funcs = &mmhub_v2_3_vmhub_funcs;
+}
+
+static void
+mmhub_v2_3_update_medium_grain_clock_gating(struct amdgpu_device *adev,
+					    bool enable)
+{
+	uint32_t def, data, def1, data1;
+
+	def  = data  = RREG32_SOC15(MMHUB, 0, mmMM_ATC_L2_MISC_CG);
+	def1 = data1 = RREG32_SOC15(MMHUB, 0, mmDAGB0_CNTL_MISC2);
+
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_MGCG)) {
+		data |= MM_ATC_L2_MISC_CG__ENABLE_MASK;
+
+		data1 &= ~(DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MASK |
+		           DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK |
+		           DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK |
+		           DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK |
+		           DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK |
+		           DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK);
+
+	} else {
+		data &= ~MM_ATC_L2_MISC_CG__ENABLE_MASK;
+
+		data1 |= (DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MASK |
+			  DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK |
+			  DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK |
+			  DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK |
+			  DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK |
+			  DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK);
+	}
+
+	if (def != data)
+		WREG32_SOC15(MMHUB, 0, mmMM_ATC_L2_MISC_CG, data);
+	if (def1 != data1)
+		WREG32_SOC15(MMHUB, 0, mmDAGB0_CNTL_MISC2, data1);
+}
+
+static void
+mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
+					   bool enable)
+{
+	uint32_t def, data;
+
+	def  = data  = RREG32_SOC15(MMHUB, 0, mmMM_ATC_L2_MISC_CG);
+
+	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS))
+		data |= MM_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK;
+	else
+		data &= ~MM_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK;
+
+	if (def != data)
+		WREG32_SOC15(MMHUB, 0, mmMM_ATC_L2_MISC_CG, data);
+}
+
+static int mmhub_v2_3_set_clockgating(struct amdgpu_device *adev,
+				      enum amd_clockgating_state state)
+{
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
+	mmhub_v2_3_update_medium_grain_clock_gating(adev,
+			state == AMD_CG_STATE_GATE ? true : false);
+	mmhub_v2_3_update_medium_grain_light_sleep(adev,
+			state == AMD_CG_STATE_GATE ? true : false);
+
+	return 0;
+}
+
+static void mmhub_v2_3_get_clockgating(struct amdgpu_device *adev, u32 *flags)
+{
+	int data, data1;
+
+	if (amdgpu_sriov_vf(adev))
+		*flags = 0;
+
+	data  = RREG32_SOC15(MMHUB, 0, mmMM_ATC_L2_MISC_CG);
+	data1 = RREG32_SOC15(MMHUB, 0, mmDAGB0_CNTL_MISC2);
+
+	/* AMD_CG_SUPPORT_MC_MGCG */
+	if ((data & MM_ATC_L2_MISC_CG__ENABLE_MASK) &&
+	    !(data1 & (DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MASK |
+		       DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK |
+		       DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK |
+		       DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK |
+		       DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK |
+		       DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK)))
+		*flags |= AMD_CG_SUPPORT_MC_MGCG;
+
+	/* AMD_CG_SUPPORT_MC_LS */
+	if (data & MM_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK)
+		*flags |= AMD_CG_SUPPORT_MC_LS;
+}
+
+const struct amdgpu_mmhub_funcs mmhub_v2_3_funcs = {
+	.ras_late_init = amdgpu_mmhub_ras_late_init,
+	.init = mmhub_v2_3_init,
+	.gart_enable = mmhub_v2_3_gart_enable,
+	.set_fault_enable_default = mmhub_v2_3_set_fault_enable_default,
+	.gart_disable = mmhub_v2_3_gart_disable,
+	.set_clockgating = mmhub_v2_3_set_clockgating,
+	.get_clockgating = mmhub_v2_3_get_clockgating,
+	.setup_vm_pt_regs = mmhub_v2_3_setup_vm_pt_regs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.h b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.h
new file mode 100644
index 000000000000..2926d21dea8b
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef __MMHUB_V2_3_H__
+#define __MMHUB_V2_3_H__
+
+extern const struct amdgpu_mmhub_funcs mmhub_v2_3_funcs;
+
+#endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
