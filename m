Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515892DE6E
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFDE6E31C;
	Wed, 29 May 2019 13:37:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id F094C6E0F1;
 Wed, 29 May 2019 12:12:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDBEE80D;
 Wed, 29 May 2019 05:12:34 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9733C3F59C;
 Wed, 29 May 2019 05:12:28 -0700 (PDT)
Date: Wed, 29 May 2019 13:12:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190529121225.q2zjgurxqnohvmkg@mbp>
References: <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190529061126.GA18124@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529061126.GA18124@infradead.org>
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTE6MTE6MjZQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6MTQ6NDVQTSArMDIwMCwgQW5k
cmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IFRoYW5rcyBmb3IgYSBsb3Qgb2YgdmFsdWFibGUgaW5w
dXQhIEkndmUgcmVhZCB0aHJvdWdoIGFsbCB0aGUgcmVwbGllcwo+ID4gYW5kIGdvdCBzb21ld2hh
dCBsb3N0LiBXaGF0IGFyZSB0aGUgY2hhbmdlcyBJIG5lZWQgdG8gZG8gdG8gdGhpcwo+ID4gc2Vy
aWVzPwo+ID4gCj4gPiAxLiBTaG91bGQgSSBtb3ZlIHVudGFnZ2luZyBmb3IgbWVtb3J5IHN5c2Nh
bGxzIGJhY2sgdG8gdGhlIGdlbmVyaWMKPiA+IGNvZGUgc28gb3RoZXIgYXJjaGVzIHdvdWxkIG1h
a2UgdXNlIG9mIGl0IGFzIHdlbGwsIG9yIHNob3VsZCBJIGtlZXAKPiA+IHRoZSBhcm02NCBzcGVj
aWZpYyBtZW1vcnkgc3lzY2FsbHMgd3JhcHBlcnMgYW5kIGFkZHJlc3MgdGhlIGNvbW1lbnRzCj4g
PiBvbiB0aGF0IHBhdGNoPwo+IAo+IEl0IGFic29sdXRlbHkgbmVlZHMgdG8gbW92ZSB0byBjb21t
b24gY29kZS4gIEhhdmluZyBhcmNoIGNvZGUgbGVhZHMKPiB0byBwb2ludGxlc3MgKG9mdGVuIHVu
aW50ZW50aW9uYWwpIHNlbWFudGljIGRpZmZlcmVuY2UgYmV0d2Vlbgo+IGFyY2hpdGVjdHVyZXMs
IGFuZCBsb3RzIG9mIGJvaWxlcnBsYXRlIGNvZGUuCgpUaGF0J3MgZmluZSBieSBtZSBhcyBsb25n
IGFzIHdlIGFncmVlIG9uIHRoZSBzZW1hbnRpY3MgKHdoaWNoIHNob3VsZG4ndApiZSBoYXJkOyBL
aGFsaWQgYWxyZWFkeSBmb2xsb3dpbmcgdXApLiBXZSBzaG91bGQgcHJvYmFibHkgYWxzbyBtb3Zl
IHRoZQpwcm9wb3NlZCBBQkkgZG9jdW1lbnQgWzFdIGludG8gYSBjb21tb24gcGxhY2UgKG9yIHBh
cnQgb2Ygc2luY2Ugd2UnbGwKaGF2ZSBhcm02NC1zcGVjaWZpY3MgbGlrZSBwcmN0bCgpIGNhbGxz
IHRvIGV4cGxpY2l0bHkgb3B0IGluIHRvIG1lbW9yeQp0YWdnaW5nKS4KClsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMTkwMzE4MTYzNTMzLjI2ODM4LTEtdmluY2Vuem8uZnJhc2Np
bm9AYXJtLmNvbS9ULyN1CgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
