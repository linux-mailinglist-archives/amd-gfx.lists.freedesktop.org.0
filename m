Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1529A83
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719556E0DF;
	Fri, 24 May 2019 15:01:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AF56E084
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 04:23:24 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id r19so3041709uap.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 21:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAYnRWw3Tu8/93j9I1Decyj4SiwalEXjnp8HjDGWVMk=;
 b=eD8yQHyVmmlyc5MKMQllBQ1UVaSaCg1c3H+T+u+QGeWY8qX7rCa0T54WjCv7trnr+5
 qNCqv0mnJn1aneaQZrI9dKRL83MCSXpZCWKsx7RsTXRkxN4807yymUrpfajy7UGGtMZx
 3umCs+K4Ee9K6fKNrH0+LtOQX1pfxVc1lIUcgZWzByO+lg+muhQFuWnHAUMZVsR+lXBp
 sm+o632gmIMQOOZA7JB0GnyzAy4gU39ne3DD6a/lwS5m+kvynSK3VJWUq4ALh8wAoITw
 5tbsZXw2Uswerjfnd9XSibs7RvKgHIaPhLLTwEDNC61x9TtCCGpT4xVOPu01c+m9yrLx
 2m0A==
X-Gm-Message-State: APjAAAUhL+QJTIgSkSDQstwiygVvRk5EFaI4fIzfrIYqkj8dhypVcrFj
 mT+pR41MwRF/EHgk5EWblMsyhSPe9/Z5pFDsXXizy0/G79apeg==
X-Google-Smtp-Source: APXvYqx5Zm1ZYEN7Vn9AdcFTjSw8M3oFO3UV+ZriQQ1V2wP6o6e1yzY7Ig//CYIK3KGeMPCh4oSMGn+kEBJ+ngdeAaM=
X-Received: by 2002:ab0:3109:: with SMTP id e9mr449008ual.66.1558671802883;
 Thu, 23 May 2019 21:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190522114910.emlckebwzv2qz42i@mbp>
 <CAFKCwrjyP+x0JJy=qpBFsp4pub3He6UkvU0qnf1UOKt6W1LPRQ@mail.gmail.com>
 <20190523090427.GA44383@arrakis.emea.arm.com>
In-Reply-To: <20190523090427.GA44383@arrakis.emea.arm.com>
From: Evgenii Stepanov <eugenis@google.com>
Date: Thu, 23 May 2019 21:23:13 -0700
Message-ID: <CAFKCwrgk0+yR48Z5nhuZG5f7g==vRb4u+CS-4FS0mM7Eriavgw@mail.gmail.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xAYnRWw3Tu8/93j9I1Decyj4SiwalEXjnp8HjDGWVMk=;
 b=WnRK49CElZNooeneU/rmiXD4MNL+NGJ+1q+LoLrd8r1BWPG0vFLLn5srrzAwJdtZCr
 YNvRiKrpydE8yY/WwhILnly3Zvune3jCfbXw7GsuMvu4P+dyMtapEbIZ2jkKw+bAAaZT
 /NstjIQP+l4nVYqupG3KK3t/H/Zt2rSh8UshTl0ZeyMDpnbmZlbVjVV+q+S0iwZ4uNET
 wEULW4QLu8xXLGSpfqZElCLKOXZT2Zp/eFOfWYxNKR73Qs1kFKXoJK7Lexkh9qJC8nqp
 yZ2rrh8i3toWpfjsayQpALHrdDwRoiqV6AXbdW6lkKZym6fAr2YHiokI7QWgzJYQeySd
 EWQQ==
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMjowNCBBTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDAyOjE2
OjU3UE0gLTA3MDAsIEV2Z2VuaWkgU3RlcGFub3Ygd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwg
MjAxOSBhdCA0OjQ5IEFNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwNjozMDo1MVBNICswMjAwLCBB
bmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEg
c2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRvCj4gPiA+ID4g
cGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0
aGluZyBlbHNlIG90aGVyCj4gPiA+ID4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4K
PiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBwb2ludGVycyB0byBiZSBw
YXNzZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+ID4gPiBzeXNjYWxsczogYnJrLCBnZXRf
bWVtcG9saWN5LCBtYWR2aXNlLCBtYmluZCwgbWluY29yZSwgbWxvY2ssIG1sb2NrMiwKPiA+ID4g
PiBtbWFwLCBtbWFwX3Bnb2ZmLCBtcHJvdGVjdCwgbXJlbWFwLCBtc3luYywgbXVubG9jaywgbXVu
bWFwLAo+ID4gPiA+IHJlbWFwX2ZpbGVfcGFnZXMsIHNobWF0IGFuZCBzaG1kdC4KPiA+ID4gPgo+
ID4gPiA+IFRoaXMgaXMgZG9uZSBieSB1bnRhZ2dpbmcgcG9pbnRlcnMgcGFzc2VkIHRvIHRoZXNl
IHN5c2NhbGxzIGluIHRoZQo+ID4gPiA+IHByb2xvZ3VlcyBvZiB0aGVpciBoYW5kbGVycy4KPiA+
ID4KPiA+ID4gSSdsbCBnbyB0aHJvdWdoIHRoZW0gb25lIGJ5IG9uZSB0byBzZWUgaWYgd2UgY2Fu
IHRpZ2h0ZW4gdGhlIGV4cGVjdGVkCj4gPiA+IEFCSSB3aGlsZSBoYXZpbmcgdGhlIE1URSBpbiBt
aW5kLgo+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9zeXMuYyBi
L2FyY2gvYXJtNjQva2VybmVsL3N5cy5jCj4gPiA+ID4gaW5kZXggYjQ0MDY1ZmIxNjE2Li45MzNi
YjlmM2Q2ZWMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvc3lzLmMKPiA+
ID4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9zeXMuYwo+ID4gPiA+IEBAIC0zNSwxMCArMzUs
MzMgQEAgU1lTQ0FMTF9ERUZJTkU2KG1tYXAsIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHVuc2lnbmVk
IGxvbmcsIGxlbiwKPiA+ID4gPiAgewo+ID4gPiA+ICAgICAgIGlmIChvZmZzZXRfaW5fcGFnZShv
ZmYpICE9IDApCj4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiAt
Cj4gPiA+ID4gKyAgICAgYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4gPiA+ID4gICAgICAg
cmV0dXJuIGtzeXNfbW1hcF9wZ29mZihhZGRyLCBsZW4sIHByb3QsIGZsYWdzLCBmZCwgb2ZmID4+
IFBBR0VfU0hJRlQpOwo+ID4gPiA+ICB9Cj4gPiA+Cj4gPiA+IElmIHVzZXIgcGFzc2VzIGEgdGFn
Z2VkIHBvaW50ZXIgdG8gbW1hcCgpIGFuZCB0aGUgYWRkcmVzcyBpcyBob25vdXJlZAo+ID4gPiAo
b3IgTUFQX0ZJWEVEIGlzIGdpdmVuKSwgd2hhdCBpcyB0aGUgZXhwZWN0ZWQgcmV0dXJuIHBvaW50
ZXI/IERvZXMgaXQKPiA+ID4gbmVlZCB0byBiZSB0YWdnZWQgd2l0aCB0aGUgdmFsdWUgZnJvbSB0
aGUgaGludD8KPiA+Cj4gPiBGb3IgSFdBU2FuIHRoZSBtb3N0IGNvbnZlbmllbnQgd291bGQgYmUg
dG8gdXNlIHRoZSB0YWcgZnJvbSB0aGUgaGludC4KPiA+IEJ1dCBzaW5jZSBpbiB0aGUgVEJJIChu
b3QgTVRFKSBtb2RlIHRoZSBrZXJuZWwgaGFzIG5vIGlkZWEgd2hhdAo+ID4gbWVhbmluZyB1c2Vy
c3BhY2UgYXNzaWducyB0byBwb2ludGVyIHRhZ3MsIHBlcmhhcHMgaXQgc2hvdWxkIG5vdCB0cnkK
PiA+IHRvIGd1ZXNzLCBhbmQgc2hvdWxkIHJldHVybiByYXcgKHplcm8tdGFnZ2VkKSBhZGRyZXNz
IGluc3RlYWQuCj4KPiBUaGVuLCBqdXN0IHRvIHJlbGF4IHRoZSBBQkkgZm9yIGh3YXNhbiwgc2hh
bGwgd2Ugc2ltcGx5IGRpc2FsbG93IHRhZ2dlZAo+IHBvaW50ZXJzIG9uIG1tYXAoKSBhcmd1bWVu
dHM/IFdlIGNhbiBsZWF2ZSB0aGVtIGluIGZvcgo+IG1yZW1hcChvbGRfYWRkcmVzcyksIG1hZHZp
c2UoKS4KCkkgdGhpbmsgdGhpcyB3b3VsZCBiZSBmaW5lLiBXZSBzaG91bGQgYWxsb3cgdGFnZ2Vk
IGluIHBvaW50ZXJzIGluCm1wcm90ZWN0IHRob3VnaC4KCj4gPiA+IFdpdGggTVRFLCB3ZSBtYXkg
d2FudCB0byB1c2UgdGhpcyBhcyBhIHJlcXVlc3QgZm9yIHRoZSBkZWZhdWx0IGNvbG91ciBvZgo+
ID4gPiB0aGUgbWFwcGVkIHBhZ2VzIChzdGlsbCB1bmRlciBkaXNjdXNzaW9uKS4KPiA+Cj4gPiBJ
IGxpa2UgdGhpcyAtIGFuZCBpbiB0aGF0IGNhc2UgaXQgd291bGQgbWFrZSBzZW5zZSB0byByZXR1
cm4gdGhlCj4gPiBwb2ludGVyIHRoYXQgY2FuIGJlIGltbWVkaWF0ZWx5IGRlcmVmZXJlbmNlZCB3
aXRob3V0IGNyYXNoaW5nIHRoZQo+ID4gcHJvY2VzcywgaS5lLiB3aXRoIHRoZSBtYXRjaGluZyB0
YWcuCj4KPiBUaGlzIGNhbWUgdXAgZnJvbSB0aGUgQW5kcm9pZCBpbnZlc3RpZ2F0aW9uIHdvcmsg
d2hlcmUgbGFyZ2UgbWVtb3J5Cj4gYWxsb2NhdGlvbnMgKHVzaW5nIG1tYXApIGNvdWxkIGJlIG1v
cmUgZWZmaWNpZW50bHkgcHJlLXRhZ2dlZCBieSB0aGUKPiBrZXJuZWwgb24gcGFnZSBmYXVsdC4g
Tm90IHN1cmUgYWJvdXQgdGhlIGltcGxlbWVudGF0aW9uIGRldGFpbHMgeWV0Lgo+Cj4gLS0KPiBD
YXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
