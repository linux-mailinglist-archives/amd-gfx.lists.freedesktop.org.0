Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCDD33413E
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Mar 2021 16:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065A6EA3C;
	Wed, 10 Mar 2021 15:12:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766846EA37
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 15:12:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E61123C27AF
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 14:50:53 +0000 (UTC)
X-Originating-IP: 82.65.230.196
Received: from localhost.localdomain (82-65-230-196.subs.proxad.net
 [82.65.230.196]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DC5812000C;
 Wed, 10 Mar 2021 14:50:30 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/5] amd/display: add cursor alpha and blend mode checks
Date: Wed, 10 Mar 2021 15:50:18 +0100
Message-Id: <20210310145019.2877-5-contact@emersion.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310145019.2877-1-contact@emersion.fr>
References: <20210310145019.2877-1-contact@emersion.fr>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We don't want a semi-transparent overlay to make the cursor plane
semi-transparent as well. Same for the pixel blend mode.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 98df550c3979..b4f6e2985b8a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9501,6 +9501,16 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 		return -EINVAL;
 	}
 
+	if (new_underlying_state->alpha != DRM_BLEND_ALPHA_OPAQUE) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be used with non-opaque underlying plane\n");
+		return -EINVAL;
+	}
+
+	if (new_underlying_state->pixel_blend_mode != DRM_MODE_BLEND_PREMULTI) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be used with non-premultiplied underlying plane\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
