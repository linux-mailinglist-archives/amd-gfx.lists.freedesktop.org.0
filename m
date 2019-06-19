Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543014C852
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF76E554;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C1C6E378;
 Wed, 19 Jun 2019 11:54:28 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdZAU-0004pM-0A; Wed, 19 Jun 2019 11:54:22 +0000
Date: Wed, 19 Jun 2019 04:54:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190619115421.GB19138@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
 <20190615141435.GF17724@infradead.org>
 <20190618151100.GI6961@ziepe.ca>
 <20190619081858.GB24900@infradead.org>
 <20190619113452.GB9360@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619113452.GB9360@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZMXqazDQazrKKSlfFDYmUFpilZIibnGHtDfXdH5dHKE=; b=k0xGPIpKWDBE1uNoMaB6BA8Rj
 J14iEyyGUyAtE4tSq7WhsgKGCuRN9es82gkxyNp9nSgEg7726Fp5Q6j8njKnjZw1TL2kIzgkhhW/B
 KNeWruWnKckQqgS6VEq6LV0yJnSYlTho5MCkjXZAbyoi1aFDSWffvabKy9p1PRMW4YP8nhrqvgXZe
 EB7qiBw+50HfBshE8hvrxSxfpGqjP4LVX2zgDyH8wUfEe3zTn3IN+1WKe21I1yyVcdCz3X5t8c3G0
 chcINAU+cS2mR0PgkXz7kwPZ6jT4aWdw4B+PfSbOUGeJagOxjTH/Ku4GUj/Cvtahzx7Xje2r6IiHm
 EK+xNL6wQ==;
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDg6MzQ6NTJBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IC8qKgo+ICAqIGxpc3RfZW1wdHlfY2FyZWZ1bCAtIHRlc3RzIHdoZXRoZXIgYSBs
aXN0IGlzIGVtcHR5IGFuZCBub3QgYmVpbmcgbW9kaWZpZWQKPiAgKiBAaGVhZDogdGhlIGxpc3Qg
dG8gdGVzdAo+ICAqCj4gICogRGVzY3JpcHRpb246Cj4gICogdGVzdHMgd2hldGhlciBhIGxpc3Qg
aXMgZW1wdHkgX2FuZF8gY2hlY2tzIHRoYXQgbm8gb3RoZXIgQ1BVIG1pZ2h0IGJlCj4gICogaW4g
dGhlIHByb2Nlc3Mgb2YgbW9kaWZ5aW5nIGVpdGhlciBtZW1iZXIgKG5leHQgb3IgcHJldikKPiAg
Kgo+ICAqIE5PVEU6IHVzaW5nIGxpc3RfZW1wdHlfY2FyZWZ1bCgpIHdpdGhvdXQgc3luY2hyb25p
emF0aW9uCj4gICogY2FuIG9ubHkgYmUgc2FmZSBpZiB0aGUgb25seSBhY3Rpdml0eSB0aGF0IGNh
biBoYXBwZW4KPiAgKiB0byB0aGUgbGlzdCBlbnRyeSBpcyBsaXN0X2RlbF9pbml0KCkuIEVnLiBp
dCBjYW5ub3QgYmUgdXNlZAo+ICAqIGlmIGFub3RoZXIgQ1BVIGNvdWxkIHJlLWxpc3RfYWRkKCkg
aXQuCj4gICovCj4gCj4gQWdyZWUgaXQgZG9lc24ndCBzZWVtIG9idmlvdXMgd2h5IHRoaXMgaXMg
cmVsZXZhbnQgd2hlbiBjaGVja2luZyB0aGUKPiBsaXN0IGhlYWQuLgo+IAo+IE1heWJlIHRoZSBj
b21tZW50IGlzIGEgYml0IG1pc2xlYWRpbmc/CgpGcm9tIGxvb2tpbmcgYXQgdGhlIGNvbW1pdCBs
b2cgaW4gdGhlIGhpc3RvcnkgdHJlZSBsaXN0X2VtcHR5X2NhcmVmdWwKd2FzIGluaXRpYWxseSBh
ZGRlZCBieSBMaW51cywgYW5kIHRoZW4gbWluZ28gYWRkZWQgdGhhdCBjb21tZW50IGxhdGVyLgpJ
IGRvbid0IHNlZSBob3cgbGlzdF9kZWxfaW5pdCB3b3VsZCBjaGFuZ2UgYW55dGhpbmcgaGVyZSwg
c28gSSBzdXNwZWN0Cmxpc3RfZGVsX2luaXQgd2FzIGp1c3QgdXNlZCBhcyBhIHNob3J0IGhhbmQg
Zm9yIGxpc3RfZGVsIG9yCmxpc3RfZGVsX2luaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
