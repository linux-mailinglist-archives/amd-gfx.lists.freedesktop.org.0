Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC749A4F
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269C46E0FE;
	Tue, 18 Jun 2019 07:19:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717D6E0DA;
 Tue, 18 Jun 2019 05:37:39 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hd6oH-000393-RU; Tue, 18 Jun 2019 05:37:33 +0000
Date: Mon, 17 Jun 2019 22:37:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190618053733.GA25048@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
 <20190615142106.GK17724@infradead.org>
 <20190618004509.GE30762@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618004509.GE30762@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tV99K2d8GVHSoZ145rfgnhmZCC9mL4mRsMkgqsk8d2s=; b=VFk5UR+XIAvFhHNbE76I35I6f
 5p7lqPrAl/jivCCXN+p+cSFmOz9NxFW3q/GzZH2CfzqBSKFufzN+JFGSDjo/dIxQTZiEPsvYYqzWD
 YSzYy9RDgwu/UB1ROaPz1ZEl9EY5pV5O4miFLk1fx7AzfoNx82bqK+GrG6yR/3easJuI6lhk+jWT/
 4WTD218PsDq6oZi0gydoz2rOi9QRbKG9GNJbOSSjtoKSEBW0xsg2awCi5ClkXapFLSGwx0lQwo/Em
 qEOwti0M9nkgYlIwbAtaNtKKmOJzFmEocKqjXkQXMo5T/sbmnRuCRzbmL40TF3q9QQ/oln7clT4Xf
 d4ZT4nuhg==;
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
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDk6NDU6MDlQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEFtIEkgbG9va2luZyBhdCB0aGUgd3JvbmcgdGhpbmc/IExvb2tzIGxpa2UgaXQg
Y2FsbHMgaXQgdGhyb3VnaCBhIHdvcmsKPiBxdWV1ZSBzaG91bGQgc2hvdWxkIGJlIE9LLi4KClll
cywgaXQgY2FsbHMgaXQgdGhyb3VnaCBhIHdvcmsgcXVldWUuICBJIGd1ZXNzIHRoYXQgaXMgZmlu
ZSBiZWNhdXNlCml0IG5lZWRzIHRvIHRha2UgdGhlIGxvY2sgYWdhaW4uCgo+IFRob3VnaCB2ZXJ5
IHN0cmFuZ2UgdGhhdCBhbWRncHUgb25seSBkZXN0cm95cyB0aGUgbWlycm9yIHZpYSByZWxlYXNl
LAo+IHRoYXQgY2Fubm90IGJlIHJpZ2h0LgoKQXMgc2FpZCB0aGUgd2hvbGUgdGhpbmdzIGxvb2tz
IHJhdGhlciBvZGQgdG8gbWUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
