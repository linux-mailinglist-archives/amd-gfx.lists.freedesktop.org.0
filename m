Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B731FCFF
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 17:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82996EB6B;
	Fri, 19 Feb 2021 16:19:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D626B6EB6C
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 16:19:15 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4Dhxbj5jY7z4xk84
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 16:19:13 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="ZkC0aJ7n"
Date: Fri, 19 Feb 2021 16:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613751548;
 bh=LCCh8m0Natx98HjwB7VBwIvHk++P57FhBPzorUfmhD8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=ZkC0aJ7nzUQ9xmJgXXXbf6zY9HDW6nYFBtXk53I+3/0Xwa5QYnaGzooC9ttQKMsZU
 0BhalSbGMGROvNAXFglaorPIkVdSchhXMmPN+ItoF2DhpkYM3RLmAdFTmRbe1lNcD8
 Ov0v9MBTBUiedJwPyr041+o/mFKDRg+xrJaqcABGaiggDpGW2Xm8gjmMG9IZwurjzZ
 EQU6z+HEKyIF7PMfvEtT9noW56AVbgNZ9L3Ca3UwZJQNLGh/s+d63QUo7lPf4H5ACb
 S8R9KAg4ulCypFYB/oMDIA2+FV6LjgFaJNFK1mHv9hBDu07qO7HgQiH4hD3t0xU/mP
 qIAqleLjuZIYQ==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic
Message-ID: <kUMBqZno6DNtdjav79rfmyirsuazkbWoXcEkcOfxIY@cp4-web-014.plabs.ch>
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
index 519080e9a233..4548b779bbce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9235,7 +9235,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 
 	if (cursor_scale_w != primary_scale_w ||
 	    cursor_scale_h != primary_scale_h) {
-		DRM_DEBUG_ATOMIC("Cursor plane scaling doesn't match primary plane\n");
+		drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match primary plane\n");
 		return -EINVAL;
 	}
 
-- 
2.30.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
