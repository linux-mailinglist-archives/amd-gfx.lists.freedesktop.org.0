Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D681821BD
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 20:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D616E9E6;
	Wed, 11 Mar 2020 19:14:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0B6E9E3
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l20so2356119qtp.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7tlzdKvmVhZXurBBb+bDdPz4NTtXbLSAXRRPdzQxqMg=;
 b=nU/438MJuKpkChqrzGp1uQGe8kdR+9FMZNnY3eJEh1/fEkuAylxu/p3vRpF+STOTTc
 1aZg6sghnmz+a1b1hofgPaLUEiSjYs6mnou5cSAQpAbusouHhmCshZJn5Y+BpFibMFws
 sS75VycDsMUXbQ5eG56z8VC2S20c63fEttL1RiDnUqJDg+27ki6Luzb2lDKvYEm/m63H
 6AZ3S+ZudbR9EAgzdlmCv8l453QIr6/K4xP1Yxid64YED9TXkLOxfIreGtEKC+JHYDou
 mhQgU7/y1uYgxw3hMkdkxrzX6Tt8Qzhinu+oRAIaElTPL8qH6WmoiY+PgLkYkfRfEjMh
 7g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7tlzdKvmVhZXurBBb+bDdPz4NTtXbLSAXRRPdzQxqMg=;
 b=Mvj/Tnc/i4fiyEsJnfairT6GH7dn0eayJvoG+6t9rF9krFrd3tTlBAiUFfmQa3cIY7
 diHIvKlTPPp3L+mJRBMaJy5XoMydiwDAV3j+sOxKhG60CfFdbaeFRD3kTPKRUM7nlgDp
 imRYNo+Vd4hJPCAvy59/MyYw42drFLQ7pwu77TcoRGfJBYVKvbaqeYy8v5Zr7zM2E/vM
 7dg/xY3V3+TDBG8ztJZVBnxbRlfG4Uqu9p7l7PJ1fVeXUr3PS1/zmUbDeKFYSi4tjJAA
 yXD7DgZaS12fNRg0yfMN5AxVlSqzW7qAGD6rw+b+d9Xppj7JioiCCTr2t4ghMmHxV+HX
 CALQ==
X-Gm-Message-State: ANhLgQ3drnoAykIBa6WsyFhbGumVoIsviFIasW34Q97cHlfxkTpCXHoe
 DnXHOKr4cD23tmSebb9AqkjANQ==
X-Google-Smtp-Source: ADFU+vvx8+qty+5T7X6/CVYANONypWbzRUqA+9Oqg9yC8JsorlJ4ocR7hpiWYgd7bDnMLWyAZmGiVQ==
X-Received: by 2002:ac8:6f4c:: with SMTP id n12mr4002527qtv.367.1583951717799; 
 Wed, 11 Mar 2020 11:35:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 3sm26733708qte.59.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016L-4h; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 3/8] mm/hmm: do not call hmm_vma_walk_hole() while holding
 a spinlock
Date: Wed, 11 Mar 2020 15:35:01 -0300
Message-Id: <20200311183506.3997-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311183506.3997-1-jgg@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2020 19:14:38 +0000
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
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

This eventually calls into handle_mm_fault() which is a sleeping function.
Release the lock first.

hmm_vma_walk_hole() does not touch the contents of the PUD, so it does not
need the lock.

Fixes: 3afc423632a1 ("mm: pagewalk: add p4d_entry() and pgd_entry()")
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 9e8f68eb83287a..32dcbfd3908315 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -473,8 +473,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 
 	pud = READ_ONCE(*pudp);
 	if (pud_none(pud)) {
-		ret = hmm_vma_walk_hole(start, end, -1, walk);
-		goto out_unlock;
+		spin_unlock(ptl);
+		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
 
 	if (pud_huge(pud) && pud_devmap(pud)) {
@@ -483,8 +483,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		bool fault, write_fault;
 
 		if (!pud_present(pud)) {
-			ret = hmm_vma_walk_hole(start, end, -1, walk);
-			goto out_unlock;
+			spin_unlock(ptl);
+			return hmm_vma_walk_hole(start, end, -1, walk);
 		}
 
 		i = (addr - range->start) >> PAGE_SHIFT;
@@ -495,9 +495,9 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
 				     cpu_flags, &fault, &write_fault);
 		if (fault || write_fault) {
-			ret = hmm_vma_walk_hole_(addr, end, fault,
-						 write_fault, walk);
-			goto out_unlock;
+			spin_unlock(ptl);
+			return hmm_vma_walk_hole_(addr, end, fault, write_fault,
+						  walk);
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
