Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E512334927
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F09289893;
	Tue,  4 Jun 2019 13:42:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214A189819
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:09:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i189so661720pfg.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 06:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBLpk28DZpa5o94Q/0/LiLBGCkVoEs9cAD1KugSM2WY=;
 b=p85Lnta6VAzwu8uiYV+E5kfgWKOmRzJBZtum8vBa5l3h6Y4mqL0J7ap1M8oK9BCG8N
 rVUcqrjniy+eax8f+J/++tkdZYIIkcdmGIwajxwKf/G/8fZr1V/3CR42VyqNqWUHb0Fu
 lDqlvF5WNfbpZbulGPXie/uWT1DFKGc3SxuUYPKBGelQJzyGJ5mdrxBp2cOXegWk+43u
 UTuvxdRt+z/LF4JNPXMhocBUhckuugRJhXY46Or2f6FUY6s7yTtGHX0FurLJgkaHkacG
 4FDQuY3aew2IBjxyLU8Lt0GmBe9ys9ZLYIz2OelbVUJhaonUj2DX/wQ1xG1JV16E8dGD
 MxTA==
X-Gm-Message-State: APjAAAUTjaCUbbiGHr9Mq5YzorlXYG1Uv9hOuuJB0WbpVFv20WHry5L3
 RCnIQWELCnf0m9RilfX10pGslS93YFoAjrDq68+1fw==
X-Google-Smtp-Source: APXvYqwE+yY3fi9MHe5pAmjH6ujV7dnKQuJJ2mvTpcdW82/qczftH0mUauffZu6ryTn350uiR7ngmmR4ga1rtqlB5p8=
X-Received: by 2002:aa7:8491:: with SMTP id u17mr25575697pfn.93.1559653777333; 
 Tue, 04 Jun 2019 06:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
 <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
 <20190604130207.GD15385@ziepe.ca>
In-Reply-To: <20190604130207.GD15385@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 4 Jun 2019 15:09:26 +0200
Message-ID: <CAAeHK+xBxDB-OBuzPDcNaTHCNJqu6djHwqoVGSYpxG33w-YR9g@mail.gmail.com>
Subject: Re: [PATCH v16 12/16] IB,
 arm64: untag user pointers in ib_uverbs_(re)reg_mr()
To: Jason Gunthorpe <jgg@ziepe.ca>, Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zBLpk28DZpa5o94Q/0/LiLBGCkVoEs9cAD1KugSM2WY=;
 b=Lkz8dpKPRyddE/5l1SxtFW2tJDVJSIsNFYCOD1eigwQMuFNNmYLAz8pfUb/eNChwZF
 OH2h9RaIuTJvzD4zfwI4In+YKCusdO0C+/wNdpvUvPZXC2iOOrHIqrrS+koi+fxYqD+r
 iK2Zgy43Tahmq3qaqGtP4n+xMyhj8Yk3JvazolAsNKLfjKj1GXO3dAAQy063Hi2tMAsN
 GhJY2yKC3BApNCj1AkvEe/6mz6FyJyIhhdR95z/RQ7El5pARzqaaKppkgNvLbKRJzKwz
 N+Va7sAICkGdL463idSaVxKwCH7V2NZvNaXeQHS+go3oLu7b/Bj32cawMXuwRC+DSWx3
 9rBw==
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAzOjAyIFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBl
LmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDAyOjQ1OjMyUE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDI6Mjcg
UE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBU
dWUsIEp1biAwNCwgMjAxOSBhdCAwMjoxODoxOVBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdy
b3RlOgo+ID4gPiA+IE9uIE1vbiwgSnVuIDMsIDIwMTkgYXQgNzo0NiBQTSBKYXNvbiBHdW50aG9y
cGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBKdW4g
MDMsIDIwMTkgYXQgMDY6NTU6MTRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+
ID4gPiA+ID4gVGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFy
bTY0IGtlcm5lbCBBQkkgdG8gYWxsb3cgdG8KPiA+ID4gPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBw
b2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4g
PiA+ID4gPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IGliX3V2ZXJic18ocmUpcmVnX21yKCkgdXNlIHByb3ZpZGVkIHVzZXIgcG9pbnRl
cnMgZm9yIHZtYSBsb29rdXBzICh0aHJvdWdoCj4gPiA+ID4gPiA+IGUuZy4gbWx4NF9nZXRfdW1l
bV9tcigpKSwgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoZXNlIGZ1bmN0
aW9ucy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92
YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gPiA+ID4gPiAgZHJpdmVycy9pbmZpbmli
YW5kL2NvcmUvdXZlcmJzX2NtZC5jIHwgNCArKysrCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2luZmluaWJhbmQvY29yZS91dmVyYnNfY21kLmMgYi9kcml2ZXJzL2luZmluaWJhbmQv
Y29yZS91dmVyYnNfY21kLmMKPiA+ID4gPiA+ID4gaW5kZXggNWEzYTE3ODBjZWVhLi5mODhlZTcz
M2U2MTcgMTAwNjQ0Cj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2
ZXJic19jbWQuYwo+ID4gPiA+ID4gPiBAQCAtNzA5LDYgKzcwOSw4IEBAIHN0YXRpYyBpbnQgaWJf
dXZlcmJzX3JlZ19tcihzdHJ1Y3QgdXZlcmJzX2F0dHJfYnVuZGxlICphdHRycykKPiA+ID4gPiA+
ID4gICAgICAgaWYgKHJldCkKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiArICAgICBjbWQuc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKGNt
ZC5zdGFydCk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gICAgICAgaWYgKChjbWQuc3RhcnQg
JiB+UEFHRV9NQVNLKSAhPSAoY21kLmhjYV92YSAmIH5QQUdFX01BU0spKQo+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgZmVlbCBs
aWtlIHdlIHNob3VsZG4ndCB0aGF2ZSB0byBkbyB0aGlzIGhlcmUsIHN1cmVseSB0aGUgY21kLnN0
YXJ0Cj4gPiA+ID4gPiBzaG91bGQgZmxvdyB1bm1vZGlmaWVkIHRvIGdldF91c2VyX3BhZ2VzLCBh
bmQgZ3VwIHNob3VsZCB1bnRhZyBpdD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBpZSwgdGhpcyBzb3J0
IG9mIGRpcmVjdGlvbiBmb3IgdGhlIElCIGNvZGUgKHRoaXMgd291bGQgYmUgYSBnaWFudAo+ID4g
PiA+ID4gcGF0Y2gsIHNvIEkgZGlkbid0IGhhdmUgdGltZSB0byB3cml0ZSBpdCBhbGwsIGJ1dCBJ
IHRoaW5rIGl0IGlzIG11Y2gKPiA+ID4gPiA+IHNhbmVyKToKPiA+ID4gPgo+ID4gPiA+IEhpIEph
c29uLAo+ID4gPiA+Cj4gPiA+ID4gaWJfdXZlcmJzX3JlZ19tcigpIHBhc3NlcyBjbWQuc3RhcnQg
dG8gbWx4NF9nZXRfdW1lbV9tcigpLCB3aGljaCBjYWxscwo+ID4gPiA+IGZpbmRfdm1hKCksIHdo
aWNoIG9ubHkgYWNjZXB0cyB1bnRhZ2dlZCBhZGRyZXNzZXMuIENvdWxkIHlvdSBleHBsYWluCj4g
PiA+ID4gaG93IHlvdXIgcGF0Y2ggaGVscHM/Cj4gPiA+Cj4gPiA+IFRoYXQgbWx4NCBpcyBqdXN0
IGEgJ3dlaXJkIGR1Y2snLCBpdCBpcyBub3QgdGhlIG5vcm1hbCBmbG93LCBhbmQgSQo+ID4gPiBk
b24ndCB0aGluayB0aGUgY29yZSBjb2RlIHNob3VsZCBiZSBtYWtpbmcgc3BlY2lhbCBjb25zaWRl
cmF0aW9uIGZvcgo+ID4gPiBpdC4KPiA+Cj4gPiBIb3cgZG8geW91IHRoaW5rIHdlIHNob3VsZCBk
byB1bnRhZ2dpbmcgKG9yIHNvbWV0aGluZyBlbHNlKSB0byBkZWFsCj4gPiB3aXRoIHRoaXMgJ3dl
aXJkIGR1Y2snIGNhc2U/Cj4KPiBtbHg0IHNob3VsZCBoYW5kbGUgaXQgYXJvdW5kIHRoZSBjYWxs
IHRvIGZpbmRfdm1hIGxpa2Ugb3RoZXIgcGF0Y2hlcwo+IGRvLCBpZGVhbGx5IGFzIHBhcnQgb2Yg
dGhlIGNhc3QgZnJvbSBhIHZvaWQgX191c2VyICogdG8gdGhlIHVuc2lnbmVkCj4gbG9uZyB0aGF0
IGZpbmRfdm1hIG5lZWRzCgpTbyBlc3NlbnRpYWxseSB3aGF0IHdlIGhhZCBhIGZldyB2ZXJzaW9u
cyBhZ28KKGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzQvMzAvNzg1KSBwbHVzIGNoYW5naW5n
IHVuc2lnbmVkIGxvbmdzIHRvCl9fdXNlciAqIGFjcm9zcyBhbGwgSUIgY29kZT8gSSB0aGluayB0
aGUgc2Vjb25kIHBhcnQgaXMgc29tZXRoaW5nCnRoYXQncyBub3QgcmVsYXRlZCB0byB0aGlzIHNl
cmllcyBhbmQgbmVlZHMgdG8gYmUgZG9uZSBzZXBhcmF0ZWx5LiBJCmNhbiBtb3ZlIHVudGFnZ2lu
ZyBiYWNrIHRvIG1seDRfZ2V0X3VtZW1fbXIoKSB0aG91Z2guCgpDYXRhbGluLCB5b3UndmUgaW5p
dGlhbGx5IGFza2VkIHRvIHRvIG1vdmUgdW50YWdnaW5nIG91dCBvZgptbHg0X2dldF91bWVtX21y
KCksIGRvIHlvdSBoYXZlIGFueSBjb21tZW50cyBvbiB0aGlzPwoKPgo+IEphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
