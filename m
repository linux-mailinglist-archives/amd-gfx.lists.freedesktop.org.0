Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8F943BD8
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2024 02:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78FC10E7FE;
	Thu,  1 Aug 2024 00:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WD+UiMPV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CAB10E7F9;
 Thu,  1 Aug 2024 00:31:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 739686173B;
 Thu,  1 Aug 2024 00:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DFAC116B1;
 Thu,  1 Aug 2024 00:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472273;
 bh=c1MzbQTkm/Q39eCRZqYS3+IUXU4/3LUeV/eGDaZQZcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WD+UiMPVL/wS3gZFpVc5grKkQbiiC3cI0PNlA07IYRUGTTZeGCm5rNckAVtm2jKxK
 VMkM8gUBHeYiq0W2eXaYHFlvE8jxkIDnSweEJ04xBHpVuyKGDA9b1JoKWOicAEpoTN
 YPt3ZvK3FT7q4nUo9u2HSpr+XIcgibFzf3/abycJuStUZx8vjh1/RFEZPsf5n3ZlTr
 V8oeWb3aKNLdHYRhlpqYgP2uOmRoaKOr9vo7qfAcLFgGYwLBeu9UmieRR5wL6eA9kY
 iRuM2oKrVqtFbG2MSFE/ZnHbaKAaJDtI3iImTCBsziOI0OLF34fQUSXAqh7NDY2UmD
 UN3+pfl9qiKfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 hamza.mahfooz@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 50/61] drm/amd/display: Check denominator pbn_div
 before used
Date: Wed, 31 Jul 2024 20:26:08 -0400
Message-ID: <20240801002803.3935985-50-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 116a678f3a9abc24f5c9d2525b7393d18d9eb58e ]

[WHAT & HOW]
A denominator cannot be 0, and is checked before used.

This fixes 1 DIVIDE_BY_ZERO issue reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2c6caddf1de34..b7d2fa77d828b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6765,7 +6765,7 @@ static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
 			}
 		}
 
-		if (j == dc_state->stream_count)
+		if (j == dc_state->stream_count || pbn_div == 0)
 			continue;
 
 		slot_num = DIV_ROUND_UP(pbn, pbn_div);
-- 
2.43.0

