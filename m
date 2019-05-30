Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81030192
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 20:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E26C6E167;
	Thu, 30 May 2019 18:13:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20C386E3C9;
 Thu, 30 May 2019 16:57:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60E3341;
 Thu, 30 May 2019 09:57:26 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D9E133F5AF; Thu, 30 May 2019 09:57:20 -0700 (PDT)
Date: Thu, 30 May 2019 17:57:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190530165717.GC35418@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <11193998209cc6ff34e7d704f081206b8787b174.camel@oracle.com>
 <20190529142008.5quqv3wskmpwdfbu@mbp>
 <b2753e81-7b57-481f-0095-3c6fecb1a74c@oracle.com>
 <20190530151105.GA35418@arrakis.emea.arm.com>
 <f79336b5-46b4-39c0-b754-23366207e32d@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f79336b5-46b4-39c0-b754-23366207e32d@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 30 May 2019 18:13:10 +0000
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
 Andrew Murray <andrew.murray@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMTA6MDU6NTVBTSAtMDYwMCwgS2hhbGlkIEF6aXogd3Jv
dGU6Cj4gT24gNS8zMC8xOSA5OjExIEFNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiBTbyBp
ZiBhIGRhdGFiYXNlIHByb2dyYW0gaXMgZG9pbmcgYW4gYW5vbnltb3VzIG1tYXAoUFJPVF9UQkkp
IG9mIDEwMEdCLAo+ID4gSUlVQyBmb3Igc3BhcmMgdGhlIGZhdWx0ZWQtaW4gcGFnZXMgd2lsbCBo
YXZlIHJhbmRvbSBjb2xvdXJzIChvbiA2NC1ieXRlCj4gPiBncmFudWxhcml0eSkuIElnbm9yaW5n
IHRoZSBpbmZvcm1hdGlvbiBsZWFrIGZyb20gcHJpb3IgdXNlcyBvZiBzdWNoCj4gPiBwYWdlcywg
aXQgd291bGQgYmUgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBkYiBwcm9ncmFtIHRvIGlzc3Vl
IHRoZQo+ID4gc3R4YS4gT24gYXJtNjQsIHNpbmNlIHdlIGFsc28gd2FudCB0byBkbyB0aGlzIHZp
YSBtYWxsb2MoKSwgYW55IGxhcmdlCj4gPiBhbGxvY2F0aW9uIHdvdWxkIHJlcXVpcmUgYWxsIHBh
Z2VzIHRvIGJlIGZhdWx0ZWQgaW4gc28gdGhhdCBtYWxsb2MoKSBjYW4KPiA+IHNldCB0aGUgd3Jp
dGUgY29sb3VyIGJlZm9yZSBiZWluZyBoYW5kZWQgb3ZlciB0byB0aGUgdXNlci4gVGhhdCdzIHdo
YXQKPiA+IHdlIHdhbnQgdG8gYXZvaWQgYW5kIHRoZSB1c2VyIGlzIGZyZWUgdG8gcmVwYWludCB0
aGUgbWVtb3J5IGFzIGl0IGxpa2VzLgo+IAo+IE9uIHNwYXJjLCBhbnkgbmV3bHkgYWxsb2NhdGVk
IHBhZ2UgaXMgY2xlYXJlZCBhbG9uZyB3aXRoIGFueSBvbGQgdGFncyBvbgo+IGl0LiBTaW5jZSBj
bGVhcmluZyB0YWcgaGFwcGVucyBhdXRvbWF0aWNhbGx5IHdoZW4gcGFnZSBpcyBjbGVhcmVkIG9u
Cj4gc3BhcmMsIGNsZWFyX3VzZXJfcGFnZSgpIHdpbGwgbmVlZCB0byBleGVjdXRlIGFkZGl0aW9u
YWwgc3R4YQo+IGluc3RydWN0aW9ucyB0byBzZXQgYSBuZXcgdGFnLiBJdCBpcyBkb2FibGUuIElu
IGEgd2F5IGl0IGlzIGRvbmUgYWxyZWFkeQo+IGlmIHBhZ2UgaXMgYmVpbmcgcHJlLWNvbG9yZWQg
d2l0aCB0YWcgMCBhbHdheXMgOykKCkFoLCBnb29kIHRvIGtub3cuIE9uIGFybTY0IHdlJ2QgaGF2
ZSB0byB1c2UgZGlmZmVyZW50IGluc3RydWN0aW9ucywKYWx0aG91Z2ggdGhlIHNhbWUgbG9vcC4K
Cj4gV2hlcmUgd291bGQgdGhlIHByZS1kZWZpbmVkIHRhZyBiZSBzdG9yZWQgLSBhcyBwYXJ0IG9m
IGFkZHJlc3Mgc3RvcmVkCj4gaW4gdm1fc3RhcnQgb3IgYSBuZXcgZmllbGQgaW4gdm1fYXJlYV9z
dHJ1Y3Q/CgpJIHRoaW5rIHdlIGNhbiBkaXNjdXNzIHRoZSBkZXRhaWxzIHdoZW4gd2UgcG9zdCB0
aGUgYWN0dWFsIE1URSBwYXRjaGVzLgpJbiBvdXIgaW50ZXJuYWwgaGFjayB3ZSBvdmVybG9hZGVk
IHRoZSBWTV9ISUdIX0FSQ0hfKiBmbGFncyBhbmQgc2VsZWN0ZWQKQ09ORklHX0FSQ0hfVVNFU19I
SUdIX1ZNQV9GTEFHUyAodXNlZCBmb3IgcGtleXMgb24geDg2KS4KCkZvciB0aGUgdGltZSBiZWlu
ZywgSSdkIHJhdGhlciByZXN0cmljdCB0YWdnZWQgYWRkcmVzc2VzIHBhc3NlZCB0bwptbWFwKCkg
dW50aWwgd2UgYWdyZWVkIHRoYXQgdGhleSBoYXZlIGFueSBtZWFuaW5nLiBJZiB3ZSBhbGxvd2Vk
IHRoZW0Kbm93IGJ1dCBnZXQgaWdub3JlZCAodGhvdWdoIHByb2JhYmx5IG5vLW9uZSB3b3VsZCBi
ZSBkb2luZyB0aGlzKSwgSSBmZWVsCml0J3Mgc2xpZ2h0bHkgaGFyZGVyIHRvIGNoYW5nZSB0aGUg
c2VtYW50aWNzIGFmdGVyd2FyZHMuCgpUaGFua3MuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
