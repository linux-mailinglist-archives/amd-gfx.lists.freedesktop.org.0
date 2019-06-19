Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F34C84B
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDDE6E542;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCABE6E378;
 Wed, 19 Jun 2019 12:03:54 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hdZJg-0000AR-8n; Wed, 19 Jun 2019 12:03:52 +0000
Date: Wed, 19 Jun 2019 05:03:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190619120352.GA31563@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
 <20190615142106.GK17724@infradead.org>
 <20190618004509.GE30762@ziepe.ca>
 <20190618053733.GA25048@infradead.org>
 <be4f8573-6284-04a6-7862-23bb357bfe3c@amd.com>
 <20190619080705.GA5164@infradead.org>
 <20190619115632.GC9360@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619115632.GC9360@ziepe.ca>
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
 bh=rpMV7cbut4s+IQIkL5i+Lot01IcGhFHyq5nHVaZpyng=; b=A3pdiP1QbGW7j1ii05qxyfW2d
 z2qWT3JMlbvwTaaGM6TU/h2nYOMIvaXje6Q6y4HsvNBZc0iGHnfDo+NQ+G0p6dmIxFeBGpgH6qk94
 Qz8DrSDN+V1whr/dlswoX96DK23SXFL9fT7XsSjbiwXmAy95IK66enm+Ch1PvM7tn+mByWUHILn5t
 7+3TE7IgkaNMpg25l4tHj+JHg5MHS3C+ZGVeA1WZoGfjO+BBNSq5pFAl385pU0bkwQkM0g0LWFXoq
 opbr1HMuE4YnTZ1cNQkIBJSa1mkUsWPaDzcEFkaIEBG6o4aSkJJ93fstPOWzbSe/gISzlgPwN0WGz
 qh7SYpIgA==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDg6NTY6MzJBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoaXMgbG9va3MgYSBsb3QgbGlrZSB0aGUgT0RQIGNvZGUgKGFtZGdwdV9tbl9u
b2RlID09IGliX3VtZW1fb2RwKQo+IAo+IFRoZSBpbnRlcnZhbCB0cmVlIGlzIHRvIHF1aWNrbHkg
ZmluZCB0aGUgZHJpdmVyIG9iamVjdChzKSB0aGF0IGhhdmUKPiB0aGUgdmlydHVhbCBwYWdlcyBk
dXJpbmcgaW52YWxpZGF0aW9uOgo+IAo+IHN0YXRpYyBpbnQgYW1kZ3B1X21uX3N5bmNfcGFnZXRh
Ymxlc19nZngoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgaG1tX3VwZGF0ZSAqdXBkYXRlKQo+IHsKPiAgICAgICAgIGl0ID0g
aW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0KCZhbW4tPm9iamVjdHMsIHN0YXJ0LCBlbmQpOwo+ICAg
ICAgICAgd2hpbGUgKGl0KSB7Cj4gICAgICAgICAgICAgICAgIFsuLl0KPiAgICAgICAgICAgICAg
ICAgYW1kZ3B1X21uX2ludmFsaWRhdGVfbm9kZShub2RlLCBzdGFydCwgZW5kKTsKPiAKPiBBbmQg
Zm9sbG93aW5nIHRoZSBPRFAgbW9kZWwgdGhlcmUgc2hvdWxkIGJlIGEgc2luZ2xlIGhtbV9taXJy
b3IgcGVyLW1tCj4gKHVzZXIgY2FuIGZvcmsgYW5kIHN0dWZmLCB0aGlzIGlzIHNvbWV0aGluZyBJ
IHdhbnQgdG8gaGF2ZSBjb3JlIGNvZGUKPiBoZWxwIHdpdGgpLiAKClRoYXQgbWFrZXMgdGhlIGht
bV9taXJyb3Igb2JqZWN0IHByZXR0eSBzaWxseSwgdGhvdWdoIGFzIHRoZSBzY29wZQppcyB0aGVu
IGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIG1tdV9ub3RpZmllciBpdHNlbGYuCgo+IFRoZSBobW1f
bWlycm9yIGNhbiBlaXRoZXIgZXhpc3Qgc28gbG9uZyBhcyBvYmplY3RzIGV4aXN0LCBvciBpdCBj
YW4KPiBleGlzdCB1bnRpbCB0aGUgY2hhcmRldiBpcyBjbG9zZWQgLSBidXQgbmV2ZXIgbG9uZ2Vy
IHRoYW4gdGhlCj4gY2hhcmRldidzIGxpZmV0aW1lLgo+IAo+IE1heWJlIHdlIHNob3VsZCBiZSBj
b25zaWRlcmluZyBwcm92aWRpbmcgYSBtbXUgbm90aWZpZXIgJiBpbnRlcnZhbAo+IHRyZWUgJiBs
b2NrIGFic3RyYWN0aW9uIHNpbmNlIE9EUCAmIEFNRCBhcmUgdmVyeSBzaW1pbGFyIGhlcmUuLgoK
SXQgZGVmaW50aXZlbHkgc291bmRzIGxpa2UgYSBnb29kIGlkZWEgdG8gbW92ZSB0aGlzIGtpbmQg
b2Ygb2JqZWN0Cm1hbmFnZW1lbnQgaW50byBjb21tb24gY29kZS4gIE5vdXZlYSBhY3R1YWxseSBz
ZWVtcyBsaWtlIHRoZSBvZGQgb25lCm91dCBoZXJlIGJ5IG5vdCBoYXZpbmcgYSBsaXN0IG9mIG9i
amVjdHMgYmVsb3cgdGhlIG1pcnJvciwgYnV0IHRoZW4KYWdhaW4gYW5kIGludGVydmFsIHRyZWUg
d2l0aCBhIHNpbmdsZSBlbnRyeSB3b3VsZG4ndCByZWFsbHkgaHVydCBpdAplaXRoZXIuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
