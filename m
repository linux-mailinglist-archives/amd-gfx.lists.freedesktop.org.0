Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712A5A6E81
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Aug 2022 22:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7FE10E136;
	Tue, 30 Aug 2022 20:34:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB72710E12D;
 Tue, 30 Aug 2022 20:34:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CE7FB81DC7;
 Tue, 30 Aug 2022 20:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD44C433C1;
 Tue, 30 Aug 2022 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661891681;
 bh=16t0x2n4Flcre9YXo43Tz/IS7eY4V2y0TnxxbYQOx5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CJlxlLuGxc/WkcMBLHraAy0fUtzKz2FbQfw++2LSpS9pOeWZi2F7CxULnTk4FpLMw
 ef0SRW/mO9BJDenOC6FmS8p/QrGT7PHLLFE72yJcaV8AySugkxIe3A+27mjEzvHEgd
 5AadXSbGt4AXDOjjMGpVE4foLT6pwf6xEtzNDxDuS0cEUXIzBzqOl7TMQ8Iss0HoCi
 /ISws03LLn0p1kQ9uycJTQZCjSXYJ1idmARMLnLXTeJ6d9uSBXdUg7/gYEf1ETU6wY
 8Fng9mWec1tP0dThoC8U1ueY3geOQcx6wFFwpk2jfZvUIVU3xg4bQs9A9i0hGZcQqH
 G7P8JRqbyDzCw==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 3/5] drm/amd/display: Reduce number of arguments of dml31's
 CalculateWatermarksAndDRAMSpeedChangeSupport()
Date: Tue, 30 Aug 2022 13:34:07 -0700
Message-Id: <20220830203409.3491379-4-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830203409.3491379-1-nathan@kernel.org>
References: <20220830203409.3491379-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Most of the arguments are identical between the two call sites and they
can be accessed through the 'struct vba_vars_st' pointer. This reduces
the total amount of stack space that
dml31_ModeSupportAndSystemConfigurationFull() uses by 240 bytes with
LLVM 16 (2216 -> 1976), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      ^
  1 error generated.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 248 ++++--------------
 1 file changed, 52 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index d63b4209b14c..21c74ee1deec 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -311,64 +311,28 @@ static void CalculateVupdateAndDynamicMetadataParameters(
 static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		struct display_mode_lib *mode_lib,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActivePlanes,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizedVBlank,
-		unsigned int dpte_group_bytes[],
-		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
-		double WritebackLatency,
-		double WritebackChunkSize,
 		double SOCCLK,
-		double DRAMClockChangeLatency,
-		double SRExitTime,
-		double SREnterPlusExitTime,
-		double SRExitZ8Time,
-		double SREnterPlusExitZ8Time,
 		double DCFCLKDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int vtaps[],
-		unsigned int VTAPsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerPlane[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
-		double DSTXAfterScaler[],
-		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		int unsigned CompressedBufferSizeInkByte,
 		enum clock_change_support *DRAMClockChangeSupport,
-		double *UrgentWatermark,
-		double *WritebackUrgentWatermark,
-		double *DRAMClockChangeWatermark,
-		double *WritebackDRAMClockChangeWatermark,
 		double *StutterExitWatermark,
 		double *StutterEnterPlusExitWatermark,
 		double *Z8StutterExitWatermark,
-		double *Z8StutterEnterPlusExitWatermark,
-		double *MinActiveDRAMClockChangeLatencySupported);
+		double *Z8StutterEnterPlusExitWatermark);
 
 static void CalculateDCFCLKDeepSleep(
 		struct display_mode_lib *mode_lib,
@@ -3017,64 +2981,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		CalculateWatermarksAndDRAMSpeedChangeSupport(
 				mode_lib,
 				PrefetchMode,
-				v->NumberOfActivePlanes,
-				v->MaxLineBufferLines,
-				v->LineBufferSize,
-				v->WritebackInterfaceBufferSize,
 				v->DCFCLK,
 				v->ReturnBW,
-				v->SynchronizedVBlank,
-				v->dpte_group_bytes,
-				v->MetaChunkSize,
 				v->UrgentLatency,
 				v->UrgentExtraLatency,
-				v->WritebackLatency,
-				v->WritebackChunkSize,
 				v->SOCCLK,
-				v->DRAMClockChangeLatency,
-				v->SRExitTime,
-				v->SREnterPlusExitTime,
-				v->SRExitZ8Time,
-				v->SREnterPlusExitZ8Time,
 				v->DCFCLKDeepSleep,
 				v->DETBufferSizeY,
 				v->DETBufferSizeC,
 				v->SwathHeightY,
 				v->SwathHeightC,
-				v->LBBitPerPixel,
 				v->SwathWidthY,
 				v->SwathWidthC,
-				v->HRatio,
-				v->HRatioChroma,
-				v->vtaps,
-				v->VTAPsChroma,
-				v->VRatio,
-				v->VRatioChroma,
-				v->HTotal,
-				v->PixelClock,
-				v->BlendingAndTiming,
 				v->DPPPerPlane,
 				v->BytePerPixelDETY,
 				v->BytePerPixelDETC,
-				v->DSTXAfterScaler,
-				v->DSTYAfterScaler,
-				v->WritebackEnable,
-				v->WritebackPixelFormat,
-				v->WritebackDestinationWidth,
-				v->WritebackDestinationHeight,
-				v->WritebackSourceHeight,
 				v->UnboundedRequestEnabled,
 				v->CompressedBufferSizeInkByte,
 				&DRAMClockChangeSupport,
-				&v->UrgentWatermark,
-				&v->WritebackUrgentWatermark,
-				&v->DRAMClockChangeWatermark,
-				&v->WritebackDRAMClockChangeWatermark,
 				&v->StutterExitWatermark,
 				&v->StutterEnterPlusExitWatermark,
 				&v->Z8StutterExitWatermark,
-				&v->Z8StutterEnterPlusExitWatermark,
-				&v->MinActiveDRAMClockChangeLatencySupported);
+				&v->Z8StutterEnterPlusExitWatermark);
 
 		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 			if (v->WritebackEnable[k] == true) {
@@ -5384,64 +5312,28 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			CalculateWatermarksAndDRAMSpeedChangeSupport(
 					mode_lib,
 					v->PrefetchModePerState[i][j],
-					v->NumberOfActivePlanes,
-					v->MaxLineBufferLines,
-					v->LineBufferSize,
-					v->WritebackInterfaceBufferSize,
 					v->DCFCLKState[i][j],
 					v->ReturnBWPerState[i][j],
-					v->SynchronizedVBlank,
-					v->dpte_group_bytes,
-					v->MetaChunkSize,
 					v->UrgLatency[i],
 					v->ExtraLatency,
-					v->WritebackLatency,
-					v->WritebackChunkSize,
 					v->SOCCLKPerState[i],
-					v->DRAMClockChangeLatency,
-					v->SRExitTime,
-					v->SREnterPlusExitTime,
-					v->SRExitZ8Time,
-					v->SREnterPlusExitZ8Time,
 					v->ProjectedDCFCLKDeepSleep[i][j],
 					v->DETBufferSizeYThisState,
 					v->DETBufferSizeCThisState,
 					v->SwathHeightYThisState,
 					v->SwathHeightCThisState,
-					v->LBBitPerPixel,
 					v->SwathWidthYThisState,
 					v->SwathWidthCThisState,
-					v->HRatio,
-					v->HRatioChroma,
-					v->vtaps,
-					v->VTAPsChroma,
-					v->VRatio,
-					v->VRatioChroma,
-					v->HTotal,
-					v->PixelClock,
-					v->BlendingAndTiming,
 					v->NoOfDPPThisState,
 					v->BytePerPixelInDETY,
 					v->BytePerPixelInDETC,
-					v->DSTXAfterScaler,
-					v->DSTYAfterScaler,
-					v->WritebackEnable,
-					v->WritebackPixelFormat,
-					v->WritebackDestinationWidth,
-					v->WritebackDestinationHeight,
-					v->WritebackSourceHeight,
 					UnboundedRequestEnabledThisState,
 					CompressedBufferSizeInkByteThisState,
 					&v->DRAMClockChangeSupport[i][j],
-					&v->UrgentWatermark,
-					&v->WritebackUrgentWatermark,
-					&v->DRAMClockChangeWatermark,
-					&v->WritebackDRAMClockChangeWatermark,
-					&dummy,
 					&dummy,
 					&dummy,
 					&dummy,
-					&v->MinActiveDRAMClockChangeLatencySupported);
+					&dummy);
 		}
 	}
 
@@ -5566,64 +5458,28 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		struct display_mode_lib *mode_lib,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActivePlanes,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizedVBlank,
-		unsigned int dpte_group_bytes[],
-		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
-		double WritebackLatency,
-		double WritebackChunkSize,
 		double SOCCLK,
-		double DRAMClockChangeLatency,
-		double SRExitTime,
-		double SREnterPlusExitTime,
-		double SRExitZ8Time,
-		double SREnterPlusExitZ8Time,
 		double DCFCLKDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int vtaps[],
-		unsigned int VTAPsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerPlane[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
-		double DSTXAfterScaler[],
-		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		int unsigned CompressedBufferSizeInkByte,
 		enum clock_change_support *DRAMClockChangeSupport,
-		double *UrgentWatermark,
-		double *WritebackUrgentWatermark,
-		double *DRAMClockChangeWatermark,
-		double *WritebackDRAMClockChangeWatermark,
 		double *StutterExitWatermark,
 		double *StutterEnterPlusExitWatermark,
 		double *Z8StutterExitWatermark,
-		double *Z8StutterEnterPlusExitWatermark,
-		double *MinActiveDRAMClockChangeLatencySupported)
+		double *Z8StutterEnterPlusExitWatermark)
 {
 	struct vba_vars_st *v = &mode_lib->vba;
 	double EffectiveLBLatencyHidingY;
@@ -5643,103 +5499,103 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 	double TotalPixelBW = 0.0;
 	int k, j;
 
-	*UrgentWatermark = UrgentLatency + ExtraLatency;
+	v->UrgentWatermark = UrgentLatency + ExtraLatency;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
 	dml_print("DML::%s: ExtraLatency = %f\n", __func__, ExtraLatency);
-	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, *UrgentWatermark);
+	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, v->UrgentWatermark);
 #endif
 
-	*DRAMClockChangeWatermark = DRAMClockChangeLatency + *UrgentWatermark;
+	v->DRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->UrgentWatermark;
 
 #ifdef __DML_VBA_DEBUG__
-	dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, DRAMClockChangeLatency);
-	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, *DRAMClockChangeWatermark);
+	dml_print("DML::%s: v->DRAMClockChangeLatency = %f\n", __func__, v->DRAMClockChangeLatency );
+	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, v->DRAMClockChangeWatermark);
 #endif
 
 	v->TotalActiveWriteback = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (WritebackEnable[k] == true) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->WritebackEnable[k] == true) {
 			v->TotalActiveWriteback = v->TotalActiveWriteback + 1;
 		}
 	}
 
 	if (v->TotalActiveWriteback <= 1) {
-		*WritebackUrgentWatermark = WritebackLatency;
+		v->WritebackUrgentWatermark = v->WritebackLatency;
 	} else {
-		*WritebackUrgentWatermark = WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->WritebackUrgentWatermark = v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
 
 	if (v->TotalActiveWriteback <= 1) {
-		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency;
+		v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency;
 	} else {
-		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
 
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		TotalPixelBW = TotalPixelBW
-				+ DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k])
-						/ (HTotal[k] / PixelClock[k]);
+				+ DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * v->VRatioChroma[k])
+						/ (v->HTotal[k] / v->PixelClock[k]);
 	}
 
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		double EffectiveDETBufferSizeY = DETBufferSizeY[k];
 
 		v->LBLatencyHidingSourceLinesY = dml_min(
-				(double) MaxLineBufferLines,
-				dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
+				(double) v->MaxLineBufferLines,
+				dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
 
 		v->LBLatencyHidingSourceLinesC = dml_min(
-				(double) MaxLineBufferLines,
-				dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k] - 1);
+				(double) v->MaxLineBufferLines,
+				dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
 
-		EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
 
-		EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
 
 		if (UnboundedRequestEnabled) {
 			EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
-					+ CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] / (HTotal[k] / PixelClock[k]) / TotalPixelBW;
+					+ CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] / (v->HTotal[k] / v->PixelClock[k]) / TotalPixelBW;
 		}
 
 		LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
 		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
-		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
 		if (BytePerPixelDETC[k] > 0) {
 			LinesInDETC = v->DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
 			LinesInDETCRoundedDownToSwath = dml_floor(LinesInDETC, SwathHeightC[k]);
-			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
+			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
 		} else {
 			LinesInDETC = 0;
 			FullDETBufferingTimeC = 999999;
 		}
 
 		ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
-				- ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
+				- ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
 
-		if (NumberOfActivePlanes > 1) {
+		if (v->NumberOfActivePlanes > 1) {
 			ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY
-					- (1 - 1.0 / NumberOfActivePlanes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
+					- (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k];
 		}
 
 		if (BytePerPixelDETC[k] > 0) {
 			ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
-					- ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
+					- ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
 
-			if (NumberOfActivePlanes > 1) {
+			if (v->NumberOfActivePlanes > 1) {
 				ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC
-						- (1 - 1.0 / NumberOfActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
+						- (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatioChroma[k];
 			}
 			v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
 		} else {
 			v->ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
 		}
 
-		if (WritebackEnable[k] == true) {
-			WritebackDRAMClockChangeLatencyHiding = WritebackInterfaceBufferSize * 1024
-					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
-			if (WritebackPixelFormat[k] == dm_444_64) {
+		if (v->WritebackEnable[k] == true) {
+			WritebackDRAMClockChangeLatencyHiding = v->WritebackInterfaceBufferSize * 1024
+					/ (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
+			if (v->WritebackPixelFormat[k] == dm_444_64) {
 				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding / 2;
 			}
 			WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
@@ -5749,14 +5605,14 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 
 	v->MinActiveDRAMClockChangeMargin = 999999;
 	PlaneWithMinActiveDRAMClockChangeMargin = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->MinActiveDRAMClockChangeMargin) {
 			v->MinActiveDRAMClockChangeMargin = v->ActiveDRAMClockChangeLatencyMargin[k];
-			if (BlendingAndTiming[k] == k) {
+			if (v->BlendingAndTiming[k] == k) {
 				PlaneWithMinActiveDRAMClockChangeMargin = k;
 			} else {
-				for (j = 0; j < NumberOfActivePlanes; ++j) {
-					if (BlendingAndTiming[k] == j) {
+				for (j = 0; j < v->NumberOfActivePlanes; ++j) {
+					if (v->BlendingAndTiming[k] == j) {
 						PlaneWithMinActiveDRAMClockChangeMargin = j;
 					}
 				}
@@ -5764,11 +5620,11 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	*MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + DRAMClockChangeLatency;
+	v->MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + v->DRAMClockChangeLatency ;
 
 	SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 999999;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (BlendingAndTiming[k] == k)) && !(BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (v->BlendingAndTiming[k] == k)) && !(v->BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
 				&& v->ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
 			SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = v->ActiveDRAMClockChangeLatencyMargin[k];
 		}
@@ -5776,25 +5632,25 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 
 	v->TotalNumberOfActiveOTG = 0;
 
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (BlendingAndTiming[k] == k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] == k) {
 			v->TotalNumberOfActiveOTG = v->TotalNumberOfActiveOTG + 1;
 		}
 	}
 
 	if (v->MinActiveDRAMClockChangeMargin > 0 && PrefetchMode == 0) {
 		*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
-	} else if ((SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
+	} else if ((v->SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
 			|| SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0) {
 		*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
 	} else {
 		*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
 	}
 
-	*StutterExitWatermark = SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
-	*StutterEnterPlusExitWatermark = (SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
-	*Z8StutterExitWatermark = SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
-	*Z8StutterEnterPlusExitWatermark = SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
+	*StutterExitWatermark = v->SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
+	*StutterEnterPlusExitWatermark = (v->SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
+	*Z8StutterExitWatermark = v->SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
+	*Z8StutterEnterPlusExitWatermark = v->SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, *StutterExitWatermark);
-- 
2.37.2

