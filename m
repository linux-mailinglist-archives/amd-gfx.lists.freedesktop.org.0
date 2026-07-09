Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WcQ1OlJNT2rBdwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 09:27:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847272DAE5
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 09:27:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=bombadil.20210309 header.b=fJee2e0b;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250510F434;
	Thu,  9 Jul 2026 07:26:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EACA10F37C;
 Thu,  9 Jul 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=shOH7v7tPxVk69OD7clf+CDo5fSlmEBJdPyqsNSj7YU=; b=fJee2e0bEpFV+MeSw3m1kMIhF7
 2p/EvrdeQqYW8h0YJGPzPDjxBXfYEaa/4HWpy7NXiCEjkRwHqaRsKX7miJDcQnoHC1d6wTl7fU/q0
 4g5pWmHi8iILwVgJ3yaHVczqpWOIm4PCXPvIRkF2jYVBNyjq14SLdewJt9ajJc6NI+i94pbW5LlzF
 eP/C13Qyhoc7FRHxhw0eUHZDwdfTcLir0dpCex5mh13uujLQvKeXB5rcSa+gcWU2yylR5crwPCd3V
 jUh9amyxDcVaNEs7yg1eA1GmyRP/jF5ns43+tASm3WJ06arcX9lV3qmskUJDVKpln0sFP7vpFw7wu
 zmWYVPIA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1whhns-000000016X9-3jZc; Thu, 09 Jul 2026 06:00:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: drop kernel-doc for deleted struct fields
Date: Wed,  8 Jul 2026 23:00:07 -0700
Message-ID: <20260709060008.529870-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Jul 2026 07:26:29 +0000
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
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,amd.com,gmail.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,infradead.org:from_mime,infradead.org:email,infradead.org:mid,amd.com:email,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9847272DAE5

3 fields in struct amd_ip_funcs have been deleted, so also delete the
kernel-doc comments for them to avoid warnings:

WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct member 'check_soft_reset' description in 'amd_ip_funcs'
WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct member 'pre_soft_reset' description in 'amd_ip_funcs'
WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct member 'post_soft_reset' description in 'amd_ip_funcs'

Fixes: 947e46eb2fb9 ("drm/amdgpu: Delete check_soft_reset() from amd_ip_funcs")
Fixes: b7500532e12b ("drm/amdgpu: Delete pre/post_soft_reset() from amd_ip_funcs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Timur Kristóf <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org

 drivers/gpu/drm/amd/include/amd_shared.h |    3 ---
 1 file changed, 3 deletions(-)

--- linext-2026-0708.orig/drivers/gpu/drm/amd/include/amd_shared.h
+++ linext-2026-0708/drivers/gpu/drm/amd/include/amd_shared.h
@@ -439,10 +439,7 @@ enum amd_dpm_forced_level;
  * @complete: handles IP specific changes after resume
  * @is_idle: returns current IP block idle status
  * @wait_for_idle: poll for idle
- * @check_soft_reset: check soft reset the IP block
- * @pre_soft_reset: pre soft reset the IP block
  * @soft_reset: soft reset the IP block
- * @post_soft_reset: post soft reset the IP block
  * @set_clockgating_state: enable/disable cg for the IP block
  * @set_powergating_state: enable/disable pg for the IP block
  * @get_clockgating_state: get current clockgating status
