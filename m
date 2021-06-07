Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F039E1B2
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Jun 2021 18:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1396E914;
	Mon,  7 Jun 2021 16:14:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAB06E913;
 Mon,  7 Jun 2021 16:14:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13ED0613F3;
 Mon,  7 Jun 2021 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082441;
 bh=d2ZN03nQKfadh+LSeiMEoiYz2/mAdXM3bE/ciLZ2Ndw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EhYyIBsNF3S+pxxldkXxJsJMQz1SM4fgYQCbMJssMC5idc5hHqaC2XuzrjTvljZiA
 6SQ8THcrMZkxGwWgKXB+JbgQ+FwLtURG1irad+/L7H3W3ISZ6dq5RId6ovWr7JLEfQ
 4oueMyO4CDK4VVDGotP2FjtBqCrm36CwIcVnFuejuJiw+5a/Vu4L1R1R+9OivXqFHD
 XJ02kpeRfuOnlcg7IhSW5+DJ3pq3ZNKAqHGONjHLJEjBldShW2C+HMZ4r6N2Gm6j8B
 mc4WV4EKVl8Tl9LcjJNKrFgHnhC1xT4sR9GKd5/ciailsXLJmeCoo1sHyxU0TH3k8Y
 SZc656HhkRyhA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 33/39] drm/amd/display: Fix overlay validation by
 considering cursors
Date: Mon,  7 Jun 2021 12:13:12 -0400
Message-Id: <20210607161318.3583636-33-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161318.3583636-1-sashal@kernel.org>
References: <20210607161318.3583636-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 "Tianci . Yin" <tianci.yin@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, Nicholas Choi <nicholas.choi@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit 33f409e60eb0c59a4d0d06a62ab4642a988e17f7 ]

A few weeks ago, we saw a two cursor issue in a ChromeOS system. We
fixed it in the commit:

 drm/amd/display: Fix two cursor duplication when using overlay
 (read the commit message for more details)

After this change, we noticed that some IGT subtests related to
kms_plane and kms_plane_scaling started to fail. After investigating
this issue, we noticed that all subtests that fail have a primary plane
covering the overlay plane, which is currently rejected by amdgpu dm.
Fail those IGT tests highlight that our verification was too broad and
compromises the overlay usage in our drive. This patch fixes this issue
by ensuring that we only reject commits where the primary plane is not
fully covered by the overlay when the cursor hardware is enabled. With
this fix, all IGT tests start to pass again, which means our overlay
support works as expected.

Cc: Tianci.Yin <tianci.yin@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Choi <nicholas.choi@amd.com>
Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fbbb1bde6b06..4792228ed481 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8616,7 +8616,7 @@ static int validate_overlay(struct drm_atomic_state *state)
 	int i;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
-	struct drm_plane_state *primary_state, *overlay_state = NULL;
+	struct drm_plane_state *primary_state, *cursor_state, *overlay_state = NULL;
 
 	/* Check if primary plane is contained inside overlay */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
@@ -8646,6 +8646,14 @@ static int validate_overlay(struct drm_atomic_state *state)
 	if (!primary_state->crtc)
 		return 0;
 
+	/* check if cursor plane is enabled */
+	cursor_state = drm_atomic_get_plane_state(state, overlay_state->crtc->cursor);
+	if (IS_ERR(cursor_state))
+		return PTR_ERR(cursor_state);
+
+	if (drm_atomic_plane_disabling(plane->state, cursor_state))
+		return 0;
+
 	/* Perform the bounds check to ensure the overlay plane covers the primary */
 	if (primary_state->crtc_x < overlay_state->crtc_x ||
 	    primary_state->crtc_y < overlay_state->crtc_y ||
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
