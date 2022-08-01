Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3B586AFC
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Aug 2022 14:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AA995E19;
	Mon,  1 Aug 2022 12:40:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AE995D38
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Aug 2022 12:40:17 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LxHlN4nPRzDqGt;
 Mon,  1 Aug 2022 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1659357616; bh=DrT1LeaDfNwwsNUchbsuDRJXsZzb3gVGQhZQOPYtNzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=mf6jZmQoGkE+u3cUdqqccDw0O7OZ7rmt2eodyOCULd4653wzwBwtbzXearfN0Ic+W
 FZZ8nfp1QR5wG9jij0300mtz03P0TAknWvYNNnDVVj9xK/eH4dKj3ZVEsytOtnrdVI
 8OMiP/xWuwW/mSrfRQMmOYNyYQiCBV2f6GxnWiro=
X-Riseup-User-ID: ECBF70E8AE18FA2C3A4503D85996DE13307D642BFD9025435F88ABC64A82DC45
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LxHlJ1fnBz5vMX;
 Mon,  1 Aug 2022 12:40:12 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Drop XFCEnabled parameter from
 CalculatePrefetchSchedule
Date: Mon,  1 Aug 2022 09:40:06 -0300
Message-Id: <20220801124006.89027-1-mairacanal@riseup.net>
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
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The XFCEnabled parameter from the CalculatePrefetchSchedule function is
not used and is only mentioned in a couple of comments. Therefore,
remove the argument and the comments.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../dc/dml/dcn21/display_mode_vba_21.c        | 21 +++----------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 8a7485e21d53..05cbc6968cde 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -120,7 +120,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int SwathHeightY,
 		unsigned int SwathHeightC,
 		double TWait,
-		bool XFCEnabled,
 		double XFCRemoteSurfaceFlipDelay,
 		bool ProgressiveToInterlaceUnitInOPP,
 		double *DSTXAfterScaler,
@@ -673,7 +672,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int SwathHeightY,
 		unsigned int SwathHeightC,
 		double TWait,
-		bool XFCEnabled,
 		double XFCRemoteSurfaceFlipDelay,
 		bool ProgressiveToInterlaceUnitInOPP,
 		double *DSTXAfterScaler,
@@ -910,12 +908,7 @@ static bool CalculatePrefetchSchedule(
 			TimeForFetchingMetaPTE = dml_max(*Tno_bw + (double) PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / *PrefetchBandwidth,
 					dml_max(UrgentExtraLatency + UrgentLatency * (GPUVMPageTableLevels * (HostVMDynamicLevels + 1) - 1), LineTime / 4));
 		} else {
-// 5/30/2018 - This was an optimization requested from Sy but now NumberOfCursors is no longer a factor
-//             so if this needs to be reinstated, then it should be officially done in the VBA code as well.
-//			if (mode_lib->NumberOfCursors > 0 || XFCEnabled)
-				TimeForFetchingMetaPTE = LineTime / 4;
-//			else
-//				TimeForFetchingMetaPTE = 0.0;
+			TimeForFetchingMetaPTE = LineTime / 4;
 		}
 
 		if ((GPUVMEnable == true || DCCEnable == true)) {
@@ -931,11 +924,7 @@ static bool CalculatePrefetchSchedule(
 											LineTime
 													/ 4.0)));
 		} else {
-// See note above dated 5/30/2018
-//			if (NumberOfCursors > 0 || XFCEnabled)
-				TimeForFetchingRowInVBlank = (LineTime - TimeForFetchingMetaPTE) / 2.0;
-//			else // TODO: Did someone else add this??
-//				TimeForFetchingRowInVBlank = 0.0;
+			TimeForFetchingRowInVBlank = (LineTime - TimeForFetchingMetaPTE) / 2.0;
 		}
 
 		*DestinationLinesToRequestVMInVBlank = dml_ceil(4.0 * TimeForFetchingMetaPTE / LineTime, 1.0) / 4.0;
@@ -943,11 +932,9 @@ static bool CalculatePrefetchSchedule(
 		*DestinationLinesToRequestRowInVBlank = dml_ceil(4.0 * TimeForFetchingRowInVBlank / LineTime, 1.0) / 4.0;
 
 		LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch
-// See note above dated 5/30/2018
-//						- ((NumberOfCursors > 0 || GPUVMEnable || DCCEnable) ?
 						- ((GPUVMEnable || DCCEnable) ?
 								(*DestinationLinesToRequestVMInVBlank + 2 * *DestinationLinesToRequestRowInVBlank) :
-								0.0); // TODO: Did someone else add this??
+								0.0);
 
 		if (LinesToRequestPrefetchPixelData > 0) {
 
@@ -2200,7 +2187,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 							mode_lib->vba.SwathHeightY[k],
 							mode_lib->vba.SwathHeightC[k],
 							TWait,
-							mode_lib->vba.XFCEnabled[k],
 							mode_lib->vba.XFCRemoteSurfaceFlipDelay,
 							mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
 							&locals->DSTXAfterScaler[k],
@@ -3493,7 +3479,6 @@ static noinline void CalculatePrefetchSchedulePerPlane(
 			locals->SwathHeightYThisState[k],
 			locals->SwathHeightCThisState[k],
 			mode_lib->vba.TWait,
-			mode_lib->vba.XFCEnabled[k],
 			mode_lib->vba.XFCRemoteSurfaceFlipDelay,
 			mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
 			&locals->dst_x_after_scaler,
-- 
2.37.1

