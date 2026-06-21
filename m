Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QRd8LIrNN2rTUAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BFF6AAA8F
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=cnMcCRWV;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=163.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C380110E379;
	Sun, 21 Jun 2026 11:39:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jun 2026 06:59:53 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E3110E315;
 Sun, 21 Jun 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pV
 P6CQgOl6PJfaBLS29zEb/z/XnemFReUw+zufw2bGc=; b=cnMcCRWVbzoaaH1dai
 mrC1omVdo7fq995zCgYT7qBR3iKqERJXXz0mM5GeYjRwljmSG1bmctISg0dWMnq8
 3wh7HgGYyvHUuXFlfR7IahLPJ1CNakLCnz+4CkKkwUOdRjdqLKXJRWKD48bBFOxl
 Gx/IApNiDR0KCVZjsevE2rceE=
Received: from localhost.localdomain (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgCn+rpJijdq9U88Dg--.25516S2;
 Sun, 21 Jun 2026 14:52:59 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu/umsch: free UMSCH resources on debug BO allocation
 failure
Date: Sun, 21 Jun 2026 14:52:57 +0800
Message-Id: <20260621065257.3780075-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCn+rpJijdq9U88Dg--.25516S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF13Jr4xWF15uw4xCFy3Jwb_yoW8GrWfpa
 1fJF1aqryUZr17ta4DA3W8XFyfK3y2qFy8CrWYqF9Y9w15Xas5JFy5K342qryDWFZ2yFW2
 qrWDC3yxXF4qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRNyCPUUUUU=
X-Originating-IP: [240e:604:311:e68d:9530:36ba:70d6:a4c4]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxQsdi2o3iktQcAAA3k
X-Mailman-Approved-At: Sun, 21 Jun 2026 11:39:50 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haoxiang_li2024@163.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,163.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59BFF6AAA8F

umsch_mm_init() allocates a writeback slot and a command buffer
BO before allocating the UMSCH debug BO. If the debug BO allocation
fails, the function returns directly without releasing the previously
allocated command buffer BO and writeback slot.

Release the command buffer BO and free the writeback slot on this
failure path to avoid leaking resources during UMSCH initialization.

Fixes: 98a2e3a0d155 ("drm/amdgpu/umsch: add support to capture fw debug log")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index cd707d70a0bf..622cc7320fa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -300,6 +300,10 @@ static int umsch_mm_init(struct amdgpu_device *adev)
 				    &adev->umsch_mm.log_cpu_addr);
 	if (r) {
 		dev_err(adev->dev, "(%d) failed to allocate umsch debug bo\n", r);
+		amdgpu_bo_free_kernel(&adev->umsch_mm.cmd_buf_obj,
+			      &adev->umsch_mm.cmd_buf_gpu_addr,
+			      (void **)&adev->umsch_mm.cmd_buf_ptr);
+		amdgpu_device_wb_free(adev, adev->umsch_mm.wb_index);
 		return r;
 	}
 
-- 
2.25.1

