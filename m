Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839F8930E
	for <lists+amd-gfx@lfdr.de>; Sun, 11 Aug 2019 20:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D836E358;
	Sun, 11 Aug 2019 18:09:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558126E30D;
 Sat, 10 Aug 2019 11:13:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2801368BFE; Sat, 10 Aug 2019 13:13:09 +0200 (CEST)
Date: Sat, 10 Aug 2019 13:13:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
Message-ID: <20190810111308.GB26349@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sun, 11 Aug 2019 18:09:37 +0000
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

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDI6Mjk6MzRQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4+PiAgIHsKPj4+ICAgCXN0cnVjdCBub3V2ZWF1X2ZlbmNlICpmZW5jZTsKPj4+ICAg
CXVuc2lnbmVkIGxvbmcgYWRkciA9IGFyZ3MtPnN0YXJ0LCBucl9kbWEgPSAwLCBpOwo+Pj4gICAg
IAlmb3IgKGkgPSAwOyBhZGRyIDwgYXJncy0+ZW5kOyBpKyspIHsKPj4+ICAgCQlhcmdzLT5kc3Rb
aV0gPSBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29uZShkcm0sIGFyZ3MtPnZtYSwKPj4+IC0J
CQkJYWRkciwgYXJncy0+c3JjW2ldLCAmZG1hX2FkZHJzW25yX2RtYV0pOwo+Pj4gKwkJCQlhcmdz
LT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSwgJnBmbnNbaV0pOwo+Pgo+PiBOaXQ6IEkgZmlu
ZCB0aGUgJnBmbnNbaV0gd2F5IHRvIHBhc3MgdGhlIGFyZ3VtZW50IGEgbGl0dGxlIHdlaXJkIHRv
IHJlYWQuCj4+IFdoeSBub3QgInBmbnMgKyBpIj8KPgo+IE9LLCB3aWxsIGRvIGluIHYyLgo+IFNo
b3VsZCBJIGNvbnZlcnQgdG8gImRtYV9hZGRycyArIG5yX2RtYSIgdG9vPwoKSSdsbCBmaXggaXQg
dXAgZm9yIHYzIG9mIHRoZSBtaWdyYXRlX3ZtYSBzZXJpZXMuICBUaGlzIGlzIGEgbGVmdG92ZXIK
ZnJvbSBwYXNzaW5nIGFuIGFyZ3Mgc3RydWN0dXJlLgoKT24gc29tZXRoaW5nIHZhZ3VlbHkgcmVs
YXRlZCB0byB0aGlzIHBhdGNoOgoKWW91IHVzZSB0aGUgTlZJRl9WTU1fUEZOTUFQX1YwX1YqIGRl
ZmluZXMgZnJvbSBudmlmL2lmMDAwYy5oLCB3aGljaCBhcmUKYSBsaXR0bGUgb2RkIGFzIHdlIG9u
bHkgZXZlciBzZXQgdGhlc2UgYml0cywgYnV0IHRoZXkgYWxzbyBkb24ndCBzZWVtCnRvIGFwcGVh
ciB0byBiZSBpbiB2YWx1ZXMgdGhhdCBhcmUgZGlyZWN0bHkgZmVkIHRvIHRoZSBoYXJkd2FyZS4K
Ck9uIHRoZSBvdGhlciBoYW5kIG1tdS92bW0uaCBkZWZpbmVzIGEgc2V0IG9mIE5WSUZfVk1NX1BG
Tk1BUF9WMF8qCmNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNhbCB2YWx1
ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAppbiBtbXUvdm1tZ3AxMDAuYyBhbmQgd2hhdCBhcHBlYXJz
IHRvIGZpbmFsbHkgZG8gdGhlIGxvdy1sZXZlbCBkbWEKbWFwcGluZyBhbmQgdGFsa2luZyB0byB0
aGUgaGFyZHdhcmUuICBBcmUgdGhlc2UgdHdvIHNldHMgb2YgY29uc3RhbnRzCnN1cHBvc2VkIHRv
IGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdhcmUgdmFsdWVzIG9yIGp1c3QgYQpk
cml2ZXIgaW50ZXJuYWwgaW50ZXJmYWNlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
