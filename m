Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC63B6D7
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42008891B7;
	Mon, 10 Jun 2019 14:08:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EC089202;
 Sat,  8 Jun 2019 08:54:31 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hZX7J-0003Ez-Ag; Sat, 08 Jun 2019 08:54:25 +0000
Date: Sat, 8 Jun 2019 01:54:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190608085425.GB32185@infradead.org>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606184438.31646-3-jgg@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1hJhow60v+LJiQ/UMCdIN+9Bx8ZXj0xQ+YgDg2iVzc=; b=gTClu4LEf03iqlVKsw61uPJ0B
 pS9Ck86baVc6Sm95eVVSUUBhBhNbUwnwFz+jQttEnVDd4gBod0YA7TIWl1eHagLumRzZpfFM0dOa1
 5YBQQ0X7x8gVGzHHWCIyyr4G7qROkOfLdQRDhC1QQF19EULewSw3heaYsnb1gnBDib6CvUBig7tBV
 zz/Vshh8/4EKjmDFCJxFS6vzexhFNVtxzTTzT2xdxue69XMKFDaWjnyOGWD1m+w/kdXjsgjxB8BDl
 ONOuSdIYi82tzxuRKOqBnqQfOWCtkGuNzVDEk7uzCpwoBT9zpbo71D0cotxdv7X9eZVj/OcRfy+4I
 cUXwYfNqA==;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RllJLCBJIHZlcnkgbXVjaCBkaXNhZ3JlZSB3aXRoIHRoZSBkaXJlY3Rpb24gdGhpcyBpcyBtb3Zp
bmcuCgpzdHJ1Y3QgaG1tX21pcnJvciBsaXRlcmFsbHkgaXMgYSB0cml2aWFsIGR1cGxpY2F0aW9u
IG9mIHRoZQptbXVfbm90aWZpZXJzLiAgQWxsIHRoZXNlIGRyaXZlcnMgc2hvdWxkIGp1c3QgdXNl
IHRoZSBtbXVfbm90aWZpZXJzCmRpcmVjdGx5IGZvciB0aGUgbWlycm9yaW5nIHBhcnQgaW5zdGVh
ZCBvZiBidWlsZGluZyBhIHRoaW5nIHdyYXBwZXIKdGhhdCBhZGRzIG5vdGhpbmcgYnV0IGhlbHBp
bmcgdG8gbWFuYWdlIHRoZSBsaWZldGltZSBvZiBzdHJ1Y3QgaG1tLAp3aGljaCBzaG91bGRuJ3Qg
ZXhpc3QgdG8gc3RhcnQgd2l0aC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
