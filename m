Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FD88DF3C
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E83E10FC24;
	Wed, 27 Mar 2024 12:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H1rMvDVb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B820710F2EF;
 Wed, 27 Mar 2024 12:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B9A5614E3;
 Wed, 27 Mar 2024 12:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC67CC433F1;
 Wed, 27 Mar 2024 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542150;
 bh=OK+2Jyhl3Tn8LDE1CvM7vRsE6lxOEeTzYbG/u6VlYPU=;
 h=From:To:Cc:Subject:Date:From;
 b=H1rMvDVbEvy+DF3joM6zqSQ39hHJNPf+mk3ySTEwKYUQiZyMFA6dI+XLLxCWXFXZ1
 sCzIds7hgSVgt4MVHEhPX9pXzMIElFd03DNeQWj2XPTHIcwK88VgUtKl+8JAO7Nl4S
 Jj9yiefHdWpK0eJu1+AMvvuc63R1fVPVCQA327BLaxznqtVHhFGyEkP4oXHmdXi6mj
 1oRWLnCngs4c69Af7FANUrW19B/GLUPHmVycgK5nZUPsFwAawm/8N+bSlGSvDw0JMN
 i2KRBUdbjPd4PJSWxgld70LDRmAPPwfuEUHx38jObzKuaHnsGY5rM4wehs8MJcf4HG
 pUMitl/YdtxUQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	srinivasan.shanmugam@amd.com
Cc: Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Drop 'acrtc' and add 'new_crtc_state'
 NULL check for writeback requests." failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:22:28 -0400
Message-ID: <20240327122229.2837747-1-sashal@kernel.org>
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

From b2f26f49e84bea03dddb5f37ff137c97b165107b Mon Sep 17 00:00:00 2001
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Date: Sat, 13 Jan 2024 14:32:27 +0530
Subject: [PATCH] drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL
 check for writeback requests.

Return value of 'to_amdgpu_crtc' which is container_of(...) can't be
null, so it's null check 'acrtc' is dropped.

Fixing the below:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9302 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'acrtc' could be null (see line 9299)

Added 'new_crtc_state' NULL check for function
'drm_atomic_get_new_crtc_state' that retrieves the new state for a CRTC,
while enabling writeback requests.

Cc: stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 36af104e7663c..8623722e954f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9327,10 +9327,10 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		if (!new_con_state->writeback_job)
 			continue;
 
-		new_crtc_state = NULL;
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
 
-		if (acrtc)
-			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
+		if (!new_crtc_state)
+			continue;
 
 		if (acrtc->wb_enabled)
 			continue;
-- 
2.43.0




