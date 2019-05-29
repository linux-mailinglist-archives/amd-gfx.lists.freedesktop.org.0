Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7402DE77
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C4A6E328;
	Wed, 29 May 2019 13:37:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 433B46E101;
 Wed, 29 May 2019 13:23:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0EF180D;
 Wed, 29 May 2019 06:23:50 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5BC23F59C;
 Wed, 29 May 2019 06:23:44 -0700 (PDT)
Date: Wed, 29 May 2019 14:23:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190529132341.27t3knoxpb7t7y3g@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <20190528155644.GD28398@e103592.cambridge.arm.com>
 <20190528163400.GE32006@arrakis.emea.arm.com>
 <20190529124224.GE28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529124224.GE28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDE6NDI6MjVQTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3
cm90ZToKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNTozNDowMFBNICswMTAwLCBDYXRhbGlu
IE1hcmluYXMgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDo1Njo0NVBNICsw
MTAwLCBEYXZlIFAgTWFydGluIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAw
NDo0MDo1OFBNICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+IAo+ID4gPiBbLi4u
XQo+ID4gPiAKPiA+ID4gPiBNeSB0aG91Z2h0cyBvbiBhbGxvd2luZyB0YWdzIChxdWljayBsb29r
KToKPiA+ID4gPgo+ID4gPiA+IGJyayAtIG5vCj4gPiA+IAo+ID4gPiBbLi4uXQo+ID4gPiAKPiA+
ID4gPiBtbG9jaywgbWxvY2syLCBtdW5sb2NrIC0geWVzCj4gPiA+ID4gbW1hcCAtIG5vICh3ZSBt
YXkgY2hhbmdlIHRoaXMgd2l0aCBNVEUgYnV0IG5vdCBmb3IgVEJJKQo+ID4gPiAKPiA+ID4gWy4u
Ll0KPiA+ID4gCj4gPiA+ID4gbXByb3RlY3QgLSB5ZXMKPiA+ID4gCj4gPiA+IEkgaGF2ZW4ndCBm
b2xsb3dpbmcgdGhpcyBkaXNjdXNzaW9uIGNsb3NlbHkuLi4gd2hhdCdzIHRoZSByYXRpb25hbGUg
Zm9yCj4gPiA+IHRoZSBpbmNvbnNpc3RlbmNpZXMgaGVyZSAoZmVlbCBmcmVlIHRvIHJlZmVyIG1l
IGJhY2sgdG8gdGhlIGRpc2N1c3Npb24KPiA+ID4gaWYgaXQncyBlbHNld2hlcmUpLgo+ID4gCj4g
PiBfTXlfIHJhdGlvbmFsZSAoZmVlbCBmcmVlIHRvIGRpc2FncmVlKSBpcyB0aGF0IG1tYXAoKSBi
eSBkZWZhdWx0IHdvdWxkCj4gPiBub3QgcmV0dXJuIGEgdGFnZ2VkIGFkZHJlc3MgKGlnbm9yaW5n
IE1URSBmb3Igbm93KS4gSWYgaXQgZ2V0cyBwYXNzZWQgYQo+ID4gdGFnZ2VkIGFkZHJlc3Mgb3Ig
YSAidGFnZ2VkIE5VTEwiIChmb3IgbGFjayBvZiBhIGJldHRlciBuYW1lKSB3ZSBkb24ndAo+ID4g
aGF2ZSBjbGVhciBzZW1hbnRpY3Mgb2Ygd2hldGhlciB0aGUgcmV0dXJuZWQgYWRkcmVzcyBzaG91
bGQgYmUgdGFnZ2VkIGluCj4gPiB0aGlzIEFCSSByZWxheGF0aW9uLiBJJ2QgcmF0aGVyIHJlc2Vy
dmUgdGhpcyBzcGVjaWZpYyBiZWhhdmlvdXIgaWYgd2UKPiA+IG92ZXJsb2FkIHRoZSBub24temVy
byB0YWcgbWVhbmluZyBvZiBtbWFwKCkgZm9yIE1URS4gU2ltaWxhciByZWFzb25pbmcKPiA+IGZv
ciBtcmVtYXAoKSwgYXQgbGVhc3Qgb24gdGhlIG5ld19hZGRyZXNzIGFyZ3VtZW50IChub3QgZW50
aXJlbHkgc3VyZQo+ID4gYWJvdXQgb2xkX2FkZHJlc3MpLgo+ID4gCj4gPiBtdW5tYXAoKSBzaG91
bGQgcHJvYmFibHkgZm9sbG93IHRoZSBtbWFwKCkgcnVsZXMuCj4gPiAKPiA+IEFzIGZvciBicmso
KSwgSSBkb24ndCBzZWUgd2h5IHRoZSB1c2VyIHdvdWxkIG5lZWQgdG8gcGFzcyBhIHRhZ2dlZAo+
ID4gYWRkcmVzcywgd2UgY2FuJ3QgYXNzb2NpYXRlIGFueSBtZWFuaW5nIHRvIHRoaXMgdGFnLgo+
ID4gCj4gPiBGb3IgdGhlIHJlc3QsIHNpbmNlIGl0J3MgbGlrZWx5IHN1Y2ggYWRkcmVzc2VzIHdv
dWxkIGhhdmUgYmVlbiB0YWdnZWQgYnkKPiA+IG1hbGxvYygpIGluIHVzZXIgc3BhY2UsIHdlIHNo
b3VsZCBhbGxvdyB0YWdnZWQgcG9pbnRlcnMuCj4gCj4gVGhvc2UgYXJndW1lbnRzIHNlZW0gcmVh
c29uYWJsZS4gIFdlIHNob3VsZCB0cnkgdG8gY2FwdHVyZSB0aGlzCj4gc29tZXdoZXJlIHdoZW4g
ZG9jdW1lbnRpbmcgdGhlIEFCSS4KPiAKPiBUbyBiZSBjbGVhciwgSSdtIG5vdCBzdXJlIHRoYXQg
d2Ugc2hvdWxkIGd1YXJhbnRlZSBhbnl3aGVyZSB0aGF0IGEKPiB0YWdnZWQgcG9pbnRlciBpcyBy
ZWplY3RlZDogcmF0aGVyIHRoZSBiZWhhdmlvdXIgc2hvdWxkIHByb2JhYmx5IGJlCj4gbGVmdCB1
bnNwZWNpZmllZC4gIFRoZW4gd2UgY2FuIHRpZHkgaXQgdXAgaW5jcmVtZW50YWxseS4KPiAKPiAo
VGhlIGJlaGF2aW91ciBpcyB1bnNwZWNpZmllZCB0b2RheSwgaW4gYW55IGNhc2UuKQoKV2hhdCBp
cyBzcGVjaWZpZWQgKG9yIHJhdGhlciBkZS1mYWN0byBBQkkpIHRvZGF5IGlzIHRoYXQgcGFzc2lu
ZyBhIHVzZXIKYWRkcmVzcyBhYm92ZSBUQVNLX1NJWkUgKGUuZy4gbm9uLXplcm8gdG9wIGJ5dGUp
IHdvdWxkIGZhaWwgaW4gbW9zdApjYXNlcy4gSWYgd2UgcmVsYXggdGhpcyB3aXRoIHRoZSBUQkkg
d2UgbWF5IGVuZCB1cCB3aXRoIHNvbWUgZGUtZmFjdG8KQUJJIGJlZm9yZSB3ZSBhY3R1YWxseSBn
ZXQgTVRFIGhhcmR3YXJlLiBUaWdodGVuaW5nIGl0IGFmdGVyd2FyZHMgbWF5IGJlCnNsaWdodGx5
IG1vcmUgcHJvYmxlbWF0aWMsIGFsdGhvdWdoIE1URSBuZWVkcyB0byBiZSBhbiBleHBsaWNpdCBv
cHQtaW4uCgpJT1csIEkgd291bGRuJ3Qgd2FudCB0byB1bm5lY2Vzc2FyaWx5IHJlbGF4IHRoZSBB
QkkgaWYgd2UgZG9uJ3QgbmVlZCB0by4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
