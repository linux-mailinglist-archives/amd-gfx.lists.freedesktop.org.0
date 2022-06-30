Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F02562407
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jun 2022 22:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53B612AE6E;
	Thu, 30 Jun 2022 20:18:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0412AE6E;
 Thu, 30 Jun 2022 20:18:00 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4LYqQH5R6Bz9t3L;
 Thu, 30 Jun 2022 20:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1656620280; bh=rZZfTNxDEfSl9tcQU9oW6x/190Q0/3YhqEuXiQqK7tc=;
 h=From:To:Cc:Subject:Date:From;
 b=Z5neAfw6FJWvEKnmAkKxtDBR7mPWFcK0KThHbQk4FVFiBHM37Xk8glqfnW+rJ/7+i
 A3WXYYudiN+65jLligELy9ICWxm+cHUzkDCHkCXG2pUtA8UR4ke0fJRordPIPpK/AY
 DdzFkdZ9XNyPI9IOPnmYvmgVvL06xCwm6odfYA88=
X-Riseup-User-ID: 73FC3F6A18D9107A66E3AA6B055D55B48A0B10E1AC8A5CB2E4BDF06A14DB9CA1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4LYqQC4893z1yTL;
 Thu, 30 Jun 2022 20:17:55 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Remove duplicate code across dcn30 and dcn31
Date: Thu, 30 Jun 2022 17:17:41 -0300
Message-Id: <20220630201741.991501-1-mairacanal@riseup.net>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The function CalculateBytePerPixelAnd256BBlockSizes was defined four
times: on display_mode_vba_30.c, display_rq_dlg_calc_30.c,
display_mode_vba_31.c and display_rq_dlg_calc_31.c. In order to avoid
code duplication, the CalculateBytePerPixelAnd256BBlockSizes is defined
on display_mode_vba_30.h and used across dcn30 and dcn31.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../dc/dml/dcn30/display_mode_vba_30.c        |  21 +---
 .../dc/dml/dcn30/display_mode_vba_30.h        |  11 ++
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     |  93 +--------------
 .../dc/dml/dcn31/display_mode_vba_31.c        | 106 +-----------------
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  91 +--------------
 5 files changed, 23 insertions(+), 299 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index fb4aa4c800bf..842eb94ebe04 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -712,18 +712,6 @@ static double CalculateUrgentLatency(
 		double UrgentLatencyAdjustmentFabricClockReference,
 		double FabricClockSingle);
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double       *BytePerPixelDETY,
-		double       *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC);
-
 void dml30_recalculate(struct display_mode_lib *mode_lib)
 {
 	ModeSupportAndSystemConfiguration(mode_lib);
@@ -2095,7 +2083,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	DTRACE("   return_bus_bw      = %f", v->ReturnBW);
 
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
@@ -3165,7 +3153,7 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				mode_lib->vba.SourcePixelFormat[k],
 				mode_lib->vba.SurfaceTiling[k],
 				&BytePerPixY[k],
@@ -3218,7 +3206,7 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			&dummysinglestring);
 }
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
+void dml30_CalculateBytePerPixelAnd256BBlockSizes(
 		enum source_format_class SourcePixelFormat,
 		enum dm_swizzle_mode SurfaceTiling,
 		unsigned int *BytePerPixelY,
@@ -3305,7 +3293,6 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
 		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
 		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
 	}
-	return true;
 }
 
 static double CalculateTWait(
@@ -3709,7 +3696,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	/*Bandwidth Support Check*/
 
 	for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
index 4e249eaabfdb..daaf0883b84d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
@@ -39,5 +39,16 @@ double dml30_CalculateWriteBackDISPCLK(
 		long   WritebackDestinationWidth,
 		unsigned int HTotal,
 		unsigned int WritebackLineBufferSize);
+void dml30_CalculateBytePerPixelAnd256BBlockSizes(
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
 
 #endif /* __DML30_DISPLAY_MODE_VBA_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 747167083dea..8179be1f34bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -29,6 +29,7 @@
 #include "../display_mode_vba.h"
 #include "../dml_inline_defs.h"
 #include "display_rq_dlg_calc_30.h"
+#include "display_mode_vba_30.h"
 
 static bool is_dual_plane(enum source_format_class source_format)
 {
@@ -275,96 +276,6 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 		full_swath_bytes_packed_c);
 }
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double       *BytePerPixelDETY,
-		double       *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC)
-{
-	if (SourcePixelFormat == dm_444_64) {
-		*BytePerPixelDETY = 8;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 8;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_rgbe_alpha) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 1;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 1;
-	} else if (SourcePixelFormat == dm_420_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 2;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 2;
-	} else if (SourcePixelFormat == dm_420_12) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 4;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	} else {
-		*BytePerPixelDETY = 4.0 / 3;
-		*BytePerPixelDETC = 8.0 / 3;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	}
-
-	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32
-			|| SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8
-			|| SourcePixelFormat == dm_mono_16 || SourcePixelFormat == dm_mono_8
-			|| SourcePixelFormat == dm_rgbe)) {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-		} else if (SourcePixelFormat == dm_444_64) {
-			*BlockHeight256BytesY = 4;
-		} else if (SourcePixelFormat == dm_444_8) {
-			*BlockHeight256BytesY = 16;
-		} else {
-			*BlockHeight256BytesY = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockHeight256BytesC = 0;
-		*BlockWidth256BytesC = 0;
-	} else {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-			*BlockHeight256BytesC = 1;
-		} else if (SourcePixelFormat == dm_rgbe_alpha) {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 16;
-		} else if (SourcePixelFormat == dm_420_8) {
-			*BlockHeight256BytesY = 16;
-			*BlockHeight256BytesC = 8;
-		} else {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
-	}
-	return true;
-}
-
 static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
 	display_data_rq_dlg_params_st *rq_dlg_param,
 	display_data_rq_misc_params_st *rq_misc_param,
@@ -450,7 +361,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
 	double byte_per_pixel_det_y = 0;
 	double byte_per_pixel_det_c = 0;
 
-	CalculateBytePerPixelAnd256BBlockSizes((enum source_format_class)(source_format),
+	dml30_CalculateBytePerPixelAnd256BBlockSizes((enum source_format_class)(source_format),
 		(enum dm_swizzle_mode)(tiling),
 		&bytes_per_element_y,
 		&bytes_per_element_c,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 448fbbcdf88a..9957313da732 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -26,6 +26,7 @@
 #include "dc.h"
 #include "dc_link.h"
 #include "../display_mode_lib.h"
+#include "dml/dcn30/display_mode_vba_30.h"
 #include "display_mode_vba_31.h"
 #include "../dml_inline_defs.h"
 
@@ -86,17 +87,6 @@ typedef struct {
 #define BPP_INVALID 0
 #define BPP_BLENDED_PIPE 0xffffffff
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC);
 static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
 static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(struct display_mode_lib *mode_lib);
 static unsigned int dscceComputeDelay(
@@ -2220,7 +2210,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	DTRACE("   return_bus_bw      = %f", v->ReturnBW);
 
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
@@ -3415,7 +3405,7 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&BytePerPixY[k],
@@ -3469,94 +3459,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			&dummysinglestring);
 }
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC)
-{
-	if (SourcePixelFormat == dm_444_64) {
-		*BytePerPixelDETY = 8;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 8;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_rgbe_alpha) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 1;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 1;
-	} else if (SourcePixelFormat == dm_420_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 2;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 2;
-	} else if (SourcePixelFormat == dm_420_12) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 4;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	} else {
-		*BytePerPixelDETY = 4.0 / 3;
-		*BytePerPixelDETC = 8.0 / 3;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	}
-
-	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
-			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-		} else if (SourcePixelFormat == dm_444_64) {
-			*BlockHeight256BytesY = 4;
-		} else if (SourcePixelFormat == dm_444_8) {
-			*BlockHeight256BytesY = 16;
-		} else {
-			*BlockHeight256BytesY = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockHeight256BytesC = 0;
-		*BlockWidth256BytesC = 0;
-	} else {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-			*BlockHeight256BytesC = 1;
-		} else if (SourcePixelFormat == dm_rgbe_alpha) {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 16;
-		} else if (SourcePixelFormat == dm_420_8) {
-			*BlockHeight256BytesY = 16;
-			*BlockHeight256BytesC = 8;
-		} else {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
-	}
-	return true;
-}
-
 static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
 {
 	if (PrefetchMode == 0) {
@@ -4066,7 +3968,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	/*Bandwidth Support Check*/
 
 	for (k = 0; k < v->NumberOfActivePlanes; k++) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
index dd570689c095..c94cf6e01e25 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
@@ -27,94 +27,7 @@
 #include "../display_mode_vba.h"
 #include "../dml_inline_defs.h"
 #include "display_rq_dlg_calc_31.h"
-
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC)
-{
-	if (SourcePixelFormat == dm_444_64) {
-		*BytePerPixelDETY = 8;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 8;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_rgbe_alpha) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 1;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 1;
-	} else if (SourcePixelFormat == dm_420_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 2;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 2;
-	} else if (SourcePixelFormat == dm_420_12) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 4;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	} else {
-		*BytePerPixelDETY = 4.0 / 3;
-		*BytePerPixelDETC = 8.0 / 3;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	}
-
-	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
-			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-		} else if (SourcePixelFormat == dm_444_64) {
-			*BlockHeight256BytesY = 4;
-		} else if (SourcePixelFormat == dm_444_8) {
-			*BlockHeight256BytesY = 16;
-		} else {
-			*BlockHeight256BytesY = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockHeight256BytesC = 0;
-		*BlockWidth256BytesC = 0;
-	} else {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-			*BlockHeight256BytesC = 1;
-		} else if (SourcePixelFormat == dm_rgbe_alpha) {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 16;
-		} else if (SourcePixelFormat == dm_420_8) {
-			*BlockHeight256BytesY = 16;
-			*BlockHeight256BytesC = 8;
-		} else {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
-	}
-	return true;
-}
+#include "dml/dcn30/display_mode_vba_30.h"
 
 static bool is_dual_plane(enum source_format_class source_format)
 {
@@ -467,7 +380,7 @@ static void get_meta_and_pte_attr(
 	double byte_per_pixel_det_y;
 	double byte_per_pixel_det_c;
 
-	CalculateBytePerPixelAnd256BBlockSizes(
+	dml30_CalculateBytePerPixelAnd256BBlockSizes(
 			(enum source_format_class) (source_format),
 			(enum dm_swizzle_mode) (tiling),
 			&bytes_per_element_y,
-- 
2.36.1

