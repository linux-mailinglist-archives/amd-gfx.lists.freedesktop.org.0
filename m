Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E898127919C
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB166ED4A;
	Fri, 25 Sep 2020 20:11:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE106ED40
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:05 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id q10so2058528qvs.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdK1tME4dEYl0rWBcgqg803JnYwstvEB3JEFrkYDaJ0=;
 b=uQNY2oRUni4sYnBYjTBjP0XgGIv3Mc29xeB4boQ/sStaHJdljgeBWStmT2RSbqeaE1
 0iWP3JaQoywfcNMmjkEv7zJheIPuKeJTUYxy7xbc1v8L9Ljd5/3c6n3XNM56AYGPLb48
 y2PdmwM5c4YscyvtBOIfVg2H/DYnRUt2jIHrB5UmXLwKwr5l+4I6JN3Lv4ko5ZHN3x76
 3TKTagJjF7oF2NaC83SluGRwC/+XI1IpO+5rpa9ow/31+0pha1Cb7u643CschG++1jz7
 2uin4pW0M0/KDRbxbPStiXBD7Td1HyQgWS/BcDoqLH/CsvsLNYOgSXhHG9Mff7IOiVgO
 swqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdK1tME4dEYl0rWBcgqg803JnYwstvEB3JEFrkYDaJ0=;
 b=N/R3cPg1H5Jx6/R2QKBXJ9jAXJmPxlPTJghgHDFMVCNky0ao3oXPcZ8tJg9rZAs/7i
 g7HNGPxobL66OxoYcLOyMksGa4cyF5T7QpJ+TpwgyFlRg9zELaYQsr5ll4XFNqmyyNgu
 DPsXJKt8XxBAdMF6M3NVYMbI5tzkLx3IX+bbR0zOxzMrX2Dv3DFuqDtlqbazcRIM7B1+
 WCCuKvpQ7zh97m1/7uX/7687FQXO5OjqQd7ooSGT84ToV9Mfy/4h7Dby+Tz+fWlkDD/L
 aSzeVg6vB0yTy6EW0CnGml3dEHi82hWKb3g6ZMc4XPyF9sB7mYjdlY4KOpSbZrS3ZbFx
 6CPA==
X-Gm-Message-State: AOAM5321sU0BwTKDKv8kK767iXLEwa+Zw0CSruBtID/L6PJ74tFQ0EN4
 1IhTmytNIPWPkdWxTKKno9RDoOsJL9Q=
X-Google-Smtp-Source: ABdhPJxotCTl6CqmGvm8JIq6QNFk3wEOmHLXP/j/ywlTLufybAvFoBJof/SuHzq2a2K2ecOCwbQabw==
X-Received: by 2002:ad4:58c7:: with SMTP id dh7mr381803qvb.20.1601064663999;
 Fri, 25 Sep 2020 13:11:03 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/45] drm/amdgpu: add vangogh_reg_base_init function for van
 gogh
Date: Fri, 25 Sep 2020 16:09:49 -0400
Message-Id: <20200925201029.1738724-5-alexander.deucher@amd.com>
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

This patch adds vangogh_reg_base_init function to init the register base for
van gogh.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |    2 +-
 drivers/gpu/drm/amd/amdgpu/nv.h               |    1 +
 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c |   51 +
 .../gpu/drm/amd/include/vangogh_ip_offset.h   | 1516 +++++++++++++++++
 4 files changed, 1569 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/include/vangogh_ip_offset.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 39976c7b100c..7866e4666a43 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -69,7 +69,7 @@ amdgpu-$(CONFIG_DRM_AMDGPU_SI)+= si.o gmc_v6_0.o gfx_v6_0.o si_ih.o si_dma.o dce
 amdgpu-y += \
 	vi.o mxgpu_vi.o nbio_v6_1.o soc15.o emu_soc.o mxgpu_ai.o nbio_v7_0.o vega10_reg_init.o \
 	vega20_reg_init.o nbio_v7_4.o nbio_v2_3.o nv.o navi10_reg_init.o navi14_reg_init.o \
-	arct_reg_init.o navi12_reg_init.o mxgpu_nv.o sienna_cichlid_reg_init.o
+	arct_reg_init.o navi12_reg_init.o mxgpu_nv.o sienna_cichlid_reg_init.o vangogh_reg_init.o
 
 # add DF block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.h b/drivers/gpu/drm/amd/amdgpu/nv.h
index aeef50a6a54b..8a3bf476b18f 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.h
+++ b/drivers/gpu/drm/amd/amdgpu/nv.h
@@ -34,4 +34,5 @@ int navi10_reg_base_init(struct amdgpu_device *adev);
 int navi14_reg_base_init(struct amdgpu_device *adev);
 int navi12_reg_base_init(struct amdgpu_device *adev);
 int sienna_cichlid_reg_base_init(struct amdgpu_device *adev);
+int vangogh_reg_base_init(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c b/drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c
new file mode 100644
index 000000000000..4c6c3b415e7b
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c
@@ -0,0 +1,51 @@
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
+#include "amdgpu.h"
+#include "nv.h"
+
+#include "soc15_common.h"
+#include "soc15_hw_ip.h"
+#include "vangogh_ip_offset.h"
+
+int vangogh_reg_base_init(struct amdgpu_device *adev)
+{
+	/* HW has more IP blocks,  only initialized the blocke needed by driver */
+	uint32_t i;
+	for (i = 0 ; i < MAX_INSTANCE ; ++i) {
+		adev->reg_offset[GC_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[HDP_HWIP][i] = (uint32_t *)(&(HDP_BASE.instance[i]));
+		adev->reg_offset[MMHUB_HWIP][i] = (uint32_t *)(&(MMHUB_BASE.instance[i]));
+		adev->reg_offset[ATHUB_HWIP][i] = (uint32_t *)(&(ATHUB_BASE.instance[i]));
+		adev->reg_offset[NBIO_HWIP][i] = (uint32_t *)(&(NBIO_BASE.instance[i]));
+		adev->reg_offset[MP0_HWIP][i] = (uint32_t *)(&(MP0_BASE.instance[i]));
+		adev->reg_offset[MP1_HWIP][i] = (uint32_t *)(&(MP1_BASE.instance[i]));
+		adev->reg_offset[VCN_HWIP][i] = (uint32_t *)(&(VCN_BASE.instance[i]));
+		adev->reg_offset[DF_HWIP][i] = (uint32_t *)(&(DF_BASE.instance[i]));
+		adev->reg_offset[DCE_HWIP][i] = (uint32_t *)(&(DCN_BASE.instance[i]));
+		adev->reg_offset[OSSSYS_HWIP][i] = (uint32_t *)(&(OSSSYS_BASE.instance[i]));
+		adev->reg_offset[SDMA0_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[SMUIO_HWIP][i] = (uint32_t *)(&(SMUIO_BASE.instance[i]));
+		adev->reg_offset[THM_HWIP][i] = (uint32_t *)(&(THM_BASE.instance[i]));
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/include/vangogh_ip_offset.h b/drivers/gpu/drm/amd/include/vangogh_ip_offset.h
new file mode 100644
index 000000000000..2875574b060e
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/vangogh_ip_offset.h
@@ -0,0 +1,1516 @@
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
+#ifndef __VANGOGH_IP_OFFSET_H__
+#define __VANGOGH_IP_OFFSET_H__
+
+#define MAX_INSTANCE                                        8
+#define MAX_SEGMENT                                         6
+
+
+struct IP_BASE_INSTANCE
+{
+    unsigned int segment[MAX_SEGMENT];
+};
+
+struct IP_BASE
+{
+    struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+};
+
+
+static const struct IP_BASE ACP_BASE = { { { { 0x02403800, 0x00480000, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE ATHUB_BASE = { { { { 0x00000C00, 0x00013300, 0x02408C00, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE CLK_BASE = { { { { 0x00016C00, 0x02401800, 0, 0, 0, 0 } },
+                                        { { 0x00016E00, 0x02401C00, 0, 0, 0, 0 } },
+                                        { { 0x00017000, 0x02402000, 0, 0, 0, 0 } },
+                                        { { 0x00017200, 0x02402400, 0, 0, 0, 0 } },
+                                        { { 0x0001B000, 0x0242D800, 0, 0, 0, 0 } },
+                                        { { 0x0001B200, 0x0242DC00, 0, 0, 0, 0 } },
+                                        { { 0x0001B400, 0x0242E000, 0, 0, 0, 0 } },
+                                        { { 0x00017E00, 0x0240BC00, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DF_BASE = { { { { 0x00007000, 0x0240B800, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DPCS_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE FCH_BASE = { { { { 0x0240C000, 0x00B40000, 0x11000000, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE FUSE_BASE = { { { { 0x00017400, 0x02401400, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE GC_BASE = { { { { 0x00001260, 0x0000A000, 0x02402C00, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE HDP_BASE = { { { { 0x00000F20, 0x0240A400, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE ISP_BASE = { { { { 0x00018000, 0x0240B000, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MMHUB_BASE = { { { { 0x00013200, 0x0001A000, 0x02408800, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x0243FC00, 0x00DC0000, 0x00E00000, 0x00E40000, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MP1_BASE = { { { { 0x00016000, 0x0243FC00, 0x00DC0000, 0x00E00000, 0x00E40000, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MP2_BASE = { { { { 0x00016400, 0x02400800, 0x00F40000, 0x00F80000, 0x00FC0000, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE NBIO_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE OSSSYS_BASE = { { { { 0x000010A0, 0x0240A000, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE PCIE0_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE SMUIO_BASE = { { { { 0x00016800, 0x00016A00, 0x02401000, 0x00440000, 0, 0 } },
+                                        { { 0x0001BC00, 0x0242D400, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE THM_BASE = { { { { 0x00016600, 0x02400C00, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE UMC_BASE = { { { { 0x00014000, 0x02425800, 0, 0, 0, 0 } },
+                                        { { 0x00054000, 0x02425C00, 0, 0, 0, 0 } },
+                                        { { 0x00094000, 0x02426000, 0, 0, 0, 0 } },
+                                        { { 0x000D4000, 0x02426400, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE USB_BASE = { { { { 0x0242A800, 0x05B00000, 0, 0, 0, 0 } },
+                                        { { 0x0242AC00, 0x05B80000, 0, 0, 0, 0 } },
+                                        { { 0x0242B000, 0x05C00000, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE VCN_BASE = { { { { 0x00007800, 0x00007E00, 0x02403000, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+
+
+#define ACP_BASE__INST0_SEG0                       0x02403800
+#define ACP_BASE__INST0_SEG1                       0x00480000
+#define ACP_BASE__INST0_SEG2                       0
+#define ACP_BASE__INST0_SEG3                       0
+#define ACP_BASE__INST0_SEG4                       0
+#define ACP_BASE__INST0_SEG5                       0
+
+#define ACP_BASE__INST1_SEG0                       0
+#define ACP_BASE__INST1_SEG1                       0
+#define ACP_BASE__INST1_SEG2                       0
+#define ACP_BASE__INST1_SEG3                       0
+#define ACP_BASE__INST1_SEG4                       0
+#define ACP_BASE__INST1_SEG5                       0
+
+#define ACP_BASE__INST2_SEG0                       0
+#define ACP_BASE__INST2_SEG1                       0
+#define ACP_BASE__INST2_SEG2                       0
+#define ACP_BASE__INST2_SEG3                       0
+#define ACP_BASE__INST2_SEG4                       0
+#define ACP_BASE__INST2_SEG5                       0
+
+#define ACP_BASE__INST3_SEG0                       0
+#define ACP_BASE__INST3_SEG1                       0
+#define ACP_BASE__INST3_SEG2                       0
+#define ACP_BASE__INST3_SEG3                       0
+#define ACP_BASE__INST3_SEG4                       0
+#define ACP_BASE__INST3_SEG5                       0
+
+#define ACP_BASE__INST4_SEG0                       0
+#define ACP_BASE__INST4_SEG1                       0
+#define ACP_BASE__INST4_SEG2                       0
+#define ACP_BASE__INST4_SEG3                       0
+#define ACP_BASE__INST4_SEG4                       0
+#define ACP_BASE__INST4_SEG5                       0
+
+#define ACP_BASE__INST5_SEG0                       0
+#define ACP_BASE__INST5_SEG1                       0
+#define ACP_BASE__INST5_SEG2                       0
+#define ACP_BASE__INST5_SEG3                       0
+#define ACP_BASE__INST5_SEG4                       0
+#define ACP_BASE__INST5_SEG5                       0
+
+#define ACP_BASE__INST6_SEG0                       0
+#define ACP_BASE__INST6_SEG1                       0
+#define ACP_BASE__INST6_SEG2                       0
+#define ACP_BASE__INST6_SEG3                       0
+#define ACP_BASE__INST6_SEG4                       0
+#define ACP_BASE__INST6_SEG5                       0
+
+#define ACP_BASE__INST7_SEG0                       0
+#define ACP_BASE__INST7_SEG1                       0
+#define ACP_BASE__INST7_SEG2                       0
+#define ACP_BASE__INST7_SEG3                       0
+#define ACP_BASE__INST7_SEG4                       0
+#define ACP_BASE__INST7_SEG5                       0
+
+#define ATHUB_BASE__INST0_SEG0                     0x00000C00
+#define ATHUB_BASE__INST0_SEG1                     0x00013300
+#define ATHUB_BASE__INST0_SEG2                     0x02408C00
+#define ATHUB_BASE__INST0_SEG3                     0
+#define ATHUB_BASE__INST0_SEG4                     0
+#define ATHUB_BASE__INST0_SEG5                     0
+
+#define ATHUB_BASE__INST1_SEG0                     0
+#define ATHUB_BASE__INST1_SEG1                     0
+#define ATHUB_BASE__INST1_SEG2                     0
+#define ATHUB_BASE__INST1_SEG3                     0
+#define ATHUB_BASE__INST1_SEG4                     0
+#define ATHUB_BASE__INST1_SEG5                     0
+
+#define ATHUB_BASE__INST2_SEG0                     0
+#define ATHUB_BASE__INST2_SEG1                     0
+#define ATHUB_BASE__INST2_SEG2                     0
+#define ATHUB_BASE__INST2_SEG3                     0
+#define ATHUB_BASE__INST2_SEG4                     0
+#define ATHUB_BASE__INST2_SEG5                     0
+
+#define ATHUB_BASE__INST3_SEG0                     0
+#define ATHUB_BASE__INST3_SEG1                     0
+#define ATHUB_BASE__INST3_SEG2                     0
+#define ATHUB_BASE__INST3_SEG3                     0
+#define ATHUB_BASE__INST3_SEG4                     0
+#define ATHUB_BASE__INST3_SEG5                     0
+
+#define ATHUB_BASE__INST4_SEG0                     0
+#define ATHUB_BASE__INST4_SEG1                     0
+#define ATHUB_BASE__INST4_SEG2                     0
+#define ATHUB_BASE__INST4_SEG3                     0
+#define ATHUB_BASE__INST4_SEG4                     0
+#define ATHUB_BASE__INST4_SEG5                     0
+
+#define ATHUB_BASE__INST5_SEG0                     0
+#define ATHUB_BASE__INST5_SEG1                     0
+#define ATHUB_BASE__INST5_SEG2                     0
+#define ATHUB_BASE__INST5_SEG3                     0
+#define ATHUB_BASE__INST5_SEG4                     0
+#define ATHUB_BASE__INST5_SEG5                     0
+
+#define ATHUB_BASE__INST6_SEG0                     0
+#define ATHUB_BASE__INST6_SEG1                     0
+#define ATHUB_BASE__INST6_SEG2                     0
+#define ATHUB_BASE__INST6_SEG3                     0
+#define ATHUB_BASE__INST6_SEG4                     0
+#define ATHUB_BASE__INST6_SEG5                     0
+
+#define ATHUB_BASE__INST7_SEG0                     0
+#define ATHUB_BASE__INST7_SEG1                     0
+#define ATHUB_BASE__INST7_SEG2                     0
+#define ATHUB_BASE__INST7_SEG3                     0
+#define ATHUB_BASE__INST7_SEG4                     0
+#define ATHUB_BASE__INST7_SEG5                     0
+
+#define CLK_BASE__INST0_SEG0                       0x00016C00
+#define CLK_BASE__INST0_SEG1                       0x02401800
+#define CLK_BASE__INST0_SEG2                       0
+#define CLK_BASE__INST0_SEG3                       0
+#define CLK_BASE__INST0_SEG4                       0
+#define CLK_BASE__INST0_SEG5                       0
+
+#define CLK_BASE__INST1_SEG0                       0x00016E00
+#define CLK_BASE__INST1_SEG1                       0x02401C00
+#define CLK_BASE__INST1_SEG2                       0
+#define CLK_BASE__INST1_SEG3                       0
+#define CLK_BASE__INST1_SEG4                       0
+#define CLK_BASE__INST1_SEG5                       0
+
+#define CLK_BASE__INST2_SEG0                       0x00017000
+#define CLK_BASE__INST2_SEG1                       0x02402000
+#define CLK_BASE__INST2_SEG2                       0
+#define CLK_BASE__INST2_SEG3                       0
+#define CLK_BASE__INST2_SEG4                       0
+#define CLK_BASE__INST2_SEG5                       0
+
+#define CLK_BASE__INST3_SEG0                       0x00017200
+#define CLK_BASE__INST3_SEG1                       0x02402400
+#define CLK_BASE__INST3_SEG2                       0
+#define CLK_BASE__INST3_SEG3                       0
+#define CLK_BASE__INST3_SEG4                       0
+#define CLK_BASE__INST3_SEG5                       0
+
+#define CLK_BASE__INST4_SEG0                       0x0001B000
+#define CLK_BASE__INST4_SEG1                       0x0242D800
+#define CLK_BASE__INST4_SEG2                       0
+#define CLK_BASE__INST4_SEG3                       0
+#define CLK_BASE__INST4_SEG4                       0
+#define CLK_BASE__INST4_SEG5                       0
+
+#define CLK_BASE__INST5_SEG0                       0x0001B200
+#define CLK_BASE__INST5_SEG1                       0x0242DC00
+#define CLK_BASE__INST5_SEG2                       0
+#define CLK_BASE__INST5_SEG3                       0
+#define CLK_BASE__INST5_SEG4                       0
+#define CLK_BASE__INST5_SEG5                       0
+
+#define CLK_BASE__INST6_SEG0                       0x0001B400
+#define CLK_BASE__INST6_SEG1                       0x0242E000
+#define CLK_BASE__INST6_SEG2                       0
+#define CLK_BASE__INST6_SEG3                       0
+#define CLK_BASE__INST6_SEG4                       0
+#define CLK_BASE__INST6_SEG5                       0
+
+#define CLK_BASE__INST7_SEG0                       0x00017E00
+#define CLK_BASE__INST7_SEG1                       0x0240BC00
+#define CLK_BASE__INST7_SEG2                       0
+#define CLK_BASE__INST7_SEG3                       0
+#define CLK_BASE__INST7_SEG4                       0
+#define CLK_BASE__INST7_SEG5                       0
+
+#define DF_BASE__INST0_SEG0                        0x00007000
+#define DF_BASE__INST0_SEG1                        0x0240B800
+#define DF_BASE__INST0_SEG2                        0
+#define DF_BASE__INST0_SEG3                        0
+#define DF_BASE__INST0_SEG4                        0
+#define DF_BASE__INST0_SEG5                        0
+
+#define DF_BASE__INST1_SEG0                        0
+#define DF_BASE__INST1_SEG1                        0
+#define DF_BASE__INST1_SEG2                        0
+#define DF_BASE__INST1_SEG3                        0
+#define DF_BASE__INST1_SEG4                        0
+#define DF_BASE__INST1_SEG5                        0
+
+#define DF_BASE__INST2_SEG0                        0
+#define DF_BASE__INST2_SEG1                        0
+#define DF_BASE__INST2_SEG2                        0
+#define DF_BASE__INST2_SEG3                        0
+#define DF_BASE__INST2_SEG4                        0
+#define DF_BASE__INST2_SEG5                        0
+
+#define DF_BASE__INST3_SEG0                        0
+#define DF_BASE__INST3_SEG1                        0
+#define DF_BASE__INST3_SEG2                        0
+#define DF_BASE__INST3_SEG3                        0
+#define DF_BASE__INST3_SEG4                        0
+#define DF_BASE__INST3_SEG5                        0
+
+#define DF_BASE__INST4_SEG0                        0
+#define DF_BASE__INST4_SEG1                        0
+#define DF_BASE__INST4_SEG2                        0
+#define DF_BASE__INST4_SEG3                        0
+#define DF_BASE__INST4_SEG4                        0
+#define DF_BASE__INST4_SEG5                        0
+
+#define DF_BASE__INST5_SEG0                        0
+#define DF_BASE__INST5_SEG1                        0
+#define DF_BASE__INST5_SEG2                        0
+#define DF_BASE__INST5_SEG3                        0
+#define DF_BASE__INST5_SEG4                        0
+#define DF_BASE__INST5_SEG5                        0
+
+#define DF_BASE__INST6_SEG0                        0
+#define DF_BASE__INST6_SEG1                        0
+#define DF_BASE__INST6_SEG2                        0
+#define DF_BASE__INST6_SEG3                        0
+#define DF_BASE__INST6_SEG4                        0
+#define DF_BASE__INST6_SEG5                        0
+
+#define DF_BASE__INST7_SEG0                        0
+#define DF_BASE__INST7_SEG1                        0
+#define DF_BASE__INST7_SEG2                        0
+#define DF_BASE__INST7_SEG3                        0
+#define DF_BASE__INST7_SEG4                        0
+#define DF_BASE__INST7_SEG5                        0
+
+#define DCN_BASE__INST0_SEG0                       0x00000012
+#define DCN_BASE__INST0_SEG1                       0x000000C0
+#define DCN_BASE__INST0_SEG2                       0x000034C0
+#define DCN_BASE__INST0_SEG3                       0x00009000
+#define DCN_BASE__INST0_SEG4                       0x02403C00
+#define DCN_BASE__INST0_SEG5                       0
+
+#define DCN_BASE__INST1_SEG0                       0
+#define DCN_BASE__INST1_SEG1                       0
+#define DCN_BASE__INST1_SEG2                       0
+#define DCN_BASE__INST1_SEG3                       0
+#define DCN_BASE__INST1_SEG4                       0
+#define DCN_BASE__INST1_SEG5                       0
+
+#define DCN_BASE__INST2_SEG0                       0
+#define DCN_BASE__INST2_SEG1                       0
+#define DCN_BASE__INST2_SEG2                       0
+#define DCN_BASE__INST2_SEG3                       0
+#define DCN_BASE__INST2_SEG4                       0
+#define DCN_BASE__INST2_SEG5                       0
+
+#define DCN_BASE__INST3_SEG0                       0
+#define DCN_BASE__INST3_SEG1                       0
+#define DCN_BASE__INST3_SEG2                       0
+#define DCN_BASE__INST3_SEG3                       0
+#define DCN_BASE__INST3_SEG4                       0
+#define DCN_BASE__INST3_SEG5                       0
+
+#define DCN_BASE__INST4_SEG0                       0
+#define DCN_BASE__INST4_SEG1                       0
+#define DCN_BASE__INST4_SEG2                       0
+#define DCN_BASE__INST4_SEG3                       0
+#define DCN_BASE__INST4_SEG4                       0
+#define DCN_BASE__INST4_SEG5                       0
+
+#define DCN_BASE__INST5_SEG0                       0
+#define DCN_BASE__INST5_SEG1                       0
+#define DCN_BASE__INST5_SEG2                       0
+#define DCN_BASE__INST5_SEG3                       0
+#define DCN_BASE__INST5_SEG4                       0
+#define DCN_BASE__INST5_SEG5                       0
+
+#define DCN_BASE__INST6_SEG0                       0
+#define DCN_BASE__INST6_SEG1                       0
+#define DCN_BASE__INST6_SEG2                       0
+#define DCN_BASE__INST6_SEG3                       0
+#define DCN_BASE__INST6_SEG4                       0
+#define DCN_BASE__INST6_SEG5                       0
+
+#define DCN_BASE__INST7_SEG0                       0
+#define DCN_BASE__INST7_SEG1                       0
+#define DCN_BASE__INST7_SEG2                       0
+#define DCN_BASE__INST7_SEG3                       0
+#define DCN_BASE__INST7_SEG4                       0
+#define DCN_BASE__INST7_SEG5                       0
+
+#define DPCS_BASE__INST0_SEG0                      0x00000012
+#define DPCS_BASE__INST0_SEG1                      0x000000C0
+#define DPCS_BASE__INST0_SEG2                      0x000034C0
+#define DPCS_BASE__INST0_SEG3                      0x00009000
+#define DPCS_BASE__INST0_SEG4                      0x02403C00
+#define DPCS_BASE__INST0_SEG5                      0
+
+#define DPCS_BASE__INST1_SEG0                      0
+#define DPCS_BASE__INST1_SEG1                      0
+#define DPCS_BASE__INST1_SEG2                      0
+#define DPCS_BASE__INST1_SEG3                      0
+#define DPCS_BASE__INST1_SEG4                      0
+#define DPCS_BASE__INST1_SEG5                      0
+
+#define DPCS_BASE__INST2_SEG0                      0
+#define DPCS_BASE__INST2_SEG1                      0
+#define DPCS_BASE__INST2_SEG2                      0
+#define DPCS_BASE__INST2_SEG3                      0
+#define DPCS_BASE__INST2_SEG4                      0
+#define DPCS_BASE__INST2_SEG5                      0
+
+#define DPCS_BASE__INST3_SEG0                      0
+#define DPCS_BASE__INST3_SEG1                      0
+#define DPCS_BASE__INST3_SEG2                      0
+#define DPCS_BASE__INST3_SEG3                      0
+#define DPCS_BASE__INST3_SEG4                      0
+#define DPCS_BASE__INST3_SEG5                      0
+
+#define DPCS_BASE__INST4_SEG0                      0
+#define DPCS_BASE__INST4_SEG1                      0
+#define DPCS_BASE__INST4_SEG2                      0
+#define DPCS_BASE__INST4_SEG3                      0
+#define DPCS_BASE__INST4_SEG4                      0
+#define DPCS_BASE__INST4_SEG5                      0
+
+#define DPCS_BASE__INST5_SEG0                      0
+#define DPCS_BASE__INST5_SEG1                      0
+#define DPCS_BASE__INST5_SEG2                      0
+#define DPCS_BASE__INST5_SEG3                      0
+#define DPCS_BASE__INST5_SEG4                      0
+#define DPCS_BASE__INST5_SEG5                      0
+
+#define DPCS_BASE__INST6_SEG0                      0
+#define DPCS_BASE__INST6_SEG1                      0
+#define DPCS_BASE__INST6_SEG2                      0
+#define DPCS_BASE__INST6_SEG3                      0
+#define DPCS_BASE__INST6_SEG4                      0
+#define DPCS_BASE__INST6_SEG5                      0
+
+#define DPCS_BASE__INST7_SEG0                      0
+#define DPCS_BASE__INST7_SEG1                      0
+#define DPCS_BASE__INST7_SEG2                      0
+#define DPCS_BASE__INST7_SEG3                      0
+#define DPCS_BASE__INST7_SEG4                      0
+#define DPCS_BASE__INST7_SEG5                      0
+
+#define FCH_BASE__INST0_SEG0                       0x0240C000
+#define FCH_BASE__INST0_SEG1                       0x00B40000
+#define FCH_BASE__INST0_SEG2                       0x11000000
+#define FCH_BASE__INST0_SEG3                       0
+#define FCH_BASE__INST0_SEG4                       0
+#define FCH_BASE__INST0_SEG5                       0
+
+#define FCH_BASE__INST1_SEG0                       0
+#define FCH_BASE__INST1_SEG1                       0
+#define FCH_BASE__INST1_SEG2                       0
+#define FCH_BASE__INST1_SEG3                       0
+#define FCH_BASE__INST1_SEG4                       0
+#define FCH_BASE__INST1_SEG5                       0
+
+#define FCH_BASE__INST2_SEG0                       0
+#define FCH_BASE__INST2_SEG1                       0
+#define FCH_BASE__INST2_SEG2                       0
+#define FCH_BASE__INST2_SEG3                       0
+#define FCH_BASE__INST2_SEG4                       0
+#define FCH_BASE__INST2_SEG5                       0
+
+#define FCH_BASE__INST3_SEG0                       0
+#define FCH_BASE__INST3_SEG1                       0
+#define FCH_BASE__INST3_SEG2                       0
+#define FCH_BASE__INST3_SEG3                       0
+#define FCH_BASE__INST3_SEG4                       0
+#define FCH_BASE__INST3_SEG5                       0
+
+#define FCH_BASE__INST4_SEG0                       0
+#define FCH_BASE__INST4_SEG1                       0
+#define FCH_BASE__INST4_SEG2                       0
+#define FCH_BASE__INST4_SEG3                       0
+#define FCH_BASE__INST4_SEG4                       0
+#define FCH_BASE__INST4_SEG5                       0
+
+#define FCH_BASE__INST5_SEG0                       0
+#define FCH_BASE__INST5_SEG1                       0
+#define FCH_BASE__INST5_SEG2                       0
+#define FCH_BASE__INST5_SEG3                       0
+#define FCH_BASE__INST5_SEG4                       0
+#define FCH_BASE__INST5_SEG5                       0
+
+#define FCH_BASE__INST6_SEG0                       0
+#define FCH_BASE__INST6_SEG1                       0
+#define FCH_BASE__INST6_SEG2                       0
+#define FCH_BASE__INST6_SEG3                       0
+#define FCH_BASE__INST6_SEG4                       0
+#define FCH_BASE__INST6_SEG5                       0
+
+#define FCH_BASE__INST7_SEG0                       0
+#define FCH_BASE__INST7_SEG1                       0
+#define FCH_BASE__INST7_SEG2                       0
+#define FCH_BASE__INST7_SEG3                       0
+#define FCH_BASE__INST7_SEG4                       0
+#define FCH_BASE__INST7_SEG5                       0
+
+#define FUSE_BASE__INST0_SEG0                      0x00017400
+#define FUSE_BASE__INST0_SEG1                      0x02401400
+#define FUSE_BASE__INST0_SEG2                      0
+#define FUSE_BASE__INST0_SEG3                      0
+#define FUSE_BASE__INST0_SEG4                      0
+#define FUSE_BASE__INST0_SEG5                      0
+
+#define FUSE_BASE__INST1_SEG0                      0
+#define FUSE_BASE__INST1_SEG1                      0
+#define FUSE_BASE__INST1_SEG2                      0
+#define FUSE_BASE__INST1_SEG3                      0
+#define FUSE_BASE__INST1_SEG4                      0
+#define FUSE_BASE__INST1_SEG5                      0
+
+#define FUSE_BASE__INST2_SEG0                      0
+#define FUSE_BASE__INST2_SEG1                      0
+#define FUSE_BASE__INST2_SEG2                      0
+#define FUSE_BASE__INST2_SEG3                      0
+#define FUSE_BASE__INST2_SEG4                      0
+#define FUSE_BASE__INST2_SEG5                      0
+
+#define FUSE_BASE__INST3_SEG0                      0
+#define FUSE_BASE__INST3_SEG1                      0
+#define FUSE_BASE__INST3_SEG2                      0
+#define FUSE_BASE__INST3_SEG3                      0
+#define FUSE_BASE__INST3_SEG4                      0
+#define FUSE_BASE__INST3_SEG5                      0
+
+#define FUSE_BASE__INST4_SEG0                      0
+#define FUSE_BASE__INST4_SEG1                      0
+#define FUSE_BASE__INST4_SEG2                      0
+#define FUSE_BASE__INST4_SEG3                      0
+#define FUSE_BASE__INST4_SEG4                      0
+#define FUSE_BASE__INST4_SEG5                      0
+
+#define FUSE_BASE__INST5_SEG0                      0
+#define FUSE_BASE__INST5_SEG1                      0
+#define FUSE_BASE__INST5_SEG2                      0
+#define FUSE_BASE__INST5_SEG3                      0
+#define FUSE_BASE__INST5_SEG4                      0
+#define FUSE_BASE__INST5_SEG5                      0
+
+#define FUSE_BASE__INST6_SEG0                      0
+#define FUSE_BASE__INST6_SEG1                      0
+#define FUSE_BASE__INST6_SEG2                      0
+#define FUSE_BASE__INST6_SEG3                      0
+#define FUSE_BASE__INST6_SEG4                      0
+#define FUSE_BASE__INST6_SEG5                      0
+
+#define FUSE_BASE__INST7_SEG0                      0
+#define FUSE_BASE__INST7_SEG1                      0
+#define FUSE_BASE__INST7_SEG2                      0
+#define FUSE_BASE__INST7_SEG3                      0
+#define FUSE_BASE__INST7_SEG4                      0
+#define FUSE_BASE__INST7_SEG5                      0
+
+#define GC_BASE__INST0_SEG0                        0x00001260
+#define GC_BASE__INST0_SEG1                        0x0000A000
+#define GC_BASE__INST0_SEG2                        0x02402C00
+#define GC_BASE__INST0_SEG3                        0
+#define GC_BASE__INST0_SEG4                        0
+#define GC_BASE__INST0_SEG5                        0
+
+#define GC_BASE__INST1_SEG0                        0
+#define GC_BASE__INST1_SEG1                        0
+#define GC_BASE__INST1_SEG2                        0
+#define GC_BASE__INST1_SEG3                        0
+#define GC_BASE__INST1_SEG4                        0
+#define GC_BASE__INST1_SEG5                        0
+
+#define GC_BASE__INST2_SEG0                        0
+#define GC_BASE__INST2_SEG1                        0
+#define GC_BASE__INST2_SEG2                        0
+#define GC_BASE__INST2_SEG3                        0
+#define GC_BASE__INST2_SEG4                        0
+#define GC_BASE__INST2_SEG5                        0
+
+#define GC_BASE__INST3_SEG0                        0
+#define GC_BASE__INST3_SEG1                        0
+#define GC_BASE__INST3_SEG2                        0
+#define GC_BASE__INST3_SEG3                        0
+#define GC_BASE__INST3_SEG4                        0
+#define GC_BASE__INST3_SEG5                        0
+
+#define GC_BASE__INST4_SEG0                        0
+#define GC_BASE__INST4_SEG1                        0
+#define GC_BASE__INST4_SEG2                        0
+#define GC_BASE__INST4_SEG3                        0
+#define GC_BASE__INST4_SEG4                        0
+#define GC_BASE__INST4_SEG5                        0
+
+#define GC_BASE__INST5_SEG0                        0
+#define GC_BASE__INST5_SEG1                        0
+#define GC_BASE__INST5_SEG2                        0
+#define GC_BASE__INST5_SEG3                        0
+#define GC_BASE__INST5_SEG4                        0
+#define GC_BASE__INST5_SEG5                        0
+
+#define GC_BASE__INST6_SEG0                        0
+#define GC_BASE__INST6_SEG1                        0
+#define GC_BASE__INST6_SEG2                        0
+#define GC_BASE__INST6_SEG3                        0
+#define GC_BASE__INST6_SEG4                        0
+#define GC_BASE__INST6_SEG5                        0
+
+#define GC_BASE__INST7_SEG0                        0
+#define GC_BASE__INST7_SEG1                        0
+#define GC_BASE__INST7_SEG2                        0
+#define GC_BASE__INST7_SEG3                        0
+#define GC_BASE__INST7_SEG4                        0
+#define GC_BASE__INST7_SEG5                        0
+
+#define HDP_BASE__INST0_SEG0                       0x00000F20
+#define HDP_BASE__INST0_SEG1                       0x0240A400
+#define HDP_BASE__INST0_SEG2                       0
+#define HDP_BASE__INST0_SEG3                       0
+#define HDP_BASE__INST0_SEG4                       0
+#define HDP_BASE__INST0_SEG5                       0
+
+#define HDP_BASE__INST1_SEG0                       0
+#define HDP_BASE__INST1_SEG1                       0
+#define HDP_BASE__INST1_SEG2                       0
+#define HDP_BASE__INST1_SEG3                       0
+#define HDP_BASE__INST1_SEG4                       0
+#define HDP_BASE__INST1_SEG5                       0
+
+#define HDP_BASE__INST2_SEG0                       0
+#define HDP_BASE__INST2_SEG1                       0
+#define HDP_BASE__INST2_SEG2                       0
+#define HDP_BASE__INST2_SEG3                       0
+#define HDP_BASE__INST2_SEG4                       0
+#define HDP_BASE__INST2_SEG5                       0
+
+#define HDP_BASE__INST3_SEG0                       0
+#define HDP_BASE__INST3_SEG1                       0
+#define HDP_BASE__INST3_SEG2                       0
+#define HDP_BASE__INST3_SEG3                       0
+#define HDP_BASE__INST3_SEG4                       0
+#define HDP_BASE__INST3_SEG5                       0
+
+#define HDP_BASE__INST4_SEG0                       0
+#define HDP_BASE__INST4_SEG1                       0
+#define HDP_BASE__INST4_SEG2                       0
+#define HDP_BASE__INST4_SEG3                       0
+#define HDP_BASE__INST4_SEG4                       0
+#define HDP_BASE__INST4_SEG5                       0
+
+#define HDP_BASE__INST5_SEG0                       0
+#define HDP_BASE__INST5_SEG1                       0
+#define HDP_BASE__INST5_SEG2                       0
+#define HDP_BASE__INST5_SEG3                       0
+#define HDP_BASE__INST5_SEG4                       0
+#define HDP_BASE__INST5_SEG5                       0
+
+#define HDP_BASE__INST6_SEG0                       0
+#define HDP_BASE__INST6_SEG1                       0
+#define HDP_BASE__INST6_SEG2                       0
+#define HDP_BASE__INST6_SEG3                       0
+#define HDP_BASE__INST6_SEG4                       0
+#define HDP_BASE__INST6_SEG5                       0
+
+#define HDP_BASE__INST7_SEG0                       0
+#define HDP_BASE__INST7_SEG1                       0
+#define HDP_BASE__INST7_SEG2                       0
+#define HDP_BASE__INST7_SEG3                       0
+#define HDP_BASE__INST7_SEG4                       0
+#define HDP_BASE__INST7_SEG5                       0
+
+#define ISP_BASE__INST0_SEG0                       0x00018000
+#define ISP_BASE__INST0_SEG1                       0x0240B000
+#define ISP_BASE__INST0_SEG2                       0
+#define ISP_BASE__INST0_SEG3                       0
+#define ISP_BASE__INST0_SEG4                       0
+#define ISP_BASE__INST0_SEG5                       0
+
+#define ISP_BASE__INST1_SEG0                       0
+#define ISP_BASE__INST1_SEG1                       0
+#define ISP_BASE__INST1_SEG2                       0
+#define ISP_BASE__INST1_SEG3                       0
+#define ISP_BASE__INST1_SEG4                       0
+#define ISP_BASE__INST1_SEG5                       0
+
+#define ISP_BASE__INST2_SEG0                       0
+#define ISP_BASE__INST2_SEG1                       0
+#define ISP_BASE__INST2_SEG2                       0
+#define ISP_BASE__INST2_SEG3                       0
+#define ISP_BASE__INST2_SEG4                       0
+#define ISP_BASE__INST2_SEG5                       0
+
+#define ISP_BASE__INST3_SEG0                       0
+#define ISP_BASE__INST3_SEG1                       0
+#define ISP_BASE__INST3_SEG2                       0
+#define ISP_BASE__INST3_SEG3                       0
+#define ISP_BASE__INST3_SEG4                       0
+#define ISP_BASE__INST3_SEG5                       0
+
+#define ISP_BASE__INST4_SEG0                       0
+#define ISP_BASE__INST4_SEG1                       0
+#define ISP_BASE__INST4_SEG2                       0
+#define ISP_BASE__INST4_SEG3                       0
+#define ISP_BASE__INST4_SEG4                       0
+#define ISP_BASE__INST4_SEG5                       0
+
+#define ISP_BASE__INST5_SEG0                       0
+#define ISP_BASE__INST5_SEG1                       0
+#define ISP_BASE__INST5_SEG2                       0
+#define ISP_BASE__INST5_SEG3                       0
+#define ISP_BASE__INST5_SEG4                       0
+#define ISP_BASE__INST5_SEG5                       0
+
+#define ISP_BASE__INST6_SEG0                       0
+#define ISP_BASE__INST6_SEG1                       0
+#define ISP_BASE__INST6_SEG2                       0
+#define ISP_BASE__INST6_SEG3                       0
+#define ISP_BASE__INST6_SEG4                       0
+#define ISP_BASE__INST6_SEG5                       0
+
+#define ISP_BASE__INST7_SEG0                       0
+#define ISP_BASE__INST7_SEG1                       0
+#define ISP_BASE__INST7_SEG2                       0
+#define ISP_BASE__INST7_SEG3                       0
+#define ISP_BASE__INST7_SEG4                       0
+#define ISP_BASE__INST7_SEG5                       0
+
+#define MMHUB_BASE__INST0_SEG0                     0x00013200
+#define MMHUB_BASE__INST0_SEG1                     0x0001A000
+#define MMHUB_BASE__INST0_SEG2                     0x02408800
+#define MMHUB_BASE__INST0_SEG3                     0
+#define MMHUB_BASE__INST0_SEG4                     0
+#define MMHUB_BASE__INST0_SEG5                     0
+
+#define MMHUB_BASE__INST1_SEG0                     0
+#define MMHUB_BASE__INST1_SEG1                     0
+#define MMHUB_BASE__INST1_SEG2                     0
+#define MMHUB_BASE__INST1_SEG3                     0
+#define MMHUB_BASE__INST1_SEG4                     0
+#define MMHUB_BASE__INST1_SEG5                     0
+
+#define MMHUB_BASE__INST2_SEG0                     0
+#define MMHUB_BASE__INST2_SEG1                     0
+#define MMHUB_BASE__INST2_SEG2                     0
+#define MMHUB_BASE__INST2_SEG3                     0
+#define MMHUB_BASE__INST2_SEG4                     0
+#define MMHUB_BASE__INST2_SEG5                     0
+
+#define MMHUB_BASE__INST3_SEG0                     0
+#define MMHUB_BASE__INST3_SEG1                     0
+#define MMHUB_BASE__INST3_SEG2                     0
+#define MMHUB_BASE__INST3_SEG3                     0
+#define MMHUB_BASE__INST3_SEG4                     0
+#define MMHUB_BASE__INST3_SEG5                     0
+
+#define MMHUB_BASE__INST4_SEG0                     0
+#define MMHUB_BASE__INST4_SEG1                     0
+#define MMHUB_BASE__INST4_SEG2                     0
+#define MMHUB_BASE__INST4_SEG3                     0
+#define MMHUB_BASE__INST4_SEG4                     0
+#define MMHUB_BASE__INST4_SEG5                     0
+
+#define MMHUB_BASE__INST5_SEG0                     0
+#define MMHUB_BASE__INST5_SEG1                     0
+#define MMHUB_BASE__INST5_SEG2                     0
+#define MMHUB_BASE__INST5_SEG3                     0
+#define MMHUB_BASE__INST5_SEG4                     0
+#define MMHUB_BASE__INST5_SEG5                     0
+
+#define MMHUB_BASE__INST6_SEG0                     0
+#define MMHUB_BASE__INST6_SEG1                     0
+#define MMHUB_BASE__INST6_SEG2                     0
+#define MMHUB_BASE__INST6_SEG3                     0
+#define MMHUB_BASE__INST6_SEG4                     0
+#define MMHUB_BASE__INST6_SEG5                     0
+
+#define MMHUB_BASE__INST7_SEG0                     0
+#define MMHUB_BASE__INST7_SEG1                     0
+#define MMHUB_BASE__INST7_SEG2                     0
+#define MMHUB_BASE__INST7_SEG3                     0
+#define MMHUB_BASE__INST7_SEG4                     0
+#define MMHUB_BASE__INST7_SEG5                     0
+
+#define MP0_BASE__INST0_SEG0                       0x00016000
+#define MP0_BASE__INST0_SEG1                       0x0243FC00
+#define MP0_BASE__INST0_SEG2                       0x00DC0000
+#define MP0_BASE__INST0_SEG3                       0x00E00000
+#define MP0_BASE__INST0_SEG4                       0x00E40000
+#define MP0_BASE__INST0_SEG5                       0
+
+#define MP0_BASE__INST1_SEG0                       0
+#define MP0_BASE__INST1_SEG1                       0
+#define MP0_BASE__INST1_SEG2                       0
+#define MP0_BASE__INST1_SEG3                       0
+#define MP0_BASE__INST1_SEG4                       0
+#define MP0_BASE__INST1_SEG5                       0
+
+#define MP0_BASE__INST2_SEG0                       0
+#define MP0_BASE__INST2_SEG1                       0
+#define MP0_BASE__INST2_SEG2                       0
+#define MP0_BASE__INST2_SEG3                       0
+#define MP0_BASE__INST2_SEG4                       0
+#define MP0_BASE__INST2_SEG5                       0
+
+#define MP0_BASE__INST3_SEG0                       0
+#define MP0_BASE__INST3_SEG1                       0
+#define MP0_BASE__INST3_SEG2                       0
+#define MP0_BASE__INST3_SEG3                       0
+#define MP0_BASE__INST3_SEG4                       0
+#define MP0_BASE__INST3_SEG5                       0
+
+#define MP0_BASE__INST4_SEG0                       0
+#define MP0_BASE__INST4_SEG1                       0
+#define MP0_BASE__INST4_SEG2                       0
+#define MP0_BASE__INST4_SEG3                       0
+#define MP0_BASE__INST4_SEG4                       0
+#define MP0_BASE__INST4_SEG5                       0
+
+#define MP0_BASE__INST5_SEG0                       0
+#define MP0_BASE__INST5_SEG1                       0
+#define MP0_BASE__INST5_SEG2                       0
+#define MP0_BASE__INST5_SEG3                       0
+#define MP0_BASE__INST5_SEG4                       0
+#define MP0_BASE__INST5_SEG5                       0
+
+#define MP0_BASE__INST6_SEG0                       0
+#define MP0_BASE__INST6_SEG1                       0
+#define MP0_BASE__INST6_SEG2                       0
+#define MP0_BASE__INST6_SEG3                       0
+#define MP0_BASE__INST6_SEG4                       0
+#define MP0_BASE__INST6_SEG5                       0
+
+#define MP0_BASE__INST7_SEG0                       0
+#define MP0_BASE__INST7_SEG1                       0
+#define MP0_BASE__INST7_SEG2                       0
+#define MP0_BASE__INST7_SEG3                       0
+#define MP0_BASE__INST7_SEG4                       0
+#define MP0_BASE__INST7_SEG5                       0
+
+#define MP1_BASE__INST0_SEG0                       0x00016000
+#define MP1_BASE__INST0_SEG1                       0x0243FC00
+#define MP1_BASE__INST0_SEG2                       0x00DC0000
+#define MP1_BASE__INST0_SEG3                       0x00E00000
+#define MP1_BASE__INST0_SEG4                       0x00E40000
+#define MP1_BASE__INST0_SEG5                       0
+
+#define MP1_BASE__INST1_SEG0                       0
+#define MP1_BASE__INST1_SEG1                       0
+#define MP1_BASE__INST1_SEG2                       0
+#define MP1_BASE__INST1_SEG3                       0
+#define MP1_BASE__INST1_SEG4                       0
+#define MP1_BASE__INST1_SEG5                       0
+
+#define MP1_BASE__INST2_SEG0                       0
+#define MP1_BASE__INST2_SEG1                       0
+#define MP1_BASE__INST2_SEG2                       0
+#define MP1_BASE__INST2_SEG3                       0
+#define MP1_BASE__INST2_SEG4                       0
+#define MP1_BASE__INST2_SEG5                       0
+
+#define MP1_BASE__INST3_SEG0                       0
+#define MP1_BASE__INST3_SEG1                       0
+#define MP1_BASE__INST3_SEG2                       0
+#define MP1_BASE__INST3_SEG3                       0
+#define MP1_BASE__INST3_SEG4                       0
+#define MP1_BASE__INST3_SEG5                       0
+
+#define MP1_BASE__INST4_SEG0                       0
+#define MP1_BASE__INST4_SEG1                       0
+#define MP1_BASE__INST4_SEG2                       0
+#define MP1_BASE__INST4_SEG3                       0
+#define MP1_BASE__INST4_SEG4                       0
+#define MP1_BASE__INST4_SEG5                       0
+
+#define MP1_BASE__INST5_SEG0                       0
+#define MP1_BASE__INST5_SEG1                       0
+#define MP1_BASE__INST5_SEG2                       0
+#define MP1_BASE__INST5_SEG3                       0
+#define MP1_BASE__INST5_SEG4                       0
+#define MP1_BASE__INST5_SEG5                       0
+
+#define MP1_BASE__INST6_SEG0                       0
+#define MP1_BASE__INST6_SEG1                       0
+#define MP1_BASE__INST6_SEG2                       0
+#define MP1_BASE__INST6_SEG3                       0
+#define MP1_BASE__INST6_SEG4                       0
+#define MP1_BASE__INST6_SEG5                       0
+
+#define MP1_BASE__INST7_SEG0                       0
+#define MP1_BASE__INST7_SEG1                       0
+#define MP1_BASE__INST7_SEG2                       0
+#define MP1_BASE__INST7_SEG3                       0
+#define MP1_BASE__INST7_SEG4                       0
+#define MP1_BASE__INST7_SEG5                       0
+
+#define MP2_BASE__INST0_SEG0                       0x00016400
+#define MP2_BASE__INST0_SEG1                       0x02400800
+#define MP2_BASE__INST0_SEG2                       0x00F40000
+#define MP2_BASE__INST0_SEG3                       0x00F80000
+#define MP2_BASE__INST0_SEG4                       0x00FC0000
+#define MP2_BASE__INST0_SEG5                       0
+
+#define MP2_BASE__INST1_SEG0                       0
+#define MP2_BASE__INST1_SEG1                       0
+#define MP2_BASE__INST1_SEG2                       0
+#define MP2_BASE__INST1_SEG3                       0
+#define MP2_BASE__INST1_SEG4                       0
+#define MP2_BASE__INST1_SEG5                       0
+
+#define MP2_BASE__INST2_SEG0                       0
+#define MP2_BASE__INST2_SEG1                       0
+#define MP2_BASE__INST2_SEG2                       0
+#define MP2_BASE__INST2_SEG3                       0
+#define MP2_BASE__INST2_SEG4                       0
+#define MP2_BASE__INST2_SEG5                       0
+
+#define MP2_BASE__INST3_SEG0                       0
+#define MP2_BASE__INST3_SEG1                       0
+#define MP2_BASE__INST3_SEG2                       0
+#define MP2_BASE__INST3_SEG3                       0
+#define MP2_BASE__INST3_SEG4                       0
+#define MP2_BASE__INST3_SEG5                       0
+
+#define MP2_BASE__INST4_SEG0                       0
+#define MP2_BASE__INST4_SEG1                       0
+#define MP2_BASE__INST4_SEG2                       0
+#define MP2_BASE__INST4_SEG3                       0
+#define MP2_BASE__INST4_SEG4                       0
+#define MP2_BASE__INST4_SEG5                       0
+
+#define MP2_BASE__INST5_SEG0                       0
+#define MP2_BASE__INST5_SEG1                       0
+#define MP2_BASE__INST5_SEG2                       0
+#define MP2_BASE__INST5_SEG3                       0
+#define MP2_BASE__INST5_SEG4                       0
+#define MP2_BASE__INST5_SEG5                       0
+
+#define MP2_BASE__INST6_SEG0                       0
+#define MP2_BASE__INST6_SEG1                       0
+#define MP2_BASE__INST6_SEG2                       0
+#define MP2_BASE__INST6_SEG3                       0
+#define MP2_BASE__INST6_SEG4                       0
+#define MP2_BASE__INST6_SEG5                       0
+
+#define MP2_BASE__INST7_SEG0                       0
+#define MP2_BASE__INST7_SEG1                       0
+#define MP2_BASE__INST7_SEG2                       0
+#define MP2_BASE__INST7_SEG3                       0
+#define MP2_BASE__INST7_SEG4                       0
+#define MP2_BASE__INST7_SEG5                       0
+
+#define NBIO_BASE__INST0_SEG0                      0x00000000
+#define NBIO_BASE__INST0_SEG1                      0x00000014
+#define NBIO_BASE__INST0_SEG2                      0x00000D20
+#define NBIO_BASE__INST0_SEG3                      0x00010400
+#define NBIO_BASE__INST0_SEG4                      0x0241B000
+#define NBIO_BASE__INST0_SEG5                      0x04040000
+
+#define NBIO_BASE__INST1_SEG0                      0
+#define NBIO_BASE__INST1_SEG1                      0
+#define NBIO_BASE__INST1_SEG2                      0
+#define NBIO_BASE__INST1_SEG3                      0
+#define NBIO_BASE__INST1_SEG4                      0
+#define NBIO_BASE__INST1_SEG5                      0
+
+#define NBIO_BASE__INST2_SEG0                      0
+#define NBIO_BASE__INST2_SEG1                      0
+#define NBIO_BASE__INST2_SEG2                      0
+#define NBIO_BASE__INST2_SEG3                      0
+#define NBIO_BASE__INST2_SEG4                      0
+#define NBIO_BASE__INST2_SEG5                      0
+
+#define NBIO_BASE__INST3_SEG0                      0
+#define NBIO_BASE__INST3_SEG1                      0
+#define NBIO_BASE__INST3_SEG2                      0
+#define NBIO_BASE__INST3_SEG3                      0
+#define NBIO_BASE__INST3_SEG4                      0
+#define NBIO_BASE__INST3_SEG5                      0
+
+#define NBIO_BASE__INST4_SEG0                      0
+#define NBIO_BASE__INST4_SEG1                      0
+#define NBIO_BASE__INST4_SEG2                      0
+#define NBIO_BASE__INST4_SEG3                      0
+#define NBIO_BASE__INST4_SEG4                      0
+#define NBIO_BASE__INST4_SEG5                      0
+
+#define NBIO_BASE__INST5_SEG0                      0
+#define NBIO_BASE__INST5_SEG1                      0
+#define NBIO_BASE__INST5_SEG2                      0
+#define NBIO_BASE__INST5_SEG3                      0
+#define NBIO_BASE__INST5_SEG4                      0
+#define NBIO_BASE__INST5_SEG5                      0
+
+#define NBIO_BASE__INST6_SEG0                      0
+#define NBIO_BASE__INST6_SEG1                      0
+#define NBIO_BASE__INST6_SEG2                      0
+#define NBIO_BASE__INST6_SEG3                      0
+#define NBIO_BASE__INST6_SEG4                      0
+#define NBIO_BASE__INST6_SEG5                      0
+
+#define NBIO_BASE__INST7_SEG0                      0
+#define NBIO_BASE__INST7_SEG1                      0
+#define NBIO_BASE__INST7_SEG2                      0
+#define NBIO_BASE__INST7_SEG3                      0
+#define NBIO_BASE__INST7_SEG4                      0
+#define NBIO_BASE__INST7_SEG5                      0
+
+#define OSSSYS_BASE__INST0_SEG0                    0x000010A0
+#define OSSSYS_BASE__INST0_SEG1                    0x0240A000
+#define OSSSYS_BASE__INST0_SEG2                    0
+#define OSSSYS_BASE__INST0_SEG3                    0
+#define OSSSYS_BASE__INST0_SEG4                    0
+#define OSSSYS_BASE__INST0_SEG5                    0
+
+#define OSSSYS_BASE__INST1_SEG0                    0
+#define OSSSYS_BASE__INST1_SEG1                    0
+#define OSSSYS_BASE__INST1_SEG2                    0
+#define OSSSYS_BASE__INST1_SEG3                    0
+#define OSSSYS_BASE__INST1_SEG4                    0
+#define OSSSYS_BASE__INST1_SEG5                    0
+
+#define OSSSYS_BASE__INST2_SEG0                    0
+#define OSSSYS_BASE__INST2_SEG1                    0
+#define OSSSYS_BASE__INST2_SEG2                    0
+#define OSSSYS_BASE__INST2_SEG3                    0
+#define OSSSYS_BASE__INST2_SEG4                    0
+#define OSSSYS_BASE__INST2_SEG5                    0
+
+#define OSSSYS_BASE__INST3_SEG0                    0
+#define OSSSYS_BASE__INST3_SEG1                    0
+#define OSSSYS_BASE__INST3_SEG2                    0
+#define OSSSYS_BASE__INST3_SEG3                    0
+#define OSSSYS_BASE__INST3_SEG4                    0
+#define OSSSYS_BASE__INST3_SEG5                    0
+
+#define OSSSYS_BASE__INST4_SEG0                    0
+#define OSSSYS_BASE__INST4_SEG1                    0
+#define OSSSYS_BASE__INST4_SEG2                    0
+#define OSSSYS_BASE__INST4_SEG3                    0
+#define OSSSYS_BASE__INST4_SEG4                    0
+#define OSSSYS_BASE__INST4_SEG5                    0
+
+#define OSSSYS_BASE__INST5_SEG0                    0
+#define OSSSYS_BASE__INST5_SEG1                    0
+#define OSSSYS_BASE__INST5_SEG2                    0
+#define OSSSYS_BASE__INST5_SEG3                    0
+#define OSSSYS_BASE__INST5_SEG4                    0
+#define OSSSYS_BASE__INST5_SEG5                    0
+
+#define OSSSYS_BASE__INST6_SEG0                    0
+#define OSSSYS_BASE__INST6_SEG1                    0
+#define OSSSYS_BASE__INST6_SEG2                    0
+#define OSSSYS_BASE__INST6_SEG3                    0
+#define OSSSYS_BASE__INST6_SEG4                    0
+#define OSSSYS_BASE__INST6_SEG5                    0
+
+#define OSSSYS_BASE__INST7_SEG0                    0
+#define OSSSYS_BASE__INST7_SEG1                    0
+#define OSSSYS_BASE__INST7_SEG2                    0
+#define OSSSYS_BASE__INST7_SEG3                    0
+#define OSSSYS_BASE__INST7_SEG4                    0
+#define OSSSYS_BASE__INST7_SEG5                    0
+
+#define PCIE0_BASE__INST0_SEG0                     0x00000000
+#define PCIE0_BASE__INST0_SEG1                     0x00000014
+#define PCIE0_BASE__INST0_SEG2                     0x00000D20
+#define PCIE0_BASE__INST0_SEG3                     0x00010400
+#define PCIE0_BASE__INST0_SEG4                     0x0241B000
+#define PCIE0_BASE__INST0_SEG5                     0x04040000
+
+#define PCIE0_BASE__INST1_SEG0                     0
+#define PCIE0_BASE__INST1_SEG1                     0
+#define PCIE0_BASE__INST1_SEG2                     0
+#define PCIE0_BASE__INST1_SEG3                     0
+#define PCIE0_BASE__INST1_SEG4                     0
+#define PCIE0_BASE__INST1_SEG5                     0
+
+#define PCIE0_BASE__INST2_SEG0                     0
+#define PCIE0_BASE__INST2_SEG1                     0
+#define PCIE0_BASE__INST2_SEG2                     0
+#define PCIE0_BASE__INST2_SEG3                     0
+#define PCIE0_BASE__INST2_SEG4                     0
+#define PCIE0_BASE__INST2_SEG5                     0
+
+#define PCIE0_BASE__INST3_SEG0                     0
+#define PCIE0_BASE__INST3_SEG1                     0
+#define PCIE0_BASE__INST3_SEG2                     0
+#define PCIE0_BASE__INST3_SEG3                     0
+#define PCIE0_BASE__INST3_SEG4                     0
+#define PCIE0_BASE__INST3_SEG5                     0
+
+#define PCIE0_BASE__INST4_SEG0                     0
+#define PCIE0_BASE__INST4_SEG1                     0
+#define PCIE0_BASE__INST4_SEG2                     0
+#define PCIE0_BASE__INST4_SEG3                     0
+#define PCIE0_BASE__INST4_SEG4                     0
+#define PCIE0_BASE__INST4_SEG5                     0
+
+#define PCIE0_BASE__INST5_SEG0                     0
+#define PCIE0_BASE__INST5_SEG1                     0
+#define PCIE0_BASE__INST5_SEG2                     0
+#define PCIE0_BASE__INST5_SEG3                     0
+#define PCIE0_BASE__INST5_SEG4                     0
+#define PCIE0_BASE__INST5_SEG5                     0
+
+#define PCIE0_BASE__INST6_SEG0                     0
+#define PCIE0_BASE__INST6_SEG1                     0
+#define PCIE0_BASE__INST6_SEG2                     0
+#define PCIE0_BASE__INST6_SEG3                     0
+#define PCIE0_BASE__INST6_SEG4                     0
+#define PCIE0_BASE__INST6_SEG5                     0
+
+#define PCIE0_BASE__INST7_SEG0                     0
+#define PCIE0_BASE__INST7_SEG1                     0
+#define PCIE0_BASE__INST7_SEG2                     0
+#define PCIE0_BASE__INST7_SEG3                     0
+#define PCIE0_BASE__INST7_SEG4                     0
+#define PCIE0_BASE__INST7_SEG5                     0
+
+#define SMUIO_BASE__INST0_SEG0                      0x00016800
+#define SMUIO_BASE__INST0_SEG1                      0x00016A00
+#define SMUIO_BASE__INST0_SEG2                      0x02401000
+#define SMUIO_BASE__INST0_SEG3                      0x00440000
+#define SMUIO_BASE__INST0_SEG4                      0
+#define SMUIO_BASE__INST0_SEG5                      0
+
+#define SMUIO_BASE__INST1_SEG0                      0x0001BC00
+#define SMUIO_BASE__INST1_SEG1                      0x0242D400
+#define SMUIO_BASE__INST1_SEG2                      0
+#define SMUIO_BASE__INST1_SEG3                      0
+#define SMUIO_BASE__INST1_SEG4                      0
+#define SMUIO_BASE__INST1_SEG5                      0
+
+#define SMUIO_BASE__INST2_SEG0                      0
+#define SMUIO_BASE__INST2_SEG1                      0
+#define SMUIO_BASE__INST2_SEG2                      0
+#define SMUIO_BASE__INST2_SEG3                      0
+#define SMUIO_BASE__INST2_SEG4                      0
+#define SMUIO_BASE__INST2_SEG5                      0
+
+#define SMUIO_BASE__INST3_SEG0                      0
+#define SMUIO_BASE__INST3_SEG1                      0
+#define SMUIO_BASE__INST3_SEG2                      0
+#define SMUIO_BASE__INST3_SEG3                      0
+#define SMUIO_BASE__INST3_SEG4                      0
+#define SMUIO_BASE__INST3_SEG5                      0
+
+#define SMUIO_BASE__INST4_SEG0                      0
+#define SMUIO_BASE__INST4_SEG1                      0
+#define SMUIO_BASE__INST4_SEG2                      0
+#define SMUIO_BASE__INST4_SEG3                      0
+#define SMUIO_BASE__INST4_SEG4                      0
+#define SMUIO_BASE__INST4_SEG5                      0
+
+#define SMUIO_BASE__INST5_SEG0                      0
+#define SMUIO_BASE__INST5_SEG1                      0
+#define SMUIO_BASE__INST5_SEG2                      0
+#define SMUIO_BASE__INST5_SEG3                      0
+#define SMUIO_BASE__INST5_SEG4                      0
+#define SMUIO_BASE__INST5_SEG5                      0
+
+#define SMUIO_BASE__INST6_SEG0                      0
+#define SMUIO_BASE__INST6_SEG1                      0
+#define SMUIO_BASE__INST6_SEG2                      0
+#define SMUIO_BASE__INST6_SEG3                      0
+#define SMUIO_BASE__INST6_SEG4                      0
+#define SMUIO_BASE__INST6_SEG5                      0
+
+#define SMUIO_BASE__INST7_SEG0                      0
+#define SMUIO_BASE__INST7_SEG1                      0
+#define SMUIO_BASE__INST7_SEG2                      0
+#define SMUIO_BASE__INST7_SEG3                      0
+#define SMUIO_BASE__INST7_SEG4                      0
+#define SMUIO_BASE__INST7_SEG5                      0
+
+#define THM_BASE__INST0_SEG0                       0x00016600
+#define THM_BASE__INST0_SEG1                       0x02400C00
+#define THM_BASE__INST0_SEG2                       0
+#define THM_BASE__INST0_SEG3                       0
+#define THM_BASE__INST0_SEG4                       0
+#define THM_BASE__INST0_SEG5                       0
+
+#define THM_BASE__INST1_SEG0                       0
+#define THM_BASE__INST1_SEG1                       0
+#define THM_BASE__INST1_SEG2                       0
+#define THM_BASE__INST1_SEG3                       0
+#define THM_BASE__INST1_SEG4                       0
+#define THM_BASE__INST1_SEG5                       0
+
+#define THM_BASE__INST2_SEG0                       0
+#define THM_BASE__INST2_SEG1                       0
+#define THM_BASE__INST2_SEG2                       0
+#define THM_BASE__INST2_SEG3                       0
+#define THM_BASE__INST2_SEG4                       0
+#define THM_BASE__INST2_SEG5                       0
+
+#define THM_BASE__INST3_SEG0                       0
+#define THM_BASE__INST3_SEG1                       0
+#define THM_BASE__INST3_SEG2                       0
+#define THM_BASE__INST3_SEG3                       0
+#define THM_BASE__INST3_SEG4                       0
+#define THM_BASE__INST3_SEG5                       0
+
+#define THM_BASE__INST4_SEG0                       0
+#define THM_BASE__INST4_SEG1                       0
+#define THM_BASE__INST4_SEG2                       0
+#define THM_BASE__INST4_SEG3                       0
+#define THM_BASE__INST4_SEG4                       0
+#define THM_BASE__INST4_SEG5                       0
+
+#define THM_BASE__INST5_SEG0                       0
+#define THM_BASE__INST5_SEG1                       0
+#define THM_BASE__INST5_SEG2                       0
+#define THM_BASE__INST5_SEG3                       0
+#define THM_BASE__INST5_SEG4                       0
+#define THM_BASE__INST5_SEG5                       0
+
+#define THM_BASE__INST6_SEG0                       0
+#define THM_BASE__INST6_SEG1                       0
+#define THM_BASE__INST6_SEG2                       0
+#define THM_BASE__INST6_SEG3                       0
+#define THM_BASE__INST6_SEG4                       0
+#define THM_BASE__INST6_SEG5                       0
+
+#define THM_BASE__INST7_SEG0                       0
+#define THM_BASE__INST7_SEG1                       0
+#define THM_BASE__INST7_SEG2                       0
+#define THM_BASE__INST7_SEG3                       0
+#define THM_BASE__INST7_SEG4                       0
+#define THM_BASE__INST7_SEG5                       0
+
+#define UMC_BASE__INST0_SEG0                       0x00014000
+#define UMC_BASE__INST0_SEG1                       0x02425800
+#define UMC_BASE__INST0_SEG2                       0
+#define UMC_BASE__INST0_SEG3                       0
+#define UMC_BASE__INST0_SEG4                       0
+#define UMC_BASE__INST0_SEG5                       0
+
+#define UMC_BASE__INST1_SEG0                       0x00054000
+#define UMC_BASE__INST1_SEG1                       0x02425C00
+#define UMC_BASE__INST1_SEG2                       0
+#define UMC_BASE__INST1_SEG3                       0
+#define UMC_BASE__INST1_SEG4                       0
+#define UMC_BASE__INST1_SEG5                       0
+
+#define UMC_BASE__INST2_SEG0                       0x00094000
+#define UMC_BASE__INST2_SEG1                       0x02426000
+#define UMC_BASE__INST2_SEG2                       0
+#define UMC_BASE__INST2_SEG3                       0
+#define UMC_BASE__INST2_SEG4                       0
+#define UMC_BASE__INST2_SEG5                       0
+
+#define UMC_BASE__INST3_SEG0                       0x000D4000
+#define UMC_BASE__INST3_SEG1                       0x02426400
+#define UMC_BASE__INST3_SEG2                       0
+#define UMC_BASE__INST3_SEG3                       0
+#define UMC_BASE__INST3_SEG4                       0
+#define UMC_BASE__INST3_SEG5                       0
+
+#define UMC_BASE__INST4_SEG0                       0
+#define UMC_BASE__INST4_SEG1                       0
+#define UMC_BASE__INST4_SEG2                       0
+#define UMC_BASE__INST4_SEG3                       0
+#define UMC_BASE__INST4_SEG4                       0
+#define UMC_BASE__INST4_SEG5                       0
+
+#define UMC_BASE__INST5_SEG0                       0
+#define UMC_BASE__INST5_SEG1                       0
+#define UMC_BASE__INST5_SEG2                       0
+#define UMC_BASE__INST5_SEG3                       0
+#define UMC_BASE__INST5_SEG4                       0
+#define UMC_BASE__INST5_SEG5                       0
+
+#define UMC_BASE__INST6_SEG0                       0
+#define UMC_BASE__INST6_SEG1                       0
+#define UMC_BASE__INST6_SEG2                       0
+#define UMC_BASE__INST6_SEG3                       0
+#define UMC_BASE__INST6_SEG4                       0
+#define UMC_BASE__INST6_SEG5                       0
+
+#define UMC_BASE__INST7_SEG0                       0
+#define UMC_BASE__INST7_SEG1                       0
+#define UMC_BASE__INST7_SEG2                       0
+#define UMC_BASE__INST7_SEG3                       0
+#define UMC_BASE__INST7_SEG4                       0
+#define UMC_BASE__INST7_SEG5                       0
+
+#define USB_BASE__INST0_SEG0                       0x0242A800
+#define USB_BASE__INST0_SEG1                       0x05B00000
+#define USB_BASE__INST0_SEG2                       0
+#define USB_BASE__INST0_SEG3                       0
+#define USB_BASE__INST0_SEG4                       0
+#define USB_BASE__INST0_SEG5                       0
+
+#define USB_BASE__INST1_SEG0                       0x0242AC00
+#define USB_BASE__INST1_SEG1                       0x05B80000
+#define USB_BASE__INST1_SEG2                       0
+#define USB_BASE__INST1_SEG3                       0
+#define USB_BASE__INST1_SEG4                       0
+#define USB_BASE__INST1_SEG5                       0
+
+#define USB_BASE__INST2_SEG0                       0x0242B000
+#define USB_BASE__INST2_SEG1                       0x05C00000
+#define USB_BASE__INST2_SEG2                       0
+#define USB_BASE__INST2_SEG3                       0
+#define USB_BASE__INST2_SEG4                       0
+#define USB_BASE__INST2_SEG5                       0
+
+#define USB_BASE__INST3_SEG0                       0
+#define USB_BASE__INST3_SEG1                       0
+#define USB_BASE__INST3_SEG2                       0
+#define USB_BASE__INST3_SEG3                       0
+#define USB_BASE__INST3_SEG4                       0
+#define USB_BASE__INST3_SEG5                       0
+
+#define USB_BASE__INST4_SEG0                       0
+#define USB_BASE__INST4_SEG1                       0
+#define USB_BASE__INST4_SEG2                       0
+#define USB_BASE__INST4_SEG3                       0
+#define USB_BASE__INST4_SEG4                       0
+#define USB_BASE__INST4_SEG5                       0
+
+#define USB_BASE__INST5_SEG0                       0
+#define USB_BASE__INST5_SEG1                       0
+#define USB_BASE__INST5_SEG2                       0
+#define USB_BASE__INST5_SEG3                       0
+#define USB_BASE__INST5_SEG4                       0
+#define USB_BASE__INST5_SEG5                       0
+
+#define USB_BASE__INST6_SEG0                       0
+#define USB_BASE__INST6_SEG1                       0
+#define USB_BASE__INST6_SEG2                       0
+#define USB_BASE__INST6_SEG3                       0
+#define USB_BASE__INST6_SEG4                       0
+#define USB_BASE__INST6_SEG5                       0
+
+#define USB_BASE__INST7_SEG0                       0
+#define USB_BASE__INST7_SEG1                       0
+#define USB_BASE__INST7_SEG2                       0
+#define USB_BASE__INST7_SEG3                       0
+#define USB_BASE__INST7_SEG4                       0
+#define USB_BASE__INST7_SEG5                       0
+
+#define VCN_BASE__INST0_SEG0                      0x00007800
+#define VCN_BASE__INST0_SEG1                      0x00007E00
+#define VCN_BASE__INST0_SEG2                      0x02403000
+#define VCN_BASE__INST0_SEG3                      0
+#define VCN_BASE__INST0_SEG4                      0
+#define VCN_BASE__INST0_SEG5                      0
+
+#define VCN_BASE__INST1_SEG0                      0
+#define VCN_BASE__INST1_SEG1                      0
+#define VCN_BASE__INST1_SEG2                      0
+#define VCN_BASE__INST1_SEG3                      0
+#define VCN_BASE__INST1_SEG4                      0
+#define VCN_BASE__INST1_SEG5                      0
+
+#define VCN_BASE__INST2_SEG0                      0
+#define VCN_BASE__INST2_SEG1                      0
+#define VCN_BASE__INST2_SEG2                      0
+#define VCN_BASE__INST2_SEG3                      0
+#define VCN_BASE__INST2_SEG4                      0
+#define VCN_BASE__INST2_SEG5                      0
+
+#define VCN_BASE__INST3_SEG0                      0
+#define VCN_BASE__INST3_SEG1                      0
+#define VCN_BASE__INST3_SEG2                      0
+#define VCN_BASE__INST3_SEG3                      0
+#define VCN_BASE__INST3_SEG4                      0
+#define VCN_BASE__INST3_SEG5                      0
+
+#define VCN_BASE__INST4_SEG0                      0
+#define VCN_BASE__INST4_SEG1                      0
+#define VCN_BASE__INST4_SEG2                      0
+#define VCN_BASE__INST4_SEG3                      0
+#define VCN_BASE__INST4_SEG4                      0
+#define VCN_BASE__INST4_SEG5                      0
+
+#define VCN_BASE__INST5_SEG0                      0
+#define VCN_BASE__INST5_SEG1                      0
+#define VCN_BASE__INST5_SEG2                      0
+#define VCN_BASE__INST5_SEG3                      0
+#define VCN_BASE__INST5_SEG4                      0
+#define VCN_BASE__INST5_SEG5                      0
+
+#define VCN_BASE__INST6_SEG0                      0
+#define VCN_BASE__INST6_SEG1                      0
+#define VCN_BASE__INST6_SEG2                      0
+#define VCN_BASE__INST6_SEG3                      0
+#define VCN_BASE__INST6_SEG4                      0
+#define VCN_BASE__INST6_SEG5                      0
+
+#define VCN_BASE__INST7_SEG0                      0
+#define VCN_BASE__INST7_SEG1                      0
+#define VCN_BASE__INST7_SEG2                      0
+#define VCN_BASE__INST7_SEG3                      0
+#define VCN_BASE__INST7_SEG4                      0
+#define VCN_BASE__INST7_SEG5                      0
+
+#endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
