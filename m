Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E393E61E
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Jul 2024 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A0A10E20F;
	Sun, 28 Jul 2024 15:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pwYVQqD3";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991510E20F;
 Sun, 28 Jul 2024 15:44:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7A59CE0952;
 Sun, 28 Jul 2024 15:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D142DC116B1;
 Sun, 28 Jul 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181440;
 bh=Tst4WHHCamd3ae+R1a1DtMZHKP0OgRso3Ogrs1SLQNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pwYVQqD3Kt80OXCBQHGoC+CbIIYEeAToweuTfOBljhRN398NLIrmsRMMpPPOhtBkN
 HttNMHSU1KKC6nb3zNJwfYo9Ukh1R9HhJR9DI3w6q5yf2qFLu2Htqnbw+B1JgRszV9
 LjsnezKtmUPU2GiITDIUBAgOKe5ymlTkacXuA83DEUefopqqKhodLSq3aYoSCpeygq
 smgN7ZNa7i6LQjX0KpVAfaTdPPuEp3GBWmmD8k4XpsHegmLU1lnQ74xQKA/HGgCCy7
 jlPBZ3yq7rGRa4BIigzB257DjkmRNc7DgvWFHR799AYg9PMdKdUVloVyGsS91BAuyG
 MvzXo3zcCVeuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, mwen@igalia.com, joshua@froggi.es,
 hamza.mahfooz@amd.com, Qingqing.Zhuo@amd.com, Nicholas.Choi@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 16/34] drm/amd/display: Add NULL check for 'afb'
 before dereferencing in amdgpu_dm_plane_handle_cursor_update
Date: Sun, 28 Jul 2024 11:40:40 -0400
Message-ID: <20240728154230.2046786-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 38e6f715b02b572f74677eb2f29d3b4bc6f1ddff ]

This commit adds a null check for the 'afb' variable in the
amdgpu_dm_plane_handle_cursor_update function. Previously, 'afb' was
assumed to be null, but was used later in the code without a null check.
This could potentially lead to a null pointer dereference.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1298 amdgpu_dm_plane_handle_cursor_update() error: we previously assumed 'afb' could be null (see line 1252)

Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8a4c40b4c27e4..918c880739a2a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1231,14 +1231,22 @@ void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
 {
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
-	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
-	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	uint64_t address = afb ? afb->address : 0;
+	struct drm_crtc *crtc;
+	struct dm_crtc_state *crtc_state;
+	struct amdgpu_crtc *amdgpu_crtc;
+	u64 address;
 	struct dc_cursor_position position = {0};
 	struct dc_cursor_attributes attributes;
 	int ret;
 
+	if (!afb)
+		return;
+
+	crtc = plane->state->crtc ? plane->state->crtc : old_plane_state->crtc;
+	crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
+	amdgpu_crtc = to_amdgpu_crtc(crtc);
+	address = afb->address;
+
 	if (!plane->state->fb && !old_plane_state->fb)
 		return;
 
-- 
2.43.0

