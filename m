Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9F29A82
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBC86E110;
	Fri, 24 May 2019 15:01:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03A966E04B;
 Fri, 24 May 2019 10:11:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EB11A78;
 Fri, 24 May 2019 03:11:53 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85B933F703;
 Fri, 24 May 2019 03:11:47 -0700 (PDT)
Date: Fri, 24 May 2019 11:11:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190524101139.36yre4af22bkvatx@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
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
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDM6NDk6MDVQTSAtMDYwMCwgS2hhbGlkIEF6aXogd3Jv
dGU6Cj4gT24gNS8yMy8xOSAyOjExIFBNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiBPbiBU
aHUsIE1heSAyMywgMjAxOSBhdCAxMTo1MTo0MEFNIC0wNjAwLCBLaGFsaWQgQXppeiB3cm90ZToK
PiA+PiBPbiA1LzIxLzE5IDY6MDQgUE0sIEtlZXMgQ29vayB3cm90ZToKPiA+Pj4gQXMgYW4gYXNp
ZGU6IEkgdGhpbmsgU3BhcmMgQURJIHN1cHBvcnQgaW4gTGludXggYWN0dWFsbHkgc2lkZS1zdGVw
cGVkCj4gPj4+IHRoaXNbMV0gKGkuZS4gY2hvc2UgInNvbHV0aW9uIDEiKTogIkFsbCBhZGRyZXNz
ZXMgcGFzc2VkIHRvIGtlcm5lbCBtdXN0Cj4gPj4+IGJlIG5vbi1BREkgdGFnZ2VkIGFkZHJlc3Nl
cy4iIChBbmQgc2FkbHksICJLZXJuZWwgZG9lcyBub3QgZW5hYmxlIEFESQo+ID4+PiBmb3Iga2Vy
bmVsIGNvZGUuIikgSSB0aGluayB0aGlzIHdhcyBhIG1pc3Rha2Ugd2Ugc2hvdWxkIG5vdCByZXBl
YXQgZm9yCj4gPj4+IGFybTY0ICh3ZSBkbyBzZWVtIHRvIGJlIGF0IGxlYXN0IGluIGFncmVlbWVu
dCBhYm91dCB0aGlzLCBJIHRoaW5rKS4KPiA+Pj4KPiA+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3BhdGNod29yay9wYXRjaC82NTQ0ODEvCj4gPj4KPiA+PiBUaGF0IGlzIGEgdmVyeSBl
YXJseSB2ZXJzaW9uIG9mIHRoZSBzcGFyYyBBREkgcGF0Y2guIFN1cHBvcnQgZm9yIHRhZ2dlZAo+
ID4+IGFkZHJlc3NlcyBpbiBzeXNjYWxscyB3YXMgYWRkZWQgaW4gbGF0ZXIgdmVyc2lvbnMgYW5k
IGlzIGluIHRoZSBwYXRjaAo+ID4+IHRoYXQgaXMgaW4gdGhlIGtlcm5lbC4KPiA+IAo+ID4gSSB0
cmllZCB0byBmaWd1cmUgb3V0IGJ1dCBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIHNwYXJjIHBv
cnQuIEhvdyBkaWQKPiA+IHlvdSBzb2x2ZSB0aGUgdGFnZ2VkIGFkZHJlc3MgZ29pbmcgaW50byB2
YXJpb3VzIHN5c2NhbGwgaW1wbGVtZW50YXRpb25zCj4gPiBpbiB0aGUga2VybmVsIChlLmcuIHN5
c193cml0ZSk/IElzIHRoZSB0YWcgcmVtb3ZlZCBvbiBrZXJuZWwgZW50cnkgb3IgaXQKPiA+IGVu
ZHMgdXAgZGVlcGVyIGluIHRoZSBjb3JlIGNvZGU/Cj4gCj4gQW5vdGhlciBzcG90IEkgc2hvdWxk
IHBvaW50IG91dCBpbiBBREkgcGF0Y2ggLSBUYWdzIGFyZSBub3Qgc3RvcmVkIGluCj4gVk1BcyBh
bmQgSU9NTVUgZG9lcyBub3Qgc3VwcG9ydCBBREkgdGFncyBvbiBNNy4gQURJIHRhZ3MgYXJlIHN0
cmlwcGVkCj4gYmVmb3JlIHVzZXJzcGFjZSBhZGRyZXNzZXMgYXJlIHBhc3NlZCB0byBJT01NVSBp
biB0aGUgZm9sbG93aW5nIHNuaXBwZXQKPiBmcm9tIHRoZSBwYXRjaDoKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9zcGFyYy9tbS9ndXAuYyBiL2FyY2gvc3BhcmMvbW0vZ3VwLmMKPiBpbmRleCA1MzM1
YmEzYzg1MGUuLjM1N2I2MDQ3NjUzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3NwYXJjL21tL2d1cC5j
Cj4gKysrIGIvYXJjaC9zcGFyYy9tbS9ndXAuYwo+IEBAIC0yMDEsNiArMjAyLDI0IEBAIGludCBf
X2dldF91c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFydCwgaW50Cj4gbnJfcGFnZXMK
PiAsIGludCB3cml0ZSwKPiAgICAgICAgIHBnZF90ICpwZ2RwOwo+ICAgICAgICAgaW50IG5yID0g
MDsKPiAKPiArI2lmZGVmIENPTkZJR19TUEFSQzY0Cj4gKyAgICAgICBpZiAoYWRpX2NhcGFibGUo
KSkgewo+ICsgICAgICAgICAgICAgICBsb25nIGFkZHIgPSBzdGFydDsKPiArCj4gKyAgICAgICAg
ICAgICAgIC8qIElmIHVzZXJzcGFjZSBoYXMgcGFzc2VkIGEgdmVyc2lvbmVkIGFkZHJlc3MsIGtl
cm5lbAo+ICsgICAgICAgICAgICAgICAgKiB3aWxsIG5vdCBmaW5kIGl0IGluIHRoZSBWTUFzIHNp
bmNlIGl0IGRvZXMgbm90IHN0b3JlCj4gKyAgICAgICAgICAgICAgICAqIHRoZSB2ZXJzaW9uIHRh
Z3MgaW4gdGhlIGxpc3Qgb2YgVk1Bcy4gU3RvcmluZyB2ZXJzaW9uCj4gKyAgICAgICAgICAgICAg
ICAqIHRhZ3MgaW4gbGlzdCBvZiBWTUFzIGlzIGltcHJhY3RpY2FsIHNpbmNlIHRoZXkgY2FuIGJl
Cj4gKyAgICAgICAgICAgICAgICAqIGNoYW5nZWQgYW55IHRpbWUgZnJvbSB1c2Vyc3BhY2Ugd2l0
aG91dCBkcm9wcGluZyBpbnRvCj4gKyAgICAgICAgICAgICAgICAqIGtlcm5lbC4gQW55IGFkZHJl
c3Mgc2VhcmNoIGluIFZNQXMgd2lsbCBiZSBkb25lIHdpdGgKPiArICAgICAgICAgICAgICAgICog
bm9uLXZlcnNpb25lZCBhZGRyZXNzZXMuIEVuc3VyZSB0aGUgQURJIHZlcnNpb24gYml0cwo+ICsg
ICAgICAgICAgICAgICAgKiBhcmUgZHJvcHBlZCBoZXJlIGJ5IHNpZ24gZXh0ZW5kaW5nIHRoZSBs
YXN0IGJpdCBiZWZvcmUKPiArICAgICAgICAgICAgICAgICogQURJIGJpdHMuIElPTU1VIGRvZXMg
bm90IGltcGxlbWVudCB2ZXJzaW9uIHRhZ3MuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAg
ICAgICAgICAgICBhZGRyID0gKGFkZHIgPDwgKGxvbmcpYWRpX25iaXRzKCkpID4+IChsb25nKWFk
aV9uYml0cygpOwo+ICsgICAgICAgICAgICAgICBzdGFydCA9IGFkZHI7Cj4gKyAgICAgICB9Cj4g
KyNlbmRpZgo+ICAgICAgICAgc3RhcnQgJj0gUEFHRV9NQVNLOwo+ICAgICAgICAgYWRkciA9IHN0
YXJ0Owo+ICAgICAgICAgbGVuID0gKHVuc2lnbmVkIGxvbmcpIG5yX3BhZ2VzIDw8IFBBR0VfU0hJ
RlQ7CgpUaGFua3MgS2hhbGlkLiBJIG1pc3NlZCB0aGF0IHNwYXJjIGRvZXMgbm90IGVuYWJsZSBI
QVZFX0dFTkVSSUNfR1VQLCBzbwp5b3UgZml4IHRoaXMgY2FzZSBoZXJlLiBJZiB3ZSBhZGQgdGhl
IGdlbmVyaWMgdW50YWdnZWRfYWRkcigpIG1hY3JvIGluCnRoZSBnZW5lcmljIGNvZGUsIEkgdGhp
bmsgc3BhcmMgY2FuIHN0YXJ0IG1ha2luZyB1c2Ugb2YgaXQgcmF0aGVyIHRoYW4Kb3Blbi1jb2Rp
bmcgdGhlIHNoaWZ0cy4KClRoZXJlIGFyZSBhIGZldyBvdGhlciBvdGhlciBwbGFjZXMgd2hlcmUg
dGFncyBjYW4gbGVhayBhbmQgdGhlIGNvcmUgY29kZQp3b3VsZCBnZXQgY29uZnVzZWQgKGZvciBl
eGFtcGxlLCBtYWR2aXNlKCkpLiBJIHByZXN1bWUgeW91ciB1c2VyIHNwYWNlCmRvZXNuJ3QgZXhl
cmNpc2UgdGhlbS4gT24gYXJtNjQgd2UgcGxhbiB0byBqdXN0IGFsbG93IHRoZSBDIGxpYnJhcnkg
dG8KdGFnIGFueSBuZXcgbWVtb3J5IGFsbG9jYXRpb24sIHNvIHRob3NlIGNvcmUgY29kZSBwYXRo
cyB3b3VsZCBuZWVkIHRvIGJlCmNvdmVyZWQuCgpBbmQgc2ltaWxhcmx5LCBkZXZpY2VzLCBJT01N
VSwgYW55IERNQSB3b3VsZCBpZ25vcmUgdGFncy4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
