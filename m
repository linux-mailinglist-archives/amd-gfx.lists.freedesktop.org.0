Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42B58457D
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Jul 2022 20:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658A310E18E;
	Thu, 28 Jul 2022 18:22:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBDA10F9D0
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Jul 2022 18:22:00 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LtzWW5pclzDrsv;
 Thu, 28 Jul 2022 18:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1659032520; bh=QMtsyfZF/nIiDPU4bNM66nWjTtCfP/1/QyZw8VmKob0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=flS4PEKCoHxOXfKzsPHe4Rx8oNXoEkGVEoRjJsq43FQuWL/22vb3QWDCrWQEJZ3uz
 WA8q9QpAilrDO1kIEy+8Bd70WURJ/aKVzoYrLtkHebEkXH+HEtG4gzbHlJc8975iuv
 RT6GcZl3UdkhD5t5bmkPCpG0+cPStQKvOMqD0Row=
X-Riseup-User-ID: FFDC12B4A70B55D8FB8484FF0FF883B8DE66B3BF7FB6F1F1EF61AB0337F6FFBC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LtzWQ3hBpz5vMX;
 Thu, 28 Jul 2022 18:21:54 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/16] drm/amd/display: Remove DSCCLK_calculated VBA variable
Date: Thu, 28 Jul 2022 15:20:35 -0300
Message-Id: <20220728182047.264825-4-mairacanal@riseup.net>
In-Reply-To: <20220728182047.264825-1-mairacanal@riseup.net>
References: <20220728182047.264825-1-mairacanal@riseup.net>
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

The DSCCLK_calculated variable from the struct vba_vars_st is
only used on assignments, so its value is not used on code. Moreover,
its getter function is not used also. So, remove the DSCCLK_calculated
entry from the struct vba_vars_st.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        | 21 ++----------------
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 21 ++----------------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 18 +--------------
 .../dc/dml/dcn30/display_mode_vba_30.c        | 19 ++--------------
 .../dc/dml/dcn31/display_mode_vba_31.c        | 19 ++--------------
 .../dc/dml/dcn314/display_mode_vba_314.c      | 19 ++--------------
 .../dc/dml/dcn32/display_mode_vba_32.c        | 22 ++-----------------
 .../drm/amd/display/dc/dml/display_mode_vba.c |  1 -
 .../drm/amd/display/dc/dml/display_mode_vba.h |  2 --
 9 files changed, 13 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 8a499f8066b7..37a8b418a24d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -1770,28 +1770,11 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 
 	// DSCCLK
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
-		if ((mode_lib->vba.BlendingAndTiming[k] != k) || !mode_lib->vba.DSCEnabled[k]) {
-			mode_lib->vba.DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (mode_lib->vba.OutputFormat[k] == dm_420
-					|| mode_lib->vba.OutputFormat[k] == dm_n422)
+		if ((mode_lib->vba.BlendingAndTiming[k] == k) || mode_lib->vba.DSCEnabled[k]) {
+			if (mode_lib->vba.OutputFormat[k] == dm_420 || mode_lib->vba.OutputFormat[k] == dm_n422)
 				mode_lib->vba.DSCFormatFactor = 2;
 			else
 				mode_lib->vba.DSCFormatFactor = 1;
-			if (mode_lib->vba.ODMCombineEnabled[k])
-				mode_lib->vba.DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 6
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
-			else
-				mode_lib->vba.DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 3
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index ef7f0b8ed2d5..0e0697326717 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -1806,28 +1806,11 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 
 	// DSCCLK
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
-		if ((mode_lib->vba.BlendingAndTiming[k] != k) || !mode_lib->vba.DSCEnabled[k]) {
-			mode_lib->vba.DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (mode_lib->vba.OutputFormat[k] == dm_420
-					|| mode_lib->vba.OutputFormat[k] == dm_n422)
+		if ((mode_lib->vba.BlendingAndTiming[k] == k) || mode_lib->vba.DSCEnabled[k]) {
+			if (mode_lib->vba.OutputFormat[k] == dm_420 || mode_lib->vba.OutputFormat[k] == dm_n422)
 				mode_lib->vba.DSCFormatFactor = 2;
 			else
 				mode_lib->vba.DSCFormatFactor = 1;
-			if (mode_lib->vba.ODMCombineEnabled[k])
-				mode_lib->vba.DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 6
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
-			else
-				mode_lib->vba.DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 3
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 8a7485e21d53..aa752d78308f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -1764,28 +1764,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	// DSCCLK
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
-		if ((mode_lib->vba.BlendingAndTiming[k] != k) || !mode_lib->vba.DSCEnabled[k]) {
-			locals->DSCCLK_calculated[k] = 0.0;
-		} else {
+		if ((mode_lib->vba.BlendingAndTiming[k] == k) || mode_lib->vba.DSCEnabled[k]) {
 			if (mode_lib->vba.OutputFormat[k] == dm_420
 					|| mode_lib->vba.OutputFormat[k] == dm_n422)
 				mode_lib->vba.DSCFormatFactor = 2;
 			else
 				mode_lib->vba.DSCFormatFactor = 1;
-			if (mode_lib->vba.ODMCombineEnabled[k])
-				locals->DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 6
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
-			else
-				locals->DSCCLK_calculated[k] =
-						mode_lib->vba.PixelClockBackEnd[k] / 3
-								/ mode_lib->vba.DSCFormatFactor
-								/ (1
-										- mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
-												/ 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 876b321b30ca..cc9b6497b287 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -2159,26 +2159,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	// DSCCLK
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		if ((v->BlendingAndTiming[k] != k) || !v->DSCEnabled[k]) {
-			v->DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (v->OutputFormat[k] == dm_420)
-				v->DSCFormatFactor = 2;
-			else if (v->OutputFormat[k] == dm_444)
-				v->DSCFormatFactor = 1;
-			else if (v->OutputFormat[k] == dm_n422)
+		if ((v->BlendingAndTiming[k] == k) || v->DSCEnabled[k]) {
+			if (v->OutputFormat[k] == dm_420 || v->OutputFormat[k] == dm_n422)
 				v->DSCFormatFactor = 2;
 			else
 				v->DSCFormatFactor = 1;
-			if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 12
-					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 6
-					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 3
-					/ v->DSCFormatFactor / (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 3fab19134480..55ab4ec8b8fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -2286,26 +2286,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	// DSCCLK
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		if ((v->BlendingAndTiming[k] != k) || !v->DSCEnabled[k]) {
-			v->DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (v->OutputFormat[k] == dm_420)
-				v->DSCFormatFactor = 2;
-			else if (v->OutputFormat[k] == dm_444)
-				v->DSCFormatFactor = 1;
-			else if (v->OutputFormat[k] == dm_n422)
+		if ((v->BlendingAndTiming[k] == k) || v->DSCEnabled[k]) {
+			if (v->OutputFormat[k] == dm_420 || v->OutputFormat[k] == dm_n422)
 				v->DSCFormatFactor = 2;
 			else
 				v->DSCFormatFactor = 1;
-			if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 12 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 6 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 3 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index fc4d7474c111..279ed038a359 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -2310,26 +2310,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	// DSCCLK
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		if ((v->BlendingAndTiming[k] != k) || !v->DSCEnabled[k]) {
-			v->DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (v->OutputFormat[k] == dm_420)
-				v->DSCFormatFactor = 2;
-			else if (v->OutputFormat[k] == dm_444)
-				v->DSCFormatFactor = 1;
-			else if (v->OutputFormat[k] == dm_n422)
+		if ((v->BlendingAndTiming[k] == k) || v->DSCEnabled[k]) {
+			if (v->OutputFormat[k] == dm_420 || v->OutputFormat[k] == dm_n422)
 				v->DSCFormatFactor = 2;
 			else
 				v->DSCFormatFactor = 1;
-			if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 12 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else if (v->ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 6 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else
-				v->DSCCLK_calculated[k] = v->PixelClockBackEnd[k] / 3 / v->DSCFormatFactor
-						/ (1 - v->DISPCLKDPPCLKDSCCLKDownSpreading / 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index a1fb2d1d1cdb..f199ef475ed0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -332,29 +332,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 	// DSCCLK
 	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
-		if ((mode_lib->vba.BlendingAndTiming[k] != k) || !mode_lib->vba.DSCEnabled[k]) {
-			v->DSCCLK_calculated[k] = 0.0;
-		} else {
-			if (mode_lib->vba.OutputFormat[k] == dm_420)
-				mode_lib->vba.DSCFormatFactor = 2;
-			else if (mode_lib->vba.OutputFormat[k] == dm_444)
-				mode_lib->vba.DSCFormatFactor = 1;
-			else if (mode_lib->vba.OutputFormat[k] == dm_n422)
+		if ((mode_lib->vba.BlendingAndTiming[k] == k) || mode_lib->vba.DSCEnabled[k]) {
+			if (mode_lib->vba.OutputFormat[k] == dm_420 || mode_lib->vba.OutputFormat[k] == dm_n422)
 				mode_lib->vba.DSCFormatFactor = 2;
 			else
 				mode_lib->vba.DSCFormatFactor = 1;
-			if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
-				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 12
-						/ mode_lib->vba.DSCFormatFactor
-						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
-				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 6
-						/ mode_lib->vba.DSCFormatFactor
-						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
-			else
-				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 3
-						/ mode_lib->vba.DSCFormatFactor
-						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index d1c720b48b0c..316153ece160 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -134,7 +134,6 @@ dml_get_attr_func(unbounded_request_enabled, mode_lib->vba.UnboundedRequestEnabl
 
 dml_get_pipe_attr_func(dsc_delay, mode_lib->vba.DSCDelay);
 dml_get_pipe_attr_func(dppclk_calculated, mode_lib->vba.DPPCLK_calculated);
-dml_get_pipe_attr_func(dscclk_calculated, mode_lib->vba.DSCCLK_calculated);
 dml_get_pipe_attr_func(min_ttu_vblank, mode_lib->vba.MinTTUVBlank);
 dml_get_pipe_attr_func(min_ttu_vblank_in_us, mode_lib->vba.MinTTUVBlank);
 dml_get_pipe_attr_func(vratio_prefetch_l, mode_lib->vba.VRatioPrefetchY);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 632041cf49bb..1b037e74bfc3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -73,7 +73,6 @@ dml_get_attr_decl(unbounded_request_enabled);
 
 dml_get_pipe_attr_decl(dsc_delay);
 dml_get_pipe_attr_decl(dppclk_calculated);
-dml_get_pipe_attr_decl(dscclk_calculated);
 dml_get_pipe_attr_decl(min_ttu_vblank);
 dml_get_pipe_attr_decl(min_ttu_vblank_in_us);
 dml_get_pipe_attr_decl(vratio_prefetch_l);
@@ -1033,7 +1032,6 @@ struct vba_vars_st {
 	double PrefetchSourceLinesC[DC__NUM_DPP__MAX];
 	double PSCL_THROUGHPUT_LUMA[DC__NUM_DPP__MAX];
 	double PSCL_THROUGHPUT_CHROMA[DC__NUM_DPP__MAX];
-	double DSCCLK_calculated[DC__NUM_DPP__MAX];
 	unsigned int DSCDelay[DC__NUM_DPP__MAX];
 	unsigned int MaxVStartupLines[DC__NUM_DPP__MAX];
 	double DPPCLKUsingSingleDPP[DC__NUM_DPP__MAX];
-- 
2.37.1

