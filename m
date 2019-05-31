Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFB31298
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBBA893ED;
	Fri, 31 May 2019 16:41:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id D510E893CD;
 Fri, 31 May 2019 16:20:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E486341;
 Fri, 31 May 2019 09:20:03 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B67CE3F59C; Fri, 31 May 2019 09:19:57 -0700 (PDT)
Date: Fri, 31 May 2019 17:19:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190531161954.GA3568@arrakis.emea.arm.com>
References: <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190530171540.GD35418@arrakis.emea.arm.com>
 <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 31 May 2019 16:41:11 +0000
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDQ6Mjk6MTBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUaHUsIE1heSAzMCwgMjAxOSBhdCA3OjE1IFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMjgsIDIw
MTkgYXQgMDQ6MTQ6NDVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gVGhh
bmtzIGZvciBhIGxvdCBvZiB2YWx1YWJsZSBpbnB1dCEgSSd2ZSByZWFkIHRocm91Z2ggYWxsIHRo
ZSByZXBsaWVzCj4gPiA+IGFuZCBnb3Qgc29tZXdoYXQgbG9zdC4gV2hhdCBhcmUgdGhlIGNoYW5n
ZXMgSSBuZWVkIHRvIGRvIHRvIHRoaXMKPiA+ID4gc2VyaWVzPwo+ID4gPgo+ID4gPiAxLiBTaG91
bGQgSSBtb3ZlIHVudGFnZ2luZyBmb3IgbWVtb3J5IHN5c2NhbGxzIGJhY2sgdG8gdGhlIGdlbmVy
aWMKPiA+ID4gY29kZSBzbyBvdGhlciBhcmNoZXMgd291bGQgbWFrZSB1c2Ugb2YgaXQgYXMgd2Vs
bCwgb3Igc2hvdWxkIEkga2VlcAo+ID4gPiB0aGUgYXJtNjQgc3BlY2lmaWMgbWVtb3J5IHN5c2Nh
bGxzIHdyYXBwZXJzIGFuZCBhZGRyZXNzIHRoZSBjb21tZW50cwo+ID4gPiBvbiB0aGF0IHBhdGNo
Pwo+ID4KPiA+IEtlZXAgdGhlbSBnZW5lcmljIGFnYWluIGJ1dCBtYWtlIHN1cmUgd2UgZ2V0IGFn
cmVlbWVudCB3aXRoIEtoYWxpZCBvbgo+ID4gdGhlIGFjdHVhbCBBQkkgaW1wbGljYXRpb25zIGZv
ciBzcGFyYy4KPiAKPiBPSywgd2lsbCBkby4gSSBmaW5kIGl0IGhhcmQgdG8gdW5kZXJzdGFuZCB3
aGF0IHRoZSBBQkkgaW1wbGljYXRpb25zCj4gYXJlLiBJJ2xsIHBvc3QgdGhlIG5leHQgdmVyc2lv
biB3aXRob3V0IHVudGFnZ2luZyBpbiBicmssIG1tYXAsCj4gbXVubWFwLCBtcmVtYXAgKGZvciBu
ZXdfYWRkcmVzcyksIG1tYXBfcGdvZmYsIHJlbWFwX2ZpbGVfcGFnZXMsIHNobWF0Cj4gYW5kIHNo
bWR0LgoKSXQncyBtb3JlIGFib3V0IG5vdCByZWxheGluZyB0aGUgQUJJIHRvIGFjY2VwdCBub24t
emVybyB0b3AtYnl0ZSB1bmxlc3MKd2UgaGF2ZSBhIHVzZS1jYXNlIGZvciBpdC4gRm9yIG1tYXAo
KSBldGMuLCBJIGRvbid0IHRoaW5rIHRoYXQncyBuZWVkZWQKYnV0IGlmIHlvdSB0aGluayBvdGhl
cndpc2UsIHBsZWFzZSByYWlzZSBpdC4KCj4gPiA+IDIuIFNob3VsZCBJIG1ha2UgdW50YWdnaW5n
IG9wdC1pbiBhbmQgY29udHJvbGxlZCBieSBhIGNvbW1hbmQgbGluZSBhcmd1bWVudD8KPiA+Cj4g
PiBPcHQtaW4sIHllcywgYnV0IHBlciB0YXNrIHJhdGhlciB0aGFuIGtlcm5lbCBjb21tYW5kIGxp
bmUgb3B0aW9uLgo+ID4gcHJjdGwoKSBpcyBhIHBvc3NpYmlsaXR5IG9mIG9wdGluZyBpbi4KPiAK
PiBPSy4gU2hvdWxkIEkgc3RvcmUgYSBmbGFnIHNvbWV3aGVyZSBpbiB0YXNrX3N0cnVjdD8gU2hv
dWxkIGl0IGJlCj4gaW5oZXJpdGFibGUgb24gY2xvbmU/CgpBIFRJRiBmbGFnIHdvdWxkIGRvIGJ1
dCBJJ2Qgc2F5IGxlYXZlIGl0IG91dCBmb3Igbm93IChkZWZhdWx0IG9wdGVkIGluKQp1bnRpbCB3
ZSBmaWd1cmUgb3V0IHRoZSBiZXN0IHdheSB0byBkbyB0aGlzIChjYW4gYmUgYSBwYXRjaCBvbiB0
b3Agb2YKdGhpcyBzZXJpZXMpLgoKVGhhbmtzLgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
