Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95B4FCA01
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Apr 2022 02:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ABF10FAE6;
	Tue, 12 Apr 2022 00:48:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7EF10FAE6;
 Tue, 12 Apr 2022 00:48:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DBD84B815C8;
 Tue, 12 Apr 2022 00:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1031C385A4;
 Tue, 12 Apr 2022 00:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724519;
 bh=f/G6KStY/U9pl9MkdxWmJya3hrXIXQYXfyRaEPCj8bE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hhb9Ql54tCJshvKrrUOZRWE9UnG9HWQBBxhs0QbP4EJ4Bxj5uw/ep+79YyaDx76Y+
 zbid+5jjcHts+BFSK68CkoqbkpJVBmC/5xW3IYzcngZ0LAFJSc9fIdyy+/tD3tJYyz
 tgirYU3mrsU07e1OoZzx/HiZB+B3zNXGBZrUsNGaWnf/KzKdcW1qWMNbOWyhvW9llV
 xXmZju5cUCmlOsKfAWO2SyzvBnGPxgr5ETxeJxKx20A6v4++WYHLdtTzfCp43ZrT89
 Bl2zvqR1ws+87YODb+JYyGUk4j1sWdMznu3WADMQh5THHt+/Gd75UrweAoGfQp1LNl
 KPByxGuu/0YRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 31/41] drm/amd/display: Fix allocate_mst_payload
 assert on resume
Date: Mon, 11 Apr 2022 20:46:43 -0400
Message-Id: <20220412004656.350101-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004656.350101-1-sashal@kernel.org>
References: <20220412004656.350101-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Alex Hung <alex.hung@amd.com>,
 contact@emersion.fr, airlied@linux.ie, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, qingqing.zhuo@amd.com,
 harry.wentland@amd.com, christian.koenig@amd.com, shenshih@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit f4346fb3edf7720db3f7f5e1cab1f667cd024280 ]

[Why]
On resume we do link detection for all non-MST connectors.
MST is handled separately. However the condition for telling
if connector is on mst branch is not enough for mst hub case.
Link detection for mst branch link leads to mst topology reset.
That causes assert in dc_link_allocate_mst_payload()

[How]
Use link type as indicator for mst link.

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b9859e52ad92..091524bdc673 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2296,7 +2296,8 @@ static int dm_resume(void *handle)
 		 * this is the case when traversing through already created
 		 * MST connectors, should be skipped
 		 */
-		if (aconnector->mst_port)
+		if (aconnector->dc_link &&
+		    aconnector->dc_link->type == dc_connection_mst_branch)
 			continue;
 
 		mutex_lock(&aconnector->hpd_lock);
-- 
2.35.1

