Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D61EAC09
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E4B6E9E3;
	Mon,  1 Jun 2020 18:30:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BBF6E9DC
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:30:04 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id i16so1861821qtr.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXPP/ibbqT6bvyovw9rkEa7JaWO/L2n8T1eEmEgt6VI=;
 b=OzICxox44ma7aQHRy0TgywiqsUPZuAF7iviP2RlWoP7t/ACplzYezN59C+2uhJ2PAA
 IQuWIK0O0rFT8Wwr5GwVNPM2oilMBYk6fH8vLXrd65QZXJyKYPGSCawfu2E0MBAXfwXC
 YXkzkpbLa420PGNHgyei2+cMh3bFUB0m3rXg+ZaWIKXOcnzQDiMthaSE7mKZ49xuQBtY
 HAqtJ/HFeDQ8xrGEnYdSUiuy/3Vu3/D72iDaCytaKJuXwkr/pC1hT7bMg804KGigDLnG
 ZgTSF517NYQzSG9eOLPxKVIfy5bPxD2E0sdzsdrrdIekSuyxKJIdoTk8FLxpuwdDND+y
 iH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXPP/ibbqT6bvyovw9rkEa7JaWO/L2n8T1eEmEgt6VI=;
 b=VO3n5uEAQv5aijTpZY4TZn2iYA2CX5tP3LTM19TBooBoo4T4y0KzLjpjeuEVLQBr06
 TsxdwvtJc162PytAMgq1VwcWXPP7U78IIfm2yDqv6Tj+T44+nfMoELgModneQEAl8vmD
 an3YCCX07njGi5lftGOi0F1ERqEzqF3P8ffLVJzpRaQJEleeqKk0Vux+b2BhFdnWhhz/
 HLRKr/XXffPae+KJfLnJG4BzbYFC8wB+XlW3L38/t4mEk6LjMYFbgW4AYwIbzi2M0/2t
 CzYnfN3c2s44NBtpaFCkr1m/BU69Cabxv4qnW9jhGrgsvGwNVePD2yScc43uSIeS7JBJ
 wT2w==
X-Gm-Message-State: AOAM531XwLRA0v4WTlXb6n5+zBmwSqaNWVTHkMsq/gO9DYu7XX8xbjOO
 ZhWyriwL2bbiRVlU1H/PuZzvfHCX
X-Google-Smtp-Source: ABdhPJw7lbCgxvn8kVHF3dCtJZLjF9CS/Dx6ypLdd4UK7tmEppeKkgVpYCHnZwAIOjo4PZBgdF53qQ==
X-Received: by 2002:ac8:100b:: with SMTP id z11mr24141443qti.157.1591036201442; 
 Mon, 01 Jun 2020 11:30:01 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:30:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 191/207] drm/amd/display: Add DCN3 DML
Date: Mon,  1 Jun 2020 14:29:10 -0400
Message-Id: <20200601182926.1267958-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182926.1267958-1-alexander.deucher@amd.com>
References: <20200601182926.1267958-1-alexander.deucher@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Add support for DML(Display mode library) for bandwidth calculations

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |    7 +
 .../dc/dml/dcn30/display_mode_vba_30.c        | 6860 +++++++++++++++++
 .../dc/dml/dcn30/display_mode_vba_30.h        |   43 +
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 1868 +++++
 .../dc/dml/dcn30/display_rq_dlg_calc_30.h     |   69 +
 .../drm/amd/display/dc/dml/display_mode_lib.c |  181 +
 .../drm/amd/display/dc/dml/display_mode_lib.h |   11 +
 .../amd/display/dc/dml/display_mode_structs.h |    3 +
 .../drm/amd/display/dc/dml/display_mode_vba.c |    3 +
 .../drm/amd/display/dc/dml/display_mode_vba.h |    3 +
 10 files changed, 9048 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index e34c3376efc1..417331438c30 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -61,6 +61,10 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
 endif
+ifdef CONFIG_DRM_AMD_DC_DCN3_0
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
+endif
 CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
 
@@ -72,6 +76,9 @@ DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
 endif
 
+ifdef CONFIG_DRM_AMD_DC_DCN3_0
+DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
+endif
 
 AMD_DAL_DML = $(addprefix $(AMDDALPATH)/dc/dml/,$(DML))
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
new file mode 100644
index 000000000000..65da6304d6a6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -0,0 +1,6860 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+#include "dc.h"
+#include "dc_link.h"
+#include "../display_mode_lib.h"
+#include "display_mode_vba_30.h"
+#include "../dml_inline_defs.h"
+
+
+/*
+ * NOTE:
+ *   This file is gcc-parsable HW gospel, coming straight from HW engineers.
+ *
+ * It doesn't adhere to Linux kernel style and sometimes will do things in odd
+ * ways. Unless there is something clearly wrong with it the code should
+ * remain as-is as it provides us with a guarantee from HW that it is correct.
+ */
+
+
+typedef struct {
+	double DPPCLK;
+	double DISPCLK;
+	double PixelClock;
+	double DCFCLKDeepSleep;
+	unsigned int DPPPerPlane;
+	bool ScalerEnabled;
+	enum scan_direction_class SourceScan;
+	unsigned int BlockWidth256BytesY;
+	unsigned int BlockHeight256BytesY;
+	unsigned int BlockWidth256BytesC;
+	unsigned int BlockHeight256BytesC;
+	unsigned int InterlaceEnable;
+	unsigned int NumberOfCursors;
+	unsigned int VBlank;
+	unsigned int HTotal;
+	unsigned int DCCEnable;
+	bool ODMCombineEnabled;
+} Pipe;
+
+#define BPP_INVALID 0
+#define BPP_BLENDED_PIPE 0xffffffff
+
+static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
+static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
+		struct display_mode_lib *mode_lib);
+static unsigned int dscceComputeDelay(
+		unsigned int bpc,
+		double BPP,
+		unsigned int sliceWidth,
+		unsigned int numSlices,
+		enum output_format_class pixelFormat,
+		enum output_encoder_class Output);
+static unsigned int dscComputeDelay(
+		enum output_format_class pixelFormat,
+		enum output_encoder_class Output);
+// Super monster function with some 45 argument
+static bool CalculatePrefetchSchedule(
+		struct display_mode_lib *mode_lib,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		Pipe *myPipe,
+		unsigned int DSCDelay,
+		double DPPCLKDelaySubtotalPlusCNVCFormater,
+		double DPPCLKDelaySCL,
+		double DPPCLKDelaySCLLBOnly,
+		double DPPCLKDelayCNVCCursor,
+		double DISPCLKDelaySubtotal,
+		unsigned int DPP_RECOUT_WIDTH,
+		enum output_format_class OutputFormat,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int VStartup,
+		unsigned int MaxVStartup,
+		unsigned int GPUVMPageTableLevels,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		double HostVMMinPageSize,
+		bool DynamicMetadataEnable,
+		bool DynamicMetadataVMEnabled,
+		int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int DynamicMetadataTransmittedBytes,
+		double UrgentLatency,
+		double UrgentExtraLatency,
+		double TCalc,
+		unsigned int PDEAndMetaPTEBytesFrame,
+		unsigned int MetaRowByte,
+		unsigned int PixelPTEBytesPerRow,
+		double PrefetchSourceLinesY,
+		unsigned int SwathWidthY,
+		int BytePerPixelY,
+		double VInitPreFillY,
+		unsigned int MaxNumSwathY,
+		double PrefetchSourceLinesC,
+		unsigned int SwathWidthC,
+		int BytePerPixelC,
+		double VInitPreFillC,
+		unsigned int MaxNumSwathC,
+		long swath_width_luma_ub,
+		long swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double TWait,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double *DSTXAfterScaler,
+		double *DSTYAfterScaler,
+		double *DestinationLinesForPrefetch,
+		double *PrefetchBandwidth,
+		double *DestinationLinesToRequestVMInVBlank,
+		double *DestinationLinesToRequestRowInVBlank,
+		double *VRatioPrefetchY,
+		double *VRatioPrefetchC,
+		double *RequiredPrefetchPixDataBWLuma,
+		double *RequiredPrefetchPixDataBWChroma,
+		bool *NotEnoughTimeForDynamicMetadata,
+		double *Tno_bw,
+		double *prefetch_vmrow_bw,
+		double *Tdmdl_vm,
+		double *Tdmdl,
+		unsigned int *VUpdateOffsetPix,
+		double *VUpdateWidthPix,
+		double *VReadyOffsetPix);
+static double RoundToDFSGranularityUp(double Clock, double VCOSpeed);
+static double RoundToDFSGranularityDown(double Clock, double VCOSpeed);
+static void CalculateDCCConfiguration(
+		bool DCCEnabled,
+		bool DCCProgrammingAssumesScanDirectionUnknown,
+		enum source_format_class SourcePixelFormat,
+		unsigned int ViewportWidthLuma,
+		unsigned int ViewportWidthChroma,
+		unsigned int ViewportHeightLuma,
+		unsigned int ViewportHeightChroma,
+		double DETBufferSize,
+		unsigned int RequestHeight256ByteLuma,
+		unsigned int RequestHeight256ByteChroma,
+		enum dm_swizzle_mode TilingFormat,
+		unsigned int BytePerPixelY,
+		unsigned int BytePerPixelC,
+		double BytePerPixelDETY,
+		double BytePerPixelDETC,
+		enum scan_direction_class ScanOrientation,
+		unsigned int *MaxUncompressedBlockLuma,
+		unsigned int *MaxUncompressedBlockChroma,
+		unsigned int *MaxCompressedBlockLuma,
+		unsigned int *MaxCompressedBlockChroma,
+		unsigned int *IndependentBlockLuma,
+		unsigned int *IndependentBlockChroma);
+static double CalculatePrefetchSourceLines(
+		struct display_mode_lib *mode_lib,
+		double VRatio,
+		double vtaps,
+		bool Interlace,
+		bool ProgressiveToInterlaceUnitInOPP,
+		unsigned int SwathHeight,
+		unsigned int ViewportYStart,
+		double *VInitPreFill,
+		unsigned int *MaxNumSwath);
+static unsigned int CalculateVMAndRowBytes(
+		struct display_mode_lib *mode_lib,
+		bool DCCEnable,
+		unsigned int BlockHeight256Bytes,
+		unsigned int BlockWidth256Bytes,
+		enum source_format_class SourcePixelFormat,
+		unsigned int SurfaceTiling,
+		unsigned int BytePerPixel,
+		enum scan_direction_class ScanDirection,
+		unsigned int SwathWidth,
+		unsigned int ViewportHeight,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMinPageSize,
+		unsigned int HostVMMinPageSize,
+		unsigned int PTEBufferSizeInRequests,
+		unsigned int Pitch,
+		unsigned int DCCMetaPitch,
+		unsigned int *MacroTileWidth,
+		unsigned int *MetaRowByte,
+		unsigned int *PixelPTEBytesPerRow,
+		bool *PTEBufferSizeNotExceeded,
+		unsigned int *dpte_row_width_ub,
+		unsigned int *dpte_row_height,
+		unsigned int *MetaRequestWidth,
+		unsigned int *MetaRequestHeight,
+		unsigned int *meta_row_width,
+		unsigned int *meta_row_height,
+		unsigned int *vm_group_bytes,
+		unsigned int *dpte_group_bytes,
+		unsigned int *PixelPTEReqWidth,
+		unsigned int *PixelPTEReqHeight,
+		unsigned int *PTERequestSize,
+		unsigned int *DPDE0BytesFrame,
+		unsigned int *MetaPTEBytesFrame);
+static double CalculateTWait(
+		unsigned int PrefetchMode,
+		double DRAMClockChangeLatency,
+		double UrgentLatency,
+		double SREnterPlusExitTime);
+static void CalculateRowBandwidth(
+		bool GPUVMEnable,
+		enum source_format_class SourcePixelFormat,
+		double VRatio,
+		double VRatioChroma,
+		bool DCCEnable,
+		double LineTime,
+		unsigned int MetaRowByteLuma,
+		unsigned int MetaRowByteChroma,
+		unsigned int meta_row_height_luma,
+		unsigned int meta_row_height_chroma,
+		unsigned int PixelPTEBytesPerRowLuma,
+		unsigned int PixelPTEBytesPerRowChroma,
+		unsigned int dpte_row_height_luma,
+		unsigned int dpte_row_height_chroma,
+		double *meta_row_bw,
+		double *dpte_row_bw);
+static void CalculateFlipSchedule(
+		struct display_mode_lib *mode_lib,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double UrgentExtraLatency,
+		double UrgentLatency,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool GPUVMEnable,
+		double HostVMMinPageSize,
+		double PDEAndMetaPTEBytesPerFrame,
+		double MetaRowBytes,
+		double DPTEBytesPerRow,
+		double BandwidthAvailableForImmediateFlip,
+		unsigned int TotImmediateFlipBytes,
+		enum source_format_class SourcePixelFormat,
+		double LineTime,
+		double VRatio,
+		double VRatioChroma,
+		double Tno_bw,
+		bool DCCEnable,
+		unsigned int dpte_row_height,
+		unsigned int meta_row_height,
+		unsigned int dpte_row_height_chroma,
+		unsigned int meta_row_height_chroma,
+		double *DestinationLinesToRequestVMInImmediateFlip,
+		double *DestinationLinesToRequestRowInImmediateFlip,
+		double *final_flip_bw,
+		bool *ImmediateFlipSupportedForPipe);
+static double CalculateWriteBackDelay(
+		enum source_format_class WritebackPixelFormat,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackVTaps,
+		long WritebackDestinationWidth,
+		long WritebackDestinationHeight,
+		long WritebackSourceHeight,
+		unsigned int HTotal);
+static void CalculateDynamicMetadataParameters(
+		int MaxInterDCNTileRepeaters,
+		double DPPCLK,
+		double DISPCLK,
+		double DCFClkDeepSleep,
+		double PixelClock,
+		long HTotal,
+		long VBlank,
+		long DynamicMetadataTransmittedBytes,
+		long DynamicMetadataLinesBeforeActiveRequired,
+		int InterlaceEnable,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double *Tsetup,
+		double *Tdmbf,
+		double *Tdmec,
+		double *Tdmsks);
+static void CalculateWatermarksAndDRAMSpeedChangeSupport(
+		struct display_mode_lib *mode_lib,
+		unsigned int PrefetchMode,
+		unsigned int NumberOfActivePlanes,
+		unsigned int MaxLineBufferLines,
+		unsigned int LineBufferSize,
+		unsigned int DPPOutputBufferPixels,
+		double DETBufferSizeInKByte,
+		unsigned int WritebackInterfaceBufferSize,
+		double DCFCLK,
+		double ReturnBW,
+		bool GPUVMEnable,
+		unsigned int dpte_group_bytes[],
+		unsigned int MetaChunkSize,
+		double UrgentLatency,
+		double ExtraLatency,
+		double WritebackLatency,
+		double WritebackChunkSize,
+		double SOCCLK,
+		double DRAMClockChangeLatency,
+		double SRExitTime,
+		double SREnterPlusExitTime,
+		double DCFCLKDeepSleep,
+		unsigned int DPPPerPlane[],
+		bool DCCEnable[],
+		double DPPCLK[],
+		double DETBufferSizeY[],
+		double DETBufferSizeC[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int LBBitPerPixel[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int vtaps[],
+		unsigned int VTAPsChroma[],
+		double VRatio[],
+		double VRatioChroma[],
+		unsigned int HTotal[],
+		double PixelClock[],
+		unsigned int BlendingAndTiming[],
+		double BytePerPixelDETY[],
+		double BytePerPixelDETC[],
+		double DSTXAfterScaler[],
+		double DSTYAfterScaler[],
+		bool WritebackEnable[],
+		enum source_format_class WritebackPixelFormat[],
+		double WritebackDestinationWidth[],
+		double WritebackDestinationHeight[],
+		double WritebackSourceHeight[],
+		enum clock_change_support *DRAMClockChangeSupport,
+		double *UrgentWatermark,
+		double *WritebackUrgentWatermark,
+		double *DRAMClockChangeWatermark,
+		double *WritebackDRAMClockChangeWatermark,
+		double *StutterExitWatermark,
+		double *StutterEnterPlusExitWatermark,
+		double *MinActiveDRAMClockChangeLatencySupported);
+static void CalculateDCFCLKDeepSleep(
+		struct display_mode_lib *mode_lib,
+		unsigned int NumberOfActivePlanes,
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		double VRatio[],
+		double VRatioChroma[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		unsigned int DPPPerPlane[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double DPPCLK[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		int ReturnBusWidth,
+		double *DCFCLKDeepSleep);
+static void CalculateUrgentBurstFactor(
+		long swath_width_luma_ub,
+		long swath_width_chroma_ub,
+		unsigned int DETBufferSizeInKByte,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double LineTime,
+		double UrgentLatency,
+		double CursorBufferSize,
+		unsigned int CursorWidth,
+		unsigned int CursorBPP,
+		double VRatio,
+		double VRatioC,
+		double BytePerPixelInDETY,
+		double BytePerPixelInDETC,
+		double DETBufferSizeY,
+		double DETBufferSizeC,
+		double *UrgentBurstFactorCursor,
+		double *UrgentBurstFactorLuma,
+		double *UrgentBurstFactorChroma,
+		bool *NotEnoughUrgentLatencyHiding);
+
+static void UseMinimumDCFCLK(
+		struct display_mode_lib *mode_lib,
+		int MaxInterDCNTileRepeaters,
+		int MaxPrefetchMode,
+		double FinalDRAMClockChangeLatency,
+		double SREnterPlusExitTime,
+		int ReturnBusWidth,
+		int RoundTripPingLatencyCycles,
+		int ReorderingBytes,
+		int PixelChunkSizeInKByte,
+		int MetaChunkSize,
+		bool GPUVMEnable,
+		int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels,
+		bool DynamicMetadataVMEnabled,
+		enum immediate_flip_requirement ImmediateFlipRequirement,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
+		int VTotal[],
+		int VActive[],
+		int DynamicMetadataTransmittedBytes[],
+		int DynamicMetadataLinesBeforeActiveRequired[],
+		bool Interlace[],
+		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
+		double RequiredDISPCLK[][2],
+		double UrgLatency[],
+		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
+		double ProjectedDCFCLKDeepSleep[][2],
+		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
+		double TotalVActivePixelBandwidth[][2],
+		double TotalVActiveCursorBandwidth[][2],
+		double TotalMetaRowBandwidth[][2],
+		double TotalDPTERowBandwidth[][2],
+		unsigned int TotalNumberOfActiveDPP[][2],
+		unsigned int TotalNumberOfDCCActiveDPP[][2],
+		int dpte_group_bytes[],
+		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
+		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
+		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		int HTotal[],
+		double PixelClock[],
+		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
+		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
+		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
+		bool DynamicMetadataEnable[],
+		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
+		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double DCFCLKPerState[],
+		double DCFCLKState[][2]);
+static void CalculatePixelDeliveryTimes(
+		unsigned int NumberOfActivePlanes,
+		double VRatio[],
+		double VRatioChroma[],
+		double VRatioPrefetchY[],
+		double VRatioPrefetchC[],
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[],
+		unsigned int DPPPerPlane[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double DPPCLK[],
+		int BytePerPixelC[],
+		enum scan_direction_class SourceScan[],
+		unsigned int NumberOfCursors[],
+		unsigned int CursorWidth[][2],
+		unsigned int CursorBPP[][2],
+		unsigned int BlockWidth256BytesY[],
+		unsigned int BlockHeight256BytesY[],
+		unsigned int BlockWidth256BytesC[],
+		unsigned int BlockHeight256BytesC[],
+		double DisplayPipeLineDeliveryTimeLuma[],
+		double DisplayPipeLineDeliveryTimeChroma[],
+		double DisplayPipeLineDeliveryTimeLumaPrefetch[],
+		double DisplayPipeLineDeliveryTimeChromaPrefetch[],
+		double DisplayPipeRequestDeliveryTimeLuma[],
+		double DisplayPipeRequestDeliveryTimeChroma[],
+		double DisplayPipeRequestDeliveryTimeLumaPrefetch[],
+		double DisplayPipeRequestDeliveryTimeChromaPrefetch[],
+		double CursorRequestDeliveryTime[],
+		double CursorRequestDeliveryTimePrefetch[]);
+
+static void CalculateMetaAndPTETimes(
+		int NumberOfActivePlanes,
+		bool GPUVMEnable,
+		int MetaChunkSize,
+		int MinMetaChunkSizeBytes,
+		int HTotal[],
+		double VRatio[],
+		double VRatioChroma[],
+		double DestinationLinesToRequestRowInVBlank[],
+		double DestinationLinesToRequestRowInImmediateFlip[],
+		bool DCCEnable[],
+		double PixelClock[],
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		enum scan_direction_class SourceScan[],
+		int dpte_row_height[],
+		int dpte_row_height_chroma[],
+		int meta_row_width[],
+		int meta_row_width_chroma[],
+		int meta_row_height[],
+		int meta_row_height_chroma[],
+		int meta_req_width[],
+		int meta_req_width_chroma[],
+		int meta_req_height[],
+		int meta_req_height_chroma[],
+		int dpte_group_bytes[],
+		int PTERequestSizeY[],
+		int PTERequestSizeC[],
+		int PixelPTEReqWidthY[],
+		int PixelPTEReqHeightY[],
+		int PixelPTEReqWidthC[],
+		int PixelPTEReqHeightC[],
+		int dpte_row_width_luma_ub[],
+		int dpte_row_width_chroma_ub[],
+		double DST_Y_PER_PTE_ROW_NOM_L[],
+		double DST_Y_PER_PTE_ROW_NOM_C[],
+		double DST_Y_PER_META_ROW_NOM_L[],
+		double DST_Y_PER_META_ROW_NOM_C[],
+		double TimePerMetaChunkNominal[],
+		double TimePerChromaMetaChunkNominal[],
+		double TimePerMetaChunkVBlank[],
+		double TimePerChromaMetaChunkVBlank[],
+		double TimePerMetaChunkFlip[],
+		double TimePerChromaMetaChunkFlip[],
+		double time_per_pte_group_nom_luma[],
+		double time_per_pte_group_vblank_luma[],
+		double time_per_pte_group_flip_luma[],
+		double time_per_pte_group_nom_chroma[],
+		double time_per_pte_group_vblank_chroma[],
+		double time_per_pte_group_flip_chroma[]);
+
+static void CalculateVMGroupAndRequestTimes(
+		unsigned int NumberOfActivePlanes,
+		bool GPUVMEnable,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int HTotal[],
+		int BytePerPixelC[],
+		double DestinationLinesToRequestVMInVBlank[],
+		double DestinationLinesToRequestVMInImmediateFlip[],
+		bool DCCEnable[],
+		double PixelClock[],
+		int dpte_row_width_luma_ub[],
+		int dpte_row_width_chroma_ub[],
+		int vm_group_bytes[],
+		unsigned int dpde0_bytes_per_frame_ub_l[],
+		unsigned int dpde0_bytes_per_frame_ub_c[],
+		int meta_pte_bytes_per_frame_ub_l[],
+		int meta_pte_bytes_per_frame_ub_c[],
+		double TimePerVMGroupVBlank[],
+		double TimePerVMGroupFlip[],
+		double TimePerVMRequestVBlank[],
+		double TimePerVMRequestFlip[]);
+
+static void CalculateStutterEfficiency(
+		int NumberOfActivePlanes,
+		long ROBBufferSizeInKByte,
+		double TotalDataReadBandwidth,
+		double DCFCLK,
+		double ReturnBW,
+		double SRExitTime,
+		bool SynchronizedVBlank,
+		int DPPPerPlane[],
+		double DETBufferSizeY[],
+		int BytePerPixelY[],
+		double BytePerPixelDETY[],
+		double SwathWidthY[],
+		int SwathHeightY[],
+		int SwathHeightC[],
+		double DCCRateLuma[],
+		double DCCRateChroma[],
+		int HTotal[],
+		int VTotal[],
+		double PixelClock[],
+		double VRatio[],
+		enum scan_direction_class SourceScan[],
+		int BlockHeight256BytesY[],
+		int BlockWidth256BytesY[],
+		int BlockHeight256BytesC[],
+		int BlockWidth256BytesC[],
+		int DCCYMaxUncompressedBlock[],
+		int DCCCMaxUncompressedBlock[],
+		int VActive[],
+		bool DCCEnable[],
+		bool WritebackEnable[],
+		double ReadBandwidthPlaneLuma[],
+		double ReadBandwidthPlaneChroma[],
+		double meta_row_bw[],
+		double dpte_row_bw[],
+		double *StutterEfficiencyNotIncludingVBlank,
+		double *StutterEfficiency);
+
+static void CalculateSwathAndDETConfiguration(
+		bool ForceSingleDPP,
+		int NumberOfActivePlanes,
+		long DETBufferSizeInKByte,
+		double MaximumSwathWidthLuma[],
+		double MaximumSwathWidthChroma[],
+		enum scan_direction_class SourceScan[],
+		enum source_format_class SourcePixelFormat[],
+		enum dm_swizzle_mode SurfaceTiling[],
+		int ViewportWidth[],
+		int ViewportHeight[],
+		int SurfaceWidthY[],
+		int SurfaceWidthC[],
+		int SurfaceHeightY[],
+		int SurfaceHeightC[],
+		int Read256BytesBlockHeightY[],
+		int Read256BytesBlockHeightC[],
+		int Read256BytesBlockWidthY[],
+		int Read256BytesBlockWidthC[],
+		enum odm_combine_mode ODMCombineEnabled[],
+		int BlendingAndTiming[],
+		int BytePerPixY[],
+		int BytePerPixC[],
+		double BytePerPixDETY[],
+		double BytePerPixDETC[],
+		int HActive[],
+		double HRatio[],
+		double HRatioChroma[],
+		int DPPPerPlane[],
+		int swath_width_luma_ub[],
+		int swath_width_chroma_ub[],
+		double SwathWidth[],
+		double SwathWidthChroma[],
+		int SwathHeightY[],
+		int SwathHeightC[],
+		double DETBufferSizeY[],
+		double DETBufferSizeC[],
+		bool ViewportSizeSupportPerPlane[],
+		bool *ViewportSizeSupport);
+static void CalculateSwathWidth(
+		bool ForceSingleDPP,
+		int NumberOfActivePlanes,
+		enum source_format_class SourcePixelFormat[],
+		enum scan_direction_class SourceScan[],
+		unsigned int ViewportWidth[],
+		unsigned int ViewportHeight[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		enum odm_combine_mode ODMCombineEnabled[],
+		int BytePerPixY[],
+		int BytePerPixC[],
+		int Read256BytesBlockHeightY[],
+		int Read256BytesBlockHeightC[],
+		int Read256BytesBlockWidthY[],
+		int Read256BytesBlockWidthC[],
+		int BlendingAndTiming[],
+		unsigned int HActive[],
+		double HRatio[],
+		int DPPPerPlane[],
+		double SwathWidthSingleDPPY[],
+		double SwathWidthSingleDPPC[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		int MaximumSwathHeightY[],
+		int MaximumSwathHeightC[],
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[]);
+static double CalculateExtraLatency(
+		long RoundTripPingLatencyCycles,
+		long ReorderingBytes,
+		double DCFCLK,
+		int TotalNumberOfActiveDPP,
+		int PixelChunkSizeInKByte,
+		int TotalNumberOfDCCActiveDPP,
+		int MetaChunkSize,
+		double ReturnBW,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		int NumberOfDPP[],
+		int dpte_group_bytes[],
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels);
+static double CalculateExtraLatencyBytes(
+		long ReorderingBytes,
+		int TotalNumberOfActiveDPP,
+		int PixelChunkSizeInKByte,
+		int TotalNumberOfDCCActiveDPP,
+		int MetaChunkSize,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		int NumberOfDPP[],
+		int dpte_group_bytes[],
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels);
+static double CalculateUrgentLatency(
+		double UrgentLatencyPixelDataOnly,
+		double UrgentLatencyPixelMixedWithVMData,
+		double UrgentLatencyVMDataOnly,
+		bool DoUrgentLatencyAdjustment,
+		double UrgentLatencyAdjustmentFabricClockComponent,
+		double UrgentLatencyAdjustmentFabricClockReference,
+		double FabricClockSingle);
+
+static bool CalculateBytePerPixelAnd256BBlockSizes(
+		enum source_format_class SourcePixelFormat,
+		enum dm_swizzle_mode SurfaceTiling,
+		unsigned int *BytePerPixelY,
+		unsigned int *BytePerPixelC,
+		double       *BytePerPixelDETY,
+		double       *BytePerPixelDETC,
+		unsigned int *BlockHeight256BytesY,
+		unsigned int *BlockHeight256BytesC,
+		unsigned int *BlockWidth256BytesY,
+		unsigned int *BlockWidth256BytesC);
+
+void dml30_recalculate(struct display_mode_lib *mode_lib)
+{
+	ModeSupportAndSystemConfiguration(mode_lib);
+	PixelClockAdjustmentForProgressiveToInterlaceUnit(mode_lib);
+	DisplayPipeConfiguration(mode_lib);
+	DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(mode_lib);
+}
+
+static unsigned int dscceComputeDelay(
+		unsigned int bpc,
+		double BPP,
+		unsigned int sliceWidth,
+		unsigned int numSlices,
+		enum output_format_class pixelFormat,
+		enum output_encoder_class Output)
+{
+	// valid bpc         = source bits per component in the set of {8, 10, 12}
+	// valid bpp         = increments of 1/16 of a bit
+	//                    min = 6/7/8 in N420/N422/444, respectively
+	//                    max = such that compression is 1:1
+	//valid sliceWidth  = number of pixels per slice line, must be less than or equal to 5184/numSlices (or 4096/numSlices in 420 mode)
+	//valid numSlices   = number of slices in the horiziontal direction per DSC engine in the set of {1, 2, 3, 4}
+	//valid pixelFormat = pixel/color format in the set of {:N444_RGB, :S422, :N422, :N420}
+
+	// fixed value
+	unsigned int rcModelSize = 8192;
+
+	// N422/N420 operate at 2 pixels per clock
+	unsigned int pixelsPerClock, lstall, D, initalXmitDelay, w, s, ix, wx, P, l0, a, ax, L,
+			Delay, pixels;
+
+	if (pixelFormat == dm_420)
+		pixelsPerClock = 2;
+	// #all other modes operate at 1 pixel per clock
+	else if (pixelFormat == dm_444)
+		pixelsPerClock = 1;
+	else if (pixelFormat == dm_n422)
+		pixelsPerClock = 2;
+	else
+		pixelsPerClock = 1;
+
+	//initial transmit delay as per PPS
+	initalXmitDelay = dml_round(rcModelSize / 2.0 / BPP / pixelsPerClock);
+
+	//compute ssm delay
+	if (bpc == 8)
+		D = 81;
+	else if (bpc == 10)
+		D = 89;
+	else
+		D = 113;
+
+	//divide by pixel per cycle to compute slice width as seen by DSC
+	w = sliceWidth / pixelsPerClock;
+
+	//422 mode has an additional cycle of delay
+	if (pixelFormat == dm_420 || pixelFormat == dm_444 || pixelFormat == dm_n422)
+		s = 0;
+	else
+		s = 1;
+
+	//main calculation for the dscce
+	ix = initalXmitDelay + 45;
+	wx = (w + 2) / 3;
+	P = 3 * wx - w;
+	l0 = ix / w;
+	a = ix + P * l0;
+	ax = (a + 2) / 3 + D + 6 + 1;
+	L = (ax + wx - 1) / wx;
+	if ((ix % w) == 0 && P != 0)
+		lstall = 1;
+	else
+		lstall = 0;
+	Delay = L * wx * (numSlices - 1) + ax + s + lstall + 22;
+
+	//dsc processes 3 pixel containers per cycle and a container can contain 1 or 2 pixels
+	pixels = Delay * 3 * pixelsPerClock;
+	return pixels;
+}
+
+static unsigned int dscComputeDelay(enum output_format_class pixelFormat, enum output_encoder_class Output)
+{
+	unsigned int Delay = 0;
+
+	if (pixelFormat == dm_420) {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 0;
+		//   dscc - input deserializer
+		Delay = Delay + 3;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 2;
+		//   dscc - input cdc fifo
+		Delay = Delay + 12;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 13;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 7;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 3;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   sft
+		Delay = Delay + 1;
+	} else if (pixelFormat == dm_n422) {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 1;
+		//   dscc - input deserializer
+		Delay = Delay + 5;
+		//  dscc - input cdc fifo
+		Delay = Delay + 25;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 10;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   sft
+		Delay = Delay + 1;
+	}
+	else {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 0;
+		//   dscc - input deserializer
+		Delay = Delay + 3;
+		//   dscc - input cdc fifo
+		Delay = Delay + 12;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 7;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   sft
+		Delay = Delay + 1;
+	}
+
+	return Delay;
+}
+
+static bool CalculatePrefetchSchedule(
+		struct display_mode_lib *mode_lib,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		Pipe *myPipe,
+		unsigned int DSCDelay,
+		double DPPCLKDelaySubtotalPlusCNVCFormater,
+		double DPPCLKDelaySCL,
+		double DPPCLKDelaySCLLBOnly,
+		double DPPCLKDelayCNVCCursor,
+		double DISPCLKDelaySubtotal,
+		unsigned int DPP_RECOUT_WIDTH,
+		enum output_format_class OutputFormat,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int VStartup,
+		unsigned int MaxVStartup,
+		unsigned int GPUVMPageTableLevels,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		double HostVMMinPageSize,
+		bool DynamicMetadataEnable,
+		bool DynamicMetadataVMEnabled,
+		int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int DynamicMetadataTransmittedBytes,
+		double UrgentLatency,
+		double UrgentExtraLatency,
+		double TCalc,
+		unsigned int PDEAndMetaPTEBytesFrame,
+		unsigned int MetaRowByte,
+		unsigned int PixelPTEBytesPerRow,
+		double PrefetchSourceLinesY,
+		unsigned int SwathWidthY,
+		int BytePerPixelY,
+		double VInitPreFillY,
+		unsigned int MaxNumSwathY,
+		double PrefetchSourceLinesC,
+		unsigned int SwathWidthC,
+		int BytePerPixelC,
+		double VInitPreFillC,
+		unsigned int MaxNumSwathC,
+		long swath_width_luma_ub,
+		long swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double TWait,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double *DSTXAfterScaler,
+		double *DSTYAfterScaler,
+		double *DestinationLinesForPrefetch,
+		double *PrefetchBandwidth,
+		double *DestinationLinesToRequestVMInVBlank,
+		double *DestinationLinesToRequestRowInVBlank,
+		double *VRatioPrefetchY,
+		double *VRatioPrefetchC,
+		double *RequiredPrefetchPixDataBWLuma,
+		double *RequiredPrefetchPixDataBWChroma,
+		bool *NotEnoughTimeForDynamicMetadata,
+		double *Tno_bw,
+		double *prefetch_vmrow_bw,
+		double *Tdmdl_vm,
+		double *Tdmdl,
+		unsigned int *VUpdateOffsetPix,
+		double *VUpdateWidthPix,
+		double *VReadyOffsetPix)
+{
+	bool MyError = false;
+	unsigned int DPPCycles = 0, DISPCLKCycles = 0;
+	double DSTTotalPixelsAfterScaler = 0;
+	double LineTime = 0, Tsetup = 0;
+	double dst_y_prefetch_equ = 0;
+	double Tsw_oto = 0;
+	double prefetch_bw_oto = 0;
+	double Tvm_oto = 0;
+	double Tr0_oto = 0;
+	double Tvm_oto_lines = 0;
+	double Tr0_oto_lines = 0;
+	double dst_y_prefetch_oto = 0;
+	double TimeForFetchingMetaPTE = 0;
+	double TimeForFetchingRowInVBlank = 0;
+	double LinesToRequestPrefetchPixelData = 0;
+	double HostVMInefficiencyFactor = 0;
+	unsigned int HostVMDynamicLevelsTrips = 0;
+	double trip_to_mem = 0;
+	double Tvm_trips = 0;
+	double Tr0_trips = 0;
+	double Tvm_trips_rounded = 0;
+	double Tr0_trips_rounded = 0;
+	double Lsw_oto = 0;
+	double Tpre_rounded = 0;
+	double prefetch_bw_equ = 0;
+	double Tvm_equ = 0;
+	double Tr0_equ = 0;
+	double Tdmbf = 0;
+	double Tdmec = 0;
+	double Tdmsks = 0;
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		HostVMInefficiencyFactor = PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly;
+		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	} else {
+		HostVMInefficiencyFactor = 1;
+		HostVMDynamicLevelsTrips = 0;
+	}
+
+	CalculateDynamicMetadataParameters(
+			MaxInterDCNTileRepeaters,
+			myPipe->DPPCLK,
+			myPipe->DISPCLK,
+			myPipe->DCFCLKDeepSleep,
+			myPipe->PixelClock,
+			myPipe->HTotal,
+			myPipe->VBlank,
+			DynamicMetadataTransmittedBytes,
+			DynamicMetadataLinesBeforeActiveRequired,
+			myPipe->InterlaceEnable,
+			ProgressiveToInterlaceUnitInOPP,
+			&Tsetup,
+			&Tdmbf,
+			&Tdmec,
+			&Tdmsks);
+
+	LineTime = myPipe->HTotal / myPipe->PixelClock;
+	trip_to_mem = UrgentLatency;
+	Tvm_trips = UrgentExtraLatency + trip_to_mem * (GPUVMPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
+
+	if (DynamicMetadataVMEnabled == true && GPUVMEnable == true) {
+		*Tdmdl = TWait + Tvm_trips + trip_to_mem;
+	} else {
+		*Tdmdl = TWait + UrgentExtraLatency;
+	}
+
+	if (DynamicMetadataEnable == true) {
+		if (VStartup * LineTime < Tsetup + *Tdmdl + Tdmbf + Tdmec + Tdmsks) {
+			*NotEnoughTimeForDynamicMetadata = true;
+		} else {
+			*NotEnoughTimeForDynamicMetadata = false;
+			dml_print("DML: Not Enough Time for Dynamic Meta!\n");
+			dml_print("DML: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", Tdmbf);
+			dml_print("DML: Tdmec: %fus - time dio takes to transfer dmd\n", Tdmec);
+			dml_print("DML: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", Tdmsks);
+			dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", *Tdmdl);
+		}
+	} else {
+		*NotEnoughTimeForDynamicMetadata = false;
+	}
+
+	*Tdmdl_vm = (DynamicMetadataEnable == true && DynamicMetadataVMEnabled == true && GPUVMEnable == true ? TWait + Tvm_trips : 0);
+
+	if (myPipe->ScalerEnabled)
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCL;
+	else
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCLLBOnly;
+
+	DPPCycles = DPPCycles + myPipe->NumberOfCursors * DPPCLKDelayCNVCCursor;
+
+	DISPCLKCycles = DISPCLKDelaySubtotal;
+
+	if (myPipe->DPPCLK == 0.0 || myPipe->DISPCLK == 0.0)
+		return true;
+
+	*DSTXAfterScaler = DPPCycles * myPipe->PixelClock / myPipe->DPPCLK + DISPCLKCycles * myPipe->PixelClock / myPipe->DISPCLK
+			+ DSCDelay;
+
+	*DSTXAfterScaler = *DSTXAfterScaler + ((myPipe->ODMCombineEnabled)?18:0) + (myPipe->DPPPerPlane - 1) * DPP_RECOUT_WIDTH;
+
+	if (OutputFormat == dm_420 || (myPipe->InterlaceEnable && ProgressiveToInterlaceUnitInOPP))
+		*DSTYAfterScaler = 1;
+	else
+		*DSTYAfterScaler = 0;
+
+	DSTTotalPixelsAfterScaler = *DSTYAfterScaler * myPipe->HTotal + *DSTXAfterScaler;
+	*DSTYAfterScaler = dml_floor(DSTTotalPixelsAfterScaler / myPipe->HTotal, 1);
+	*DSTXAfterScaler = DSTTotalPixelsAfterScaler - ((double) (*DSTYAfterScaler * myPipe->HTotal));
+
+	MyError = false;
+
+
+	Tr0_trips = trip_to_mem * (HostVMDynamicLevelsTrips + 1);
+	Tvm_trips_rounded = dml_ceil(4.0 * Tvm_trips / LineTime, 1) / 4 * LineTime;
+	Tr0_trips_rounded = dml_ceil(4.0 * Tr0_trips / LineTime, 1) / 4 * LineTime;
+
+	if (GPUVMEnable) {
+		if (GPUVMPageTableLevels >= 3) {
+			*Tno_bw = UrgentExtraLatency + trip_to_mem * ((GPUVMPageTableLevels - 2) - 1);
+		} else
+			*Tno_bw = 0;
+	} else if (!myPipe->DCCEnable)
+		*Tno_bw = LineTime;
+	else
+		*Tno_bw = LineTime / 4;
+
+	dst_y_prefetch_equ = VStartup - (Tsetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime
+			- (*DSTYAfterScaler + *DSTXAfterScaler / myPipe->HTotal);
+
+	Lsw_oto = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC);
+	Tsw_oto = Lsw_oto * LineTime;
+
+	prefetch_bw_oto = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC) / Tsw_oto;
+
+	if (GPUVMEnable == true) {
+		Tvm_oto = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_oto,
+				Tvm_trips,
+				LineTime / 4.0);
+	} else
+		Tvm_oto = LineTime / 4.0;
+
+	if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+		Tr0_oto = dml_max3(
+				(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_oto,
+				LineTime - Tvm_oto, LineTime / 4);
+	} else
+		Tr0_oto = (LineTime - Tvm_oto) / 2.0;
+
+	Tvm_oto_lines = dml_ceil(4.0 * Tvm_oto / LineTime, 1) / 4.0;
+	Tr0_oto_lines = dml_ceil(4.0 * Tr0_oto / LineTime, 1) / 4.0;
+	dst_y_prefetch_oto = Tvm_oto_lines + 2 * Tr0_oto_lines + Lsw_oto;
+
+	dst_y_prefetch_equ = dml_floor(4.0 * (dst_y_prefetch_equ + 0.125), 1) / 4.0;
+	Tpre_rounded = dst_y_prefetch_equ * LineTime;
+
+	dml_print("DML: dst_y_prefetch_oto: %f\n", dst_y_prefetch_oto);
+	dml_print("DML: dst_y_prefetch_equ: %f\n", dst_y_prefetch_equ);
+
+	dml_print("DML: LineTime: %f\n", LineTime);
+	dml_print("DML: VStartup: %d\n", VStartup);
+	dml_print("DML: Tvstartup: %fus - time between vstartup and first pixel of active\n", VStartup * LineTime);
+	dml_print("DML: Tsetup: %fus - time from vstartup to vready\n", Tsetup);
+	dml_print("DML: TCalc: %fus - time for calculations in dchub starting at vready\n", TCalc);
+	dml_print("DML: TWait: %fus - time for fabric to become ready max(pstate exit,cstate enter/exit, urgent latency) after TCalc\n", TWait);
+	dml_print("DML: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", Tdmbf);
+	dml_print("DML: Tdmec: %fus - time dio takes to transfer dmd\n", Tdmec);
+	dml_print("DML: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", Tdmsks);
+	dml_print("DML: Tdmdl_vm: %fus - time for vm stages of dmd \n", *Tdmdl_vm);
+	dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", *Tdmdl);
+	dml_print("DML: dst_x_after_scl: %f pixels - number of pixel clocks pipeline and buffer delay after scaler \n", *DSTXAfterScaler);
+	dml_print("DML: dst_y_after_scl: %d lines - number of lines of pipeline and buffer delay after scaler \n", (int)*DSTYAfterScaler);
+
+	*PrefetchBandwidth = 0;
+	*DestinationLinesToRequestVMInVBlank = 0;
+	*DestinationLinesToRequestRowInVBlank = 0;
+	*VRatioPrefetchY = 0;
+	*VRatioPrefetchC = 0;
+	*RequiredPrefetchPixDataBWLuma = 0;
+	if (dst_y_prefetch_equ > 1) {
+		double PrefetchBandwidth1 = 0;
+		double PrefetchBandwidth2 = 0;
+		double PrefetchBandwidth3 = 0;
+		double PrefetchBandwidth4 = 0;
+
+		if (Tpre_rounded - *Tno_bw > 0)
+			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte
+					+ 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor
+					+ PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY
+					+ PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC)
+					/ (Tpre_rounded - *Tno_bw);
+		else
+			PrefetchBandwidth1 = 0;
+
+		if (VStartup == MaxVStartup && (PrefetchBandwidth1 > 4 * prefetch_bw_oto) && (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - *Tno_bw) > 0) {
+			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor) / (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - *Tno_bw);
+		}
+
+		if (Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded > 0)
+			PrefetchBandwidth2 = (PDEAndMetaPTEBytesFrame *
+					HostVMInefficiencyFactor + PrefetchSourceLinesY *
+					swath_width_luma_ub * BytePerPixelY +
+					PrefetchSourceLinesC * swath_width_chroma_ub *
+					BytePerPixelC) /
+					(Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded);
+		else
+			PrefetchBandwidth2 = 0;
+
+		if (Tpre_rounded - Tvm_trips_rounded > 0)
+			PrefetchBandwidth3 = (2 * MetaRowByte + 2 * PixelPTEBytesPerRow *
+					HostVMInefficiencyFactor + PrefetchSourceLinesY *
+					swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC *
+					swath_width_chroma_ub * BytePerPixelC) / (Tpre_rounded -
+					Tvm_trips_rounded);
+		else
+			PrefetchBandwidth3 = 0;
+
+		if (VStartup == MaxVStartup && (PrefetchBandwidth3 > 4 * prefetch_bw_oto) && Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - Tvm_trips_rounded > 0) {
+			PrefetchBandwidth3 = (2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor) / (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - Tvm_trips_rounded);
+		}
+
+		if (Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded > 0)
+			PrefetchBandwidth4 = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC)
+					/ (Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded);
+		else
+			PrefetchBandwidth4 = 0;
+
+		{
+			bool Case1OK;
+			bool Case2OK;
+			bool Case3OK;
+
+			if (PrefetchBandwidth1 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth1
+						>= Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth1 >= Tr0_trips_rounded) {
+					Case1OK = true;
+				} else {
+					Case1OK = false;
+				}
+			} else {
+				Case1OK = false;
+			}
+
+			if (PrefetchBandwidth2 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth2
+						>= Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth2 < Tr0_trips_rounded) {
+					Case2OK = true;
+				} else {
+					Case2OK = false;
+				}
+			} else {
+				Case2OK = false;
+			}
+
+			if (PrefetchBandwidth3 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth3
+						< Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth3 >= Tr0_trips_rounded) {
+					Case3OK = true;
+				} else {
+					Case3OK = false;
+				}
+			} else {
+				Case3OK = false;
+			}
+
+			if (Case1OK) {
+				prefetch_bw_equ = PrefetchBandwidth1;
+			} else if (Case2OK) {
+				prefetch_bw_equ = PrefetchBandwidth2;
+			} else if (Case3OK) {
+				prefetch_bw_equ = PrefetchBandwidth3;
+			} else {
+				prefetch_bw_equ = PrefetchBandwidth4;
+			}
+
+			dml_print("DML: prefetch_bw_equ: %f\n", prefetch_bw_equ);
+
+			if (prefetch_bw_equ > 0) {
+				if (GPUVMEnable == true) {
+					Tvm_equ = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_equ, Tvm_trips, LineTime / 4);
+				} else {
+					Tvm_equ = LineTime / 4;
+				}
+
+				if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+					Tr0_equ = dml_max4(
+							(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_equ,
+							Tr0_trips,
+							(LineTime - Tvm_equ) / 2,
+							LineTime / 4);
+				} else {
+					Tr0_equ = (LineTime - Tvm_equ) / 2;
+				}
+			} else {
+				Tvm_equ = 0;
+				Tr0_equ = 0;
+				dml_print("DML: prefetch_bw_equ equals 0! %s:%d\n", __FILE__, __LINE__);
+			}
+		}
+
+		if (dst_y_prefetch_oto < dst_y_prefetch_equ) {
+			*DestinationLinesForPrefetch = dst_y_prefetch_oto;
+			TimeForFetchingMetaPTE = Tvm_oto;
+			TimeForFetchingRowInVBlank = Tr0_oto;
+			*PrefetchBandwidth = prefetch_bw_oto;
+		} else {
+			*DestinationLinesForPrefetch = dst_y_prefetch_equ;
+			TimeForFetchingMetaPTE = Tvm_equ;
+			TimeForFetchingRowInVBlank = Tr0_equ;
+			*PrefetchBandwidth = prefetch_bw_equ;
+		}
+
+		*DestinationLinesToRequestVMInVBlank = dml_ceil(4.0 * TimeForFetchingMetaPTE / LineTime, 1.0) / 4.0;
+
+		*DestinationLinesToRequestRowInVBlank = dml_ceil(4.0 * TimeForFetchingRowInVBlank / LineTime, 1.0) / 4.0;
+
+
+		LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch - *DestinationLinesToRequestVMInVBlank
+				- 2 * *DestinationLinesToRequestRowInVBlank;
+
+		if (LinesToRequestPrefetchPixelData > 0 && prefetch_bw_equ > 0) {
+
+			*VRatioPrefetchY = (double) PrefetchSourceLinesY
+					/ LinesToRequestPrefetchPixelData;
+			*VRatioPrefetchY = dml_max(*VRatioPrefetchY, 1.0);
+			if ((SwathHeightY > 4) && (VInitPreFillY > 3)) {
+				if (LinesToRequestPrefetchPixelData > (VInitPreFillY - 3.0) / 2.0) {
+					*VRatioPrefetchY = dml_max((double) PrefetchSourceLinesY / LinesToRequestPrefetchPixelData,
+						(double) MaxNumSwathY * SwathHeightY / (LinesToRequestPrefetchPixelData - (VInitPreFillY - 3.0) / 2.0));
+					*VRatioPrefetchY = dml_max(*VRatioPrefetchY, 1.0);
+				} else {
+					MyError = true;
+					dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+					*VRatioPrefetchY = 0;
+				}
+			}
+
+			*VRatioPrefetchC = (double) PrefetchSourceLinesC / LinesToRequestPrefetchPixelData;
+			*VRatioPrefetchC = dml_max(*VRatioPrefetchC, 1.0);
+
+			if ((SwathHeightC > 4)) {
+				if (LinesToRequestPrefetchPixelData > (VInitPreFillC - 3.0) / 2.0) {
+					*VRatioPrefetchC = dml_max(*VRatioPrefetchC,
+						(double) MaxNumSwathC * SwathHeightC / (LinesToRequestPrefetchPixelData - (VInitPreFillC - 3.0) / 2.0));
+					*VRatioPrefetchC = dml_max(*VRatioPrefetchC, 1.0);
+				} else {
+					MyError = true;
+					dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+					*VRatioPrefetchC = 0;
+				}
+			}
+
+			*RequiredPrefetchPixDataBWLuma = (double) PrefetchSourceLinesY / LinesToRequestPrefetchPixelData * BytePerPixelY * swath_width_luma_ub / LineTime;
+			*RequiredPrefetchPixDataBWChroma = (double) PrefetchSourceLinesC / LinesToRequestPrefetchPixelData * BytePerPixelC * swath_width_chroma_ub / LineTime;
+		} else {
+			MyError = true;
+			dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+			dml_print("DML: LinesToRequestPrefetchPixelData: %f, should be > 0\n", LinesToRequestPrefetchPixelData);
+			*VRatioPrefetchY = 0;
+			*VRatioPrefetchC = 0;
+			*RequiredPrefetchPixDataBWLuma = 0;
+			*RequiredPrefetchPixDataBWChroma = 0;
+		}
+
+		dml_print("DML: Tpre: %fus - sum of tim to request meta pte, 2 x data pte + meta data, swaths\n", (double)LinesToRequestPrefetchPixelData * LineTime + 2.0*TimeForFetchingRowInVBlank + TimeForFetchingMetaPTE);
+		dml_print("DML:  Tvm: %fus - time to fetch page tables for meta surface\n", TimeForFetchingMetaPTE);
+		dml_print("DML:  Tr0: %fus - time to fetch first row of data pagetables and first row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
+		dml_print("DML:  Tr1: %fus - time to fetch second row of data pagetables and second row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
+		dml_print("DML:  Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)LinesToRequestPrefetchPixelData * LineTime);
+		dml_print("DML: To: %fus - time for propogation from scaler to optc\n", (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
+		dml_print("DML: Tvstartup - Tsetup - Tcalc - Twait - Tpre - To > 0\n");
+		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank - (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - Tsetup);
+		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n", PixelPTEBytesPerRow);
+
+	} else {
+		MyError = true;
+		dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+	}
+
+	{
+		double prefetch_vm_bw = 0;
+		double prefetch_row_bw = 0;
+
+		if (PDEAndMetaPTEBytesFrame == 0) {
+			prefetch_vm_bw = 0;
+		} else if (*DestinationLinesToRequestVMInVBlank > 0) {
+			prefetch_vm_bw = PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / (*DestinationLinesToRequestVMInVBlank * LineTime);
+		} else {
+			prefetch_vm_bw = 0;
+			MyError = true;
+			dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+		}
+		if (MetaRowByte + PixelPTEBytesPerRow == 0) {
+			prefetch_row_bw = 0;
+		} else if (*DestinationLinesToRequestRowInVBlank > 0) {
+			prefetch_row_bw = (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInVBlank * LineTime);
+		} else {
+			prefetch_row_bw = 0;
+			MyError = true;
+			dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
+		}
+
+		*prefetch_vmrow_bw = dml_max(prefetch_vm_bw, prefetch_row_bw);
+	}
+
+	if (MyError) {
+		*PrefetchBandwidth = 0;
+		TimeForFetchingMetaPTE = 0;
+		TimeForFetchingRowInVBlank = 0;
+		*DestinationLinesToRequestVMInVBlank = 0;
+		*DestinationLinesToRequestRowInVBlank = 0;
+		*DestinationLinesForPrefetch = 0;
+		LinesToRequestPrefetchPixelData = 0;
+		*VRatioPrefetchY = 0;
+		*VRatioPrefetchC = 0;
+		*RequiredPrefetchPixDataBWLuma = 0;
+		*RequiredPrefetchPixDataBWChroma = 0;
+	}
+
+	return MyError;
+}
+
+static double RoundToDFSGranularityUp(double Clock, double VCOSpeed)
+{
+	return VCOSpeed * 4 / dml_floor(VCOSpeed * 4 / Clock, 1);
+}
+
+static double RoundToDFSGranularityDown(double Clock, double VCOSpeed)
+{
+	return VCOSpeed * 4 / dml_ceil(VCOSpeed * 4.0 / Clock, 1);
+}
+
+static void CalculateDCCConfiguration(
+		bool DCCEnabled,
+		bool DCCProgrammingAssumesScanDirectionUnknown,
+		enum source_format_class SourcePixelFormat,
+		unsigned int SurfaceWidthLuma,
+		unsigned int SurfaceWidthChroma,
+		unsigned int SurfaceHeightLuma,
+		unsigned int SurfaceHeightChroma,
+		double DETBufferSize,
+		unsigned int RequestHeight256ByteLuma,
+		unsigned int RequestHeight256ByteChroma,
+		enum dm_swizzle_mode TilingFormat,
+		unsigned int BytePerPixelY,
+		unsigned int BytePerPixelC,
+		double BytePerPixelDETY,
+		double BytePerPixelDETC,
+		enum scan_direction_class ScanOrientation,
+		unsigned int *MaxUncompressedBlockLuma,
+		unsigned int *MaxUncompressedBlockChroma,
+		unsigned int *MaxCompressedBlockLuma,
+		unsigned int *MaxCompressedBlockChroma,
+		unsigned int *IndependentBlockLuma,
+		unsigned int *IndependentBlockChroma)
+{
+	int yuv420 = 0;
+	int horz_div_l = 0;
+	int horz_div_c = 0;
+	int vert_div_l = 0;
+	int vert_div_c = 0;
+
+	int req128_horz_wc_l = 0;
+	int req128_horz_wc_c = 0;
+	int req128_vert_wc_l = 0;
+	int req128_vert_wc_c = 0;
+	int segment_order_horz_contiguous_luma = 0;
+	int segment_order_horz_contiguous_chroma = 0;
+	int segment_order_vert_contiguous_luma = 0;
+	int segment_order_vert_contiguous_chroma = 0;
+
+	long full_swath_bytes_horz_wc_l = 0;
+	long full_swath_bytes_horz_wc_c = 0;
+	long full_swath_bytes_vert_wc_l = 0;
+	long full_swath_bytes_vert_wc_c = 0;
+
+	long swath_buf_size = 0;
+	double detile_buf_vp_horz_limit = 0;
+	double detile_buf_vp_vert_limit = 0;
+
+	long MAS_vp_horz_limit = 0;
+	long MAS_vp_vert_limit = 0;
+	long max_vp_horz_width = 0;
+	long max_vp_vert_height = 0;
+	long eff_surf_width_l = 0;
+	long eff_surf_width_c = 0;
+	long eff_surf_height_l = 0;
+	long eff_surf_height_c = 0;
+
+	typedef enum {
+		REQ_256Bytes,
+		REQ_128BytesNonContiguous,
+		REQ_128BytesContiguous,
+		REQ_NA
+	} RequestType;
+
+	RequestType   RequestLuma;
+	RequestType   RequestChroma;
+
+	yuv420 = ((SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_420_12) ? 1 : 0);
+	horz_div_l = 1;
+	horz_div_c = 1;
+	vert_div_l = 1;
+	vert_div_c = 1;
+
+	if (BytePerPixelY == 1)
+		vert_div_l = 0;
+	if (BytePerPixelC == 1)
+		vert_div_c = 0;
+	if (BytePerPixelY == 8
+			&& (TilingFormat == dm_sw_64kb_s || TilingFormat == dm_sw_64kb_s_t
+					|| TilingFormat == dm_sw_64kb_s_x))
+		horz_div_l = 0;
+	if (BytePerPixelC == 8
+			&& (TilingFormat == dm_sw_64kb_s || TilingFormat == dm_sw_64kb_s_t
+					|| TilingFormat == dm_sw_64kb_s_x))
+		horz_div_c = 0;
+
+	if (BytePerPixelC == 0) {
+		swath_buf_size = DETBufferSize / 2 - 2 * 256;
+		detile_buf_vp_horz_limit = (double) swath_buf_size
+				/ ((double) RequestHeight256ByteLuma * BytePerPixelY
+						/ (1 + horz_div_l));
+		detile_buf_vp_vert_limit = (double) swath_buf_size
+				/ (256.0 / RequestHeight256ByteLuma / (1 + vert_div_l));
+	} else {
+		swath_buf_size = DETBufferSize / 2 - 2 * 2 * 256;
+		detile_buf_vp_horz_limit = (double) swath_buf_size
+				/ ((double) RequestHeight256ByteLuma * BytePerPixelY
+						/ (1 + horz_div_l)
+						+ (double) RequestHeight256ByteChroma
+								* BytePerPixelC / (1 + horz_div_c)
+								/ (1 + yuv420));
+		detile_buf_vp_vert_limit = (double) swath_buf_size
+				/ (256.0 / RequestHeight256ByteLuma / (1 + vert_div_l)
+						+ 256.0 / RequestHeight256ByteChroma
+								/ (1 + vert_div_c) / (1 + yuv420));
+	}
+
+	if (SourcePixelFormat == dm_420_10) {
+		detile_buf_vp_horz_limit = 1.5 * detile_buf_vp_horz_limit;
+		detile_buf_vp_vert_limit = 1.5 * detile_buf_vp_vert_limit;
+	}
+
+	detile_buf_vp_horz_limit = dml_floor(detile_buf_vp_horz_limit - 1, 16);
+	detile_buf_vp_vert_limit = dml_floor(detile_buf_vp_vert_limit - 1, 16);
+
+	MAS_vp_horz_limit = 5760;
+	MAS_vp_vert_limit = (BytePerPixelC > 0 ? 2880 : 5760);
+	max_vp_horz_width = dml_min((double) MAS_vp_horz_limit, detile_buf_vp_horz_limit);
+	max_vp_vert_height = dml_min((double) MAS_vp_vert_limit, detile_buf_vp_vert_limit);
+	eff_surf_width_l =
+			(SurfaceWidthLuma > max_vp_horz_width ? max_vp_horz_width : SurfaceWidthLuma);
+	eff_surf_width_c = eff_surf_width_l / (1 + yuv420);
+	eff_surf_height_l = (
+			SurfaceHeightLuma > max_vp_vert_height ?
+					max_vp_vert_height : SurfaceHeightLuma);
+	eff_surf_height_c = eff_surf_height_l / (1 + yuv420);
+
+	full_swath_bytes_horz_wc_l = eff_surf_width_l * RequestHeight256ByteLuma * BytePerPixelY;
+	full_swath_bytes_vert_wc_l = eff_surf_height_l * 256 / RequestHeight256ByteLuma;
+	if (BytePerPixelC > 0) {
+		full_swath_bytes_horz_wc_c = eff_surf_width_c * RequestHeight256ByteChroma
+				* BytePerPixelC;
+		full_swath_bytes_vert_wc_c = eff_surf_height_c * 256 / RequestHeight256ByteChroma;
+	} else {
+		full_swath_bytes_horz_wc_c = 0;
+		full_swath_bytes_vert_wc_c = 0;
+	}
+
+	if (SourcePixelFormat == dm_420_10) {
+		full_swath_bytes_horz_wc_l = dml_ceil(full_swath_bytes_horz_wc_l * 2 / 3, 256);
+		full_swath_bytes_horz_wc_c = dml_ceil(full_swath_bytes_horz_wc_c * 2 / 3, 256);
+		full_swath_bytes_vert_wc_l = dml_ceil(full_swath_bytes_vert_wc_l * 2 / 3, 256);
+		full_swath_bytes_vert_wc_c = dml_ceil(full_swath_bytes_vert_wc_c * 2 / 3, 256);
+	}
+
+	if (2 * full_swath_bytes_horz_wc_l + 2 * full_swath_bytes_horz_wc_c <= DETBufferSize) {
+		req128_horz_wc_l = 0;
+		req128_horz_wc_c = 0;
+	} else if (full_swath_bytes_horz_wc_l < 1.5 * full_swath_bytes_horz_wc_c
+			&& 2 * full_swath_bytes_horz_wc_l + full_swath_bytes_horz_wc_c
+					<= DETBufferSize) {
+		req128_horz_wc_l = 0;
+		req128_horz_wc_c = 1;
+	} else if (full_swath_bytes_horz_wc_l >= 1.5 * full_swath_bytes_horz_wc_c
+			&& full_swath_bytes_horz_wc_l + 2 * full_swath_bytes_horz_wc_c
+					<= DETBufferSize) {
+		req128_horz_wc_l = 1;
+		req128_horz_wc_c = 0;
+	} else {
+		req128_horz_wc_l = 1;
+		req128_horz_wc_c = 1;
+	}
+
+	if (2 * full_swath_bytes_vert_wc_l + 2 * full_swath_bytes_vert_wc_c <= DETBufferSize) {
+		req128_vert_wc_l = 0;
+		req128_vert_wc_c = 0;
+	} else if (full_swath_bytes_vert_wc_l < 1.5 * full_swath_bytes_vert_wc_c
+			&& 2 * full_swath_bytes_vert_wc_l + full_swath_bytes_vert_wc_c
+					<= DETBufferSize) {
+		req128_vert_wc_l = 0;
+		req128_vert_wc_c = 1;
+	} else if (full_swath_bytes_vert_wc_l >= 1.5 * full_swath_bytes_vert_wc_c
+			&& full_swath_bytes_vert_wc_l + 2 * full_swath_bytes_vert_wc_c
+					<= DETBufferSize) {
+		req128_vert_wc_l = 1;
+		req128_vert_wc_c = 0;
+	} else {
+		req128_vert_wc_l = 1;
+		req128_vert_wc_c = 1;
+	}
+
+	if (BytePerPixelY == 2 || (BytePerPixelY == 4 && TilingFormat != dm_sw_64kb_r_x)) {
+		segment_order_horz_contiguous_luma = 0;
+	} else {
+		segment_order_horz_contiguous_luma = 1;
+	}
+	if ((BytePerPixelY == 8
+			&& (TilingFormat == dm_sw_64kb_d || TilingFormat == dm_sw_64kb_d_x
+					|| TilingFormat == dm_sw_64kb_d_t
+					|| TilingFormat == dm_sw_64kb_r_x))
+			|| (BytePerPixelY == 4 && TilingFormat == dm_sw_64kb_r_x)) {
+		segment_order_vert_contiguous_luma = 0;
+	} else {
+		segment_order_vert_contiguous_luma = 1;
+	}
+	if (BytePerPixelC == 2 || (BytePerPixelC == 4 && TilingFormat != dm_sw_64kb_r_x)) {
+		segment_order_horz_contiguous_chroma = 0;
+	} else {
+		segment_order_horz_contiguous_chroma = 1;
+	}
+	if ((BytePerPixelC == 8
+			&& (TilingFormat == dm_sw_64kb_d || TilingFormat == dm_sw_64kb_d_x
+					|| TilingFormat == dm_sw_64kb_d_t
+					|| TilingFormat == dm_sw_64kb_r_x))
+			|| (BytePerPixelC == 4 && TilingFormat == dm_sw_64kb_r_x)) {
+		segment_order_vert_contiguous_chroma = 0;
+	} else {
+		segment_order_vert_contiguous_chroma = 1;
+	}
+
+	if (DCCProgrammingAssumesScanDirectionUnknown == true) {
+		if (req128_horz_wc_l == 0 && req128_vert_wc_l == 0) {
+			RequestLuma = REQ_256Bytes;
+		} else if ((req128_horz_wc_l == 1 && segment_order_horz_contiguous_luma == 0)
+				|| (req128_vert_wc_l == 1 && segment_order_vert_contiguous_luma == 0)) {
+			RequestLuma = REQ_128BytesNonContiguous;
+		} else {
+			RequestLuma = REQ_128BytesContiguous;
+		}
+		if (req128_horz_wc_c == 0 && req128_vert_wc_c == 0) {
+			RequestChroma = REQ_256Bytes;
+		} else if ((req128_horz_wc_c == 1 && segment_order_horz_contiguous_chroma == 0)
+				|| (req128_vert_wc_c == 1
+						&& segment_order_vert_contiguous_chroma == 0)) {
+			RequestChroma = REQ_128BytesNonContiguous;
+		} else {
+			RequestChroma = REQ_128BytesContiguous;
+		}
+	} else if (ScanOrientation != dm_vert) {
+		if (req128_horz_wc_l == 0) {
+			RequestLuma = REQ_256Bytes;
+		} else if (segment_order_horz_contiguous_luma == 0) {
+			RequestLuma = REQ_128BytesNonContiguous;
+		} else {
+			RequestLuma = REQ_128BytesContiguous;
+		}
+		if (req128_horz_wc_c == 0) {
+			RequestChroma = REQ_256Bytes;
+		} else if (segment_order_horz_contiguous_chroma == 0) {
+			RequestChroma = REQ_128BytesNonContiguous;
+		} else {
+			RequestChroma = REQ_128BytesContiguous;
+		}
+	} else {
+		if (req128_vert_wc_l == 0) {
+			RequestLuma = REQ_256Bytes;
+		} else if (segment_order_vert_contiguous_luma == 0) {
+			RequestLuma = REQ_128BytesNonContiguous;
+		} else {
+			RequestLuma = REQ_128BytesContiguous;
+		}
+		if (req128_vert_wc_c == 0) {
+			RequestChroma = REQ_256Bytes;
+		} else if (segment_order_vert_contiguous_chroma == 0) {
+			RequestChroma = REQ_128BytesNonContiguous;
+		} else {
+			RequestChroma = REQ_128BytesContiguous;
+		}
+	}
+
+	if (RequestLuma == REQ_256Bytes) {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 256;
+		*IndependentBlockLuma = 0;
+	} else if (RequestLuma == REQ_128BytesContiguous) {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 128;
+		*IndependentBlockLuma = 128;
+	} else {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 64;
+		*IndependentBlockLuma = 64;
+	}
+
+	if (RequestChroma == REQ_256Bytes) {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 256;
+		*IndependentBlockChroma = 0;
+	} else if (RequestChroma == REQ_128BytesContiguous) {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 128;
+		*IndependentBlockChroma = 128;
+	} else {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 64;
+		*IndependentBlockChroma = 64;
+	}
+
+	if (DCCEnabled != true || BytePerPixelC == 0) {
+		*MaxUncompressedBlockChroma = 0;
+		*MaxCompressedBlockChroma = 0;
+		*IndependentBlockChroma = 0;
+	}
+
+	if (DCCEnabled != true) {
+		*MaxUncompressedBlockLuma = 0;
+		*MaxCompressedBlockLuma = 0;
+		*IndependentBlockLuma = 0;
+	}
+}
+
+
+static double CalculatePrefetchSourceLines(
+		struct display_mode_lib *mode_lib,
+		double VRatio,
+		double vtaps,
+		bool Interlace,
+		bool ProgressiveToInterlaceUnitInOPP,
+		unsigned int SwathHeight,
+		unsigned int ViewportYStart,
+		double *VInitPreFill,
+		unsigned int *MaxNumSwath)
+{
+	unsigned int MaxPartialSwath = 0;
+
+	if (ProgressiveToInterlaceUnitInOPP)
+		*VInitPreFill = dml_floor((VRatio + vtaps + 1) / 2.0, 1);
+	else
+		*VInitPreFill = dml_floor((VRatio + vtaps + 1 + Interlace * 0.5 * VRatio) / 2.0, 1);
+
+	if (!mode_lib->vba.IgnoreViewportPositioning) {
+
+		*MaxNumSwath = dml_ceil((*VInitPreFill - 1.0) / SwathHeight, 1) + 1.0;
+
+		if (*VInitPreFill > 1.0)
+			MaxPartialSwath = (unsigned int) (*VInitPreFill - 2) % SwathHeight;
+		else
+			MaxPartialSwath = (unsigned int) (*VInitPreFill + SwathHeight - 2)
+					% SwathHeight;
+		MaxPartialSwath = dml_max(1U, MaxPartialSwath);
+
+	} else {
+
+		if (ViewportYStart != 0)
+			dml_print(
+					"WARNING DML: using viewport y position of 0 even though actual viewport y position is non-zero in prefetch source lines calculation\n");
+
+		*MaxNumSwath = dml_ceil(*VInitPreFill / SwathHeight, 1);
+
+		if (*VInitPreFill > 1.0)
+			MaxPartialSwath = (unsigned int) (*VInitPreFill - 1) % SwathHeight;
+		else
+			MaxPartialSwath = (unsigned int) (*VInitPreFill + SwathHeight - 1)
+					% SwathHeight;
+	}
+
+	return *MaxNumSwath * SwathHeight + MaxPartialSwath;
+}
+
+static unsigned int CalculateVMAndRowBytes(
+		struct display_mode_lib *mode_lib,
+		bool DCCEnable,
+		unsigned int BlockHeight256Bytes,
+		unsigned int BlockWidth256Bytes,
+		enum source_format_class SourcePixelFormat,
+		unsigned int SurfaceTiling,
+		unsigned int BytePerPixel,
+		enum scan_direction_class ScanDirection,
+		unsigned int SwathWidth,
+		unsigned int ViewportHeight,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMinPageSize,
+		unsigned int HostVMMinPageSize,
+		unsigned int PTEBufferSizeInRequests,
+		unsigned int Pitch,
+		unsigned int DCCMetaPitch,
+		unsigned int *MacroTileWidth,
+		unsigned int *MetaRowByte,
+		unsigned int *PixelPTEBytesPerRow,
+		bool *PTEBufferSizeNotExceeded,
+		unsigned int *dpte_row_width_ub,
+		unsigned int *dpte_row_height,
+		unsigned int *MetaRequestWidth,
+		unsigned int *MetaRequestHeight,
+		unsigned int *meta_row_width,
+		unsigned int *meta_row_height,
+		unsigned int *vm_group_bytes,
+		unsigned int *dpte_group_bytes,
+		unsigned int *PixelPTEReqWidth,
+		unsigned int *PixelPTEReqHeight,
+		unsigned int *PTERequestSize,
+		unsigned int *DPDE0BytesFrame,
+		unsigned int *MetaPTEBytesFrame)
+{
+	unsigned int MPDEBytesFrame = 0;
+	unsigned int DCCMetaSurfaceBytes = 0;
+	unsigned int MacroTileSizeBytes = 0;
+	unsigned int MacroTileHeight = 0;
+	unsigned int ExtraDPDEBytesFrame = 0;
+	unsigned int PDEAndMetaPTEBytesFrame = 0;
+	unsigned int PixelPTEReqHeightPTEs = 0;
+	unsigned int HostVMDynamicLevels = 0;
+
+	double FractionOfPTEReturnDrop;
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		if (HostVMMinPageSize < 2048) {
+			HostVMDynamicLevels = HostVMMaxNonCachedPageTableLevels;
+		} else if (HostVMMinPageSize >= 2048 && HostVMMinPageSize < 1048576) {
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 1);
+		} else {
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 2);
+		}
+	}
+
+	*MetaRequestHeight = 8 * BlockHeight256Bytes;
+	*MetaRequestWidth = 8 * BlockWidth256Bytes;
+	if (ScanDirection != dm_vert) {
+		*meta_row_height = *MetaRequestHeight;
+		*meta_row_width = dml_ceil((double) SwathWidth - 1, *MetaRequestWidth)
+				+ *MetaRequestWidth;
+		*MetaRowByte = *meta_row_width * *MetaRequestHeight * BytePerPixel / 256.0;
+	} else {
+		*meta_row_height = *MetaRequestWidth;
+		*meta_row_width = dml_ceil((double) SwathWidth - 1, *MetaRequestHeight)
+				+ *MetaRequestHeight;
+		*MetaRowByte = *meta_row_width * *MetaRequestWidth * BytePerPixel / 256.0;
+	}
+	DCCMetaSurfaceBytes = DCCMetaPitch * (dml_ceil(ViewportHeight - 1, 64 * BlockHeight256Bytes)
+					+ 64 * BlockHeight256Bytes) * BytePerPixel / 256;
+	if (GPUVMEnable == true) {
+		*MetaPTEBytesFrame = (dml_ceil((double) (DCCMetaSurfaceBytes - 4.0 * 1024.0) / (8 * 4.0 * 1024), 1) + 1) * 64;
+		MPDEBytesFrame = 128 * (mode_lib->vba.GPUVMMaxPageTableLevels - 1);
+	} else {
+		*MetaPTEBytesFrame = 0;
+		MPDEBytesFrame = 0;
+	}
+
+	if (DCCEnable != true) {
+		*MetaPTEBytesFrame = 0;
+		MPDEBytesFrame = 0;
+		*MetaRowByte = 0;
+	}
+
+	if (SurfaceTiling == dm_sw_linear) {
+		MacroTileSizeBytes = 256;
+		MacroTileHeight = BlockHeight256Bytes;
+	} else {
+		MacroTileSizeBytes = 65536;
+		MacroTileHeight = 16 * BlockHeight256Bytes;
+	}
+	*MacroTileWidth = MacroTileSizeBytes / BytePerPixel / MacroTileHeight;
+
+	if (GPUVMEnable == true && mode_lib->vba.GPUVMMaxPageTableLevels > 1) {
+		if (ScanDirection != dm_vert) {
+			*DPDE0BytesFrame = 64 * (dml_ceil(((Pitch * (dml_ceil(ViewportHeight - 1, MacroTileHeight) + MacroTileHeight) * BytePerPixel) - MacroTileSizeBytes) / (8 * 2097152), 1) + 1);
+		} else {
+			*DPDE0BytesFrame = 64 * (dml_ceil(((Pitch * (dml_ceil((double) SwathWidth - 1, MacroTileHeight) + MacroTileHeight) * BytePerPixel) - MacroTileSizeBytes) / (8 * 2097152), 1) + 1);
+		}
+		ExtraDPDEBytesFrame = 128 * (mode_lib->vba.GPUVMMaxPageTableLevels - 2);
+	} else {
+		*DPDE0BytesFrame = 0;
+		ExtraDPDEBytesFrame = 0;
+	}
+
+	PDEAndMetaPTEBytesFrame = *MetaPTEBytesFrame + MPDEBytesFrame + *DPDE0BytesFrame
+			+ ExtraDPDEBytesFrame;
+
+	if (HostVMEnable == true) {
+		PDEAndMetaPTEBytesFrame = PDEAndMetaPTEBytesFrame * (1 + 8 * HostVMDynamicLevels);
+	}
+
+	if (SurfaceTiling == dm_sw_linear) {
+		PixelPTEReqHeightPTEs = 1;
+		*PixelPTEReqHeight = 1;
+		*PixelPTEReqWidth = 32768.0 / BytePerPixel;
+		*PTERequestSize = 64;
+		FractionOfPTEReturnDrop = 0;
+	} else if (MacroTileSizeBytes == 4096) {
+		PixelPTEReqHeightPTEs = 1;
+		*PixelPTEReqHeight = MacroTileHeight;
+		*PixelPTEReqWidth = 8 * *MacroTileWidth;
+		*PTERequestSize = 64;
+		if (ScanDirection != dm_vert)
+			FractionOfPTEReturnDrop = 0;
+		else
+			FractionOfPTEReturnDrop = 7 / 8;
+	} else if (GPUVMMinPageSize == 4 && MacroTileSizeBytes > 4096) {
+		PixelPTEReqHeightPTEs = 16;
+		*PixelPTEReqHeight = 16 * BlockHeight256Bytes;
+		*PixelPTEReqWidth = 16 * BlockWidth256Bytes;
+		*PTERequestSize = 128;
+		FractionOfPTEReturnDrop = 0;
+	} else {
+		PixelPTEReqHeightPTEs = 1;
+		*PixelPTEReqHeight = MacroTileHeight;
+		*PixelPTEReqWidth = 8 * *MacroTileWidth;
+		*PTERequestSize = 64;
+		FractionOfPTEReturnDrop = 0;
+	}
+
+	if (SurfaceTiling == dm_sw_linear) {
+		*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
+		*dpte_row_width_ub = (dml_ceil(((double) SwathWidth - 1) / *PixelPTEReqWidth, 1) + 1) * *PixelPTEReqWidth;
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
+	} else if (ScanDirection != dm_vert) {
+		*dpte_row_height = *PixelPTEReqHeight;
+		*dpte_row_width_ub = (dml_ceil((double) (SwathWidth - 1) / *PixelPTEReqWidth, 1) + 1) * *PixelPTEReqWidth;
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
+	} else {
+		*dpte_row_height = dml_min(*PixelPTEReqWidth, *MacroTileWidth);
+		*dpte_row_width_ub = (dml_ceil((double) (SwathWidth - 1) / *PixelPTEReqHeight, 1) + 1) * *PixelPTEReqHeight;
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqHeight * *PTERequestSize;
+	}
+	if (*PixelPTEBytesPerRow * (1 - FractionOfPTEReturnDrop)
+			<= 64 * PTEBufferSizeInRequests) {
+		*PTEBufferSizeNotExceeded = true;
+	} else {
+		*PTEBufferSizeNotExceeded = false;
+	}
+
+	if (GPUVMEnable != true) {
+		*PixelPTEBytesPerRow = 0;
+		*PTEBufferSizeNotExceeded = true;
+	}
+	dml_print("DML: vm_bytes = meta_pte_bytes_per_frame (per_pipe) = MetaPTEBytesFrame = : %i\n", *MetaPTEBytesFrame);
+
+	if (HostVMEnable == true) {
+		*PixelPTEBytesPerRow = *PixelPTEBytesPerRow * (1 + 8 * HostVMDynamicLevels);
+	}
+
+	if (HostVMEnable == true) {
+		*vm_group_bytes = 512;
+		*dpte_group_bytes = 512;
+	} else if (GPUVMEnable == true) {
+		*vm_group_bytes = 2048;
+		if (SurfaceTiling != dm_sw_linear && PixelPTEReqHeightPTEs == 1 && ScanDirection == dm_vert) {
+			*dpte_group_bytes = 512;
+		} else {
+			*dpte_group_bytes = 2048;
+		}
+	} else {
+		*vm_group_bytes = 0;
+		*dpte_group_bytes = 0;
+	}
+
+	return PDEAndMetaPTEBytesFrame;
+}
+
+static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
+		struct display_mode_lib *mode_lib)
+{
+	struct vba_vars_st *v = &mode_lib->vba;
+	unsigned int j, k;
+	long ReorderBytes = 0;
+	unsigned int PrefetchMode = v->PrefetchModePerState[v->VoltageLevel][v->maxMpcComb];
+	double MaxTotalRDBandwidth = 0;
+	double MaxTotalRDBandwidthNoUrgentBurst = 0;
+	bool DestinationLineTimesForPrefetchLessThan2 = false;
+	bool VRatioPrefetchMoreThan4 = false;
+	double TWait;
+
+	v->WritebackDISPCLK = 0.0;
+	v->DISPCLKWithRamping = 0;
+	v->DISPCLKWithoutRamping = 0;
+	v->GlobalDPPCLK = 0.0;
+	/* DAL custom code: need to update ReturnBW in case min dcfclk is overriden */
+	v->IdealSDPPortBandwidthPerState[v->VoltageLevel][v->maxMpcComb] = dml_min3(
+			v->ReturnBusWidth * v->DCFCLK,
+			v->DRAMSpeedPerState[v->VoltageLevel] * v->NumberOfChannels * v->DRAMChannelWidth,
+			v->FabricClockPerState[v->VoltageLevel] * v->FabricDatapathToDCNDataReturn);
+	if (v->HostVMEnable != true) {
+		v->ReturnBW = v->IdealSDPPortBandwidthPerState[v->VoltageLevel][v->maxMpcComb] * v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly / 100;
+	} else {
+		v->ReturnBW = v->IdealSDPPortBandwidthPerState[v->VoltageLevel][v->maxMpcComb] * v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / 100;
+	}
+	/* End DAL custom code */
+
+	// DISPCLK and DPPCLK Calculation
+	//
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->WritebackEnable[k]) {
+			v->WritebackDISPCLK = dml_max(v->WritebackDISPCLK,
+				dml30_CalculateWriteBackDISPCLK(
+						v->WritebackPixelFormat[k],
+						v->PixelClock[k],
+						v->WritebackHRatio[k],
+						v->WritebackVRatio[k],
+						v->WritebackHTaps[k],
+						v->WritebackVTaps[k],
+						v->WritebackSourceWidth[k],
+						v->WritebackDestinationWidth[k],
+						v->HTotal[k],
+						v->WritebackLineBufferSize));
+		}
+	}
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->HRatio[k] > 1) {
+			v->PSCL_THROUGHPUT_LUMA[k] = dml_min(v->MaxDCHUBToPSCLThroughput,
+				v->MaxPSCLToLBThroughput * v->HRatio[k] / dml_ceil(v->htaps[k] / 6.0, 1));
+		} else {
+			v->PSCL_THROUGHPUT_LUMA[k] = dml_min(
+					v->MaxDCHUBToPSCLThroughput,
+					v->MaxPSCLToLBThroughput);
+		}
+
+		v->DPPCLKUsingSingleDPPLuma = v->PixelClock[k]
+			* dml_max(v->vtaps[k] / 6.0 * dml_min(1.0, v->HRatio[k]),
+				dml_max(v->HRatio[k] * v->VRatio[k] / v->PSCL_THROUGHPUT_LUMA[k], 1.0));
+
+		if ((v->htaps[k] > 6 || v->vtaps[k] > 6)
+				&& v->DPPCLKUsingSingleDPPLuma < 2 * v->PixelClock[k]) {
+			v->DPPCLKUsingSingleDPPLuma = 2 * v->PixelClock[k];
+		}
+
+		if ((v->SourcePixelFormat[k] != dm_420_8
+				&& v->SourcePixelFormat[k] != dm_420_10
+				&& v->SourcePixelFormat[k] != dm_420_12
+				&& v->SourcePixelFormat[k] != dm_rgbe_alpha)) {
+			v->PSCL_THROUGHPUT_CHROMA[k] = 0.0;
+			v->DPPCLKUsingSingleDPP[k] = v->DPPCLKUsingSingleDPPLuma;
+		} else {
+			if (v->HRatioChroma[k] > 1) {
+				v->PSCL_THROUGHPUT_CHROMA[k] = dml_min(v->MaxDCHUBToPSCLThroughput,
+					v->MaxPSCLToLBThroughput * v->HRatioChroma[k] / dml_ceil(v->HTAPsChroma[k] / 6.0, 1.0));
+			} else {
+				v->PSCL_THROUGHPUT_CHROMA[k] = dml_min(
+						v->MaxDCHUBToPSCLThroughput,
+						v->MaxPSCLToLBThroughput);
+			}
+			v->DPPCLKUsingSingleDPPChroma = v->PixelClock[k]
+				* dml_max3(v->VTAPsChroma[k] / 6.0 * dml_min(1.0, v->HRatioChroma[k]),
+					v->HRatioChroma[k] * v->VRatioChroma[k] / v->PSCL_THROUGHPUT_CHROMA[k], 1.0);
+
+			if ((v->HTAPsChroma[k] > 6 || v->VTAPsChroma[k] > 6)
+					&& v->DPPCLKUsingSingleDPPChroma
+							< 2 * v->PixelClock[k]) {
+				v->DPPCLKUsingSingleDPPChroma = 2
+						* v->PixelClock[k];
+			}
+
+			v->DPPCLKUsingSingleDPP[k] = dml_max(
+					v->DPPCLKUsingSingleDPPLuma,
+					v->DPPCLKUsingSingleDPPChroma);
+		}
+	}
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] != k)
+			continue;
+		if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_4to1) {
+			v->DISPCLKWithRamping = dml_max(v->DISPCLKWithRamping,
+				v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100)
+					* (1 + v->DISPCLKRampingMargin / 100));
+			v->DISPCLKWithoutRamping = dml_max(v->DISPCLKWithoutRamping,
+				v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100));
+		} else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
+			v->DISPCLKWithRamping = dml_max(v->DISPCLKWithRamping,
+				v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100)
+					* (1 + v->DISPCLKRampingMargin / 100));
+			v->DISPCLKWithoutRamping = dml_max(v->DISPCLKWithoutRamping,
+				v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100));
+		} else {
+			v->DISPCLKWithRamping = dml_max(v->DISPCLKWithRamping,
+				v->PixelClock[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100)
+									* (1 + v->DISPCLKRampingMargin / 100));
+			v->DISPCLKWithoutRamping = dml_max(v->DISPCLKWithoutRamping,
+				v->PixelClock[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100));
+		}
+	}
+
+	v->DISPCLKWithRamping = dml_max(
+			v->DISPCLKWithRamping,
+			v->WritebackDISPCLK);
+	v->DISPCLKWithoutRamping = dml_max(
+			v->DISPCLKWithoutRamping,
+			v->WritebackDISPCLK);
+
+	ASSERT(v->DISPCLKDPPCLKVCOSpeed != 0);
+	v->DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
+			v->DISPCLKWithRamping,
+			v->DISPCLKDPPCLKVCOSpeed);
+	v->DISPCLKWithoutRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
+			v->DISPCLKWithoutRamping,
+			v->DISPCLKDPPCLKVCOSpeed);
+	v->MaxDispclkRoundedToDFSGranularity = RoundToDFSGranularityDown(
+			v->soc.clock_limits[mode_lib->soc.num_states].dispclk_mhz,
+			v->DISPCLKDPPCLKVCOSpeed);
+	if (v->DISPCLKWithoutRampingRoundedToDFSGranularity
+			> v->MaxDispclkRoundedToDFSGranularity) {
+		v->DISPCLK_calculated =
+				v->DISPCLKWithoutRampingRoundedToDFSGranularity;
+	} else if (v->DISPCLKWithRampingRoundedToDFSGranularity
+			> v->MaxDispclkRoundedToDFSGranularity) {
+		v->DISPCLK_calculated = v->MaxDispclkRoundedToDFSGranularity;
+	} else {
+		v->DISPCLK_calculated =
+				v->DISPCLKWithRampingRoundedToDFSGranularity;
+	}
+	v->DISPCLK = v->DISPCLK_calculated;
+	DTRACE("   dispclk_mhz (calculated) = %f", v->DISPCLK_calculated);
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->DPPCLK_calculated[k] = v->DPPCLKUsingSingleDPP[k]
+				/ v->DPPPerPlane[k]
+				* (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+		v->GlobalDPPCLK = dml_max(
+				v->GlobalDPPCLK,
+				v->DPPCLK_calculated[k]);
+	}
+	v->GlobalDPPCLK = RoundToDFSGranularityUp(
+			v->GlobalDPPCLK,
+			v->DISPCLKDPPCLKVCOSpeed);
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->DPPCLK_calculated[k] = v->GlobalDPPCLK / 255
+				* dml_ceil(
+						v->DPPCLK_calculated[k] * 255.0
+								/ v->GlobalDPPCLK,
+						1);
+		DTRACE("   dppclk_mhz[%i] (calculated) = %f", k, v->DPPCLK_calculated[k]);
+		v->DPPCLK[k] = v->DPPCLK_calculated[k];
+	}
+
+	// Urgent and B P-State/DRAM Clock Change Watermark
+	DTRACE("   dcfclk_mhz         = %f", v->DCFCLK);
+	DTRACE("   return_bus_bw      = %f", v->ReturnBW);
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		CalculateBytePerPixelAnd256BBlockSizes(
+				v->SourcePixelFormat[k],
+				v->SurfaceTiling[k],
+				&v->BytePerPixelY[k],
+				&v->BytePerPixelC[k],
+				&v->BytePerPixelDETY[k],
+				&v->BytePerPixelDETC[k],
+				&v->BlockHeight256BytesY[k],
+				&v->BlockHeight256BytesC[k],
+				&v->BlockWidth256BytesY[k],
+				&v->BlockWidth256BytesC[k]);
+	}
+
+	CalculateSwathWidth(
+			false,
+			v->NumberOfActivePlanes,
+			v->SourcePixelFormat,
+			v->SourceScan,
+			v->ViewportWidth,
+			v->ViewportHeight,
+			v->SurfaceWidthY,
+			v->SurfaceWidthC,
+			v->SurfaceHeightY,
+			v->SurfaceHeightC,
+			v->ODMCombineEnabled,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			v->BlockHeight256BytesY,
+			v->BlockHeight256BytesC,
+			v->BlockWidth256BytesY,
+			v->BlockWidth256BytesC,
+			v->BlendingAndTiming,
+			v->HActive,
+			v->HRatio,
+			v->DPPPerPlane,
+			v->SwathWidthSingleDPPY,
+			v->SwathWidthSingleDPPC,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			v->dummyinteger3,
+			v->dummyinteger4,
+			v->swath_width_luma_ub,
+			v->swath_width_chroma_ub);
+
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->ReadBandwidthPlaneLuma[k] = v->SwathWidthSingleDPPY[k] * v->BytePerPixelY[k] / (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k];
+		v->ReadBandwidthPlaneChroma[k] = v->SwathWidthSingleDPPC[k] * v->BytePerPixelC[k] / (v->HTotal[k] / v->PixelClock[k]) * v->VRatioChroma[k];
+		DTRACE("read_bw[%i] = %fBps", k, v->ReadBandwidthPlaneLuma[k] + v->ReadBandwidthPlaneChroma[k]);
+	}
+
+
+	// DCFCLK Deep Sleep
+	CalculateDCFCLKDeepSleep(
+			mode_lib,
+			v->NumberOfActivePlanes,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			v->VRatio,
+			v->VRatioChroma,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			v->DPPPerPlane,
+			v->HRatio,
+			v->HRatioChroma,
+			v->PixelClock,
+			v->PSCL_THROUGHPUT_LUMA,
+			v->PSCL_THROUGHPUT_CHROMA,
+			v->DPPCLK,
+			v->ReadBandwidthPlaneLuma,
+			v->ReadBandwidthPlaneChroma,
+			v->ReturnBusWidth,
+			&v->DCFCLKDeepSleep);
+
+	// DSCCLK
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if ((v->BlendingAndTiming[k] != k) || !v->DSCEnabled[k]) {
+			v->DSCCLK_calculated[k] = 0.0;
+		} else {
+			if (v->OutputFormat[k] == dm_420)
+				v->DSCFormatFactor = 2;
+			else if (v->OutputFormat[k] == dm_444)
+				v->DSCFormatFactor = 1;
+			else if (v->OutputFormat[k] == dm_n422)
+				v->DSCFormatFactor = 2;
+			else
+				v->DSCFormatFactor = 1;
+			if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
+				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 12
+					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+			else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
+				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 6
+					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+			else
+				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 3
+					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+		}
+	}
+
+	// DSC Delay
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		double BPP = v->OutputBppPerState[k][v->VoltageLevel];
+
+		if (v->DSCEnabled[k] && BPP != 0) {
+			if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_disabled) {
+				v->DSCDelay[k] = dscceComputeDelay(v->DSCInputBitPerComponent[k],
+						BPP,
+						dml_ceil((double) v->HActive[k] / v->NumberOfDSCSlices[k], 1),
+						v->NumberOfDSCSlices[k],
+						v->OutputFormat[k],
+						v->Output[k])
+					+ dscComputeDelay(v->OutputFormat[k], v->Output[k]);
+			} else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1) {
+				v->DSCDelay[k] = 2 * dscceComputeDelay(v->DSCInputBitPerComponent[k],
+						BPP,
+						dml_ceil((double) v->HActive[k] / v->NumberOfDSCSlices[k], 1),
+						v->NumberOfDSCSlices[k] / 2.0,
+						v->OutputFormat[k],
+						v->Output[k])
+					+ dscComputeDelay(v->OutputFormat[k], v->Output[k]);
+			} else {
+				v->DSCDelay[k] = 4 * dscceComputeDelay(v->DSCInputBitPerComponent[k],
+						BPP,
+						dml_ceil((double) v->HActive[k] / v->NumberOfDSCSlices[k], 1),
+						v->NumberOfDSCSlices[k] / 4.0,
+						v->OutputFormat[k],
+						v->Output[k])
+					+ dscComputeDelay(v->OutputFormat[k], v->Output[k]);
+			}
+			v->DSCDelay[k] = v->DSCDelay[k] * v->PixelClock[k] / v->PixelClockBackEnd[k];
+		} else {
+			v->DSCDelay[k] = 0;
+		}
+	}
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k)
+		for (j = 0; j < v->NumberOfActivePlanes; ++j) // NumberOfPlanes
+			if (j != k && v->BlendingAndTiming[k] == j
+					&& v->DSCEnabled[j])
+				v->DSCDelay[k] = v->DSCDelay[j];
+
+	// Prefetch
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		unsigned int PDEAndMetaPTEBytesFrameY = 0;
+		unsigned int PixelPTEBytesPerRowY = 0;
+		unsigned int MetaRowByteY = 0;
+		unsigned int MetaRowByteC = 0;
+		unsigned int PDEAndMetaPTEBytesFrameC = 0;
+		unsigned int PixelPTEBytesPerRowC = 0;
+		bool         PTEBufferSizeNotExceededY = 0;
+		bool         PTEBufferSizeNotExceededC = 0;
+
+
+		if (v->SourcePixelFormat[k] == dm_420_8 || v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_420_12 || v->SourcePixelFormat[k] == dm_rgbe_alpha) {
+			if ((v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_420_12) && v->SourceScan[k] != dm_vert) {
+				v->PTEBufferSizeInRequestsForLuma = (v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInRequestsChroma) / 2;
+				v->PTEBufferSizeInRequestsForChroma = v->PTEBufferSizeInRequestsForLuma;
+			} else {
+				v->PTEBufferSizeInRequestsForLuma = v->PTEBufferSizeInRequestsLuma;
+				v->PTEBufferSizeInRequestsForChroma = v->PTEBufferSizeInRequestsChroma;
+
+			}
+			PDEAndMetaPTEBytesFrameC = CalculateVMAndRowBytes(
+					mode_lib,
+					v->DCCEnable[k],
+					v->BlockHeight256BytesC[k],
+					v->BlockWidth256BytesC[k],
+					v->SourcePixelFormat[k],
+					v->SurfaceTiling[k],
+					v->BytePerPixelC[k],
+					v->SourceScan[k],
+					v->SwathWidthC[k],
+					v->ViewportHeightChroma[k],
+					v->GPUVMEnable,
+					v->HostVMEnable,
+					v->HostVMMaxNonCachedPageTableLevels,
+					v->GPUVMMinPageSize,
+					v->HostVMMinPageSize,
+					v->PTEBufferSizeInRequestsForChroma,
+					v->PitchC[k],
+					v->DCCMetaPitchC[k],
+					&v->MacroTileWidthC[k],
+					&MetaRowByteC,
+					&PixelPTEBytesPerRowC,
+					&PTEBufferSizeNotExceededC,
+					&v->dpte_row_width_chroma_ub[k],
+					&v->dpte_row_height_chroma[k],
+					&v->meta_req_width_chroma[k],
+					&v->meta_req_height_chroma[k],
+					&v->meta_row_width_chroma[k],
+					&v->meta_row_height_chroma[k],
+					&v->dummyinteger1,
+					&v->dummyinteger2,
+					&v->PixelPTEReqWidthC[k],
+					&v->PixelPTEReqHeightC[k],
+					&v->PTERequestSizeC[k],
+					&v->dpde0_bytes_per_frame_ub_c[k],
+					&v->meta_pte_bytes_per_frame_ub_c[k]);
+
+			v->PrefetchSourceLinesC[k] = CalculatePrefetchSourceLines(
+					mode_lib,
+					v->VRatioChroma[k],
+					v->VTAPsChroma[k],
+					v->Interlace[k],
+					v->ProgressiveToInterlaceUnitInOPP,
+					v->SwathHeightC[k],
+					v->ViewportYStartC[k],
+					&v->VInitPreFillC[k],
+					&v->MaxNumSwathC[k]);
+		} else {
+			v->PTEBufferSizeInRequestsForLuma = v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInRequestsChroma;
+			v->PTEBufferSizeInRequestsForChroma = 0;
+			PixelPTEBytesPerRowC = 0;
+			PDEAndMetaPTEBytesFrameC = 0;
+			MetaRowByteC = 0;
+			v->MaxNumSwathC[k] = 0;
+			v->PrefetchSourceLinesC[k] = 0;
+		}
+
+		PDEAndMetaPTEBytesFrameY = CalculateVMAndRowBytes(
+				mode_lib,
+				v->DCCEnable[k],
+				v->BlockHeight256BytesY[k],
+				v->BlockWidth256BytesY[k],
+				v->SourcePixelFormat[k],
+				v->SurfaceTiling[k],
+				v->BytePerPixelY[k],
+				v->SourceScan[k],
+				v->SwathWidthY[k],
+				v->ViewportHeight[k],
+				v->GPUVMEnable,
+				v->HostVMEnable,
+				v->HostVMMaxNonCachedPageTableLevels,
+				v->GPUVMMinPageSize,
+				v->HostVMMinPageSize,
+				v->PTEBufferSizeInRequestsForLuma,
+				v->PitchY[k],
+				v->DCCMetaPitchY[k],
+				&v->MacroTileWidthY[k],
+				&MetaRowByteY,
+				&PixelPTEBytesPerRowY,
+				&PTEBufferSizeNotExceededY,
+				&v->dpte_row_width_luma_ub[k],
+				&v->dpte_row_height[k],
+				&v->meta_req_width[k],
+				&v->meta_req_height[k],
+				&v->meta_row_width[k],
+				&v->meta_row_height[k],
+				&v->vm_group_bytes[k],
+				&v->dpte_group_bytes[k],
+				&v->PixelPTEReqWidthY[k],
+				&v->PixelPTEReqHeightY[k],
+				&v->PTERequestSizeY[k],
+				&v->dpde0_bytes_per_frame_ub_l[k],
+				&v->meta_pte_bytes_per_frame_ub_l[k]);
+
+		v->PrefetchSourceLinesY[k] = CalculatePrefetchSourceLines(
+				mode_lib,
+				v->VRatio[k],
+				v->vtaps[k],
+				v->Interlace[k],
+				v->ProgressiveToInterlaceUnitInOPP,
+				v->SwathHeightY[k],
+				v->ViewportYStartY[k],
+				&v->VInitPreFillY[k],
+				&v->MaxNumSwathY[k]);
+		v->PixelPTEBytesPerRow[k] = PixelPTEBytesPerRowY + PixelPTEBytesPerRowC;
+		v->PDEAndMetaPTEBytesFrame[k] = PDEAndMetaPTEBytesFrameY
+				+ PDEAndMetaPTEBytesFrameC;
+		v->MetaRowByte[k] = MetaRowByteY + MetaRowByteC;
+
+		CalculateRowBandwidth(
+				v->GPUVMEnable,
+				v->SourcePixelFormat[k],
+				v->VRatio[k],
+				v->VRatioChroma[k],
+				v->DCCEnable[k],
+				v->HTotal[k] / v->PixelClock[k],
+				MetaRowByteY,
+				MetaRowByteC,
+				v->meta_row_height[k],
+				v->meta_row_height_chroma[k],
+				PixelPTEBytesPerRowY,
+				PixelPTEBytesPerRowC,
+				v->dpte_row_height[k],
+				v->dpte_row_height_chroma[k],
+				&v->meta_row_bw[k],
+				&v->dpte_row_bw[k]);
+	}
+
+	v->TotalDCCActiveDPP = 0;
+	v->TotalActiveDPP = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->TotalActiveDPP = v->TotalActiveDPP
+				+ v->DPPPerPlane[k];
+		if (v->DCCEnable[k])
+			v->TotalDCCActiveDPP = v->TotalDCCActiveDPP
+					+ v->DPPPerPlane[k];
+	}
+
+
+	ReorderBytes = v->NumberOfChannels * dml_max3(
+		v->UrgentOutOfOrderReturnPerChannelPixelDataOnly,
+		v->UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
+		v->UrgentOutOfOrderReturnPerChannelVMDataOnly);
+
+	v->UrgentExtraLatency = CalculateExtraLatency(
+		v->RoundTripPingLatencyCycles,
+		ReorderBytes,
+		v->DCFCLK,
+		v->TotalActiveDPP,
+		v->PixelChunkSizeInKByte,
+		v->TotalDCCActiveDPP,
+		v->MetaChunkSize,
+		v->ReturnBW,
+		v->GPUVMEnable,
+		v->HostVMEnable,
+		v->NumberOfActivePlanes,
+		v->DPPPerPlane,
+		v->dpte_group_bytes,
+		v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		v->HostVMMinPageSize,
+		v->HostVMMaxNonCachedPageTableLevels);
+
+	v->TCalc = 24.0 / v->DCFCLKDeepSleep;
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] == k) {
+			if (v->WritebackEnable[k] == true) {
+				v->WritebackDelay[v->VoltageLevel][k] = v->WritebackLatency +
+						CalculateWriteBackDelay(v->WritebackPixelFormat[k],
+									v->WritebackHRatio[k],
+									v->WritebackVRatio[k],
+									v->WritebackVTaps[k],
+									v->WritebackDestinationWidth[k],
+									v->WritebackDestinationHeight[k],
+									v->WritebackSourceHeight[k],
+									v->HTotal[k]) / v->DISPCLK;
+			} else
+				v->WritebackDelay[v->VoltageLevel][k] = 0;
+			for (j = 0; j < v->NumberOfActivePlanes; ++j) {
+				if (v->BlendingAndTiming[j] == k
+						&& v->WritebackEnable[j] == true) {
+					v->WritebackDelay[v->VoltageLevel][k] = dml_max(v->WritebackDelay[v->VoltageLevel][k],
+							v->WritebackLatency + CalculateWriteBackDelay(
+											v->WritebackPixelFormat[j],
+											v->WritebackHRatio[j],
+											v->WritebackVRatio[j],
+											v->WritebackVTaps[j],
+											v->WritebackDestinationWidth[j],
+											v->WritebackDestinationHeight[j],
+											v->WritebackSourceHeight[j],
+											v->HTotal[k]) / v->DISPCLK);
+				}
+			}
+		}
+	}
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k)
+		for (j = 0; j < v->NumberOfActivePlanes; ++j)
+			if (v->BlendingAndTiming[k] == j)
+				v->WritebackDelay[v->VoltageLevel][k] = v->WritebackDelay[v->VoltageLevel][j];
+
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->MaxVStartupLines[k] = v->VTotal[k] - v->VActive[k] - dml_max(1.0, dml_ceil((double) v->WritebackDelay[v->VoltageLevel][k] / (v->HTotal[k] / v->PixelClock[k]), 1));
+	}
+
+	v->MaximumMaxVStartupLines = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k)
+		v->MaximumMaxVStartupLines = dml_max(v->MaximumMaxVStartupLines, v->MaxVStartupLines[k]);
+
+	if (v->DRAMClockChangeLatencyOverride > 0.0) {
+		v->FinalDRAMClockChangeLatency = v->DRAMClockChangeLatencyOverride;
+	} else {
+		v->FinalDRAMClockChangeLatency = v->DRAMClockChangeLatency;
+	}
+	v->UrgentLatency = CalculateUrgentLatency(v->UrgentLatencyPixelDataOnly, v->UrgentLatencyPixelMixedWithVMData, v->UrgentLatencyVMDataOnly, v->DoUrgentLatencyAdjustment, v->UrgentLatencyAdjustmentFabricClockComponent, v->UrgentLatencyAdjustmentFabricClockReference, v->FabricClock);
+
+
+	v->FractionOfUrgentBandwidth = 0.0;
+	v->FractionOfUrgentBandwidthImmediateFlip = 0.0;
+
+	v->VStartupLines = 13;
+
+	do {
+		MaxTotalRDBandwidth = 0;
+		MaxTotalRDBandwidthNoUrgentBurst = 0;
+		DestinationLineTimesForPrefetchLessThan2 = false;
+		VRatioPrefetchMoreThan4 = false;
+		TWait = CalculateTWait(
+				PrefetchMode,
+				v->FinalDRAMClockChangeLatency,
+				v->UrgentLatency,
+				v->SREnterPlusExitTime);
+
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			Pipe myPipe = { 0 };
+
+			myPipe.DPPCLK = v->DPPCLK[k];
+			myPipe.DISPCLK = v->DISPCLK;
+			myPipe.PixelClock = v->PixelClock[k];
+			myPipe.DCFCLKDeepSleep = v->DCFCLKDeepSleep;
+			myPipe.DPPPerPlane = v->DPPPerPlane[k];
+			myPipe.ScalerEnabled = v->ScalerEnabled[k];
+			myPipe.SourceScan = v->SourceScan[k];
+			myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
+			myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
+			myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
+			myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
+			myPipe.InterlaceEnable = v->Interlace[k];
+			myPipe.NumberOfCursors = v->NumberOfCursors[k];
+			myPipe.VBlank = v->VTotal[k] - v->VActive[k];
+			myPipe.HTotal = v->HTotal[k];
+			myPipe.DCCEnable = v->DCCEnable[k];
+			myPipe.ODMCombineEnabled = !!v->ODMCombineEnabled[k];
+
+			v->ErrorResult[k] = CalculatePrefetchSchedule(
+					mode_lib,
+					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					&myPipe,
+					v->DSCDelay[k],
+					v->DPPCLKDelaySubtotal
+							+ v->DPPCLKDelayCNVCFormater,
+					v->DPPCLKDelaySCL,
+					v->DPPCLKDelaySCLLBOnly,
+					v->DPPCLKDelayCNVCCursor,
+					v->DISPCLKDelaySubtotal,
+					(unsigned int) (v->SwathWidthY[k] / v->HRatio[k]),
+					v->OutputFormat[k],
+					v->MaxInterDCNTileRepeaters,
+					dml_min(v->VStartupLines, v->MaxVStartupLines[k]),
+					v->MaxVStartupLines[k],
+					v->GPUVMMaxPageTableLevels,
+					v->GPUVMEnable,
+					v->HostVMEnable,
+					v->HostVMMaxNonCachedPageTableLevels,
+					v->HostVMMinPageSize,
+					v->DynamicMetadataEnable[k],
+					v->DynamicMetadataVMEnabled,
+					v->DynamicMetadataLinesBeforeActiveRequired[k],
+					v->DynamicMetadataTransmittedBytes[k],
+					v->UrgentLatency,
+					v->UrgentExtraLatency,
+					v->TCalc,
+					v->PDEAndMetaPTEBytesFrame[k],
+					v->MetaRowByte[k],
+					v->PixelPTEBytesPerRow[k],
+					v->PrefetchSourceLinesY[k],
+					v->SwathWidthY[k],
+					v->BytePerPixelY[k],
+					v->VInitPreFillY[k],
+					v->MaxNumSwathY[k],
+					v->PrefetchSourceLinesC[k],
+					v->SwathWidthC[k],
+					v->BytePerPixelC[k],
+					v->VInitPreFillC[k],
+					v->MaxNumSwathC[k],
+					v->swath_width_luma_ub[k],
+					v->swath_width_chroma_ub[k],
+					v->SwathHeightY[k],
+					v->SwathHeightC[k],
+					TWait,
+					v->ProgressiveToInterlaceUnitInOPP,
+					&v->DSTXAfterScaler[k],
+					&v->DSTYAfterScaler[k],
+					&v->DestinationLinesForPrefetch[k],
+					&v->PrefetchBandwidth[k],
+					&v->DestinationLinesToRequestVMInVBlank[k],
+					&v->DestinationLinesToRequestRowInVBlank[k],
+					&v->VRatioPrefetchY[k],
+					&v->VRatioPrefetchC[k],
+					&v->RequiredPrefetchPixDataBWLuma[k],
+					&v->RequiredPrefetchPixDataBWChroma[k],
+					&v->NotEnoughTimeForDynamicMetadata,
+					&v->Tno_bw[k],
+					&v->prefetch_vmrow_bw[k],
+					&v->Tdmdl_vm[k],
+					&v->Tdmdl[k],
+					&v->VUpdateOffsetPix[k],
+					&v->VUpdateWidthPix[k],
+					&v->VReadyOffsetPix[k]);
+			if (v->BlendingAndTiming[k] == k) {
+				double TotalRepeaterDelayTime = v->MaxInterDCNTileRepeaters * (2 / v->DPPCLK[k] + 3 / v->DISPCLK);
+				v->VUpdateWidthPix[k] = (14 / v->DCFCLKDeepSleep + 12 / v->DPPCLK[k] + TotalRepeaterDelayTime) * v->PixelClock[k];
+				v->VReadyOffsetPix[k] = dml_max(150.0 / v->DPPCLK[k], TotalRepeaterDelayTime + 20 / v->DCFCLKDeepSleep + 10 / v->DPPCLK[k]) * v->PixelClock[k];
+				v->VUpdateOffsetPix[k] = dml_ceil(v->HTotal[k] / 4.0, 1);
+				v->VStartup[k] = dml_min(v->VStartupLines, v->MaxVStartupLines[k]);
+			} else {
+				int x = v->BlendingAndTiming[k];
+				double TotalRepeaterDelayTime = v->MaxInterDCNTileRepeaters * (2 / v->DPPCLK[k] + 3 / v->DISPCLK);
+				v->VUpdateWidthPix[k] = (14 / v->DCFCLKDeepSleep + 12 / v->DPPCLK[k] + TotalRepeaterDelayTime) * v->PixelClock[x];
+				v->VReadyOffsetPix[k] = dml_max(150.0 / v->DPPCLK[k], TotalRepeaterDelayTime + 20 / v->DCFCLKDeepSleep + 10 / v->DPPCLK[k]) * v->PixelClock[x];
+				v->VUpdateOffsetPix[k] = dml_ceil(v->HTotal[x] / 4.0, 1);
+				if (!v->MaxVStartupLines[x])
+					v->MaxVStartupLines[x] = v->MaxVStartupLines[k];
+				v->VStartup[k] = dml_min(v->VStartupLines, v->MaxVStartupLines[x]);
+			}
+		}
+
+		v->NotEnoughUrgentLatencyHiding = false;
+		v->NotEnoughUrgentLatencyHidingPre = false;
+
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			v->cursor_bw[k] = v->NumberOfCursors[k]
+					* v->CursorWidth[k][0] * v->CursorBPP[k][0]
+					/ 8.0
+					/ (v->HTotal[k] / v->PixelClock[k])
+					* v->VRatio[k];
+			v->cursor_bw_pre[k] = v->NumberOfCursors[k]
+					* v->CursorWidth[k][0] * v->CursorBPP[k][0]
+					/ 8.0
+					/ (v->HTotal[k] / v->PixelClock[k])
+					* v->VRatioPrefetchY[k];
+
+			CalculateUrgentBurstFactor(
+					v->swath_width_luma_ub[k],
+					v->swath_width_chroma_ub[k],
+					v->DETBufferSizeInKByte,
+					v->SwathHeightY[k],
+					v->SwathHeightC[k],
+					v->HTotal[k] / v->PixelClock[k],
+					v->UrgentLatency,
+					v->CursorBufferSize,
+					v->CursorWidth[k][0],
+					v->CursorBPP[k][0],
+					v->VRatio[k],
+					v->VRatioChroma[k],
+					v->BytePerPixelDETY[k],
+					v->BytePerPixelDETC[k],
+					v->DETBufferSizeY[k],
+					v->DETBufferSizeC[k],
+					&v->UrgentBurstFactorCursor[k],
+					&v->UrgentBurstFactorLuma[k],
+					&v->UrgentBurstFactorChroma[k],
+					&v->NoUrgentLatencyHiding[k]);
+
+			CalculateUrgentBurstFactor(
+					v->swath_width_luma_ub[k],
+					v->swath_width_chroma_ub[k],
+					v->DETBufferSizeInKByte,
+					v->SwathHeightY[k],
+					v->SwathHeightC[k],
+					v->HTotal[k] / v->PixelClock[k],
+					v->UrgentLatency,
+					v->CursorBufferSize,
+					v->CursorWidth[k][0],
+					v->CursorBPP[k][0],
+					v->VRatioPrefetchY[k],
+					v->VRatioPrefetchC[k],
+					v->BytePerPixelDETY[k],
+					v->BytePerPixelDETC[k],
+					v->DETBufferSizeY[k],
+					v->DETBufferSizeC[k],
+					&v->UrgentBurstFactorCursorPre[k],
+					&v->UrgentBurstFactorLumaPre[k],
+					&v->UrgentBurstFactorChromaPre[k],
+					&v->NoUrgentLatencyHidingPre[k]);
+
+			MaxTotalRDBandwidth = MaxTotalRDBandwidth +
+				dml_max3(v->DPPPerPlane[k] * v->prefetch_vmrow_bw[k],
+					v->ReadBandwidthPlaneLuma[k] *
+					v->UrgentBurstFactorLuma[k] +
+					v->ReadBandwidthPlaneChroma[k] *
+					v->UrgentBurstFactorChroma[k] +
+					v->cursor_bw[k] *
+					v->UrgentBurstFactorCursor[k] +
+					v->DPPPerPlane[k] * (v->meta_row_bw[k] + v->dpte_row_bw[k]),
+					v->DPPPerPlane[k] * (v->RequiredPrefetchPixDataBWLuma[k] * v->UrgentBurstFactorLumaPre[k] +
+						v->RequiredPrefetchPixDataBWChroma[k] * v->UrgentBurstFactorChromaPre[k]) + v->cursor_bw_pre[k] *
+					v->UrgentBurstFactorCursorPre[k]);
+
+			MaxTotalRDBandwidthNoUrgentBurst = MaxTotalRDBandwidthNoUrgentBurst +
+				dml_max3(v->DPPPerPlane[k] * v->prefetch_vmrow_bw[k],
+					v->ReadBandwidthPlaneLuma[k] +
+					v->ReadBandwidthPlaneChroma[k] +
+					v->cursor_bw[k] +
+					v->DPPPerPlane[k] * (v->meta_row_bw[k] + v->dpte_row_bw[k]),
+					v->DPPPerPlane[k] * (v->RequiredPrefetchPixDataBWLuma[k] + v->RequiredPrefetchPixDataBWChroma[k]) + v->cursor_bw_pre[k]);
+
+			if (v->DestinationLinesForPrefetch[k] < 2)
+				DestinationLineTimesForPrefetchLessThan2 = true;
+			if (v->VRatioPrefetchY[k] > 4 || v->VRatioPrefetchC[k] > 4)
+				VRatioPrefetchMoreThan4 = true;
+			if (v->NoUrgentLatencyHiding[k] == true)
+				v->NotEnoughUrgentLatencyHiding = true;
+
+			if (v->NoUrgentLatencyHidingPre[k] == true)
+				v->NotEnoughUrgentLatencyHidingPre = true;
+		}
+		v->FractionOfUrgentBandwidth = MaxTotalRDBandwidthNoUrgentBurst / v->ReturnBW;
+
+
+		if (MaxTotalRDBandwidth <= v->ReturnBW && v->NotEnoughUrgentLatencyHiding == 0 && v->NotEnoughUrgentLatencyHidingPre == 0 && v->NotEnoughTimeForDynamicMetadata == 0 && !VRatioPrefetchMoreThan4
+				&& !DestinationLineTimesForPrefetchLessThan2)
+			v->PrefetchModeSupported = true;
+		else {
+			v->PrefetchModeSupported = false;
+			dml_print("DML: CalculatePrefetchSchedule ***failed***. Bandwidth violation. Results are NOT valid\n");
+			dml_print("DML: MaxTotalRDBandwidth:%f AvailReturnBandwidth:%f\n", MaxTotalRDBandwidth, v->ReturnBW);
+			dml_print("DML: VRatioPrefetch %s more than 4\n", (VRatioPrefetchMoreThan4) ? "is" : "is not");
+			dml_print("DML: DestinationLines for Prefetch %s less than 2\n", (DestinationLineTimesForPrefetchLessThan2) ? "is" : "is not");
+			dml_print("DML: Not enough lines for dynamic meta is %s\n", (v->NotEnoughTimeForDynamicMetadata) ? "true" : "false");
+
+		}
+
+		if (v->PrefetchModeSupported == true && v->ImmediateFlipSupport == true) {
+			v->BandwidthAvailableForImmediateFlip = v->ReturnBW;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->BandwidthAvailableForImmediateFlip =
+						v->BandwidthAvailableForImmediateFlip
+								- dml_max(
+										v->ReadBandwidthPlaneLuma[k] * v->UrgentBurstFactorLuma[k]
+												+ v->ReadBandwidthPlaneChroma[k] * v->UrgentBurstFactorChroma[k]
+												+ v->cursor_bw[k] * v->UrgentBurstFactorCursor[k],
+										v->DPPPerPlane[k] * (v->RequiredPrefetchPixDataBWLuma[k] * v->UrgentBurstFactorLumaPre[k] +
+										v->RequiredPrefetchPixDataBWChroma[k] * v->UrgentBurstFactorChromaPre[k]) +
+										v->cursor_bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
+			}
+
+			v->TotImmediateFlipBytes = 0;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->TotImmediateFlipBytes = v->TotImmediateFlipBytes + v->DPPPerPlane[k] * (v->PDEAndMetaPTEBytesFrame[k] + v->MetaRowByte[k] + v->PixelPTEBytesPerRow[k]);
+			}
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				CalculateFlipSchedule(
+						mode_lib,
+						v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+						v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+						v->UrgentExtraLatency,
+						v->UrgentLatency,
+						v->GPUVMMaxPageTableLevels,
+						v->HostVMEnable,
+						v->HostVMMaxNonCachedPageTableLevels,
+						v->GPUVMEnable,
+						v->HostVMMinPageSize,
+						v->PDEAndMetaPTEBytesFrame[k],
+						v->MetaRowByte[k],
+						v->PixelPTEBytesPerRow[k],
+						v->BandwidthAvailableForImmediateFlip,
+						v->TotImmediateFlipBytes,
+						v->SourcePixelFormat[k],
+						v->HTotal[k] / v->PixelClock[k],
+						v->VRatio[k],
+						v->VRatioChroma[k],
+						v->Tno_bw[k],
+						v->DCCEnable[k],
+						v->dpte_row_height[k],
+						v->meta_row_height[k],
+						v->dpte_row_height_chroma[k],
+						v->meta_row_height_chroma[k],
+						&v->DestinationLinesToRequestVMInImmediateFlip[k],
+						&v->DestinationLinesToRequestRowInImmediateFlip[k],
+						&v->final_flip_bw[k],
+						&v->ImmediateFlipSupportedForPipe[k]);
+			}
+			v->total_dcn_read_bw_with_flip = 0.0;
+			v->total_dcn_read_bw_with_flip_no_urgent_burst = 0.0;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->total_dcn_read_bw_with_flip = v->total_dcn_read_bw_with_flip + dml_max3(
+					v->DPPPerPlane[k] * v->prefetch_vmrow_bw[k],
+					v->DPPPerPlane[k] * v->final_flip_bw[k] +
+					v->ReadBandwidthLuma[k] * v->UrgentBurstFactorLuma[k] +
+					v->ReadBandwidthChroma[k] * v->UrgentBurstFactorChroma[k] +
+					v->cursor_bw[k] * v->UrgentBurstFactorCursor[k],
+					v->DPPPerPlane[k] * (v->final_flip_bw[k] +
+					v->RequiredPrefetchPixDataBWLuma[k] * v->UrgentBurstFactorLumaPre[k] +
+					v->RequiredPrefetchPixDataBWChroma[k] * v->UrgentBurstFactorChromaPre[k]) +
+					v->cursor_bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
+				v->total_dcn_read_bw_with_flip_no_urgent_burst =
+					v->total_dcn_read_bw_with_flip_no_urgent_burst +
+						dml_max3(v->DPPPerPlane[k] * v->prefetch_vmrow_bw[k],
+							v->DPPPerPlane[k] * v->final_flip_bw[k] + v->ReadBandwidthPlaneLuma[k] + v->ReadBandwidthPlaneChroma[k] + v->cursor_bw[k],
+							v->DPPPerPlane[k] * (v->final_flip_bw[k] + v->RequiredPrefetchPixDataBWLuma[k] + v->RequiredPrefetchPixDataBWChroma[k]) + v->cursor_bw_pre[k]);
+
+			}
+			v->FractionOfUrgentBandwidthImmediateFlip = v->total_dcn_read_bw_with_flip_no_urgent_burst / v->ReturnBW;
+
+			v->ImmediateFlipSupported = true;
+			if (v->total_dcn_read_bw_with_flip > v->ReturnBW) {
+				v->ImmediateFlipSupported = false;
+				v->total_dcn_read_bw_with_flip = MaxTotalRDBandwidth;
+			}
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				if (v->ImmediateFlipSupportedForPipe[k] == false) {
+					v->ImmediateFlipSupported = false;
+				}
+			}
+		} else {
+			v->ImmediateFlipSupported = false;
+		}
+
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			if (v->ErrorResult[k]) {
+				v->PrefetchModeSupported = false;
+				dml_print("DML: CalculatePrefetchSchedule ***failed***. Prefetch schedule violation. Results are NOT valid\n");
+			}
+		}
+
+		v->VStartupLines = v->VStartupLines + 1;
+		v->PrefetchAndImmediateFlipSupported = (v->PrefetchModeSupported == true && ((!v->ImmediateFlipSupport && !v->HostVMEnable && v->ImmediateFlipRequirement != dm_immediate_flip_required) || v->ImmediateFlipSupported)) ? true : false;
+
+	} while (!v->PrefetchModeSupported && v->VStartupLines <= v->MaximumMaxVStartupLines);
+	ASSERT(v->PrefetchModeSupported);
+
+	//Watermarks and NB P-State/DRAM Clock Change Support
+	{
+		enum clock_change_support   DRAMClockChangeSupport = 0; // dummy
+		CalculateWatermarksAndDRAMSpeedChangeSupport(
+			mode_lib,
+			PrefetchMode,
+			v->NumberOfActivePlanes,
+			v->MaxLineBufferLines,
+			v->LineBufferSize,
+			v->DPPOutputBufferPixels,
+			v->DETBufferSizeInKByte,
+			v->WritebackInterfaceBufferSize,
+			v->DCFCLK,
+			v->ReturnBW,
+			v->GPUVMEnable,
+			v->dpte_group_bytes,
+			v->MetaChunkSize,
+			v->UrgentLatency,
+			v->UrgentExtraLatency,
+			v->WritebackLatency,
+			v->WritebackChunkSize,
+			v->SOCCLK,
+			v->FinalDRAMClockChangeLatency,
+			v->SRExitTime,
+			v->SREnterPlusExitTime,
+			v->DCFCLKDeepSleep,
+			v->DPPPerPlane,
+			v->DCCEnable,
+			v->DPPCLK,
+			v->DETBufferSizeY,
+			v->DETBufferSizeC,
+			v->SwathHeightY,
+			v->SwathHeightC,
+			v->LBBitPerPixel,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			v->HRatio,
+			v->HRatioChroma,
+			v->vtaps,
+			v->VTAPsChroma,
+			v->VRatio,
+			v->VRatioChroma,
+			v->HTotal,
+			v->PixelClock,
+			v->BlendingAndTiming,
+			v->BytePerPixelDETY,
+			v->BytePerPixelDETC,
+			v->DSTXAfterScaler,
+			v->DSTYAfterScaler,
+			v->WritebackEnable,
+			v->WritebackPixelFormat,
+			v->WritebackDestinationWidth,
+			v->WritebackDestinationHeight,
+			v->WritebackSourceHeight,
+			&DRAMClockChangeSupport,
+			&v->UrgentWatermark,
+			&v->WritebackUrgentWatermark,
+			&v->DRAMClockChangeWatermark,
+			&v->WritebackDRAMClockChangeWatermark,
+			&v->StutterExitWatermark,
+			&v->StutterEnterPlusExitWatermark,
+			&v->MinActiveDRAMClockChangeLatencySupported);
+
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			if (v->WritebackEnable[k] == true) {
+				if (v->BlendingAndTiming[k] == k) {
+					v->ThisVStartup = v->VStartup[k];
+				} else {
+					for (j = 0; j < v->NumberOfActivePlanes; ++j) {
+						if (v->BlendingAndTiming[k] == j) {
+							v->ThisVStartup = v->VStartup[j];
+						}
+					}
+				}
+				v->WritebackAllowDRAMClockChangeEndPosition[k] = dml_max(0,
+					v->ThisVStartup * v->HTotal[k] / v->PixelClock[k] - v->WritebackDRAMClockChangeWatermark);
+			} else {
+				v->WritebackAllowDRAMClockChangeEndPosition[k] = 0;
+			}
+		}
+
+	}
+
+
+	//Display Pipeline Delivery Time in Prefetch, Groups
+	CalculatePixelDeliveryTimes(
+			v->NumberOfActivePlanes,
+			v->VRatio,
+			v->VRatioChroma,
+			v->VRatioPrefetchY,
+			v->VRatioPrefetchC,
+			v->swath_width_luma_ub,
+			v->swath_width_chroma_ub,
+			v->DPPPerPlane,
+			v->HRatio,
+			v->HRatioChroma,
+			v->PixelClock,
+			v->PSCL_THROUGHPUT_LUMA,
+			v->PSCL_THROUGHPUT_CHROMA,
+			v->DPPCLK,
+			v->BytePerPixelC,
+			v->SourceScan,
+			v->NumberOfCursors,
+			v->CursorWidth,
+			v->CursorBPP,
+			v->BlockWidth256BytesY,
+			v->BlockHeight256BytesY,
+			v->BlockWidth256BytesC,
+			v->BlockHeight256BytesC,
+			v->DisplayPipeLineDeliveryTimeLuma,
+			v->DisplayPipeLineDeliveryTimeChroma,
+			v->DisplayPipeLineDeliveryTimeLumaPrefetch,
+			v->DisplayPipeLineDeliveryTimeChromaPrefetch,
+			v->DisplayPipeRequestDeliveryTimeLuma,
+			v->DisplayPipeRequestDeliveryTimeChroma,
+			v->DisplayPipeRequestDeliveryTimeLumaPrefetch,
+			v->DisplayPipeRequestDeliveryTimeChromaPrefetch,
+			v->CursorRequestDeliveryTime,
+			v->CursorRequestDeliveryTimePrefetch);
+
+	CalculateMetaAndPTETimes(
+			v->NumberOfActivePlanes,
+			v->GPUVMEnable,
+			v->MetaChunkSize,
+			v->MinMetaChunkSizeBytes,
+			v->HTotal,
+			v->VRatio,
+			v->VRatioChroma,
+			v->DestinationLinesToRequestRowInVBlank,
+			v->DestinationLinesToRequestRowInImmediateFlip,
+			v->DCCEnable,
+			v->PixelClock,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			v->SourceScan,
+			v->dpte_row_height,
+			v->dpte_row_height_chroma,
+			v->meta_row_width,
+			v->meta_row_width_chroma,
+			v->meta_row_height,
+			v->meta_row_height_chroma,
+			v->meta_req_width,
+			v->meta_req_width_chroma,
+			v->meta_req_height,
+			v->meta_req_height_chroma,
+			v->dpte_group_bytes,
+			v->PTERequestSizeY,
+			v->PTERequestSizeC,
+			v->PixelPTEReqWidthY,
+			v->PixelPTEReqHeightY,
+			v->PixelPTEReqWidthC,
+			v->PixelPTEReqHeightC,
+			v->dpte_row_width_luma_ub,
+			v->dpte_row_width_chroma_ub,
+			v->DST_Y_PER_PTE_ROW_NOM_L,
+			v->DST_Y_PER_PTE_ROW_NOM_C,
+			v->DST_Y_PER_META_ROW_NOM_L,
+			v->DST_Y_PER_META_ROW_NOM_C,
+			v->TimePerMetaChunkNominal,
+			v->TimePerChromaMetaChunkNominal,
+			v->TimePerMetaChunkVBlank,
+			v->TimePerChromaMetaChunkVBlank,
+			v->TimePerMetaChunkFlip,
+			v->TimePerChromaMetaChunkFlip,
+			v->time_per_pte_group_nom_luma,
+			v->time_per_pte_group_vblank_luma,
+			v->time_per_pte_group_flip_luma,
+			v->time_per_pte_group_nom_chroma,
+			v->time_per_pte_group_vblank_chroma,
+			v->time_per_pte_group_flip_chroma);
+
+	CalculateVMGroupAndRequestTimes(
+			v->NumberOfActivePlanes,
+			v->GPUVMEnable,
+			v->GPUVMMaxPageTableLevels,
+			v->HTotal,
+			v->BytePerPixelC,
+			v->DestinationLinesToRequestVMInVBlank,
+			v->DestinationLinesToRequestVMInImmediateFlip,
+			v->DCCEnable,
+			v->PixelClock,
+			v->dpte_row_width_luma_ub,
+			v->dpte_row_width_chroma_ub,
+			v->vm_group_bytes,
+			v->dpde0_bytes_per_frame_ub_l,
+			v->dpde0_bytes_per_frame_ub_c,
+			v->meta_pte_bytes_per_frame_ub_l,
+			v->meta_pte_bytes_per_frame_ub_c,
+			v->TimePerVMGroupVBlank,
+			v->TimePerVMGroupFlip,
+			v->TimePerVMRequestVBlank,
+			v->TimePerVMRequestFlip);
+
+
+	// Min TTUVBlank
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (PrefetchMode == 0) {
+			v->AllowDRAMClockChangeDuringVBlank[k] = true;
+			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
+			v->MinTTUVBlank[k] = dml_max(
+					v->DRAMClockChangeWatermark,
+					dml_max(
+							v->StutterEnterPlusExitWatermark,
+							v->UrgentWatermark));
+		} else if (PrefetchMode == 1) {
+			v->AllowDRAMClockChangeDuringVBlank[k] = false;
+			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
+			v->MinTTUVBlank[k] = dml_max(
+					v->StutterEnterPlusExitWatermark,
+					v->UrgentWatermark);
+		} else {
+			v->AllowDRAMClockChangeDuringVBlank[k] = false;
+			v->AllowDRAMSelfRefreshDuringVBlank[k] = false;
+			v->MinTTUVBlank[k] = v->UrgentWatermark;
+		}
+		if (!v->DynamicMetadataEnable[k])
+			v->MinTTUVBlank[k] = v->TCalc
+					+ v->MinTTUVBlank[k];
+	}
+
+	// DCC Configuration
+	v->ActiveDPPs = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		CalculateDCCConfiguration(v->DCCEnable[k], false, // We should always know the direction DCCProgrammingAssumesScanDirectionUnknown,
+				v->SourcePixelFormat[k],
+				v->SurfaceWidthY[k],
+				v->SurfaceWidthC[k],
+				v->SurfaceHeightY[k],
+				v->SurfaceHeightC[k],
+				v->DETBufferSizeInKByte * 1024,
+				v->BlockHeight256BytesY[k],
+				v->BlockHeight256BytesC[k],
+				v->SurfaceTiling[k],
+				v->BytePerPixelY[k],
+				v->BytePerPixelC[k],
+				v->BytePerPixelDETY[k],
+				v->BytePerPixelDETC[k],
+				v->SourceScan[k],
+				&v->DCCYMaxUncompressedBlock[k],
+				&v->DCCCMaxUncompressedBlock[k],
+				&v->DCCYMaxCompressedBlock[k],
+				&v->DCCCMaxCompressedBlock[k],
+				&v->DCCYIndependentBlock[k],
+				&v->DCCCIndependentBlock[k]);
+	}
+
+	{
+		//Maximum Bandwidth Used
+		double TotalWRBandwidth = 0;
+		double MaxPerPlaneVActiveWRBandwidth = 0;
+		double WRBandwidth = 0;
+		double MaxUsedBW = 0;
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			if (v->WritebackEnable[k] == true
+					&& v->WritebackPixelFormat[k] == dm_444_32) {
+				WRBandwidth = v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k]
+						/ (v->HTotal[k] * v->WritebackSourceHeight[k] / v->PixelClock[k]) * 4;
+			} else if (v->WritebackEnable[k] == true) {
+				WRBandwidth = v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k]
+						/ (v->HTotal[k] * v->WritebackSourceHeight[k] / v->PixelClock[k]) * 8;
+			}
+			TotalWRBandwidth = TotalWRBandwidth + WRBandwidth;
+			MaxPerPlaneVActiveWRBandwidth = dml_max(MaxPerPlaneVActiveWRBandwidth, WRBandwidth);
+		}
+
+		v->TotalDataReadBandwidth = 0;
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			v->TotalDataReadBandwidth = v->TotalDataReadBandwidth
+					+ v->ReadBandwidthPlaneLuma[k]
+					+ v->ReadBandwidthPlaneChroma[k];
+		}
+
+		{
+			double MaxPerPlaneVActiveRDBandwidth = 0;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				MaxPerPlaneVActiveRDBandwidth = dml_max(MaxPerPlaneVActiveRDBandwidth,
+						v->ReadBandwidthPlaneLuma[k] + v->ReadBandwidthPlaneChroma[k]);
+
+			}
+		}
+
+		MaxUsedBW = MaxTotalRDBandwidth + TotalWRBandwidth;
+	}
+
+	// VStartup Margin
+	v->VStartupMargin = 0;
+	v->FirstMainPlane = true;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] == k) {
+			double margin = (v->MaxVStartupLines[k] - v->VStartup[k]) * v->HTotal[k]
+					/ v->PixelClock[k];
+			if (v->FirstMainPlane == true) {
+				v->VStartupMargin = margin;
+				v->FirstMainPlane = false;
+			} else {
+				v->VStartupMargin = dml_min(v->VStartupMargin, margin);
+			}
+		}
+	}
+
+	// Stutter Efficiency
+	CalculateStutterEfficiency(
+			v->NumberOfActivePlanes,
+			v->ROBBufferSizeInKByte,
+			v->TotalDataReadBandwidth,
+			v->DCFCLK,
+			v->ReturnBW,
+			v->SRExitTime,
+			v->SynchronizedVBlank,
+			v->DPPPerPlane,
+			v->DETBufferSizeY,
+			v->BytePerPixelY,
+			v->BytePerPixelDETY,
+			v->SwathWidthY,
+			v->SwathHeightY,
+			v->SwathHeightC,
+			v->DCCRateLuma,
+			v->DCCRateChroma,
+			v->HTotal,
+			v->VTotal,
+			v->PixelClock,
+			v->VRatio,
+			v->SourceScan,
+			v->BlockHeight256BytesY,
+			v->BlockWidth256BytesY,
+			v->BlockHeight256BytesC,
+			v->BlockWidth256BytesC,
+			v->DCCYMaxUncompressedBlock,
+			v->DCCCMaxUncompressedBlock,
+			v->VActive,
+			v->DCCEnable,
+			v->WritebackEnable,
+			v->ReadBandwidthPlaneLuma,
+			v->ReadBandwidthPlaneChroma,
+			v->meta_row_bw,
+			v->dpte_row_bw,
+			&v->StutterEfficiencyNotIncludingVBlank,
+			&v->StutterEfficiency);
+}
+
+static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
+{
+	// Display Pipe Configuration
+	double BytePerPixDETY[DC__NUM_DPP__MAX] = { 0 };
+	double BytePerPixDETC[DC__NUM_DPP__MAX] = { 0 };
+	int BytePerPixY[DC__NUM_DPP__MAX] = { 0 };
+	int BytePerPixC[DC__NUM_DPP__MAX] = { 0 };
+	int Read256BytesBlockHeightY[DC__NUM_DPP__MAX] = { 0 };
+	int Read256BytesBlockHeightC[DC__NUM_DPP__MAX] = { 0 };
+	int Read256BytesBlockWidthY[DC__NUM_DPP__MAX] = { 0 };
+	int Read256BytesBlockWidthC[DC__NUM_DPP__MAX] = { 0 };
+	double dummy1[DC__NUM_DPP__MAX] = { 0 };
+	double dummy2[DC__NUM_DPP__MAX] = { 0 };
+	double dummy3[DC__NUM_DPP__MAX] = { 0 };
+	double dummy4[DC__NUM_DPP__MAX] = { 0 };
+	int dummy5[DC__NUM_DPP__MAX] = { 0 };
+	int dummy6[DC__NUM_DPP__MAX] = { 0 };
+	bool dummy7[DC__NUM_DPP__MAX] = { 0 };
+	bool dummysinglestring = 0;
+	unsigned int k;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
+
+		CalculateBytePerPixelAnd256BBlockSizes(
+				mode_lib->vba.SourcePixelFormat[k],
+				mode_lib->vba.SurfaceTiling[k],
+				&BytePerPixY[k],
+				&BytePerPixC[k],
+				&BytePerPixDETY[k],
+				&BytePerPixDETC[k],
+				&Read256BytesBlockHeightY[k],
+				&Read256BytesBlockHeightC[k],
+				&Read256BytesBlockWidthY[k],
+				&Read256BytesBlockWidthC[k]);
+	}
+	CalculateSwathAndDETConfiguration(
+			false,
+			mode_lib->vba.NumberOfActivePlanes,
+			mode_lib->vba.DETBufferSizeInKByte,
+			dummy1,
+			dummy2,
+			mode_lib->vba.SourceScan,
+			mode_lib->vba.SourcePixelFormat,
+			mode_lib->vba.SurfaceTiling,
+			mode_lib->vba.ViewportWidth,
+			mode_lib->vba.ViewportHeight,
+			mode_lib->vba.SurfaceWidthY,
+			mode_lib->vba.SurfaceWidthC,
+			mode_lib->vba.SurfaceHeightY,
+			mode_lib->vba.SurfaceHeightC,
+			Read256BytesBlockHeightY,
+			Read256BytesBlockHeightC,
+			Read256BytesBlockWidthY,
+			Read256BytesBlockWidthC,
+			mode_lib->vba.ODMCombineEnabled,
+			mode_lib->vba.BlendingAndTiming,
+			BytePerPixY,
+			BytePerPixC,
+			BytePerPixDETY,
+			BytePerPixDETC,
+			mode_lib->vba.HActive,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.HRatioChroma,
+			mode_lib->vba.DPPPerPlane,
+			dummy5,
+			dummy6,
+			dummy3,
+			dummy4,
+			mode_lib->vba.SwathHeightY,
+			mode_lib->vba.SwathHeightC,
+			mode_lib->vba.DETBufferSizeY,
+			mode_lib->vba.DETBufferSizeC,
+			dummy7,
+			&dummysinglestring);
+}
+
+static bool CalculateBytePerPixelAnd256BBlockSizes(
+		enum source_format_class SourcePixelFormat,
+		enum dm_swizzle_mode SurfaceTiling,
+		unsigned int *BytePerPixelY,
+		unsigned int *BytePerPixelC,
+		double       *BytePerPixelDETY,
+		double       *BytePerPixelDETC,
+		unsigned int *BlockHeight256BytesY,
+		unsigned int *BlockHeight256BytesC,
+		unsigned int *BlockWidth256BytesY,
+		unsigned int *BlockWidth256BytesC)
+{
+	if (SourcePixelFormat == dm_444_64) {
+		*BytePerPixelDETY = 8;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 8;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_rgbe_alpha) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 1;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 1;
+	} else if (SourcePixelFormat == dm_420_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 2;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 2;
+	} else if (SourcePixelFormat == dm_420_12) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 4;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	} else {
+		*BytePerPixelDETY = 4.0 / 3;
+		*BytePerPixelDETC = 8.0 / 3;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	}
+
+	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32
+			|| SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8
+			|| SourcePixelFormat == dm_mono_16 || SourcePixelFormat == dm_mono_8
+			|| SourcePixelFormat == dm_rgbe)) {
+		if (SurfaceTiling == dm_sw_linear) {
+			*BlockHeight256BytesY = 1;
+		} else if (SourcePixelFormat == dm_444_64) {
+			*BlockHeight256BytesY = 4;
+		} else if (SourcePixelFormat == dm_444_8) {
+			*BlockHeight256BytesY = 16;
+		} else {
+			*BlockHeight256BytesY = 8;
+		}
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockHeight256BytesC = 0;
+		*BlockWidth256BytesC = 0;
+	} else {
+		if (SurfaceTiling == dm_sw_linear) {
+			*BlockHeight256BytesY = 1;
+			*BlockHeight256BytesC = 1;
+		} else if (SourcePixelFormat == dm_rgbe_alpha) {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 16;
+		} else if (SourcePixelFormat == dm_420_8) {
+			*BlockHeight256BytesY = 16;
+			*BlockHeight256BytesC = 8;
+		} else {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 8;
+		}
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
+	}
+	return true;
+}
+
+static double CalculateTWait(
+		unsigned int PrefetchMode,
+		double DRAMClockChangeLatency,
+		double UrgentLatency,
+		double SREnterPlusExitTime)
+{
+	if (PrefetchMode == 0) {
+		return dml_max(DRAMClockChangeLatency + UrgentLatency,
+				dml_max(SREnterPlusExitTime, UrgentLatency));
+	} else if (PrefetchMode == 1) {
+		return dml_max(SREnterPlusExitTime, UrgentLatency);
+	} else {
+		return UrgentLatency;
+	}
+}
+
+double dml30_CalculateWriteBackDISPCLK(
+		enum source_format_class WritebackPixelFormat,
+		double PixelClock,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackHTaps,
+		unsigned int WritebackVTaps,
+		long   WritebackSourceWidth,
+		long   WritebackDestinationWidth,
+		unsigned int HTotal,
+		unsigned int WritebackLineBufferSize)
+{
+	double DISPCLK_H = 0, DISPCLK_V = 0, DISPCLK_HB = 0;
+
+	DISPCLK_H = PixelClock * dml_ceil(WritebackHTaps / 8.0, 1) / WritebackHRatio;
+	DISPCLK_V = PixelClock * (WritebackVTaps * dml_ceil(WritebackDestinationWidth / 6.0, 1) + 8.0) / HTotal;
+	DISPCLK_HB = PixelClock * WritebackVTaps * (WritebackDestinationWidth * WritebackVTaps - WritebackLineBufferSize / 57.0) / 6.0 / WritebackSourceWidth;
+	return dml_max3(DISPCLK_H, DISPCLK_V, DISPCLK_HB);
+}
+
+static double CalculateWriteBackDelay(
+		enum source_format_class WritebackPixelFormat,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackVTaps,
+		long         WritebackDestinationWidth,
+		long         WritebackDestinationHeight,
+		long         WritebackSourceHeight,
+		unsigned int HTotal)
+{
+	double CalculateWriteBackDelay = 0;
+	double Line_length = 0;
+	double Output_lines_last_notclamped = 0;
+	double WritebackVInit = 0;
+
+	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
+	Line_length = dml_max((double) WritebackDestinationWidth, dml_ceil(WritebackDestinationWidth / 6.0, 1) * WritebackVTaps);
+	Output_lines_last_notclamped = WritebackDestinationHeight - 1 - dml_ceil((WritebackSourceHeight - WritebackVInit) / WritebackVRatio, 1);
+	if (Output_lines_last_notclamped < 0) {
+		CalculateWriteBackDelay = 0;
+	} else {
+		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length + (HTotal - WritebackDestinationWidth) + 80;
+	}
+	return CalculateWriteBackDelay;
+}
+
+
+static void CalculateDynamicMetadataParameters(int MaxInterDCNTileRepeaters, double DPPCLK, double DISPCLK,
+		double DCFClkDeepSleep, double PixelClock, long HTotal, long VBlank, long DynamicMetadataTransmittedBytes,
+		long DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
+		double *Tsetup, double *Tdmbf, double *Tdmec, double *Tdmsks)
+{
+	double TotalRepeaterDelayTime = 0;
+	double VUpdateWidthPix = 0;
+	double VReadyOffsetPix = 0;
+	double VUpdateOffsetPix = 0;
+	TotalRepeaterDelayTime = MaxInterDCNTileRepeaters * (2 / DPPCLK + 3 / DISPCLK);
+	VUpdateWidthPix = (14 / DCFClkDeepSleep + 12 / DPPCLK + TotalRepeaterDelayTime) * PixelClock;
+	VReadyOffsetPix = dml_max(150.0 / DPPCLK, TotalRepeaterDelayTime + 20 / DCFClkDeepSleep + 10 / DPPCLK) * PixelClock;
+	VUpdateOffsetPix = dml_ceil(HTotal / 4.0, 1);
+	*Tsetup = (VUpdateOffsetPix + VUpdateWidthPix + VReadyOffsetPix) / PixelClock;
+	*Tdmbf = DynamicMetadataTransmittedBytes / 4.0 / DISPCLK;
+	*Tdmec = HTotal / PixelClock;
+	if (DynamicMetadataLinesBeforeActiveRequired == 0) {
+		*Tdmsks = VBlank * HTotal / PixelClock / 2.0;
+	} else {
+		*Tdmsks = DynamicMetadataLinesBeforeActiveRequired * HTotal / PixelClock;
+	}
+	if (InterlaceEnable == 1 && ProgressiveToInterlaceUnitInOPP == false) {
+		*Tdmsks = *Tdmsks / 2;
+	}
+}
+
+static void CalculateRowBandwidth(
+		bool GPUVMEnable,
+		enum source_format_class SourcePixelFormat,
+		double VRatio,
+		double VRatioChroma,
+		bool DCCEnable,
+		double LineTime,
+		unsigned int MetaRowByteLuma,
+		unsigned int MetaRowByteChroma,
+		unsigned int meta_row_height_luma,
+		unsigned int meta_row_height_chroma,
+		unsigned int PixelPTEBytesPerRowLuma,
+		unsigned int PixelPTEBytesPerRowChroma,
+		unsigned int dpte_row_height_luma,
+		unsigned int dpte_row_height_chroma,
+		double *meta_row_bw,
+		double *dpte_row_bw)
+{
+	if (DCCEnable != true) {
+		*meta_row_bw = 0;
+	} else if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_420_12 || SourcePixelFormat == dm_rgbe_alpha) {
+		*meta_row_bw = VRatio * MetaRowByteLuma / (meta_row_height_luma * LineTime)
+				+ VRatioChroma * MetaRowByteChroma
+						/ (meta_row_height_chroma * LineTime);
+	} else {
+		*meta_row_bw = VRatio * MetaRowByteLuma / (meta_row_height_luma * LineTime);
+	}
+
+	if (GPUVMEnable != true) {
+		*dpte_row_bw = 0;
+	} else if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_420_12 || SourcePixelFormat == dm_rgbe_alpha) {
+		*dpte_row_bw = VRatio * PixelPTEBytesPerRowLuma / (dpte_row_height_luma * LineTime)
+				+ VRatioChroma * PixelPTEBytesPerRowChroma
+						/ (dpte_row_height_chroma * LineTime);
+	} else {
+		*dpte_row_bw = VRatio * PixelPTEBytesPerRowLuma / (dpte_row_height_luma * LineTime);
+	}
+}
+
+static void CalculateFlipSchedule(
+		struct display_mode_lib *mode_lib,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double UrgentExtraLatency,
+		double UrgentLatency,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool GPUVMEnable,
+		double HostVMMinPageSize,
+		double PDEAndMetaPTEBytesPerFrame,
+		double MetaRowBytes,
+		double DPTEBytesPerRow,
+		double BandwidthAvailableForImmediateFlip,
+		unsigned int TotImmediateFlipBytes,
+		enum source_format_class SourcePixelFormat,
+		double LineTime,
+		double VRatio,
+		double VRatioChroma,
+		double Tno_bw,
+		bool DCCEnable,
+		unsigned int dpte_row_height,
+		unsigned int meta_row_height,
+		unsigned int dpte_row_height_chroma,
+		unsigned int meta_row_height_chroma,
+		double *DestinationLinesToRequestVMInImmediateFlip,
+		double *DestinationLinesToRequestRowInImmediateFlip,
+		double *final_flip_bw,
+		bool *ImmediateFlipSupportedForPipe)
+{
+	double min_row_time = 0.0;
+	unsigned int HostVMDynamicLevelsTrips = 0;
+	double TimeForFetchingMetaPTEImmediateFlip = 0;
+	double TimeForFetchingRowInVBlankImmediateFlip = 0;
+	double ImmediateFlipBW = 0;
+	double HostVMInefficiencyFactor = 0;
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		HostVMInefficiencyFactor = PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly;
+		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	} else {
+		HostVMInefficiencyFactor = 1;
+		HostVMDynamicLevelsTrips = 0;
+	}
+
+	if (GPUVMEnable == true || DCCEnable == true) {
+		ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) * BandwidthAvailableForImmediateFlip / TotImmediateFlipBytes;
+	}
+
+	if (GPUVMEnable == true) {
+		TimeForFetchingMetaPTEImmediateFlip = dml_max3(Tno_bw + PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / ImmediateFlipBW,
+				UrgentExtraLatency + UrgentLatency * (GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1), LineTime / 4.0);
+	} else {
+		TimeForFetchingMetaPTEImmediateFlip = 0;
+	}
+
+	*DestinationLinesToRequestVMInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1) / 4.0;
+	if ((GPUVMEnable == true || DCCEnable == true)) {
+		TimeForFetchingRowInVBlankImmediateFlip = dml_max3((MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / ImmediateFlipBW,
+				UrgentLatency * (HostVMDynamicLevelsTrips + 1), LineTime / 4);
+	} else {
+		TimeForFetchingRowInVBlankImmediateFlip = 0;
+	}
+
+	*DestinationLinesToRequestRowInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1) / 4.0;
+
+	if (GPUVMEnable == true) {
+		*final_flip_bw = dml_max(PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / (*DestinationLinesToRequestVMInImmediateFlip * LineTime),
+				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime));
+	} else if ((GPUVMEnable == true || DCCEnable == true)) {
+		*final_flip_bw = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime);
+	} else {
+		*final_flip_bw = 0;
+	}
+
+
+	if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_rgbe_alpha) {
+		if (GPUVMEnable == true && DCCEnable != true) {
+			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, dpte_row_height_chroma * LineTime / VRatioChroma);
+		} else if (GPUVMEnable != true && DCCEnable == true) {
+			min_row_time = dml_min(meta_row_height * LineTime / VRatio, meta_row_height_chroma * LineTime / VRatioChroma);
+		} else {
+			min_row_time = dml_min4(dpte_row_height * LineTime / VRatio, meta_row_height * LineTime / VRatio,
+					dpte_row_height_chroma * LineTime / VRatioChroma, meta_row_height_chroma * LineTime / VRatioChroma);
+		}
+	} else {
+		if (GPUVMEnable == true && DCCEnable != true) {
+			min_row_time = dpte_row_height * LineTime / VRatio;
+		} else if (GPUVMEnable != true && DCCEnable == true) {
+			min_row_time = meta_row_height * LineTime / VRatio;
+		} else {
+			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, meta_row_height * LineTime / VRatio);
+		}
+	}
+
+	if (*DestinationLinesToRequestVMInImmediateFlip >= 32 || *DestinationLinesToRequestRowInImmediateFlip >= 16
+			|| TimeForFetchingMetaPTEImmediateFlip + 2 * TimeForFetchingRowInVBlankImmediateFlip > min_row_time) {
+		*ImmediateFlipSupportedForPipe = false;
+	} else {
+		*ImmediateFlipSupportedForPipe = true;
+	}
+}
+
+static double TruncToValidBPP(
+		double LinkBitRate,
+		int Lanes,
+		long HTotal,
+		long HActive,
+		double PixelClock,
+		double DesiredBPP,
+		bool DSCEnable,
+		enum output_encoder_class Output,
+		enum output_format_class Format,
+		unsigned int DSCInputBitPerComponent,
+		int DSCSlices,
+		int AudioRate,
+		int AudioLayout,
+		enum odm_combine_mode ODMCombine)
+{
+	double MaxLinkBPP = 0;
+	int MinDSCBPP = 0;
+	double MaxDSCBPP = 0;
+	int NonDSCBPP0 = 0;
+	int NonDSCBPP1 = 0;
+	int NonDSCBPP2 = 0;
+
+	if (Format == dm_420) {
+		NonDSCBPP0 = 12;
+		NonDSCBPP1 = 15;
+		NonDSCBPP2 = 18;
+		MinDSCBPP = 6;
+		MaxDSCBPP = 1.5 * DSCInputBitPerComponent - 1.0 / 16;
+	} else if (Format == dm_444) {
+		NonDSCBPP0 = 24;
+		NonDSCBPP1 = 30;
+		NonDSCBPP2 = 36;
+		MinDSCBPP = 8;
+		MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16;
+	} else {
+		if (Output == dm_hdmi) {
+			NonDSCBPP0 = 24;
+			NonDSCBPP1 = 24;
+			NonDSCBPP2 = 24;
+		}
+		else {
+			NonDSCBPP0 = 16;
+			NonDSCBPP1 = 20;
+			NonDSCBPP2 = 24;
+		}
+
+		if (Format == dm_n422) {
+			MinDSCBPP = 7;
+			MaxDSCBPP = 2 * DSCInputBitPerComponent - 1.0 / 16.0;
+		}
+		else {
+			MinDSCBPP = 8;
+			MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16.0;
+		}
+	}
+
+	if (DSCEnable && Output == dm_dp) {
+		MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock * (1 - 2.4 / 100);
+	} else {
+		MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock;
+	}
+
+	if (ODMCombine == dm_odm_combine_mode_4to1 && MaxLinkBPP > 16) {
+		MaxLinkBPP = 16;
+	} else if (ODMCombine == dm_odm_combine_mode_2to1 && MaxLinkBPP > 32) {
+		MaxLinkBPP = 32;
+	}
+
+
+	if (DesiredBPP == 0) {
+		if (DSCEnable) {
+			if (MaxLinkBPP < MinDSCBPP) {
+				return BPP_INVALID;
+			} else if (MaxLinkBPP >= MaxDSCBPP) {
+				return MaxDSCBPP;
+			} else {
+				return dml_floor(16.0 * MaxLinkBPP, 1.0) / 16.0;
+			}
+		} else {
+			if (MaxLinkBPP >= NonDSCBPP2) {
+				return NonDSCBPP2;
+			} else if (MaxLinkBPP >= NonDSCBPP1) {
+				return NonDSCBPP1;
+			} else if (MaxLinkBPP >= NonDSCBPP0) {
+				return NonDSCBPP0;
+			} else {
+				return BPP_INVALID;
+			}
+		}
+	} else {
+		if (!((DSCEnable == false && (DesiredBPP == NonDSCBPP2 || DesiredBPP == NonDSCBPP1 || DesiredBPP == NonDSCBPP0)) ||
+				(DSCEnable && DesiredBPP >= MinDSCBPP && DesiredBPP <= MaxDSCBPP))) {
+			return BPP_INVALID;
+		} else {
+			return DesiredBPP;
+		}
+	}
+	return BPP_INVALID;
+}
+
+void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
+{
+	struct vba_vars_st *v = &mode_lib->vba;
+	int MinPrefetchMode = 0;
+	int MaxPrefetchMode = 2;
+	int i;
+	unsigned int j, k, m;
+	bool   EnoughWritebackUnits = true;
+	bool   WritebackModeSupport = true;
+	bool   ViewportExceedsSurface = false;
+	double MaxTotalVActiveRDBandwidth = 0;
+	long ReorderingBytes = 0;
+	bool NotUrgentLatencyHiding[DC__NUM_DPP__MAX] = { 0 };
+
+	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
+
+	/*Scale Ratio, taps Support Check*/
+
+	v->ScaleRatioAndTapsSupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->ScalerEnabled[k] == false
+				&& ((v->SourcePixelFormat[k] != dm_444_64
+						&& v->SourcePixelFormat[k] != dm_444_32
+						&& v->SourcePixelFormat[k] != dm_444_16
+						&& v->SourcePixelFormat[k] != dm_mono_16
+						&& v->SourcePixelFormat[k] != dm_mono_8
+						&& v->SourcePixelFormat[k] != dm_rgbe
+						&& v->SourcePixelFormat[k] != dm_rgbe_alpha)
+						|| v->HRatio[k] != 1.0
+						|| v->htaps[k] != 1.0
+						|| v->VRatio[k] != 1.0
+						|| v->vtaps[k] != 1.0)) {
+			v->ScaleRatioAndTapsSupport = false;
+		} else if (v->vtaps[k] < 1.0 || v->vtaps[k] > 8.0
+				|| v->htaps[k] < 1.0 || v->htaps[k] > 8.0
+				|| (v->htaps[k] > 1.0
+						&& (v->htaps[k] % 2) == 1)
+				|| v->HRatio[k] > v->MaxHSCLRatio
+				|| v->VRatio[k] > v->MaxVSCLRatio
+				|| v->HRatio[k] > v->htaps[k]
+				|| v->VRatio[k] > v->vtaps[k]
+				|| (v->SourcePixelFormat[k] != dm_444_64
+						&& v->SourcePixelFormat[k] != dm_444_32
+						&& v->SourcePixelFormat[k] != dm_444_16
+						&& v->SourcePixelFormat[k] != dm_mono_16
+						&& v->SourcePixelFormat[k] != dm_mono_8
+						&& v->SourcePixelFormat[k] != dm_rgbe
+						&& (v->VTAPsChroma[k] < 1
+							|| v->VTAPsChroma[k] > 8
+							|| v->HTAPsChroma[k] < 1
+							|| v->HTAPsChroma[k] > 8
+							|| (v->HTAPsChroma[k] > 1 && v->HTAPsChroma[k] % 2 == 1)
+							|| v->HRatioChroma[k] > v->MaxHSCLRatio
+							|| v->VRatioChroma[k] > v->MaxVSCLRatio
+							|| v->HRatioChroma[k] > v->HTAPsChroma[k]
+							|| v->VRatioChroma[k] > v->VTAPsChroma[k]))) {
+			v->ScaleRatioAndTapsSupport = false;
+		}
+	}
+	/*Source Format, Pixel Format and Scan Support Check*/
+
+	v->SourceFormatPixelAndScanSupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if ((v->SurfaceTiling[k] == dm_sw_linear && (!(v->SourceScan[k] != dm_vert) || v->DCCEnable[k] == true))
+				|| ((v->SurfaceTiling[k] == dm_sw_64kb_d || v->SurfaceTiling[k] == dm_sw_64kb_d_t || v->SurfaceTiling[k] == dm_sw_64kb_d_x)
+						&& !(v->SourcePixelFormat[k] == dm_444_64))) {
+			v->SourceFormatPixelAndScanSupport = false;
+		}
+	}
+	/*Bandwidth Support Check*/
+
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		CalculateBytePerPixelAnd256BBlockSizes(
+				v->SourcePixelFormat[k],
+				v->SurfaceTiling[k],
+				&v->BytePerPixelY[k],
+				&v->BytePerPixelC[k],
+				&v->BytePerPixelInDETY[k],
+				&v->BytePerPixelInDETC[k],
+				&v->Read256BlockHeightY[k],
+				&v->Read256BlockHeightC[k],
+				&v->Read256BlockWidthY[k],
+				&v->Read256BlockWidthC[k]);
+	}
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->SourceScan[k] != dm_vert) {
+			v->SwathWidthYSingleDPP[k] = v->ViewportWidth[k];
+			v->SwathWidthCSingleDPP[k] = v->ViewportWidthChroma[k];
+		} else {
+			v->SwathWidthYSingleDPP[k] = v->ViewportHeight[k];
+			v->SwathWidthCSingleDPP[k] = v->ViewportHeightChroma[k];
+		}
+	}
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		v->ReadBandwidthLuma[k] = v->SwathWidthYSingleDPP[k] * dml_ceil(v->BytePerPixelInDETY[k], 1.0) / (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k];
+		v->ReadBandwidthChroma[k] = v->SwathWidthYSingleDPP[k] / 2 * dml_ceil(v->BytePerPixelInDETC[k], 2.0) / (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k] / 2.0;
+	}
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->WritebackEnable[k] == true
+				&& v->WritebackPixelFormat[k] == dm_444_64) {
+			v->WriteBandwidth[k] = v->WritebackDestinationWidth[k]
+					* v->WritebackDestinationHeight[k]
+					/ (v->WritebackSourceHeight[k]
+							* v->HTotal[k]
+							/ v->PixelClock[k]) * 8.0;
+		} else if (v->WritebackEnable[k] == true) {
+			v->WriteBandwidth[k] = v->WritebackDestinationWidth[k]
+					* v->WritebackDestinationHeight[k]
+					/ (v->WritebackSourceHeight[k]
+							* v->HTotal[k]
+							/ v->PixelClock[k]) * 4.0;
+		} else {
+			v->WriteBandwidth[k] = 0.0;
+		}
+	}
+
+	/*Writeback Latency support check*/
+
+	v->WritebackLatencySupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->WritebackEnable[k] == true) {
+			if (v->WritebackConfiguration == dm_whole_buffer_for_single_stream_no_interleave ||
+			    v->WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave) {
+				if (v->WriteBandwidth[k]
+						> 2.0 * v->WritebackInterfaceBufferSize * 1024
+								/ v->WritebackLatency) {
+					v->WritebackLatencySupport = false;
+				}
+			} else {
+				if (v->WriteBandwidth[k]
+						> v->WritebackInterfaceBufferSize * 1024
+								/ v->WritebackLatency) {
+					v->WritebackLatencySupport = false;
+				}
+			}
+		}
+	}
+
+	/*Writeback Mode Support Check*/
+
+	v->TotalNumberOfActiveWriteback = 0;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->WritebackEnable[k] == true) {
+			v->TotalNumberOfActiveWriteback =
+					v->TotalNumberOfActiveWriteback + 1;
+		}
+	}
+
+	if (v->TotalNumberOfActiveWriteback > v->MaxNumWriteback) {
+		EnoughWritebackUnits = false;
+	}
+	if (!v->WritebackSupportInterleaveAndUsingWholeBufferForASingleStream
+			&& (v->WritebackConfiguration == dm_whole_buffer_for_single_stream_no_interleave
+					|| v->WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave)) {
+
+		WritebackModeSupport = false;
+	}
+	if (v->WritebackConfiguration == dm_whole_buffer_for_single_stream_no_interleave && v->TotalNumberOfActiveWriteback > 1) {
+		WritebackModeSupport = false;
+	}
+
+	/*Writeback Scale Ratio and Taps Support Check*/
+
+	v->WritebackScaleRatioAndTapsSupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->WritebackEnable[k] == true) {
+			if (v->WritebackHRatio[k] > v->WritebackMaxHSCLRatio
+					|| v->WritebackVRatio[k]
+							> v->WritebackMaxVSCLRatio
+					|| v->WritebackHRatio[k]
+							< v->WritebackMinHSCLRatio
+					|| v->WritebackVRatio[k]
+							< v->WritebackMinVSCLRatio
+					|| v->WritebackHTaps[k]
+							> v->WritebackMaxHSCLTaps
+					|| v->WritebackVTaps[k]
+							> v->WritebackMaxVSCLTaps
+					|| v->WritebackHRatio[k]
+							> v->WritebackHTaps[k]
+					|| v->WritebackVRatio[k]
+							> v->WritebackVTaps[k]
+					|| (v->WritebackHTaps[k] > 2.0
+							&& ((v->WritebackHTaps[k] % 2)
+									== 1))) {
+				v->WritebackScaleRatioAndTapsSupport = false;
+			}
+			if (2.0 * v->WritebackDestinationWidth[k] * (v->WritebackVTaps[k] - 1) * 57 > v->WritebackLineBufferSize) {
+				v->WritebackScaleRatioAndTapsSupport = false;
+			}
+		}
+	}
+	/*Maximum DISPCLK/DPPCLK Support check*/
+
+	v->WritebackRequiredDISPCLK = 0.0;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->WritebackEnable[k] == true) {
+			v->WritebackRequiredDISPCLK = dml_max(v->WritebackRequiredDISPCLK,
+					dml30_CalculateWriteBackDISPCLK(
+							v->WritebackPixelFormat[k],
+							v->PixelClock[k],
+							v->WritebackHRatio[k],
+							v->WritebackVRatio[k],
+							v->WritebackHTaps[k],
+							v->WritebackVTaps[k],
+							v->WritebackSourceWidth[k],
+							v->WritebackDestinationWidth[k],
+							v->HTotal[k],
+							v->WritebackLineBufferSize));
+		}
+	}
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->HRatio[k] > 1.0) {
+			v->PSCL_FACTOR[k] = dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput * v->HRatio[k] / dml_ceil(v->htaps[k] / 6.0, 1.0));
+		} else {
+			v->PSCL_FACTOR[k] = dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput);
+		}
+		if (v->BytePerPixelC[k] == 0.0) {
+			v->PSCL_FACTOR_CHROMA[k] = 0.0;
+			v->MinDPPCLKUsingSingleDPP[k] = v->PixelClock[k]
+					* dml_max3(v->vtaps[k] / 6.0 * dml_min(1.0, v->HRatio[k]), v->HRatio[k] * v->VRatio[k] / v->PSCL_FACTOR[k], 1.0);
+			if ((v->htaps[k] > 6.0 || v->vtaps[k] > 6.0) && v->MinDPPCLKUsingSingleDPP[k] < 2.0 * v->PixelClock[k]) {
+				v->MinDPPCLKUsingSingleDPP[k] = 2.0 * v->PixelClock[k];
+			}
+		} else {
+			if (v->HRatioChroma[k] > 1.0) {
+				v->PSCL_FACTOR_CHROMA[k] = dml_min(v->MaxDCHUBToPSCLThroughput,
+						v->MaxPSCLToLBThroughput * v->HRatioChroma[k] / dml_ceil(v->HTAPsChroma[k] / 6.0, 1.0));
+			} else {
+				v->PSCL_FACTOR_CHROMA[k] = dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput);
+			}
+			v->MinDPPCLKUsingSingleDPP[k] = v->PixelClock[k] * dml_max5(v->vtaps[k] / 6.0 * dml_min(1.0, v->HRatio[k]),
+							v->HRatio[k] * v->VRatio[k] / v->PSCL_FACTOR[k],
+							v->VTAPsChroma[k] / 6.0 * dml_min(1.0, v->HRatioChroma[k]),
+							v->HRatioChroma[k] * v->VRatioChroma[k] / v->PSCL_FACTOR_CHROMA[k],
+							1.0);
+			if ((v->htaps[k] > 6.0 || v->vtaps[k] > 6.0 || v->HTAPsChroma[k] > 6.0 || v->VTAPsChroma[k] > 6.0)
+					&& v->MinDPPCLKUsingSingleDPP[k] < 2.0 * v->PixelClock[k]) {
+				v->MinDPPCLKUsingSingleDPP[k] = 2.0 * v->PixelClock[k];
+			}
+		}
+	}
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		int MaximumSwathWidthSupportLuma = 0;
+		int MaximumSwathWidthSupportChroma = 0;
+
+		if (v->SurfaceTiling[k] == dm_sw_linear) {
+			MaximumSwathWidthSupportLuma = 8192.0;
+		} else if (v->SourceScan[k] == dm_vert && v->BytePerPixelC[k] > 0) {
+			MaximumSwathWidthSupportLuma = 2880.0;
+		} else {
+			MaximumSwathWidthSupportLuma = 5760.0;
+		}
+
+		if (v->SourcePixelFormat[k] == dm_420_8 || v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_420_12) {
+			MaximumSwathWidthSupportChroma = MaximumSwathWidthSupportLuma / 2.0;
+		} else {
+			MaximumSwathWidthSupportChroma = MaximumSwathWidthSupportLuma;
+		}
+		v->MaximumSwathWidthInLineBufferLuma = v->LineBufferSize * dml_max(v->HRatio[k], 1.0) / v->LBBitPerPixel[k]
+				/ (v->vtaps[k] + dml_max(dml_ceil(v->VRatio[k], 1.0) - 2, 0.0));
+		if (v->BytePerPixelC[k] == 0.0) {
+			v->MaximumSwathWidthInLineBufferChroma = 0;
+		} else {
+			v->MaximumSwathWidthInLineBufferChroma = v->LineBufferSize * dml_max(v->HRatioChroma[k], 1.0) / v->LBBitPerPixel[k]
+					/ (v->VTAPsChroma[k] + dml_max(dml_ceil(v->VRatioChroma[k], 1.0) - 2, 0.0));
+		}
+		v->MaximumSwathWidthLuma[k] = dml_min(MaximumSwathWidthSupportLuma, v->MaximumSwathWidthInLineBufferLuma);
+		v->MaximumSwathWidthChroma[k] = dml_min(MaximumSwathWidthSupportChroma, v->MaximumSwathWidthInLineBufferChroma);
+	}
+
+	CalculateSwathAndDETConfiguration(
+			true,
+			v->NumberOfActivePlanes,
+			v->DETBufferSizeInKByte,
+			v->MaximumSwathWidthLuma,
+			v->MaximumSwathWidthChroma,
+			v->SourceScan,
+			v->SourcePixelFormat,
+			v->SurfaceTiling,
+			v->ViewportWidth,
+			v->ViewportHeight,
+			v->SurfaceWidthY,
+			v->SurfaceWidthC,
+			v->SurfaceHeightY,
+			v->SurfaceHeightC,
+			v->Read256BlockHeightY,
+			v->Read256BlockHeightC,
+			v->Read256BlockWidthY,
+			v->Read256BlockWidthC,
+			v->odm_combine_dummy,
+			v->BlendingAndTiming,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			v->BytePerPixelInDETY,
+			v->BytePerPixelInDETC,
+			v->HActive,
+			v->HRatio,
+			v->HRatioChroma,
+			v->DPPPerPlane,
+			v->swath_width_luma_ub,
+			v->swath_width_chroma_ub,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			v->SwathHeightY,
+			v->SwathHeightC,
+			v->DETBufferSizeY,
+			v->DETBufferSizeC,
+			v->SingleDPPViewportSizeSupportPerPlane,
+			&v->ViewportSizeSupport[0][0]);
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			v->MaxDispclkRoundedDownToDFSGranularity = RoundToDFSGranularityDown(v->MaxDispclk[i], v->DISPCLKDPPCLKVCOSpeed);
+			v->MaxDppclkRoundedDownToDFSGranularity = RoundToDFSGranularityDown(v->MaxDppclk[i], v->DISPCLKDPPCLKVCOSpeed);
+			v->RequiredDISPCLK[i][j] = 0.0;
+			v->DISPCLK_DPPCLK_Support[i][j] = true;
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				v->PlaneRequiredDISPCLKWithoutODMCombine = v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+						* (1.0 + v->DISPCLKRampingMargin / 100.0);
+				if ((v->PlaneRequiredDISPCLKWithoutODMCombine >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+					v->PlaneRequiredDISPCLKWithoutODMCombine = v->PixelClock[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+				}
+				v->PlaneRequiredDISPCLKWithODMCombine2To1 = v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+						* (1 + v->DISPCLKRampingMargin / 100.0);
+				if ((v->PlaneRequiredDISPCLKWithODMCombine2To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+					v->PlaneRequiredDISPCLKWithODMCombine2To1 = v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+				}
+				v->PlaneRequiredDISPCLKWithODMCombine4To1 = v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+						* (1 + v->DISPCLKRampingMargin / 100.0);
+				if ((v->PlaneRequiredDISPCLKWithODMCombine4To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+					v->PlaneRequiredDISPCLKWithODMCombine4To1 = v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+				}
+
+				if (v->ODMCombinePolicy == dm_odm_combine_policy_none) {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
+					v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithoutODMCombine;
+				} else if (v->ODMCombinePolicy == dm_odm_combine_policy_2to1) {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
+					v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithODMCombine2To1;
+				} else if (v->ODMCombinePolicy == dm_odm_combine_policy_4to1
+						|| v->PlaneRequiredDISPCLKWithODMCombine2To1 > v->MaxDispclkRoundedDownToDFSGranularity) {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_4to1;
+					v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithODMCombine4To1;
+				} else if (v->PlaneRequiredDISPCLKWithoutODMCombine > v->MaxDispclkRoundedDownToDFSGranularity) {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
+					v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithODMCombine2To1;
+				} else {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
+					v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithoutODMCombine;
+				}
+
+				if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
+					v->MPCCombine[i][j][k] = false;
+					v->NoOfDPP[i][j][k] = 4;
+					v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) / 4;
+				} else if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+					v->MPCCombine[i][j][k] = false;
+					v->NoOfDPP[i][j][k] = 2;
+					v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) / 2;
+				} else if ((v->WhenToDoMPCCombine == dm_mpc_never
+						|| (v->MinDPPCLKUsingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) <= v->MaxDppclkRoundedDownToDFSGranularity
+								&& v->SingleDPPViewportSizeSupportPerPlane[k] == true))) {
+					v->MPCCombine[i][j][k] = false;
+					v->NoOfDPP[i][j][k] = 1;
+					v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+				} else {
+					v->MPCCombine[i][j][k] = true;
+					v->NoOfDPP[i][j][k] = 2;
+					v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) / 2.0;
+				}
+				v->RequiredDISPCLK[i][j] = dml_max(v->RequiredDISPCLK[i][j], v->PlaneRequiredDISPCLK);
+				if ((v->MinDPPCLKUsingSingleDPP[k] / v->NoOfDPP[i][j][k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+						> v->MaxDppclkRoundedDownToDFSGranularity) || (v->PlaneRequiredDISPCLK > v->MaxDispclkRoundedDownToDFSGranularity)) {
+					v->DISPCLK_DPPCLK_Support[i][j] = false;
+				}
+			}
+			v->TotalNumberOfActiveDPP[i][j] = 0;
+			v->TotalNumberOfSingleDPPPlanes[i][j] = 0;
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				v->TotalNumberOfActiveDPP[i][j] = v->TotalNumberOfActiveDPP[i][j] + v->NoOfDPP[i][j][k];
+				if (v->NoOfDPP[i][j][k] == 1)
+					v->TotalNumberOfSingleDPPPlanes[i][j] = v->TotalNumberOfSingleDPPPlanes[i][j] + 1;
+			}
+			if (j == 1 && v->WhenToDoMPCCombine != dm_mpc_never) {
+				while (!(v->TotalNumberOfActiveDPP[i][j] >= v->MaxNumDPP || v->TotalNumberOfSingleDPPPlanes[i][j] == 0)) {
+					double BWOfNonSplitPlaneOfMaximumBandwidth = 0;
+					unsigned int NumberOfNonSplitPlaneOfMaximumBandwidth = 0;
+					BWOfNonSplitPlaneOfMaximumBandwidth = 0;
+					NumberOfNonSplitPlaneOfMaximumBandwidth = 0;
+					for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+						if (v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k] > BWOfNonSplitPlaneOfMaximumBandwidth
+								&& v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled && v->MPCCombine[i][j][k] == false) {
+							BWOfNonSplitPlaneOfMaximumBandwidth = v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k];
+							NumberOfNonSplitPlaneOfMaximumBandwidth = k;
+						}
+					}
+					v->MPCCombine[i][j][NumberOfNonSplitPlaneOfMaximumBandwidth] = true;
+					v->NoOfDPP[i][j][NumberOfNonSplitPlaneOfMaximumBandwidth] = 2;
+					v->RequiredDPPCLK[i][j][NumberOfNonSplitPlaneOfMaximumBandwidth] = v->MinDPPCLKUsingSingleDPP[NumberOfNonSplitPlaneOfMaximumBandwidth]
+							* (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100) / 2;
+					v->TotalNumberOfActiveDPP[i][j] = v->TotalNumberOfActiveDPP[i][j] + 1;
+					v->TotalNumberOfSingleDPPPlanes[i][j] = v->TotalNumberOfSingleDPPPlanes[i][j] + 1;
+				}
+			}
+			if (v->TotalNumberOfActiveDPP[i][j] > v->MaxNumDPP) {
+				v->RequiredDISPCLK[i][j] = 0.0;
+				v->DISPCLK_DPPCLK_Support[i][j] = true;
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
+					if (v->SingleDPPViewportSizeSupportPerPlane[k] == false && v->WhenToDoMPCCombine != dm_mpc_never) {
+						v->MPCCombine[i][j][k] = true;
+						v->NoOfDPP[i][j][k] = 2;
+						v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) / 2.0;
+					} else {
+						v->MPCCombine[i][j][k] = false;
+						v->NoOfDPP[i][j][k] = 1;
+						v->RequiredDPPCLK[i][j][k] = v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+					}
+					if (!(v->MaxDispclk[i] == v->MaxDispclk[v->soc.num_states - 1] && v->MaxDppclk[i] == v->MaxDppclk[v->soc.num_states - 1])) {
+						v->PlaneRequiredDISPCLK = v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+								* (1.0 + v->DISPCLKRampingMargin / 100.0);
+					} else {
+						v->PlaneRequiredDISPCLK = v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
+					}
+					v->RequiredDISPCLK[i][j] = dml_max(v->RequiredDISPCLK[i][j], v->PlaneRequiredDISPCLK);
+					if ((v->MinDPPCLKUsingSingleDPP[k] / v->NoOfDPP[i][j][k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
+							> v->MaxDppclkRoundedDownToDFSGranularity) || (v->PlaneRequiredDISPCLK > v->MaxDispclkRoundedDownToDFSGranularity)) {
+						v->DISPCLK_DPPCLK_Support[i][j] = false;
+					}
+				}
+				v->TotalNumberOfActiveDPP[i][j] = 0.0;
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					v->TotalNumberOfActiveDPP[i][j] = v->TotalNumberOfActiveDPP[i][j] + v->NoOfDPP[i][j][k];
+				}
+			}
+			v->RequiredDISPCLK[i][j] = dml_max(v->RequiredDISPCLK[i][j], v->WritebackRequiredDISPCLK);
+			if (v->MaxDispclkRoundedDownToDFSGranularity < v->WritebackRequiredDISPCLK) {
+				v->DISPCLK_DPPCLK_Support[i][j] = false;
+			}
+		}
+	}
+
+	/*Total Available Pipes Support Check*/
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			if (v->TotalNumberOfActiveDPP[i][j] <= v->MaxNumDPP) {
+				v->TotalAvailablePipesSupport[i][j] = true;
+			} else {
+				v->TotalAvailablePipesSupport[i][j] = false;
+			}
+		}
+	}
+	/*Display IO and DSC Support Check*/
+
+	v->NonsupportedDSCInputBPC = false;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (!(v->DSCInputBitPerComponent[k] == 12.0
+				|| v->DSCInputBitPerComponent[k] == 10.0
+				|| v->DSCInputBitPerComponent[k] == 8.0)) {
+			v->NonsupportedDSCInputBPC = true;
+		}
+	}
+
+	/*Number Of DSC Slices*/
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] == k) {
+			if (v->PixelClockBackEnd[k] > 3200) {
+				v->NumberOfDSCSlices[k] = dml_ceil(v->PixelClockBackEnd[k] / 400.0, 4.0);
+			} else if (v->PixelClockBackEnd[k] > 1360) {
+				v->NumberOfDSCSlices[k] = 8;
+			} else if (v->PixelClockBackEnd[k] > 680) {
+				v->NumberOfDSCSlices[k] = 4;
+			} else if (v->PixelClockBackEnd[k] > 340) {
+				v->NumberOfDSCSlices[k] = 2;
+			} else {
+				v->NumberOfDSCSlices[k] = 1;
+			}
+		} else {
+			v->NumberOfDSCSlices[k] = 0;
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			v->RequiresDSC[i][k] = false;
+			v->RequiresFEC[i][k] = false;
+			if (v->BlendingAndTiming[k] == k) {
+				if (v->Output[k] == dm_hdmi) {
+					v->RequiresDSC[i][k] = false;
+					v->RequiresFEC[i][k] = false;
+					v->OutputBppPerState[i][k] = TruncToValidBPP(
+							dml_min(600.0, v->PHYCLKPerState[i]) * 10,
+							3,
+							v->HTotal[k],
+							v->HActive[k],
+							v->PixelClockBackEnd[k],
+							v->ForcedOutputLinkBPP[k],
+							false,
+							v->Output[k],
+							v->OutputFormat[k],
+							v->DSCInputBitPerComponent[k],
+							v->NumberOfDSCSlices[k],
+							v->AudioSampleRate[k],
+							v->AudioSampleLayout[k],
+							v->ODMCombineEnablePerState[i][k]);
+				} else if (v->Output[k] == dm_dp || v->Output[k] == dm_edp) {
+					if (v->DSCEnable[k] == true) {
+						v->RequiresDSC[i][k] = true;
+						v->LinkDSCEnable = true;
+						if (v->Output[k] == dm_dp) {
+							v->RequiresFEC[i][k] = true;
+						} else {
+							v->RequiresFEC[i][k] = false;
+						}
+					} else {
+						v->RequiresDSC[i][k] = false;
+						v->LinkDSCEnable = false;
+						v->RequiresFEC[i][k] = false;
+					}
+
+					v->Outbpp = BPP_INVALID;
+					if (v->PHYCLKPerState[i] >= 270.0) {
+						v->Outbpp = TruncToValidBPP(
+								(1.0 - v->Downspreading / 100.0) * 2700,
+								v->OutputLinkDPLanes[k],
+								v->HTotal[k],
+								v->HActive[k],
+								v->PixelClockBackEnd[k],
+								v->ForcedOutputLinkBPP[k],
+								v->LinkDSCEnable,
+								v->Output[k],
+								v->OutputFormat[k],
+								v->DSCInputBitPerComponent[k],
+								v->NumberOfDSCSlices[k],
+								v->AudioSampleRate[k],
+								v->AudioSampleLayout[k],
+								v->ODMCombineEnablePerState[i][k]);
+						v->OutputBppPerState[i][k] = v->Outbpp;
+						// TODO: Need some other way to handle this nonsense
+						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR"
+					}
+					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 540.0) {
+						v->Outbpp = TruncToValidBPP(
+								(1.0 - v->Downspreading / 100.0) * 5400,
+								v->OutputLinkDPLanes[k],
+								v->HTotal[k],
+								v->HActive[k],
+								v->PixelClockBackEnd[k],
+								v->ForcedOutputLinkBPP[k],
+								v->LinkDSCEnable,
+								v->Output[k],
+								v->OutputFormat[k],
+								v->DSCInputBitPerComponent[k],
+								v->NumberOfDSCSlices[k],
+								v->AudioSampleRate[k],
+								v->AudioSampleLayout[k],
+								v->ODMCombineEnablePerState[i][k]);
+						v->OutputBppPerState[i][k] = v->Outbpp;
+						// TODO: Need some other way to handle this nonsense
+						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR2"
+					}
+					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 810.0) {
+						v->Outbpp = TruncToValidBPP(
+								(1.0 - v->Downspreading / 100.0) * 8100,
+								v->OutputLinkDPLanes[k],
+								v->HTotal[k],
+								v->HActive[k],
+								v->PixelClockBackEnd[k],
+								v->ForcedOutputLinkBPP[k],
+								v->LinkDSCEnable,
+								v->Output[k],
+								v->OutputFormat[k],
+								v->DSCInputBitPerComponent[k],
+								v->NumberOfDSCSlices[k],
+								v->AudioSampleRate[k],
+								v->AudioSampleLayout[k],
+								v->ODMCombineEnablePerState[i][k]);
+						if (v->Outbpp == BPP_INVALID && v->ForcedOutputLinkBPP[k] == 0) {
+							//if (v->Outbpp == BPP_INVALID && v->DSCEnabled[k] == dm_dsc_enable_only_if_necessary && v->ForcedOutputLinkBPP[k] == 0) {
+							v->RequiresDSC[i][k] = true;
+							v->LinkDSCEnable = true;
+							if (v->Output[k] == dm_dp) {
+								v->RequiresFEC[i][k] = true;
+							}
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 8100,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+						}
+						v->OutputBppPerState[i][k] = v->Outbpp;
+						// TODO: Need some other way to handle this nonsense
+						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR3"
+					}
+				}
+			} else {
+				v->OutputBppPerState[i][k] = 0;
+			}
+		}
+	}
+	for (i = 0; i < v->soc.num_states; i++) {
+		v->DIOSupport[i] = true;
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			if (v->BlendingAndTiming[k] == k && (v->Output[k] == dm_dp || v->Output[k] == dm_edp || v->Output[k] == dm_hdmi)
+					&& (v->OutputBppPerState[i][k] == 0
+							|| (v->OutputFormat[k] == dm_420 && v->Interlace[k] == true && v->ProgressiveToInterlaceUnitInOPP == true))) {
+				v->DIOSupport[i] = false;
+			}
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; ++i) {
+		v->ODMCombine4To1SupportCheckOK[i] = true;
+		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+			if (v->BlendingAndTiming[k] == k && v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
+					&& (v->ODMCombine4To1Supported == false || v->Output[k] == dm_dp || v->Output[k] == dm_edp || v->Output[k] == dm_hdmi)) {
+				v->ODMCombine4To1SupportCheckOK[i] = false;
+			}
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		v->DSCCLKRequiredMoreThanSupported[i] = false;
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			if (v->BlendingAndTiming[k] == k) {
+				if (v->Output[k] == dm_dp || v->Output[k] == dm_edp) {
+					if (v->OutputFormat[k] == dm_420) {
+						v->DSCFormatFactor = 2;
+					} else if (v->OutputFormat[k] == dm_444) {
+						v->DSCFormatFactor = 1;
+					} else if (v->OutputFormat[k] == dm_n422) {
+						v->DSCFormatFactor = 2;
+					} else {
+						v->DSCFormatFactor = 1;
+					}
+					if (v->RequiresDSC[i][k] == true) {
+						if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
+							if (v->PixelClockBackEnd[k] / 12.0 / v->DSCFormatFactor
+									> (1.0 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
+								v->DSCCLKRequiredMoreThanSupported[i] = true;
+							}
+						} else if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+							if (v->PixelClockBackEnd[k] / 6.0 / v->DSCFormatFactor
+									> (1.0 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
+								v->DSCCLKRequiredMoreThanSupported[i] = true;
+							}
+						} else {
+							if (v->PixelClockBackEnd[k] / 3.0 / v->DSCFormatFactor
+									> (1.0 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
+								v->DSCCLKRequiredMoreThanSupported[i] = true;
+							}
+						}
+					}
+				}
+			}
+		}
+	}
+	for (i = 0; i < v->soc.num_states; i++) {
+		v->NotEnoughDSCUnits[i] = false;
+		v->TotalDSCUnitsRequired = 0.0;
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			if (v->RequiresDSC[i][k] == true) {
+				if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
+					v->TotalDSCUnitsRequired = v->TotalDSCUnitsRequired + 4.0;
+				} else if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+					v->TotalDSCUnitsRequired = v->TotalDSCUnitsRequired + 2.0;
+				} else {
+					v->TotalDSCUnitsRequired = v->TotalDSCUnitsRequired + 1.0;
+				}
+			}
+		}
+		if (v->TotalDSCUnitsRequired > v->NumberOfDSC) {
+			v->NotEnoughDSCUnits[i] = true;
+		}
+	}
+	/*DSC Delay per state*/
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			if (v->OutputBppPerState[i][k] == BPP_INVALID) {
+				v->BPP = 0.0;
+			} else {
+				v->BPP = v->OutputBppPerState[i][k];
+			}
+			if (v->RequiresDSC[i][k] == true && v->BPP != 0.0) {
+				if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_disabled) {
+					v->DSCDelayPerState[i][k] = dscceComputeDelay(
+							v->DSCInputBitPerComponent[k],
+							v->BPP,
+							dml_ceil(1.0 * v->HActive[k] / v->NumberOfDSCSlices[k], 1.0),
+							v->NumberOfDSCSlices[k],
+							v->OutputFormat[k],
+							v->Output[k]) + dscComputeDelay(v->OutputFormat[k], v->Output[k]);
+				} else if (v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+					v->DSCDelayPerState[i][k] = 2.0
+							* dscceComputeDelay(
+									v->DSCInputBitPerComponent[k],
+									v->BPP,
+									dml_ceil(1.0 * v->HActive[k] / v->NumberOfDSCSlices[k], 1.0),
+									v->NumberOfDSCSlices[k] / 2,
+									v->OutputFormat[k],
+									v->Output[k]) + dscComputeDelay(v->OutputFormat[k], v->Output[k]);
+				} else {
+					v->DSCDelayPerState[i][k] = 4.0
+							* (dscceComputeDelay(
+									v->DSCInputBitPerComponent[k],
+									v->BPP,
+									dml_ceil(1.0 * v->HActive[k] / v->NumberOfDSCSlices[k], 1.0),
+									v->NumberOfDSCSlices[k] / 4,
+									v->OutputFormat[k],
+									v->Output[k]) + dscComputeDelay(v->OutputFormat[k], v->Output[k]));
+				}
+				v->DSCDelayPerState[i][k] = v->DSCDelayPerState[i][k] * v->PixelClock[k] / v->PixelClockBackEnd[k];
+			} else {
+				v->DSCDelayPerState[i][k] = 0.0;
+			}
+		}
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			for (m = 0; m <= v->NumberOfActivePlanes - 1; m++) {
+				if (v->BlendingAndTiming[k] == m && v->RequiresDSC[i][m] == true) {
+					v->DSCDelayPerState[i][k] = v->DSCDelayPerState[i][m];
+				}
+			}
+		}
+	}
+
+	//Calculate Swath, DET Configuration, DCFCLKDeepSleep
+	//
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->RequiredDPPCLKThisState[k] = v->RequiredDPPCLK[i][j][k];
+				v->NoOfDPPThisState[k] = v->NoOfDPP[i][j][k];
+				v->ODMCombineEnableThisState[k] = v->ODMCombineEnablePerState[i][k];
+			}
+
+			CalculateSwathAndDETConfiguration(
+					false,
+					v->NumberOfActivePlanes,
+					v->DETBufferSizeInKByte,
+					v->MaximumSwathWidthLuma,
+					v->MaximumSwathWidthChroma,
+					v->SourceScan,
+					v->SourcePixelFormat,
+					v->SurfaceTiling,
+					v->ViewportWidth,
+					v->ViewportHeight,
+					v->SurfaceWidthY,
+					v->SurfaceWidthC,
+					v->SurfaceHeightY,
+					v->SurfaceHeightC,
+					v->Read256BlockHeightY,
+					v->Read256BlockHeightC,
+					v->Read256BlockWidthY,
+					v->Read256BlockWidthC,
+					v->ODMCombineEnableThisState,
+					v->BlendingAndTiming,
+					v->BytePerPixelY,
+					v->BytePerPixelC,
+					v->BytePerPixelInDETY,
+					v->BytePerPixelInDETC,
+					v->HActive,
+					v->HRatio,
+					v->HRatioChroma,
+					v->NoOfDPPThisState,
+					v->swath_width_luma_ub_this_state,
+					v->swath_width_chroma_ub_this_state,
+					v->SwathWidthYThisState,
+					v->SwathWidthCThisState,
+					v->SwathHeightYThisState,
+					v->SwathHeightCThisState,
+					v->DETBufferSizeYThisState,
+					v->DETBufferSizeCThisState,
+					v->dummystring,
+					&v->ViewportSizeSupport[i][j]);
+
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->swath_width_luma_ub_all_states[i][j][k] = v->swath_width_luma_ub_this_state[k];
+				v->swath_width_chroma_ub_all_states[i][j][k] = v->swath_width_chroma_ub_this_state[k];
+				v->SwathWidthYAllStates[i][j][k] = v->SwathWidthYThisState[k];
+				v->SwathWidthCAllStates[i][j][k] = v->SwathWidthCThisState[k];
+				v->SwathHeightYAllStates[i][j][k] = v->SwathHeightYThisState[k];
+				v->SwathHeightCAllStates[i][j][k] = v->SwathHeightCThisState[k];
+				v->DETBufferSizeYAllStates[i][j][k] = v->DETBufferSizeYThisState[k];
+				v->DETBufferSizeCAllStates[i][j][k] = v->DETBufferSizeCThisState[k];
+			}
+
+		}
+	}
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->cursor_bw[k] = v->NumberOfCursors[k] * v->CursorWidth[k][0] * v->CursorBPP[k][0] / 8.0 / (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k];
+	}
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				v->swath_width_luma_ub_this_state[k] = v->swath_width_luma_ub_all_states[i][j][k];
+				v->swath_width_chroma_ub_this_state[k] = v->swath_width_chroma_ub_all_states[i][j][k];
+				v->SwathWidthYThisState[k] = v->SwathWidthYAllStates[i][j][k];
+				v->SwathWidthCThisState[k] = v->SwathWidthCAllStates[i][j][k];
+				v->SwathHeightYThisState[k] = v->SwathHeightYAllStates[i][j][k];
+				v->SwathHeightCThisState[k] = v->SwathHeightCAllStates[i][j][k];
+				v->DETBufferSizeYThisState[k] = v->DETBufferSizeYAllStates[i][j][k];
+				v->DETBufferSizeCThisState[k] = v->DETBufferSizeCAllStates[i][j][k];
+			}
+
+			v->TotalNumberOfDCCActiveDPP[i][j] = 0;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				if (v->DCCEnable[k] == true) {
+					v->TotalNumberOfDCCActiveDPP[i][j] = v->TotalNumberOfDCCActiveDPP[i][j] + v->NoOfDPP[i][j][k];
+				}
+			}
+
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				if (v->SourcePixelFormat[k] == dm_420_8 || v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_420_12
+						|| v->SourcePixelFormat[k] == dm_rgbe_alpha) {
+
+					if ((v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_420_12) && v->SourceScan[k] != dm_vert) {
+						v->PTEBufferSizeInRequestsForLuma = (v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInRequestsChroma) / 2;
+						v->PTEBufferSizeInRequestsForChroma = v->PTEBufferSizeInRequestsForLuma;
+					} else {
+						v->PTEBufferSizeInRequestsForLuma = v->PTEBufferSizeInRequestsLuma;
+						v->PTEBufferSizeInRequestsForChroma = v->PTEBufferSizeInRequestsChroma;
+					}
+
+					v->PDEAndMetaPTEBytesPerFrameC = CalculateVMAndRowBytes(
+							mode_lib,
+							v->DCCEnable[k],
+							v->Read256BlockHeightC[k],
+							v->Read256BlockWidthY[k],
+							v->SourcePixelFormat[k],
+							v->SurfaceTiling[k],
+							v->BytePerPixelC[k],
+							v->SourceScan[k],
+							v->SwathWidthCThisState[k],
+							v->ViewportHeightChroma[k],
+							v->GPUVMEnable,
+							v->HostVMEnable,
+							v->HostVMMaxNonCachedPageTableLevels,
+							v->GPUVMMinPageSize,
+							v->HostVMMinPageSize,
+							v->PTEBufferSizeInRequestsForChroma,
+							v->PitchC[k],
+							0.0,
+							&v->MacroTileWidthC[k],
+							&v->MetaRowBytesC,
+							&v->DPTEBytesPerRowC,
+							&v->PTEBufferSizeNotExceededC[i][j][k],
+							&v->dummyinteger7,
+							&v->dpte_row_height_chroma[k],
+							&v->dummyinteger28,
+							&v->dummyinteger26,
+							&v->dummyinteger23,
+							&v->meta_row_height_chroma[k],
+							&v->dummyinteger8,
+							&v->dummyinteger9,
+							&v->dummyinteger19,
+							&v->dummyinteger20,
+							&v->dummyinteger17,
+							&v->dummyinteger10,
+							&v->dummyinteger11);
+
+					v->PrefetchLinesC[i][j][k] = CalculatePrefetchSourceLines(
+							mode_lib,
+							v->VRatioChroma[k],
+							v->VTAPsChroma[k],
+							v->Interlace[k],
+							v->ProgressiveToInterlaceUnitInOPP,
+							v->SwathHeightCThisState[k],
+							v->ViewportYStartC[k],
+							&v->PrefillC[k],
+							&v->MaxNumSwC[k]);
+				} else {
+					v->PTEBufferSizeInRequestsForLuma = v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInRequestsChroma;
+					v->PTEBufferSizeInRequestsForChroma = 0;
+					v->PDEAndMetaPTEBytesPerFrameC = 0.0;
+					v->MetaRowBytesC = 0.0;
+					v->DPTEBytesPerRowC = 0.0;
+					v->PrefetchLinesC[i][j][k] = 0.0;
+					v->PTEBufferSizeNotExceededC[i][j][k] = true;
+				}
+				v->PDEAndMetaPTEBytesPerFrameY = CalculateVMAndRowBytes(
+						mode_lib,
+						v->DCCEnable[k],
+						v->Read256BlockHeightY[k],
+						v->Read256BlockWidthY[k],
+						v->SourcePixelFormat[k],
+						v->SurfaceTiling[k],
+						v->BytePerPixelY[k],
+						v->SourceScan[k],
+						v->SwathWidthYThisState[k],
+						v->ViewportHeight[k],
+						v->GPUVMEnable,
+						v->HostVMEnable,
+						v->HostVMMaxNonCachedPageTableLevels,
+						v->GPUVMMinPageSize,
+						v->HostVMMinPageSize,
+						v->PTEBufferSizeInRequestsForLuma,
+						v->PitchY[k],
+						v->DCCMetaPitchY[k],
+						&v->MacroTileWidthY[k],
+						&v->MetaRowBytesY,
+						&v->DPTEBytesPerRowY,
+						&v->PTEBufferSizeNotExceededY[i][j][k],
+						v->dummyinteger4,
+						&v->dpte_row_height[k],
+						&v->dummyinteger29,
+						&v->dummyinteger27,
+						&v->dummyinteger24,
+						&v->meta_row_height[k],
+						&v->dummyinteger25,
+						&v->dpte_group_bytes[k],
+						&v->dummyinteger21,
+						&v->dummyinteger22,
+						&v->dummyinteger18,
+						&v->dummyinteger5,
+						&v->dummyinteger6);
+				v->PrefetchLinesY[i][j][k] = CalculatePrefetchSourceLines(
+						mode_lib,
+						v->VRatio[k],
+						v->vtaps[k],
+						v->Interlace[k],
+						v->ProgressiveToInterlaceUnitInOPP,
+						v->SwathHeightYThisState[k],
+						v->ViewportYStartY[k],
+						&v->PrefillY[k],
+						&v->MaxNumSwY[k]);
+				v->PDEAndMetaPTEBytesPerFrame[i][j][k] = v->PDEAndMetaPTEBytesPerFrameY + v->PDEAndMetaPTEBytesPerFrameC;
+				v->MetaRowBytes[i][j][k] = v->MetaRowBytesY + v->MetaRowBytesC;
+				v->DPTEBytesPerRow[i][j][k] = v->DPTEBytesPerRowY + v->DPTEBytesPerRowC;
+
+				CalculateRowBandwidth(
+						v->GPUVMEnable,
+						v->SourcePixelFormat[k],
+						v->VRatio[k],
+						v->VRatioChroma[k],
+						v->DCCEnable[k],
+						v->HTotal[k] / v->PixelClock[k],
+						v->MetaRowBytesY,
+						v->MetaRowBytesC,
+						v->meta_row_height[k],
+						v->meta_row_height_chroma[k],
+						v->DPTEBytesPerRowY,
+						v->DPTEBytesPerRowC,
+						v->dpte_row_height[k],
+						v->dpte_row_height_chroma[k],
+						&v->meta_row_bandwidth[i][j][k],
+						&v->dpte_row_bandwidth[i][j][k]);
+			}
+			v->UrgLatency[i] = CalculateUrgentLatency(
+					v->UrgentLatencyPixelDataOnly,
+					v->UrgentLatencyPixelMixedWithVMData,
+					v->UrgentLatencyVMDataOnly,
+					v->DoUrgentLatencyAdjustment,
+					v->UrgentLatencyAdjustmentFabricClockComponent,
+					v->UrgentLatencyAdjustmentFabricClockReference,
+					v->FabricClockPerState[i]);
+
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				CalculateUrgentBurstFactor(
+						v->swath_width_luma_ub_this_state[k],
+						v->swath_width_chroma_ub_this_state[k],
+						v->DETBufferSizeInKByte,
+						v->SwathHeightYThisState[k],
+						v->SwathHeightCThisState[k],
+						v->HTotal[k] / v->PixelClock[k],
+						v->UrgLatency[i],
+						v->CursorBufferSize,
+						v->CursorWidth[k][0],
+						v->CursorBPP[k][0],
+						v->VRatio[k],
+						v->VRatioChroma[k],
+						v->BytePerPixelInDETY[k],
+						v->BytePerPixelInDETC[k],
+						v->DETBufferSizeYThisState[k],
+						v->DETBufferSizeCThisState[k],
+						&v->UrgentBurstFactorCursor[k],
+						&v->UrgentBurstFactorLuma[k],
+						&v->UrgentBurstFactorChroma[k],
+						&NotUrgentLatencyHiding[k]);
+			}
+
+			v->NotUrgentLatencyHiding[i][j] = false;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				if (NotUrgentLatencyHiding[k]) {
+					v->NotUrgentLatencyHiding[i][j] = true;
+				}
+			}
+
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->VActivePixelBandwidth[i][j][k] = v->ReadBandwidthLuma[k] * v->UrgentBurstFactorLuma[k]
+						+ v->ReadBandwidthChroma[k] * v->UrgentBurstFactorChroma[k];
+				v->VActiveCursorBandwidth[i][j][k] = v->cursor_bw[k] * v->UrgentBurstFactorCursor[k];
+			}
+
+			v->TotalVActivePixelBandwidth[i][j] = 0;
+			v->TotalVActiveCursorBandwidth[i][j] = 0;
+			v->TotalMetaRowBandwidth[i][j] = 0;
+			v->TotalDPTERowBandwidth[i][j] = 0;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->TotalVActivePixelBandwidth[i][j] = v->TotalVActivePixelBandwidth[i][j] + v->VActivePixelBandwidth[i][j][k];
+				v->TotalVActiveCursorBandwidth[i][j] = v->TotalVActiveCursorBandwidth[i][j] + v->VActiveCursorBandwidth[i][j][k];
+				v->TotalMetaRowBandwidth[i][j] = v->TotalMetaRowBandwidth[i][j] + v->NoOfDPP[i][j][k] * v->meta_row_bandwidth[i][j][k];
+				v->TotalDPTERowBandwidth[i][j] = v->TotalDPTERowBandwidth[i][j] + v->NoOfDPP[i][j][k] * v->dpte_row_bandwidth[i][j][k];
+			}
+
+			CalculateDCFCLKDeepSleep(
+					mode_lib,
+					v->NumberOfActivePlanes,
+					v->BytePerPixelY,
+					v->BytePerPixelC,
+					v->VRatio,
+					v->VRatioChroma,
+					v->SwathWidthYThisState,
+					v->SwathWidthCThisState,
+					v->NoOfDPPThisState,
+					v->HRatio,
+					v->HRatioChroma,
+					v->PixelClock,
+					v->PSCL_FACTOR,
+					v->PSCL_FACTOR_CHROMA,
+					v->RequiredDPPCLKThisState,
+					v->ReadBandwidthLuma,
+					v->ReadBandwidthChroma,
+					v->ReturnBusWidth,
+					&v->ProjectedDCFCLKDeepSleep[i][j]);
+		}
+	}
+
+	//Calculate Return BW
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				if (v->BlendingAndTiming[k] == k) {
+					if (v->WritebackEnable[k] == true) {
+						v->WritebackDelayTime[k] = v->WritebackLatency
+								+ CalculateWriteBackDelay(
+										v->WritebackPixelFormat[k],
+										v->WritebackHRatio[k],
+										v->WritebackVRatio[k],
+										v->WritebackVTaps[k],
+										v->WritebackDestinationWidth[k],
+										v->WritebackDestinationHeight[k],
+										v->WritebackSourceHeight[k],
+										v->HTotal[k]) / v->RequiredDISPCLK[i][j];
+					} else {
+						v->WritebackDelayTime[k] = 0.0;
+					}
+					for (m = 0; m <= v->NumberOfActivePlanes - 1; m++) {
+						if (v->BlendingAndTiming[m] == k && v->WritebackEnable[m] == true) {
+							v->WritebackDelayTime[k] = dml_max(
+									v->WritebackDelayTime[k],
+									v->WritebackLatency
+											+ CalculateWriteBackDelay(
+													v->WritebackPixelFormat[m],
+													v->WritebackHRatio[m],
+													v->WritebackVRatio[m],
+													v->WritebackVTaps[m],
+													v->WritebackDestinationWidth[m],
+													v->WritebackDestinationHeight[m],
+													v->WritebackSourceHeight[m],
+													v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
+						}
+					}
+				}
+			}
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				for (m = 0; m <= v->NumberOfActivePlanes - 1; m++) {
+					if (v->BlendingAndTiming[k] == m) {
+						v->WritebackDelayTime[k] = v->WritebackDelayTime[m];
+					}
+				}
+			}
+			v->MaxMaxVStartup[i][j] = 0;
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				v->MaximumVStartup[i][j][k] = v->VTotal[k] - v->VActive[k]
+						- dml_max(1.0, dml_ceil(1.0 * v->WritebackDelayTime[k] / (v->HTotal[k] / v->PixelClock[k]), 1.0));
+				v->MaxMaxVStartup[i][j] = dml_max(v->MaxMaxVStartup[i][j], v->MaximumVStartup[i][j][k]);
+			}
+		}
+	}
+
+	ReorderingBytes = v->NumberOfChannels
+			* dml_max3(
+					v->UrgentOutOfOrderReturnPerChannelPixelDataOnly,
+					v->UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
+					v->UrgentOutOfOrderReturnPerChannelVMDataOnly);
+	v->FinalDRAMClockChangeLatency = (v->DRAMClockChangeLatencyOverride > 0 ? v->DRAMClockChangeLatencyOverride : v->DRAMClockChangeLatency);
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			v->DCFCLKState[i][j] = v->DCFCLKPerState[i];
+		}
+	}
+
+	if (v->UseMinimumRequiredDCFCLK == true) {
+		UseMinimumDCFCLK(
+				mode_lib,
+				v->MaxInterDCNTileRepeaters,
+				MaxPrefetchMode,
+				v->FinalDRAMClockChangeLatency,
+				v->SREnterPlusExitTime,
+				v->ReturnBusWidth,
+				v->RoundTripPingLatencyCycles,
+				ReorderingBytes,
+				v->PixelChunkSizeInKByte,
+				v->MetaChunkSize,
+				v->GPUVMEnable,
+				v->GPUVMMaxPageTableLevels,
+				v->HostVMEnable,
+				v->NumberOfActivePlanes,
+				v->HostVMMinPageSize,
+				v->HostVMMaxNonCachedPageTableLevels,
+				v->DynamicMetadataVMEnabled,
+				v->ImmediateFlipRequirement,
+				v->ProgressiveToInterlaceUnitInOPP,
+				v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
+				v->VTotal,
+				v->VActive,
+				v->DynamicMetadataTransmittedBytes,
+				v->DynamicMetadataLinesBeforeActiveRequired,
+				v->Interlace,
+				v->RequiredDPPCLK,
+				v->RequiredDISPCLK,
+				v->UrgLatency,
+				v->NoOfDPP,
+				v->ProjectedDCFCLKDeepSleep,
+				v->MaximumVStartup,
+				v->TotalVActivePixelBandwidth,
+				v->TotalVActiveCursorBandwidth,
+				v->TotalMetaRowBandwidth,
+				v->TotalDPTERowBandwidth,
+				v->TotalNumberOfActiveDPP,
+				v->TotalNumberOfDCCActiveDPP,
+				v->dpte_group_bytes,
+				v->PrefetchLinesY,
+				v->PrefetchLinesC,
+				v->swath_width_luma_ub_all_states,
+				v->swath_width_chroma_ub_all_states,
+				v->BytePerPixelY,
+				v->BytePerPixelC,
+				v->HTotal,
+				v->PixelClock,
+				v->PDEAndMetaPTEBytesPerFrame,
+				v->DPTEBytesPerRow,
+				v->MetaRowBytes,
+				v->DynamicMetadataEnable,
+				v->VActivePixelBandwidth,
+				v->VActiveCursorBandwidth,
+				v->ReadBandwidthLuma,
+				v->ReadBandwidthChroma,
+				v->DCFCLKPerState,
+				v->DCFCLKState);
+
+		if (v->ClampMinDCFCLK) {
+			/* Clamp calculated values to actual minimum */
+			for (i = 0; i < mode_lib->soc.num_states; ++i) {
+				for (j = 0; j <= 1; ++j) {
+					if (v->DCFCLKState[i][j] < mode_lib->soc.min_dcfclk) {
+						v->DCFCLKState[i][j] = mode_lib->soc.min_dcfclk;
+					}
+				}
+			}
+		}
+	}
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			v->IdealSDPPortBandwidthPerState[i][j] = dml_min3(
+					v->ReturnBusWidth * v->DCFCLKState[i][j],
+					v->DRAMSpeedPerState[i] * v->NumberOfChannels * v->DRAMChannelWidth,
+					v->FabricClockPerState[i] * v->FabricDatapathToDCNDataReturn);
+			if (v->HostVMEnable != true) {
+				v->ReturnBWPerState[i][j] = v->IdealSDPPortBandwidthPerState[i][j] * v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly
+						/ 100;
+			} else {
+				v->ReturnBWPerState[i][j] = v->IdealSDPPortBandwidthPerState[i][j]
+						* v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / 100;
+			}
+		}
+	}
+
+	//Re-ordering Buffer Support Check
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			if ((v->ROBBufferSizeInKByte - v->PixelChunkSizeInKByte) * 1024 / v->ReturnBWPerState[i][j]
+					> (v->RoundTripPingLatencyCycles + 32) / v->DCFCLKState[i][j] + ReorderingBytes / v->ReturnBWPerState[i][j]) {
+				v->ROBSupport[i][j] = true;
+			} else {
+				v->ROBSupport[i][j] = false;
+			}
+		}
+	}
+
+	//Vertical Active BW support check
+
+	MaxTotalVActiveRDBandwidth = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		MaxTotalVActiveRDBandwidth = MaxTotalVActiveRDBandwidth + v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k];
+	}
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			v->MaxTotalVerticalActiveAvailableBandwidth[i][j] = dml_min(
+					v->IdealSDPPortBandwidthPerState[i][j] * v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100,
+					v->DRAMSpeedPerState[i] * v->NumberOfChannels * v->DRAMChannelWidth * v->MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation
+							/ 100);
+			if (MaxTotalVActiveRDBandwidth <= v->MaxTotalVerticalActiveAvailableBandwidth[i][j]) {
+				v->TotalVerticalActiveBandwidthSupport[i][j] = true;
+			} else {
+				v->TotalVerticalActiveBandwidthSupport[i][j] = false;
+			}
+		}
+	}
+
+	//Prefetch Check
+
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			int NextPrefetchModeState = MinPrefetchMode;
+
+			v->TimeCalc = 24 / v->ProjectedDCFCLKDeepSleep[i][j];
+
+			v->BandwidthWithoutPrefetchSupported[i][j] = true;
+			if (v->TotalVActivePixelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRowBandwidth[i][j] + v->TotalDPTERowBandwidth[i][j]
+					> v->ReturnBWPerState[i][j] || v->NotUrgentLatencyHiding[i][j]) {
+				v->BandwidthWithoutPrefetchSupported[i][j] = false;
+			}
+
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+				v->NoOfDPPThisState[k] = v->NoOfDPP[i][j][k];
+				v->swath_width_luma_ub_this_state[k] = v->swath_width_luma_ub_all_states[i][j][k];
+				v->swath_width_chroma_ub_this_state[k] = v->swath_width_chroma_ub_all_states[i][j][k];
+				v->SwathWidthYThisState[k] = v->SwathWidthYAllStates[i][j][k];
+				v->SwathWidthCThisState[k] = v->SwathWidthCAllStates[i][j][k];
+				v->SwathHeightYThisState[k] = v->SwathHeightYAllStates[i][j][k];
+				v->SwathHeightCThisState[k] = v->SwathHeightCAllStates[i][j][k];
+				v->DETBufferSizeYThisState[k] = v->DETBufferSizeYAllStates[i][j][k];
+				v->DETBufferSizeCThisState[k] = v->DETBufferSizeCAllStates[i][j][k];
+				v->ODMCombineEnabled[k] = v->ODMCombineEnablePerState[i][k];
+			}
+
+			v->ExtraLatency = CalculateExtraLatency(
+					v->RoundTripPingLatencyCycles,
+					ReorderingBytes,
+					v->DCFCLKState[i][j],
+					v->TotalNumberOfActiveDPP[i][j],
+					v->PixelChunkSizeInKByte,
+					v->TotalNumberOfDCCActiveDPP[i][j],
+					v->MetaChunkSize,
+					v->ReturnBWPerState[i][j],
+					v->GPUVMEnable,
+					v->HostVMEnable,
+					v->NumberOfActivePlanes,
+					v->NoOfDPPThisState,
+					v->dpte_group_bytes,
+					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					v->HostVMMinPageSize,
+					v->HostVMMaxNonCachedPageTableLevels);
+
+			v->NextMaxVStartup = v->MaxMaxVStartup[i][j];
+			do {
+				v->PrefetchModePerState[i][j] = NextPrefetchModeState;
+				v->MaxVStartup = v->NextMaxVStartup;
+
+				v->TWait = CalculateTWait(v->PrefetchModePerState[i][j], v->FinalDRAMClockChangeLatency, v->UrgLatency[i], v->SREnterPlusExitTime);
+
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					Pipe myPipe = { 0 };
+
+					myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
+					myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
+					myPipe.PixelClock = v->PixelClock[k];
+					myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
+					myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
+					myPipe.ScalerEnabled = v->ScalerEnabled[k];
+					myPipe.SourceScan = v->SourceScan[k];
+					myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
+					myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
+					myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
+					myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
+					myPipe.InterlaceEnable = v->Interlace[k];
+					myPipe.NumberOfCursors = v->NumberOfCursors[k];
+					myPipe.VBlank = v->VTotal[k] - v->VActive[k];
+					myPipe.HTotal = v->HTotal[k];
+					myPipe.DCCEnable = v->DCCEnable[k];
+					myPipe.ODMCombineEnabled = !!v->ODMCombineEnabled[k];
+
+					v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
+							mode_lib,
+							v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+							v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+							&myPipe,
+							v->DSCDelayPerState[i][k],
+							v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
+							v->DPPCLKDelaySCL,
+							v->DPPCLKDelaySCLLBOnly,
+							v->DPPCLKDelayCNVCCursor,
+							v->DISPCLKDelaySubtotal,
+							v->SwathWidthYThisState[k] / v->HRatio[k],
+							v->OutputFormat[k],
+							v->MaxInterDCNTileRepeaters,
+							dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
+							v->MaximumVStartup[i][j][k],
+							v->GPUVMMaxPageTableLevels,
+							v->GPUVMEnable,
+							v->HostVMEnable,
+							v->HostVMMaxNonCachedPageTableLevels,
+							v->HostVMMinPageSize,
+							v->DynamicMetadataEnable[k],
+							v->DynamicMetadataVMEnabled,
+							v->DynamicMetadataLinesBeforeActiveRequired[k],
+							v->DynamicMetadataTransmittedBytes[k],
+							v->UrgLatency[i],
+							v->ExtraLatency,
+							v->TimeCalc,
+							v->PDEAndMetaPTEBytesPerFrame[i][j][k],
+							v->MetaRowBytes[i][j][k],
+							v->DPTEBytesPerRow[i][j][k],
+							v->PrefetchLinesY[i][j][k],
+							v->SwathWidthYThisState[k],
+							v->BytePerPixelY[k],
+							v->PrefillY[k],
+							v->MaxNumSwY[k],
+							v->PrefetchLinesC[i][j][k],
+							v->SwathWidthCThisState[k],
+							v->BytePerPixelC[k],
+							v->PrefillC[k],
+							v->MaxNumSwC[k],
+							v->swath_width_luma_ub_this_state[k],
+							v->swath_width_chroma_ub_this_state[k],
+							v->SwathHeightYThisState[k],
+							v->SwathHeightCThisState[k],
+							v->TWait,
+							v->ProgressiveToInterlaceUnitInOPP,
+							&v->DSTXAfterScaler[k],
+							&v->DSTYAfterScaler[k],
+							&v->LineTimesForPrefetch[k],
+							&v->PrefetchBW[k],
+							&v->LinesForMetaPTE[k],
+							&v->LinesForMetaAndDPTERow[k],
+							&v->VRatioPreY[i][j][k],
+							&v->VRatioPreC[i][j][k],
+							&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
+							&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
+							&v->NoTimeForDynamicMetadata[i][j][k],
+							&v->Tno_bw[k],
+							&v->prefetch_vmrow_bw[k],
+							&v->Tdmdl_vm[k],
+							&v->Tdmdl[k],
+							&v->VUpdateOffsetPix[k],
+							&v->VUpdateWidthPix[k],
+							&v->VReadyOffsetPix[k]);
+				}
+
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					CalculateUrgentBurstFactor(
+							v->swath_width_luma_ub_this_state[k],
+							v->swath_width_chroma_ub_this_state[k],
+							v->DETBufferSizeInKByte,
+							v->SwathHeightYThisState[k],
+							v->SwathHeightCThisState[k],
+							v->HTotal[k] / v->PixelClock[k],
+							v->UrgentLatency,
+							v->CursorBufferSize,
+							v->CursorWidth[k][0],
+							v->CursorBPP[k][0],
+							v->VRatioPreY[i][j][k],
+							v->VRatioPreC[i][j][k],
+							v->BytePerPixelInDETY[k],
+							v->BytePerPixelInDETC[k],
+							v->DETBufferSizeYThisState[k],
+							v->DETBufferSizeCThisState[k],
+							&v->UrgentBurstFactorCursorPre[k],
+							&v->UrgentBurstFactorLumaPre[k],
+							&v->UrgentBurstFactorChroma[k],
+							&v->NoUrgentLatencyHidingPre[k]);
+				}
+
+				v->MaximumReadBandwidthWithPrefetch = 0.0;
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					v->cursor_bw_pre[k] = v->NumberOfCursors[k] * v->CursorWidth[k][0] * v->CursorBPP[k][0] / 8.0 / (v->HTotal[k] / v->PixelClock[k])
+							* v->VRatioPreY[i][j][k];
+
+					v->MaximumReadBandwidthWithPrefetch = v->MaximumReadBandwidthWithPrefetch
+							+ dml_max4(
+									v->VActivePixelBandwidth[i][j][k],
+									v->VActiveCursorBandwidth[i][j][k]
+											+ v->NoOfDPP[i][j][k] * (v->meta_row_bandwidth[i][j][k] + v->dpte_row_bandwidth[i][j][k]),
+									v->NoOfDPP[i][j][k] * v->prefetch_vmrow_bw[k],
+									v->NoOfDPP[i][j][k]
+											* (v->RequiredPrefetchPixelDataBWLuma[i][j][k] * v->UrgentBurstFactorLumaPre[k]
+													+ v->RequiredPrefetchPixelDataBWChroma[i][j][k]
+															* v->UrgentBurstFactorChromaPre[k])
+											+ v->cursor_bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
+				}
+
+				v->NotEnoughUrgentLatencyHidingPre = false;
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					if (v->NoUrgentLatencyHidingPre[k] == true) {
+						v->NotEnoughUrgentLatencyHidingPre = true;
+					}
+				}
+
+				v->PrefetchSupported[i][j] = true;
+				if (v->BandwidthWithoutPrefetchSupported[i][j] == false || v->MaximumReadBandwidthWithPrefetch > v->ReturnBWPerState[i][j]
+						|| v->NotEnoughUrgentLatencyHidingPre == 1) {
+					v->PrefetchSupported[i][j] = false;
+				}
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					if (v->LineTimesForPrefetch[k] < 2.0 || v->LinesForMetaPTE[k] >= 32.0 || v->LinesForMetaAndDPTERow[k] >= 16.0
+							|| v->NoTimeForPrefetch[i][j][k] == true) {
+						v->PrefetchSupported[i][j] = false;
+					}
+				}
+
+				v->DynamicMetadataSupported[i][j] = true;
+				for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+					if (v->NoTimeForDynamicMetadata[i][j][k] == true) {
+						v->DynamicMetadataSupported[i][j] = false;
+					}
+				}
+
+				v->VRatioInPrefetchSupported[i][j] = true;
+				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+					if (v->VRatioPreY[i][j][k] > 4.0 || v->VRatioPreC[i][j][k] > 4.0 || v->NoTimeForPrefetch[i][j][k] == true) {
+						v->VRatioInPrefetchSupported[i][j] = false;
+					}
+				}
+				v->AnyLinesForVMOrRowTooLarge = false;
+				for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+					if (v->LinesForMetaAndDPTERow[k] >= 16 || v->LinesForMetaPTE[k] >= 32) {
+						v->AnyLinesForVMOrRowTooLarge = true;
+					}
+				}
+
+				if (v->PrefetchSupported[i][j] == true && v->VRatioInPrefetchSupported[i][j] == true) {
+					v->BandwidthAvailableForImmediateFlip = v->ReturnBWPerState[i][j];
+					for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+						v->BandwidthAvailableForImmediateFlip = v->BandwidthAvailableForImmediateFlip
+								- dml_max(
+										v->VActivePixelBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k],
+										v->NoOfDPP[i][j][k]
+												* (v->RequiredPrefetchPixelDataBWLuma[i][j][k] * v->UrgentBurstFactorLumaPre[k]
+														+ v->RequiredPrefetchPixelDataBWChroma[i][j][k]
+																* v->UrgentBurstFactorChromaPre[k])
+												+ v->cursor_bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
+					}
+					v->TotImmediateFlipBytes = 0.0;
+					for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+						v->TotImmediateFlipBytes = v->TotImmediateFlipBytes + v->NoOfDPP[i][j][k] * v->PDEAndMetaPTEBytesPerFrame[i][j][k]
+								+ v->MetaRowBytes[i][j][k] + v->DPTEBytesPerRow[i][j][k];
+					}
+
+					for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+						CalculateFlipSchedule(
+								mode_lib,
+								v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+								v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+								v->ExtraLatency,
+								v->UrgLatency[i],
+								v->GPUVMMaxPageTableLevels,
+								v->HostVMEnable,
+								v->HostVMMaxNonCachedPageTableLevels,
+								v->GPUVMEnable,
+								v->HostVMMinPageSize,
+								v->PDEAndMetaPTEBytesPerFrame[i][j][k],
+								v->MetaRowBytes[i][j][k],
+								v->DPTEBytesPerRow[i][j][k],
+								v->BandwidthAvailableForImmediateFlip,
+								v->TotImmediateFlipBytes,
+								v->SourcePixelFormat[k],
+								v->HTotal[k] / v->PixelClock[k],
+								v->VRatio[k],
+								v->VRatioChroma[k],
+								v->Tno_bw[k],
+								v->DCCEnable[k],
+								v->dpte_row_height[k],
+								v->meta_row_height[k],
+								v->dpte_row_height_chroma[k],
+								v->meta_row_height_chroma[k],
+								&v->DestinationLinesToRequestVMInImmediateFlip[k],
+								&v->DestinationLinesToRequestRowInImmediateFlip[k],
+								&v->final_flip_bw[k],
+								&v->ImmediateFlipSupportedForPipe[k]);
+					}
+					v->total_dcn_read_bw_with_flip = 0.0;
+					for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+						v->total_dcn_read_bw_with_flip = v->total_dcn_read_bw_with_flip
+								+ dml_max3(
+										v->NoOfDPP[i][j][k] * v->prefetch_vmrow_bw[k],
+										v->NoOfDPP[i][j][k] * v->final_flip_bw[k] + v->VActivePixelBandwidth[i][j][k]
+												+ v->VActiveCursorBandwidth[i][j][k],
+										v->NoOfDPP[i][j][k]
+												* (v->final_flip_bw[k]
+														+ v->RequiredPrefetchPixelDataBWLuma[i][j][k]
+																* v->UrgentBurstFactorLumaPre[k]
+														+ v->RequiredPrefetchPixelDataBWChroma[i][j][k]
+																* v->UrgentBurstFactorChromaPre[k])
+												+ v->cursor_bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
+					}
+					v->ImmediateFlipSupportedForState[i][j] = true;
+					if (v->total_dcn_read_bw_with_flip > v->ReturnBWPerState[i][j]) {
+						v->ImmediateFlipSupportedForState[i][j] = false;
+					}
+					for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+						if (v->ImmediateFlipSupportedForPipe[k] == false) {
+							v->ImmediateFlipSupportedForState[i][j] = false;
+						}
+					}
+				} else {
+					v->ImmediateFlipSupportedForState[i][j] = false;
+				}
+				if (v->MaxVStartup <= 13 || v->AnyLinesForVMOrRowTooLarge == false) {
+					v->NextMaxVStartup = v->MaxMaxVStartup[i][j];
+					NextPrefetchModeState = NextPrefetchModeState + 1;
+				} else {
+					v->NextMaxVStartup = v->NextMaxVStartup - 1;
+				}
+			} while (!((v->PrefetchSupported[i][j] == true && v->DynamicMetadataSupported[i][j] == true && v->VRatioInPrefetchSupported[i][j] == true
+					&& ((v->HostVMEnable == false && v->ImmediateFlipRequirement != dm_immediate_flip_required)
+							|| v->ImmediateFlipSupportedForState[i][j] == true))
+					|| (v->NextMaxVStartup == v->MaxMaxVStartup[i][j] && NextPrefetchModeState > MaxPrefetchMode)));
+
+			CalculateWatermarksAndDRAMSpeedChangeSupport(
+					mode_lib,
+					v->PrefetchModePerState[i][j],
+					v->NumberOfActivePlanes,
+					v->MaxLineBufferLines,
+					v->LineBufferSize,
+					v->DPPOutputBufferPixels,
+					v->DETBufferSizeInKByte,
+					v->WritebackInterfaceBufferSize,
+					v->DCFCLKState[i][j],
+					v->ReturnBWPerState[i][j],
+					v->GPUVMEnable,
+					v->dpte_group_bytes,
+					v->MetaChunkSize,
+					v->UrgLatency[i],
+					v->ExtraLatency,
+					v->WritebackLatency,
+					v->WritebackChunkSize,
+					v->SOCCLKPerState[i],
+					v->FinalDRAMClockChangeLatency,
+					v->SRExitTime,
+					v->SREnterPlusExitTime,
+					v->ProjectedDCFCLKDeepSleep[i][j],
+					v->NoOfDPPThisState,
+					v->DCCEnable,
+					v->RequiredDPPCLKThisState,
+					v->DETBufferSizeYThisState,
+					v->DETBufferSizeCThisState,
+					v->SwathHeightYThisState,
+					v->SwathHeightCThisState,
+					v->LBBitPerPixel,
+					v->SwathWidthYThisState,
+					v->SwathWidthCThisState,
+					v->HRatio,
+					v->HRatioChroma,
+					v->vtaps,
+					v->VTAPsChroma,
+					v->VRatio,
+					v->VRatioChroma,
+					v->HTotal,
+					v->PixelClock,
+					v->BlendingAndTiming,
+					v->BytePerPixelInDETY,
+					v->BytePerPixelInDETC,
+					v->DSTXAfterScaler,
+					v->DSTYAfterScaler,
+					v->WritebackEnable,
+					v->WritebackPixelFormat,
+					v->WritebackDestinationWidth,
+					v->WritebackDestinationHeight,
+					v->WritebackSourceHeight,
+					&v->DRAMClockChangeSupport[i][j],
+					&v->UrgentWatermark,
+					&v->WritebackUrgentWatermark,
+					&v->DRAMClockChangeWatermark,
+					&v->WritebackDRAMClockChangeWatermark,
+					&v->StutterExitWatermark,
+					&v->StutterEnterPlusExitWatermark,
+					&v->MinActiveDRAMClockChangeLatencySupported);
+		}
+	}
+
+	/*PTE Buffer Size Check*/
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			v->PTEBufferSizeNotExceeded[i][j] = true;
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+				if (v->PTEBufferSizeNotExceededY[i][j][k] == false || v->PTEBufferSizeNotExceededC[i][j][k] == false) {
+					v->PTEBufferSizeNotExceeded[i][j] = false;
+				}
+			}
+		}
+	}
+	/*Cursor Support Check*/
+
+	v->CursorSupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->CursorWidth[k][0] > 0.0) {
+			if (v->CursorBPP[k][0] == 64 && v->Cursor64BppSupport == false) {
+				v->CursorSupport = false;
+			}
+		}
+	}
+	/*Valid Pitch Check*/
+
+	v->PitchSupport = true;
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		v->AlignedYPitch[k] = dml_ceil(dml_max(v->PitchY[k], v->SurfaceWidthY[k]), v->MacroTileWidthY[k]);
+		if (v->DCCEnable[k] == true) {
+			v->AlignedDCCMetaPitchY[k] = dml_ceil(dml_max(v->DCCMetaPitchY[k], v->SurfaceWidthY[k]), 64.0 * v->Read256BlockWidthY[k]);
+		} else {
+			v->AlignedDCCMetaPitchY[k] = v->DCCMetaPitchY[k];
+		}
+		if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_mono_16
+				&& v->SourcePixelFormat[k] != dm_rgbe && v->SourcePixelFormat[k] != dm_mono_8) {
+			v->AlignedCPitch[k] = dml_ceil(dml_max(v->PitchC[k], v->SurfaceWidthC[k]), v->MacroTileWidthC[k]);
+			if (v->DCCEnable[k] == true) {
+				v->AlignedDCCMetaPitchC[k] = dml_ceil(dml_max(v->DCCMetaPitchC[k], v->SurfaceWidthC[k]), 64.0 * v->Read256BlockWidthC[k]);
+			} else {
+				v->AlignedDCCMetaPitchC[k] = v->DCCMetaPitchC[k];
+			}
+		} else {
+			v->AlignedCPitch[k] = v->PitchC[k];
+			v->AlignedDCCMetaPitchC[k] = v->DCCMetaPitchC[k];
+		}
+		if (v->AlignedYPitch[k] > v->PitchY[k] || v->AlignedCPitch[k] > v->PitchC[k] || v->AlignedDCCMetaPitchY[k] > v->DCCMetaPitchY[k]
+				|| v->AlignedDCCMetaPitchC[k] > v->DCCMetaPitchC[k]) {
+			v->PitchSupport = false;
+		}
+	}
+
+	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+		if (v->ViewportWidth[k] > v->SurfaceWidthY[k] || v->ViewportHeight[k] > v->SurfaceHeightY[k])
+			ViewportExceedsSurface = true;
+
+		if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16
+				&& v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != dm_rgbe) {
+			if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k] || v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
+				ViewportExceedsSurface = true;
+			}
+		}
+	}
+	/*Mode Support, Voltage State and SOC Configuration*/
+
+	for (i = v->soc.num_states - 1; i >= 0; i--) {
+		for (j = 0; j < 2; j++) {
+			if (v->ScaleRatioAndTapsSupport == 1 && v->SourceFormatPixelAndScanSupport == 1 && v->ViewportSizeSupport[i][j] == 1
+					&& v->DIOSupport[i] == 1 && v->ODMCombine4To1SupportCheckOK[i] == 1
+					&& v->NotEnoughDSCUnits[i] == 0 && v->DSCCLKRequiredMoreThanSupported[i] == 0
+					&& v->DTBCLKRequiredMoreThanSupported[i] == 0
+					&& v->ROBSupport[i][j] == 1 && v->DISPCLK_DPPCLK_Support[i][j] == 1 && v->TotalAvailablePipesSupport[i][j] == 1
+					&& EnoughWritebackUnits == 1 && WritebackModeSupport == 1
+					&& v->WritebackLatencySupport == 1 && v->WritebackScaleRatioAndTapsSupport == 1 && v->CursorSupport == 1 && v->PitchSupport == 1
+					&& ViewportExceedsSurface == 0 && v->PrefetchSupported[i][j] == 1 && v->DynamicMetadataSupported[i][j] == 1
+					&& v->TotalVerticalActiveBandwidthSupport[i][j] == 1 && v->VRatioInPrefetchSupported[i][j] == 1
+					&& v->PTEBufferSizeNotExceeded[i][j] == 1 && v->NonsupportedDSCInputBPC == 0
+					&& ((v->HostVMEnable == 0 && v->ImmediateFlipRequirement != dm_immediate_flip_required)
+							|| v->ImmediateFlipSupportedForState[i][j] == true)) {
+				v->ModeSupport[i][j] = true;
+			} else {
+				v->ModeSupport[i][j] = false;
+			}
+		}
+	}
+	{
+		unsigned int MaximumMPCCombine = 0;
+		for (i = v->soc.num_states; i >= 0; i--) {
+			if (i == v->soc.num_states || v->ModeSupport[i][0] == true || v->ModeSupport[i][1] == true) {
+				v->VoltageLevel = i;
+				v->ModeIsSupported = v->ModeSupport[i][0] == true || v->ModeSupport[i][1] == true;
+				if (v->ModeSupport[i][1] == true) {
+					MaximumMPCCombine = 1;
+				} else {
+					MaximumMPCCombine = 0;
+				}
+			}
+		}
+		v->ImmediateFlipSupport = v->ImmediateFlipSupportedForState[v->VoltageLevel][MaximumMPCCombine];
+		for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
+			v->MPCCombineEnable[k] = v->MPCCombine[v->VoltageLevel][MaximumMPCCombine][k];
+			v->DPPPerPlane[k] = v->NoOfDPP[v->VoltageLevel][MaximumMPCCombine][k];
+		}
+		v->DCFCLK = v->DCFCLKState[v->VoltageLevel][MaximumMPCCombine];
+		v->DRAMSpeed = v->DRAMSpeedPerState[v->VoltageLevel];
+		v->FabricClock = v->FabricClockPerState[v->VoltageLevel];
+		v->SOCCLK = v->SOCCLKPerState[v->VoltageLevel];
+		v->ReturnBW = v->ReturnBWPerState[v->VoltageLevel][MaximumMPCCombine];
+		v->maxMpcComb = MaximumMPCCombine;
+	}
+}
+
+static void CalculateWatermarksAndDRAMSpeedChangeSupport(
+		struct display_mode_lib *mode_lib,
+		unsigned int PrefetchMode,
+		unsigned int NumberOfActivePlanes,
+		unsigned int MaxLineBufferLines,
+		unsigned int LineBufferSize,
+		unsigned int DPPOutputBufferPixels,
+		double DETBufferSizeInKByte,
+		unsigned int WritebackInterfaceBufferSize,
+		double DCFCLK,
+		double ReturnBW,
+		bool GPUVMEnable,
+		unsigned int dpte_group_bytes[],
+		unsigned int MetaChunkSize,
+		double UrgentLatency,
+		double ExtraLatency,
+		double WritebackLatency,
+		double WritebackChunkSize,
+		double SOCCLK,
+		double DRAMClockChangeLatency,
+		double SRExitTime,
+		double SREnterPlusExitTime,
+		double DCFCLKDeepSleep,
+		unsigned int DPPPerPlane[],
+		bool DCCEnable[],
+		double DPPCLK[],
+		double DETBufferSizeY[],
+		double DETBufferSizeC[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int LBBitPerPixel[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int vtaps[],
+		unsigned int VTAPsChroma[],
+		double VRatio[],
+		double VRatioChroma[],
+		unsigned int HTotal[],
+		double PixelClock[],
+		unsigned int BlendingAndTiming[],
+		double BytePerPixelDETY[],
+		double BytePerPixelDETC[],
+		double DSTXAfterScaler[],
+		double DSTYAfterScaler[],
+		bool WritebackEnable[],
+		enum source_format_class WritebackPixelFormat[],
+		double WritebackDestinationWidth[],
+		double WritebackDestinationHeight[],
+		double WritebackSourceHeight[],
+		enum clock_change_support *DRAMClockChangeSupport,
+		double *UrgentWatermark,
+		double *WritebackUrgentWatermark,
+		double *DRAMClockChangeWatermark,
+		double *WritebackDRAMClockChangeWatermark,
+		double *StutterExitWatermark,
+		double *StutterEnterPlusExitWatermark,
+		double *MinActiveDRAMClockChangeLatencySupported)
+{
+	double EffectiveLBLatencyHidingY = 0;
+	double EffectiveLBLatencyHidingC = 0;
+	double LinesInDETY[DC__NUM_DPP__MAX] = { 0 };
+	double LinesInDETC = 0;
+	unsigned int LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX] = { 0 };
+	unsigned int LinesInDETCRoundedDownToSwath = 0;
+	double FullDETBufferingTimeY[DC__NUM_DPP__MAX] = { 0 };
+	double FullDETBufferingTimeC = 0;
+	double ActiveDRAMClockChangeLatencyMarginY = 0;
+	double ActiveDRAMClockChangeLatencyMarginC = 0;
+	double WritebackDRAMClockChangeLatencyMargin = 0;
+	double PlaneWithMinActiveDRAMClockChangeMargin = 0;
+	double SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 0;
+	double FullDETBufferingTimeYStutterCriticalPlane = 0;
+	double TimeToFinishSwathTransferStutterCriticalPlane = 0;
+	double WritebackDRAMClockChangeLatencyHiding = 0;
+	unsigned int k, j;
+
+	mode_lib->vba.TotalActiveDPP = 0;
+	mode_lib->vba.TotalDCCActiveDPP = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		mode_lib->vba.TotalActiveDPP = mode_lib->vba.TotalActiveDPP + DPPPerPlane[k];
+		if (DCCEnable[k] == true) {
+			mode_lib->vba.TotalDCCActiveDPP = mode_lib->vba.TotalDCCActiveDPP + DPPPerPlane[k];
+		}
+	}
+
+	*UrgentWatermark = UrgentLatency + ExtraLatency;
+
+	*DRAMClockChangeWatermark = DRAMClockChangeLatency + *UrgentWatermark;
+
+	mode_lib->vba.TotalActiveWriteback = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (WritebackEnable[k] == true) {
+			mode_lib->vba.TotalActiveWriteback = mode_lib->vba.TotalActiveWriteback + 1;
+		}
+	}
+
+	if (mode_lib->vba.TotalActiveWriteback <= 1) {
+		*WritebackUrgentWatermark = WritebackLatency;
+	} else {
+		*WritebackUrgentWatermark = WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+	}
+
+	if (mode_lib->vba.TotalActiveWriteback <= 1) {
+		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency;
+	} else {
+		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+
+		mode_lib->vba.LBLatencyHidingSourceLinesY = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
+
+		mode_lib->vba.LBLatencyHidingSourceLinesC = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k] - 1);
+
+		EffectiveLBLatencyHidingY = mode_lib->vba.LBLatencyHidingSourceLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
+
+		EffectiveLBLatencyHidingC = mode_lib->vba.LBLatencyHidingSourceLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+
+		LinesInDETY[k] = (double) DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k];
+		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
+		FullDETBufferingTimeY[k] = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		if (BytePerPixelDETC[k] > 0) {
+			LinesInDETC = mode_lib->vba.DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
+			LinesInDETCRoundedDownToSwath = dml_floor(LinesInDETC, SwathHeightC[k]);
+			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
+		} else {
+			LinesInDETC = 0;
+			FullDETBufferingTimeC = 999999;
+		}
+
+		ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY[k] - *UrgentWatermark - (HTotal[k] / PixelClock[k]) * (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) - *DRAMClockChangeWatermark;
+
+		if (NumberOfActivePlanes > 1) {
+			ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
+		}
+
+		if (BytePerPixelDETC[k] > 0) {
+			ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC - *UrgentWatermark - (HTotal[k] / PixelClock[k]) * (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) - *DRAMClockChangeWatermark;
+
+			if (NumberOfActivePlanes > 1) {
+				ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
+			}
+			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
+		} else {
+			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
+		}
+
+		if (WritebackEnable[k] == true) {
+
+			WritebackDRAMClockChangeLatencyHiding = WritebackInterfaceBufferSize * 1024 / (WritebackDestinationWidth[k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
+			if (WritebackPixelFormat[k] == dm_444_64) {
+				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding / 2;
+			}
+			if (mode_lib->vba.WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave || mode_lib->vba.WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave) {
+				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding * 2;
+			}
+			WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - mode_lib->vba.WritebackDRAMClockChangeWatermark;
+			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = dml_min(mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k], WritebackDRAMClockChangeLatencyMargin);
+		}
+	}
+
+	mode_lib->vba.MinActiveDRAMClockChangeMargin = 999999;
+	PlaneWithMinActiveDRAMClockChangeMargin = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] < mode_lib->vba.MinActiveDRAMClockChangeMargin) {
+			mode_lib->vba.MinActiveDRAMClockChangeMargin = mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k];
+			if (BlendingAndTiming[k] == k) {
+				PlaneWithMinActiveDRAMClockChangeMargin = k;
+			} else {
+				for (j = 0; j < NumberOfActivePlanes; ++j) {
+					if (BlendingAndTiming[k] == j) {
+						PlaneWithMinActiveDRAMClockChangeMargin = j;
+					}
+				}
+			}
+		}
+	}
+
+	*MinActiveDRAMClockChangeLatencySupported = mode_lib->vba.MinActiveDRAMClockChangeMargin + DRAMClockChangeLatency;
+
+	SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 999999;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (BlendingAndTiming[k] == k)) && !(BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin) && mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
+			SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k];
+		}
+	}
+
+	mode_lib->vba.TotalNumberOfActiveOTG = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (BlendingAndTiming[k] == k) {
+			mode_lib->vba.TotalNumberOfActiveOTG = mode_lib->vba.TotalNumberOfActiveOTG + 1;
+		}
+	}
+
+	if (mode_lib->vba.MinActiveDRAMClockChangeMargin > 0) {
+		*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
+	} else if (((mode_lib->vba.SynchronizedVBlank == true || mode_lib->vba.TotalNumberOfActiveOTG == 1 || SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0)) {
+		*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
+	} else {
+		*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
+	}
+
+	FullDETBufferingTimeYStutterCriticalPlane = FullDETBufferingTimeY[0];
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (FullDETBufferingTimeY[k] <= FullDETBufferingTimeYStutterCriticalPlane) {
+			FullDETBufferingTimeYStutterCriticalPlane = FullDETBufferingTimeY[k];
+			TimeToFinishSwathTransferStutterCriticalPlane = (SwathHeightY[k] - (LinesInDETY[k] - LinesInDETYRoundedDownToSwath[k])) * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		}
+	}
+
+	*StutterExitWatermark = SRExitTime +  ExtraLatency + 10 / DCFCLKDeepSleep;
+	*StutterEnterPlusExitWatermark = dml_max(SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep, TimeToFinishSwathTransferStutterCriticalPlane);
+
+}
+
+static void CalculateDCFCLKDeepSleep(
+		struct display_mode_lib *mode_lib,
+		unsigned int NumberOfActivePlanes,
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		double VRatio[],
+		double VRatioChroma[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		unsigned int DPPPerPlane[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double DPPCLK[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		int ReturnBusWidth,
+		double *DCFCLKDeepSleep)
+{
+	double DisplayPipeLineDeliveryTimeLuma = 0;
+	double DisplayPipeLineDeliveryTimeChroma = 0;
+	unsigned int k;
+	double ReadBandwidth = 0.0;
+
+	//double   DCFCLKDeepSleepPerPlane[DC__NUM_DPP__MAX];
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+
+		if (VRatio[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLuma = SwathWidthY[k] * DPPPerPlane[k] / HRatio[k] / PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLuma = SwathWidthY[k] / PSCL_THROUGHPUT[k] / DPPCLK[k];
+		}
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChroma = 0;
+		} else {
+			if (VRatioChroma[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChroma = SwathWidthC[k] * DPPPerPlane[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChroma = SwathWidthC[k] / PSCL_THROUGHPUT_CHROMA[k] / DPPCLK[k];
+			}
+		}
+
+		if (BytePerPixelC[k] > 0) {
+			mode_lib->vba.DCFCLKDeepSleepPerPlane[k] = dml_max(1.1 * SwathWidthY[k] * BytePerPixelY[k] / 32.0 / DisplayPipeLineDeliveryTimeLuma, 1.1 * SwathWidthC[k] * BytePerPixelC[k] / 32.0 / DisplayPipeLineDeliveryTimeChroma);
+		} else {
+			mode_lib->vba.DCFCLKDeepSleepPerPlane[k] = 1.1 * SwathWidthY[k] * BytePerPixelY[k] / 64.0 / DisplayPipeLineDeliveryTimeLuma;
+		}
+		mode_lib->vba.DCFCLKDeepSleepPerPlane[k] = dml_max(mode_lib->vba.DCFCLKDeepSleepPerPlane[k], PixelClock[k] / 16);
+
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		ReadBandwidth = ReadBandwidth + ReadBandwidthLuma[k] + ReadBandwidthChroma[k];
+	}
+
+	*DCFCLKDeepSleep = dml_max(8.0, ReadBandwidth / ReturnBusWidth);
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		*DCFCLKDeepSleep = dml_max(*DCFCLKDeepSleep, mode_lib->vba.DCFCLKDeepSleepPerPlane[k]);
+	}
+}
+
+static void CalculateUrgentBurstFactor(
+		long swath_width_luma_ub,
+		long swath_width_chroma_ub,
+		unsigned int DETBufferSizeInKByte,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double LineTime,
+		double UrgentLatency,
+		double CursorBufferSize,
+		unsigned int CursorWidth,
+		unsigned int CursorBPP,
+		double VRatio,
+		double VRatioC,
+		double BytePerPixelInDETY,
+		double BytePerPixelInDETC,
+		double DETBufferSizeY,
+		double DETBufferSizeC,
+		double *UrgentBurstFactorCursor,
+		double *UrgentBurstFactorLuma,
+		double *UrgentBurstFactorChroma,
+		bool *NotEnoughUrgentLatencyHiding)
+{
+	double LinesInDETLuma = 0;
+	double LinesInDETChroma = 0;
+	unsigned int LinesInCursorBuffer = 0;
+	double CursorBufferSizeInTime = 0;
+	double DETBufferSizeInTimeLuma = 0;
+	double DETBufferSizeInTimeChroma = 0;
+
+	*NotEnoughUrgentLatencyHiding = 0;
+
+	if (CursorWidth > 0) {
+		LinesInCursorBuffer = 1 << (unsigned int) dml_floor(dml_log2(CursorBufferSize * 1024.0 / (CursorWidth * CursorBPP / 8.0)), 1.0);
+		if (VRatio > 0) {
+			CursorBufferSizeInTime = LinesInCursorBuffer * LineTime / VRatio;
+			if (CursorBufferSizeInTime - UrgentLatency <= 0) {
+				*NotEnoughUrgentLatencyHiding = 1;
+				*UrgentBurstFactorCursor = 0;
+			} else {
+				*UrgentBurstFactorCursor = CursorBufferSizeInTime / (CursorBufferSizeInTime - UrgentLatency);
+			}
+		} else {
+			*UrgentBurstFactorCursor = 1;
+		}
+	}
+
+	LinesInDETLuma = DETBufferSizeY / BytePerPixelInDETY / swath_width_luma_ub;
+	if (VRatio > 0) {
+		DETBufferSizeInTimeLuma = dml_floor(LinesInDETLuma, SwathHeightY) * LineTime / VRatio;
+		if (DETBufferSizeInTimeLuma - UrgentLatency <= 0) {
+			*NotEnoughUrgentLatencyHiding = 1;
+			*UrgentBurstFactorLuma = 0;
+		} else {
+			*UrgentBurstFactorLuma = DETBufferSizeInTimeLuma / (DETBufferSizeInTimeLuma - UrgentLatency);
+		}
+	} else {
+		*UrgentBurstFactorLuma = 1;
+	}
+
+	if (BytePerPixelInDETC > 0) {
+		LinesInDETChroma = DETBufferSizeC / BytePerPixelInDETC / swath_width_chroma_ub;
+		if (VRatio > 0) {
+			DETBufferSizeInTimeChroma = dml_floor(LinesInDETChroma, SwathHeightC) * LineTime / VRatio;
+			if (DETBufferSizeInTimeChroma - UrgentLatency <= 0) {
+				*NotEnoughUrgentLatencyHiding = 1;
+				*UrgentBurstFactorChroma = 0;
+			} else {
+				*UrgentBurstFactorChroma = DETBufferSizeInTimeChroma / (DETBufferSizeInTimeChroma - UrgentLatency);
+			}
+		} else {
+			*UrgentBurstFactorChroma = 1;
+		}
+	}
+}
+
+static void CalculatePixelDeliveryTimes(
+		unsigned int NumberOfActivePlanes,
+		double VRatio[],
+		double VRatioChroma[],
+		double VRatioPrefetchY[],
+		double VRatioPrefetchC[],
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[],
+		unsigned int DPPPerPlane[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double DPPCLK[],
+		int BytePerPixelC[],
+		enum scan_direction_class SourceScan[],
+		unsigned int NumberOfCursors[],
+		unsigned int CursorWidth[][2],
+		unsigned int CursorBPP[][2],
+		unsigned int BlockWidth256BytesY[],
+		unsigned int BlockHeight256BytesY[],
+		unsigned int BlockWidth256BytesC[],
+		unsigned int BlockHeight256BytesC[],
+		double DisplayPipeLineDeliveryTimeLuma[],
+		double DisplayPipeLineDeliveryTimeChroma[],
+		double DisplayPipeLineDeliveryTimeLumaPrefetch[],
+		double DisplayPipeLineDeliveryTimeChromaPrefetch[],
+		double DisplayPipeRequestDeliveryTimeLuma[],
+		double DisplayPipeRequestDeliveryTimeChroma[],
+		double DisplayPipeRequestDeliveryTimeLumaPrefetch[],
+		double DisplayPipeRequestDeliveryTimeChromaPrefetch[],
+		double CursorRequestDeliveryTime[],
+		double CursorRequestDeliveryTimePrefetch[])
+{
+	double req_per_swath_ub = 0;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (VRatio[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLuma[k] = swath_width_luma_ub[k] * DPPPerPlane[k] / HRatio[k] / PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLuma[k] = swath_width_luma_ub[k] / PSCL_THROUGHPUT[k] / DPPCLK[k];
+		}
+
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChroma[k] = 0;
+		} else {
+			if (VRatioChroma[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChroma[k] = swath_width_chroma_ub[k] * DPPPerPlane[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChroma[k] = swath_width_chroma_ub[k] / PSCL_THROUGHPUT_CHROMA[k] / DPPCLK[k];
+			}
+		}
+
+		if (VRatioPrefetchY[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLumaPrefetch[k] = swath_width_luma_ub[k] * DPPPerPlane[k] / HRatio[k] / PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLumaPrefetch[k] = swath_width_luma_ub[k] / PSCL_THROUGHPUT[k] / DPPCLK[k];
+		}
+
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChromaPrefetch[k] = 0;
+		} else {
+			if (VRatioPrefetchC[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChromaPrefetch[k] = swath_width_chroma_ub[k] * DPPPerPlane[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChromaPrefetch[k] = swath_width_chroma_ub[k] / PSCL_THROUGHPUT_CHROMA[k] / DPPCLK[k];
+			}
+		}
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (SourceScan[k] != dm_vert) {
+			req_per_swath_ub = swath_width_luma_ub[k] / BlockWidth256BytesY[k];
+		} else {
+			req_per_swath_ub = swath_width_luma_ub[k] / BlockHeight256BytesY[k];
+		}
+		DisplayPipeRequestDeliveryTimeLuma[k] = DisplayPipeLineDeliveryTimeLuma[k] / req_per_swath_ub;
+		DisplayPipeRequestDeliveryTimeLumaPrefetch[k] = DisplayPipeLineDeliveryTimeLumaPrefetch[k] / req_per_swath_ub;
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeRequestDeliveryTimeChroma[k] = 0;
+			DisplayPipeRequestDeliveryTimeChromaPrefetch[k] = 0;
+		} else {
+			if (SourceScan[k] != dm_vert) {
+				req_per_swath_ub = swath_width_chroma_ub[k] / BlockWidth256BytesC[k];
+			} else {
+				req_per_swath_ub = swath_width_chroma_ub[k] / BlockHeight256BytesC[k];
+			}
+			DisplayPipeRequestDeliveryTimeChroma[k] = DisplayPipeLineDeliveryTimeChroma[k] / req_per_swath_ub;
+			DisplayPipeRequestDeliveryTimeChromaPrefetch[k] = DisplayPipeLineDeliveryTimeChromaPrefetch[k] / req_per_swath_ub;
+		}
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		int cursor_req_per_width = 0;
+		cursor_req_per_width = dml_ceil(CursorWidth[k][0] * CursorBPP[k][0] / 256 / 8, 1);
+		if (NumberOfCursors[k] > 0) {
+			if (VRatio[k] <= 1) {
+				CursorRequestDeliveryTime[k] = CursorWidth[k][0] / HRatio[k] / PixelClock[k] / cursor_req_per_width;
+			} else {
+				CursorRequestDeliveryTime[k] = CursorWidth[k][0] / PSCL_THROUGHPUT[k] / DPPCLK[k] / cursor_req_per_width;
+			}
+			if (VRatioPrefetchY[k] <= 1) {
+				CursorRequestDeliveryTimePrefetch[k] = CursorWidth[k][0] / HRatio[k] / PixelClock[k] / cursor_req_per_width;
+			} else {
+				CursorRequestDeliveryTimePrefetch[k] = CursorWidth[k][0] / PSCL_THROUGHPUT[k] / DPPCLK[k] / cursor_req_per_width;
+			}
+		} else {
+			CursorRequestDeliveryTime[k] = 0;
+			CursorRequestDeliveryTimePrefetch[k] = 0;
+		}
+	}
+}
+
+static void CalculateMetaAndPTETimes(
+		int NumberOfActivePlanes,
+		bool GPUVMEnable,
+		int MetaChunkSize,
+		int MinMetaChunkSizeBytes,
+		int HTotal[],
+		double VRatio[],
+		double VRatioChroma[],
+		double DestinationLinesToRequestRowInVBlank[],
+		double DestinationLinesToRequestRowInImmediateFlip[],
+		bool DCCEnable[],
+		double PixelClock[],
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		enum scan_direction_class SourceScan[],
+		int dpte_row_height[],
+		int dpte_row_height_chroma[],
+		int meta_row_width[],
+		int meta_row_width_chroma[],
+		int meta_row_height[],
+		int meta_row_height_chroma[],
+		int meta_req_width[],
+		int meta_req_width_chroma[],
+		int meta_req_height[],
+		int meta_req_height_chroma[],
+		int dpte_group_bytes[],
+		int PTERequestSizeY[],
+		int PTERequestSizeC[],
+		int PixelPTEReqWidthY[],
+		int PixelPTEReqHeightY[],
+		int PixelPTEReqWidthC[],
+		int PixelPTEReqHeightC[],
+		int dpte_row_width_luma_ub[],
+		int dpte_row_width_chroma_ub[],
+		double DST_Y_PER_PTE_ROW_NOM_L[],
+		double DST_Y_PER_PTE_ROW_NOM_C[],
+		double DST_Y_PER_META_ROW_NOM_L[],
+		double DST_Y_PER_META_ROW_NOM_C[],
+		double TimePerMetaChunkNominal[],
+		double TimePerChromaMetaChunkNominal[],
+		double TimePerMetaChunkVBlank[],
+		double TimePerChromaMetaChunkVBlank[],
+		double TimePerMetaChunkFlip[],
+		double TimePerChromaMetaChunkFlip[],
+		double time_per_pte_group_nom_luma[],
+		double time_per_pte_group_vblank_luma[],
+		double time_per_pte_group_flip_luma[],
+		double time_per_pte_group_nom_chroma[],
+		double time_per_pte_group_vblank_chroma[],
+		double time_per_pte_group_flip_chroma[])
+{
+	unsigned int meta_chunk_width = 0;
+	unsigned int min_meta_chunk_width = 0;
+	unsigned int meta_chunk_per_row_int = 0;
+	unsigned int meta_row_remainder = 0;
+	unsigned int meta_chunk_threshold = 0;
+	unsigned int meta_chunks_per_row_ub = 0;
+	unsigned int meta_chunk_width_chroma = 0;
+	unsigned int min_meta_chunk_width_chroma = 0;
+	unsigned int meta_chunk_per_row_int_chroma = 0;
+	unsigned int meta_row_remainder_chroma = 0;
+	unsigned int meta_chunk_threshold_chroma = 0;
+	unsigned int meta_chunks_per_row_ub_chroma = 0;
+	unsigned int dpte_group_width_luma = 0;
+	unsigned int dpte_groups_per_row_luma_ub = 0;
+	unsigned int dpte_group_width_chroma = 0;
+	unsigned int dpte_groups_per_row_chroma_ub = 0;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		DST_Y_PER_PTE_ROW_NOM_L[k] = dpte_row_height[k] / VRatio[k];
+		if (BytePerPixelC[k] == 0) {
+			DST_Y_PER_PTE_ROW_NOM_C[k] = 0;
+		} else {
+			DST_Y_PER_PTE_ROW_NOM_C[k] = dpte_row_height_chroma[k] / VRatioChroma[k];
+		}
+		DST_Y_PER_META_ROW_NOM_L[k] = meta_row_height[k] / VRatio[k];
+		if (BytePerPixelC[k] == 0) {
+			DST_Y_PER_META_ROW_NOM_C[k] = 0;
+		} else {
+			DST_Y_PER_META_ROW_NOM_C[k] = meta_row_height_chroma[k] / VRatioChroma[k];
+		}
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (DCCEnable[k] == true) {
+			meta_chunk_width = MetaChunkSize * 1024 * 256 / BytePerPixelY[k] / meta_row_height[k];
+			min_meta_chunk_width = MinMetaChunkSizeBytes * 256 / BytePerPixelY[k] / meta_row_height[k];
+			meta_chunk_per_row_int = meta_row_width[k] / meta_chunk_width;
+			meta_row_remainder = meta_row_width[k] % meta_chunk_width;
+			if (SourceScan[k] != dm_vert) {
+				meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_width[k];
+			} else {
+				meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_height[k];
+			}
+			if (meta_row_remainder <= meta_chunk_threshold) {
+				meta_chunks_per_row_ub = meta_chunk_per_row_int + 1;
+			} else {
+				meta_chunks_per_row_ub = meta_chunk_per_row_int + 2;
+			}
+			TimePerMetaChunkNominal[k] = meta_row_height[k] / VRatio[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			TimePerMetaChunkVBlank[k] = DestinationLinesToRequestRowInVBlank[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			TimePerMetaChunkFlip[k] = DestinationLinesToRequestRowInImmediateFlip[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			if (BytePerPixelC[k] == 0) {
+				TimePerChromaMetaChunkNominal[k] = 0;
+				TimePerChromaMetaChunkVBlank[k] = 0;
+				TimePerChromaMetaChunkFlip[k] = 0;
+			} else {
+				meta_chunk_width_chroma = MetaChunkSize * 1024 * 256 / BytePerPixelC[k] / meta_row_height_chroma[k];
+				min_meta_chunk_width_chroma = MinMetaChunkSizeBytes * 256 / BytePerPixelC[k] / meta_row_height_chroma[k];
+				meta_chunk_per_row_int_chroma = (double) meta_row_width_chroma[k] / meta_chunk_width_chroma;
+				meta_row_remainder_chroma = meta_row_width_chroma[k] % meta_chunk_width_chroma;
+				if (SourceScan[k] != dm_vert) {
+					meta_chunk_threshold_chroma = 2 * min_meta_chunk_width_chroma - meta_req_width_chroma[k];
+				} else {
+					meta_chunk_threshold_chroma = 2 * min_meta_chunk_width_chroma - meta_req_height_chroma[k];
+				}
+				if (meta_row_remainder_chroma <= meta_chunk_threshold_chroma) {
+					meta_chunks_per_row_ub_chroma = meta_chunk_per_row_int_chroma + 1;
+				} else {
+					meta_chunks_per_row_ub_chroma = meta_chunk_per_row_int_chroma + 2;
+				}
+				TimePerChromaMetaChunkNominal[k] = meta_row_height_chroma[k] / VRatioChroma[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+				TimePerChromaMetaChunkVBlank[k] = DestinationLinesToRequestRowInVBlank[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+				TimePerChromaMetaChunkFlip[k] = DestinationLinesToRequestRowInImmediateFlip[k] * HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+			}
+		} else {
+			TimePerMetaChunkNominal[k] = 0;
+			TimePerMetaChunkVBlank[k] = 0;
+			TimePerMetaChunkFlip[k] = 0;
+			TimePerChromaMetaChunkNominal[k] = 0;
+			TimePerChromaMetaChunkVBlank[k] = 0;
+			TimePerChromaMetaChunkFlip[k] = 0;
+		}
+	}
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (GPUVMEnable == true) {
+			if (SourceScan[k] != dm_vert) {
+				dpte_group_width_luma = dpte_group_bytes[k] / PTERequestSizeY[k] * PixelPTEReqWidthY[k];
+			} else {
+				dpte_group_width_luma = dpte_group_bytes[k] / PTERequestSizeY[k] * PixelPTEReqHeightY[k];
+			}
+			dpte_groups_per_row_luma_ub = dml_ceil(1.0 * dpte_row_width_luma_ub[k] / dpte_group_width_luma, 1);
+			time_per_pte_group_nom_luma[k] = DST_Y_PER_PTE_ROW_NOM_L[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			time_per_pte_group_vblank_luma[k] = DestinationLinesToRequestRowInVBlank[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			time_per_pte_group_flip_luma[k] = DestinationLinesToRequestRowInImmediateFlip[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			if (BytePerPixelC[k] == 0) {
+				time_per_pte_group_nom_chroma[k] = 0;
+				time_per_pte_group_vblank_chroma[k] = 0;
+				time_per_pte_group_flip_chroma[k] = 0;
+			} else {
+				if (SourceScan[k] != dm_vert) {
+					dpte_group_width_chroma = dpte_group_bytes[k] / PTERequestSizeC[k] * PixelPTEReqWidthC[k];
+				} else {
+					dpte_group_width_chroma = dpte_group_bytes[k] / PTERequestSizeC[k] * PixelPTEReqHeightC[k];
+				}
+				dpte_groups_per_row_chroma_ub = dml_ceil(1.0 * dpte_row_width_chroma_ub[k] / dpte_group_width_chroma, 1);
+				time_per_pte_group_nom_chroma[k] = DST_Y_PER_PTE_ROW_NOM_C[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+				time_per_pte_group_vblank_chroma[k] = DestinationLinesToRequestRowInVBlank[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+				time_per_pte_group_flip_chroma[k] = DestinationLinesToRequestRowInImmediateFlip[k] * HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+			}
+		} else {
+			time_per_pte_group_nom_luma[k] = 0;
+			time_per_pte_group_vblank_luma[k] = 0;
+			time_per_pte_group_flip_luma[k] = 0;
+			time_per_pte_group_nom_chroma[k] = 0;
+			time_per_pte_group_vblank_chroma[k] = 0;
+			time_per_pte_group_flip_chroma[k] = 0;
+		}
+	}
+}
+
+static void CalculateVMGroupAndRequestTimes(
+		unsigned int NumberOfActivePlanes,
+		bool GPUVMEnable,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int HTotal[],
+		int BytePerPixelC[],
+		double DestinationLinesToRequestVMInVBlank[],
+		double DestinationLinesToRequestVMInImmediateFlip[],
+		bool DCCEnable[],
+		double PixelClock[],
+		int dpte_row_width_luma_ub[],
+		int dpte_row_width_chroma_ub[],
+		int vm_group_bytes[],
+		unsigned int dpde0_bytes_per_frame_ub_l[],
+		unsigned int dpde0_bytes_per_frame_ub_c[],
+		int meta_pte_bytes_per_frame_ub_l[],
+		int meta_pte_bytes_per_frame_ub_c[],
+		double TimePerVMGroupVBlank[],
+		double TimePerVMGroupFlip[],
+		double TimePerVMRequestVBlank[],
+		double TimePerVMRequestFlip[])
+{
+	int num_group_per_lower_vm_stage = 0;
+	int num_req_per_lower_vm_stage = 0;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (GPUVMEnable == true && (DCCEnable[k] == true || GPUVMMaxPageTableLevels > 1)) {
+			if (DCCEnable[k] == false) {
+				if (BytePerPixelC[k] > 0) {
+					num_group_per_lower_vm_stage = dml_ceil((double) (dpde0_bytes_per_frame_ub_l[k])
+						/ (double) (vm_group_bytes[k]), 1) + dml_ceil((double) (dpde0_bytes_per_frame_ub_c[k])
+									/ (double) (vm_group_bytes[k]), 1);
+				} else {
+					num_group_per_lower_vm_stage = dml_ceil((double) (dpde0_bytes_per_frame_ub_l[k])
+							/ (double) (vm_group_bytes[k]), 1);
+				}
+			} else {
+				if (GPUVMMaxPageTableLevels == 1) {
+					if (BytePerPixelC[k] > 0) {
+						num_group_per_lower_vm_stage = dml_ceil((double) (meta_pte_bytes_per_frame_ub_l[k])
+							/ (double) (vm_group_bytes[k]), 1) + dml_ceil((double) (meta_pte_bytes_per_frame_ub_c[k])
+									/ (double) (vm_group_bytes[k]), 1);
+					} else {
+						num_group_per_lower_vm_stage = dml_ceil((double) (meta_pte_bytes_per_frame_ub_l[k])
+							/ (double) (vm_group_bytes[k]), 1);
+					}
+				} else {
+					if (BytePerPixelC[k] > 0) {
+						num_group_per_lower_vm_stage = 2 + dml_ceil((double) (dpde0_bytes_per_frame_ub_l[k]) / (double) (vm_group_bytes[k]), 1)
+								+ dml_ceil((double) (dpde0_bytes_per_frame_ub_c[k]) / (double) (vm_group_bytes[k]), 1)
+								+ dml_ceil((double) (meta_pte_bytes_per_frame_ub_l[k]) / (double) (vm_group_bytes[k]), 1)
+								+ dml_ceil((double) (meta_pte_bytes_per_frame_ub_c[k]) / (double) (vm_group_bytes[k]), 1);
+					} else {
+						num_group_per_lower_vm_stage = 1 + dml_ceil((double) (dpde0_bytes_per_frame_ub_l[k]) / (double) (vm_group_bytes[k]), 1)
+								+ dml_ceil((double) (meta_pte_bytes_per_frame_ub_l[k]) / (double) (vm_group_bytes[k]), 1);
+					}
+				}
+			}
+
+			if (DCCEnable[k] == false) {
+				if (BytePerPixelC[k] > 0) {
+					num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64 + dpde0_bytes_per_frame_ub_c[k] / 64;
+				} else {
+					num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64;
+				}
+			} else {
+				if (GPUVMMaxPageTableLevels == 1) {
+					if (BytePerPixelC[k] > 0) {
+						num_req_per_lower_vm_stage = meta_pte_bytes_per_frame_ub_l[k] / 64
+								+ meta_pte_bytes_per_frame_ub_c[k] / 64;
+					} else {
+						num_req_per_lower_vm_stage = meta_pte_bytes_per_frame_ub_l[k] / 64;
+					}
+				} else {
+					if (BytePerPixelC[k] > 0) {
+						num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64
+							+ dpde0_bytes_per_frame_ub_c[k] / 64 + meta_pte_bytes_per_frame_ub_l[k]
+									/ 64 + meta_pte_bytes_per_frame_ub_c[k] / 64;
+					} else {
+						num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64
+								+ meta_pte_bytes_per_frame_ub_l[k] / 64;
+					}
+				}
+			}
+
+			TimePerVMGroupVBlank[k] = DestinationLinesToRequestVMInVBlank[k] * HTotal[k] / PixelClock[k]
+					/ num_group_per_lower_vm_stage;
+			TimePerVMGroupFlip[k] = DestinationLinesToRequestVMInImmediateFlip[k] * HTotal[k] / PixelClock[k]
+					/ num_group_per_lower_vm_stage;
+			TimePerVMRequestVBlank[k] = DestinationLinesToRequestVMInVBlank[k] * HTotal[k] / PixelClock[k]
+					/ num_req_per_lower_vm_stage;
+			TimePerVMRequestFlip[k] = DestinationLinesToRequestVMInImmediateFlip[k] * HTotal[k] / PixelClock[k]
+					/ num_req_per_lower_vm_stage;
+
+			if (GPUVMMaxPageTableLevels > 2) {
+				TimePerVMGroupVBlank[k] = TimePerVMGroupVBlank[k] / 2;
+				TimePerVMGroupFlip[k] = TimePerVMGroupFlip[k] / 2;
+				TimePerVMRequestVBlank[k] = TimePerVMRequestVBlank[k] / 2;
+				TimePerVMRequestFlip[k] = TimePerVMRequestFlip[k] / 2;
+			}
+
+		} else {
+			TimePerVMGroupVBlank[k] = 0;
+			TimePerVMGroupFlip[k] = 0;
+			TimePerVMRequestVBlank[k] = 0;
+			TimePerVMRequestFlip[k] = 0;
+		}
+	}
+}
+
+static void CalculateStutterEfficiency(
+		int NumberOfActivePlanes,
+		long ROBBufferSizeInKByte,
+		double TotalDataReadBandwidth,
+		double DCFCLK,
+		double ReturnBW,
+		double SRExitTime,
+		bool SynchronizedVBlank,
+		int DPPPerPlane[],
+		double DETBufferSizeY[],
+		int BytePerPixelY[],
+		double BytePerPixelDETY[],
+		double SwathWidthY[],
+		int SwathHeightY[],
+		int SwathHeightC[],
+		double DCCRateLuma[],
+		double DCCRateChroma[],
+		int HTotal[],
+		int VTotal[],
+		double PixelClock[],
+		double VRatio[],
+		enum scan_direction_class SourceScan[],
+		int BlockHeight256BytesY[],
+		int BlockWidth256BytesY[],
+		int BlockHeight256BytesC[],
+		int BlockWidth256BytesC[],
+		int DCCYMaxUncompressedBlock[],
+		int DCCCMaxUncompressedBlock[],
+		int VActive[],
+		bool DCCEnable[],
+		bool WritebackEnable[],
+		double ReadBandwidthPlaneLuma[],
+		double ReadBandwidthPlaneChroma[],
+		double meta_row_bw[],
+		double dpte_row_bw[],
+		double *StutterEfficiencyNotIncludingVBlank,
+		double *StutterEfficiency)
+{
+	double FullDETBufferingTimeY[DC__NUM_DPP__MAX] = { 0 };
+	double FrameTimeForMinFullDETBufferingTime = 0;
+	double StutterPeriod = 0;
+	double AverageReadBandwidth = 0;
+	double TotalRowReadBandwidth = 0;
+	double AverageDCCCompressionRate = 0;
+	double PartOfBurstThatFitsInROB = 0;
+	double StutterBurstTime = 0;
+	int TotalActiveWriteback = 0;
+	double VBlankTime = 0;
+	double SmallestVBlank = 0;
+	int BytePerPixelYCriticalPlane = 0;
+	double SwathWidthYCriticalPlane = 0;
+	double LinesInDETY[DC__NUM_DPP__MAX] = { 0 };
+	double LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX] = { 0 };
+	double LinesToFinishSwathTransferStutterCriticalPlane = 0;
+	double MaximumEffectiveCompressionLuma = 0;
+	double    MaximumEffectiveCompressionChroma = 0;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		LinesInDETY[k] = DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k];
+		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
+		FullDETBufferingTimeY[k] = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+	}
+
+	StutterPeriod = FullDETBufferingTimeY[0];
+	FrameTimeForMinFullDETBufferingTime = VTotal[0] * HTotal[0] / PixelClock[0];
+	BytePerPixelYCriticalPlane = BytePerPixelY[0];
+	SwathWidthYCriticalPlane = SwathWidthY[0];
+	LinesToFinishSwathTransferStutterCriticalPlane = SwathHeightY[0]
+			- (LinesInDETY[0] - LinesInDETYRoundedDownToSwath[0]);
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (FullDETBufferingTimeY[k] < StutterPeriod) {
+			StutterPeriod = FullDETBufferingTimeY[k];
+			FrameTimeForMinFullDETBufferingTime = VTotal[k] * HTotal[k] / PixelClock[k];
+			BytePerPixelYCriticalPlane = BytePerPixelY[k];
+			SwathWidthYCriticalPlane = SwathWidthY[k];
+			LinesToFinishSwathTransferStutterCriticalPlane = SwathHeightY[k]
+					- (LinesInDETY[k] - LinesInDETYRoundedDownToSwath[k]);
+		}
+	}
+
+	AverageReadBandwidth = 0;
+	TotalRowReadBandwidth = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (DCCEnable[k] == true) {
+			if ((SourceScan[k] == dm_vert && BlockWidth256BytesY[k] > SwathHeightY[k])
+					|| (SourceScan[k] != dm_vert
+							&& BlockHeight256BytesY[k] > SwathHeightY[k])
+					|| DCCYMaxUncompressedBlock[k] < 256) {
+				MaximumEffectiveCompressionLuma = 2;
+			} else {
+				MaximumEffectiveCompressionLuma = 4;
+			}
+			AverageReadBandwidth = AverageReadBandwidth + ReadBandwidthPlaneLuma[k] / dml_min(DCCRateLuma[k], MaximumEffectiveCompressionLuma);
+
+			if (ReadBandwidthPlaneChroma[k] > 0) {
+				if ((SourceScan[k] == dm_vert && BlockWidth256BytesC[k] > SwathHeightC[k])
+						|| (SourceScan[k] != dm_vert && BlockHeight256BytesC[k] > SwathHeightC[k])
+						|| DCCCMaxUncompressedBlock[k] < 256) {
+					MaximumEffectiveCompressionChroma = 2;
+				} else {
+					MaximumEffectiveCompressionChroma = 4;
+				}
+				AverageReadBandwidth = AverageReadBandwidth + ReadBandwidthPlaneChroma[k] / dml_min(DCCRateChroma[k], MaximumEffectiveCompressionChroma);
+			}
+		} else {
+			AverageReadBandwidth = AverageReadBandwidth + ReadBandwidthPlaneLuma[k] + ReadBandwidthPlaneChroma[k];
+		}
+		TotalRowReadBandwidth = TotalRowReadBandwidth + DPPPerPlane[k] * (meta_row_bw[k] + dpte_row_bw[k]);
+	}
+
+	AverageDCCCompressionRate = TotalDataReadBandwidth / AverageReadBandwidth;
+	PartOfBurstThatFitsInROB = dml_min(StutterPeriod * TotalDataReadBandwidth, ROBBufferSizeInKByte * 1024 * AverageDCCCompressionRate);
+	StutterBurstTime = PartOfBurstThatFitsInROB / AverageDCCCompressionRate / ReturnBW + (StutterPeriod * TotalDataReadBandwidth
+			- PartOfBurstThatFitsInROB) / (DCFCLK * 64) + StutterPeriod * TotalRowReadBandwidth / ReturnBW;
+	StutterBurstTime = dml_max(StutterBurstTime, LinesToFinishSwathTransferStutterCriticalPlane * BytePerPixelYCriticalPlane * SwathWidthYCriticalPlane / ReturnBW);
+
+	TotalActiveWriteback = 0;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (WritebackEnable[k] == true) {
+			TotalActiveWriteback = TotalActiveWriteback + 1;
+		}
+	}
+
+	if (TotalActiveWriteback == 0) {
+		*StutterEfficiencyNotIncludingVBlank = (1
+				- (SRExitTime + StutterBurstTime) / StutterPeriod) * 100;
+	} else {
+		*StutterEfficiencyNotIncludingVBlank = 0;
+	}
+
+	if (SynchronizedVBlank == true || NumberOfActivePlanes == 1) {
+		SmallestVBlank = (VTotal[0] - VActive[0]) * HTotal[0] / PixelClock[0];
+	} else {
+		SmallestVBlank = 0;
+	}
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if (SynchronizedVBlank == true || NumberOfActivePlanes == 1) {
+			VBlankTime = (VTotal[k] - VActive[k]) * HTotal[k] / PixelClock[k];
+		} else {
+			VBlankTime = 0;
+		}
+		SmallestVBlank = dml_min(SmallestVBlank, VBlankTime);
+	}
+
+	*StutterEfficiency =  (*StutterEfficiencyNotIncludingVBlank / 100.0 * (FrameTimeForMinFullDETBufferingTime - SmallestVBlank) + SmallestVBlank) / FrameTimeForMinFullDETBufferingTime * 100;
+}
+
+static void CalculateSwathAndDETConfiguration(
+		bool ForceSingleDPP,
+		int NumberOfActivePlanes,
+		long DETBufferSizeInKByte,
+		double MaximumSwathWidthLuma[],
+		double MaximumSwathWidthChroma[],
+		enum scan_direction_class SourceScan[],
+		enum source_format_class SourcePixelFormat[],
+		enum dm_swizzle_mode SurfaceTiling[],
+		int ViewportWidth[],
+		int ViewportHeight[],
+		int SurfaceWidthY[],
+		int SurfaceWidthC[],
+		int SurfaceHeightY[],
+		int SurfaceHeightC[],
+		int Read256BytesBlockHeightY[],
+		int Read256BytesBlockHeightC[],
+		int Read256BytesBlockWidthY[],
+		int Read256BytesBlockWidthC[],
+		enum odm_combine_mode ODMCombineEnabled[],
+		int BlendingAndTiming[],
+		int BytePerPixY[],
+		int BytePerPixC[],
+		double BytePerPixDETY[],
+		double BytePerPixDETC[],
+		int HActive[],
+		double HRatio[],
+		double HRatioChroma[],
+		int DPPPerPlane[],
+		int swath_width_luma_ub[],
+		int swath_width_chroma_ub[],
+		double SwathWidth[],
+		double SwathWidthChroma[],
+		int SwathHeightY[],
+		int SwathHeightC[],
+		double DETBufferSizeY[],
+		double DETBufferSizeC[],
+		bool ViewportSizeSupportPerPlane[],
+		bool *ViewportSizeSupport)
+{
+	int MaximumSwathHeightY[DC__NUM_DPP__MAX] = { 0 };
+	int MaximumSwathHeightC[DC__NUM_DPP__MAX] = { 0 };
+	int MinimumSwathHeightY = 0;
+	int MinimumSwathHeightC = 0;
+	long RoundedUpMaxSwathSizeBytesY = 0;
+	long RoundedUpMaxSwathSizeBytesC = 0;
+	long RoundedUpMinSwathSizeBytesY = 0;
+	long RoundedUpMinSwathSizeBytesC = 0;
+	long RoundedUpSwathSizeBytesY = 0;
+	long RoundedUpSwathSizeBytesC = 0;
+	double SwathWidthSingleDPP[DC__NUM_DPP__MAX] = { 0 };
+	double SwathWidthSingleDPPChroma[DC__NUM_DPP__MAX] = { 0 };
+	int k;
+
+	CalculateSwathWidth(
+			ForceSingleDPP,
+			NumberOfActivePlanes,
+			SourcePixelFormat,
+			SourceScan,
+			ViewportWidth,
+			ViewportHeight,
+			SurfaceWidthY,
+			SurfaceWidthC,
+			SurfaceHeightY,
+			SurfaceHeightC,
+			ODMCombineEnabled,
+			BytePerPixY,
+			BytePerPixC,
+			Read256BytesBlockHeightY,
+			Read256BytesBlockHeightC,
+			Read256BytesBlockWidthY,
+			Read256BytesBlockWidthC,
+			BlendingAndTiming,
+			HActive,
+			HRatio,
+			DPPPerPlane,
+			SwathWidthSingleDPP,
+			SwathWidthSingleDPPChroma,
+			SwathWidth,
+			SwathWidthChroma,
+			MaximumSwathHeightY,
+			MaximumSwathHeightC,
+			swath_width_luma_ub,
+			swath_width_chroma_ub);
+
+	*ViewportSizeSupport = true;
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		if ((SourcePixelFormat[k] == dm_444_64 || SourcePixelFormat[k] == dm_444_32
+				|| SourcePixelFormat[k] == dm_444_16
+				|| SourcePixelFormat[k] == dm_mono_16
+				|| SourcePixelFormat[k] == dm_mono_8
+				|| SourcePixelFormat[k] == dm_rgbe)) {
+			if (SurfaceTiling[k] == dm_sw_linear
+				|| (SourcePixelFormat[k] == dm_444_64
+					&& (SurfaceTiling[k] == dm_sw_64kb_s || SurfaceTiling[k] == dm_sw_64kb_s_t || SurfaceTiling[k] == dm_sw_64kb_s_x)
+					&& SourceScan[k] != dm_vert)) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k];
+			} else if (SourcePixelFormat[k] == dm_444_8 && SourceScan[k] == dm_vert) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k];
+			} else {
+				MinimumSwathHeightY = MaximumSwathHeightY[k] / 2;
+			}
+			MinimumSwathHeightC = MaximumSwathHeightC[k];
+		} else {
+			if (SurfaceTiling[k] == dm_sw_linear) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k];
+				MinimumSwathHeightC = MaximumSwathHeightC[k];
+			} else if (SourcePixelFormat[k] == dm_rgbe_alpha
+					&& SourceScan[k] == dm_vert) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k] / 2;
+				MinimumSwathHeightC = MaximumSwathHeightC[k];
+			} else if (SourcePixelFormat[k] == dm_rgbe_alpha) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k] / 2;
+				MinimumSwathHeightC = MaximumSwathHeightC[k] / 2;
+			} else if (SourcePixelFormat[k] == dm_420_8 && SourceScan[k] == dm_vert) {
+				MinimumSwathHeightY = MaximumSwathHeightY[k];
+				MinimumSwathHeightC = MaximumSwathHeightC[k] / 2;
+			} else {
+				MinimumSwathHeightC = MaximumSwathHeightC[k] / 2;
+				MinimumSwathHeightY = MaximumSwathHeightY[k] / 2;
+			}
+		}
+
+		RoundedUpMaxSwathSizeBytesY = swath_width_luma_ub[k] * BytePerPixDETY[k]
+				* MaximumSwathHeightY[k];
+		RoundedUpMinSwathSizeBytesY = swath_width_luma_ub[k] * BytePerPixDETY[k]
+				* MinimumSwathHeightY;
+		if (SourcePixelFormat[k] == dm_420_10) {
+			RoundedUpMaxSwathSizeBytesY = dml_ceil((double) RoundedUpMaxSwathSizeBytesY, 256);
+			RoundedUpMinSwathSizeBytesY = dml_ceil((double) RoundedUpMinSwathSizeBytesY, 256);
+		}
+		RoundedUpMaxSwathSizeBytesC = swath_width_chroma_ub[k] * BytePerPixDETC[k]
+				* MaximumSwathHeightC[k];
+		RoundedUpMinSwathSizeBytesC = swath_width_chroma_ub[k] * BytePerPixDETC[k]
+				* MinimumSwathHeightC;
+		if (SourcePixelFormat[k] == dm_420_10) {
+			RoundedUpMaxSwathSizeBytesC = dml_ceil(RoundedUpMaxSwathSizeBytesC, 256);
+			RoundedUpMinSwathSizeBytesC = dml_ceil(RoundedUpMinSwathSizeBytesC, 256);
+		}
+
+		if (RoundedUpMaxSwathSizeBytesY + RoundedUpMaxSwathSizeBytesC
+				<= DETBufferSizeInKByte * 1024 / 2) {
+			SwathHeightY[k] = MaximumSwathHeightY[k];
+			SwathHeightC[k] = MaximumSwathHeightC[k];
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY;
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC;
+		} else if (RoundedUpMaxSwathSizeBytesY >= 1.5 * RoundedUpMaxSwathSizeBytesC
+				&& RoundedUpMinSwathSizeBytesY + RoundedUpMaxSwathSizeBytesC
+						<= DETBufferSizeInKByte * 1024 / 2) {
+			SwathHeightY[k] = MinimumSwathHeightY;
+			SwathHeightC[k] = MaximumSwathHeightC[k];
+			RoundedUpSwathSizeBytesY = RoundedUpMinSwathSizeBytesY;
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC;
+		} else if (RoundedUpMaxSwathSizeBytesY < 1.5 * RoundedUpMaxSwathSizeBytesC
+				&& RoundedUpMaxSwathSizeBytesY + RoundedUpMinSwathSizeBytesC
+						<= DETBufferSizeInKByte * 1024 / 2) {
+			SwathHeightY[k] = MaximumSwathHeightY[k];
+			SwathHeightC[k] = MinimumSwathHeightC;
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY;
+			RoundedUpSwathSizeBytesC = RoundedUpMinSwathSizeBytesC;
+		} else {
+			SwathHeightY[k] = MinimumSwathHeightY;
+			SwathHeightC[k] = MinimumSwathHeightC;
+			RoundedUpSwathSizeBytesY = RoundedUpMinSwathSizeBytesY;
+			RoundedUpSwathSizeBytesC = RoundedUpMinSwathSizeBytesC;
+		}
+
+		if (SwathHeightC[k] == 0) {
+			DETBufferSizeY[k] = DETBufferSizeInKByte * 1024;
+			DETBufferSizeC[k] = 0;
+		} else if (RoundedUpSwathSizeBytesY <= 1.5 * RoundedUpSwathSizeBytesC) {
+			DETBufferSizeY[k] = DETBufferSizeInKByte * 1024 / 2;
+			DETBufferSizeC[k] = DETBufferSizeInKByte * 1024 / 2;
+		} else {
+			DETBufferSizeY[k] = DETBufferSizeInKByte * 1024 * 2 / 3;
+			DETBufferSizeC[k] = DETBufferSizeInKByte * 1024 / 3;
+		}
+
+		if (RoundedUpMinSwathSizeBytesY + RoundedUpMinSwathSizeBytesC
+				> DETBufferSizeInKByte * 1024 / 2
+				|| SwathWidth[k] > MaximumSwathWidthLuma[k]
+				|| (SwathHeightC[k] > 0
+						&& SwathWidthChroma[k] > MaximumSwathWidthChroma[k])) {
+			*ViewportSizeSupport = false;
+			ViewportSizeSupportPerPlane[k] = false;
+		} else {
+			ViewportSizeSupportPerPlane[k] = true;
+		}
+	}
+}
+
+static void CalculateSwathWidth(
+		bool ForceSingleDPP,
+		int NumberOfActivePlanes,
+		enum source_format_class SourcePixelFormat[],
+		enum scan_direction_class SourceScan[],
+		unsigned int ViewportWidth[],
+		unsigned int ViewportHeight[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		enum odm_combine_mode ODMCombineEnabled[],
+		int BytePerPixY[],
+		int BytePerPixC[],
+		int Read256BytesBlockHeightY[],
+		int Read256BytesBlockHeightC[],
+		int Read256BytesBlockWidthY[],
+		int Read256BytesBlockWidthC[],
+		int BlendingAndTiming[],
+		unsigned int HActive[],
+		double HRatio[],
+		int DPPPerPlane[],
+		double SwathWidthSingleDPPY[],
+		double SwathWidthSingleDPPC[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		int MaximumSwathHeightY[],
+		int MaximumSwathHeightC[],
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[])
+{
+	unsigned int k, j;
+	long surface_width_ub_l;
+	long surface_height_ub_l;
+	long surface_width_ub_c;
+	long surface_height_ub_c;
+
+	for (k = 0; k < NumberOfActivePlanes; ++k) {
+		enum odm_combine_mode MainPlaneODMCombine = 0;
+		surface_width_ub_l = dml_ceil(SurfaceWidthY[k], Read256BytesBlockWidthY[k]);
+		surface_height_ub_l = dml_ceil(SurfaceHeightY[k], Read256BytesBlockHeightY[k]);
+		surface_width_ub_c = dml_ceil(SurfaceWidthC[k], Read256BytesBlockWidthC[k]);
+		surface_height_ub_c = dml_ceil(SurfaceHeightC[k], Read256BytesBlockHeightC[k]);
+
+		if (SourceScan[k] != dm_vert) {
+			SwathWidthSingleDPPY[k] = ViewportWidth[k];
+		} else {
+			SwathWidthSingleDPPY[k] = ViewportHeight[k];
+		}
+
+		MainPlaneODMCombine = ODMCombineEnabled[k];
+		for (j = 0; j < NumberOfActivePlanes; ++j) {
+			if (BlendingAndTiming[k] == j) {
+				MainPlaneODMCombine = ODMCombineEnabled[j];
+			}
+		}
+
+		if (MainPlaneODMCombine == dm_odm_combine_mode_4to1) {
+			SwathWidthY[k] = dml_min(SwathWidthSingleDPPY[k], dml_round(HActive[k] / 4.0 * HRatio[k]));
+		} else if (MainPlaneODMCombine == dm_odm_combine_mode_2to1) {
+			SwathWidthY[k] = dml_min(SwathWidthSingleDPPY[k], dml_round(HActive[k] / 2.0 * HRatio[k]));
+		} else if (DPPPerPlane[k] == 2) {
+			SwathWidthY[k] = SwathWidthSingleDPPY[k] / 2;
+		} else {
+			SwathWidthY[k] = SwathWidthSingleDPPY[k];
+		}
+
+		if (SourcePixelFormat[k] == dm_420_8 || SourcePixelFormat[k] == dm_420_10 || SourcePixelFormat[k] == dm_420_12) {
+			SwathWidthC[k] = SwathWidthY[k] / 2;
+			SwathWidthSingleDPPC[k] = SwathWidthSingleDPPY[k] / 2;
+		} else {
+			SwathWidthC[k] = SwathWidthY[k];
+			SwathWidthSingleDPPC[k] = SwathWidthSingleDPPY[k];
+		}
+
+		if (ForceSingleDPP == true) {
+			SwathWidthY[k] = SwathWidthSingleDPPY[k];
+			SwathWidthC[k] = SwathWidthSingleDPPC[k];
+		}
+
+		surface_width_ub_l  = dml_ceil(SurfaceWidthY[k], Read256BytesBlockWidthY[k]);
+		surface_height_ub_l = dml_ceil(SurfaceHeightY[k], Read256BytesBlockHeightY[k]);
+		surface_width_ub_c  = dml_ceil(SurfaceWidthC[k], Read256BytesBlockWidthC[k]);
+		surface_height_ub_c = dml_ceil(SurfaceHeightC[k], Read256BytesBlockHeightC[k]);
+
+		if (SourceScan[k] != dm_vert) {
+			MaximumSwathHeightY[k] = Read256BytesBlockHeightY[k];
+			MaximumSwathHeightC[k] = Read256BytesBlockHeightC[k];
+			swath_width_luma_ub[k] = dml_min(surface_width_ub_l, (long) dml_ceil(SwathWidthY[k] - 1,
+					Read256BytesBlockWidthY[k]) + Read256BytesBlockWidthY[k]);
+			if (BytePerPixC[k] > 0) {
+				swath_width_chroma_ub[k] = dml_min(surface_width_ub_c, (long) dml_ceil(SwathWidthC[k] - 1,
+						Read256BytesBlockWidthC[k]) + Read256BytesBlockWidthC[k]);
+			} else {
+				swath_width_chroma_ub[k] = 0;
+			}
+		} else {
+			MaximumSwathHeightY[k] = Read256BytesBlockWidthY[k];
+			MaximumSwathHeightC[k] = Read256BytesBlockWidthC[k];
+			swath_width_luma_ub[k] = dml_min(surface_height_ub_l, (long) dml_ceil(SwathWidthY[k] - 1,
+					Read256BytesBlockHeightY[k]) + Read256BytesBlockHeightY[k]);
+			if (BytePerPixC[k] > 0) {
+				swath_width_chroma_ub[k] = dml_min(surface_height_ub_c, (long) dml_ceil(SwathWidthC[k] - 1,
+						Read256BytesBlockHeightC[k]) + Read256BytesBlockHeightC[k]);
+			} else {
+				swath_width_chroma_ub[k] = 0;
+			}
+		}
+	}
+}
+
+static double CalculateExtraLatency(
+		long RoundTripPingLatencyCycles,
+		long ReorderingBytes,
+		double DCFCLK,
+		int TotalNumberOfActiveDPP,
+		int PixelChunkSizeInKByte,
+		int TotalNumberOfDCCActiveDPP,
+		int MetaChunkSize,
+		double ReturnBW,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		int NumberOfDPP[],
+		int dpte_group_bytes[],
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels)
+{
+	double ExtraLatencyBytes = 0;
+	ExtraLatencyBytes = CalculateExtraLatencyBytes(
+					ReorderingBytes,
+					TotalNumberOfActiveDPP,
+					PixelChunkSizeInKByte,
+					TotalNumberOfDCCActiveDPP,
+					MetaChunkSize,
+					GPUVMEnable,
+					HostVMEnable,
+					NumberOfActivePlanes,
+					NumberOfDPP,
+					dpte_group_bytes,
+					PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+					PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					HostVMMinPageSize,
+					HostVMMaxNonCachedPageTableLevels);
+
+	return (RoundTripPingLatencyCycles + 32) / DCFCLK + ExtraLatencyBytes / ReturnBW;
+}
+
+static double CalculateExtraLatencyBytes(
+		long ReorderingBytes,
+		int TotalNumberOfActiveDPP,
+		int PixelChunkSizeInKByte,
+		int TotalNumberOfDCCActiveDPP,
+		int MetaChunkSize,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		int NumberOfDPP[],
+		int dpte_group_bytes[],
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels)
+{
+	double ret = 0;
+	double HostVMInefficiencyFactor = 0;
+	int HostVMDynamicLevels = 0;
+	unsigned int k;
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		HostVMInefficiencyFactor = PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly;
+		if (HostVMMinPageSize < 2048) {
+			HostVMDynamicLevels = HostVMMaxNonCachedPageTableLevels;
+		} else if (HostVMMinPageSize >= 2048 && HostVMMinPageSize < 1048576) {
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 1);
+		} else {
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 2);
+		}
+	} else {
+		HostVMInefficiencyFactor = 1;
+		HostVMDynamicLevels = 0;
+	}
+
+	ret = ReorderingBytes + (TotalNumberOfActiveDPP * PixelChunkSizeInKByte + TotalNumberOfDCCActiveDPP * MetaChunkSize) * 1024.0;
+
+	if (GPUVMEnable == true) {
+		for (k = 0; k < NumberOfActivePlanes; ++k) {
+			ret = ret + NumberOfDPP[k] * dpte_group_bytes[k] * (1 + 8 * HostVMDynamicLevels) * HostVMInefficiencyFactor;
+		}
+	}
+	return ret;
+}
+
+
+static double CalculateUrgentLatency(
+		double UrgentLatencyPixelDataOnly,
+		double UrgentLatencyPixelMixedWithVMData,
+		double UrgentLatencyVMDataOnly,
+		bool DoUrgentLatencyAdjustment,
+		double UrgentLatencyAdjustmentFabricClockComponent,
+		double UrgentLatencyAdjustmentFabricClockReference,
+		double FabricClock)
+{
+	double ret;
+
+	ret = dml_max3(UrgentLatencyPixelDataOnly, UrgentLatencyPixelMixedWithVMData, UrgentLatencyVMDataOnly);
+	if (DoUrgentLatencyAdjustment == true) {
+		ret = ret + UrgentLatencyAdjustmentFabricClockComponent * (UrgentLatencyAdjustmentFabricClockReference / FabricClock - 1);
+	}
+	return ret;
+}
+
+
+static void UseMinimumDCFCLK(
+		struct display_mode_lib *mode_lib,
+		int MaxInterDCNTileRepeaters,
+		int MaxPrefetchMode,
+		double FinalDRAMClockChangeLatency,
+		double SREnterPlusExitTime,
+		int ReturnBusWidth,
+		int RoundTripPingLatencyCycles,
+		int ReorderingBytes,
+		int PixelChunkSizeInKByte,
+		int MetaChunkSize,
+		bool GPUVMEnable,
+		int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		int NumberOfActivePlanes,
+		double HostVMMinPageSize,
+		int HostVMMaxNonCachedPageTableLevels,
+		bool DynamicMetadataVMEnabled,
+		enum immediate_flip_requirement ImmediateFlipRequirement,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
+		int VTotal[],
+		int VActive[],
+		int DynamicMetadataTransmittedBytes[],
+		int DynamicMetadataLinesBeforeActiveRequired[],
+		bool Interlace[],
+		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
+		double RequiredDISPCLK[][2],
+		double UrgLatency[],
+		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
+		double ProjectedDCFCLKDeepSleep[][2],
+		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
+		double TotalVActivePixelBandwidth[][2],
+		double TotalVActiveCursorBandwidth[][2],
+		double TotalMetaRowBandwidth[][2],
+		double TotalDPTERowBandwidth[][2],
+		unsigned int TotalNumberOfActiveDPP[][2],
+		unsigned int TotalNumberOfDCCActiveDPP[][2],
+		int dpte_group_bytes[],
+		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
+		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
+		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		int BytePerPixelY[],
+		int BytePerPixelC[],
+		int HTotal[],
+		double PixelClock[],
+		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
+		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
+		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
+		bool DynamicMetadataEnable[],
+		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
+		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double DCFCLKPerState[],
+		double DCFCLKState[][2])
+{
+	double   NormalEfficiency = 0;
+	double   PTEEfficiency = 0;
+	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2] = { { 0 } };
+	unsigned int i, j, k;
+
+	NormalEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
+			: PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
+	PTEEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
+			/ PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
+	for (i = 0; i < mode_lib->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX] = { 0 };
+			double PrefetchPixelLinesTime[DC__NUM_DPP__MAX] = { 0 };
+			double DCFCLKRequiredForPeakBandwidthPerPlane[DC__NUM_DPP__MAX] = { 0 };
+			double DynamicMetadataVMExtraLatency[DC__NUM_DPP__MAX] = { 0 };
+			double MinimumTWait = 0;
+			double NonDPTEBandwidth = 0;
+			double DPTEBandwidth = 0;
+			double DCFCLKRequiredForAverageBandwidth = 0;
+			double ExtraLatencyBytes = 0;
+			double ExtraLatencyCycles = 0;
+			double DCFCLKRequiredForPeakBandwidth = 0;
+			int NoOfDPPState[DC__NUM_DPP__MAX] = { 0 };
+			double MinimumTvmPlus2Tr0 = 0;
+
+			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
+			for (k = 0; k < NumberOfActivePlanes; ++k) {
+				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
+					+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
+			}
+
+			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
+				NoOfDPPState[k] = NoOfDPP[i][j][k];
+			}
+
+			MinimumTWait = CalculateTWait(MaxPrefetchMode, FinalDRAMClockChangeLatency, UrgLatency[i], SREnterPlusExitTime);
+			NonDPTEBandwidth = TotalVActivePixelBandwidth[i][j] + TotalVActiveCursorBandwidth[i][j] + TotalMetaRowBandwidth[i][j];
+			DPTEBandwidth =  (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) ?
+					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : TotalDPTERowBandwidth[i][j];
+			DCFCLKRequiredForAverageBandwidth = dml_max3(ProjectedDCFCLKDeepSleep[i][j],
+					(NonDPTEBandwidth + TotalDPTERowBandwidth[i][j]) / ReturnBusWidth / (MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
+					(NonDPTEBandwidth + DPTEBandwidth / PTEEfficiency) / NormalEfficiency / ReturnBusWidth);
+
+			ExtraLatencyBytes = CalculateExtraLatencyBytes(ReorderingBytes, TotalNumberOfActiveDPP[i][j], PixelChunkSizeInKByte, TotalNumberOfDCCActiveDPP[i][j],
+					MetaChunkSize, GPUVMEnable, HostVMEnable, NumberOfActivePlanes, NoOfDPPState, dpte_group_bytes,
+					PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					HostVMMinPageSize, HostVMMaxNonCachedPageTableLevels);
+			ExtraLatencyCycles = RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
+			for (k = 0; k < NumberOfActivePlanes; ++k) {
+				double DCFCLKCyclesRequiredInPrefetch = { 0 };
+				double ExpectedPrefetchBWAcceleration = { 0 };
+				double PrefetchTime = { 0 };
+
+				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k] * swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
+					+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k] * BytePerPixelC[k]) / NormalEfficiency / ReturnBusWidth;
+				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k] + PDEAndMetaPTEBytesPerFrame[i][j][k] / PTEEfficiency
+					/ NormalEfficiency / ReturnBusWidth *  (GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * DPTEBytesPerRow[i][j][k] / PTEEfficiency
+					/ NormalEfficiency / ReturnBusWidth + 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
+				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k]) * HTotal[k] / PixelClock[k];
+				ExpectedPrefetchBWAcceleration = (VActivePixelBandwidth[i][j][k] + VActiveCursorBandwidth[i][j][k]) / (ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
+				DynamicMetadataVMExtraLatency[k] = (GPUVMEnable == true && DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
+						UrgLatency[i] * GPUVMMaxPageTableLevels *  (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
+				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] - MinimumTWait - UrgLatency[i] * ((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels
+						: GPUVMMaxPageTableLevels - 2) * (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
+
+				if (PrefetchTime > 0) {
+					double ExpectedVRatioPrefetch = { 0 };
+					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
+					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
+						* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
+					if (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) {
+						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
+							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / ReturnBusWidth;
+					}
+				} else {
+					DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+				}
+				if (DynamicMetadataEnable[k] == true) {
+					double TsetupPipe = { 0 };
+					double TdmbfPipe = { 0 };
+					double TdmsksPipe = { 0 };
+					double TdmecPipe = { 0 };
+					double AllowedTimeForUrgentExtraLatency = { 0 };
+
+					CalculateDynamicMetadataParameters(
+							MaxInterDCNTileRepeaters,
+							RequiredDPPCLK[i][j][k],
+							RequiredDISPCLK[i][j],
+							ProjectedDCFCLKDeepSleep[i][j],
+							PixelClock[k],
+							HTotal[k],
+							VTotal[k] - VActive[k],
+							DynamicMetadataTransmittedBytes[k],
+							DynamicMetadataLinesBeforeActiveRequired[k],
+							Interlace[k],
+							ProgressiveToInterlaceUnitInOPP,
+							&TsetupPipe,
+							&TdmbfPipe,
+							&TdmecPipe,
+							&TdmsksPipe);
+					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - MinimumTWait - TsetupPipe
+							- TdmbfPipe - TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
+					if (AllowedTimeForUrgentExtraLatency > 0) {
+						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(DCFCLKRequiredForPeakBandwidthPerPlane[k],
+								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
+					} else {
+						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+					}
+				}
+			}
+			DCFCLKRequiredForPeakBandwidth = 0;
+			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
+				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
+			}
+			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ? (HostVMEnable == true ?
+					(GPUVMMaxPageTableLevels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
+			for (k = 0; k < NumberOfActivePlanes; ++k) {
+				double MaximumTvmPlus2Tr0PlusTsw = { 0 };
+				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
+				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
+					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
+				} else {
+					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth, 2 * ExtraLatencyCycles
+							/ (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
+						(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
+				}
+			}
+			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
+					* dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
+		}
+	}
+}
+
+#endif /* CONFIG_DRM_AMD_DC_DCN3_0 */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
new file mode 100644
index 000000000000..4e249eaabfdb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
@@ -0,0 +1,43 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DML30_DISPLAY_MODE_VBA_H__
+#define __DML30_DISPLAY_MODE_VBA_H__
+
+void dml30_recalculate(struct display_mode_lib *mode_lib);
+void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib);
+double dml30_CalculateWriteBackDISPCLK(
+		enum source_format_class WritebackPixelFormat,
+		double PixelClock,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackHTaps,
+		unsigned int WritebackVTaps,
+		long   WritebackSourceWidth,
+		long   WritebackDestinationWidth,
+		unsigned int HTotal,
+		unsigned int WritebackLineBufferSize);
+
+#endif /* __DML30_DISPLAY_MODE_VBA_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
new file mode 100644
index 000000000000..5bb10f6e300d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -0,0 +1,1868 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+
+#include "../display_mode_lib.h"
+#include "../display_mode_vba.h"
+#include "../dml_inline_defs.h"
+#include "display_rq_dlg_calc_30.h"
+
+static bool is_dual_plane(enum source_format_class source_format)
+{
+	bool ret_val = 0;
+
+	if ((source_format == dm_420_12) || (source_format == dm_420_8) || (source_format == dm_420_10) || (source_format == dm_rgbe_alpha))
+		ret_val = 1;
+
+	return ret_val;
+}
+
+static double get_refcyc_per_delivery(struct display_mode_lib *mode_lib,
+	double refclk_freq_in_mhz,
+	double pclk_freq_in_mhz,
+	unsigned int odm_combine,
+	unsigned int recout_width,
+	unsigned int hactive,
+	double vratio,
+	double hscale_pixel_rate,
+	unsigned int delivery_width,
+	unsigned int req_per_swath_ub)
+{
+	double refcyc_per_delivery = 0.0;
+
+	if (vratio <= 1.0) {
+		if (odm_combine)
+			refcyc_per_delivery = (double)refclk_freq_in_mhz * (double)((unsigned int)odm_combine*2)
+			* dml_min((double)recout_width, (double)hactive / ((unsigned int)odm_combine*2))
+			/ pclk_freq_in_mhz / (double)req_per_swath_ub;
+		else
+			refcyc_per_delivery = (double)refclk_freq_in_mhz * (double)recout_width
+			/ pclk_freq_in_mhz / (double)req_per_swath_ub;
+	} else {
+		refcyc_per_delivery = (double)refclk_freq_in_mhz * (double)delivery_width
+			/ (double)hscale_pixel_rate / (double)req_per_swath_ub;
+	}
+
+	dml_print("DML_DLG: %s: refclk_freq_in_mhz = %3.2f\n", __func__, refclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: pclk_freq_in_mhz   = %3.2f\n", __func__, pclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: recout_width       = %d\n", __func__, recout_width);
+	dml_print("DML_DLG: %s: vratio             = %3.2f\n", __func__, vratio);
+	dml_print("DML_DLG: %s: req_per_swath_ub   = %d\n", __func__, req_per_swath_ub);
+	dml_print("DML_DLG: %s: refcyc_per_delivery= %3.2f\n", __func__, refcyc_per_delivery);
+
+	return refcyc_per_delivery;
+
+}
+
+static unsigned int get_blk_size_bytes(const enum source_macro_tile_size tile_size)
+{
+	if (tile_size == dm_256k_tile)
+		return (256 * 1024);
+	else if (tile_size == dm_64k_tile)
+		return (64 * 1024);
+	else
+		return (4 * 1024);
+}
+
+static void extract_rq_sizing_regs(struct display_mode_lib *mode_lib,
+	display_data_rq_regs_st *rq_regs,
+	const display_data_rq_sizing_params_st rq_sizing)
+{
+	dml_print("DML_DLG: %s: rq_sizing param\n", __func__);
+	print__data_rq_sizing_params_st(mode_lib, rq_sizing);
+
+	rq_regs->chunk_size = dml_log2(rq_sizing.chunk_bytes) - 10;
+
+	if (rq_sizing.min_chunk_bytes == 0)
+		rq_regs->min_chunk_size = 0;
+	else
+		rq_regs->min_chunk_size = dml_log2(rq_sizing.min_chunk_bytes) - 8 + 1;
+
+	rq_regs->meta_chunk_size = dml_log2(rq_sizing.meta_chunk_bytes) - 10;
+	if (rq_sizing.min_meta_chunk_bytes == 0)
+		rq_regs->min_meta_chunk_size = 0;
+	else
+		rq_regs->min_meta_chunk_size = dml_log2(rq_sizing.min_meta_chunk_bytes) - 6 + 1;
+
+	rq_regs->dpte_group_size = dml_log2(rq_sizing.dpte_group_bytes) - 6;
+	rq_regs->mpte_group_size = dml_log2(rq_sizing.mpte_group_bytes) - 6;
+}
+
+static void extract_rq_regs(struct display_mode_lib *mode_lib,
+	display_rq_regs_st *rq_regs,
+	const display_rq_params_st rq_param)
+{
+	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
+	unsigned int detile_buf_plane1_addr = 0;
+
+	extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_l), rq_param.sizing.rq_l);
+
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_l.dpte_row_height),
+		1) - 3;
+
+	if (rq_param.yuv420) {
+		extract_rq_sizing_regs(mode_lib, &(rq_regs->rq_regs_c), rq_param.sizing.rq_c);
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(rq_param.dlg.rq_c.dpte_row_height),
+			1) - 3;
+	}
+
+	rq_regs->rq_regs_l.swath_height = dml_log2(rq_param.dlg.rq_l.swath_height);
+	rq_regs->rq_regs_c.swath_height = dml_log2(rq_param.dlg.rq_c.swath_height);
+
+	// FIXME: take the max between luma, chroma chunk size?
+	// okay for now, as we are setting chunk_bytes to 8kb anyways
+	if (rq_param.sizing.rq_l.chunk_bytes >= 32 * 1024 || (rq_param.yuv420 && rq_param.sizing.rq_c.chunk_bytes >= 32 * 1024)) { //32kb
+		rq_regs->drq_expansion_mode = 0;
+	} else {
+		rq_regs->drq_expansion_mode = 2;
+	}
+	rq_regs->prq_expansion_mode = 1;
+	rq_regs->mrq_expansion_mode = 1;
+	rq_regs->crq_expansion_mode = 1;
+
+	if (rq_param.yuv420) {
+	if ((double)rq_param.misc.rq_l.stored_swath_bytes
+			/ (double)rq_param.misc.rq_c.stored_swath_bytes <= 1.5) {
+			detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 64.0); // half to chroma
+		} else {
+			detile_buf_plane1_addr = dml_round_to_multiple((unsigned int)((2.0 * detile_buf_size_in_bytes) / 3.0),
+				256,
+				0) / 64.0; // 2/3 to chroma
+		}
+	}
+	rq_regs->plane1_base_address = detile_buf_plane1_addr;
+}
+
+static void handle_det_buf_split(struct display_mode_lib *mode_lib,
+	display_rq_params_st *rq_param,
+	const display_pipe_source_params_st pipe_src_param)
+{
+	unsigned int total_swath_bytes = 0;
+	unsigned int swath_bytes_l = 0;
+	unsigned int swath_bytes_c = 0;
+	unsigned int full_swath_bytes_packed_l = 0;
+	unsigned int full_swath_bytes_packed_c = 0;
+	bool req128_l = 0;
+	bool req128_c = 0;
+	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
+	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
+	unsigned int log2_swath_height_l = 0;
+	unsigned int log2_swath_height_c = 0;
+	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
+
+	full_swath_bytes_packed_l = rq_param->misc.rq_l.full_swath_bytes;
+	full_swath_bytes_packed_c = rq_param->misc.rq_c.full_swath_bytes;
+
+	if (rq_param->yuv420_10bpc) {
+		full_swath_bytes_packed_l = dml_round_to_multiple(rq_param->misc.rq_l.full_swath_bytes * 2.0 / 3.0,
+			256,
+			1) + 256;
+		full_swath_bytes_packed_c = dml_round_to_multiple(rq_param->misc.rq_c.full_swath_bytes * 2.0 / 3.0,
+			256,
+			1) + 256;
+	}
+
+	if (rq_param->yuv420)
+		total_swath_bytes = 2 * full_swath_bytes_packed_l + 2 * full_swath_bytes_packed_c;
+	else
+		total_swath_bytes = 2 * full_swath_bytes_packed_l;
+
+	if (total_swath_bytes <= detile_buf_size_in_bytes) { //full 256b request
+		req128_l = 0;
+		req128_c = 0;
+		swath_bytes_l = full_swath_bytes_packed_l;
+		swath_bytes_c = full_swath_bytes_packed_c;
+	} else if (!rq_param->yuv420) {
+		req128_l = 1;
+		req128_c = 0;
+		swath_bytes_c = full_swath_bytes_packed_c;
+		swath_bytes_l = full_swath_bytes_packed_l / 2;
+	} else if ((double)full_swath_bytes_packed_l / (double)full_swath_bytes_packed_c < 1.5) {
+		req128_l = 0;
+		req128_c = 1;
+		swath_bytes_l = full_swath_bytes_packed_l;
+		swath_bytes_c = full_swath_bytes_packed_c / 2;
+
+		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
+
+		if (total_swath_bytes > detile_buf_size_in_bytes) {
+			req128_l = 1;
+			swath_bytes_l = full_swath_bytes_packed_l / 2;
+		}
+	} else {
+		req128_l = 1;
+		req128_c = 0;
+		swath_bytes_l = full_swath_bytes_packed_l/2;
+		swath_bytes_c = full_swath_bytes_packed_c;
+
+		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
+
+		if (total_swath_bytes > detile_buf_size_in_bytes) {
+			req128_c = 1;
+			swath_bytes_c = full_swath_bytes_packed_c/2;
+		}
+	}
+
+	if (rq_param->yuv420)
+		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
+	else
+		total_swath_bytes = 2 * swath_bytes_l;
+
+	rq_param->misc.rq_l.stored_swath_bytes = swath_bytes_l;
+	rq_param->misc.rq_c.stored_swath_bytes = swath_bytes_c;
+
+	if (surf_linear) {
+		log2_swath_height_l = 0;
+		log2_swath_height_c = 0;
+	} else if (!surf_vert) {
+		log2_swath_height_l = dml_log2(rq_param->misc.rq_l.blk256_height) - req128_l;
+		log2_swath_height_c = dml_log2(rq_param->misc.rq_c.blk256_height) - req128_c;
+	} else {
+		log2_swath_height_l = dml_log2(rq_param->misc.rq_l.blk256_width) - req128_l;
+		log2_swath_height_c = dml_log2(rq_param->misc.rq_c.blk256_width) - req128_c;
+	}
+	rq_param->dlg.rq_l.swath_height = 1 << log2_swath_height_l;
+	rq_param->dlg.rq_c.swath_height = 1 << log2_swath_height_c;
+
+	dml_print("DML_DLG: %s: req128_l = %0d\n", __func__, req128_l);
+	dml_print("DML_DLG: %s: req128_c = %0d\n", __func__, req128_c);
+	dml_print("DML_DLG: %s: full_swath_bytes_packed_l = %0d\n",
+		__func__,
+		full_swath_bytes_packed_l);
+	dml_print("DML_DLG: %s: full_swath_bytes_packed_c = %0d\n",
+		__func__,
+		full_swath_bytes_packed_c);
+}
+
+static bool CalculateBytePerPixelAnd256BBlockSizes(
+		enum source_format_class SourcePixelFormat,
+		enum dm_swizzle_mode SurfaceTiling,
+		unsigned int *BytePerPixelY,
+		unsigned int *BytePerPixelC,
+		double       *BytePerPixelDETY,
+		double       *BytePerPixelDETC,
+		unsigned int *BlockHeight256BytesY,
+		unsigned int *BlockHeight256BytesC,
+		unsigned int *BlockWidth256BytesY,
+		unsigned int *BlockWidth256BytesC)
+{
+	if (SourcePixelFormat == dm_444_64) {
+		*BytePerPixelDETY = 8;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 8;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_rgbe_alpha) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 1;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 1;
+	} else if (SourcePixelFormat == dm_420_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 2;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 2;
+	} else if (SourcePixelFormat == dm_420_12) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 4;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	} else {
+		*BytePerPixelDETY = 4.0 / 3;
+		*BytePerPixelDETC = 8.0 / 3;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	}
+
+	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32
+			|| SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8
+			|| SourcePixelFormat == dm_mono_16 || SourcePixelFormat == dm_mono_8
+			|| SourcePixelFormat == dm_rgbe)) {
+		if (SurfaceTiling == dm_sw_linear) {
+			*BlockHeight256BytesY = 1;
+		} else if (SourcePixelFormat == dm_444_64) {
+			*BlockHeight256BytesY = 4;
+		} else if (SourcePixelFormat == dm_444_8) {
+			*BlockHeight256BytesY = 16;
+		} else {
+			*BlockHeight256BytesY = 8;
+		}
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockHeight256BytesC = 0;
+		*BlockWidth256BytesC = 0;
+	} else {
+		if (SurfaceTiling == dm_sw_linear) {
+			*BlockHeight256BytesY = 1;
+			*BlockHeight256BytesC = 1;
+		} else if (SourcePixelFormat == dm_rgbe_alpha) {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 16;
+		} else if (SourcePixelFormat == dm_420_8) {
+			*BlockHeight256BytesY = 16;
+			*BlockHeight256BytesC = 8;
+		} else {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 8;
+		}
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
+	}
+	return true;
+}
+
+static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
+	display_data_rq_dlg_params_st *rq_dlg_param,
+	display_data_rq_misc_params_st *rq_misc_param,
+	display_data_rq_sizing_params_st *rq_sizing_param,
+	unsigned int vp_width,
+	unsigned int vp_height,
+	unsigned int data_pitch,
+	unsigned int meta_pitch,
+	unsigned int source_format,
+	unsigned int tiling,
+	unsigned int macro_tile_size,
+	unsigned int source_scan,
+	unsigned int hostvm_enable,
+	unsigned int is_chroma,
+	unsigned int surface_height)
+{
+	bool surf_linear = (tiling == dm_sw_linear);
+	bool surf_vert = (source_scan == dm_vert);
+
+	unsigned int bytes_per_element = 0;
+	unsigned int bytes_per_element_y = 0;
+	unsigned int bytes_per_element_c = 0;
+
+	unsigned int blk256_width = 0;
+	unsigned int blk256_height = 0;
+
+	unsigned int blk256_width_y = 0;
+	unsigned int blk256_height_y = 0;
+	unsigned int blk256_width_c = 0;
+	unsigned int blk256_height_c = 0;
+	unsigned int log2_bytes_per_element = 0;
+	unsigned int log2_blk256_width = 0;
+	unsigned int log2_blk256_height = 0;
+	unsigned int blk_bytes = 0;
+	unsigned int log2_blk_bytes = 0;
+	unsigned int log2_blk_height = 0;
+	unsigned int log2_blk_width = 0;
+	unsigned int log2_meta_req_bytes = 0;
+	unsigned int log2_meta_req_height = 0;
+	unsigned int log2_meta_req_width = 0;
+	unsigned int meta_req_width = 0;
+	unsigned int meta_req_height = 0;
+	unsigned int log2_meta_row_height = 0;
+	unsigned int meta_row_width_ub = 0;
+	unsigned int log2_meta_chunk_bytes = 0;
+	unsigned int log2_meta_chunk_height = 0;
+
+	//full sized meta chunk width in unit of data elements
+	unsigned int log2_meta_chunk_width = 0;
+	unsigned int log2_min_meta_chunk_bytes = 0;
+	unsigned int min_meta_chunk_width = 0;
+	unsigned int meta_chunk_width = 0;
+	unsigned int meta_chunk_per_row_int = 0;
+	unsigned int meta_row_remainder = 0;
+	unsigned int meta_chunk_threshold = 0;
+	unsigned int meta_blk_bytes = 0;
+	unsigned int meta_blk_height = 0;
+	unsigned int meta_blk_width = 0;
+	unsigned int meta_surface_bytes = 0;
+	unsigned int vmpg_bytes = 0;
+	unsigned int meta_pte_req_per_frame_ub = 0;
+	unsigned int meta_pte_bytes_per_frame_ub = 0;
+	const unsigned int log2_vmpg_bytes = dml_log2(mode_lib->soc.gpuvm_min_page_size_bytes);
+	const bool dual_plane_en = is_dual_plane((enum source_format_class)(source_format));
+	const unsigned int dpte_buf_in_pte_reqs = dual_plane_en ?
+		(is_chroma ? mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma : mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma)
+		: (mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma + mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma);
+
+	unsigned int log2_vmpg_height = 0;
+	unsigned int log2_vmpg_width = 0;
+	unsigned int log2_dpte_req_height_ptes = 0;
+	unsigned int log2_dpte_req_height = 0;
+	unsigned int log2_dpte_req_width = 0;
+	unsigned int log2_dpte_row_height_linear = 0;
+	unsigned int log2_dpte_row_height = 0;
+	unsigned int log2_dpte_group_width = 0;
+	unsigned int dpte_row_width_ub = 0;
+	unsigned int dpte_req_height = 0;
+	unsigned int dpte_req_width = 0;
+	unsigned int dpte_group_width = 0;
+	unsigned int log2_dpte_group_bytes = 0;
+	unsigned int log2_dpte_group_length = 0;
+	double byte_per_pixel_det_y = 0;
+	double byte_per_pixel_det_c = 0;
+
+	CalculateBytePerPixelAnd256BBlockSizes((enum source_format_class)(source_format),
+		(enum dm_swizzle_mode)(tiling),
+		&bytes_per_element_y,
+		&bytes_per_element_c,
+		&byte_per_pixel_det_y,
+		&byte_per_pixel_det_c,
+		&blk256_height_y,
+		&blk256_height_c,
+		&blk256_width_y,
+		&blk256_width_c);
+
+	if (!is_chroma) {
+		blk256_width = blk256_width_y;
+		blk256_height = blk256_height_y;
+		bytes_per_element = bytes_per_element_y;
+	} else {
+		blk256_width = blk256_width_c;
+		blk256_height = blk256_height_c;
+		bytes_per_element = bytes_per_element_c;
+	}
+
+	log2_bytes_per_element = dml_log2(bytes_per_element);
+
+	dml_print("DML_DLG: %s: surf_linear        = %d\n", __func__, surf_linear);
+	dml_print("DML_DLG: %s: surf_vert          = %d\n", __func__, surf_vert);
+	dml_print("DML_DLG: %s: blk256_width       = %d\n", __func__, blk256_width);
+	dml_print("DML_DLG: %s: blk256_height      = %d\n", __func__, blk256_height);
+
+	log2_blk256_width = dml_log2((double)blk256_width);
+	log2_blk256_height = dml_log2((double)blk256_height);
+	blk_bytes = surf_linear ?
+		256 : get_blk_size_bytes((enum source_macro_tile_size) macro_tile_size);
+	log2_blk_bytes = dml_log2((double)blk_bytes);
+	log2_blk_height = 0;
+	log2_blk_width = 0;
+
+	// remember log rule
+	// "+" in log is multiply
+	// "-" in log is divide
+	// "/2" is like square root
+	// blk is vertical biased
+	if (tiling != dm_sw_linear)
+		log2_blk_height = log2_blk256_height
+		+ dml_ceil((double)(log2_blk_bytes - 8) / 2.0, 1);
+	else
+		log2_blk_height = 0;  // blk height of 1
+
+	log2_blk_width = log2_blk_bytes - log2_bytes_per_element - log2_blk_height;
+
+	if (!surf_vert) {
+		int unsigned temp = 0;
+
+		temp = dml_round_to_multiple(vp_width - 1, blk256_width, 1) + blk256_width;
+		if (data_pitch < blk256_width) {
+			dml_print("WARNING: DML_DLG: %s: swath_size calculation ignoring data_pitch=%u < blk256_width=%u\n", __func__, data_pitch, blk256_width);
+		} else {
+			if (temp > data_pitch) {
+				if (data_pitch >= vp_width)
+					temp = data_pitch;
+				else
+					dml_print("WARNING: DML_DLG: %s: swath_size calculation ignoring data_pitch=%u < vp_width=%u\n", __func__, data_pitch, vp_width);
+			}
+		}
+		rq_dlg_param->swath_width_ub = temp;
+		rq_dlg_param->req_per_swath_ub = temp >> log2_blk256_width;
+	} else {
+		int unsigned temp = 0;
+
+		temp = dml_round_to_multiple(vp_height - 1, blk256_height, 1) + blk256_height;
+		if (surface_height < blk256_height) {
+			dml_print("WARNING: DML_DLG: %s swath_size calculation ignored surface_height=%u < blk256_height=%u\n", __func__, surface_height, blk256_height);
+		} else {
+			if (temp > surface_height) {
+				if (surface_height >= vp_height)
+					temp = surface_height;
+				else
+					dml_print("WARNING: DML_DLG: %s swath_size calculation ignored surface_height=%u < vp_height=%u\n", __func__, surface_height, vp_height);
+			}
+		}
+		rq_dlg_param->swath_width_ub = temp;
+		rq_dlg_param->req_per_swath_ub = temp >> log2_blk256_height;
+	}
+
+	if (!surf_vert)
+		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_height
+		* bytes_per_element;
+	else
+		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_width
+		* bytes_per_element;
+
+	rq_misc_param->blk256_height = blk256_height;
+	rq_misc_param->blk256_width = blk256_width;
+
+	// -------
+	// meta
+	// -------
+	log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
+
+				 // each 64b meta request for dcn is 8x8 meta elements and
+				 // a meta element covers one 256b block of the the data surface.
+	log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
+	log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
+		- log2_meta_req_height;
+	meta_req_width = 1 << log2_meta_req_width;
+	meta_req_height = 1 << log2_meta_req_height;
+	log2_meta_row_height = 0;
+	meta_row_width_ub = 0;
+
+	// the dimensions of a meta row are meta_row_width x meta_row_height in elements.
+	// calculate upper bound of the meta_row_width
+	if (!surf_vert) {
+		log2_meta_row_height = log2_meta_req_height;
+		meta_row_width_ub = dml_round_to_multiple(vp_width - 1, meta_req_width, 1)
+			+ meta_req_width;
+		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_width;
+	} else {
+		log2_meta_row_height = log2_meta_req_width;
+		meta_row_width_ub = dml_round_to_multiple(vp_height - 1, meta_req_height, 1)
+			+ meta_req_height;
+		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_height;
+	}
+	rq_dlg_param->meta_bytes_per_row_ub = rq_dlg_param->meta_req_per_row_ub * 64;
+
+	rq_dlg_param->meta_row_height = 1 << log2_meta_row_height;
+
+	log2_meta_chunk_bytes = dml_log2(rq_sizing_param->meta_chunk_bytes);
+	log2_meta_chunk_height = log2_meta_row_height;
+
+	//full sized meta chunk width in unit of data elements
+	log2_meta_chunk_width = log2_meta_chunk_bytes + 8 - log2_bytes_per_element
+		- log2_meta_chunk_height;
+	log2_min_meta_chunk_bytes = dml_log2(rq_sizing_param->min_meta_chunk_bytes);
+	min_meta_chunk_width = 1
+		<< (log2_min_meta_chunk_bytes + 8 - log2_bytes_per_element
+			- log2_meta_chunk_height);
+	meta_chunk_width = 1 << log2_meta_chunk_width;
+	meta_chunk_per_row_int = (unsigned int)(meta_row_width_ub / meta_chunk_width);
+	meta_row_remainder = meta_row_width_ub % meta_chunk_width;
+	meta_chunk_threshold = 0;
+	meta_blk_bytes = 4096;
+	meta_blk_height = blk256_height * 64;
+	meta_blk_width = meta_blk_bytes * 256 / bytes_per_element / meta_blk_height;
+	meta_surface_bytes = meta_pitch
+		* (dml_round_to_multiple(vp_height - 1, meta_blk_height, 1) + meta_blk_height)
+		* bytes_per_element / 256;
+	vmpg_bytes = mode_lib->soc.gpuvm_min_page_size_bytes;
+	meta_pte_req_per_frame_ub = (dml_round_to_multiple(meta_surface_bytes - vmpg_bytes,
+		8 * vmpg_bytes,
+		1) + 8 * vmpg_bytes) / (8 * vmpg_bytes);
+	meta_pte_bytes_per_frame_ub = meta_pte_req_per_frame_ub * 64; //64B mpte request
+	rq_dlg_param->meta_pte_bytes_per_frame_ub = meta_pte_bytes_per_frame_ub;
+
+	dml_print("DML_DLG: %s: meta_blk_height             = %d\n", __func__, meta_blk_height);
+	dml_print("DML_DLG: %s: meta_blk_width              = %d\n", __func__, meta_blk_width);
+	dml_print("DML_DLG: %s: meta_surface_bytes          = %d\n", __func__, meta_surface_bytes);
+	dml_print("DML_DLG: %s: meta_pte_req_per_frame_ub   = %d\n",
+		__func__,
+		meta_pte_req_per_frame_ub);
+	dml_print("DML_DLG: %s: meta_pte_bytes_per_frame_ub = %d\n",
+		__func__,
+		meta_pte_bytes_per_frame_ub);
+
+	if (!surf_vert)
+		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_width;
+	else
+		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_height;
+
+	if (meta_row_remainder <= meta_chunk_threshold)
+		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 1;
+	else
+		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 2;
+
+	// ------
+	// dpte
+	// ------
+	if (surf_linear) {
+		log2_vmpg_height = 0;   // one line high
+	} else {
+		log2_vmpg_height = (log2_vmpg_bytes - 8) / 2 + log2_blk256_height;
+	}
+	log2_vmpg_width = log2_vmpg_bytes - log2_bytes_per_element - log2_vmpg_height;
+
+	// only 3 possible shapes for dpte request in dimensions of ptes: 8x1, 4x2, 2x4.
+	if (surf_linear) { //one 64B PTE request returns 8 PTEs
+		log2_dpte_req_height_ptes = 0;
+		log2_dpte_req_width = log2_vmpg_width + 3;
+		log2_dpte_req_height = 0;
+	} else if (log2_blk_bytes == 12) { //4KB tile means 4kB page size
+					 //one 64B req gives 8x1 PTEs for 4KB tile
+		log2_dpte_req_height_ptes = 0;
+		log2_dpte_req_width = log2_blk_width + 3;
+		log2_dpte_req_height = log2_blk_height + 0;
+	} else if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) { // tile block >= 64KB
+									  //two 64B reqs of 2x4 PTEs give 16 PTEs to cover 64KB
+		log2_dpte_req_height_ptes = 4;
+		log2_dpte_req_width = log2_blk256_width + 4; // log2_64KB_width
+		log2_dpte_req_height = log2_blk256_height + 4; // log2_64KB_height
+	} else { //64KB page size and must 64KB tile block
+		   //one 64B req gives 8x1 PTEs for 64KB tile
+		log2_dpte_req_height_ptes = 0;
+		log2_dpte_req_width = log2_blk_width + 3;
+		log2_dpte_req_height = log2_blk_height + 0;
+	}
+
+	// The dpte request dimensions in data elements is dpte_req_width x dpte_req_height
+	// log2_vmpg_width is how much 1 pte represent, now calculating how much a 64b pte req represent
+	// That depends on the pte shape (i.e. 8x1, 4x2, 2x4)
+	//log2_dpte_req_height	= log2_vmpg_height + log2_dpte_req_height_ptes;
+	//log2_dpte_req_width	 = log2_vmpg_width + log2_dpte_req_width_ptes;
+	dpte_req_height = 1 << log2_dpte_req_height;
+	dpte_req_width = 1 << log2_dpte_req_width;
+
+	// calculate pitch dpte row buffer can hold
+	// round the result down to a power of two.
+	if (surf_linear) {
+		unsigned int dpte_row_height = 0;
+
+		log2_dpte_row_height_linear = dml_floor(dml_log2(dpte_buf_in_pte_reqs * dpte_req_width / data_pitch), 1);
+
+		dml_print("DML_DLG: %s: is_chroma                   = %d\n", __func__, is_chroma);
+		dml_print("DML_DLG: %s: dpte_buf_in_pte_reqs        = %d\n", __func__, dpte_buf_in_pte_reqs);
+		dml_print("DML_DLG: %s: log2_dpte_row_height_linear = %d\n", __func__, log2_dpte_row_height_linear);
+
+		ASSERT(log2_dpte_row_height_linear >= 3);
+
+		if (log2_dpte_row_height_linear > 7)
+			log2_dpte_row_height_linear = 7;
+
+		log2_dpte_row_height = log2_dpte_row_height_linear;
+		// For linear, the dpte row is pitch dependent and the pte requests wrap at the pitch boundary.
+		// the dpte_row_width_ub is the upper bound of data_pitch*dpte_row_height in elements with this unique buffering.
+		dpte_row_height = 1 << log2_dpte_row_height;
+		dpte_row_width_ub = dml_round_to_multiple(data_pitch * dpte_row_height - 1,
+			dpte_req_width,
+			1) + dpte_req_width;
+		rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
+	} else {
+		// the upper bound of the dpte_row_width without dependency on viewport position follows.
+		// for tiled mode, row height is the same as req height and row store up to vp size upper bound
+		if (!surf_vert) {
+			log2_dpte_row_height = log2_dpte_req_height;
+			dpte_row_width_ub = dml_round_to_multiple(vp_width - 1, dpte_req_width, 1)
+				+ dpte_req_width;
+			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
+		} else {
+			log2_dpte_row_height =
+				(log2_blk_width < log2_dpte_req_width) ?
+				log2_blk_width : log2_dpte_req_width;
+			dpte_row_width_ub = dml_round_to_multiple(vp_height - 1, dpte_req_height, 1)
+				+ dpte_req_height;
+			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_height;
+		}
+	}
+	if (log2_blk_bytes >= 16 && log2_vmpg_bytes == 12) // tile block >= 64KB
+		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 128; //2*64B dpte request
+	else
+		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 64; //64B dpte request
+
+	rq_dlg_param->dpte_row_height = 1 << log2_dpte_row_height;
+
+	// the dpte_group_bytes is reduced for the specific case of vertical
+	// access of a tile surface that has dpte request of 8x1 ptes.
+	if (hostvm_enable)
+		rq_sizing_param->dpte_group_bytes = 512;
+	else {
+		if (!surf_linear & (log2_dpte_req_height_ptes == 0) & surf_vert) //reduced, in this case, will have page fault within a group
+			rq_sizing_param->dpte_group_bytes = 512;
+		else
+			rq_sizing_param->dpte_group_bytes = 2048;
+	}
+
+	//since pte request size is 64byte, the number of data pte requests per full sized group is as follows.
+	log2_dpte_group_bytes = dml_log2(rq_sizing_param->dpte_group_bytes);
+	log2_dpte_group_length = log2_dpte_group_bytes - 6; //length in 64b requests
+
+								// full sized data pte group width in elements
+	if (!surf_vert)
+		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_width;
+	else
+		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_height;
+
+	//But if the tile block >=64KB and the page size is 4KB, then each dPTE request is 2*64B
+	if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) // tile block >= 64KB
+		log2_dpte_group_width = log2_dpte_group_width - 1;
+
+	dpte_group_width = 1 << log2_dpte_group_width;
+
+	// since dpte groups are only aligned to dpte_req_width and not dpte_group_width,
+	// the upper bound for the dpte groups per row is as follows.
+	rq_dlg_param->dpte_groups_per_row_ub = dml_ceil((double)dpte_row_width_ub / dpte_group_width,
+		1);
+}
+
+static void get_surf_rq_param(struct display_mode_lib *mode_lib,
+	display_data_rq_sizing_params_st *rq_sizing_param,
+	display_data_rq_dlg_params_st *rq_dlg_param,
+	display_data_rq_misc_params_st *rq_misc_param,
+	const display_pipe_params_st pipe_param,
+	bool is_chroma,
+	bool is_alpha)
+{
+	bool mode_422 = 0;
+	unsigned int vp_width = 0;
+	unsigned int vp_height = 0;
+	unsigned int data_pitch = 0;
+	unsigned int meta_pitch = 0;
+	unsigned int surface_height = 0;
+	unsigned int ppe = mode_422 ? 2 : 1;
+
+	// FIXME check if ppe apply for both luma and chroma in 422 case
+	if (is_chroma | is_alpha) {
+		vp_width = pipe_param.src.viewport_width_c / ppe;
+		vp_height = pipe_param.src.viewport_height_c;
+		data_pitch = pipe_param.src.data_pitch_c;
+		meta_pitch = pipe_param.src.meta_pitch_c;
+		surface_height = pipe_param.src.surface_height_y / 2.0;
+	} else {
+		vp_width = pipe_param.src.viewport_width / ppe;
+		vp_height = pipe_param.src.viewport_height;
+		data_pitch = pipe_param.src.data_pitch;
+		meta_pitch = pipe_param.src.meta_pitch;
+		surface_height = pipe_param.src.surface_height_y;
+	}
+
+	if (pipe_param.dest.odm_combine) {
+		unsigned int access_dir = 0;
+		unsigned int full_src_vp_width = 0;
+		unsigned int hactive_odm = 0;
+		unsigned int src_hactive_odm = 0;
+		access_dir = (pipe_param.src.source_scan == dm_vert); // vp access direction: horizontal or vertical accessed
+		hactive_odm  = pipe_param.dest.hactive / ((unsigned int)pipe_param.dest.odm_combine*2);
+		if (is_chroma) {
+			full_src_vp_width = pipe_param.scale_ratio_depth.hscl_ratio_c * pipe_param.dest.full_recout_width;
+			src_hactive_odm  = pipe_param.scale_ratio_depth.hscl_ratio_c * hactive_odm;
+		} else {
+			full_src_vp_width = pipe_param.scale_ratio_depth.hscl_ratio * pipe_param.dest.full_recout_width;
+			src_hactive_odm  = pipe_param.scale_ratio_depth.hscl_ratio * hactive_odm;
+		}
+
+		if (access_dir == 0) {
+			vp_width = dml_min(full_src_vp_width, src_hactive_odm);
+			dml_print("DML_DLG: %s: vp_width = %d\n", __func__, vp_width);
+		} else {
+			vp_height = dml_min(full_src_vp_width, src_hactive_odm);
+			dml_print("DML_DLG: %s: vp_height = %d\n", __func__, vp_height);
+		}
+		dml_print("DML_DLG: %s: full_src_vp_width = %d\n", __func__, full_src_vp_width);
+		dml_print("DML_DLG: %s: hactive_odm = %d\n", __func__, hactive_odm);
+		dml_print("DML_DLG: %s: src_hactive_odm = %d\n", __func__, src_hactive_odm);
+	}
+
+	rq_sizing_param->chunk_bytes = 8192;
+
+	if (is_alpha) {
+		rq_sizing_param->chunk_bytes = 4096;
+	}
+
+	if (rq_sizing_param->chunk_bytes == 64 * 1024)
+		rq_sizing_param->min_chunk_bytes = 0;
+	else
+		rq_sizing_param->min_chunk_bytes = 1024;
+
+	rq_sizing_param->meta_chunk_bytes = 2048;
+	rq_sizing_param->min_meta_chunk_bytes = 256;
+
+	if (pipe_param.src.hostvm)
+		rq_sizing_param->mpte_group_bytes = 512;
+	else
+		rq_sizing_param->mpte_group_bytes = 2048;
+
+	get_meta_and_pte_attr(mode_lib,
+		rq_dlg_param,
+		rq_misc_param,
+		rq_sizing_param,
+		vp_width,
+		vp_height,
+		data_pitch,
+		meta_pitch,
+		pipe_param.src.source_format,
+		pipe_param.src.sw_mode,
+		pipe_param.src.macro_tile_size,
+		pipe_param.src.source_scan,
+		pipe_param.src.hostvm,
+		is_chroma,
+		surface_height);
+}
+
+static void dml_rq_dlg_get_rq_params(struct display_mode_lib *mode_lib,
+	display_rq_params_st *rq_param,
+	const display_pipe_params_st pipe_param)
+{
+	// get param for luma surface
+	rq_param->yuv420 = pipe_param.src.source_format == dm_420_8
+	|| pipe_param.src.source_format == dm_420_10
+	|| pipe_param.src.source_format == dm_rgbe_alpha
+	|| pipe_param.src.source_format == dm_420_12;
+
+	rq_param->yuv420_10bpc = pipe_param.src.source_format == dm_420_10;
+
+	rq_param->rgbe_alpha = (pipe_param.src.source_format == dm_rgbe_alpha)?1:0;
+
+	get_surf_rq_param(mode_lib,
+		&(rq_param->sizing.rq_l),
+		&(rq_param->dlg.rq_l),
+		&(rq_param->misc.rq_l),
+		pipe_param,
+		0,
+		0);
+
+	if (is_dual_plane((enum source_format_class)(pipe_param.src.source_format))) {
+		// get param for chroma surface
+		get_surf_rq_param(mode_lib,
+			&(rq_param->sizing.rq_c),
+			&(rq_param->dlg.rq_c),
+			&(rq_param->misc.rq_c),
+			pipe_param,
+			1,
+			rq_param->rgbe_alpha);
+	}
+
+	// calculate how to split the det buffer space between luma and chroma
+	handle_det_buf_split(mode_lib, rq_param, pipe_param.src);
+	print__rq_params_st(mode_lib, *rq_param);
+}
+
+void dml30_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib,
+	display_rq_regs_st *rq_regs,
+	const display_pipe_params_st pipe_param)
+{
+	display_rq_params_st rq_param = { 0 };
+
+	memset(rq_regs, 0, sizeof(*rq_regs));
+	dml_rq_dlg_get_rq_params(mode_lib, &rq_param, pipe_param);
+	extract_rq_regs(mode_lib, rq_regs, rq_param);
+
+	print__rq_regs_st(mode_lib, *rq_regs);
+}
+
+static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
+	double *refcyc_per_req_delivery_pre_cur,
+	double *refcyc_per_req_delivery_cur,
+	double refclk_freq_in_mhz,
+	double ref_freq_to_pix_freq,
+	double hscale_pixel_rate_l,
+	double hscl_ratio,
+	double vratio_pre_l,
+	double vratio_l,
+	unsigned int cur_width,
+	enum cursor_bpp cur_bpp)
+{
+	unsigned int cur_src_width = cur_width;
+	unsigned int cur_req_size = 0;
+	unsigned int cur_req_width = 0;
+	double cur_width_ub = 0.0;
+	double cur_req_per_width = 0.0;
+	double hactive_cur = 0.0;
+
+	ASSERT(cur_src_width <= 256);
+
+	*refcyc_per_req_delivery_pre_cur = 0.0;
+	*refcyc_per_req_delivery_cur = 0.0;
+	if (cur_src_width > 0) {
+		unsigned int cur_bit_per_pixel = 0;
+
+		if (cur_bpp == dm_cur_2bit) {
+			cur_req_size = 64; // byte
+			cur_bit_per_pixel = 2;
+		} else { // 32bit
+			cur_bit_per_pixel = 32;
+			if (cur_src_width >= 1 && cur_src_width <= 16)
+				cur_req_size = 64;
+			else if (cur_src_width >= 17 && cur_src_width <= 31)
+				cur_req_size = 128;
+			else
+				cur_req_size = 256;
+		}
+
+		cur_req_width = (double)cur_req_size / ((double)cur_bit_per_pixel / 8.0);
+		cur_width_ub = dml_ceil((double)cur_src_width / (double)cur_req_width, 1)
+			* (double)cur_req_width;
+		cur_req_per_width = cur_width_ub / (double)cur_req_width;
+		hactive_cur = (double)cur_src_width / hscl_ratio; // FIXME: oswin to think about what to do for cursor
+
+		if (vratio_pre_l <= 1.0) {
+			*refcyc_per_req_delivery_pre_cur = hactive_cur * ref_freq_to_pix_freq
+				/ (double)cur_req_per_width;
+		} else {
+			*refcyc_per_req_delivery_pre_cur = (double)refclk_freq_in_mhz
+				* (double)cur_src_width / hscale_pixel_rate_l
+				/ (double)cur_req_per_width;
+		}
+
+		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+
+		if (vratio_l <= 1.0) {
+			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq
+				/ (double)cur_req_per_width;
+		} else {
+			*refcyc_per_req_delivery_cur = (double)refclk_freq_in_mhz
+				* (double)cur_src_width / hscale_pixel_rate_l
+				/ (double)cur_req_per_width;
+		}
+
+		dml_print("DML_DLG: %s: cur_req_width                     = %d\n",
+			__func__,
+			cur_req_width);
+		dml_print("DML_DLG: %s: cur_width_ub                      = %3.2f\n",
+			__func__,
+			cur_width_ub);
+		dml_print("DML_DLG: %s: cur_req_per_width                 = %3.2f\n",
+			__func__,
+			cur_req_per_width);
+		dml_print("DML_DLG: %s: hactive_cur                       = %3.2f\n",
+			__func__,
+			hactive_cur);
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_cur   = %3.2f\n",
+			__func__,
+			*refcyc_per_req_delivery_pre_cur);
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_cur       = %3.2f\n",
+			__func__,
+			*refcyc_per_req_delivery_cur);
+
+		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+	}
+}
+
+// Note: currently taken in as is.
+// Nice to decouple code from hw register implement and extract code that are repeated for luma and chroma.
+static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
+	const display_e2e_pipe_params_st *e2e_pipe_param,
+	const unsigned int num_pipes,
+	const unsigned int pipe_idx,
+	display_dlg_regs_st *disp_dlg_regs,
+	display_ttu_regs_st *disp_ttu_regs,
+	const display_rq_dlg_params_st rq_dlg_param,
+	const display_dlg_sys_params_st dlg_sys_param,
+	const bool cstate_en,
+	const bool pstate_en,
+	const bool vm_en,
+	const bool ignore_viewport_pos,
+	const bool immediate_flip_support)
+{
+	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
+	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
+	const display_output_params_st *dout = &e2e_pipe_param[pipe_idx].dout;
+	const display_clocks_and_cfg_st *clks = &e2e_pipe_param[pipe_idx].clks_cfg;
+	const scaler_ratio_depth_st *scl = &e2e_pipe_param[pipe_idx].pipe.scale_ratio_depth;
+	const scaler_taps_st *taps = &e2e_pipe_param[pipe_idx].pipe.scale_taps;
+
+	// -------------------------
+	// Section 1.15.2.1: OTG dependent Params
+	// -------------------------
+	// Timing
+	unsigned int htotal = dst->htotal;
+	//	unsigned int hblank_start = dst.hblank_start; // TODO: Remove
+	unsigned int hblank_end = dst->hblank_end;
+	unsigned int vblank_start = dst->vblank_start;
+	unsigned int vblank_end = dst->vblank_end;
+	unsigned int min_vblank = mode_lib->ip.min_vblank_lines;
+
+	double dppclk_freq_in_mhz = clks->dppclk_mhz;
+	double dispclk_freq_in_mhz = clks->dispclk_mhz;
+	double refclk_freq_in_mhz = clks->refclk_mhz;
+	double pclk_freq_in_mhz = dst->pixel_rate_mhz;
+	bool interlaced = dst->interlaced;
+
+	double ref_freq_to_pix_freq = refclk_freq_in_mhz / pclk_freq_in_mhz;
+
+	double min_dcfclk_mhz = 0;
+	double t_calc_us = 0;
+	double min_ttu_vblank = 0;
+
+	double min_dst_y_ttu_vblank = 0;
+	unsigned int dlg_vblank_start = 0;
+	bool dual_plane = 0;
+	bool mode_422 = 0;
+	unsigned int access_dir = 0;
+	unsigned int vp_height_l = 0;
+	unsigned int vp_width_l = 0;
+	unsigned int vp_height_c = 0;
+	unsigned int vp_width_c = 0;
+
+	// Scaling
+	unsigned int htaps_l = 0;
+	unsigned int htaps_c = 0;
+	double hratio_l = 0;
+	double hratio_c = 0;
+	double vratio_l = 0;
+	double vratio_c = 0;
+	bool scl_enable = 0;
+
+	double line_time_in_us = 0;
+	//	double vinit_l;
+	//	double vinit_c;
+	//	double vinit_bot_l;
+	//	double vinit_bot_c;
+
+	//	unsigned int swath_height_l;
+	unsigned int swath_width_ub_l = 0;
+	//	unsigned int dpte_bytes_per_row_ub_l;
+	unsigned int dpte_groups_per_row_ub_l = 0;
+	//	unsigned int meta_pte_bytes_per_frame_ub_l;
+	//	unsigned int meta_bytes_per_row_ub_l;
+
+	//	unsigned int swath_height_c;
+	unsigned int swath_width_ub_c = 0;
+	//   unsigned int dpte_bytes_per_row_ub_c;
+	unsigned int dpte_groups_per_row_ub_c = 0;
+
+	unsigned int meta_chunks_per_row_ub_l = 0;
+	unsigned int meta_chunks_per_row_ub_c = 0;
+	unsigned int vupdate_offset = 0;
+	unsigned int vupdate_width = 0;
+	unsigned int vready_offset = 0;
+
+	unsigned int dppclk_delay_subtotal = 0;
+	unsigned int dispclk_delay_subtotal = 0;
+	unsigned int pixel_rate_delay_subtotal = 0;
+
+	unsigned int vstartup_start = 0;
+	unsigned int dst_x_after_scaler = 0;
+	unsigned int dst_y_after_scaler = 0;
+	double line_wait = 0;
+	double dst_y_prefetch = 0;
+	double dst_y_per_vm_vblank = 0;
+	double dst_y_per_row_vblank = 0;
+	double dst_y_per_vm_flip = 0;
+	double dst_y_per_row_flip = 0;
+	double max_dst_y_per_vm_vblank = 0;
+	double max_dst_y_per_row_vblank = 0;
+	double lsw = 0;
+	double vratio_pre_l = 0;
+	double vratio_pre_c = 0;
+	unsigned int req_per_swath_ub_l = 0;
+	unsigned int req_per_swath_ub_c = 0;
+	unsigned int meta_row_height_l = 0;
+	unsigned int meta_row_height_c = 0;
+	unsigned int swath_width_pixels_ub_l = 0;
+	unsigned int swath_width_pixels_ub_c = 0;
+	unsigned int scaler_rec_in_width_l = 0;
+	unsigned int scaler_rec_in_width_c = 0;
+	unsigned int dpte_row_height_l = 0;
+	unsigned int dpte_row_height_c = 0;
+	double hscale_pixel_rate_l = 0;
+	double hscale_pixel_rate_c = 0;
+	double min_hratio_fact_l = 0;
+	double min_hratio_fact_c = 0;
+	double refcyc_per_line_delivery_pre_l = 0;
+	double refcyc_per_line_delivery_pre_c = 0;
+	double refcyc_per_line_delivery_l = 0;
+	double refcyc_per_line_delivery_c = 0;
+
+	double refcyc_per_req_delivery_pre_l = 0;
+	double refcyc_per_req_delivery_pre_c = 0;
+	double refcyc_per_req_delivery_l = 0;
+	double refcyc_per_req_delivery_c = 0;
+
+	unsigned int full_recout_width = 0;
+	double refcyc_per_req_delivery_pre_cur0 = 0;
+	double refcyc_per_req_delivery_cur0 = 0;
+	double refcyc_per_req_delivery_pre_cur1 = 0;
+	double refcyc_per_req_delivery_cur1 = 0;
+
+	unsigned int pipe_index_in_combine[DC__NUM_PIPES__MAX] = { 0 };
+
+	memset(disp_dlg_regs, 0, sizeof(*disp_dlg_regs));
+	memset(disp_ttu_regs, 0, sizeof(*disp_ttu_regs));
+
+	dml_print("DML_DLG: %s:  cstate_en = %d\n", __func__, cstate_en);
+	dml_print("DML_DLG: %s:  pstate_en = %d\n", __func__, pstate_en);
+	dml_print("DML_DLG: %s:  vm_en     = %d\n", __func__, vm_en);
+	dml_print("DML_DLG: %s:  ignore_viewport_pos  = %d\n", __func__, ignore_viewport_pos);
+	dml_print("DML_DLG: %s:  immediate_flip_support  = %d\n", __func__, immediate_flip_support);
+
+	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: dispclk_freq_in_mhz    = %3.2f\n", __func__, dispclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced);
+	ASSERT(ref_freq_to_pix_freq < 4.0);
+
+	disp_dlg_regs->ref_freq_to_pix_freq =
+		(unsigned int)(ref_freq_to_pix_freq * dml_pow(2, 19));
+	disp_dlg_regs->refcyc_per_htotal = (unsigned int)(ref_freq_to_pix_freq * (double)htotal
+		* dml_pow(2, 8));
+	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; // 15 bits
+
+	min_dcfclk_mhz = dlg_sys_param.deepsleep_dcfclk_mhz;
+	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
+	min_ttu_vblank = get_min_ttu_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	min_dst_y_ttu_vblank = min_ttu_vblank * pclk_freq_in_mhz / (double)htotal;
+	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
+
+	disp_dlg_regs->min_dst_y_next_start = (unsigned int)(((double)dlg_vblank_start
+		) * dml_pow(2, 2));
+	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+
+	dml_print("DML_DLG: %s: min_dcfclk_mhz                         = %3.2f\n",
+		__func__,
+		min_dcfclk_mhz);
+	dml_print("DML_DLG: %s: min_ttu_vblank                         = %3.2f\n",
+		__func__,
+		min_ttu_vblank);
+	dml_print("DML_DLG: %s: min_dst_y_ttu_vblank                   = %3.2f\n",
+		__func__,
+		min_dst_y_ttu_vblank);
+	dml_print("DML_DLG: %s: t_calc_us                              = %3.2f\n",
+		__func__,
+		t_calc_us);
+	dml_print("DML_DLG: %s: disp_dlg_regs->min_dst_y_next_start    = 0x%0x\n",
+		__func__,
+		disp_dlg_regs->min_dst_y_next_start);
+	dml_print("DML_DLG: %s: ref_freq_to_pix_freq                   = %3.2f\n",
+		__func__,
+		ref_freq_to_pix_freq);
+
+	// -------------------------
+	// Section 1.15.2.2: Prefetch, Active and TTU
+	// -------------------------
+	// Prefetch Calc
+	// Source
+	//			 dcc_en			  = src.dcc;
+	dual_plane = is_dual_plane((enum source_format_class)(src->source_format));
+	mode_422 = 0; // TODO
+	access_dir = (src->source_scan == dm_vert); // vp access direction: horizontal or vertical accessed
+	vp_height_l = src->viewport_height;
+	vp_width_l = src->viewport_width;
+	vp_height_c = src->viewport_height_c;
+	vp_width_c = src->viewport_width_c;
+
+	// Scaling
+	htaps_l = taps->htaps;
+	htaps_c = taps->htaps_c;
+	hratio_l = scl->hscl_ratio;
+	hratio_c = scl->hscl_ratio_c;
+	vratio_l = scl->vscl_ratio;
+	vratio_c = scl->vscl_ratio_c;
+	scl_enable = scl->scl_enable;
+
+	line_time_in_us = (htotal / pclk_freq_in_mhz);
+	swath_width_ub_l = rq_dlg_param.rq_l.swath_width_ub;
+	dpte_groups_per_row_ub_l = rq_dlg_param.rq_l.dpte_groups_per_row_ub;
+	swath_width_ub_c = rq_dlg_param.rq_c.swath_width_ub;
+	dpte_groups_per_row_ub_c = rq_dlg_param.rq_c.dpte_groups_per_row_ub;
+
+	meta_chunks_per_row_ub_l = rq_dlg_param.rq_l.meta_chunks_per_row_ub;
+	meta_chunks_per_row_ub_c = rq_dlg_param.rq_c.meta_chunks_per_row_ub;
+	vupdate_offset = dst->vupdate_offset;
+	vupdate_width = dst->vupdate_width;
+	vready_offset = dst->vready_offset;
+
+	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
+	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
+
+	if (scl_enable)
+		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl;
+	else
+		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl_lb_only;
+
+	dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_cnvc_formatter
+		+ src->num_cursors * mode_lib->ip.dppclk_delay_cnvc_cursor;
+
+	if (dout->dsc_enable) {
+		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+		dispclk_delay_subtotal += dsc_delay;
+	}
+
+	pixel_rate_delay_subtotal = dppclk_delay_subtotal * pclk_freq_in_mhz / dppclk_freq_in_mhz
+		+ dispclk_delay_subtotal * pclk_freq_in_mhz / dispclk_freq_in_mhz;
+
+	vstartup_start = dst->vstartup_start;
+	if (interlaced) {
+		if (vstartup_start / 2.0
+			- (double)(vready_offset + vupdate_width + vupdate_offset) / htotal
+			<= vblank_end / 2.0)
+			disp_dlg_regs->vready_after_vcount0 = 1;
+		else
+			disp_dlg_regs->vready_after_vcount0 = 0;
+	} else {
+		if (vstartup_start
+			- (double)(vready_offset + vupdate_width + vupdate_offset) / htotal
+			<= vblank_end)
+			disp_dlg_regs->vready_after_vcount0 = 1;
+		else
+			disp_dlg_regs->vready_after_vcount0 = 0;
+	}
+
+	// TODO: Where is this coming from?
+	if (interlaced)
+		vstartup_start = vstartup_start / 2;
+
+	// TODO: What if this min_vblank doesn't match the value in the dml_config_settings.cpp?
+	if (vstartup_start >= min_vblank) {
+		dml_print("WARNING: DML_DLG: %s: vblank_start=%d vblank_end=%d\n",
+			__func__,
+			vblank_start,
+			vblank_end);
+		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
+			__func__,
+			vstartup_start,
+			min_vblank);
+		min_vblank = vstartup_start + 1;
+		dml_print("WARNING: DML_DLG: %s: vstartup_start=%d should be less than min_vblank=%d\n",
+			__func__,
+			vstartup_start,
+			min_vblank);
+	}
+
+	dst_x_after_scaler = get_dst_x_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	dst_y_after_scaler = get_dst_y_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	// do some adjustment on the dst_after scaler to account for odm combine mode
+	dml_print("DML_DLG: %s: input dst_x_after_scaler                     = %d\n",
+		__func__,
+		dst_x_after_scaler);
+	dml_print("DML_DLG: %s: input dst_y_after_scaler                     = %d\n",
+		__func__,
+		dst_y_after_scaler);
+
+	// need to figure out which side of odm combine we're in
+	if (dst->odm_combine) {
+		// figure out which pipes go together
+		bool visited[DC__NUM_PIPES__MAX] = { false };
+		unsigned int i, j, k;
+
+		for (k = 0; k < num_pipes; ++k) {
+			visited[k] = false;
+			pipe_index_in_combine[k] = 0;
+		}
+
+		for (i = 0; i < num_pipes; i++) {
+			if (e2e_pipe_param[i].pipe.src.is_hsplit && !visited[i]) {
+
+				unsigned int grp = e2e_pipe_param[i].pipe.src.hsplit_grp;
+				unsigned int grp_idx = 0;
+
+				for (j = i; j < num_pipes; j++) {
+					if (e2e_pipe_param[j].pipe.src.hsplit_grp == grp
+							&& e2e_pipe_param[j].pipe.src.is_hsplit && !visited[j]) {
+						pipe_index_in_combine[j] = grp_idx;
+						dml_print("DML_DLG: %s: pipe[%d] is in grp %d idx %d\n", __func__, j, grp, grp_idx);
+						grp_idx++;
+						visited[j] = true;
+					}
+				}
+			}
+		}
+
+	}
+
+	if (dst->odm_combine == dm_odm_combine_mode_disabled) {
+		disp_dlg_regs->refcyc_h_blank_end = (unsigned int)((double) hblank_end * ref_freq_to_pix_freq);
+	} else {
+		unsigned int   odm_combine_factor = (dst->odm_combine == dm_odm_combine_mode_2to1 ? 2 : 4); // TODO: We should really check that 4to1 is supported before setting it to 4
+		unsigned int   odm_pipe_index = pipe_index_in_combine[pipe_idx];
+		disp_dlg_regs->refcyc_h_blank_end = (unsigned int)(((double) hblank_end + odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
+	}
+	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+
+	dml_print("DML_DLG: %s: htotal                                     = %d\n", __func__, htotal);
+	dml_print("DML_DLG: %s: pixel_rate_delay_subtotal                  = %d\n",
+		__func__,
+		pixel_rate_delay_subtotal);
+	dml_print("DML_DLG: %s: dst_x_after_scaler[%d]                     = %d\n",
+		__func__,
+		pipe_idx,
+		dst_x_after_scaler);
+	dml_print("DML_DLG: %s: dst_y_after_scaler[%d]                     = %d\n",
+		__func__,
+		pipe_idx,
+		dst_y_after_scaler);
+
+	// Lwait
+		// TODO: Should this be urgent_latency_pixel_mixed_with_vm_data_us?
+	line_wait = mode_lib->soc.urgent_latency_pixel_data_only_us;
+	if (cstate_en)
+		line_wait = dml_max(mode_lib->soc.sr_enter_plus_exit_time_us, line_wait);
+	if (pstate_en)
+		line_wait = dml_max(mode_lib->soc.dram_clock_change_latency_us
+			+ mode_lib->soc.urgent_latency_pixel_data_only_us, // TODO: Should this be urgent_latency_pixel_mixed_with_vm_data_us?
+			line_wait);
+	line_wait = line_wait / line_time_in_us;
+
+	dst_y_prefetch = get_dst_y_prefetch(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	dml_print("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, dst_y_prefetch);
+
+	dst_y_per_vm_vblank = get_dst_y_per_vm_vblank(mode_lib,
+		e2e_pipe_param,
+		num_pipes,
+		pipe_idx);
+	dst_y_per_row_vblank = get_dst_y_per_row_vblank(mode_lib,
+		e2e_pipe_param,
+		num_pipes,
+		pipe_idx);
+	dst_y_per_vm_flip = get_dst_y_per_vm_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	dst_y_per_row_flip = get_dst_y_per_row_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	max_dst_y_per_vm_vblank = 32.0;	 //U5.2
+	max_dst_y_per_row_vblank = 16.0;	//U4.2
+
+	// magic!
+	if (htotal <= 75) {
+		min_vblank = 300;
+		max_dst_y_per_vm_vblank = 100.0;
+		max_dst_y_per_row_vblank = 100.0;
+	}
+
+	dml_print("DML_DLG: %s: dst_y_per_vm_flip    = %3.2f\n", __func__, dst_y_per_vm_flip);
+	dml_print("DML_DLG: %s: dst_y_per_row_flip   = %3.2f\n", __func__, dst_y_per_row_flip);
+	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
+	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
+
+	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+
+	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
+
+	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
+
+	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	dml_print("DML_DLG: %s: vratio_pre_l=%3.2f\n", __func__, vratio_pre_l);
+	dml_print("DML_DLG: %s: vratio_pre_c=%3.2f\n", __func__, vratio_pre_c);
+
+	// Active
+	req_per_swath_ub_l = rq_dlg_param.rq_l.req_per_swath_ub;
+	req_per_swath_ub_c = rq_dlg_param.rq_c.req_per_swath_ub;
+	meta_row_height_l = rq_dlg_param.rq_l.meta_row_height;
+	meta_row_height_c = rq_dlg_param.rq_c.meta_row_height;
+	swath_width_pixels_ub_l = 0;
+	swath_width_pixels_ub_c = 0;
+	scaler_rec_in_width_l = 0;
+	scaler_rec_in_width_c = 0;
+	dpte_row_height_l = rq_dlg_param.rq_l.dpte_row_height;
+	dpte_row_height_c = rq_dlg_param.rq_c.dpte_row_height;
+
+	if (mode_422) {
+		swath_width_pixels_ub_l = swath_width_ub_l * 2;  // *2 for 2 pixel per element
+		swath_width_pixels_ub_c = swath_width_ub_c * 2;
+	} else {
+		swath_width_pixels_ub_l = swath_width_ub_l * 1;
+		swath_width_pixels_ub_c = swath_width_ub_c * 1;
+	}
+
+	hscale_pixel_rate_l = 0.;
+	hscale_pixel_rate_c = 0.;
+	min_hratio_fact_l = 1.0;
+	min_hratio_fact_c = 1.0;
+
+	if (hratio_l <= 1)
+		min_hratio_fact_l = 2.0;
+	else if (htaps_l <= 6) {
+		if ((hratio_l * 2.0) > 4.0)
+			min_hratio_fact_l = 4.0;
+		else
+			min_hratio_fact_l = hratio_l * 2.0;
+	} else {
+		if (hratio_l > 4.0)
+			min_hratio_fact_l = 4.0;
+		else
+			min_hratio_fact_l = hratio_l;
+	}
+
+	hscale_pixel_rate_l = min_hratio_fact_l * dppclk_freq_in_mhz;
+
+	if (hratio_c <= 1)
+		min_hratio_fact_c = 2.0;
+	else if (htaps_c <= 6) {
+		if ((hratio_c * 2.0) > 4.0)
+			min_hratio_fact_c = 4.0;
+		else
+			min_hratio_fact_c = hratio_c * 2.0;
+	} else {
+		if (hratio_c > 4.0)
+			min_hratio_fact_c = 4.0;
+		else
+			min_hratio_fact_c = hratio_c;
+	}
+
+	hscale_pixel_rate_c = min_hratio_fact_c * dppclk_freq_in_mhz;
+
+	refcyc_per_line_delivery_pre_l = 0.;
+	refcyc_per_line_delivery_pre_c = 0.;
+	refcyc_per_line_delivery_l = 0.;
+	refcyc_per_line_delivery_c = 0.;
+
+	refcyc_per_req_delivery_pre_l = 0.;
+	refcyc_per_req_delivery_pre_c = 0.;
+	refcyc_per_req_delivery_l = 0.;
+	refcyc_per_req_delivery_c = 0.;
+
+	full_recout_width = 0;
+	// In ODM
+	if (src->is_hsplit) {
+		// This "hack"  is only allowed (and valid) for MPC combine. In ODM
+		// combine, you MUST specify the full_recout_width...according to Oswin
+		if (dst->full_recout_width == 0 && !dst->odm_combine) {
+			dml_print("DML_DLG: %s: Warning: full_recout_width not set in hsplit mode\n",
+				__func__);
+			full_recout_width = dst->recout_width * 2; // assume half split for dcn1
+		} else
+			full_recout_width = dst->full_recout_width;
+	} else
+		full_recout_width = dst->recout_width;
+
+	// As of DCN2, mpc_combine and odm_combine are mutually exclusive
+	refcyc_per_line_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
+		refclk_freq_in_mhz,
+		pclk_freq_in_mhz,
+		dst->odm_combine,
+		full_recout_width,
+		dst->hactive,
+		vratio_pre_l,
+		hscale_pixel_rate_l,
+		swath_width_pixels_ub_l,
+		1); // per line
+
+	refcyc_per_line_delivery_l = get_refcyc_per_delivery(mode_lib,
+		refclk_freq_in_mhz,
+		pclk_freq_in_mhz,
+		dst->odm_combine,
+		full_recout_width,
+		dst->hactive,
+		vratio_l,
+		hscale_pixel_rate_l,
+		swath_width_pixels_ub_l,
+		1); // per line
+
+	dml_print("DML_DLG: %s: full_recout_width              = %d\n",
+		__func__,
+		full_recout_width);
+	dml_print("DML_DLG: %s: hscale_pixel_rate_l            = %3.2f\n",
+		__func__,
+		hscale_pixel_rate_l);
+	dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n",
+		__func__,
+		refcyc_per_line_delivery_pre_l);
+	dml_print("DML_DLG: %s: refcyc_per_line_delivery_l     = %3.2f\n",
+		__func__,
+		refcyc_per_line_delivery_l);
+
+	if (dual_plane) {
+		refcyc_per_line_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
+			refclk_freq_in_mhz,
+			pclk_freq_in_mhz,
+			dst->odm_combine,
+			full_recout_width,
+			dst->hactive,
+			vratio_pre_c,
+			hscale_pixel_rate_c,
+			swath_width_pixels_ub_c,
+			1); // per line
+
+		refcyc_per_line_delivery_c = get_refcyc_per_delivery(mode_lib,
+			refclk_freq_in_mhz,
+			pclk_freq_in_mhz,
+			dst->odm_combine,
+			full_recout_width,
+			dst->hactive,
+			vratio_c,
+			hscale_pixel_rate_c,
+			swath_width_pixels_ub_c,
+			1);  // per line
+
+		dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n",
+			__func__,
+			refcyc_per_line_delivery_pre_c);
+		dml_print("DML_DLG: %s: refcyc_per_line_delivery_c     = %3.2f\n",
+			__func__,
+			refcyc_per_line_delivery_c);
+	}
+
+	// smehta: this is a hack added until we get the real dml, sorry, need to make progress
+	if (src->dynamic_metadata_enable && src->gpuvm) {
+		unsigned int levels = mode_lib->ip.gpuvm_max_page_table_levels;
+		double ref_cycles;
+
+		if (src->hostvm)
+			levels = levels * (mode_lib->ip.hostvm_max_page_table_levels+1);
+
+		ref_cycles = (levels * mode_lib->soc.urgent_latency_vm_data_only_us) * refclk_freq_in_mhz;
+		dml_print("BENyamin:    dst_y_prefetch                  = %f %d %f %f \n",
+			ref_cycles, levels, mode_lib->soc.urgent_latency_vm_data_only_us, refclk_freq_in_mhz);
+		disp_dlg_regs->refcyc_per_vm_dmdata = (unsigned int) ref_cycles;
+	}
+	dml_print("BENyamin:    dmdta_en vm                     = %d %d \n",
+		src->dynamic_metadata_enable, src->vm);
+	// TTU - Luma / Chroma
+	if (access_dir) {  // vertical access
+		scaler_rec_in_width_l = vp_height_l;
+		scaler_rec_in_width_c = vp_height_c;
+	} else {
+		scaler_rec_in_width_l = vp_width_l;
+		scaler_rec_in_width_c = vp_width_c;
+	}
+
+	refcyc_per_req_delivery_pre_l = get_refcyc_per_delivery(mode_lib,
+		refclk_freq_in_mhz,
+		pclk_freq_in_mhz,
+		dst->odm_combine,
+		full_recout_width,
+		dst->hactive,
+		vratio_pre_l,
+		hscale_pixel_rate_l,
+		scaler_rec_in_width_l,
+		req_per_swath_ub_l);  // per req
+	refcyc_per_req_delivery_l = get_refcyc_per_delivery(mode_lib,
+		refclk_freq_in_mhz,
+		pclk_freq_in_mhz,
+		dst->odm_combine,
+		full_recout_width,
+		dst->hactive,
+		vratio_l,
+		hscale_pixel_rate_l,
+		scaler_rec_in_width_l,
+		req_per_swath_ub_l);  // per req
+
+	dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n",
+		__func__,
+		refcyc_per_req_delivery_pre_l);
+	dml_print("DML_DLG: %s: refcyc_per_req_delivery_l     = %3.2f\n",
+		__func__,
+		refcyc_per_req_delivery_l);
+
+	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+
+	if (dual_plane) {
+		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
+			refclk_freq_in_mhz,
+			pclk_freq_in_mhz,
+			dst->odm_combine,
+			full_recout_width,
+			dst->hactive,
+			vratio_pre_c,
+			hscale_pixel_rate_c,
+			scaler_rec_in_width_c,
+			req_per_swath_ub_c);  // per req
+		refcyc_per_req_delivery_c = get_refcyc_per_delivery(mode_lib,
+			refclk_freq_in_mhz,
+			pclk_freq_in_mhz,
+			dst->odm_combine,
+			full_recout_width,
+			dst->hactive,
+			vratio_c,
+			hscale_pixel_rate_c,
+			scaler_rec_in_width_c,
+			req_per_swath_ub_c);  // per req
+
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n",
+			__func__,
+			refcyc_per_req_delivery_pre_c);
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_c     = %3.2f\n",
+			__func__,
+			refcyc_per_req_delivery_c);
+
+		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+	}
+
+	// TTU - Cursor
+	refcyc_per_req_delivery_pre_cur0 = 0.0;
+	refcyc_per_req_delivery_cur0 = 0.0;
+	if (src->num_cursors > 0) {
+		calculate_ttu_cursor(mode_lib,
+			&refcyc_per_req_delivery_pre_cur0,
+			&refcyc_per_req_delivery_cur0,
+			refclk_freq_in_mhz,
+			ref_freq_to_pix_freq,
+			hscale_pixel_rate_l,
+			scl->hscl_ratio,
+			vratio_pre_l,
+			vratio_l,
+			src->cur0_src_width,
+			(enum cursor_bpp)(src->cur0_bpp));
+	}
+
+	refcyc_per_req_delivery_pre_cur1 = 0.0;
+	refcyc_per_req_delivery_cur1 = 0.0;
+	if (src->num_cursors > 1) {
+		calculate_ttu_cursor(mode_lib,
+			&refcyc_per_req_delivery_pre_cur1,
+			&refcyc_per_req_delivery_cur1,
+			refclk_freq_in_mhz,
+			ref_freq_to_pix_freq,
+			hscale_pixel_rate_l,
+			scl->hscl_ratio,
+			vratio_pre_l,
+			vratio_l,
+			src->cur1_src_width,
+			(enum cursor_bpp)(src->cur1_bpp));
+	}
+
+	// TTU - Misc
+	// all hard-coded
+
+	// Assignment to register structures
+	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
+	ASSERT(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
+	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
+	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	disp_dlg_regs->dst_y_prefetch = (unsigned int)(dst_y_prefetch * dml_pow(2, 2));
+	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int)(dst_y_per_vm_vblank * dml_pow(2, 2));
+	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int)(dst_y_per_row_vblank * dml_pow(2, 2));
+	disp_dlg_regs->dst_y_per_vm_flip = (unsigned int)(dst_y_per_vm_flip * dml_pow(2, 2));
+	disp_dlg_regs->dst_y_per_row_flip = (unsigned int)(dst_y_per_row_flip * dml_pow(2, 2));
+
+	disp_dlg_regs->vratio_prefetch = (unsigned int)(vratio_pre_l * dml_pow(2, 19));
+	disp_dlg_regs->vratio_prefetch_c = (unsigned int)(vratio_pre_c * dml_pow(2, 19));
+
+	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_vblank  = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_vblank);
+	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_vblank = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_vblank);
+	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_flip    = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_flip);
+	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_flip   = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_flip);
+	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
+		(unsigned int)(dst_y_per_row_vblank * (double)htotal
+			* ref_freq_to_pix_freq / (double)dpte_groups_per_row_ub_l);
+	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+
+	if (dual_plane) {
+		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int)(dst_y_per_row_vblank
+			* (double)htotal * ref_freq_to_pix_freq
+			/ (double)dpte_groups_per_row_ub_c);
+		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
+			< (unsigned int)dml_pow(2, 13));
+	}
+
+	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
+		(unsigned int)(dst_y_per_row_vblank * (double)htotal
+			* ref_freq_to_pix_freq / (double)meta_chunks_per_row_ub_l);
+	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+
+	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
+		disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
+
+	disp_dlg_regs->refcyc_per_pte_group_flip_l = (unsigned int)(dst_y_per_row_flip * htotal
+		* ref_freq_to_pix_freq) / dpte_groups_per_row_ub_l;
+	disp_dlg_regs->refcyc_per_meta_chunk_flip_l = (unsigned int)(dst_y_per_row_flip * htotal
+		* ref_freq_to_pix_freq) / meta_chunks_per_row_ub_l;
+
+	if (dual_plane) {
+		disp_dlg_regs->refcyc_per_pte_group_flip_c = (unsigned int)(dst_y_per_row_flip
+			* htotal * ref_freq_to_pix_freq) / dpte_groups_per_row_ub_c;
+		disp_dlg_regs->refcyc_per_meta_chunk_flip_c = (unsigned int)(dst_y_per_row_flip
+			* htotal * ref_freq_to_pix_freq) / meta_chunks_per_row_ub_c;
+	}
+
+	disp_dlg_regs->refcyc_per_vm_group_vblank   = get_refcyc_per_vm_group_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
+	disp_dlg_regs->refcyc_per_vm_group_flip	 = get_refcyc_per_vm_group_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
+	disp_dlg_regs->refcyc_per_vm_req_vblank	 = get_refcyc_per_vm_req_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);
+	disp_dlg_regs->refcyc_per_vm_req_flip	   = get_refcyc_per_vm_req_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);
+
+	// Clamp to max for now
+	if (disp_dlg_regs->refcyc_per_vm_group_vblank >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_vm_group_vblank = dml_pow(2, 23) - 1;
+
+	if (disp_dlg_regs->refcyc_per_vm_group_flip >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_vm_group_flip = dml_pow(2, 23) - 1;
+
+	if (disp_dlg_regs->refcyc_per_vm_req_vblank >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_vm_req_vblank = dml_pow(2, 23) - 1;
+
+	if (disp_dlg_regs->refcyc_per_vm_req_flip >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
+
+	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int)((double)dpte_row_height_l
+		/ (double)vratio_l * dml_pow(2, 2));
+	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+
+	if (dual_plane) {
+		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int)((double)dpte_row_height_c
+			/ (double)vratio_c * dml_pow(2, 2));
+		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int)dml_pow(2, 17)) {
+			dml_print("DML_DLG: %s: Warning dst_y_per_pte_row_nom_c %u larger than supported by register format U15.2 %u\n",
+				__func__,
+				disp_dlg_regs->dst_y_per_pte_row_nom_c,
+				(unsigned int)dml_pow(2, 17) - 1);
+		}
+	}
+
+	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int)((double)meta_row_height_l
+		/ (double)vratio_l * dml_pow(2, 2));
+	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+
+	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
+
+	dml_print("DML: Trow: %fus\n", line_time_in_us * (double)dpte_row_height_l / (double)vratio_l);
+
+	disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int)((double)dpte_row_height_l
+		/ (double)vratio_l * (double)htotal * ref_freq_to_pix_freq
+		/ (double)dpte_groups_per_row_ub_l);
+	if (disp_dlg_regs->refcyc_per_pte_group_nom_l >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_pte_group_nom_l = dml_pow(2, 23) - 1;
+	disp_dlg_regs->refcyc_per_meta_chunk_nom_l = (unsigned int)((double)meta_row_height_l
+		/ (double)vratio_l * (double)htotal * ref_freq_to_pix_freq
+		/ (double)meta_chunks_per_row_ub_l);
+	if (disp_dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int)dml_pow(2, 23))
+		disp_dlg_regs->refcyc_per_meta_chunk_nom_l = dml_pow(2, 23) - 1;
+
+	if (dual_plane) {
+		disp_dlg_regs->refcyc_per_pte_group_nom_c =
+			(unsigned int)((double)dpte_row_height_c / (double)vratio_c
+				* (double)htotal * ref_freq_to_pix_freq
+				/ (double)dpte_groups_per_row_ub_c);
+		if (disp_dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int)dml_pow(2, 23))
+			disp_dlg_regs->refcyc_per_pte_group_nom_c = dml_pow(2, 23) - 1;
+
+		// TODO: Is this the right calculation? Does htotal need to be halved?
+		disp_dlg_regs->refcyc_per_meta_chunk_nom_c =
+			(unsigned int)((double)meta_row_height_c / (double)vratio_c
+				* (double)htotal * ref_freq_to_pix_freq
+				/ (double)meta_chunks_per_row_ub_c);
+		if (disp_dlg_regs->refcyc_per_meta_chunk_nom_c >= (unsigned int)dml_pow(2, 23))
+			disp_dlg_regs->refcyc_per_meta_chunk_nom_c = dml_pow(2, 23) - 1;
+	}
+
+	disp_dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int)dml_floor(refcyc_per_line_delivery_pre_l,
+		1);
+	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int)dml_floor(refcyc_per_line_delivery_l,
+		1);
+	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
+	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+
+	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int)dml_floor(refcyc_per_line_delivery_pre_c,
+		1);
+	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int)dml_floor(refcyc_per_line_delivery_c,
+		1);
+	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
+	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+
+	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
+	disp_dlg_regs->dst_y_offset_cur0 = 0;
+	disp_dlg_regs->chunk_hdl_adjust_cur1 = 3;
+	disp_dlg_regs->dst_y_offset_cur1 = 0;
+
+	disp_dlg_regs->dst_y_delta_drq_limit = 0x7fff; // off
+
+	disp_ttu_regs->refcyc_per_req_delivery_pre_l = (unsigned int)(refcyc_per_req_delivery_pre_l
+		* dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_l = (unsigned int)(refcyc_per_req_delivery_l
+		* dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_pre_c = (unsigned int)(refcyc_per_req_delivery_pre_c
+		* dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_c = (unsigned int)(refcyc_per_req_delivery_c
+		* dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_pre_cur0 =
+		(unsigned int)(refcyc_per_req_delivery_pre_cur0 * dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_cur0 = (unsigned int)(refcyc_per_req_delivery_cur0
+		* dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_pre_cur1 =
+		(unsigned int)(refcyc_per_req_delivery_pre_cur1 * dml_pow(2, 10));
+	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int)(refcyc_per_req_delivery_cur1
+		* dml_pow(2, 10));
+	disp_ttu_regs->qos_level_low_wm = 0;
+	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	disp_ttu_regs->qos_level_high_wm = (unsigned int)(4.0 * (double)htotal
+		* ref_freq_to_pix_freq);
+	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+
+	disp_ttu_regs->qos_level_flip = 14;
+	disp_ttu_regs->qos_level_fixed_l = 8;
+	disp_ttu_regs->qos_level_fixed_c = 8;
+	disp_ttu_regs->qos_level_fixed_cur0 = 8;
+	disp_ttu_regs->qos_ramp_disable_l = 0;
+	disp_ttu_regs->qos_ramp_disable_c = 0;
+	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
+
+	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
+	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+
+	print__ttu_regs_st(mode_lib, *disp_ttu_regs);
+	print__dlg_regs_st(mode_lib, *disp_dlg_regs);
+}
+
+void dml30_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
+	display_dlg_regs_st *dlg_regs,
+	display_ttu_regs_st *ttu_regs,
+	display_e2e_pipe_params_st *e2e_pipe_param,
+	const unsigned int num_pipes,
+	const unsigned int pipe_idx,
+	const bool cstate_en,
+	const bool pstate_en,
+	const bool vm_en,
+	const bool ignore_viewport_pos,
+	const bool immediate_flip_support)
+{
+	display_rq_params_st rq_param = { 0 };
+	display_dlg_sys_params_st dlg_sys_param = { 0 };
+
+	// Get watermark and Tex.
+	dlg_sys_param.t_urg_wm_us = get_wm_urgent(mode_lib, e2e_pipe_param, num_pipes);
+	dlg_sys_param.deepsleep_dcfclk_mhz = get_clk_dcf_deepsleep(mode_lib,
+		e2e_pipe_param,
+		num_pipes);
+	dlg_sys_param.t_extra_us = get_urgent_extra_latency(mode_lib, e2e_pipe_param, num_pipes);
+	dlg_sys_param.mem_trip_us = get_wm_memory_trip(mode_lib, e2e_pipe_param, num_pipes);
+	dlg_sys_param.t_mclk_wm_us = get_wm_dram_clock_change(mode_lib, e2e_pipe_param, num_pipes);
+	dlg_sys_param.t_sr_wm_us = get_wm_stutter_enter_exit(mode_lib, e2e_pipe_param, num_pipes);
+	dlg_sys_param.total_flip_bw = get_total_immediate_flip_bw(mode_lib,
+		e2e_pipe_param,
+		num_pipes);
+	dlg_sys_param.total_flip_bytes = get_total_immediate_flip_bytes(mode_lib,
+		e2e_pipe_param,
+		num_pipes);
+	dlg_sys_param.t_srx_delay_us = mode_lib->ip.dcfclk_cstate_latency
+		/ dlg_sys_param.deepsleep_dcfclk_mhz; // TODO: Deprecated
+
+	print__dlg_sys_params_st(mode_lib, dlg_sys_param);
+
+	// system parameter calculation done
+
+	dml_print("DML_DLG: Calculation for pipe[%d] start\n\n", pipe_idx);
+	dml_rq_dlg_get_rq_params(mode_lib, &rq_param, e2e_pipe_param[pipe_idx].pipe);
+	dml_rq_dlg_get_dlg_params(mode_lib,
+		e2e_pipe_param,
+		num_pipes,
+		pipe_idx,
+		dlg_regs,
+		ttu_regs,
+		rq_param.dlg,
+		dlg_sys_param,
+		cstate_en,
+		pstate_en,
+		vm_en,
+		ignore_viewport_pos,
+		immediate_flip_support);
+	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
+}
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
new file mode 100644
index 000000000000..e5b17e1104c6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
@@ -0,0 +1,69 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DML30_DISPLAY_RQ_DLG_CALC_H__
+#define __DML30_DISPLAY_RQ_DLG_CALC_H__
+
+#include "../display_rq_dlg_helpers.h"
+
+struct display_mode_lib;
+
+// Function: dml_rq_dlg_get_rq_reg
+//  Main entry point for test to get the register values out of this DML class.
+//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
+//  and then populate the rq_regs struct
+// Input:
+//  pipe_param - pipe source configuration (e.g. vp, pitch, scaling, dest, etc.)
+// Output:
+//  rq_regs - struct that holds all the RQ registers field value.
+//            See also: <display_rq_regs_st>
+void dml30_rq_dlg_get_rq_reg(struct display_mode_lib *mode_lib,
+		display_rq_regs_st *rq_regs,
+		const display_pipe_params_st pipe_param);
+
+// Function: dml_rq_dlg_get_dlg_reg
+//   Calculate and return DLG and TTU register struct given the system setting
+// Output:
+//  dlg_regs - output DLG register struct
+//  ttu_regs - output DLG TTU register struct
+// Input:
+//  e2e_pipe_param - "compacted" array of e2e pipe param struct
+//  num_pipes - num of active "pipe" or "route"
+//  pipe_idx - index that identifies the e2e_pipe_param that corresponding to this dlg
+//  cstate - 0: when calculate min_ttu_vblank it is assumed cstate is not required. 1: Normal mode, cstate is considered.
+//           Added for legacy or unrealistic timing tests.
+void dml30_rq_dlg_get_dlg_reg(struct display_mode_lib             *mode_lib,
+		display_dlg_regs_st          *dlg_regs,
+		display_ttu_regs_st          *ttu_regs,
+		display_e2e_pipe_params_st   *e2e_pipe_param,
+		const unsigned int            num_pipes,
+		const unsigned int            pipe_idx,
+		const bool                    cstate_en,
+		const bool                    pstate_en,
+		const bool                    vm_en,
+		const bool                    ignore_viewport_pos,
+		const bool                    immediate_flip_support);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
index 2689401a03a3..950ba04d7503 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
@@ -31,6 +31,11 @@
 #include "dcn20/display_rq_dlg_calc_20v2.h"
 #include "dcn21/display_mode_vba_21.h"
 #include "dcn21/display_rq_dlg_calc_21.h"
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+#include "dcn30/display_mode_vba_30.h"
+#include "dcn30/display_rq_dlg_calc_30.h"
+#include "dml_logger.h"
+#endif
 
 const struct dml_funcs dml20_funcs = {
 	.validate = dml20_ModeSupportAndSystemConfigurationFull,
@@ -53,6 +58,14 @@ const struct dml_funcs dml21_funcs = {
         .rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+const struct dml_funcs dml30_funcs = {
+	.validate = dml30_ModeSupportAndSystemConfigurationFull,
+	.recalculate = dml30_recalculate,
+	.rq_dlg_get_dlg_reg = dml30_rq_dlg_get_dlg_reg,
+	.rq_dlg_get_rq_reg = dml30_rq_dlg_get_rq_reg
+};
+#endif
 void dml_init_instance(struct display_mode_lib *lib,
 		const struct _vcs_dpi_soc_bounding_box_st *soc_bb,
 		const struct _vcs_dpi_ip_params_st *ip_params,
@@ -71,6 +84,11 @@ void dml_init_instance(struct display_mode_lib *lib,
         case DML_PROJECT_DCN21:
                 lib->funcs = dml21_funcs;
                 break;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	case DML_PROJECT_DCN30:
+		lib->funcs = dml30_funcs;
+		break;
+#endif
 
 	default:
 		break;
@@ -105,3 +123,166 @@ const char *dml_get_status_message(enum dm_validation_status status)
 	default:                                  return "Unknown Status";
 	}
 }
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+void dml_log_pipe_params(
+		struct display_mode_lib *mode_lib,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt)
+{
+	display_pipe_source_params_st *pipe_src;
+	display_pipe_dest_params_st   *pipe_dest;
+	scaler_ratio_depth_st         *scale_ratio_depth;
+	scaler_taps_st                *scale_taps;
+	display_output_params_st      *dout;
+	display_clocks_and_cfg_st     *clks_cfg;
+	int i;
+
+	for (i = 0; i < pipe_cnt; i++) {
+		pipe_src = &(pipes[i].pipe.src);
+		pipe_dest = &(pipes[i].pipe.dest);
+		scale_ratio_depth = &(pipes[i].pipe.scale_ratio_depth);
+		scale_taps = &(pipes[i].pipe.scale_taps);
+		dout = &(pipes[i].dout);
+		clks_cfg = &(pipes[i].clks_cfg);
+
+		dml_print("DML PARAMS: =====================================\n");
+		dml_print("DML PARAMS: PIPE [%d] SOURCE PARAMS:\n", i);
+		dml_print("DML PARAMS:     source_format              = %d\n", pipe_src->source_format);
+		dml_print("DML PARAMS:     dcc                        = %d\n", pipe_src->dcc);
+		dml_print("DML PARAMS:     dcc_rate                   = %d\n", pipe_src->dcc_rate);
+		dml_print("DML PARAMS:     dcc_use_global             = %d\n", pipe_src->dcc_use_global);
+		dml_print("DML PARAMS:     vm                         = %d\n", pipe_src->vm);
+		dml_print("DML PARAMS:     gpuvm                      = %d\n", pipe_src->gpuvm);
+		dml_print("DML PARAMS:     hostvm                     = %d\n", pipe_src->hostvm);
+		dml_print("DML PARAMS:     gpuvm_levels_force_en      = %d\n", pipe_src->gpuvm_levels_force_en);
+		dml_print("DML PARAMS:     gpuvm_levels_force         = %d\n", pipe_src->gpuvm_levels_force);
+		dml_print("DML PARAMS:     source_scan                = %d\n", pipe_src->source_scan);
+		dml_print("DML PARAMS:     sw_mode                    = %d\n", pipe_src->sw_mode);
+		dml_print("DML PARAMS:     macro_tile_size            = %d\n", pipe_src->macro_tile_size);
+		dml_print("DML PARAMS:     viewport_width             = %d\n", pipe_src->viewport_width);
+		dml_print("DML PARAMS:     viewport_height            = %d\n", pipe_src->viewport_height);
+		dml_print("DML PARAMS:     viewport_y_y               = %d\n", pipe_src->viewport_y_y);
+		dml_print("DML PARAMS:     viewport_y_c               = %d\n", pipe_src->viewport_y_c);
+		dml_print("DML PARAMS:     viewport_width_c           = %d\n", pipe_src->viewport_width_c);
+		dml_print("DML PARAMS:     viewport_height_c          = %d\n", pipe_src->viewport_height_c);
+		dml_print("DML PARAMS:     data_pitch                 = %d\n", pipe_src->data_pitch);
+		dml_print("DML PARAMS:     data_pitch_c               = %d\n", pipe_src->data_pitch_c);
+		dml_print("DML PARAMS:     meta_pitch                 = %d\n", pipe_src->meta_pitch);
+		dml_print("DML PARAMS:     meta_pitch_c               = %d\n", pipe_src->meta_pitch_c);
+		dml_print("DML PARAMS:     cur0_src_width             = %d\n", pipe_src->cur0_src_width);
+		dml_print("DML PARAMS:     cur0_bpp                   = %d\n", pipe_src->cur0_bpp);
+		dml_print("DML PARAMS:     cur1_src_width             = %d\n", pipe_src->cur1_src_width);
+		dml_print("DML PARAMS:     cur1_bpp                   = %d\n", pipe_src->cur1_bpp);
+		dml_print("DML PARAMS:     num_cursors                = %d\n", pipe_src->num_cursors);
+		dml_print("DML PARAMS:     is_hsplit                  = %d\n", pipe_src->is_hsplit);
+		dml_print("DML PARAMS:     hsplit_grp                 = %d\n", pipe_src->hsplit_grp);
+		dml_print("DML PARAMS:     dynamic_metadata_enable    = %d\n", pipe_src->dynamic_metadata_enable);
+		dml_print("DML PARAMS:     dmdata_lines_before_active = %d\n", pipe_src->dynamic_metadata_lines_before_active);
+		dml_print("DML PARAMS:     dmdata_xmit_bytes          = %d\n", pipe_src->dynamic_metadata_xmit_bytes);
+		dml_print("DML PARAMS:     immediate_flip             = %d\n", pipe_src->immediate_flip);
+		dml_print("DML PARAMS:     v_total_min                = %d\n", pipe_src->v_total_min);
+		dml_print("DML PARAMS:     v_total_max                = %d\n", pipe_src->v_total_max);
+		dml_print("DML PARAMS: =====================================\n");
+
+		dml_print("DML PARAMS: PIPE [%d] DESTINATION PARAMS:\n", i);
+		dml_print("DML PARAMS:     recout_width               = %d\n", pipe_dest->recout_width);
+		dml_print("DML PARAMS:     recout_height              = %d\n", pipe_dest->recout_height);
+		dml_print("DML PARAMS:     full_recout_width          = %d\n", pipe_dest->full_recout_width);
+		dml_print("DML PARAMS:     full_recout_height         = %d\n", pipe_dest->full_recout_height);
+		dml_print("DML PARAMS:     hblank_start               = %d\n", pipe_dest->hblank_start);
+		dml_print("DML PARAMS:     hblank_end                 = %d\n", pipe_dest->hblank_end);
+		dml_print("DML PARAMS:     vblank_start               = %d\n", pipe_dest->vblank_start);
+		dml_print("DML PARAMS:     vblank_end                 = %d\n", pipe_dest->vblank_end);
+		dml_print("DML PARAMS:     htotal                     = %d\n", pipe_dest->htotal);
+		dml_print("DML PARAMS:     vtotal                     = %d\n", pipe_dest->vtotal);
+		dml_print("DML PARAMS:     vactive                    = %d\n", pipe_dest->vactive);
+		dml_print("DML PARAMS:     hactive                    = %d\n", pipe_dest->hactive);
+		dml_print("DML PARAMS:     vstartup_start             = %d\n", pipe_dest->vstartup_start);
+		dml_print("DML PARAMS:     vupdate_offset             = %d\n", pipe_dest->vupdate_offset);
+		dml_print("DML PARAMS:     vupdate_width              = %d\n", pipe_dest->vupdate_width);
+		dml_print("DML PARAMS:     vready_offset              = %d\n", pipe_dest->vready_offset);
+		dml_print("DML PARAMS:     interlaced                 = %d\n", pipe_dest->interlaced);
+		dml_print("DML PARAMS:     pixel_rate_mhz             = %3.2f\n", pipe_dest->pixel_rate_mhz);
+		dml_print("DML PARAMS:     sync_vblank_all_planes     = %d\n", pipe_dest->synchronized_vblank_all_planes);
+		dml_print("DML PARAMS:     otg_inst                   = %d\n", pipe_dest->otg_inst);
+		dml_print("DML PARAMS:     odm_combine                = %d\n", pipe_dest->odm_combine);
+		dml_print("DML PARAMS:     use_maximum_vstartup       = %d\n", pipe_dest->use_maximum_vstartup);
+		dml_print("DML PARAMS:     vtotal_max                 = %d\n", pipe_dest->vtotal_max);
+		dml_print("DML PARAMS:     vtotal_min                 = %d\n", pipe_dest->vtotal_min);
+		dml_print("DML PARAMS: =====================================\n");
+
+		dml_print("DML PARAMS: PIPE [%d] SCALER PARAMS:\n", i);
+		dml_print("DML PARAMS:     hscl_ratio                 = %3.4f\n", scale_ratio_depth->hscl_ratio);
+		dml_print("DML PARAMS:     vscl_ratio                 = %3.4f\n", scale_ratio_depth->vscl_ratio);
+		dml_print("DML PARAMS:     hscl_ratio_c               = %3.4f\n", scale_ratio_depth->hscl_ratio_c);
+		dml_print("DML PARAMS:     vscl_ratio_c               = %3.4f\n", scale_ratio_depth->vscl_ratio_c);
+		dml_print("DML PARAMS:     vinit                      = %3.4f\n", scale_ratio_depth->vinit);
+		dml_print("DML PARAMS:     vinit_c                    = %3.4f\n", scale_ratio_depth->vinit_c);
+		dml_print("DML PARAMS:     vinit_bot                  = %3.4f\n", scale_ratio_depth->vinit_bot);
+		dml_print("DML PARAMS:     vinit_bot_c                = %3.4f\n", scale_ratio_depth->vinit_bot_c);
+		dml_print("DML PARAMS:     lb_depth                   = %d\n", scale_ratio_depth->lb_depth);
+		dml_print("DML PARAMS:     scl_enable                 = %d\n", scale_ratio_depth->scl_enable);
+		dml_print("DML PARAMS:     htaps                      = %d\n", scale_taps->htaps);
+		dml_print("DML PARAMS:     vtaps                      = %d\n", scale_taps->vtaps);
+		dml_print("DML PARAMS:     htaps_c                    = %d\n", scale_taps->htaps_c);
+		dml_print("DML PARAMS:     vtaps_c                    = %d\n", scale_taps->vtaps_c);
+		dml_print("DML PARAMS: =====================================\n");
+
+		dml_print("DML PARAMS: PIPE [%d] DISPLAY OUTPUT PARAMS:\n", i);
+		dml_print("DML PARAMS:     output_type                = %d\n", dout->output_type);
+		dml_print("DML PARAMS:     output_format              = %d\n", dout->output_format);
+		dml_print("DML PARAMS:     output_bpc                 = %d\n", dout->output_bpc);
+		dml_print("DML PARAMS:     output_bpp                 = %3.4f\n", dout->output_bpp);
+		dml_print("DML PARAMS:     dp_lanes                   = %d\n", dout->dp_lanes);
+		dml_print("DML PARAMS:     dsc_enable                 = %d\n", dout->dsc_enable);
+		dml_print("DML PARAMS:     dsc_slices                 = %d\n", dout->dsc_slices);
+		dml_print("DML PARAMS:     wb_enable                  = %d\n", dout->wb_enable);
+		dml_print("DML PARAMS:     num_active_wb              = %d\n", dout->num_active_wb);
+		dml_print("DML PARAMS: =====================================\n");
+
+		dml_print("DML PARAMS: PIPE [%d] CLOCK CONFIG PARAMS:\n", i);
+		dml_print("DML PARAMS:     voltage                    = %d\n", clks_cfg->voltage);
+		dml_print("DML PARAMS:     dppclk_mhz                 = %3.2f\n", clks_cfg->dppclk_mhz);
+		dml_print("DML PARAMS:     refclk_mhz                 = %3.2f\n", clks_cfg->refclk_mhz);
+		dml_print("DML PARAMS:     dispclk_mhz                = %3.2f\n", clks_cfg->dispclk_mhz);
+		dml_print("DML PARAMS:     dcfclk_mhz                 = %3.2f\n", clks_cfg->dcfclk_mhz);
+		dml_print("DML PARAMS:     socclk_mhz                 = %3.2f\n", clks_cfg->socclk_mhz);
+		dml_print("DML PARAMS: =====================================\n");
+	}
+}
+
+void dml_log_mode_support_params(struct display_mode_lib *mode_lib)
+{
+	int i;
+
+	for (i = mode_lib->vba.soc.num_states; i >= 0; i--) {
+		dml_print("DML SUPPORT: ===============================================\n");
+		dml_print("DML SUPPORT: Voltage State %d\n", i);
+		dml_print("DML SUPPORT:     Mode Supported              : %s\n", mode_lib->vba.ModeSupport[i][0] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Mode Supported (pipe split) : %s\n", mode_lib->vba.ModeSupport[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Scale Ratio And Taps                : %s\n", mode_lib->vba.ScaleRatioAndTapsSupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Source Format Pixel And Scan        : %s\n", mode_lib->vba.SourceFormatPixelAndScanSupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Viewport Size                       : [%s, %s]\n", mode_lib->vba.ViewportSizeSupport[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.ViewportSizeSupport[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     DIO Support                         : %s\n", mode_lib->vba.DIOSupport[i] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     ODM Combine 4To1 Support Check      : %s\n", mode_lib->vba.ODMCombine4To1SupportCheckOK[i] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     DSC Units                           : %s\n", mode_lib->vba.NotEnoughDSCUnits[i] ? "Not Supported" : "Supported");
+		dml_print("DML SUPPORT:     DSCCLK Required                     : %s\n", mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] ? "Not Supported" : "Supported");
+		dml_print("DML SUPPORT:     DTBCLK Required                     : %s\n", mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] ? "Not Supported" : "Supported");
+		dml_print("DML SUPPORT:     Re-ordering Buffer                  : [%s, %s]\n", mode_lib->vba.ROBSupport[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.ROBSupport[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     DISPCLK and DPPCLK                  : [%s, %s]\n", mode_lib->vba.DISPCLK_DPPCLK_Support[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.DISPCLK_DPPCLK_Support[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Total Available Pipes               : [%s, %s]\n", mode_lib->vba.TotalAvailablePipesSupport[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.TotalAvailablePipesSupport[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Writeback Latency                   : %s\n", mode_lib->vba.WritebackLatencySupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Writeback Scale Ratio And Taps      : %s\n", mode_lib->vba.WritebackScaleRatioAndTapsSupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Cursor                              : %s\n", mode_lib->vba.CursorSupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Pitch                               : %s\n", mode_lib->vba.PitchSupport ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Prefetch                            : [%s, %s]\n", mode_lib->vba.PrefetchSupported[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.PrefetchSupported[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Dynamic Metadata                    : [%s, %s]\n", mode_lib->vba.DynamicMetadataSupported[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.DynamicMetadataSupported[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     Total Vertical Active Bandwidth     : [%s, %s]\n", mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     VRatio In Prefetch                  : [%s, %s]\n", mode_lib->vba.VRatioInPrefetchSupported[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.VRatioInPrefetchSupported[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     PTE Buffer Size Not Exceeded        : [%s, %s]\n", mode_lib->vba.PTEBufferSizeNotExceeded[i][0] ? "Supported" : "NOT Supported", mode_lib->vba.PTEBufferSizeNotExceeded[i][1] ? "Supported" : "NOT Supported");
+		dml_print("DML SUPPORT:     DSC Input BPC                       : %s\n", mode_lib->vba.NonsupportedDSCInputBPC ? "Not Supported" : "Supported");
+		dml_print("DML SUPPORT:     HostVMEnable                        : %d\n", mode_lib->vba.HostVMEnable);
+		dml_print("DML SUPPORT:     ImmediateFlipSupportedForState      : [%d, %d]\n", mode_lib->vba.ImmediateFlipSupportedForState[i][0], mode_lib->vba.ImmediateFlipSupportedForState[i][1]);
+	}
+}
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
index c77c3d827e4a..6adee8a9ee56 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
@@ -37,6 +37,9 @@ enum dml_project {
 	DML_PROJECT_NAVI10,
 	DML_PROJECT_NAVI10v2,
 	DML_PROJECT_DCN21,
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	DML_PROJECT_DCN30,
+#endif
 };
 
 struct display_mode_lib;
@@ -78,4 +81,12 @@ void dml_init_instance(struct display_mode_lib *lib,
 
 const char *dml_get_status_message(enum dm_validation_status status);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+void dml_log_pipe_params(
+		struct display_mode_lib *mode_lib,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt);
+
+void dml_log_mode_support_params(struct display_mode_lib *mode_lib);
+#endif  // CONFIG_DRM_AMD_DC_DCN3_0
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index dbd766a4342b..0fac7f754604 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -124,6 +124,9 @@ struct _vcs_dpi_soc_bounding_box_st {
 
 struct _vcs_dpi_ip_params_st {
 	bool use_min_dcfclk;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	bool clamp_min_dcfclk;
+#endif
 	bool gpuvm_enable;
 	bool hostvm_enable;
 	bool dsc422_native_support;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index 7fc06ea1f647..5a1ca8a5954c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -300,6 +300,9 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
 
 	// IP Parameters
 	mode_lib->vba.UseMinimumRequiredDCFCLK = ip->use_min_dcfclk;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	mode_lib->vba.ClampMinDCFCLK = ip->clamp_min_dcfclk;
+#endif
 	mode_lib->vba.MaxNumDPP = ip->max_num_dpp;
 	mode_lib->vba.MaxNumOTG = ip->max_num_otg;
 	mode_lib->vba.MaxNumHDMIFRLOutputs = ip->max_num_hdmi_frl_outputs;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index d281a6f933f4..f615815c73bd 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -924,6 +924,9 @@ struct vba_vars_st {
 	double BPP;
 	enum odm_combine_policy ODMCombinePolicy;
 	bool UseMinimumRequiredDCFCLK;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_0
+	bool ClampMinDCFCLK;
+#endif
 	bool AllowDramClockChangeOneDisplayVactive;
 	bool SynchronizeTimingsIfSingleRefreshRate;
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
