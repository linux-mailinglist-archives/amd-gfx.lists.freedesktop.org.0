Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4146314A33
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 09:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1436ECE3;
	Tue,  9 Feb 2021 08:02:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD06EA59
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 23:40:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaYKZ31lxi+v/8lDx/PzN0snLjXGzst/bmDy9AJQeZU=;
 b=rhwZ0Mqb8a7z2WMf6VOkI5y5lDQDiyJKp/UdQN3nCUK8wtvzwENpHeFziLcWxg8YYZ0Lik
 fyNNH35Way1hzad+nKRnbxAakEDmR/g/0r7WB1nFGEo5aFxjbYTawpflrX6sVzE1qbtXU8
 VQ7+o/9Ir4hVunkxdcHAQid9yzXi3TftTcqSPD/DoaBj40MlYO/EaAGEsQvMvhlbGf8g+G
 muetb+xAy56VhwFWMU17YF9uxBHSwshyT6hdchyBu4PRq1OT7ckgyeR0jtnY0EowWVS/ar
 qH1QRRkZ7GL1kuYQ1KZZTEih7mYZpCYPdVFEX7VBLAk18Zh66mQonzwdRtv/Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaYKZ31lxi+v/8lDx/PzN0snLjXGzst/bmDy9AJQeZU=;
 b=ro8ogVDC2xPL/MuSFS4WBbLHj6O8a4ArfECTBJLH1blWrF9/WecsqiAVSo7SHggdRBjyi6
 uqrJuDLbzAoXqHAg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: Replace in_task() in gfx_v8_0_parse_sq_irq()
Date: Tue,  9 Feb 2021 00:31:19 +0100
Message-Id: <20210208233119.391103-5-bigeasy@linutronix.de>
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

gfx_v8_0_parse_sq_irq() is using in_task() to distinguish if it is
invoked from a workqueue worker or directly from the interrupt handler.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

gfx_v8_0_parse_sq_irq() is invoked directly either from a worker or from
the interrupt service routine. The worker is only bypassed if the worker
is already busy.

Add an argument `from_wq' to gfx_v8_0_parse_sq_irq() which is true if
invoked from the worker.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Side note: work_pending() will return false _before_ the callback
function (gfx_v8_0_sq_irq_work_func() in case) is invoked. That means if
the interrupt can fire again before the workqueue completed then it is
possible with the right timing to have `gfx.sq_work.ih_data'
overwritten from the previous invocation.

 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 37639214cbbbd..8a5a7ecb9fa2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6719,7 +6719,8 @@ static int gfx_v8_0_cp_ecc_error_irq(struct amdgpu_device *adev,
 	return 0;
 }
 
-static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data)
+static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data,
+				  bool from_wq)
 {
 	u32 enc, se_id, sh_id, cu_id;
 	char type[20];
@@ -6757,7 +6758,7 @@ static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data)
 			 * or from BH in which case we can access SQ_EDC_INFO
 			 * instance
 			 */
-			if (in_task()) {
+			if (from_wq == true) {
 				mutex_lock(&adev->grbm_idx_mutex);
 				gfx_v8_0_select_se_sh(adev, se_id, sh_id, cu_id);
 
@@ -6795,7 +6796,7 @@ static void gfx_v8_0_sq_irq_work_func(struct work_struct *work)
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device, gfx.sq_work.work);
 	struct sq_work *sq_work = container_of(work, struct sq_work, work);
 
-	gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data);
+	gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data, true);
 }
 
 static int gfx_v8_0_sq_irq(struct amdgpu_device *adev,
@@ -6810,7 +6811,7 @@ static int gfx_v8_0_sq_irq(struct amdgpu_device *adev,
 	 * just print whatever info is possible directly from the ISR.
 	 */
 	if (work_pending(&adev->gfx.sq_work.work)) {
-		gfx_v8_0_parse_sq_irq(adev, ih_data);
+		gfx_v8_0_parse_sq_irq(adev, ih_data, false);
 	} else {
 		adev->gfx.sq_work.ih_data = ih_data;
 		schedule_work(&adev->gfx.sq_work.work);
-- 
2.30.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
