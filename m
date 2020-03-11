Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983D1821B3
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 20:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877F26E9E7;
	Wed, 11 Mar 2020 19:14:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13D6E9E1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:18 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id l17so1356669qvu.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4LlS7crloThbv9GsTKnTI10IpHCEC6Nex/YosncVz8=;
 b=DwTEKiclhpQg0fNTYvqAuNy+heFBVQDSfpsXeRVFu0jDES6R+ZMeTr35f2e5N625FK
 NToJ+Fd3YnorvJ5CX+rlPDiHjGYo/nKZi9O2f3e7L+49kPt+8lcENKJ5g82DzDMVzbYQ
 B/OsMP99QPyNZ+fbnmeMkVwjuffPVwRi1xkGV4I8FGJpZH/UT89BW6LfgfUKESMIZV87
 ohDZTTRJdm5qYEKozQzdCvJ3Z7x2V6OG3XC9TNpEnREYKTtGMwA3lKn4rC7QZ+C7mL4/
 gwlfxffBMiHJVWrMbkz21Qx/6pE+4seQ24ZP6qSJckOZ3It/iBMOQoLOFMdzzsJV/PgL
 DFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4LlS7crloThbv9GsTKnTI10IpHCEC6Nex/YosncVz8=;
 b=gdVwXilSnCoW2RTVowNT6AV9z24IEGc5BNZRtFPaBqd9C8Ux5b2eTBuCefHv+lzL5u
 y/6g1L/E//IJRew7HnVMNXX+KHjeNzjR9Hnnp0LntP/ZbR20LO50W+zh12Ta+9wArpIa
 lW62FwJfDron/sT581T1oD9NhDCN4Teb2xn9zVuZL991OZkBb58fBr3zAkW1ezAYqK/o
 BSghMtiuiKrpR39uXZ9UVoOBH1nVt63DsQITf3MdiU93nj8cHIfvgzp4ZDX9SdGmC/Cd
 vdQnezS5ZsRdgdQZk07b5h1Re/ocdsti76C3crRPNwkpXmWFjrRaAmdYbr5Z6mLaRMGf
 Kltw==
X-Gm-Message-State: ANhLgQ0UXn1wPEPMK9uq7+hlFWYxXET/uEIfTjy6DIbn4rm8Y0KJeuUQ
 nKoBihSsA1pB2na4dUMkq/n7WQ==
X-Google-Smtp-Source: ADFU+vtiAnVo6RkgaCWxmSuBgPMtecLVlfoeqm0VtiCXRstC1SIEdwxVoTIzwmkXm1mF22wmi1C85w==
X-Received: by 2002:ad4:4e73:: with SMTP id ec19mr3920755qvb.78.1583951717237; 
 Wed, 11 Mar 2020 11:35:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id p16sm4656758qkj.5.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016X-8Y; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 5/8] mm/hmm: add missing call to hmm_range_need_fault()
 before returning EFAULT
Date: Wed, 11 Mar 2020 15:35:03 -0300
Message-Id: <20200311183506.3997-6-jgg@ziepe.ca>
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

All return paths that do EFAULT must call hmm_range_need_fault() to
determine if the user requires this page to be valid.

If the page cannot be made valid if the user later requires it, due to vma
flags in this case, then the return should be HMM_PFN_ERROR.

Fixes: a3e0d41c2b1f ("mm/hmm: improve driver API to work and wait over a range")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 5f5ccf13dd1e85..e10cd0adba7b37 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -582,18 +582,15 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	struct vm_area_struct *vma = walk->vma;
 
 	/*
-	 * Skip vma ranges that don't have struct page backing them or
-	 * map I/O devices directly.
-	 */
-	if (vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP))
-		return -EFAULT;
-
-	/*
+	 * Skip vma ranges that don't have struct page backing them or map I/O
+	 * devices directly.
+	 *
 	 * If the vma does not allow read access, then assume that it does not
-	 * allow write access either. HMM does not support architectures
-	 * that allow write without read.
+	 * allow write access either. HMM does not support architectures that
+	 * allow write without read.
 	 */
-	if (!(vma->vm_flags & VM_READ)) {
+	if ((vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP)) ||
+	    !(vma->vm_flags & VM_READ)) {
 		bool fault, write_fault;
 
 		/*
@@ -607,7 +604,7 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 		if (fault || write_fault)
 			return -EFAULT;
 
-		hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
+		hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 		hmm_vma_walk->last = end;
 
 		/* Skip this vma and continue processing the next vma. */
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
