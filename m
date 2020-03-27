Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028A195F9B
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 21:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039336EA78;
	Fri, 27 Mar 2020 20:24:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7476EA73
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:34 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id v7so12237038qkc.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TyPTTIrgr5jFkg31+AHSLRGpSHCvL1+EWcgijYv1QPM=;
 b=noYJUaxTqgZy/wHPJ7HGyMyohSauQN1H/BBlkuBWc8iQCW/ZppJ+LwXNIRokuECBml
 u6KEyLpSSemzeGjYlvPG3hJinN1mPYzfpw2TKQpLGrRm3QkSvLfqx+7sdqisc85aoNbF
 dAE0zPXSTZ5VOOUE4p3EJNV+nlIxlCbdWMU7jIWo61XJz2jsxynfZ8Jsv8TM8jKjjwLg
 W/OnoLB7/2LjBbA/03Wp1larZqxPw94OAM/d0G0vnQYlKbXBzvfptKdfRp2LDnmVwPiJ
 NmoLTGimt357fCiaJDyo9V+hfs+zQXXNlC4UR7IdT0Vh9odOWaoD5d7y5ym3WEq75ble
 uW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyPTTIrgr5jFkg31+AHSLRGpSHCvL1+EWcgijYv1QPM=;
 b=GD/oGFNNJBWIrV5jDiod8Ua3yR+NDhOYGT6bJlfy4OZSSKIAWq2av41UI/1ErY8HNE
 Cp9PBXgN9EDChE0sqqqq7+QNy+8ZLTxOsB8VjWW0sJRZzDVpIBr7c6KqBPUj6abQZ4zZ
 rMJlXX8JooC/YwE+q1TwK9l6/bB+lmD/WRCbqrcTPPvGpT9ItLHnwiYI8Cxppk0r76sg
 SCne3jrMiewFN3BdpO/6b99lY/bbSANhDrXDsQVMJqrb963mk8mXocJlLQ21dtWPQ7Bf
 PMLBgb6+jBG8023z4lWXlnxq7RI4l/16HX0FyH5stB9wx6RbAumd4xl67czqLTS8xUmF
 HQtQ==
X-Gm-Message-State: ANhLgQ1UshG7z2qAT33OyR7FMI4Wh9geCvB6gI+1mAVHPp3jp3aCHFas
 Etd76hAm5Ol2oQervJXvbTVKqA==
X-Google-Smtp-Source: ADFU+vusyRe6ojBp5llZXnMxLYofwoFjLl3UfJlP4qaMzbvBMyNTtVgrylTbiL3g/n+IqSKDUu4X9Q==
X-Received: by 2002:a37:30f:: with SMTP id 15mr1101270qkd.44.1585339233822;
 Fri, 27 Mar 2020 13:00:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id f1sm3946514qkl.91.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007fy-6Y; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 6/9] mm/hmm: use device_private_entry_to_pfn()
Date: Fri, 27 Mar 2020 17:00:18 -0300
Message-Id: <20200327200021.29372-7-jgg@ziepe.ca>
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

swp_offset() should not be called directly, the wrappers are supposed to
abstract away the encoding of the device_private specific information in
the swap entry.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 3a71ec72b0a42f..3303686bf16d24 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -261,7 +261,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
 			*pfn = hmm_device_entry_from_pfn(range,
-					    swp_offset(entry));
+				device_private_entry_to_pfn(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
 			if (is_write_device_private_entry(entry))
 				*pfn |= range->flags[HMM_PFN_WRITE];
-- 
2.25.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
