Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C141C34AD3F
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Mar 2021 18:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FEC6F457;
	Fri, 26 Mar 2021 17:19:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDF96F457
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 17:19:48 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E97AD3B5177
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 17:00:11 +0000 (UTC)
Received: from mamimi.lan (lfbn-idf2-1-947-59.w86-238.abo.wanadoo.fr
 [86.238.178.59]) (Authenticated sender: schroder@emersion.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2C3B6100005;
 Fri, 26 Mar 2021 16:59:47 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] amd/display: allow non-linear multi-planar formats
Date: Fri, 26 Mar 2021 17:59:44 +0100
Message-Id: <20210326165944.1310-1-contact@emersion.fr>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Accept non-linear buffers which use a multi-planar format, as long
as they don't use DCC.

Tested on GFX9 with NV12.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 36ee52104007..66e3ecf123d1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4216,13 +4216,6 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	/*
-	 * The arbitrary tiling support for multiplane formats has not been hooked
-	 * up.
-	 */
-	if (info->num_planes > 1)
-		return false;
-
 	/*
 	 * For D swizzle the canonical modifier depends on the bpp, so check
 	 * it here.
@@ -4241,6 +4234,10 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 		/* Per radeonsi comments 16/64 bpp are more complicated. */
 		if (info->cpp[0] != 4)
 			return false;
+		/* We support multi-planar formats, but not when combined with
+		 * additional DCC metadata planes. */
+		if (info->num_planes > 1)
+			return false;
 	}
 
 	return true;
-- 
2.31.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
