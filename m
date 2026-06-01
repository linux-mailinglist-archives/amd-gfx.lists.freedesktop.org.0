Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB9kFCiFHmqhkQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009596299FA
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88D10ECB0;
	Tue,  2 Jun 2026 07:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=theesfeld.net header.i=@theesfeld.net header.b="N23YkX00";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A2D10E8EF;
 Mon,  1 Jun 2026 19:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theesfeld.net;
 s=protonmail2; t=1780343717; x=1780602917;
 bh=i5q6iyFTLtGZwAyQzskDa+UIgmFftyxv9qY3L/cfpX8=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=N23YkX00yFQSbqS9JbTZfcrjGpXrbY1qAJaobCIP0PT82buagoPDd/ZtTBRO0PrWy
 QRyLqWJXWVvrvp4WB74iGrvOxHJVuf4CNBfEUPNxIamMe6qR3pKzn50QabDTBc4Rwd
 bmXCAE1beNpaQYWGSA08v9nfxugiIHoTLTfbSmhitgUsZGYwPd/yNIoxDdqidRyV7v
 b8SPpNBZHbtpQkRvQp6l3O8FTdCIWPcRsFZQ2r75lciJu0CZNbqsHvzlbdqKvhfyS+
 ks/1v0eycTOqsGZRyu6rAoFAwNL+mid7cnEoELmKI7GP1ifryXP8gb11/MPG1CTTmI
 YUI9tPokCXbhg==
X-Pm-Submission-Id: 4gTl736RV8z2ScPK
From: William Theesfeld <william@theesfeld.net>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: convert CRIU event-private allocation to
 kvcalloc()
Date: Mon,  1 Jun 2026 15:55:10 -0400
Message-ID: <20260601195510.639318-1-william@theesfeld.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[theesfeld.net,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[theesfeld.net:s=protonmail2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[william@theesfeld.net,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[theesfeld.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,theesfeld.net:email,theesfeld.net:mid,theesfeld.net:dkim]
X-Rspamd-Queue-Id: 009596299FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

criu_checkpoint_events() allocates the ev_privs[] array, sized by the
runtime count returned from kfd_get_num_events(), using the open-coded
kvzalloc(n * sizeof(*p), ...) form.  Switch to kvcalloc(), which
carries the same zero-on-allocation semantics and adds the standard
size_mul overflow check on the n * sizeof multiplication.

No functional change.

Signed-off-by: William Theesfeld <william@theesfeld.net>
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 44150a71f..9739214e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -543,7 +543,7 @@ int kfd_criu_checkpoint_events(struct kfd_process *p,
 	if (!num_events)
 		return 0;
 
-	ev_privs = kvzalloc(num_events * sizeof(*ev_privs), GFP_KERNEL);
+	ev_privs = kvcalloc(num_events, sizeof(*ev_privs), GFP_KERNEL);
 	if (!ev_privs)
 		return -ENOMEM;
 
-- 
2.54.0

