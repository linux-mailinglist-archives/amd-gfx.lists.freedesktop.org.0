Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565153BCCC7
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Jul 2021 13:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BAF6E255;
	Tue,  6 Jul 2021 11:18:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF66E24D;
 Tue,  6 Jul 2021 11:18:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D79F861C65;
 Tue,  6 Jul 2021 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570323;
 bh=Ix9/zcKoy7BIBKCHzKGocvecCkbEtmdiGceJiXA6MVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Toh/4HmmAV2kLJ4hGcs9RcyP+z0y25WbC5zePCru5fGLL+xx8/Ak8/gRRVx526Xg6
 8hmKo+EYS2w2KfI1hknNwXCA28aHLPiDkpSyKpyFj+j0JajIvbKoyZEuJCuHlRR78O
 f7sqv4fPfgojzDzVzGF4yFsihL5fAac0TNlVykvPiyi0oF0JcCCnd1RoJL+wVN6o3C
 di5z1jm4j+Nk1AcrI8SzBXFfXD+xFi9DyTNT3qmfbhowAcGJuJFM5lmM6Y2ijR5hBq
 yhE66eW7QlDN6mzLPu2ho7inhWwOBXkdyPTw6qQ52f7XvezcKQ9eeUMcRSM6wEwn/D
 xPq16gshuaNMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 011/160] drm/amd/display: fix potential gpu reset
 deadlock
Date: Tue,  6 Jul 2021 07:15:57 -0400
Message-Id: <20210706111827.2060499-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Lang Yu <Lang.Yu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit cf8b92a75646735136053ce51107bfa8cfc23191 ]

[Why]
In gpu reset dc_lock acquired in dm_suspend().
Asynchronously handle_hpd_rx_irq can also be called
through amdgpu_dm_irq_suspend->flush_work, which also
tries to acquire dc_lock. That causes a deadlock.

[How]
Check if amdgpu executing reset before acquiring dc_lock.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Reviewed-by: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Acked-by: Wayne Lin <Wayne.Lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index eed494630583..d95569e0e53a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2624,13 +2624,15 @@ static void handle_hpd_rx_irq(void *param)
 		}
 	}
 
-	mutex_lock(&adev->dm.dc_lock);
+	if (!amdgpu_in_reset(adev))
+		mutex_lock(&adev->dm.dc_lock);
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	result = dc_link_handle_hpd_rx_irq(dc_link, &hpd_irq_data, NULL);
 #else
 	result = dc_link_handle_hpd_rx_irq(dc_link, NULL, NULL);
 #endif
-	mutex_unlock(&adev->dm.dc_lock);
+	if (!amdgpu_in_reset(adev))
+		mutex_unlock(&adev->dm.dc_lock);
 
 out:
 	if (result && !is_mst_root_connector) {
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
