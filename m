Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4824387F13
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 18:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2245A6EE4C;
	Fri,  9 Aug 2019 16:10:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99E6C6EE47;
 Fri,  9 Aug 2019 16:08:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37BC415AB;
 Fri,  9 Aug 2019 09:08:07 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 6D88D3F575; Fri,  9 Aug 2019 09:08:02 -0700 (PDT)
Date: Fri, 9 Aug 2019 17:08:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>, Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v19 02/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190809160800.GC23083@arrakis.emea.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <1c05651c53f90d07e98ee4973c2786ccf315db12.1563904656.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c05651c53f90d07e98ee4973c2786ccf315db12.1563904656.git.andreyknvl@google.com>
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
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
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDc6NTg6MzlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBGcm9tOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pgo+IAo+IEl0IGlzIG5vdCBkZXNpcmFibGUgdG8gcmVsYXggdGhlIEFCSSB0byBhbGxvdyB0YWdn
ZWQgdXNlciBhZGRyZXNzZXMgaW50bwo+IHRoZSBrZXJuZWwgaW5kaXNjcmltaW5hdGVseS4gVGhp
cyBwYXRjaCBpbnRyb2R1Y2VzIGEgcHJjdGwoKSBpbnRlcmZhY2UKPiBmb3IgZW5hYmxpbmcgb3Ig
ZGlzYWJsaW5nIHRoZSB0YWdnZWQgQUJJIHdpdGggYSBnbG9iYWwgc3lzY3RsIGNvbnRyb2wKPiBm
b3IgcHJldmVudGluZyBhcHBsaWNhdGlvbnMgZnJvbSBlbmFibGluZyB0aGUgcmVsYXhlZCBBQkkg
KG1lYW50IGZvcgo+IHRlc3RpbmcgdXNlci1zcGFjZSBwcmN0bCgpIHJldHVybiBlcnJvciBjaGVj
a2luZyB3aXRob3V0IHJlY29uZmlndXJpbmcKPiB0aGUga2VybmVsKS4gVGhlIEFCSSBwcm9wZXJ0
aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0aGUgc2FtZQo+IGFwcGxpY2F0aW9uIGFu
ZCBmb3JrKCknZWQgY2hpbGRyZW4gYnV0IGNsZWFyZWQgb24gZXhlY3ZlKCkuIEEgS2NvbmZpZwo+
IG9wdGlvbiBhbGxvd3MgdGhlIG92ZXJhbGwgZGlzYWJsaW5nIG9mIHRoZSByZWxheGVkIEFCSS4K
PiAKPiBUaGUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwgd2lsbCBiZSBleHBhbmRlZCBpbiB0aGUg
ZnV0dXJlIHRvIGhhbmRsZQo+IE1URS1zcGVjaWZpYyBzZXR0aW5ncyBsaWtlIGltcHJlY2lzZSB2
cyBwcmVjaXNlIGV4Y2VwdGlvbnMuCj4gCj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxp
bi5tYXJpbmFzQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5k
cmV5a252bEBnb29nbGUuY29tPgoKRm9sbG93aW5nIHNldmVyYWwgZGlzY3Vzc2lvbnMgb24gdGhl
IGxpc3QgYW5kIGluIHByaXZhdGUsIEknbSBwcm9wb3NpbmcKdGhlIHVwZGF0ZSBiZWxvdy4gSSBj
YW4gc2VuZCBpdCBhcyBhIHBhdGNoIG9uIHRvcCBvZiB0aGUgY3VycmVudCBzZXJpZXMKc2luY2Ug
V2lsbCBoYXMgYWxyZWFkeSBxdWV1ZWQgdGhpcy4KCi0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpGcm9tIDFiM2Y1N2FiMGMyYzUxZjhiMzFjMTlm
YjM0ZDI3MGUxZjNlZTU3ZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IENhdGFsaW4g
TWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+CkRhdGU6IEZyaSwgOSBBdWcgMjAxOSAx
NTowOToxNSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIGZpeHVwISBhcm02NDogSW50cm9kdWNlIHBy
Y3RsKCkgb3B0aW9ucyB0byBjb250cm9sIHRoZQogdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIEFCSQoK
UmVuYW1lIGFiaS50YWdnZWRfYWRkciBzeXNjdGwgY29udHJvbCB0byBhYmkudGFnZ2VkX2FkZHJf
ZGlzYWJsZWQsCmRlZmF1bHRpbmcgdG8gMC4gT25seSBwcmV2ZW50IHByY3RsKFBSX1RBR0dFRF9B
RERSX0VOQUJMRSlmcm9tIGJlaW5nCmNhbGxlZCB3aGVuIGFiaS50YWdnZWRfYWRkcl9kaXNhYmxl
ZD09MS4KCkZvcmNlIHVudXNlZCBhcmcqIG9mIHRoZSBuZXcgcHJjdGwoKSB0byAwLgoKU2lnbmVk
LW9mZi1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KLS0tCiBh
cmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgfCAxNyArKysrKysrKysrLS0tLS0tLQoga2VybmVs
L3N5cy5jICAgICAgICAgICAgICAgIHwgIDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwppbmRleCA3NmI3YzU1MDI2
YWEuLjAzNjg5YzBiZWIzNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5j
CisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwpAQCAtNTc5LDE3ICs1NzksMjIgQEAg
dm9pZCBhcmNoX3NldHVwX25ld19leGVjKHZvaWQpCiAvKgogICogQ29udHJvbCB0aGUgcmVsYXhl
ZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5lbC4KICAq
Lwotc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkID0gMTsKK3N0
YXRpYyB1bnNpZ25lZCBpbnQgdGFnZ2VkX2FkZHJfZGlzYWJsZWQ7CiAKIGxvbmcgc2V0X3RhZ2dl
ZF9hZGRyX2N0cmwodW5zaWduZWQgbG9uZyBhcmcpCiB7Ci0JaWYgKCF0YWdnZWRfYWRkcl9wcmN0
bF9hbGxvd2VkKQotCQlyZXR1cm4gLUVJTlZBTDsKIAlpZiAoaXNfY29tcGF0X3Rhc2soKSkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAJaWYgKGFyZyAmIH5QUl9UQUdHRURfQUREUl9FTkFCTEUpCiAJCXJl
dHVybiAtRUlOVkFMOwogCisJLyoKKwkgKiBEbyBub3QgYWxsb3cgdGhlIGVuYWJsaW5nIG9mIHRo
ZSB0YWdnZWQgYWRkcmVzcyBBQkkgaWYgZ2xvYmFsbHkKKwkgKiBkaXNhYmxlZCB2aWEgc3lzY3Rs
IGFiaS50YWdnZWRfYWRkcl9kaXNhYmxlZC4KKwkgKi8KKwlpZiAoYXJnICYgUFJfVEFHR0VEX0FE
RFJfRU5BQkxFICYmIHRhZ2dlZF9hZGRyX2Rpc2FibGVkKQorCQlyZXR1cm4gLUVJTlZBTDsKKwog
CXVwZGF0ZV90aHJlYWRfZmxhZyhUSUZfVEFHR0VEX0FERFIsIGFyZyAmIFBSX1RBR0dFRF9BRERS
X0VOQUJMRSk7CiAKIAlyZXR1cm4gMDsKQEAgLTU5Nyw4ICs2MDIsNiBAQCBsb25nIHNldF90YWdn
ZWRfYWRkcl9jdHJsKHVuc2lnbmVkIGxvbmcgYXJnKQogCiBsb25nIGdldF90YWdnZWRfYWRkcl9j
dHJsKHZvaWQpCiB7Ci0JaWYgKCF0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkKQotCQlyZXR1cm4g
LUVJTlZBTDsKIAlpZiAoaXNfY29tcGF0X3Rhc2soKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAg
LTYxOCw5ICs2MjEsOSBAQCBzdGF0aWMgaW50IG9uZSA9IDE7CiAKIHN0YXRpYyBzdHJ1Y3QgY3Rs
X3RhYmxlIHRhZ2dlZF9hZGRyX3N5c2N0bF90YWJsZVtdID0gewogCXsKLQkJLnByb2NuYW1lCT0g
InRhZ2dlZF9hZGRyIiwKKwkJLnByb2NuYW1lCT0gInRhZ2dlZF9hZGRyX2Rpc2FibGVkIiwKIAkJ
Lm1vZGUJCT0gMDY0NCwKLQkJLmRhdGEJCT0gJnRhZ2dlZF9hZGRyX3ByY3RsX2FsbG93ZWQsCisJ
CS5kYXRhCQk9ICZ0YWdnZWRfYWRkcl9kaXNhYmxlZCwKIAkJLm1heGxlbgkJPSBzaXplb2YoaW50
KSwKIAkJLnByb2NfaGFuZGxlcgk9IHByb2NfZG9pbnR2ZWNfbWlubWF4LAogCQkuZXh0cmExCQk9
ICZ6ZXJvLApkaWZmIC0tZ2l0IGEva2VybmVsL3N5cy5jIGIva2VybmVsL3N5cy5jCmluZGV4IGM2
YzRkNTM1OGJkMy4uZWM0ODM5NmI0OTQzIDEwMDY0NAotLS0gYS9rZXJuZWwvc3lzLmMKKysrIGIv
a2VybmVsL3N5cy5jCkBAIC0yNDk5LDkgKzI0OTksMTMgQEAgU1lTQ0FMTF9ERUZJTkU1KHByY3Rs
LCBpbnQsIG9wdGlvbiwgdW5zaWduZWQgbG9uZywgYXJnMiwgdW5zaWduZWQgbG9uZywgYXJnMywK
IAkJZXJyb3IgPSBQQUNfUkVTRVRfS0VZUyhtZSwgYXJnMik7CiAJCWJyZWFrOwogCWNhc2UgUFJf
U0VUX1RBR0dFRF9BRERSX0NUUkw6CisJCWlmIChhcmczIHx8IGFyZzQgfHwgYXJnNSkKKwkJCXJl
dHVybiAtRUlOVkFMOwogCQllcnJvciA9IFNFVF9UQUdHRURfQUREUl9DVFJMKGFyZzIpOwogCQli
cmVhazsKIAljYXNlIFBSX0dFVF9UQUdHRURfQUREUl9DVFJMOgorCQlpZiAoYXJnMiB8fCBhcmcz
IHx8IGFyZzQgfHwgYXJnNSkKKwkJCXJldHVybiAtRUlOVkFMOwogCQllcnJvciA9IEdFVF9UQUdH
RURfQUREUl9DVFJMKCk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
