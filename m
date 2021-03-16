Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03A33E0EA
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Mar 2021 22:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544948991E;
	Tue, 16 Mar 2021 21:57:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Tue, 16 Mar 2021 21:57:42 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD388991E
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Mar 2021 21:57:42 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4F0Rmd0Jk4zQjnB;
 Tue, 16 Mar 2021 22:50:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1615931438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZMM5Nz0bJEmnEmHs8BKxtYqUB84F4omsr6yYs6/pIOE=;
 b=vnsnvGqqKtjIoMkASdIufKdscvLenquNxSv92wjYA/lp3t587NywAItO5F302yiehx0Zu4
 FL9YeWbTxl64tYNnq7c/Qp5wyk0AyuL0ABcmpxXpQHxtPmjN/C73xKSVSpAwO8/PdV288v
 /l4wflO1gVU+oTlKUpmlw8Y7wJWcTWAN/EdAmNNTJ+YUX9xZiPSHrcNcEuvsd9d8XJMNth
 mEJd3FHcU73a1bHQ03qREqOQeHYTjpmYL6/XHopXGJbrhE+8XCQDoru6dtB1kjp+sa68Ts
 k+6IlypjZge5i5Sz3Y5ca4JaoF3bMXIKSg9sYzNr4L4CnEB7YJXsgS51VqHDUA==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id KfJpgHP0dEvK; Tue, 16 Mar 2021 22:50:37 +0100 (CET)
From: Sefa Eyeoglu <contact@scrumplex.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: check fb of primary plane
Date: Tue, 16 Mar 2021 22:50:06 +0100
Message-Id: <20210316215006.18769-1-contact@scrumplex.net>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.25 / 15.00 / 15.00
X-Rspamd-Queue-Id: A81D717DF
X-Rspamd-UID: a5b41c
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
Cc: Simon Ser <contact@emersion.fr>, Sefa Eyeoglu <contact@scrumplex.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Sometimes the primary plane might not be initialized (yet), which
causes dm_check_crtc_cursor to divide by zero.
Apparently a weird state before a S3-suspend causes the aforementioned
divide-by-zero error when resuming from S3.  This was explained in
bug 212293 on Bugzilla.

To avoid this divide-by-zero error we check if the primary plane's fb
isn't NULL.  If it's NULL the src_w and src_h attributes will be 0,
which would cause a divide-by-zero.

This fixes Bugzilla report 212293
https://bugzilla.kernel.org/show_bug.cgi?id=212293

Fixes: 12f4849a1cfd69f3 ("drm/amd/display: check cursor scaling")
Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 573cf17262da4e11..fbb1ac223ccbb62a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9267,7 +9267,8 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 
 	new_cursor_state = drm_atomic_get_new_plane_state(state, crtc->cursor);
 	new_primary_state = drm_atomic_get_new_plane_state(state, crtc->primary);
-	if (!new_cursor_state || !new_primary_state || !new_cursor_state->fb) {
+	if (!new_cursor_state || !new_primary_state ||
+		!new_cursor_state->fb || !new_primary_state->fb) {
 		return 0;
 	}
 
-- 
2.31.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
