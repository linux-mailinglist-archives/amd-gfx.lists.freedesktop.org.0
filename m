Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zCuZMvyLO2pTZggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073C6BC52B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=e8RpEkEc;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625510EDE6;
	Wed, 24 Jun 2026 07:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0F10E1F5;
 Tue, 23 Jun 2026 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6TVXvKXi2fz4NFUSpDpWa+zkRcGFMS2H8TncLOLuN0w=; b=e8RpEkEcfLyZ/FbgulR4wYdqpe
 Q12uCG9SSR6B6k98EJd5ZjNKXX7JHSPAARzley5T5YRcOeDY9cao5bwJ5fCOeWZvW/ltvVjs1fIgY
 DOaK6mNjkt5anFdkHwjMJtkMKxnM6J1xZIYWJ3kZVri7RCyRtqIJGFeMqklsDJWGOxiJflDStP0ON
 4snlic9LpX96MKWI1pjSvSnuCEM61XmpPIKw+u3Zluhn46KQ2SyxaW3SIQuqGE622c3DKhBvhbp0J
 +RtSWn1s56oQvvlggY1KDurZTcw21tL5SJlAyUT3nt9d10GuAj5Ths5VWs2IAcbPoCnJIn7zD9tkI
 RGIKqOsg==;
Received: from 179-125-64-254-dinamico.pombonet.net.br ([179.125.64.254]
 helo=quatroqueijos.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc5A3-004HEi-1A; Tue, 23 Jun 2026 19:43:47 +0200
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
Subject: [PATCH i-g-t 3/7] lib/xe: add xe_cgroup_region_name() helper
Date: Tue, 23 Jun 2026 14:43:15 -0300
Message-ID: <20260623174319.4138648-4-cascardo@igalia.com>
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,linux.intel.com,gmx.de,igalia.com];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1073C6BC52B

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add xe_cgroup_region_name(fd, region) which constructs the dmem cgroup
region path for a given xe memory region.  The returned string has the
form "drm/<pci-slot>/<region>" (e.g. "drm/0000:03:00.0/vram0"),
matching the name registered by the kernel via drmm_cgroup_register_region().

Only VRAM regions are tracked by the dmem controller; system and stolen
memory regions return NULL.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_query.c | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index f0799f268cf4..192d9566178a 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -7,6 +7,7 @@
  */
 
 #include <fcntl.h>
+#include <limits.h>
 #include <stdlib.h>
 #include <pthread.h>
 
@@ -21,6 +22,7 @@
 
 #include "drmtest.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
 #include "intel_pat.h"
@@ -1290,6 +1292,36 @@ int xe_query_eu_thread_count(int fd, int gt)
 		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 }
 
+/**
+ * xe_cgroup_region_name() - Build the dmem cgroup region name for an xe memory region.
+ * @fd: xe device fd.
+ * @region: Region mask (as used by xe_mem_region(), xe_region_name(), etc.).
+ *
+ * Constructs the full dmem cgroup region path for @region on the device
+ * identified by @fd.  The returned string has the form
+ * ``drm/<pci-slot>/<region>`` (e.g. ``drm/0000:03:00.0/vram0``), matching
+ * the name registered by the kernel driver via drmm_cgroup_register_region().
+ *
+ * Only VRAM regions are registered with the dmem controller; passing a
+ * system-memory region returns %NULL.
+ *
+ * Return: A newly allocated string that the caller must free(), or %NULL if
+ * @region is not tracked by the dmem cgroup controller.
+ */
+char *xe_cgroup_region_name(int fd, uint64_t region)
+{
+	char pci_slot[NAME_MAX];
+	char *name;
+
+	if (xe_region_class(fd, region) != DRM_XE_MEM_REGION_CLASS_VRAM)
+		return NULL;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	igt_assert(asprintf(&name, "drm/%s/%s", pci_slot, xe_region_name(region)) > 0);
+	return name;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 9f04a7422042..a34e9a6592b9 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -205,4 +205,6 @@ void xe_device_put(int fd);
 int xe_query_eu_count(int fd, int gt);
 int xe_query_eu_thread_count(int fd, int gt);
 
+char *xe_cgroup_region_name(int fd, uint64_t region);
+
 #endif	/* XE_QUERY_H */
-- 
2.47.3

