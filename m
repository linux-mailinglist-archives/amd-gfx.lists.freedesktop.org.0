Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AF314A4D
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 09:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5EA6ECE4;
	Tue,  9 Feb 2021 08:03:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D251F6EA51
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 23:40:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33sH3/UZpMRcKWt+g6f41VNp414fidjb3FGmGQx0AxI=;
 b=fkHiWVeQ3xWC/oaKat9Ve+8eyF/yPRRr1ymM1C2M319vFPgCwg7VB//I0vGiokAYO+qoha
 AZOCG/4EIYqh5H7ja9K6sD2TCo3Pu7g0OCseOogbkxwHIXVdWyB8m7/akOjpi60fEYbHd9
 FU7miCu4BoNWR4TBAxFbRUacPUoXwsr5KzstShL6DyBq6CaZwvJuVC/WTQA9RZtzhbQdUd
 NFPXTRI3yOyx0Sye46xT3cYkLuFAedbDgzF+cNlcBdnG+Tw4SBMrRKSJ3SGPte6K5rezUC
 87xe/CdRCKS2JVdLgBHerGVcYPRkeioOHLgBXPTSU6DQOD6BF4svNaV/mO47nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33sH3/UZpMRcKWt+g6f41VNp414fidjb3FGmGQx0AxI=;
 b=vD83EzYdORF90Vhjty6jdLbYAjYv5DkD0em4rftcx5yufJ7/xty+MoC0Txo/aC4MkDAcy/
 EPSiNNRTUTKwYECQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amdgpu: Remove in_interrupt() usage in
 gfx_v9_0_kiq_read_clock()
Date: Tue,  9 Feb 2021 00:31:18 +0100
Message-Id: <20210208233119.391103-4-bigeasy@linutronix.de>
In-Reply-To: <20210208233119.391103-1-bigeasy@linutronix.de>
References: <20210208233119.391103-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 08:02:59 +0000
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
 amd-gfx@lists.freedesktop.org, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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
