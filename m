Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE7A1C93E
	for <lists+amd-gfx@lfdr.de>; Sun, 26 Jan 2025 15:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F21F10E414;
	Sun, 26 Jan 2025 14:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d5FP2IaM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4154110E414;
 Sun, 26 Jan 2025 14:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 662325C5C77;
 Sun, 26 Jan 2025 14:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CF1C4CED3;
 Sun, 26 Jan 2025 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903399;
 bh=E1is4zt2gze7byJYRFtumhxxLlDVcMbXbCdG/3VCcz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d5FP2IaMAkMvKC7555vYhHw1WaOai+eSO5igsThdZ9I0IYOCSDed0ZulaQslSEXEH
 gwAhVqCC5c/ywXbCk+Cn3/FpQpCYdqonh7jGJLfCl77O5OZBm+wzKW7ITSWQu7vg9p
 Qa7/0HIAJWSTMelFH9J/yExY5P2xXDyPhYDHGLVNXWfz9gJPzwZE2Ad0UQQcc+IwMg
 1QLCm4U+Z7ndoCyIc0rSCLubCyOlmmZEWd4Vw7gaJjbBGSEZV4C4vnr7nI0vI6zET/
 jcrtjJKZgna9DDhiR2LVH3/KaskSsC0vpS+DMFFRUl0WIY0XFnFKLr2oesDpyiaq4P
 L4fCOpGQd3iLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Wayne.Lin@amd.com, chiahsuan.chung@amd.com,
 agustin.gutierrez@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 11/17] drm/amd/display: Fix Mode Cutoff in DSC
 Passthrough to DP2.1 Monitor
Date: Sun, 26 Jan 2025 09:56:06 -0500
Message-Id: <20250126145612.937679-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145612.937679-1-sashal@kernel.org>
References: <20250126145612.937679-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit e56ad45e991128bf4db160b75a1d9f647a341d8f ]

Source --> DP2.1 MST hub --> DP1.4/2.1 monitor

When change from DP1.4 to DP2.1 from monitor manual, modes higher than
4k120 are all cutoff by mode validation. Switch back to DP1.4 gets all
the modes up to 4k240 available to be enabled by dsc passthrough.

[why]
Compared to DP1.4 link from hub to monitor, DP2.1 link has larger
full_pbn value that causes overflow in the process of doing conversion
from pbn to kbps.

[how]
Change the data type accordingly to fit into the data limit during
conversion calculation.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 385a5a75fdf87..5858e288b3fd6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1578,16 +1578,16 @@ int pre_validate_dsc(struct drm_atomic_state *state,
 	return ret;
 }
 
-static unsigned int kbps_from_pbn(unsigned int pbn)
+static uint32_t kbps_from_pbn(unsigned int pbn)
 {
-	unsigned int kbps = pbn;
+	uint64_t kbps = (uint64_t)pbn;
 
 	kbps *= (1000000 / PEAK_FACTOR_X1000);
 	kbps *= 8;
 	kbps *= 54;
 	kbps /= 64;
 
-	return kbps;
+	return (uint32_t)kbps;
 }
 
 static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
-- 
2.39.5

