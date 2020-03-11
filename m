Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2A1821BA
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 20:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC67E6E9E9;
	Wed, 11 Mar 2020 19:14:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DEB6E9E3
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g16so2331627qtp.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yd+xe0QbNmktoZjpJg43C/41KpLoxm/0aQKS2FSaS3E=;
 b=T5u4wkGorRMsF6nNncNqo4u2AxsrIUqlN8mcICipRt8jE73vdIfF+GtJaU/nwQTASH
 8wS+b8zMD796R57juosBaEBb8H9hMJVyml4x+uTHb+BCypffHOEfwYvE/nrlai0Jegv6
 FxYC7LXInWuPmKKE66pgeEaK0xiROZGQqzjplU9JF00xyUqrLGiz5jSK5YigiieXcTgu
 2MhdCfLjfpUneRGX+PKVLQAfE0z1/Y0bTUreYkirHtkb4PSp/LyoQgl7ymheDmm5a08a
 Gz9PK60Dko2CPILX0MePkRl7styVd1ZNKQhzvOkSgrmoFOwybxNI7y/d+HBSQ1EVHt0N
 K+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yd+xe0QbNmktoZjpJg43C/41KpLoxm/0aQKS2FSaS3E=;
 b=PHBtZhJaUnTUE/5OQ9AF/MFoKogx3B9BLIBTfwqlI1YIqirLclC+y//AVODItPry7E
 RsJ53i3G+ISHYF0CCunb69KiZxUHxyR34c9CyPcASGJ1sOFXg0j43PVHlWgDeP/YwFFD
 fe/1CPi1uXMaO8jTv8kad3H0B6HjbVF3JirLQL4/vqkoLArxb9UBGTjmwJjATgdYITcx
 y5kavDZfYOgRXxGKK5eKhNhNMaz2wW3t35X5Q0Xprwg/BbHXKsu2c4Si1nfPmWpkvOJM
 heoaM7jhiys4prG2E/JWzEaz7vv7GaQ3nQzNgMxeIwBSiWm8cu7ldrdwOAZ91QJxc+ew
 VIiw==
X-Gm-Message-State: ANhLgQ2BSSoJXCOC01z+P6HAEhBiPez/fbGzsw2hf0OueY9T81qcI1vp
 zck9UNgc+73h9QMhrHjUTDKCnQ==
X-Google-Smtp-Source: ADFU+vtkDL7Acp/VH19W18vm5b/9WqeC+awgKyc75q+9sf3VgvOE3gOX0YH3WoWVFdlaKA6kLiYpzg==
X-Received: by 2002:aed:2266:: with SMTP id o35mr3965179qtc.392.1583951718149; 
 Wed, 11 Mar 2020 11:35:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id o7sm8052457qtg.63.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016d-Aq; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 6/8] mm/hmm: reorganize how !pte_present is handled in
 hmm_vma_handle_pte()
Date: Wed, 11 Mar 2020 15:35:04 -0300
Message-Id: <20200311183506.3997-7-jgg@ziepe.ca>
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
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

The intention with this code is to determine if the caller required the
pages to be valid, and if so, then take some action to make them valid.
The action varies depending on the page type.

In all cases, if the caller doesn't ask for the page, then
hmm_range_fault() should not return an error.

Revise the implementation to be clearer, and fix some bugs:

 - hmm_pte_need_fault() must always be called before testing fault or
   write_fault otherwise the defaults of false apply and the if()'s don't
   work. This was missed on the is_migration_entry() branch

 - -EFAULT should not be returned unless hmm_pte_need_fault() indicates
   fault is required - ie snapshotting should not fail.

 - For !pte_present() the cpu_flags are always 0, except in the special
   case of is_device_private_entry(), calling pte_to_hmm_pfn_flags() is
   confusing.

Reorganize the flow so that it always follows the pattern of calling
hmm_pte_need_fault() and then checking fault || write_fault.

Fixes: 2aee09d8c116 ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e10cd0adba7b37..bf676cfef3e8ee 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -282,15 +282,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (!pte_present(pte)) {
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
-		if (!non_swap_entry(entry)) {
-			cpu_flags = pte_to_hmm_pfn_flags(range, pte);
-			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
-					   &fault, &write_fault);
-			if (fault || write_fault)
-				goto fault;
-			return 0;
-		}
-
 		/*
 		 * This is a special swap entry, ignore migration, use
 		 * device and report anything else as error.
@@ -310,26 +301,30 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			return 0;
 		}
 
-		if (is_migration_entry(entry)) {
-			if (fault || write_fault) {
-				pte_unmap(ptep);
-				hmm_vma_walk->last = addr;
-				migration_entry_wait(walk->mm, pmdp, addr);
-				return -EBUSY;
-			}
+		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
+				   &write_fault);
+		if (!fault && !write_fault)
 			return 0;
+
+		if (!non_swap_entry(entry))
+			goto fault;
+
+		if (is_migration_entry(entry)) {
+			pte_unmap(ptep);
+			hmm_vma_walk->last = addr;
+			migration_entry_wait(walk->mm, pmdp, addr);
+			return -EBUSY;
 		}
 
 		/* Report error for everything else */
 		pte_unmap(ptep);
 		*pfn = range->values[HMM_PFN_ERROR];
 		return -EFAULT;
-	} else {
-		cpu_flags = pte_to_hmm_pfn_flags(range, pte);
-		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
-				   &fault, &write_fault);
 	}
 
+	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
+	hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags, &fault,
+			   &write_fault);
 	if (fault || write_fault)
 		goto fault;
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
