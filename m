Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AF31621
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 22:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6FF899A5;
	Fri, 31 May 2019 20:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AA3089708;
 Fri, 31 May 2019 16:46:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DFE0A78;
 Fri, 31 May 2019 09:46:14 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 48A043F59C; Fri, 31 May 2019 09:46:08 -0700 (PDT)
Date: Fri, 31 May 2019 17:46:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190531164605.GC3568@arrakis.emea.arm.com>
References: <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190530171540.GD35418@arrakis.emea.arm.com>
 <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
 <20190531161954.GA3568@arrakis.emea.arm.com>
 <CAAeHK+zRDD7ZPPUA9cpwHOdgTRrJLWAby8Wg9oPgmhqMpHwvFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+zRDD7ZPPUA9cpwHOdgTRrJLWAby8Wg9oPgmhqMpHwvFw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 31 May 2019 20:29:40 +0000
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

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDY6MjQ6MDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBGcmksIE1heSAzMSwgMjAxOSBhdCA2OjIwIFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMzEsIDIw
MTkgYXQgMDQ6Mjk6MTBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gT24g
VGh1LCBNYXkgMzAsIDIwMTkgYXQgNzoxNSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDox
NDo0NVBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+ID4gVGhhbmtzIGZv
ciBhIGxvdCBvZiB2YWx1YWJsZSBpbnB1dCEgSSd2ZSByZWFkIHRocm91Z2ggYWxsIHRoZSByZXBs
aWVzCj4gPiA+ID4gPiBhbmQgZ290IHNvbWV3aGF0IGxvc3QuIFdoYXQgYXJlIHRoZSBjaGFuZ2Vz
IEkgbmVlZCB0byBkbyB0byB0aGlzCj4gPiA+ID4gPiBzZXJpZXM/Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gMS4gU2hvdWxkIEkgbW92ZSB1bnRhZ2dpbmcgZm9yIG1lbW9yeSBzeXNjYWxscyBiYWNrIHRv
IHRoZSBnZW5lcmljCj4gPiA+ID4gPiBjb2RlIHNvIG90aGVyIGFyY2hlcyB3b3VsZCBtYWtlIHVz
ZSBvZiBpdCBhcyB3ZWxsLCBvciBzaG91bGQgSSBrZWVwCj4gPiA+ID4gPiB0aGUgYXJtNjQgc3Bl
Y2lmaWMgbWVtb3J5IHN5c2NhbGxzIHdyYXBwZXJzIGFuZCBhZGRyZXNzIHRoZSBjb21tZW50cwo+
ID4gPiA+ID4gb24gdGhhdCBwYXRjaD8KPiA+ID4gPgo+ID4gPiA+IEtlZXAgdGhlbSBnZW5lcmlj
IGFnYWluIGJ1dCBtYWtlIHN1cmUgd2UgZ2V0IGFncmVlbWVudCB3aXRoIEtoYWxpZCBvbgo+ID4g
PiA+IHRoZSBhY3R1YWwgQUJJIGltcGxpY2F0aW9ucyBmb3Igc3BhcmMuCj4gPiA+Cj4gPiA+IE9L
LCB3aWxsIGRvLiBJIGZpbmQgaXQgaGFyZCB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIEFCSSBpbXBs
aWNhdGlvbnMKPiA+ID4gYXJlLiBJJ2xsIHBvc3QgdGhlIG5leHQgdmVyc2lvbiB3aXRob3V0IHVu
dGFnZ2luZyBpbiBicmssIG1tYXAsCj4gPiA+IG11bm1hcCwgbXJlbWFwIChmb3IgbmV3X2FkZHJl
c3MpLCBtbWFwX3Bnb2ZmLCByZW1hcF9maWxlX3BhZ2VzLCBzaG1hdAo+ID4gPiBhbmQgc2htZHQu
Cj4gPgo+ID4gSXQncyBtb3JlIGFib3V0IG5vdCByZWxheGluZyB0aGUgQUJJIHRvIGFjY2VwdCBu
b24temVybyB0b3AtYnl0ZSB1bmxlc3MKPiA+IHdlIGhhdmUgYSB1c2UtY2FzZSBmb3IgaXQuIEZv
ciBtbWFwKCkgZXRjLiwgSSBkb24ndCB0aGluayB0aGF0J3MgbmVlZGVkCj4gPiBidXQgaWYgeW91
IHRoaW5rIG90aGVyd2lzZSwgcGxlYXNlIHJhaXNlIGl0Lgo+ID4KPiA+ID4gPiA+IDIuIFNob3Vs
ZCBJIG1ha2UgdW50YWdnaW5nIG9wdC1pbiBhbmQgY29udHJvbGxlZCBieSBhIGNvbW1hbmQgbGlu
ZSBhcmd1bWVudD8KPiA+ID4gPgo+ID4gPiA+IE9wdC1pbiwgeWVzLCBidXQgcGVyIHRhc2sgcmF0
aGVyIHRoYW4ga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb24uCj4gPiA+ID4gcHJjdGwoKSBpcyBh
IHBvc3NpYmlsaXR5IG9mIG9wdGluZyBpbi4KPiA+ID4KPiA+ID4gT0suIFNob3VsZCBJIHN0b3Jl
IGEgZmxhZyBzb21ld2hlcmUgaW4gdGFza19zdHJ1Y3Q/IFNob3VsZCBpdCBiZQo+ID4gPiBpbmhl
cml0YWJsZSBvbiBjbG9uZT8KPiA+Cj4gPiBBIFRJRiBmbGFnIHdvdWxkIGRvIGJ1dCBJJ2Qgc2F5
IGxlYXZlIGl0IG91dCBmb3Igbm93IChkZWZhdWx0IG9wdGVkIGluKQo+ID4gdW50aWwgd2UgZmln
dXJlIG91dCB0aGUgYmVzdCB3YXkgdG8gZG8gdGhpcyAoY2FuIGJlIGEgcGF0Y2ggb24gdG9wIG9m
Cj4gPiB0aGlzIHNlcmllcykuCj4gCj4gWW91IG1lYW4gbGVhdmUgdGhlIHdob2xlIG9wdC1pbi9w
cmN0bCBwYXJ0IG91dD8gU28gdGhlIG9ubHkgY2hhbmdlCj4gd291bGQgYmUgdG8gbW92ZSB1bnRh
Z2dpbmcgZm9yIG1lbW9yeSBzeXNjYWxscyBpbnRvIGdlbmVyaWMgY29kZT8KClllcyAob3IganVz
dCB3YWl0IHVudGlsIG5leHQgd2VlayB0byBzZWUgaWYgdGhlIGRpc2N1c3Npb24gc2V0dGxlcwpk
b3duKS4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
