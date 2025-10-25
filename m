Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC02C0972B
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Oct 2025 18:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C915410E2B2;
	Sat, 25 Oct 2025 16:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lDP8pcZ3";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212610E2B2
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Oct 2025 16:27:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2AF2601E8;
 Sat, 25 Oct 2025 16:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727C8C4CEFF;
 Sat, 25 Oct 2025 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409642;
 bh=VE264P+OydNZRk6EfkVGtbuO77L6Hj+dsXgOCMvVLRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDP8pcZ3vbUWggXGtPSTAgDTOzeMJ+lxFd7pnX3W4OYjPyZwKm/m4qXD4cjgENcu2
 Q1PceB2nMzq80o4wnikBPsvFYNFHrWBGYeYyN4T+kEmo7S7JAmMTyAQz1/DHl/MP43
 WCMZ2viZRe71thVaEG8rLO5nVmklrgODs43ZJnTPKF60XUe05fGmxndBaK9uE/tFRX
 X/oVzuWzEHBjY/jNe2z/bdT1TdsgK/r+gB/fsWy498k6t44oZxvpTb+8cTpnz9BiCP
 ST/sTFkDpZNhX+YTo7N4W1OgF8c6ogEAvlRZlN1rr7IsPJM6hnqkfvaRBYNUFG+lac
 LPAofCcxWLSfg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Eric Huang <jinhuieric.huang@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-6.1] drm/amdkfd: fix vram allocation failure for
 a special case
Date: Sat, 25 Oct 2025 12:00:34 -0400
Message-ID: <20251025160905.3857885-403-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Eric Huang <jinhuieric.huang@amd.com>

[ Upstream commit 93aa919ca05bec544b17ee9a1bfe394ce6c94bd8 ]

When it only allocates vram without va, which is 0, and a
SVM range allocated stays in this range, the vram allocation
returns failure. It should be skipped for this case from
SVM usage check.

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

This is a small, targeted bug fix that prevents erroneous -EADDRINUSE
failures when userspace allocates a VRAM buffer without providing a VA
(i.e., `va_addr == 0`). The change is confined to the KFD ioctl path and
poses minimal regression risk while fixing a real user-visible issue.

What changed
- In `drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:1045`, inside
  `kfd_ioctl_alloc_memory_of_gpu`, the SVM overlap check was amended to
  skip a special case:
  - New guard added at `drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:1071`:
    - `if (!(!args->va_addr && (flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM))
      && interval_tree_iter_first(...)) { ... return -EADDRINUSE; }`
  - Practically, this means the SVM interval-tree overlap check is
    bypassed only when:
    - `args->va_addr == 0` (no VA requested), and
    - `flags` includes `KFD_IOC_ALLOC_MEM_FLAGS_VRAM`.
  - Previously, the overlap check was unconditional, which could falsely
    report “Address already allocated by SVM” when VA is 0 (see the
    surrounding context at
    `drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:1064-1079`).

Why it’s a bug fix
- The commit message accurately describes a failure mode: when
  allocating VRAM-only without a VA (VA=0) and there exists an SVM range
  that falls in that [0, size) range, the ioctl incorrectly returns
  `-EADDRINUSE`. For VRAM-only allocations without a VA, SVM address-
  range conflicts are irrelevant and should not block allocation.
- The code change corrects this by skipping the SVM overlap check for
  that specific case, avoiding a false-positive error.

Safety and scope
- Minimal, localized change: It adds a single conditional guard and
  comment in one function. No ABI or architectural changes.
- Confined to AMD KFD user memory allocation path; does not touch core
  MM, scheduler, or unrelated GPU subsystems.
- Consistency with mapping rules: mapping requires a non-zero VA. In
  `kfd_mem_attach` (called during mapping), mapping with `mem->va == 0`
  is rejected
  (`drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:858-930`, check at
  “if (!va) { ... return -EINVAL; }”). This ensures that skipping the
  SVM check for VA=0 can’t accidentally permit an overlapping SVM GPU-VA
  mapping later: mapping at VA=0 is inherently invalid and denied. Thus
  the change strictly avoids a spurious allocation-time error without
  enabling unsafe mappings.
- Flags behavior matches UAPI: `KFD_IOC_ALLOC_MEM_FLAGS_VRAM` is
  intended for VRAM allocations (`include/uapi/linux/kfd_ioctl.h:407`).
  VRAM-only allocations with VA=0 are valid for certain use cases (e.g.,
  export or CPU-visible VRAM on large BAR), and should not be blocked by
  SVM interval checks.

Stable backport criteria
- Fixes a real bug affecting users (spurious -EADDRINUSE on valid VRAM-
  only allocations).
- Change is small and contained, with clear intent and low regression
  risk.
- No new features or architectural shifts.
- Touches only driver code in a single path
  (`kfd_ioctl_alloc_memory_of_gpu`), no widespread side effects.

Conclusion
- This is a clear, minimal bug fix that prevents erroneous allocation
  failures and aligns with the mapping semantics already enforced
  elsewhere. It is suitable for stable backport.

 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 79ed3be63d0dd..43115a3744694 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1070,7 +1070,12 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	svm_range_list_lock_and_flush_work(&p->svms, current->mm);
 	mutex_lock(&p->svms.lock);
 	mmap_write_unlock(current->mm);
-	if (interval_tree_iter_first(&p->svms.objects,
+
+	/* Skip a special case that allocates VRAM without VA,
+	 * VA will be invalid of 0.
+	 */
+	if (!(!args->va_addr && (flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)) &&
+	    interval_tree_iter_first(&p->svms.objects,
 				     args->va_addr >> PAGE_SHIFT,
 				     (args->va_addr + args->size - 1) >> PAGE_SHIFT)) {
 		pr_err("Address: 0x%llx already allocated by SVM\n",
-- 
2.51.0

