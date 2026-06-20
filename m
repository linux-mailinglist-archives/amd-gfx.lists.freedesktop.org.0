Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x+E5CIvNN2rVUAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57036AAA98
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=Ew2OekyL;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=wanadoo.fr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0A210E372;
	Sun, 21 Jun 2026 11:39:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr
 [80.12.242.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775C510E276;
 Sat, 20 Jun 2026 19:03:51 +0000 (UTC)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPSA
 id b0yqwzd9alGVGb0yqw9nCW; Sat, 20 Jun 2026 21:03:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1781982229;
 bh=Tnzf/9MYbLhRoMLq6dvHjdTcKxmYKFVyOTlXu1yZe5k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Ew2OekyL8uTsQBxLeGyJ/LlvqL1cjFH8Bow26ldviiQkX9Q/ZNjmn07ByMPeELrTT
 UsCIdcryBYHQBcS0LwgFgaNwybqnw9aMrMvW98+GLVP0SbSWqG3csVG/QMiT48Bf8+
 E5hJHgcYSufOO9UoOUgB9saZhP3165/TSEOhavNJzRX3o+/cQ4CSH8lOPbAXiXT7de
 w8weFMji3UvE4PxqFZsxfZrpKuMuDLboveiAzElEUzH8vuntXjAXDXg/jsRlZxewK5
 U3K0/L/g8V29TtU0QLVt3F40H5qaRTvG5mXVt4mkotb3FauiMePD+EkSx/xYQBQxM3
 EDzzek7axzvbw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 21:03:49 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Xiaogang Chen <xiaogang.chen@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/amdkfd: Fix an error handling path in
 amdgpu_amdkfd_get_dmabuf_info()
Date: Sat, 20 Jun 2026 21:03:45 +0200
Message-ID: <44cbc1d12fc00121d40ce793074bc5e1d497c932.1781982199.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.freedesktop.org,lists.linaro.org];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C57036AAA98

If the memory allocation fails, the reference on 'dma_buf' still needs to
be released, as already done in the other error handling path.

Fixes: f54ce9e8cbd3 ("drm/amdkfd: Let driver decide buffer size at AMDKFD_IOC_GET_DMABUF_INFO ioctl")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index c693c508df1a..e1afdad07c43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -603,8 +603,10 @@ int amdgpu_amdkfd_get_dmabuf_info(struct amdgpu_device *adev, int dma_buf_fd,
 		if (*metadata_size <= buffer_size) {
 			*metadata_buffer = kzalloc(*metadata_size, GFP_KERNEL);
 
-			if (!*metadata_buffer)
-				return -ENOMEM;
+			if (!*metadata_buffer) {
+				r = -ENOMEM;
+				goto out_put;
+			}
 
 			r = amdgpu_bo_get_metadata(bo, *metadata_buffer, *metadata_size,
 						   NULL, &metadata_flags);
-- 
2.54.0

