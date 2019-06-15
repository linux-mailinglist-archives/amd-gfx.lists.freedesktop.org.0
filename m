Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B2475A6
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EC8890D2;
	Sun, 16 Jun 2019 15:53:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1385789298;
 Sat, 15 Jun 2019 14:25:22 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9cG-0008Br-TX; Sat, 15 Jun 2019 14:25:12 +0000
Date: Sat, 15 Jun 2019 07:25:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 12/12] mm/hmm: Fix error flows in
 hmm_invalidate_range_start
Message-ID: <20190615142512.GL17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-13-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-13-jgg@ziepe.ca>
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
 bh=SdWUCWylJzhzeM8QVNQHKHRjscfikWmZIAkgaxj+0Bw=; b=A7X2mxpnfBOFX0A60aP25q3n/
 szKd4gAVZwsTrlyaIQc5xR24lEmlvmqS83JEsqzjL+AHehjxvbX9tH+sGx5b+/T/POdhFT1Xy7EQd
 z9W2915h22nOnp+4mPxdGJjQST174K6/01OPoe8ioZOArCSmBX24iHJLukWtBCN5yrp7lgnCtL/If
 1mfw9bWonbn4DfHzMmLdRA3xr91p9DvtZSE0qrB2lAlkJ5w/EDdE8D0zcUjdAQSONzDYM6FcFPb/k
 YM/tCltM51daIP24UNpmoh0cZpWskqznE35632yXKH+R+QmO89o+nzwUgq0GJ1pb7OrMAPqMpErU/
 dFBGPBDoQ==;
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
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NTBQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBJ
ZiB0aGUgdHJ5bG9jayBvbiB0aGUgaG1tLT5taXJyb3JzX3NlbSBmYWlscyB0aGUgZnVuY3Rpb24g
d2lsbCByZXR1cm4KPiB3aXRob3V0IGRlY3JlbWVudGluZyB0aGUgbm90aWZpZXJzIHRoYXQgd2Vy
ZSBwcmV2aW91c2x5IGluY3JlbWVudGVkLiBTaW5jZQo+IHRoZSBjYWxsZXIgd2lsbCBub3QgY2Fs
bCBpbnZhbGlkYXRlX3JhbmdlX2VuZCgpIG9uIEVBR0FJTiB0aGlzIHdpbGwgcmVzdWx0Cj4gaW4g
bm90aWZpZXJzIGJlY29taW5nIHBlcm1hbmVudGx5IGluY3JlbWVudGVkIGFuZCBkZWFkbG9jay4K
PiAKPiBJZiB0aGUgc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKSByZXF1aXJlZCBibG9ja2lu
ZyB0aGUgZnVuY3Rpb24gd2lsbAo+IG5vdCByZXR1cm4gRUFHQUlOIGV2ZW4gdGhvdWdoIHRoZSBk
ZXZpY2UgY29udGludWVzIHRvIHRvdWNoIHRoZQo+IHBhZ2VzLiBUaGlzIGlzIGEgdmlvbGF0aW9u
IG9mIHRoZSBtbXUgbm90aWZpZXIgY29udHJhY3QuCj4gCj4gU3dpdGNoLCBhbmQgcmVuYW1lLCB0
aGUgcmFuZ2VzX2xvY2sgdG8gYSBzcGluIGxvY2sgc28gd2UgY2FuIHJlbGlhYmx5Cj4gb2J0YWlu
IGl0IHdpdGhvdXQgYmxvY2tpbmcgZHVyaW5nIGVycm9yIHVud2luZC4KPiAKPiBUaGUgZXJyb3Ig
dW53aW5kIGlzIG5lY2Vzc2FyeSBzaW5jZSB0aGUgbm90aWZpZXJzIGNvdW50IG11c3QgYmUgaGVs
ZAo+IGluY3JlbWVudGVkIGFjcm9zcyB0aGUgY2FsbCB0byBzeW5jX2NwdV9kZXZpY2VfcGFnZXRh
YmxlcygpIGFzIHdlIGNhbm5vdAo+IGFsbG93IHRoZSByYW5nZSB0byBiZWNvbWUgbWFya2VkIHZh
bGlkIGJ5IGEgcGFyYWxsZWwKPiBpbnZhbGlkYXRlX3N0YXJ0L2VuZCgpIHBhaXIgd2hpbGUgZG9p
bmcgc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBi
ZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBUZXN0ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGls
aXAuWWFuZ0BhbWQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2htbS5oIHwgIDIgKy0KPiAg
bW0vaG1tLmMgICAgICAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDMxIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVk
ZS9saW51eC9obW0uaAo+IGluZGV4IGJmMDEzZTk2NTI1NzcxLi4wZmE4ZWEzNGNjZWY2ZCAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9obW0u
aAo+IEBAIC04Niw3ICs4Niw3IEBACj4gIHN0cnVjdCBobW0gewo+ICAJc3RydWN0IG1tX3N0cnVj
dAkqbW07Cj4gIAlzdHJ1Y3Qga3JlZgkJa3JlZjsKPiAtCXN0cnVjdCBtdXRleAkJbG9jazsKPiAr
CXNwaW5sb2NrX3QJCXJhbmdlc19sb2NrOwo+ICAJc3RydWN0IGxpc3RfaGVhZAlyYW5nZXM7Cj4g
IAlzdHJ1Y3QgbGlzdF9oZWFkCW1pcnJvcnM7Cj4gIAlzdHJ1Y3QgbW11X25vdGlmaWVyCW1tdV9u
b3RpZmllcjsKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+IGluZGV4IGMwZDQz
MzAyZmQ2YjJmLi4xMTcyYTRmMDIwNjk2MyAxMDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+ICsrKyBi
L21tL2htbS5jCj4gQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIHN0cnVjdCBobW0gKmhtbV9nZXRf
b3JfY3JlYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAJaW5pdF9yd3NlbSgmaG1tLT5taXJy
b3JzX3NlbSk7Cj4gIAlobW0tPm1tdV9ub3RpZmllci5vcHMgPSBOVUxMOwo+ICAJSU5JVF9MSVNU
X0hFQUQoJmhtbS0+cmFuZ2VzKTsKPiAtCW11dGV4X2luaXQoJmhtbS0+bG9jayk7Cj4gKwlzcGlu
X2xvY2tfaW5pdCgmaG1tLT5yYW5nZXNfbG9jayk7Cj4gIAlrcmVmX2luaXQoJmhtbS0+a3JlZik7
Cj4gIAlobW0tPm5vdGlmaWVycyA9IDA7Cj4gIAlobW0tPm1tID0gbW07Cj4gQEAgLTEyNCwxOCAr
MTI0LDE5IEBAIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1u
LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+ICAJc3RydWN0IGhtbSAqaG1tID0gY29udGFp
bmVyX29mKG1uLCBzdHJ1Y3QgaG1tLCBtbXVfbm90aWZpZXIpOwo+ICAJc3RydWN0IGhtbV9taXJy
b3IgKm1pcnJvcjsKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAo+ICAJLyogQmFpbCBvdXQg
aWYgaG1tIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGZyZWVkICovCj4gIAlpZiAoIWtyZWZf
Z2V0X3VubGVzc196ZXJvKCZobW0tPmtyZWYpKQo+ICAJCXJldHVybjsKPiAgCj4gLQltdXRleF9s
b2NrKCZobW0tPmxvY2spOwo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmhtbS0+cmFuZ2VzX2xvY2ss
IGZsYWdzKTsKPiAgCS8qCj4gIAkgKiBTaW5jZSBobW1fcmFuZ2VfcmVnaXN0ZXIoKSBob2xkcyB0
aGUgbW1nZXQoKSBsb2NrIGhtbV9yZWxlYXNlKCkgaXMKPiAgCSAqIHByZXZlbnRlZCBhcyBsb25n
IGFzIGEgcmFuZ2UgZXhpc3RzLgo+ICAJICovCj4gIAlXQVJOX09OKCFsaXN0X2VtcHR5KCZobW0t
PnJhbmdlcykpOwo+IC0JbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+ICsJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmaG1tLT5yYW5nZXNfbG9jaywgZmxhZ3MpOwo+ICAKPiAgCWRvd25fcmVhZCgm
aG1tLT5taXJyb3JzX3NlbSk7Cj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1pcnJvciwgJmhtbS0+
bWlycm9ycywgbGlzdCkgewo+IEBAIC0xNTEsNiArMTUyLDIzIEBAIHN0YXRpYyB2b2lkIGhtbV9y
ZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAg
CWhtbV9wdXQoaG1tKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbm90aWZpZXJzX2RlY3JlbWVu
dChzdHJ1Y3QgaG1tICpobW0pCj4gK3sKPiArCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmhtbS0+cmFu
Z2VzX2xvY2spOwo+ICsKPiArCWhtbS0+bm90aWZpZXJzLS07Cj4gKwlpZiAoIWhtbS0+bm90aWZp
ZXJzKSB7CgpOaXRwaWNrLCB3aGVuIGRvaW5nIGRlYyBhbmQgdGVzdCBvciBpbmMgYW5kIHRlc3Qg
b3BzIEkgZmluZCBpdCBtdWNoCmVhc2llciB0byByZWFkIGlmIHRoZXkgYXJlIG1lcmdlZCBpbnRv
IG9uZSBsaW5lLCBpLmUuCgoJaWYgKCEtLWhtbS0+bm90aWZpZXJzKSB7CgpPdGhlcndpc2UgdGhp
cyBsb29rcyBmaW5lOgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
