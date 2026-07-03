Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ko8aIGwpSWqKywAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 04 Jul 2026 17:40:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C739707E0D
	for <lists+amd-gfx@lfdr.de>; Sat, 04 Jul 2026 17:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=JvD9OLEG;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEDF10E678;
	Sat,  4 Jul 2026 15:40:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C7010F9B2;
 Fri,  3 Jul 2026 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=alJyYzXPrjrW+fze2BEqVVAidt8/0vL+0wACtUJNxOg=; b=JvD9OLEG7RuXOzzmi63hrMgrXd
 mcn3I7r213toSRGSASXT6rjnafc9o+N6DkMWeYzeRsOCcRiSy3/jLDqxQk7DLwip36IRb0cszZqtT
 ++X0RY4c0MAaRIOqKtbyaDVG8d1d8DEGXkOHJeQaPyELhxxqsJwQuZwy748L0aa3sQY6ShFl2sGYq
 xk1qf0xxI3PdpRB541FfzL319566oxgtwl6QAFozXNrsnAPiopPcbZvPQHNwu07mzT+tlhfa7IxpQ
 Oc/JTSXkbmEHVE9MrJRS7ZzkU/HLFMvTS64aWBy1qLQqSlaS8gVbP8KZThBksn61Q+M2uPjTwvtvG
 8lEu4SOg==;
Received: from [187.43.145.169] (helo=[127.0.0.1])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wfmTq-008fEP-Fb; Sat, 04 Jul 2026 00:35:30 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Fri, 03 Jul 2026 19:30:56 -0300
Subject: [PATCH] drm/amdgpu: update comment for amdgpu_ttm_bo_eviction_valuable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-amdgpu-ttm_mem_evict_first_comment-v1-1-ea160651e4f3@igalia.com>
X-B4-Tracking: v=1; b=H4sIACA4SGoC/yXNQQ6CMBCF4auQWdtkQNKqVzGmgTLgmEwh7WBMC
 Hen6vJbvP9tkCkxZbhVGyR6c+Y5FtSnCsKzixMZHoqhwcaiw7PpZJiW1aiKFxJfJkH9yCmrD7M
 IRTUXizXZ1l1bdFBCS6KRP7+T++PvvPYvCvotw74fXXNG9oYAAAA=
X-Change-ID: 20260703-amdgpu-ttm_mem_evict_first_comment-8601e6479407
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.16-dev-62088
X-Mailman-Approved-At: Sat, 04 Jul 2026 15:40:15 +0000
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C739707E0D

Since commit 3756310e9fe1 ("drm/ttm: Use the LRU walker for eviction"),
ttm_mem_evict_first has been removed and ttm_bo_evict_first does not
call eviction_valuable.

Remove the list of callers from the comment, since that is prone to be
outdated.

While at it, document the function parameters.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 16c060badaee..1e44be64f38d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1477,10 +1477,10 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
  * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
  * object.
  *
- * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
- * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
- * it can find space for a new object and by ttm_bo_force_list_clean() which is
- * used to clean out a memory space.
+ * @bo: The buffer object to evict
+ * @place: the placement we need to make room for
+ *
+ * Return true if eviction is sensible.
  */
 static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)

---
base-commit: 903f8773ee96c5dc5fb9aec65227f39fd3e7a1dc
change-id: 20260703-amdgpu-ttm_mem_evict_first_comment-8601e6479407

Best regards,
--  
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

