Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387F286442
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0781C6E94F;
	Wed,  7 Oct 2020 16:32:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA5B6E94F
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:31:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s4so3464945qkf.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzVQN6hSixdCvBPR5goQjaPeFa1p9ZI0mgFOmDFLvlc=;
 b=W0IDxNVYmo7/kQ6N9fhPSpPrmsZiNU5fEE/fxVtDAx6VLQThyZovkFi5ydYBr9Ltnc
 ybq+wthEsJoVXQTbhnBZ2E37QZtMocKX/vnmyglpN5c/LVU5IRUFjHK+r02VxLPNIqVQ
 sR853Kl9kdWC/qur5CNwmJZb0+kLTmTmWkvKaX7DGg1cEZxgKpBmpq6t2gCBu53vctkI
 +OtQNPad7ZRk+35M8YWl+EGOEuX4lsDqPiSRStPSGIrKlp+T7DNQzGUcXidrQuJ79ENA
 FFTf4dGLC7v3Cp1Z8FOJNuM0sbv5sdJvF+oi69MFCZAZQqqYuuwnvbNOeSmLxFGtZm6W
 XfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mzVQN6hSixdCvBPR5goQjaPeFa1p9ZI0mgFOmDFLvlc=;
 b=ik/5BTVBi6kJBLedv5XkItbnnQch1rrceYk8k9zJAlX/8RDUw85kEiFNFN2FQcUX4o
 eV45zbw5AFVSiFTN8polGJkGFZ1/oVKo8naW33SdnOja1JAnij20dHXiwAVe3gruVxQj
 EFXLP60KWp/xslStZ22loY7m7AasAvaWsZXSTG79bayXysbjbIrh2eb0qhxwfsnjD0Jj
 +k8la0B3ACNPYlEGePR9V6saRXo8fEujdD5GNYjo0mkIEDEPJVNaxp3UpXAxEkjQurYW
 TXgHvDqZvpOlf96ynWlLjHysuv1J3do15YaHpNEfRLF78Xf/Y6HBrG45DeqPUp6Kqw8i
 pD/g==
X-Gm-Message-State: AOAM531sbtze0GKtfhEl42LH+AnCtB6oeAtXdjg3D+0WUNyJz2jDfBFk
 a2Wezi6FzY9zvKC/lkNam3A5dOMSEzo=
X-Google-Smtp-Source: ABdhPJyDXfMdlpwM9VyCiqyrC7WdIcIwl/1x1k0hbtRpsAR7eitMueYbu77g3rqdlFcRFndFLs7lfQ==
X-Received: by 2002:ae9:f305:: with SMTP id p5mr1850420qkg.481.1602088317800; 
 Wed, 07 Oct 2020 09:31:57 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:31:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/50] drm/amdgpu: initialize IP offset for dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:30:54 -0400
Message-Id: <20201007163135.1944186-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007163135.1944186-1-alexander.deucher@amd.com>
References: <20201007163135.1944186-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

Add ip offset definition for dimgrey_cavefish and initialize it.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Jiansong Chen <Jiansong.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |    2 +-
 .../amd/amdgpu/dimgrey_cavefish_reg_init.c    |   54 +
 drivers/gpu/drm/amd/amdgpu/nv.c               |    3 +
 drivers/gpu/drm/amd/amdgpu/nv.h               |    1 +
 .../amd/include/dimgrey_cavefish_ip_offset.h  | 1049 +++++++++++++++++
 5 files changed, 1108 insertions(+), 1 deletion(-)
 create mode 100755 drivers/gpu/drm/amd/amdgpu/dimgrey_cavefish_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 60cff3b08eb3..247dd46e1681 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -70,7 +70,7 @@ amdgpu-y += \
 	vi.o mxgpu_vi.o nbio_v6_1.o soc15.o emu_soc.o mxgpu_ai.o nbio_v7_0.o vega10_reg_init.o \
 	vega20_reg_init.o nbio_v7_4.o nbio_v2_3.o nv.o navi10_reg_init.o navi14_reg_init.o \
 	arct_reg_init.o navi12_reg_init.o mxgpu_nv.o sienna_cichlid_reg_init.o vangogh_reg_init.o \
-	nbio_v7_2.o
+	nbio_v7_2.o dimgrey_cavefish_reg_init.o
 
 # add DF block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/dimgrey_cavefish_reg_init.c b/drivers/gpu/drm/amd/amdgpu/dimgrey_cavefish_reg_init.c
new file mode 100755
index 000000000000..e9f177e9e3cf
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/dimgrey_cavefish_reg_init.c
@@ -0,0 +1,54 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#include "dimgrey_cavefish_ip_offset.h"
+
+int dimgrey_cavefish_reg_base_init(struct amdgpu_device *adev)
+{
+	/* HW has more IP blocks,  only initialize the block needed by driver */
+	uint32_t i;
+	for (i = 0 ; i < MAX_INSTANCE ; ++i) {
+		adev->reg_offset[GC_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[HDP_HWIP][i] = (uint32_t *)(&(HDP_BASE.instance[i]));
+		adev->reg_offset[MMHUB_HWIP][i] = (uint32_t *)(&(MMHUB_BASE.instance[i]));
+		adev->reg_offset[ATHUB_HWIP][i] = (uint32_t *)(&(ATHUB_BASE.instance[i]));
+		adev->reg_offset[NBIO_HWIP][i] = (uint32_t *)(&(NBIO_BASE.instance[i]));
+		adev->reg_offset[MP0_HWIP][i] = (uint32_t *)(&(MP0_BASE.instance[i]));
+		adev->reg_offset[MP1_HWIP][i] = (uint32_t *)(&(MP1_BASE.instance[i]));
+		adev->reg_offset[VCN_HWIP][i] = (uint32_t *)(&(VCN0_BASE.instance[i]));
+		adev->reg_offset[DF_HWIP][i] = (uint32_t *)(&(DF_BASE.instance[i]));
+		adev->reg_offset[DCE_HWIP][i] = (uint32_t *)(&(DCN_BASE.instance[i]));
+		adev->reg_offset[OSSSYS_HWIP][i] = (uint32_t *)(&(OSSSYS_BASE.instance[i]));
+		adev->reg_offset[SDMA0_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[SDMA1_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[SDMA2_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[SDMA3_HWIP][i] = (uint32_t *)(&(GC_BASE.instance[i]));
+		adev->reg_offset[SMUIO_HWIP][i] = (uint32_t *)(&(SMUIO_BASE.instance[i]));
+		adev->reg_offset[THM_HWIP][i] = (uint32_t *)(&(THM_BASE.instance[i]));
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 485c8907cc43..a84ea80f6d6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -482,6 +482,9 @@ static int nv_reg_base_init(struct amdgpu_device *adev)
 	case CHIP_VANGOGH:
 		vangogh_reg_base_init(adev);
 		break;
+	case CHIP_DIMGREY_CAVEFISH:
+		dimgrey_cavefish_reg_base_init(adev);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.h b/drivers/gpu/drm/amd/amdgpu/nv.h
index bb17e0f434c9..515d67bf249f 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.h
+++ b/drivers/gpu/drm/amd/amdgpu/nv.h
@@ -35,4 +35,5 @@ int navi14_reg_base_init(struct amdgpu_device *adev);
 int navi12_reg_base_init(struct amdgpu_device *adev);
 int sienna_cichlid_reg_base_init(struct amdgpu_device *adev);
 void vangogh_reg_base_init(struct amdgpu_device *adev);
+int dimgrey_cavefish_reg_base_init(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h b/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h
new file mode 100644
index 000000000000..b41263de8a9b
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/dimgrey_cavefish_ip_offset.h
@@ -0,0 +1,1049 @@
+/*
+ * Copyright (C) 2020  Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included
+ * in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+ * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+#ifndef _dimgrey_cavefish_ip_offset_HEADER
+#define _dimgrey_cavefish_ip_offset_HEADER
+
+#define MAX_INSTANCE                                        7
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
+static const struct IP_BASE ATHUB_BASE = { { { { 0x00000C00, 0x02408C00, 0, 0, 0, 0 } },
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
+                                        { { 0x0001B400, 0x0242E000, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DBGU_IO0_BASE = { { { { 0x000001E0, 0x0240B400, 0, 0, 0, 0 } },
+                                        { { 0x00000260, 0x02413C00, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DF_BASE = { { { { 0x00007000, 0x0240B800, 0, 0, 0, 0 } },
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
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE DPCS_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
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
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE GC_BASE = { { { { 0x00001260, 0x0000A000, 0x0001C000, 0x02402C00, 0, 0 } },
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
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MMHUB_BASE = { { { { 0x0001A000, 0x02408800, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x00DC0000, 0x00E00000, 0x00E40000, 0x0243FC00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE MP1_BASE = { { { { 0x00016200, 0x00E80000, 0x00EC0000, 0x00F00000, 0x02400400, 0 } },
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
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE OSSSYS_BASE = { { { { 0x000010A0, 0x0240A000, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE SMUIO_BASE = { { { { 0x00016800, 0x00016A00, 0x00440000, 0x02401000, 0, 0 } },
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
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE UMC_BASE = { { { { 0x00014000, 0x02425800, 0, 0, 0, 0 } },
+                                        { { 0x00054000, 0x02425C00, 0, 0, 0, 0 } },
+                                        { { 0x00094000, 0x02426000, 0, 0, 0, 0 } },
+                                        { { 0x000D4000, 0x02426400, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+static const struct IP_BASE VCN0_BASE = { { { { 0x00007800, 0x00007E00, 0x02403000, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+
+
+#define ATHUB_BASE__INST0_SEG0                     0x00000C00
+#define ATHUB_BASE__INST0_SEG1                     0x02408C00
+#define ATHUB_BASE__INST0_SEG2                     0
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
+#define DBGU_IO0_BASE__INST0_SEG0                  0x000001E0
+#define DBGU_IO0_BASE__INST0_SEG1                  0x0240B400
+#define DBGU_IO0_BASE__INST0_SEG2                  0
+#define DBGU_IO0_BASE__INST0_SEG3                  0
+#define DBGU_IO0_BASE__INST0_SEG4                  0
+#define DBGU_IO0_BASE__INST0_SEG5                  0
+
+#define DBGU_IO0_BASE__INST1_SEG0                  0x00000260
+#define DBGU_IO0_BASE__INST1_SEG1                  0x02413C00
+#define DBGU_IO0_BASE__INST1_SEG2                  0
+#define DBGU_IO0_BASE__INST1_SEG3                  0
+#define DBGU_IO0_BASE__INST1_SEG4                  0
+#define DBGU_IO0_BASE__INST1_SEG5                  0
+
+#define DBGU_IO0_BASE__INST2_SEG0                  0
+#define DBGU_IO0_BASE__INST2_SEG1                  0
+#define DBGU_IO0_BASE__INST2_SEG2                  0
+#define DBGU_IO0_BASE__INST2_SEG3                  0
+#define DBGU_IO0_BASE__INST2_SEG4                  0
+#define DBGU_IO0_BASE__INST2_SEG5                  0
+
+#define DBGU_IO0_BASE__INST3_SEG0                  0
+#define DBGU_IO0_BASE__INST3_SEG1                  0
+#define DBGU_IO0_BASE__INST3_SEG2                  0
+#define DBGU_IO0_BASE__INST3_SEG3                  0
+#define DBGU_IO0_BASE__INST3_SEG4                  0
+#define DBGU_IO0_BASE__INST3_SEG5                  0
+
+#define DBGU_IO0_BASE__INST4_SEG0                  0
+#define DBGU_IO0_BASE__INST4_SEG1                  0
+#define DBGU_IO0_BASE__INST4_SEG2                  0
+#define DBGU_IO0_BASE__INST4_SEG3                  0
+#define DBGU_IO0_BASE__INST4_SEG4                  0
+#define DBGU_IO0_BASE__INST4_SEG5                  0
+
+#define DBGU_IO0_BASE__INST5_SEG0                  0
+#define DBGU_IO0_BASE__INST5_SEG1                  0
+#define DBGU_IO0_BASE__INST5_SEG2                  0
+#define DBGU_IO0_BASE__INST5_SEG3                  0
+#define DBGU_IO0_BASE__INST5_SEG4                  0
+#define DBGU_IO0_BASE__INST5_SEG5                  0
+
+#define DBGU_IO0_BASE__INST6_SEG0                  0
+#define DBGU_IO0_BASE__INST6_SEG1                  0
+#define DBGU_IO0_BASE__INST6_SEG2                  0
+#define DBGU_IO0_BASE__INST6_SEG3                  0
+#define DBGU_IO0_BASE__INST6_SEG4                  0
+#define DBGU_IO0_BASE__INST6_SEG5                  0
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
+#define GC_BASE__INST0_SEG0                        0x00001260
+#define GC_BASE__INST0_SEG1                        0x0000A000
+#define GC_BASE__INST0_SEG2                        0x0001C000
+#define GC_BASE__INST0_SEG3                        0x02402C00
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
+#define MMHUB_BASE__INST0_SEG0                     0x0001A000
+#define MMHUB_BASE__INST0_SEG1                     0x02408800
+#define MMHUB_BASE__INST0_SEG2                     0
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
+#define MP0_BASE__INST0_SEG0                       0x00016000
+#define MP0_BASE__INST0_SEG1                       0x00DC0000
+#define MP0_BASE__INST0_SEG2                       0x00E00000
+#define MP0_BASE__INST0_SEG3                       0x00E40000
+#define MP0_BASE__INST0_SEG4                       0x0243FC00
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
+#define MP1_BASE__INST0_SEG0                       0x00016200
+#define MP1_BASE__INST0_SEG1                       0x00E80000
+#define MP1_BASE__INST0_SEG2                       0x00EC0000
+#define MP1_BASE__INST0_SEG3                       0x00F00000
+#define MP1_BASE__INST0_SEG4                       0x02400400
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
+#define SMUIO_BASE__INST0_SEG0                     0x00016800
+#define SMUIO_BASE__INST0_SEG1                     0x00016A00
+#define SMUIO_BASE__INST0_SEG2                     0x00440000
+#define SMUIO_BASE__INST0_SEG3                     0x02401000
+#define SMUIO_BASE__INST0_SEG4                     0
+#define SMUIO_BASE__INST0_SEG5                     0
+
+#define SMUIO_BASE__INST1_SEG0                     0
+#define SMUIO_BASE__INST1_SEG1                     0
+#define SMUIO_BASE__INST1_SEG2                     0
+#define SMUIO_BASE__INST1_SEG3                     0
+#define SMUIO_BASE__INST1_SEG4                     0
+#define SMUIO_BASE__INST1_SEG5                     0
+
+#define SMUIO_BASE__INST2_SEG0                     0
+#define SMUIO_BASE__INST2_SEG1                     0
+#define SMUIO_BASE__INST2_SEG2                     0
+#define SMUIO_BASE__INST2_SEG3                     0
+#define SMUIO_BASE__INST2_SEG4                     0
+#define SMUIO_BASE__INST2_SEG5                     0
+
+#define SMUIO_BASE__INST3_SEG0                     0
+#define SMUIO_BASE__INST3_SEG1                     0
+#define SMUIO_BASE__INST3_SEG2                     0
+#define SMUIO_BASE__INST3_SEG3                     0
+#define SMUIO_BASE__INST3_SEG4                     0
+#define SMUIO_BASE__INST3_SEG5                     0
+
+#define SMUIO_BASE__INST4_SEG0                     0
+#define SMUIO_BASE__INST4_SEG1                     0
+#define SMUIO_BASE__INST4_SEG2                     0
+#define SMUIO_BASE__INST4_SEG3                     0
+#define SMUIO_BASE__INST4_SEG4                     0
+#define SMUIO_BASE__INST4_SEG5                     0
+
+#define SMUIO_BASE__INST5_SEG0                     0
+#define SMUIO_BASE__INST5_SEG1                     0
+#define SMUIO_BASE__INST5_SEG2                     0
+#define SMUIO_BASE__INST5_SEG3                     0
+#define SMUIO_BASE__INST5_SEG4                     0
+#define SMUIO_BASE__INST5_SEG5                     0
+
+#define SMUIO_BASE__INST6_SEG0                     0
+#define SMUIO_BASE__INST6_SEG1                     0
+#define SMUIO_BASE__INST6_SEG2                     0
+#define SMUIO_BASE__INST6_SEG3                     0
+#define SMUIO_BASE__INST6_SEG4                     0
+#define SMUIO_BASE__INST6_SEG5                     0
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
+#define VCN0_BASE__INST0_SEG0                      0x00007800
+#define VCN0_BASE__INST0_SEG1                      0x00007E00
+#define VCN0_BASE__INST0_SEG2                      0x02403000
+#define VCN0_BASE__INST0_SEG3                      0
+#define VCN0_BASE__INST0_SEG4                      0
+#define VCN0_BASE__INST0_SEG5                      0
+
+#define VCN0_BASE__INST1_SEG0                      0
+#define VCN0_BASE__INST1_SEG1                      0
+#define VCN0_BASE__INST1_SEG2                      0
+#define VCN0_BASE__INST1_SEG3                      0
+#define VCN0_BASE__INST1_SEG4                      0
+#define VCN0_BASE__INST1_SEG5                      0
+
+#define VCN0_BASE__INST2_SEG0                      0
+#define VCN0_BASE__INST2_SEG1                      0
+#define VCN0_BASE__INST2_SEG2                      0
+#define VCN0_BASE__INST2_SEG3                      0
+#define VCN0_BASE__INST2_SEG4                      0
+#define VCN0_BASE__INST2_SEG5                      0
+
+#define VCN0_BASE__INST3_SEG0                      0
+#define VCN0_BASE__INST3_SEG1                      0
+#define VCN0_BASE__INST3_SEG2                      0
+#define VCN0_BASE__INST3_SEG3                      0
+#define VCN0_BASE__INST3_SEG4                      0
+#define VCN0_BASE__INST3_SEG5                      0
+
+#define VCN0_BASE__INST4_SEG0                      0
+#define VCN0_BASE__INST4_SEG1                      0
+#define VCN0_BASE__INST4_SEG2                      0
+#define VCN0_BASE__INST4_SEG3                      0
+#define VCN0_BASE__INST4_SEG4                      0
+#define VCN0_BASE__INST4_SEG5                      0
+
+#define VCN0_BASE__INST5_SEG0                      0
+#define VCN0_BASE__INST5_SEG1                      0
+#define VCN0_BASE__INST5_SEG2                      0
+#define VCN0_BASE__INST5_SEG3                      0
+#define VCN0_BASE__INST5_SEG4                      0
+#define VCN0_BASE__INST5_SEG5                      0
+
+#define VCN0_BASE__INST6_SEG0                      0
+#define VCN0_BASE__INST6_SEG1                      0
+#define VCN0_BASE__INST6_SEG2                      0
+#define VCN0_BASE__INST6_SEG3                      0
+#define VCN0_BASE__INST6_SEG4                      0
+#define VCN0_BASE__INST6_SEG5                      0
+
+#endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
