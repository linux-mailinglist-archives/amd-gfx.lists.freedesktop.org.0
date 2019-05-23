Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9350281ED
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 17:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE8B89FC0;
	Thu, 23 May 2019 15:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 271D689CA8;
 Thu, 23 May 2019 07:34:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF17480D;
 Thu, 23 May 2019 00:34:34 -0700 (PDT)
Received: from MBP.local (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89C463F575;
 Thu, 23 May 2019 00:34:28 -0700 (PDT)
Date: Thu, 23 May 2019 08:34:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: enh <enh@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523073425.GA43379@MBP.local>
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <CAFKCwrjOjdJAbcABp3qxwyYy+hgfyQirvmqGkDSJVJe5pSz0Uw@mail.gmail.com>
 <CAJgzZorUPzrXu0ysDdKwnqdvgWZJ9tqRjF-9_5CU_UV+c0bRCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJgzZorUPzrXu0ysDdKwnqdvgWZJ9tqRjF-9_5CU_UV+c0bRCA@mail.gmail.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
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
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDQ6MDk6MzFQTSAtMDcwMCwgZW5oIHdyb3RlOgo+IE9u
IFdlZCwgTWF5IDIyLCAyMDE5IGF0IDQ6MDMgUE0gRXZnZW5paSBTdGVwYW5vdiA8ZXVnZW5pc0Bn
b29nbGUuY29tPiB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDE6NDcgUE0gS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1heSAy
MiwgMjAxOSBhdCAwNTozNToyN1BNICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+
ID4gSSB3b3VsZCBhbHNvIGV4cGVjdCB0aGUgQyBsaWJyYXJ5IG9yIGR5bmFtaWMgbG9hZGVyIHRv
IGNoZWNrIGZvciB0aGUKPiA+ID4gPiBwcmVzZW5jZSBvZiBhIEhXQ0FQX01URSBiaXQgYmVmb3Jl
IHN0YXJ0aW5nIHRvIHRhZyBtZW1vcnkgYWxsb2NhdGlvbnMsCj4gPiA+ID4gb3RoZXJ3aXNlIGl0
IHdvdWxkIGdldCBTSUdJTEwgb24gdGhlIGZpcnN0IE1URSBpbnN0cnVjdGlvbiBpdCB0cmllcyB0
bwo+ID4gPiA+IGV4ZWN1dGUuCj4gPiA+Cj4gPiA+IEkndmUgZ290IHRoZSBzYW1lIHF1ZXN0aW9u
IGFzIEVsbGlvdDogYXJlbid0IE1URSBpbnN0cnVjdGlvbnMganVzdCBOT1AKPiA+ID4gdG8gb2xk
ZXIgQ1BVcz8gSS5lLiBpZiB0aGUgQ1BVIChvciBrZXJuZWwpIGRvbid0IHN1cHBvcnQgaXQsIGl0
IGp1c3QKPiA+ID4gZ2V0cyBlbnRpcmVseSBpZ25vcmVkOiBjaGVja2luZyBpcyBvbmx5IG5lZWRl
ZCB0byBzYXRpc2Z5IGN1cmlvc2l0eQo+ID4gPiBvciBiZWhhdmlvcmFsIGV4cGVjdGF0aW9ucy4K
PiA+Cj4gPiBNVEUgaW5zdHJ1Y3Rpb25zIGFyZSBub3QgTk9QLiBNb3N0IG9mIHRoZW0gaGF2ZSBz
aWRlIGVmZmVjdHMgKGNoYW5naW5nCj4gPiByZWdpc3RlciB2YWx1ZXMsIHplcm9pbmcgbWVtb3J5
KS4KPiAKPiBubywgaSBtZWFudCAidGhleSdyZSBlbmNvZGVkIGluIGEgc3BhY2UgdGhhdCB3YXMg
cHJldmlvdXNseSBuby1vcHMsIHNvCj4gcnVubmluZyBvbiBNVEUgY29kZSBvbiBvbGQgaGFyZHdh
cmUgZG9lc24ndCBjYXVzZSBTSUdJTEwiLgoKSXQgZG9lcyByZXN1bHQgaW4gU0lHSUxMLCB0aGVy
ZSB3YXNuJ3QgZW5vdWdoIGVuY29kaW5nIGxlZnQgaW4gdGhlIE5PUApzcGFjZSBmb3Igb2xkL2N1
cnJlbnQgQ1BVIGltcGxlbWVudGF0aW9ucyAoaW4gaGluZHNpZ2h0LCB3ZSBzaG91bGQgaGF2ZQpy
ZXNlcnZlZCBhIGJpZ2dlciBOT1Agc3BhY2UpLgoKQXMgRXZnZW5paSBzYWlkLCB0aGUgbGliYyBu
ZWVkcyB0byBiZSBjYXJlZnVsIHdoZW4gdGFnZ2luZyB0aGUgaGVhcCBhcwppdCB3b3VsZCBjYXVz
ZSBhIFNJR0lMTCBpZiB0aGUgSFdDQVBfTVRFIGlzIG5vdCBzZXQuIFRoZSBzdGFuZGFyZAphcHBs
aWNhdGlvbiBkb2Vzbid0IG5lZWQgdG8gYmUgcmVjb21waWxlZCBhcyBpdCB3b3VsZCBub3QgaXNz
dWUgTVRFCmNvbG91cmluZyBpbnN0cnVjdGlvbnMsIGp1c3Qgc3RhbmRhcmQgTERSL1NUUi4KClN0
YWNrIHRhZ2dpbmcgaXMgcHJvYmxlbWF0aWMgaWYgeW91IHdhbnQgdG8gY29sb3VyIGVhY2ggZnJh
bWUKaW5kaXZpZHVhbGx5LCB0aGUgZnVuY3Rpb24gcHJvbG9ndWUgd291bGQgbmVlZCB0aGUgbm9u
LU5PUCBNVEUKaW5zdHJ1Y3Rpb25zLiBUaGUgYmVzdCB3ZSBjYW4gZG8gaGVyZSBpcyBqdXN0IGhh
dmluZyB0aGUgKHRocmVhZCkgc3RhY2tzCm9mIGRpZmZlcmVudCBjb2xvdXJzLgoKLS0gCkNhdGFs
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
