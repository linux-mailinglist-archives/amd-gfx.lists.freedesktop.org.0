Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E519195FA2
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 21:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24FC6EA7F;
	Fri, 27 Mar 2020 20:24:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2416EA76
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:36 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q188so12183865qke.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnmlXREPuYpdVgA5s4jhAhUS2rhGunirwIYiSIKrMtg=;
 b=Wu2ZwNFXHpdCBgvdA8u8Cz/oBGw1KkX1ncVdRnShcf4GElMjWiKn1EFoelD3SC8Pdu
 5oSRc44vjt9HjDQIdnAjLiB+iqkIomFaK7HFZJFCv1kfCNeuzJVsRL7yLgCUG9Yr40/y
 WgrivYlj6PLrkUegOnWHJZ1F8UqAmw2TZvMLx7W8RoATRVA6AcfKj/tg/ZM++QQ2FInD
 OgMKezyjEZ1p8onZcLsVkCB8VKeSaGKmAahK36UK9mn1vHsesFmJ7K8NrAs9qVS1rjff
 SOFbQ2JU3d1BCXnSk9YKyqsHoaV8jbjKTUqEGLI2hP1Db4PBe3lavzYaTW19q+NqJqN0
 9c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnmlXREPuYpdVgA5s4jhAhUS2rhGunirwIYiSIKrMtg=;
 b=K5w4avPca0BatoJXrdeAmtl7xraf7UzSYccKccCnbqp8yzFka8i7SW8IJj/J8J99v5
 6xWtZmrYP+lFKr7VIzBNG1OvD4mOniHHO2ceu1tLuIKOhNqE/ppl8FUKja79Kc9nLIzC
 4QUUKTtj6kV7DiCNRFvTpinHiETP0yTuvlX18bdAX6LD+CkwrPv1a3A2lIl9/L8D+uA/
 1L5SV20OCzDC1s1Nu8P7F3dWZeFLPBUEgO+vJmvseoeK+h9jN678fUgRSVRJAwH12xf6
 8U/bJZNW1UhBttQRYipePFSpQbLyE3jEy6PUv895O32o3JtUBQTTfyTVAT2cfKCN+rrK
 9ttw==
X-Gm-Message-State: ANhLgQ38LnXotqqE9ZD/8kJEs7nUeCmMpUgSAlBepJr0xGa8z/cWyimo
 X+2r8LFJDQUiwUWdTBoip2GsGA==
X-Google-Smtp-Source: ADFU+vtP+nRCig+6NY7kgxbUHqtF0cMlEgYlNWpvv3AXm5n10mHCqPWrSiPAvbRUdrMjQ+WdapHq0w==
X-Received: by 2002:a05:620a:12fc:: with SMTP id
 f28mr1059601qkl.31.1585339235366; 
 Fri, 27 Mar 2020 13:00:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 207sm4452408qkj.41.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007gG-CJ; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 9/9] mm/hmm: return error for non-vma snapshots
Date: Fri, 27 Mar 2020 17:00:21 -0300
Message-Id: <20200327200021.29372-10-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200327200021.29372-1-jgg@ziepe.ca>
References: <20200327200021.29372-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Mar 2020 20:24:43 +0000
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

The pagewalker does not call most ops with NULL vma, those are all routed
to hmm_vma_walk_hole() via ops->pte_hole instead.

Thus hmm_vma_fault() is only called with a NULL vma from
hmm_vma_walk_hole(), so hoist the NULL vma check to there.

Now it is clear that snapshotting with no vma is a HMM_PFN_ERROR as
without a vma we have no path to call hmm_vma_fault().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e875d9ef0968fd..31d0f68689c32b 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -83,9 +83,6 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
 
-	if (!vma)
-		return -EFAULT;
-
 	if (required_fault & HMM_NEED_WRITE_FAULT) {
 		if (!(vma->vm_flags & VM_WRITE))
 			return -EPERM;
@@ -170,6 +167,11 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 	npages = (end - addr) >> PAGE_SHIFT;
 	pfns = &range->pfns[i];
 	required_fault = hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0);
+	if (!walk->vma) {
+		if (required_fault)
+			return -EFAULT;
+		return hmm_pfns_fill(addr, end, range, HMM_PFN_ERROR);
+	}
 	if (required_fault)
 		return hmm_vma_fault(addr, end, required_fault, walk);
 	hmm_vma_walk->last = addr;
-- 
2.25.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
