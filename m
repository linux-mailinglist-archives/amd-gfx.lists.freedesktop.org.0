Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD888DF54
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42410FC37;
	Wed, 27 Mar 2024 12:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OinFC73d";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E636210FC36;
 Wed, 27 Mar 2024 12:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6416361507;
 Wed, 27 Mar 2024 12:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2CCC43390;
 Wed, 27 Mar 2024 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542189;
 bh=Xm/kyuCsL2gba+H+gqPY5dTv8/ZP+spR4tHabQYxmrY=;
 h=From:To:Cc:Subject:Date:From;
 b=OinFC73dXsTDE/pVTGIBJeonMRB85jEHADB4A5GxXFPbKPIToBylPCmiMGD5RPtzj
 3//PJqgcUxN/WlXtzEo8PLEFkMYpnjG8Z7zP6Yq/SZr88Q1d1Q5bIM8N4422+utWg8
 94Asg64emNUZ+oA/ROKe/ZGOUFjDGquhQ7ABISFewl4A1LCr7rVqwn5xeNh6ctF/vH
 k3pgmoESJkwop0aUj8+LCeUbmU7dBZn5QE3fTh+GRC8XUhI/2nkYHwFRLJEuvGWUmr
 fVPtlhydj6VD7qyTUFzlmT7DyEF/QCQBA8svLPJTkGVV5EHh1P7oM7/JgOqoOKyDth
 cg+BNDwY+KzoQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ovidiu.bunea@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Fix DML2 watermark calculation"
 failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:23:07 -0400
Message-ID: <20240327122307.2838245-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 2254ab45dab22a18fdd29fe0e471706872c00093 Mon Sep 17 00:00:00 2001
From: Ovidiu Bunea <ovidiu.bunea@amd.com>
Date: Mon, 18 Dec 2023 21:40:45 -0500
Subject: [PATCH] drm/amd/display: Fix DML2 watermark calculation

[Why]
core_mode_programming in DML2 should output watermark calculations
to locals, but it incorrectly uses mode_lib

[How]
update code to match HW DML2

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index a6b938a12de13..9be5ebf3a8c0b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -9446,13 +9446,13 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 		CalculateWatermarks_params->CompressedBufferSizeInkByte = locals->CompressedBufferSizeInkByte;
 
 		// Output
-		CalculateWatermarks_params->Watermark = &s->dummy_watermark; // Watermarks *Watermark
-		CalculateWatermarks_params->DRAMClockChangeSupport = &mode_lib->ms.support.DRAMClockChangeSupport[0];
-		CalculateWatermarks_params->MaxActiveDRAMClockChangeLatencySupported = &s->dummy_single_array[0][0]; // dml_float_t *MaxActiveDRAMClockChangeLatencySupported[]
-		CalculateWatermarks_params->SubViewportLinesNeededInMALL = &mode_lib->ms.SubViewportLinesNeededInMALL[j]; // dml_uint_t SubViewportLinesNeededInMALL[]
-		CalculateWatermarks_params->FCLKChangeSupport = &mode_lib->ms.support.FCLKChangeSupport[0];
-		CalculateWatermarks_params->MaxActiveFCLKChangeLatencySupported = &s->dummy_single[0]; // dml_float_t *MaxActiveFCLKChangeLatencySupported
-		CalculateWatermarks_params->USRRetrainingSupport = &mode_lib->ms.support.USRRetrainingSupport[0];
+		CalculateWatermarks_params->Watermark = &locals->Watermark; // Watermarks *Watermark
+		CalculateWatermarks_params->DRAMClockChangeSupport = &locals->DRAMClockChangeSupport;
+		CalculateWatermarks_params->MaxActiveDRAMClockChangeLatencySupported = locals->MaxActiveDRAMClockChangeLatencySupported; // dml_float_t *MaxActiveDRAMClockChangeLatencySupported[]
+		CalculateWatermarks_params->SubViewportLinesNeededInMALL = locals->SubViewportLinesNeededInMALL; // dml_uint_t SubViewportLinesNeededInMALL[]
+		CalculateWatermarks_params->FCLKChangeSupport = &locals->FCLKChangeSupport;
+		CalculateWatermarks_params->MaxActiveFCLKChangeLatencySupported = &locals->MaxActiveFCLKChangeLatencySupported; // dml_float_t *MaxActiveFCLKChangeLatencySupported
+		CalculateWatermarks_params->USRRetrainingSupport = &locals->USRRetrainingSupport;
 
 		CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			&mode_lib->scratch,
-- 
2.43.0




