Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5D9BDBFE
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Nov 2024 03:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B369A10E64F;
	Wed,  6 Nov 2024 02:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DdlpagER";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E20810E64E;
 Wed,  6 Nov 2024 02:12:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0CECA41BE6;
 Wed,  6 Nov 2024 02:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213CFC4CECF;
 Wed,  6 Nov 2024 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730859140;
 bh=6NOUjoFKAnmlgTL6auRg+aL90Zd3N/TCb0L0ebHelxY=;
 h=From:To:Cc:Subject:Date:From;
 b=DdlpagERtTeS1sGfPQaYripjw4gHXQ0o1uIIi8lgLiQS2AvjAqEhCQB9O2AobH3EO
 tmq4cLHuy24TzfqZdrpTe10o7hfGV/iIuUv2h5cW/WFPTSMECJN8bHMSgClXusKiDu
 hO2Xn8vriDx4HWQUepHIowQj5kPa7xrCXiYoIVsM9UaIJhhSq0XR66r0vG+gfoEnlT
 KiXid4xhvzY1/J6hloTWYE4xXNEzO6YDq9Utfo/N8+zG0a56iQRdO1Z+s7rzCNxd9h
 D1rdFccEucRIPSmevBhKgmR1lVcREWQPPcU3LG1pxQcIocpS+4ICsN0l57DfpnHOMV
 1m4IPzLlC26pQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Ovidiu.Bunea@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "Revert "drm/amd/display: update DML2 policy
 EnhancedPrefetchScheduleAccelerationFinal DCN35"" failed to apply to
 v5.15-stable tree
Date: Tue,  5 Nov 2024 21:12:17 -0500
Message-ID: <20241106021217.182816-1-sashal@kernel.org>
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

The patch below does not apply to the v5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1b6063a57754eae5705753c01e78dc268b989038 Mon Sep 17 00:00:00 2001
From: Ovidiu Bunea <Ovidiu.Bunea@amd.com>
Date: Fri, 11 Oct 2024 11:12:19 -0400
Subject: [PATCH] Revert "drm/amd/display: update DML2 policy
 EnhancedPrefetchScheduleAccelerationFinal DCN35"

This reverts
commit 9dad21f910fc ("drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35")

[why & how]
The offending commit exposes a hang with lid close/open behavior.
Both issues seem to be related to ODM 2:1 mode switching, so there
is another issue generic to that sequence that needs to be
investigated.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Ovidiu Bunea <Ovidiu.Bunea@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 68bf95317ebf2cfa7105251e4279e951daceefb7)
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
index 11c904ae29586..c4c52173ef224 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
@@ -303,6 +303,7 @@ void build_unoptimized_policy_settings(enum dml_project_id project, struct dml_m
 	if (project == dml_project_dcn35 ||
 		project == dml_project_dcn351) {
 		policy->DCCProgrammingAssumesScanDirectionUnknownFinal = false;
+		policy->EnhancedPrefetchScheduleAccelerationFinal = 0;
 		policy->AllowForPStateChangeOrStutterInVBlankFinal = dml_prefetch_support_uclk_fclk_and_stutter_if_possible; /*new*/
 		policy->UseOnlyMaxPrefetchModes = 1;
 	}
-- 
2.43.0




