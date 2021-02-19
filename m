Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2231FD00
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 17:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAAB6EB6C;
	Fri, 19 Feb 2021 16:19:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E86EB6C
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 16:19:26 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Dhxbw5Sksz4x2dK
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 16:19:24 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="CD2chjh4"
Date: Fri, 19 Feb 2021 16:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613751560;
 bh=PegOe9hjDpPpHrz8FZioQtK25eT49fGeAmKI7sBLob0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=CD2chjh4F0g1ixXJ92Y61fzXJeZPiSJ0ntp5syN1gtliB8CGqvTi73npitBBUD0Fq
 5E/adSzp5cXmECkYqryY8YfPz5PWMKx84LqpNaK/Mxei0p5ccHn3XPtxvlKins2dpQ
 qC0LhkqLuq71Sp+U70+zFL6jMZjg8nMPLmM7Zn7tPwz6XT/KKKauETf4Tf92iYNvM9
 oyrv2i7EYaMMj4Vz/sHVUCEk1azaUvGA//pZXr/CxHP3TMCtXf8Ghbp13eSZoC1mGY
 Av1mPEmXd1QZv8eocG8qf3NI2ZAbXss321f831zDxqdvUUe8Ml5sjex0t6Sw/y2gEa
 uV7zIIipmL5Zw==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] amd/display: add cursor check for YUV primary plane
Message-ID: <GKIJ9isuno0PKWRz4qj5CSIfRao35EWMYjtLGdiDIk@cp3-web-020.plabs.ch>
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

The cursor plane can't be displayed if the primary plane isn't
using an RGB format. Reject such atomic commits so that user-space
can have a fallback instead of an invisible cursor.

In theory we could support YUV if the cursor is also YUV, but at the
moment only ARGB8888 cursors are supported.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4548b779bbce..f659e6cfdfcf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9239,6 +9239,13 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 		return -EINVAL;
 	}
 
+	/* In theory we could probably support YUV cursors when the primary
+	 * plane uses a YUV format, but there's no use-case for it yet. */
+	if (new_primary_state->fb && new_primary_state->fb->format->is_yuv) {
+		drm_dbg_atomic(crtc->dev, "Cursor plane can't be used with YUV primary plane\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.30.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
