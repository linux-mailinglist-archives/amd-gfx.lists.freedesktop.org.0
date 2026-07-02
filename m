Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R+/QGY5fR2rlXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D116FF637
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=EotXi2dl;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712AE10F686;
	Fri,  3 Jul 2026 07:06:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5310F371;
 Thu,  2 Jul 2026 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I6Lp4nixbOv2LqJ07br1/AHEIE91d9ecDtIof3D1v7A=; b=EotXi2dlonnZnC91l5UKlDeAwy
 MgM2ppPEoYywcZs37Z/gn9v5mJEnY7PJ1YM2FiSF5S9BBeU4tcdVIdyHWJ8sZlPp/LhxV3rwSFMmF
 LV/3285uwkA1R5EHOLpv9uuRlAGDMsWH96srXcDim/Enmp8FHQIitpuSMgwBLEtdCm5soCmoKhjSZ
 c7BNxF6GEXA2rDLe9F8Sipzk43XUxAsB51kgRLTPddknSiXRMmL/ISGSq13edRKdB+y00hlV8idB/
 I/0PVzf3P99hKcwXTvzbRWNpF5hB0GXtvLFzdC6W0NjsfzCxmzZUIh93bjFN+GGJBMzRPXIYWq8A2
 Pr/M+jfQ==;
Received: from [179.125.94.247] (helo=quatroqueijos.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wfH3W-0082Ji-Rp; Thu, 02 Jul 2026 15:02:15 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: siqueira@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t v2 5/7] lib/amdgpu: add amdgpu_cgroup_region_name
Date: Thu,  2 Jul 2026 10:00:56 -0300
Message-ID: <20260702130108.1397444-6-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702130108.1397444-1-cascardo@igalia.com>
References: <20260702130108.1397444-1-cascardo@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2026 07:06:48 +0000
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
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[igalia.com,lists.freedesktop.org,amd.com,linux.intel.com,gmx.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:from_mime,igalia.com:email,igalia.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34D116FF637

The amdgpu dmem region name uses its PCI address, just like the one from
Xe, but there is only a single VRAM region.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 lib/amdgpu/amd_memory.c | 25 +++++++++++++++++++++++++
 lib/amdgpu/amd_memory.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 12fe23c65ab2..2da4a8a4baee 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -30,9 +30,11 @@
 #include <amdgpu_drm.h>
 #include <stdio.h>
 #include <string.h>
+#include <limits.h>
 #include <unistd.h>
 #include <sys/mman.h>
 #include <inttypes.h>
+#include "igt_device.h"
 
 /**
  *
@@ -679,6 +681,29 @@ bool virtual_free_memory(void *address, unsigned int size)
 	}
 }
 
+/**
+ * amdgpu_cgroup_region_name() - Build the dmem cgroup region name for an amdgpu.
+ * @fd: amdgpu device fd.
+ *
+ * Constructs the full dmem cgroup region path for VRAM on the device
+ * identified by @fd.  The returned string has the form
+ * ``drm/<pci-slot>/vram`` (e.g. ``drm/0000:03:00.0/vram``), matching
+ * the name registered by the kernel driver via drmm_cgroup_register_region().
+ *
+ * Return: A newly allocated string that the caller must free(), or %NULL if
+ * @region is not tracked by the dmem cgroup controller.
+ */
+char *amdgpu_cgroup_region_name(int fd)
+{
+	char pci_slot[NAME_MAX];
+	char *name;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	igt_assert(asprintf(&name, "drm/%s/vram", pci_slot) > 0);
+	return name;
+}
+
 /**
  * Wait for specific value in memory with timeout
  */
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index e26c85bc4b0a..de169e580c1b 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -105,6 +105,8 @@ void
 bool
 virtual_free_memory(void *address, unsigned int size);
 
+char *amdgpu_cgroup_region_name(int fd);
+
 bool
 wait_on_value(unsigned int *ptr, unsigned int expected);
 #endif
-- 
2.47.3

