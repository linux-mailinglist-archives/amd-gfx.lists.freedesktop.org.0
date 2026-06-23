Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zCuZMvyLO2pTZggAu9opvQ:T2
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4A6BC52F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=jPvWVO7t;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973EF10EDE3;
	Wed, 24 Jun 2026 07:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F5710EC2E;
 Tue, 23 Jun 2026 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ra3ydhhd2svpXcmD3AEJ8DUtgvzZRCOTCSRW5UaRshw=; b=jPvWVO7t7IQcf1J9ayJUT8UstC
 g19VMFQMiWRyQQOrTc3NmFMR1i2JM6u/DEHhu+Gg2e5ziGnTgRNPSUsuHU93W1GHz/NmsJJdKkn3p
 dMshMrPrQgXifakaWNcewrpXOHym/wgCojWdc4V95gRlh6rzkKP4uI9bNHS8ueNRaIuIh9ZnMWCbj
 8YhrbThdHHHtf8gBIajozp0sB7LGOPpPXdEHpIGORHpsCt911dwkCPxSFazsQWdoMPaBJY5NKO7F1
 1U56QlEZIakxFEfY4XXIGc9tZIwTa8Kw7MF6h9wVE8juQyUhh2U3NJp+m8FKrMDyNNLRWn8mXcLly
 p+RLeCvw==;
Received: from 179-125-64-254-dinamico.pombonet.net.br ([179.125.64.254]
 helo=quatroqueijos.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc59y-004HEi-KP; Tue, 23 Jun 2026 19:43:43 +0200
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
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 2/7] tests/cgroup_dmem: add dmem cgroup controller test
Date: Tue, 23 Jun 2026 14:43:14 -0300
Message-ID: <20260623174319.4138648-3-cascardo@igalia.com>
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
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95F4A6BC52F

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add a test that exercises the cgroup v2 dmem controller interface using
the new igt_cgroup library.

The test uses igt_simple_main and:
  - Skips if no dmem regions are registered (no cgroup v2 or no
   dmem-capable device).
  - Creates a sub-cgroup and moves the test process into it.
  - Enumerates all registered device memory regions and prints their
   capacity, system-wide current usage, per-cgroup current usage, and
   configured min, low and max limits.
  - Destroys the cgroup on completion.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/cgroup_dmem.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 tests/cgroup_dmem.c

diff --git a/tests/cgroup_dmem.c b/tests/cgroup_dmem.c
new file mode 100644
index 000000000000..442c965f9bbf
--- /dev/null
+++ b/tests/cgroup_dmem.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: cgroup dmem
+ * Description: Exercises the cgroup v2 dmem controller interface.  Creates a
+ *              cgroup, moves the process into it, enumerates all dmem regions,
+ *              prints their capacity, system-wide current usage, per-cgroup
+ *              current usage and configured limits, then destroys the cgroup.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: cgroup
+ * Feature: dmem
+ * Test category: uapi
+ */
+
+#include <inttypes.h>
+
+#include "igt.h"
+#include "igt_cgroup.h"
+
+IGT_TEST_DESCRIPTION("Exercises the cgroup v2 dmem controller interface.");
+
+static void fmt_bytes(uint64_t v, char *buf, size_t len)
+{
+	if (v == IGT_CGROUP_DMEM_MAX)
+		snprintf(buf, len, "max");
+	else
+		snprintf(buf, len, "%" PRIu64, v);
+}
+
+int igt_simple_main()
+{
+	struct igt_cgroup *cg;
+	const char *region;
+	char **regions;
+	uint64_t capacity, sys_current, cg_current, min, low, max;
+	char cap_s[32], sys_s[32], cg_s[32];
+	char min_s[32], low_s[32], max_s[32];
+	int i;
+
+	igt_require_f(igt_cgroup_dmem_available(),
+		      "No dmem regions found; is cgroup v2 with the "
+		      "dmem controller available?\n");
+
+	cg = igt_cgroup_new("igt-cgroup-dmem-test");
+	igt_assert_f(cg, "Failed to create cgroup\n");
+
+	igt_cgroup_move_current(cg);
+
+	regions = igt_cgroup_dmem_regions();
+	igt_assert_f(regions, "Failed to enumerate dmem regions\n");
+
+	igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+		 "region", "capacity", "system-current",
+		 "cgroup-current", "min", "low", "max");
+	igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+		 "------", "--------", "--------------",
+		 "--------------", "---", "---", "---");
+
+	for (i = 0; regions[i]; i++) {
+		region = regions[i];
+
+		igt_cgroup_dmem_get_capacity(region, &capacity);
+		fmt_bytes(capacity, cap_s, sizeof(cap_s));
+
+		igt_cgroup_dmem_get_system_current(region, &sys_current);
+		fmt_bytes(sys_current, sys_s, sizeof(sys_s));
+
+		igt_cgroup_dmem_get_current(cg, region, &cg_current);
+		fmt_bytes(cg_current, cg_s, sizeof(cg_s));
+
+		igt_cgroup_dmem_get_min(cg, region, &min);
+		fmt_bytes(min, min_s, sizeof(min_s));
+
+		igt_cgroup_dmem_get_low(cg, region, &low);
+		fmt_bytes(low, low_s, sizeof(low_s));
+
+		igt_cgroup_dmem_get_max(cg, region, &max);
+		fmt_bytes(max, max_s, sizeof(max_s));
+
+		igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+			 region, cap_s, sys_s, cg_s,
+			 min_s, low_s, max_s);
+	}
+
+	igt_cgroup_dmem_regions_free(regions);
+	igt_cgroup_free(cg);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1beddb457f64..9552a175f825 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,4 +1,5 @@
 test_progs = [
+	'cgroup_dmem',
 	'core_auth',
 	'core_debugfs',
 	'core_getclient',
-- 
2.47.3

