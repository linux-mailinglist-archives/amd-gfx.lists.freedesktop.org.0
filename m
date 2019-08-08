Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51285C1F
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 09:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D476E7CA;
	Thu,  8 Aug 2019 07:52:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579886E45B;
 Thu,  8 Aug 2019 07:07:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3426E68B02; Thu,  8 Aug 2019 09:07:02 +0200 (CEST)
Date: Thu, 8 Aug 2019 09:07:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
Message-ID: <20190808070701.GC29382@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807150214.3629-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:52:54 +0000
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
 Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDg6MDI6MTRBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gV2hlbiBtZW1vcnkgaXMgbWlncmF0ZWQgdG8gdGhlIEdQVSBpdCBpcyBsaWtlbHkg
dG8gYmUgYWNjZXNzZWQgYnkgR1BVCj4gY29kZSBzb29uIGFmdGVyd2FyZHMuIEluc3RlYWQgb2Yg
d2FpdGluZyBmb3IgYSBHUFUgZmF1bHQsIG1hcCB0aGUKPiBtaWdyYXRlZCBtZW1vcnkgaW50byB0
aGUgR1BVIHBhZ2UgdGFibGVzIHdpdGggdGhlIHNhbWUgYWNjZXNzIHBlcm1pc3Npb25zCj4gYXMg
dGhlIHNvdXJjZSBDUFUgcGFnZSB0YWJsZSBlbnRyaWVzLiBUaGlzIHByZXNlcnZlcyBjb3B5IG9u
IHdyaXRlCj4gc2VtYW50aWNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxy
Y2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiBDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgo+IC0tLQo+IAo+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdG9wIG9mIENocmlz
dG9waCBIZWxsd2lnJ3MgOSBwYXRjaCBzZXJpZXMKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tbS8yMDE5MDcyOTIzNDYxMS5HQzcxNzFAcmVkaGF0LmNvbS9ULyN1Cj4gInR1cm4gdGhl
IGhtbSBtaWdyYXRlX3ZtYSB1cHNpZGUgZG93biIgYnV0IHdpdGhvdXQgcGF0Y2ggOQo+ICJtbTog
cmVtb3ZlIHRoZSB1bnVzZWQgTUlHUkFURV9QRk5fV1JJVEUiIGFuZCBhZGRzIGEgdXNlIGZvciB0
aGUgZmxhZy4KClRoaXMgbG9va3MgdXNlZnVsLiAgSSd2ZSBhbHJlYWR5IGRyb3BwZWQgdGhhdCBw
YXRjaCBmb3IgdGhlIHBlbmRpbmcKcmVzZW5kLgoKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91
dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gLQkJ
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNp
Z25lZCBsb25nIHNyYywgZG1hX2FkZHJfdCAqZG1hX2FkZHIpCj4gKwkJc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3JjLAo+ICsJCWRtYV9hZGRyX3QgKmRtYV9hZGRy
LCB1NjQgKnBmbikKCkknbGwgcGljayB1cCB0aGUgcmVtb3ZhbCBvZiB0aGUgbm90IG5lZWRlZCBh
ZGRyIGFyZ3VtZW50IGZvciB0aGUgcGF0Y2gKaW50cm9kdWNpbmcgbm91dmVhdV9kbWVtX21pZ3Jh
dGVfY29weV9vbmUsIHRoYW5rcywKCj4gIHN0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9taWdyYXRl
X2NodW5rKHN0cnVjdCBtaWdyYXRlX3ZtYSAqYXJncywKPiAtCQlzdHJ1Y3Qgbm91dmVhdV9kcm0g
KmRybSwgZG1hX2FkZHJfdCAqZG1hX2FkZHJzKQo+ICsJCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
LCBkbWFfYWRkcl90ICpkbWFfYWRkcnMsIHU2NCAqcGZucykKPiAgewo+ICAJc3RydWN0IG5vdXZl
YXVfZmVuY2UgKmZlbmNlOwo+ICAJdW5zaWduZWQgbG9uZyBhZGRyID0gYXJncy0+c3RhcnQsIG5y
X2RtYSA9IDAsIGk7Cj4gIAo+ICAJZm9yIChpID0gMDsgYWRkciA8IGFyZ3MtPmVuZDsgaSsrKSB7
Cj4gIAkJYXJncy0+ZHN0W2ldID0gbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoZHJtLCBh
cmdzLT52bWEsCj4gLQkJCQlhZGRyLCBhcmdzLT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSk7
Cj4gKwkJCQlhcmdzLT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSwgJnBmbnNbaV0pOwoKTml0
OiBJIGZpbmQgdGhlICZwZm5zW2ldIHdheSB0byBwYXNzIHRoZSBhcmd1bWVudCBhIGxpdHRsZSB3
ZWlyZCB0byByZWFkLgpXaHkgbm90ICJwZm5zICsgaSI/Cgo+ICt1NjQgKgo+ICtub3V2ZWF1X3Bm
bnNfYWxsb2ModW5zaWduZWQgbG9uZyBucGFnZXMpCj4gK3sKPiArCXN0cnVjdCBub3V2ZWF1X3Bm
bm1hcF9hcmdzICphcmdzOwo+ICsKPiArCWFyZ3MgPSBremFsbG9jKHNpemVvZigqYXJncykgKyBu
cGFnZXMgKiBzaXplb2YoYXJncy0+cC5waHlzWzBdKSwKCkNhbiB3ZSB1c2Ugc3RydWN0X3NpemUg
aGVyZT8KCj4gKwlpbnQgcmV0Owo+ICsKPiArCWlmICghc3ZtKQo+ICsJCXJldHVybjsKPiArCj4g
KwltdXRleF9sb2NrKCZzdm0tPm11dGV4KTsKPiArCXN2bW0gPSBub3V2ZWF1X2ZpbmRfc3ZtbShz
dm0sIG1tKTsKPiArCWlmICghc3ZtbSkgewo+ICsJCW11dGV4X3VubG9jaygmc3ZtLT5tdXRleCk7
Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsJbXV0ZXhfdW5sb2NrKCZzdm0tPm11dGV4KTsKCkdpdmVu
IHRoYXQgbm91dmVhdV9maW5kX3N2bW0gZG9lc24ndCB0YWtlIGFueSBraW5kIG9mIHJlZmVyZW5j
ZSwgd2hhdApndXJhbnRlZXMgc3ZtbSBkb2Vzbid0IGdvIGF3YXkgYWZ0ZXIgZHJvcHBpbmcgdGhl
IGxvY2s/Cgo+IEBAIC00NCw1ICs0OSwxOSBAQCBzdGF0aWMgaW5saW5lIGludCBub3V2ZWF1X3N2
bW1fYmluZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2aWNlLCB2b2lkICpwLAo+ICB7Cj4gIAlyZXR1
cm4gLUVOT1NZUzsKPiAgfQo+ICsKPiArdTY0ICpub3V2ZWF1X3BmbnNfYWxsb2ModW5zaWduZWQg
bG9uZyBucGFnZXMpCj4gK3sKPiArCXJldHVybiBOVUxMOwo+ICt9Cj4gKwo+ICt2b2lkIG5vdXZl
YXVfcGZuc19mcmVlKHU2NCAqcGZucykKPiArewo+ICt9Cj4gKwo+ICt2b2lkIG5vdXZlYXVfcGZu
c19tYXAoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICsJ
CSAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBsb25nIG5wYWdl
cykKPiArewo+ICt9Cj4gICNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19EUk1fTk9VVkVBVV9T
Vk0pICovCgpub3V2ZWF1X2RtZW0uYyBhbmQgbm91dmVhdV9zdm0uYyBhcmUgYm90aCBidWlsdCBj
b25kaXRpb25hbCBvbgpDT05GSUdfRFJNX05PVVZFQVVfU1ZNLCBzbyB0aGVyZSBpcyBubyBuZWVk
IGZvciBzdHVicyBoZXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
