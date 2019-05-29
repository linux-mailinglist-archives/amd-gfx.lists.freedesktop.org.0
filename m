Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE82DE6A
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC00A6E10B;
	Wed, 29 May 2019 13:37:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id E54B16E0DB;
 Wed, 29 May 2019 12:42:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B58780D;
 Wed, 29 May 2019 05:42:33 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF043F59C;
 Wed, 29 May 2019 05:42:27 -0700 (PDT)
Date: Wed, 29 May 2019 13:42:25 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190529124224.GE28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <20190528155644.GD28398@e103592.cambridge.arm.com>
 <20190528163400.GE32006@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528163400.GE32006@arrakis.emea.arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 29 May 2019 13:37:24 +0000
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
 linux-arm-kernel@lists.infradead.org, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDU6MzQ6MDBQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA0OjU2OjQ1UE0gKzAxMDAsIERhdmUg
UCBNYXJ0aW4gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDo0MDo1OFBNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4gTXkg
dGhvdWdodHMgb24gYWxsb3dpbmcgdGFncyAocXVpY2sgbG9vayk6Cj4gPiA+Cj4gPiA+IGJyayAt
IG5vCj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4gbWxvY2ssIG1sb2NrMiwgbXVubG9jayAtIHll
cwo+ID4gPiBtbWFwIC0gbm8gKHdlIG1heSBjaGFuZ2UgdGhpcyB3aXRoIE1URSBidXQgbm90IGZv
ciBUQkkpCj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4gbXByb3RlY3QgLSB5ZXMKPiA+IAo+ID4g
SSBoYXZlbid0IGZvbGxvd2luZyB0aGlzIGRpc2N1c3Npb24gY2xvc2VseS4uLiB3aGF0J3MgdGhl
IHJhdGlvbmFsZSBmb3IKPiA+IHRoZSBpbmNvbnNpc3RlbmNpZXMgaGVyZSAoZmVlbCBmcmVlIHRv
IHJlZmVyIG1lIGJhY2sgdG8gdGhlIGRpc2N1c3Npb24KPiA+IGlmIGl0J3MgZWxzZXdoZXJlKS4K
PiAKPiBfTXlfIHJhdGlvbmFsZSAoZmVlbCBmcmVlIHRvIGRpc2FncmVlKSBpcyB0aGF0IG1tYXAo
KSBieSBkZWZhdWx0IHdvdWxkCj4gbm90IHJldHVybiBhIHRhZ2dlZCBhZGRyZXNzIChpZ25vcmlu
ZyBNVEUgZm9yIG5vdykuIElmIGl0IGdldHMgcGFzc2VkIGEKPiB0YWdnZWQgYWRkcmVzcyBvciBh
ICJ0YWdnZWQgTlVMTCIgKGZvciBsYWNrIG9mIGEgYmV0dGVyIG5hbWUpIHdlIGRvbid0Cj4gaGF2
ZSBjbGVhciBzZW1hbnRpY3Mgb2Ygd2hldGhlciB0aGUgcmV0dXJuZWQgYWRkcmVzcyBzaG91bGQg
YmUgdGFnZ2VkIGluCj4gdGhpcyBBQkkgcmVsYXhhdGlvbi4gSSdkIHJhdGhlciByZXNlcnZlIHRo
aXMgc3BlY2lmaWMgYmVoYXZpb3VyIGlmIHdlCj4gb3ZlcmxvYWQgdGhlIG5vbi16ZXJvIHRhZyBt
ZWFuaW5nIG9mIG1tYXAoKSBmb3IgTVRFLiBTaW1pbGFyIHJlYXNvbmluZwo+IGZvciBtcmVtYXAo
KSwgYXQgbGVhc3Qgb24gdGhlIG5ld19hZGRyZXNzIGFyZ3VtZW50IChub3QgZW50aXJlbHkgc3Vy
ZQo+IGFib3V0IG9sZF9hZGRyZXNzKS4KPiAKPiBtdW5tYXAoKSBzaG91bGQgcHJvYmFibHkgZm9s
bG93IHRoZSBtbWFwKCkgcnVsZXMuCj4gCj4gQXMgZm9yIGJyaygpLCBJIGRvbid0IHNlZSB3aHkg
dGhlIHVzZXIgd291bGQgbmVlZCB0byBwYXNzIGEgdGFnZ2VkCj4gYWRkcmVzcywgd2UgY2FuJ3Qg
YXNzb2NpYXRlIGFueSBtZWFuaW5nIHRvIHRoaXMgdGFnLgo+IAo+IEZvciB0aGUgcmVzdCwgc2lu
Y2UgaXQncyBsaWtlbHkgc3VjaCBhZGRyZXNzZXMgd291bGQgaGF2ZSBiZWVuIHRhZ2dlZCBieQo+
IG1hbGxvYygpIGluIHVzZXIgc3BhY2UsIHdlIHNob3VsZCBhbGxvdyB0YWdnZWQgcG9pbnRlcnMu
CgpUaG9zZSBhcmd1bWVudHMgc2VlbSByZWFzb25hYmxlLiAgV2Ugc2hvdWxkIHRyeSB0byBjYXB0
dXJlIHRoaXMKc29tZXdoZXJlIHdoZW4gZG9jdW1lbnRpbmcgdGhlIEFCSS4KClRvIGJlIGNsZWFy
LCBJJ20gbm90IHN1cmUgdGhhdCB3ZSBzaG91bGQgZ3VhcmFudGVlIGFueXdoZXJlIHRoYXQgYQp0
YWdnZWQgcG9pbnRlciBpcyByZWplY3RlZDogcmF0aGVyIHRoZSBiZWhhdmlvdXIgc2hvdWxkIHBy
b2JhYmx5IGJlCmxlZnQgdW5zcGVjaWZpZWQuICBUaGVuIHdlIGNhbiB0aWR5IGl0IHVwIGluY3Jl
bWVudGFsbHkuCgooVGhlIGJlaGF2aW91ciBpcyB1bnNwZWNpZmllZCB0b2RheSwgaW4gYW55IGNh
c2UuKQoKQ2hlZXJzCi0tLURhdmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
