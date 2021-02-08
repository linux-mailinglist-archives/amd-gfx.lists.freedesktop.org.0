Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A6314A55
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 09:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9956ECE9;
	Tue,  9 Feb 2021 08:03:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 23:40:45 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4A6EA4F
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 23:40:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEa1InnPF5EuT5Iy/fi3GjgUJ0wnNen8cYmBEvVp/GM=;
 b=oDwEv2zHEXe0cK2JE9rm9C6bVtW1akHTc0yquVKBYOEUEc8cjbCkby1WTWBKG9+WP7olpV
 +37fmkl26P2KUXs/pF7B4/SAS2+KOCwVUIHzm2vkWBI8fXTdvgc/paR1zkuPmovFg/Dq6Z
 2tdZCaO6zLNbdMaSNAdbTYzAoPyCDfgrYsjKFUOtBblh9cTN6p0+Wd1895L0qmzDecwaQ4
 q22CDLgH/L8HNaTZ5mjoqnQshTxDVMAMG8rv0AozBDGtepntqFroHebEjTl9I5kfdka6YP
 K+Nib3GRoyW/07VilD0cHnEalLkVPDIT/STHQBt4JLWqLiMTnJSx6lCkMOCB7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEa1InnPF5EuT5Iy/fi3GjgUJ0wnNen8cYmBEvVp/GM=;
 b=SWbEhwIIl3OQ+SwvyxSXLimYxnLJVpazEetOtkOJEl2Hz8HVwFi3TwfiUeEka0lAhwuyU3
 9o80VmPBx150QEBQ==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: Replace in_interrupt() usage in
 gmc_v*_process_interrupt()
Date: Tue,  9 Feb 2021 00:31:17 +0100
Message-Id: <20210208233119.391103-3-bigeasy@linutronix.de>
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

The usage of in_interrupt() in gmc_v*_process_interrupt() is intended to
use a different code path if invoked from the interrupt handler vs
invoked from the workqueue.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

gmc_v*_process_interrupt() is invoked via the ->process() callback
from amdgpu_ih_process() which in turn is invoked either from
amdgpu_irq_handler() (the interrupt handler) or from
amdgpu_irq_handle_*() which is a workqueue.

amdgpu_irq::ih is always processed from the interrupt handler, the other
three struct amdgpu_ih_ring members are processed from a workqueue.

Replace the in_interrupt() check with a comparison against adev->irq.ih.
A similar check is already done to check if the ih pointer is from
ih_soft.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 3b7c6c31fce1f..7b6791d699e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -113,7 +113,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 		/* Delegate it to a different ring if the hardware hasn't
 		 * already done it.
 		 */
-		if (in_interrupt()) {
+		if (entry->ih == &adev->irq.ih) {
 			amdgpu_irq_delegate(adev, entry, 8);
 			return 1;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index aedef9017c4c2..266296be7302d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -486,7 +486,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 		/* Delegate it to a different ring if the hardware hasn't
 		 * already done it.
 		 */
-		if (in_interrupt()) {
+		if (entry->ih == &adev->irq.ih) {
 			amdgpu_irq_delegate(adev, entry, 8);
 			return 1;
 		}
-- 
2.30.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
