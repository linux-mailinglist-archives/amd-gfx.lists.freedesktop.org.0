Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35E5C0297
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Sep 2022 17:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CAD10E99F;
	Wed, 21 Sep 2022 15:54:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8510E99F;
 Wed, 21 Sep 2022 15:54:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7386363177;
 Wed, 21 Sep 2022 15:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FBAC433D7;
 Wed, 21 Sep 2022 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775643;
 bh=FtwDgHom7j0u6AGoS2AkrkclrI63h8CA0BZH3cF+vKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mnodsAAF/03OJ19shM0DnnkNbpNZzWCeRt6pL17f2Ry3NtpVFfmi1g4XANnkZLf29
 joCTRQGkZ4JLe8KEDrt2bDqDNAI/aFzH+ZpuHnxMzXllMc/iIo04766KLpW9y1eo0k
 qXYJ4pKlXewM4H7phk4Xrvy6kCIEZEJDxs9pZHaFYfQX6Xdr9T0D5PkVtUx1PVhSg0
 RwIKN4L/GiF/5p31gRtZbRcHX1AyQjqJIuKvPfHs32SkwVTV1T17DOpDUJANS99gH1
 5dUkyb71m2Q6OCkliqIwK/v4Fg+7sR5Vy2Fwy+KeAenYFBrMaYuupkqhex0gKY9Nq7
 6UaxY4opvAOLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 13/16] drm/amd/display: Reduce number of
 arguments of dml31's CalculateFlipSchedule()
Date: Wed, 21 Sep 2022 11:53:29 -0400
Message-Id: <20220921155332.234913-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, llvm@lists.linux.dev,
 sunpeng.li@amd.com, ndesaulniers@google.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, mdaenzer@redhat.com,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, chaitanya.dhere@amd.com,
 nicholas.kazlauskas@amd.com, harry.wentland@amd.com,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 21485d3da659b66c37d99071623af83ee1c6733d ]

Most of the arguments are identical between the two call sites and they
can be accessed through the 'struct vba_vars_st' pointer. This reduces
the total amount of stack space that
dml31_ModeSupportAndSystemConfigurationFull() uses by 112 bytes with
LLVM 16 (1976 -> 1864), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      ^
  1 error generated.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 172 +++++-------------
 1 file changed, 47 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 586825d85d66..40a672236198 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -261,33 +261,13 @@ static void CalculateRowBandwidth(
 
 static void CalculateFlipSchedule(
 		struct display_mode_lib *mode_lib,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		double UrgentExtraLatency,
 		double UrgentLatency,
-		unsigned int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		bool GPUVMEnable,
-		double HostVMMinPageSize,
 		double PDEAndMetaPTEBytesPerFrame,
 		double MetaRowBytes,
-		double DPTEBytesPerRow,
-		double BandwidthAvailableForImmediateFlip,
-		unsigned int TotImmediateFlipBytes,
-		enum source_format_class SourcePixelFormat,
-		double LineTime,
-		double VRatio,
-		double VRatioChroma,
-		double Tno_bw,
-		bool DCCEnable,
-		unsigned int dpte_row_height,
-		unsigned int meta_row_height,
-		unsigned int dpte_row_height_chroma,
-		unsigned int meta_row_height_chroma,
-		double *DestinationLinesToRequestVMInImmediateFlip,
-		double *DestinationLinesToRequestRowInImmediateFlip,
-		double *final_flip_bw,
-		bool *ImmediateFlipSupportedForPipe);
+		double DPTEBytesPerRow);
 static double CalculateWriteBackDelay(
 		enum source_format_class WritebackPixelFormat,
 		double WritebackHRatio,
@@ -2878,33 +2858,13 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				CalculateFlipSchedule(
 						mode_lib,
+						k,
 						HostVMInefficiencyFactor,
 						v->UrgentExtraLatency,
 						v->UrgentLatency,
-						v->GPUVMMaxPageTableLevels,
-						v->HostVMEnable,
-						v->HostVMMaxNonCachedPageTableLevels,
-						v->GPUVMEnable,
-						v->HostVMMinPageSize,
 						v->PDEAndMetaPTEBytesFrame[k],
 						v->MetaRowByte[k],
-						v->PixelPTEBytesPerRow[k],
-						v->BandwidthAvailableForImmediateFlip,
-						v->TotImmediateFlipBytes,
-						v->SourcePixelFormat[k],
-						v->HTotal[k] / v->PixelClock[k],
-						v->VRatio[k],
-						v->VRatioChroma[k],
-						v->Tno_bw[k],
-						v->DCCEnable[k],
-						v->dpte_row_height[k],
-						v->meta_row_height[k],
-						v->dpte_row_height_chroma[k],
-						v->meta_row_height_chroma[k],
-						&v->DestinationLinesToRequestVMInImmediateFlip[k],
-						&v->DestinationLinesToRequestRowInImmediateFlip[k],
-						&v->final_flip_bw[k],
-						&v->ImmediateFlipSupportedForPipe[k]);
+						v->PixelPTEBytesPerRow[k]);
 			}
 
 			v->total_dcn_read_bw_with_flip = 0.0;
@@ -3624,61 +3584,43 @@ static void CalculateRowBandwidth(
 
 static void CalculateFlipSchedule(
 		struct display_mode_lib *mode_lib,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		double UrgentExtraLatency,
 		double UrgentLatency,
-		unsigned int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		bool GPUVMEnable,
-		double HostVMMinPageSize,
 		double PDEAndMetaPTEBytesPerFrame,
 		double MetaRowBytes,
-		double DPTEBytesPerRow,
-		double BandwidthAvailableForImmediateFlip,
-		unsigned int TotImmediateFlipBytes,
-		enum source_format_class SourcePixelFormat,
-		double LineTime,
-		double VRatio,
-		double VRatioChroma,
-		double Tno_bw,
-		bool DCCEnable,
-		unsigned int dpte_row_height,
-		unsigned int meta_row_height,
-		unsigned int dpte_row_height_chroma,
-		unsigned int meta_row_height_chroma,
-		double *DestinationLinesToRequestVMInImmediateFlip,
-		double *DestinationLinesToRequestRowInImmediateFlip,
-		double *final_flip_bw,
-		bool *ImmediateFlipSupportedForPipe)
+		double DPTEBytesPerRow)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
 	double min_row_time = 0.0;
 	unsigned int HostVMDynamicLevelsTrips;
 	double TimeForFetchingMetaPTEImmediateFlip;
 	double TimeForFetchingRowInVBlankImmediateFlip;
 	double ImmediateFlipBW;
+	double LineTime = v->HTotal[k] / v->PixelClock[k];
 
-	if (GPUVMEnable == true && HostVMEnable == true) {
-		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	if (v->GPUVMEnable == true && v->HostVMEnable == true) {
+		HostVMDynamicLevelsTrips = v->HostVMMaxNonCachedPageTableLevels;
 	} else {
 		HostVMDynamicLevelsTrips = 0;
 	}
 
-	if (GPUVMEnable == true || DCCEnable == true) {
-		ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) * BandwidthAvailableForImmediateFlip / TotImmediateFlipBytes;
+	if (v->GPUVMEnable == true || v->DCCEnable[k] == true) {
+		ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) * v->BandwidthAvailableForImmediateFlip / v->TotImmediateFlipBytes;
 	}
 
-	if (GPUVMEnable == true) {
+	if (v->GPUVMEnable == true) {
 		TimeForFetchingMetaPTEImmediateFlip = dml_max3(
-				Tno_bw + PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / ImmediateFlipBW,
-				UrgentExtraLatency + UrgentLatency * (GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1),
+				v->Tno_bw[k] + PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / ImmediateFlipBW,
+				UrgentExtraLatency + UrgentLatency * (v->GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1),
 				LineTime / 4.0);
 	} else {
 		TimeForFetchingMetaPTEImmediateFlip = 0;
 	}
 
-	*DestinationLinesToRequestVMInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1) / 4.0;
-	if ((GPUVMEnable == true || DCCEnable == true)) {
+	v->DestinationLinesToRequestVMInImmediateFlip[k] = dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1) / 4.0;
+	if ((v->GPUVMEnable == true || v->DCCEnable[k] == true)) {
 		TimeForFetchingRowInVBlankImmediateFlip = dml_max3(
 				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / ImmediateFlipBW,
 				UrgentLatency * (HostVMDynamicLevelsTrips + 1),
@@ -3687,54 +3629,54 @@ static void CalculateFlipSchedule(
 		TimeForFetchingRowInVBlankImmediateFlip = 0;
 	}
 
-	*DestinationLinesToRequestRowInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1) / 4.0;
+	v->DestinationLinesToRequestRowInImmediateFlip[k] = dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1) / 4.0;
 
-	if (GPUVMEnable == true) {
-		*final_flip_bw = dml_max(
-				PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / (*DestinationLinesToRequestVMInImmediateFlip * LineTime),
-				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime));
-	} else if ((GPUVMEnable == true || DCCEnable == true)) {
-		*final_flip_bw = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime);
+	if (v->GPUVMEnable == true) {
+		v->final_flip_bw[k] = dml_max(
+				PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / (v->DestinationLinesToRequestVMInImmediateFlip[k] * LineTime),
+				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (v->DestinationLinesToRequestRowInImmediateFlip[k] * LineTime));
+	} else if ((v->GPUVMEnable == true || v->DCCEnable[k] == true)) {
+		v->final_flip_bw[k] = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (v->DestinationLinesToRequestRowInImmediateFlip[k] * LineTime);
 	} else {
-		*final_flip_bw = 0;
+		v->final_flip_bw[k] = 0;
 	}
 
-	if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_rgbe_alpha) {
-		if (GPUVMEnable == true && DCCEnable != true) {
-			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, dpte_row_height_chroma * LineTime / VRatioChroma);
-		} else if (GPUVMEnable != true && DCCEnable == true) {
-			min_row_time = dml_min(meta_row_height * LineTime / VRatio, meta_row_height_chroma * LineTime / VRatioChroma);
+	if (v->SourcePixelFormat[k] == dm_420_8 || v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_rgbe_alpha) {
+		if (v->GPUVMEnable == true && v->DCCEnable[k] != true) {
+			min_row_time = dml_min(v->dpte_row_height[k] * LineTime / v->VRatio[k], v->dpte_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
+		} else if (v->GPUVMEnable != true && v->DCCEnable[k] == true) {
+			min_row_time = dml_min(v->meta_row_height[k] * LineTime / v->VRatio[k], v->meta_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
 		} else {
 			min_row_time = dml_min4(
-					dpte_row_height * LineTime / VRatio,
-					meta_row_height * LineTime / VRatio,
-					dpte_row_height_chroma * LineTime / VRatioChroma,
-					meta_row_height_chroma * LineTime / VRatioChroma);
+					v->dpte_row_height[k] * LineTime / v->VRatio[k],
+					v->meta_row_height[k] * LineTime / v->VRatio[k],
+					v->dpte_row_height_chroma[k] * LineTime / v->VRatioChroma[k],
+					v->meta_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
 		}
 	} else {
-		if (GPUVMEnable == true && DCCEnable != true) {
-			min_row_time = dpte_row_height * LineTime / VRatio;
-		} else if (GPUVMEnable != true && DCCEnable == true) {
-			min_row_time = meta_row_height * LineTime / VRatio;
+		if (v->GPUVMEnable == true && v->DCCEnable[k] != true) {
+			min_row_time = v->dpte_row_height[k] * LineTime / v->VRatio[k];
+		} else if (v->GPUVMEnable != true && v->DCCEnable[k] == true) {
+			min_row_time = v->meta_row_height[k] * LineTime / v->VRatio[k];
 		} else {
-			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, meta_row_height * LineTime / VRatio);
+			min_row_time = dml_min(v->dpte_row_height[k] * LineTime / v->VRatio[k], v->meta_row_height[k] * LineTime / v->VRatio[k]);
 		}
 	}
 
-	if (*DestinationLinesToRequestVMInImmediateFlip >= 32 || *DestinationLinesToRequestRowInImmediateFlip >= 16
+	if (v->DestinationLinesToRequestVMInImmediateFlip[k] >= 32 || v->DestinationLinesToRequestRowInImmediateFlip[k] >= 16
 			|| TimeForFetchingMetaPTEImmediateFlip + 2 * TimeForFetchingRowInVBlankImmediateFlip > min_row_time) {
-		*ImmediateFlipSupportedForPipe = false;
+		v->ImmediateFlipSupportedForPipe[k] = false;
 	} else {
-		*ImmediateFlipSupportedForPipe = true;
+		v->ImmediateFlipSupportedForPipe[k] = true;
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml_print("DML::%s: DestinationLinesToRequestVMInImmediateFlip = %f\n", __func__, *DestinationLinesToRequestVMInImmediateFlip);
-	dml_print("DML::%s: DestinationLinesToRequestRowInImmediateFlip = %f\n", __func__, *DestinationLinesToRequestRowInImmediateFlip);
+	dml_print("DML::%s: DestinationLinesToRequestVMInImmediateFlip = %f\n", __func__, v->DestinationLinesToRequestVMInImmediateFlip[k]);
+	dml_print("DML::%s: DestinationLinesToRequestRowInImmediateFlip = %f\n", __func__, v->DestinationLinesToRequestRowInImmediateFlip[k]);
 	dml_print("DML::%s: TimeForFetchingMetaPTEImmediateFlip = %f\n", __func__, TimeForFetchingMetaPTEImmediateFlip);
 	dml_print("DML::%s: TimeForFetchingRowInVBlankImmediateFlip = %f\n", __func__, TimeForFetchingRowInVBlankImmediateFlip);
 	dml_print("DML::%s: min_row_time = %f\n", __func__, min_row_time);
-	dml_print("DML::%s: ImmediateFlipSupportedForPipe = %d\n", __func__, *ImmediateFlipSupportedForPipe);
+	dml_print("DML::%s: ImmediateFlipSupportedForPipe = %d\n", __func__, v->ImmediateFlipSupportedForPipe[k]);
 #endif
 
 }
@@ -5325,33 +5267,13 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					for (k = 0; k < v->NumberOfActivePlanes; k++) {
 						CalculateFlipSchedule(
 								mode_lib,
+								k,
 								HostVMInefficiencyFactor,
 								v->ExtraLatency,
 								v->UrgLatency[i],
-								v->GPUVMMaxPageTableLevels,
-								v->HostVMEnable,
-								v->HostVMMaxNonCachedPageTableLevels,
-								v->GPUVMEnable,
-								v->HostVMMinPageSize,
 								v->PDEAndMetaPTEBytesPerFrame[i][j][k],
 								v->MetaRowBytes[i][j][k],
-								v->DPTEBytesPerRow[i][j][k],
-								v->BandwidthAvailableForImmediateFlip,
-								v->TotImmediateFlipBytes,
-								v->SourcePixelFormat[k],
-								v->HTotal[k] / v->PixelClock[k],
-								v->VRatio[k],
-								v->VRatioChroma[k],
-								v->Tno_bw[k],
-								v->DCCEnable[k],
-								v->dpte_row_height[k],
-								v->meta_row_height[k],
-								v->dpte_row_height_chroma[k],
-								v->meta_row_height_chroma[k],
-								&v->DestinationLinesToRequestVMInImmediateFlip[k],
-								&v->DestinationLinesToRequestRowInImmediateFlip[k],
-								&v->final_flip_bw[k],
-								&v->ImmediateFlipSupportedForPipe[k]);
+								v->DPTEBytesPerRow[i][j][k]);
 					}
 					v->total_dcn_read_bw_with_flip = 0.0;
 					for (k = 0; k < v->NumberOfActivePlanes; k++) {
-- 
2.35.1

