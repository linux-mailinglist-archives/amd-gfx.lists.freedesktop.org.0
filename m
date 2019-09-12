Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFDB18E3
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E5B6EEA4;
	Fri, 13 Sep 2019 07:24:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174446EC54;
 Thu, 12 Sep 2019 08:26:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6EA70227A81; Thu, 12 Sep 2019 10:26:48 +0200 (CEST)
Date: Thu, 12 Sep 2019 10:26:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/4] mm/hmm: allow snapshot of the special zero page
Message-ID: <20190912082648.GB14368@lst.de>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
 <20190911222829.28874-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911222829.28874-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:56 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDM6Mjg6MjdQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gQWxsb3cgaG1tX3JhbmdlX2ZhdWx0KCkgdG8gcmV0dXJuIHN1Y2Nlc3MgKDApIHdo
ZW4gdGhlIENQVSBwYWdldGFibGUKPiBlbnRyeSBwb2ludHMgdG8gdGhlIHNwZWNpYWwgc2hhcmVk
IHplcm8gcGFnZS4KPiBUaGUgY2FsbGVyIGNhbiB0aGVuIGhhbmRsZSB0aGUgemVybyBwYWdlIGJ5
IHBvc3NpYmx5IGNsZWFyaW5nIGRldmljZQo+IHByaXZhdGUgbWVtb3J5IGluc3RlYWQgb2YgRE1B
aW5nIGEgemVybyBwYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2Ft
cGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IENjOiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgbW0vaG1tLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggMDYwNDFkNDM5OWZmLi43MjE3OTEyYmVm
MTMgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC01MzIsNyAr
NTMyLDcgQEAgc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wdGUoc3RydWN0IG1tX3dhbGsgKndh
bGssIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgCQkJcmV0dXJuIC1FQlVTWTsKPiAgCX0gZWxzZSBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUwpICYmIHB0ZV9zcGVjaWFs
KHB0ZSkpIHsKPiAgCQkqcGZuID0gcmFuZ2UtPnZhbHVlc1tITU1fUEZOX1NQRUNJQUxdOwo+IC0J
CXJldHVybiAtRUZBVUxUOwo+ICsJCXJldHVybiBpc196ZXJvX3BmbihwdGVfcGZuKHB0ZSkpID8g
MCA6IC1FRkFVTFQ7CgpBbnkgY2hhbmNlIHRvIGp1c3QgdXNlIGEgbm9ybWFsIGlmIGhlcmU6CgoJ
CWlmICghaXNfemVyb19wZm4ocHRlX3BmbihwdGUpKSkKCQkJcmV0dXJuIC1FRkFVTFQ7CgkJcmV0
dXJuIDA7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
