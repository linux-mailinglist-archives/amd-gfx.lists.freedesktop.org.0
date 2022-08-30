Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0415A6E7F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Aug 2022 22:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D821C10E134;
	Tue, 30 Aug 2022 20:34:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7D010E12F;
 Tue, 30 Aug 2022 20:34:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85E3B61522;
 Tue, 30 Aug 2022 20:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF78C433B5;
 Tue, 30 Aug 2022 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661891678;
 bh=iBw4U+2fzQ5oGWVGdweyLaKJ4ZBymbB1s/nzHDkcubE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C9yyiI5AmObsBBLDO7ulJ/djy8IYj8uepUVXr0sWEFUJjAFdPLlg278nOr4OLgHrR
 L6Hd/Mnwk8JXKIpdC203E9DBMz1UmJPGUZltNv9yk3qt7CM9G1AlKvfYpBEmzDnVqR
 id8ewui4HTJ9LU7gu0vx9s+L4aSVzC2SZyuzVO3UjiBWQoSsyaN4HUL8dvfeGbUPg/
 Q/M8214uEQtnADZ08pHQa2XfZujaYJ4F13B9AbtRvnVsmVDVdo2vX5SrrLcgYTNA/u
 AO7Xyc1JYEix7oqLU+eQe7CPv+wcu40Gcr+XYn5uhdD5Ft6dO5pZq8gHyOGIyeWI3S
 ZP64lYbdPrPxg==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 1/5] drm/amd/display: Reduce number of arguments of
 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
Date: Tue, 30 Aug 2022 13:34:05 -0700
Message-Id: <20220830203409.3491379-2-nathan@kernel.org>
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
can be accessed through the 'struct vba_vars_st' pointer created at the
top of dml32_ModeSupportAndSystemConfigurationFull(). This reduces the
total amount of stack space that
dml32_ModeSupportAndSystemConfigurationFull() uses by 216 bytes with
LLVM 16 (2152 -> 1936), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
       ^
  1 error generated.

Additionally, while modifying the arguments to
dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(), use 'v'
consistently, instead of 'v' mixed with 'mode_lib->vba'.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        | 118 ++-------
 .../dc/dml/dcn32/display_mode_vba_util_32.c   | 248 ++++++++----------
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |  33 +--
 3 files changed, 140 insertions(+), 259 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index d8014bfbc3fe..7da90fba95fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -1163,58 +1163,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
 
 		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-			mode_lib->vba.USRRetrainingRequiredFinal,
-			mode_lib->vba.UsesMALLForPStateChange,
-			mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
-			mode_lib->vba.NumberOfActiveSurfaces,
-			mode_lib->vba.MaxLineBufferLines,
-			mode_lib->vba.LineBufferSizeFinal,
-			mode_lib->vba.WritebackInterfaceBufferSize,
-			mode_lib->vba.DCFCLK,
-			mode_lib->vba.ReturnBW,
-			mode_lib->vba.SynchronizeTimingsFinal,
-			mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-			mode_lib->vba.DRRDisplay,
-			v->dpte_group_bytes,
-			v->meta_row_height,
-			v->meta_row_height_chroma,
+			v,
+			v->PrefetchModePerState[v->VoltageLevel][v->maxMpcComb],
+			v->DCFCLK,
+			v->ReturnBW,
 			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
-			mode_lib->vba.WritebackChunkSize,
-			mode_lib->vba.SOCCLK,
+			v->SOCCLK,
 			v->DCFCLKDeepSleep,
-			mode_lib->vba.DETBufferSizeY,
-			mode_lib->vba.DETBufferSizeC,
-			mode_lib->vba.SwathHeightY,
-			mode_lib->vba.SwathHeightC,
-			mode_lib->vba.LBBitPerPixel,
+			v->DETBufferSizeY,
+			v->DETBufferSizeC,
+			v->SwathHeightY,
+			v->SwathHeightC,
 			v->SwathWidthY,
 			v->SwathWidthC,
-			mode_lib->vba.HRatio,
-			mode_lib->vba.HRatioChroma,
-			mode_lib->vba.vtaps,
-			mode_lib->vba.VTAPsChroma,
-			mode_lib->vba.VRatio,
-			mode_lib->vba.VRatioChroma,
-			mode_lib->vba.HTotal,
-			mode_lib->vba.VTotal,
-			mode_lib->vba.VActive,
-			mode_lib->vba.PixelClock,
-			mode_lib->vba.BlendingAndTiming,
-			mode_lib->vba.DPPPerPlane,
+			v->DPPPerPlane,
 			v->BytePerPixelDETY,
 			v->BytePerPixelDETC,
 			v->DSTXAfterScaler,
 			v->DSTYAfterScaler,
-			mode_lib->vba.WritebackEnable,
-			mode_lib->vba.WritebackPixelFormat,
-			mode_lib->vba.WritebackDestinationWidth,
-			mode_lib->vba.WritebackDestinationHeight,
-			mode_lib->vba.WritebackSourceHeight,
 			v->UnboundedRequestEnabled,
 			v->CompressedBufferSizeInkByte,
 
 			/* Output */
-			&v->Watermark,
 			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_dramchange_support,
 			v->MaxActiveDRAMClockChangeLatencySupported,
 			v->SubViewportLinesNeededInMALL,
@@ -3559,62 +3529,32 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			{
 				dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-						mode_lib->vba.USRRetrainingRequiredFinal,
-						mode_lib->vba.UsesMALLForPStateChange,
-						mode_lib->vba.PrefetchModePerState[i][j],
-						mode_lib->vba.NumberOfActiveSurfaces,
-						mode_lib->vba.MaxLineBufferLines,
-						mode_lib->vba.LineBufferSizeFinal,
-						mode_lib->vba.WritebackInterfaceBufferSize,
-						mode_lib->vba.DCFCLKState[i][j],
-						mode_lib->vba.ReturnBWPerState[i][j],
-						mode_lib->vba.SynchronizeTimingsFinal,
-						mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-						mode_lib->vba.DRRDisplay,
-						mode_lib->vba.dpte_group_bytes,
-						mode_lib->vba.meta_row_height,
-						mode_lib->vba.meta_row_height_chroma,
+						v,
+						v->PrefetchModePerState[i][j],
+						v->DCFCLKState[i][j],
+						v->ReturnBWPerState[i][j],
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters,
-						mode_lib->vba.WritebackChunkSize,
-						mode_lib->vba.SOCCLKPerState[i],
-						mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j],
-						mode_lib->vba.DETBufferSizeYThisState,
-						mode_lib->vba.DETBufferSizeCThisState,
-						mode_lib->vba.SwathHeightYThisState,
-						mode_lib->vba.SwathHeightCThisState,
-						mode_lib->vba.LBBitPerPixel,
-						mode_lib->vba.SwathWidthYThisState, // 24
-						mode_lib->vba.SwathWidthCThisState,
-						mode_lib->vba.HRatio,
-						mode_lib->vba.HRatioChroma,
-						mode_lib->vba.vtaps,
-						mode_lib->vba.VTAPsChroma,
-						mode_lib->vba.VRatio,
-						mode_lib->vba.VRatioChroma,
-						mode_lib->vba.HTotal,
-						mode_lib->vba.VTotal,
-						mode_lib->vba.VActive,
-						mode_lib->vba.PixelClock,
-						mode_lib->vba.BlendingAndTiming,
-						mode_lib->vba.NoOfDPPThisState,
-						mode_lib->vba.BytePerPixelInDETY,
-						mode_lib->vba.BytePerPixelInDETC,
+						v->SOCCLKPerState[i],
+						v->ProjectedDCFCLKDeepSleep[i][j],
+						v->DETBufferSizeYThisState,
+						v->DETBufferSizeCThisState,
+						v->SwathHeightYThisState,
+						v->SwathHeightCThisState,
+						v->SwathWidthYThisState, // 24
+						v->SwathWidthCThisState,
+						v->NoOfDPPThisState,
+						v->BytePerPixelInDETY,
+						v->BytePerPixelInDETC,
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler,
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTYAfterScaler,
-						mode_lib->vba.WritebackEnable,
-						mode_lib->vba.WritebackPixelFormat,
-						mode_lib->vba.WritebackDestinationWidth,
-						mode_lib->vba.WritebackDestinationHeight,
-						mode_lib->vba.WritebackSourceHeight,
-						mode_lib->vba.UnboundedRequestEnabledThisState,
-						mode_lib->vba.CompressedBufferSizeInkByteThisState,
+						v->UnboundedRequestEnabledThisState,
+						v->CompressedBufferSizeInkByteThisState,
 
 						/* Output */
-						&mode_lib->vba.Watermark, // Store the values in vba
-						&mode_lib->vba.DRAMClockChangeSupport[i][j],
+						&v->DRAMClockChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
-						&mode_lib->vba.FCLKChangeSupport[i][j],
+						&v->FCLKChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
 						&mode_lib->vba.USRRetrainingSupport[i][j],
 						mode_lib->vba.ActiveDRAMClockChangeLatencyMarginPerState[i][j]);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index dc501ee7d01a..6c7b748ee62b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4209,58 +4209,28 @@ void dml32_CalculateFlipSchedule(
 } // CalculateFlipSchedule
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-		bool USRRetrainingRequiredFinal,
-		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		struct vba_vars_st *v,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActiveSurfaces,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizeTimingsFinal,
-		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-		bool DRRDisplay[],
-		unsigned int dpte_group_bytes[],
-		unsigned int meta_row_height[],
-		unsigned int meta_row_height_chroma[],
 		SOCParametersList mmSOCParameters,
-		unsigned int WritebackChunkSize,
 		double SOCCLK,
 		double DCFClkDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int VTaps[],
-		unsigned int VTapsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		unsigned int VTotal[],
-		unsigned int VActive[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerSurface[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double DSTXAfterScaler[],
 		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		unsigned int CompressedBufferSizeInkByte,
 
 		/* Output */
-		Watermarks *Watermark,
 		enum clock_change_support *DRAMClockChangeSupport,
 		double MaxActiveDRAMClockChangeLatencySupported[],
 		unsigned int SubViewportLinesNeededInMALL[],
@@ -4302,136 +4272,136 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	unsigned int LBLatencyHidingSourceLinesY[DC__NUM_DPP__MAX];
 	unsigned int LBLatencyHidingSourceLinesC[DC__NUM_DPP__MAX];
 
-	Watermark->UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
-	Watermark->USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
+	v->Watermark.UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
+	v->Watermark.USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
 			+ mmSOCParameters.USRRetrainingLatency + mmSOCParameters.SMNLatency;
-	Watermark->DRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency + Watermark->UrgentWatermark;
-	Watermark->FCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency + Watermark->UrgentWatermark;
-	Watermark->StutterExitWatermark = mmSOCParameters.SRExitTime + mmSOCParameters.ExtraLatency
+	v->Watermark.DRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency + v->Watermark.UrgentWatermark;
+	v->Watermark.FCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency + v->Watermark.UrgentWatermark;
+	v->Watermark.StutterExitWatermark = mmSOCParameters.SRExitTime + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitTime + mmSOCParameters.ExtraLatency
+	v->Watermark.StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitTime + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->Z8StutterExitWatermark = mmSOCParameters.SRExitZ8Time + mmSOCParameters.ExtraLatency
+	v->Watermark.Z8StutterExitWatermark = mmSOCParameters.SRExitZ8Time + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->Z8StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitZ8Time
+	v->Watermark.Z8StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitZ8Time
 			+ mmSOCParameters.ExtraLatency + 10 / DCFClkDeepSleep;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: UrgentLatency = %f\n", __func__, mmSOCParameters.UrgentLatency);
 	dml_print("DML::%s: ExtraLatency = %f\n", __func__, mmSOCParameters.ExtraLatency);
 	dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, mmSOCParameters.DRAMClockChangeLatency);
-	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, Watermark->UrgentWatermark);
-	dml_print("DML::%s: USRRetrainingWatermark = %f\n", __func__, Watermark->USRRetrainingWatermark);
-	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, Watermark->DRAMClockChangeWatermark);
-	dml_print("DML::%s: FCLKChangeWatermark = %f\n", __func__, Watermark->FCLKChangeWatermark);
-	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, Watermark->StutterExitWatermark);
-	dml_print("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, Watermark->StutterEnterPlusExitWatermark);
-	dml_print("DML::%s: Z8StutterExitWatermark = %f\n", __func__, Watermark->Z8StutterExitWatermark);
+	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, v->Watermark.UrgentWatermark);
+	dml_print("DML::%s: USRRetrainingWatermark = %f\n", __func__, v->Watermark.USRRetrainingWatermark);
+	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, v->Watermark.DRAMClockChangeWatermark);
+	dml_print("DML::%s: FCLKChangeWatermark = %f\n", __func__, v->Watermark.FCLKChangeWatermark);
+	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, v->Watermark.StutterExitWatermark);
+	dml_print("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, v->Watermark.StutterEnterPlusExitWatermark);
+	dml_print("DML::%s: Z8StutterExitWatermark = %f\n", __func__, v->Watermark.Z8StutterExitWatermark);
 	dml_print("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n",
-			__func__, Watermark->Z8StutterEnterPlusExitWatermark);
+			__func__, v->Watermark.Z8StutterEnterPlusExitWatermark);
 #endif
 
 
 	TotalActiveWriteback = 0;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (WritebackEnable[k] == true)
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->WritebackEnable[k] == true)
 			TotalActiveWriteback = TotalActiveWriteback + 1;
 	}
 
 	if (TotalActiveWriteback <= 1) {
-		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
+		v->Watermark.WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
 	} else {
-		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
-				+ WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->Watermark.WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
+				+ v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackUrgentWatermark = Watermark->WritebackUrgentWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark.WritebackUrgentWatermark = v->Watermark.WritebackUrgentWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
 	if (TotalActiveWriteback <= 1) {
-		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+		v->Watermark.WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
 				+ mmSOCParameters.WritebackLatency;
-		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+		v->Watermark.WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
 				+ mmSOCParameters.WritebackLatency;
 	} else {
-		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
-				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
-		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
-				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024 / 32 / SOCCLK;
+		v->Watermark.WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+				+ mmSOCParameters.WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->Watermark.WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+				+ mmSOCParameters.WritebackLatency + v->WritebackChunkSize * 1024 / 32 / SOCCLK;
 	}
 
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackDRAMClockChangeWatermark = Watermark->WritebackDRAMClockChangeWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark.WritebackDRAMClockChangeWatermark = v->Watermark.WritebackDRAMClockChangeWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackFCLKChangeWatermark = Watermark->WritebackFCLKChangeWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark.WritebackFCLKChangeWatermark = v->Watermark.WritebackFCLKChangeWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: WritebackDRAMClockChangeWatermark = %f\n",
-			__func__, Watermark->WritebackDRAMClockChangeWatermark);
-	dml_print("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, Watermark->WritebackFCLKChangeWatermark);
-	dml_print("DML::%s: WritebackUrgentWatermark = %f\n", __func__, Watermark->WritebackUrgentWatermark);
-	dml_print("DML::%s: USRRetrainingRequiredFinal = %d\n", __func__, USRRetrainingRequiredFinal);
+			__func__, v->Watermark.WritebackDRAMClockChangeWatermark);
+	dml_print("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, v->Watermark.WritebackFCLKChangeWatermark);
+	dml_print("DML::%s: WritebackUrgentWatermark = %f\n", __func__, v->Watermark.WritebackUrgentWatermark);
+	dml_print("DML::%s: v->USRRetrainingRequiredFinal = %d\n", __func__, v->USRRetrainingRequiredFinal);
 	dml_print("DML::%s: USRRetrainingLatency = %f\n", __func__, mmSOCParameters.USRRetrainingLatency);
 #endif
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		TotalPixelBW = TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] +
-				SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k]) / (HTotal[k] / PixelClock[k]);
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		TotalPixelBW = TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] +
+				SwathWidthC[k] * BytePerPixelDETC[k] * v->VRatioChroma[k]) / (v->HTotal[k] / v->PixelClock[k]);
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 
-		LBLatencyHidingSourceLinesY[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (VTaps[k] - 1);
-		LBLatencyHidingSourceLinesC[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTapsChroma[k] - 1);
+		LBLatencyHidingSourceLinesY[k] = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSizeFinal / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
+		LBLatencyHidingSourceLinesC[k] = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSizeFinal / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
 
 
 #ifdef __DML_VBA_DEBUG__
-		dml_print("DML::%s: k=%d, MaxLineBufferLines = %d\n", __func__, k, MaxLineBufferLines);
-		dml_print("DML::%s: k=%d, LineBufferSize     = %d\n", __func__, k, LineBufferSize);
-		dml_print("DML::%s: k=%d, LBBitPerPixel      = %d\n", __func__, k, LBBitPerPixel[k]);
-		dml_print("DML::%s: k=%d, HRatio             = %f\n", __func__, k, HRatio[k]);
-		dml_print("DML::%s: k=%d, VTaps              = %d\n", __func__, k, VTaps[k]);
+		dml_print("DML::%s: k=%d, v->MaxLineBufferLines = %d\n", __func__, k, v->MaxLineBufferLines);
+		dml_print("DML::%s: k=%d, v->LineBufferSizeFinal     = %d\n", __func__, k, v->LineBufferSizeFinal);
+		dml_print("DML::%s: k=%d, v->LBBitPerPixel      = %d\n", __func__, k, v->LBBitPerPixel[k]);
+		dml_print("DML::%s: k=%d, v->HRatio             = %f\n", __func__, k, v->HRatio[k]);
+		dml_print("DML::%s: k=%d, v->vtaps              = %d\n", __func__, k, v->vtaps[k]);
 #endif
 
-		EffectiveLBLatencyHidingY = LBLatencyHidingSourceLinesY[k] / VRatio[k] * (HTotal[k] / PixelClock[k]);
-		EffectiveLBLatencyHidingC = LBLatencyHidingSourceLinesC[k] / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingY = LBLatencyHidingSourceLinesY[k] / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
+		EffectiveLBLatencyHidingC = LBLatencyHidingSourceLinesC[k] / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
 		EffectiveDETBufferSizeY = DETBufferSizeY[k];
 
 		if (UnboundedRequestEnabled) {
 			EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
 					+ CompressedBufferSizeInkByte * 1024
-							* (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k])
-							/ (HTotal[k] / PixelClock[k]) / TotalPixelBW;
+							* (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k])
+							/ (v->HTotal[k] / v->PixelClock[k]) / TotalPixelBW;
 		}
 
 		LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
 		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
-		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
 
 		ActiveClockChangeLatencyHidingY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
-				- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k];
+				- (DSTXAfterScaler[k] / v->HTotal[k] + DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k];
 
-		if (NumberOfActiveSurfaces > 1) {
+		if (v->NumberOfActiveSurfaces > 1) {
 			ActiveClockChangeLatencyHidingY = ActiveClockChangeLatencyHidingY
-					- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightY[k] * HTotal[k]
-							/ PixelClock[k] / VRatio[k];
+					- (1 - 1 / v->NumberOfActiveSurfaces) * SwathHeightY[k] * v->HTotal[k]
+							/ v->PixelClock[k] / v->VRatio[k];
 		}
 
 		if (BytePerPixelDETC[k] > 0) {
 			LinesInDETC[k] = DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
 			LinesInDETCRoundedDownToSwath[k] = dml_floor(LinesInDETC[k], SwathHeightC[k]);
-			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k])
-					/ VRatioChroma[k];
+			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k])
+					/ v->VRatioChroma[k];
 			ActiveClockChangeLatencyHidingC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
-					- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k]
-							/ PixelClock[k];
-			if (NumberOfActiveSurfaces > 1) {
+					- (DSTXAfterScaler[k] / v->HTotal[k] + DSTYAfterScaler[k]) * v->HTotal[k]
+							/ v->PixelClock[k];
+			if (v->NumberOfActiveSurfaces > 1) {
 				ActiveClockChangeLatencyHidingC = ActiveClockChangeLatencyHidingC
-						- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightC[k] * HTotal[k]
-								/ PixelClock[k] / VRatioChroma[k];
+						- (1 - 1 / v->NumberOfActiveSurfaces) * SwathHeightC[k] * v->HTotal[k]
+								/ v->PixelClock[k] / v->VRatioChroma[k];
 			}
 			ActiveClockChangeLatencyHiding = dml_min(ActiveClockChangeLatencyHidingY,
 					ActiveClockChangeLatencyHidingC);
@@ -4439,24 +4409,24 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			ActiveClockChangeLatencyHiding = ActiveClockChangeLatencyHidingY;
 		}
 
-		ActiveDRAMClockChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
-				- Watermark->DRAMClockChangeWatermark;
-		ActiveFCLKChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
-				- Watermark->FCLKChangeWatermark;
-		USRRetrainingLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->USRRetrainingWatermark;
-
-		if (WritebackEnable[k]) {
-			WritebackLatencyHiding = WritebackInterfaceBufferSize * 1024
-					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k]
-							/ (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
-			if (WritebackPixelFormat[k] == dm_444_64)
+		ActiveDRAMClockChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - v->Watermark.UrgentWatermark
+				- v->Watermark.DRAMClockChangeWatermark;
+		ActiveFCLKChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - v->Watermark.UrgentWatermark
+				- v->Watermark.FCLKChangeWatermark;
+		USRRetrainingLatencyMargin[k] = ActiveClockChangeLatencyHiding - v->Watermark.USRRetrainingWatermark;
+
+		if (v->WritebackEnable[k]) {
+			WritebackLatencyHiding = v->WritebackInterfaceBufferSize * 1024
+					/ (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k]
+							/ (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
+			if (v->WritebackPixelFormat[k] == dm_444_64)
 				WritebackLatencyHiding = WritebackLatencyHiding / 2;
 
 			WritebackDRAMClockChangeLatencyMargin = WritebackLatencyHiding
-					- Watermark->WritebackDRAMClockChangeWatermark;
+					- v->Watermark.WritebackDRAMClockChangeWatermark;
 
 			WritebackFCLKChangeLatencyMargin = WritebackLatencyHiding
-					- Watermark->WritebackFCLKChangeWatermark;
+					- v->Watermark.WritebackFCLKChangeWatermark;
 
 			ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMargin[k],
 					WritebackFCLKChangeLatencyMargin);
@@ -4464,22 +4434,22 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 					WritebackDRAMClockChangeLatencyMargin);
 		}
 		MaxActiveDRAMClockChangeLatencySupported[k] =
-				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
+				(v->UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
 						0 :
 						(ActiveDRAMClockChangeLatencyMargin[k]
 								+ mmSOCParameters.DRAMClockChangeLatency);
 	}
 
-	for (i = 0; i < NumberOfActiveSurfaces; ++i) {
-		for (j = 0; j < NumberOfActiveSurfaces; ++j) {
+	for (i = 0; i < v->NumberOfActiveSurfaces; ++i) {
+		for (j = 0; j < v->NumberOfActiveSurfaces; ++j) {
 			if (i == j ||
-					(BlendingAndTiming[i] == i && BlendingAndTiming[j] == i) ||
-					(BlendingAndTiming[j] == j && BlendingAndTiming[i] == j) ||
-					(BlendingAndTiming[i] == BlendingAndTiming[j] && BlendingAndTiming[i] != i) ||
-					(SynchronizeTimingsFinal && PixelClock[i] == PixelClock[j] &&
-					HTotal[i] == HTotal[j] && VTotal[i] == VTotal[j] &&
-					VActive[i] == VActive[j]) || (SynchronizeDRRDisplaysForUCLKPStateChangeFinal &&
-					(DRRDisplay[i] || DRRDisplay[j]))) {
+					(v->BlendingAndTiming[i] == i && v->BlendingAndTiming[j] == i) ||
+					(v->BlendingAndTiming[j] == j && v->BlendingAndTiming[i] == j) ||
+					(v->BlendingAndTiming[i] == v->BlendingAndTiming[j] && v->BlendingAndTiming[i] != i) ||
+					(v->SynchronizeTimingsFinal && v->PixelClock[i] == v->PixelClock[j] &&
+					v->HTotal[i] == v->HTotal[j] && v->VTotal[i] == v->VTotal[j] &&
+					v->VActive[i] == v->VActive[j]) || (v->SynchronizeDRRDisplaysForUCLKPStateChangeFinal &&
+					(v->DRRDisplay[i] || v->DRRDisplay[j]))) {
 				SynchronizedSurfaces[i][j] = true;
 			} else {
 				SynchronizedSurfaces[i][j] = false;
@@ -4487,8 +4457,8 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if ((v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 				(!FoundFirstSurfaceWithMinActiveFCLKChangeMargin ||
 				ActiveFCLKChangeLatencyMargin[k] < MinActiveFCLKChangeMargin)) {
 			FoundFirstSurfaceWithMinActiveFCLKChangeMargin = true;
@@ -4500,9 +4470,9 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	*MinActiveFCLKChangeLatencySupported = MinActiveFCLKChangeMargin + mmSOCParameters.FCLKChangeLatency;
 
 	SameTimingForFCLKChange = true;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 		if (!SynchronizedSurfaces[k][SurfaceWithMinActiveFCLKChangeMargin]) {
-			if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+			if ((v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 					(SameTimingForFCLKChange ||
 					ActiveFCLKChangeLatencyMargin[k] <
 					SecondMinActiveFCLKChangeMarginOneDisplayInVBLank)) {
@@ -4522,17 +4492,17 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	}
 
 	*USRRetrainingSupport = true;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if ((v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 				(USRRetrainingLatencyMargin[k] < 0)) {
 			*USRRetrainingSupport = false;
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_full_frame &&
-				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_sub_viewport &&
-				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_full_frame &&
+				v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_sub_viewport &&
+				v->UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
 				ActiveDRAMClockChangeLatencyMargin[k] < 0) {
 			if (PrefetchMode > 0) {
 				DRAMClockChangeSupportNumber = 2;
@@ -4546,10 +4516,10 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
 			DRAMClockChangeMethod = 1;
-		else if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
+		else if (v->UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
 			DRAMClockChangeMethod = 2;
 	}
 
@@ -4576,16 +4546,16 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 		unsigned int dst_y_pstate;
 		unsigned int src_y_pstate_l;
 		unsigned int src_y_pstate_c;
 		unsigned int src_y_ahead_l, src_y_ahead_c, sub_vp_lines_l, sub_vp_lines_c;
 
-		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (HTotal[k] / PixelClock[k]), 1);
-		src_y_pstate_l = dml_ceil(dst_y_pstate * VRatio[k], SwathHeightY[k]);
+		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (v->HTotal[k] / v->PixelClock[k]), 1);
+		src_y_pstate_l = dml_ceil(dst_y_pstate * v->VRatio[k], SwathHeightY[k]);
 		src_y_ahead_l = dml_floor(DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k], SwathHeightY[k]) + LBLatencyHidingSourceLinesY[k];
-		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + meta_row_height[k];
+		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + v->meta_row_height[k];
 
 #ifdef __DML_VBA_DEBUG__
 dml_print("DML::%s: k=%d, DETBufferSizeY               = %d\n", __func__, k, DETBufferSizeY[k]);
@@ -4596,21 +4566,21 @@ dml_print("DML::%s: k=%d, LBLatencyHidingSourceLinesY  = %d\n", __func__, k, LBL
 dml_print("DML::%s: k=%d, dst_y_pstate      = %d\n", __func__, k, dst_y_pstate);
 dml_print("DML::%s: k=%d, src_y_pstate_l    = %d\n", __func__, k, src_y_pstate_l);
 dml_print("DML::%s: k=%d, src_y_ahead_l     = %d\n", __func__, k, src_y_ahead_l);
-dml_print("DML::%s: k=%d, meta_row_height   = %d\n", __func__, k, meta_row_height[k]);
+dml_print("DML::%s: k=%d, v->meta_row_height   = %d\n", __func__, k, v->meta_row_height[k]);
 dml_print("DML::%s: k=%d, sub_vp_lines_l    = %d\n", __func__, k, sub_vp_lines_l);
 #endif
 		SubViewportLinesNeededInMALL[k] = sub_vp_lines_l;
 
 		if (BytePerPixelDETC[k] > 0) {
-			src_y_pstate_c = dml_ceil(dst_y_pstate * VRatioChroma[k], SwathHeightC[k]);
+			src_y_pstate_c = dml_ceil(dst_y_pstate * v->VRatioChroma[k], SwathHeightC[k]);
 			src_y_ahead_c = dml_floor(DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k], SwathHeightC[k]) + LBLatencyHidingSourceLinesC[k];
-			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + meta_row_height_chroma[k];
+			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + v->meta_row_height_chroma[k];
 			SubViewportLinesNeededInMALL[k] = dml_max(sub_vp_lines_l, sub_vp_lines_c);
 
 #ifdef __DML_VBA_DEBUG__
 dml_print("DML::%s: k=%d, src_y_pstate_c            = %d\n", __func__, k, src_y_pstate_c);
 dml_print("DML::%s: k=%d, src_y_ahead_c             = %d\n", __func__, k, src_y_ahead_c);
-dml_print("DML::%s: k=%d, meta_row_height_chroma    = %d\n", __func__, k, meta_row_height_chroma[k]);
+dml_print("DML::%s: k=%d, v->meta_row_height_chroma    = %d\n", __func__, k, v->meta_row_height_chroma[k]);
 dml_print("DML::%s: k=%d, sub_vp_lines_c            = %d\n", __func__, k, sub_vp_lines_c);
 #endif
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 626f6605e2d5..7cdf0418830a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -30,6 +30,7 @@
 #include "os_types.h"
 #include "../dc_features.h"
 #include "../display_mode_structs.h"
+#include "dml/display_mode_vba.h"
 
 unsigned int dml32_dscceComputeDelay(
 		unsigned int bpc,
@@ -808,58 +809,28 @@ void dml32_CalculateFlipSchedule(
 		bool *ImmediateFlipSupportedForPipe);
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-		bool USRRetrainingRequiredFinal,
-		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		struct vba_vars_st *v,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActiveSurfaces,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizeTimingsFinal,
-		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-		bool DRRDisplay[],
-		unsigned int dpte_group_bytes[],
-		unsigned int meta_row_height[],
-		unsigned int meta_row_height_chroma[],
 		SOCParametersList mmSOCParameters,
-		unsigned int WritebackChunkSize,
 		double SOCCLK,
 		double DCFClkDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int VTaps[],
-		unsigned int VTapsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		unsigned int VTotal[],
-		unsigned int VActive[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerSurface[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double DSTXAfterScaler[],
 		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		unsigned int CompressedBufferSizeInkByte,
 
 		/* Output */
-		Watermarks *Watermark,
 		enum clock_change_support *DRAMClockChangeSupport,
 		double MaxActiveDRAMClockChangeLatencySupported[],
 		unsigned int SubViewportLinesNeededInMALL[],
-- 
2.37.2

