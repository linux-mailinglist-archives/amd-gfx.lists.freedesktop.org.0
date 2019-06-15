Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B45475A4
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0A890C8;
	Sun, 16 Jun 2019 15:53:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4FC89274;
 Sat, 15 Jun 2019 13:59:10 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9D0-00057j-88; Sat, 15 Jun 2019 13:59:06 +0000
Date: Sat, 15 Jun 2019 06:59:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 02/12] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190615135906.GB17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-3-jgg@ziepe.ca>
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
 bh=uw+8Gsob+xo/SGAw3aMo5AOaLhno7qEOpvZ++8fuMSg=; b=SghgOUqONoSRbIHgI8mPRhVMT
 twgH3naz+biFngZQOZd3Gfiqe8dVH42nugcD5e0Tep/6FkDlqVGXX8DlYOQhyRRP6O7klcnieXo6i
 jjlWR3luZbcxwFtG0w3KW2LSIGImE5ebS3p7jjD9mPgIU2cJ/x+/iiSAFR3Fg82dE+1fzRwqKEH/h
 Qdaga43CwL64GRoC9uL+zhZeMgz+tE9LTXAFyT71viusNdb66qP93qtAQnYFYqKjCTVSTAa2XiEkP
 ZZPRbeKA7C1RqLqGOWq8mHy5rS6D0nKeKB/hd12WNrXe6DiUV4EaD/0y/ZC6hyyT0vzri7JJQ6WkG
 r0yItbY3w==;
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDBQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBS
YWxwaCBvYnNlcnZlcyB0aGF0IGhtbV9yYW5nZV9yZWdpc3RlcigpIGNhbiBvbmx5IGJlIGNhbGxl
ZCBieSBhIGRyaXZlcgo+IHdoaWxlIGEgbWlycm9yIGlzIHJlZ2lzdGVyZWQuIE1ha2UgdGhpcyBj
bGVhciBpbiB0aGUgQVBJIGJ5IHBhc3NpbmcgaW4gdGhlCj4gbWlycm9yIHN0cnVjdHVyZSBhcyBh
IHBhcmFtZXRlci4KPiAKPiBUaGlzIGFsc28gc2ltcGxpZmllcyB1bmRlcnN0YW5kaW5nIHRoZSBs
aWZldGltZSBtb2RlbCBmb3Igc3RydWN0IGhtbSwgYXMKPiB0aGUgaG1tIHBvaW50ZXIgbXVzdCBi
ZSB2YWxpZCBhcyBwYXJ0IG9mIGEgcmVnaXN0ZXJlZCBtaXJyb3Igc28gYWxsIHdlCj4gbmVlZCBp
biBobW1fcmVnaXN0ZXJfcmFuZ2UoKSBpcyBhIHNpbXBsZSBrcmVmX2dldC4KCkxvb2tzIGdvb2Qs
IGF0IGxlYXN0IGFuIGFuIGludGVybWVkaWF0ZSBzdGVwOgoKUmV2aWV3ZWQtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKPiBpbmRleCBmNjk1NmQ3OGUzY2IyNS4uMjJhOTdhZGEx
MDhiNGUgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC05MTQs
MTMgKzkxNCwxMyBAQCBzdGF0aWMgdm9pZCBobW1fcGZuc19jbGVhcihzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwKPiAgICogVHJhY2sgdXBkYXRlcyB0byB0aGUgQ1BVIHBhZ2UgdGFibGUgc2VlIGlu
Y2x1ZGUvbGludXgvaG1tLmgKPiAgICovCj4gIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UsCj4gLQkJICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICsJ
CSAgICAgICBzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLAo+ICAJCSAgICAgICB1bnNpZ25lZCBs
b25nIHN0YXJ0LAo+ICAJCSAgICAgICB1bnNpZ25lZCBsb25nIGVuZCwKPiAgCQkgICAgICAgdW5z
aWduZWQgcGFnZV9zaGlmdCkKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBtYXNrID0gKCgxVUwgPDwg
cGFnZV9zaGlmdCkgLSAxVUwpOwo+IC0Jc3RydWN0IGhtbSAqaG1tOwo+ICsJc3RydWN0IGhtbSAq
aG1tID0gbWlycm9yLT5obW07Cj4gIAo+ICAJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4gIAlyYW5n
ZS0+aG1tID0gTlVMTDsKPiBAQCAtOTM0LDIwICs5MzQsMTUgQEAgaW50IGhtbV9yYW5nZV9yZWdp
c3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiAgCXJhbmdlLT5zdGFydCA9IHN0YXJ0Owo+
ICAJcmFuZ2UtPmVuZCA9IGVuZDsKCkJ1dCB3aGlsZSB5b3UncmUgYXQgaXQ6ICB0aGUgY2FsbGlu
ZyBjb252ZW50aW9ucyBvZiBobW1fcmFuZ2VfcmVnaXN0ZXIKYXJlIHN0aWxsIHJhdGhlciBvZGQs
IGFzIHRoZSBzdGFldCwgZW5kIGFuZCBwYWdlX3NoaWZ0IGFyZ3VtZW50cyBhcmUKb25seSB1c2Vk
IHRvIGZpbGwgb3V0IGZpZWxkcyBpbiB0aGUgcmFuZ2Ugc3RydWN0dXJlIHBhc3NlZCBpbi4gIE1p
Z2h0CmJlIHdvcnRoIGNsZWFuaW5nIHVwIGFzIHdlbGwgaWYgd2UgY2hhbmdlIHRoZSBjYWxsaW5n
IGNvbnZlbnRpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
