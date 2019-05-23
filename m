Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91022281F0
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 17:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9E56E02F;
	Thu, 23 May 2019 15:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id C75A889D9A;
 Thu, 23 May 2019 10:43:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84A77341;
 Thu, 23 May 2019 03:43:05 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A023F718;
 Thu, 23 May 2019 03:42:59 -0700 (PDT)
Date: Thu, 23 May 2019 11:42:57 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523104256.GX28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
 <20190522134925.GV28398@e103592.cambridge.arm.com>
 <20190523002052.GF15389@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523002052.GF15389@ziepe.ca>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 23 May 2019 15:56:46 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>,
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDk6MjA6NTJQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDAyOjQ5OjI4UE0gKzAxMDAsIERhdmUg
TWFydGluIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDM6NDg6NTZQTSAtMDMw
MCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAw
Mzo0OTozMVBNICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IFRo
ZSB0YWdnZWQgcG9pbnRlcnMgKHdoZXRoZXIgaHdhc2FuIG9yIE1URSkgc2hvdWxkIGlkZWFsbHkg
YmUgYQo+ID4gPiA+IHRyYW5zcGFyZW50IGZlYXR1cmUgZm9yIHRoZSBhcHBsaWNhdGlvbiB3cml0
ZXIgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuCj4gPiA+ID4gc29sdmUgaXQgZW50aXJlbHkgYW5k
IG1ha2UgaXQgc2VhbWxlc3MgZm9yIHRoZSBtdWx0aXR1ZGUgb2YgaW9jdGxzKCkuCj4gPiA+ID4g
SSdkIHNheSB5b3Ugb25seSBvcHQgaW4gdG8gc3VjaCBmZWF0dXJlIGlmIHlvdSBrbm93IHdoYXQg
eW91IGFyZSBkb2luZwo+ID4gPiA+IGFuZCB0aGUgdXNlciBjb2RlIHRha2VzIGNhcmUgb2Ygc3Bl
Y2lmaWMgY2FzZXMgbGlrZSBpb2N0bCgpLCBoZW5jZSB0aGUKPiA+ID4gPiBwcmN0bCgpIHByb3Bv
c2FsIGV2ZW4gZm9yIHRoZSBod2FzYW4uCj4gPiA+IAo+ID4gPiBJJ20gbm90IHN1cmUgc3VjaCBh
IGRpcmUgdmlldyBpcyB3YXJyZW50ZWQuLiAKPiA+ID4gCj4gPiA+IFRoZSBpb2N0bCBzaXR1YXRp
b24gaXMgbm90IHNvIGJhZCwgb3RoZXIgdGhhbiBhIGZldyBzcGVjaWFsIGNhc2VzLAo+ID4gPiBt
b3N0IGRyaXZlcnMganVzdCB0YWtlIGEgJ3ZvaWQgX191c2VyIConIGFuZCBwYXNzIGl0IGFzIGFu
IGFyZ3VtZW50IHRvCj4gPiA+IHNvbWUgZnVuY3Rpb24gdGhhdCBhY2NlcHRzIGEgJ3ZvaWQgX191
c2VyIConLiBzcGFyc2UgZXQgYWwgdmVyaWZ5Cj4gPiA+IHRoaXMuIAo+ID4gPiAKPiA+ID4gQXMg
bG9uZyBhcyB0aGUgY29yZSBmdW5jdGlvbnMgZG8gdGhlIHJpZ2h0IHRoaW5nIHRoZSBkcml2ZXJz
IHdpbGwgYmUKPiA+ID4gT0suCj4gPiA+IAo+ID4gPiBUaGUgb25seSBwbGFjZSB0aGluZ3MgZ2V0
IGRpY3kgaXMgaWYgc29tZW9uZSBjYXN0cyB0byB1bnNpZ25lZCBsb25nCj4gPiA+IChpZSBmb3Ig
dm1hIHdvcmspIGJ1dCBJIHRoaW5rIHRoYXQgcmVmbGVjdHMgdGhhdCBvdXIgZHJpdmVyIGZhY2lu
Zwo+ID4gPiBBUElzIGZvciBWTUFzIGFyZSBjb21wYXRpYmxlIHdpdGggc3RhdGljIGFuYWx5c2lz
IChpZSBJIGhhdmUgbm8KPiA+ID4gZWFydGhseSBpZGVhIHdoeSBnZXRfdXNlcl9wYWdlcygpIGFj
Y2VwdHMgYW4gdW5zaWduZWQgbG9uZyksIG5vdCB0aGF0Cj4gPiA+IHRoaXMgaXMgdG9vIGhhcmQu
Cj4gPiAKPiA+IElmIG11bHRpcGxlIHBlb3BsZSB3aWxsIGNhcmUgYWJvdXQgdGhpcywgcGVyaGFw
cyB3ZSBzaG91bGQgdHJ5IHRvCj4gPiBhbm5vdGF0ZSB0eXBlcyBtb3JlIGV4cGxpY2l0bHkgaW4g
U1lTQ0FMTF9ERUZJTkV4KCkgYW5kIEFCSSBkYXRhCj4gPiBzdHJ1Y3R1cmVzLgo+ID4gCj4gPiBG
b3IgZXhhbXBsZSwgd2UgY291bGQgaGF2ZSBhIGNvdXBsZSBvZiBtdXR1YWxseSBleGNsdXNpdmUg
bW9kaWZpZXJzCj4gPiAKPiA+IFQgX19vYmplY3QgKgo+ID4gVCBfX3ZhZGRyICogKG9yIFUgX192
YWRkcikKPiA+IAo+ID4gSW4gdGhlIGZpcnN0IGNhc2UgdGhlIHBvaW50ZXIgcG9pbnRzIHRvIGFu
IG9iamVjdCAoaW4gdGhlIEMgc2Vuc2UpCj4gPiB0aGF0IHRoZSBjYWxsIG1heSBkZXJlZmVyZW5j
ZSBidXQgbm90IHVzZSBmb3IgYW55IG90aGVyIHB1cnBvc2UuCj4gCj4gSG93IHdvdWxkIHlvdSB1
c2UgdGhlc2UgdHdvIGRpZmZlcmVudGx5Pwo+IAo+IFNvIGZhciB0aGUga2VybmVsIGhhcyB3b3Jr
ZWQgdGhhdCBfX3VzZXIgc2hvdWxkIHRhZyBhbnkgcG9pbnRlciB0aGF0Cj4gaXMgZnJvbSB1c2Vy
c3BhY2UgYW5kIHRoZW4geW91IGNhbid0IGRvIGFueXRoaW5nIHdpdGggaXQgdW50aWwgeW91Cj4g
dHJhbnNmb3JtIGl0IGludG8gYSBrZXJuZWwgc29tZXRoaW5nCgpVbHRpbWF0ZWx5IGl0IHdvdWxk
IGJlIGdvb2QgdG8gZGlzYWxsb3cgY2FzdGluZyBfX29iamVjdCBwb2ludGVycyBleGVjcHQKdG8g
Y29tcGF0aWJsZSBfX29iamVjdCBwb2ludGVyIHR5cGVzLCBhbmQgdG8gbWFrZSBnZXRfdXNlciBl
dGMuIGRlbWFuZApfX29iamVjdC4KCl9fdmFkZHIgcG9pbnRlcnMgLyBhZGRyZXNzZXMgd291bGQg
YmUgZnJlZWx5IGNhc3RhYmxlLCBidXQgbm90IHRvCl9fb2JqZWN0IGFuZCBzbyB3b3VsZCBub3Qg
YmUgZGVyZWZlcmVuY2VhYmxlIGV2ZW4gaW5kaXJlY3RseS4KCk9yIHRoYXQncyB0aGUgZ2VuZXJh
bCBpZGVhLiAgRmlndXJpbmcgb3V0IGEgc2FuZSBzZXQgb2YgcnVsZXMgdGhhdCB3ZQpjb3VsZCBh
Y3R1YWxseSBjaGVjayAvIGVuZm9yY2Ugd291bGQgcmVxdWlyZSBhIGJpdCBvZiB3b3JrLgoKKFdo
ZXRoZXIgdGhlIF9fdmFkZHIgYmFzZSB0eXBlIGlzIGEgcG9pbnRlciBvciBhbiBpbnRlZ2VyIHR5
cGUgaXMKcHJvYmFibHkgbW9vdCwgZHVlIHRvIHRoZSByZXN0cmljdGlvbnMgd2Ugd291bGQgcGxh
Y2Ugb24gdGhlIHVzZSBvZgp0aGVzZSBhbnl3YXkuKQoKPiA+IHRvIHRlbGwgc3RhdGljIGFuYWx5
c2VycyB0aGUgcmVhbCB0eXBlIG9mIHBvaW50ZXJzIHNtdWdnbGVkIHRocm91Z2gKPiA+IFVBUEkg
ZGlzZ3Vpc2VkIGFzIG90aGVyIHR5cGVzICgqY291Z2gqIEtWTSwgZXRjLikKPiAKPiBZZXMsIHRo
YXQgd291bGQgaGVscCBhbG90LCB3ZSBvZnRlbiBoYXZlIHRvIHBhc3MgcG9pbnRlcnMgdGhyb3Vn
aCBhCj4gdTY0IGluIHRoZSB1QVBJLCBhbmQgdGhlcmUgaXMgbm8gc3RhdGljIGNoZWNrZXIgc3Vw
cG9ydCB0byBtYWtlIHN1cmUKPiB0aGV5IGFyZSBydW4gdGhyb3VnaCB0aGUgdTY0X3RvX3VzZXJf
cHRyKCkgaGVscGVyLgoKQWdyZWVkLgoKQ2hlZXJzCi0tLURhdmUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
