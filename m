Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC3475AB
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2DC891A6;
	Sun, 16 Jun 2019 15:53:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01F891D1;
 Sat, 15 Jun 2019 14:18:29 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9Vi-0004Vn-La; Sat, 15 Jun 2019 14:18:26 +0000
Date: Sat, 15 Jun 2019 07:18:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 10/12] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
Message-ID: <20190615141826.GJ17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-11-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-11-jgg@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 16 Jun 2019 15:53:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAtCly+PQtUNfQV4P5g2hw3GFHENxhTcIuvEPxpIuGg=; b=b90xGJ+x0UwJqU/7Ldqu6D0lo
 DiD/e1TSteHI3mAWCw5RLZyrsLKkdqBExF4Dp2UL7jBDQEkfwhDrxDWPunc3tsNcMuz3t2n1SMwxU
 3zYlg/2iooeD18X5DJ6lLLDByKgg7asLYVufuU51WkA0bxF2v9XGQoL0fIsjRr3BlUGV3QKYhWrUS
 P9CLWe2hrue2MN57fLznBpUgYMfPyO/sPbAnH1Sp5vHhbSbOJ5IZivel1MoZYuDK4CUV4dSQDiOMv
 olCW2JBxsKPM+GNzvfpcXs1yx7oZnKU4hPYZ47nMD6Xjay+rv16teG9PUH51Rcm2NUZf91Av+R2mR
 XT0/l+wOA==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 Ira Weiny <iweiny@intel.com>, dri-devel@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDhQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ICAJcmFuZ2UtPmhtbSA9IGhtbTsKPiAgCWtyZWZfZ2V0KCZobW0tPmtyZWYpOwo+
IC0JbGlzdF9hZGRfcmN1KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKPiArCWxpc3RfYWRk
KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKPiAgCj4gIAkvKgo+ICAJICogSWYgdGhlcmUg
YXJlIGFueSBjb25jdXJyZW50IG5vdGlmaWVycyB3ZSBoYXZlIHRvIHdhaXQgZm9yIHRoZW0gZm9y
Cj4gQEAgLTkzNCw3ICs5MzQsNyBAQCB2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBo
bW1fcmFuZ2UgKnJhbmdlKQo+ICAJc3RydWN0IGhtbSAqaG1tID0gcmFuZ2UtPmhtbTsKPiAgCj4g
IAltdXRleF9sb2NrKCZobW0tPmxvY2spOwo+IC0JbGlzdF9kZWxfcmN1KCZyYW5nZS0+bGlzdCk7
Cj4gKwlsaXN0X2RlbCgmcmFuZ2UtPmxpc3QpOwo+ICAJbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2sp
OwoKTG9va3MgZmluZToKClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgoKQnR3LCBpcyB0aGVyZSBhbnkgcmVhc29uIG5ldyByYW5nZXMgYXJlIGFkZGVkIHRvIHRo
ZSBmcm9udCBhbmQgbm90IHRoZQp0YWlsIG9mIHRoZSBsaXN0PwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
