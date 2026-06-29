Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GrdEGwNuQ2o8YQoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 09:19:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D46E10E3
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 09:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=npc-ksb.ru (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D48E10EB24;
	Tue, 30 Jun 2026 07:19:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jun 2026 13:15:36 UTC
Received: from mail.ksb-soft.ru (mail.ksb-soft.ru [5.167.76.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48910E8B0;
 Mon, 29 Jun 2026 13:15:36 +0000 (UTC)
Received: from ksb-289.ksb.ksb-soft.ru (unknown [10.38.22.14])
 by mail.ksb-soft.ru (Postfix) with ESMTPA id 4gpmnc6Z7Rz4LK3c;
 Mon, 29 Jun 2026 16:09:08 +0300 (MSK)
From: Markov Gleb <markov.gi@npc-ksb.ru>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Gleb Markov <markov.gi@npc-ksb.ru>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] drm/amd/display: Remove unused-but-set variable hubp from
Date: Mon, 29 Jun 2026 16:09:06 +0300
Message-ID: <20260629130907.124-1-markov.gi@npc-ksb.ru>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 197590 [Oct 29 2025]
X-KLMS-AntiSpam-Version: 6.1.1.11
X-KLMS-AntiSpam-Envelope-From: markov.gi@npc-ksb.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 72 0.3.72
 80ff96170b649fb7ebd1aa4cb544c36c109810bd, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean
X-KLMS-LinksScanning: Clean
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 10.0.0.7427,
 bases: 2025/10/29 20:57:00 #27800623
X-KLMS-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Tue, 30 Jun 2026 07:19:28 +0000
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
X-Spamd-Result: default: False [0.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[npc-ksb.ru : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.freedesktop.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[npc-ksb.ru,amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markov.gi@npc-ksb.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[npc-ksb.ru:email,npc-ksb.ru:mid,npc-ksb.ru:from_mime,lists.freedesktop.org:from_smtp,linuxtesting.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B8D46E10E3

From: Gleb Markov <markov.gi@npc-ksb.ru>

The final check of hubp for NULL covers all remaining lines of code, since
the value of hubp does not change until the end of the method.

This check is redundant because hubp1 is already dereferenced within the
macro.
If it were NULL, the program would have already failed to proceed.

Remove the left part of the expression with the logical "&&".

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: be1fb44389ca ("drm/amd/display: Check null pointers before used").
Signed-off-by: Gleb Markov <markov.gi@npc-ksb.ru>
---
 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
index 7c97a774141f..d8eb5996b577 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
@@ -772,8 +772,7 @@ bool hubp1_is_flip_pending(struct hubp *hubp)
 	if (flip_pending)
 		return true;
 
-	if (hubp &&
-	    earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
+	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
 		return true;
 
 	return false;
-- 
2.43.0

