Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF71EA987
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D836E0DB;
	Mon,  1 Jun 2020 18:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003616E261
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:03:28 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 205so9959299qkg.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYB1Mmd4b/wZayWsTVbL0/7t8NM1bkKXhoukJ8IknkM=;
 b=bcSusX+H+8q39yALJ285u2cohWcvC/WIqEbhCF9tto/vx6H7cMJdkTGkNZIWCJtJkX
 UHbLvv3JgMZfPZS4sr5F9WKl4HPLo7lFVmqrJZcQMEqUL6cie5SfZTb00yHSCgsFe/rp
 Xds76ty76tfjTDFWnh3IA+2m/QSgkWPtNJoFDGMB006pmVsa/DaFEftloqLUd4UBLipR
 VVtn+rPaXlqAFoNT+wMabn2QxMjbjO7QHvaf2ustPW6NTMMsgXvhbKmAGGbiKWTfl63R
 qVBXwULU1ZsTg+3WCz8KS0+1RzzySRPWBDEVAYL8ORPCal8OA/A6dzRohlRh3XH1egzg
 R0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYB1Mmd4b/wZayWsTVbL0/7t8NM1bkKXhoukJ8IknkM=;
 b=lBchs/EeJNT015GifWVr2QO5gOzyiwFYTn1GwTAKa/KWxu0e8fBUhXFcxP/nrJ5xPa
 bp+VC5X6j7hJZaWZRe624UTG8aCkZE6cUKiozWJ67aG7ouH2uvKxsUx2eV3WfddMqnwp
 is2fT2Yn0syx393BX4Ka8wT8o7uAoZ6n7h150MaF3SAdI7r8BKSpWPUSKeEaDuz4qFj2
 uyJOYdc6iB3b5YMIlj2AHn24CyBSQGBprPFdHDv1EK/Btqw2JbitfMAO4gMjG8qTVrZB
 Lho3EVEJkzuiGVfh2wkC901O0A4OXCAklhHocqBt29W6HhtpUu7hVl+fwnse9MCmqON3
 Clmg==
X-Gm-Message-State: AOAM531ZqK++70Shkv60UlNUPoXYFGL7uDHVW/JTafiKvt09yEn1k7IY
 HACbZuOGqvOLleTGPP0wkekzKJ4x
X-Google-Smtp-Source: ABdhPJwezpvHKieSJMVvqhzI3K7ka0HF/hrtmn2PvJqZBPnDI1uAP7fP/tJBHCwVAbAPgpmf2AuLpQ==
X-Received: by 2002:a37:aa81:: with SMTP id t123mr22180776qke.11.1591034605951; 
 Mon, 01 Jun 2020 11:03:25 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:03:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 025/207] drm/amdgpu/powerplay: add initial swSMU support for
 sienna_cichlid (v2)
Date: Mon,  1 Jun 2020 13:59:37 -0400
Message-Id: <20200601180239.1267430-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

SMU11 based similar to navi1x.

v2: squash in SMU IF updates

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/Makefile        |    2 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |   10 +-
 .../inc/smu11_driver_if_sienna_cichlid.h      | 1209 ++++++++++
 drivers/gpu/drm/amd/powerplay/inc/smu_types.h |    2 +
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |    1 +
 .../drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h |  139 ++
 .../drm/amd/powerplay/sienna_cichlid_ppt.c    | 2080 +++++++++++++++++
 .../drm/amd/powerplay/sienna_cichlid_ppt.h    |   28 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |   15 +-
 9 files changed, 3482 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_sienna_cichlid.h
 create mode 100644 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
 create mode 100644 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h

diff --git a/drivers/gpu/drm/amd/powerplay/Makefile b/drivers/gpu/drm/amd/powerplay/Makefile
index 709a6dc0f321..d27a02ac5f53 100644
--- a/drivers/gpu/drm/amd/powerplay/Makefile
+++ b/drivers/gpu/drm/amd/powerplay/Makefile
@@ -35,7 +35,7 @@ AMD_POWERPLAY = $(addsuffix /Makefile,$(addprefix $(FULL_AMD_PATH)/powerplay/,$(
 
 include $(AMD_POWERPLAY)
 
-POWER_MGR = amd_powerplay.o amdgpu_smu.o smu_v11_0.o smu_v12_0.o arcturus_ppt.o navi10_ppt.o renoir_ppt.o
+POWER_MGR = amd_powerplay.o amdgpu_smu.o smu_v11_0.o smu_v12_0.o arcturus_ppt.o navi10_ppt.o renoir_ppt.o sienna_cichlid_ppt.o
 
 AMD_PP_POWER = $(addprefix $(AMD_PP_PATH)/,$(POWER_MGR))
 
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 5294aa7cdde1..870fe32437b6 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -31,6 +31,7 @@
 #include "atom.h"
 #include "arcturus_ppt.h"
 #include "navi10_ppt.h"
+#include "sienna_cichlid_ppt.h"
 #include "renoir_ppt.h"
 
 #undef __SMU_DUMMY_MAP
@@ -762,6 +763,9 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 		/* OD is not supported on Arcturus */
 		smu->od_enabled =false;
 		break;
+	case CHIP_SIENNA_CICHLID:
+		sienna_cichlid_set_ppt_funcs(smu);
+		break;
 	case CHIP_RENOIR:
 		renoir_set_ppt_funcs(smu);
 		break;
@@ -1049,7 +1053,8 @@ static int smu_smc_table_hw_init(struct smu_context *smu,
 		return 0;
 	}
 
-	if (adev->asic_type != CHIP_ARCTURUS) {
+	if (adev->asic_type != CHIP_ARCTURUS &&
+	    adev->asic_type != CHIP_SIENNA_CICHLID) {
 		ret = smu_init_display_count(smu, 0);
 		if (ret)
 			return ret;
@@ -1159,7 +1164,8 @@ static int smu_smc_table_hw_init(struct smu_context *smu,
 		}
 	}
 
-	if (adev->asic_type != CHIP_ARCTURUS) {
+	if (adev->asic_type != CHIP_ARCTURUS &&
+	    adev->asic_type != CHIP_SIENNA_CICHLID) {
 		ret = smu_notify_display_change(smu);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_sienna_cichlid.h b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_sienna_cichlid.h
new file mode 100644
index 000000000000..bdffba1f0086
--- /dev/null
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_sienna_cichlid.h
@@ -0,0 +1,1209 @@
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
+
+#ifndef __SMU11_DRIVER_IF_SIENNA_CICHLID_H__
+#define __SMU11_DRIVER_IF_SIENNA_CICHLID_H__
+
+// *** IMPORTANT ***
+// SMU TEAM: Always increment the interface version if 
+// any structure is changed in this file
+#define SMU11_DRIVER_IF_VERSION 0x30
+
+#define PPTABLE_Sienna_Cichlid_SMU_VERSION 4
+
+#define NUM_GFXCLK_DPM_LEVELS  16
+#define NUM_SMNCLK_DPM_LEVELS  2
+#define NUM_SOCCLK_DPM_LEVELS  8
+#define NUM_MP0CLK_DPM_LEVELS  2
+#define NUM_DCLK_DPM_LEVELS    8
+#define NUM_VCLK_DPM_LEVELS    8
+#define NUM_DCEFCLK_DPM_LEVELS 8
+#define NUM_PHYCLK_DPM_LEVELS  8
+#define NUM_DISPCLK_DPM_LEVELS 8
+#define NUM_PIXCLK_DPM_LEVELS  8
+#define NUM_DTBCLK_DPM_LEVELS  8
+#define NUM_UCLK_DPM_LEVELS    4 
+#define NUM_MP1CLK_DPM_LEVELS  2
+#define NUM_LINK_LEVELS        2
+#define NUM_FCLK_DPM_LEVELS    8 
+#define NUM_XGMI_LEVELS        2
+#define NUM_XGMI_PSTATE_LEVELS 4
+#define NUM_OD_FAN_MAX_POINTS  6
+
+#define MAX_GFXCLK_DPM_LEVEL  (NUM_GFXCLK_DPM_LEVELS  - 1)
+#define MAX_SMNCLK_DPM_LEVEL  (NUM_SMNCLK_DPM_LEVELS  - 1)
+#define MAX_SOCCLK_DPM_LEVEL  (NUM_SOCCLK_DPM_LEVELS  - 1)
+#define MAX_MP0CLK_DPM_LEVEL  (NUM_MP0CLK_DPM_LEVELS  - 1)
+#define MAX_DCLK_DPM_LEVEL    (NUM_DCLK_DPM_LEVELS    - 1)
+#define MAX_VCLK_DPM_LEVEL    (NUM_VCLK_DPM_LEVELS    - 1)
+#define MAX_DCEFCLK_DPM_LEVEL (NUM_DCEFCLK_DPM_LEVELS - 1)
+#define MAX_DISPCLK_DPM_LEVEL (NUM_DISPCLK_DPM_LEVELS - 1)
+#define MAX_PIXCLK_DPM_LEVEL  (NUM_PIXCLK_DPM_LEVELS  - 1)
+#define MAX_PHYCLK_DPM_LEVEL  (NUM_PHYCLK_DPM_LEVELS  - 1)
+#define MAX_DTBCLK_DPM_LEVEL  (NUM_DTBCLK_DPM_LEVELS  - 1)
+#define MAX_UCLK_DPM_LEVEL    (NUM_UCLK_DPM_LEVELS    - 1)
+#define MAX_MP1CLK_DPM_LEVEL  (NUM_MP1CLK_DPM_LEVELS  - 1)
+#define MAX_LINK_LEVEL        (NUM_LINK_LEVELS        - 1)
+#define MAX_FCLK_DPM_LEVEL    (NUM_FCLK_DPM_LEVELS    - 1)
+
+//Gemini Modes
+#define PPSMC_GeminiModeNone   0  //Single GPU board
+#define PPSMC_GeminiModeMaster 1  //Master GPU on a Gemini board
+#define PPSMC_GeminiModeSlave  2  //Slave GPU on a Gemini board
+
+// Feature Control Defines
+// DPM
+#define FEATURE_DPM_PREFETCHER_BIT      0
+#define FEATURE_DPM_GFXCLK_BIT          1
+#define FEATURE_DPM_GFX_GPO_BIT         2
+#define FEATURE_DPM_UCLK_BIT            3
+#define FEATURE_DPM_FCLK_BIT            4
+#define FEATURE_DPM_SOCCLK_BIT          5
+#define FEATURE_DPM_MP0CLK_BIT          6
+#define FEATURE_DPM_LINK_BIT            7
+#define FEATURE_DPM_DCEFCLK_BIT         8
+#define FEATURE_DPM_XGMI_BIT            9
+#define FEATURE_MEM_VDDCI_SCALING_BIT   10 
+#define FEATURE_MEM_MVDD_SCALING_BIT    11
+                                        
+//Idle                                  
+#define FEATURE_DS_GFXCLK_BIT           12
+#define FEATURE_DS_SOCCLK_BIT           13
+#define FEATURE_DS_FCLK_BIT             14
+#define FEATURE_DS_LCLK_BIT             15
+#define FEATURE_DS_DCEFCLK_BIT          16
+#define FEATURE_DS_UCLK_BIT             17
+#define FEATURE_GFX_ULV_BIT             18  
+#define FEATURE_FW_DSTATE_BIT           19 
+#define FEATURE_GFXOFF_BIT              20
+#define FEATURE_BACO_BIT                21
+#define FEATURE_MM_DPM_PG_BIT           22  
+#define FEATURE_SPARE_23_BIT            23
+//Throttler/Response                    
+#define FEATURE_PPT_BIT                 24
+#define FEATURE_TDC_BIT                 25
+#define FEATURE_APCC_PLUS_BIT           26
+#define FEATURE_GTHR_BIT                27
+#define FEATURE_ACDC_BIT                28
+#define FEATURE_VR0HOT_BIT              29
+#define FEATURE_VR1HOT_BIT              30  
+#define FEATURE_FW_CTF_BIT              31
+#define FEATURE_FAN_CONTROL_BIT         32
+#define FEATURE_THERMAL_BIT             33
+#define FEATURE_GFX_DCS_BIT             34
+//VF                                    
+#define FEATURE_RM_BIT                  35
+#define FEATURE_LED_DISPLAY_BIT         36
+//Other                                 
+#define FEATURE_GFX_SS_BIT              37
+#define FEATURE_OUT_OF_BAND_MONITOR_BIT 38
+#define FEATURE_TEMP_DEPENDENT_VMIN_BIT 39
+
+#define FEATURE_MMHUB_PG_BIT            40 
+#define FEATURE_ATHUB_PG_BIT            41
+#define FEATURE_APCC_DFLL_BIT           42
+#define FEATURE_DF_SUPERV_BIT           43
+#define FEATURE_RSMU_SMN_CG_BIT         44
+#define FEATURE_DF_CSTATE_BIT           45
+#define FEATURE_2_STEP_PSTATE_BIT       46
+#define FEATURE_SMNCLK_DPM_BIT          47
+#define FEATURE_SPARE_48_BIT            48
+#define FEATURE_SPARE_49_BIT            49
+#define FEATURE_SPARE_50_BIT            50
+#define FEATURE_SPARE_51_BIT            51
+#define FEATURE_SPARE_52_BIT            52
+#define FEATURE_SPARE_53_BIT            53
+#define FEATURE_SPARE_54_BIT            54
+#define FEATURE_SPARE_55_BIT            55
+#define FEATURE_SPARE_56_BIT            56
+#define FEATURE_SPARE_57_BIT            57
+#define FEATURE_SPARE_58_BIT            58
+#define FEATURE_SPARE_59_BIT            59
+#define FEATURE_SPARE_60_BIT            60
+#define FEATURE_SPARE_61_BIT            61
+#define FEATURE_SPARE_62_BIT            62
+#define FEATURE_SPARE_63_BIT            63
+#define NUM_FEATURES                    64
+
+//For use with feature control messages
+typedef enum {
+  FEATURE_PWR_ALL,
+  FEATURE_PWR_S5,
+  FEATURE_PWR_BACO,
+  FEATURE_PWR_SOC,
+  FEATURE_PWR_GFX,
+  FEATURE_PWR_DOMAIN_COUNT,
+} FEATURE_PWR_DOMAIN_e;
+
+
+// Debug Overrides Bitmask
+#define DPM_OVERRIDE_DISABLE_FCLK_PID                0x00000001
+#define DPM_OVERRIDE_DISABLE_UCLK_PID                0x00000002
+#define DPM_OVERRIDE_DISABLE_VOLT_LINK_VCN_FCLK      0x00000004
+#define DPM_OVERRIDE_ENABLE_FREQ_LINK_VCLK_FCLK      0x00000008
+#define DPM_OVERRIDE_ENABLE_FREQ_LINK_DCLK_FCLK      0x00000010
+#define DPM_OVERRIDE_ENABLE_FREQ_LINK_GFXCLK_SOCCLK  0x00000020
+#define DPM_OVERRIDE_ENABLE_FREQ_LINK_GFXCLK_UCLK    0x00000040
+#define DPM_OVERRIDE_DISABLE_VOLT_LINK_DCE_FCLK      0x00000080
+#define DPM_OVERRIDE_DISABLE_VOLT_LINK_MP0_SOCCLK    0x00000100
+#define DPM_OVERRIDE_DISABLE_DFLL_PLL_SHUTDOWN       0x00000200
+#define DPM_OVERRIDE_DISABLE_MEMORY_TEMPERATURE_READ 0x00000400
+#define DPM_OVERRIDE_DISABLE_VOLT_LINK_VCN_DCEFCLK   0x00000800
+#define DPM_OVERRIDE_DISABLE_FAST_FCLK_TIMER         0x00001000
+#define DPM_OVERRIDE_DISABLE_VCN_PG                  0x00002000
+#define DPM_OVERRIDE_DISABLE_FMAX_VMAX               0x00004000
+
+// VR Mapping Bit Defines
+#define VR_MAPPING_VR_SELECT_MASK  0x01
+#define VR_MAPPING_VR_SELECT_SHIFT 0x00
+
+#define VR_MAPPING_PLANE_SELECT_MASK  0x02
+#define VR_MAPPING_PLANE_SELECT_SHIFT 0x01
+
+// PSI Bit Defines
+#define PSI_SEL_VR0_PLANE0_PSI0  0x01
+#define PSI_SEL_VR0_PLANE0_PSI1  0x02
+#define PSI_SEL_VR0_PLANE1_PSI0  0x04
+#define PSI_SEL_VR0_PLANE1_PSI1  0x08
+#define PSI_SEL_VR1_PLANE0_PSI0  0x10
+#define PSI_SEL_VR1_PLANE0_PSI1  0x20
+#define PSI_SEL_VR1_PLANE1_PSI0  0x40
+#define PSI_SEL_VR1_PLANE1_PSI1  0x80
+
+// Throttler Control/Status Bits
+#define THROTTLER_PADDING_BIT      0
+#define THROTTLER_TEMP_EDGE_BIT    1
+#define THROTTLER_TEMP_HOTSPOT_BIT 2
+#define THROTTLER_TEMP_MEM_BIT     3
+#define THROTTLER_TEMP_VR_GFX_BIT  4
+#define THROTTLER_TEMP_VR_MEM0_BIT 5
+#define THROTTLER_TEMP_VR_MEM1_BIT 6
+#define THROTTLER_TEMP_VR_SOC_BIT  7
+#define THROTTLER_TEMP_LIQUID0_BIT 8
+#define THROTTLER_TEMP_LIQUID1_BIT 9
+#define THROTTLER_TEMP_PLX_BIT     10
+#define THROTTLER_TDC_GFX_BIT      11
+#define THROTTLER_TDC_SOC_BIT      12
+#define THROTTLER_PPT0_BIT         13
+#define THROTTLER_PPT1_BIT         14
+#define THROTTLER_PPT2_BIT         15
+#define THROTTLER_PPT3_BIT         16
+#define THROTTLER_FIT_BIT          17
+#define THROTTLER_PPM_BIT          18
+#define THROTTLER_APCC_BIT         19
+
+// FW DState Features Control Bits
+// FW DState Features Control Bits
+#define FW_DSTATE_SOC_ULV_BIT               0
+#define FW_DSTATE_G6_HSR_BIT                1
+#define FW_DSTATE_G6_PHY_VDDCI_OFF_BIT      2
+#define FW_DSTATE_MP0_DS_BIT                3
+#define FW_DSTATE_SMN_DS_BIT                4
+#define FW_DSTATE_MP1_DS_BIT                5
+#define FW_DSTATE_MP1_WHISPER_MODE_BIT      6
+#define FW_DSTATE_SOC_LIV_MIN_BIT           7
+#define FW_DSTATE_SOC_PLL_PWRDN_BIT         8
+#define FW_DSTATE_MEM_PLL_PWRDN_BIT         9   
+#define FW_DSTATE_OPTIMIZE_MALL_REFRESH_BIT 10
+#define FW_DSTATE_MEM_PSI_BIT               11
+
+#define FW_DSTATE_SOC_ULV_MASK                    (1 << FW_DSTATE_SOC_ULV_BIT          )
+#define FW_DSTATE_G6_HSR_MASK                     (1 << FW_DSTATE_G6_HSR_BIT           )
+#define FW_DSTATE_G6_PHY_VDDCI_OFF_MASK           (1 << FW_DSTATE_G6_PHY_VDDCI_OFF_BIT )
+#define FW_DSTATE_MP1_DS_MASK                     (1 << FW_DSTATE_MP1_DS_BIT           )  
+#define FW_DSTATE_MP0_DS_MASK                     (1 << FW_DSTATE_MP0_DS_BIT           )   
+#define FW_DSTATE_SMN_DS_MASK                     (1 << FW_DSTATE_SMN_DS_BIT           )
+#define FW_DSTATE_MP1_WHISPER_MODE_MASK           (1 << FW_DSTATE_MP1_WHISPER_MODE_BIT )
+#define FW_DSTATE_SOC_LIV_MIN_MASK                (1 << FW_DSTATE_SOC_LIV_MIN_BIT      )
+#define FW_DSTATE_SOC_PLL_PWRDN_MASK              (1 << FW_DSTATE_SOC_PLL_PWRDN_BIT    )
+#define FW_DSTATE_MEM_PLL_PWRDN_MASK              (1 << FW_DSTATE_MEM_PLL_PWRDN_BIT    )
+#define FW_DSTATE_OPTIMIZE_MALL_REFRESH_MASK      (1 << FW_DSTATE_OPTIMIZE_MALL_REFRESH_BIT    )
+#define FW_DSTATE_MEM_PSI_MASK                    (1 << FW_DSTATE_MEM_PSI_BIT    )
+
+// GFX GPO Feature Contains PACE and DEM sub features
+#define GFX_GPO_PACE_BIT                   0
+#define GFX_GPO_DEM_BIT                    1
+
+#define GFX_GPO_PACE_MASK                  (1 << GFX_GPO_PACE_BIT)
+#define GFX_GPO_DEM_MASK                   (1 << GFX_GPO_DEM_BIT )
+
+#define GPO_UPDATE_REQ_UCLKDPM_MASK  0x1
+#define GPO_UPDATE_REQ_FCLKDPM_MASK  0x2
+#define GPO_UPDATE_REQ_MALLHIT_MASK  0x4
+
+
+//LED Display Mask & Control Bits
+#define LED_DISPLAY_GFX_DPM_BIT            0
+#define LED_DISPLAY_PCIE_BIT               1
+#define LED_DISPLAY_ERROR_BIT              2
+
+//RLC Pace Table total number of levels
+#define RLC_PACE_TABLE_NUM_LEVELS 16
+
+typedef enum {
+  DRAM_BIT_WIDTH_DISABLED = 0,
+  DRAM_BIT_WIDTH_X_8,
+  DRAM_BIT_WIDTH_X_16,
+  DRAM_BIT_WIDTH_X_32,
+  DRAM_BIT_WIDTH_X_64, // NOT USED.
+  DRAM_BIT_WIDTH_X_128,
+  DRAM_BIT_WIDTH_COUNT,
+} DRAM_BIT_WIDTH_TYPE_e;
+
+//I2C Interface
+#define NUM_I2C_CONTROLLERS                16
+
+#define I2C_CONTROLLER_ENABLED             1
+#define I2C_CONTROLLER_DISABLED            0
+
+#define MAX_SW_I2C_COMMANDS                24
+
+typedef enum {
+  I2C_CONTROLLER_PORT_0 = 0,  //CKSVII2C0
+  I2C_CONTROLLER_PORT_1 = 1,  //CKSVII2C1
+  I2C_CONTROLLER_PORT_COUNT,
+} I2cControllerPort_e;
+
+typedef enum {
+  I2C_CONTROLLER_NAME_VR_GFX = 0,
+  I2C_CONTROLLER_NAME_VR_SOC,
+  I2C_CONTROLLER_NAME_VR_VDDCI,
+  I2C_CONTROLLER_NAME_VR_MVDD,
+  I2C_CONTROLLER_NAME_LIQUID0,
+  I2C_CONTROLLER_NAME_LIQUID1,  
+  I2C_CONTROLLER_NAME_PLX,
+  I2C_CONTROLLER_NAME_OTHER,
+  I2C_CONTROLLER_NAME_COUNT,  
+} I2cControllerName_e;
+
+typedef enum {
+  I2C_CONTROLLER_THROTTLER_TYPE_NONE = 0,
+  I2C_CONTROLLER_THROTTLER_VR_GFX,
+  I2C_CONTROLLER_THROTTLER_VR_SOC,
+  I2C_CONTROLLER_THROTTLER_VR_VDDCI,
+  I2C_CONTROLLER_THROTTLER_VR_MVDD,
+  I2C_CONTROLLER_THROTTLER_LIQUID0,
+  I2C_CONTROLLER_THROTTLER_LIQUID1,  
+  I2C_CONTROLLER_THROTTLER_PLX,
+  I2C_CONTROLLER_THROTTLER_INA3221,
+  I2C_CONTROLLER_THROTTLER_COUNT,  
+} I2cControllerThrottler_e;
+
+typedef enum {
+  I2C_CONTROLLER_PROTOCOL_VR_XPDE132G5,
+  I2C_CONTROLLER_PROTOCOL_VR_IR35217,
+  I2C_CONTROLLER_PROTOCOL_TMP_TMP102A,
+  I2C_CONTROLLER_PROTOCOL_INA3221,
+  I2C_CONTROLLER_PROTOCOL_COUNT,  
+} I2cControllerProtocol_e;
+
+typedef struct {
+  uint8_t   Enabled;
+  uint8_t   Speed;
+  uint8_t   SlaveAddress;  
+  uint8_t   ControllerPort;
+  uint8_t   ControllerName;
+  uint8_t   ThermalThrotter;
+  uint8_t   I2cProtocol;
+  uint8_t   PaddingConfig;  
+} I2cControllerConfig_t;
+
+typedef enum {
+  I2C_PORT_SVD_SCL = 0,  
+  I2C_PORT_GPIO,      
+} I2cPort_e; 
+
+typedef enum {
+  I2C_SPEED_FAST_50K = 0,      //50  Kbits/s
+  I2C_SPEED_FAST_100K,         //100 Kbits/s
+  I2C_SPEED_FAST_400K,         //400 Kbits/s
+  I2C_SPEED_FAST_PLUS_1M,      //1   Mbits/s (in fast mode)
+  I2C_SPEED_HIGH_1M,           //1   Mbits/s (in high speed mode)
+  I2C_SPEED_HIGH_2M,           //2.3 Mbits/s  
+  I2C_SPEED_COUNT,  
+} I2cSpeed_e;
+
+typedef enum {
+  I2C_CMD_READ = 0,
+  I2C_CMD_WRITE,
+  I2C_CMD_COUNT,  
+} I2cCmdType_e;
+
+typedef enum {
+  FAN_MODE_AUTO = 0,
+  FAN_MODE_MANUAL_LINEAR,
+} FanMode_e;
+
+#define CMDCONFIG_STOP_BIT             0
+#define CMDCONFIG_RESTART_BIT          1
+#define CMDCONFIG_READWRITE_BIT        2 //bit should be 0 for read, 1 for write
+
+#define CMDCONFIG_STOP_MASK           (1 << CMDCONFIG_STOP_BIT)
+#define CMDCONFIG_RESTART_MASK        (1 << CMDCONFIG_RESTART_BIT)
+#define CMDCONFIG_READWRITE_MASK      (1 << CMDCONFIG_READWRITE_BIT)
+
+typedef struct {
+  uint8_t ReadWriteData;  //Return data for read. Data to send for write
+  uint8_t CmdConfig; //Includes whether associated command should have a stop or restart command, and is a read or write
+} SwI2cCmd_t; //SW I2C Command Table
+
+typedef struct {
+  uint8_t     I2CcontrollerPort; //CKSVII2C0(0) or //CKSVII2C1(1)
+  uint8_t     I2CSpeed;          //Use I2cSpeed_e to indicate speed to select
+  uint8_t     SlaveAddress;      //Slave address of device
+  uint8_t     NumCmds;           //Number of commands
+
+  SwI2cCmd_t  SwI2cCmds[MAX_SW_I2C_COMMANDS];
+} SwI2cRequest_t; // SW I2C Request Table
+
+typedef struct {
+  SwI2cRequest_t SwI2cRequest;
+
+  uint32_t Spare[8];
+  uint32_t MmHubPadding[8]; // SMU internal use
+} SwI2cRequestExternal_t;
+
+//D3HOT sequences
+typedef enum {
+  BACO_SEQUENCE,
+  MSR_SEQUENCE,
+  BAMACO_SEQUENCE,
+  ULPS_SEQUENCE,
+  D3HOT_SEQUENCE_COUNT,
+} D3HOTSequence_e;
+
+//THis is aligned with RSMU PGFSM Register Mapping
+typedef enum {
+  PG_DYNAMIC_MODE = 0,
+  PG_STATIC_MODE,
+} PowerGatingMode_e;
+
+//This is aligned with RSMU PGFSM Register Mapping
+typedef enum {
+  PG_POWER_DOWN = 0,
+  PG_POWER_UP,
+} PowerGatingSettings_e;
+
+typedef struct {            
+  uint32_t a;  // store in IEEE float format in this variable
+  uint32_t b;  // store in IEEE float format in this variable
+  uint32_t c;  // store in IEEE float format in this variable
+} QuadraticInt_t;
+
+typedef struct {            
+  uint32_t a;  // store in fixed point, [31:20] signed integer, [19:0] fractional bits
+  uint32_t b;  // store in fixed point, [31:20] signed integer, [19:0] fractional bits
+  uint32_t c;  // store in fixed point, [31:20] signed integer, [19:0] fractional bits
+} QuadraticFixedPoint_t;
+
+typedef struct {            
+  uint32_t m;  // store in IEEE float format in this variable
+  uint32_t b;  // store in IEEE float format in this variable
+} LinearInt_t;
+
+typedef struct {            
+  uint32_t a;  // store in IEEE float format in this variable
+  uint32_t b;  // store in IEEE float format in this variable
+  uint32_t c;  // store in IEEE float format in this variable
+} DroopInt_t;
+
+//Piecewise linear droop model, Sienna_Cichlid currently used only for GFX DFLL 
+#define NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS 5
+typedef enum {
+  PIECEWISE_LINEAR_FUSED_MODEL = 0,
+  PIECEWISE_LINEAR_PP_MODEL,
+  QUADRATIC_PP_MODEL,
+} DfllDroopModelSelect_e;
+
+typedef struct {
+  uint32_t Fset[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];    //in GHz, store in IEEE float format
+  uint32_t Vdroop[NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS];  //in V  , store in IEEE float format
+}PiecewiseLinearDroopInt_t;
+
+typedef enum {
+  GFXCLK_SOURCE_PLL = 0, 
+  GFXCLK_SOURCE_DFLL, 
+  GFXCLK_SOURCE_COUNT, 
+} GFXCLK_SOURCE_e; 
+
+//Only Clks that have DPM descriptors are listed here 
+typedef enum {
+  PPCLK_GFXCLK = 0,
+  PPCLK_SOCCLK,
+  PPCLK_UCLK,
+  PPCLK_FCLK,  
+  PPCLK_DCLK_0,
+  PPCLK_VCLK_0,
+  PPCLK_DCLK_1,
+  PPCLK_VCLK_1,
+  PPCLK_DCEFCLK,
+  PPCLK_DISPCLK,
+  PPCLK_PIXCLK,
+  PPCLK_PHYCLK,
+  PPCLK_DTBCLK,
+  PPCLK_COUNT,
+} PPCLK_e;
+
+typedef enum {
+  VOLTAGE_MODE_AVFS = 0,
+  VOLTAGE_MODE_AVFS_SS,
+  VOLTAGE_MODE_SS,
+  VOLTAGE_MODE_COUNT,
+} VOLTAGE_MODE_e;
+
+
+typedef enum {
+  AVFS_VOLTAGE_GFX = 0,
+  AVFS_VOLTAGE_SOC,
+  AVFS_VOLTAGE_COUNT,
+} AVFS_VOLTAGE_TYPE_e;
+
+typedef enum {
+  UCLK_DIV_BY_1 = 0,
+  UCLK_DIV_BY_2,
+  UCLK_DIV_BY_4,
+  UCLK_DIV_BY_8,
+} UCLK_DIV_e;
+
+typedef enum {
+  GPIO_INT_POLARITY_ACTIVE_LOW = 0,
+  GPIO_INT_POLARITY_ACTIVE_HIGH,
+} GpioIntPolarity_e;
+
+typedef enum {
+  PWR_CONFIG_TDP = 0,
+  PWR_CONFIG_TGP,
+  PWR_CONFIG_TCP_ESTIMATED,
+  PWR_CONFIG_TCP_MEASURED,
+} PwrConfig_e;
+
+typedef enum {
+  XGMI_LINK_RATE_2 = 2,    // 2Gbps
+  XGMI_LINK_RATE_4 = 4,    // 4Gbps
+  XGMI_LINK_RATE_8 = 8,    // 8Gbps
+  XGMI_LINK_RATE_12 = 12,  // 12Gbps
+  XGMI_LINK_RATE_16 = 16,  // 16Gbps
+  XGMI_LINK_RATE_17 = 17,  // 17Gbps
+  XGMI_LINK_RATE_18 = 18,  // 18Gbps
+  XGMI_LINK_RATE_19 = 19,  // 19Gbps
+  XGMI_LINK_RATE_20 = 20,  // 20Gbps
+  XGMI_LINK_RATE_21 = 21,  // 21Gbps
+  XGMI_LINK_RATE_22 = 22,  // 22Gbps
+  XGMI_LINK_RATE_23 = 23,  // 23Gbps
+  XGMI_LINK_RATE_24 = 24,  // 24Gbps
+  XGMI_LINK_RATE_25 = 25,  // 25Gbps
+  XGMI_LINK_RATE_COUNT
+} XGMI_LINK_RATE_e;
+
+typedef enum {
+  XGMI_LINK_WIDTH_1 = 0,  // x1
+  XGMI_LINK_WIDTH_2,  // x2
+  XGMI_LINK_WIDTH_4,  // x4
+  XGMI_LINK_WIDTH_8,  // x8
+  XGMI_LINK_WIDTH_9,  // x9
+  XGMI_LINK_WIDTH_16, // x16
+  XGMI_LINK_WIDTH_COUNT
+} XGMI_LINK_WIDTH_e;
+
+typedef struct {
+  uint8_t        VoltageMode;         // 0 - AVFS only, 1- min(AVFS,SS), 2-SS only
+  uint8_t        SnapToDiscrete;      // 0 - Fine grained DPM, 1 - Discrete DPM
+  uint8_t        NumDiscreteLevels;   // Set to 2 (Fmin, Fmax) when using fine grained DPM, otherwise set to # discrete levels used
+  uint8_t        Padding;         
+  LinearInt_t    ConversionToAvfsClk; // Transfer function to AVFS Clock (GHz->GHz)
+  QuadraticInt_t SsCurve;             // Slow-slow curve (GHz->V)
+  uint16_t       SsFmin;              // Fmin for SS curve. If SS curve is selected, will use V@SSFmin for F <= Fmin
+  uint16_t       Padding16;    
+} DpmDescriptor_t;
+
+typedef enum  {
+  PPT_THROTTLER_PPT0,
+  PPT_THROTTLER_PPT1,
+  PPT_THROTTLER_PPT2,
+  PPT_THROTTLER_PPT3,       
+  PPT_THROTTLER_COUNT
+} PPT_THROTTLER_e;
+
+typedef enum  {
+  TEMP_EDGE,
+  TEMP_HOTSPOT,
+  TEMP_MEM,
+  TEMP_VR_GFX,
+  TEMP_VR_MEM0,
+  TEMP_VR_MEM1,
+  TEMP_VR_SOC,  
+  TEMP_LIQUID0,
+  TEMP_LIQUID1,  
+  TEMP_PLX,
+  TEMP_COUNT,
+} TEMP_e;
+
+typedef enum {
+  TDC_THROTTLER_GFX,
+  TDC_THROTTLER_SOC,
+  TDC_THROTTLER_COUNT
+} TDC_THROTTLER_e;
+
+// Used for 2-step UCLK DPM change workaround
+typedef struct {
+  uint16_t Fmin;
+  uint16_t Fmax;
+} UclkDpmChangeRange_t;
+
+typedef struct {
+  // MAJOR SECTION: SKU PARAMETERS
+
+  uint32_t Version;
+
+  // SECTION: Feature Enablement
+  uint32_t FeaturesToRun[NUM_FEATURES / 32];
+
+  // SECTION: Infrastructure Limits
+  uint16_t SocketPowerLimitAc[PPT_THROTTLER_COUNT]; // Watts
+  uint16_t SocketPowerLimitAcTau[PPT_THROTTLER_COUNT]; // Time constant of LPF in ms
+  uint16_t SocketPowerLimitDc[PPT_THROTTLER_COUNT];  // Watts
+  uint16_t SocketPowerLimitDcTau[PPT_THROTTLER_COUNT];  // Time constant of LPF in ms
+
+  uint16_t TdcLimit[TDC_THROTTLER_COUNT];             // Amps
+  uint16_t TdcLimitTau[TDC_THROTTLER_COUNT];          // Time constant of LPF in ms
+
+  uint16_t TemperatureLimit[TEMP_COUNT]; // Celcius
+  
+  uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
+
+  // SECTION: Power Configuration
+  uint8_t      TotalPowerConfig;    //0-TDP, 1-TGP, 2-TCP Estimated, 3-TCP Measured. Use defines from PwrConfig_e
+  uint8_t      TotalPowerPadding[3];  
+
+  // SECTION: APCC Settings
+  uint32_t     ApccPlusResidencyLimit;
+
+  //SECTION: SMNCLK DPM
+  uint16_t       SmnclkDpmFreq        [NUM_SMNCLK_DPM_LEVELS];       // in MHz
+  uint16_t       SmnclkDpmVoltage     [NUM_SMNCLK_DPM_LEVELS];       // mV(Q2)
+
+  uint32_t     PaddingAPCC[4];
+
+  // SECTION: Throttler settings
+  uint32_t ThrottlerControlMask;   // See Throtter masks defines
+
+  // SECTION: FW DSTATE Settings  
+  uint32_t FwDStateMask;           // See FW DState masks defines
+
+  // SECTION: ULV Settings
+  uint16_t  UlvVoltageOffsetSoc; // In mV(Q2)
+  uint16_t  UlvVoltageOffsetGfx; // In mV(Q2)
+
+  uint16_t     MinVoltageUlvGfx; // In mV(Q2)  Minimum Voltage ("Vmin") of VDD_GFX in ULV mode 
+  uint16_t     MinVoltageUlvSoc; // In mV(Q2)  Minimum Voltage ("Vmin") of VDD_SOC in ULV mode
+
+  uint16_t     SocLIVmin;        // In mV(Q2)  Long Idle Vmin (deep ULV), for VDD_SOC
+  uint16_t     PaddingLIVmin;
+
+  uint8_t   GceaLinkMgrIdleThreshold;        //Set by SMU FW during enablment of GFXOFF. Controls delay for GFX SDP port disconnection during idle events
+  uint8_t   paddingRlcUlvParams[3];
+
+  // SECTION: Voltage Control Parameters
+  uint16_t     MinVoltageGfx;     // In mV(Q2) Minimum Voltage ("Vmin") of VDD_GFX
+  uint16_t     MinVoltageSoc;     // In mV(Q2) Minimum Voltage ("Vmin") of VDD_SOC
+  uint16_t     MaxVoltageGfx;     // In mV(Q2) Maximum Voltage allowable of VDD_GFX
+  uint16_t     MaxVoltageSoc;     // In mV(Q2) Maximum Voltage allowable of VDD_SOC
+
+  uint16_t     LoadLineResistanceGfx;   // In mOhms with 8 fractional bits
+  uint16_t     LoadLineResistanceSoc;   // In mOhms with 8 fractional bits
+
+  // SECTION: Temperature Dependent Vmin
+  uint16_t     VDDGFX_TVmin;       //Celcius
+  uint16_t     VDDSOC_TVmin;       //Celcius
+  uint16_t     VDDGFX_Vmin_HiTemp; // mV Q2
+  uint16_t     VDDGFX_Vmin_LoTemp; // mV Q2
+  uint16_t     VDDSOC_Vmin_HiTemp; // mV Q2
+  uint16_t     VDDSOC_Vmin_LoTemp; // mV Q2
+  
+  uint16_t     VDDGFX_TVminHystersis; // Celcius
+  uint16_t     VDDSOC_TVminHystersis; // Celcius
+
+  //SECTION: DPM Config 1
+  DpmDescriptor_t DpmDescriptor[PPCLK_COUNT];
+
+  uint16_t       FreqTableGfx      [NUM_GFXCLK_DPM_LEVELS  ];     // In MHz
+  uint16_t       FreqTableVclk     [NUM_VCLK_DPM_LEVELS    ];     // In MHz
+  uint16_t       FreqTableDclk     [NUM_DCLK_DPM_LEVELS    ];     // In MHz
+  uint16_t       FreqTableSocclk   [NUM_SOCCLK_DPM_LEVELS  ];     // In MHz
+  uint16_t       FreqTableUclk     [NUM_UCLK_DPM_LEVELS    ];     // In MHz
+  uint16_t       FreqTableDcefclk  [NUM_DCEFCLK_DPM_LEVELS ];     // In MHz
+  uint16_t       FreqTableDispclk  [NUM_DISPCLK_DPM_LEVELS ];     // In MHz
+  uint16_t       FreqTablePixclk   [NUM_PIXCLK_DPM_LEVELS  ];     // In MHz
+  uint16_t       FreqTablePhyclk   [NUM_PHYCLK_DPM_LEVELS  ];     // In MHz
+  uint16_t       FreqTableDtbclk   [NUM_DTBCLK_DPM_LEVELS  ];     // In MHz
+  uint16_t       FreqTableFclk     [NUM_FCLK_DPM_LEVELS    ];     // In MHz
+  uint32_t       Paddingclks[16];
+
+  uint32_t       DcModeMaxFreq     [PPCLK_COUNT            ];     // In MHz
+  
+  uint8_t        FreqTableUclkDiv  [NUM_UCLK_DPM_LEVELS    ];     // 0:Div-1, 1:Div-1/2, 2:Div-1/4, 3:Div-1/8
+  
+  // Used for MALL performance boost
+  uint16_t       FclkBoostFreq;                                   // In Mhz
+  uint16_t       FclkParamPadding;
+
+  // SECTION: DPM Config 2
+  uint16_t       Mp0clkFreq        [NUM_MP0CLK_DPM_LEVELS];       // in MHz
+  uint16_t       Mp0DpmVoltage     [NUM_MP0CLK_DPM_LEVELS];       // mV(Q2)
+  uint16_t       MemVddciVoltage   [NUM_UCLK_DPM_LEVELS];         // mV(Q2)
+  uint16_t       MemMvddVoltage    [NUM_UCLK_DPM_LEVELS];         // mV(Q2)
+  // GFXCLK DPM
+  uint16_t        GfxclkFgfxoffEntry;   // in Mhz
+  uint16_t        GfxclkFinit;          // in Mhz 
+  uint16_t        GfxclkFidle;          // in MHz 
+  uint8_t         GfxclkSource;         // 0 = PLL, 1 = DFLL
+  uint8_t         GfxclkPadding;
+
+  // GFX GPO 
+  uint8_t         GfxGpoSubFeatureMask; // bit 0 = PACE, bit 1 = DEM
+  uint8_t         GfxGpoEnabledWorkPolicyMask; //Any policy that GPO can be enabled
+  uint8_t         GfxGpoDisabledWorkPolicyMask; //Any policy that GPO can be disabled
+  uint8_t         GfxGpoPadding[1];
+  uint32_t        GfxGpoVotingAllow;    //For indicating which feature changes should result in a GPO table recalculation
+
+  uint32_t        GfxGpoPadding32[4];  
+
+  uint16_t        GfxDcsFopt;           // Optimal GFXCLK for DCS in Mhz
+  uint16_t        GfxDcsFclkFopt;       // Optimal FCLK for DCS in Mhz
+  uint16_t        GfxDcsUclkFopt;       // Optimal UCLK for DCS in Mhz
+  
+  uint16_t        DcsGfxOffVoltage;     //Voltage in mV(Q2) applied to VDDGFX when entering DCS GFXOFF phase  
+
+  uint16_t        DcsMinGfxOffTime;     //Minimum amount of time PMFW shuts GFX OFF as part of GFX DCS phase
+  uint16_t        DcsMaxGfxOffTime;      //Maximum amount of time PMFW can shut GFX OFF as part of GFX DCS phase at a stretch.
+
+  uint32_t        DcsMinCreditAccum;    //Min amount of positive credit accumulation before waking GFX up as part of DCS.
+
+  uint16_t        DcsExitHysteresis;    //The min amount of time power credit accumulator should have a value > 0 before SMU exits the DCS throttling phase. 
+  uint16_t        DcsTimeout;           //This is the amount of time SMU FW waits for RLC to put GFX into GFXOFF before reverting to the fallback mechanism of throttling GFXCLK to Fmin.
+
+  uint32_t        DcsParamPadding[5];
+
+  uint16_t        FlopsPerByteTable[RLC_PACE_TABLE_NUM_LEVELS]; // Q8.8
+
+  // UCLK section
+  uint8_t      LowestUclkReservedForUlv; // Set this to 1 if UCLK DPM0 is reserved for ULV-mode only
+  uint8_t      PaddingMem[3];
+  
+  uint8_t      UclkDpmPstates     [NUM_UCLK_DPM_LEVELS];     // 4 DPM states, 0-P0, 1-P1, 2-P2, 3-P3.
+  
+  // Used for 2-Step UCLK change workaround
+  UclkDpmChangeRange_t UclkDpmSrcFreqRange;  // In Mhz
+  UclkDpmChangeRange_t UclkDpmTargFreqRange; // In Mhz
+  uint16_t UclkDpmMidstepFreq;               // In Mhz
+  uint16_t UclkMidstepPadding;
+
+  // Link DPM Settings
+  uint8_t      PcieGenSpeed[NUM_LINK_LEVELS];           ///< 0:PciE-gen1 1:PciE-gen2 2:PciE-gen3 3:PciE-gen4
+  uint8_t      PcieLaneCount[NUM_LINK_LEVELS];          ///< 1=x1, 2=x2, 3=x4, 4=x8, 5=x12, 6=x16
+  uint16_t     LclkFreq[NUM_LINK_LEVELS];              
+ 
+  // SECTION: Fan Control
+  uint16_t     FanStopTemp;          //Celcius
+  uint16_t     FanStartTemp;         //Celcius
+
+  uint16_t     FanGain[TEMP_COUNT];
+
+  uint16_t     FanPwmMin;
+  uint16_t     FanAcousticLimitRpm;
+  uint16_t     FanThrottlingRpm;
+  uint16_t     FanMaximumRpm;
+  uint16_t     MGpuFanBoostLimitRpm;  
+  uint16_t     FanTargetTemperature;
+  uint16_t     FanTargetGfxclk;
+  uint16_t     FanPadding16;
+  uint8_t      FanTempInputSelect;
+  uint8_t      FanPadding;
+  uint8_t      FanZeroRpmEnable; 
+  uint8_t      FanTachEdgePerRev;
+    
+  // The following are AFC override parameters. Leave at 0 to use FW defaults.
+  int16_t      FuzzyFan_ErrorSetDelta;
+  int16_t      FuzzyFan_ErrorRateSetDelta;
+  int16_t      FuzzyFan_PwmSetDelta;
+  uint16_t     FuzzyFan_Reserved;
+
+  // SECTION: AVFS 
+  // Overrides
+  uint8_t           OverrideAvfsGb[AVFS_VOLTAGE_COUNT];
+  uint8_t           dBtcGbGfxDfllModelSelect;  //0 -> fused piece-wise model, 1 -> piece-wise linear(PPTable), 2 -> quadratic model(PPTable)  
+  uint8_t           Padding8_Avfs;
+
+  QuadraticInt_t    qAvfsGb[AVFS_VOLTAGE_COUNT];              // GHz->V Override of fused curve 
+  DroopInt_t        dBtcGbGfxPll;         // GHz->V BtcGb
+  DroopInt_t        dBtcGbGfxDfll;        // GHz->V BtcGb
+  DroopInt_t        dBtcGbSoc;            // GHz->V BtcGb
+  LinearInt_t       qAgingGb[AVFS_VOLTAGE_COUNT];          // GHz->V 
+
+  PiecewiseLinearDroopInt_t   PiecewiseLinearDroopIntGfxDfll; //GHz ->Vstore in IEEE float format
+
+  QuadraticInt_t    qStaticVoltageOffset[AVFS_VOLTAGE_COUNT]; // GHz->V 
+
+  uint16_t          DcTol[AVFS_VOLTAGE_COUNT];            // mV Q2
+
+  uint8_t           DcBtcEnabled[AVFS_VOLTAGE_COUNT];
+  uint8_t           Padding8_GfxBtc[2];
+
+  uint16_t          DcBtcMin[AVFS_VOLTAGE_COUNT];       // mV Q2
+  uint16_t          DcBtcMax[AVFS_VOLTAGE_COUNT];       // mV Q2
+
+  uint16_t          DcBtcGb[AVFS_VOLTAGE_COUNT];       // mV Q2
+  
+  // SECTION: XGMI
+  uint8_t           XgmiDpmPstates[NUM_XGMI_LEVELS]; // 2 DPM states, high and low.  0-P0, 1-P1, 2-P2, 3-P3.
+  uint8_t           XgmiDpmSpare[2];
+
+  // SECTION: Advanced Options
+  uint32_t          DebugOverrides;
+  QuadraticInt_t    ReservedEquation0; 
+  QuadraticInt_t    ReservedEquation1; 
+  QuadraticInt_t    ReservedEquation2; 
+  QuadraticInt_t    ReservedEquation3; 
+
+  // SECTION: Sku Reserved
+  uint32_t         SkuReserved[15];
+
+  // MAJOR SECTION: BOARD PARAMETERS
+
+  //SECTION: Gaming Clocks
+  uint32_t     GamingClk[6];
+
+  // SECTION: I2C Control
+  I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];     
+
+  uint8_t      GpioScl;  // GPIO Number for SCL Line, used only for CKSVII2C1
+  uint8_t      GpioSda;  // GPIO Number for SDA Line, used only for CKSVII2C1
+  uint8_t      FchUsbPdSlaveAddr; //For requesting USB PD controller S-states via FCH I2C when entering PME turn off
+  uint8_t      I2cSpare[1];
+
+  // SECTION: SVI2 Board Parameters
+  uint8_t      VddGfxVrMapping;   // Use VR_MAPPING* bitfields
+  uint8_t      VddSocVrMapping;   // Use VR_MAPPING* bitfields
+  uint8_t      VddMem0VrMapping;  // Use VR_MAPPING* bitfields
+  uint8_t      VddMem1VrMapping;  // Use VR_MAPPING* bitfields
+
+  uint8_t      GfxUlvPhaseSheddingMask; // set this to 1 to set PSI0/1 to 1 in ULV mode
+  uint8_t      SocUlvPhaseSheddingMask; // set this to 1 to set PSI0/1 to 1 in ULV mode
+  uint8_t      VddciUlvPhaseSheddingMask; // set this to 1 to set PSI0/1 to 1 in ULV mode
+  uint8_t      MvddUlvPhaseSheddingMask; // set this to 1 to set PSI0/1 to 1 in ULV mode
+
+  // SECTION: Telemetry Settings
+  uint16_t     GfxMaxCurrent;   // in Amps
+  int8_t       GfxOffset;       // in Amps
+  uint8_t      Padding_TelemetryGfx;
+
+  uint16_t     SocMaxCurrent;   // in Amps
+  int8_t       SocOffset;       // in Amps
+  uint8_t      Padding_TelemetrySoc;
+
+  uint16_t     Mem0MaxCurrent;   // in Amps
+  int8_t       Mem0Offset;       // in Amps
+  uint8_t      Padding_TelemetryMem0;
+  
+  uint16_t     Mem1MaxCurrent;   // in Amps
+  int8_t       Mem1Offset;       // in Amps
+  uint8_t      Padding_TelemetryMem1;
+
+  uint32_t     MvddRatio; // This is used for MVDD  Svi2 Div Ratio workaround. It has 16 fractional bits (Q16.16)
+  
+  // SECTION: GPIO Settings
+  uint8_t      AcDcGpio;        // GPIO pin configured for AC/DC switching
+  uint8_t      AcDcPolarity;    // GPIO polarity for AC/DC switching
+  uint8_t      VR0HotGpio;      // GPIO pin configured for VR0 HOT event
+  uint8_t      VR0HotPolarity;  // GPIO polarity for VR0 HOT event
+
+  uint8_t      VR1HotGpio;      // GPIO pin configured for VR1 HOT event 
+  uint8_t      VR1HotPolarity;  // GPIO polarity for VR1 HOT event 
+  uint8_t      GthrGpio;        // GPIO pin configured for GTHR Event
+  uint8_t      GthrPolarity;    // replace GPIO polarity for GTHR
+
+  // LED Display Settings
+  uint8_t      LedPin0;         // GPIO number for LedPin[0]
+  uint8_t      LedPin1;         // GPIO number for LedPin[1]
+  uint8_t      LedPin2;         // GPIO number for LedPin[2]
+  uint8_t      LedEnableMask;
+
+  uint8_t      LedPcie;        // GPIO number for PCIE results
+  uint8_t      LedError;       // GPIO number for Error Cases
+  uint8_t      LedSpare1[2];
+
+  // SECTION: Clock Spread Spectrum
+  
+  // GFXCLK PLL Spread Spectrum
+  uint8_t      PllGfxclkSpreadEnabled;   // on or off
+  uint8_t      PllGfxclkSpreadPercent;   // Q4.4
+  uint16_t     PllGfxclkSpreadFreq;      // kHz
+
+  // GFXCLK DFLL Spread Spectrum
+  uint8_t      DfllGfxclkSpreadEnabled;   // on or off
+  uint8_t      DfllGfxclkSpreadPercent;   // Q4.4
+  uint16_t     DfllGfxclkSpreadFreq;      // kHz
+  
+  // UCLK Spread Spectrum
+  uint8_t      UclkSpreadEnabled;   // on or off
+  uint8_t      UclkSpreadPercent;   // Q4.4
+  uint16_t     UclkSpreadFreq;      // kHz
+
+  // FCLK Spread Spectrum
+  uint8_t      FclkSpreadEnabled;   // on or off
+  uint8_t      FclkSpreadPercent;   // Q4.4
+  uint16_t     FclkSpreadFreq;      // kHz
+  
+  // Section: Memory Config
+  uint32_t     MemoryChannelEnabled; // For DRAM use only, Max 32 channels enabled bit mask. 
+  
+  uint8_t      DramBitWidth; // For DRAM use only.  See Dram Bit width type defines
+  uint8_t      PaddingMem1[3];
+
+  // Section: Total Board Power
+  uint16_t     TotalBoardPower;     //Only needed for TCP Estimated case, where TCP = TGP+Total Board Power
+  uint16_t     BoardPowerPadding; 
+  
+  // SECTION: XGMI Training
+  uint8_t      XgmiLinkSpeed   [NUM_XGMI_PSTATE_LEVELS];
+  uint8_t      XgmiLinkWidth   [NUM_XGMI_PSTATE_LEVELS];
+
+  uint16_t     XgmiFclkFreq    [NUM_XGMI_PSTATE_LEVELS];
+  uint16_t     XgmiSocVoltage  [NUM_XGMI_PSTATE_LEVELS];
+
+  // SECTION: UMC feature flags
+  uint8_t      HsrEnabled;
+  uint8_t      VddqOffEnabled;
+  uint8_t      PaddingUmcFlags[2];
+
+  // SECTION: Board Reserved
+  uint32_t     BoardReserved[15];
+
+  // SECTION: Structure Padding
+
+  // Padding for MMHUB - do not modify this
+  uint32_t     MmHubPadding[8]; // SMU internal use
+
+} PPTable_t;
+
+typedef struct {
+  // Time constant parameters for clock averages in ms
+  uint16_t     GfxclkAverageLpfTau;
+  uint16_t     FclkAverageLpfTau;
+  uint16_t     UclkAverageLpfTau;
+  uint16_t     GfxActivityLpfTau;
+  uint16_t     UclkActivityLpfTau;
+  uint16_t     SocketPowerLpfTau;  
+} DriverSmuConfig_t;
+
+typedef struct {
+  DriverSmuConfig_t DriverSmuConfig;
+
+  uint32_t     Spare[8];  
+  // Padding - ignore
+  uint32_t     MmHubPadding[8]; // SMU internal use
+} DriverSmuConfigExternal_t;
+
+typedef struct {
+  uint16_t               GfxclkFmin;           // MHz
+  uint16_t               GfxclkFmax;           // MHz
+  QuadraticInt_t         CustomGfxVfCurve;     // a: mV/MHz^2, b: mv/MHz, c: mV
+  uint16_t               CustomCurveFmin;      // MHz 
+  uint16_t               UclkFmin;             // MHz  
+  uint16_t               UclkFmax;             // MHz
+  int16_t                OverDrivePct;         // %
+  uint16_t               FanMaximumRpm;
+  uint16_t               FanMinimumPwm;
+  uint16_t               FanTargetTemperature; // Degree Celcius 
+  uint8_t                FanLinearPwmPoints[NUM_OD_FAN_MAX_POINTS];
+  uint8_t                FanLinearTempPoints[NUM_OD_FAN_MAX_POINTS];
+  uint16_t               MaxOpTemp;            // Degree Celcius
+  uint8_t                FanZeroRpmEnable;
+  uint8_t                FanZeroRpmStopTemp;
+  uint8_t                FanMode;
+  uint8_t                Padding[1];
+} OverDriveTable_t; 
+
+typedef struct {
+  OverDriveTable_t OverDriveTable;
+  uint32_t      Spare[8];  
+
+  uint32_t     MmHubPadding[8]; // SMU internal use    
+} OverDriveTableExternal_t;
+
+typedef struct {
+  uint32_t CurrClock[PPCLK_COUNT];
+  uint16_t AverageGfxclkFrequency;
+  uint16_t AverageFclkFrequency;
+  uint16_t AverageUclkFrequency  ;
+  uint16_t AverageGfxActivity    ;
+  uint16_t AverageUclkActivity   ;
+  uint8_t  CurrSocVoltageOffset  ;
+  uint8_t  CurrGfxVoltageOffset  ;
+  uint8_t  CurrMemVidOffset      ;
+  uint8_t  Padding8        ;
+  uint16_t AverageSocketPower    ;
+  uint16_t TemperatureEdge       ;
+  uint16_t TemperatureHotspot    ;
+  uint16_t TemperatureMem        ;
+  uint16_t TemperatureVrGfx      ;
+  uint16_t TemperatureVrMem0     ;
+  uint16_t TemperatureVrMem1     ;  
+  uint16_t TemperatureVrSoc      ;  
+  uint16_t TemperatureLiquid0    ;
+  uint16_t TemperatureLiquid1    ;  
+  uint16_t TemperaturePlx        ;
+  uint32_t ThrottlerStatus       ; 
+ 
+  uint8_t  LinkDpmLevel;
+  uint8_t  CurrFanPwm;
+  uint16_t CurrFanSpeed;
+
+  //BACO metrics, PMFW-1721
+  //metrics for D3hot entry/exit and driver ARM msgs
+  uint8_t D3HotEntryCountPerMode[D3HOT_SEQUENCE_COUNT];
+  uint8_t D3HotExitCountPerMode[D3HOT_SEQUENCE_COUNT];
+  uint8_t ArmMsgReceivedCountPerMode[D3HOT_SEQUENCE_COUNT];
+} SmuMetrics_t;
+
+typedef struct {
+  SmuMetrics_t SmuMetrics;
+  uint32_t Spare[5];
+
+  // Padding - ignore
+  uint32_t     MmHubPadding[8]; // SMU internal use  
+} SmuMetricsExternal_t;
+
+typedef struct {
+  uint16_t MinClock; // This is either DCEFCLK or SOCCLK (in MHz)
+  uint16_t MaxClock; // This is either DCEFCLK or SOCCLK (in MHz)
+  uint16_t MinUclk;
+  uint16_t MaxUclk;
+  
+  uint8_t  WmSetting;
+  uint8_t  Flags;
+  uint8_t  Padding[2];
+
+} WatermarkRowGeneric_t;
+
+#define NUM_WM_RANGES 4
+
+typedef enum {
+  WM_SOCCLK = 0,
+  WM_DCEFCLK,
+  WM_COUNT,
+} WM_CLOCK_e;
+
+typedef enum {
+  WATERMARKS_CLOCK_RANGE = 0,
+  WATERMARKS_DUMMY_PSTATE,
+  WATERMARKS_MALL,
+  WATERMARKS_COUNT,
+} WATERMARKS_FLAGS_e;
+
+typedef struct {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+} Watermarks_t;
+
+typedef struct {
+  Watermarks_t Watermarks;
+
+  uint32_t     MmHubPadding[8]; // SMU internal use
+} WatermarksExternal_t;
+
+typedef struct {
+  uint16_t avgPsmCount[67];
+  uint16_t minPsmCount[67];
+  float    avgPsmVoltage[67]; 
+  float    minPsmVoltage[67];
+} AvfsDebugTable_t;
+
+typedef struct {
+  AvfsDebugTable_t AvfsDebugTable;
+
+  uint32_t     MmHubPadding[8]; // SMU internal use
+} AvfsDebugTableExternal_t;
+
+typedef struct {
+  uint8_t  AvfsVersion;
+  uint8_t  Padding;
+
+  uint8_t  AvfsEn[AVFS_VOLTAGE_COUNT];
+  
+  uint8_t  OverrideVFT[AVFS_VOLTAGE_COUNT];
+  uint8_t  OverrideAvfsGb[AVFS_VOLTAGE_COUNT];
+
+  uint8_t  OverrideTemperatures[AVFS_VOLTAGE_COUNT];
+  uint8_t  OverrideVInversion[AVFS_VOLTAGE_COUNT];
+  uint8_t  OverrideP2V[AVFS_VOLTAGE_COUNT];
+  uint8_t  OverrideP2VCharzFreq[AVFS_VOLTAGE_COUNT];
+
+  int32_t VFT0_m1[AVFS_VOLTAGE_COUNT]; // Q8.24
+  int32_t VFT0_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t VFT0_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  int32_t VFT1_m1[AVFS_VOLTAGE_COUNT]; // Q8.16
+  int32_t VFT1_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t VFT1_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  int32_t VFT2_m1[AVFS_VOLTAGE_COUNT]; // Q8.16
+  int32_t VFT2_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t VFT2_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  int32_t AvfsGb0_m1[AVFS_VOLTAGE_COUNT]; // Q8.24
+  int32_t AvfsGb0_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t AvfsGb0_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  int32_t AcBtcGb_m1[AVFS_VOLTAGE_COUNT]; // Q8.24
+  int32_t AcBtcGb_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t AcBtcGb_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  uint32_t AvfsTempCold[AVFS_VOLTAGE_COUNT];
+  uint32_t AvfsTempMid[AVFS_VOLTAGE_COUNT];
+  uint32_t AvfsTempHot[AVFS_VOLTAGE_COUNT];
+
+  uint32_t VInversion[AVFS_VOLTAGE_COUNT]; // in mV with 2 fractional bits
+
+
+  int32_t P2V_m1[AVFS_VOLTAGE_COUNT]; // Q8.24
+  int32_t P2V_m2[AVFS_VOLTAGE_COUNT]; // Q12.12
+  int32_t P2V_b[AVFS_VOLTAGE_COUNT];  // Q32
+
+  uint32_t P2VCharzFreq[AVFS_VOLTAGE_COUNT]; // in 10KHz units
+
+  uint32_t EnabledAvfsModules[3]; //Sienna_Cichlid - 67 AVFS modules
+} AvfsFuseOverride_t;
+
+typedef struct {
+  AvfsFuseOverride_t AvfsFuseOverride;
+
+  uint32_t     MmHubPadding[8]; // SMU internal use
+} AvfsFuseOverrideExternal_t;
+
+typedef struct {
+  uint8_t   Gfx_ActiveHystLimit;
+  uint8_t   Gfx_IdleHystLimit;
+  uint8_t   Gfx_FPS;
+  uint8_t   Gfx_MinActiveFreqType;
+  uint8_t   Gfx_BoosterFreqType; 
+  uint8_t   Gfx_MinFreqStep;                // Minimum delta between current and target frequeny in order for FW to change clock.
+  uint16_t  Gfx_MinActiveFreq;              // MHz
+  uint16_t  Gfx_BoosterFreq;                // MHz
+  uint16_t  Gfx_PD_Data_time_constant;      // Time constant of PD controller in ms
+  uint32_t  Gfx_PD_Data_limit_a;            // Q16
+  uint32_t  Gfx_PD_Data_limit_b;            // Q16
+  uint32_t  Gfx_PD_Data_limit_c;            // Q16
+  uint32_t  Gfx_PD_Data_error_coeff;        // Q16
+  uint32_t  Gfx_PD_Data_error_rate_coeff;   // Q16
+  
+  uint8_t   Fclk_ActiveHystLimit;
+  uint8_t   Fclk_IdleHystLimit;
+  uint8_t   Fclk_FPS;
+  uint8_t   Fclk_MinActiveFreqType;
+  uint8_t   Fclk_BoosterFreqType; 
+  uint8_t   Fclk_MinFreqStep;                // Minimum delta between current and target frequeny in order for FW to change clock.
+  uint16_t  Fclk_MinActiveFreq;              // MHz
+  uint16_t  Fclk_BoosterFreq;                // MHz
+  uint16_t  Fclk_PD_Data_time_constant;      // Time constant of PD controller in ms
+  uint32_t  Fclk_PD_Data_limit_a;            // Q16
+  uint32_t  Fclk_PD_Data_limit_b;            // Q16
+  uint32_t  Fclk_PD_Data_limit_c;            // Q16
+  uint32_t  Fclk_PD_Data_error_coeff;        // Q16
+  uint32_t  Fclk_PD_Data_error_rate_coeff;   // Q16
+  
+  uint8_t   Mem_ActiveHystLimit;
+  uint8_t   Mem_IdleHystLimit;
+  uint8_t   Mem_FPS;
+  uint8_t   Mem_MinActiveFreqType;
+  uint8_t   Mem_BoosterFreqType;
+  uint8_t   Mem_MinFreqStep;                // Minimum delta between current and target frequeny in order for FW to change clock.
+  uint16_t  Mem_MinActiveFreq;              // MHz
+  uint16_t  Mem_BoosterFreq;                // MHz
+  uint16_t  Mem_PD_Data_time_constant;      // Time constant of PD controller in ms
+  uint32_t  Mem_PD_Data_limit_a;            // Q16
+  uint32_t  Mem_PD_Data_limit_b;            // Q16
+  uint32_t  Mem_PD_Data_limit_c;            // Q16
+  uint32_t  Mem_PD_Data_error_coeff;        // Q16
+  uint32_t  Mem_PD_Data_error_rate_coeff;   // Q16
+
+  uint32_t  Mem_UpThreshold_Limit;          // Q16
+  uint8_t   Mem_UpHystLimit;
+  uint8_t   Mem_DownHystLimit;
+  uint16_t  Mem_Fps;
+
+} DpmActivityMonitorCoeffInt_t;
+
+
+typedef struct {
+  DpmActivityMonitorCoeffInt_t DpmActivityMonitorCoeffInt;
+  uint32_t     MmHubPadding[8]; // SMU internal use  
+} DpmActivityMonitorCoeffIntExternal_t;
+
+// Workload bits
+#define WORKLOAD_PPLIB_DEFAULT_BIT        0 
+#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 1 
+#define WORKLOAD_PPLIB_POWER_SAVING_BIT   2 
+#define WORKLOAD_PPLIB_VIDEO_BIT          3 
+#define WORKLOAD_PPLIB_VR_BIT             4 
+#define WORKLOAD_PPLIB_COMPUTE_BIT        5 
+#define WORKLOAD_PPLIB_CUSTOM_BIT         6 
+#define WORKLOAD_PPLIB_COUNT              7 
+
+
+// These defines are used with the following messages:
+// SMC_MSG_TransferTableDram2Smu
+// SMC_MSG_TransferTableSmu2Dram
+
+// Table transfer status
+#define TABLE_TRANSFER_OK         0x0
+#define TABLE_TRANSFER_FAILED     0xFF
+
+// Table types
+#define TABLE_PPTABLE                 0
+#define TABLE_WATERMARKS              1
+#define TABLE_AVFS_PSM_DEBUG          2
+#define TABLE_AVFS_FUSE_OVERRIDE      3
+#define TABLE_PMSTATUSLOG             4
+#define TABLE_SMU_METRICS             5
+#define TABLE_DRIVER_SMU_CONFIG       6
+#define TABLE_ACTIVITY_MONITOR_COEFF  7
+#define TABLE_OVERDRIVE               8
+#define TABLE_I2C_COMMANDS            9
+#define TABLE_PACE                   10
+#define TABLE_COUNT                  11
+
+typedef struct {
+  float FlopsPerByteTable[RLC_PACE_TABLE_NUM_LEVELS];
+} RlcPaceFlopsPerByteOverride_t;
+
+typedef struct {
+  RlcPaceFlopsPerByteOverride_t RlcPaceFlopsPerByteOverride;
+  
+  uint32_t     MmHubPadding[8]; // SMU internal use  
+} RlcPaceFlopsPerByteOverrideExternal_t;
+
+// These defines are used with the SMC_MSG_SetUclkFastSwitch message.
+#define UCLK_SWITCH_SLOW 0
+#define UCLK_SWITCH_FAST 1
+#endif
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
index ee7dac4693d4..1ef791f36888 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
@@ -185,6 +185,8 @@ enum smu_clk_type {
 	SMU_GFXCLK,
 	SMU_VCLK,
 	SMU_DCLK,
+	SMU_VCLK1,
+	SMU_DCLK1,
 	SMU_ECLK,
 	SMU_SOCCLK,
 	SMU_UCLK,
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
index 71f829ab306e..4682a2fd4381 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -30,6 +30,7 @@
 #define SMU11_DRIVER_IF_VERSION_NV10 0x36
 #define SMU11_DRIVER_IF_VERSION_NV12 0x33
 #define SMU11_DRIVER_IF_VERSION_NV14 0x36
+#define SMU11_DRIVER_IF_VERSION_Sienna_Cichlid 0x30
 
 /* MP Apertures */
 #define MP0_Public			0x03800000
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h
new file mode 100644
index 000000000000..35dd6072cc45
--- /dev/null
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h
@@ -0,0 +1,139 @@
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
+
+#ifndef SMU_V11_0_7_PPSMC_H
+#define SMU_V11_0_7_PPSMC_H
+
+#define PPSMC_VERSION 0x1
+
+// SMU Response Codes:
+#define PPSMC_Result_OK                    0x1
+#define PPSMC_Result_Failed                0xFF
+#define PPSMC_Result_UnknownCmd            0xFE
+#define PPSMC_Result_CmdRejectedPrereq     0xFD
+#define PPSMC_Result_CmdRejectedBusy       0xFC
+
+// Message Definitions:
+// BASIC
+#define PPSMC_MSG_TestMessage                    0x1
+#define PPSMC_MSG_GetSmuVersion                  0x2
+#define PPSMC_MSG_GetDriverIfVersion             0x3
+#define PPSMC_MSG_SetAllowedFeaturesMaskLow      0x4
+#define PPSMC_MSG_SetAllowedFeaturesMaskHigh     0x5
+#define PPSMC_MSG_EnableAllSmuFeatures           0x6
+#define PPSMC_MSG_DisableAllSmuFeatures          0x7
+#define PPSMC_MSG_EnableSmuFeaturesLow           0x8
+#define PPSMC_MSG_EnableSmuFeaturesHigh          0x9
+#define PPSMC_MSG_DisableSmuFeaturesLow          0xA
+#define PPSMC_MSG_DisableSmuFeaturesHigh         0xB
+#define PPSMC_MSG_GetRunningSmuFeaturesLow       0xC
+#define PPSMC_MSG_GetRunningSmuFeaturesHigh      0xD
+#define PPSMC_MSG_SetDriverDramAddrHigh          0xE
+#define PPSMC_MSG_SetDriverDramAddrLow           0xF
+#define PPSMC_MSG_SetToolsDramAddrHigh           0x10
+#define PPSMC_MSG_SetToolsDramAddrLow            0x11
+#define PPSMC_MSG_TransferTableSmu2Dram          0x12
+#define PPSMC_MSG_TransferTableDram2Smu          0x13
+#define PPSMC_MSG_UseDefaultPPTable              0x14
+
+//BACO/BAMACO/BOMACO
+#define PPSMC_MSG_EnterBaco                      0x15
+#define PPSMC_MSG_ExitBaco                       0x16
+#define PPSMC_MSG_ArmD3                          0x17
+#define PPSMC_MSG_BacoAudioD3PME                 0x18
+
+//DPM
+#define PPSMC_MSG_SetSoftMinByFreq               0x19
+#define PPSMC_MSG_SetSoftMaxByFreq               0x1A
+#define PPSMC_MSG_SetHardMinByFreq               0x1B
+#define PPSMC_MSG_SetHardMaxByFreq               0x1C
+#define PPSMC_MSG_GetMinDpmFreq                  0x1D
+#define PPSMC_MSG_GetMaxDpmFreq                  0x1E
+#define PPSMC_MSG_GetDpmFreqByIndex              0x1F
+#define PPSMC_MSG_OverridePcieParameters         0x20
+
+//DramLog Set DramAddrHigh
+#define PPSMC_MSG_DramLogSetDramAddrHigh         0x21
+
+#define PPSMC_MSG_SetWorkloadMask                0x22
+#define PPSMC_MSG_SetUclkFastSwitch              0x23
+#define PPSMC_MSG_GetVoltageByDpm                0x24
+#define PPSMC_MSG_SetVideoFps                    0x25
+#define PPSMC_MSG_GetDcModeMaxDpmFreq            0x26
+
+//DramLog Set DramAddrLow
+#define PPSMC_MSG_DramLogSetDramAddrLow          0x27
+
+//Power Gating
+#define PPSMC_MSG_AllowGfxOff                    0x28
+#define PPSMC_MSG_DisallowGfxOff                 0x29
+#define PPSMC_MSG_PowerUpVcn                     0x2A
+#define PPSMC_MSG_PowerDownVcn	                 0x2B
+#define PPSMC_MSG_PowerUpJpeg                    0x2C
+#define PPSMC_MSG_PowerDownJpeg	                 0x2D
+
+//Resets
+#define PPSMC_MSG_PrepareMp1ForUnload            0x2E
+
+//DramLog Set DramLog SetDramSize 
+#define PPSMC_MSG_DramLogSetDramSize             0x2F
+
+#define PPSMC_MSG_Mode1Reset                     0x30
+
+//Set SystemVirtual DramAddrHigh
+#define PPSMC_MSG_SetSystemVirtualDramAddrHigh   0x31
+
+//ACDC Power Source
+#define PPSMC_MSG_SetPptLimit                    0x32
+#define PPSMC_MSG_GetPptLimit                    0x33
+#define PPSMC_MSG_ReenableAcDcInterrupt          0x34
+#define PPSMC_MSG_NotifyPowerSource              0x35
+
+//BTC
+#define PPSMC_MSG_RunDcBtc                       0x36
+
+//Set SystemVirtual DramAddrLow
+#define PPSMC_MSG_SetSystemVirtualDramAddrLow    0x38
+
+//Others
+#define PPSMC_MSG_SetMemoryChannelEnable         0x39
+#define PPSMC_MSG_SetDramBitWidth                0x3A
+#define PPSMC_MSG_SetGeminiMode                  0x3B
+#define PPSMC_MSG_SetGeminiApertureHigh          0x3C
+#define PPSMC_MSG_SetGeminiApertureLow           0x3D
+
+#define PPSMC_MSG_SetTemperatureInputSelect      0x3E
+#define PPSMC_MSG_SetFwDstatesMask               0x3F
+#define PPSMC_MSG_SetThrottlerMask               0x40
+
+#define PPSMC_MSG_SetExternalClientDfCstateAllow 0x41
+#define PPSMC_MSG_EnableOutOfBandMonTesting      0x42
+#define PPSMC_MSG_SetMGpuFanBoostLimitRpm        0x43
+
+#define PPSMC_MSG_SetNumBadHbmPagesRetired       0x44
+#define PPSMC_MSG_SetGpoFeaturePMask             0x45
+#define PPSMC_MSG_SetSMBUSInterrupt              0x46
+
+#define PPSMC_Message_Count                      0x47
+
+#endif
diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
new file mode 100644
index 000000000000..e034dcd25c70
--- /dev/null
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -0,0 +1,2080 @@
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
+#include "pp_debug.h"
+#include <linux/firmware.h>
+#include <linux/pci.h>
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "smu_internal.h"
+#include "atomfirmware.h"
+#include "amdgpu_atomfirmware.h"
+#include "smu_v11_0.h"
+#include "smu11_driver_if_sienna_cichlid.h"
+#include "soc15_common.h"
+#include "atom.h"
+#include "sienna_cichlid_ppt.h"
+#include "smu_v11_0_pptable.h"
+#include "smu_v11_0_7_ppsmc.h"
+
+#include "asic_reg/mp/mp_11_0_sh_mask.h"
+
+#define FEATURE_MASK(feature) (1ULL << feature)
+#define SMC_DPM_FEATURE ( \
+	FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT) | \
+	FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT))
+
+#define MSG_MAP(msg, index) \
+	[SMU_MSG_##msg] = {1, (index)}
+
+static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_message_map[SMU_MSG_MAX_COUNT] = {
+	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage),
+	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion),
+	MSG_MAP(GetDriverIfVersion,		PPSMC_MSG_GetDriverIfVersion),
+	MSG_MAP(SetAllowedFeaturesMaskLow,	PPSMC_MSG_SetAllowedFeaturesMaskLow),
+	MSG_MAP(SetAllowedFeaturesMaskHigh,	PPSMC_MSG_SetAllowedFeaturesMaskHigh),
+	MSG_MAP(EnableAllSmuFeatures,		PPSMC_MSG_EnableAllSmuFeatures),
+	MSG_MAP(DisableAllSmuFeatures,		PPSMC_MSG_DisableAllSmuFeatures),
+	MSG_MAP(EnableSmuFeaturesLow,		PPSMC_MSG_EnableSmuFeaturesLow),
+	MSG_MAP(EnableSmuFeaturesHigh,		PPSMC_MSG_EnableSmuFeaturesHigh),
+	MSG_MAP(DisableSmuFeaturesLow,		PPSMC_MSG_DisableSmuFeaturesLow),
+	MSG_MAP(DisableSmuFeaturesHigh,		PPSMC_MSG_DisableSmuFeaturesHigh),
+	MSG_MAP(GetEnabledSmuFeaturesLow,       PPSMC_MSG_GetRunningSmuFeaturesLow),
+	MSG_MAP(GetEnabledSmuFeaturesHigh,	PPSMC_MSG_GetRunningSmuFeaturesHigh),
+	MSG_MAP(SetWorkloadMask,		PPSMC_MSG_SetWorkloadMask),
+	MSG_MAP(SetPptLimit,			PPSMC_MSG_SetPptLimit),
+	MSG_MAP(SetDriverDramAddrHigh,		PPSMC_MSG_SetDriverDramAddrHigh),
+	MSG_MAP(SetDriverDramAddrLow,		PPSMC_MSG_SetDriverDramAddrLow),
+	MSG_MAP(SetToolsDramAddrHigh,		PPSMC_MSG_SetToolsDramAddrHigh),
+	MSG_MAP(SetToolsDramAddrLow,		PPSMC_MSG_SetToolsDramAddrLow),
+	MSG_MAP(TransferTableSmu2Dram,		PPSMC_MSG_TransferTableSmu2Dram),
+	MSG_MAP(TransferTableDram2Smu,		PPSMC_MSG_TransferTableDram2Smu),
+	MSG_MAP(UseDefaultPPTable,		PPSMC_MSG_UseDefaultPPTable),
+	MSG_MAP(EnterBaco,			PPSMC_MSG_EnterBaco),
+	MSG_MAP(SetSoftMinByFreq,		PPSMC_MSG_SetSoftMinByFreq),
+	MSG_MAP(SetSoftMaxByFreq,		PPSMC_MSG_SetSoftMaxByFreq),
+	MSG_MAP(SetHardMinByFreq,		PPSMC_MSG_SetHardMinByFreq),
+	MSG_MAP(SetHardMaxByFreq,		PPSMC_MSG_SetHardMaxByFreq),
+	MSG_MAP(GetMinDpmFreq,			PPSMC_MSG_GetMinDpmFreq),
+	MSG_MAP(GetMaxDpmFreq,			PPSMC_MSG_GetMaxDpmFreq),
+	MSG_MAP(GetDpmFreqByIndex,		PPSMC_MSG_GetDpmFreqByIndex),
+	MSG_MAP(SetGeminiMode,			PPSMC_MSG_SetGeminiMode),
+	MSG_MAP(SetGeminiApertureHigh,		PPSMC_MSG_SetGeminiApertureHigh),
+	MSG_MAP(SetGeminiApertureLow,		PPSMC_MSG_SetGeminiApertureLow),
+	MSG_MAP(OverridePcieParameters,		PPSMC_MSG_OverridePcieParameters),
+	MSG_MAP(ReenableAcDcInterrupt,		PPSMC_MSG_ReenableAcDcInterrupt),
+	MSG_MAP(NotifyPowerSource,		PPSMC_MSG_NotifyPowerSource),
+	MSG_MAP(SetUclkFastSwitch,		PPSMC_MSG_SetUclkFastSwitch),
+	MSG_MAP(SetVideoFps,			PPSMC_MSG_SetVideoFps),
+	MSG_MAP(PrepareMp1ForUnload,		PPSMC_MSG_PrepareMp1ForUnload),
+	MSG_MAP(AllowGfxOff,			PPSMC_MSG_AllowGfxOff),
+	MSG_MAP(DisallowGfxOff,			PPSMC_MSG_DisallowGfxOff),
+	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit),
+	MSG_MAP(GetDcModeMaxDpmFreq,		PPSMC_MSG_GetDcModeMaxDpmFreq),
+	MSG_MAP(ExitBaco,			PPSMC_MSG_ExitBaco),
+	MSG_MAP(PowerUpVcn,			PPSMC_MSG_PowerUpVcn),
+	MSG_MAP(PowerDownVcn,			PPSMC_MSG_PowerDownVcn),
+	MSG_MAP(PowerUpJpeg,			PPSMC_MSG_PowerUpJpeg),
+	MSG_MAP(PowerDownJpeg,			PPSMC_MSG_PowerDownJpeg),
+	MSG_MAP(BacoAudioD3PME,			PPSMC_MSG_BacoAudioD3PME),
+};
+
+static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_clk_map[SMU_CLK_COUNT] = {
+	CLK_MAP(GFXCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SOCCLK,		PPCLK_SOCCLK),
+	CLK_MAP(FCLK,		PPCLK_FCLK),
+	CLK_MAP(UCLK,		PPCLK_UCLK),
+	CLK_MAP(MCLK,		PPCLK_UCLK),
+	CLK_MAP(DCLK,		PPCLK_DCLK_0),
+	CLK_MAP(DCLK1,		PPCLK_DCLK_0),
+	CLK_MAP(VCLK,		PPCLK_VCLK_1),
+	CLK_MAP(VCLK1,		PPCLK_VCLK_1),
+	CLK_MAP(DCEFCLK,	PPCLK_DCEFCLK),
+	CLK_MAP(DISPCLK,	PPCLK_DISPCLK),
+	CLK_MAP(PIXCLK,		PPCLK_PIXCLK),
+	CLK_MAP(PHYCLK,		PPCLK_PHYCLK),
+};
+
+static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_feature_mask_map[SMU_FEATURE_COUNT] = {
+	FEA_MAP(DPM_PREFETCHER),
+	FEA_MAP(DPM_GFXCLK),
+	FEA_MAP(DPM_UCLK),
+	FEA_MAP(DPM_SOCCLK),
+	FEA_MAP(DPM_MP0CLK),
+	FEA_MAP(DPM_LINK),
+	FEA_MAP(DPM_DCEFCLK),
+	FEA_MAP(MEM_VDDCI_SCALING),
+	FEA_MAP(MEM_MVDD_SCALING),
+	FEA_MAP(DS_GFXCLK),
+	FEA_MAP(DS_SOCCLK),
+	FEA_MAP(DS_LCLK),
+	FEA_MAP(DS_DCEFCLK),
+	FEA_MAP(DS_UCLK),
+	FEA_MAP(GFX_ULV),
+	FEA_MAP(FW_DSTATE),
+	FEA_MAP(GFXOFF),
+	FEA_MAP(BACO),
+	FEA_MAP(RSMU_SMN_CG),
+	FEA_MAP(PPT),
+	FEA_MAP(TDC),
+	FEA_MAP(APCC_PLUS),
+	FEA_MAP(GTHR),
+	FEA_MAP(ACDC),
+	FEA_MAP(VR0HOT),
+	FEA_MAP(VR1HOT),
+	FEA_MAP(FW_CTF),
+	FEA_MAP(FAN_CONTROL),
+	FEA_MAP(THERMAL),
+	FEA_MAP(GFX_DCS),
+	FEA_MAP(RM),
+	FEA_MAP(LED_DISPLAY),
+	FEA_MAP(GFX_SS),
+	FEA_MAP(OUT_OF_BAND_MONITOR),
+	FEA_MAP(TEMP_DEPENDENT_VMIN),
+	FEA_MAP(MMHUB_PG),
+	FEA_MAP(ATHUB_PG),
+};
+
+static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_table_map[SMU_TABLE_COUNT] = {
+	TAB_MAP(PPTABLE),
+	TAB_MAP(WATERMARKS),
+	TAB_MAP(AVFS_PSM_DEBUG),
+	TAB_MAP(AVFS_FUSE_OVERRIDE),
+	TAB_MAP(PMSTATUSLOG),
+	TAB_MAP(SMU_METRICS),
+	TAB_MAP(DRIVER_SMU_CONFIG),
+	TAB_MAP(ACTIVITY_MONITOR_COEFF),
+	TAB_MAP(OVERDRIVE),
+	TAB_MAP(I2C_COMMANDS),
+	TAB_MAP(PACE),
+};
+
+static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_workload_map[PP_SMC_POWER_PROFILE_COUNT] = {
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT,	WORKLOAD_PPLIB_DEFAULT_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_FULLSCREEN3D,		WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_POWERSAVING,		WORKLOAD_PPLIB_POWER_SAVING_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VIDEO,		WORKLOAD_PPLIB_VIDEO_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VR,			WORKLOAD_PPLIB_VR_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,		WORKLOAD_PPLIB_CUSTOM_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,		WORKLOAD_PPLIB_CUSTOM_BIT),
+};
+
+static int sienna_cichlid_get_smu_msg_index(struct smu_context *smc, uint32_t index)
+{
+	struct smu_11_0_cmn2aisc_mapping mapping;
+
+	if (index >= SMU_MSG_MAX_COUNT)
+		return -EINVAL;
+
+	mapping = sienna_cichlid_message_map[index];
+	if (!(mapping.valid_mapping)) {
+		return -EINVAL;
+	}
+
+	return mapping.map_to;
+}
+
+static int sienna_cichlid_get_smu_clk_index(struct smu_context *smc, uint32_t index)
+{
+	struct smu_11_0_cmn2aisc_mapping mapping;
+
+	if (index >= SMU_CLK_COUNT)
+		return -EINVAL;
+
+	mapping = sienna_cichlid_clk_map[index];
+	if (!(mapping.valid_mapping)) {
+		return -EINVAL;
+	}
+
+	return mapping.map_to;
+}
+
+static int sienna_cichlid_get_smu_feature_index(struct smu_context *smc, uint32_t index)
+{
+	struct smu_11_0_cmn2aisc_mapping mapping;
+
+	if (index >= SMU_FEATURE_COUNT)
+		return -EINVAL;
+
+	mapping = sienna_cichlid_feature_mask_map[index];
+	if (!(mapping.valid_mapping)) {
+		return -EINVAL;
+	}
+
+	return mapping.map_to;
+}
+
+static int sienna_cichlid_get_smu_table_index(struct smu_context *smc, uint32_t index)
+{
+	struct smu_11_0_cmn2aisc_mapping mapping;
+
+	if (index >= SMU_TABLE_COUNT)
+		return -EINVAL;
+
+	mapping = sienna_cichlid_table_map[index];
+	if (!(mapping.valid_mapping)) {
+		return -EINVAL;
+	}
+
+	return mapping.map_to;
+}
+
+static int sienna_cichlid_get_workload_type(struct smu_context *smu, enum PP_SMC_POWER_PROFILE profile)
+{
+	struct smu_11_0_cmn2aisc_mapping mapping;
+
+	if (profile > PP_SMC_POWER_PROFILE_CUSTOM)
+		return -EINVAL;
+
+	mapping = sienna_cichlid_workload_map[profile];
+	if (!(mapping.valid_mapping)) {
+		return -EINVAL;
+	}
+
+	return mapping.map_to;
+}
+
+static int
+sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
+				  uint32_t *feature_mask, uint32_t num)
+{
+	if (num > 2)
+		return -EINVAL;
+
+	memset(feature_mask, 0, sizeof(uint32_t) * num);
+
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT)
+				| FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
+
+	return 0;
+}
+
+static int sienna_cichlid_check_powerplay_table(struct smu_context *smu)
+{
+	return 0;
+}
+
+static int sienna_cichlid_append_powerplay_table(struct smu_context *smu)
+{
+	return 0;
+}
+
+static int sienna_cichlid_store_powerplay_table(struct smu_context *smu)
+{
+	struct smu_11_0_powerplay_table *powerplay_table = NULL;
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_baco_context *smu_baco = &smu->smu_baco;
+
+	if (!table_context->power_play_table)
+		return -EINVAL;
+
+	powerplay_table = table_context->power_play_table;
+
+	memcpy(table_context->driver_pptable, &powerplay_table->smc_pptable,
+	       sizeof(PPTable_t));
+
+	table_context->thermal_controller_type = powerplay_table->thermal_controller_type;
+
+	mutex_lock(&smu_baco->mutex);
+	if (powerplay_table->platform_caps & SMU_11_0_PP_PLATFORM_CAP_BACO ||
+	    powerplay_table->platform_caps & SMU_11_0_PP_PLATFORM_CAP_MACO)
+		smu_baco->platform_support = true;
+	mutex_unlock(&smu_baco->mutex);
+
+	return 0;
+}
+
+static int sienna_cichlid_tables_init(struct smu_context *smu, struct smu_table *tables)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_PPTABLE, sizeof(PPTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WATERMARKS, sizeof(Watermarks_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_OVERDRIVE, sizeof(OverDriveTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_PMSTATUSLOG, SMU11_TOOL_SIZE,
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_ACTIVITY_MONITOR_COEFF,
+		       sizeof(DpmActivityMonitorCoeffInt_t), PAGE_SIZE,
+	               AMDGPU_GEM_DOMAIN_VRAM);
+
+	smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);
+	if (!smu_table->metrics_table)
+		return -ENOMEM;
+	smu_table->metrics_time = 0;
+
+	return 0;
+}
+
+static int sienna_cichlid_get_metrics_table(struct smu_context *smu,
+				    SmuMetrics_t *metrics_table)
+{
+	struct smu_table_context *smu_table= &smu->smu_table;
+	int ret = 0;
+
+	mutex_lock(&smu->metrics_lock);
+	if (!smu_table->metrics_time || time_after(jiffies, smu_table->metrics_time + msecs_to_jiffies(100))) {
+		ret = smu_update_table(smu, SMU_TABLE_SMU_METRICS, 0,
+				(void *)smu_table->metrics_table, false);
+		if (ret) {
+			pr_info("Failed to export SMU metrics table!\n");
+			mutex_unlock(&smu->metrics_lock);
+			return ret;
+		}
+		smu_table->metrics_time = jiffies;
+	}
+
+	memcpy(metrics_table, smu_table->metrics_table, sizeof(SmuMetrics_t));
+	mutex_unlock(&smu->metrics_lock);
+
+	return ret;
+}
+
+static int sienna_cichlid_allocate_dpm_context(struct smu_context *smu)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+
+	if (smu_dpm->dpm_context)
+		return -EINVAL;
+
+	smu_dpm->dpm_context = kzalloc(sizeof(struct smu_11_0_dpm_context),
+				       GFP_KERNEL);
+	if (!smu_dpm->dpm_context)
+		return -ENOMEM;
+
+	smu_dpm->dpm_context_size = sizeof(struct smu_11_0_dpm_context);
+
+	return 0;
+}
+
+static int sienna_cichlid_set_default_dpm_table(struct smu_context *smu)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_11_0_dpm_context *dpm_context = smu_dpm->dpm_context;
+	PPTable_t *driver_ppt = NULL;
+
+        driver_ppt = table_context->driver_pptable;
+
+        dpm_context->dpm_tables.soc_table.min = driver_ppt->FreqTableSocclk[0];
+        dpm_context->dpm_tables.soc_table.max = driver_ppt->FreqTableSocclk[NUM_SOCCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.gfx_table.min = driver_ppt->FreqTableGfx[0];
+        dpm_context->dpm_tables.gfx_table.max = driver_ppt->FreqTableGfx[NUM_GFXCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.uclk_table.min = driver_ppt->FreqTableUclk[0];
+        dpm_context->dpm_tables.uclk_table.max = driver_ppt->FreqTableUclk[NUM_UCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.vclk_table.min = driver_ppt->FreqTableVclk[0];
+        dpm_context->dpm_tables.vclk_table.max = driver_ppt->FreqTableVclk[NUM_VCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.dclk_table.min = driver_ppt->FreqTableDclk[0];
+        dpm_context->dpm_tables.dclk_table.max = driver_ppt->FreqTableDclk[NUM_DCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.dcef_table.min = driver_ppt->FreqTableDcefclk[0];
+        dpm_context->dpm_tables.dcef_table.max = driver_ppt->FreqTableDcefclk[NUM_DCEFCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.pixel_table.min = driver_ppt->FreqTablePixclk[0];
+        dpm_context->dpm_tables.pixel_table.max = driver_ppt->FreqTablePixclk[NUM_PIXCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.display_table.min = driver_ppt->FreqTableDispclk[0];
+        dpm_context->dpm_tables.display_table.max = driver_ppt->FreqTableDispclk[NUM_DISPCLK_DPM_LEVELS - 1];
+
+        dpm_context->dpm_tables.phy_table.min = driver_ppt->FreqTablePhyclk[0];
+        dpm_context->dpm_tables.phy_table.max = driver_ppt->FreqTablePhyclk[NUM_PHYCLK_DPM_LEVELS - 1];
+
+	return 0;
+}
+
+static int sienna_cichlid_dpm_set_uvd_enable(struct smu_context *smu, bool enable)
+{
+	struct smu_power_context *smu_power = &smu->smu_power;
+	struct smu_power_gate *power_gate = &smu_power->power_gate;
+	int ret = 0;
+
+	if (enable) {
+		/* vcn dpm on is a prerequisite for vcn power gate messages */
+		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 1, NULL);
+			if (ret)
+				return ret;
+		}
+		power_gate->vcn_gated = false;
+	} else {
+		if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
+			ret = smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn, NULL);
+			if (ret)
+				return ret;
+		}
+		power_gate->vcn_gated = true;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_get_current_clk_freq_by_table(struct smu_context *smu,
+				       enum smu_clk_type clk_type,
+				       uint32_t *value)
+{
+	int ret = 0, clk_id = 0;
+	SmuMetrics_t metrics;
+
+	ret = sienna_cichlid_get_metrics_table(smu, &metrics);
+	if (ret)
+		return ret;
+
+	clk_id = smu_clk_get_index(smu, clk_type);
+	if (clk_id < 0)
+		return clk_id;
+
+	*value = metrics.CurrClock[clk_id];
+
+	return ret;
+}
+
+static bool sienna_cichlid_is_support_fine_grained_dpm(struct smu_context *smu, enum smu_clk_type clk_type)
+{
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+	DpmDescriptor_t *dpm_desc = NULL;
+	uint32_t clk_index = 0;
+
+	clk_index = smu_clk_get_index(smu, clk_type);
+	dpm_desc = &pptable->DpmDescriptor[clk_index];
+
+	/* 0 - Fine grained DPM, 1 - Discrete DPM */
+	return dpm_desc->SnapToDiscrete == 0 ? true : false;
+}
+
+static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
+			enum smu_clk_type clk_type, char *buf)
+{
+	int i, size = 0, ret = 0;
+	uint32_t cur_value = 0, value = 0, count = 0;
+	uint32_t freq_values[3] = {0};
+	uint32_t mark_index = 0;
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+	case SMU_SOCCLK:
+	case SMU_MCLK:
+	case SMU_UCLK:
+	case SMU_FCLK:
+	case SMU_DCEFCLK:
+		ret = smu_get_current_clk_freq(smu, clk_type, &cur_value);
+		if (ret)
+			return size;
+
+		/* 10KHz -> MHz */
+		cur_value = cur_value / 100;
+
+		ret = smu_get_dpm_level_count(smu, clk_type, &count);
+		if (ret)
+			return size;
+
+		if (!sienna_cichlid_is_support_fine_grained_dpm(smu, clk_type)) {
+			for (i = 0; i < count; i++) {
+				ret = smu_get_dpm_freq_by_index(smu, clk_type, i, &value);
+				if (ret)
+					return size;
+
+				size += sprintf(buf + size, "%d: %uMhz %s\n", i, value,
+						cur_value == value ? "*" : "");
+			}
+		} else {
+			ret = smu_get_dpm_freq_by_index(smu, clk_type, 0, &freq_values[0]);
+			if (ret)
+				return size;
+			ret = smu_get_dpm_freq_by_index(smu, clk_type, count - 1, &freq_values[2]);
+			if (ret)
+				return size;
+
+			freq_values[1] = cur_value;
+			mark_index = cur_value == freq_values[0] ? 0 :
+				     cur_value == freq_values[2] ? 2 : 1;
+			if (mark_index != 1)
+				freq_values[1] = (freq_values[0] + freq_values[2]) / 2;
+
+			for (i = 0; i < 3; i++) {
+				size += sprintf(buf + size, "%d: %uMhz %s\n", i, freq_values[i],
+						i == mark_index ? "*" : "");
+			}
+
+		}
+		break;
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
+				   enum smu_clk_type clk_type, uint32_t mask)
+{
+
+	int ret = 0, size = 0;
+	uint32_t soft_min_level = 0, soft_max_level = 0, min_freq = 0, max_freq = 0;
+
+	soft_min_level = mask ? (ffs(mask) - 1) : 0;
+	soft_max_level = mask ? (fls(mask) - 1) : 0;
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+	case SMU_SOCCLK:
+	case SMU_MCLK:
+	case SMU_UCLK:
+	case SMU_DCEFCLK:
+	case SMU_FCLK:
+		ret = smu_get_dpm_freq_by_index(smu, clk_type, soft_min_level, &min_freq);
+		if (ret)
+			return size;
+
+		ret = smu_get_dpm_freq_by_index(smu, clk_type, soft_max_level, &max_freq);
+		if (ret)
+			return size;
+
+		ret = smu_set_soft_freq_range(smu, clk_type, min_freq, max_freq, false);
+		if (ret)
+			return size;
+		break;
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
+{
+	int ret = 0;
+	uint32_t min_sclk_freq = 0, min_mclk_freq = 0;
+
+	ret = smu_get_dpm_freq_range(smu, SMU_SCLK, &min_sclk_freq, NULL, false);
+	if (ret)
+		return ret;
+
+	smu->pstate_sclk = min_sclk_freq * 100;
+
+	ret = smu_get_dpm_freq_range(smu, SMU_MCLK, &min_mclk_freq, NULL, false);
+	if (ret)
+		return ret;
+
+	smu->pstate_mclk = min_mclk_freq * 100;
+
+	return ret;
+}
+
+static int sienna_cichlid_get_clock_by_type_with_latency(struct smu_context *smu,
+						 enum smu_clk_type clk_type,
+						 struct pp_clock_levels_with_latency *clocks)
+{
+	int ret = 0, i = 0;
+	uint32_t level_count = 0, freq = 0;
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_DCEFCLK:
+	case SMU_SOCCLK:
+		ret = smu_get_dpm_level_count(smu, clk_type, &level_count);
+		if (ret)
+			return ret;
+
+		level_count = min(level_count, (uint32_t)MAX_NUM_CLOCKS);
+		clocks->num_levels = level_count;
+
+		for (i = 0; i < level_count; i++) {
+			ret = smu_get_dpm_freq_by_index(smu, clk_type, i, &freq);
+			if (ret)
+				return ret;
+
+			clocks->data[i].clocks_in_khz = freq * 1000;
+			clocks->data[i].latency_in_us = 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_pre_display_config_changed(struct smu_context *smu)
+{
+	int ret = 0;
+	uint32_t max_freq = 0;
+
+	/* Sienna_Cichlid do not support to change display num currently */
+	return 0;
+#if 0
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0, NULL);
+	if (ret)
+		return ret;
+#endif
+
+	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_get_dpm_freq_range(smu, SMU_UCLK, NULL, &max_freq, false);
+		if (ret)
+			return ret;
+		ret = smu_set_hard_freq_range(smu, SMU_UCLK, 0, max_freq);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_display_config_changed(struct smu_context *smu)
+{
+	int ret = 0;
+
+	if ((smu->watermarks_bitmap & WATERMARKS_EXIST) &&
+	    !(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
+		ret = smu_write_watermarks_table(smu);
+		if (ret)
+			return ret;
+
+		smu->watermarks_bitmap |= WATERMARKS_LOADED;
+	}
+
+	if ((smu->watermarks_bitmap & WATERMARKS_EXIST) &&
+	    smu_feature_is_supported(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) &&
+	    smu_feature_is_supported(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
+		/* Sienna_Cichlid do not support to change display num currently */
+		ret = 0;
+#if 0
+		ret = smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays,
+						  smu->display_config->num_display, NULL);
+#endif
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_force_dpm_limit_value(struct smu_context *smu, bool highest)
+{
+	int ret = 0, i = 0;
+	uint32_t min_freq, max_freq, force_freq;
+	enum smu_clk_type clk_type;
+
+	enum smu_clk_type clks[] = {
+		SMU_GFXCLK,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(clks); i++) {
+		clk_type = clks[i];
+		ret = smu_get_dpm_freq_range(smu, clk_type, &min_freq, &max_freq, false);
+		if (ret)
+			return ret;
+
+		force_freq = highest ? max_freq : min_freq;
+		ret = smu_set_soft_freq_range(smu, clk_type, force_freq, force_freq, false);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_unforce_dpm_levels(struct smu_context *smu)
+{
+	int ret = 0, i = 0;
+	uint32_t min_freq, max_freq;
+	enum smu_clk_type clk_type;
+
+	enum smu_clk_type clks[] = {
+		SMU_GFXCLK,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(clks); i++) {
+		clk_type = clks[i];
+		ret = smu_get_dpm_freq_range(smu, clk_type, &min_freq, &max_freq, false);
+		if (ret)
+			return ret;
+
+		ret = smu_set_soft_freq_range(smu, clk_type, min_freq, max_freq, false);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_get_gpu_power(struct smu_context *smu, uint32_t *value)
+{
+	int ret = 0;
+	SmuMetrics_t metrics;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = sienna_cichlid_get_metrics_table(smu, &metrics);
+	if (ret)
+		return ret;
+
+	*value = metrics.AverageSocketPower << 8;
+
+	return 0;
+}
+
+static int sienna_cichlid_get_current_activity_percent(struct smu_context *smu,
+					       enum amd_pp_sensors sensor,
+					       uint32_t *value)
+{
+	int ret = 0;
+	SmuMetrics_t metrics;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = sienna_cichlid_get_metrics_table(smu, &metrics);
+	if (ret)
+		return ret;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		*value = metrics.AverageGfxActivity;
+		break;
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+		*value = metrics.AverageUclkActivity;
+		break;
+	default:
+		pr_err("Invalid sensor for retrieving clock activity\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool sienna_cichlid_is_dpm_running(struct smu_context *smu)
+{
+	int ret = 0;
+	uint32_t feature_mask[2];
+	unsigned long feature_enabled;
+	ret = smu_feature_get_enabled_mask(smu, feature_mask, 2);
+	feature_enabled = (unsigned long)((uint64_t)feature_mask[0] |
+			   ((uint64_t)feature_mask[1] << 32));
+	return !!(feature_enabled & SMC_DPM_FEATURE);
+}
+
+static int sienna_cichlid_get_fan_speed_rpm(struct smu_context *smu,
+				    uint32_t *speed)
+{
+	SmuMetrics_t metrics;
+	int ret = 0;
+
+	if (!speed)
+		return -EINVAL;
+
+	ret = sienna_cichlid_get_metrics_table(smu, &metrics);
+	if (ret)
+		return ret;
+
+	*speed = metrics.CurrFanSpeed;
+
+	return ret;
+}
+
+static int sienna_cichlid_get_fan_speed_percent(struct smu_context *smu,
+					uint32_t *speed)
+{
+	int ret = 0;
+	uint32_t percent = 0;
+	uint32_t current_rpm;
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+
+	ret = sienna_cichlid_get_fan_speed_rpm(smu, &current_rpm);
+	if (ret)
+		return ret;
+
+	percent = current_rpm * 100 / pptable->FanMaximumRpm;
+	*speed = percent > 100 ? 100 : percent;
+
+	return ret;
+}
+
+static int sienna_cichlid_get_power_profile_mode(struct smu_context *smu, char *buf)
+{
+	DpmActivityMonitorCoeffInt_t activity_monitor;
+	uint32_t i, size = 0;
+	int16_t workload_type = 0;
+	static const char *profile_name[] = {
+					"BOOTUP_DEFAULT",
+					"3D_FULL_SCREEN",
+					"POWER_SAVING",
+					"VIDEO",
+					"VR",
+					"COMPUTE",
+					"CUSTOM"};
+	static const char *title[] = {
+			"PROFILE_INDEX(NAME)",
+			"CLOCK_TYPE(NAME)",
+			"FPS",
+			"MinFreqType",
+			"MinActiveFreqType",
+			"MinActiveFreq",
+			"BoosterFreqType",
+			"BoosterFreq",
+			"PD_Data_limit_c",
+			"PD_Data_error_coeff",
+			"PD_Data_error_rate_coeff"};
+	int result = 0;
+
+	if (!buf)
+		return -EINVAL;
+
+	size += sprintf(buf + size, "%16s %s %s %s %s %s %s %s %s %s %s\n",
+			title[0], title[1], title[2], title[3], title[4], title[5],
+			title[6], title[7], title[8], title[9], title[10]);
+
+	for (i = 0; i <= PP_SMC_POWER_PROFILE_CUSTOM; i++) {
+		/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
+		workload_type = smu_workload_get_type(smu, i);
+		if (workload_type < 0)
+			return -EINVAL;
+
+		result = smu_update_table(smu,
+					  SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
+					  (void *)(&activity_monitor), false);
+		if (result) {
+			pr_err("[%s] Failed to get activity monitor!", __func__);
+			return result;
+		}
+
+		size += sprintf(buf + size, "%2d %14s%s:\n",
+			i, profile_name[i], (i == smu->power_profile_mode) ? "*" : " ");
+
+		size += sprintf(buf + size, "%19s %d(%13s) %7d %7d %7d %7d %7d %7d %7d %7d %7d\n",
+			" ",
+			0,
+			"GFXCLK",
+			activity_monitor.Gfx_FPS,
+			activity_monitor.Gfx_MinFreqStep,
+			activity_monitor.Gfx_MinActiveFreqType,
+			activity_monitor.Gfx_MinActiveFreq,
+			activity_monitor.Gfx_BoosterFreqType,
+			activity_monitor.Gfx_BoosterFreq,
+			activity_monitor.Gfx_PD_Data_limit_c,
+			activity_monitor.Gfx_PD_Data_error_coeff,
+			activity_monitor.Gfx_PD_Data_error_rate_coeff);
+
+		size += sprintf(buf + size, "%19s %d(%13s) %7d %7d %7d %7d %7d %7d %7d %7d %7d\n",
+			" ",
+			1,
+			"SOCCLK",
+			activity_monitor.Fclk_FPS,
+			activity_monitor.Fclk_MinFreqStep,
+			activity_monitor.Fclk_MinActiveFreqType,
+			activity_monitor.Fclk_MinActiveFreq,
+			activity_monitor.Fclk_BoosterFreqType,
+			activity_monitor.Fclk_BoosterFreq,
+			activity_monitor.Fclk_PD_Data_limit_c,
+			activity_monitor.Fclk_PD_Data_error_coeff,
+			activity_monitor.Fclk_PD_Data_error_rate_coeff);
+
+		size += sprintf(buf + size, "%19s %d(%13s) %7d %7d %7d %7d %7d %7d %7d %7d %7d\n",
+			" ",
+			2,
+			"MEMLK",
+			activity_monitor.Mem_FPS,
+			activity_monitor.Mem_MinFreqStep,
+			activity_monitor.Mem_MinActiveFreqType,
+			activity_monitor.Mem_MinActiveFreq,
+			activity_monitor.Mem_BoosterFreqType,
+			activity_monitor.Mem_BoosterFreq,
+			activity_monitor.Mem_PD_Data_limit_c,
+			activity_monitor.Mem_PD_Data_error_coeff,
+			activity_monitor.Mem_PD_Data_error_rate_coeff);
+	}
+
+	return size;
+}
+
+static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
+{
+	DpmActivityMonitorCoeffInt_t activity_monitor;
+	int workload_type, ret = 0;
+
+	smu->power_profile_mode = input[size];
+
+	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
+		pr_err("Invalid power profile mode %d\n", smu->power_profile_mode);
+		return -EINVAL;
+	}
+
+	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size < 0)
+			return -EINVAL;
+
+		ret = smu_update_table(smu,
+				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
+				       (void *)(&activity_monitor), false);
+		if (ret) {
+			pr_err("[%s] Failed to get activity monitor!", __func__);
+			return ret;
+		}
+
+		switch (input[0]) {
+		case 0: /* Gfxclk */
+			activity_monitor.Gfx_FPS = input[1];
+			activity_monitor.Gfx_MinFreqStep = input[2];
+			activity_monitor.Gfx_MinActiveFreqType = input[3];
+			activity_monitor.Gfx_MinActiveFreq = input[4];
+			activity_monitor.Gfx_BoosterFreqType = input[5];
+			activity_monitor.Gfx_BoosterFreq = input[6];
+			activity_monitor.Gfx_PD_Data_limit_c = input[7];
+			activity_monitor.Gfx_PD_Data_error_coeff = input[8];
+			activity_monitor.Gfx_PD_Data_error_rate_coeff = input[9];
+			break;
+		case 1: /* Socclk */
+			activity_monitor.Fclk_FPS = input[1];
+			activity_monitor.Fclk_MinFreqStep = input[2];
+			activity_monitor.Fclk_MinActiveFreqType = input[3];
+			activity_monitor.Fclk_MinActiveFreq = input[4];
+			activity_monitor.Fclk_BoosterFreqType = input[5];
+			activity_monitor.Fclk_BoosterFreq = input[6];
+			activity_monitor.Fclk_PD_Data_limit_c = input[7];
+			activity_monitor.Fclk_PD_Data_error_coeff = input[8];
+			activity_monitor.Fclk_PD_Data_error_rate_coeff = input[9];
+			break;
+		case 2: /* Memlk */
+			activity_monitor.Mem_FPS = input[1];
+			activity_monitor.Mem_MinFreqStep = input[2];
+			activity_monitor.Mem_MinActiveFreqType = input[3];
+			activity_monitor.Mem_MinActiveFreq = input[4];
+			activity_monitor.Mem_BoosterFreqType = input[5];
+			activity_monitor.Mem_BoosterFreq = input[6];
+			activity_monitor.Mem_PD_Data_limit_c = input[7];
+			activity_monitor.Mem_PD_Data_error_coeff = input[8];
+			activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
+			break;
+		}
+
+		ret = smu_update_table(smu,
+				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
+				       (void *)(&activity_monitor), true);
+		if (ret) {
+			pr_err("[%s] Failed to set activity monitor!", __func__);
+			return ret;
+		}
+	}
+
+	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
+	workload_type = smu_workload_get_type(smu, smu->power_profile_mode);
+	if (workload_type < 0)
+		return -EINVAL;
+	smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
+				    1 << workload_type, NULL);
+
+	return ret;
+}
+
+static int sienna_cichlid_get_profiling_clk_mask(struct smu_context *smu,
+					 enum amd_dpm_forced_level level,
+					 uint32_t *sclk_mask,
+					 uint32_t *mclk_mask,
+					 uint32_t *soc_mask)
+{
+	int ret = 0;
+	uint32_t level_count = 0;
+
+	if (level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK) {
+		if (sclk_mask)
+			*sclk_mask = 0;
+	} else if (level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) {
+		if (mclk_mask)
+			*mclk_mask = 0;
+	} else if (level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) {
+		if(sclk_mask) {
+			ret = smu_get_dpm_level_count(smu, SMU_SCLK, &level_count);
+			if (ret)
+				return ret;
+			*sclk_mask = level_count - 1;
+		}
+
+		if(mclk_mask) {
+			ret = smu_get_dpm_level_count(smu, SMU_MCLK, &level_count);
+			if (ret)
+				return ret;
+			*mclk_mask = level_count - 1;
+		}
+
+		if(soc_mask) {
+			ret = smu_get_dpm_level_count(smu, SMU_SOCCLK, &level_count);
+			if (ret)
+				return ret;
+			*soc_mask = level_count - 1;
+		}
+	}
+
+	return ret;
+}
+
+static int sienna_cichlid_notify_smc_display_config(struct smu_context *smu)
+{
+	struct smu_clocks min_clocks = {0};
+	struct pp_display_clock_request clock_req;
+	int ret = 0;
+
+	min_clocks.dcef_clock = smu->display_config->min_dcef_set_clk;
+	min_clocks.dcef_clock_in_sr = smu->display_config->min_dcef_deep_sleep_set_clk;
+	min_clocks.memory_clock = smu->display_config->min_mem_set_clock;
+
+	if (smu_feature_is_supported(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
+		clock_req.clock_type = amd_pp_dcef_clock;
+		clock_req.clock_freq_in_khz = min_clocks.dcef_clock * 10;
+
+		ret = smu_v11_0_display_clock_voltage_request(smu, &clock_req);
+		if (!ret) {
+			if (smu_feature_is_supported(smu, SMU_FEATURE_DS_DCEFCLK_BIT)) {
+				pr_err("Attempt to set divider for DCEFCLK Failed as it not support currently!");
+				return ret;
+			}
+		} else {
+			pr_info("Attempt to set Hard Min for DCEFCLK Failed!");
+		}
+	}
+
+	if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_set_hard_freq_range(smu, SMU_UCLK, min_clocks.memory_clock/100, 0);
+		if (ret) {
+			pr_err("[%s] Set hard min uclk failed!", __func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int sienna_cichlid_set_watermarks_table(struct smu_context *smu,
+				       void *watermarks, struct
+				       dm_pp_wm_sets_with_clock_ranges_soc15
+				       *clock_ranges)
+{
+	int i;
+	Watermarks_t *table = watermarks;
+
+	if (!table || !clock_ranges)
+		return -EINVAL;
+
+	if (clock_ranges->num_wm_dmif_sets > 4 ||
+	    clock_ranges->num_wm_mcif_sets > 4)
+                return -EINVAL;
+
+        for (i = 0; i < clock_ranges->num_wm_dmif_sets; i++) {
+		table->WatermarkRow[1][i].MinClock =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_dmif_clocks_ranges[i].wm_min_dcfclk_clk_in_khz /
+			1000));
+		table->WatermarkRow[1][i].MaxClock =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_dmif_clocks_ranges[i].wm_max_dcfclk_clk_in_khz /
+			1000));
+		table->WatermarkRow[1][i].MinUclk =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_dmif_clocks_ranges[i].wm_min_mem_clk_in_khz /
+			1000));
+		table->WatermarkRow[1][i].MaxUclk =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_dmif_clocks_ranges[i].wm_max_mem_clk_in_khz /
+			1000));
+		table->WatermarkRow[1][i].WmSetting = (uint8_t)
+				clock_ranges->wm_dmif_clocks_ranges[i].wm_set_id;
+        }
+
+	for (i = 0; i < clock_ranges->num_wm_mcif_sets; i++) {
+		table->WatermarkRow[0][i].MinClock =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_mcif_clocks_ranges[i].wm_min_socclk_clk_in_khz /
+			1000));
+		table->WatermarkRow[0][i].MaxClock =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_mcif_clocks_ranges[i].wm_max_socclk_clk_in_khz /
+			1000));
+		table->WatermarkRow[0][i].MinUclk =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_mcif_clocks_ranges[i].wm_min_mem_clk_in_khz /
+			1000));
+		table->WatermarkRow[0][i].MaxUclk =
+			cpu_to_le16((uint16_t)
+			(clock_ranges->wm_mcif_clocks_ranges[i].wm_max_mem_clk_in_khz /
+			1000));
+		table->WatermarkRow[0][i].WmSetting = (uint8_t)
+				clock_ranges->wm_mcif_clocks_ranges[i].wm_set_id;
+        }
+
+	return 0;
+}
+
+static int sienna_cichlid_thermal_get_temperature(struct smu_context *smu,
+					     enum amd_pp_sensors sensor,
+					     uint32_t *value)
+{
+	SmuMetrics_t metrics;
+	int ret = 0;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = sienna_cichlid_get_metrics_table(smu, &metrics);
+	if (ret)
+		return ret;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+		*value = metrics.TemperatureHotspot *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+		*value = metrics.TemperatureEdge *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case AMDGPU_PP_SENSOR_MEM_TEMP:
+		*value = metrics.TemperatureMem *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	default:
+		pr_err("Invalid sensor for retrieving temp\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sienna_cichlid_read_sensor(struct smu_context *smu,
+				 enum amd_pp_sensors sensor,
+				 void *data, uint32_t *size)
+{
+	int ret = 0;
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *pptable = table_context->driver_pptable;
+
+	if(!data || !size)
+		return -EINVAL;
+
+	mutex_lock(&smu->sensor_lock);
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
+		*(uint32_t *)data = pptable->FanMaximumRpm;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		ret = sienna_cichlid_get_current_activity_percent(smu, sensor, (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GPU_POWER:
+		ret = sienna_cichlid_get_gpu_power(smu, (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+	case AMDGPU_PP_SENSOR_MEM_TEMP:
+		ret = sienna_cichlid_thermal_get_temperature(smu, sensor, (uint32_t *)data);
+		*size = 4;
+		break;
+	default:
+		ret = smu_v11_0_read_sensor(smu, sensor, data, size);
+	}
+	mutex_unlock(&smu->sensor_lock);
+
+	return ret;
+}
+
+static int sienna_cichlid_get_uclk_dpm_states(struct smu_context *smu, uint32_t *clocks_in_khz, uint32_t *num_states)
+{
+	uint32_t num_discrete_levels = 0;
+	uint16_t *dpm_levels = NULL;
+	uint16_t i = 0;
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *driver_ppt = NULL;
+
+	if (!clocks_in_khz || !num_states || !table_context->driver_pptable)
+		return -EINVAL;
+
+	driver_ppt = table_context->driver_pptable;
+	num_discrete_levels = driver_ppt->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels;
+	dpm_levels = driver_ppt->FreqTableUclk;
+
+	if (num_discrete_levels == 0 || dpm_levels == NULL)
+		return -EINVAL;
+
+	*num_states = num_discrete_levels;
+	for (i = 0; i < num_discrete_levels; i++) {
+		/* convert to khz */
+		*clocks_in_khz = (*dpm_levels) * 1000;
+		clocks_in_khz++;
+		dpm_levels++;
+	}
+
+	return 0;
+}
+
+static int sienna_cichlid_get_thermal_temperature_range(struct smu_context *smu,
+						struct smu_temperature_range *range)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_11_0_powerplay_table *powerplay_table = table_context->power_play_table;
+
+	if (!range || !powerplay_table)
+		return -EINVAL;
+
+	range->max = powerplay_table->software_shutdown_temp *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+
+	return 0;
+}
+
+static int sienna_cichlid_display_disable_memory_clock_switch(struct smu_context *smu,
+						bool disable_memory_clock_switch)
+{
+	int ret = 0;
+	struct smu_11_0_max_sustainable_clocks *max_sustainable_clocks =
+		(struct smu_11_0_max_sustainable_clocks *)
+			smu->smu_table.max_sustainable_clocks;
+	uint32_t min_memory_clock = smu->hard_min_uclk_req_from_dal;
+	uint32_t max_memory_clock = max_sustainable_clocks->uclock;
+
+	if(smu->disable_uclk_switch == disable_memory_clock_switch)
+		return 0;
+
+	if(disable_memory_clock_switch)
+		ret = smu_set_hard_freq_range(smu, SMU_UCLK, max_memory_clock, 0);
+	else
+		ret = smu_set_hard_freq_range(smu, SMU_UCLK, min_memory_clock, 0);
+
+	if(!ret)
+		smu->disable_uclk_switch = disable_memory_clock_switch;
+
+	return ret;
+}
+
+static int sienna_cichlid_get_power_limit(struct smu_context *smu,
+				     uint32_t *limit,
+				     bool cap)
+{
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+	uint32_t asic_default_power_limit = 0;
+	int ret = 0;
+	int power_src;
+
+	if (!smu->power_limit) {
+		if (smu_feature_is_enabled(smu, SMU_FEATURE_PPT_BIT)) {
+			power_src = smu_power_get_index(smu, SMU_POWER_SOURCE_AC);
+			if (power_src < 0)
+				return -EINVAL;
+
+			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_GetPptLimit,
+							  power_src << 16, &asic_default_power_limit);
+			if (ret) {
+				pr_err("[%s] get PPT limit failed!", __func__);
+				return ret;
+			}
+		} else {
+			/* the last hope to figure out the ppt limit */
+			if (!pptable) {
+				pr_err("Cannot get PPT limit due to pptable missing!");
+				return -EINVAL;
+			}
+			asic_default_power_limit =
+				pptable->SocketPowerLimitAc[PPT_THROTTLER_PPT0];
+		}
+
+		smu->power_limit = asic_default_power_limit;
+	}
+
+	if (cap)
+		*limit = smu_v11_0_get_max_power_limit(smu);
+	else
+		*limit = smu->power_limit;
+
+	return 0;
+}
+
+static void sienna_cichlid_dump_pptable(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *pptable = table_context->driver_pptable;
+	int i;
+
+	pr_info("Dumped PPTable:\n");
+
+	pr_info("Version = 0x%08x\n", pptable->Version);
+	pr_info("FeaturesToRun[0] = 0x%08x\n", pptable->FeaturesToRun[0]);
+	pr_info("FeaturesToRun[1] = 0x%08x\n", pptable->FeaturesToRun[1]);
+
+	for (i = 0; i < PPT_THROTTLER_COUNT; i++) {
+		pr_info("SocketPowerLimitAc[%d] = 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
+		pr_info("SocketPowerLimitAcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
+		pr_info("SocketPowerLimitDc[%d] = 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
+		pr_info("SocketPowerLimitDcTau[%d] = 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
+	}
+
+	for (i = 0; i < TDC_THROTTLER_COUNT; i++) {
+		pr_info("TdcLimit[%d] = 0x%x\n", i, pptable->TdcLimit[i]);
+		pr_info("TdcLimitTau[%d] = 0x%x\n", i, pptable->TdcLimitTau[i]);
+	}
+
+	for (i = 0; i < TEMP_COUNT; i++) {
+		pr_info("TemperatureLimit[%d] = 0x%x\n", i, pptable->TemperatureLimit[i]);
+	}
+
+	pr_info("FitLimit = 0x%x\n", pptable->FitLimit);
+	pr_info("TotalPowerConfig = 0x%x\n", pptable->TotalPowerConfig);
+	pr_info("TotalPowerPadding[0] = 0x%x\n", pptable->TotalPowerPadding[0]);
+	pr_info("TotalPowerPadding[1] = 0x%x\n", pptable->TotalPowerPadding[1]);
+	pr_info("TotalPowerPadding[2] = 0x%x\n", pptable->TotalPowerPadding[2]);
+
+	pr_info("ApccPlusResidencyLimit = 0x%x\n", pptable->ApccPlusResidencyLimit);
+	for (i = 0; i < NUM_SMNCLK_DPM_LEVELS; i++) {
+		pr_info("SmnclkDpmFreq[%d] = 0x%x\n", i, pptable->SmnclkDpmFreq[i]);
+		pr_info("SmnclkDpmVoltage[%d] = 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
+	}
+	pr_info("PaddingAPCC[0] = 0x%x\n", pptable->PaddingAPCC[0]);
+	pr_info("PaddingAPCC[1] = 0x%x\n", pptable->PaddingAPCC[1]);
+	pr_info("PaddingAPCC[2] = 0x%x\n", pptable->PaddingAPCC[2]);
+	pr_info("PaddingAPCC[3] = 0x%x\n", pptable->PaddingAPCC[3]);
+
+	pr_info("ThrottlerControlMask = 0x%x\n", pptable->ThrottlerControlMask);
+
+	pr_info("FwDStateMask = 0x%x\n", pptable->FwDStateMask);
+
+	pr_info("UlvVoltageOffsetSoc = 0x%x\n", pptable->UlvVoltageOffsetSoc);
+	pr_info("UlvVoltageOffsetGfx = 0x%x\n", pptable->UlvVoltageOffsetGfx);
+	pr_info("MinVoltageUlvGfx = 0x%x\n", pptable->MinVoltageUlvGfx);
+	pr_info("MinVoltageUlvSoc = 0x%x\n", pptable->MinVoltageUlvSoc);
+
+	pr_info("SocLIVmin = 0x%x\n", pptable->SocLIVmin);
+	pr_info("PaddingLIVmin = 0x%x\n", pptable->PaddingLIVmin);
+
+	pr_info("GceaLinkMgrIdleThreshold = 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
+	pr_info("paddingRlcUlvParams[0] = 0x%x\n", pptable->paddingRlcUlvParams[0]);
+	pr_info("paddingRlcUlvParams[1] = 0x%x\n", pptable->paddingRlcUlvParams[1]);
+	pr_info("paddingRlcUlvParams[2] = 0x%x\n", pptable->paddingRlcUlvParams[2]);
+
+	pr_info("MinVoltageGfx = 0x%x\n", pptable->MinVoltageGfx);
+	pr_info("MinVoltageSoc = 0x%x\n", pptable->MinVoltageSoc);
+	pr_info("MaxVoltageGfx = 0x%x\n", pptable->MaxVoltageGfx);
+	pr_info("MaxVoltageSoc = 0x%x\n", pptable->MaxVoltageSoc);
+
+	pr_info("LoadLineResistanceGfx = 0x%x\n", pptable->LoadLineResistanceGfx);
+	pr_info("LoadLineResistanceSoc = 0x%x\n", pptable->LoadLineResistanceSoc);
+
+	pr_info("VDDGFX_TVmin = 0x%x\n", pptable->VDDGFX_TVmin);
+	pr_info("VDDSOC_TVmin = 0x%x\n", pptable->VDDSOC_TVmin);
+	pr_info("VDDGFX_Vmin_HiTemp = 0x%x\n", pptable->VDDGFX_Vmin_HiTemp);
+	pr_info("VDDGFX_Vmin_LoTemp = 0x%x\n", pptable->VDDGFX_Vmin_LoTemp);
+	pr_info("VDDSOC_Vmin_HiTemp = 0x%x\n", pptable->VDDSOC_Vmin_HiTemp);
+	pr_info("VDDSOC_Vmin_LoTemp = 0x%x\n", pptable->VDDSOC_Vmin_LoTemp);
+	pr_info("VDDGFX_TVminHystersis = 0x%x\n", pptable->VDDGFX_TVminHystersis);
+	pr_info("VDDSOC_TVminHystersis = 0x%x\n", pptable->VDDSOC_TVminHystersis);
+
+	pr_info("[PPCLK_GFXCLK]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
+			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
+
+	pr_info("[PPCLK_SOCCLK]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
+			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
+
+	pr_info("[PPCLK_UCLK]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_UCLK].Padding,
+			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
+			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
+
+	pr_info("[PPCLK_FCLK]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_FCLK].Padding,
+			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
+			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
+
+	pr_info("[PPCLK_DCLK_0]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_DCLK_0].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].SsFmin,
+			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding16);
+
+	pr_info("[PPCLK_VCLK_0]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_VCLK_0].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].SsFmin,
+			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding16);
+
+	pr_info("[PPCLK_DCLK_1]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_DCLK_1].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].SsFmin,
+			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding16);
+
+	pr_info("[PPCLK_VCLK_1]\n"
+			"  .VoltageMode          = 0x%02x\n"
+			"  .SnapToDiscrete       = 0x%02x\n"
+			"  .NumDiscreteLevels    = 0x%02x\n"
+			"  .padding              = 0x%02x\n"
+			"  .ConversionToAvfsClk{m = 0x%08x b = 0x%08x}\n"
+			"  .SsCurve            {a = 0x%08x b = 0x%08x c = 0x%08x}\n"
+			"  .SsFmin               = 0x%04x\n"
+			"  .Padding_16           = 0x%04x\n",
+			pptable->DpmDescriptor[PPCLK_VCLK_1].VoltageMode,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].SnapToDiscrete,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].NumDiscreteLevels,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.m,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionToAvfsClk.b,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.a,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.b,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.c,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].SsFmin,
+			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding16);
+
+	pr_info("FreqTableGfx\n");
+	for (i = 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableGfx[i]);
+
+	pr_info("FreqTableVclk\n");
+	for (i = 0; i < NUM_VCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableVclk[i]);
+
+	pr_info("FreqTableDclk\n");
+	for (i = 0; i < NUM_DCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableDclk[i]);
+
+	pr_info("FreqTableSocclk\n");
+	for (i = 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableSocclk[i]);
+
+	pr_info("FreqTableUclk\n");
+	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableUclk[i]);
+
+	pr_info("FreqTableFclk\n");
+	for (i = 0; i < NUM_FCLK_DPM_LEVELS; i++)
+		pr_info("  .[%02d] = 0x%x\n", i, pptable->FreqTableFclk[i]);
+
+	pr_info("Paddingclks[0] = 0x%x\n",  pptable->Paddingclks[0]);
+	pr_info("Paddingclks[1] = 0x%x\n",  pptable->Paddingclks[1]);
+	pr_info("Paddingclks[2] = 0x%x\n",  pptable->Paddingclks[2]);
+	pr_info("Paddingclks[3] = 0x%x\n",  pptable->Paddingclks[3]);
+	pr_info("Paddingclks[4] = 0x%x\n",  pptable->Paddingclks[4]);
+	pr_info("Paddingclks[5] = 0x%x\n",  pptable->Paddingclks[5]);
+	pr_info("Paddingclks[6] = 0x%x\n",  pptable->Paddingclks[6]);
+	pr_info("Paddingclks[7] = 0x%x\n",  pptable->Paddingclks[7]);
+	pr_info("Paddingclks[8] = 0x%x\n",  pptable->Paddingclks[8]);
+	pr_info("Paddingclks[9] = 0x%x\n",  pptable->Paddingclks[9]);
+	pr_info("Paddingclks[10] = 0x%x\n", pptable->Paddingclks[10]);
+	pr_info("Paddingclks[11] = 0x%x\n", pptable->Paddingclks[11]);
+	pr_info("Paddingclks[12] = 0x%x\n", pptable->Paddingclks[12]);
+	pr_info("Paddingclks[13] = 0x%x\n", pptable->Paddingclks[13]);
+	pr_info("Paddingclks[14] = 0x%x\n", pptable->Paddingclks[14]);
+	pr_info("Paddingclks[15] = 0x%x\n", pptable->Paddingclks[15]);
+
+	pr_info("DcModeMaxFreq\n");
+	pr_info("  .PPCLK_GFXCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
+	pr_info("  .PPCLK_SOCCLK = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
+	pr_info("  .PPCLK_UCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
+	pr_info("  .PPCLK_FCLK   = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
+	pr_info("  .PPCLK_DCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
+	pr_info("  .PPCLK_VCLK_0 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
+	pr_info("  .PPCLK_DCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
+	pr_info("  .PPCLK_VCLK_1 = 0x%x\n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
+
+	pr_info("FreqTableUclkDiv\n");
+	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->FreqTableUclkDiv[i]);
+
+	pr_info("FclkBoostFreq = 0x%x\n", pptable->FclkBoostFreq);
+	pr_info("FclkParamPadding = 0x%x\n", pptable->FclkParamPadding);
+
+	pr_info("Mp0clkFreq\n");
+	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->Mp0clkFreq[i]);
+
+	pr_info("Mp0DpmVoltage\n");
+	for (i = 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->Mp0DpmVoltage[i]);
+
+	pr_info("MemVddciVoltage\n");
+	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->MemVddciVoltage[i]);
+
+	pr_info("MemMvddVoltage\n");
+	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->MemMvddVoltage[i]);
+
+	pr_info("GfxclkFgfxoffEntry = 0x%x\n", pptable->GfxclkFgfxoffEntry);
+	pr_info("GfxclkFinit = 0x%x\n", pptable->GfxclkFinit);
+	pr_info("GfxclkFidle = 0x%x\n", pptable->GfxclkFidle);
+	pr_info("GfxclkSource = 0x%x\n", pptable->GfxclkSource);
+	pr_info("GfxclkPadding = 0x%x\n", pptable->GfxclkPadding);
+
+	pr_info("GfxGpoSubFeatureMask = 0x%x\n", pptable->GfxGpoSubFeatureMask);
+
+	pr_info("GfxGpoEnabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
+	pr_info("GfxGpoDisabledWorkPolicyMask = 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
+	pr_info("GfxGpoPadding[0] = 0x%x\n", pptable->GfxGpoPadding[0]);
+	pr_info("GfxGpoVotingAllow = 0x%x\n", pptable->GfxGpoVotingAllow);
+	pr_info("GfxGpoPadding32[0] = 0x%x\n", pptable->GfxGpoPadding32[0]);
+	pr_info("GfxGpoPadding32[1] = 0x%x\n", pptable->GfxGpoPadding32[1]);
+	pr_info("GfxGpoPadding32[2] = 0x%x\n", pptable->GfxGpoPadding32[2]);
+	pr_info("GfxGpoPadding32[3] = 0x%x\n", pptable->GfxGpoPadding32[3]);
+	pr_info("GfxDcsFopt = 0x%x\n", pptable->GfxDcsFopt);
+	pr_info("GfxDcsFclkFopt = 0x%x\n", pptable->GfxDcsFclkFopt);
+	pr_info("GfxDcsUclkFopt = 0x%x\n", pptable->GfxDcsUclkFopt);
+
+	pr_info("DcsGfxOffVoltage = 0x%x\n", pptable->DcsGfxOffVoltage);
+	pr_info("DcsMinGfxOffTime = 0x%x\n", pptable->DcsMinGfxOffTime);
+	pr_info("DcsMaxGfxOffTime = 0x%x\n", pptable->DcsMaxGfxOffTime);
+	pr_info("DcsMinCreditAccum = 0x%x\n", pptable->DcsMinCreditAccum);
+	pr_info("DcsExitHysteresis = 0x%x\n", pptable->DcsExitHysteresis);
+	pr_info("DcsTimeout = 0x%x\n", pptable->DcsTimeout);
+
+	pr_info("DcsParamPadding[0] = 0x%x\n", pptable->DcsParamPadding[0]);
+	pr_info("DcsParamPadding[1] = 0x%x\n", pptable->DcsParamPadding[1]);
+	pr_info("DcsParamPadding[2] = 0x%x\n", pptable->DcsParamPadding[2]);
+	pr_info("DcsParamPadding[3] = 0x%x\n", pptable->DcsParamPadding[3]);
+	pr_info("DcsParamPadding[4] = 0x%x\n", pptable->DcsParamPadding[4]);
+
+	pr_info("FlopsPerByteTable\n");
+	for (i = 0; i < RLC_PACE_TABLE_NUM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->FlopsPerByteTable[i]);
+
+	pr_info("LowestUclkReservedForUlv = 0x%x\n", pptable->LowestUclkReservedForUlv);
+	pr_info("vddingMem[0] = 0x%x\n", pptable->PaddingMem[0]);
+	pr_info("vddingMem[1] = 0x%x\n", pptable->PaddingMem[1]);
+	pr_info("vddingMem[2] = 0x%x\n", pptable->PaddingMem[2]);
+
+	pr_info("UclkDpmPstates\n");
+	for (i = 0; i < NUM_UCLK_DPM_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->UclkDpmPstates[i]);
+
+	pr_info("UclkDpmSrcFreqRange\n");
+	pr_info("  .Fmin = 0x%x\n",
+		pptable->UclkDpmSrcFreqRange.Fmin);
+	pr_info("  .Fmax = 0x%x\n",
+		pptable->UclkDpmSrcFreqRange.Fmax);
+	pr_info("UclkDpmTargFreqRange\n");
+	pr_info("  .Fmin = 0x%x\n",
+		pptable->UclkDpmTargFreqRange.Fmin);
+	pr_info("  .Fmax = 0x%x\n",
+		pptable->UclkDpmTargFreqRange.Fmax);
+	pr_info("UclkDpmMidstepFreq = 0x%x\n", pptable->UclkDpmMidstepFreq);
+	pr_info("UclkMidstepPadding = 0x%x\n", pptable->UclkMidstepPadding);
+
+	pr_info("PcieGenSpeed\n");
+	for (i = 0; i < NUM_LINK_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->PcieGenSpeed[i]);
+
+	pr_info("PcieLaneCount\n");
+	for (i = 0; i < NUM_LINK_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->PcieLaneCount[i]);
+
+	pr_info("LclkFreq\n");
+	for (i = 0; i < NUM_LINK_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->LclkFreq[i]);
+
+	pr_info("FanStopTemp = 0x%x\n", pptable->FanStopTemp);
+	pr_info("FanStartTemp = 0x%x\n", pptable->FanStartTemp);
+
+	pr_info("FanGain\n");
+	for (i = 0; i < TEMP_COUNT; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->FanGain[i]);
+
+	pr_info("FanPwmMin = 0x%x\n", pptable->FanPwmMin);
+	pr_info("FanAcousticLimitRpm = 0x%x\n", pptable->FanAcousticLimitRpm);
+	pr_info("FanThrottlingRpm = 0x%x\n", pptable->FanThrottlingRpm);
+	pr_info("FanMaximumRpm = 0x%x\n", pptable->FanMaximumRpm);
+	pr_info("MGpuFanBoostLimitRpm = 0x%x\n", pptable->MGpuFanBoostLimitRpm);
+	pr_info("FanTargetTemperature = 0x%x\n", pptable->FanTargetTemperature);
+	pr_info("FanTargetGfxclk = 0x%x\n", pptable->FanTargetGfxclk);
+	pr_info("FanPadding16 = 0x%x\n", pptable->FanPadding16);
+	pr_info("FanTempInputSelect = 0x%x\n", pptable->FanTempInputSelect);
+	pr_info("FanPadding = 0x%x\n", pptable->FanPadding);
+	pr_info("FanZeroRpmEnable = 0x%x\n", pptable->FanZeroRpmEnable);
+	pr_info("FanTachEdgePerRev = 0x%x\n", pptable->FanTachEdgePerRev);
+
+	pr_info("FuzzyFan_ErrorSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
+	pr_info("FuzzyFan_ErrorRateSetDelta = 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
+	pr_info("FuzzyFan_PwmSetDelta = 0x%x\n", pptable->FuzzyFan_PwmSetDelta);
+	pr_info("FuzzyFan_Reserved = 0x%x\n", pptable->FuzzyFan_Reserved);
+
+	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
+	pr_info("OverrideAvfsGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
+	pr_info("dBtcGbGfxDfllModelSelect = 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
+	pr_info("Padding8_Avfs = 0x%x\n", pptable->Padding8_Avfs);
+
+	pr_info("qAvfsGb[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
+			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
+			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
+	pr_info("qAvfsGb[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
+			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
+			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
+	pr_info("dBtcGbGfxPll{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->dBtcGbGfxPll.a,
+			pptable->dBtcGbGfxPll.b,
+			pptable->dBtcGbGfxPll.c);
+	pr_info("dBtcGbGfxAfll{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->dBtcGbGfxDfll.a,
+			pptable->dBtcGbGfxDfll.b,
+			pptable->dBtcGbGfxDfll.c);
+	pr_info("dBtcGbSoc{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->dBtcGbSoc.a,
+			pptable->dBtcGbSoc.b,
+			pptable->dBtcGbSoc.c);
+	pr_info("qAgingGb[AVFS_VOLTAGE_GFX]{m = 0x%x b = 0x%x}\n",
+			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
+			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
+	pr_info("qAgingGb[AVFS_VOLTAGE_SOC]{m = 0x%x b = 0x%x}\n",
+			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
+			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
+
+	pr_info("PiecewiseLinearDroopIntGfxDfll\n");
+	for (i = 0; i < NUM_PIECE_WISE_LINEAR_DROOP_MODEL_VF_POINTS; i++) {
+		pr_info("		Fset[%d] = 0x%x\n",
+			i, pptable->PiecewiseLinearDroopIntGfxDfll.Fset[i]);
+		pr_info("		Vdroop[%d] = 0x%x\n",
+			i, pptable->PiecewiseLinearDroopIntGfxDfll.Vdroop[i]);
+	}
+
+	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_GFX]{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c);
+	pr_info("qStaticVoltageOffset[AVFS_VOLTAGE_SOC]{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
+			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c);
+
+	pr_info("DcTol[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
+	pr_info("DcTol[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
+
+	pr_info("DcBtcEnabled[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
+	pr_info("DcBtcEnabled[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
+	pr_info("Padding8_GfxBtc[0] = 0x%x\n", pptable->Padding8_GfxBtc[0]);
+	pr_info("Padding8_GfxBtc[1] = 0x%x\n", pptable->Padding8_GfxBtc[1]);
+
+	pr_info("DcBtcMin[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
+	pr_info("DcBtcMin[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
+	pr_info("DcBtcMax[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
+	pr_info("DcBtcMax[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
+
+	pr_info("DcBtcGb[AVFS_VOLTAGE_GFX] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
+	pr_info("DcBtcGb[AVFS_VOLTAGE_SOC] = 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
+
+	pr_info("XgmiDpmPstates\n");
+	for (i = 0; i < NUM_XGMI_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiDpmPstates[i]);
+	pr_info("XgmiDpmSpare[0] = 0x%02x\n", pptable->XgmiDpmSpare[0]);
+	pr_info("XgmiDpmSpare[1] = 0x%02x\n", pptable->XgmiDpmSpare[1]);
+
+	pr_info("DebugOverrides = 0x%x\n", pptable->DebugOverrides);
+	pr_info("ReservedEquation0{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->ReservedEquation0.a,
+			pptable->ReservedEquation0.b,
+			pptable->ReservedEquation0.c);
+	pr_info("ReservedEquation1{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->ReservedEquation1.a,
+			pptable->ReservedEquation1.b,
+			pptable->ReservedEquation1.c);
+	pr_info("ReservedEquation2{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->ReservedEquation2.a,
+			pptable->ReservedEquation2.b,
+			pptable->ReservedEquation2.c);
+	pr_info("ReservedEquation3{a = 0x%x b = 0x%x c = 0x%x}\n",
+			pptable->ReservedEquation3.a,
+			pptable->ReservedEquation3.b,
+			pptable->ReservedEquation3.c);
+
+	pr_info("SkuReserved[0] = 0x%x\n", pptable->SkuReserved[0]);
+	pr_info("SkuReserved[1] = 0x%x\n", pptable->SkuReserved[1]);
+	pr_info("SkuReserved[2] = 0x%x\n", pptable->SkuReserved[2]);
+	pr_info("SkuReserved[3] = 0x%x\n", pptable->SkuReserved[3]);
+	pr_info("SkuReserved[4] = 0x%x\n", pptable->SkuReserved[4]);
+	pr_info("SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
+	pr_info("SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
+	pr_info("SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
+	pr_info("SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
+	pr_info("SkuReserved[9] = 0x%x\n", pptable->SkuReserved[9]);
+	pr_info("SkuReserved[10] = 0x%x\n", pptable->SkuReserved[10]);
+	pr_info("SkuReserved[11] = 0x%x\n", pptable->SkuReserved[11]);
+	pr_info("SkuReserved[12] = 0x%x\n", pptable->SkuReserved[12]);
+	pr_info("SkuReserved[13] = 0x%x\n", pptable->SkuReserved[13]);
+	pr_info("SkuReserved[14] = 0x%x\n", pptable->SkuReserved[14]);
+
+	pr_info("GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
+	pr_info("GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
+	pr_info("GamingClk[2] = 0x%x\n", pptable->GamingClk[2]);
+	pr_info("GamingClk[3] = 0x%x\n", pptable->GamingClk[3]);
+	pr_info("GamingClk[4] = 0x%x\n", pptable->GamingClk[4]);
+	pr_info("GamingClk[5] = 0x%x\n", pptable->GamingClk[5]);
+
+	for (i = 0; i < NUM_I2C_CONTROLLERS; i++) {
+		pr_info("I2cControllers[%d]:\n", i);
+		pr_info("                   .Enabled = 0x%x\n",
+				pptable->I2cControllers[i].Enabled);
+		pr_info("                   .Speed = 0x%x\n",
+				pptable->I2cControllers[i].Speed);
+		pr_info("                   .SlaveAddress = 0x%x\n",
+				pptable->I2cControllers[i].SlaveAddress);
+		pr_info("                   .ControllerPort = 0x%x\n",
+				pptable->I2cControllers[i].ControllerPort);
+		pr_info("                   .ControllerName = 0x%x\n",
+				pptable->I2cControllers[i].ControllerName);
+		pr_info("                   .ThermalThrottler = 0x%x\n",
+				pptable->I2cControllers[i].ThermalThrotter);
+		pr_info("                   .I2cProtocol = 0x%x\n",
+				pptable->I2cControllers[i].I2cProtocol);
+		pr_info("                   .PaddingConfig = 0x%x\n",
+				pptable->I2cControllers[i].PaddingConfig);
+	}
+
+	pr_info("GpioScl = 0x%x\n", pptable->GpioScl);
+	pr_info("GpioSda = 0x%x\n", pptable->GpioSda);
+	pr_info("FchUsbPdSlaveAddr = 0x%x\n", pptable->FchUsbPdSlaveAddr);
+	pr_info("I2cSpare[0] = 0x%x\n", pptable->I2cSpare[0]);
+
+	pr_info("Board Parameters:\n");
+	pr_info("VddGfxVrMapping = 0x%x\n", pptable->VddGfxVrMapping);
+	pr_info("VddSocVrMapping = 0x%x\n", pptable->VddSocVrMapping);
+	pr_info("VddMem0VrMapping = 0x%x\n", pptable->VddMem0VrMapping);
+	pr_info("VddMem1VrMapping = 0x%x\n", pptable->VddMem1VrMapping);
+	pr_info("GfxUlvPhaseSheddingMask = 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
+	pr_info("SocUlvPhaseSheddingMask = 0x%x\n", pptable->SocUlvPhaseSheddingMask);
+	pr_info("VddciUlvPhaseSheddingMask = 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
+	pr_info("MvddUlvPhaseSheddingMask = 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
+
+	pr_info("GfxMaxCurrent = 0x%x\n", pptable->GfxMaxCurrent);
+	pr_info("GfxOffset = 0x%x\n", pptable->GfxOffset);
+	pr_info("Padding_TelemetryGfx = 0x%x\n", pptable->Padding_TelemetryGfx);
+
+	pr_info("SocMaxCurrent = 0x%x\n", pptable->SocMaxCurrent);
+	pr_info("SocOffset = 0x%x\n", pptable->SocOffset);
+	pr_info("Padding_TelemetrySoc = 0x%x\n", pptable->Padding_TelemetrySoc);
+
+	pr_info("Mem0MaxCurrent = 0x%x\n", pptable->Mem0MaxCurrent);
+	pr_info("Mem0Offset = 0x%x\n", pptable->Mem0Offset);
+	pr_info("Padding_TelemetryMem0 = 0x%x\n", pptable->Padding_TelemetryMem0);
+
+	pr_info("Mem1MaxCurrent = 0x%x\n", pptable->Mem1MaxCurrent);
+	pr_info("Mem1Offset = 0x%x\n", pptable->Mem1Offset);
+	pr_info("Padding_TelemetryMem1 = 0x%x\n", pptable->Padding_TelemetryMem1);
+
+	pr_info("MvddRatio = 0x%x\n", pptable->MvddRatio);
+
+	pr_info("AcDcGpio = 0x%x\n", pptable->AcDcGpio);
+	pr_info("AcDcPolarity = 0x%x\n", pptable->AcDcPolarity);
+	pr_info("VR0HotGpio = 0x%x\n", pptable->VR0HotGpio);
+	pr_info("VR0HotPolarity = 0x%x\n", pptable->VR0HotPolarity);
+	pr_info("VR1HotGpio = 0x%x\n", pptable->VR1HotGpio);
+	pr_info("VR1HotPolarity = 0x%x\n", pptable->VR1HotPolarity);
+	pr_info("GthrGpio = 0x%x\n", pptable->GthrGpio);
+	pr_info("GthrPolarity = 0x%x\n", pptable->GthrPolarity);
+	pr_info("LedPin0 = 0x%x\n", pptable->LedPin0);
+	pr_info("LedPin1 = 0x%x\n", pptable->LedPin1);
+	pr_info("LedPin2 = 0x%x\n", pptable->LedPin2);
+	pr_info("LedEnableMask = 0x%x\n", pptable->LedEnableMask);
+	pr_info("LedPcie = 0x%x\n", pptable->LedPcie);
+	pr_info("LedError = 0x%x\n", pptable->LedError);
+	pr_info("LedSpare1[0] = 0x%x\n", pptable->LedSpare1[0]);
+	pr_info("LedSpare1[1] = 0x%x\n", pptable->LedSpare1[1]);
+
+	pr_info("PllGfxclkSpreadEnabled = 0x%x\n", pptable->PllGfxclkSpreadEnabled);
+	pr_info("PllGfxclkSpreadPercent = 0x%x\n", pptable->PllGfxclkSpreadPercent);
+	pr_info("PllGfxclkSpreadFreq = 0x%x\n",    pptable->PllGfxclkSpreadFreq);
+
+	pr_info("DfllGfxclkSpreadEnabled = 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
+	pr_info("DfllGfxclkSpreadPercent = 0x%x\n", pptable->DfllGfxclkSpreadPercent);
+	pr_info("DfllGfxclkSpreadFreq = 0x%x\n",    pptable->DfllGfxclkSpreadFreq);
+
+	pr_info("UclkSpreadEnabled = 0x%x\n", pptable->UclkSpreadEnabled);
+	pr_info("UclkSpreadPercent = 0x%x\n", pptable->UclkSpreadPercent);
+	pr_info("UclkSpreadFreq = 0x%x\n", pptable->UclkSpreadFreq);
+
+	pr_info("FclkSpreadEnabled = 0x%x\n", pptable->FclkSpreadEnabled);
+	pr_info("FclkSpreadPercent = 0x%x\n", pptable->FclkSpreadPercent);
+	pr_info("FclkSpreadFreq = 0x%x\n", pptable->FclkSpreadFreq);
+
+	pr_info("MemoryChannelEnabled = 0x%x\n", pptable->MemoryChannelEnabled);
+	pr_info("DramBitWidth = 0x%x\n", pptable->DramBitWidth);
+	pr_info("PaddingMem1[0] = 0x%x\n", pptable->PaddingMem1[0]);
+	pr_info("PaddingMem1[1] = 0x%x\n", pptable->PaddingMem1[1]);
+	pr_info("PaddingMem1[2] = 0x%x\n", pptable->PaddingMem1[2]);
+
+	pr_info("TotalBoardPower = 0x%x\n", pptable->TotalBoardPower);
+	pr_info("BoardPowerPadding = 0x%x\n", pptable->BoardPowerPadding);
+
+	pr_info("XgmiLinkSpeed\n");
+	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiLinkSpeed[i]);
+	pr_info("XgmiLinkWidth\n");
+	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiLinkWidth[i]);
+	pr_info("XgmiFclkFreq\n");
+	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiFclkFreq[i]);
+	pr_info("XgmiSocVoltage\n");
+	for (i = 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
+		pr_info("  .[%d] = 0x%x\n", i, pptable->XgmiSocVoltage[i]);
+
+	pr_info("HsrEnabled = 0x%x\n", pptable->HsrEnabled);
+	pr_info("VddqOffEnabled = 0x%x\n", pptable->VddqOffEnabled);
+	pr_info("PaddingUmcFlags[0] = 0x%x\n", pptable->PaddingUmcFlags[0]);
+	pr_info("PaddingUmcFlags[1] = 0x%x\n", pptable->PaddingUmcFlags[1]);
+
+	pr_info("BoardReserved[0] = 0x%x\n", pptable->BoardReserved[0]);
+	pr_info("BoardReserved[1] = 0x%x\n", pptable->BoardReserved[1]);
+	pr_info("BoardReserved[2] = 0x%x\n", pptable->BoardReserved[2]);
+	pr_info("BoardReserved[3] = 0x%x\n", pptable->BoardReserved[3]);
+	pr_info("BoardReserved[4] = 0x%x\n", pptable->BoardReserved[4]);
+	pr_info("BoardReserved[5] = 0x%x\n", pptable->BoardReserved[5]);
+	pr_info("BoardReserved[6] = 0x%x\n", pptable->BoardReserved[6]);
+	pr_info("BoardReserved[7] = 0x%x\n", pptable->BoardReserved[7]);
+	pr_info("BoardReserved[8] = 0x%x\n", pptable->BoardReserved[8]);
+	pr_info("BoardReserved[9] = 0x%x\n", pptable->BoardReserved[9]);
+	pr_info("BoardReserved[10] = 0x%x\n", pptable->BoardReserved[10]);
+	pr_info("BoardReserved[11] = 0x%x\n", pptable->BoardReserved[11]);
+	pr_info("BoardReserved[12] = 0x%x\n", pptable->BoardReserved[12]);
+	pr_info("BoardReserved[13] = 0x%x\n", pptable->BoardReserved[13]);
+	pr_info("BoardReserved[14] = 0x%x\n", pptable->BoardReserved[14]);
+
+	pr_info("MmHubPadding[0] = 0x%x\n", pptable->MmHubPadding[0]);
+	pr_info("MmHubPadding[1] = 0x%x\n", pptable->MmHubPadding[1]);
+	pr_info("MmHubPadding[2] = 0x%x\n", pptable->MmHubPadding[2]);
+	pr_info("MmHubPadding[3] = 0x%x\n", pptable->MmHubPadding[3]);
+	pr_info("MmHubPadding[4] = 0x%x\n", pptable->MmHubPadding[4]);
+	pr_info("MmHubPadding[5] = 0x%x\n", pptable->MmHubPadding[5]);
+	pr_info("MmHubPadding[6] = 0x%x\n", pptable->MmHubPadding[6]);
+	pr_info("MmHubPadding[7] = 0x%x\n", pptable->MmHubPadding[7]);
+}
+
+static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
+	.tables_init = sienna_cichlid_tables_init,
+	.alloc_dpm_context = sienna_cichlid_allocate_dpm_context,
+	.store_powerplay_table = sienna_cichlid_store_powerplay_table,
+	.check_powerplay_table = sienna_cichlid_check_powerplay_table,
+	.append_powerplay_table = sienna_cichlid_append_powerplay_table,
+	.get_smu_msg_index = sienna_cichlid_get_smu_msg_index,
+	.get_smu_clk_index = sienna_cichlid_get_smu_clk_index,
+	.get_smu_feature_index = sienna_cichlid_get_smu_feature_index,
+	.get_smu_table_index = sienna_cichlid_get_smu_table_index,
+	.get_workload_type = sienna_cichlid_get_workload_type,
+	.get_allowed_feature_mask = sienna_cichlid_get_allowed_feature_mask,
+	.set_default_dpm_table = sienna_cichlid_set_default_dpm_table,
+	.dpm_set_uvd_enable = sienna_cichlid_dpm_set_uvd_enable,
+	.get_current_clk_freq_by_table = sienna_cichlid_get_current_clk_freq_by_table,
+	.print_clk_levels = sienna_cichlid_print_clk_levels,
+	.force_clk_levels = sienna_cichlid_force_clk_levels,
+	.populate_umd_state_clk = sienna_cichlid_populate_umd_state_clk,
+	.get_clock_by_type_with_latency = sienna_cichlid_get_clock_by_type_with_latency,
+	.pre_display_config_changed = sienna_cichlid_pre_display_config_changed,
+	.display_config_changed = sienna_cichlid_display_config_changed,
+	.notify_smc_display_config = sienna_cichlid_notify_smc_display_config,
+	.force_dpm_limit_value = sienna_cichlid_force_dpm_limit_value,
+	.unforce_dpm_levels = sienna_cichlid_unforce_dpm_levels,
+	.is_dpm_running = sienna_cichlid_is_dpm_running,
+	.get_fan_speed_percent = sienna_cichlid_get_fan_speed_percent,
+	.get_fan_speed_rpm = sienna_cichlid_get_fan_speed_rpm,
+	.get_power_profile_mode = sienna_cichlid_get_power_profile_mode,
+	.set_power_profile_mode = sienna_cichlid_set_power_profile_mode,
+	.get_profiling_clk_mask = sienna_cichlid_get_profiling_clk_mask,
+	.set_watermarks_table = sienna_cichlid_set_watermarks_table,
+	.read_sensor = sienna_cichlid_read_sensor,
+	.get_uclk_dpm_states = sienna_cichlid_get_uclk_dpm_states,
+	.get_thermal_temperature_range = sienna_cichlid_get_thermal_temperature_range,
+	.display_disable_memory_clock_switch = sienna_cichlid_display_disable_memory_clock_switch,
+	.get_power_limit = sienna_cichlid_get_power_limit,
+	.dump_pptable = sienna_cichlid_dump_pptable,
+	.init_microcode = smu_v11_0_init_microcode,
+	.load_microcode = smu_v11_0_load_microcode,
+	.init_smc_tables = smu_v11_0_init_smc_tables,
+	.fini_smc_tables = smu_v11_0_fini_smc_tables,
+	.init_power = smu_v11_0_init_power,
+	.fini_power = smu_v11_0_fini_power,
+	.check_fw_status = smu_v11_0_check_fw_status,
+	.setup_pptable = smu_v11_0_setup_pptable,
+	.get_vbios_bootup_values = smu_v11_0_get_vbios_bootup_values,
+	.get_clk_info_from_vbios = smu_v11_0_get_clk_info_from_vbios,
+	.check_pptable = smu_v11_0_check_pptable,
+	.parse_pptable = smu_v11_0_parse_pptable,
+	.populate_smc_tables = smu_v11_0_populate_smc_pptable,
+	.check_fw_version = smu_v11_0_check_fw_version,
+	.write_pptable = smu_v11_0_write_pptable,
+	.set_min_dcef_deep_sleep = smu_v11_0_set_min_dcef_deep_sleep,
+	.set_driver_table_location = smu_v11_0_set_driver_table_location,
+	.set_tool_table_location = smu_v11_0_set_tool_table_location,
+	.notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
+	.system_features_control = smu_v11_0_system_features_control,
+	.send_smc_msg_with_param = smu_v11_0_send_msg_with_param,
+	.init_display_count = smu_v11_0_init_display_count,
+	.set_allowed_mask = smu_v11_0_set_allowed_mask,
+	.get_enabled_mask = smu_v11_0_get_enabled_mask,
+	.notify_display_change = smu_v11_0_notify_display_change,
+	.set_power_limit = smu_v11_0_set_power_limit,
+	.get_current_clk_freq = smu_v11_0_get_current_clk_freq,
+	.init_max_sustainable_clocks = smu_v11_0_init_max_sustainable_clocks,
+	.enable_thermal_alert = smu_v11_0_enable_thermal_alert,
+	.disable_thermal_alert = smu_v11_0_disable_thermal_alert,
+	.set_deep_sleep_dcefclk = smu_v11_0_set_deep_sleep_dcefclk,
+	.display_clock_voltage_request = smu_v11_0_display_clock_voltage_request,
+	.get_fan_control_mode = smu_v11_0_get_fan_control_mode,
+	.set_fan_control_mode = smu_v11_0_set_fan_control_mode,
+	.set_fan_speed_percent = smu_v11_0_set_fan_speed_percent,
+	.set_fan_speed_rpm = smu_v11_0_set_fan_speed_rpm,
+	.set_xgmi_pstate = smu_v11_0_set_xgmi_pstate,
+	.gfx_off_control = smu_v11_0_gfx_off_control,
+	.register_irq_handler = smu_v11_0_register_irq_handler,
+	.set_azalia_d3_pme = smu_v11_0_set_azalia_d3_pme,
+	.get_max_sustainable_clocks_by_dc = smu_v11_0_get_max_sustainable_clocks_by_dc,
+	.baco_is_support= smu_v11_0_baco_is_support,
+	.baco_get_state = smu_v11_0_baco_get_state,
+	.baco_set_state = smu_v11_0_baco_set_state,
+	.baco_enter = smu_v11_0_baco_enter,
+	.baco_exit = smu_v11_0_baco_exit,
+	.get_dpm_ultimate_freq = smu_v11_0_get_dpm_ultimate_freq,
+	.set_soft_freq_limited_range = smu_v11_0_set_soft_freq_limited_range,
+	.override_pcie_parameters = smu_v11_0_override_pcie_parameters,
+};
+
+void sienna_cichlid_set_ppt_funcs(struct smu_context *smu)
+{
+	smu->ppt_funcs = &sienna_cichlid_ppt_funcs;
+}
diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h
new file mode 100644
index 000000000000..ce4e4fe43806
--- /dev/null
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h
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
+#ifndef __SIENNA_CICHLID_PPT_H__
+#define __SIENNA_CICHLID_PPT_H__
+
+extern void sienna_cichlid_set_ppt_funcs(struct smu_context *smu);
+
+#endif
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index d6bdd2126f72..b9575f1c22a3 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -50,6 +50,7 @@ MODULE_FIRMWARE("amdgpu/arcturus_smc.bin");
 MODULE_FIRMWARE("amdgpu/navi10_smc.bin");
 MODULE_FIRMWARE("amdgpu/navi14_smc.bin");
 MODULE_FIRMWARE("amdgpu/navi12_smc.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_smc.bin");
 
 #define SMU11_VOLTAGE_SCALE 4
 
@@ -159,6 +160,9 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	case CHIP_NAVI12:
 		chip_name = "navi12";
 		break;
+	case CHIP_SIENNA_CICHLID:
+		chip_name = "sienna_cichlid";
+		break;
 	default:
 		BUG();
 	}
@@ -278,6 +282,9 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 	case CHIP_NAVI14:
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_NV14;
 		break;
+	case CHIP_SIENNA_CICHLID:
+		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_Sienna_Cichlid;
+		break;
 	default:
 		pr_err("smu unsupported asic type:%d.\n", smu->adev->asic_type);
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_INV;
@@ -359,7 +366,8 @@ int smu_v11_0_setup_pptable(struct smu_context *smu)
 	hdr = (const struct smc_firmware_header_v1_0 *) adev->pm.fw->data;
 	version_major = le16_to_cpu(hdr->header.header_version_major);
 	version_minor = le16_to_cpu(hdr->header.header_version_minor);
-	if (version_major == 2 && smu->smu_table.boot_values.pp_table_id > 0) {
+	if ((version_major == 2 && smu->smu_table.boot_values.pp_table_id > 0) ||
+	    adev->asic_type == CHIP_SIENNA_CICHLID) {
 		pr_info("use driver provided pptable %d\n", smu->smu_table.boot_values.pp_table_id);
 		switch (version_minor) {
 		case 0:
@@ -829,6 +837,11 @@ int smu_v11_0_set_tool_table_location(struct smu_context *smu)
 int smu_v11_0_init_display_count(struct smu_context *smu, uint32_t count)
 {
 	int ret = 0;
+	struct amdgpu_device *adev = smu->adev;
+
+	/* Sienna_Cichlid do not support to change display num currently */
+	if (adev->asic_type == CHIP_SIENNA_CICHLID)
+		return 0;
 
 	if (!smu->pm_enabled)
 		return ret;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
