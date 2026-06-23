Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F/VPN/yLO2pUZggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860716BC52E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=G3ZI5ZAi;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5D10EDE9;
	Wed, 24 Jun 2026 07:49:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A0510EC32;
 Tue, 23 Jun 2026 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rH6D0UDy3tjirnyDz22Fi4Yweq1tMGfkVLD2PWyU+pY=; b=G3ZI5ZAiEMO+uB0i5Ps0ckddQu
 g9q2NzCGiE0oBu5Cdqm2mrIkSlgkrMXe2J87fv7Tqyaq4fhOQA+EekrtM9/M74HzHppbaEPE1L1rY
 oXuEmFPNONndEdeNTLc8tEk2CtRTJ8VxMfQwWY+W6z3nUKMiyp9zM8nJ6nv1SbHP9TdFCvJ88D8Nx
 MHF/nOjq30z4aOKABAY96FE+ttj7Tdvgcr4BRzp68YdLLhsEZUl8RBoois44m86LP/N6iaqMzsXU9
 XRYfgahhFvekwN/q8/lj0DiuwXw5VOlqiNkeBeYFI8ufrL6H+j4S2Q87pVbuk+olw3x1vciVcxcGc
 wLVi2I+A==;
Received: from 179-125-64-254-dinamico.pombonet.net.br ([179.125.64.254]
 helo=quatroqueijos.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc5AH-004HEi-Ln; Tue, 23 Jun 2026 19:44:02 +0200
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
Subject: [PATCH i-g-t 6/7] lib/amdgpu: add amdgpu support to igt_dmem_driver
Date: Tue, 23 Jun 2026 14:43:18 -0300
Message-ID: <20260623174319.4138648-7-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623174319.4138648-1-cascardo@igalia.com>
References: <20260623174319.4138648-1-cascardo@igalia.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.99 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,linux.intel.com,gmx.de,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 860716BC52E

This allows dmem cgroups tests to run on top of amdgpu driver, adding
support to allocate and release VRAM memory.

This does this by allocating a BO from VRAM domain, which will try to
place BOs on VRAM, but may fallback to GTT.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 lib/amdgpu/amd_dmem.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dmem_driver.h |  1 +
 lib/meson.build       |  1 +
 3 files changed, 101 insertions(+)
 create mode 100644 lib/amdgpu/amd_dmem.c

diff --git a/lib/amdgpu/amd_dmem.c b/lib/amdgpu/amd_dmem.c
new file mode 100644
index 000000000000..5ff6437dc78a
--- /dev/null
+++ b/lib/amdgpu/amd_dmem.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Valve Corporation
+ * Authors:
+ *  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
+ */
+
+#include <errno.h>
+
+#include "igt.h"
+#include "igt_cgroup.h"
+#include "igt_dmem_driver.h"
+#include "lib/amdgpu/amd_memory.h"
+
+struct amdgpu_dmem_ctx {
+	int fd;
+	amdgpu_device_handle device;
+	amdgpu_bo_handle *handles;
+	int max_bo;
+};
+
+static int amdgpu_dmem_init(void **ctx, int fd, int max_bo)
+{
+	struct amdgpu_dmem_ctx *actx;
+	uint32_t major, minor;
+	int err = -ENOMEM;
+
+	actx = malloc(sizeof(*actx));
+	if (!actx)
+		return -ENOMEM;
+
+	actx->handles = calloc(max_bo, sizeof(actx->handles[0]));
+	if (!actx->handles)
+		goto out;
+
+	actx->max_bo = max_bo;
+
+	err = amdgpu_device_initialize(fd, &major, &minor, &actx->device);
+	if (err)
+		goto out;
+
+	*ctx = actx;
+
+	return 0;
+
+out:
+	if (actx->handles)
+		free(actx->handles);
+	free(actx);
+
+	return err;
+}
+
+static void amdgpu_dmem_deinit(void *ctx)
+{
+	struct amdgpu_dmem_ctx *actx = ctx;
+
+	amdgpu_device_deinitialize(actx->device);
+	free(actx->handles);
+	free(actx);
+}
+
+static int amdgpu_dmem_allocate_vram(void *ctx, int n_bo, size_t len)
+{
+	struct amdgpu_dmem_ctx *actx = ctx;
+	amdgpu_bo_handle handle;
+	int err;
+
+	if (n_bo >= actx->max_bo)
+		return -ENOMEM;
+
+	err = amdgpu_bo_alloc_wrap(actx->device, len, 4096,
+				   AMDGPU_GEM_DOMAIN_VRAM, 0, &handle);
+	if (err)
+		return err;
+
+	actx->handles[n_bo] = handle;
+
+	return 0;
+}
+
+static void amdgpu_dmem_free_vram(void *ctx, int n_bo)
+{
+	struct amdgpu_dmem_ctx *actx = ctx;
+	if (n_bo >= actx->max_bo)
+		return;
+	if (actx->handles[n_bo])
+		amdgpu_bo_free(actx->handles[n_bo]);
+	actx->handles[n_bo] = 0;
+}
+
+const struct igt_dmem_driver amdgpu_dmem_driver = {
+	.name = "amdgpu",
+	.get_region_name = amdgpu_cgroup_region_name,
+	.init = amdgpu_dmem_init,
+	.deinit = amdgpu_dmem_deinit,
+	.allocate_vram = amdgpu_dmem_allocate_vram,
+	.free_vram = amdgpu_dmem_free_vram,
+};
diff --git a/lib/igt_dmem_driver.h b/lib/igt_dmem_driver.h
index 2f4a4673ab16..d34c839740a5 100644
--- a/lib/igt_dmem_driver.h
+++ b/lib/igt_dmem_driver.h
@@ -20,5 +20,6 @@ struct igt_dmem_driver {
 };
 
 extern const struct igt_dmem_driver xe_dmem_driver;
+extern const struct igt_dmem_driver amdgpu_dmem_driver;
 
 #endif
diff --git a/lib/meson.build b/lib/meson.build
index cd7a3805accb..624a858edfea 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -198,6 +198,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_mmd_shared.c',
 		'amdgpu/amd_jpeg_shared.c',
 		'amdgpu/amd_utils.c',
+		'amdgpu/amd_dmem.c',
 		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
-- 
2.47.3

