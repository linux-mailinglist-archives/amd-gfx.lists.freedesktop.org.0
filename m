Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46487F11
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 18:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F76EE47;
	Fri,  9 Aug 2019 16:10:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13FE96EE47;
 Fri,  9 Aug 2019 16:03:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 979B315A2;
 Fri,  9 Aug 2019 09:03:08 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 C67723F575; Fri,  9 Aug 2019 09:03:03 -0700 (PDT)
Date: Fri, 9 Aug 2019 17:03:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v19 04/15] mm: untag user pointers passed to memory
 syscalls
Message-ID: <20190809160301.GB23083@arrakis.emea.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <aaf0c0969d46b2feb9017f3e1b3ef3970b633d91.1563904656.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaf0c0969d46b2feb9017f3e1b3ef3970b633d91.1563904656.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 09 Aug 2019 16:10:50 +0000
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
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, Dave Hansen <dave.hansen@intel.com>,
 linux-kernel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>,
 Lee Smith <Lee.Smith@arm.com>, Alexander Deucher <Alexander.Deucher@amd.com>,
 enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDc6NTg6NDFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhbGxvd3MgdGFnZ2VkIHBvaW50ZXJz
IHRvIGJlIHBhc3NlZCB0byB0aGUgZm9sbG93aW5nIG1lbW9yeQo+IHN5c2NhbGxzOiBnZXRfbWVt
cG9saWN5LCBtYWR2aXNlLCBtYmluZCwgbWluY29yZSwgbWxvY2ssIG1sb2NrMiwgbXByb3RlY3Qs
Cj4gbXJlbWFwLCBtc3luYywgbXVubG9jaywgbW92ZV9wYWdlcy4KPiAKPiBUaGUgbW1hcCBhbmQg
bXJlbWFwIHN5c2NhbGxzIGRvIG5vdCBjdXJyZW50bHkgYWNjZXB0IHRhZ2dlZCBhZGRyZXNzZXMu
Cj4gQXJjaGl0ZWN0dXJlcyBtYXkgaW50ZXJwcmV0IHRoZSB0YWcgYXMgYSBiYWNrZ3JvdW5kIGNv
bG91ciBmb3IgdGhlCj4gY29ycmVzcG9uZGluZyB2bWEuCj4gCj4gUmV2aWV3ZWQtYnk6IEtoYWxp
ZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUuY29tPgo+IFJldmlld2VkLWJ5OiBWaW5jZW56byBG
cmFzY2lubyA8dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92
YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+IC0tLQo+ICBtbS9tYWR2aXNlLmMgICB8IDIg
KysKPiAgbW0vbWVtcG9saWN5LmMgfCAzICsrKwo+ICBtbS9taWdyYXRlLmMgICB8IDIgKy0KPiAg
bW0vbWluY29yZS5jICAgfCAyICsrCj4gIG1tL21sb2NrLmMgICAgIHwgNCArKysrCj4gIG1tL21w
cm90ZWN0LmMgIHwgMiArKwo+ICBtbS9tcmVtYXAuYyAgICB8IDcgKysrKysrKwo+ICBtbS9tc3lu
Yy5jICAgICB8IDIgKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpNb3JlIGJhY2sgYW5kIGZvcnRoIGRpc2N1c3Npb25zIG9uIGhvdyB0byBzcGVj
aWZ5IHRoZSBleGNlcHRpb25zIGhlcmUuCkknbSBwcm9wb3NpbmcganVzdCBkcm9wcGluZyB0aGUg
ZXhjZXB0aW9ucyBhbmQgZm9sZGluZyBpbiB0aGUgZGlmZgpiZWxvdy4KCkFuZHJldywgaWYgeW91
IHByZWZlciBhIHN0YW5kYWxvbmUgcGF0Y2ggaW5zdGVhZCwgcGxlYXNlIGxldCBtZSBrbm93OgoK
LS0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkZyb20gOWE1
Mjg2YWNhYTYzOGM2YTkxN2Q5Njk4NmJmMjhkYWQzNWUyNGEwYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKRnJvbTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KRGF0
ZTogRnJpLCA5IEF1ZyAyMDE5IDE0OjIxOjMzICswMTAwClN1YmplY3Q6IFtQQVRDSF0gZml4dXAh
IG1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1vcnkgc3lzY2FsbHMKCm1tYXAs
IG1yZW1hcCwgbXVubWFwLCBicmsgYWRkZWQgdG8gdGhlIGxpc3Qgb2Ygc3lzY2FsbHMgdGhhdCBh
Y2NlcHQKdGFnZ2VkIHBvaW50ZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBNYXJpbmFzIDxj
YXRhbGluLm1hcmluYXNAYXJtLmNvbT4KLS0tCiBtbS9tbWFwLmMgICB8IDUgKysrKysKIG1tL21y
ZW1hcC5jIHwgNiArLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCA3ZThj
M2U4YWU3NWYuLmI3NjZiNjMzYjdhZSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21t
YXAuYwpAQCAtMjAxLDYgKzIwMSw4IEBAIFNZU0NBTExfREVGSU5FMShicmssIHVuc2lnbmVkIGxv
bmcsIGJyaykKIAlib29sIGRvd25ncmFkZWQgPSBmYWxzZTsKIAlMSVNUX0hFQUQodWYpOwogCisJ
YnJrID0gdW50YWdnZWRfYWRkcihicmspOworCiAJaWYgKGRvd25fd3JpdGVfa2lsbGFibGUoJm1t
LT5tbWFwX3NlbSkpCiAJCXJldHVybiAtRUlOVFI7CiAKQEAgLTE1NzMsNiArMTU3NSw4IEBAIHVu
c2lnbmVkIGxvbmcga3N5c19tbWFwX3Bnb2ZmKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQg
bG9uZyBsZW4sCiAJc3RydWN0IGZpbGUgKmZpbGUgPSBOVUxMOwogCXVuc2lnbmVkIGxvbmcgcmV0
dmFsOwogCisJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CisKIAlpZiAoIShmbGFncyAmIE1B
UF9BTk9OWU1PVVMpKSB7CiAJCWF1ZGl0X21tYXBfZmQoZmQsIGZsYWdzKTsKIAkJZmlsZSA9IGZn
ZXQoZmQpOwpAQCAtMjg3NCw2ICsyODc4LDcgQEAgRVhQT1JUX1NZTUJPTCh2bV9tdW5tYXApOwog
CiBTWVNDQUxMX0RFRklORTIobXVubWFwLCB1bnNpZ25lZCBsb25nLCBhZGRyLCBzaXplX3QsIGxl
bikKIHsKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKIAlwcm9maWxlX211bm1hcChhZGRy
KTsKIAlyZXR1cm4gX192bV9tdW5tYXAoYWRkciwgbGVuLCB0cnVlKTsKIH0KZGlmZiAtLWdpdCBh
L21tL21yZW1hcC5jIGIvbW0vbXJlbWFwLmMKaW5kZXggNjRjOWEzYjhiZTBhLi4xZmM4YTI5ZmJl
M2YgMTAwNjQ0Ci0tLSBhL21tL21yZW1hcC5jCisrKyBiL21tL21yZW1hcC5jCkBAIC02MDYsMTIg
KzYwNiw4IEBAIFNZU0NBTExfREVGSU5FNShtcmVtYXAsIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHVu
c2lnbmVkIGxvbmcsIG9sZF9sZW4sCiAJTElTVF9IRUFEKHVmX3VubWFwX2Vhcmx5KTsKIAlMSVNU
X0hFQUQodWZfdW5tYXApOwogCi0JLyoKLQkgKiBBcmNoaXRlY3R1cmVzIG1heSBpbnRlcnByZXQg
dGhlIHRhZyBwYXNzZWQgdG8gbW1hcCBhcyBhIGJhY2tncm91bmQKLQkgKiBjb2xvdXIgZm9yIHRo
ZSBjb3JyZXNwb25kaW5nIHZtYS4gRm9yIG1yZW1hcCB3ZSBkb24ndCBhbGxvdyB0YWdnZWQKLQkg
KiBuZXdfYWRkciB0byBwcmVzZXJ2ZSBzaW1pbGFyIGJlaGF2aW91ciB0byBtbWFwLgotCSAqLwog
CWFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOworCW5ld19hZGRyID0gdW50YWdnZWRfYWRkcihu
ZXdfYWRkcik7CiAKIAlpZiAoZmxhZ3MgJiB+KE1SRU1BUF9GSVhFRCB8IE1SRU1BUF9NQVlNT1ZF
KSkKIAkJcmV0dXJuIHJldDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
