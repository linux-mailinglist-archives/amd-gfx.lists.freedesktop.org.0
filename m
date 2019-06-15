Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B8475AC
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D2891AF;
	Sun, 16 Jun 2019 15:53:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148B8891B4;
 Sat, 15 Jun 2019 14:17:33 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9Ul-0004Sq-0D; Sat, 15 Jun 2019 14:17:27 +0000
Date: Sat, 15 Jun 2019 07:17:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 09/12] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190615141726.GI17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-10-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-10-jgg@ziepe.ca>
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
 bh=RsiIOe9hz9lv0grh/5TETFa2K+PcFkUA7+fv86fOR5Y=; b=ZGV0NCi9ysO0XtRDFkLleOXhx
 Pytm+wwoUaqIyplTuPpzPx/Um5MRpO7oD21ESdm15ZuobrU5ByqxevsIgAb+esf98ncN5O3TO/gi5
 ngxJcin5B8yz8EStFibw7qlVy26TuST04itrGnYArJ0P8gvRWor6jkiZgOlB+tIDErzLL5J8u9E5G
 3B+q8ub4IIQvi1S4JxhxHCfMFg14viWDC3mbn+ho1Uuql4o+caakGrzhtD/njve0bkvHan7V4u1hb
 VHQQPTjV8xX35xtkkXqXRC6KHzFfG6KaCEfn4GZ5MW//F208juEbvZsLmv9LYpKHc8f3ys425dOWH
 Ta35tRB7Q==;
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
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtCS8qIFNhbml0eSBjaGVjayB0aGlzIHJlYWxseSBzaG91bGQgbm90IGhhcHBlbi4gKi8KPiAt
CWlmIChobW0gPT0gTlVMTCB8fCByYW5nZS0+ZW5kIDw9IHJhbmdlLT5zdGFydCkKPiAtCQlyZXR1
cm47Cj4gLQo+ICAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKPiAgCWxpc3RfZGVsX3JjdSgmcmFu
Z2UtPmxpc3QpOwo+ICAJbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+ICAKPiAgCS8qIERyb3Ag
cmVmZXJlbmNlIHRha2VuIGJ5IGhtbV9yYW5nZV9yZWdpc3RlcigpICovCj4gLQlyYW5nZS0+dmFs
aWQgPSBmYWxzZTsKPiAgCW1tcHV0KGhtbS0+bW0pOwo+ICAJaG1tX3B1dChobW0pOwo+IC0JcmFu
Z2UtPmhtbSA9IE5VTEw7Cj4gKwo+ICsJLyoKPiArCSAqIFRoZSByYW5nZSBpcyBub3cgaW52YWxp
ZCBhbmQgdGhlIHJlZiBvbiB0aGUgaG1tIGlzIGRyb3BwZWQsIHNvCj4gKyAgICAgICAgICogcG9p
c29uIHRoZSBwb2ludGVyLiAgTGVhdmUgb3RoZXIgZmllbGRzIGluIHBsYWNlLCBmb3IgdGhlIGNh
bGxlcidzCj4gKyAgICAgICAgICogdXNlLgo+ICsgICAgICAgICAqLwo+ICsJcmFuZ2UtPnZhbGlk
ID0gZmFsc2U7Cj4gKwltZW1zZXQoJnJhbmdlLT5obW0sIFBPSVNPTl9JTlVTRSwgc2l6ZW9mKHJh
bmdlLT5obW0pKTsKCkZvcm1hdHRpbmcgc2VlbXMgdG8gYmUgbWVzc2VkIHVwLiAgQnV0IGFnYWlu
IEkgZG9uJ3Qgc2VlIHRoZSB2YWx1ZQppbiB0aGUgcG9pc29uaW5nLCBqdXN0IGxldCBub3JtYWwg
bGlua2VkIGxpc3QgZGVidWdnaW5nIGRvIGl0cyB3b3JrLgpUaGUgb3RoZXIgY2xlYW51cHMgbG9v
a3MgZmluZSB0byBtZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
