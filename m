Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157A222DB5
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Jul 2020 23:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50016EC77;
	Thu, 16 Jul 2020 21:23:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19F6EC77
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jul 2020 21:23:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so8615716wrl.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jul 2020 14:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7sGt/UptC1/Q6PCX8fJzIU7AeY/1z0UjyOg2l9DE7gE=;
 b=ORCRv8qZ+JtPAB8zURsM0GKNZuM87i/eIUXn8khfmBYQv3vOKOyGFPCWOqtOKvBjq8
 Sicx23NlOmbrqXHTkLJXF0h39bvzcm45d0QfStgP0RCXNtaNRmJdenU33I3qcCBdM4np
 Bukw7qNnCtFCX//aMj+zDmN6SVM9GlfpCtYvbzvv+zX5QNmfrL2vLU9aTr5vBXyOHDTo
 1qD/B4cCbMjd8la40CPof4aN5zgdZhz2B3l3LL2rTYAVA8U/l88R5oV94wZIjwsRg3mK
 Fw/ZQ4hyzvBgYO+Ny7t3eRgcrnSk4WYCgkWILPRE0C4mbSQ5LIKbzK2eRhLaTj8Dm1Dq
 FtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7sGt/UptC1/Q6PCX8fJzIU7AeY/1z0UjyOg2l9DE7gE=;
 b=QDClwezomkZjrKIAkXYXtlgUTcWJEFwhpmPZwVs22bTTLNbiRPv3HeOLx4Xk/l2S9j
 Z6tO3RgV1j43qIvyLDrwlrPj4bawy3ai4Ot+72K0a9/543i9IC6h+IEd+mJPpNQADuP6
 6U+vVlPVWQM0vcWh7La7MAq2LmMRtboD9W0e3tdoTdmXKqgTtfWsSxy3JuBLRVDR2ZQM
 03zM7WJwO7SH6R3GTZYwQV3nMJJAmTKx2l09wX4k/QnxOAnUnXcus0X49Lg6pddElr0+
 fkHoepBppdLMpwuZ1vagi8+7NtSh16cbWSK83QpmeRf5hArG0r5eOG7DfbO/altYhThS
 nFvQ==
X-Gm-Message-State: AOAM530DhctDuk/6JXRnIeDI9hi9NHXGPe0FIHvaOQqG0cXccU/5QHPd
 LSAXNxIOsVc18LlaRkMi0YZUHB8Nj10=
X-Google-Smtp-Source: ABdhPJxbe22DSXdoETAlsU/Fj1/qr8G0rtMy/TY3y91ebez2Sk6bHXoYt30TlDuclkK8HcG3D8AgRQ==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr6884469wrw.6.1594934590853;
 Thu, 16 Jul 2020 14:23:10 -0700 (PDT)
Received: from utente-Giga.homenet.telecomitalia.it
 (host-79-21-65-179.retail.telecomitalia.it. [79.21.65.179])
 by smtp.googlemail.com with ESMTPSA id c15sm10288696wme.23.2020.07.16.14.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:23:10 -0700 (PDT)
From: Mauro Rossi <issor.oruam@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/27] drm/amd/display: dc/dce: add initial DCE6 support
 (v9b)
Date: Thu, 16 Jul 2020 23:22:27 +0200
Message-Id: <20200716212251.1539094-4-issor.oruam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716212251.1539094-1-issor.oruam@gmail.com>
References: <20200716212251.1539094-1-issor.oruam@gmail.com>
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
Cc: alexander.deucher@amd.com, Mauro Rossi <issor.oruam@gmail.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
DCE6 chipsets have a lot in common with DCE8, let's start from this

[How]
DCE6 targets are added replicating existing DCE8 implementation.

NOTE: dce_8_0_{d,sh_mask}.h headers used instead of dce_6_0_{d,sh_mask}.h
initial build prototype due to missing DCE6 macros/registers/masks
DCE6 specific macros/registers/masks will be added with later commits

(v2b) removed dce_version cases in dc/dce/dce_clock_source.c and
     updated dce60 due to following kernel 5.0 commits:
     24f7dd7 ("drm/amd/display: move pplib/smu notification to dccg block")
     9566b67 ("drm/amd/display: remove safe_to_lower flag from dc, use 2 functions instead")
     4244381 ("drm/amd/display: clean up base dccg struct")
     4c5e8b5 ("drm/amd/display: split dccg clock manager into asic folders")
     84e7fc0 ("drm/amd/display: rename dccg to clk_mgr")
     77f6916 ("drm/amd/display: Remove duplicate header")
     9f7ddbe ("drm/amd/display: fix optimize_bandwidth func pointer for dce80")
     4ece61a ("drm/amd/display: set clocks to 0 on suspend on dce80")

(v3b) updated dce60 due to following kernel 5.1 commits:
     380604e ("drm/amd/display: Use 100 Hz precision for pipe pixel clocks")
     32e6136 ("drm/amd/display: Fix 64-bit division for 32-bit builds")
     1877ccf ("drm/amd/display: Change from aux_engine to dce_aux")
     c69dffa ("drm/amd/display: fix eDP fast bootup for pre-raven asic")

(v4b) updated dce60 due to following kernel 5.2 commits:
     e5c4197 ("drm/amd/display: Add plane capabilities to dc_caps")
     813d20d ("drm/amd/display: Fix multi-thread writing to 1 state")
     ea36ad3 ("drm/amd/display: expand plane caps to include fp16 and scaling capability")
     afcd526 ("drm/amd/display: Add fast_validate parameter")

(v5b) updated dce60 due to following kernel 5.3 commits:
     e7e10c4 ("drm/amd/display: stop external access to internal optc sync params")
     78cc70b ("drm/amd/display: Engine-specific encoder allocation")
     dc88b4a ("drm/amd/display: make clk mgr soc specific")
     4fc4dca ("drm/amd: drop use of drmp.h in os_types.h")

(v6b) updated dce60 due to following kernel 5.4 commits:
     54a9bcb ("drm/amd/display: Fix a typo - dce_aduio_mask --> dce_audio_mask")
     9adc805 ("drm/amd/display: make firmware info only load once during dc_bios create")

(v7b) updated dce60 due to following kernel 5.5 commits:
     cabe144 ("drm/amd/display: memory leak")
     8276dd8 ("drm/amd/display: update register field access mechanism")
     f6040a4 ("drm/amd/display: configurable aux timeout support")
     bf7f5ac ("drm/amd/display: map TRANSMITTER_UNIPHY_x to LINK_REGS_x")

(v8b) updated dce60 due to following kernel 5.6 commits:
     d9e3267 ("drm/amd/display: cleanup of construct and destruct funcs")
     f42ea55 ("drm/amd/display: add separate of private hwss functions")

(v9b) updated dce60 due to following kernel 5.8 commits:
     bba8289 ("drm/amd/display: code clean up in dce80_hw_sequencer.c")
     904fb6e ("drm/amd/display: move panel power seq to new panel struct")
     d4caa72 ("drm/amd/display: change from panel to panel cntl")

Signed-off-by: Mauro Rossi <issor.oruam@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |    4 +
 drivers/gpu/drm/amd/display/dc/dce60/Makefile |   34 +
 .../amd/display/dc/dce60/dce60_hw_sequencer.c |   54 +
 .../amd/display/dc/dce60/dce60_hw_sequencer.h |   37 +
 .../drm/amd/display/dc/dce60/dce60_resource.c | 1536 +++++++++++++++++
 .../drm/amd/display/dc/dce60/dce60_resource.h |   47 +
 .../display/dc/dce60/dce60_timing_generator.c |  247 +++
 .../display/dc/dce60/dce60_timing_generator.h |   39 +
 8 files changed, 1998 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index e0f4f1be1618..047b1e2dd8f1 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -43,6 +43,10 @@ DC_LIBS += dce110
 DC_LIBS += dce100
 DC_LIBS += dce80
 
+ifdef CONFIG_DRM_AMD_DC_SI
+DC_LIBS += dce60
+endif
+
 ifdef CONFIG_DRM_AMD_DC_HDCP
 DC_LIBS += hdcp
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/Makefile b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
new file mode 100644
index 000000000000..7036c3bd0f87
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
@@ -0,0 +1,34 @@
+#
+# Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+#
+# Makefile for the 'controller' sub-component of DAL.
+# It provides the control and status of HW CRTC block.
+
+DCE60 = dce60_timing_generator.o dce60_hw_sequencer.o \
+	dce60_resource.o
+
+AMD_DAL_DCE60 = $(addprefix $(AMDDALPATH)/dc/dce60/,$(DCE60))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCE60)
+
+
+
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
new file mode 100644
index 000000000000..e30e3510ec4a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
@@ -0,0 +1,54 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
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
+ * Authors: AMD
+ *
+ */
+
+#include "dm_services.h"
+#include "dc.h"
+#include "core_types.h"
+#include "dce60_hw_sequencer.h"
+
+#include "dce/dce_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dce100/dce100_hw_sequencer.h"
+
+/* include DCE8 register header files */
+#include "dce/dce_6_0_d.h"
+#include "dce/dce_6_0_sh_mask.h"
+
+/*******************************************************************************
+ * Private definitions
+ ******************************************************************************/
+
+/***************************PIPE_CONTROL***********************************/
+
+void dce60_hw_sequencer_construct(struct dc *dc)
+{
+	dce110_hw_sequencer_construct(dc);
+
+	dc->hwseq->funcs.enable_display_power_gating = dce100_enable_display_power_gating;
+	dc->hwss.pipe_control_lock = dce_pipe_control_lock;
+	dc->hwss.prepare_bandwidth = dce100_prepare_bandwidth;
+	dc->hwss.optimize_bandwidth = dce100_optimize_bandwidth;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.h
new file mode 100644
index 000000000000..f3b2d8b60d5b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HWSS_DCE60_H__
+#define __DC_HWSS_DCE60_H__
+
+#include "core_types.h"
+#include "hw_sequencer_private.h"
+
+struct dc;
+
+void dce60_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_HWSS_DCE60_H__ */
+
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
new file mode 100644
index 000000000000..9d21cfba6009
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -0,0 +1,1536 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
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
+ * Authors: AMD
+ *
+ */
+
+#include <linux/slab.h>
+
+#include "dce/dce_8_0_d.h"
+#include "dce/dce_8_0_sh_mask.h"
+
+#include "dm_services.h"
+
+#include "link_encoder.h"
+#include "stream_encoder.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "irq/dce60/irq_service_dce60.h"
+#include "dce110/dce110_timing_generator.h"
+#include "dce110/dce110_resource.h"
+#include "dce60/dce60_timing_generator.h"
+#include "dce/dce_mem_input.h"
+#include "dce/dce_link_encoder.h"
+#include "dce/dce_stream_encoder.h"
+#include "dce/dce_ipp.h"
+#include "dce/dce_transform.h"
+#include "dce/dce_opp.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "dce60/dce60_hw_sequencer.h"
+#include "dce100/dce100_resource.h"
+#include "dce/dce_panel_cntl.h"
+
+#include "reg_helper.h"
+
+#include "dce/dce_dmcu.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_abm.h"
+#include "dce/dce_i2c.h"
+/* TODO remove this include */
+
+#ifndef mmMC_HUB_RDREQ_DMIF_LIMIT
+#include "gmc/gmc_6_0_d.h"
+#include "gmc/gmc_6_0_sh_mask.h"
+#endif
+
+#ifndef mmDP_DPHY_INTERNAL_CTRL
+#define mmDP_DPHY_INTERNAL_CTRL                         0x1CDE
+#define mmDP0_DP_DPHY_INTERNAL_CTRL                     0x1CDE
+#define mmDP1_DP_DPHY_INTERNAL_CTRL                     0x1FDE
+#define mmDP2_DP_DPHY_INTERNAL_CTRL                     0x42DE
+#define mmDP3_DP_DPHY_INTERNAL_CTRL                     0x45DE
+#define mmDP4_DP_DPHY_INTERNAL_CTRL                     0x48DE
+#define mmDP5_DP_DPHY_INTERNAL_CTRL                     0x4BDE
+#define mmDP6_DP_DPHY_INTERNAL_CTRL                     0x4EDE
+#endif
+
+
+#ifndef mmBIOS_SCRATCH_2
+	#define mmBIOS_SCRATCH_2 0x05CB
+	#define mmBIOS_SCRATCH_3 0x05CC
+	#define mmBIOS_SCRATCH_6 0x05CF
+#endif
+
+#ifndef mmDP_DPHY_FAST_TRAINING
+	#define mmDP_DPHY_FAST_TRAINING                         0x1CCE
+	#define mmDP0_DP_DPHY_FAST_TRAINING                     0x1CCE
+	#define mmDP1_DP_DPHY_FAST_TRAINING                     0x1FCE
+	#define mmDP2_DP_DPHY_FAST_TRAINING                     0x42CE
+	#define mmDP3_DP_DPHY_FAST_TRAINING                     0x45CE
+	#define mmDP4_DP_DPHY_FAST_TRAINING                     0x48CE
+	#define mmDP5_DP_DPHY_FAST_TRAINING                     0x4BCE
+	#define mmDP6_DP_DPHY_FAST_TRAINING                     0x4ECE
+#endif
+
+
+#ifndef mmHPD_DC_HPD_CONTROL
+	#define mmHPD_DC_HPD_CONTROL                            0x189A
+	#define mmHPD0_DC_HPD_CONTROL                           0x189A
+	#define mmHPD1_DC_HPD_CONTROL                           0x18A2
+	#define mmHPD2_DC_HPD_CONTROL                           0x18AA
+	#define mmHPD3_DC_HPD_CONTROL                           0x18B2
+	#define mmHPD4_DC_HPD_CONTROL                           0x18BA
+	#define mmHPD5_DC_HPD_CONTROL                           0x18C2
+#endif
+
+#define DCE11_DIG_FE_CNTL 0x4a00
+#define DCE11_DIG_BE_CNTL 0x4a47
+#define DCE11_DP_SEC 0x4ac3
+
+static const struct dce110_timing_generator_offsets dce60_tg_offsets[] = {
+		{
+			.crtc = (mmCRTC0_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp =  (mmGRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG0_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		},
+		{
+			.crtc = (mmCRTC1_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp = (mmDCP1_GRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG1_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		},
+		{
+			.crtc = (mmCRTC2_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp = (mmDCP2_GRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG2_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		},
+		{
+			.crtc = (mmCRTC3_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp = (mmDCP3_GRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG3_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		},
+		{
+			.crtc = (mmCRTC4_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp = (mmDCP4_GRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG4_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		},
+		{
+			.crtc = (mmCRTC5_CRTC_CONTROL - mmCRTC_CONTROL),
+			.dcp = (mmDCP5_GRPH_CONTROL - mmGRPH_CONTROL),
+			.dmif = (mmDMIF_PG5_DPG_WATERMARK_MASK_CONTROL
+					- mmDPG_WATERMARK_MASK_CONTROL),
+		}
+};
+
+/* set register offset */
+#define SR(reg_name)\
+	.reg_name = mm ## reg_name
+
+/* set register offset with instance */
+#define SRI(reg_name, block, id)\
+	.reg_name = mm ## block ## id ## _ ## reg_name
+
+#define ipp_regs(id)\
+[id] = {\
+		IPP_COMMON_REG_LIST_DCE_BASE(id)\
+}
+
+static const struct dce_ipp_registers ipp_regs[] = {
+		ipp_regs(0),
+		ipp_regs(1),
+		ipp_regs(2),
+		ipp_regs(3),
+		ipp_regs(4),
+		ipp_regs(5)
+};
+
+static const struct dce_ipp_shift ipp_shift = {
+		IPP_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(__SHIFT)
+};
+
+static const struct dce_ipp_mask ipp_mask = {
+		IPP_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(_MASK)
+};
+
+#define transform_regs(id)\
+[id] = {\
+		XFM_COMMON_REG_LIST_DCE80(id)\
+}
+
+static const struct dce_transform_registers xfm_regs[] = {
+		transform_regs(0),
+		transform_regs(1),
+		transform_regs(2),
+		transform_regs(3),
+		transform_regs(4),
+		transform_regs(5)
+};
+
+static const struct dce_transform_shift xfm_shift = {
+		XFM_COMMON_MASK_SH_LIST_DCE80(__SHIFT)
+};
+
+static const struct dce_transform_mask xfm_mask = {
+		XFM_COMMON_MASK_SH_LIST_DCE80(_MASK)
+};
+
+#define aux_regs(id)\
+[id] = {\
+	AUX_REG_LIST(id)\
+}
+
+static const struct dce110_link_enc_aux_registers link_enc_aux_regs[] = {
+	aux_regs(0),
+	aux_regs(1),
+	aux_regs(2),
+	aux_regs(3),
+	aux_regs(4),
+	aux_regs(5)
+};
+
+#define hpd_regs(id)\
+[id] = {\
+	HPD_REG_LIST(id)\
+}
+
+static const struct dce110_link_enc_hpd_registers link_enc_hpd_regs[] = {
+		hpd_regs(0),
+		hpd_regs(1),
+		hpd_regs(2),
+		hpd_regs(3),
+		hpd_regs(4),
+		hpd_regs(5)
+};
+
+#define link_regs(id)\
+[id] = {\
+	LE_DCE80_REG_LIST(id)\
+}
+
+static const struct dce110_link_enc_registers link_enc_regs[] = {
+	link_regs(0),
+	link_regs(1),
+	link_regs(2),
+	link_regs(3),
+	link_regs(4),
+	link_regs(5),
+	link_regs(6),
+};
+
+#define stream_enc_regs(id)\
+[id] = {\
+	SE_COMMON_REG_LIST_DCE_BASE(id),\
+	.AFMT_CNTL = 0,\
+}
+
+static const struct dce110_stream_enc_registers stream_enc_regs[] = {
+	stream_enc_regs(0),
+	stream_enc_regs(1),
+	stream_enc_regs(2),
+	stream_enc_regs(3),
+	stream_enc_regs(4),
+	stream_enc_regs(5),
+	stream_enc_regs(6)
+};
+
+static const struct dce_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCE80_100(__SHIFT)
+};
+
+static const struct dce_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCE80_100(_MASK)
+};
+
+static const struct dce_panel_cntl_registers panel_cntl_regs[] = {
+	{ DCE_PANEL_CNTL_REG_LIST() }
+};
+
+static const struct dce_panel_cntl_shift panel_cntl_shift = {
+	DCE_PANEL_CNTL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_cntl_mask panel_cntl_mask = {
+	DCE_PANEL_CNTL_MASK_SH_LIST(_MASK)
+};
+
+#define opp_regs(id)\
+[id] = {\
+	OPP_DCE_80_REG_LIST(id),\
+}
+
+static const struct dce_opp_registers opp_regs[] = {
+	opp_regs(0),
+	opp_regs(1),
+	opp_regs(2),
+	opp_regs(3),
+	opp_regs(4),
+	opp_regs(5)
+};
+
+static const struct dce_opp_shift opp_shift = {
+	OPP_COMMON_MASK_SH_LIST_DCE_80(__SHIFT)
+};
+
+static const struct dce_opp_mask opp_mask = {
+	OPP_COMMON_MASK_SH_LIST_DCE_80(_MASK)
+};
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCE10_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCE10_AUX_MASK_SH_LIST(_MASK)
+};
+
+#define aux_engine_regs(id)\
+[id] = {\
+	AUX_COMMON_REG_LIST(id), \
+	.AUX_RESET_MASK = 0 \
+}
+
+static const struct dce110_aux_registers aux_engine_regs[] = {
+		aux_engine_regs(0),
+		aux_engine_regs(1),
+		aux_engine_regs(2),
+		aux_engine_regs(3),
+		aux_engine_regs(4),
+		aux_engine_regs(5)
+};
+
+#define audio_regs(id)\
+[id] = {\
+	AUD_COMMON_REG_LIST(id)\
+}
+
+static const struct dce_audio_registers audio_regs[] = {
+	audio_regs(0),
+	audio_regs(1),
+	audio_regs(2),
+	audio_regs(3),
+	audio_regs(4),
+	audio_regs(5),
+	audio_regs(6),
+};
+
+static const struct dce_audio_shift audio_shift = {
+		AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define clk_src_regs(id)\
+[id] = {\
+	CS_COMMON_REG_LIST_DCE_80(id),\
+}
+
+
+static const struct dce110_clk_src_regs clk_src_regs[] = {
+	clk_src_regs(0),
+	clk_src_regs(1),
+	clk_src_regs(2)
+};
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(_MASK)
+};
+
+static const struct bios_registers bios_regs = {
+	.BIOS_SCRATCH_3 = mmBIOS_SCRATCH_3,
+	.BIOS_SCRATCH_6 = mmBIOS_SCRATCH_6
+};
+
+static const struct resource_caps res_cap = {
+		.num_timing_generator = 6,
+		.num_audio = 6,
+		.num_stream_encoder = 6,
+		.num_pll = 2,
+		.num_ddc = 6,
+};
+
+static const struct resource_caps res_cap_61 = {
+		.num_timing_generator = 4,
+		.num_audio = 6,
+		.num_stream_encoder = 6,
+		.num_pll = 2,
+		.num_ddc = 6,
+};
+
+static const struct resource_caps res_cap_64 = {
+		.num_timing_generator = 2,
+		.num_audio = 2,
+		.num_stream_encoder = 2,
+		.num_pll = 2,
+		.num_ddc = 2,
+};
+
+static const struct dc_plane_cap plane_cap = {
+	.type = DC_PLANE_TYPE_DCE_RGB,
+
+	.pixel_format_support = {
+			.argb8888 = true,
+			.nv12 = false,
+			.fp16 = false
+	},
+
+	.max_upscale_factor = {
+			.argb8888 = 16000,
+			.nv12 = 1,
+			.fp16 = 1
+	},
+
+	.max_downscale_factor = {
+			.argb8888 = 250,
+			.nv12 = 1,
+			.fp16 = 1
+	}
+};
+
+static const struct dce_dmcu_registers dmcu_regs = {
+		DMCU_DCE80_REG_LIST()
+};
+
+static const struct dce_dmcu_shift dmcu_shift = {
+		DMCU_MASK_SH_LIST_DCE80(__SHIFT)
+};
+
+static const struct dce_dmcu_mask dmcu_mask = {
+		DMCU_MASK_SH_LIST_DCE80(_MASK)
+};
+static const struct dce_abm_registers abm_regs = {
+		ABM_DCE110_COMMON_REG_LIST()
+};
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCE110(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCE110(_MASK)
+};
+
+#define CTX  ctx
+#define REG(reg) mm ## reg
+
+#ifndef mmCC_DC_HDMI_STRAPS
+#define mmCC_DC_HDMI_STRAPS 0x1918
+#define CC_DC_HDMI_STRAPS__HDMI_DISABLE_MASK 0x40
+#define CC_DC_HDMI_STRAPS__HDMI_DISABLE__SHIFT 0x6
+#define CC_DC_HDMI_STRAPS__AUDIO_STREAM_NUMBER_MASK 0x700
+#define CC_DC_HDMI_STRAPS__AUDIO_STREAM_NUMBER__SHIFT 0x8
+#endif
+
+static int map_transmitter_id_to_phy_instance(
+	enum transmitter transmitter)
+{
+	switch (transmitter) {
+	case TRANSMITTER_UNIPHY_A:
+		return 0;
+	break;
+	case TRANSMITTER_UNIPHY_B:
+		return 1;
+	break;
+	case TRANSMITTER_UNIPHY_C:
+		return 2;
+	break;
+	case TRANSMITTER_UNIPHY_D:
+		return 3;
+	break;
+	case TRANSMITTER_UNIPHY_E:
+		return 4;
+	break;
+	case TRANSMITTER_UNIPHY_F:
+		return 5;
+	break;
+	case TRANSMITTER_UNIPHY_G:
+		return 6;
+	break;
+	default:
+		ASSERT(0);
+		return 0;
+	}
+}
+
+static void read_dce_straps(
+	struct dc_context *ctx,
+	struct resource_straps *straps)
+{
+	REG_GET_2(CC_DC_HDMI_STRAPS,
+			HDMI_DISABLE, &straps->hdmi_disable,
+			AUDIO_STREAM_NUMBER, &straps->audio_stream_number);
+
+	REG_GET(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO, &straps->dc_pinstraps_audio);
+}
+
+static struct audio *create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct timing_generator *dce60_timing_generator_create(
+		struct dc_context *ctx,
+		uint32_t instance,
+		const struct dce110_timing_generator_offsets *offsets)
+{
+	struct dce110_timing_generator *tg110 =
+		kzalloc(sizeof(struct dce110_timing_generator), GFP_KERNEL);
+
+	if (!tg110)
+		return NULL;
+
+	dce60_timing_generator_construct(tg110, ctx, instance, offsets);
+	return &tg110->base;
+}
+
+static struct output_pixel_processor *dce60_opp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce110_opp *opp =
+		kzalloc(sizeof(struct dce110_opp), GFP_KERNEL);
+
+	if (!opp)
+		return NULL;
+
+	dce110_opp_construct(opp,
+			     ctx, inst, &opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp->base;
+}
+
+struct dce_aux *dce60_aux_engine_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine =
+		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst,
+				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+				    &aux_engine_regs[inst],
+					&aux_mask,
+					&aux_shift,
+					ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST(id) }
+
+static const struct dce_i2c_registers i2c_hw_regs[] = {
+		i2c_inst_regs(1),
+		i2c_inst_regs(2),
+		i2c_inst_regs(3),
+		i2c_inst_regs(4),
+		i2c_inst_regs(5),
+		i2c_inst_regs(6),
+};
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCE_COMMON_BASE(_MASK)
+};
+
+struct dce_i2c_hw *dce60_i2c_hw_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw =
+		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+	dce_i2c_hw_construct(dce_i2c_hw, ctx, inst,
+				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+
+struct dce_i2c_sw *dce60_i2c_sw_create(
+	struct dc_context *ctx)
+{
+	struct dce_i2c_sw *dce_i2c_sw =
+		kzalloc(sizeof(struct dce_i2c_sw), GFP_KERNEL);
+
+	if (!dce_i2c_sw)
+		return NULL;
+
+	dce_i2c_sw_construct(dce_i2c_sw, ctx);
+
+	return dce_i2c_sw;
+}
+static struct stream_encoder *dce60_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dce110_stream_encoder *enc110 =
+		kzalloc(sizeof(struct dce110_stream_encoder), GFP_KERNEL);
+
+	if (!enc110)
+		return NULL;
+
+	dce110_stream_encoder_construct(enc110, ctx, ctx->dc_bios, eng_id,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+	return &enc110->base;
+}
+
+#define SRII(reg_name, block, id)\
+	.reg_name[id] = mm ## block ## id ## _ ## reg_name
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCE8_REG_LIST()
+};
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCE8_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCE8_MASK_SH_LIST(_MASK)
+};
+
+static struct dce_hwseq *dce60_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = create_audio,
+	.create_stream_encoder = dce60_stream_encoder_create,
+	.create_hwseq = dce60_hwseq_create,
+};
+
+#define mi_inst_regs(id) { \
+	MI_DCE8_REG_LIST(id), \
+	.MC_HUB_RDREQ_DMIF_LIMIT = mmMC_HUB_RDREQ_DMIF_LIMIT \
+}
+static const struct dce_mem_input_registers mi_regs[] = {
+		mi_inst_regs(0),
+		mi_inst_regs(1),
+		mi_inst_regs(2),
+		mi_inst_regs(3),
+		mi_inst_regs(4),
+		mi_inst_regs(5),
+};
+
+static const struct dce_mem_input_shift mi_shifts = {
+		MI_DCE8_MASK_SH_LIST(__SHIFT),
+		.ENABLE = MC_HUB_RDREQ_DMIF_LIMIT__ENABLE__SHIFT
+};
+
+static const struct dce_mem_input_mask mi_masks = {
+		MI_DCE8_MASK_SH_LIST(_MASK),
+		.ENABLE = MC_HUB_RDREQ_DMIF_LIMIT__ENABLE_MASK
+};
+
+static struct mem_input *dce60_mem_input_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_mem_input *dce_mi = kzalloc(sizeof(struct dce_mem_input),
+					       GFP_KERNEL);
+
+	if (!dce_mi) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dce_mem_input_construct(dce_mi, ctx, inst, &mi_regs[inst], &mi_shifts, &mi_masks);
+	dce_mi->wa.single_head_rdreq_dmif_limit = 2;
+	return &dce_mi->base;
+}
+
+static void dce60_transform_destroy(struct transform **xfm)
+{
+	kfree(TO_DCE_TRANSFORM(*xfm));
+	*xfm = NULL;
+}
+
+static struct transform *dce60_transform_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_transform *transform =
+		kzalloc(sizeof(struct dce_transform), GFP_KERNEL);
+
+	if (!transform)
+		return NULL;
+
+	dce_transform_construct(transform, ctx, inst,
+				&xfm_regs[inst], &xfm_shift, &xfm_mask);
+	transform->prescaler_on = false;
+	return &transform->base;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 297000,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true
+};
+
+struct link_encoder *dce60_link_encoder_create(
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dce110_link_encoder *enc110 =
+		kzalloc(sizeof(struct dce110_link_encoder), GFP_KERNEL);
+	int link_regs_id;
+
+	if (!enc110)
+		return NULL;
+
+	link_regs_id =
+		map_transmitter_id_to_phy_instance(enc_init_data->transmitter);
+
+	dce110_link_encoder_construct(enc110,
+				      enc_init_data,
+				      &link_enc_feature,
+				      &link_enc_regs[link_regs_id],
+				      &link_enc_aux_regs[enc_init_data->channel - 1],
+				      &link_enc_hpd_regs[enc_init_data->hpd_source]);
+	return &enc110->base;
+}
+
+static struct panel_cntl *dce60_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dce_panel_cntl *panel_cntl =
+		kzalloc(sizeof(struct dce_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dce_panel_cntl_construct(panel_cntl,
+			init_data,
+			&panel_cntl_regs[init_data->inst],
+			&panel_cntl_shift,
+			&panel_cntl_mask);
+
+	return &panel_cntl->base;
+}
+
+struct clock_source *dce60_clock_source_create(
+	struct dc_context *ctx,
+	struct dc_bios *bios,
+	enum clock_source_id id,
+	const struct dce110_clk_src_regs *regs,
+	bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src =
+		kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dce110_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	kfree(clk_src);
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+void dce60_clock_source_destroy(struct clock_source **clk_src)
+{
+	kfree(TO_DCE110_CLK_SRC(*clk_src));
+	*clk_src = NULL;
+}
+
+static struct input_pixel_processor *dce60_ipp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dce_ipp *ipp = kzalloc(sizeof(struct dce_ipp), GFP_KERNEL);
+
+	if (!ipp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dce_ipp_construct(ipp, ctx, inst,
+			&ipp_regs[inst], &ipp_shift, &ipp_mask);
+	return &ipp->base;
+}
+
+static void dce60_resource_destruct(struct dce110_resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.opps[i] != NULL)
+			dce110_opp_destroy(&pool->base.opps[i]);
+
+		if (pool->base.transforms[i] != NULL)
+			dce60_transform_destroy(&pool->base.transforms[i]);
+
+		if (pool->base.ipps[i] != NULL)
+			dce_ipp_destroy(&pool->base.ipps[i]);
+
+		if (pool->base.mis[i] != NULL) {
+			kfree(TO_DCE_MEM_INPUT(pool->base.mis[i]));
+			pool->base.mis[i] = NULL;
+		}
+
+		if (pool->base.timing_generators[i] != NULL)	{
+			kfree(DCE110TG_FROM_TG(pool->base.timing_generators[i]));
+			pool->base.timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		if (pool->base.engines[i] != NULL)
+			dce110_engine_destroy(&pool->base.engines[i]);
+		if (pool->base.hw_i2cs[i] != NULL) {
+			kfree(pool->base.hw_i2cs[i]);
+			pool->base.hw_i2cs[i] = NULL;
+		}
+		if (pool->base.sw_i2cs[i] != NULL) {
+			kfree(pool->base.sw_i2cs[i]);
+			pool->base.sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.stream_enc_count; i++) {
+		if (pool->base.stream_enc[i] != NULL)
+			kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] != NULL) {
+			dce60_clock_source_destroy(&pool->base.clock_sources[i]);
+		}
+	}
+
+	if (pool->base.abm != NULL)
+			dce_abm_destroy(&pool->base.abm);
+
+	if (pool->base.dmcu != NULL)
+			dce_dmcu_destroy(&pool->base.dmcu);
+
+	if (pool->base.dp_clock_source != NULL)
+		dce60_clock_source_destroy(&pool->base.dp_clock_source);
+
+	for (i = 0; i < pool->base.audio_count; i++)	{
+		if (pool->base.audios[i] != NULL) {
+			dce_aud_destroy(&pool->base.audios[i]);
+		}
+	}
+
+	if (pool->base.irqs != NULL) {
+		dal_irq_service_destroy(&pool->base.irqs);
+	}
+}
+
+bool dce60_validate_bandwidth(
+	struct dc *dc,
+	struct dc_state *context,
+	bool fast_validate)
+{
+	int i;
+	bool at_least_one_pipe = false;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (context->res_ctx.pipe_ctx[i].stream)
+			at_least_one_pipe = true;
+	}
+
+	if (at_least_one_pipe) {
+		/* TODO implement when needed but for now hardcode max value*/
+		context->bw_ctx.bw.dce.dispclk_khz = 681000;
+		context->bw_ctx.bw.dce.yclk_khz = 250000 * MEMORY_TYPE_MULTIPLIER_CZ;
+	} else {
+		context->bw_ctx.bw.dce.dispclk_khz = 0;
+		context->bw_ctx.bw.dce.yclk_khz = 0;
+	}
+
+	return true;
+}
+
+static bool dce60_validate_surface_sets(
+		struct dc_state *context)
+{
+	int i;
+
+	for (i = 0; i < context->stream_count; i++) {
+		if (context->stream_status[i].plane_count == 0)
+			continue;
+
+		if (context->stream_status[i].plane_count > 1)
+			return false;
+
+		if (context->stream_status[i].plane_states[0]->format
+				>= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
+			return false;
+	}
+
+	return true;
+}
+
+enum dc_status dce60_validate_global(
+		struct dc *dc,
+		struct dc_state *context)
+{
+	if (!dce60_validate_surface_sets(context))
+		return DC_FAIL_SURFACE_VALIDATE;
+
+	return DC_OK;
+}
+
+static void dce60_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dce110_resource_pool *dce110_pool = TO_DCE110_RES_POOL(*pool);
+
+	dce60_resource_destruct(dce110_pool);
+	kfree(dce110_pool);
+	*pool = NULL;
+}
+
+static const struct resource_funcs dce60_res_pool_funcs = {
+	.destroy = dce60_destroy_resource_pool,
+	.link_enc_create = dce60_link_encoder_create,
+	.panel_cntl_create = dce60_panel_cntl_create,
+	.validate_bandwidth = dce60_validate_bandwidth,
+	.validate_plane = dce100_validate_plane,
+	.add_stream_to_ctx = dce100_add_stream_to_ctx,
+	.validate_global = dce60_validate_global,
+	.find_first_free_match_stream_enc_for_link = dce100_find_first_free_match_stream_enc_for_link
+};
+
+static bool dce60_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dce110_resource_pool *pool)
+{
+	unsigned int i;
+	struct dc_context *ctx = dc->ctx;
+	struct dc_bios *bp;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap;
+	pool->base.funcs = &dce60_res_pool_funcs;
+
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = res_cap.num_timing_generator;
+	pool->base.timing_generator_count = res_cap.num_timing_generator;
+	dc->caps.max_downscale_ratio = 200;
+	dc->caps.i2c_speed_in_khz = 40;
+	dc->caps.max_cursor_size = 128;
+	dc->caps.dual_link_dvi = true;
+	dc->caps.extended_aux_timeout_support = false;
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	bp = ctx->dc_bios;
+
+	if (bp->fw_info_valid && bp->fw_info.external_clock_source_frequency_for_dp != 0) {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], false);
+		pool->base.clock_sources[1] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[2] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 3;
+
+	} else {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[1] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 2;
+	}
+
+	if (pool->base.dp_clock_source == NULL) {
+		dm_error("DC: failed to create dp clock source!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto res_create_fail;
+		}
+	}
+
+	pool->base.dmcu = dce_dmcu_create(ctx,
+			&dmcu_regs,
+			&dmcu_shift,
+			&dmcu_mask);
+	if (pool->base.dmcu == NULL) {
+		dm_error("DC: failed to create dmcu!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	pool->base.abm = dce_abm_create(ctx,
+			&abm_regs,
+			&abm_shift,
+			&abm_mask);
+	if (pool->base.abm == NULL) {
+		dm_error("DC: failed to create abm!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	{
+		struct irq_service_init_data init_data;
+		init_data.ctx = dc->ctx;
+		pool->base.irqs = dal_irq_service_dce60_create(&init_data);
+		if (!pool->base.irqs)
+			goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.timing_generators[i] = dce60_timing_generator_create(
+				ctx, i, &dce60_tg_offsets[i]);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.mis[i] = dce60_mem_input_create(ctx, i);
+		if (pool->base.mis[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create memory input!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.ipps[i] = dce60_ipp_create(ctx, i);
+		if (pool->base.ipps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create input pixel processor!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.transforms[i] = dce60_transform_create(ctx, i);
+		if (pool->base.transforms[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create transform!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.opps[i] = dce60_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create output pixel processor!\n");
+			goto res_create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dce60_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.hw_i2cs[i] = dce60_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create i2c engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.sw_i2cs[i] = dce60_i2c_sw_create(ctx);
+		if (pool->base.sw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create sw i2c!!\n");
+			goto res_create_fail;
+		}
+	}
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->caps.disable_dp_clk_share = true;
+
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			&res_create_funcs))
+		goto res_create_fail;
+
+	/* Create hardware sequencer */
+	dce60_hw_sequencer_construct(dc);
+
+	return true;
+
+res_create_fail:
+	dce60_resource_destruct(pool);
+	return false;
+}
+
+struct resource_pool *dce60_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc)
+{
+	struct dce110_resource_pool *pool =
+		kzalloc(sizeof(struct dce110_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dce60_construct(num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static bool dce61_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dce110_resource_pool *pool)
+{
+	unsigned int i;
+	struct dc_context *ctx = dc->ctx;
+	struct dc_bios *bp;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_61;
+	pool->base.funcs = &dce60_res_pool_funcs;
+
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = res_cap_61.num_timing_generator;
+	pool->base.timing_generator_count = res_cap_61.num_timing_generator;
+	dc->caps.max_downscale_ratio = 200;
+	dc->caps.i2c_speed_in_khz = 40;
+	dc->caps.max_cursor_size = 128;
+	dc->caps.is_apu = true;
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	bp = ctx->dc_bios;
+
+	if (bp->fw_info_valid && bp->fw_info.external_clock_source_frequency_for_dp != 0) {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], false);
+		pool->base.clock_sources[1] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[2] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 3;
+
+	} else {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[1] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 2;
+	}
+
+	if (pool->base.dp_clock_source == NULL) {
+		dm_error("DC: failed to create dp clock source!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto res_create_fail;
+		}
+	}
+
+	pool->base.dmcu = dce_dmcu_create(ctx,
+			&dmcu_regs,
+			&dmcu_shift,
+			&dmcu_mask);
+	if (pool->base.dmcu == NULL) {
+		dm_error("DC: failed to create dmcu!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	pool->base.abm = dce_abm_create(ctx,
+			&abm_regs,
+			&abm_shift,
+			&abm_mask);
+	if (pool->base.abm == NULL) {
+		dm_error("DC: failed to create abm!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	{
+		struct irq_service_init_data init_data;
+		init_data.ctx = dc->ctx;
+		pool->base.irqs = dal_irq_service_dce60_create(&init_data);
+		if (!pool->base.irqs)
+			goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.timing_generators[i] = dce60_timing_generator_create(
+				ctx, i, &dce60_tg_offsets[i]);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.mis[i] = dce60_mem_input_create(ctx, i);
+		if (pool->base.mis[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create memory input!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.ipps[i] = dce60_ipp_create(ctx, i);
+		if (pool->base.ipps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create input pixel processor!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.transforms[i] = dce60_transform_create(ctx, i);
+		if (pool->base.transforms[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create transform!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.opps[i] = dce60_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create output pixel processor!\n");
+			goto res_create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dce60_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.hw_i2cs[i] = dce60_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create i2c engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.sw_i2cs[i] = dce60_i2c_sw_create(ctx);
+		if (pool->base.sw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create sw i2c!!\n");
+			goto res_create_fail;
+		}
+	}
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->caps.disable_dp_clk_share = true;
+
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			&res_create_funcs))
+		goto res_create_fail;
+
+	/* Create hardware sequencer */
+	dce60_hw_sequencer_construct(dc);
+
+	return true;
+
+res_create_fail:
+	dce60_resource_destruct(pool);
+	return false;
+}
+
+struct resource_pool *dce61_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc)
+{
+	struct dce110_resource_pool *pool =
+		kzalloc(sizeof(struct dce110_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dce61_construct(num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static bool dce64_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dce110_resource_pool *pool)
+{
+	unsigned int i;
+	struct dc_context *ctx = dc->ctx;
+	struct dc_bios *bp;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_64;
+	pool->base.funcs = &dce60_res_pool_funcs;
+
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = res_cap_64.num_timing_generator;
+	pool->base.timing_generator_count = res_cap_64.num_timing_generator;
+	dc->caps.max_downscale_ratio = 200;
+	dc->caps.i2c_speed_in_khz = 40;
+	dc->caps.max_cursor_size = 128;
+	dc->caps.is_apu = true;
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	bp = ctx->dc_bios;
+
+	if (bp->fw_info_valid && bp->fw_info.external_clock_source_frequency_for_dp != 0) {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[0], false);
+		pool->base.clock_sources[1] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[1], false);
+		pool->base.clk_src_count = 2;
+
+	} else {
+		pool->base.dp_clock_source =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[0], true);
+
+		pool->base.clock_sources[0] =
+				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[1], false);
+		pool->base.clk_src_count = 1;
+	}
+
+	if (pool->base.dp_clock_source == NULL) {
+		dm_error("DC: failed to create dp clock source!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto res_create_fail;
+		}
+	}
+
+	pool->base.dmcu = dce_dmcu_create(ctx,
+			&dmcu_regs,
+			&dmcu_shift,
+			&dmcu_mask);
+	if (pool->base.dmcu == NULL) {
+		dm_error("DC: failed to create dmcu!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	pool->base.abm = dce_abm_create(ctx,
+			&abm_regs,
+			&abm_shift,
+			&abm_mask);
+	if (pool->base.abm == NULL) {
+		dm_error("DC: failed to create abm!\n");
+		BREAK_TO_DEBUGGER();
+		goto res_create_fail;
+	}
+
+	{
+		struct irq_service_init_data init_data;
+		init_data.ctx = dc->ctx;
+		pool->base.irqs = dal_irq_service_dce60_create(&init_data);
+		if (!pool->base.irqs)
+			goto res_create_fail;
+	}
+
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.timing_generators[i] = dce60_timing_generator_create(
+				ctx, i, &dce60_tg_offsets[i]);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.mis[i] = dce60_mem_input_create(ctx, i);
+		if (pool->base.mis[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create memory input!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.ipps[i] = dce60_ipp_create(ctx, i);
+		if (pool->base.ipps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create input pixel processor!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.transforms[i] = dce60_transform_create(ctx, i);
+		if (pool->base.transforms[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create transform!\n");
+			goto res_create_fail;
+		}
+
+		pool->base.opps[i] = dce60_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create output pixel processor!\n");
+			goto res_create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dce60_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.hw_i2cs[i] = dce60_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create i2c engine!!\n");
+			goto res_create_fail;
+		}
+		pool->base.sw_i2cs[i] = dce60_i2c_sw_create(ctx);
+		if (pool->base.sw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create sw i2c!!\n");
+			goto res_create_fail;
+		}
+	}
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->caps.disable_dp_clk_share = true;
+
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			&res_create_funcs))
+		goto res_create_fail;
+
+	/* Create hardware sequencer */
+	dce60_hw_sequencer_construct(dc);
+
+	return true;
+
+res_create_fail:
+	dce60_resource_destruct(pool);
+	return false;
+}
+
+struct resource_pool *dce64_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc)
+{
+	struct dce110_resource_pool *pool =
+		kzalloc(sizeof(struct dce110_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dce64_construct(num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.h b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.h
new file mode 100644
index 000000000000..5d653a76b0b0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.h
@@ -0,0 +1,47 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_RESOURCE_DCE60_H__
+#define __DC_RESOURCE_DCE60_H__
+
+#include "core_types.h"
+
+struct dc;
+struct resource_pool;
+
+struct resource_pool *dce60_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc);
+
+struct resource_pool *dce61_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc);
+
+struct resource_pool *dce64_create_resource_pool(
+	uint8_t num_virtual_links,
+	struct dc *dc);
+
+#endif /* __DC_RESOURCE_DCE60_H__ */
+
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.c
new file mode 100644
index 000000000000..eb9705e9d40a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.c
@@ -0,0 +1,247 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
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
+ * Authors: AMD
+ *
+ */
+
+#include "dm_services.h"
+
+/* include DCE6 register header files */
+#include "dce/dce_6_0_d.h"
+#include "dce/dce_6_0_sh_mask.h"
+
+#include "dc_types.h"
+
+#include "include/grph_object_id.h"
+#include "include/logger_interface.h"
+#include "../dce110/dce110_timing_generator.h"
+#include "dce60_timing_generator.h"
+
+#include "timing_generator.h"
+
+enum black_color_format {
+	BLACK_COLOR_FORMAT_RGB_FULLRANGE = 0,	/* used as index in array */
+	BLACK_COLOR_FORMAT_RGB_LIMITED,
+	BLACK_COLOR_FORMAT_YUV_TV,
+	BLACK_COLOR_FORMAT_YUV_CV,
+	BLACK_COLOR_FORMAT_YUV_SUPER_AA,
+
+	BLACK_COLOR_FORMAT_COUNT
+};
+
+static const struct dce110_timing_generator_offsets reg_offsets[] = {
+{
+	.crtc = (mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP0_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+},
+{
+	.crtc = (mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP1_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+},
+{
+	.crtc = (mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP2_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+},
+{
+	.crtc = (mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP3_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+},
+{
+	.crtc = (mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP4_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+},
+{
+	.crtc = (mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL - mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL),
+	.dcp = (mmDCP5_GRPH_CONTROL - mmDCP0_GRPH_CONTROL),
+}
+};
+
+#define NUMBER_OF_FRAME_TO_WAIT_ON_TRIGGERED_RESET 10
+
+#define MAX_H_TOTAL (CRTC_H_TOTAL__CRTC_H_TOTAL_MASK + 1)
+#define MAX_V_TOTAL (CRTC_V_TOTAL__CRTC_V_TOTAL_MASKhw + 1)
+
+#define CRTC_REG(reg) (reg + tg110->offsets.crtc)
+#define DCP_REG(reg) (reg + tg110->offsets.dcp)
+#define DMIF_REG(reg) (reg + tg110->offsets.dmif)
+
+static void program_pix_dur(struct timing_generator *tg, uint32_t pix_clk_100hz)
+{
+	uint64_t pix_dur;
+	uint32_t addr = mmDMIF_PG0_DPG_PIPE_ARBITRATION_CONTROL1
+					+ DCE110TG_FROM_TG(tg)->offsets.dmif;
+	uint32_t value = dm_read_reg(tg->ctx, addr);
+
+	if (pix_clk_100hz == 0)
+		return;
+
+	pix_dur = div_u64(10000000000ull, pix_clk_100hz);
+
+	set_reg_field_value(
+		value,
+		pix_dur,
+		DPG_PIPE_ARBITRATION_CONTROL1,
+		PIXEL_DURATION);
+
+	dm_write_reg(tg->ctx, addr, value);
+}
+
+static void program_timing(struct timing_generator *tg,
+	const struct dc_crtc_timing *timing,
+	int vready_offset,
+	int vstartup_start,
+	int vupdate_offset,
+	int vupdate_width,
+	const enum signal_type signal,
+	bool use_vbios)
+{
+	if (!use_vbios)
+		program_pix_dur(tg, timing->pix_clk_100hz);
+
+	dce110_tg_program_timing(tg, timing, 0, 0, 0, 0, 0, use_vbios);
+}
+
+static void dce60_timing_generator_enable_advanced_request(
+	struct timing_generator *tg,
+	bool enable,
+	const struct dc_crtc_timing *timing)
+{
+	struct dce110_timing_generator *tg110 = DCE110TG_FROM_TG(tg);
+	uint32_t addr = CRTC_REG(mmCRTC_START_LINE_CONTROL);
+	uint32_t value = dm_read_reg(tg->ctx, addr);
+
+	if (enable) {
+		set_reg_field_value(
+			value,
+			0,
+			CRTC_START_LINE_CONTROL,
+			CRTC_LEGACY_REQUESTOR_EN);
+	} else {
+		set_reg_field_value(
+			value,
+			1,
+			CRTC_START_LINE_CONTROL,
+			CRTC_LEGACY_REQUESTOR_EN);
+	}
+
+	if ((timing->v_sync_width + timing->v_front_porch) <= 3) {
+		set_reg_field_value(
+			value,
+			3,
+			CRTC_START_LINE_CONTROL,
+			CRTC_ADVANCED_START_LINE_POSITION);
+		set_reg_field_value(
+			value,
+			0,
+			CRTC_START_LINE_CONTROL,
+			CRTC_PREFETCH_EN);
+	} else {
+		set_reg_field_value(
+			value,
+			4,
+			CRTC_START_LINE_CONTROL,
+			CRTC_ADVANCED_START_LINE_POSITION);
+		set_reg_field_value(
+			value,
+			1,
+			CRTC_START_LINE_CONTROL,
+			CRTC_PREFETCH_EN);
+	}
+
+	set_reg_field_value(
+		value,
+		1,
+		CRTC_START_LINE_CONTROL,
+		CRTC_PROGRESSIVE_START_LINE_EARLY);
+
+	set_reg_field_value(
+		value,
+		1,
+		CRTC_START_LINE_CONTROL,
+		CRTC_INTERLACE_START_LINE_EARLY);
+
+	dm_write_reg(tg->ctx, addr, value);
+}
+
+static const struct timing_generator_funcs dce60_tg_funcs = {
+		.validate_timing = dce110_tg_validate_timing,
+		.program_timing = program_timing,
+		.enable_crtc = dce110_timing_generator_enable_crtc,
+		.disable_crtc = dce110_timing_generator_disable_crtc,
+		.is_counter_moving = dce110_timing_generator_is_counter_moving,
+		.get_position = dce110_timing_generator_get_position,
+		.get_frame_count = dce110_timing_generator_get_vblank_counter,
+		.get_scanoutpos = dce110_timing_generator_get_crtc_scanoutpos,
+		.set_early_control = dce110_timing_generator_set_early_control,
+		.wait_for_state = dce110_tg_wait_for_state,
+		.set_blank = dce110_tg_set_blank,
+		.is_blanked = dce110_tg_is_blanked,
+		.set_colors = dce110_tg_set_colors,
+		.set_overscan_blank_color =
+				dce110_timing_generator_set_overscan_color_black,
+		.set_blank_color = dce110_timing_generator_program_blank_color,
+		.disable_vga = dce110_timing_generator_disable_vga,
+		.did_triggered_reset_occur =
+				dce110_timing_generator_did_triggered_reset_occur,
+		.setup_global_swap_lock =
+				dce110_timing_generator_setup_global_swap_lock,
+		.enable_reset_trigger = dce110_timing_generator_enable_reset_trigger,
+		.disable_reset_trigger = dce110_timing_generator_disable_reset_trigger,
+		.tear_down_global_swap_lock =
+				dce110_timing_generator_tear_down_global_swap_lock,
+		.set_drr = dce110_timing_generator_set_drr,
+		.set_static_screen_control =
+			dce110_timing_generator_set_static_screen_control,
+		.set_test_pattern = dce110_timing_generator_set_test_pattern,
+		.arm_vert_intr = dce110_arm_vert_intr,
+
+		/* DCE6.0 overrides */
+		.enable_advanced_request =
+				dce60_timing_generator_enable_advanced_request,
+		.configure_crc = dce110_configure_crc,
+		.get_crc = dce110_get_crc,
+};
+
+void dce60_timing_generator_construct(
+	struct dce110_timing_generator *tg110,
+	struct dc_context *ctx,
+	uint32_t instance,
+	const struct dce110_timing_generator_offsets *offsets)
+{
+	tg110->controller_id = CONTROLLER_ID_D0 + instance;
+	tg110->base.inst = instance;
+	tg110->offsets = *offsets;
+	tg110->derived_offsets = reg_offsets[instance];
+
+	tg110->base.funcs = &dce60_tg_funcs;
+
+	tg110->base.ctx = ctx;
+	tg110->base.bp = ctx->dc_bios;
+
+	tg110->max_h_total = CRTC_H_TOTAL__CRTC_H_TOTAL_MASK + 1;
+	tg110->max_v_total = CRTC_V_TOTAL__CRTC_V_TOTAL_MASK + 1;
+
+	tg110->min_h_blank = 56;
+	tg110->min_h_front_porch = 4;
+	tg110->min_h_back_porch = 4;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.h b/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.h
new file mode 100644
index 000000000000..81d831233cc5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_timing_generator.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright 2020 Mauro Rossi <issor.oruam@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_TIMING_GENERATOR_DCE60_H__
+#define __DC_TIMING_GENERATOR_DCE60_H__
+
+#include "timing_generator.h"
+#include "../include/grph_object_id.h"
+
+/* DCE6.0 implementation inherits from DCE11.0 */
+void dce60_timing_generator_construct(
+	struct dce110_timing_generator *tg,
+	struct dc_context *ctx,
+	uint32_t instance,
+	const struct dce110_timing_generator_offsets *offsets);
+
+#endif /* __DC_TIMING_GENERATOR_DCE60_H__ */
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
