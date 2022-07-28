Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96158457E
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Jul 2022 20:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9B10E7AD;
	Thu, 28 Jul 2022 18:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BFA10E71A
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Jul 2022 18:22:08 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LtzWg4FPgzDs0y;
 Thu, 28 Jul 2022 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1659032527; bh=ULERFfGstbxBtAQTaHKUQLYZrmxPNfaIEUIUPJBi/EA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BnprqY2GqInUKuGFUyQz5yKDJtZ9J9FMJaVkfgUHT0qxvII12biE4v/Uh1N+iF8WK
 MpwHKrkiwUTQOvA8B1oKrbsflhb8NDqqI8g7b7uCyDORXH76UCWnJwqnxYMfD35pvt
 0mJUkRgq0zfMe7Eiq2+F+IYZOwegVxx8mRvzTX6c=
X-Riseup-User-ID: FEA7B59F18588383CE8C6A0F199851147A55A7DCC6FDE9E800C802F57078A87B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LtzWZ28syz5vMX;
 Thu, 28 Jul 2022 18:22:02 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 04/16] drm/amd/display: Remove
 AllowDRAMSelfRefreshDuringVBlank VBA variable
Date: Thu, 28 Jul 2022 15:20:36 -0300
Message-Id: <20220728182047.264825-5-mairacanal@riseup.net>
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

The AllowDRAMSelfRefreshDuringVBlank variable from the struct vba_vars_st
is only used on assignments, so its value is not used on code. So, remove
it the AllowDRAMSelfRefreshDuringVBlank entry from the struct vba_vars_st.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c | 3 ---
 .../gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c   | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c | 3 ---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c   | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h          | 1 -
 7 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 37a8b418a24d..d86d5c346e42 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -2350,7 +2350,6 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 		if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 0) {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = true;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			mode_lib->vba.MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.DRAMClockChangeWatermark,
 					dml_max(
@@ -2358,13 +2357,11 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 							mode_lib->vba.UrgentWatermark));
 		} else if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 1) {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = false;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			mode_lib->vba.MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.StutterEnterPlusExitWatermark,
 					mode_lib->vba.UrgentWatermark);
 		} else {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = false;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			mode_lib->vba.MinTTUVBlank[k] = mode_lib->vba.UrgentWatermark;
 		}
 		if (!mode_lib->vba.DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 0e0697326717..effd02574a0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -2384,7 +2384,6 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 		if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 0) {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = true;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			mode_lib->vba.MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.DRAMClockChangeWatermark,
 					dml_max(
@@ -2392,13 +2391,11 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 							mode_lib->vba.UrgentWatermark));
 		} else if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 1) {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = false;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			mode_lib->vba.MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.StutterEnterPlusExitWatermark,
 					mode_lib->vba.UrgentWatermark);
 		} else {
 			mode_lib->vba.AllowDRAMClockChangeDuringVBlank[k] = false;
-			mode_lib->vba.AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			mode_lib->vba.MinTTUVBlank[k] = mode_lib->vba.UrgentWatermark;
 		}
 		if (!mode_lib->vba.DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index aa752d78308f..ae03f1a3c9f0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -2546,7 +2546,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 		if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 0) {
 			locals->AllowDRAMClockChangeDuringVBlank[k] = true;
-			locals->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			locals->MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.DRAMClockChangeWatermark,
 					dml_max(
@@ -2554,13 +2553,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 							mode_lib->vba.UrgentWatermark));
 		} else if (mode_lib->vba.PrefetchMode[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 1) {
 			locals->AllowDRAMClockChangeDuringVBlank[k] = false;
-			locals->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			locals->MinTTUVBlank[k] = dml_max(
 					mode_lib->vba.StutterEnterPlusExitWatermark,
 					mode_lib->vba.UrgentWatermark);
 		} else {
 			locals->AllowDRAMClockChangeDuringVBlank[k] = false;
-			locals->AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			locals->MinTTUVBlank[k] = mode_lib->vba.UrgentWatermark;
 		}
 		if (!mode_lib->vba.DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index cc9b6497b287..fe7fcb0d7b1f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -2972,7 +2972,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		if (PrefetchMode == 0) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = true;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(
 					v->DRAMClockChangeWatermark,
 					dml_max(
@@ -2980,13 +2979,11 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 							v->UrgentWatermark));
 		} else if (PrefetchMode == 1) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(
 					v->StutterEnterPlusExitWatermark,
 					v->UrgentWatermark);
 		} else {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			v->MinTTUVBlank[k] = v->UrgentWatermark;
 		}
 		if (!v->DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 55ab4ec8b8fa..eca05bbc0fb5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -3185,17 +3185,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		if (PrefetchMode == 0) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = true;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(
 					v->DRAMClockChangeWatermark,
 					dml_max(v->StutterEnterPlusExitWatermark, v->UrgentWatermark));
 		} else if (PrefetchMode == 1) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(v->StutterEnterPlusExitWatermark, v->UrgentWatermark);
 		} else {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			v->MinTTUVBlank[k] = v->UrgentWatermark;
 		}
 		if (!v->DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 279ed038a359..acb47cdaaa05 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -3209,17 +3209,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		if (PrefetchMode == 0) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = true;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(
 					v->DRAMClockChangeWatermark,
 					dml_max(v->StutterEnterPlusExitWatermark, v->UrgentWatermark));
 		} else if (PrefetchMode == 1) {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = true;
 			v->MinTTUVBlank[k] = dml_max(v->StutterEnterPlusExitWatermark, v->UrgentWatermark);
 		} else {
 			v->AllowDRAMClockChangeDuringVBlank[k] = false;
-			v->AllowDRAMSelfRefreshDuringVBlank[k] = false;
 			v->MinTTUVBlank[k] = v->UrgentWatermark;
 		}
 		if (!v->DynamicMetadataEnable[k])
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 1b037e74bfc3..f03cf9cf9096 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -1004,7 +1004,6 @@ struct vba_vars_st {
 	double DSTYAfterScaler[DC__NUM_DPP__MAX];
 	double DSTXAfterScaler[DC__NUM_DPP__MAX];
 	bool AllowDRAMClockChangeDuringVBlank[DC__NUM_DPP__MAX];
-	bool AllowDRAMSelfRefreshDuringVBlank[DC__NUM_DPP__MAX];
 	double VRatioPrefetchY[DC__NUM_DPP__MAX];
 	double VRatioPrefetchC[DC__NUM_DPP__MAX];
 	double DestinationLinesForPrefetch[DC__NUM_DPP__MAX];
-- 
2.37.1

