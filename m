Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E594387D4F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA786EE22;
	Fri,  9 Aug 2019 14:56:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 712AA8941E;
 Fri,  9 Aug 2019 09:00:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F595344;
 Fri,  9 Aug 2019 02:00:24 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 796343F706; Fri,  9 Aug 2019 02:00:19 -0700 (PDT)
Date: Fri, 9 Aug 2019 10:00:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190809090016.GA23083@arrakis.emea.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
 <201908081410.C16D2BD@keescook>
 <20190808153300.09d3eb80772515f0ea062833@linux-foundation.org>
 <201908081608.A4F6711@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201908081608.A4F6711@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Dave Hansen <dave.hansen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDQ6MDk6MDRQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAzOjMzOjAwUE0gLTA3MDAsIEFuZHJldyBNb3J0
b24gd3JvdGU6Cj4gPiBPbiBUaHUsIDggQXVnIDIwMTkgMTQ6MTI6MTkgLTA3MDAgS2VlcyBDb29r
IDxrZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gCj4gPiA+ID4gVGhlIG9uZXMgdGhh
dCBhcmUgbGVmdCBhcmUgdGhlIG1tIG9uZXM6IDQsIDUsIDYsIDcgYW5kIDguCj4gPiA+ID4gCj4g
PiA+ID4gQW5kcmV3LCBjb3VsZCB5b3UgdGFrZSBhIGxvb2sgYW5kIGdpdmUgeW91ciBBY2tlZC1i
eSBvciBwaWNrIHRoZW0gdXAgZGlyZWN0bHk/Cj4gPiA+IAo+ID4gPiBHaXZlbiB0aGUgc3Vic3lz
dGVtIEFja3MsIGl0IHNlZW1zIGxpa2UgMy0xMCBhbmQgMTIgY291bGQgYWxsIGp1c3QgZ28KPiA+
ID4gdmlhIEFuZHJldz8gSSBob3BlIGhlIGFncmVlcy4gOikKPiA+IAo+ID4gSSdsbCBncmFiIGV2
ZXJ5dGhpbmcgdGhhdCBoYXMgbm90IHlldCBhcHBlYXJlZCBpbiBsaW51eC1uZXh0LiAgSWYgbW9y
ZQo+ID4gb2YgdGhlc2UgcGF0Y2hlcyBhcHBlYXIgaW4gbGludXgtbmV4dCBJJ2xsIGRyb3AgdGhv
c2UgYXMgd2VsbC4KPiA+IAo+ID4gVGhlIHJldmlldyBkaXNjdXNzaW9uIGFnYWluc3QgIiBbUEFU
Q0ggdjE5IDAyLzE1XSBhcm02NDogSW50cm9kdWNlCj4gPiBwcmN0bCgpIG9wdGlvbnMgdG8gY29u
dHJvbCB0aGUgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIEFCSSIgaGFzIHBldGVyZWQKPiA+IG91dCBp
bmNvbmNsdXNpdmVseS4gIHByY3RsKCkgdnMgYXJjaF9wcmN0bCgpLgo+IAo+IEkndmUgYWx3YXlz
IGRpc2xpa2VkIGFyY2hfcHJjdGwoKSBleGlzdGluZyBhdCBhbGwuIEdpdmVuIHRoYXQgdGFnZ2lu
ZyBpcwo+IGxpa2VseSB0byBiZSBhIG11bHRpLWFyY2hpdGVjdHVyYWwgZmVhdHVyZSwgaXQgc2Vl
bXMgbGlrZSB0aGUgY29udHJvbHMKPiBzaG91bGQgbGl2ZSBpbiBwcmN0bCgpIHRvIG1lLgoKSXQg
dG9vayBhIGJpdCBvZiBncmVwJ2luZyB0byBmaWd1cmUgb3V0IHdoYXQgRGF2ZSBIIG1lYW50IGJ5
CmFyY2hfcHJjdGwoKS4gSXQncyBhbiB4ODYtc3BlY2lmaWMgc3lzY2FsbCB3aGljaCB3ZSBkbyBu
b3QgaGF2ZSBvbiBhcm02NAooYW5kIHBvc3NpYmx5IGFueSBvdGhlciBhcmNoaXRlY3R1cmUpLiBB
Y3R1YWxseSwgd2UgZG9uJ3QgaGF2ZSBhbnkgYXJtNjQKc3BlY2lmaWMgc3lzY2FsbHMsIG9ubHkg
dGhlIGdlbmVyaWMgdW5pc3RkLmgsIGhlbmNlIHRoZSBjb25mdXNpb24uIEZvcgpvdGhlciBhcm02
NC1zcGVjaWZpYyBwcmN0bHMgbGlrZSBTVkUgd2UgdXNlZCB0aGUgZ2VuZXJpYyBzeXNfcHJjdGwo
KSBhbmQKSSBjYW4gc2VlIHg4NiBub3QgYmVpbmcgY29uc2lzdGVudCBlaXRoZXIgKFBSX01QWF9F
TkFCTEVfTUFOQUdFTUVOVCkuCgpJbiBnZW5lcmFsIEkgZGlzYWdyZWUgd2l0aCBhZGRpbmcgYW55
IGFybTY0LXNwZWNpZmljIHN5c2NhbGxzIGJ1dCBpbgp0aGlzIGluc3RhbmNlIGl0IGNhbid0IGV2
ZW4gYmUganVzdGlmaWVkLiBJJ2QgcmF0aGVyIHNlZSBzb21lIGNsZWFuLXVwCnNpbWlsYXIgdG8g
YXJjaF9wdHJhY2UvcHRyYWNlX3JlcXVlc3QgdGhhbiBpbnRyb2R1Y2luZyBuZXcgc3lzY2FsbApu
dW1iZXJzIChidXQgYXMgSSBzdWdnZXN0ZWQgaW4gbXkgcmVwbHkgdG8gRGF2ZSwgdGhhdCdzIGZv
ciBhbm90aGVyCnBhdGNoIHNlcmllcykuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
