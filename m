Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA90149743
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Jan 2020 19:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70BE6E8E3;
	Sat, 25 Jan 2020 18:47:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dd10814.kasserver.com (dd10814.kasserver.com [85.13.133.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146FB6E8E3
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Jan 2020 18:47:50 +0000 (UTC)
Received: from zeus.ad.home.arpa (p5080FAB5.dip0.t-ipconnect.de
 [80.128.250.181])
 by dd10814.kasserver.com (Postfix) with ESMTPSA id 51EA3120033B;
 Sat, 25 Jan 2020 19:47:48 +0100 (CET)
Date: Sat, 25 Jan 2020 19:47:47 +0100
From: Andreas Messer <andi@bastelmap.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
Subject: [PATCH] drm/radeon: avoid page fault during gpu reset
Message-ID: <20200125184746.GA5668@zeus.ad.home.arpa>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

When backing up a ring, validate pointer to avoid page fault.

When the drivers attempts to handle a gpu lockup, a page fault might occur
during call of radeon_ring_backup() since (*ring->next_rptr_cpu_addr) could
have invalid content:

  [ 3790.348267] radeon 0000:01:00.0: ring 0 stalled for more than 10150msec
  [ 3790.348276] radeon 0000:01:00.0: GPU lockup (current fence id 0x00000000000699e4 last fence id 0x00000000000699f9 on ring 0)
  [ 3791.504484] BUG: unable to handle page fault for address: ffffba5602800ffc
  [ 3791.504485] #PF: supervisor read access in kernel mode
  [ 3791.504486] #PF: error_code(0x0000) - not-present page
  [ 3791.504487] PGD 851d3b067 P4D 851d3b067 PUD 0 
  [ 3791.504488] Oops: 0000 [#1] SMP PTI
  [ 3791.504490] CPU: 5 PID: 268 Comm: kworker/5:1H Tainted: G            E     5.4.8-amesser #3
  [ 3791.504491] Hardware name: Gigabyte Technology Co., Ltd. X170-WS ECC/X170-WS ECC-CF, BIOS F2 06/20/2016
  [ 3791.504507] Workqueue: radeon-crtc radeon_flip_work_func [radeon]
  [ 3791.504520] RIP: 0010:radeon_ring_backup+0xb9/0x130 [radeon]

It seems that my HD7750 enters such a state during thermal shutdown. Here
the kernel message with added debug print and fix:

  [ 2930.783094] radeon 0000:01:00.0: ring 3 stalled for more than 10280msec
  [ 2930.783104] radeon 0000:01:00.0: GPU lockup (current fence id 0x000000000011194b last fence id 0x000000000011196a on ring 3)
  [ 2931.936653] radeon 0000:01:00.0: Bad ptr 0xffffffff [   -1] for backup
  [ 2931.937704] radeon 0000:01:00.0: GPU softreset: 0x00000BFD
  [ 2931.937705] radeon 0000:01:00.0:   GRBM_STATUS               = 0xFFFFFFFF
  [ 2931.937707] radeon 0000:01:00.0:   GRBM_STATUS_SE0           = 0xFFFFFFFF

Signed-off-by: Andreas Messer <andi@bastelmap.de>
---
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 37093cea24c5..bf55a682442a 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -309,6 +309,12 @@ unsigned radeon_ring_backup(struct radeon_device *rdev, struct radeon_ring *ring
 		return 0;
 	}
 
+	/* ptr could be invalid after thermal shutdown */
+	if (ptr >= (ring->ring_size / 4)) {
+		mutex_unlock(&rdev->ring_lock);
+		return 0;
+	}
+
 	size = ring->wptr + (ring->ring_size / 4);
 	size -= ptr;
 	size &= ring->ptr_mask;
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
