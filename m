Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPXZElH8r2mmdwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 12:11:13 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6924A095
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 12:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E7410E0E4;
	Tue, 10 Mar 2026 11:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fHUo1Y8f";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55110E0E4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 11:11:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D497600AE;
 Tue, 10 Mar 2026 11:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7745C19423;
 Tue, 10 Mar 2026 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773141068;
 bh=75uQKiEqPk0+2/ZkqrB2GSYPQ3tvBpPthpZBU+7h0pM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fHUo1Y8f7Yz0RV790PAo4vvOobOVzsLqocn8B94SzEnZFbe7JxhcvlED7qrpg7wwD
 2QlYUmzQtKBM5ef/faM38igemKTTI0Do3s8xae0xNSh7tT4y2F8hpLJQnmC1j4bdD1
 uv93OtYi1SvNZuUQBUYU72tI5lua+56UGUV8oVZkb7X5Qy0BUPRLfH/v2ZtupYQ72j
 BDbbY/5loxdHSVFKmRkukCvvpVKCMSXmFkLlCjzNrl8u1FJqWnLQChZZEZS+oj/HhM
 WRicK+fRe6zSOqw0NS5qAMEcXypUq6V0BRk/cOB39atZM6OcE7r4ypRyiRmMdhAEY3
 S2lS56nQS0ISQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.19 068/311] drm/amdgpu: Unlock a mutex before destroying it
Date: Tue, 10 Mar 2026 07:01:55 -0400
Message-ID: <b65146ca288a317d07c91fb04371bce2cdc9aeac.1773140655.git.sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1773140654.git.sashal@kernel.org>
References: <cover.1773140654.git.sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
X-Rspamd-Queue-Id: A1B6924A095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:bvanassche@acm.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,m:sashal@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,lists.freedesktop.org:email]
X-Rspamd-Action: no action

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 5e0bcc7b88bcd081aaae6f481b10d9ab294fcb69 ]

Mutexes must be unlocked before these are destroyed. This has been detected
by the Clang thread-safety analyzer.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Yang Wang <kevinyang.wang@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Fixes: f5e4cc8461c4 ("drm/amdgpu: implement RAS ACA driver framework")
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 270258ba320beb99648dceffb67e86ac76786e55)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index 9b31804491500..3f9b094e93a29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -641,6 +641,7 @@ static void aca_error_fini(struct aca_error *aerr)
 		aca_bank_error_remove(aerr, bank_error);
 
 out_unlock:
+	mutex_unlock(&aerr->lock);
 	mutex_destroy(&aerr->lock);
 }
 
-- 
2.51.0

