Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F618D5A6
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2020 18:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62B36E1CE;
	Fri, 20 Mar 2020 17:21:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA266E1A3
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2020 17:00:13 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x82so4384524vsc.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2020 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QfKkZBnQUXMbgR4f8R4xfhu6bSLBDWJchBJ45k6w/Gs=;
 b=LNxEfQC64b3jC76fcXKgvtSCR4fzjMtcUpvtpsK8q4LD9AtnfXoN4QNK13HeIV+anL
 nNLLy7NJ09/dO6aq9zF0bBZSyQAM26cPstSzeQZ8svB6cQQk8FxLUXzq7fLPQf/xinKT
 uofO33zYheKdUEelBMm0FujVreucBBxbigjUrJzEq7rTXHOu7y68SatzTartv+AJ9CFW
 ym9tIBIE8o0CYEy3G/S9V67xIWKwJ+XBNi8/ZwdhAjMlEi6RVCsM7/MX4DDvS5Urgx64
 +6fbcT5BqvrROCRZUQ6bX9jEpPpYxO+g0PriTru5vss2tC9oBmFHINe8plJ7hA79gDjS
 DSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QfKkZBnQUXMbgR4f8R4xfhu6bSLBDWJchBJ45k6w/Gs=;
 b=GWRo9jz+QSFP+Kk1RD5CXekbk+nBzDzQyywrcXi5ytC6CX72zJ+SvosSkRJlXJd0iJ
 cVOrkp5DBIEi4KpvTDYyIPnUy5plRAC+Xd1oLMk2zK0oAX/rFpftPJN4jBa0m24Ua00y
 bEiU//Si7XvTsubC114DrdXijYTziovHpmjEFKn0AQMxawLFK7JPSzwk8rayr768WGQq
 BXUMTmZOlSGh1zqh2Jd+HSD9bkI3IaMUT86EWjpBm05DNd3KURCHhQ9k8sRoeUYbAqyj
 +4WFK+jYYzTV3Df6pL4rFAlY9Mn64H2PzHurZSRPesJYlg2NjGOEQJzOVHbwtKoA1zVO
 mU2g==
X-Gm-Message-State: ANhLgQ2Pfr3qo7WujT7EjHAwQB/c7fEeFmHkg9TNffewdTj2Xtmk4wwD
 098KRO6S0FHF+0r7H9zM1BUyiLa9CJjn8A==
X-Google-Smtp-Source: ADFU+vsHZRjag+P2fuJIiFKNb4fd+uVwmgwhrUo1SYflZzrZ61HO0TNyRHDWaxWmaqgUP+ahj6sgeA==
X-Received: by 2002:a05:6214:16d1:: with SMTP id
 d17mr9051379qvz.56.1584723025712; 
 Fri, 20 Mar 2020 09:50:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id k66sm4665995qke.10.2020.03.20.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005jn-73; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 1/6] mm/hmm: remove pgmap checking for devmap pages
Date: Fri, 20 Mar 2020 13:49:00 -0300
Message-Id: <20200320164905.21722-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
References: <20200320164905.21722-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 17:21:22 +0000
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

The checking boils down to some racy check if the pagemap is still
available or not. Instead of checking this, rely entirely on the
notifiers, if a pagemap is destroyed then all pages that belong to it must
be removed from the tables and the notifiers triggered.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 50 ++------------------------------------------------
 1 file changed, 2 insertions(+), 48 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index a491d9aaafe45d..3a2610e0713329 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -28,7 +28,6 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
-	struct dev_pagemap	*pgmap;
 	unsigned long		last;
 	unsigned int		flags;
 };
@@ -196,19 +195,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_vma_fault(addr, end, fault, write_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
-		if (pmd_devmap(pmd)) {
-			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
-					      hmm_vma_walk->pgmap);
-			if (unlikely(!hmm_vma_walk->pgmap))
-				return -EBUSY;
-		}
+	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
 		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
-	}
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	hmm_vma_walk->last = end;
 	return 0;
 }
@@ -300,15 +288,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (fault || write_fault)
 		goto fault;
 
-	if (pte_devmap(pte)) {
-		hmm_vma_walk->pgmap = get_dev_pagemap(pte_pfn(pte),
-					      hmm_vma_walk->pgmap);
-		if (unlikely(!hmm_vma_walk->pgmap)) {
-			pte_unmap(ptep);
-			return -EBUSY;
-		}
-	}
-
 	/*
 	 * Since each architecture defines a struct page for the zero page, just
 	 * fall through and treat it like a normal page.
@@ -328,10 +307,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	return 0;
 
 fault:
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	pte_unmap(ptep);
 	/* Fault any virtual address we were asked to fault */
 	return hmm_vma_fault(addr, end, fault, write_fault, walk);
@@ -418,16 +393,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			return r;
 		}
 	}
-	if (hmm_vma_walk->pgmap) {
-		/*
-		 * We do put_dev_pagemap() here and not in hmm_vma_handle_pte()
-		 * so that we can leverage get_dev_pagemap() optimization which
-		 * will not re-take a reference on a pgmap if we already have
-		 * one.
-		 */
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	pte_unmap(ptep - 1);
 
 	hmm_vma_walk->last = addr;
@@ -491,20 +456,9 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-		for (i = 0; i < npages; ++i, ++pfn) {
-			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
-					      hmm_vma_walk->pgmap);
-			if (unlikely(!hmm_vma_walk->pgmap)) {
-				ret = -EBUSY;
-				goto out_unlock;
-			}
+		for (i = 0; i < npages; ++i, ++pfn)
 			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
 				  cpu_flags;
-		}
-		if (hmm_vma_walk->pgmap) {
-			put_dev_pagemap(hmm_vma_walk->pgmap);
-			hmm_vma_walk->pgmap = NULL;
-		}
 		hmm_vma_walk->last = end;
 		goto out_unlock;
 	}
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
