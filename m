Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjPhJ4xfR2riXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEA6FF62A
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=rS6IE0DH;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07C10F673;
	Fri,  3 Jul 2026 07:06:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990D10E4E7;
 Thu,  2 Jul 2026 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HAXYzsPcNYY9Q8dQYe8XBPgchSJ1FXkCry5jFDXeHic=; b=rS6IE0DHe0x4Z8dxgn7Wt2oQ+q
 5azPsgzojcn0FuIdaZSVXizcUfiHF+dYZ0jQZJnEi5WqV+2T8UHKCgTNNQJjda3Fnqdbk12yzD8qV
 v0ozrEKN2MUdzfyEE5igDs4oS+EaVXTFbeq4vtzLYITPVi6uxGo8Nk4r2bf+KXdqwgq4/JRi9PJbj
 fc1Hc0KkjGAs8jGXhA0ygtYVnIdU9ysB7eJBN0Dv5AhsIXePcEFQumKIE4i3m63BnilrW7dbprHfd
 oFPO+2kTE9aiFTp9dA7UXWGR12D1HAouErhUViWcFjPtl00Ddoq0EgScbkMYqhteGaM0/VCSVzgtg
 RgBW8a7w==;
Received: from [179.125.94.247] (helo=quatroqueijos.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wfH32-0082Ji-4u; Thu, 02 Jul 2026 15:01:44 +0200
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
Subject: [PATCH i-g-t v3 0/7] add dmem_cgroups test
Date: Thu,  2 Jul 2026 10:00:51 -0300
Message-ID: <20260702130108.1397444-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,lists.freedesktop.org,amd.com,linux.intel.com,gmx.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,igalia.com:mid,igalia.com:from_mime,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ABEA6FF62A

v3 TLDR:
Sending again for fixes when running on top of Xe.

This patchset is based on the work of Thomas Hellström at [1] and a
followup I have submitted at [2]. This is now a v3, since I submitted [6].

With this version, I reverted the order in which to apply the patchsets, as
this one adds the infrastructure and the drivers mechanisms, and a test for
dmem.current and its behavior around dmem.max that is currently supported
in the kernel.

As for the new dmem.max eviction behavior, introduced by [3], it has been
pushed to a branch at [4]. If preferred, I can submit the two patches
independently.

I have run the tests, including the ones that test dmem.max eviction
behavior on a system with a 1GiB VRAM amdgpu card. Rodrigo Siqueira helped
me run it on a Xe system. We have applied the patchset at [3] on top of
current linux origin/master [5], with a fixup for the amdgpu driver.

Now, for the changes since v1 [2]:
- Changed the test name from drv_dmem_cgroups to dmem_cgroups.
- Have system includes before igt ones.
- Documented the current SUBTEST.
- Changed free_vram driver hook to only release a given BO. This allows for
  the eviction trigger by a new allocation added by write_eviction_nonblock
  subtest.
- Changed allocate_vram to keep more state necessary for releasing a single BO.
- Added a global free_vram helper to free all allocated VRAM.

Compared to v3 of [1]:
- I have kept wait_for_usage_drop as release can be lazy and we test for it
  on test_current SUBTEST, but had USAGE_DROP_TIMEOUT_MS be a little
  longer.
- Changed BO_SIZE and EVICT_STEP to allow for more than two eviction steps
  on a 1GiB VRAM system.
- Reduced USAGE_SLACK to avoid false positives, but still allow for some
  page table accounting.

Compared to v2 of this one [6]:

- Ignore -ENOMEM and -ENOSPC when trying to fill VRAM.
- When limiting max memory, allow for some slack, as there might be some
  overhead.
- On Xe, allocate GEM object with no deferred backing, and skip binding.

[1] https://patchwork.freedesktop.org/series/163935/#rev3
[2] https://patchwork.freedesktop.org/series/166496/
[3] https://lore.kernel.org/dri-devel/20260611173301.17473-1-thomas.hellstrom@linux.intel.com/
[4] https://gitlab.freedesktop.org/cascardo/igt-gpu-tools/-/commits/dmem_max?ref_type=heads
[5] 502d801f0ab0 ("Merge tag 'erofs-for-7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs")
[6] https://lore.kernel.org/dri-devel/20260623174319.4138648-1-cascardo@igalia.com/


Thadeu Lima de Souza Cascardo (4):
  lib/xe: Introduce dmem driver and implement Xe support
  lib/amdgpu: add amdgpu_cgroup_region_name
  lib/amdgpu: add amdgpu support to igt_dmem_driver
  tests/dmem_cgroups: add test for dmem.current

Thomas Hellström (3):
  lib/igt_cgroup: add cgroup v2 and dmem controller helpers
  tests/cgroup_dmem: add dmem cgroup controller test
  lib/xe: add xe_cgroup_region_name() helper

 lib/amdgpu/amd_dmem.c   |  99 +++++++
 lib/amdgpu/amd_memory.c |  25 ++
 lib/amdgpu/amd_memory.h |   2 +
 lib/igt.h               |   1 +
 lib/igt_cgroup.c        | 638 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_cgroup.h        |  56 ++++
 lib/igt_dmem_driver.h   |  25 ++
 lib/meson.build         |   3 +
 lib/xe/xe_dmem.c        | 143 +++++++++
 lib/xe/xe_query.c       |  32 ++
 lib/xe/xe_query.h       |   2 +
 tests/cgroup_dmem.c     |  92 ++++++
 tests/dmem_cgroups.c    | 245 +++++++++++++++
 tests/meson.build       |   2 +
 14 files changed, 1365 insertions(+)
 create mode 100644 lib/amdgpu/amd_dmem.c
 create mode 100644 lib/igt_cgroup.c
 create mode 100644 lib/igt_cgroup.h
 create mode 100644 lib/igt_dmem_driver.h
 create mode 100644 lib/xe/xe_dmem.c
 create mode 100644 tests/cgroup_dmem.c
 create mode 100644 tests/dmem_cgroups.c

-- 
2.47.3

