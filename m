Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC14272A
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC88958E;
	Wed, 12 Jun 2019 13:12:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671289471;
 Wed, 12 Jun 2019 12:11:25 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hb264-0008NQ-37; Wed, 12 Jun 2019 12:11:20 +0000
Date: Wed, 12 Jun 2019 05:11:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190612121120.GA24966@infradead.org>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
 <20190608085425.GB32185@infradead.org>
 <20190611194431.GC29375@ziepe.ca>
 <20190612071234.GA20306@infradead.org>
 <20190612114125.GA3876@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612114125.GA3876@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FtzE4Thitu+oCRZIQWiIw67zmtUw4+rU6GSw0OsJqek=; b=HVzDiOF7tENNW0oMxkkgJMas1
 A3Yn5kiw+tQwG9J5FUng0C7nSST4hyp8v3p18AHc5XwjtR6rAoFHNODTRx/v2fZRrLZlSdXubpHkO
 /yf6f47UsoARpMNaJna9cWEs6OSWNZDLcZhimsZOXGr3+tvZi0GfJTJ669IDU4/XmTMbwDPZkDLos
 LkW4qzLloWsxOYO77T/vfAsa9XmXmdlVIVcnfe/mZHLEYOok7gUbzJbkQhuYCWV6f2BXLYvXNJByE
 49az5xb9jJu4yw8HZj1I9aQBcwOdxtzvM/r1F0DMIfJCPxSuOTX6jM1XJNcjnvOhbZVMk4d/cCXtK
 lQGR+DnYw==;
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
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDg6NDE6MjVBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gSSBsaWtlIHRoZSBpZGVhLiAgQSBmZXcgbml0cGlja3M6IENhbiB3ZSBhdm9p
ZCBoYXZpbmcgdG8gc3RvcmUgdGhlCj4gPiBtbSBpbiBzdHJ1Y3QgbW11X25vdGlmaWVyPyBJIHRo
aW5rIHdlIGNvdWxkIGp1c3QgZWFzaWx5IHBhc3MgaXQgYXMgYQo+ID4gcGFyYW1ldGVyIHRvIHRo
ZSBoZWxwZXJzLgo+IAo+IFllcywgYnV0IEkgdGhpbmsgYW55IGRyaXZlciB0aGF0IG5lZWRzIHRv
IHVzZSB0aGlzIEFQSSB3aWxsIGhhdmUgdG8KPiBob2xkIHRoZSAnc3RydWN0IG1tX3N0cnVjdCcg
YW5kIHRoZSAnc3RydWN0IG1tdV9ub3RpZmllcicgdG9nZXRoZXIgKGllCj4gT0RQIGRvZXMgdGhp
cyBpbiBpYl91Y29udGV4dF9wZXJfbW0pLCBzbyBpZiB3ZSBwdXQgaXQgaW4gdGhlIG5vdGlmaWVy
Cj4gdGhlbiBpdCBpcyB0cml2aWFsbHkgYXZhaWxhYmxlIGV2ZXJ3aGVyZSBpdCBpcyBuZWVkZWQs
IGFuZCB0aGUKPiBtbXVfbm90aWZpZXIgY29kZSB0YWtlcyBjYXJlIG9mIHRoZSBsaWZldGltZSBm
b3IgdGhlIGRyaXZlci4KClRydWUuICBXZWxsLCBtYXliZSBrZWVwIGl0IGZvciBub3cgYXQgbGVh
c3QuCgo+IFRoZSBlbnRpcmUgcHVycG9zZSBvZiB0aGUgaW52bG9jayBpcyB0byBhdm9pZCBnZXR0
aW5nIHRoZSB3cml0ZSBsb2NrCj4gb24gbW1hcF9zZW0gYXMgYSBmYXN0IHBhdGggLSBpZiB0aGUg
ZHJpdmVyIHdpc2hlcyB0byB1c2UgbW1hcF9zZW0KPiBsb2NraW5nIG9ubHkgdGhlbiBpdCBzaG91
bGQganVzdCBkbyBzbyBkaXJlY3RseSBhbmQgZm9yZ2V0IGFib3V0IHRoZQo+IGludmxvY2suCgpN
YXkgd29ycnkgaGVyZSBpcyB0aGF0IHRoZXJlIG1pZ2ggYmUgY2FzZXMgd2hlcmUgdGhlIGRyaXZl
ciBuZWVkcwp0byBleHBlZGl0ZSB0aGUgYWN0aW9uLCBpbiB3aGljaCBjYXNlIGp1bXBpbmcgc3Ry
YWlnaHQgdG8gdGhlIHdyaXRlCmxvY2suICBCdXQgYWdhaW4gd2UgY2FuIHByb2JhYmx5IHNraXAg
dGhpcyBmb3Igbm93IGFuZCBzZWUgaWYgaXQgcmVhbGx5CmVuZHMgdXAgYmVpbmcgbmVlZGVkLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
