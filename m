Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DK2ArcuBGqNFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89D52F268
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E61410ECF3;
	Wed, 13 May 2026 07:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XDBZQvvQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E76A10EC3F;
 Tue, 12 May 2026 21:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjblcfHm/Z46TgcNkCFh3FNOFhzy3el+viI7R4fWfic=; b=XDBZQvvQZws3SRE1omJM096P51
 RRLAQvpZO2SxY65qynXSXj/hDlsZcUkKUbfPU0d6+hpT+42VmHXMCu9Eo2NV07vgvHCMCot4PpEB7
 5yscMFecKaEUZ1HAlkP98z8/dBGz3NN1G6A9Kwz1u7lFTYVe8eL0wXAnA2SsjbfjMhTdANKRcrTJT
 P6xXKhrZg6om2WprwSukWQN/UNG/w4BVwKp+wFu0bkRmarR3uFLpu8GusPJF4eokZDi3JzJJsFJ2q
 w9OPpKT4VXJglHXXs9bYxtkuUXckOszOzFSy2m3ilj2pUV2aQJaSBQVSbo8aYtVTvCPqD0K64iIbC
 ldGl9MYQ==;
Received: from 179-242-241-236.3g.claro.net.br ([179.242.241.236]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMv1r-009frh-Ha; Tue, 12 May 2026 23:52:39 +0200
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
Subject: [PATCH i-g-t 5/8] igt_dmem_driver: add amdgpu support
Date: Tue, 12 May 2026 18:51:52 -0300
Message-ID: <20260512215156.4083082-6-cascardo@igalia.com>
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
X-Rspamd-Queue-Id: AE89D52F268
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
	NEURAL_SPAM(0.00)[0.202];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

Allocate a BO from VRAM domain. That will try to place BOs on VRAM, but may
fallback to GTT. That can still be tracked with dmem.current.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 lib/amdgpu/amd_dmem.c    | 94 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_dmem_driver.h    |  1 +
 lib/meson.build          |  1 +
 tests/drv_dmem_cgroups.c |  6 ++-
 4 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 lib/amdgpu/amd_dmem.c

diff --git a/lib/amdgpu/amd_dmem.c b/lib/amdgpu/amd_dmem.c
new file mode 100644
index 000000000000..1c0825af43b6
--- /dev/null
+++ b/lib/amdgpu/amd_dmem.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Valve Corporation
+ * Authors:
+ *  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
+ */
+
+#include "igt_dmem_driver.h"
+
+#include <errno.h>
+
+#include "igt.h"
+#include "igt_cgroup.h"
+#include "lib/amdgpu/amd_memory.h"
+
+struct amdgpu_dmem_ctx {
+	int fd;
+	amdgpu_device_handle device;
+	amdgpu_bo_handle *handles;
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
+static void amdgpu_dmem_free_vram(void *ctx, int n_bo, size_t len)
+{
+	struct amdgpu_dmem_ctx *actx = ctx;
+	int i;
+	for (i = 0; i < n_bo; i++) {
+		if (actx->handles[i])
+			amdgpu_bo_free(actx->handles[i]);
+	}
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
index 869356fbf2c2..d43e5140d4f6 100644
--- a/lib/igt_dmem_driver.h
+++ b/lib/igt_dmem_driver.h
@@ -20,5 +20,6 @@ struct igt_dmem_driver {
 };
 
 extern const struct igt_dmem_driver xe_dmem_driver;
+extern const struct igt_dmem_driver amdgpu_dmem_driver;
 
 #endif
diff --git a/lib/meson.build b/lib/meson.build
index 269f3b9f0af8..dd02d087875b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -188,6 +188,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_mmd_shared.c',
 		'amdgpu/amd_jpeg_shared.c',
 		'amdgpu/amd_utils.c',
+		'amdgpu/amd_dmem.c',
 		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
diff --git a/tests/drv_dmem_cgroups.c b/tests/drv_dmem_cgroups.c
index 6f4f779f3c2c..0e26b7e2bb9a 100644
--- a/tests/drv_dmem_cgroups.c
+++ b/tests/drv_dmem_cgroups.c
@@ -116,8 +116,9 @@ static int fill_vram(const struct igt_dmem_driver *drv, void *ctx, int fd, int m
 			break;
 	}
 
-	igt_assert_f(err == -ENOMEM || err == -ENOSPC,
-		     "Expected -ENOMEM or -ENOSPC, got %d (%s)\n",
+	/* amdgpu will fallback to GTT if it cannot allocate on VRAM */
+	igt_assert_f(err == -ENOMEM || err == -ENOSPC || err == 0,
+		     "Expected -ENOMEM,-ENOSPC or success, got %d (%s)\n",
 		     err, strerror(-err));
 
 	return n_bo;
@@ -236,6 +237,7 @@ static const struct {
 	const struct igt_dmem_driver *driver;
 } drivers[] = {
 	{ DRIVER_XE, &xe_dmem_driver },
+	{ DRIVER_AMDGPU, &amdgpu_dmem_driver },
 	{ },
 };
 
-- 
2.47.3

