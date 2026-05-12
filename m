Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A70J7YuBGqQFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A52F260
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6D910ED27;
	Wed, 13 May 2026 07:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pi1M75fy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20F10EC30;
 Tue, 12 May 2026 21:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADRJdd6DbFjFBNsAOqsXMBnIGMV6n0RQ4NYaDHYxWvU=; b=pi1M75fy1SwJNusXRj+XM2itCt
 lYdFM9IV1gc37m9J7YenWyRW9HHMdbYPXbKZSfizOwlq0g7l6AjwsxUT/CWPCx4lPD3fOhYLjVaWE
 BLA4sYmNaodIdDaglDKBV0IANAvdh11Av7ssFcoNZVoXZxiBqzP2NbPuFe+Uzkg6KMryhwGAC6E5j
 Fr7GrLhZLN26aZEkJDEo75LvEKT7H+7a3pjBJ7nN5NA1WYXQhMbQg5UY7exAeWJ+9yCLbR5gJr80Y
 qmsupKVaDretG9OgOC1nntLnbFbB5wnpKdYDFqozs7GOt7V/suc0Z+VWYTNihohT6vIxXDMZ0vyoy
 Hsuocxgw==;
Received: from 179-242-241-236.3g.claro.net.br ([179.242.241.236]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMv27-009frh-Qw; Tue, 12 May 2026 23:52:55 +0200
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
Subject: [PATCH i-g-t 8/8] dmem: get region once per driver
Date: Tue, 12 May 2026 18:51:55 -0300
Message-ID: <20260512215156.4083082-9-cascardo@igalia.com>
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
X-Rspamd-Queue-Id: 51A0A52F260
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
	NEURAL_SPAM(0.00)[0.231];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,igalia.com:mid]
X-Rspamd-Action: no action

It is expected that only the same region is going to be tested for, so
there is no use getting the region name for every test for a given driver.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 tests/drv_dmem_cgroups.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/tests/drv_dmem_cgroups.c b/tests/drv_dmem_cgroups.c
index 0791bb62d3a2..30f9caf3630c 100644
--- a/tests/drv_dmem_cgroups.c
+++ b/tests/drv_dmem_cgroups.c
@@ -124,18 +124,14 @@ static int fill_vram(const struct igt_dmem_driver *drv, void *ctx, int fd, int m
 	return n_bo;
 }
 
-static void test_write_eviction(int fd, unsigned int flags, const struct igt_dmem_driver *drv)
+static void test_write_eviction(int fd, char *cg_region, unsigned int flags, const struct igt_dmem_driver *drv)
 {
 	void *ctx;
 	struct igt_cgroup *cg;
-	char *cg_region;
 	int n_bo = 0, max_bo;
 	uint64_t current, capacity, cg_max, limit, after;
 	int set_err, err;
 
-	cg_region = drv->get_region_name(fd);
-	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
-
 	igt_cgroup_dmem_get_capacity(cg_region, &capacity);
 	igt_require_f(capacity >= 4 * BO_SIZE,
 		      "VRAM capacity (%"PRIu64" MiB) too small to test\n",
@@ -215,7 +211,6 @@ static void test_write_eviction(int fd, unsigned int flags, const struct igt_dme
 	igt_cgroup_dmem_set_max(cg, cg_region, IGT_CGROUP_DMEM_MAX);
 	drv->free_vram(ctx, n_bo, BO_SIZE);
 	drv->deinit(ctx);
-	free(cg_region);
 	igt_cgroup_free(cg);
 }
 
@@ -230,18 +225,14 @@ static int allocate_vram(const struct igt_dmem_driver *drv, void *ctx, int fd, i
 	return err ?: n_bo;
 }
 
-static void test_current(int fd, unsigned int flags, const struct igt_dmem_driver *drv)
+static void test_current(int fd, char *cg_region, unsigned int flags, const struct igt_dmem_driver *drv)
 {
 	struct igt_cgroup *cg;
-	char *cg_region;
 	void *ctx;
 	uint64_t current, capacity, cg_max;
 	int n_bo = 0, max_bo;
 	int err;
 
-	cg_region = drv->get_region_name(fd);
-	igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
-
 	igt_cgroup_dmem_get_capacity(cg_region, &capacity);
 	igt_require_f(capacity >= 4 * BO_SIZE,
 		      "VRAM capacity (%"PRIu64" MiB) too small to test\n",
@@ -339,13 +330,12 @@ static void test_current(int fd, unsigned int flags, const struct igt_dmem_drive
 		     current / SZ_1M, USAGE_SLACK / SZ_1M);
 
 	drv->deinit(ctx);
-	free(cg_region);
 	igt_cgroup_free(cg);
 }
 
 static const struct {
 	const char *name;
-	void (*test_fn)(int fd, unsigned int flags, const struct igt_dmem_driver *drv);
+	void (*test_fn)(int fd, char *cg_region, unsigned int flags, const struct igt_dmem_driver *drv);
 	unsigned int flags;
 } subtests[] = {
 	{ "current", test_current, 0 },
@@ -376,20 +366,24 @@ int igt_main()
 	for (int d = 0; drivers[d].driver; d++) {
 		igt_subtest_group() {
 			int fd = -1;
+			char *cg_region;
 			igt_fixture() {
 				fd = drm_open_driver(drivers[d].driver_flag);
 				igt_require_f(fd >= 0,
 					"No %s device found, skipping\n",
 					drivers[d].driver->name);
+				cg_region = drivers[d].driver->get_region_name(fd);
+				igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
 			}
 
 			for (int i = 0; subtests[i].name; i++)
 				igt_subtest_f("%s-%s", drivers[d].driver->name, subtests[i].name)
-					subtests[i].test_fn(fd, subtests[i].flags, drivers[d].driver);
+					subtests[i].test_fn(fd, cg_region, subtests[i].flags, drivers[d].driver);
 
 			igt_fixture() {
 				if (fd >= 0)
 					drm_close_driver(fd);
+				free(cg_region);
 			}
 		}
 	}
-- 
2.47.3

