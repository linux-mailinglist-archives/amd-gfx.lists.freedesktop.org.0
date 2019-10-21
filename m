Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2086DF528
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 20:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3976E1EE;
	Mon, 21 Oct 2019 18:34:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBFF6E1EE
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 18:34:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-_AN48j-3OTqbMRy9HXQccA-1; Mon, 21 Oct 2019 14:33:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261C280183E;
 Mon, 21 Oct 2019 18:33:54 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AECD60161;
 Mon, 21 Oct 2019 18:33:53 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:33:51 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 03/15] mm/hmm: allow hmm_range to be used with a
 mmu_range_notifier or hmm_mirror
Message-ID: <20191021183351.GD3177@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-4-jgg@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-4-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _AN48j-3OTqbMRy9HXQccA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571682839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heW2STh0qsJgZQvznrhVwfeqG1lZ93qzWcMlIpNclqY=;
 b=EY2ybhBt2dnXbf+9iOLhvHKLWZQPHuFnbTSGbPSEvJAd8ZOSzD6C81EW6OUaxaH4UhcRVi
 4HY/c7UTSyCx7ecW9K2DQxdFAz23V9nkwcfGTjq2vDwVPoy1DlrjSdF80bW6r+I8SmOGAU
 P2Spdu9FQiQ37X66TppyX4OqX3nxnNY=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDM6MTI6MzBQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBo
bW1fbWlycm9yJ3MgaGFuZGxpbmcgb2YgcmFuZ2VzIGRvZXMgbm90IHVzZSBhIHNlcXVlbmNlIGNv
dW50IHdoaWNoCj4gcmVzdWx0cyBpbiB0aGlzIGJ1ZzoKPiAKPiAgICAgICAgICBDUFUwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUxCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsaWQgPT0gdHJ1ZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBobW1fcmFuZ2VfZmF1bHQocmFuZ2UpCj4g
aG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKQo+ICAgIHJhbmdlLT52YWxpZCA9IGZhbHNlCj4g
aG1tX2ludmFsaWRhdGVfcmFuZ2VfZW5kKCkKPiAgICByYW5nZS0+dmFsaWQgPSB0cnVlCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9yYW5nZV92YWxpZChyYW5nZSkK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWxpZCA9PSB0cnVl
Cj4gCj4gV2hlcmUgdGhlIGhtbV9yYW5nZV92YWxpZCBzaG91bGQgbm90IGhhdmUgc3VjY2VlZGVk
Lgo+IAo+IEFkZGluZyB0aGUgcmVxdWlyZWQgc2VxdWVuY2UgY291bnQgd291bGQgbWFrZSBpdCBu
ZWFybHkgaWRlbnRpY2FsIHRvIHRoZQo+IG5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIuIEluc3RlYWQg
cmVwbGFjZSB0aGUgaG1tX21pcnJvciBzdHVmZiB3aXRoCj4gbW11X3JhbmdlX25vdGlmaWVyLgo+
IAo+IENvLWV4aXN0ZW5jZSBvZiB0aGUgdHdvIEFQSXMgaXMgdGhlIGZpcnN0IHN0ZXAuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmV2aWV3
ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoKPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9obW0uaCB8ICA1ICsrKysrCj4gIG1tL2htbS5jICAgICAgICAgICAgfCAyNSAr
KysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0u
aCBiL2luY2x1ZGUvbGludXgvaG1tLmgKPiBpbmRleCAzZmVjNTEzYjljMDBmMS4uOGFjMWZkNmE4
MWFmOGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvaG1tLmgKPiBAQCAtMTQ1LDYgKzE0NSw5IEBAIGVudW0gaG1tX3Bmbl92YWx1ZV9lIHsK
PiAgLyoKPiAgICogc3RydWN0IGhtbV9yYW5nZSAtIHRyYWNrIGludmFsaWRhdGlvbiBsb2NrIG9u
IHZpcnR1YWwgYWRkcmVzcyByYW5nZQo+ICAgKgo+ICsgKiBAbm90aWZpZXI6IGFuIG9wdGlvbmFs
IG1tdV9yYW5nZV9ub3RpZmllcgo+ICsgKiBAbm90aWZpZXJfc2VxOiB3aGVuIG5vdGlmaWVyIGlz
IHVzZWQgdGhpcyBpcyB0aGUgcmVzdWx0IG9mCj4gKyAqICAgICAgICAgICAgICAgIG1tdV9yYW5n
ZV9yZWFkX2JlZ2luKCkKPiAgICogQGhtbTogdGhlIGNvcmUgSE1NIHN0cnVjdHVyZSB0aGlzIHJh
bmdlIGlzIGFjdGl2ZSBhZ2FpbnN0Cj4gICAqIEB2bWE6IHRoZSB2bSBhcmVhIHN0cnVjdCBmb3Ig
dGhlIHJhbmdlCj4gICAqIEBsaXN0OiBhbGwgcmFuZ2UgbG9jayBhcmUgb24gYSBsaXN0Cj4gQEAg
LTE1OSw2ICsxNjIsOCBAQCBlbnVtIGhtbV9wZm5fdmFsdWVfZSB7Cj4gICAqIEB2YWxpZDogcGZu
cyBhcnJheSBkaWQgbm90IGNoYW5nZSBzaW5jZSBpdCBoYXMgYmVlbiBmaWxsIGJ5IGFuIEhNTSBm
dW5jdGlvbgo+ICAgKi8KPiAgc3RydWN0IGhtbV9yYW5nZSB7Cj4gKwlzdHJ1Y3QgbW11X3Jhbmdl
X25vdGlmaWVyICpub3RpZmllcjsKPiArCXVuc2lnbmVkIGxvbmcJCW5vdGlmaWVyX3NlcTsKPiAg
CXN0cnVjdCBobW0JCSpobW07Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFkCWxpc3Q7Cj4gIAl1bnNpZ25l
ZCBsb25nCQlzdGFydDsKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+IGluZGV4
IDkwMmY1ZmE2YmY5M2FkLi4yMmFjMzU5NTc3MWZlYiAxMDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+
ICsrKyBiL21tL2htbS5jCj4gQEAgLTg1Miw2ICs4NTIsMTQgQEAgdm9pZCBobW1fcmFuZ2VfdW5y
ZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGht
bV9yYW5nZV91bnJlZ2lzdGVyKTsKPiAgCj4gK3N0YXRpYyBib29sIG5lZWRzX3JldHJ5KHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlKQo+ICt7Cj4gKwlpZiAocmFuZ2UtPm5vdGlmaWVyKQo+ICsJCXJl
dHVybiBtbXVfcmFuZ2VfY2hlY2tfcmV0cnkocmFuZ2UtPm5vdGlmaWVyLAo+ICsJCQkJCSAgICAg
cmFuZ2UtPm5vdGlmaWVyX3NlcSk7Cj4gKwlyZXR1cm4gIXJhbmdlLT52YWxpZDsKPiArfQo+ICsK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtbV93YWxrX29wcyBobW1fd2Fsa19vcHMgPSB7Cj4gIAku
cHVkX2VudHJ5CT0gaG1tX3ZtYV93YWxrX3B1ZCwKPiAgCS5wbWRfZW50cnkJPSBobW1fdm1hX3dh
bGtfcG1kLAo+IEBAIC04OTIsMTggKzkwMCwyMyBAQCBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAJY29uc3QgdW5zaWdu
ZWQgbG9uZyBkZXZpY2Vfdm1hID0gVk1fSU8gfCBWTV9QRk5NQVAgfCBWTV9NSVhFRE1BUDsKPiAg
CXVuc2lnbmVkIGxvbmcgc3RhcnQgPSByYW5nZS0+c3RhcnQsIGVuZDsKPiAgCXN0cnVjdCBobW1f
dm1hX3dhbGsgaG1tX3ZtYV93YWxrOwo+IC0Jc3RydWN0IGhtbSAqaG1tID0gcmFuZ2UtPmhtbTsK
PiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7
Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmhtbS0+bW11X25vdGlm
aWVyLm1tLT5tbWFwX3NlbSk7Cj4gKwlpZiAocmFuZ2UtPm5vdGlmaWVyKQo+ICsJCW1tID0gcmFu
Z2UtPm5vdGlmaWVyLT5tbTsKPiArCWVsc2UKPiArCQltbSA9IHJhbmdlLT5obW0tPm1tdV9ub3Rp
Zmllci5tbTsKPiArCj4gKwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZtbS0+bW1hcF9zZW0pOwo+ICAK
PiAgCWRvIHsKPiAgCQkvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnku
ICovCj4gLQkJaWYgKCFyYW5nZS0+dmFsaWQpCj4gKwkJaWYgKG5lZWRzX3JldHJ5KHJhbmdlKSkK
PiAgCQkJcmV0dXJuIC1FQlVTWTsKPiAgCj4gLQkJdm1hID0gZmluZF92bWEoaG1tLT5tbXVfbm90
aWZpZXIubW0sIHN0YXJ0KTsKPiArCQl2bWEgPSBmaW5kX3ZtYShtbSwgc3RhcnQpOwo+ICAJCWlm
ICh2bWEgPT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmljZV92bWEpKQo+ICAJCQlyZXR1
cm4gLUVGQVVMVDsKPiAgCj4gQEAgLTkzMyw3ICs5NDYsNyBAQCBsb25nIGhtbV9yYW5nZV9mYXVs
dChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAJCQlzdGFy
dCA9IGhtbV92bWFfd2Fsay5sYXN0Owo+ICAKPiAgCQkJLyogS2VlcCB0cnlpbmcgd2hpbGUgdGhl
IHJhbmdlIGlzIHZhbGlkLiAqLwo+IC0JCX0gd2hpbGUgKHJldCA9PSAtRUJVU1kgJiYgcmFuZ2Ut
PnZhbGlkKTsKPiArCQl9IHdoaWxlIChyZXQgPT0gLUVCVVNZICYmICFuZWVkc19yZXRyeShyYW5n
ZSkpOwo+ICAKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCXVuc2lnbmVkIGxvbmcgaTsKPiBAQCAtOTkx
LDcgKzEwMDQsNyBAQCBsb25nIGhtbV9yYW5nZV9kbWFfbWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJh
bmdlLCBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gIAkJCWNvbnRpbnVlOwo+ICAKPiAgCQkvKiBD
aGVjayBpZiByYW5nZSBpcyBiZWluZyBpbnZhbGlkYXRlZCAqLwo+IC0JCWlmICghcmFuZ2UtPnZh
bGlkKSB7Cj4gKwkJaWYgKG5lZWRzX3JldHJ5KHJhbmdlKSkgewo+ICAJCQlyZXQgPSAtRUJVU1k7
Cj4gIAkJCWdvdG8gdW5tYXA7Cj4gIAkJfQo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
