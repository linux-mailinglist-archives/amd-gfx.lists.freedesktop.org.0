Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CA2BB660
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135846E917;
	Fri, 20 Nov 2020 20:19:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE056E91C
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:19:07 +0000 (UTC)
Date: Fri, 20 Nov 2020 20:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605903546;
 bh=1J+7WhsGKWoaFJghA/pSzrS2GmGEAo2HUhTlpfjm8Nk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=IlO5lgtmCMG92EsJqGS0QZaTVqBkMvIO4+XOI442heIi/QAOqL/U12NeD+UnG04tf
 BmtV8To0fIMg9hWcHeeNMnq2cDHl+/FeCjhtHnLrZ467MvGCXqaFFiPZaogL7C/qoN
 HIP9Z8JZxApMFcKUAzKc+we86pBbrBdwTGpWMc3IzRKCsvcvB8Sqs6TEGiJfV36Twf
 QvXepFEpdUtii8N33UjLUNKmrU20CK9LuW+VEBz915Xy9Lqx5utICZEDOL2ntsKm34
 pR+aq1uyWAsSm34BkiQTmNO3i0w7Qejb1mv3qvCFK87UwaJKhyA7HE9wFdD6qBg4Db
 +qBJ0PqlTELSg==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 4/4] drm/amd/display: don't expose rotation prop for cursor
 plane
Message-ID: <ou0uzBHIyn5i1sQXWfXck2EDBtFXVmfBnGJXF7Rqo@cp4-web-027.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Setting any rotation on the cursor plane is ignored by amdgpu.
Because of DCE/DCN design, it's not possible to rotate the cursor.
Instead of displaying the wrong result, stop advertising the rotation
property for the cursor plane.

Now that we check all cursor plane properties in amdgpu_dm_atomic_check,
remove the TODO.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2542571a8993..3283e22241d7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6592,7 +6592,8 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 		DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
 		DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
 
-	if (dm->adev->asic_type >= CHIP_BONAIRE)
+	if (dm->adev->asic_type >= CHIP_BONAIRE &&
+	    plane->type != DRM_PLANE_TYPE_CURSOR)
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   supported_rotations);
 
@@ -8887,7 +8888,6 @@ static int dm_update_plane_state(struct dc *dc,
 	dm_new_plane_state = to_dm_plane_state(new_plane_state);
 	dm_old_plane_state = to_dm_plane_state(old_plane_state);
 
-	/*TODO Implement better atomic check for cursor plane */
 	if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 		if (!enable || !new_plane_crtc ||
 			drm_atomic_plane_disabling(plane->state, new_plane_state))
-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
