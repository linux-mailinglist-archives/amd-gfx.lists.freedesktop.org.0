Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AA8BEFFE
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2024 00:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AB210F849;
	Tue,  7 May 2024 22:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="edrur4Yx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3835A10F55B;
 Tue,  7 May 2024 22:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4069E61708;
 Tue,  7 May 2024 22:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5E4C4AF67;
 Tue,  7 May 2024 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122666;
 bh=B2SVtDrO0dHn6s0eDtwIbIP11hKGInd/f7i7UiMIyqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=edrur4YxaVMyWf9KQx9bf+CiWhtnQSXEkBpJmkbSI84uXqQ0RjXLCFB7+RamIuHtD
 uyRexgSkhzwFIHAI/m2AgD1PAuDXmR48sK29wi46uCTpUMQt5Yg/fXXqzd8qsnoW4W
 OID06Qm5ddtTX7bFUyHVaahLJu4DNGtH225epiExQogz4GFP9m9WwSh9pOtLQset22
 BDhteNzeE3XNu3xedLjZPnaBHlREo/aGRgpK67M1GJJ3FyyVrGj0jp4m//YM3mHbfo
 j1s5dnfsH8x+VlSiZEVPMj8xegaGNLV0B6VCO0JZN0T6nx6or+wZpF05TX7605Reln
 pivwHZKuGbE/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Joshua Ashton <joshua@froggi.es>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, srinivasan.shanmugam@amd.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 09/23] drm/amd/display: Set color_mgmt_changed to
 true on unsuspend
Date: Tue,  7 May 2024 18:56:35 -0400
Message-ID: <20240507225725.390306-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225725.390306-1-sashal@kernel.org>
References: <20240507225725.390306-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Joshua Ashton <joshua@froggi.es>

[ Upstream commit 2eb9dd497a698dc384c0dd3e0311d541eb2e13dd ]

Otherwise we can end up with a frame on unsuspend where color management
is not applied when userspace has not committed themselves.

Fixes re-applying color management on Steam Deck/Gamescope on S3 resume.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 718e533ab46dd..f33b7f09c3f3d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3007,6 +3007,7 @@ static int dm_resume(void *handle)
 			dc_stream_release(dm_new_crtc_state->stream);
 			dm_new_crtc_state->stream = NULL;
 		}
+		dm_new_crtc_state->base.color_mgmt_changed = true;
 	}
 
 	for_each_new_plane_in_state(dm->cached_state, plane, new_plane_state, i) {
-- 
2.43.0

