Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50034929
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984F5898BE;
	Tue,  4 Jun 2019 13:42:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593F891B3
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 12:45:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id s11so12609472pfm.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 05:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SX1wXsAGfUFN70h44peTZcKIMqGr5ZE+ZDyQc1zQL5o=;
 b=uLucYoSAae5IdK3+1yoTNjP0jLktWkv6eppl+wVmYfenKdqBE9z5DfOdHEHehbKpPM
 V9mFa2v4F20mx9Cdf9dAJ2FF/ndLH7v7eZPN7KRAGYj348z0TQFR2BoHM49NUcdplpBz
 di1/LOLv8tqkMou4cf828wYJ9UE5pxkG/zCjtQz7ldy9ry12ey01Ca1agK/0P4wSf8N3
 XEWNM5OUWJFtE+e5/mjod+bbUWydn7yCGd/kJfAuDYL9hfP8qk3mnHl8RCptfFYZ8W1t
 MPz8CxKUKeIahceuYjNwLnGKPXd+b1r7fu0PdzeC0YwJf+n+8rr1beE09mE8mG0yNHNW
 g5cQ==
X-Gm-Message-State: APjAAAUelZ9jXBJ+Aw6Q3+SWIcfr8qOPT+T4fGdJFcqfgZx//wrT5vRX
 XvKY73wo/CklVtnyqMkz0BKKhMNubUyxZK+a3OJW9g==
X-Google-Smtp-Source: APXvYqzZt2kMUXJ9WHlwmRLt2vrbUVohOpQLy3RY96eqdlAIdJcx5KC4nxWy0iNPEMefwexAGDMOHmuMZCiVo+DqZfo=
X-Received: by 2002:a17:90a:2488:: with SMTP id
 i8mr28955959pje.123.1559652343964; 
 Tue, 04 Jun 2019 05:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
In-Reply-To: <20190604122714.GA15385@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 4 Jun 2019 14:45:32 +0200
Message-ID: <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
Subject: Re: [PATCH v16 12/16] IB,
 arm64: untag user pointers in ib_uverbs_(re)reg_mr()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SX1wXsAGfUFN70h44peTZcKIMqGr5ZE+ZDyQc1zQL5o=;
 b=E/mvMDTExggwag20QOMbkhKP75T7Pk+0ZF0pcXUr5AaTNbmr23JwDn0UqrTqxdl5Je
 krdUOdiGs3h2/gebELEz8jqrOUeDCDUC2JEOV4V8ITgtQF1Ax7woXAnTfQ5gsE1sKCk5
 73PDFS4epP+6c23bo89e7xnteUzAo/q7k0cXafuB0juxjfStepuJz67jDdEHof0O7Ctq
 rV/upWmgoM7X7JZZHSCmqQbuzKuvYpbwxz+61v3PWpNyw0Pr5WN0hOaTsMwrna556VUE
 CzT1IMUxqM0c1X/8hXFuS/fU+Fq0VdvtOqB87v2sTCjXWa4vVxnoJGfUoTWZKlqF7TqV
 Xbpw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAyOjI3IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBl
LmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDAyOjE4OjE5UE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAzLCAyMDE5IGF0IDc6NDYg
UE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBN
b24sIEp1biAwMywgMjAxOSBhdCAwNjo1NToxNFBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdy
b3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5k
cyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRvCj4gPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBw
b2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4g
PiA+ID4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+ID4gPgo+ID4gPiA+IGli
X3V2ZXJic18ocmUpcmVnX21yKCkgdXNlIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBs
b29rdXBzICh0aHJvdWdoCj4gPiA+ID4gZS5nLiBtbHg0X2dldF91bWVtX21yKCkpLCB3aGljaCBj
YW4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQgcG9pbnRlcnMuCj4gPiA+ID4KPiA+ID4gPiBV
bnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoZXNlIGZ1bmN0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiA+
ID4gPiAgZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jIHwgNCArKysrCj4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91dmVyYnNfY21kLmMgYi9kcml2ZXJzL2lu
ZmluaWJhbmQvY29yZS91dmVyYnNfY21kLmMKPiA+ID4gPiBpbmRleCA1YTNhMTc4MGNlZWEuLmY4
OGVlNzMzZTYxNyAxMDA2NDQKPiA+ID4gPiArKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91
dmVyYnNfY21kLmMKPiA+ID4gPiBAQCAtNzA5LDYgKzcwOSw4IEBAIHN0YXRpYyBpbnQgaWJfdXZl
cmJzX3JlZ19tcihzdHJ1Y3QgdXZlcmJzX2F0dHJfYnVuZGxlICphdHRycykKPiA+ID4gPiAgICAg
ICBpZiAocmV0KQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPgo+ID4g
PiA+ICsgICAgIGNtZC5zdGFydCA9IHVudGFnZ2VkX2FkZHIoY21kLnN0YXJ0KTsKPiA+ID4gPiAr
Cj4gPiA+ID4gICAgICAgaWYgKChjbWQuc3RhcnQgJiB+UEFHRV9NQVNLKSAhPSAoY21kLmhjYV92
YSAmIH5QQUdFX01BU0spKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
PiA+Cj4gPiA+IEkgZmVlbCBsaWtlIHdlIHNob3VsZG4ndCB0aGF2ZSB0byBkbyB0aGlzIGhlcmUs
IHN1cmVseSB0aGUgY21kLnN0YXJ0Cj4gPiA+IHNob3VsZCBmbG93IHVubW9kaWZpZWQgdG8gZ2V0
X3VzZXJfcGFnZXMsIGFuZCBndXAgc2hvdWxkIHVudGFnIGl0Pwo+ID4gPgo+ID4gPiBpZSwgdGhp
cyBzb3J0IG9mIGRpcmVjdGlvbiBmb3IgdGhlIElCIGNvZGUgKHRoaXMgd291bGQgYmUgYSBnaWFu
dAo+ID4gPiBwYXRjaCwgc28gSSBkaWRuJ3QgaGF2ZSB0aW1lIHRvIHdyaXRlIGl0IGFsbCwgYnV0
IEkgdGhpbmsgaXQgaXMgbXVjaAo+ID4gPiBzYW5lcik6Cj4gPgo+ID4gSGkgSmFzb24sCj4gPgo+
ID4gaWJfdXZlcmJzX3JlZ19tcigpIHBhc3NlcyBjbWQuc3RhcnQgdG8gbWx4NF9nZXRfdW1lbV9t
cigpLCB3aGljaCBjYWxscwo+ID4gZmluZF92bWEoKSwgd2hpY2ggb25seSBhY2NlcHRzIHVudGFn
Z2VkIGFkZHJlc3Nlcy4gQ291bGQgeW91IGV4cGxhaW4KPiA+IGhvdyB5b3VyIHBhdGNoIGhlbHBz
Pwo+Cj4gVGhhdCBtbHg0IGlzIGp1c3QgYSAnd2VpcmQgZHVjaycsIGl0IGlzIG5vdCB0aGUgbm9y
bWFsIGZsb3csIGFuZCBJCj4gZG9uJ3QgdGhpbmsgdGhlIGNvcmUgY29kZSBzaG91bGQgYmUgbWFr
aW5nIHNwZWNpYWwgY29uc2lkZXJhdGlvbiBmb3IKPiBpdC4KCkhvdyBkbyB5b3UgdGhpbmsgd2Ug
c2hvdWxkIGRvIHVudGFnZ2luZyAob3Igc29tZXRoaW5nIGVsc2UpIHRvIGRlYWwKd2l0aCB0aGlz
ICd3ZWlyZCBkdWNrJyBjYXNlPwoKPgo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
