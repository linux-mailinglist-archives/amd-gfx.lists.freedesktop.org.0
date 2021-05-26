Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CC391942
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 15:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D476ED06;
	Wed, 26 May 2021 13:56:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120B6ED06
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 13:56:00 +0000 (UTC)
Date: Wed, 26 May 2021 13:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622037358;
 bh=uyvk7nbsEbA6XBwvAKrfEYWCgUkAy4dFlENyqKFFMT4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Uzp1BTSMNdHgzGE6PjRu5RT1yC4p9bP+v3XKVkcz+9483tgPyI1H/xOLNm0GhyIVu
 G4BoHwDF+SCxaTC7F6fL54mOfylLTimG2mCyF1tineIehnmN5eAduUYBXWGwp9JKEf
 Qnd1MWpHJKaed0qEAV0IkfMQsP5zcFS2bF5QedjTPoIrOYCDDQlFELqjJSjylrqJj5
 4B8GTmpg4OqZkKqufjxqAjW2VQYvEmf4ViId7gDJ4Mw0WfI8hFx3qUDUt14TFd9bPx
 Fp8uYxyLfKptvDxTGj3ayiHDIexknAnHfCRSE9knKqCYhir5eDY7GFa2O6RJ82Bnj7
 8MQ5wuCbUtsgg==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH RESEND] amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic
Message-ID: <RbK0wXzzSSK3M7hx467tnbnCEW1BmHW8lY9PBwcqs4@cp7-web-045.plabs.ch>
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

This allows to tie the log message to a specific DRM device.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2c9d099adfc2..4dd811816cba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10089,7 +10089,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 
 	if (cursor_scale_w != primary_scale_w ||
 	    cursor_scale_h != primary_scale_h) {
-		DRM_DEBUG_ATOMIC("Cursor plane scaling doesn't match primary plane\n");
+		drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match primary plane\n");
 		return -EINVAL;
 	}
 
-- 
2.31.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
