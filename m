Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P8PjNb4uBGqlFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01C52F2B5
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32810ED39;
	Wed, 13 May 2026 07:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RYMod+Du";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DB010E2CC;
 Tue, 12 May 2026 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b6FQv102YJG/DBXe/q1JNY/9jILCUbPys9RlwkPpTO0=; b=RYMod+DuLdl5Lo2QKtFqhbR/7v
 2iN/LEU0PnfQrUb/BIR3ZQAfOjlcmRGFDqnpmV/V9RyPdshypkanK3v3Ljojgva1KxRc5B+Z6kOg8
 A60HyFVTEVVuB0k2IXoc0e2L3PaN+kI4+XKGVjQ/D+px7uVqGg91Z+z7kqwXDjPMHwOvs3z7mUzan
 L3HHzd60o0yqjZjfYCCl8HQ26gsD7gvVoEsmQ578lI/zmPVJJMyYtJWeptelSFA0nkkwVwUG4d4Ny
 AFNb8vrGW0tbMEWvtUGH4r5j0+jo3BYURx4KG8TWKpuOOioYk3xnIWLSBxi+7TR5vWSBu1pI3B6ef
 jTt3f/YQ==;
Received: from 179-242-241-236.3g.claro.net.br ([179.242.241.236]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMv1x-009frh-94; Tue, 12 May 2026 23:52:45 +0200
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
Subject: [PATCH i-g-t 6/8] dmem: add test for current/max
Date: Tue, 12 May 2026 18:51:53 -0300
Message-ID: <20260512215156.4083082-7-cascardo@igalia.com>
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
X-Rspamd-Queue-Id: 8A01C52F2B5
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
	NEURAL_SPAM(0.00)[0.200];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,igalia.com:mid]
X-Rspamd-Action: no action

Add a test that checks for current usage after VRAM allocation and release.
Set max to different values and track that current usage is not above max,
given some slack.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 tests/drv_dmem_cgroups.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/tests/drv_dmem_cgroups.c b/tests/drv_dmem_cgroups.c
index 0e26b7e2bb9a..43331117854c 100644
--- a/tests/drv_dmem_cgroups.c
+++ b/tests/drv_dmem_cgroups.c
@@ -223,12 +223,142 @@ static void test_write_eviction(int fd, unsigned int flags, const struct igt_dme
 	igt_cgroup_free(cg);
 }
 
+static int allocate_vram(const struct igt_dmem_driver *drv, void *ctx, int fd, int max_bo, size_t len)
+{
+	int n_bo, err = 0;
+	for (n_bo = 0; n_bo < max_bo; n_bo++) {
+		err = drv->allocate_vram(ctx, n_bo, len);
+		if (err)
+			break;
+	}
+	return err ?: n_bo;
+}
+
+static void test_current(int fd, unsigned int flags, const struct igt_dmem_driver *drv)
+{
+	struct igt_cgroup *cg;
+	char *cg_region;
+	void *ctx;
+	uint64_t current, capacity, cg_max;
+	int n_bo = 0, max_bo;
+	int err;
+
+	cg_region = drv->get_region_name(fd);
+	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
+
+	/* Check dmem cgroup controller is available before doing anything else */
+	igt_require_f(igt_cgroup_dmem_available(),
+		      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
+
+	igt_cgroup_dmem_get_capacity(cg_region, &capacity);
+	igt_require_f(capacity >= 4 * BO_SIZE,
+		      "VRAM capacity (%"PRIu64" MiB) too small to test\n",
+		      capacity / SZ_1M);
+
+	/*
+	 * Use up to 4 GiB, or the full capacity if the device has less.
+	 * Leave one BO_SIZE worth of headroom so the device isn't completely
+	 * exhausted before the cgroup limit is hit.
+	 */
+	cg_max = min(MAX_LIMIT, capacity - BO_SIZE);
+	cg_max = ALIGN_DOWN(cg_max, EVICT_STEP);
+
+	if (flags & TEST_INTERRUPTIBLE)
+		install_sigcont_counter();
+
+	/* Create cgroup and move into it */
+	cg = igt_cgroup_new("igt_cgroups_test");
+	igt_cgroup_move_current(cg);
+
+	max_bo = cg_max / BO_SIZE;
+
+	err = drv->init(&ctx, fd, max_bo);
+	igt_assert_f(!err, "Failed to initialize driver");
+
+	n_bo = allocate_vram(drv, ctx, fd, max_bo, BO_SIZE);
+	igt_assert_f(n_bo > 0, "failed to allocate VRAM\n");
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After fill: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < cg_max + USAGE_SLACK && current > cg_max - USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin of allocation (%"PRIu64" MiB)\n",
+		     current / SZ_1M, cg_max / SZ_1M);
+
+	drv->free_vram(ctx, n_bo, BO_SIZE);
+	sleep(1);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After free: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin (%d MiB)\n",
+		     current / SZ_1M, USAGE_SLACK / SZ_1M);
+
+	igt_cgroup_dmem_set_max(cg, cg_region, 2 * BO_SIZE);
+
+	n_bo = allocate_vram(drv, ctx, fd, max_bo, BO_SIZE);
+	igt_assert_f(n_bo > 0, "failed to allocate VRAM\n");
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After fill: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < 2 * BO_SIZE + USAGE_SLACK && current > 2 * BO_SIZE - USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin of allocation (%"PRIu64" MiB)\n",
+		     current / SZ_1M, cg_max / SZ_1M);
+
+	drv->free_vram(ctx, n_bo, BO_SIZE);
+	sleep(1);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After free: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin (%d MiB)\n",
+		     current / SZ_1M, USAGE_SLACK / SZ_1M);
+
+	igt_cgroup_dmem_set_max(cg, cg_region, 0);
+
+	n_bo = allocate_vram(drv, ctx, fd, max_bo, BO_SIZE);
+	igt_assert_f(n_bo != -ENOMEM, "VRAM allocation succeeded despite max set to 0\n");
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After fill: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin\n",
+		     current / SZ_1M);
+
+	if (n_bo > 0)
+		drv->free_vram(ctx, n_bo, BO_SIZE);
+	sleep(1);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After free: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin (%d MiB)\n",
+		     current / SZ_1M, USAGE_SLACK / SZ_1M);
+
+	drv->deinit(ctx);
+	free(cg_region);
+	igt_cgroup_free(cg);
+}
+
 static const struct {
 	const char *name;
+	void (*test_fn)(int fd, unsigned int flags, const struct igt_dmem_driver *drv);
 	unsigned int flags;
 } subtests[] = {
-	{ "write_eviction",		0 },
-	{ "write_eviction_interruptible",	TEST_INTERRUPTIBLE },
+	{ "current", test_current, 0 },
+	{ "write_eviction", test_write_eviction, 0 },
+	{ "write_eviction_interruptible", test_write_eviction, TEST_INTERRUPTIBLE },
 	{ }
 };
 
@@ -259,7 +389,7 @@ int igt_main()
 
 			for (int i = 0; subtests[i].name; i++)
 				igt_subtest_f("%s-%s", drivers[d].driver->name, subtests[i].name)
-					test_write_eviction(fd, subtests[i].flags, drivers[d].driver);
+					subtests[i].test_fn(fd, subtests[i].flags, drivers[d].driver);
 
 			igt_fixture() {
 				if (fd >= 0)
-- 
2.47.3

