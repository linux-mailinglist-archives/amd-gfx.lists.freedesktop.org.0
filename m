Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id euhmBP+LO2ppZggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01096BC53E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=PgJVS6zT;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8210EDE1;
	Wed, 24 Jun 2026 07:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5742010EC27;
 Tue, 23 Jun 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hAGBju10OgBYgAgFcj4hUegXNA4uZMhE2p7sOTTeQgs=; b=PgJVS6zTQO5J81ORv9haF2K23Q
 Ook3ka9/3mzFmPRPVj+fYTVnH5lINNJxeyDGHG0YCFruAyxagp1n+a8Odku2SsWQhEZlYw2VL0di9
 Ml0wGyIaHY8zZtPwBD1MYsOw+WdpQxMbpGtLdqRJHnSJFSzBzMlgbC87SBNXqljhn2xmdXZBt+9GO
 TTEATDAtAo8TR8y/BKENNk5ld0dE67wBSAyFrWzTUO0pHU9sf4ZSYNds4RFgwh2VMVwwzH8xgqUkf
 oB/6k/vBLVCtSNzMMU5RwEIFZIAIOEHTCj0pVoLceKk7RN0vGkC8mNjRHPV+Tk8xk4LkhwE14Y1dE
 sJpWZq0g==;
Received: from 179-125-64-254-dinamico.pombonet.net.br ([179.125.64.254]
 helo=quatroqueijos.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc5AM-004HEi-Sy; Tue, 23 Jun 2026 19:44:07 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel-dev@igalia.com,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH i-g-t 7/7] tests/dmem_cgroups: add test for dmem.current
Date: Tue, 23 Jun 2026 14:43:19 -0300
Message-ID: <20260623174319.4138648-8-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623174319.4138648-1-cascardo@igalia.com>
References: <20260623174319.4138648-1-cascardo@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jun 2026 07:49:12 +0000
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
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,linux.intel.com,gmx.de,igalia.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D01096BC53E

Based on the work of Thomas Hellström to test dmem.max eviction, add a test
for dmem.current usage after allocations and setting dmem.max.

Create a dmem cgroup, allocate close to capacity (or at most 4GiB), check
current usage is within a small slack of the expected allocation.  Then,
set max to a small value and check allocations and current usage are
limited to the max set.  Set max to 0, then check no allocations are
allowed and current usage is also within the slack.  After each allocation,
release memory and check current usage has gone down.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 tests/dmem_cgroups.c | 241 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 242 insertions(+)
 create mode 100644 tests/dmem_cgroups.c

diff --git a/tests/dmem_cgroups.c b/tests/dmem_cgroups.c
new file mode 100644
index 000000000000..e7f05e240729
--- /dev/null
+++ b/tests/dmem_cgroups.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: dmem_cgroups
+ * DESCRIPTION: Tests exercising the dmem cgroup controller on devices.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: cgroup
+ * FUNCTIONALITY: cgroup dmem controller
+ */
+
+#include <errno.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_aux.h"
+#include "igt_cgroup.h"
+#include "igt_dmem_driver.h"
+
+#define BO_SIZE			SZ_64M
+#define MAX_LIMIT		((uint64_t)4 * SZ_1G)
+#define USAGE_SLACK		SZ_4M		/* tolerance above the set max */
+#define USAGE_POLL_MS		10
+#define USAGE_DROP_TIMEOUT_MS	1000
+
+/**
+ * SUBTEST: current
+ * DESCRIPTION:
+ *  Create a dmem cgroup, allocate close to capacity (or at most 4GiB),
+ *  check current usage is within a small slack of the expected allocation.
+ *  Then, set max to a small value and check allocations and current usage
+ *  are limited to the max set.
+ *  Set max to 0, then check no allocations are allowed and current usage
+ *  is also within the slack.
+ *  After each allocation, release memory and check current usage has gone
+ *  down.
+ * REQUIREMENTS: xe or amdgpu device with at least one VRAM region
+ */
+
+static uint64_t wait_for_usage_drop(struct igt_cgroup *cg, const char *region,
+				    uint64_t limit)
+{
+	uint64_t current;
+	unsigned int elapsed = 0;
+
+	do {
+		igt_cgroup_dmem_get_current(cg, region, &current);
+		if (current <= limit)
+			return current;
+		usleep(USAGE_POLL_MS * 1000);
+		elapsed += USAGE_POLL_MS;
+	} while (elapsed < USAGE_DROP_TIMEOUT_MS);
+
+	return current;
+}
+
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
+static void free_vram(const struct igt_dmem_driver *drv, void *ctx, int max_bo)
+{
+	int i;
+	for (i = 0; i < max_bo; i++)
+		drv->free_vram(ctx, i);
+}
+
+static void test_current(int fd, char *cg_region, unsigned int flags, const struct igt_dmem_driver *drv)
+{
+	struct igt_cgroup *cg;
+	void *ctx;
+	uint64_t current, capacity, cg_max;
+	int n_bo = 0, max_bo;
+	int err;
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
+	cg_max = min(MAX_LIMIT, capacity - BO_SIZE - USAGE_SLACK);
+	cg_max = ALIGN_DOWN(cg_max, BO_SIZE);
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
+	free_vram(drv, ctx, n_bo);
+	wait_for_usage_drop(cg, cg_region, USAGE_SLACK);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After free: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin (%d MiB)\n",
+		     current / SZ_1M, USAGE_SLACK / SZ_1M);
+
+	igt_cgroup_dmem_set_max(cg, cg_region, 2 * BO_SIZE, false);
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
+	free_vram(drv, ctx, n_bo);
+	wait_for_usage_drop(cg, cg_region, USAGE_SLACK);
+
+	igt_cgroup_dmem_get_current(cg, cg_region, &current);
+	igt_debug("After free: cgroup current = %"PRIu64" MiB, "
+		  "max = %"PRIu64" MiB\n",
+		  current / SZ_1M, cg_max / SZ_1M);
+	igt_assert_f(current < USAGE_SLACK,
+		     "current usage (%"PRIu64" MiB) is not within margin (%d MiB)\n",
+		     current / SZ_1M, USAGE_SLACK / SZ_1M);
+
+	igt_cgroup_dmem_set_max(cg, cg_region, 0, false);
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
+		free_vram(drv, ctx, n_bo);
+	wait_for_usage_drop(cg, cg_region, USAGE_SLACK);
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
+	igt_cgroup_free(cg);
+}
+
+static const struct {
+	const char *name;
+	void (*test_fn)(int fd, char *cg_region, unsigned int flags, const struct igt_dmem_driver *drv);
+	unsigned int flags;
+} subtests[] = {
+	{ "current", test_current, 0 },
+	{ }
+};
+
+static const struct {
+	int driver_flag;
+	const struct igt_dmem_driver *driver;
+} drivers[] = {
+	{ DRIVER_XE, &xe_dmem_driver },
+	{ DRIVER_AMDGPU, &amdgpu_dmem_driver },
+	{ },
+};
+
+int igt_main()
+{
+	igt_fixture() {
+		igt_require_f(getuid() == 0, "Test requires root\n");
+		/* Check dmem cgroup controller is available before doing anything else */
+		igt_require_f(igt_cgroup_dmem_available(),
+			      "dmem cgroup controller not available (no cgroup v2 or no registered regions)\n");
+
+	}
+
+	for (int d = 0; drivers[d].driver; d++) {
+		igt_subtest_group() {
+			int fd = -1;
+			char *cg_region;
+			igt_fixture() {
+				fd = drm_open_driver(drivers[d].driver_flag);
+				igt_require_f(fd >= 0,
+					"No %s device found, skipping\n",
+					drivers[d].driver->name);
+				cg_region = drivers[d].driver->get_region_name(fd);
+				igt_require_f(cg_region, "Region not tracked by dmem cgroup controller\n");
+			}
+
+			for (int i = 0; subtests[i].name; i++)
+				igt_subtest_f("%s-%s", drivers[d].driver->name, subtests[i].name)
+					subtests[i].test_fn(fd, cg_region, subtests[i].flags, drivers[d].driver);
+
+			igt_fixture() {
+				if (fd >= 0)
+					drm_close_driver(fd);
+				free(cg_region);
+			}
+		}
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 9552a175f825..d5e1130d37b2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -11,6 +11,7 @@ test_progs = [
 	'core_sysfs',
 	'dmabuf',
 	'dmabuf_sync_file',
+	'dmem_cgroups',
 	'device_reset',
 	'dumb_buffer',
 	'drm_buddy',
-- 
2.47.3

