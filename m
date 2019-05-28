Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62A2C9B4
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 17:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7AA89E5A;
	Tue, 28 May 2019 15:10:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3302F89C94;
 Tue, 28 May 2019 14:54:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F18CC80D;
 Tue, 28 May 2019 07:54:13 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689083F5AF;
 Tue, 28 May 2019 07:54:13 -0700 (PDT)
Date: Tue, 28 May 2019 15:54:11 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190528145411.GA709@e119886-lin.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527143719.GA59948@MBP.local>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-Mailman-Approved-At: Tue, 28 May 2019 15:10:45 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDM6Mzc6MjBQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDA2OjMwOjUxUE0gKzAyMDAsIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0
aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4gcGFzcyB0YWdnZWQg
dXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90
aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4gCj4gPiBUaGlzIHBh
dGNoIGFsbG93cyB0YWdnZWQgcG9pbnRlcnMgdG8gYmUgcGFzc2VkIHRvIHRoZSBmb2xsb3dpbmcg
bWVtb3J5Cj4gPiBzeXNjYWxsczogYnJrLCBnZXRfbWVtcG9saWN5LCBtYWR2aXNlLCBtYmluZCwg
bWluY29yZSwgbWxvY2ssIG1sb2NrMiwKPiA+IG1tYXAsIG1tYXBfcGdvZmYsIG1wcm90ZWN0LCBt
cmVtYXAsIG1zeW5jLCBtdW5sb2NrLCBtdW5tYXAsCj4gPiByZW1hcF9maWxlX3BhZ2VzLCBzaG1h
dCBhbmQgc2htZHQuCj4gPiAKPiA+IFRoaXMgaXMgZG9uZSBieSB1bnRhZ2dpbmcgcG9pbnRlcnMg
cGFzc2VkIHRvIHRoZXNlIHN5c2NhbGxzIGluIHRoZQo+ID4gcHJvbG9ndWVzIG9mIHRoZWlyIGhh
bmRsZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+Cj4gCj4gQWN0dWFsbHksIEkgZG9uJ3QgdGhpbmsgYW55IG9mIHRoZXNl
IHdyYXBwZXJzIGdldCBjYWxsZWQgKGhhdmUgeW91Cj4gdGVzdGVkIHRoaXMgcGF0Y2g/KS4gRm9s
bG93aW5nIGNvbW1pdCA0Mzc4YTdkNGJlMzAgKCJhcm02NDogaW1wbGVtZW50Cj4gc3lzY2FsbCB3
cmFwcGVycyIpLCBJIHRoaW5rIHdlIGhhdmUgb3RoZXIgbWFjcm8gbmFtZXMgZm9yIG92ZXJyaWRp
bmcgdGhlCj4gc3lzXyogb25lcy4KCldoYXQgaXMgdGhlIHZhbHVlIGluIGFkZGluZyB0aGVzZSB3
cmFwcGVycz8KClRoZSB1bnRhZ2dlZF9hZGRyIG1hY3JvIGlzIGRlZmluZWQgZm9yIGFsbCBpbiBs
aW51eC9tbS5oIGFuZCB0aGVzZSBwYXRjaGVzCmFscmVhZHkgdXNlIHVudGFnZ2VkX2FkZHIgaW4g
Z2VuZXJpYyBjb2RlLiBUaHVzIGFkZGluZyBhIGZldyBtb3JlCnVudGFnZ2VkX2FkZHIgaW4gdGhl
IGdlbmVyaWMgc3lzY2FsbCBoYW5kbGVycyAod2hpY2ggdHVybiB0byBhIG5vcCBmb3IgbW9zdCkK
aXMgc3VyZWx5IGJldHRlciB0aGFuIGFkZGluZyB3cmFwcGVycz8KCkV2ZW4gaWYgb3RoZXIgYXJj
aGl0ZWN0dXJlcyBpbXBsZW1lbnQgdW50YWdnZWRfYWRkciBpbiB0aGUgZnV0dXJlIGl0IHdvdWxk
CmJlIG1vcmUgY29uc2lzdGVudCBpZiB0aGV5IHVudGFnZ2VkIGluIHRoZSBzYW1lIHBsYWNlcyBh
bmQgdGh1cyBub3QgYWRkaW5nCnRoZXNlIHdyYXBwZXJzIGVuZm9yY2VzIHRoYXQuCgpUaGFua3Ms
CgpBbmRyZXcgTXVycmF5Cgo+IAo+IC0tIAo+IENhdGFsaW4KPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
