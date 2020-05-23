Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7331DF6FA
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2020 13:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72026E057;
	Sat, 23 May 2020 11:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AA96E057
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 May 2020 11:53:50 +0000 (UTC)
Date: Sat, 23 May 2020 11:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590234828;
 bh=zKEAmbr9V1bPLCNBFpsV9zuulffTZwiGATDStCEVeCY=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=en1QUJ+l9hkRjAnagjGy5NPtcJxRdQgCJ1d9+CRZT5v61C1EpYuhIUEPBPhrcKJbR
 +M2/TAZ++HdE7T1gp7aSjLKPbAzqdNeF6x1p8eFl08ee1JDaQGZgr0UFIHM1zpOTjz
 nXhAFzCuKLgJvTpNLF5k7Q5QQxx+z9xbS7/v6h60=
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/amd/display: drop cursor position check in atomic test
Message-ID: <HB1_5z8Vnk8KvqVJezbdCJ0uUkI29R_Q7ksMByqCNQ3DG9HWd_iJP6b0WL1jIIJLBPdN25D8iC4BN-Jbf8NbKSL_Ep6IKVn3DaHpe_h5Ljg=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

get_cursor_position already handles the case where the cursor has
negative off-screen coordinates by not setting
dc_cursor_position.enabled.

Signed-off-by: Simon Ser <contact@emersion.fr>
Fixes: 626bf90fe03f ("drm/amd/display: add basic atomic check for cursor plane")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 28e651b173ab..7fc15b82fe48 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7880,13 +7880,6 @@ static int dm_update_plane_state(struct dc *dc,
 			return -EINVAL;
 		}
 
-		if (new_plane_state->crtc_x <= -new_acrtc->max_cursor_width ||
-			new_plane_state->crtc_y <= -new_acrtc->max_cursor_height) {
-			DRM_DEBUG_ATOMIC("Bad cursor position %d, %d\n",
-							 new_plane_state->crtc_x, new_plane_state->crtc_y);
-			return -EINVAL;
-		}
-
 		return 0;
 	}
 
-- 
2.26.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
