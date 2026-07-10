Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HmP5FShDUWr0BQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 21:08:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2773D933
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 21:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i+oSygXn;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451F010F969;
	Fri, 10 Jul 2026 19:08:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD0B10F961
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 19:08:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493e4cccd8dso5492965e9.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 12:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783710486; x=1784315286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zbrYcqmMOcj7F4MQKjHREDeErg/FeYwN50JFqd0IkSY=;
 b=i+oSygXnGIF7RDeABxAQkP++3FoHIFTch2k4T5tASWfc/nrwxSF4WtVOm63zAxRiOR
 M6CfAPmJXFtOVnBmzwKw6ErQ8Y42mfTffwN3yptvyW3a7+dU9WU1/OWiSwekZk9BUy2N
 PCSXsG0HvSaHs04qwaUifTNgdfHXxLl8NKcDbc9RSc/ZwC2uSoQSguSfuQAYDhTZYgbQ
 IOd1KDr9x+d1PzmxmiFjcIEp1XrigVWTNFdNvAMxsh2i+dG6WpgONn84iJtd2jSG/Oea
 E0taIPUosuuvVpTP6dctRaxlZJZxREyJX8t+jw8U83KJWOOJ853Vq20kSpPVAps+1V2o
 Y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783710486; x=1784315286;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zbrYcqmMOcj7F4MQKjHREDeErg/FeYwN50JFqd0IkSY=;
 b=RTJvRSGH54xu84guY7BiZ+HweFN+0O/Z2n0yglC0pSxJx5tSxjZTbPEpZDsebxuHJI
 lWaBm/wdpnGJHXn+cV5cBF3+8Mfy9XR+FdeLa02sTy1ffwi+mzQDqsPUAqGw4iyWc4vb
 hKCKR4XhPwMMSL0Y6kRCJ05jV3qeWCuOzjjV4RFGDgGNu1yPg9RNRoahf0r/qDtNw2c5
 jGtaH/AyRb9weZkwEP9Io2eTkrY7qsKLCsQHstkm59M2iKZfhwU6ZDEFU3s4insYJrJB
 Xk9dbD2NYIS2DNecidBmCeIPD12wrb86mQaBfnuWwu8WW7BC8yH+GnxdvGflMTL9/3MW
 lDyw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqR2UaBksGjzxgwVktqlY/IgKYbbr5bHGo6zYyaScGc9o/DUErfW9nqAKizlOglCDRRDCdS6ztk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf13+su6BIGGHF0xEthZ74UdNc0WGQoXiLM2kIIq+sh3vOHUvv
 PYE7lStq6gHfcPml/9bjMcWzdl3KJoIpHctlIweSswql7ecEtsCnK0b3
X-Gm-Gg: AfdE7clA69n4umiWUUXZuYgxPNLHOmX8sXkS9t4NWhylK1+e8eHG8kW7b4A8viKKPJ2
 4gCGXo13NU/giWIyuNlXb4RkAZIUhw48eD86XquKjx1J3JKNF1b8zgD6GhyeBSlzqVcp2oI8k3y
 xpeaHiC8cDD1b0WwD24ShiiQAP43WDti2OWp/LzyRJNKJERZnTg1/EVtD5sHIynZ0KWqJFuRrul
 ef3QgA0U7UAF8EYtUZJ6r0qpuMJkMBrsRNXF1vtciEniVnOPbfJhxC0af/PGZ1Xm1i3QwvLva/V
 mLQkvL8uDv5Ibqy8bhhWrPwgkaqEcQBvBStjH2SDauDJmY/Y8nm5r6swZ6Lso2fCZJNYNHo/LTA
 vlxeY85s7hGa53dzLOjarzyyIEMS7b/tzFNRBZ6fSvhYj+Ycu7VTP1zUt5IvpyZ4EbsIFAaFg4+
 IBWY6mZzL1o5S1Qy+/wVubWyt50et2NYFWUw9G
X-Received: by 2002:a05:600c:4ece:b0:493:a613:56b2 with SMTP id
 5b1f17b1804b1-493f87d8573mr1160215e9.8.1783710485433; 
 Fri, 10 Jul 2026 12:08:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154f:ec00:aa08:de24:db33:4496])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm55000755e9.6.2026.07.10.12.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 12:08:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 simona@ffwll.ch, matthew.brost@intel.com, nat@pixelcluster.dev,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/ttm: support using drm_exec during eviction v4
Date: Fri, 10 Jul 2026 20:52:51 +0200
Message-ID: <20260710190752.2355-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710190752.2355-1-christian.koenig@amd.com>
References: <20260710190752.2355-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.hellstrom@linux.intel.com,m:dakr@kernel.org,m:ecourtney@nvidia.com,m:simona@ffwll.ch,m:matthew.brost@intel.com,m:nat@pixelcluster.dev,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,nvidia.com,ffwll.ch,intel.com,pixelcluster.dev,gmail.com,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:replyto,amd.com:mid,amd.com:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05A2773D933

Allow specifying a drm_exec object in TTMs operation context which is
used to lock objects during eviction.

This allows to handle deadlocks much more gracefully and with that
avoid returning -ENOMEM on heavily contended domains.

v2: rebased on top of Thomas work
v3: rebased again
v4: adjust to dma_resv changes

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 12 ++++++++----
 include/drm/ttm/ttm_bo.h          |  5 +++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1bdd69643c313..570640ae79d84 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -38,6 +38,7 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_exec.h>
 
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
@@ -839,7 +840,9 @@ static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
 	struct ttm_lru_walk_arg *arg = curs->arg;
 	int ret;
 
-	if (arg->ctx->interruptible)
+	if (arg->ctx->exec)
+		ret = drm_exec_lock_resv(arg->ctx->exec, resv);
+	else if (arg->ctx->interruptible)
 		ret = dma_resv_lock_interruptible(resv, arg->ticket);
 	else
 		ret = dma_resv_lock(resv, arg->ticket);
@@ -853,7 +856,8 @@ static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
 		 * trylocking for this walk.
 		 */
 		arg->ticket = NULL;
-	} else if (ret == -EDEADLK) {
+
+	} else if (!arg->ctx->exec && ret == -EDEADLK) {
 		/* Caller needs to exit the ww transaction. */
 		ret = -ENOSPC;
 	}
@@ -993,8 +997,8 @@ __ttm_bo_lru_cursor_iter(struct ttm_bo_lru_cursor *curs, bool first)
 		if (!ttm_lru_walk_trylock(curs, res->bo->base.resv)) {
 			struct dma_resv *resv;
 
-			if (!arg->ticket || arg->ctx->no_wait_gpu ||
-			    arg->trylock_only) {
+			if ((!arg->ticket || arg->ctx->no_wait_gpu ||
+			     arg->trylock_only) && !arg->ctx->exec) {
 				spin_unlock(lru_lock);
 				continue;
 			}
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index e1221e3be7bda..0ffa84a5caa65 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -186,6 +186,11 @@ struct ttm_operation_ctx {
 	 * @bytes_moved: Statistics on how many bytes have been moved.
 	 */
 	uint64_t bytes_moved;
+	/*
+	 * @exec: optional drm_exec object to use for locking and contention
+	 * handling
+	 */
+	struct drm_exec *exec;
 };
 
 struct ttm_lru_walk;
-- 
2.43.0

