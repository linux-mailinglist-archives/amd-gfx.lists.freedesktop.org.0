Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF50F46F02E
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Dec 2021 18:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966A710FB58;
	Thu,  9 Dec 2021 16:55:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 425CE89CDB;
 Thu,  9 Dec 2021 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 37CC62020B9;
 Thu,  9 Dec 2021 17:46:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Tq8NWqNYIXA2; Thu,  9 Dec 2021 17:46:45 +0100 (CET)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 361EF2020C2;
 Thu,  9 Dec 2021 17:46:45 +0100 (CET)
Received: from daenzer by kaveri with local (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mvMZA-006o00-LE;
 Thu, 09 Dec 2021 17:46:44 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Reduce stack size for dml31
 UseMinimumDCFCLK
Date: Thu,  9 Dec 2021 17:46:44 +0100
Message-Id: <20211209164644.1622152-2-michel@daenzer.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209164644.1622152-1-michel@daenzer.net>
References: <20211209164644.1622152-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

Use the struct display_mode_lib pointer instead of passing lots of large
arrays as parameters by value.

Addresses this warning (resulting in failure to build a RHEL debug kernel
with Werror enabled):

../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘UseMinimumDCFCLK’:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:7478:1: warning: the frame size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=]

NOTE: AFAICT this function previously had no observable effect, since it
only modified parameters passed by value and doesn't return anything.
Now it may modify some values in struct display_mode_lib passed in by
reference.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 304 ++++--------------
 1 file changed, 69 insertions(+), 235 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 8965f9af9d0a..6feb23432f8d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -422,62 +422,8 @@ static void CalculateUrgentBurstFactor(
 
 static void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
-		int MaxInterDCNTileRepeaters,
 		int MaxPrefetchMode,
-		double FinalDRAMClockChangeLatency,
-		double SREnterPlusExitTime,
-		int ReturnBusWidth,
-		int RoundTripPingLatencyCycles,
-		int ReorderingBytes,
-		int PixelChunkSizeInKByte,
-		int MetaChunkSize,
-		bool GPUVMEnable,
-		int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		int NumberOfActivePlanes,
-		double HostVMMinPageSize,
-		int HostVMMaxNonCachedPageTableLevels,
-		bool DynamicMetadataVMEnabled,
-		enum immediate_flip_requirement ImmediateFlipRequirement,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation,
-		double PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency,
-		int VTotal[],
-		int VActive[],
-		int DynamicMetadataTransmittedBytes[],
-		int DynamicMetadataLinesBeforeActiveRequired[],
-		bool Interlace[],
-		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
-		double RequiredDISPCLK[][2],
-		double UrgLatency[],
-		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
-		double ProjectedDCFCLKDeepSleep[][2],
-		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
-		double TotalVActivePixelBandwidth[][2],
-		double TotalVActiveCursorBandwidth[][2],
-		double TotalMetaRowBandwidth[][2],
-		double TotalDPTERowBandwidth[][2],
-		unsigned int TotalNumberOfActiveDPP[][2],
-		unsigned int TotalNumberOfDCCActiveDPP[][2],
-		int dpte_group_bytes[],
-		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
-		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int BytePerPixelY[],
-		int BytePerPixelC[],
-		int HTotal[],
-		double PixelClock[],
-		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
-		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
-		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
-		bool DynamicMetadataEnable[],
-		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
-		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
-		double ReadBandwidthLuma[],
-		double ReadBandwidthChroma[],
-		double DCFCLKPerState[],
-		double DCFCLKState[][2]);
+		int ReorderingBytes);
 
 static void CalculatePixelDeliveryTimes(
 		unsigned int NumberOfActivePlanes,
@@ -5175,66 +5121,8 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		}
 	}
 
-	if (v->UseMinimumRequiredDCFCLK == true) {
-		UseMinimumDCFCLK(
-				mode_lib,
-				v->MaxInterDCNTileRepeaters,
-				MaxPrefetchMode,
-				v->DRAMClockChangeLatency,
-				v->SREnterPlusExitTime,
-				v->ReturnBusWidth,
-				v->RoundTripPingLatencyCycles,
-				ReorderingBytes,
-				v->PixelChunkSizeInKByte,
-				v->MetaChunkSize,
-				v->GPUVMEnable,
-				v->GPUVMMaxPageTableLevels,
-				v->HostVMEnable,
-				v->NumberOfActivePlanes,
-				v->HostVMMinPageSize,
-				v->HostVMMaxNonCachedPageTableLevels,
-				v->DynamicMetadataVMEnabled,
-				v->ImmediateFlipRequirement[0],
-				v->ProgressiveToInterlaceUnitInOPP,
-				v->MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation,
-				v->PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency,
-				v->VTotal,
-				v->VActive,
-				v->DynamicMetadataTransmittedBytes,
-				v->DynamicMetadataLinesBeforeActiveRequired,
-				v->Interlace,
-				v->RequiredDPPCLK,
-				v->RequiredDISPCLK,
-				v->UrgLatency,
-				v->NoOfDPP,
-				v->ProjectedDCFCLKDeepSleep,
-				v->MaximumVStartup,
-				v->TotalVActivePixelBandwidth,
-				v->TotalVActiveCursorBandwidth,
-				v->TotalMetaRowBandwidth,
-				v->TotalDPTERowBandwidth,
-				v->TotalNumberOfActiveDPP,
-				v->TotalNumberOfDCCActiveDPP,
-				v->dpte_group_bytes,
-				v->PrefetchLinesY,
-				v->PrefetchLinesC,
-				v->swath_width_luma_ub_all_states,
-				v->swath_width_chroma_ub_all_states,
-				v->BytePerPixelY,
-				v->BytePerPixelC,
-				v->HTotal,
-				v->PixelClock,
-				v->PDEAndMetaPTEBytesPerFrame,
-				v->DPTEBytesPerRow,
-				v->MetaRowBytes,
-				v->DynamicMetadataEnable,
-				v->VActivePixelBandwidth,
-				v->VActiveCursorBandwidth,
-				v->ReadBandwidthLuma,
-				v->ReadBandwidthChroma,
-				v->DCFCLKPerState,
-				v->DCFCLKState);
-	}
+	if (v->UseMinimumRequiredDCFCLK == true)
+		UseMinimumDCFCLK(mode_lib, MaxPrefetchMode, ReorderingBytes);
 
 	for (i = 0; i < v->soc.num_states; ++i) {
 		for (j = 0; j <= 1; ++j) {
@@ -7262,69 +7150,15 @@ static double CalculateUrgentLatency(
 
 static void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
-		int MaxInterDCNTileRepeaters,
 		int MaxPrefetchMode,
-		double FinalDRAMClockChangeLatency,
-		double SREnterPlusExitTime,
-		int ReturnBusWidth,
-		int RoundTripPingLatencyCycles,
-		int ReorderingBytes,
-		int PixelChunkSizeInKByte,
-		int MetaChunkSize,
-		bool GPUVMEnable,
-		int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		int NumberOfActivePlanes,
-		double HostVMMinPageSize,
-		int HostVMMaxNonCachedPageTableLevels,
-		bool DynamicMetadataVMEnabled,
-		enum immediate_flip_requirement ImmediateFlipRequirement,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation,
-		double PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency,
-		int VTotal[],
-		int VActive[],
-		int DynamicMetadataTransmittedBytes[],
-		int DynamicMetadataLinesBeforeActiveRequired[],
-		bool Interlace[],
-		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
-		double RequiredDISPCLK[][2],
-		double UrgLatency[],
-		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
-		double ProjectedDCFCLKDeepSleep[][2],
-		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
-		double TotalVActivePixelBandwidth[][2],
-		double TotalVActiveCursorBandwidth[][2],
-		double TotalMetaRowBandwidth[][2],
-		double TotalDPTERowBandwidth[][2],
-		unsigned int TotalNumberOfActiveDPP[][2],
-		unsigned int TotalNumberOfDCCActiveDPP[][2],
-		int dpte_group_bytes[],
-		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
-		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int BytePerPixelY[],
-		int BytePerPixelC[],
-		int HTotal[],
-		double PixelClock[],
-		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
-		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
-		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
-		bool DynamicMetadataEnable[],
-		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
-		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
-		double ReadBandwidthLuma[],
-		double ReadBandwidthChroma[],
-		double DCFCLKPerState[],
-		double DCFCLKState[][2])
+		int ReorderingBytes)
 {
 	struct vba_vars_st *v = &mode_lib->vba;
 	int dummy1, i, j, k;
 	double NormalEfficiency,  dummy2, dummy3;
 	double TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2];
 
-	NormalEfficiency = PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency / 100.0;
+	NormalEfficiency = v->PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency / 100.0;
 	for (i = 0; i < v->soc.num_states; ++i) {
 		for (j = 0; j <= 1; ++j) {
 			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX];
@@ -7342,61 +7176,61 @@ static void UseMinimumDCFCLK(
 			double MinimumTvmPlus2Tr0;
 
 			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
-						+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
+						+ v->NoOfDPP[i][j][k] * v->DPTEBytesPerRow[i][j][k] / (15.75 * v->HTotal[k] / v->PixelClock[k]);
 			}
 
-			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
-				NoOfDPPState[k] = NoOfDPP[i][j][k];
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
+				NoOfDPPState[k] = v->NoOfDPP[i][j][k];
 			}
 
-			MinimumTWait = CalculateTWait(MaxPrefetchMode, FinalDRAMClockChangeLatency, UrgLatency[i], SREnterPlusExitTime);
-			NonDPTEBandwidth = TotalVActivePixelBandwidth[i][j] + TotalVActiveCursorBandwidth[i][j] + TotalMetaRowBandwidth[i][j];
-			DPTEBandwidth = (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) ?
-					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : TotalDPTERowBandwidth[i][j];
+			MinimumTWait = CalculateTWait(MaxPrefetchMode, v->FinalDRAMClockChangeLatency, v->UrgLatency[i], v->SREnterPlusExitTime);
+			NonDPTEBandwidth = v->TotalVActivePixelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRowBandwidth[i][j];
+			DPTEBandwidth = (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) ?
+					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : v->TotalDPTERowBandwidth[i][j];
 			DCFCLKRequiredForAverageBandwidth = dml_max3(
-					ProjectedDCFCLKDeepSleep[i][j],
-					(NonDPTEBandwidth + TotalDPTERowBandwidth[i][j]) / ReturnBusWidth
-							/ (MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
-					(NonDPTEBandwidth + DPTEBandwidth / NormalEfficiency) / NormalEfficiency / ReturnBusWidth);
+					v->ProjectedDCFCLKDeepSleep[i][j],
+					(NonDPTEBandwidth + v->TotalDPTERowBandwidth[i][j]) / v->ReturnBusWidth
+							/ (v->MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
+					(NonDPTEBandwidth + DPTEBandwidth / NormalEfficiency) / NormalEfficiency / v->ReturnBusWidth);
 
 			ExtraLatencyBytes = CalculateExtraLatencyBytes(
 					ReorderingBytes,
-					TotalNumberOfActiveDPP[i][j],
-					PixelChunkSizeInKByte,
-					TotalNumberOfDCCActiveDPP[i][j],
-					MetaChunkSize,
-					GPUVMEnable,
-					HostVMEnable,
-					NumberOfActivePlanes,
+					v->TotalNumberOfActiveDPP[i][j],
+					v->PixelChunkSizeInKByte,
+					v->TotalNumberOfDCCActiveDPP[i][j],
+					v->MetaChunkSize,
+					v->GPUVMEnable,
+					v->HostVMEnable,
+					v->NumberOfActivePlanes,
 					NoOfDPPState,
-					dpte_group_bytes,
+					v->dpte_group_bytes,
 					1,
-					HostVMMinPageSize,
-					HostVMMaxNonCachedPageTableLevels);
-			ExtraLatencyCycles = RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__ + ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+					v->HostVMMinPageSize,
+					v->HostVMMaxNonCachedPageTableLevels);
+			ExtraLatencyCycles = v->RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__ + ExtraLatencyBytes / NormalEfficiency / v->ReturnBusWidth;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				double DCFCLKCyclesRequiredInPrefetch;
 				double ExpectedPrefetchBWAcceleration;
 				double PrefetchTime;
 
-				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k] * swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
-						+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k] * BytePerPixelC[k]) / NormalEfficiency / ReturnBusWidth;
+				PixelDCFCLKCyclesRequiredInPrefetch[k] = (v->PrefetchLinesY[i][j][k] * v->swath_width_luma_ub_all_states[i][j][k] * v->BytePerPixelY[k]
+						+ v->PrefetchLinesC[i][j][k] * v->swath_width_chroma_ub_all_states[i][j][k] * v->BytePerPixelC[k]) / NormalEfficiency / v->ReturnBusWidth;
 				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k]
-						+ PDEAndMetaPTEBytesPerFrame[i][j][k] / NormalEfficiency / NormalEfficiency / ReturnBusWidth * (GPUVMMaxPageTableLevels > 2 ? 1 : 0)
-						+ 2 * DPTEBytesPerRow[i][j][k] / NormalEfficiency / NormalEfficiency / ReturnBusWidth
-						+ 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
-				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k]) * HTotal[k] / PixelClock[k];
-				ExpectedPrefetchBWAcceleration = (VActivePixelBandwidth[i][j][k] + VActiveCursorBandwidth[i][j][k])
-						/ (ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
+						+ v->PDEAndMetaPTEBytesPerFrame[i][j][k] / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth * (v->GPUVMMaxPageTableLevels > 2 ? 1 : 0)
+						+ 2 * v->DPTEBytesPerRow[i][j][k] / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth
+						+ 2 * v->MetaRowBytes[i][j][k] / NormalEfficiency / v->ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
+				PrefetchPixelLinesTime[k] = dml_max(v->PrefetchLinesY[i][j][k], v->PrefetchLinesC[i][j][k]) * v->HTotal[k] / v->PixelClock[k];
+				ExpectedPrefetchBWAcceleration = (v->VActivePixelBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k])
+						/ (v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k]);
 				DynamicMetadataVMExtraLatency[k] =
-						(GPUVMEnable == true && DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
-								UrgLatency[i] * GPUVMMaxPageTableLevels * (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
-				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] - MinimumTWait
-						- UrgLatency[i]
-								* ((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels : GPUVMMaxPageTableLevels - 2)
-										* (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1)
+						(v->GPUVMEnable == true && v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true) ?
+								v->UrgLatency[i] * v->GPUVMMaxPageTableLevels * (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
+				PrefetchTime = (v->MaximumVStartup[i][j][k] - 1) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait
+						- v->UrgLatency[i]
+								* ((v->GPUVMMaxPageTableLevels <= 2 ? v->GPUVMMaxPageTableLevels : v->GPUVMMaxPageTableLevels - 2)
+										* (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1)
 						- DynamicMetadataVMExtraLatency[k];
 
 				if (PrefetchTime > 0) {
@@ -7405,14 +7239,14 @@ static void UseMinimumDCFCLK(
 							/ (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
 					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
 							* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
-					if (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) {
+					if (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) {
 						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
-								+ NoOfDPPState[k] * DPTEBandwidth / NormalEfficiency / NormalEfficiency / ReturnBusWidth;
+								+ NoOfDPPState[k] * DPTEBandwidth / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth;
 					}
 				} else {
-					DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+					DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
 				}
-				if (DynamicMetadataEnable[k] == true) {
+				if (v->DynamicMetadataEnable[k] == true) {
 					double TSetupPipe;
 					double TdmbfPipe;
 					double TdmsksPipe;
@@ -7420,17 +7254,17 @@ static void UseMinimumDCFCLK(
 					double AllowedTimeForUrgentExtraLatency;
 
 					CalculateVupdateAndDynamicMetadataParameters(
-							MaxInterDCNTileRepeaters,
-							RequiredDPPCLK[i][j][k],
-							RequiredDISPCLK[i][j],
-							ProjectedDCFCLKDeepSleep[i][j],
-							PixelClock[k],
-							HTotal[k],
-							VTotal[k] - VActive[k],
-							DynamicMetadataTransmittedBytes[k],
-							DynamicMetadataLinesBeforeActiveRequired[k],
-							Interlace[k],
-							ProgressiveToInterlaceUnitInOPP,
+							v->MaxInterDCNTileRepeaters,
+							v->RequiredDPPCLK[i][j][k],
+							v->RequiredDISPCLK[i][j],
+							v->ProjectedDCFCLKDeepSleep[i][j],
+							v->PixelClock[k],
+							v->HTotal[k],
+							v->VTotal[k] - v->VActive[k],
+							v->DynamicMetadataTransmittedBytes[k],
+							v->DynamicMetadataLinesBeforeActiveRequired[k],
+							v->Interlace[k],
+							v->ProgressiveToInterlaceUnitInOPP,
 							&TSetupPipe,
 							&TdmbfPipe,
 							&TdmecPipe,
@@ -7438,31 +7272,31 @@ static void UseMinimumDCFCLK(
 							&dummy1,
 							&dummy2,
 							&dummy3);
-					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - MinimumTWait - TSetupPipe - TdmbfPipe - TdmecPipe
+					AllowedTimeForUrgentExtraLatency = v->MaximumVStartup[i][j][k] * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - TSetupPipe - TdmbfPipe - TdmecPipe
 							- TdmsksPipe - DynamicMetadataVMExtraLatency[k];
 					if (AllowedTimeForUrgentExtraLatency > 0) {
 						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(
 								DCFCLKRequiredForPeakBandwidthPerPlane[k],
 								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
 					} else {
-						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+						DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
 					}
 				}
 			}
 			DCFCLKRequiredForPeakBandwidth = 0;
-			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
 				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
 			}
-			MinimumTvmPlus2Tr0 = UrgLatency[i]
-					* (GPUVMEnable == true ?
-							(HostVMEnable == true ?
-									(GPUVMMaxPageTableLevels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) :
+			MinimumTvmPlus2Tr0 = v->UrgLatency[i]
+					* (v->GPUVMEnable == true ?
+							(v->HostVMEnable == true ?
+									(v->GPUVMMaxPageTableLevels + 2) * (v->HostVMMaxNonCachedPageTableLevels + 1) - 1 : v->GPUVMMaxPageTableLevels + 1) :
 							0);
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				double MaximumTvmPlus2Tr0PlusTsw;
-				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
+				MaximumTvmPlus2Tr0PlusTsw = (v->MaximumVStartup[i][j][k] - 2) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
 				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
-					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
+					DCFCLKRequiredForPeakBandwidth = v->DCFCLKPerState[i];
 				} else {
 					DCFCLKRequiredForPeakBandwidth = dml_max3(
 							DCFCLKRequiredForPeakBandwidth,
@@ -7470,7 +7304,7 @@ static void UseMinimumDCFCLK(
 							(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
 				}
 			}
-			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 * dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
+			v->DCFCLKState[i][j] = dml_min(v->DCFCLKPerState[i], 1.05 * dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
 		}
 	}
 }
-- 
2.34.1

