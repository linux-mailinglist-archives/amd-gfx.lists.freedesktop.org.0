Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CA1281F2
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 17:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD30D6E02E;
	Thu, 23 May 2019 15:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9957B89C98;
 Thu, 23 May 2019 09:04:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409B2341;
 Thu, 23 May 2019 02:04:36 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 A78AC3F575; Thu, 23 May 2019 02:04:30 -0700 (PDT)
Date: Thu, 23 May 2019 10:04:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Evgenii Stepanov <eugenis@google.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190523090427.GA44383@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190522114910.emlckebwzv2qz42i@mbp>
 <CAFKCwrjyP+x0JJy=qpBFsp4pub3He6UkvU0qnf1UOKt6W1LPRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFKCwrjyP+x0JJy=qpBFsp4pub3He6UkvU0qnf1UOKt6W1LPRQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDI6MTY6NTdQTSAtMDcwMCwgRXZnZW5paSBTdGVwYW5v
diB3cm90ZToKPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCA0OjQ5IEFNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMDYsIDIw
MTkgYXQgMDY6MzA6NTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gVGhp
cyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5lbCBB
QkkgdG8gYWxsb3cgdG8KPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUg
dG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiA+IHRoYW4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBw
b2ludGVycyB0byBiZSBwYXNzZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+ID4gc3lzY2Fs
bHM6IGJyaywgZ2V0X21lbXBvbGljeSwgbWFkdmlzZSwgbWJpbmQsIG1pbmNvcmUsIG1sb2NrLCBt
bG9jazIsCj4gPiA+IG1tYXAsIG1tYXBfcGdvZmYsIG1wcm90ZWN0LCBtcmVtYXAsIG1zeW5jLCBt
dW5sb2NrLCBtdW5tYXAsCj4gPiA+IHJlbWFwX2ZpbGVfcGFnZXMsIHNobWF0IGFuZCBzaG1kdC4K
PiA+ID4KPiA+ID4gVGhpcyBpcyBkb25lIGJ5IHVudGFnZ2luZyBwb2ludGVycyBwYXNzZWQgdG8g
dGhlc2Ugc3lzY2FsbHMgaW4gdGhlCj4gPiA+IHByb2xvZ3VlcyBvZiB0aGVpciBoYW5kbGVycy4K
PiA+Cj4gPiBJJ2xsIGdvIHRocm91Z2ggdGhlbSBvbmUgYnkgb25lIHRvIHNlZSBpZiB3ZSBjYW4g
dGlnaHRlbiB0aGUgZXhwZWN0ZWQKPiA+IEFCSSB3aGlsZSBoYXZpbmcgdGhlIE1URSBpbiBtaW5k
Lgo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3N5cy5jIGIvYXJjaC9h
cm02NC9rZXJuZWwvc3lzLmMKPiA+ID4gaW5kZXggYjQ0MDY1ZmIxNjE2Li45MzNiYjlmM2Q2ZWMg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3N5cy5jCj4gPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQva2VybmVsL3N5cy5jCj4gPiA+IEBAIC0zNSwxMCArMzUsMzMgQEAgU1lTQ0FMTF9E
RUZJTkU2KG1tYXAsIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHVuc2lnbmVkIGxvbmcsIGxlbiwKPiA+
ID4gIHsKPiA+ID4gICAgICAgaWYgKG9mZnNldF9pbl9wYWdlKG9mZikgIT0gMCkKPiA+ID4gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gLQo+ID4gPiArICAgICBhZGRyID0gdW50
YWdnZWRfYWRkcihhZGRyKTsKPiA+ID4gICAgICAgcmV0dXJuIGtzeXNfbW1hcF9wZ29mZihhZGRy
LCBsZW4sIHByb3QsIGZsYWdzLCBmZCwgb2ZmID4+IFBBR0VfU0hJRlQpOwo+ID4gPiAgfQo+ID4K
PiA+IElmIHVzZXIgcGFzc2VzIGEgdGFnZ2VkIHBvaW50ZXIgdG8gbW1hcCgpIGFuZCB0aGUgYWRk
cmVzcyBpcyBob25vdXJlZAo+ID4gKG9yIE1BUF9GSVhFRCBpcyBnaXZlbiksIHdoYXQgaXMgdGhl
IGV4cGVjdGVkIHJldHVybiBwb2ludGVyPyBEb2VzIGl0Cj4gPiBuZWVkIHRvIGJlIHRhZ2dlZCB3
aXRoIHRoZSB2YWx1ZSBmcm9tIHRoZSBoaW50Pwo+IAo+IEZvciBIV0FTYW4gdGhlIG1vc3QgY29u
dmVuaWVudCB3b3VsZCBiZSB0byB1c2UgdGhlIHRhZyBmcm9tIHRoZSBoaW50Lgo+IEJ1dCBzaW5j
ZSBpbiB0aGUgVEJJIChub3QgTVRFKSBtb2RlIHRoZSBrZXJuZWwgaGFzIG5vIGlkZWEgd2hhdAo+
IG1lYW5pbmcgdXNlcnNwYWNlIGFzc2lnbnMgdG8gcG9pbnRlciB0YWdzLCBwZXJoYXBzIGl0IHNo
b3VsZCBub3QgdHJ5Cj4gdG8gZ3Vlc3MsIGFuZCBzaG91bGQgcmV0dXJuIHJhdyAoemVyby10YWdn
ZWQpIGFkZHJlc3MgaW5zdGVhZC4KClRoZW4sIGp1c3QgdG8gcmVsYXggdGhlIEFCSSBmb3IgaHdh
c2FuLCBzaGFsbCB3ZSBzaW1wbHkgZGlzYWxsb3cgdGFnZ2VkCnBvaW50ZXJzIG9uIG1tYXAoKSBh
cmd1bWVudHM/IFdlIGNhbiBsZWF2ZSB0aGVtIGluIGZvcgptcmVtYXAob2xkX2FkZHJlc3MpLCBt
YWR2aXNlKCkuCgo+ID4gV2l0aCBNVEUsIHdlIG1heSB3YW50IHRvIHVzZSB0aGlzIGFzIGEgcmVx
dWVzdCBmb3IgdGhlIGRlZmF1bHQgY29sb3VyIG9mCj4gPiB0aGUgbWFwcGVkIHBhZ2VzIChzdGls
bCB1bmRlciBkaXNjdXNzaW9uKS4KPiAKPiBJIGxpa2UgdGhpcyAtIGFuZCBpbiB0aGF0IGNhc2Ug
aXQgd291bGQgbWFrZSBzZW5zZSB0byByZXR1cm4gdGhlCj4gcG9pbnRlciB0aGF0IGNhbiBiZSBp
bW1lZGlhdGVseSBkZXJlZmVyZW5jZWQgd2l0aG91dCBjcmFzaGluZyB0aGUKPiBwcm9jZXNzLCBp
LmUuIHdpdGggdGhlIG1hdGNoaW5nIHRhZy4KClRoaXMgY2FtZSB1cCBmcm9tIHRoZSBBbmRyb2lk
IGludmVzdGlnYXRpb24gd29yayB3aGVyZSBsYXJnZSBtZW1vcnkKYWxsb2NhdGlvbnMgKHVzaW5n
IG1tYXApIGNvdWxkIGJlIG1vcmUgZWZmaWNpZW50bHkgcHJlLXRhZ2dlZCBieSB0aGUKa2VybmVs
IG9uIHBhZ2UgZmF1bHQuIE5vdCBzdXJlIGFib3V0IHRoZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxz
IHlldC4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
