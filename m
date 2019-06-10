Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E43BCE0
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 21:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D71589150;
	Mon, 10 Jun 2019 19:33:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26AF689031;
 Mon, 10 Jun 2019 18:53:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 822ED337;
 Mon, 10 Jun 2019 11:53:37 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 631F83F246;
 Mon, 10 Jun 2019 11:53:32 -0700 (PDT)
Date: Mon, 10 Jun 2019 19:53:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <20190610185329.xhjawzfy4uddrkrj@mbp>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <201906101106.3CA50745E3@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201906101106.3CA50745E3@keescook>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 10 Jun 2019 19:33:51 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTE6MDc6MDNBTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDA2OjUzOjI3UE0gKzAxMDAsIENhdGFsaW4gTWFy
aW5hcyB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2OjU1OjA0UE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4g
PiA+IGluZGV4IGU1ZDVmMzFjNmQzNi4uOTE2NGVjYjVmZWNhIDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gPiArKysgYi9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gPiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWdu
ZWQgbG9uZyBzaQo+ID4gPiAgCXJldHVybiByZXQ7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gLSNk
ZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUpCV9fcmFuZ2Vfb2soYWRkciwgc2l6ZSkKPiA+ID4g
KyNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUpCV9fcmFuZ2Vfb2sodW50YWdnZWRfYWRkcihh
ZGRyKSwgc2l6ZSkKWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9j
ZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IDM3NjdmYjIxYTVi
OC4uZmQxOTFjNWI5MmFhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vz
cy5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+IEBAIC01NTIsMyAr
NTUyLDE4IEBAIHZvaWQgYXJjaF9zZXR1cF9uZXdfZXhlYyh2b2lkKQo+ID4gIAo+ID4gIAlwdHJh
dXRoX3RocmVhZF9pbml0X3VzZXIoY3VycmVudCk7Cj4gPiAgfQo+ID4gKwo+ID4gKy8qCj4gPiAr
ICogRW5hYmxlIHRoZSByZWxheGVkIEFCSSBhbGxvd2luZyB0YWdnZWQgdXNlciBhZGRyZXNzZXMg
aW50byB0aGUga2VybmVsLgo+ID4gKyAqLwo+ID4gK2ludCB1bnRhZ2dlZF91YWRkcl9zZXRfbW9k
ZSh1bnNpZ25lZCBsb25nIGFyZykKPiA+ICt7Cj4gPiArCWlmIChpc19jb21wYXRfdGFzaygpKQo+
ID4gKwkJcmV0dXJuIC1FTk9UU1VQUDsKPiA+ICsJaWYgKGFyZykKPiA+ICsJCXJldHVybiAtRUlO
VkFMOwo+ID4gKwo+ID4gKwlzZXRfdGhyZWFkX2ZsYWcoVElGX1VOVEFHR0VEX1VBRERSKTsKPiA+
ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgcGFp
cmVkIHdpdGggYSBmbGFnIGNsZWFyaW5nIGluIGNvcHlfdGhyZWFkKCksCj4geWVzPyAoaS5lLiBl
YWNoIGJpbmFyeSBuZWVkcyB0byBvcHQgaW4pCgpJdCBpbmRlZWQgbmVlZHMgY2xlYXJpbmcgdGhv
dWdoIG5vdCBpbiBjb3B5X3RocmVhZCgpIGFzIHRoYXQncyB1c2VkIG9uCmNsb25lL2ZvcmsgYnV0
IHJhdGhlciBpbiBmbHVzaF90aHJlYWQoKSwgY2FsbGVkIG9uIHRoZSBleGVjdmUoKSBwYXRoLgoK
QW5kIGEgbm90ZSB0byBteXNlbGY6IEkgdGhpbmsgUFJfVU5UQUdHRURfQUREUiAobm90IFVBRERS
KSBsb29rcyBiZXR0ZXIKaW4gYSB1YXBpIGhlYWRlciwgdGhlIHVzZXIgZG9lc24ndCBkaWZmZXJl
bnRpYXRlIGJldHdlZW4gdWFkZHIgYW5kCmthZGRyLgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
