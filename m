Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHcVG/mxKmqZvAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 15:02:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10F867220E
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 15:02:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W2gtE65Z;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224010EEF9;
	Thu, 11 Jun 2026 13:02:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BD710EEF9;
 Thu, 11 Jun 2026 13:02:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EE047443D7;
 Thu, 11 Jun 2026 13:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633081F0089C;
 Thu, 11 Jun 2026 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781182965;
 bh=LaunKh9fq8CcYIKd3nFETlqAjeP/HHTp66QUxPtcxXI=;
 h=From:To:Cc:Subject:Date;
 b=W2gtE65ZxuXJt0Y6NB3AMdDKp/h7quuqkCyq6s16JY+us2X6m349Jk1RquS7Ybgb8
 fLMWdNhu726eIABMj4Gpw9cTSB7wleaJAb297g4+PxVAR2m0QRhJD5rLdbmdMEmSPL
 x+EoTf4IROJpclbqL7KKYgvV0C0YDunCY+Te36R66NgSPe11wSPfXos5tai6QXUZDq
 xleU9fNmDhIX7s7AhW5OQ+YWwoj0MayBE/3EopNztqjLuK/IEyK4nLs6ZkkE0uHN9I
 kV1Y95Glpd0E+mFfByqSDNZN0jJTrcyR1FOdiDWTdMLJb84r2ZcnyXfCvVUf7PzNde
 qUc9q0hiDDp5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amdgpu: lockdep: move temporary mutexes off stack
Date: Thu, 11 Jun 2026 15:02:33 +0200
Message-Id: <20260611130240.3388318-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F10F867220E

From: Arnd Bergmann <arnd@arndb.de>

In randconfig builds, the newly added function frequently exceeds
the limit for stack frames, like:

drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c:84:5: error: stack frame size (1312) exceeds limit (1280) in 'amdgpu_lockdep_init' [-Werror,-Wframe-larger-than]

Change this to use static allocation for the locks to reduce
this at the expense of a slightly larger driver binary.

Fixes: 1d0f5838b126 ("drm/amdgpu: Add lockdep annotations for lock ordering validation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c | 24 ++++++---------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c
index d5d71fd7c70d..cf723c9f9216 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c
@@ -85,13 +85,13 @@ int amdgpu_lockdep_init(void)
 {
 	struct amdgpu_reset_domain *reset_domain = NULL;
 	struct amdgpu_reset_control reset_ctl;
-	struct mutex userq_sch_mutex;
-	struct mutex userq_mutex;
-	struct mutex notifier_lock;
-	struct mutex vram_lock;
-	struct mutex srbm_mutex;
-	struct mutex grbm_idx_mutex;
-	spinlock_t mmio_idx_lock;
+	static DEFINE_MUTEX(userq_sch_mutex);
+	static DEFINE_MUTEX(userq_mutex);
+	static DEFINE_MUTEX(notifier_lock);
+	static DEFINE_MUTEX(vram_lock);
+	static DEFINE_MUTEX(srbm_mutex);
+	static DEFINE_MUTEX(grbm_idx_mutex);
+	static DEFINE_SPINLOCK(mmio_idx_lock);
 	unsigned long flags;
 
 	/*
@@ -102,16 +102,6 @@ int amdgpu_lockdep_init(void)
 	if (!reset_domain)
 		return -ENOMEM;
 
-	/* Initialize dummy locks */
-	mutex_init(&userq_sch_mutex);
-	mutex_init(&userq_mutex);
-	mutex_init(&notifier_lock);
-	mutex_init(&vram_lock);
-	mutex_init(&reset_ctl.reset_lock);
-	mutex_init(&srbm_mutex);
-	mutex_init(&grbm_idx_mutex);
-	spin_lock_init(&mmio_idx_lock);
-
 	/*
 	 * Associate dummy locks with the same class keys used for real
 	 * driver locks. This ensures lockdep connects the ordering learned
-- 
2.39.5

