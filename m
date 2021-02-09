Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C331529B
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 16:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AB989CAF;
	Tue,  9 Feb 2021 15:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E126EB09;
 Tue,  9 Feb 2021 12:44:46 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33sH3/UZpMRcKWt+g6f41VNp414fidjb3FGmGQx0AxI=;
 b=rOrP1BW8HyJmjtBVwRn7NhdO5GrgjZhrF7qR4P+Ldw5yVHzF8FU1rltiSOG4zHmR8Y8/Lg
 Wf5i5m+ndg5gEpjuPK8fSkenTgGA9medbxzK+UWSkQr0qn69HKzuiJdzxA+KDC1TaGD1GD
 pRjkLrvMTh8yeflrEFV5EzWygJy5wKyA7vNG/9t/9NKvd85ldzai1z6ZjGZG10NKD0qa1J
 JgS5LX3S3R/RKoV+71C27NjW47ObjytuRe4haS5FdDPNbbAWJOxSccd7+x1vSLfJ5DyKGr
 5YKeGP6xrEZM7+A7+PtYQlify/GMWYQtbCskb30v1vC4VhbN6A59dGZ2Kzt54g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33sH3/UZpMRcKWt+g6f41VNp414fidjb3FGmGQx0AxI=;
 b=uuk/NHdayucFE8w0HQvnNNEWkj4HKDVybqNTRjuworDtZiP8GxAnSf7Gxmjm7rlgFm3avw
 JohVTuCCrQ6xw/DA==
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: Remove in_interrupt() usage in
 gfx_v9_0_kiq_read_clock()
Date: Tue,  9 Feb 2021 13:44:38 +0100
Message-Id: <20210209124439.408140-3-bigeasy@linutronix.de>
In-Reply-To: <20210209124439.408140-1-bigeasy@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 15:22:09 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

gfx_v9_0_get_gpu_clock_counter() acquires a mutex_t lock and is the only
caller of gfx_v9_0_kiq_read_clock().
If it safe to acquire a mutex_t then gfx_v9_0_get_gpu_clock_counter() is
always invoked from preemptible context.

Remove in_interrupt() because it superfluous as it will always return
false.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index ca7e7264926e6..72c319b860a33 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4105,7 +4105,7 @@ static uint64_t gfx_v9_0_kiq_read_clock(struct amdgpu_device *adev)
 	 *
 	 * also don't wait anymore for IRQ context
 	 * */
-	if (r < 1 && (amdgpu_in_reset(adev) || in_interrupt()))
+	if (r < 1 && (amdgpu_in_reset(adev)))
 		goto failed_kiq_read;
 
 	might_sleep();
-- 
2.30.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
