Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C277831FF0A
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 19:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B376E082;
	Fri, 19 Feb 2021 18:58:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3459E6E082
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 18:58:17 +0000 (UTC)
Date: Fri, 19 Feb 2021 18:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613761095;
 bh=gv0ZpyV3N+uo/cVZGZavv50EAZmRNAQWZfIpPmSKRS4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=t8QwXPKjE1fYX8k+XfV0zOPpI4BQHX3V6phz5gDWyMLB9j815UzgFbwEmlm743uLK
 Y+KikQV3XA+F6PgH/C0ShBVyFZZrWR5DWWdcWMD2XDYRdRh2AbgP/G9YlLOSNdG1Rv
 AS8a50555nNzBbGEV2+j3NnQb2NW5Ty5Z6Is26nYtth/1MrtiGbDibp44vjJb3WcX/
 lmn8TFzXG4Kq4DjKZsZs2EkNIwivdolR21bg6QTVY+EAMPjvV2xLm+hc566Tjg0Ehr
 vnWZpVliu/wJkWrvl/g4ZGgbKwmEEO7JlIUwXjpVrmXeuUcbjLFNOA4nlxY8V9FW+H
 XXm1yzFfYETyw==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/6] amd/display: fail on cursor plane without an underlying
 plane
Message-ID: <I5B1EIA88M4W0bSuy9DLTgt70QGefRznp9IdJ14Cco@cp7-web-042.plabs.ch>
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

Make sure there's an underlying pipe that can be used for the
cursor.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index acbe1537e7cf..a5d6010405bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9226,9 +9226,14 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 	}
 
 	new_cursor_state = drm_atomic_get_new_plane_state(state, crtc->cursor);
-	if (!new_cursor_state || !new_underlying_state || !new_cursor_state->fb)
+	if (!new_cursor_state || !new_cursor_state->fb)
 		return 0;
 
+	if (!new_underlying_state || !new_underlying_state->fb) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be enabled without underlying plane\n");
+		return -EINVAL;
+	}
+
 	cursor_scale_w = new_cursor_state->crtc_w * 1000 /
 			 (new_cursor_state->src_w >> 16);
 	cursor_scale_h = new_cursor_state->crtc_h * 1000 /
-- 
2.30.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
