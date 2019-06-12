Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16242736
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576B389668;
	Wed, 12 Jun 2019 13:12:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9E8933D;
 Wed, 12 Jun 2019 07:12:39 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1haxQw-0000fi-5q; Wed, 12 Jun 2019 07:12:34 +0000
Date: Wed, 12 Jun 2019 00:12:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190612071234.GA20306@infradead.org>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
 <20190608085425.GB32185@infradead.org>
 <20190611194431.GC29375@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611194431.GC29375@ziepe.ca>
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
 bh=gHyPffJSXLCM57JngMARDMldvmmJZW1qdq4MDpyHoRk=; b=LZFWfvDwFrroFnYyekMIs/UyE
 bnMyL5wiF6a4qOXH5Y6D53f6fcxweVVJulxgbYu1K/IdrKLLafhSvY4xRz/tsyEb1jMuRSPbF8Rnl
 2jgdlWDjFI2AFrwtJTWCwY7ypwwqq20Wfwdyjg6YBYwVPLrqZcVIAuIDcFv3wcwesz87rKWLcwF6Q
 uIyxuROlw9E3tQxn18S6MXz8HOLuV0akpHIPz5eAdK34NQGGATa54Jl7DFM8Z4t77COuq4Y8dcdsL
 IybD7Zm7ngdxABfUQaFBZFD1S2V2tOJ6I6k+Q28wmxvewZONusKYFagqQ8kY+0GS9kfk6C3OEwpSE
 VocdDksgg==;
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDQ6NDQ6MzFQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFNhdCwgSnVuIDA4LCAyMDE5IGF0IDAxOjU0OjI1QU0gLTA3MDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gRllJLCBJIHZlcnkgbXVjaCBkaXNhZ3JlZSB3aXRoIHRo
ZSBkaXJlY3Rpb24gdGhpcyBpcyBtb3ZpbmcuCj4gPiAKPiA+IHN0cnVjdCBobW1fbWlycm9yIGxp
dGVyYWxseSBpcyBhIHRyaXZpYWwgZHVwbGljYXRpb24gb2YgdGhlCj4gPiBtbXVfbm90aWZpZXJz
LiAgQWxsIHRoZXNlIGRyaXZlcnMgc2hvdWxkIGp1c3QgdXNlIHRoZSBtbXVfbm90aWZpZXJzCj4g
PiBkaXJlY3RseSBmb3IgdGhlIG1pcnJvcmluZyBwYXJ0IGluc3RlYWQgb2YgYnVpbGRpbmcgYSB0
aGluZyB3cmFwcGVyCj4gPiB0aGF0IGFkZHMgbm90aGluZyBidXQgaGVscGluZyB0byBtYW5hZ2Ug
dGhlIGxpZmV0aW1lIG9mIHN0cnVjdCBobW0sCj4gPiB3aGljaCBzaG91bGRuJ3QgZXhpc3QgdG8g
c3RhcnQgd2l0aC4KPiAKPiBDaHJpc3RvcGg6IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXMg
c2tldGNoIGJlbG93Pwo+IAo+IEl0IHdvdWxkIHJlcGxhY2UgdGhlIGhtbV9yYW5nZS9taXJyb3Iv
ZXRjIHdpdGggYSBkaWZmZXJlbnQgd2F5IHRvCj4gYnVpbGQgdGhlIHNhbWUgbG9ja2luZyBzY2hl
bWUgdXNpbmcgc29tZSBvcHRpb25hbCBoZWxwZXJzIGxpbmtlZCB0bwo+IHRoZSBtbXUgbm90aWZp
ZXI/Cj4gCj4gKGp1c3QgYSBza2V0Y2gsIHN0aWxsIG5lZWRzIGEgbG90IG1vcmUgdGhpbmtpbmcp
CgpJIGxpa2UgdGhlIGlkZWEuICBBIGZldyBuaXRwaWNrczogIENhbiB3ZSBhdm9pZCBoYXZpbmcg
dG8gc3RvcmUKdGhlIG1tIGluIHN0cnVjdCBtbXVfbm90aWZpZXI/ICBJIHRoaW5rIHdlIGNvdWxk
IGp1c3QgZWFzaWx5IHBhc3MKaXQgYXMgYSBwYXJhbWV0ZXIgdG8gdGhlIGhlbHBlcnMuICBUaGUg
d3JpdGUgbG9jayBjYXNlIG9mCm1tX2ludmxvY2tfc3RhcnRfd3JpdGVfYW5kX2xvY2sgaXMgcHJv
YmFibHkgd29ydGggZmFjdG9yaW5nIGludG8Kc2VwYXJhdGUgaGVscGVyPyBJIGNhbiBzZWUgY2Fz
ZXMgd2hlcmUgZHJpdmVycyB3YW50IHRvIGp1c3QgdXNlCml0IGRpcmVjdGx5IGlmIHRoZXkgbmVl
ZCB0byBmb3JjZSBnZXR0aW5nIHRoZSBsb2NrIHdpdGhvdXQgdGhlIGNoYW5jZQpvZiBhIGxvbmcg
d2FpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
