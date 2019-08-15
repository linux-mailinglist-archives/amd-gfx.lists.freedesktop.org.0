Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0778F27D
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 19:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BE56EA0D;
	Thu, 15 Aug 2019 17:43:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BD16EA0D;
 Thu, 15 Aug 2019 17:43:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6AC33083363;
 Thu, 15 Aug 2019 17:43:13 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B3F017CF8;
 Thu, 15 Aug 2019 17:43:12 +0000 (UTC)
Date: Thu, 15 Aug 2019 13:43:10 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: map pages after migration
Message-ID: <20190815174310.GI30916@redhat.com>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190813215852.GA9823@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813215852.GA9823@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 17:43:13 +0000 (UTC)
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
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDU6NTg6NTJQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwODowMjoxNEFNIC0wNzAwLCBSYWxwaCBD
YW1wYmVsbCB3cm90ZToKPiA+IFdoZW4gbWVtb3J5IGlzIG1pZ3JhdGVkIHRvIHRoZSBHUFUgaXQg
aXMgbGlrZWx5IHRvIGJlIGFjY2Vzc2VkIGJ5IEdQVQo+ID4gY29kZSBzb29uIGFmdGVyd2FyZHMu
IEluc3RlYWQgb2Ygd2FpdGluZyBmb3IgYSBHUFUgZmF1bHQsIG1hcCB0aGUKPiA+IG1pZ3JhdGVk
IG1lbW9yeSBpbnRvIHRoZSBHUFUgcGFnZSB0YWJsZXMgd2l0aCB0aGUgc2FtZSBhY2Nlc3MgcGVy
bWlzc2lvbnMKPiA+IGFzIHRoZSBzb3VyY2UgQ1BVIHBhZ2UgdGFibGUgZW50cmllcy4gVGhpcyBw
cmVzZXJ2ZXMgY29weSBvbiB3cml0ZQo+ID4gc2VtYW50aWNzLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gPiBDYzogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPgo+ID4gQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+
Cj4gPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IAo+IFNvcnJ5IGZvciBk
ZWxheSBpIGFtIHN3YW1wLCBjb3VwbGUgaXNzdWVzOgo+ICAgICAtIG5vdXZlYXVfcGZuc19tYXAo
KSBpcyBuZXZlciBjYWxsLCBpdCBzaG91bGQgYmUgY2FsbCBhZnRlcgo+ICAgICAgIHRoZSBkbWEg
Y29weSBpcyBkb25lIChpaXJjIGl0IGlzIGxhY2tpbmcgcHJvcGVyIGZlbmNpbmcKPiAgICAgICBz
byB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgaW1wbGVtZW50ZWQgZmlyc3QpCj4gCj4gICAgIC0gdGhl
IG1pZ3JhdGUgaW9jdGwgaXMgZGlzY29ubmVjdGVkIGZyb20gdGhlIHN2bSBwYXJ0IGFuZAo+ICAg
ICAgIHRodXMgd2Ugd291bGQgbmVlZCBmaXJzdCB0byBpbXBsZW1lbnQgc3ZtIHJlZmVyZW5jZSBj
b3VudGluZwo+ICAgICAgIGFuZCB0YWtlIGEgcmVmZXJlbmNlIGF0IGJlZ2luaW5nIG9mIG1pZ3Jh
dGlvbiBwcm9jZXNzIGFuZAo+ICAgICAgIHJlbGVhc2UgaXQgYXQgdGhlIGVuZCBpZSBzdHJ1Y3Qg
bm91dmVhdV9zdm1tIG5lZWRzIHJlZmNvdW50aW5nCj4gICAgICAgb2Ygc29tZSBzb3J0LiBJIGxl
dCBCZW4gZGVjaWRlcyB3aGF0IGhlIGxpa2VzIGJlc3QgZm9yIHRoYXQuCgpUaGlua2luZyBtb3Jl
IGFib3V0IHRoYXQgdGhlIHN2bSBsaWZldGltZSBpcyBib3VuZCB0byB0aGUgZmlsZQpkZXNjcmlw
dG9yIG9uIHRoZSBkZXZpY2UgZHJpdmVyIGZpbGUgaGVsZCBieSB0aGUgcHJvY2Vzcy4gU28Kd2hl
biB5b3UgY2FsbCBtaWdyYXRlIGlvY3RsIHRoZSBzdm0gc2hvdWxkIG5vdCBnbyBhd2F5IGJlY2F1
c2UKeW91IGFyZSBpbiBhbiBpb2N0bCBhZ2FpbnN0IHRoZSBmaWxlIGRlc2NyaXB0b3IuIEkgbmVl
ZCB0byBkb3VibGUKY2hlY2sgYWxsIHRoYXQgaW4gcmVzcGVjdCBvZiBwcm9jZXNzIHRoYXQgb3Bl
biB0aGUgZGV2aWNlIGZpbGUKbXVsdGlwbGUgdGltZSB3aXRoIGRpZmZlcmVudCBmaWxlIGRlc2Ny
aXB0b3IgKG9yIGZvcmsgdGhpbmcgYW5kCmFsbCkuCgoKPiAgICAgLSBpIHJhdGhlciBub3QgaGF2
ZSBhbiBleHRyYSBwZm5zIGFycmF5LCBpIGFtIHByZXR0eSBzdXJlIHdlCj4gICAgICAgY2FuIGRp
cmVjdGx5IGZlZWQgd2hhdCB3ZSBnZXQgZnJvbSB0aGUgZG1hIGFycmF5IHRvIHRoZSBzdm0KPiAg
ICAgICBjb2RlIHRvIHVwZGF0ZSB0aGUgR1BVIHBhZ2UgdGFibGUKPiAKPiBPYnNlcnZhdGlvbiB0
aGF0IGNhbiBiZSBkZWxheWVkIHRvIGxhdHRlciBwYXRjaGVzOgo+ICAgICAtIGkgZG8gbm90IHRo
aW5rIHdlIHdhbnQgdG8gbWFwIGRpcmVjdGx5IGlmIHRoZSBkbWEgZW5naW5lCj4gICAgICAgaXMg
cXVldWUgdXAgYW5kIHRodXMgaWYgdGhlIGZlbmNlIHdpbGwgdGFrZSB0aW1lIHRvIHNpZ25hbAo+
IAo+ICAgICAgIFRoaXMgaXMgd2h5IGkgZGlkIG5vdCBpbXBsZW1lbnQgdGhpcyBpbiB0aGUgZmly
c3QgcGxhY2UuCj4gICAgICAgTWF5YmUgdXNpbmcgYSB3b3JrcXVldWUgdG8gc2NoZWR1bGUgYSBw
cmUtZmlsbCBvZiB0aGUgR1BVCj4gICAgICAgcGFnZSB0YWJsZSBhbmQgd2FrZXVwIHRoZSB3b3Jr
cXVldWUgd2l0aCB0aGUgZmVuY2Ugbm90aWZ5Cj4gICAgICAgZXZlbnQuCj4gCj4gCj4gPiAtLS0K
PiA+IAo+ID4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiB0b3Agb2YgQ2hyaXN0b3BoIEhlbGx3aWcn
cyA5IHBhdGNoIHNlcmllcwo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAx
OTA3MjkyMzQ2MTEuR0M3MTcxQHJlZGhhdC5jb20vVC8jdQo+ID4gInR1cm4gdGhlIGhtbSBtaWdy
YXRlX3ZtYSB1cHNpZGUgZG93biIgYnV0IHdpdGhvdXQgcGF0Y2ggOQo+ID4gIm1tOiByZW1vdmUg
dGhlIHVudXNlZCBNSUdSQVRFX1BGTl9XUklURSIgYW5kIGFkZHMgYSB1c2UgZm9yIHRoZSBmbGFn
Lgo+ID4gCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8
IDQ1ICsrKysrKysrKy0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9z
dm0uYyAgfCA4NiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmggIHwgMTkgKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMzMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4gPiBpbmRleCBlZjlkZTgyYjA3NDQuLmM4M2U2ZjEx
ODgxNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1l
bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+ID4g
QEAgLTI1LDExICsyNSwxMyBAQAo+ID4gICNpbmNsdWRlICJub3V2ZWF1X2RtYS5oIgo+ID4gICNp
bmNsdWRlICJub3V2ZWF1X21lbS5oIgo+ID4gICNpbmNsdWRlICJub3V2ZWF1X2JvLmgiCj4gPiAr
I2luY2x1ZGUgIm5vdXZlYXVfc3ZtLmgiCj4gPiAgCj4gPiAgI2luY2x1ZGUgPG52aWYvY2xhc3Mu
aD4KPiA+ICAjaW5jbHVkZSA8bnZpZi9vYmplY3QuaD4KPiA+ICAjaW5jbHVkZSA8bnZpZi9pZjUw
MGIuaD4KPiA+ICAjaW5jbHVkZSA8bnZpZi9pZjkwMGIuaD4KPiA+ICsjaW5jbHVkZSA8bnZpZi9p
ZjAwMGMuaD4KPiA+ICAKPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPiA+ICAjaW5j
bHVkZSA8bGludXgvaG1tLmg+Cj4gPiBAQCAtNTYwLDExICs1NjIsMTIgQEAgbm91dmVhdV9kbWVt
X2luaXQoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pCj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyB1
bnNpZ25lZCBsb25nIG5vdXZlYXVfZG1lbV9taWdyYXRlX2NvcHlfb25lKHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtLAo+ID4gLQkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiA+IC0JCXVuc2lnbmVkIGxvbmcgc3JjLCBkbWFfYWRkcl90ICpkbWFfYWRkcikK
PiA+ICsJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHNyYywKPiA+
ICsJCWRtYV9hZGRyX3QgKmRtYV9hZGRyLCB1NjQgKnBmbikKPiA+ICB7Cj4gPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9IGRybS0+ZGV2LT5kZXY7Cj4gPiAgCXN0cnVjdCBwYWdlICpkcGFnZSwgKnNw
YWdlOwo+ID4gKwl1bnNpZ25lZCBsb25nIHBhZGRyOwo+ID4gIAo+ID4gIAlzcGFnZSA9IG1pZ3Jh
dGVfcGZuX3RvX3BhZ2Uoc3JjKTsKPiA+ICAJaWYgKCFzcGFnZSB8fCAhKHNyYyAmIE1JR1JBVEVf
UEZOX01JR1JBVEUpKQo+ID4gQEAgLTU3MiwxNyArNTc1LDIxIEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIG5vdXZlYXVfZG1lbV9taWdyYXRlX2NvcHlfb25lKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
LAo+ID4gIAo+ID4gIAlkcGFnZSA9IG5vdXZlYXVfZG1lbV9wYWdlX2FsbG9jX2xvY2tlZChkcm0p
Owo+ID4gIAlpZiAoIWRwYWdlKQo+ID4gLQkJcmV0dXJuIDA7Cj4gPiArCQlnb3RvIG91dDsKPiA+
ICAKPiA+ICAJKmRtYV9hZGRyID0gZG1hX21hcF9wYWdlKGRldiwgc3BhZ2UsIDAsIFBBR0VfU0la
RSwgRE1BX0JJRElSRUNUSU9OQUwpOwo+ID4gIAlpZiAoZG1hX21hcHBpbmdfZXJyb3IoZGV2LCAq
ZG1hX2FkZHIpKQo+ID4gIAkJZ290byBvdXRfZnJlZV9wYWdlOwo+ID4gIAo+ID4gKwlwYWRkciA9
IG5vdXZlYXVfZG1lbV9wYWdlX2FkZHIoZHBhZ2UpOwo+ID4gIAlpZiAoZHJtLT5kbWVtLT5taWdy
YXRlLmNvcHlfZnVuYyhkcm0sIDEsIE5PVVZFQVVfQVBFUl9WUkFNLAo+ID4gLQkJCW5vdXZlYXVf
ZG1lbV9wYWdlX2FkZHIoZHBhZ2UpLCBOT1VWRUFVX0FQRVJfSE9TVCwKPiA+IC0JCQkqZG1hX2Fk
ZHIpKQo+ID4gKwkJCXBhZGRyLCBOT1VWRUFVX0FQRVJfSE9TVCwgKmRtYV9hZGRyKSkKPiA+ICAJ
CWdvdG8gb3V0X2RtYV91bm1hcDsKPiA+ICAKPiA+ICsJKnBmbiA9IE5WSUZfVk1NX1BGTk1BUF9W
MF9WIHwgTlZJRl9WTU1fUEZOTUFQX1YwX1ZSQU0gfAo+ID4gKwkJKChwYWRkciA+PiBQQUdFX1NI
SUZUKSA8PCBOVklGX1ZNTV9QRk5NQVBfVjBfQUREUl9TSElGVCk7Cj4gPiArCWlmIChzcmMgJiBN
SUdSQVRFX1BGTl9XUklURSkKPiA+ICsJCSpwZm4gfD0gTlZJRl9WTU1fUEZOTUFQX1YwX1c7Cj4g
PiAgCXJldHVybiBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkpIHwgTUlHUkFURV9QRk5f
TE9DS0VEOwo+ID4gIAo+ID4gIG91dF9kbWFfdW5tYXA6Cj4gPiBAQCAtNTkwLDE4ICs1OTcsMTkg
QEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gPiAgb3V0X2ZyZWVfcGFnZToKPiA+ICAJbm91dmVhdV9k
bWVtX3BhZ2VfZnJlZV9sb2NrZWQoZHJtLCBkcGFnZSk7Cj4gPiAgb3V0Ogo+ID4gKwkqcGZuID0g
TlZJRl9WTU1fUEZOTUFQX1YwX05PTkU7Cj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+
ICBzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jaHVuayhzdHJ1Y3QgbWlncmF0ZV92
bWEgKmFyZ3MsCj4gPiAtCQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwgZG1hX2FkZHJfdCAqZG1h
X2FkZHJzKQo+ID4gKwkJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sIGRtYV9hZGRyX3QgKmRtYV9h
ZGRycywgdTY0ICpwZm5zKQo+ID4gIHsKPiA+ICAJc3RydWN0IG5vdXZlYXVfZmVuY2UgKmZlbmNl
Owo+ID4gIAl1bnNpZ25lZCBsb25nIGFkZHIgPSBhcmdzLT5zdGFydCwgbnJfZG1hID0gMCwgaTsK
PiA+ICAKPiA+ICAJZm9yIChpID0gMDsgYWRkciA8IGFyZ3MtPmVuZDsgaSsrKSB7Cj4gPiAgCQlh
cmdzLT5kc3RbaV0gPSBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29uZShkcm0sIGFyZ3MtPnZt
YSwKPiA+IC0JCQkJYWRkciwgYXJncy0+c3JjW2ldLCAmZG1hX2FkZHJzW25yX2RtYV0pOwo+ID4g
KwkJCQlhcmdzLT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSwgJnBmbnNbaV0pOwo+ID4gIAkJ
aWYgKGFyZ3MtPmRzdFtpXSkKPiA+ICAJCQlucl9kbWErKzsKPiA+ICAJCWFkZHIgKz0gUEFHRV9T
SVpFOwo+ID4gQEAgLTYxNSwxMCArNjIzLDYgQEAgc3RhdGljIHZvaWQgbm91dmVhdV9kbWVtX21p
Z3JhdGVfY2h1bmsoc3RydWN0IG1pZ3JhdGVfdm1hICphcmdzLAo+ID4gIAkJZG1hX3VubWFwX3Bh
Z2UoZHJtLT5kZXYtPmRldiwgZG1hX2FkZHJzW25yX2RtYV0sIFBBR0VfU0laRSwKPiA+ICAJCQkJ
RE1BX0JJRElSRUNUSU9OQUwpOwo+ID4gIAl9Cj4gPiAtCS8qCj4gPiAtCSAqIEZJWE1FIG9wdGlt
aXphdGlvbjogdXBkYXRlIEdQVSBwYWdlIHRhYmxlIHRvIHBvaW50IHRvIG5ld2x5IG1pZ3JhdGVk
Cj4gPiAtCSAqIG1lbW9yeS4KPiA+IC0JICovCj4gPiAgCW1pZ3JhdGVfdm1hX2ZpbmFsaXplKGFy
Z3MpOwo+ID4gIH0KPiA+ICAKPiA+IEBAIC02MzEsMTEgKzYzNSwxMiBAQCBub3V2ZWF1X2RtZW1f
bWlncmF0ZV92bWEoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gPiAgCXVuc2lnbmVkIGxvbmcg
bnBhZ2VzID0gKGVuZCAtIHN0YXJ0KSA+PiBQQUdFX1NISUZUOwo+ID4gIAl1bnNpZ25lZCBsb25n
IG1heCA9IG1pbihTR19NQVhfU0lOR0xFX0FMTE9DLCBucGFnZXMpOwo+ID4gIAlkbWFfYWRkcl90
ICpkbWFfYWRkcnM7Cj4gPiArCXU2NCAqcGZuczsKPiA+ICAJc3RydWN0IG1pZ3JhdGVfdm1hIGFy
Z3MgPSB7Cj4gPiAgCQkudm1hCQk9IHZtYSwKPiA+ICAJCS5zdGFydAkJPSBzdGFydCwKPiA+ICAJ
fTsKPiA+IC0JdW5zaWduZWQgbG9uZyBjLCBpOwo+ID4gKwl1bnNpZ25lZCBsb25nIGk7Cj4gPiAg
CWludCByZXQgPSAtRU5PTUVNOwo+ID4gIAo+ID4gIAlhcmdzLnNyYyA9IGtjYWxsb2MobWF4LCBz
aXplb2YoYXJncy5zcmMpLCBHRlBfS0VSTkVMKTsKPiA+IEBAIC02NDksMTkgKzY1NCwyNSBAQCBu
b3V2ZWF1X2RtZW1fbWlncmF0ZV92bWEoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gPiAgCWlm
ICghZG1hX2FkZHJzKQo+ID4gIAkJZ290byBvdXRfZnJlZV9kc3Q7Cj4gPiAgCj4gPiAtCWZvciAo
aSA9IDA7IGkgPCBucGFnZXM7IGkgKz0gYykgewo+ID4gLQkJYyA9IG1pbihTR19NQVhfU0lOR0xF
X0FMTE9DLCBucGFnZXMpOwo+ID4gLQkJYXJncy5lbmQgPSBzdGFydCArIChjIDw8IFBBR0VfU0hJ
RlQpOwo+ID4gKwlwZm5zID0gbm91dmVhdV9wZm5zX2FsbG9jKG1heCk7Cj4gPiArCWlmICghcGZu
cykKPiA+ICsJCWdvdG8gb3V0X2ZyZWVfZG1hOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyBpICs9IG1heCkgewo+ID4gKwkJYXJncy5lbmQgPSBzdGFydCArIChtYXggPDwgUEFH
RV9TSElGVCk7Cj4gPiAgCQlyZXQgPSBtaWdyYXRlX3ZtYV9zZXR1cCgmYXJncyk7Cj4gPiAgCQlp
ZiAocmV0KQo+ID4gLQkJCWdvdG8gb3V0X2ZyZWVfZG1hOwo+ID4gKwkJCWdvdG8gb3V0X2ZyZWVf
cGZuczsKPiA+ICAKPiA+ICAJCWlmIChhcmdzLmNwYWdlcykKPiA+IC0JCQlub3V2ZWF1X2RtZW1f
bWlncmF0ZV9jaHVuaygmYXJncywgZHJtLCBkbWFfYWRkcnMpOwo+ID4gKwkJCW5vdXZlYXVfZG1l
bV9taWdyYXRlX2NodW5rKCZhcmdzLCBkcm0sIGRtYV9hZGRycywKPiA+ICsJCQkJCQkgICBwZm5z
KTsKPiA+ICAJCWFyZ3Muc3RhcnQgPSBhcmdzLmVuZDsKPiA+ICAJfQo+ID4gIAo+ID4gIAlyZXQg
PSAwOwo+ID4gK291dF9mcmVlX3BmbnM6Cj4gPiArCW5vdXZlYXVfcGZuc19mcmVlKHBmbnMpOwo+
ID4gIG91dF9mcmVlX2RtYToKPiA+ICAJa2ZyZWUoZG1hX2FkZHJzKTsKPiA+ICBvdXRfZnJlZV9k
c3Q6Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiA+IGluZGV4IGE3NDUz
MGI1YTUyMy4uM2U2ZDdmMjI2NTc2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYwo+ID4gQEAgLTcwLDYgKzcwLDEyIEBAIHN0cnVjdCBub3V2ZWF1X3N2bSB7Cj4g
PiAgI2RlZmluZSBTVk1fREJHKHMsZixhLi4uKSBOVl9ERUJVRygocyktPmRybSwgInN2bTogImYi
XG4iLCAjI2EpCj4gPiAgI2RlZmluZSBTVk1fRVJSKHMsZixhLi4uKSBOVl9XQVJOKChzKS0+ZHJt
LCAic3ZtOiAiZiJcbiIsICMjYSkKPiA+ICAKPiA+ICtzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJn
cyB7Cj4gPiArCXN0cnVjdCBudmlmX2lvY3RsX3YwIGk7Cj4gPiArCXN0cnVjdCBudmlmX2lvY3Rs
X210aGRfdjAgbTsKPiA+ICsJc3RydWN0IG52aWZfdm1tX3Bmbm1hcF92MCBwOwo+ID4gK307Cj4g
PiArCj4gPiAgc3RydWN0IG5vdXZlYXVfaXZtbSB7Cj4gPiAgCXN0cnVjdCBub3V2ZWF1X3N2bW0g
KnN2bW07Cj4gPiAgCXU2NCBpbnN0Owo+ID4gQEAgLTczNCw2ICs3NDAsODYgQEAgbm91dmVhdV9z
dm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCj4gPiAgCXJldHVybiBOVklGX05P
VElGWV9LRUVQOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBub3V2ZWF1
X3Bmbm1hcF9hcmdzICoKPiA+ICtub3V2ZWF1X3BmbnNfdG9fYXJncyh2b2lkICpwZm5zKQo+ID4g
K3sKPiA+ICsJc3RydWN0IG52aWZfdm1tX3Bmbm1hcF92MCAqcCA9Cj4gPiArCQljb250YWluZXJf
b2YocGZucywgc3RydWN0IG52aWZfdm1tX3Bmbm1hcF92MCwgcGh5cyk7Cj4gPiArCj4gPiArCXJl
dHVybiBjb250YWluZXJfb2YocCwgc3RydWN0IG5vdXZlYXVfcGZubWFwX2FyZ3MsIHApOwo+ID4g
K30KPiA+ICsKPiA+ICt1NjQgKgo+ID4gK25vdXZlYXVfcGZuc19hbGxvYyh1bnNpZ25lZCBsb25n
IG5wYWdlcykKPiA+ICt7Cj4gPiArCXN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdzICphcmdzOwo+
ID4gKwo+ID4gKwlhcmdzID0ga3phbGxvYyhzaXplb2YoKmFyZ3MpICsgbnBhZ2VzICogc2l6ZW9m
KGFyZ3MtPnAucGh5c1swXSksCj4gPiArCQkJR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghYXJncykK
PiA+ICsJCXJldHVybiBOVUxMOwo+ID4gKwo+ID4gKwlhcmdzLT5pLnR5cGUgPSBOVklGX0lPQ1RM
X1YwX01USEQ7Cj4gPiArCWFyZ3MtPm0ubWV0aG9kID0gTlZJRl9WTU1fVjBfUEZOTUFQOwo+ID4g
KwlhcmdzLT5wLnBhZ2UgPSBQQUdFX1NISUZUOwo+ID4gKwo+ID4gKwlyZXR1cm4gYXJncy0+cC5w
aHlzOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkCj4gPiArbm91dmVhdV9wZm5zX2ZyZWUodTY0ICpw
Zm5zKQo+ID4gK3sKPiA+ICsJc3RydWN0IG5vdXZlYXVfcGZubWFwX2FyZ3MgKmFyZ3MgPSBub3V2
ZWF1X3BmbnNfdG9fYXJncyhwZm5zKTsKPiA+ICsKPiA+ICsJa2ZyZWUoYXJncyk7Cj4gPiArfQo+
ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3Qgbm91dmVhdV9zdm1tICoKPiA+ICtub3V2ZWF1X2ZpbmRf
c3ZtbShzdHJ1Y3Qgbm91dmVhdV9zdm0gKnN2bSwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiAr
ewo+ID4gKwlzdHJ1Y3Qgbm91dmVhdV9pdm1tICppdm1tOwo+ID4gKwo+ID4gKwlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGl2bW0sICZzdm0tPmluc3QsIGhlYWQpIHsKPiA+ICsJCWlmIChpdm1tLT5zdm1t
LT5tbSA9PSBtbSkKPiA+ICsJCQlyZXR1cm4gaXZtbS0+c3ZtbTsKPiA+ICsJfQo+ID4gKwlyZXR1
cm4gTlVMTDsKPiA+ICt9Cj4gPiArCj4gPiArdm9pZAo+ID4gK25vdXZlYXVfcGZuc19tYXAoc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gKwkJIHVuc2ln
bmVkIGxvbmcgYWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKPiA+ICt7Cj4g
PiArCXN0cnVjdCBub3V2ZWF1X3N2bSAqc3ZtID0gZHJtLT5zdm07Cj4gPiArCXN0cnVjdCBub3V2
ZWF1X3N2bW0gKnN2bW07Cj4gPiArCXN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdzICphcmdzOwo+
ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlpZiAoIXN2bSkKPiA+ICsJCXJldHVybjsKPiA+ICsK
PiA+ICsJbXV0ZXhfbG9jaygmc3ZtLT5tdXRleCk7Cj4gPiArCXN2bW0gPSBub3V2ZWF1X2ZpbmRf
c3ZtbShzdm0sIG1tKTsKPiA+ICsJaWYgKCFzdm1tKSB7Cj4gPiArCQltdXRleF91bmxvY2soJnN2
bS0+bXV0ZXgpOwo+ID4gKwkJcmV0dXJuOwo+ID4gKwl9Cj4gPiArCW11dGV4X3VubG9jaygmc3Zt
LT5tdXRleCk7Cj4gPiArCj4gPiArCWFyZ3MgPSBub3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5zKTsK
PiA+ICsJYXJncy0+cC5hZGRyID0gYWRkcjsKPiA+ICsJYXJncy0+cC5zaXplID0gbnBhZ2VzIDw8
IFBBR0VfU0hJRlQ7Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJnN2bW0tPm11dGV4KTsKPiA+ICsK
PiA+ICsJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIgPSB0cnVlOwo+ID4gKwly
ZXQgPSBudmlmX29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0LCBhcmdzLCBzaXpl
b2YoKmFyZ3MpICsKPiA+ICsJCQkJbnBhZ2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5V
TEwpOwo+ID4gKwlzdm1tLT52bW0tPnZtbS5vYmplY3QuY2xpZW50LT5zdXBlciA9IGZhbHNlOwo+
ID4gKwo+ID4gKwltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKPiA+ICt9Cj4gPiArCj4gPiAg
c3RhdGljIHZvaWQKPiA+ICBub3V2ZWF1X3N2bV9mYXVsdF9idWZmZXJfZmluaShzdHJ1Y3Qgbm91
dmVhdV9zdm0gKnN2bSwgaW50IGlkKQo+ID4gIHsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uaAo+ID4gaW5kZXggZTgzOWQ4MTg5NDYxLi5jMDBjMTc3ZTUxZWQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5oCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5oCj4gPiBAQCAtMTgsNiArMTgsMTEg
QEAgdm9pZCBub3V2ZWF1X3N2bW1fZmluaShzdHJ1Y3Qgbm91dmVhdV9zdm1tICoqKTsKPiA+ICBp
bnQgbm91dmVhdV9zdm1tX2pvaW4oc3RydWN0IG5vdXZlYXVfc3ZtbSAqLCB1NjQgaW5zdCk7Cj4g
PiAgdm9pZCBub3V2ZWF1X3N2bW1fcGFydChzdHJ1Y3Qgbm91dmVhdV9zdm1tICosIHU2NCBpbnN0
KTsKPiA+ICBpbnQgbm91dmVhdV9zdm1tX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKiwgdm9pZCAq
LCBzdHJ1Y3QgZHJtX2ZpbGUgKik7Cj4gPiArCj4gPiArdTY0ICpub3V2ZWF1X3BmbnNfYWxsb2Mo
dW5zaWduZWQgbG9uZyBucGFnZXMpOwo+ID4gK3ZvaWQgbm91dmVhdV9wZm5zX2ZyZWUodTY0ICpw
Zm5zKTsKPiA+ICt2b2lkIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0s
IHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gKwkJICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCB1
NjQgKnBmbnMsIHVuc2lnbmVkIGxvbmcgbnBhZ2VzKTsKPiA+ICAjZWxzZSAvKiBJU19FTkFCTEVE
KENPTkZJR19EUk1fTk9VVkVBVV9TVk0pICovCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIG5vdXZl
YXVfc3ZtX2luaXQoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pIHt9Cj4gPiAgc3RhdGljIGlubGlu
ZSB2b2lkIG5vdXZlYXVfc3ZtX2Zpbmkoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pIHt9Cj4gPiBA
QCAtNDQsNSArNDksMTkgQEAgc3RhdGljIGlubGluZSBpbnQgbm91dmVhdV9zdm1tX2JpbmQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldmljZSwgdm9pZCAqcCwKPiA+ICB7Cj4gPiAgCXJldHVybiAtRU5P
U1lTOwo+ID4gIH0KPiA+ICsKPiA+ICt1NjQgKm5vdXZlYXVfcGZuc19hbGxvYyh1bnNpZ25lZCBs
b25nIG5wYWdlcykKPiA+ICt7Cj4gPiArCXJldHVybiBOVUxMOwo+ID4gK30KPiA+ICsKPiA+ICt2
b2lkIG5vdXZlYXVfcGZuc19mcmVlKHU2NCAqcGZucykKPiA+ICt7Cj4gPiArfQo+ID4gKwo+ID4g
K3ZvaWQgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwgc3RydWN0IG1t
X3N0cnVjdCAqbW0sCj4gPiArCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHU2NCAqcGZucywg
dW5zaWduZWQgbG9uZyBucGFnZXMpCj4gPiArewo+ID4gK30KPiA+ICAjZW5kaWYgLyogSVNfRU5B
QkxFRChDT05GSUdfRFJNX05PVVZFQVVfU1ZNKSAqLwo+ID4gICNlbmRpZgo+ID4gLS0gCj4gPiAy
LjIwLjEKPiA+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
