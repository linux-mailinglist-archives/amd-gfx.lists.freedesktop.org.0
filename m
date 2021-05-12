Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789E37D18F
	for <lists+amd-gfx@lfdr.de>; Wed, 12 May 2021 20:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58686EC90;
	Wed, 12 May 2021 18:01:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F1A6EC90;
 Wed, 12 May 2021 18:01:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B976142C;
 Wed, 12 May 2021 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842511;
 bh=J/4sdsDbUrwP8zrOfnZ6q7R207oTBt7jkwU87Zm7nYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Flr/uJbVckgKV7FcYtiYVuc26YPQl7QxWqjRRFBCFpjXCiF95gKSAKWgX8fB4pqsh
 4RCGADTjrjIlj26hSMkUBupLX9UydTnPntIGxIyBG2H4kTdf14E/CGjKGTuHUANCyo
 ijLzArxMSWeiW97IsbdAl0QStvaKuMRTWNnNYJl9/w9Pz4JYIKVMZi6Y5Y4VhcIdNd
 tkaJjrj0wGGteqakN4XK5BIo1Q+VyqABlcsrx46OwG01PTpfvSdlsth7PTAnRYsex8
 JN6MrvhAAzjoy8Xtn6UEiqFldUgxLKvmPUC0VI4r+jpVvYUmPcQB8NyhZ1IuknavzW
 DwXo3UM6TjNyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 31/37] drm/amd/display: Fix two cursor
 duplication when using overlay
Date: Wed, 12 May 2021 14:00:58 -0400
Message-Id: <20210512180104.664121-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180104.664121-1-sashal@kernel.org>
References: <20210512180104.664121-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit 16e9b3e58bc3fce7391539e0eb3fd167cbf9951f ]

Our driver supports overlay planes, and as expected, some userspace
compositor takes advantage of these features. If the userspace is not
enabling the cursor, they can use multiple planes as they please.
Nevertheless, we start to have constraints when userspace tries to
enable hardware cursor with various planes. Basically, we cannot draw
the cursor at the same size and position on two separated pipes since it
uses extra bandwidth and DML only run with one cursor.

For those reasons, when we enable hardware cursor and multiple planes,
our driver should accept variations like the ones described below:

  +-------------+   +--------------+
  | +---------+ |   |              |
  | |Primary  | |   | Primary      |
  | |         | |   | Overlay      |
  | +---------+ |   |              |
  |Overlay      |   |              |
  +-------------+   +--------------+

In this scenario, we can have the desktop UI in the overlay and some
other framebuffer attached to the primary plane (e.g., video). However,
userspace needs to obey some rules and avoid scenarios like the ones
described below (when enabling hw cursor):

                                      +--------+
                                      |Overlay |
 +-------------+    +-----+-------+ +-|        |--+
 | +--------+  | +--------+       | | +--------+  |
 | |Overlay |  | |Overlay |       | |             |
 | |        |  | |        |       | |             |
 | +--------+  | +--------+       | |             |
 | Primary     |    | Primary     | | Primary     |
 +-------------+    +-------------+ +-------------+

 +-------------+   +-------------+
 |     +--------+  |  Primary    |
 |     |Overlay |  |             |
 |     |        |  |             |
 |     +--------+  | +--------+  |
 | Primary     |   | |Overlay |  |
 +-------------+   +-|        |--+
                     +--------+

If the userspace violates some of the above scenarios, our driver needs
to reject the commit; otherwise, we can have unexpected behavior. Since
we don't have a proper driver validation for the above case, we can see
some problems like a duplicate cursor in applications that use multiple
planes. This commit fixes the cursor issue and others by adding adequate
verification for multiple planes.

Change since V1 (Harry and Sean):
- Remove cursor verification from the equation.

Cc: Louis Li <Ching-shih.Li@amd.com>
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d699a5cf6c11..c6c32456ee5f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9312,6 +9312,53 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
 }
 #endif
 
+static int validate_overlay(struct drm_atomic_state *state)
+{
+	int i;
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct drm_plane_state *primary_state, *overlay_state = NULL;
+
+	/* Check if primary plane is contained inside overlay */
+	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+		if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
+			if (drm_atomic_plane_disabling(plane->state, new_plane_state))
+				return 0;
+
+			overlay_state = new_plane_state;
+			continue;
+		}
+	}
+
+	/* check if we're making changes to the overlay plane */
+	if (!overlay_state)
+		return 0;
+
+	/* check if overlay plane is enabled */
+	if (!overlay_state->crtc)
+		return 0;
+
+	/* find the primary plane for the CRTC that the overlay is enabled on */
+	primary_state = drm_atomic_get_plane_state(state, overlay_state->crtc->primary);
+	if (IS_ERR(primary_state))
+		return PTR_ERR(primary_state);
+
+	/* check if primary plane is enabled */
+	if (!primary_state->crtc)
+		return 0;
+
+	/* Perform the bounds check to ensure the overlay plane covers the primary */
+	if (primary_state->crtc_x < overlay_state->crtc_x ||
+	    primary_state->crtc_y < overlay_state->crtc_y ||
+	    primary_state->crtc_x + primary_state->crtc_w > overlay_state->crtc_x + overlay_state->crtc_w ||
+	    primary_state->crtc_y + primary_state->crtc_h > overlay_state->crtc_y + overlay_state->crtc_h) {
+		DRM_DEBUG_ATOMIC("Overlay plane is enabled with hardware cursor but does not fully cover primary plane\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
  * @dev: The DRM device
@@ -9486,6 +9533,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 	}
 
+	ret = validate_overlay(state);
+	if (ret)
+		goto fail;
+
 	/* Add new/modified planes */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		ret = dm_update_plane_state(dc, state, plane,
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
