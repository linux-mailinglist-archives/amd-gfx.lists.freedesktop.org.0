Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 90FQOSaFHmo9kgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0536299E8
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA09110ECB2;
	Tue,  2 Jun 2026 07:24:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jun 2026 05:09:29 UTC
Received: from mail-m9343.xmail.ntesmail.com (mail-m9343.xmail.ntesmail.com
 [103.126.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114D10EBDE
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 05:09:29 +0000 (UTC)
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
 by smtp.qiye.163.com (Hmail) with ESMTP id 40b387ce5;
 Tue, 2 Jun 2026 13:04:23 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, kenneth.feng@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, runyu.xiao@seu.edu.cn, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu/mes12: fix queue init wptr reset
Date: Tue,  2 Jun 2026 13:03:54 +0800
Message-Id: <20260602050354.2237095-3-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602050354.2237095-1-runyu.xiao@seu.edu.cn>
References: <20260602050354.2237095-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e86b7f5ff03a1kunmb7f79aef178c11
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkJJVkIfHkgeTUIdSk5LSVYeHw
 5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
 hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
 b=EWm+v6Wp4FQK2zA0zKjBoe6WZIbg1GLxC77rp9x4rOA7jma/PQApAPonjXeJxRjIhW3h9+rqihkc7+SGMXo1yVBo6927wrOhGwcEyCCxlKvEhEzkzfKzNv/Rrw+/KOWitjp99jh5BGxmwZBKZzz6yV0ZL5HBVbNCjTSOwE4yjFo=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1; 
 bh=D3xcZv25/w2ySOWXApKK8LTp/+QDmMdOM7MaVAFD9Og=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 02 Jun 2026 07:24:17 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:kevinyang.wang@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,seu.edu.cn:email,seu.edu.cn:mid,seu.edu.cn:dkim]
X-Rspamd-Queue-Id: 7C0536299E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mes_v12_0_queue_init() resets ring->wptr_cpu_addr with a plain 32-bit
store in the reset/suspend path even though the same carrier is
accessed with atomic64_set()/atomic64_read() and support_64bit_ptrs is
enabled.

This is not just a missing atomic annotation. The MES queue write
pointer is a shared 64-bit carrier, and *ring->wptr_cpu_addr = 0 only
clears the low 32 bits. A later atomic64_read() can then observe stale
high 32 bits instead of a real zeroed reset state.

Use atomic64_set((atomic64_t *)ring->wptr_cpu_addr, 0) so the reset
path updates the full 64-bit wptr with the same access family as the
existing readers and writers.

Build-tested by compiling mes_v12_0.o.

No AMDGPU hardware was available for end-to-end runtime testing.

Fixes: 785f0f9fe742 ("drm/amdgpu: Add mes v12_0 ip block support (v4)")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index 023c7345e..22ed7bb51 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -1476,7 +1476,7 @@ static int mes_v12_0_queue_init(struct amdgpu_device *adev,
 
 	if ((adev->enable_uni_mes || pipe == AMDGPU_MES_SCHED_PIPE) &&
 	    (amdgpu_in_reset(adev) || adev->in_suspend)) {
-		*(ring->wptr_cpu_addr) = 0;
+		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, 0);
 		*(ring->rptr_cpu_addr) = 0;
 		amdgpu_ring_clear_ring(ring);
 	}
-- 
2.34.1
