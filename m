Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910AD6A3763
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Feb 2023 03:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C37310E328;
	Mon, 27 Feb 2023 02:09:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DEA10E326;
 Mon, 27 Feb 2023 02:09:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFC3960DB6;
 Mon, 27 Feb 2023 02:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D236C433EF;
 Mon, 27 Feb 2023 02:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463745;
 bh=YVuj1t6VKWFAH41UqMeidaZUSpdBhp8oxL3SpS3WuK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y0VUJfMiaJkGnoBHy1MBoHeuslauBeXgIbRI23I2TydCTL9mxaAEjEyK1urvQPi9K
 pFuxGGpgQMMAkKtMYbjEpnx29rGT2wuhOfhuw6h3sFHT2dIL7BEka8A4Gtn0O4rtzd
 x8nnmTh/Ij/zzi1BpsRtL4K7BIPmWjkhfxdNqlgyu1hNGSZFQMlOtv7uz3EMflqMzN
 hLH5BbWabmwMBwMlkQnuXhZPFglmUO9LTlNrFFNOxtxrrFw0PM3TGn/OmNa7kwnsZ7
 LvDrIUT+NpZ6gT9m2yRpxl58h/5/A7uQHunxyPCjzFFIDxWA4MFwzRwjaOUTq+nitv
 U8CChmfoYyWDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/25] drm/amd/display: Fix potential null-deref
 in dm_resume
Date: Sun, 26 Feb 2023 21:08:25 -0500
Message-Id: <20230227020855.1051605-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020855.1051605-1-sashal@kernel.org>
References: <20230227020855.1051605-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, Xinhui.Pan@amd.com,
 kernel test robot <lkp@intel.com>, sunpeng.li@amd.com, airlied@gmail.com,
 Wayne Lin <Wayne.Lin@amd.com>, Rodrigo.Siqueira@amd.com,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Jasdeep Dhillon <jdhillon@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 christian.koenig@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

[ Upstream commit 7a7175a2cd84b7874bebbf8e59f134557a34161b ]

[Why]
Fixing smatch error:
dm_resume() error: we previously assumed 'aconnector->dc_link' could be null

[How]
Check if dc_link null at the beginning of the loop,
so further checks can be dropped.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b4293b5a82526..68c98e30fee71 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2687,12 +2687,14 @@ static int dm_resume(void *handle)
 	drm_for_each_connector_iter(connector, &iter) {
 		aconnector = to_amdgpu_dm_connector(connector);
 
+		if (!aconnector->dc_link)
+			continue;
+
 		/*
 		 * this is the case when traversing through already created
 		 * MST connectors, should be skipped
 		 */
-		if (aconnector->dc_link &&
-		    aconnector->dc_link->type == dc_connection_mst_branch)
+		if (aconnector->dc_link->type == dc_connection_mst_branch)
 			continue;
 
 		mutex_lock(&aconnector->hpd_lock);
-- 
2.39.0

