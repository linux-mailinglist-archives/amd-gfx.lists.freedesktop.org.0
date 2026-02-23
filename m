Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g+5RH2hinWlFPQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 09:33:44 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E15183CB7
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 09:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A1110E510;
	Tue, 24 Feb 2026 08:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.b="pgfIbQeA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFECD10E317
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 21:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4fKZK03Xwyzlfl5l;
 Mon, 23 Feb 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received; s=mr01; t=1771883410; x=
 1774475411; bh=rEwFEZTUSl6LNKSqrsL5gdSMoPWPvyg78DBwTRH1PVQ=; b=p
 gfIbQeAy+5YyGWoy7oOAzhTpcaWKtmLjmWz1aRrTQqbETnYm0eLK8xU4JWZeavRI
 LilWDqCIf3MTNAG8MpDKDeNx5nEdmISaHNUEK8DviH0WYYadlQaKX6TKkcm3LT1o
 IpdetU9wS1ab7WpIqjYQmXuhWAmkRhvAHQMitOBAGT+kovelI/ZLN5Wr9mhu6sJ6
 qSOUC/UCTEBtptwzFGkSfZWwvXndWADDlqHiZ/OwoxM0Uu/98obyKlOf4p4tD4k6
 Ud99pgwQtSBnl9aZKsNRmeElKkKfAb/rQ2WtfrFCsDB545lopm3B2nyejw/rsfw0
 BjPc5yxEmVVdC/BxADkVw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id hqStjYzH0P4O; Mon, 23 Feb 2026 21:50:10 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fKZJx2DRhzlfgPY;
 Mon, 23 Feb 2026 21:50:09 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/62] drm/amdgpu: Unlock a mutex before destroying it
Date: Mon, 23 Feb 2026 13:48:55 -0800
Message-ID: <20260223214950.2153735-8-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
In-Reply-To: <20260223214950.2153735-1-bvanassche@acm.org>
References: <20260223214950.2153735-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:26 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:bvanassche@acm.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bvanassche@acm.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,acm.org:mid,acm.org:dkim,acm.org:email,amd.com:email]
X-Rspamd-Queue-Id: 21E15183CB7
X-Rspamd-Action: no action

Mutexes must be unlocked before these are destroyed. This has been detect=
ed
by the Clang thread-safety analyzer.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Yang Wang <kevinyang.wang@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Fixes: f5e4cc8461c4 ("drm/amdgpu: implement RAS ACA driver framework")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_aca.c
index afe5ca81beec..db7858fe0c3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -641,6 +641,7 @@ static void aca_error_fini(struct aca_error *aerr)
 		aca_bank_error_remove(aerr, bank_error);
=20
 out_unlock:
+	mutex_unlock(&aerr->lock);
 	mutex_destroy(&aerr->lock);
 }
=20
