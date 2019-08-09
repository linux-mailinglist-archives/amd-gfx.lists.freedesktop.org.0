Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF987D51
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD86EE23;
	Fri,  9 Aug 2019 14:56:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39BB46ED3F;
 Fri,  9 Aug 2019 09:28:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4D7415A2;
 Fri,  9 Aug 2019 02:28:07 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA7C43F575;
 Fri,  9 Aug 2019 02:28:02 -0700 (PDT)
Date: Fri, 9 Aug 2019 10:28:00 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190809092758.GK10425@arm.com>
References: <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
 <201908081410.C16D2BD@keescook>
 <20190808153300.09d3eb80772515f0ea062833@linux-foundation.org>
 <201908081608.A4F6711@keescook>
 <20190809090016.GA23083@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809090016.GA23083@arrakis.emea.arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Fri, 09 Aug 2019 14:56:11 +0000
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
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Dave Hansen <dave.hansen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6MDA6MTdBTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA0OjA5OjA0UE0gLTA3MDAsIEtlZXMg
Q29vayB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAzOjMzOjAwUE0gLTA3MDAs
IEFuZHJldyBNb3J0b24gd3JvdGU6Cj4gPiA+IE9uIFRodSwgOCBBdWcgMjAxOSAxNDoxMjoxOSAt
MDcwMCBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+IAo+ID4g
PiA+ID4gVGhlIG9uZXMgdGhhdCBhcmUgbGVmdCBhcmUgdGhlIG1tIG9uZXM6IDQsIDUsIDYsIDcg
YW5kIDguCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFuZHJldywgY291bGQgeW91IHRha2UgYSBsb29r
IGFuZCBnaXZlIHlvdXIgQWNrZWQtYnkgb3IgcGljayB0aGVtIHVwIGRpcmVjdGx5Pwo+ID4gPiA+
IAo+ID4gPiA+IEdpdmVuIHRoZSBzdWJzeXN0ZW0gQWNrcywgaXQgc2VlbXMgbGlrZSAzLTEwIGFu
ZCAxMiBjb3VsZCBhbGwganVzdCBnbwo+ID4gPiA+IHZpYSBBbmRyZXc/IEkgaG9wZSBoZSBhZ3Jl
ZXMuIDopCj4gPiA+IAo+ID4gPiBJJ2xsIGdyYWIgZXZlcnl0aGluZyB0aGF0IGhhcyBub3QgeWV0
IGFwcGVhcmVkIGluIGxpbnV4LW5leHQuICBJZiBtb3JlCj4gPiA+IG9mIHRoZXNlIHBhdGNoZXMg
YXBwZWFyIGluIGxpbnV4LW5leHQgSSdsbCBkcm9wIHRob3NlIGFzIHdlbGwuCj4gPiA+IAo+ID4g
PiBUaGUgcmV2aWV3IGRpc2N1c3Npb24gYWdhaW5zdCAiIFtQQVRDSCB2MTkgMDIvMTVdIGFybTY0
OiBJbnRyb2R1Y2UKPiA+ID4gcHJjdGwoKSBvcHRpb25zIHRvIGNvbnRyb2wgdGhlIHRhZ2dlZCB1
c2VyIGFkZHJlc3NlcyBBQkkiIGhhcyBwZXRlcmVkCj4gPiA+IG91dCBpbmNvbmNsdXNpdmVseS4g
IHByY3RsKCkgdnMgYXJjaF9wcmN0bCgpLgo+ID4gCj4gPiBJJ3ZlIGFsd2F5cyBkaXNsaWtlZCBh
cmNoX3ByY3RsKCkgZXhpc3RpbmcgYXQgYWxsLiBHaXZlbiB0aGF0IHRhZ2dpbmcgaXMKPiA+IGxp
a2VseSB0byBiZSBhIG11bHRpLWFyY2hpdGVjdHVyYWwgZmVhdHVyZSwgaXQgc2VlbXMgbGlrZSB0
aGUgY29udHJvbHMKPiA+IHNob3VsZCBsaXZlIGluIHByY3RsKCkgdG8gbWUuCj4gCj4gSXQgdG9v
ayBhIGJpdCBvZiBncmVwJ2luZyB0byBmaWd1cmUgb3V0IHdoYXQgRGF2ZSBIIG1lYW50IGJ5Cj4g
YXJjaF9wcmN0bCgpLiBJdCdzIGFuIHg4Ni1zcGVjaWZpYyBzeXNjYWxsIHdoaWNoIHdlIGRvIG5v
dCBoYXZlIG9uIGFybTY0Cj4gKGFuZCBwb3NzaWJseSBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlKS4g
QWN0dWFsbHksIHdlIGRvbid0IGhhdmUgYW55IGFybTY0Cj4gc3BlY2lmaWMgc3lzY2FsbHMsIG9u
bHkgdGhlIGdlbmVyaWMgdW5pc3RkLmgsIGhlbmNlIHRoZSBjb25mdXNpb24uIEZvcgo+IG90aGVy
IGFybTY0LXNwZWNpZmljIHByY3RscyBsaWtlIFNWRSB3ZSB1c2VkIHRoZSBnZW5lcmljIHN5c19w
cmN0bCgpIGFuZAo+IEkgY2FuIHNlZSB4ODYgbm90IGJlaW5nIGNvbnNpc3RlbnQgZWl0aGVyIChQ
Ul9NUFhfRU5BQkxFX01BTkFHRU1FTlQpLgo+IAo+IEluIGdlbmVyYWwgSSBkaXNhZ3JlZSB3aXRo
IGFkZGluZyBhbnkgYXJtNjQtc3BlY2lmaWMgc3lzY2FsbHMgYnV0IGluCj4gdGhpcyBpbnN0YW5j
ZSBpdCBjYW4ndCBldmVuIGJlIGp1c3RpZmllZC4gSSdkIHJhdGhlciBzZWUgc29tZSBjbGVhbi11
cAo+IHNpbWlsYXIgdG8gYXJjaF9wdHJhY2UvcHRyYWNlX3JlcXVlc3QgdGhhbiBpbnRyb2R1Y2lu
ZyBuZXcgc3lzY2FsbAo+IG51bWJlcnMgKGJ1dCBhcyBJIHN1Z2dlc3RlZCBpbiBteSByZXBseSB0
byBEYXZlLCB0aGF0J3MgZm9yIGFub3RoZXIKPiBwYXRjaCBzZXJpZXMpLgoKSSBoYWQgYSBnbyBh
dCByZWZhY3RvcmluZyB0aGlzIGEgd2hpbGUgYWdvLCBidXQgaXQgZmVsbCBieSB0aGUgd2F5c2lk
ZS4KCkkgY2FuIHRyeSB0byByZXN1cnJlY3QgaXQgaWYgaXQncyBzdGlsbCBjb25zaWRlcmVkIHdv
cnRod2hpbGUuCgpDaGVlcnMKLS0tRGF2ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
