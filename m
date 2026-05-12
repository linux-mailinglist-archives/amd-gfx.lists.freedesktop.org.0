Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNBPD78uBGqQFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057C52F2C4
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A0E10ED3B;
	Wed, 13 May 2026 07:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aAB8UQUC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291D010EC43;
 Tue, 12 May 2026 21:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JHPZXGV6WgCNJ/fIPS2bp7NNXMeSFNOJi8f9ZKXQCeQ=; b=aAB8UQUC2Q1A2pQ0W7pI904RM3
 D6c6m/c8qqon8A0aDxWFV3bbgwSu9gpC8RPCXo8y2vpvouEMcADMaBsn/gV+SQqEgU5F1lKGB/4Tg
 fwGmt8GbPNP+jWifpH8QldrtLIQsDUb3Y1xd+OFuO4ikrsaPtj50ft1Lqw7vZdBI/UjfiUvTfXiG+
 AKbO4zgicW+26KUQ/kKZsU5OiWsfso2PpomXZj4vZjggjvMAzmsk4mU5TfDdftrUp5bPOhtq3U2lW
 mt7Df26HObRJI2bvfy2kXIuDJu0ksZYbJ7xD5JWTCmh0mNZBloiAy1FAFxTbsWuZS798HthmV+Cc+
 f0NP35BA==;
Received: from 179-242-241-236.3g.claro.net.br ([179.242.241.236]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMv22-009frh-JN; Tue, 12 May 2026 23:52:50 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Natalie Vock <natalie.vock@gmx.de>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH i-g-t 7/8] dmem: only check for dmem availability once
Date: Tue, 12 May 2026 18:51:54 -0300
Message-ID: <20260512215156.4083082-8-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512215156.4083082-1-cascardo@igalia.com>
References: <20260512215156.4083082-1-cascardo@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 May 2026 07:56:32 +0000
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
X-Rspamd-Queue-Id: 1057C52F2C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,linux.intel.com,gmx.de,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.210];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,igalia.com:mid]
X-Rspamd-Action: no action

While running multiple tests, we only need to check dmem is available at
the beginning.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 tests/drv_dmem_cgroups.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/drv_dmem_cgroups.c b/tests/drv_dmem_cgroups.c
index 43331117854c..0791bb62d3a2 100644
--- a/tests/drv_dmem_cgroups.c
+++ b/tests/drv_dmem_cgroups.c
@@ -133,10 +133,6 @@ static void test_write_eviction(int fd, unsigned int flags, const struct igt_dme
 	uint64_t current, capacity, cg_max, limit, after;
 	int set_err, err;
 
-	/* Check dmem cgroup controller is available before doing anything else */
-	igt_require_f(igt_cgroup_dmem_available(),
-		      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
-
 	cg_region = drv->get_region_name(fd);
 	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
 
@@ -246,10 +242,6 @@ static void test_current(int fd, unsigned int flags, const struct igt_dmem_drive
 	cg_region = drv->get_region_name(fd);
 	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
 
-	/* Check dmem cgroup controller is available before doing anything else */
-	igt_require_f(igt_cgroup_dmem_available(),
-		      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
-
 	igt_cgroup_dmem_get_capacity(cg_region, &capacity);
 	igt_require_f(capacity >= 4 * BO_SIZE,
 		      "VRAM capacity (%"PRIu64" MiB) too small to test\n",
@@ -375,6 +367,10 @@ int igt_main()
 {
 	igt_fixture() {
 		igt_require_f(getuid() == 0, "Test requires root\n");
+		/* Check dmem cgroup controller is available before doing anything else */
+		igt_require_f(igt_cgroup_dmem_available(),
+			      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
+
 	}
 
 	for (int d = 0; drivers[d].driver; d++) {
-- 
2.47.3

