Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF519075D
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2020 09:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8622D6E484;
	Tue, 24 Mar 2020 08:14:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A2D6E43B
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:13 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id q73so8424211qvq.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMKo6LdkFYCdsPHJF0fYulYQYBiJ803wxyfJC3f+mbw=;
 b=Nj1g0jZSQ0AczJrww7hWZY8r8tpap5CLTIvsn2yaRNNdxslEPOg+842Vn6LrtGd1tg
 HtjjeNAsCQRHtcZtHJpW4DXurPnEed+4T4vGiYe3PnvJn4L94pHllJ37TuOIUV401H5D
 94+36Td+rsulGU9kB7n1AAPV9NeNloGJsjC3xcK0nD7e6Y7t/TP6ON81j2BxPu1HyFcn
 EuaU5WtR5iSqz1oi81pzB0K/Iol09/AusYChyigO43dlEyf9VGWdYvMdcOvoznq37TSm
 ntW3K0awqVSSmHN4B+Ru6FQks+LZvBmMAGtITUgvEeLCQyOaQD9tzUdnK65nwuY5YgUu
 Qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMKo6LdkFYCdsPHJF0fYulYQYBiJ803wxyfJC3f+mbw=;
 b=DgmU1u7rFvkm2F4JrBfqe72EF+x9ejs7U9/+ZtIWh/tQ8ie7GJbsoiWGhtnMjKHt/L
 DPKWAtjSEZjAbO0U+9Mwn4s62TbQ1enO0u99CY1LMa3s1cv/qIRKwDYej9b1LWJljsxH
 kREw/Eni6YtlsCIR5f340D+32Rapb4PhBrWJMSuFjRAZszpTrCDp8DxLSRt1mKglOtjA
 3YuRI/d5E1gGccdSGixVNX1BxwSY7S85t8r2InsUAK6GDUDTAyd2TtpMIVSsX0Jte5NI
 WDwLEMpc35nqy+27yQJ2IAa1hBkoczJCVuQ4ZdJWKcv6s3PLxoTpS/uGNBD9tn6K3xja
 tAJg==
X-Gm-Message-State: ANhLgQ2WmJn9ZDKHxMC3JoTx+d8yGmtlxpNDCURcY7a3Uez9RJLq8Mhd
 6KVCHmd2wjsrDppzF5zctpMkwQ==
X-Google-Smtp-Source: ADFU+vs1SPcubDDYu/nEfYMoed2J0S2bdq7cYi/3vm2e/mEXWMX5+97u67uWczDe8pro/1SWHnVy6A==
X-Received: by 2002:ad4:4a89:: with SMTP id h9mr23410432qvx.168.1585012513012; 
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n4sm12902832qti.55.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000r6-72; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 4/9] mm/hmm: remove HMM_FAULT_SNAPSHOT
Date: Mon, 23 Mar 2020 22:14:52 -0300
Message-Id: <20200324011457.2817-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324011457.2817-1-jgg@ziepe.ca>
References: <20200324011457.2817-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:14:14 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Now that flags are handled on a fine-grained per-page basis this global
flag is redundant and has a confusing overlap with the pfn_flags_mask and
default_flags.

Normalize the HMM_FAULT_SNAPSHOT behavior into one place. Callers needing
the SNAPSHOT behavior should set a pfn_flags_mask and default_flags that
always results in a cleared HMM_PFN_VALID. Then no pages will be faulted,
and HMM_FAULT_SNAPSHOT is not a special flow that overrides the masking
mechanism.

As this is the last flag, also remove the flags argument. If future flags
are needed they can be part of the struct hmm_range function arguments.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 Documentation/vm/hmm.rst                | 12 +++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  2 +-
 include/linux/hmm.h                     |  5 +----
 mm/hmm.c                                | 22 ++++++++++++++--------
 5 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 95fec596836262..4e3e9362afeb10 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -161,13 +161,11 @@ device must complete the update before the driver callback returns.
 When the device driver wants to populate a range of virtual addresses, it can
 use::
 
-  long hmm_range_fault(struct hmm_range *range, unsigned int flags);
+  long hmm_range_fault(struct hmm_range *range);
 
-With the HMM_RANGE_SNAPSHOT flag, it will only fetch present CPU page table
-entries and will not trigger a page fault on missing or non-present entries.
-Without that flag, it does trigger a page fault on missing or read-only entries
-if write access is requested (see below). Page faults use the generic mm page
-fault code path just like a CPU page fault.
+It will trigger a page fault on missing or read-only entries if write access is
+requested (see below). Page faults use the generic mm page fault code path just
+like a CPU page fault.
 
 Both functions copy CPU page table entries into their pfns array argument. Each
 entry in that array corresponds to an address in the virtual range. HMM
@@ -197,7 +195,7 @@ The usage pattern is::
  again:
       range.notifier_seq = mmu_interval_read_begin(&interval_sub);
       down_read(&mm->mmap_sem);
-      ret = hmm_range_fault(&range, HMM_RANGE_SNAPSHOT);
+      ret = hmm_range_fault(&range);
       if (ret) {
           up_read(&mm->mmap_sem);
           if (ret == -EBUSY)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 90821ce5e6cad0..c520290709371b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -856,7 +856,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	range->notifier_seq = mmu_interval_read_begin(&bo->notifier);
 
 	down_read(&mm->mmap_sem);
-	r = hmm_range_fault(range, 0);
+	r = hmm_range_fault(range);
 	up_read(&mm->mmap_sem);
 	if (unlikely(r <= 0)) {
 		/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 39c731a99937c6..e3797b2d4d1759 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -540,7 +540,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		range.default_flags = 0;
 		range.pfn_flags_mask = -1UL;
 		down_read(&mm->mmap_sem);
-		ret = hmm_range_fault(&range, 0);
+		ret = hmm_range_fault(&range);
 		up_read(&mm->mmap_sem);
 		if (ret <= 0) {
 			if (ret == 0 || ret == -EBUSY)
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index daee6508a3f609..7475051100c782 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -117,13 +117,10 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
 	return pfn_to_page(entry >> range->pfn_shift);
 }
 
-/* Don't fault in missing PTEs, just snapshot the current state. */
-#define HMM_FAULT_SNAPSHOT		(1 << 1)
-
 /*
  * Please see Documentation/vm/hmm.rst for how to use the range API.
  */
-long hmm_range_fault(struct hmm_range *range, unsigned int flags);
+long hmm_range_fault(struct hmm_range *range);
 
 /*
  * HMM_RANGE_DEFAULT_TIMEOUT - default timeout (ms) when waiting for a range
diff --git a/mm/hmm.c b/mm/hmm.c
index c298c936469bbb..43d107a4d9dec6 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -29,7 +29,6 @@
 struct hmm_vma_walk {
 	struct hmm_range	*range;
 	unsigned long		last;
-	unsigned int		flags;
 };
 
 enum {
@@ -112,9 +111,6 @@ static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 {
 	struct hmm_range *range = hmm_vma_walk->range;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
-		return 0;
-
 	/*
 	 * So we not only consider the individual per page request we also
 	 * consider the default flags requested for the range. The API can
@@ -142,15 +138,27 @@ static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 	return 0;
 }
 
+/*
+ * If the valid flag is masked off, and default_flags doesn't set valid, then
+ * hmm_pte_need_fault() always returns 0.
+ */
+static bool hmm_can_fault(struct hmm_range *range)
+{
+	return ((range->flags[HMM_PFN_VALID] & range->pfn_flags_mask) |
+		range->default_flags) &
+	       range->flags[HMM_PFN_VALID];
+}
+
 static unsigned int
 hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 		     const uint64_t *pfns, unsigned long npages,
 		     uint64_t cpu_flags)
 {
+	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault = 0;
 	unsigned long i;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
+	if (!hmm_can_fault(range))
 		return 0;
 
 	for (i = 0; i < npages; ++i) {
@@ -557,7 +565,6 @@ static const struct mm_walk_ops hmm_walk_ops = {
 /**
  * hmm_range_fault - try to fault some address in a virtual address range
  * @range:	argument structure
- * @flags:	HMM_FAULT_* flags
  *
  * Return: the number of valid pages in range->pfns[] (from range start
  * address), which may be zero.  On error one of the following status codes
@@ -579,12 +586,11 @@ static const struct mm_walk_ops hmm_walk_ops = {
  * On error, for one virtual address in the range, the function will mark the
  * corresponding HMM pfn entry with an error flag.
  */
-long hmm_range_fault(struct hmm_range *range, unsigned int flags)
+long hmm_range_fault(struct hmm_range *range)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
 		.last = range->start,
-		.flags = flags,
 	};
 	struct mm_struct *mm = range->notifier->mm;
 	int ret;
-- 
2.25.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
