Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F504B6FBF
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Feb 2022 16:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DF810E598;
	Tue, 15 Feb 2022 15:28:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532810E598;
 Tue, 15 Feb 2022 15:28:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8918615F0;
 Tue, 15 Feb 2022 15:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4F9C340F2;
 Tue, 15 Feb 2022 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938905;
 bh=TmLejLW9mEBO5G5fDzZMrMFnVitxe+SOqkA4tEbNZvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WdjmPIoQ2t7s7xHaCmYKmj64acODYwbQarriCGHsIWqANZoSRJwZ2FGmIHDnA2TlZ
 6KnfKqRTZYyB/ItDuJLPD7ccWG4dkt4O5v+IbAV1va7PfPmIhsFFJNpMpnI43FgqMV
 vPMutovglqMnH17gQ6KsDrIcocPrqvNaQYXr9E/2r0ZGWGQbz5RVAkftDC5F8Tmm/X
 4knjacuv6BUv04422KRBKMyd6Gw5x+vkpRW5KtVZ1Whz6DY2jHckJigTDR7L0hyvi3
 jxmPR6xKsUamMRj6cOeneVcp6hWaUdBXG1Mdtq/3Vdafk6zADspaRyI3GdIzA1UHS1
 jMmkQdKWuY0Mg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 31/34] drm/amd/display: fix yellow carp wm
 clamping
Date: Tue, 15 Feb 2022 10:26:54 -0500
Message-Id: <20220215152657.580200-31-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152657.580200-1-sashal@kernel.org>
References: <20220215152657.580200-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Eric.Yang2@amd.com, sunpeng.li@amd.com, Josip.Pavic@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 60fdf98a774eee244a4e00c34a9e7729b61d0f44 ]

Fix clamping to match register field size

Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn31/dcn31_hubbub.c   | 61 ++++++++++---------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
index 90c73a1cb9861..5e3bcaf12cac4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
@@ -138,8 +138,11 @@ static uint32_t convert_and_clamp(
 	ret_val = wm_ns * refclk_mhz;
 	ret_val /= 1000;
 
-	if (ret_val > clamp_value)
+	if (ret_val > clamp_value) {
+		/* clamping WMs is abnormal, unexpected and may lead to underflow*/
+		ASSERT(0);
 		ret_val = clamp_value;
+	}
 
 	return ret_val;
 }
@@ -159,7 +162,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->a.urgent_ns > hubbub2->watermarks.a.urgent_ns) {
 		hubbub2->watermarks.a.urgent_ns = watermarks->a.urgent_ns;
 		prog_wm_value = convert_and_clamp(watermarks->a.urgent_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, 0,
 				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, prog_wm_value);
 
@@ -193,7 +196,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->a.urgent_latency_ns > hubbub2->watermarks.a.urgent_latency_ns) {
 		hubbub2->watermarks.a.urgent_latency_ns = watermarks->a.urgent_latency_ns;
 		prog_wm_value = convert_and_clamp(watermarks->a.urgent_latency_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, 0,
 				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, prog_wm_value);
 	} else if (watermarks->a.urgent_latency_ns < hubbub2->watermarks.a.urgent_latency_ns)
@@ -203,7 +206,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->b.urgent_ns > hubbub2->watermarks.b.urgent_ns) {
 		hubbub2->watermarks.b.urgent_ns = watermarks->b.urgent_ns;
 		prog_wm_value = convert_and_clamp(watermarks->b.urgent_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, 0,
 				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, prog_wm_value);
 
@@ -237,7 +240,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->b.urgent_latency_ns > hubbub2->watermarks.b.urgent_latency_ns) {
 		hubbub2->watermarks.b.urgent_latency_ns = watermarks->b.urgent_latency_ns;
 		prog_wm_value = convert_and_clamp(watermarks->b.urgent_latency_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, 0,
 				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, prog_wm_value);
 	} else if (watermarks->b.urgent_latency_ns < hubbub2->watermarks.b.urgent_latency_ns)
@@ -247,7 +250,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->c.urgent_ns > hubbub2->watermarks.c.urgent_ns) {
 		hubbub2->watermarks.c.urgent_ns = watermarks->c.urgent_ns;
 		prog_wm_value = convert_and_clamp(watermarks->c.urgent_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, 0,
 				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, prog_wm_value);
 
@@ -281,7 +284,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->c.urgent_latency_ns > hubbub2->watermarks.c.urgent_latency_ns) {
 		hubbub2->watermarks.c.urgent_latency_ns = watermarks->c.urgent_latency_ns;
 		prog_wm_value = convert_and_clamp(watermarks->c.urgent_latency_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, 0,
 				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, prog_wm_value);
 	} else if (watermarks->c.urgent_latency_ns < hubbub2->watermarks.c.urgent_latency_ns)
@@ -291,7 +294,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->d.urgent_ns > hubbub2->watermarks.d.urgent_ns) {
 		hubbub2->watermarks.d.urgent_ns = watermarks->d.urgent_ns;
 		prog_wm_value = convert_and_clamp(watermarks->d.urgent_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, 0,
 				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, prog_wm_value);
 
@@ -325,7 +328,7 @@ static bool hubbub31_program_urgent_watermarks(
 	if (safe_to_lower || watermarks->d.urgent_latency_ns > hubbub2->watermarks.d.urgent_latency_ns) {
 		hubbub2->watermarks.d.urgent_latency_ns = watermarks->d.urgent_latency_ns;
 		prog_wm_value = convert_and_clamp(watermarks->d.urgent_latency_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0x3fff);
 		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, 0,
 				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, prog_wm_value);
 	} else if (watermarks->d.urgent_latency_ns < hubbub2->watermarks.d.urgent_latency_ns)
@@ -351,7 +354,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_A calculated =%d\n"
@@ -367,7 +370,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->a.cstate_pstate.cstate_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->a.cstate_pstate.cstate_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_A calculated =%d\n"
@@ -383,7 +386,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_A calculated =%d\n"
@@ -399,7 +402,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->a.cstate_pstate.cstate_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->a.cstate_pstate.cstate_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_A calculated =%d\n"
@@ -416,7 +419,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_B calculated =%d\n"
@@ -432,7 +435,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->b.cstate_pstate.cstate_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->b.cstate_pstate.cstate_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_B calculated =%d\n"
@@ -448,7 +451,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_B calculated =%d\n"
@@ -464,7 +467,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->b.cstate_pstate.cstate_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->b.cstate_pstate.cstate_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_B calculated =%d\n"
@@ -481,7 +484,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_C calculated =%d\n"
@@ -497,7 +500,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->c.cstate_pstate.cstate_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->c.cstate_pstate.cstate_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_C calculated =%d\n"
@@ -513,7 +516,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_C calculated =%d\n"
@@ -529,7 +532,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->c.cstate_pstate.cstate_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->c.cstate_pstate.cstate_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_C calculated =%d\n"
@@ -546,7 +549,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_D calculated =%d\n"
@@ -562,7 +565,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->d.cstate_pstate.cstate_exit_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->d.cstate_pstate.cstate_exit_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_D calculated =%d\n"
@@ -578,7 +581,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, 0,
 				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_D calculated =%d\n"
@@ -594,7 +597,7 @@ static bool hubbub31_program_stutter_watermarks(
 				watermarks->d.cstate_pstate.cstate_exit_z8_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->d.cstate_pstate.cstate_exit_z8_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, 0,
 				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_D calculated =%d\n"
@@ -625,7 +628,7 @@ static bool hubbub31_program_pstate_watermarks(
 				watermarks->a.cstate_pstate.pstate_change_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->a.cstate_pstate.pstate_change_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, 0,
 				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_A calculated =%d\n"
@@ -642,7 +645,7 @@ static bool hubbub31_program_pstate_watermarks(
 				watermarks->b.cstate_pstate.pstate_change_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->b.cstate_pstate.pstate_change_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, 0,
 				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_B calculated =%d\n"
@@ -659,7 +662,7 @@ static bool hubbub31_program_pstate_watermarks(
 				watermarks->c.cstate_pstate.pstate_change_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->c.cstate_pstate.pstate_change_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, 0,
 				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_C calculated =%d\n"
@@ -676,7 +679,7 @@ static bool hubbub31_program_pstate_watermarks(
 				watermarks->d.cstate_pstate.pstate_change_ns;
 		prog_wm_value = convert_and_clamp(
 				watermarks->d.cstate_pstate.pstate_change_ns,
-				refclk_mhz, 0x1fffff);
+				refclk_mhz, 0xffff);
 		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, 0,
 				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, prog_wm_value);
 		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_D calculated =%d\n"
-- 
2.34.1

