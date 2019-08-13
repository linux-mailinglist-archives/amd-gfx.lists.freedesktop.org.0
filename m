Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AB38C407
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 23:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE826E0BE;
	Tue, 13 Aug 2019 21:58:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117A46E091;
 Tue, 13 Aug 2019 21:58:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94BE013A82;
 Tue, 13 Aug 2019 21:58:56 +0000 (UTC)
Received: from redhat.com (ovpn-120-92.rdu2.redhat.com [10.10.120.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 950DC82E54;
 Tue, 13 Aug 2019 21:58:54 +0000 (UTC)
Date: Tue, 13 Aug 2019 17:58:52 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
Message-ID: <20190813215852.GA9823@redhat.com>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807150214.3629-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 13 Aug 2019 21:58:56 +0000 (UTC)
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
ZWRoYXQuY29tPgoKU29ycnkgZm9yIGRlbGF5IGkgYW0gc3dhbXAsIGNvdXBsZSBpc3N1ZXM6CiAg
ICAtIG5vdXZlYXVfcGZuc19tYXAoKSBpcyBuZXZlciBjYWxsLCBpdCBzaG91bGQgYmUgY2FsbCBh
ZnRlcgogICAgICB0aGUgZG1hIGNvcHkgaXMgZG9uZSAoaWlyYyBpdCBpcyBsYWNraW5nIHByb3Bl
ciBmZW5jaW5nCiAgICAgIHNvIHRoYXQgd291bGQgbmVlZCB0byBiZSBpbXBsZW1lbnRlZCBmaXJz
dCkKCiAgICAtIHRoZSBtaWdyYXRlIGlvY3RsIGlzIGRpc2Nvbm5lY3RlZCBmcm9tIHRoZSBzdm0g
cGFydCBhbmQKICAgICAgdGh1cyB3ZSB3b3VsZCBuZWVkIGZpcnN0IHRvIGltcGxlbWVudCBzdm0g
cmVmZXJlbmNlIGNvdW50aW5nCiAgICAgIGFuZCB0YWtlIGEgcmVmZXJlbmNlIGF0IGJlZ2luaW5n
IG9mIG1pZ3JhdGlvbiBwcm9jZXNzIGFuZAogICAgICByZWxlYXNlIGl0IGF0IHRoZSBlbmQgaWUg
c3RydWN0IG5vdXZlYXVfc3ZtbSBuZWVkcyByZWZjb3VudGluZwogICAgICBvZiBzb21lIHNvcnQu
IEkgbGV0IEJlbiBkZWNpZGVzIHdoYXQgaGUgbGlrZXMgYmVzdCBmb3IgdGhhdC4KCiAgICAtIGkg
cmF0aGVyIG5vdCBoYXZlIGFuIGV4dHJhIHBmbnMgYXJyYXksIGkgYW0gcHJldHR5IHN1cmUgd2UK
ICAgICAgY2FuIGRpcmVjdGx5IGZlZWQgd2hhdCB3ZSBnZXQgZnJvbSB0aGUgZG1hIGFycmF5IHRv
IHRoZSBzdm0KICAgICAgY29kZSB0byB1cGRhdGUgdGhlIEdQVSBwYWdlIHRhYmxlCgpPYnNlcnZh
dGlvbiB0aGF0IGNhbiBiZSBkZWxheWVkIHRvIGxhdHRlciBwYXRjaGVzOgogICAgLSBpIGRvIG5v
dCB0aGluayB3ZSB3YW50IHRvIG1hcCBkaXJlY3RseSBpZiB0aGUgZG1hIGVuZ2luZQogICAgICBp
cyBxdWV1ZSB1cCBhbmQgdGh1cyBpZiB0aGUgZmVuY2Ugd2lsbCB0YWtlIHRpbWUgdG8gc2lnbmFs
CgogICAgICBUaGlzIGlzIHdoeSBpIGRpZCBub3QgaW1wbGVtZW50IHRoaXMgaW4gdGhlIGZpcnN0
IHBsYWNlLgogICAgICBNYXliZSB1c2luZyBhIHdvcmtxdWV1ZSB0byBzY2hlZHVsZSBhIHByZS1m
aWxsIG9mIHRoZSBHUFUKICAgICAgcGFnZSB0YWJsZSBhbmQgd2FrZXVwIHRoZSB3b3JrcXVldWUg
d2l0aCB0aGUgZmVuY2Ugbm90aWZ5CiAgICAgIGV2ZW50LgoKCj4gLS0tCj4gCj4gVGhpcyBwYXRj
aCBpcyBiYXNlZCBvbiB0b3Agb2YgQ2hyaXN0b3BoIEhlbGx3aWcncyA5IHBhdGNoIHNlcmllcwo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMTkwNzI5MjM0NjExLkdDNzE3MUBy
ZWRoYXQuY29tL1QvI3UKPiAidHVybiB0aGUgaG1tIG1pZ3JhdGVfdm1hIHVwc2lkZSBkb3duIiBi
dXQgd2l0aG91dCBwYXRjaCA5Cj4gIm1tOiByZW1vdmUgdGhlIHVudXNlZCBNSUdSQVRFX1BGTl9X
UklURSIgYW5kIGFkZHMgYSB1c2UgZm9yIHRoZSBmbGFnLgo+IAo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDQ1ICsrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgIHwgODYgKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uaCAgfCAxOSArKysr
KysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiBpbmRleCBlZjlkZTgy
YjA3NDQuLmM4M2U2ZjExODgxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RtZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZG1lbS5jCj4gQEAgLTI1LDExICsyNSwxMyBAQAo+ICAjaW5jbHVkZSAibm91dmVhdV9kbWEuaCIK
PiAgI2luY2x1ZGUgIm5vdXZlYXVfbWVtLmgiCj4gICNpbmNsdWRlICJub3V2ZWF1X2JvLmgiCj4g
KyNpbmNsdWRlICJub3V2ZWF1X3N2bS5oIgo+ICAKPiAgI2luY2x1ZGUgPG52aWYvY2xhc3MuaD4K
PiAgI2luY2x1ZGUgPG52aWYvb2JqZWN0Lmg+Cj4gICNpbmNsdWRlIDxudmlmL2lmNTAwYi5oPgo+
ICAjaW5jbHVkZSA8bnZpZi9pZjkwMGIuaD4KPiArI2luY2x1ZGUgPG52aWYvaWYwMDBjLmg+Cj4g
IAo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2htbS5o
Pgo+IEBAIC01NjAsMTEgKzU2MiwxMiBAQCBub3V2ZWF1X2RtZW1faW5pdChzdHJ1Y3Qgbm91dmVh
dV9kcm0gKmRybSkKPiAgfQo+ICAKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91dmVhdV9kbWVt
X21pZ3JhdGVfY29weV9vbmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gLQkJc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNpZ25lZCBsb25n
IHNyYywgZG1hX2FkZHJfdCAqZG1hX2FkZHIpCj4gKwkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsIHVuc2lnbmVkIGxvbmcgc3JjLAo+ICsJCWRtYV9hZGRyX3QgKmRtYV9hZGRyLCB1NjQgKnBm
bikKPiAgewo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gZHJtLT5kZXYtPmRldjsKPiAgCXN0cnVj
dCBwYWdlICpkcGFnZSwgKnNwYWdlOwo+ICsJdW5zaWduZWQgbG9uZyBwYWRkcjsKPiAgCj4gIAlz
cGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2Uoc3JjKTsKPiAgCWlmICghc3BhZ2UgfHwgIShzcmMg
JiBNSUdSQVRFX1BGTl9NSUdSQVRFKSkKPiBAQCAtNTcyLDE3ICs1NzUsMjEgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoc3RydWN0IG5vdXZlYXVf
ZHJtICpkcm0sCj4gIAo+ICAJZHBhZ2UgPSBub3V2ZWF1X2RtZW1fcGFnZV9hbGxvY19sb2NrZWQo
ZHJtKTsKPiAgCWlmICghZHBhZ2UpCj4gLQkJcmV0dXJuIDA7Cj4gKwkJZ290byBvdXQ7Cj4gIAo+
ICAJKmRtYV9hZGRyID0gZG1hX21hcF9wYWdlKGRldiwgc3BhZ2UsIDAsIFBBR0VfU0laRSwgRE1B
X0JJRElSRUNUSU9OQUwpOwo+ICAJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgKmRtYV9hZGRy
KSkKPiAgCQlnb3RvIG91dF9mcmVlX3BhZ2U7Cj4gIAo+ICsJcGFkZHIgPSBub3V2ZWF1X2RtZW1f
cGFnZV9hZGRyKGRwYWdlKTsKPiAgCWlmIChkcm0tPmRtZW0tPm1pZ3JhdGUuY29weV9mdW5jKGRy
bSwgMSwgTk9VVkVBVV9BUEVSX1ZSQU0sCj4gLQkJCW5vdXZlYXVfZG1lbV9wYWdlX2FkZHIoZHBh
Z2UpLCBOT1VWRUFVX0FQRVJfSE9TVCwKPiAtCQkJKmRtYV9hZGRyKSkKPiArCQkJcGFkZHIsIE5P
VVZFQVVfQVBFUl9IT1NULCAqZG1hX2FkZHIpKQo+ICAJCWdvdG8gb3V0X2RtYV91bm1hcDsKPiAg
Cj4gKwkqcGZuID0gTlZJRl9WTU1fUEZOTUFQX1YwX1YgfCBOVklGX1ZNTV9QRk5NQVBfVjBfVlJB
TSB8Cj4gKwkJKChwYWRkciA+PiBQQUdFX1NISUZUKSA8PCBOVklGX1ZNTV9QRk5NQVBfVjBfQURE
Ul9TSElGVCk7Cj4gKwlpZiAoc3JjICYgTUlHUkFURV9QRk5fV1JJVEUpCj4gKwkJKnBmbiB8PSBO
VklGX1ZNTV9QRk5NQVBfVjBfVzsKPiAgCXJldHVybiBtaWdyYXRlX3BmbihwYWdlX3RvX3Bmbihk
cGFnZSkpIHwgTUlHUkFURV9QRk5fTE9DS0VEOwo+ICAKPiAgb3V0X2RtYV91bm1hcDoKPiBAQCAt
NTkwLDE4ICs1OTcsMTkgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91dmVhdV9kbWVtX21pZ3Jh
dGVfY29weV9vbmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gIG91dF9mcmVlX3BhZ2U6Cj4g
IAlub3V2ZWF1X2RtZW1fcGFnZV9mcmVlX2xvY2tlZChkcm0sIGRwYWdlKTsKPiAgb3V0Ogo+ICsJ
KnBmbiA9IE5WSUZfVk1NX1BGTk1BUF9WMF9OT05FOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9taWdyYXRlX2NodW5rKHN0cnVjdCBtaWdyYXRlX3Zt
YSAqYXJncywKPiAtCQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwgZG1hX2FkZHJfdCAqZG1hX2Fk
ZHJzKQo+ICsJCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBkbWFfYWRkcl90ICpkbWFfYWRkcnMs
IHU2NCAqcGZucykKPiAgewo+ICAJc3RydWN0IG5vdXZlYXVfZmVuY2UgKmZlbmNlOwo+ICAJdW5z
aWduZWQgbG9uZyBhZGRyID0gYXJncy0+c3RhcnQsIG5yX2RtYSA9IDAsIGk7Cj4gIAo+ICAJZm9y
IChpID0gMDsgYWRkciA8IGFyZ3MtPmVuZDsgaSsrKSB7Cj4gIAkJYXJncy0+ZHN0W2ldID0gbm91
dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoZHJtLCBhcmdzLT52bWEsCj4gLQkJCQlhZGRyLCBh
cmdzLT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSk7Cj4gKwkJCQlhcmdzLT5zcmNbaV0sICZk
bWFfYWRkcnNbbnJfZG1hXSwgJnBmbnNbaV0pOwo+ICAJCWlmIChhcmdzLT5kc3RbaV0pCj4gIAkJ
CW5yX2RtYSsrOwo+ICAJCWFkZHIgKz0gUEFHRV9TSVpFOwo+IEBAIC02MTUsMTAgKzYyMyw2IEBA
IHN0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9taWdyYXRlX2NodW5rKHN0cnVjdCBtaWdyYXRlX3Zt
YSAqYXJncywKPiAgCQlkbWFfdW5tYXBfcGFnZShkcm0tPmRldi0+ZGV2LCBkbWFfYWRkcnNbbnJf
ZG1hXSwgUEFHRV9TSVpFLAo+ICAJCQkJRE1BX0JJRElSRUNUSU9OQUwpOwo+ICAJfQo+IC0JLyoK
PiAtCSAqIEZJWE1FIG9wdGltaXphdGlvbjogdXBkYXRlIEdQVSBwYWdlIHRhYmxlIHRvIHBvaW50
IHRvIG5ld2x5IG1pZ3JhdGVkCj4gLQkgKiBtZW1vcnkuCj4gLQkgKi8KPiAgCW1pZ3JhdGVfdm1h
X2ZpbmFsaXplKGFyZ3MpOwo+ICB9Cj4gIAo+IEBAIC02MzEsMTEgKzYzNSwxMiBAQCBub3V2ZWF1
X2RtZW1fbWlncmF0ZV92bWEoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gIAl1bnNpZ25lZCBs
b25nIG5wYWdlcyA9IChlbmQgLSBzdGFydCkgPj4gUEFHRV9TSElGVDsKPiAgCXVuc2lnbmVkIGxv
bmcgbWF4ID0gbWluKFNHX01BWF9TSU5HTEVfQUxMT0MsIG5wYWdlcyk7Cj4gIAlkbWFfYWRkcl90
ICpkbWFfYWRkcnM7Cj4gKwl1NjQgKnBmbnM7Cj4gIAlzdHJ1Y3QgbWlncmF0ZV92bWEgYXJncyA9
IHsKPiAgCQkudm1hCQk9IHZtYSwKPiAgCQkuc3RhcnQJCT0gc3RhcnQsCj4gIAl9Owo+IC0JdW5z
aWduZWQgbG9uZyBjLCBpOwo+ICsJdW5zaWduZWQgbG9uZyBpOwo+ICAJaW50IHJldCA9IC1FTk9N
RU07Cj4gIAo+ICAJYXJncy5zcmMgPSBrY2FsbG9jKG1heCwgc2l6ZW9mKGFyZ3Muc3JjKSwgR0ZQ
X0tFUk5FTCk7Cj4gQEAgLTY0OSwxOSArNjU0LDI1IEBAIG5vdXZlYXVfZG1lbV9taWdyYXRlX3Zt
YShzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKPiAgCWlmICghZG1hX2FkZHJzKQo+ICAJCWdvdG8g
b3V0X2ZyZWVfZHN0Owo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBucGFnZXM7IGkgKz0gYykgewo+
IC0JCWMgPSBtaW4oU0dfTUFYX1NJTkdMRV9BTExPQywgbnBhZ2VzKTsKPiAtCQlhcmdzLmVuZCA9
IHN0YXJ0ICsgKGMgPDwgUEFHRV9TSElGVCk7Cj4gKwlwZm5zID0gbm91dmVhdV9wZm5zX2FsbG9j
KG1heCk7Cj4gKwlpZiAoIXBmbnMpCj4gKwkJZ290byBvdXRfZnJlZV9kbWE7Cj4gKwo+ICsJZm9y
IChpID0gMDsgaSA8IG5wYWdlczsgaSArPSBtYXgpIHsKPiArCQlhcmdzLmVuZCA9IHN0YXJ0ICsg
KG1heCA8PCBQQUdFX1NISUZUKTsKPiAgCQlyZXQgPSBtaWdyYXRlX3ZtYV9zZXR1cCgmYXJncyk7
Cj4gIAkJaWYgKHJldCkKPiAtCQkJZ290byBvdXRfZnJlZV9kbWE7Cj4gKwkJCWdvdG8gb3V0X2Zy
ZWVfcGZuczsKPiAgCj4gIAkJaWYgKGFyZ3MuY3BhZ2VzKQo+IC0JCQlub3V2ZWF1X2RtZW1fbWln
cmF0ZV9jaHVuaygmYXJncywgZHJtLCBkbWFfYWRkcnMpOwo+ICsJCQlub3V2ZWF1X2RtZW1fbWln
cmF0ZV9jaHVuaygmYXJncywgZHJtLCBkbWFfYWRkcnMsCj4gKwkJCQkJCSAgIHBmbnMpOwo+ICAJ
CWFyZ3Muc3RhcnQgPSBhcmdzLmVuZDsKPiAgCX0KPiAgCj4gIAlyZXQgPSAwOwo+ICtvdXRfZnJl
ZV9wZm5zOgo+ICsJbm91dmVhdV9wZm5zX2ZyZWUocGZucyk7Cj4gIG91dF9mcmVlX2RtYToKPiAg
CWtmcmVlKGRtYV9hZGRycyk7Cj4gIG91dF9mcmVlX2RzdDoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfc3ZtLmMKPiBpbmRleCBhNzQ1MzBiNWE1MjMuLjNlNmQ3ZjIyNjU3NiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC03MCw2ICs3MCwxMiBAQCBz
dHJ1Y3Qgbm91dmVhdV9zdm0gewo+ICAjZGVmaW5lIFNWTV9EQkcocyxmLGEuLi4pIE5WX0RFQlVH
KChzKS0+ZHJtLCAic3ZtOiAiZiJcbiIsICMjYSkKPiAgI2RlZmluZSBTVk1fRVJSKHMsZixhLi4u
KSBOVl9XQVJOKChzKS0+ZHJtLCAic3ZtOiAiZiJcbiIsICMjYSkKPiAgCj4gK3N0cnVjdCBub3V2
ZWF1X3Bmbm1hcF9hcmdzIHsKPiArCXN0cnVjdCBudmlmX2lvY3RsX3YwIGk7Cj4gKwlzdHJ1Y3Qg
bnZpZl9pb2N0bF9tdGhkX3YwIG07Cj4gKwlzdHJ1Y3QgbnZpZl92bW1fcGZubWFwX3YwIHA7Cj4g
K307Cj4gKwo+ICBzdHJ1Y3Qgbm91dmVhdV9pdm1tIHsKPiAgCXN0cnVjdCBub3V2ZWF1X3N2bW0g
KnN2bW07Cj4gIAl1NjQgaW5zdDsKPiBAQCAtNzM0LDYgKzc0MCw4NiBAQCBub3V2ZWF1X3N2bV9m
YXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKPiAgCXJldHVybiBOVklGX05PVElGWV9L
RUVQOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdz
ICoKPiArbm91dmVhdV9wZm5zX3RvX2FyZ3Modm9pZCAqcGZucykKPiArewo+ICsJc3RydWN0IG52
aWZfdm1tX3Bmbm1hcF92MCAqcCA9Cj4gKwkJY29udGFpbmVyX29mKHBmbnMsIHN0cnVjdCBudmlm
X3ZtbV9wZm5tYXBfdjAsIHBoeXMpOwo+ICsKPiArCXJldHVybiBjb250YWluZXJfb2YocCwgc3Ry
dWN0IG5vdXZlYXVfcGZubWFwX2FyZ3MsIHApOwo+ICt9Cj4gKwo+ICt1NjQgKgo+ICtub3V2ZWF1
X3BmbnNfYWxsb2ModW5zaWduZWQgbG9uZyBucGFnZXMpCj4gK3sKPiArCXN0cnVjdCBub3V2ZWF1
X3Bmbm1hcF9hcmdzICphcmdzOwo+ICsKPiArCWFyZ3MgPSBremFsbG9jKHNpemVvZigqYXJncykg
KyBucGFnZXMgKiBzaXplb2YoYXJncy0+cC5waHlzWzBdKSwKPiArCQkJR0ZQX0tFUk5FTCk7Cj4g
KwlpZiAoIWFyZ3MpCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJYXJncy0+aS50eXBlID0gTlZJ
Rl9JT0NUTF9WMF9NVEhEOwo+ICsJYXJncy0+bS5tZXRob2QgPSBOVklGX1ZNTV9WMF9QRk5NQVA7
Cj4gKwlhcmdzLT5wLnBhZ2UgPSBQQUdFX1NISUZUOwo+ICsKPiArCXJldHVybiBhcmdzLT5wLnBo
eXM7Cj4gK30KPiArCj4gK3ZvaWQKPiArbm91dmVhdV9wZm5zX2ZyZWUodTY0ICpwZm5zKQo+ICt7
Cj4gKwlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJncyAqYXJncyA9IG5vdXZlYXVfcGZuc190b19h
cmdzKHBmbnMpOwo+ICsKPiArCWtmcmVlKGFyZ3MpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0
IG5vdXZlYXVfc3ZtbSAqCj4gK25vdXZlYXVfZmluZF9zdm1tKHN0cnVjdCBub3V2ZWF1X3N2bSAq
c3ZtLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiArewo+ICsJc3RydWN0IG5vdXZlYXVfaXZtbSAq
aXZtbTsKPiArCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGl2bW0sICZzdm0tPmluc3QsIGhlYWQp
IHsKPiArCQlpZiAoaXZtbS0+c3ZtbS0+bW0gPT0gbW0pCj4gKwkJCXJldHVybiBpdm1tLT5zdm1t
Owo+ICsJfQo+ICsJcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gK3ZvaWQKPiArbm91dmVhdV9wZm5z
X21hcChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gKwkJ
IHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKPiAr
ewo+ICsJc3RydWN0IG5vdXZlYXVfc3ZtICpzdm0gPSBkcm0tPnN2bTsKPiArCXN0cnVjdCBub3V2
ZWF1X3N2bW0gKnN2bW07Cj4gKwlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJncyAqYXJnczsKPiAr
CWludCByZXQ7Cj4gKwo+ICsJaWYgKCFzdm0pCj4gKwkJcmV0dXJuOwo+ICsKPiArCW11dGV4X2xv
Y2soJnN2bS0+bXV0ZXgpOwo+ICsJc3ZtbSA9IG5vdXZlYXVfZmluZF9zdm1tKHN2bSwgbW0pOwo+
ICsJaWYgKCFzdm1tKSB7Cj4gKwkJbXV0ZXhfdW5sb2NrKCZzdm0tPm11dGV4KTsKPiArCQlyZXR1
cm47Cj4gKwl9Cj4gKwltdXRleF91bmxvY2soJnN2bS0+bXV0ZXgpOwo+ICsKPiArCWFyZ3MgPSBu
b3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5zKTsKPiArCWFyZ3MtPnAuYWRkciA9IGFkZHI7Cj4gKwlh
cmdzLT5wLnNpemUgPSBucGFnZXMgPDwgUEFHRV9TSElGVDsKPiArCj4gKwltdXRleF9sb2NrKCZz
dm1tLT5tdXRleCk7Cj4gKwo+ICsJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIg
PSB0cnVlOwo+ICsJcmV0ID0gbnZpZl9vYmplY3RfaW9jdGwoJnN2bW0tPnZtbS0+dm1tLm9iamVj
dCwgYXJncywgc2l6ZW9mKCphcmdzKSArCj4gKwkJCQlucGFnZXMgKiBzaXplb2YoYXJncy0+cC5w
aHlzWzBdKSwgTlVMTCk7Cj4gKwlzdm1tLT52bW0tPnZtbS5vYmplY3QuY2xpZW50LT5zdXBlciA9
IGZhbHNlOwo+ICsKPiArCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgdm9pZAo+ICBub3V2ZWF1X3N2bV9mYXVsdF9idWZmZXJfZmluaShzdHJ1Y3Qgbm91dmVh
dV9zdm0gKnN2bSwgaW50IGlkKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfc3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5oCj4gaW5kZXggZTgzOWQ4MTg5NDYxLi5jMDBjMTc3ZTUxZWQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmgKPiBAQCAtMTgsNiArMTgsMTEgQEAgdm9pZCBub3V2ZWF1
X3N2bW1fZmluaShzdHJ1Y3Qgbm91dmVhdV9zdm1tICoqKTsKPiAgaW50IG5vdXZlYXVfc3ZtbV9q
b2luKHN0cnVjdCBub3V2ZWF1X3N2bW0gKiwgdTY0IGluc3QpOwo+ICB2b2lkIG5vdXZlYXVfc3Zt
bV9wYXJ0KHN0cnVjdCBub3V2ZWF1X3N2bW0gKiwgdTY0IGluc3QpOwo+ICBpbnQgbm91dmVhdV9z
dm1tX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKiwgdm9pZCAqLCBzdHJ1Y3QgZHJtX2ZpbGUgKik7
Cj4gKwo+ICt1NjQgKm5vdXZlYXVfcGZuc19hbGxvYyh1bnNpZ25lZCBsb25nIG5wYWdlcyk7Cj4g
K3ZvaWQgbm91dmVhdV9wZm5zX2ZyZWUodTY0ICpwZm5zKTsKPiArdm9pZCBub3V2ZWF1X3BmbnNf
bWFwKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArCQkg
ICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHU2NCAqcGZucywgdW5zaWduZWQgbG9uZyBucGFnZXMp
Owo+ICAjZWxzZSAvKiBJU19FTkFCTEVEKENPTkZJR19EUk1fTk9VVkVBVV9TVk0pICovCj4gIHN0
YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X3N2bV9pbml0KHN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
KSB7fQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgbm91dmVhdV9zdm1fZmluaShzdHJ1Y3Qgbm91dmVh
dV9kcm0gKmRybSkge30KPiBAQCAtNDQsNSArNDksMTkgQEAgc3RhdGljIGlubGluZSBpbnQgbm91
dmVhdV9zdm1tX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSwgdm9pZCAqcCwKPiAgewo+
ICAJcmV0dXJuIC1FTk9TWVM7Cj4gIH0KPiArCj4gK3U2NCAqbm91dmVhdV9wZm5zX2FsbG9jKHVu
c2lnbmVkIGxvbmcgbnBhZ2VzKQo+ICt7Cj4gKwlyZXR1cm4gTlVMTDsKPiArfQo+ICsKPiArdm9p
ZCBub3V2ZWF1X3BmbnNfZnJlZSh1NjQgKnBmbnMpCj4gK3sKPiArfQo+ICsKPiArdm9pZCBub3V2
ZWF1X3BmbnNfbWFwKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKPiArCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHU2NCAqcGZucywgdW5zaWduZWQgbG9u
ZyBucGFnZXMpCj4gK3sKPiArfQo+ICAjZW5kaWYgLyogSVNfRU5BQkxFRChDT05GSUdfRFJNX05P
VVZFQVVfU1ZNKSAqLwo+ICAjZW5kaWYKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
