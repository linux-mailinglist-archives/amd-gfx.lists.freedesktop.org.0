Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70D284C2
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 19:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7F56E04B;
	Thu, 23 May 2019 17:19:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E4C689E2A;
 Thu, 23 May 2019 16:57:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0774C374;
 Thu, 23 May 2019 09:57:22 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B06C3F5AF;
 Thu, 23 May 2019 09:57:15 -0700 (PDT)
Date: Thu, 23 May 2019 17:57:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523165708.q6ru7xg45aqfjzpr@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
 <20190522134925.GV28398@e103592.cambridge.arm.com>
 <20190523002052.GF15389@ziepe.ca>
 <20190523104256.GX28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523104256.GX28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 23 May 2019 17:19:01 +0000
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
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6NDI6NTdBTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3
cm90ZToKPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAwOToyMDo1MlBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAwMjo0OToyOFBNICsw
MTAwLCBEYXZlIE1hcnRpbiB3cm90ZToKPiA+ID4gSWYgbXVsdGlwbGUgcGVvcGxlIHdpbGwgY2Fy
ZSBhYm91dCB0aGlzLCBwZXJoYXBzIHdlIHNob3VsZCB0cnkgdG8KPiA+ID4gYW5ub3RhdGUgdHlw
ZXMgbW9yZSBleHBsaWNpdGx5IGluIFNZU0NBTExfREVGSU5FeCgpIGFuZCBBQkkgZGF0YQo+ID4g
PiBzdHJ1Y3R1cmVzLgo+ID4gPiAKPiA+ID4gRm9yIGV4YW1wbGUsIHdlIGNvdWxkIGhhdmUgYSBj
b3VwbGUgb2YgbXV0dWFsbHkgZXhjbHVzaXZlIG1vZGlmaWVycwo+ID4gPiAKPiA+ID4gVCBfX29i
amVjdCAqCj4gPiA+IFQgX192YWRkciAqIChvciBVIF9fdmFkZHIpCj4gPiA+IAo+ID4gPiBJbiB0
aGUgZmlyc3QgY2FzZSB0aGUgcG9pbnRlciBwb2ludHMgdG8gYW4gb2JqZWN0IChpbiB0aGUgQyBz
ZW5zZSkKPiA+ID4gdGhhdCB0aGUgY2FsbCBtYXkgZGVyZWZlcmVuY2UgYnV0IG5vdCB1c2UgZm9y
IGFueSBvdGhlciBwdXJwb3NlLgo+ID4gCj4gPiBIb3cgd291bGQgeW91IHVzZSB0aGVzZSB0d28g
ZGlmZmVyZW50bHk/Cj4gPiAKPiA+IFNvIGZhciB0aGUga2VybmVsIGhhcyB3b3JrZWQgdGhhdCBf
X3VzZXIgc2hvdWxkIHRhZyBhbnkgcG9pbnRlciB0aGF0Cj4gPiBpcyBmcm9tIHVzZXJzcGFjZSBh
bmQgdGhlbiB5b3UgY2FuJ3QgZG8gYW55dGhpbmcgd2l0aCBpdCB1bnRpbCB5b3UKPiA+IHRyYW5z
Zm9ybSBpdCBpbnRvIGEga2VybmVsIHNvbWV0aGluZwo+IAo+IFVsdGltYXRlbHkgaXQgd291bGQg
YmUgZ29vZCB0byBkaXNhbGxvdyBjYXN0aW5nIF9fb2JqZWN0IHBvaW50ZXJzIGV4ZWNwdAo+IHRv
IGNvbXBhdGlibGUgX19vYmplY3QgcG9pbnRlciB0eXBlcywgYW5kIHRvIG1ha2UgZ2V0X3VzZXIg
ZXRjLiBkZW1hbmQKPiBfX29iamVjdC4KPiAKPiBfX3ZhZGRyIHBvaW50ZXJzIC8gYWRkcmVzc2Vz
IHdvdWxkIGJlIGZyZWVseSBjYXN0YWJsZSwgYnV0IG5vdCB0bwo+IF9fb2JqZWN0IGFuZCBzbyB3
b3VsZCBub3QgYmUgZGVyZWZlcmVuY2VhYmxlIGV2ZW4gaW5kaXJlY3RseS4KCkkgdGhpbmsgaXQg
Z2V0cyB0b28gY29tcGxpY2F0ZWQgYW5kIHRoZXJlIGFyZSBhbWJpZ3VvdXMgY2FzZXMgdGhhdCB3
ZQptYXkgbm90IGJlIGFibGUgdG8gZGlzdGluZ3Vpc2guIEZvciBleGFtcGxlIGNvcHlfZnJvbV91
c2VyKCkgbWF5IGJlIHVzZWQKdG8gY29weSBhIHVzZXIgZGF0YSBzdHJ1Y3R1cmUgaW50byB0aGUg
a2VybmVsLCBoZW5jZSBfX29iamVjdCB3b3VsZAp3b3JrLCB3aGlsZSB0aGUgc2FtZSBmdW5jdGlv
biBtYXkgYmUgdXNlZCB0byBjb3B5IG9wYXF1ZSBkYXRhIHRvIGEgZmlsZSwKc28gX192YWRkciBt
YXkgYmUgYSBiZXR0ZXIgb3B0aW9uICh1bmxlc3MgSSBtaXN1bmRlcnN0b29kIHlvdXIKcHJvcG9z
YWwpLgoKV2UgY3VycmVudGx5IGhhdmUgVCBfX3VzZXIgKiBhbmQgSSB0aGluayBpdCdzIGEgZ29v
ZCBzdGFydGluZyBwb2ludC4gVGhlCnByaW9yIGF0dGVtcHQgWzFdIHdhcyBzaHV0IGRvd24gYmVj
YXVzZSBpdCB3YXMganVzdCBoaWRpbmcgdGhlIGNhc3QKdXNpbmcgX19mb3JjZS4gV2UnZCBuZWVk
IHRvIHdvcmsgdGhyb3VnaCB0aG9zZSBjYXNlcyBhZ2FpbiBhbmQgcmF0aGVyCnN0YXJ0IGNoYW5n
aW5nIHRoZSBmdW5jdGlvbiBwcm90b3R5cGVzIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGNhc3Rpbmcg
aW4KdGhlIGNhbGxlcnMgKGUuZy4gZ2V0X3VzZXJfcGFnZXModm9pZCBfX3VzZXIgKikgb3IgY29t
ZSB1cCB3aXRoIGEgbmV3CnR5cGUpIHdoaWxlIGNoYW5naW5nIHRoZSBleHBsaWNpdCBjYXN0aW5n
IHRvIGEgbWFjcm8gd2hlcmUgaXQgbmVlZHMgdG8KYmUgb2J2aW91cyB0aGF0IHdlIGFyZSBjb252
ZXJ0aW5nIGEgdXNlciBwb2ludGVyLCBwb3RlbnRpYWxseSB0eXBlZAoodGFnZ2VkKSwgdG8gYW4g
dW50eXBlZCBhZGRyZXNzIHJhbmdlLiBXZSBtYXkgbmVlZCBhIHVzZXJfcHRyX3RvX3Vsb25nKCkK
bWFjcm8gb3Igc2ltaWxhciAoaXQgc2VlbXMgdGhhdCB3ZSBoYXZlIGEgdTY0X3RvX3VzZXJfcHRy
LCB3YXNuJ3QgYXdhcmUKb2YgaXQpLgoKSXQgbWF5IGFjdHVhbGx5IG5vdCBiZSBmYXIgZnJvbSB3
aGF0IHlvdSBzdWdnZXN0ZWQgYnV0IEknZCBrZWVwIHRoZQpjdXJyZW50IFQgX191c2VyICogdG8g
ZGVub3RlIHBvc3NpYmxlIGRlcmVmZXJlbmNlLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvNWQ1NDUyNmU1ZmYyZTVhZDYzZDBkZmRkOWFiMTdjZjM1OWFmYTRmMi4xNTM1NjI5MDk5
LmdpdC5hbmRyZXlrbnZsQGdvb2dsZS5jb20vCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
