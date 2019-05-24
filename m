Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0329B61
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC989056;
	Fri, 24 May 2019 15:44:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id A402689056;
 Fri, 24 May 2019 15:41:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72E5C15A2;
 Fri, 24 May 2019 08:41:46 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC68A3F575;
 Fri, 24 May 2019 08:41:45 -0700 (PDT)
Date: Fri, 24 May 2019 16:41:44 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190524154143.GG8268@e119886-lin.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-Mailman-Approved-At: Fri, 24 May 2019 15:44:18 +0000
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhbGxvd3MgdGFnZ2VkIHBv
aW50ZXJzIHRvIGJlIHBhc3NlZCB0byB0aGUgZm9sbG93aW5nIG1lbW9yeQo+IHN5c2NhbGxzOiBi
cmssIGdldF9tZW1wb2xpY3ksIG1hZHZpc2UsIG1iaW5kLCBtaW5jb3JlLCBtbG9jaywgbWxvY2sy
LAo+IG1tYXAsIG1tYXBfcGdvZmYsIG1wcm90ZWN0LCBtcmVtYXAsIG1zeW5jLCBtdW5sb2NrLCBt
dW5tYXAsCj4gcmVtYXBfZmlsZV9wYWdlcywgc2htYXQgYW5kIHNobWR0Lgo+IAo+IFRoaXMgaXMg
ZG9uZSBieSB1bnRhZ2dpbmcgcG9pbnRlcnMgcGFzc2VkIHRvIHRoZXNlIHN5c2NhbGxzIGluIHRo
ZQo+IHByb2xvZ3VlcyBvZiB0aGVpciBoYW5kbGVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gLS0tCgoKPiArU1lTQ0FMTF9E
RUZJTkUyKGFybTY0X21sb2NrLCB1bnNpZ25lZCBsb25nLCBzdGFydCwgc2l6ZV90LCBsZW4pCj4g
K3sKPiArCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwlyZXR1cm4ga3N5c19tbG9j
ayhzdGFydCwgbGVuLCBWTV9MT0NLRUQpOwo+ICt9Cj4gKwo+ICtTWVNDQUxMX0RFRklORTIoYXJt
NjRfbWxvY2syLCB1bnNpZ25lZCBsb25nLCBzdGFydCwgc2l6ZV90LCBsZW4pCj4gK3sKPiArCXN0
YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwlyZXR1cm4ga3N5c19tbG9jayhzdGFydCwg
bGVuLCBWTV9MT0NLRUQpOwo+ICt9CgpJIHRoaW5rIHRoaXMgbWF5IGJlIGEgY29weS9wYXN0ZSBl
cnJvci4uLgoKU2hvdWxkbid0IG1sb2NrMiBoYXZlIGEgdGhpcmQgJ2ZsYWdzJyBhcmd1bWVudCB0
byBkaXN0aW5ndWlzaCBpcyBmcm9tIG1sb2NrPwoKVGhhbmtzLAoKQW5kcmV3IE11cnJheQoKPiAr
Cj4gK1NZU0NBTExfREVGSU5FMihhcm02NF9tdW5sb2NrLCB1bnNpZ25lZCBsb25nLCBzdGFydCwg
c2l6ZV90LCBsZW4pCj4gK3sKPiArCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwly
ZXR1cm4ga3N5c19tdW5sb2NrKHN0YXJ0LCBsZW4pOwo+ICt9Cj4gKwo+ICtTWVNDQUxMX0RFRklO
RTMoYXJtNjRfbXByb3RlY3QsIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbiwKPiAr
CQl1bnNpZ25lZCBsb25nLCBwcm90KQo+ICt7Cj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3Rh
cnQpOwo+ICsJcmV0dXJuIGtzeXNfbXByb3RlY3RfcGtleShzdGFydCwgbGVuLCBwcm90LCAtMSk7
Cj4gK30KPiArCj4gK1NZU0NBTExfREVGSU5FMyhhcm02NF9tc3luYywgdW5zaWduZWQgbG9uZywg
c3RhcnQsIHNpemVfdCwgbGVuLCBpbnQsIGZsYWdzKQo+ICt7Cj4gKwlzdGFydCA9IHVudGFnZ2Vk
X2FkZHIoc3RhcnQpOwo+ICsJcmV0dXJuIGtzeXNfbXN5bmMoc3RhcnQsIGxlbiwgZmxhZ3MpOwo+
ICt9Cj4gKwo+ICtTWVNDQUxMX0RFRklORTMoYXJtNjRfbWluY29yZSwgdW5zaWduZWQgbG9uZywg
c3RhcnQsIHNpemVfdCwgbGVuLAo+ICsJCXVuc2lnbmVkIGNoYXIgX191c2VyICosIHZlYykKPiAr
ewo+ICsJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiArCXJldHVybiBrc3lzX21pbmNv
cmUoc3RhcnQsIGxlbiwgdmVjKTsKPiArfQo+ICsKPiArU1lTQ0FMTF9ERUZJTkU1KGFybTY0X3Jl
bWFwX2ZpbGVfcGFnZXMsIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LAo+ICsJCXVuc2lnbmVkIGxvbmcs
IHNpemUsIHVuc2lnbmVkIGxvbmcsIHByb3QsCj4gKwkJdW5zaWduZWQgbG9uZywgcGdvZmYsIHVu
c2lnbmVkIGxvbmcsIGZsYWdzKQo+ICt7Cj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQp
Owo+ICsJcmV0dXJuIGtzeXNfcmVtYXBfZmlsZV9wYWdlcyhzdGFydCwgc2l6ZSwgcHJvdCwgcGdv
ZmYsIGZsYWdzKTsKPiArfQo+ICsKPiArU1lTQ0FMTF9ERUZJTkUzKGFybTY0X3NobWF0LCBpbnQs
IHNobWlkLCBjaGFyIF9fdXNlciAqLCBzaG1hZGRyLCBpbnQsIHNobWZsZykKPiArewo+ICsJc2ht
YWRkciA9IHVudGFnZ2VkX2FkZHIoc2htYWRkcik7Cj4gKwlyZXR1cm4ga3N5c19zaG1hdChzaG1p
ZCwgc2htYWRkciwgc2htZmxnKTsKPiArfQo+ICsKPiArU1lTQ0FMTF9ERUZJTkUxKGFybTY0X3No
bWR0LCBjaGFyIF9fdXNlciAqLCBzaG1hZGRyKQo+ICt7Cj4gKwlzaG1hZGRyID0gdW50YWdnZWRf
YWRkcihzaG1hZGRyKTsKPiArCXJldHVybiBrc3lzX3NobWR0KHNobWFkZHIpOwo+ICt9Cj4gKwo+
ICAvKgo+ICAgKiBXcmFwcGVycyB0byBwYXNzIHRoZSBwdF9yZWdzIGFyZ3VtZW50Lgo+ICAgKi8K
PiAgI2RlZmluZSBzeXNfcGVyc29uYWxpdHkJCXN5c19hcm02NF9wZXJzb25hbGl0eQo+ICsjZGVm
aW5lIHN5c19tbWFwX3Bnb2ZmCQlzeXNfYXJtNjRfbW1hcF9wZ29mZgo+ICsjZGVmaW5lIHN5c19t
cmVtYXAJCXN5c19hcm02NF9tcmVtYXAKPiArI2RlZmluZSBzeXNfbXVubWFwCQlzeXNfYXJtNjRf
bXVubWFwCj4gKyNkZWZpbmUgc3lzX2JyawkJCXN5c19hcm02NF9icmsKPiArI2RlZmluZSBzeXNf
Z2V0X21lbXBvbGljeQlzeXNfYXJtNjRfZ2V0X21lbXBvbGljeQo+ICsjZGVmaW5lIHN5c19tYWR2
aXNlCQlzeXNfYXJtNjRfbWFkdmlzZQo+ICsjZGVmaW5lIHN5c19tYmluZAkJc3lzX2FybTY0X21i
aW5kCj4gKyNkZWZpbmUgc3lzX21sb2NrCQlzeXNfYXJtNjRfbWxvY2sKPiArI2RlZmluZSBzeXNf
bWxvY2syCQlzeXNfYXJtNjRfbWxvY2syCj4gKyNkZWZpbmUgc3lzX211bmxvY2sJCXN5c19hcm02
NF9tdW5sb2NrCj4gKyNkZWZpbmUgc3lzX21wcm90ZWN0CQlzeXNfYXJtNjRfbXByb3RlY3QKPiAr
I2RlZmluZSBzeXNfbXN5bmMJCXN5c19hcm02NF9tc3luYwo+ICsjZGVmaW5lIHN5c19taW5jb3Jl
CQlzeXNfYXJtNjRfbWluY29yZQo+ICsjZGVmaW5lIHN5c19yZW1hcF9maWxlX3BhZ2VzCXN5c19h
cm02NF9yZW1hcF9maWxlX3BhZ2VzCj4gKyNkZWZpbmUgc3lzX3NobWF0CQlzeXNfYXJtNjRfc2ht
YXQKPiArI2RlZmluZSBzeXNfc2htZHQJCXN5c19hcm02NF9zaG1kdAo+ICAKPiAgYXNtbGlua2Fn
ZSBsb25nIHN5c19uaV9zeXNjYWxsKGNvbnN0IHN0cnVjdCBwdF9yZWdzICopOwo+ICAjZGVmaW5l
IF9fYXJtNjRfc3lzX25pX3N5c2NhbGwJc3lzX25pX3N5c2NhbGwKPiAtLSAKPiAyLjIxLjAuMTAy
MC5nZjI4MjBjZjAxYS1nb29nCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
