Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FACF190757
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2020 09:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725736E471;
	Tue, 24 Mar 2020 08:14:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D80A6E440
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id v15so13725786qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cn9RgeyUV+TJ0C+dZY3/xabajaX98Ex7kztQKlCq4U=;
 b=Ff0xojsd3cq1dGVAoIHiPmcyh54SxIN+pENdLICcphcOvOXKSYBGWi2Lteb40L9Fdb
 0uGdZf/FNkjfyoGYDj7B2NMBVFvfdBCh04XT/0MbUWrs3JMGezoHddekjb0DbZA05DF2
 MT2M/znLe/J9vrIEnYQoXAvCC+BlbhZLDymJWUW1b9UzLcBKDP3pzI9IA8i5FCNAq/zn
 e2yz5bVTvnX3es5DF+kAJ1XlXnh1j2im/pX3/bAQG+6Kz6y3oPSV5hudjoC8i5BZ6fPB
 yXL+ZujImYZTgg9ip8MWOZoP08JFOiha+6xXv2t1tUiHWNW1u2NHn6mu85+aoEe3fmI1
 9mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cn9RgeyUV+TJ0C+dZY3/xabajaX98Ex7kztQKlCq4U=;
 b=oAloHpPXWM+5Mj9rohlBqZNxXOqVdP8ik+tZK03bva9mfMVZ4TQFaTnM0fAe8bEFMh
 Oe9hv4J6jgpN+ijyWGFp4GYApG/IhP3H7xZBezc9HKVSIAIf0zXV4c3x3N2IC1Kf3DPW
 HNdiwPfKL01Bm7EDFPtddCQXdJX91d6rhHyD0jZdCA1LVKfNW2HCrILzL94wURilRd1O
 YnKS0iTayHGw0OOmaT6M0rizdmAXF8iFbatgH1xNhsKVS+UebfoDexR1dCtxcw0FBXks
 RQNUiMKPK+dsxg+u6e0U++cDMEqbn8Xia9qkWn+dxxT93IB6WJTiVDjVk4GzIi4E38zX
 eeJg==
X-Gm-Message-State: ANhLgQ1wTiV8/uIq5FxLA14IVhcSlIOwM+ispjeMxNWyIQK4w1Rdyho4
 qPuPFLMArnuh1NAlD2ppFFAXZQ==
X-Google-Smtp-Source: ADFU+vtPNzJGTGzAwJ8tfsuitTGBjOWdY4RK0mrS2DUXzOKGkcTcLMcpw9n2NbdPeT5u90/Amd8p6A==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr24536367qtj.344.1585012515289; 
 Mon, 23 Mar 2020 18:15:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id o67sm11728381qka.114.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000ra-FL; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 9/9] mm/hmm: return error for non-vma snapshots
Date: Mon, 23 Mar 2020 22:14:57 -0300
Message-Id: <20200324011457.2817-10-jgg@ziepe.ca>
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

The pagewalker does not call most ops with NULL vma, those are all routed
to pte_hole instead.

Thus hmm_vma_fault() is only called with a NULL vma from
hmm_vma_walk_hole(), so hoist the check to there.

Now it is clear that snapshotting with no vma is a HMM_PFN_ERROR as
without a vma we have no path to call hmm_vma_fault().

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 14c33e1225866c..df0574061b37d3 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -83,9 +83,6 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
 
-	if (!vma)
-		return -EFAULT;
-
 	if ((required_fault & HMM_NEED_WRITE_FAULT) == HMM_NEED_WRITE_FAULT) {
 		if (!(vma->vm_flags & VM_WRITE))
 			return -EPERM;
@@ -175,6 +172,11 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
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
